Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C3461FFE
	for <linux-sound@vger.kernel.org>; Wed, 13 Aug 2025 09:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755075659; cv=none; b=RsyfEAIoW8+p7y+MB6min68J1f6AZFWqFwxN/MOy9juPyyfB3ZyVwCvgOWlS8vvvpQdA7bJl1hDm7eJHRBsi7rgfu5ShxmnIJj3iV/f0e01X34SNyDW/yMQRA65dBglFzLIRhJnw60nf1W1P/c5uW3RIe8n0tRM6ZRBx0LVgkS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755075659; c=relaxed/simple;
	bh=ZZraJNj5xeiAr/RR3eh/OyGrIIQODWq6zkB2gNQWgbw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kSjuRa4BXKoCR98iIbXmfFETRtGsNhkzNYpRd+AqICpaUJgKQ8nCsHWeh/AzEVqFInCiGijPocU1sRycajtsbwpygsidxMgn3n0MQ1HLBV2trAhlgmAtuGCDDwGZLcqp2pcN5J0XBfAXfmA6YKS0TfVZx3HJ9R5AEvETQAwELS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=EShBp1F8; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="EShBp1F8"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 57D90NQa84043728, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1755075623; bh=OycRU2mLZUPAMeV8r3KOTsNFaz7Ejtn0TFzioJT2l6s=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=EShBp1F8aJ/350XFigq6NPjpe8nXzrAn2qoisAMGxD48zmnm4bEs0a1DdqPk2uKJ3
	 9wyFh2N7iegad8L7qbagWhdFc6S/w1QH26GtDwL15LzfovWntH2c0jK6MiNuStGNjT
	 eJxgWOgvzlo9aDP2FM+/aTlidajAxjXkbZFBzR9wXH9MO5XsSieeIHn1C1NhL1hLCO
	 WzdvCoWBibXsk2K9P9nLX0WpvAksCfWttq0US8eK27xWGH/g71IblhAQUp8noEr6YR
	 QrPWgi4VkZ6lglAeEgt2cBRMQLgR7m25Ni258zZ0IWhqJADsbESVkgdOzxwrD9GQOF
	 sgpvg61boSq8g==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.13/5.93) with ESMTP id 57D90NQa84043728;
	Wed, 13 Aug 2025 17:00:23 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 13 Aug 2025 17:00:22 +0800
Received: from sw-server.localdomain (172.24.54.4) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 13 Aug 2025 17:00:21 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
CC: <linux-sound@vger.kernel.org>, <lars@metafoo.de>, <flove@realtek.com>,
        <oder_chiou@realtek.com>, <jack.yu@realtek.com>,
        <derek.fang@realtek.com>, <Deep.Harsora@Dell.com>,
        Shuming Fan <shumingf@realtek.com>
Subject: [PATCH] ASoC: rt1321: Add RT1321 amplifier support
Date: Wed, 13 Aug 2025 17:00:19 +0800
Message-ID: <20250813090019.1404356-1-shumingf@realtek.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: RTEXH36505.realtek.com.tw (172.21.6.25) To
 RTKEXHMBS06.realtek.com.tw (10.21.1.56)

From: Shuming Fan <shumingf@realtek.com>

This patch supported RT1321 amplifier.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
---
 sound/soc/codecs/rt1320-sdw.c | 348 +++++++++++++++++++++++++++++-----
 sound/soc/codecs/rt1320-sdw.h |  10 +
 2 files changed, 313 insertions(+), 45 deletions(-)

diff --git a/sound/soc/codecs/rt1320-sdw.c b/sound/soc/codecs/rt1320-sdw.c
index dcddc28e8856..ada6d8efd738 100644
--- a/sound/soc/codecs/rt1320-sdw.c
+++ b/sound/soc/codecs/rt1320-sdw.c
@@ -256,6 +256,162 @@ static const struct reg_sequence rt1320_vc_blind_write[] = {
 	{ SDW_SDCA_CTL(FUNC_NUM_AMP, RT1320_SDCA_ENT_PDE23, RT1320_SDCA_CTL_REQ_POWER_STATE, 0), 0x03 },
 };
 
