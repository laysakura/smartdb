/*
 * Records.cpp
 *
 *  Created on: 2014/11/16
 *      Author: nakatani.sho
 */

#include "Records.h"
#include "datastruct/FixedLengthColumn.h"
#include "hack/Assert.h"

namespace Smartdb {

Records::Records(
  const std::vector<const ColumnDef *>& coldefs,
  const std::vector<Buffer *>& colbufs)
: coldefs(coldefs), columns(coldefs.size(), 0), colbufs(colbufs), _size(0)
{
  for (size_t i = 0; i < coldefs.size(); ++i) {
    columns[i] = new FixedLengthColumn(*coldefs[i], *colbufs[i]);
  }
}

Records::~Records() {
  for (size_t i = 0; i < coldefs.size(); ++i) {
    delete columns[i];
  }
}

} /* namespace Smartdb */
