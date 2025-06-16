Received: from RTEXH36506.realtek.com.tw (unknown [122.146.120.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B1B2737F4
	for <linux-sound@vger.kernel.org>; Mon, 16 Jun 2025 11:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=122.146.120.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750074586; cv=none; b=kKpzs7Q6UYyiDcZ/OW5ED/7/9JiV2vywRJC9iRAPGTepW+I3h1P5OtPbCL6Uvf0lBC5AqWCzcSiC3iWpjV6a7QNWSwLcszfVnDZ+xNhK8dOr8q/2PM9KjdDB8rp2M9bADC8I1ao/zds9Bmq2prdFx6VLxuhSnAG7gvVQeL/w5w4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750074586; c=relaxed/simple;
	bh=uui9IR9FEhkDm2K4Esk/VwvdHEOb6D/CooKGXhnWamE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HDWXiT0fzTWV6zLjJ4E2Y+bC5kVNNTqYhmf1te6QI79jndsaH9UAppyKJ9rgC9oG+6TemaC4qVVy5gFIGko11ocUJy1l5XFvM0d6mPUEB8sRqhbROgGWmIq/5JfFanvaqLtpIlUirm+NFKcPStFRjKese+ejlhc2s+LZVCeX0Nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; arc=none smtp.client-ip=122.146.120.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 16 Jun 2025 19:49:41 +0800
Received: from sw-server.localdomain (172.22.102.1) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 16 Jun 2025 19:49:38 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <jikos@kernel.org>,
	<bentiss@kernel.org>
CC: <linux-sound@vger.kernel.org>, <lars@metafoo.de>, <flove@realtek.com>,
	<oder_chiou@realtek.com>, <jack.yu@realtek.com>, <derek.fang@realtek.com>,
	<ckeepax@opensource.cirrus.com>, <bard.liao@intel.com>, Shuming Fan
	<shumingf@realtek.com>
Subject: [PATCH v2 3/3] ASoC: SDCA: add a HID device for HIDE entity
Date: Mon, 16 Jun 2025 19:49:29 +0800
Message-ID: <20250616114929.855496-1-shumingf@realtek.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: RTEXH36506.realtek.com.tw (172.21.6.27) To
 RTEXMBS01.realtek.com.tw (172.21.6.94)
X-KSE-ServerInfo: RTEXMBS01.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback

From: Shuming Fan <shumingf@realtek.com>

This patch supports to add a HID device for SDCA HIDE entity.
The codec driver could call 'hid_input_report' to report events.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
---
 include/sound/sdca_hid.h        |  25 +++++++
 sound/soc/sdca/Kconfig          |   4 +
 sound/soc/sdca/Makefile         |   3 +
 sound/soc/sdca/sdca_functions.c |   9 +++
 sound/soc/sdca/sdca_hid.c       | 127 ++++++++++++++++++++++++++++++++
 5 files changed, 168 insertions(+)
 create mode 100644 include/sound/sdca_hid.h
 create mode 100644 sound/soc/sdca/sdca_hid.c

diff --git a/include/sound/sdca_hid.h b/include/sound/sdca_hid.h
new file mode 100644
index 000000000000..8ab3e498884e
--- /dev/null
+++ b/include/sound/sdca_hid.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause) */
+/*
+ * The MIPI SDCA specification is available for public downloads at
+ * https://www.mipi.org/mipi-sdca-v1-0-download
+ *
+ */
+
+#ifndef __SDCA_HID_H__
+#define __SDCA_HID_H__
+
+#include <linux/types.h>
+#include <linux/hid.h>
+
+#if IS_ENABLED(CONFIG_SND_SOC_SDCA_HID)
+int sdca_add_hid_device(struct device *dev, struct sdca_entity *entity);
+
+#else
+static inline int sdca_add_hid_device(struct device *dev, struct sdca_entity *entity)
+{
+	return 0;
+}
+
+#endif
+
+#endif /* __SDCA_HID_H__ */
diff --git a/sound/soc/sdca/Kconfig b/sound/soc/sdca/Kconfig
index ee20b9914aa1..ec28855fe3b0 100644
--- a/sound/soc/sdca/Kconfig
+++ b/sound/soc/sdca/Kconfig
@@ -9,3 +9,7 @@ config SND_SOC_SDCA
 
 config SND_SOC_SDCA_OPTIONAL
 	def_tristate SND_SOC_SDCA || !SND_SOC_SDCA
+
+config SND_SOC_SDCA_HID
+	tristate "SDCA HID support"
+	depends on SND_SOC_SDCA && HID
diff --git a/sound/soc/sdca/Makefile b/sound/soc/sdca/Makefile
index 53344f108ca6..9af46e7edfd2 100644
--- a/sound/soc/sdca/Makefile
+++ b/sound/soc/sdca/Makefile
@@ -2,4 +2,7 @@
 
 snd-soc-sdca-y	:= sdca_functions.o sdca_device.o sdca_regmap.o sdca_asoc.o
 
+snd-soc-sdca-hid-y := sdca_hid.o
+
+obj-$(CONFIG_SND_SOC_SDCA_HID)	+= snd-soc-sdca-hid.o
 obj-$(CONFIG_SND_SOC_SDCA)	+= snd-soc-sdca.o
diff --git a/sound/soc/sdca/sdca_functions.c b/sound/soc/sdca/sdca_functions.c
index 4a89067dcf76..093c681e9387 100644
--- a/sound/soc/sdca/sdca_functions.c
+++ b/sound/soc/sdca/sdca_functions.c
@@ -19,6 +19,7 @@
 #include <linux/types.h>
 #include <sound/sdca.h>
 #include <sound/sdca_function.h>
+#include <sound/sdca_hid.h>
 
 /*
  * Should be long enough to encompass all the MIPI DisCo properties.
@@ -1294,6 +1295,13 @@ find_sdca_entity_hide(struct device *dev, struct fwnode_handle *function_node,
 			hide->hid_report_desc = report_desc;
 			fwnode_property_read_u8_array(function_node, "mipi-sdca-report-descriptor",
 						      report_desc, nval);
+
+			/* add HID device */
+			ret = sdca_add_hid_device(dev, entity);
+			if (ret) {
+				dev_err(dev, "%pfwP: failed to add HID device: %d\n", entity_node, ret);
+				return ret;
+			}
 		}
 	}
 
