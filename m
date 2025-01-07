Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C2F51F3D32;
	Tue,  7 Jan 2025 15:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.152.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736264685; cv=none; b=DWffyZ4Vaw9XhK/bDU9pFEWwZwI7CmNXLtaKerbuOG6tmSIrKi2i6WQeFmxPJsvFz3oF1+WYdlVVvFhACPzwjDFxzsZvjZQvqTAnfi852o3KcBAcoKC1ycoLo4V8Azalhh/Edfwcv+zwRjT8A8Oadl0gRmusZhuujAXC+65pmvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736264685; c=relaxed/simple;
	bh=1LerLHwNNJgfITXfLE2a1NnR8MD/qS7Z5DzykAngIYs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iL7BG1S86cMkVxurJMeKhwc8y29h56wLcHKxLOE+qr1BgAlW/a0fyjVGR5/YqbhsW0rn4SF5Xh2hHNWeFxJRJCO+U1lNE0K/PrEdUN+ZArOFBXwfRNQronFnTMX7PBe6k5j7ZLVoTxlSJRxMfXpfhIE9BxVqXkd/ZEqbmUxshb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=aAM9jRok; arc=none smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="aAM9jRok"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5076siV0007030;
	Tue, 7 Jan 2025 09:44:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=TnPkW7NWpcn2n8MVRTjo2XUXuNsK0cRZeGMjDLPFuSU=; b=
	aAM9jRokzVOv+rMUGHfK52+eJKkKoBxU08Lu+c5bwhxadTSbZ2OSaN5VPROmlB1S
	u+jfUMTH3blBxdz3Juuw9QNtLxH4OokyZJ8p2jMcJyI8qVOfLrdXlWPqGfKbbw3d
	KYyvVQkytS5vJXJ+wSR+jhAGlDsnHVYTzY6Ll+2cVXubfdAyKke8QwOq2GYzo4SS
	FQ9P4GAuDeZuxLXhXw/PqzvlHpJDhSZQG/E8/33Qu62nm0myqajOvyHZ3SoNSthC
	uAF/YxfHpZtWT4L5w6gxlGdaEouAPY2UNU+ZAHJidekoA4sQg1O/O/1y5DrF/sjM
	2qQGr6O7CUwnjikuGGmGug==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 43y29kbjaq-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Jan 2025 09:44:12 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.13; Tue, 7 Jan
 2025 15:44:09 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.13 via Frontend Transport; Tue, 7 Jan 2025 15:44:09 +0000
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id F0DE082024D;
	Tue,  7 Jan 2025 15:44:08 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>, <vkoul@kernel.org>, <oder_chiou@realtek.com>
CC: <jack.yu@realtek.com>, <shumingf@realtek.com>, <lgirdwood@gmail.com>,
        <peter.ujfalusi@linux.intel.com>, <yung-chuan.liao@linux.intel.com>,
        <sanyog.r.kale@intel.com>, <pierre-louis.bossart@linux.dev>,
        <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>
Subject: [PATCH v2 3/6] regmap: sdw-mbq: Add support for further MBQ register sizes
Date: Tue, 7 Jan 2025 15:44:05 +0000
Message-ID: <20250107154408.814455-4-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250107154408.814455-1-ckeepax@opensource.cirrus.com>
References: <20250107154408.814455-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: vRkxpxp9QNBczqIZ1I4V4bydVqO7BNbi
X-Proofpoint-GUID: vRkxpxp9QNBczqIZ1I4V4bydVqO7BNbi
X-Proofpoint-Spam-Reason: safe

SoundWire MBQ register maps typically contain a variety of register
sizes, which doesn't map ideally to the regmap abstraction which
expects register maps to have a consistent size. Currently the MBQ
register map only allows 16-bit registers to be defined, however
this leads to complex CODEC driver implementations with an 8-bit
register map and a 16-bit MBQ, every control will then have a custom
get and put handler that allows them to access different register
maps. Further more 32-bit MBQ quantities are not currently supported.

Add support for additional MBQ sizes and to avoid the complexity
of multiple register maps treat the val_size as a maximum size for
the register map. Within the regmap use an ancillary callback to
determine how many bytes to actually read/write to the hardware for
a specific register. In the case that no callback is defined the
behaviour defaults back to the existing behaviour of a fixed size
register map.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v1.

 drivers/base/regmap/regmap-sdw-mbq.c | 114 ++++++++++++++++++++++-----
 include/linux/regmap.h               |  47 ++++++++++-
 2 files changed, 139 insertions(+), 22 deletions(-)

diff --git a/drivers/base/regmap/regmap-sdw-mbq.c b/drivers/base/regmap/regmap-sdw-mbq.c
index c99eada83780c..1bd2773b11a45 100644
--- a/drivers/base/regmap/regmap-sdw-mbq.c
+++ b/drivers/base/regmap/regmap-sdw-mbq.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 // Copyright(c) 2020 Intel Corporation.
 
+#include <linux/bits.h>
 #include <linux/device.h>
 #include <linux/errno.h>
 #include <linux/module.h>
