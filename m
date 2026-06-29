Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 345833EB11F;
	Mon, 29 Jun 2026 14:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782744308; cv=none; b=RRJ+Z8E3AEnjLHZQZp4IQ+rq/ja83/26qjX6Sr2waFdC5HuAGE9bUCw2rETMItnFljsAS0qm/6Hc2BPDW0JUO0ipB3DZaswWZ7XzncrlMqV5oO6//tFt4ZVuQpuW63BQPrV42ztzfhAGeEnOdd2Ex8kDyT0uFXMsabwbywn428o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782744308; c=relaxed/simple;
	bh=5x0FZBbFmpkffrcxfGZMMAPjDXASGaTXhNCHcVtuQeA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sOanG022EoRfGQ/V36DLKc73eppBkfzVMl9Q6YVpkzyKZs4at1qv4PJXjP7DFRU362tqDsdIGt3byEdzpNikxNsHUI71OF0tdYbNDuaq9Ef6+QQrwsoHK9zbU3gOXhdpitkRryh1bRm7TWbpzTqf/KpjQDseVkeviRZmxjHv8js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m3g37IAb; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m3g37IAb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782744305; x=1814280305;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5x0FZBbFmpkffrcxfGZMMAPjDXASGaTXhNCHcVtuQeA=;
  b=m3g37IAbXKSAB88S8y2lpmeUTN3hA6ksrhvmUVTjB1DdKmESRfc60qp5
   VNUrFpNVNEjOZveh7LIi8UlFMkae+qCzXTT5p5/IhnbBpnNaHYsL2eAzO
   TZmygE05LIoBvsEkOV7+d4oGr90gX3KyrRT6/qhmzgGJAmGUY1Z7mN8Td
   vKjIo8EP4EEiDjJaAfssEjQmZ5AYXO+VqNcB+FOMCZsmrIPQaFUipMZH8
   3H0fNIn5Z2zM7VBdbp1XvqBj6Dz72IsA+gbUzuWv1qIi71J4ICU/Bqzv1
   8U+gqNdW5vM0XCcPjLb3iEvPVbBscVvIcu1bdhinjvbadUBDcNfv3Dm6F
   w==;
X-CSE-ConnectionGUID: X635/jmtSJK7oUMNDCaJKA==
X-CSE-MsgGUID: nVgFJaSwT+qpX5EQxkmjpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="106228470"
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="106228470"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 07:45:05 -0700
X-CSE-ConnectionGUID: 4oweQg+AR8ebqq5OANT8ew==
X-CSE-MsgGUID: jIdFNP6CSq2JjA0mEBYT0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="250282997"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 07:45:03 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: linux-sound@vger.kernel.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	peter.ujfalusi@linux.intel.com,
	bard.liao@intel.com
Subject: [PATCH 1/2] soundwire: bus: add CLOCK_STOP_MODE1 support back
Date: Mon, 29 Jun 2026 22:44:49 +0800
Message-ID: <20260629144450.2096823-2-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260629144450.2096823-1-yung-chuan.liao@linux.intel.com>
References: <20260629144450.2096823-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

