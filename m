Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 395A31662EF;
	Wed, 18 Dec 2024 08:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734508938; cv=none; b=aEcnwdRtJx4g0RifoaOcHBMuyyijzdhTHJFEp+4wQOlBQkK2JM5Bx1ubdttgDdcMZU6LfsYjWizqLXeSIfMVNPmYk+fSOuteZGjbTH8I7k6KiGUhiGy5g6r0hWNpOFDcDoQK63BLCPZ6wupWVYrIFC1IKMl0w34kiXnZdLvUtEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734508938; c=relaxed/simple;
	bh=59bEtfRaVj423x64sYt038E3O0mYimIWQQSEY98Z8tE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VoroPWbiFYWAQWsaep50bIqRuIGm/VO37esDdccbHM4j06TqGhyacf3h9DT0FZXniHgXTLW54sZyMvuuvR4IbzqA/mRf3lRi/9r/b7tNAumfgAaPTtNe5+XEgE1lFatojQe5yKJ/qRxzIzeSV55fBx5XEZ7j6ChgB9C+ULSVZn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hSLPgdVz; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hSLPgdVz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734508937; x=1766044937;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=59bEtfRaVj423x64sYt038E3O0mYimIWQQSEY98Z8tE=;
  b=hSLPgdVzQHIXbjHMrhdyQ/j/aI3zmHXL5Nld8HeBOC9ysoUqsvB2es2h
   /9FgQ6RalypKlLoRFojD5Zlwl2UIoFm2kOVq56ZZQ+uxFilc9tK1S4D/p
   MDzPpw7ABR05fJ/VBgwzp8Bs3QdR9+vqO6yOeLwqEAXlEetoX3pN+TGbG
   5Ebg+6Y8GqXcXcWz19Oil596IQpsVojrBh8QcMqW7eMaDx3IJU84inmDa
   wPzGGdwdmmHuDf2sPpncZk73DqaqvAM++KvtA7NSAAPECx/ertb1qL102
   Z8shLbwYbl+evFAo52LykUEO+q9BLFmsMUTeZnvaR6KhDFQKhC2Yx6p2c
   w==;
X-CSE-ConnectionGUID: mdEOtwH2TZy97i2MeSWfAQ==
X-CSE-MsgGUID: 9MbgiWrfQcOYSa1QBUK9zQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="45978506"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; 
   d="scan'208";a="45978506"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2024 00:02:07 -0800
X-CSE-ConnectionGUID: 71/NoF0bQoORnrp0+22a9g==
X-CSE-MsgGUID: J/QdeGJPRuSwWvL2GPK8Ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="101914646"
Received: from tfalcon-desk.amr.corp.intel.com (HELO yungchua-desk.intel.com) ([10.124.220.206])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2024 00:02:06 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: linux-sound@vger.kernel.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH v3 02/14] soundwire: mipi_disco: read lane mapping properties from ACPI
Date: Wed, 18 Dec 2024 16:01:43 +0800
Message-ID: <20241218080155.102405-3-yung-chuan.liao@linux.intel.com>
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

The DisCo for SoundWire 2.0 added support for the
'mipi-sdw-lane-<n>-mapping' property.

Co-developed-by: Chao Song <chao.song@linux.intel.com>
Signed-off-by: Chao Song <chao.song@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/mipi_disco.c | 40 +++++++++++++++++++++++++++++++++-
 include/linux/soundwire/sdw.h  |  5 +++++
 2 files changed, 44 insertions(+), 1 deletion(-)

diff --git a/drivers/soundwire/mipi_disco.c b/drivers/soundwire/mipi_disco.c
index 9d59f486edbe..65afb28ef8fa 100644
--- a/drivers/soundwire/mipi_disco.c
+++ b/drivers/soundwire/mipi_disco.c
@@ -366,6 +366,44 @@ static int sdw_slave_read_dpn(struct sdw_slave *slave,
 	return 0;
 }
 
+/*
+ * In MIPI DisCo spec for SoundWire, lane mapping for a slave device is done with
+ * mipi-sdw-lane-x-mapping properties, where x is 1..7, and the values for those
+ * properties are mipi-sdw-manager-lane-x or mipi-sdw-peripheral-link-y, where x
+ * is an integer between 1 to 7 if the lane is connected to a manager lane, y is a
+ * character between A to E if the lane is connected to another peripheral lane.
+ */
+int sdw_slave_read_lane_mapping(struct sdw_slave *slave)
+{
+	struct sdw_slave_prop *prop = &slave->prop;
+	struct device *dev = &slave->dev;
+	char prop_name[30];
+	const char *prop_val;
+	size_t len;
+	int ret, i;
+	u8 lane;
+
+	for (i = 0; i < SDW_MAX_LANES; i++) {
+		snprintf(prop_name, sizeof(prop_name), "mipi-sdw-lane-%d-mapping", i);
+		ret = device_property_read_string(dev, prop_name, &prop_val);
+		if (ret)
+			continue;
+
+		len = strlen(prop_val);
+		if (len < 1)
+			return -EINVAL;
+
+		/* The last character is enough to identify the connection */
+		ret = kstrtou8(&prop_val[len - 1], 10, &lane);
+		if (ret)
+			return ret;
+		if (in_range(lane, 1, SDW_MAX_LANES - 1))
+			prop->lane_maps[i] = lane;
+	}
+	return 0;
+}
+EXPORT_SYMBOL(sdw_slave_read_lane_mapping);
+
 /**
  * sdw_slave_read_prop() - Read Slave properties
  * @slave: SDW Slave
@@ -486,6 +524,6 @@ int sdw_slave_read_prop(struct sdw_slave *slave)
 	sdw_slave_read_dpn(slave, prop->sink_dpn_prop, nval,
 			   prop->sink_ports, "sink");
 
-	return 0;
+	return sdw_slave_read_lane_mapping(slave);
 }
 EXPORT_SYMBOL(sdw_slave_read_prop);
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index bd9836690da6..bb4e33a4db17 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -54,6 +54,8 @@ struct sdw_slave;
 #define SDW_MAX_PORTS			15
 #define SDW_VALID_PORT_RANGE(n)		((n) < SDW_MAX_PORTS && (n) >= 1)
 
+#define SDW_MAX_LANES		8
+
 enum {
 	SDW_PORT_DIRN_SINK = 0,
 	SDW_PORT_DIRN_SOURCE,
@@ -356,6 +358,7 @@ struct sdw_dpn_prop {
  * and masks are supported
  * @commit_register_supported: is PCP_Commit register supported
  * @scp_int1_mask: SCP_INT1_MASK desired settings
+ * @lane_maps: Lane mapping for the slave, only valid if lane_control_support is set
  * @clock_reg_supported: the Peripheral implements the clock base and scale
  * registers introduced with the SoundWire 1.2 specification. SDCA devices
  * do not need to set this boolean property as the registers are required.
@@ -385,6 +388,7 @@ struct sdw_slave_prop {
 	u32 sdca_interrupt_register_list;
 	u8 commit_register_supported;
 	u8 scp_int1_mask;
+	u8 lane_maps[SDW_MAX_LANES];
 	bool clock_reg_supported;
 	bool use_domain_irq;
 };
@@ -450,6 +454,7 @@ struct sdw_master_prop {
 
 int sdw_master_read_prop(struct sdw_bus *bus);
 int sdw_slave_read_prop(struct sdw_slave *slave);
+int sdw_slave_read_lane_mapping(struct sdw_slave *slave);
 
 /*
  * SDW Slave Structures and APIs
-- 
2.43.0

