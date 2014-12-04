/*
 * Smartdb.h
 *
 * To be included by storage engines.
 *
 *  Created on: 2014/11/07
 *      Author: nakatani.sho
 */

#ifndef INCLUDE_API_SMARTDB_H_
#define INCLUDE_API_SMARTDB_H_

//
// includes
#include "api/SmartdbType.h"
#include "log/Logger.h"

void smartdb_init();
void smartdb_finish();

//
// API functions
extern "C"
SmartdbErr smartdb_open(
  const char * schema_file,
  /* out */
  smartdb **db);

extern "C"
void smartdb_close(smartdb *db);

extern "C"
SmartdbErr smartdb_prepare(
  smartdb * db, const char * sql,
  /* out */
  smartdb_stmt ** stmt);

extern "C"
SmartdbErr smartdb_step(smartdb_stmt * stmt);

extern "C"
SmartdbInt smartdb_column_int(smartdb_stmt * stmt, unsigned int i_col);
extern "C"
SmartdbDouble smartdb_column_double(smartdb_stmt * stmt, unsigned int i_col);

extern "C"
SmartdbErr smartdb_finalize(smartdb_stmt * stmt);

// [TODO]
// 1. stmt
// 2. execute
// 3. fetch

#endif /* INCLUDE_API_SMARTDB_H_ */
