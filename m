Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8881B1E907F
	for <linux-sound@vger.kernel.org>; Mon, 21 Oct 2024 13:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729519032; cv=none; b=fc3xmCbK+jWLYvSbsePIG+FC4T9tgl2Cqhn3KrmDT5XhnNsehGMijxJQMHD5IaoxLnd2ZQDd65SqglNhe/9zr7XdYMRl1xvNBX9OoFdwjwe2RtQCz3Js2gjG6Cgf7gXeiPW/pr5m7VDicajF5J9XMSFM5R3vSsDh6b6+FUatJhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729519032; c=relaxed/simple;
	bh=2cj4Xjddxl0ncGJHob58C4XOiaoh3mE3PE70M6LviAQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=UHNZ5sF1Q6rl3k9RbDl1u3ewDO80mjxN32r03V0sgjYjYbfFyG4d4Y0TVh/2u1abfR+92JW1UE6+b4FMPM2oNE0nofdNKtsLwlyoIjmfcmkXLmFhvctJyhZ2ATxtacQfE0Az/9PtEN3x33wmGNrn3ORW4gBqAaC/XTikFXFdOE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=Xng9rJB3; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="Xng9rJB3"
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49LCG5us015673;
	Mon, 21 Oct 2024 09:56:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=mcpVvoRLx+OCuzHJVNz6lsc+Cw0
	akypwEw6DZKKNmJU=; b=Xng9rJB3g2hdTopmMVKiB0uvmb2SLg6Kfze8xfhM+p6
	3kABWrlhMfNJTc//4rIk3eZO0SCBW359vORX+s6wGZiS7rLnuIUgaZK+TD8rOo2R
	QQk67IK91YAufxvM+KUVpP34XJaMa8iL04Zay4RP7j/H1FE2/XHpphOAY6t9US90
	yqem5YBXBwhthA6ZjHeOSIusoZ4Tjq8ndb8yPbePnVhafKv4mQTiJDn9huVQfEUm
	5FplAEMy3eP8+MMJkHbkaj/Vw8HTWr0JWnA+t8tcuIR/szYWezcttFhaPILpKiEi
	l5LupBH/e9eVKZMfY9F4KeCiCmoC25EdlYRXXIZ+1Iw==
