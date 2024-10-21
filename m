Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD4071F80CF;
	Mon, 21 Oct 2024 13:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729518207; cv=none; b=lN3dS9+/4wKl0d5kF1OqFhzPlLqz3oV9sSk6ilER2IQXzw6DI16d9ENMCbBU5u1+RTEo8fGAGLuYOESLReqyM8AQ64/MgjK1O67V608YITSorDc9iIhb0JBKW4QQNjLkWO7LGzsh4cTsm6SnKzvE/RnEud0jGDAk4JSo9vKcgTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729518207; c=relaxed/simple;
	bh=ZM9r7vED3kv7+r7g5A1zCEQS/Nl9bbZHXQAbshmVCyw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=JxPhHcKIVEs/MjEXaZFUwnQ2GBj3tx9HlZmPC0rOcsMqJsrLVc8cYk2Ul2joNC+6BD7fjo8G7sDTy2ng3uhq0ifcLGP8xCedpJaGgAaNeW9APKmJHieahhScnhgjm5l0Unia7I9507VLBuI/jBTImth0JEse4TjT+a+OZjeWrUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=mgBT+U2L; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="mgBT+U2L"
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49LCG5sG015673;
	Mon, 21 Oct 2024 09:42:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=GXsvn
	ihUVgxJj/G8aRNptGwZuVHWxQ6Dawe2pcOgaG0=; b=mgBT+U2LSevORfEeWVPeM
	n3MSmvB3M/HYhktiDlb6p9O3TzVVswX9ZRsDCR3aVmP7sAiip1xHoByBMcd41J8l
	QWyil3wlJzIkmYGRizzn0cqIunr7zB2tpig7Tpn90wbXQKQJRZNvSXQegdOIzhyU
	OkGBD8bte3hXFIy+39Me4hJmjDcCGZtg2ON0KAWk8lXhdjNmVycLBOFO8JDFVgSu
	h4nxu7EDWBoIijzAhR+5JSdkZMdHoxBZfLowudC0fepv9NSWUXJNQqxU4v+olRTZ
	9F4USEm5MrGe0cN4tBCoBCG67p2Y3jrQmWsVQvafPUkfatTX32M164EHCxBzd6ox
	w==
Received: from nwd2mta3.analog.com ([137.71.173.56])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 42dj4vsfrk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Oct 2024 09:42:50 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 49LDgmID055746
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 21 Oct 2024 09:42:48 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Mon, 21 Oct
 2024 09:42:48 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Mon, 21 Oct 2024 09:42:48 -0400
Received: from [127.0.0.1] ([10.44.3.60])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 49LDgU7Z017079;
	Mon, 21 Oct 2024 09:42:42 -0400
From: Nuno Sa <nuno.sa@analog.com>
Date: Mon, 21 Oct 2024 15:46:47 +0200
Subject: [PATCH 3/4] ASoC: codecs: adau1373: drop patform_data
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241021-adau1373-shutdown-v1-3-bec4ff9dfa16@analog.com>
References: <20241021-adau1373-shutdown-v1-0-bec4ff9dfa16@analog.com>
In-Reply-To: <20241021-adau1373-shutdown-v1-0-bec4ff9dfa16@analog.com>
To: <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>
CC: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Lars-Peter
 Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729518408; l=9151;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=ZM9r7vED3kv7+r7g5A1zCEQS/Nl9bbZHXQAbshmVCyw=;
 b=3BHf5LWbThwUzBjp+3yLRxvW74FmXan3osd3ahbN2kvS7hmbN7xG4I7OLGyvfeZfq9FWYD9z1
 L6ZSRajfMBzB7CU7WMJDvcBpj8z6mLu9CgV3Yp/ye74XVr69XLtmihN
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: BZdBxaJvAbWCxBiRbMPdN-BU0PM2GgCO
X-Proofpoint-ORIG-GUID: BZdBxaJvAbWCxBiRbMPdN-BU0PM2GgCO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 phishscore=0 mlxscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 mlxlogscore=999 adultscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410210098

