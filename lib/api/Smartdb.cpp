/*
 * Smartdb.cpp
 *
 *  Created on: 2014/11/07
 *      Author: nakatani.sho
 */

#include "api/Smartdb.h"
#include "log/Logger.h"
#include "log/StderrLogger.h"

namespace Smartdb {

Logger *logger = 0;

} /* namespace Smartdb */

void smartdb_init() {
  // sets logger
#if Logger == Stderr
  Smartdb::logger = new Smartdb::StderrLogger();
#else
  Smartdb::logger = new Smartdb::StderrLogger();
#endif
}
void smartdb_finish() {
  if (Smartdb::logger) delete Smartdb::logger;
}

extern "C"
SmartdbErr smartdb_open(
  const char* schema_file,
  /* out */
  smartdb** db)
{
  // [TODO] - use schema_file & db
  return NO_ERR;
}

extern "C"
void smartdb_close(smartdb* db) {
  // [TODO] - delete db

  if (Smartdb::logger) delete Smartdb::logger;
}

extern "C"
SmartdbErr smartdb_prepare(
  smartdb* db, const char* sql,
  /* out */
  smartdb_stmt** stmt)
{
  return NO_ERR;
}

extern "C"
SmartdbErr smartdb_step(smartdb_stmt* stmt) {
  return NO_ERR;
}

extern "C"
SmartdbInt smartdb_column_int(smartdb_stmt* stmt, unsigned int i_col) {
  return 777;
}

extern "C"
SmartdbDouble smartdb_column_double(smartdb_stmt* stmt, unsigned int i_col) {
  return 3.14;
}

SmartdbErr smartdb_finalize(smartdb_stmt* stmt) {
  return NO_ERR;
}
