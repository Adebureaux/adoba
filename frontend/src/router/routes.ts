import { RouteRecordRaw } from 'vue-router';

const routes: RouteRecordRaw[] = [
  {
    path: '/',
    component: () => import('layouts/MainLayout.vue'),
    children: [
      { path: '', component: () => import('pages/IndexPage.vue') },
      { path: 'actualites', component: () => import('pages/ComingSoon.vue') },
      { path: 'actions', component: () => import('pages/ActionsTracking.vue') },
      { path: 'declarations', component: () => import('pages/DeclareCollection.vue') },
      { path: 'gestion', component: () => import('pages/Manage.vue') },
    ],
  },

  // Always leave this as last one,
  // but you can also remove it
  {
    path: '/:catchAll(.*)*',
    component: () => import('pages/ErrorNotFound.vue'),
  },
];

export default routes;
