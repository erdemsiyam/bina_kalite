/* State */
enum ManuelLocationResultState { INIT, DONE }
enum DeviceLocationResultState {
  INIT,
  SERVICE_NOT_ALLOW,
  PERMISSION_NOT_ALLOW,
  DONE
}
enum LocationState { INIT, LOADING, DONE }
enum SeenState { NOT, NOW, SEEN }
enum DoneState { INIT, LOADING, FAIL, DONE }

/* Answer */
enum CorrosionAnswer { INIT, YES, NO }
enum ShopAnswer { INIT, YES, NO }
enum ContiguousAnswer { INIT, YES, NO }
enum ResultAnswer { INIT, LOW_RISK, MEDIUM_RISK, HIGH_RISK, VERY_HIGH_RISK }
enum ResultState { INIT, AUTH_EXPIRED, SERVICE_ERROR, DONE }