Received: from nwd2mta3.analog.com ([137.71.173.56])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 42dj4vshkj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Oct 2024 09:56:49 -0400 (EDT)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 49LDuleA056896
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 21 Oct 2024 09:56:47 -0400
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX8.ad.analog.com (10.64.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Mon, 21 Oct 2024 09:56:47 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Mon, 21 Oct 2024 09:56:47 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Mon, 21 Oct 2024 09:56:47 -0400
Received: from [127.0.0.1] ([10.44.3.60])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 49LDuZwk017523;
	Mon, 21 Oct 2024 09:56:38 -0400
From: Nuno Sa <nuno.sa@analog.com>
Date: Mon, 21 Oct 2024 16:00:49 +0200
Subject: [PATCH] ASoC: codecs: adau1372: add match table
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20241021-adau1372-of-table-v1-1-6efbc7946957@analog.com>
X-B4-Tracking: v=1; b=H4sIAJBeFmcC/x3MSwqAMAwA0atI1gaaVhS8irjoJ9WAqLQqgnh3i
 8u3mHkgcxLO0FcPJL4ky7YWUF2Bn+06MUooBq10Q0oT2mBPMp3GLeJh3cJoKLjWu86oqKB0e+I
 o9/8cxvf9AC4ylq9jAAAA
X-Change-ID: 20241021-adau1372-of-table-31db6cb730f0
To: <linux-sound@vger.kernel.org>
CC: Lars-Peter Clausen <lars@metafoo.de>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        "Takashi
 Iwai" <tiwai@suse.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729519253; l=2845;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=2cj4Xjddxl0ncGJHob58C4XOiaoh3mE3PE70M6LviAQ=;
 b=YYoktc03BKq8wGEgnBkEhTglsLDWXZhr3S8m57eJxbgWud7znArYO4AbPSc8WrDrtGarkRDrC
 ghPTGMfcXDFCQWR0hlktilquH2hCWSdyM2UJmSjp1DwwCnCDQB2ZlsL
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: wmGQDW1UunVyBOMlM8ujCblRbzADGQ4_
X-Proofpoint-ORIG-GUID: wmGQDW1UunVyBOMlM8ujCblRbzADGQ4_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 phishscore=0 mlxscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 mlxlogscore=988 adultscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410210099

Add an of_device_id table for both the I2C and SPI drivers.

Signed-off-by: Nuno Sa <nuno.sa@analog.com>
---
 sound/soc/codecs/adau1372-i2c.c | 1 +
 sound/soc/codecs/adau1372-spi.c | 1 +
 sound/soc/codecs/adau1372.c     | 8 ++++++++
 sound/soc/codecs/adau1372.h     | 1 +
 4 files changed, 11 insertions(+)

diff --git a/sound/soc/codecs/adau1372-i2c.c b/sound/soc/codecs/adau1372-i2c.c
index 2869325f9acedeadf0a5d0331cf1c664ac85ffe0..73f83be38f749024e6836ccc503ffe7412cc8913 100644
--- a/sound/soc/codecs/adau1372-i2c.c
+++ b/sound/soc/codecs/adau1372-i2c.c
@@ -29,6 +29,7 @@ MODULE_DEVICE_TABLE(i2c, adau1372_i2c_ids);
 static struct i2c_driver adau1372_i2c_driver = {
 	.driver = {
 		.name = "adau1372",
+		.of_match_table = adau1372_of_match,
 	},
 	.probe = adau1372_i2c_probe,
 	.id_table = adau1372_i2c_ids,
diff --git a/sound/soc/codecs/adau1372-spi.c b/sound/soc/codecs/adau1372-spi.c
index 51298e00fbd69ccc033fdc74678b6d09376c08fb..656bd1fabeb3a1377c490b51ba7e1c16aadef561 100644
--- a/sound/soc/codecs/adau1372-spi.c
+++ b/sound/soc/codecs/adau1372-spi.c
@@ -47,6 +47,7 @@ MODULE_DEVICE_TABLE(spi, adau1372_spi_id);
 static struct spi_driver adau1372_spi_driver = {
 	.driver = {
 		.name = "adau1372",
+		.of_match_table = adau1372_of_match,
 	},
 	.probe = adau1372_spi_probe,
 	.id_table = adau1372_spi_id,
diff --git a/sound/soc/codecs/adau1372.c b/sound/soc/codecs/adau1372.c
index 98380a7ce64d80cbfffee17060cf41350395a915..fdee689cae53830ee201be1d929d77e4b3489eac 100644
--- a/sound/soc/codecs/adau1372.c
+++ b/sound/soc/codecs/adau1372.c
@@ -11,6 +11,7 @@
 #include <linux/gpio/consumer.h>
 #include <linux/init.h>
 #include <linux/module.h>
+#include <linux/mod_devicetable.h>
 #include <linux/pm.h>
 #include <linux/slab.h>
 
@@ -1060,6 +1061,13 @@ const struct regmap_config adau1372_regmap_config = {
 };
 EXPORT_SYMBOL_GPL(adau1372_regmap_config);
 
+const struct of_device_id adau1372_of_match[] = {
+	{ .compatible = "adi,adau1372" },
+	{ }
+};
+EXPORT_SYMBOL_GPL(adau1372_of_match);
+MODULE_DEVICE_TABLE(of, adau1372_of_match);
+
 MODULE_DESCRIPTION("ASoC ADAU1372 CODEC driver");
 MODULE_AUTHOR("Lars-Peter Clausen <lars@metafoo.de>");
 MODULE_LICENSE("GPL v2");
diff --git a/sound/soc/codecs/adau1372.h b/sound/soc/codecs/adau1372.h
index a9d2c59b73a93c772eac1c6c21ff772d8e6bcfdb..c55b1c24fe397a9b8c66cb0f10b1b2d57a6fc731 100644
--- a/sound/soc/codecs/adau1372.h
+++ b/sound/soc/codecs/adau1372.h
@@ -13,6 +13,7 @@
 
 struct device;
 
+extern const struct of_device_id adau1372_of_match[];
 int adau1372_probe(struct device *dev, struct regmap *regmap,
 		   void (*switch_mode)(struct device *dev));
 

---
base-commit: 626297009d7d0dbda64528099822f9ff21b26a24
change-id: 20241021-adau1372-of-table-31db6cb730f0
--

Thanks!
- Nuno Sá