@@ -9,35 +10,77 @@
 #include <linux/soundwire/sdw_registers.h>
 #include "internal.h"
 
+struct regmap_mbq_context {
+	struct device *dev;
+
+	struct regmap_sdw_mbq_cfg cfg;
+
+	int val_size;
+};
+
+static int regmap_sdw_mbq_size(struct regmap_mbq_context *ctx, unsigned int reg)
+{
+	int size = ctx->val_size;
+
+	if (ctx->cfg.mbq_size) {
+		size = ctx->cfg.mbq_size(ctx->dev, reg);
+		if (!size || size > ctx->val_size)
+			return -EINVAL;
+	}
+
+	return size;
+}
+
 static int regmap_sdw_mbq_write(void *context, unsigned int reg, unsigned int val)
 {
-	struct device *dev = context;
+	struct regmap_mbq_context *ctx = context;
+	struct device *dev = ctx->dev;
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
+	int mbq_size = regmap_sdw_mbq_size(ctx, reg);
+	int shift = mbq_size * BITS_PER_BYTE;
 	int ret;
 
-	ret = sdw_write_no_pm(slave, SDW_SDCA_MBQ_CTL(reg), (val >> 8) & 0xff);
-	if (ret < 0)
-		return ret;
+	if (mbq_size < 0)
+		return mbq_size;
+
+	while (--mbq_size > 0) {
+		shift -= BITS_PER_BYTE;
+
+		ret = sdw_write_no_pm(slave, SDW_SDCA_MBQ_CTL(reg),
+				      (val >> shift) & 0xff);
+		if (ret < 0)
+			return ret;
+	}
 
 	return sdw_write_no_pm(slave, reg, val & 0xff);
 }
 
 static int regmap_sdw_mbq_read(void *context, unsigned int reg, unsigned int *val)
 {
-	struct device *dev = context;
+	struct regmap_mbq_context *ctx = context;
+	struct device *dev = ctx->dev;
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
-	int read0;
-	int read1;
+	int mbq_size = regmap_sdw_mbq_size(ctx, reg);
+	int shift = BITS_PER_BYTE;
+	int read;
 
-	read0 = sdw_read_no_pm(slave, reg);
-	if (read0 < 0)
-		return read0;
+	if (mbq_size < 0)
+		return mbq_size;
 
-	read1 = sdw_read_no_pm(slave, SDW_SDCA_MBQ_CTL(reg));
-	if (read1 < 0)
-		return read1;
+	read = sdw_read_no_pm(slave, reg);
+	if (read < 0)
+		return read;
 
-	*val = (read1 << 8) | read0;
+	*val = read;
+
+	while (--mbq_size > 0) {
+		read = sdw_read_no_pm(slave, SDW_SDCA_MBQ_CTL(reg));
+		if (read < 0)
+			return read;
+
+		*val |= read << shift;
+		shift += BITS_PER_BYTE;
+	}
 
 	return 0;
 }
