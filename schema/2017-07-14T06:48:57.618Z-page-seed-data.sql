insert into pta_dist_14.page (author_id, route, title, template, data, parent_id) values
  (1, 'home', 'Home', '  <div class="row">    <card v-for="page in $store.state.page.data.children" :key="page.id"      v-bind:path="page.data.route"      v-bind:text="page.data.body"      v-bind:img="page.data.img"      v-bind:title="page.data.title"      v-bind:sub-title="page.data.subTitle"    ></card>  </div>', '{"title":"Home","body":"here have some text"}', null),
  (1, 'about', 'About', '  <div class="row">    <card v-for="page in $store.state.page.data.children" :key="page.id"      v-bind:path="page.data.route"      v-bind:text="page.data.body"      v-bind:img="page.data.img"      v-bind:title="page.data.title"      v-bind:sub-title="page.data.subTitle"    ></card>  </div>', '{"title":"About","body":"here have some text"}', null),
  (1, 'board', 'Board', '  <div>     <jumbo-tron :title="title" :img="img"></jumbo-tron>    <hr />     <p>{{body}}</p> </div>', '{"parentId":2,"title":"Board","img":"http://thecatapi.com/api/images/get?format=src&type=gif&size=med","body":" Abby Fellman - President \n      Michelle Wing - Treasurer\n      Elizabeth Smith- Secretary/ Membership/ Historian\n      Trish Luna - Leadership VP/ Coast Area Coordinator\n      Christal Barquero- Programming VP / Reflections / Santa Rosa & North Area Coordinator\n      Nicole Turner - Rohnert Park / Cotati Area Coordinato\n      Samantha Bolinger - Petaluma Area Coordinator"}', 2),
  (1, 'join', 'Join Our Team', '  <div>     <jumbo-tron :title="title" :img="img"></jumbo-tron>    <hr />     <p>{{body}}</p> </div>', '{"parentId":2,"title":"Join Our Team","img":"http://thecatapi.com/api/images/get?format=src&type=gif&size=med","body":"We need new board members for these positions:\n          Santa Rosa & North Area Coordinator\n        Diversity & Inclusion VP\n      Student Board Member\n      Communications VP"}', 2),
  (1, 'mission-statement', 'Mission Statement', '  <div>     <jumbo-tron :title="title" :img="img"></jumbo-tron>    <hr />     <p>{{body}}</p> </div>', '{"parentId":2,"title":"Mission Statement","img":"http://thecatapi.com/api/images/get?format=src&type=gif&size=med","body":"The mission of the 14th district is to improve the education, health, and well being of the children and families and Sonoma, Mendocino, and Lake County by advocating for cultivating and empowering units."}', 2),
  (1, 'programs', 'Programs', '  <div class="row">    <card v-for="page in $store.state.page.data.children" :key="page.id"      v-bind:path="page.data.route"      v-bind:text="page.data.body"      v-bind:img="page.data.img"      v-bind:title="page.data.title"      v-bind:sub-title="page.data.subTitle"    ></card>  </div>', '{"title":"Programs","body":"here have some text"}', null),
  (1, 'reflections', 'Reflections', '  <div>     <jumbo-tron :title="title" :img="img"></jumbo-tron>    <hr />     <div v-html="body"></div>  </div>', '{"parentId":6,"title":"Reflections","img":"http://thecatapi.com/api/images/get?format=src&type=gif&size=med","body":"<p>PTA Reflections is a nationally acclaimed student recognition program to encourage artistic creativity in the classroom and at home. Students of all grades and abilities may participate and explore the arts based on the 2017-2018 theme: Within Reach.</p>\n\n      <p>To participate, contact your Local/State PTA for official program rules and deadlines.</p>\n\n      <p>Students may choose one or all of the available arts categories:</p>\n\n      <ul style=\"list-style: none;\">\n        <li><img src=\"/public/reflections/dance.png\"/> <strong>Dance Choreography</strong></li>\n        <li><img src=\"/public/reflections/film.png\"/> <strong>Film Production</strong></li>\n        <li><img src=\"/public/reflections/literature.png\"/> <strong>Literature</strong></li>\n        <li><img src=\"/public/reflections/music.png\"/> <strong>Music Composition</strong></li>\n        <li><img src=\"/public/reflections/photography.png\"/> <strong>Photography</strong></li>\n        <li><img src=\"/public/reflections/visual-arts.png\"/> <strong>Visual Arts</strong></li>\n      </ul>\n\n      <p>The arts—and the National PTA Reflections program—s upport student success and serve as a valuable tool for building strong partnerships in your school community. Celebrate arts learning in your school community with Reflections.</p>"}', 6),
  (1, 'welcome', 'Welcome', '  <div class="row">     <jumbo-tron :title="title" :img="img"></jumbo-tron>    <hr />     <p>{{body}}</p>  </div>', '{"parentId":1,"title":"Welcome","img":"http://thecatapi.com/api/images/get?format=src&type=gif&size=med","body":"The 14th District PTA serves Sonoma, Mendocino, and Lake counties. We are comprised of 45 school PTAs and have over 5,000 members. Our members are parents, administrators, teachers, students, and community members..."}', 1)