struct adau1373_platform_data" was not being used by any platform.
Hence, drop it and move to firmware based support. All the
configurations quirks present in the platform_data are now supported as
firmware properties.

Signed-off-by: Nuno Sa <nuno.sa@analog.com>
---
 include/sound/adau1373.h    |  33 --------
 sound/soc/codecs/adau1373.c | 180 ++++++++++++++++++++++++++++++++------------
 2 files changed, 132 insertions(+), 81 deletions(-)

diff --git a/include/sound/adau1373.h b/include/sound/adau1373.h
deleted file mode 100644
index 4c32ba1328eda75f405047ce0f920791f348b98c..0000000000000000000000000000000000000000
--- a/include/sound/adau1373.h
+++ /dev/null
@@ -1,33 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-/*
- * Analog Devices ADAU1373 Audio Codec drive
- *
- * Copyright 2011 Analog Devices Inc.
- * Author: Lars-Peter Clausen <lars@metafoo.de>
- */
-
-#ifndef __SOUND_ADAU1373_H__
-#define __SOUND_ADAU1373_H__
-
-enum adau1373_micbias_voltage {
-	ADAU1373_MICBIAS_2_9V = 0,
-	ADAU1373_MICBIAS_2_2V = 1,
-	ADAU1373_MICBIAS_2_6V = 2,
-	ADAU1373_MICBIAS_1_8V = 3,
-};
-
-#define ADAU1373_DRC_SIZE 13
-
-struct adau1373_platform_data {
-	bool input_differential[4];
-	bool lineout_differential;
-	bool lineout_ground_sense;
-
-	unsigned int num_drc;
-	uint8_t drc_setting[3][ADAU1373_DRC_SIZE];
-
-	enum adau1373_micbias_voltage micbias1;
-	enum adau1373_micbias_voltage micbias2;
-};
-
-#endif
diff --git a/sound/soc/codecs/adau1373.c b/sound/soc/codecs/adau1373.c
index a910e252aa1265aa44fbd944f666a6f7ad16dc24..9568ff933e12ba939134a696c8d9c16a2ef04795 100644
--- a/sound/soc/codecs/adau1373.c
+++ b/sound/soc/codecs/adau1373.c
@@ -10,6 +10,7 @@
 #include <linux/init.h>
 #include <linux/delay.h>
 #include <linux/pm.h>
+#include <linux/property.h>
 #include <linux/i2c.h>
 #include <linux/slab.h>
 
@@ -18,7 +19,6 @@
 #include <sound/pcm_params.h>
 #include <sound/tlv.h>
 #include <sound/soc.h>
-#include <sound/adau1373.h>
 
 #include "adau1373.h"
 #include "adau-utils.h"
@@ -30,9 +30,28 @@ struct adau1373_dai {
 	bool clock_provider;
 };
 
+enum adau1373_micbias_voltage {
+	ADAU1373_MICBIAS_2_9V,
+	ADAU1373_MICBIAS_2_2V,
+	ADAU1373_MICBIAS_2_6V,
+	ADAU1373_MICBIAS_1_8V,
+};
+
+#define ADAU1373_DRC_SIZE 13
+
 struct adau1373 {
 	struct regmap *regmap;
 	struct adau1373_dai dais[3];
+
+	bool input_differential[4];
+	bool lineout_differential;
+	bool lineout_ground_sense;
+
+	unsigned int num_drc;
+	u8 drc_setting[3][ADAU1373_DRC_SIZE];
+
+	enum adau1373_micbias_voltage micbias1;
+	enum adau1373_micbias_voltage micbias2;
 };
 
 #define ADAU1373_INPUT_MODE	0x00
@@ -1332,66 +1351,61 @@ static void adau1373_load_drc_settings(struct adau1373 *adau1373,
 		regmap_write(adau1373->regmap, ADAU1373_DRC(nr) + i, drc[i]);
 }
 
