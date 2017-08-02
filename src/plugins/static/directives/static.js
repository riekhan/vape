import { sanitize, clearFormatting } from '../util'
import Vue from 'vue'

// space to save current el, binding, vnode and ctx
const state = {}

export default {
  bind(el, binding, vnode) {
    console.log('binding', binding);
    // make specified elements editable when clicking
    el.addEventListener('click', (evt) => {
      // if we are not in edit mode do nothing
      if (!vnode.context.$store.state.editing)
        return

      // stop default behaviors
      evt.preventDefault()
      evt.stopPropagation()

      // don't reset if we're currently editing this set of elements
      if (el.dataset.editing)
        return

      // unset and set editable elements if switching to new set
      unsetEditables()
      setEditables(el, binding, vnode)
    })
  }
}

function blurHandler(evt) {
  // don't let them disappear
  if (this.innerText.trim() === '')
    this.innerText = getRandomPlaceHolder()

  let clean = sanitize(this.innerHTML)

  // save the data
  state.vnode.context.setStatic(this.dataset.path, clean, state.ctx)

  // add listener for document and curent parent el
  document.addEventListener('click', nextClick)
  state.el.addEventListener('click', nextClick)

  // handle events after blur
  function nextClick(evt) {
    // if the event hits the current parent element don't let bubble to document
    if (this.dataset && this.dataset.editing)
      evt.stopPropagation()
    // if click triggered elsewhere unset current elements
    else
      unsetEditables()

    // keep listeners from piling up
    state.el.removeEventListener('click', nextClick)
    document.removeEventListener('click', nextClick)
  }
}

function setEditable(el, child, path, binding, vnode, ctx) {
  // make it obvious
  child.contentEditable    = true
  child.style.borderWidth  = '1px'
  child.style.borderColor  = 'black'
  child.style.borderStyle  = 'solid'
  child.style.borderRadius = '.2em'
  child.dataset.editing    = true
  child.dataset.path       = path
  child.dataset.vnode      = vnode

  // save on blur
  child.addEventListener('blur', blurHandler)
}


function setEditables(el, binding, vnode) {
  el.dataset.editing = true

  let ctx = binding.value.ctx

  console.log(ctx);

  // save for clearing next time
  Object.assign(state, { el, binding, vnode, ctx })


  for (let selector in binding.value) {
    let path = binding.value[selector]

    // TODO make switch
    if (selector === 'ctx') {
      continue
    }
    else if (selector === 'path') {
      setEditable(el, el, path, binding, vnode, ctx)
    } 
    else if (selector === 'destroy') {
      let span = document.createElement('span')
      span.className = 'vape-destroy'
      el.parentNode.insertBefore(span, el)
      state.vm = new Vue({
        el: el.parentNode.querySelector('span.vape-destroy'),
        template: `<div style="position: relative; width: 100%; z-index: 99999;"><b-button @click="deleteStatic" size="sm" variant="danger" style="position: absolute; right: 0px;">x</b-button></div>`,
        parent: vnode.context,
        data: {
          ctx: ctx,
          path: path
        }
      })
    } 
    else {
      el.querySelectorAll(selector).forEach(child => {
        setEditable(el, child, path, binding, vnode, ctx)
      })
    }
  }
}

function unsetEditable(child) {
    child.contentEditable    = false
    child.style.borderWidth  = ''
    child.style.borderColor  = ''
    child.style.borderStyle  = ''
    child.style.borderRadius = ''
    delete child.dataset.editing
    delete child.dataset.path
    child.removeEventListener('blur', blurHandler)
}

function unsetEditables() {
  let { el, binding, vnode } = state

  if (!el || !binding || !vnode)
    return

  for (let selector in binding.value) {
    let path = binding.value[selector]
    if (selector === 'path') {
      unsetEditable(el)
    } else if (selector === 'destroy') {
      if (state.vm) {
        state.vm.$el.remove()
        state.vm.$destroy()
      }
    } else {
      el.querySelectorAll(selector).forEach(child => {
        unsetEditable(child)
      })
    }
  }

  delete el.dataset.editing
}

function getRandomPlaceHolder() {
  const placeholders = [
    'fill me up',
    'write me in',
    'place some witty text here',
    'placeholder'
  ]

  return placeholders[Math.floor(Math.random() * placeholders.length)]
}
