Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79176188A0D;
	Wed, 18 Dec 2024 08:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734508941; cv=none; b=DlyK3b8mKU/sF0wNeZzMGfnoZoRv+ZPgZwWTaOpzucIv7pg6f1l+amh3gJftAleIDaQlvByJ5Xj86Amv4mOIudXkZ/yU6hH/sa4cNknW/l8is/nn4Y7V6Q9fRrw09cHuFTZZH0JvEwTrB0PFlTwXDWmZXAW8URKr9lDcP7jkrTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734508941; c=relaxed/simple;
	bh=fYfNMeMSga/5R1bo7mTW9errUnZ+UozHTmrrkJSXbtc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JKGmwWHKSERvNRlZfUQl7vGkqVUibXekyh/OsjULudiLcXzWoH2E6Mw1AwsM+QsQybGCf5mBXVWAd62XufCRYK+4saZE9Lo6TjrAaLTF2xs+wz8L6mCo6RU22YN5rDjHt44RSiHSmpFB9Xq+yl/vGPf9MQtxiJuYk0+2uGie9ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jV/iW5FR; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jV/iW5FR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734508939; x=1766044939;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fYfNMeMSga/5R1bo7mTW9errUnZ+UozHTmrrkJSXbtc=;
  b=jV/iW5FRnxtJL/waazkaSX/RJYDrRVbPxajUlB8moSNELe7gWNliuRqA
   YHOJewO7hoa/2eEkkif+Fi75RxDAhoPxJqz3Jy/7gDDpwmnnCxBTpmLRW
   PV4k56R6WRfmTXiTHBFfNw8er1YYCKGXi6jR8cRyWaNbILfjjFTGa9Jxk
   h4WUWSKHX+yTdP9yLBveVuzkX3lKPxtzg2KHwMxqIKcoxdrvYuCX80RUN
   yOSzvbModja+tk7cF+wviGkAncZbmCJnX10S/Jd/S4rSrEotT0t1wWrbw
   a/ZW70I/PS1RrWE++QYMpOKMIpuFmuBUiJL1UgS+Bd+UArAbvYsYOx3PQ
   w==;
X-CSE-ConnectionGUID: vrLZuejHT4qKdg6n56vZyA==
X-CSE-MsgGUID: p7PPO7mhRniSKx6tFuWHvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="45978550"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; 
   d="scan'208";a="45978550"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2024 00:02:13 -0800