-static bool adau1373_valid_micbias(enum adau1373_micbias_voltage micbias)
+static int adau1373_get_micbias(unsigned int val,
+				enum adau1373_micbias_voltage *micbias)
 {
-	switch (micbias) {
-	case ADAU1373_MICBIAS_2_9V:
-	case ADAU1373_MICBIAS_2_2V:
-	case ADAU1373_MICBIAS_2_6V:
-	case ADAU1373_MICBIAS_1_8V:
-		return true;
+	switch (val) {
+	case 2900000:
+		*micbias = ADAU1373_MICBIAS_2_9V;
+		return 0;
+	case 2200000:
+		*micbias = ADAU1373_MICBIAS_2_2V;
+		return 0;
+	case 2600000:
+		*micbias = ADAU1373_MICBIAS_2_6V;
+		return 0;
+	case 1800000:
+		*micbias = ADAU1373_MICBIAS_1_8V;
+		return 0;
 	default:
-		break;
+		return -EINVAL;
 	}
-	return false;
 }
 
 static int adau1373_probe(struct snd_soc_component *component)
 {
 	struct adau1373 *adau1373 = snd_soc_component_get_drvdata(component);
-	struct adau1373_platform_data *pdata = component->dev->platform_data;
-	bool lineout_differential = false;
 	unsigned int val;
 	int i;
 
-	if (pdata) {
-		if (pdata->num_drc > ARRAY_SIZE(pdata->drc_setting))
-			return -EINVAL;
-
-		if (!adau1373_valid_micbias(pdata->micbias1) ||
-			!adau1373_valid_micbias(pdata->micbias2))
-			return -EINVAL;
-
-		for (i = 0; i < pdata->num_drc; ++i) {
-			adau1373_load_drc_settings(adau1373, i,
-				pdata->drc_setting[i]);
-		}
-
-		snd_soc_add_component_controls(component, adau1373_drc_controls,
-			pdata->num_drc);
-
-		val = 0;
-		for (i = 0; i < 4; ++i) {
-			if (pdata->input_differential[i])
-				val |= BIT(i);
-		}
-		regmap_write(adau1373->regmap, ADAU1373_INPUT_MODE, val);
-
-		val = 0;
-		if (pdata->lineout_differential)
-			val |= ADAU1373_OUTPUT_CTRL_LDIFF;
-		if (pdata->lineout_ground_sense)
-			val |= ADAU1373_OUTPUT_CTRL_LNFBEN;
-		regmap_write(adau1373->regmap, ADAU1373_OUTPUT_CTRL, val);
-
-		lineout_differential = pdata->lineout_differential;
-
-		regmap_write(adau1373->regmap, ADAU1373_EP_CTRL,
-			(pdata->micbias1 << ADAU1373_EP_CTRL_MICBIAS1_OFFSET) |
-			(pdata->micbias2 << ADAU1373_EP_CTRL_MICBIAS2_OFFSET));
+	for (i = 0; i < adau1373->num_drc; ++i) {
+		adau1373_load_drc_settings(adau1373, i,
+					   adau1373->drc_setting[i]);
 	}
 
-	if (!lineout_differential) {
+	snd_soc_add_component_controls(component, adau1373_drc_controls,
+				       adau1373->num_drc);
+
+	val = 0;
+	for (i = 0; i < ARRAY_SIZE(adau1373->input_differential); ++i) {
+		if (adau1373->input_differential[i])
+			val |= BIT(i);
+	}
+	regmap_write(adau1373->regmap, ADAU1373_INPUT_MODE, val);
+
+	val = 0;
+	if (adau1373->lineout_differential)
+		val |= ADAU1373_OUTPUT_CTRL_LDIFF;
+	if (adau1373->lineout_ground_sense)
+		val |= ADAU1373_OUTPUT_CTRL_LNFBEN;
+
+	regmap_write(adau1373->regmap, ADAU1373_OUTPUT_CTRL, val);
+
+	regmap_write(adau1373->regmap, ADAU1373_EP_CTRL,
+		     (adau1373->micbias1 << ADAU1373_EP_CTRL_MICBIAS1_OFFSET) |
+		     (adau1373->micbias2 << ADAU1373_EP_CTRL_MICBIAS2_OFFSET));
+
+	if (!adau1373->lineout_differential) {
 		snd_soc_add_component_controls(component, adau1373_lineout2_controls,
 			ARRAY_SIZE(adau1373_lineout2_controls));
 	}
@@ -1471,6 +1485,65 @@ static const struct snd_soc_component_driver adau1373_component_driver = {
 	.endianness		= 1,
 };
 
+static int adau1373_parse_fw(struct device *dev, struct adau1373 *adau1373)
+{
+	int ret, drc_count;
+	unsigned int val;
+
+	if (device_property_present(dev, "adi,input1-differential"))
+		adau1373->input_differential[0] = true;
+	if (device_property_present(dev, "adi,input2-differential"))
+		adau1373->input_differential[1] = true;
+	if (device_property_present(dev, "adi,input3-differential"))
+		adau1373->input_differential[2] = true;
+	if (device_property_present(dev, "adi,input4-differential"))
+		adau1373->input_differential[3] = true;
+
+	if (device_property_present(dev, "adi,lineout-differential"))
+		adau1373->lineout_differential = true;
+	if (device_property_present(dev, "adi,lineout-gnd-sense"))
+		adau1373->lineout_ground_sense = true;
+
+	ret = device_property_read_u32(dev, "adi,micbias1-microvolt", &val);
+	if (!ret) {
+		ret = adau1373_get_micbias(val, &adau1373->micbias1);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "Failed to get micbias1(%u)\n", val);
+	}
+
+	ret = device_property_read_u32(dev, "adi,micbias2-microvolt", &val);
+	if (!ret) {
+		ret = adau1373_get_micbias(val, &adau1373->micbias2);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "Failed to get micbias2(%u)\n", val);
+	}
+
+	drc_count = device_property_count_u8(dev, "adi,drc-settings");
+	if (drc_count < 0)
+		return 0;
+	if (drc_count % ADAU1373_DRC_SIZE != 0)
+		return dev_err_probe(dev, -EINVAL,
+				     "DRC count(%u) not multiple of %u\n",
+				     drc_count, ADAU1373_DRC_SIZE);
+
+	adau1373->num_drc = drc_count / ADAU1373_DRC_SIZE;
+	if (adau1373->num_drc > ARRAY_SIZE(adau1373->drc_setting))
+		return dev_err_probe(dev, -EINVAL,
+				     "Too many DRC settings(%u)\n",
+				     adau1373->num_drc);
+
+	ret = device_property_read_u8_array(dev, "adi,drc-settings",
+					    (u8 *)&adau1373->drc_setting[0],
+					    drc_count);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Failed to read DRC settings\n");
+
+	return 0;
+}
+
 static int adau1373_i2c_probe(struct i2c_client *client)
 {
 	struct adau1373 *adau1373;
@@ -1489,6 +1562,10 @@ static int adau1373_i2c_probe(struct i2c_client *client)
 
 	dev_set_drvdata(&client->dev, adau1373);
 
+	ret = adau1373_parse_fw(&client->dev, adau1373);
+	if (ret)
+		return ret;
+
 	ret = devm_snd_soc_register_component(&client->dev,
 			&adau1373_component_driver,
 			adau1373_dai_driver, ARRAY_SIZE(adau1373_dai_driver));
@@ -1501,9 +1578,16 @@ static const struct i2c_device_id adau1373_i2c_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, adau1373_i2c_id);
 
+static const struct of_device_id adau1373_of_match[] = {
+	{ .compatible = "adi,adau1373", },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, adau1373_of_match);
+
 static struct i2c_driver adau1373_i2c_driver = {
 	.driver = {
 		.name = "adau1373",
+		.of_match_table = adau1373_of_match,
 	},
 	.probe = adau1373_i2c_probe,
 	.id_table = adau1373_i2c_id,

-- 
2.47.0