CLOCK_STOP_MODE1 is used when the Peripheral might have entered a deeper
power-saving mode that does not retain state while the Clock is stopped.
It is useful when the device is more power consumption sensitive. Add it
back to allow the Peripheral use CLOCK_STOP_MODE1.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 drivers/soundwire/bus.c       | 45 +++++++++++++++++++----------------
 include/linux/soundwire/sdw.h |  4 ++++
 2 files changed, 29 insertions(+), 20 deletions(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index 0490777fa406..21d8d6d7147a 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -956,8 +956,22 @@ static void sdw_modify_slave_status(struct sdw_slave *slave,
 	mutex_unlock(&bus->bus_lock);
 }
 
+static enum sdw_clk_stop_mode sdw_get_clk_stop_mode(struct sdw_slave *slave)
+{
+	struct device *dev = &slave->dev;
+	struct sdw_driver *drv = drv_to_sdw_driver(dev->driver);
+
+	/*
+	 * Query for clock stop mode if Slave implements
+	 * ops->get_clk_stop_mode, else read from property.
+	 */
+	if (drv->ops && drv->ops->get_clk_stop_mode)
+		return drv->ops->get_clk_stop_mode(slave);
+
+	return slave->prop.clk_stop_mode1 ? SDW_CLK_STOP_MODE1 : SDW_CLK_STOP_MODE0;
+}
+
 static int sdw_slave_clk_stop_callback(struct sdw_slave *slave,
-				       enum sdw_clk_stop_mode mode,
 				       enum sdw_clk_stop_type type)
 {
 	int ret = 0;
@@ -969,7 +983,7 @@ static int sdw_slave_clk_stop_callback(struct sdw_slave *slave,
 		struct sdw_driver *drv = drv_to_sdw_driver(dev->driver);
 
 		if (drv->ops && drv->ops->clk_stop)
-			ret = drv->ops->clk_stop(slave, mode, type);
+			ret = drv->ops->clk_stop(slave, slave->clk_stop_mode, type);
 	}
 
 	mutex_unlock(&slave->sdw_dev_lock);
@@ -978,7 +992,6 @@ static int sdw_slave_clk_stop_callback(struct sdw_slave *slave,
 }
 
 static int sdw_slave_clk_stop_prepare(struct sdw_slave *slave,
-				      enum sdw_clk_stop_mode mode,
 				      bool prepare)
 {
 	bool wake_en;
@@ -990,7 +1003,7 @@ static int sdw_slave_clk_stop_prepare(struct sdw_slave *slave,
 	if (prepare) {
 		val = SDW_SCP_SYSTEMCTRL_CLK_STP_PREP;
 
-		if (mode == SDW_CLK_STOP_MODE1)
+		if (slave->clk_stop_mode == SDW_CLK_STOP_MODE1)
 			val |= SDW_SCP_SYSTEMCTRL_CLK_STP_MODE1;
 
 		if (wake_en)
@@ -1078,9 +1091,9 @@ int sdw_bus_prep_clk_stop(struct sdw_bus *bus)
 		/* Identify if Slave(s) are available on Bus */
 		is_slave = true;
 
-		ret = sdw_slave_clk_stop_callback(slave,
-						  SDW_CLK_STOP_MODE0,
-						  SDW_CLK_PRE_PREPARE);
+		slave->clk_stop_mode = sdw_get_clk_stop_mode(slave);
+
+		ret = sdw_slave_clk_stop_callback(slave, SDW_CLK_PRE_PREPARE);
 		if (ret < 0 && ret != -ENODATA) {
 			dev_err(&slave->dev, "clock stop pre-prepare cb failed:%d\n", ret);
 			return ret;
@@ -1090,9 +1103,7 @@ int sdw_bus_prep_clk_stop(struct sdw_bus *bus)
 		if (!slave->prop.simple_clk_stop_capable) {
 			simple_clk_stop = false;
 
-			ret = sdw_slave_clk_stop_prepare(slave,
-							 SDW_CLK_STOP_MODE0,
-							 true);
+			ret = sdw_slave_clk_stop_prepare(slave, true);
 			if (ret < 0 && ret != -ENODATA) {
 				dev_err(&slave->dev, "clock stop prepare failed:%d\n", ret);
 				return ret;
@@ -1130,9 +1141,7 @@ int sdw_bus_prep_clk_stop(struct sdw_bus *bus)
 		    slave->status != SDW_SLAVE_ALERT)
 			continue;
 
-		ret = sdw_slave_clk_stop_callback(slave,
-						  SDW_CLK_STOP_MODE0,
-						  SDW_CLK_POST_PREPARE);
+		ret = sdw_slave_clk_stop_callback(slave, SDW_CLK_POST_PREPARE);
 
 		if (ret < 0 && ret != -ENODATA) {
 			dev_err(&slave->dev, "clock stop post-prepare cb failed:%d\n", ret);
@@ -1204,8 +1213,7 @@ int sdw_bus_exit_clk_stop(struct sdw_bus *bus)
 		/* Identify if Slave(s) are available on Bus */
 		is_slave = true;
 
-		ret = sdw_slave_clk_stop_callback(slave, SDW_CLK_STOP_MODE0,
-						  SDW_CLK_PRE_DEPREPARE);
+		ret = sdw_slave_clk_stop_callback(slave, SDW_CLK_PRE_DEPREPARE);
 		if (ret < 0)
 			dev_warn(&slave->dev, "clock stop pre-deprepare cb failed:%d\n", ret);
 
@@ -1213,9 +1221,7 @@ int sdw_bus_exit_clk_stop(struct sdw_bus *bus)
 		if (!slave->prop.simple_clk_stop_capable) {
 			simple_clk_stop = false;
 
-			ret = sdw_slave_clk_stop_prepare(slave, SDW_CLK_STOP_MODE0,
-							 false);
-
+			ret = sdw_slave_clk_stop_prepare(slave, false);
 			if (ret < 0)
 				dev_warn(&slave->dev, "clock stop deprepare failed:%d\n", ret);
 		}
@@ -1243,8 +1249,7 @@ int sdw_bus_exit_clk_stop(struct sdw_bus *bus)
 		    slave->status != SDW_SLAVE_ALERT)
 			continue;
 
-		ret = sdw_slave_clk_stop_callback(slave, SDW_CLK_STOP_MODE0,
-						  SDW_CLK_POST_DEPREPARE);
+		ret = sdw_slave_clk_stop_callback(slave, SDW_CLK_POST_DEPREPARE);
 		if (ret < 0)
 			dev_warn(&slave->dev, "clock stop post-deprepare cb failed:%d\n", ret);
 	}
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index b484784e2690..c1d2fc69bed5 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -612,6 +612,7 @@ struct sdw_bus_params {
  * @update_status: Update Slave status
  * @bus_config: Update the bus config for Slave
  * @port_prep: Prepare the port with parameters
+ * @get_clk_stop_mode: Get the clock stop mode of the Slave
  * @clk_stop: handle imp-def sequences before and after prepare and de-prepare
  */
 struct sdw_slave_ops {
@@ -625,6 +626,7 @@ struct sdw_slave_ops {
 	int (*port_prep)(struct sdw_slave *slave,
 			 struct sdw_prepare_ch *prepare_ch,
 			 enum sdw_port_prep_ops pre_ops);
+	enum sdw_clk_stop_mode (*get_clk_stop_mode)(struct sdw_slave *slave);
 	int (*clk_stop)(struct sdw_slave *slave,
 			enum sdw_clk_stop_mode mode,
 			enum sdw_clk_stop_type type);
@@ -643,6 +645,7 @@ struct sdw_slave_ops {
  * @node: node for bus list
  * @port_ready: Port ready completion flag for each Slave port
  * @m_port_map: static Master port map for each Slave port
+ * @clk_stop_mode: The clock stop mode of the Slave
  * @dev_num: Current Device Number, values can be 0 or dev_num_sticky
  * @dev_num_sticky: one-time static Device Number assigned by Bus
  * @probed: boolean tracking driver state
@@ -677,6 +680,7 @@ struct sdw_slave {
 	struct list_head node;
 	struct completion port_ready[SDW_MAX_PORTS];
 	unsigned int m_port_map[SDW_MAX_PORTS];
+	enum sdw_clk_stop_mode clk_stop_mode;
 	u16 dev_num;
 	u16 dev_num_sticky;
 	bool probed;
-- 
2.43.0