@@ -51,8 +94,7 @@ static const struct regmap_bus regmap_sdw_mbq = {
 
 static int regmap_sdw_mbq_config_check(const struct regmap_config *config)
 {
-	/* MBQ-based controls are only 16-bits for now */
-	if (config->val_bits != 16)
+	if (config->val_bits > (sizeof(unsigned int) * BITS_PER_BYTE))
 		return -ENOTSUPP;
 
 	/* Registers are 32 bits wide */
@@ -65,35 +107,67 @@ static int regmap_sdw_mbq_config_check(const struct regmap_config *config)
 	return 0;
 }
 
+static struct regmap_mbq_context *
+regmap_sdw_mbq_gen_context(struct device *dev,
+			   const struct regmap_config *config,
+			   const struct regmap_sdw_mbq_cfg *mbq_config)
+{
+	struct regmap_mbq_context *ctx;
+
+	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return ERR_PTR(-ENOMEM);
+
+	ctx->dev = dev;
+	ctx->val_size = config->val_bits / BITS_PER_BYTE;
+
+	if (mbq_config)
+		ctx->cfg = *mbq_config;
+
+	return ctx;
+}
+
 struct regmap *__regmap_init_sdw_mbq(struct sdw_slave *sdw,
 				     const struct regmap_config *config,
+				     const struct regmap_sdw_mbq_cfg *mbq_config,
 				     struct lock_class_key *lock_key,
 				     const char *lock_name)
 {
+	struct regmap_mbq_context *ctx;
 	int ret;
 
 	ret = regmap_sdw_mbq_config_check(config);
 	if (ret)
 		return ERR_PTR(ret);
 
-	return __regmap_init(&sdw->dev, &regmap_sdw_mbq,
-			&sdw->dev, config, lock_key, lock_name);
+	ctx = regmap_sdw_mbq_gen_context(&sdw->dev, config, mbq_config);
+	if (IS_ERR(ctx))
+		return ERR_CAST(ctx);
+
+	return __regmap_init(&sdw->dev, &regmap_sdw_mbq, ctx,
+			     config, lock_key, lock_name);
 }
 EXPORT_SYMBOL_GPL(__regmap_init_sdw_mbq);
 
 struct regmap *__devm_regmap_init_sdw_mbq(struct sdw_slave *sdw,
 					  const struct regmap_config *config,
+					  const struct regmap_sdw_mbq_cfg *mbq_config,
 					  struct lock_class_key *lock_key,
 					  const char *lock_name)
 {
+	struct regmap_mbq_context *ctx;
 	int ret;
 
 	ret = regmap_sdw_mbq_config_check(config);
 	if (ret)
 		return ERR_PTR(ret);
 
-	return __devm_regmap_init(&sdw->dev, &regmap_sdw_mbq,
-			&sdw->dev, config, lock_key, lock_name);
+	ctx = regmap_sdw_mbq_gen_context(&sdw->dev, config, mbq_config);
+	if (IS_ERR(ctx))
+		return ERR_CAST(ctx);
+
+	return __devm_regmap_init(&sdw->dev, &regmap_sdw_mbq, ctx,
+				  config, lock_key, lock_name);
 }
 EXPORT_SYMBOL_GPL(__devm_regmap_init_sdw_mbq);
 
diff --git a/include/linux/regmap.h b/include/linux/regmap.h
index fd41baccbf3eb..dd96a22f56578 100644
--- a/include/linux/regmap.h
+++ b/include/linux/regmap.h
@@ -506,6 +506,17 @@ struct regmap_range_cfg {
 	unsigned int window_len;
 };
 
+/**
+ * struct regmap_sdw_mbq_cfg - Configuration for Multi-Byte Quantities
+ *
+ * @mbq_size: Callback returning the actual size of the given register.
+ *
+ * Provides additional configuration required for SoundWire MBQ register maps.
+ */
+struct regmap_sdw_mbq_cfg {
+	int (*mbq_size)(struct device *dev, unsigned int reg);
+};
+
 struct regmap_async;
 
 typedef int (*regmap_hw_write)(void *context, const void *data,
@@ -652,6 +663,7 @@ struct regmap *__regmap_init_sdw(struct sdw_slave *sdw,
 				 const char *lock_name);
 struct regmap *__regmap_init_sdw_mbq(struct sdw_slave *sdw,
 				     const struct regmap_config *config,
+				     const struct regmap_sdw_mbq_cfg *mbq_config,
 				     struct lock_class_key *lock_key,
 				     const char *lock_name);
 struct regmap *__regmap_init_spi_avmm(struct spi_device *spi,
@@ -713,6 +725,7 @@ struct regmap *__devm_regmap_init_sdw(struct sdw_slave *sdw,
 				 const char *lock_name);
 struct regmap *__devm_regmap_init_sdw_mbq(struct sdw_slave *sdw,
 					  const struct regmap_config *config,
+					  const struct regmap_sdw_mbq_cfg *mbq_config,
 					  struct lock_class_key *lock_key,
 					  const char *lock_name);
 struct regmap *__devm_regmap_init_slimbus(struct slim_device *slimbus,
@@ -942,7 +955,22 @@ bool regmap_ac97_default_volatile(struct device *dev, unsigned int reg);
  */
 #define regmap_init_sdw_mbq(sdw, config)					\
 	__regmap_lockdep_wrapper(__regmap_init_sdw_mbq, #config,		\
-				sdw, config)
+				sdw, config, NULL)
+
+/**
+ * regmap_init_sdw_mbq_cfg() - Initialise MBQ SDW register map with config
+ *
+ * @sdw: Device that will be interacted with
+ * @config: Configuration for register map
+ * @mbq_config: Properties for the MBQ registers
+ *
+ * The return value will be an ERR_PTR() on error or a valid pointer
+ * to a struct regmap. The regmap will be automatically freed by the
+ * device management code.
+ */
+#define regmap_init_sdw_mbq_cfg(sdw, config, mbq_config)		\
+	__regmap_lockdep_wrapper(__regmap_init_sdw_mbq, #config,	\
+				sdw, config, mbq_config)
 
 /**
  * regmap_init_spi_avmm() - Initialize register map for Intel SPI Slave
@@ -1155,7 +1183,22 @@ bool regmap_ac97_default_volatile(struct device *dev, unsigned int reg);
  */
 #define devm_regmap_init_sdw_mbq(sdw, config)			\
 	__regmap_lockdep_wrapper(__devm_regmap_init_sdw_mbq, #config,   \
-				sdw, config)
+				sdw, config, NULL)
+
+/**
+ * devm_regmap_init_sdw_mbq_cfg() - Initialise managed MBQ SDW register map with config
+ *
+ * @sdw: Device that will be interacted with
+ * @config: Configuration for register map
+ * @mbq_config: Properties for the MBQ registers
+ *
+ * The return value will be an ERR_PTR() on error or a valid pointer
+ * to a struct regmap. The regmap will be automatically freed by the
+ * device management code.
+ */
+#define devm_regmap_init_sdw_mbq_cfg(sdw, config, mbq_config)	\
+	__regmap_lockdep_wrapper(__devm_regmap_init_sdw_mbq,	\
+				#config, sdw, config, mbq_config)
 
 /**
  * devm_regmap_init_slimbus() - Initialise managed register map
-- 
2.39.5