@@ -1933,3 +1941,4 @@ EXPORT_SYMBOL_NS(sdca_parse_function, "SND_SOC_SDCA");
 
 MODULE_LICENSE("Dual BSD/GPL");
 MODULE_DESCRIPTION("SDCA library");
+MODULE_IMPORT_NS("SND_SOC_SDCA_HID");
diff --git a/sound/soc/sdca/sdca_hid.c b/sound/soc/sdca/sdca_hid.c
new file mode 100644
index 000000000000..b227ad94d08f
--- /dev/null
+++ b/sound/soc/sdca/sdca_hid.c
@@ -0,0 +1,127 @@
+// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+
+/*
+ * The MIPI SDCA specification is available for public downloads at
+ * https://www.mipi.org/mipi-sdca-v1-0-download
+ */
+
+#include <linux/acpi.h>
+#include <linux/byteorder/generic.h>
+#include <linux/cleanup.h>
+#include <linux/device.h>
+#include <linux/dev_printk.h>
+#include <linux/module.h>
+#include <linux/property.h>
+#include <linux/soundwire/sdw.h>
+#include <linux/types.h>
+#include <sound/sdca.h>
+#include <sound/sdca_function.h>
+#include <sound/sdca_hid.h>
+
+static int sdwhid_parse(struct hid_device *hid)
+{
+	struct sdca_entity *entity = hid->driver_data;
+	unsigned int rsize;
+	int ret;
+
+	rsize = entity->hide.hid_desc.rpt_desc.wDescriptorLength;
+
+	if (!rsize || rsize > HID_MAX_DESCRIPTOR_SIZE) {
+		dev_err(&hid->dev, "invalid size of report descriptor (%u)\n", rsize);
+		return -EINVAL;
+	}
+
+	ret = hid_parse_report(hid, entity->hide.hid_report_desc, rsize);
+
+	if (!ret)
+		return 0;
+
+	dev_err(&hid->dev, "parsing report descriptor failed\n");
+	return ret;
+}
+
+static int sdwhid_start(struct hid_device *hid)
+{
+	return 0;
+}
+
+static void sdwhid_stop(struct hid_device *hid)
+{
+}
+
+static int sdwhid_raw_request(struct hid_device *hid, unsigned char reportnum,
+			      __u8 *buf, size_t len, unsigned char rtype, int reqtype)
+{
+	switch (reqtype) {
+	case HID_REQ_GET_REPORT:
+		/* not implemented yet */
+		return 0;
+	case HID_REQ_SET_REPORT:
+		/* not implemented yet */
+		return 0;
+	default:
+		return -EIO;
+	}
+}
+
+static int sdwhid_open(struct hid_device *hid)
+{
+	return 0;
+}
+
+static void sdwhid_close(struct hid_device *hid)
+{
+}
+
+static const struct hid_ll_driver sdw_hid_driver = {
+	.parse = sdwhid_parse,
+	.start = sdwhid_start,
+	.stop = sdwhid_stop,
+	.open = sdwhid_open,
+	.close = sdwhid_close,
+	.raw_request = sdwhid_raw_request,
+};
+
+int sdca_add_hid_device(struct device *dev, struct sdca_entity *entity)
+{
+	struct sdw_bus *bus;
+	struct hid_device *hid;
+	struct sdw_slave *slave = dev_to_sdw_dev(dev);
+	int ret;
+
+	bus = slave->bus;
+
+	hid = hid_allocate_device();
+	if (IS_ERR(hid))
+		return PTR_ERR(hid);
+
+	hid->ll_driver = &sdw_hid_driver;
+
+	hid->dev.parent = dev;
+	hid->bus = BUS_SDW;
+	hid->version = le16_to_cpu(entity->hide.hid_desc.bcdHID);
+
+	snprintf(hid->name, sizeof(hid->name),
+		 "HID sdw:%01x:%01x:%04x:%04x:%02x",
+		 bus->controller_id, bus->link_id, slave->id.mfg_id,
+		 slave->id.part_id, slave->id.class_id);
+
+	snprintf(hid->phys, sizeof(hid->phys), "%s", dev->bus->name);
+
+	hid->driver_data = entity;
+
+	ret = hid_add_device(hid);
+	if (ret && ret != -ENODEV) {
+		dev_err(dev, "can't add hid device: %d\n", ret);
+		hid_destroy_device(hid);
+		return ret;
+	}
+
+	entity->hide.hid = hid;
+
+	return 0;
+}
+EXPORT_SYMBOL_NS(sdca_add_hid_device, "SND_SOC_SDCA_HID");
+
+MODULE_LICENSE("Dual BSD/GPL");
+MODULE_DESCRIPTION("SDCA HID library");
-- 
2.34.1