+static const struct reg_sequence rt1321_blind_write[] = {
+	{ 0x0000c003, 0xf0 },
+	{ 0x0000c01b, 0xfc },
+	{ 0x0000c5c3, 0xf2 },
+	{ 0x0000c5c2, 0x00 },
+	{ 0x0000c5c1, 0x10 },
+	{ 0x0000c5c0, 0x04 },
+	{ 0x0000c5c7, 0x03 },
+	{ 0x0000c5c6, 0x10 },
+	{ 0x0000c526, 0x47 },
+	{ 0x0000c5c4, 0x12 },
+	{ 0x0000c5c5, 0x60 },
+	{ 0x0000c520, 0x10 },
+	{ 0x0000c521, 0x32 },
+	{ 0x0000c5c7, 0x00 },
+	{ 0x0000c5c8, 0x03 },
+	{ 0x0000c5d3, 0x08 },
+	{ 0x0000c5d2, 0x0a },
+	{ 0x0000c5d1, 0x49 },
+	{ 0x0000c5d0, 0x0f },
+	{ 0x0000c580, 0x10 },
+	{ 0x0000c581, 0x32 },
+	{ 0x0000c582, 0x01 },
+	{ 0x0000cb00, 0x03 },
+	{ 0x0000cb02, 0x52 },
+	{ 0x0000cb04, 0x80 },
+	{ 0x0000cb0b, 0x01 },
+	{ 0x0000c682, 0x60 },
+	{ 0x0000c019, 0x10 },
+	{ 0x0000c5f0, 0x01 },
+	{ 0x0000c5f7, 0x22 },
+	{ 0x0000c5f6, 0x22 },
+	{ 0x0000c057, 0x51 },
+	{ 0x0000c054, 0x55 },
+	{ 0x0000c053, 0x55 },
+	{ 0x0000c052, 0x55 },
+	{ 0x0000c051, 0x01 },
+	{ 0x0000c050, 0x15 },
+	{ 0x0000c060, 0x99 },
+	{ 0x0000c030, 0x55 },
+	{ 0x0000c061, 0x55 },
+	{ 0x0000c063, 0x55 },
+	{ 0x0000c065, 0xa5 },
+	{ 0x0000c06b, 0x0a },
+	{ 0x0000ca05, 0xd6 },
+	{ 0x0000ca07, 0x07 },
+	{ 0x0000ca25, 0xd6 },
+	{ 0x0000ca27, 0x07 },
+	{ 0x0000cd00, 0x05 },
+	{ 0x0000c604, 0x40 },
+	{ 0x0000c609, 0x40 },
+	{ 0x0000c046, 0xf7 },
+	{ 0x0000c045, 0xff },
+	{ 0x0000c044, 0xff },
+	{ 0x0000c043, 0xff },
+	{ 0x0000c042, 0xff },
+	{ 0x0000c041, 0xff },
+	{ 0x0000c040, 0xff },
+	{ 0x0000c049, 0xff },
+	{ 0x0000c028, 0x3f },
+	{ 0x0000c020, 0x3f },
+	{ 0x0000c032, 0x13 },
+	{ 0x0000c033, 0x01 },
+	{ 0x0000cc10, 0x01 },
+	{ 0x0000dc20, 0x03 },
+	{ 0x0000de03, 0x05 },
+	{ 0x0000dc00, 0x00 },
+	{ 0x0000c700, 0xf0 },
+	{ 0x0000c701, 0x13 },
+	{ 0x0000c900, 0xc3 },
+	{ 0x0000c570, 0x08 },
+	{ 0x0000c086, 0x02 },
+	{ 0x0000c085, 0x7f },
+	{ 0x0000c084, 0x00 },
+	{ 0x0000c081, 0xff },
+	{ 0x0000f084, 0x0f },
+	{ 0x0000f083, 0xff },
+	{ 0x0000f082, 0xff },
+	{ 0x0000f081, 0xff },
+	{ 0x0000f080, 0xff },
+	{ 0x20003003, 0x3f },
+	{ 0x20005818, 0x81 },
+	{ 0x20009018, 0x81 },
+	{ 0x2000301c, 0x81 },
+	{ 0x0000c003, 0xc0 },
+	{ 0x0000c047, 0x80 },
+	{ 0x0000d541, 0x80 },
+	{ 0x0000d487, 0x0b },
+	{ 0x0000d487, 0x3b },
+	{ 0x0000d486, 0xc3 },
+	{ 0x0000d470, 0x89 },
+	{ 0x0000d471, 0x3a },
+	{ 0x0000d472, 0x1d },
+	{ 0x0000d478, 0xff },
+	{ 0x0000d479, 0x20 },
+	{ 0x0000d47a, 0x10 },
+	{ 0x0000d73c, 0xb7 },
+	{ 0x0000d73d, 0xd7 },
+	{ 0x0000d73e, 0x00 },
+	{ 0x0000d73f, 0x10 },
+	{ 0x3fc2dfc3, 0x00 },
+	{ 0x3fc2dfc2, 0x00 },
+	{ 0x3fc2dfc1, 0x00 },
+	{ 0x3fc2dfc0, 0x07 },
+	{ 0x3fc2dfc7, 0x00 },
+	{ 0x3fc2dfc6, 0x00 },
+	{ 0x3fc2dfc5, 0x00 },
+	{ 0x3fc2dfc4, 0x01 },
+	{ 0x3fc2df83, 0x00 },
+	{ 0x3fc2df82, 0x00 },
+	{ 0x3fc2df81, 0x00 },
+	{ 0x3fc2df80, 0x00 },
+	{ 0x0000d541, 0x40 },
+	{ 0x0000d486, 0x43 },
+	{ 0x1000db00, 0x03 },
+	{ 0x1000db01, 0x00 },
+	{ 0x1000db02, 0x10 },
+	{ 0x1000db03, 0x00 },
+	{ 0x1000db04, 0x00 },
+	{ 0x1000db05, 0x45 },
+	{ 0x1000db06, 0x12 },
+	{ 0x1000db07, 0x09 },
+	{ 0x1000db08, 0x00 },
+	{ 0x1000db09, 0x00 },
+	{ 0x1000db0a, 0x00 },
+	{ 0x1000db0b, 0x13 },
+	{ 0x1000db0c, 0x09 },
+	{ 0x1000db0d, 0x00 },
+	{ 0x1000db0e, 0x00 },
+	{ 0x1000db0f, 0x00 },
+	{ 0x0000d540, 0x21 },
+	{ 0x41000189, 0x00 },
+	{ 0x4100018a, 0x00 },
+	{ 0x41001988, 0x00 },
+	{ 0x41081400, 0x09 },
+	{ 0x40801508, 0x03 },
+	{ 0x40801588, 0x03 },
+	{ 0x40801809, 0x00 },
+	{ 0x4080180a, 0x00 },
+	{ 0x4080180b, 0x00 },
+	{ 0x4080180c, 0x00 },
+	{ 0x40801b09, 0x00 },
+	{ 0x40801b0a, 0x00 },
+	{ 0x40801b0b, 0x00 },
+	{ 0x40801b0c, 0x00 },
+	{ 0x0000d714, 0x17 },
+	{ 0x20009012, 0x00 },
+	{ 0x0000d471, 0x3b },
+	{ 0x0000dd0b, 0x0d },
+	{ 0x0000dd0a, 0xff },
+	{ 0x0000dd09, 0x0d },
+	{ 0x0000dd08, 0xff },
+	{ 0x0000d172, 0x2a },
+	{ 0x41001988, 0x03 },
+};
+
 static const struct reg_default rt1320_reg_defaults[] = {
 	{ SDW_SDCA_CTL(FUNC_NUM_MIC, RT1320_SDCA_ENT_PDE11, RT1320_SDCA_CTL_REQ_POWER_STATE, 0), 0x03 },
 	{ SDW_SDCA_CTL(FUNC_NUM_MIC, RT1320_SDCA_ENT_FU113, RT1320_SDCA_CTL_FU_MUTE, CH_01), 0x01 },
@@ -340,10 +496,19 @@ static bool rt1320_readable_register(struct device *dev, unsigned int reg)
 	case 0xf717 ... 0xf719:
 	case 0xf720 ... 0xf723:
 	case 0x1000cd91 ... 0x1000cd96:
+	case RT1321_PATCH_MAIN_VER ... RT1321_PATCH_BETA_VER:
 	case 0x1000f008:
 	case 0x1000f021:
+	case 0x2000300f:
+	case 0x2000301c:
+	case 0x2000900f:
+	case 0x20009018:
+	case 0x3fc29d80 ... 0x3fc29d83:
 	case 0x3fe2e000 ... 0x3fe2e003:
 	case 0x3fc2ab80 ... 0x3fc2abd4:
+	case 0x3fc2bfc0 ... 0x3fc2bfc8:
+	case 0x3fc2d300 ... 0x3fc2d354:
+	case 0x3fc2dfc0 ... 0x3fc2dfc8:
 	/* 0x40801508/0x40801809/0x4080180a/0x40801909/0x4080190a */
 	case SDW_SDCA_CTL(FUNC_NUM_MIC, RT1320_SDCA_ENT_PDE11, RT1320_SDCA_CTL_REQ_POWER_STATE, 0):
 	case SDW_SDCA_CTL(FUNC_NUM_MIC, RT1320_SDCA_ENT_FU113, RT1320_SDCA_CTL_FU_MUTE, CH_01):
@@ -394,6 +559,7 @@ static bool rt1320_volatile_register(struct device *dev, unsigned int reg)
 	case 0xc560:
 	case 0xc5b5 ... 0xc5b7:
 	case 0xc5fc ... 0xc5ff:
+	case 0xc680 ... 0xc683:
 	case 0xc820:
 	case 0xc900:
 	case 0xc920:
@@ -412,7 +578,7 @@ static bool rt1320_volatile_register(struct device *dev, unsigned int reg)
 	case 0xd4e5 ... 0xd4e6:
 	case 0xd4e8 ... 0xd4ff:
 	case 0xd530:
-	case 0xd540:
+	case 0xd540 ... 0xd541:
 	case 0xd543:
 	case 0xdb58 ... 0xdb5f:
 	case 0xdb60 ... 0xdb63:
@@ -429,13 +595,20 @@ static bool rt1320_volatile_register(struct device *dev, unsigned int reg)
 	case 0xf01e:
 	case 0xf717 ... 0xf719:
 	case 0xf720 ... 0xf723:
-	case 0x10000000 ... 0x10007fff:
+	case 0x10000000 ... 0x10008fff:
 	case 0x1000c000 ... 0x1000dfff:
 	case 0x1000f008:
 	case 0x1000f021:
+	case 0x2000300f:
+	case 0x2000301c:
+	case 0x2000900f:
+	case 0x20009018:
 	case 0x3fc2ab80 ... 0x3fc2abd4:
+	case 0x3fc2b780:
 	case 0x3fc2bf80 ... 0x3fc2bf83:
-	case 0x3fc2bfc0 ... 0x3fc2bfc7:
+	case 0x3fc2bfc0 ... 0x3fc2bfc8:
+	case 0x3fc2d300 ... 0x3fc2d354:
+	case 0x3fc2dfc0 ... 0x3fc2dfc8:
 	case 0x3fe2e000 ... 0x3fe2e003:
 	case SDW_SDCA_CTL(FUNC_NUM_MIC, RT1320_SDCA_ENT_PDE11, RT1320_SDCA_CTL_ACTUAL_POWER_STATE, 0):
 	case SDW_SDCA_CTL(FUNC_NUM_AMP, RT1320_SDCA_ENT0, RT1320_SDCA_CTL_FUNC_STATUS, 0):
@@ -560,7 +733,7 @@ static int rt1320_read_prop(struct sdw_slave *slave)
 static int rt1320_pde_transition_delay(struct rt1320_sdw_priv *rt1320, unsigned char func,
 	unsigned char entity, unsigned char ps)
 {
-	unsigned int delay = 1000, val;
+	unsigned int delay = 2000, val;
 
 	pm_runtime_mark_last_busy(&rt1320->sdw_slave->dev);
 
@@ -591,24 +764,41 @@ static void rt1320_load_mcu_patch(struct rt1320_sdw_priv *rt1320)
 	struct sdw_slave *slave = rt1320->sdw_slave;
 	const struct firmware *patch;
 	const char *filename;
-	unsigned int addr, val;
+	unsigned int addr, val, min_addr, max_addr;
 	const unsigned char *ptr;
 	int ret, i;
 
-	if (rt1320->version_id <= RT1320_VB)
-		filename = RT1320_VAB_MCU_PATCH;
-	else
-		filename = RT1320_VC_MCU_PATCH;
+	if (rt1320->dev_id == RT1320_DEV_ID) {
+		if (rt1320->version_id <= RT1320_VB)
+			filename = RT1320_VAB_MCU_PATCH;
+		else
+			filename = RT1320_VC_MCU_PATCH;
+		min_addr = 0x10007000;
+		max_addr = 0x10007fff;
+	} else if (rt1320->dev_id == RT1321_DEV_ID) {
+		filename = RT1321_VA_MCU_PATCH;
+		min_addr = 0x10008000;
+		max_addr = 0x10008fff;
+	} else {
+		dev_err(&slave->dev, "%s: Unknown device ID %d\n", __func__, rt1320->dev_id);
+		return;
+	}
 
 	/* load the patch code here */
 	ret = request_firmware(&patch, filename, &slave->dev);
 	if (ret) {
 		dev_err(&slave->dev, "%s: Failed to load %s firmware", __func__, filename);
 		regmap_write(rt1320->regmap, 0xc598, 0x00);
-		regmap_write(rt1320->regmap, 0x10007000, 0x67);
-		regmap_write(rt1320->regmap, 0x10007001, 0x80);
-		regmap_write(rt1320->regmap, 0x10007002, 0x00);
-		regmap_write(rt1320->regmap, 0x10007003, 0x00);
+		regmap_write(rt1320->regmap, min_addr, 0x67);
+		regmap_write(rt1320->regmap, min_addr + 0x1, 0x80);
+		regmap_write(rt1320->regmap, min_addr + 0x2, 0x00);
+		regmap_write(rt1320->regmap, min_addr + 0x3, 0x00);
+		if (rt1320->dev_id == RT1321_DEV_ID) {
+			regmap_write(rt1320->regmap, 0xd73c, 0x67);
+			regmap_write(rt1320->regmap, 0xd73d, 0x80);
+			regmap_write(rt1320->regmap, 0xd73e, 0x00);
+			regmap_write(rt1320->regmap, 0xd73f, 0x00);
+		}
 	} else {
 		ptr = (const unsigned char *)patch->data;
 		if ((patch->size % 8) == 0) {
@@ -618,7 +808,7 @@ static void rt1320_load_mcu_patch(struct rt1320_sdw_priv *rt1320)
 				val = (ptr[i + 4] & 0xff) | (ptr[i + 5] & 0xff) << 8 |
 					(ptr[i + 6] & 0xff) << 16 | (ptr[i + 7] & 0xff) << 24;
 
-				if (addr > 0x10007fff || addr < 0x10007000) {
+				if (addr > max_addr || addr < min_addr) {
 					dev_err(&slave->dev, "%s: the address 0x%x is wrong", __func__, addr);
 					goto _exit_;
 				}
@@ -688,6 +878,28 @@ static void rt1320_vc_preset(struct rt1320_sdw_priv *rt1320)
 	}
 }
 
+static void rt1321_preset(struct rt1320_sdw_priv *rt1320)
+{
+	unsigned int i, reg, val, delay;
+
+	for (i = 0; i < ARRAY_SIZE(rt1321_blind_write); i++) {
+		reg = rt1321_blind_write[i].reg;
+		val = rt1321_blind_write[i].def;
+		delay = rt1321_blind_write[i].delay_us;
+
+		if (reg == 0x3fc2dfc3)
+			rt1320_load_mcu_patch(rt1320);
+
+		regmap_write(rt1320->regmap, reg, val);
+
+		if (delay)
+			usleep_range(delay, delay + 1000);
+
+		if (reg == SDW_SDCA_CTL(FUNC_NUM_AMP, RT1320_SDCA_ENT_PDE23, RT1320_SDCA_CTL_REQ_POWER_STATE, 0))
+			rt1320_pde_transition_delay(rt1320, FUNC_NUM_AMP, RT1320_SDCA_ENT_PDE23, val);
+	}
+}
+
 static int rt1320_io_init(struct device *dev, struct sdw_slave *slave)
 {
 	struct rt1320_sdw_priv *rt1320 = dev_get_drvdata(dev);
@@ -714,6 +926,9 @@ static int rt1320_io_init(struct device *dev, struct sdw_slave *slave)
 	if (rt1320->version_id < 0) {
 		regmap_read(rt1320->regmap, RT1320_DEV_VERSION_ID_1, &val);
 		rt1320->version_id = val;
+		regmap_read(rt1320->regmap, RT1320_DEV_ID_0, &val);
+		regmap_read(rt1320->regmap, RT1320_DEV_ID_1, &tmp);
+		rt1320->dev_id = (val << 8) | tmp;
 	}
 
 	regmap_read(rt1320->regmap,
@@ -722,16 +937,21 @@ static int rt1320_io_init(struct device *dev, struct sdw_slave *slave)
 
 	/* initialization write */
 	if ((amp_func_status & FUNCTION_NEEDS_INITIALIZATION)) {
-		if (rt1320->version_id < RT1320_VC)
-			rt1320_vab_preset(rt1320);
+		if (rt1320->dev_id == RT1320_DEV_ID) {
+			if (rt1320->version_id < RT1320_VC)
+				rt1320_vab_preset(rt1320);
+			else
+				rt1320_vc_preset(rt1320);
+		} else if (rt1320->dev_id == RT1321_DEV_ID)
+			rt1321_preset(rt1320);
 		else
-			rt1320_vc_preset(rt1320);
+			dev_err(dev, "%s: Unknown device ID %d\n", __func__, rt1320->dev_id);
 
 		regmap_write(rt1320->regmap,
 			SDW_SDCA_CTL(FUNC_NUM_AMP, RT1320_SDCA_ENT0, RT1320_SDCA_CTL_FUNC_STATUS, 0),
 			FUNCTION_NEEDS_INITIALIZATION);
 	}
-	if (!rt1320->first_hw_init && rt1320->version_id == RT1320_VA) {
+	if (!rt1320->first_hw_init && rt1320->version_id == RT1320_VA && rt1320->dev_id == RT1320_DEV_ID) {
 		regmap_write(rt1320->regmap, SDW_SDCA_CTL(FUNC_NUM_AMP, RT1320_SDCA_ENT_PDE23,
 			RT1320_SDCA_CTL_REQ_POWER_STATE, 0), 0);
 		regmap_read(rt1320->regmap, RT1320_HIFI_VER_0, &val);
@@ -751,7 +971,7 @@ static int rt1320_io_init(struct device *dev, struct sdw_slave *slave)
 		regmap_write(rt1320->regmap, SDW_SDCA_CTL(FUNC_NUM_AMP, RT1320_SDCA_ENT_PDE23,
 			RT1320_SDCA_CTL_REQ_POWER_STATE, 0), 3);
 	}
-	dev_dbg(dev, "%s version_id=%d\n", __func__, rt1320->version_id);
+	dev_dbg(dev, "%s version_id=%d, dev_id=0x%x\n", __func__, rt1320->version_id, rt1320->dev_id);
 
 	if (rt1320->first_hw_init) {
 		regcache_cache_bypass(rt1320->regmap, false);
@@ -894,12 +1114,17 @@ static int rt1320_set_gain_put(struct snd_kcontrol *kcontrol,
 
 	/* check all channels */
 	for (i = 0; i < p->count; i++) {
-		if (i < 2) {
+		if (rt1320->dev_id == RT1320_DEV_ID) {
+			if (i < 2) {
+				reg_base = SDW_SDCA_CTL(FUNC_NUM_MIC, RT1320_SDCA_ENT_FU113, RT1320_SDCA_CTL_FU_VOLUME, CH_01);
+				regmap_read(rt1320->mbq_regmap, reg_base + i, &regvalue[i]);
+			} else {
+				reg_base = SDW_SDCA_CTL(FUNC_NUM_MIC, RT1320_SDCA_ENT_FU14, RT1320_SDCA_CTL_FU_VOLUME, CH_01);
+				regmap_read(rt1320->mbq_regmap, reg_base + i - 2, &regvalue[i]);
+			}
+		} else if (rt1320->dev_id == RT1321_DEV_ID) {
 			reg_base = SDW_SDCA_CTL(FUNC_NUM_MIC, RT1320_SDCA_ENT_FU113, RT1320_SDCA_CTL_FU_VOLUME, CH_01);
 			regmap_read(rt1320->mbq_regmap, reg_base + i, &regvalue[i]);
-		} else {
-			reg_base = SDW_SDCA_CTL(FUNC_NUM_MIC, RT1320_SDCA_ENT_FU14, RT1320_SDCA_CTL_FU_VOLUME, CH_01);
-			regmap_read(rt1320->mbq_regmap, reg_base + i - 2, &regvalue[i]);
 		}
 
 		gain_val[i] = ucontrol->value.integer.value[i];
@@ -916,12 +1141,17 @@ static int rt1320_set_gain_put(struct snd_kcontrol *kcontrol,
 		return 0;
 
 	for (i = 0; i < p->count; i++) {
-		if (i < 2) {
+		if (rt1320->dev_id == RT1320_DEV_ID) {
+			if (i < 2) {
+				reg_base = SDW_SDCA_CTL(FUNC_NUM_MIC, RT1320_SDCA_ENT_FU113, RT1320_SDCA_CTL_FU_VOLUME, CH_01);
+				err = regmap_write(rt1320->mbq_regmap, reg_base + i, gain_val[i]);
+			} else {
+				reg_base = SDW_SDCA_CTL(FUNC_NUM_MIC, RT1320_SDCA_ENT_FU14, RT1320_SDCA_CTL_FU_VOLUME, CH_01);
+				err = regmap_write(rt1320->mbq_regmap, reg_base + i - 2, gain_val[i]);
+			}
+		} else if (rt1320->dev_id == RT1321_DEV_ID) {
 			reg_base = SDW_SDCA_CTL(FUNC_NUM_MIC, RT1320_SDCA_ENT_FU113, RT1320_SDCA_CTL_FU_VOLUME, CH_01);
 			err = regmap_write(rt1320->mbq_regmap, reg_base + i, gain_val[i]);
-		} else {
-			reg_base = SDW_SDCA_CTL(FUNC_NUM_MIC, RT1320_SDCA_ENT_FU14, RT1320_SDCA_CTL_FU_VOLUME, CH_01);
-			err = regmap_write(rt1320->mbq_regmap, reg_base + i - 2, gain_val[i]);
 		}
 
 		if (err < 0)
@@ -966,12 +1196,17 @@ static int rt1320_set_gain_get(struct snd_kcontrol *kcontrol,
 
 	/* check all channels */
 	for (i = 0; i < p->count; i++) {
-		if (i < 2) {
+		if (rt1320->dev_id == RT1320_DEV_ID) {
+			if (i < 2) {
+				reg_base = SDW_SDCA_CTL(FUNC_NUM_MIC, RT1320_SDCA_ENT_FU113, RT1320_SDCA_CTL_FU_VOLUME, CH_01);
+				regmap_read(rt1320->mbq_regmap, reg_base + i, &regvalue);
+			} else {
+				reg_base = SDW_SDCA_CTL(FUNC_NUM_MIC, RT1320_SDCA_ENT_FU14, RT1320_SDCA_CTL_FU_VOLUME, CH_01);
+				regmap_read(rt1320->mbq_regmap, reg_base + i - 2, &regvalue);
+			}
+		} else if (rt1320->dev_id == RT1321_DEV_ID) {
 			reg_base = SDW_SDCA_CTL(FUNC_NUM_MIC, RT1320_SDCA_ENT_FU113, RT1320_SDCA_CTL_FU_VOLUME, CH_01);
 			regmap_read(rt1320->mbq_regmap, reg_base + i, &regvalue);
-		} else {
-			reg_base = SDW_SDCA_CTL(FUNC_NUM_MIC, RT1320_SDCA_ENT_FU14, RT1320_SDCA_CTL_FU_VOLUME, CH_01);
-			regmap_read(rt1320->mbq_regmap, reg_base + i - 2, &regvalue);
 		}
 
 		ctl = p->max - (((0x1e00 - regvalue) & 0xffff) / interval_offset);
@@ -988,15 +1223,23 @@ static int rt1320_set_fu_capture_ctl(struct rt1320_sdw_priv *rt1320)
 
 	for (i = 0; i < ARRAY_SIZE(rt1320->fu_mixer_mute); i++) {
 		ch_mute = (rt1320->fu_dapm_mute || rt1320->fu_mixer_mute[i]) ? 0x01 : 0x00;
-
-		if (i < 2)
+		if (rt1320->dev_id == RT1320_DEV_ID) {
+			if (i < 2)
+				err = regmap_write(rt1320->regmap,
+					SDW_SDCA_CTL(FUNC_NUM_MIC, RT1320_SDCA_ENT_FU113,
+						RT1320_SDCA_CTL_FU_MUTE, CH_01) + i, ch_mute);
+			else
+				err = regmap_write(rt1320->regmap,
+					SDW_SDCA_CTL(FUNC_NUM_MIC, RT1320_SDCA_ENT_FU14,
+						RT1320_SDCA_CTL_FU_MUTE, CH_01) + i - 2, ch_mute);
+		} else if (rt1320->dev_id == RT1321_DEV_ID) {
 			err = regmap_write(rt1320->regmap,
 				SDW_SDCA_CTL(FUNC_NUM_MIC, RT1320_SDCA_ENT_FU113,
 					RT1320_SDCA_CTL_FU_MUTE, CH_01) + i, ch_mute);
-		else
-			err = regmap_write(rt1320->regmap,
-				SDW_SDCA_CTL(FUNC_NUM_MIC, RT1320_SDCA_ENT_FU14,
-					RT1320_SDCA_CTL_FU_MUTE, CH_01) + i - 2, ch_mute);
+		} else {
+			dev_err(&rt1320->sdw_slave->dev, "%s: Unknown device ID %d\n", __func__, rt1320->dev_id);
+			return -EINVAL;
+		}
 		if (err < 0)
 			return err;
 	}
@@ -1217,10 +1460,16 @@ static int rt1320_sdw_hw_params(struct snd_pcm_substream *substream,
 		if (dai->id == RT1320_AIF1)
 			port_config.num = 4;
 		else if (dai->id == RT1320_AIF2) {
-			dmic_port_config[0].ch_mask = BIT(0) | BIT(1);
-			dmic_port_config[0].num = 8;
-			dmic_port_config[1].ch_mask = BIT(0) | BIT(1);
-			dmic_port_config[1].num = 10;
+			if (rt1320->dev_id == RT1320_DEV_ID) {
+				dmic_port_config[0].ch_mask = BIT(0) | BIT(1);
+				dmic_port_config[0].num = 8;
+				dmic_port_config[1].ch_mask = BIT(0) | BIT(1);
+				dmic_port_config[1].num = 10;
+			} else if (rt1320->dev_id == RT1321_DEV_ID) {
+				dmic_port_config[0].ch_mask = BIT(0) | BIT(1);
+				dmic_port_config[0].num = 8;
+			} else
+				return -EINVAL;
 		} else
 			return -EINVAL;
 	}
@@ -1229,8 +1478,14 @@ static int rt1320_sdw_hw_params(struct snd_pcm_substream *substream,
 		retval = sdw_stream_add_slave(rt1320->sdw_slave, &stream_config,
 				&port_config, 1, sdw_stream);
 	else if (dai->id == RT1320_AIF2)
-		retval = sdw_stream_add_slave(rt1320->sdw_slave, &stream_config,
+		if (rt1320->dev_id == RT1320_DEV_ID)
+			retval = sdw_stream_add_slave(rt1320->sdw_slave, &stream_config,
 				dmic_port_config, 2, sdw_stream);
+		else if (rt1320->dev_id == RT1321_DEV_ID)
+			retval = sdw_stream_add_slave(rt1320->sdw_slave, &stream_config,
+				dmic_port_config, 1, sdw_stream);
+		else
+			return -EINVAL;
 	else
 		return -EINVAL;
 	if (retval) {
@@ -1273,9 +1528,11 @@ static int rt1320_sdw_hw_params(struct snd_pcm_substream *substream,
 		regmap_write(rt1320->regmap,
 			SDW_SDCA_CTL(FUNC_NUM_MIC, RT1320_SDCA_ENT_CS113, RT1320_SDCA_CTL_SAMPLE_FREQ_INDEX, 0),
 			sampling_rate);
-		regmap_write(rt1320->regmap,
-			SDW_SDCA_CTL(FUNC_NUM_MIC, RT1320_SDCA_ENT_CS14, RT1320_SDCA_CTL_SAMPLE_FREQ_INDEX, 0),
-			sampling_rate);
+
+		if (rt1320->dev_id == RT1320_DEV_ID)
+			regmap_write(rt1320->regmap,
+				SDW_SDCA_CTL(FUNC_NUM_MIC, RT1320_SDCA_ENT_CS14, RT1320_SDCA_CTL_SAMPLE_FREQ_INDEX, 0),
+				sampling_rate);
 	}
 
 	return 0;
@@ -1469,6 +1726,7 @@ static int rt1320_sdw_remove(struct sdw_slave *slave)
 static const struct sdw_device_id rt1320_id[] = {
 	SDW_SLAVE_ENTRY_EXT(0x025d, 0x1320, 0x3, 0x0, 0),
 	SDW_SLAVE_ENTRY_EXT(0x025d, 0x1320, 0x3, 0x1, 0),
+	SDW_SLAVE_ENTRY_EXT(0x025d, 0x1321, 0x3, 0x1, 0),
 	{},
 };
 MODULE_DEVICE_TABLE(sdw, rt1320_id);
diff --git a/sound/soc/codecs/rt1320-sdw.h b/sound/soc/codecs/rt1320-sdw.h
index 23b321aee6a9..a6d90e259dc9 100644
--- a/sound/soc/codecs/rt1320-sdw.h
+++ b/sound/soc/codecs/rt1320-sdw.h
@@ -14,8 +14,16 @@
 #include <linux/soundwire/sdw_registers.h>
 #include <sound/soc.h>
 
+#define RT1320_DEV_ID 0x6981
+#define RT1321_DEV_ID 0x7045
+
 /* imp-defined registers */
 #define RT1320_DEV_VERSION_ID_1 0xc404
+#define RT1320_DEV_ID_1 0xc405
+#define RT1320_DEV_ID_0 0xc406
+
+#define RT1321_PATCH_MAIN_VER 0x1000cffe
+#define RT1321_PATCH_BETA_VER 0x1000cfff
 
 #define RT1320_KR0_STATUS_CNT 0x1000f008
 #define RT1320_KR0_INT_READY 0x1000f021
@@ -86,6 +94,7 @@ enum rt1320_version_id {
 #define RT1320_VER_B_ID 0x07392238
 #define RT1320_VAB_MCU_PATCH "realtek/rt1320/rt1320-patch-code-vab.bin"
 #define RT1320_VC_MCU_PATCH "realtek/rt1320/rt1320-patch-code-vc.bin"
+#define RT1321_VA_MCU_PATCH "realtek/rt1320/rt1321-patch-code-va.bin"
 
 struct rt1320_sdw_priv {
 	struct snd_soc_component *component;
@@ -96,6 +105,7 @@ struct rt1320_sdw_priv {
 	bool hw_init;
 	bool first_hw_init;
 	int version_id;
+	unsigned int dev_id;
 	bool fu_dapm_mute;
 	bool fu_mixer_mute[4];
 };
-- 
2.34.1

