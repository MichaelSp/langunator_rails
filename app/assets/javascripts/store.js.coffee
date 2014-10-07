# http://emberjs.com/guides/models/#toc_store
# http://emberjs.com/guides/models/pushing-records-into-the-store/

DS.RESTAdapter.reopen
  namespace: "api/v1"

LangunatorRails.ApplicationStore = DS.Store.extend()
LangunatorRails.ApplicationAdapter = DS.ActiveModelAdapter.extend()