X-CSE-ConnectionGUID: 9h7EY4+HRU2kbirtMDsbgQ==
X-CSE-MsgGUID: TN3wp7Y0QCGDm21sILrU5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="101914665"
Received: from tfalcon-desk.amr.corp.intel.com (HELO yungchua-desk.intel.com) ([10.124.220.206])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2024 00:02:12 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: linux-sound@vger.kernel.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH v3 06/14] Soundwire: add sdw_slave_get_scale_index helper
Date: Wed, 18 Dec 2024 16:01:47 +0800
Message-ID: <20241218080155.102405-7-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241218080155.102405-1-yung-chuan.liao@linux.intel.com>
References: <20241218080155.102405-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, we only set peripheral frequency when the peripheral is
initialized. However, curr_dr_freq may change to get required bandwidth.
For example, curr_dr_freq may increase from 4.8MHz to 9.6MHz when the
4th stream is opened. Add a helper to get the scale index so that we can
get the scale index and program it.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 drivers/soundwire/bus.c       | 55 ++++++++++++++++++++++-------------
 include/linux/soundwire/sdw.h |  2 ++
 2 files changed, 36 insertions(+), 21 deletions(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index d1dc62c34f1c..215630d602ad 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -1276,23 +1276,12 @@ int sdw_configure_dpn_intr(struct sdw_slave *slave,
 	return ret;
 }
 
-static int sdw_slave_set_frequency(struct sdw_slave *slave)
+int sdw_slave_get_scale_index(struct sdw_slave *slave, u8 *base)
 {
 	u32 mclk_freq = slave->bus->prop.mclk_freq;
 	u32 curr_freq = slave->bus->params.curr_dr_freq >> 1;
 	unsigned int scale;
 	u8 scale_index;
-	u8 base;
-	int ret;
-
-	/*
-	 * frequency base and scale registers are required for SDCA
-	 * devices. They may also be used for 1.2+/non-SDCA devices.
-	 * Driver can set the property, we will need a DisCo property
-	 * to discover this case from platform firmware.
-	 */
-	if (!slave->id.class_id && !slave->prop.clock_reg_supported)
-		return 0;
 
 	if (!mclk_freq) {
 		dev_err(&slave->dev,
@@ -1311,19 +1300,19 @@ static int sdw_slave_set_frequency(struct sdw_slave *slave)
 	 */
 	if (!(19200000 % mclk_freq)) {
 		mclk_freq = 19200000;
-		base = SDW_SCP_BASE_CLOCK_19200000_HZ;
+		*base = SDW_SCP_BASE_CLOCK_19200000_HZ;
 	} else if (!(22579200 % mclk_freq)) {
 		mclk_freq = 22579200;
-		base = SDW_SCP_BASE_CLOCK_22579200_HZ;
+		*base = SDW_SCP_BASE_CLOCK_22579200_HZ;
 	} else if (!(24576000 % mclk_freq)) {
 		mclk_freq = 24576000;
-		base = SDW_SCP_BASE_CLOCK_24576000_HZ;
+		*base = SDW_SCP_BASE_CLOCK_24576000_HZ;
 	} else if (!(32000000 % mclk_freq)) {
 		mclk_freq = 32000000;
-		base = SDW_SCP_BASE_CLOCK_32000000_HZ;
+		*base = SDW_SCP_BASE_CLOCK_32000000_HZ;
 	} else if (!(96000000 % mclk_freq)) {
 		mclk_freq = 24000000;
-		base = SDW_SCP_BASE_CLOCK_24000000_HZ;
+		*base = SDW_SCP_BASE_CLOCK_24000000_HZ;
 	} else {
 		dev_err(&slave->dev,
 			"Unsupported clock base, mclk %d\n",
@@ -1354,6 +1343,34 @@ static int sdw_slave_set_frequency(struct sdw_slave *slave)
 	}
 	scale_index++;
 
+	dev_dbg(&slave->dev,
+		"Configured bus base %d, scale %d, mclk %d, curr_freq %d\n",
+		*base, scale_index, mclk_freq, curr_freq);
+
+	return scale_index;
+}
+EXPORT_SYMBOL(sdw_slave_get_scale_index);
+
+static int sdw_slave_set_frequency(struct sdw_slave *slave)
+{
+	int scale_index;
+	u8 base;
+	int ret;
+
+	/*
+	 * frequency base and scale registers are required for SDCA
+	 * devices. They may also be used for 1.2+/non-SDCA devices.
+	 * Driver can set the property directly, for now there's no
+	 * DisCo property to discover support for the scaling registers
+	 * from platform firmware.
+	 */
+	if (!slave->id.class_id && !slave->prop.clock_reg_supported)
+		return 0;
+
+	scale_index = sdw_slave_get_scale_index(slave, &base);
+	if (scale_index < 0)
+		return scale_index;
+
 	ret = sdw_write_no_pm(slave, SDW_SCP_BUS_CLOCK_BASE, base);
 	if (ret < 0) {
 		dev_err(&slave->dev,
@@ -1373,10 +1390,6 @@ static int sdw_slave_set_frequency(struct sdw_slave *slave)
 		dev_err(&slave->dev,
 			"SDW_SCP_BUSCLOCK_SCALE_B1 write failed:%d\n", ret);
 
-	dev_dbg(&slave->dev,
-		"Configured bus base %d, scale %d, mclk %d, curr_freq %d\n",
-		base, scale_index, mclk_freq, curr_freq);
-
 	return ret;
 }
 
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index ae38ac848d38..05a85e2bd96d 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -1052,6 +1052,8 @@ int sdw_stream_add_slave(struct sdw_slave *slave,
 int sdw_stream_remove_slave(struct sdw_slave *slave,
 			    struct sdw_stream_runtime *stream);
 
+int sdw_slave_get_scale_index(struct sdw_slave *slave, u8 *base);
+
 /* messaging and data APIs */
 int sdw_read(struct sdw_slave *slave, u32 addr);
 int sdw_write(struct sdw_slave *slave, u32 addr, u8 value);
-- 
2.43.0

