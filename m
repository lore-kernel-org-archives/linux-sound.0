Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 987C02ED842;
	Thu, 26 Jun 2025 18:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750961668; cv=none; b=WWnXlHO2jca7lC9bSFVS2Dyja8LPhcdSUh1e4DeE94tGC9FS5LiEmI5z76fjgF4X4/K2YokBW5ixRoM2+eJARDUVLgogI27ijy4hhS4PP93nIe4odb+RPNqd4hGOY2vc6v5XZjUWDg1SXkErxzqfgkEvouEEVXr/aa5JsANqkSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750961668; c=relaxed/simple;
	bh=0/SIVN/Jra/dhih8+orDjkflgSjw0ilgmUmV8Cu4D90=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=In0ZScNETvj1+XHYHRHcPhDxDba7Wo+QNwar1RLJKTuPuoQpgBSRwpWJnH2KO3yxbr1awZjQxEzLjDcchR09rmJUAVd8lftUFygli6gpo5PnR7h0qav6sEvyugKB9glLLtRvXfjJ+up6btKPrNMpPpkJ+Hke2M7z2aGVJLooEso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=gJE2jZxm; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="gJE2jZxm"
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55QIEGUo2501799;
	Thu, 26 Jun 2025 13:14:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750961656;
	bh=b4mseCcw+xyQ5JfvmJ9eWBu3vbT/W32xs7Zo/wABf+k=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=gJE2jZxmd2pTQhg+WNRpIfQN7LBEP5y05l9YHSRElpL5uzu2RrBACMgTz0E2fu31m
	 pkAk4G0jHArlSVss9W80r+sRl+937a5PwvtqsxD3qH8Tb7LIk+0w7B+gG1XwLlj8RS
	 tKENm1ECfobGaR86SOY0GB8ryAi8Y2WQg7PSgErc=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55QIEGiO3851214
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 26 Jun 2025 13:14:16 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 26
 Jun 2025 13:14:15 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 26 Jun 2025 13:14:16 -0500
Received: from LTPW0EX92E.dhcp.ti.com ([10.249.133.122])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55QIDr691713573;
	Thu, 26 Jun 2025 13:14:11 -0500
From: Niranjan H Y <niranjan.hy@ti.com>
To: <broonie@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <andriy.shevchenko@linux.intel.com>, <tiwai@suse.de>,
        <alsa-devel@alsa-project.org>, <baojun.xu@ti.com>,
        <shenghao-ding@ti.com>, <liam.r.girdwood@intel.com>,
        <lgirdwood@gmail.com>, <robh@kernel.org>,
        <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <navada@ti.com>, <v-hampiholi@ti.com>, <niranjan.hy@ti.com>
Subject: [PATCH v3 3/4] Asoc: pcm6240: remove support for taac5x1x family
Date: Thu, 26 Jun 2025 23:43:32 +0530
Message-ID: <20250626181334.1200-4-niranjan.hy@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
In-Reply-To: <20250626181334.1200-1-niranjan.hy@ti.com>
References: <20250626181334.1200-1-niranjan.hy@ti.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

tac5x1x codec driver suporrts tac5x1x family which includes
the following ADCs and DACs. So removed the duplicate entries
in the pcm6240 i2c driver.

Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>

---
v3:
- remove unused code
---
 sound/soc/codecs/pcm6240.c | 126 +------------------------------------
 sound/soc/codecs/pcm6240.h |   4 --
 2 files changed, 3 insertions(+), 127 deletions(-)

diff --git a/sound/soc/codecs/pcm6240.c b/sound/soc/codecs/pcm6240.c
index 75af12231d1d..535c3f727e06 100644
--- a/sound/soc/codecs/pcm6240.c
+++ b/sound/soc/codecs/pcm6240.c
@@ -44,10 +44,6 @@ static const struct i2c_device_id pcmdevice_i2c_id[] = {
 	{ "pcmd3140", PCMD3140 },
 	{ "pcmd3180", PCMD3180 },
 	{ "pcmd512x", PCMD512X },
-	{ "taa5212",  TAA5212  },
-	{ "taa5412",  TAA5412  },
-	{ "tad5212",  TAD5212  },
-	{ "tad5412",  TAD5412  },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, pcmdevice_i2c_id);
@@ -442,60 +438,6 @@ static const struct pcmdevice_mixer_control pcmd3180_fine_gain_ctl[] = {
 	}
 };
 
-static const struct pcmdevice_mixer_control taa5412_digi_vol_ctl[] = {
-	{
-		.shift = 0,
-		.reg = TAA5412_REG_CH1_DIGITAL_VOLUME,
-		.max = 0xff,
-		.invert = 0,
-	},
-	{
-		.shift = 0,
-		.reg = TAA5412_REG_CH2_DIGITAL_VOLUME,
-		.max = 0xff,
-		.invert = 0,
-	},
-	{
-		.shift = 0,
-		.reg = TAA5412_REG_CH3_DIGITAL_VOLUME,
-		.max = 0xff,
-		.invert = 0,
-	},
-	{
-		.shift = 0,
-		.reg = TAA5412_REG_CH4_DIGITAL_VOLUME,
-		.max = 0xff,
-		.invert = 0,
-	}
-};
-
-static const struct pcmdevice_mixer_control taa5412_fine_gain_ctl[] = {
-	{
-		.shift = 4,
-		.reg = TAA5412_REG_CH1_FINE_GAIN,
-		.max = 0xf,
-		.invert = 0,
-	},
-	{
-		.shift = 4,
-		.reg = TAA5412_REG_CH2_FINE_GAIN,
-		.max = 0xf,
-		.invert = 0,
-	},
-	{
-		.shift = 4,
-		.reg = TAA5412_REG_CH3_FINE_GAIN,
-		.max = 0xf,
-		.invert = 4,
-	},
-	{
-		.shift = 0,
-		.reg = TAA5412_REG_CH4_FINE_GAIN,
-		.max = 0xf,
-		.invert = 4,
-	}
-};
-
 static const DECLARE_TLV_DB_MINMAX_MUTE(pcmd3140_dig_gain_tlv,
 	-10000, 2700);
 static const DECLARE_TLV_DB_MINMAX_MUTE(pcm1690_fine_dig_gain_tlv,
@@ -510,9 +452,7 @@ static const DECLARE_TLV_DB_LINEAR(adc5120_chgain_tlv, 0, 4200);
 static const DECLARE_TLV_DB_MINMAX_MUTE(pcm6260_fgain_tlv,
 	-10000, 2700);
 static const DECLARE_TLV_DB_LINEAR(pcm6260_chgain_tlv, 0, 4200);
-static const DECLARE_TLV_DB_MINMAX_MUTE(taa5412_dig_vol_tlv,
-	-8050, 4700);
-static const DECLARE_TLV_DB_LINEAR(taa5412_fine_gain_tlv,
+static const DECLARE_TLV_DB_LINEAR(pcmd31x0_fine_gain_tlv,
 	-80, 70);
 
 static int pcmdev_change_dev(struct pcmdevice_priv *pcm_priv,
@@ -981,7 +921,7 @@ static const struct pcmdev_ctrl_info pcmdev_gain_ctl_info[][2] = {
 	// PCMD3140
 	{
 		{
-			.gain = taa5412_fine_gain_tlv,
+			.gain = pcmd31x0_fine_gain_tlv,
 			.pcmdev_ctrl = pcmd3140_fine_gain_ctl,
 			.ctrl_array_size = ARRAY_SIZE(pcmd3140_fine_gain_ctl),
 			.get = pcmdevice_get_volsw,
@@ -1000,7 +940,7 @@ static const struct pcmdev_ctrl_info pcmdev_gain_ctl_info[][2] = {
 	// PCMD3180
 	{
 		{
-			.gain = taa5412_fine_gain_tlv,
+			.gain = pcmd31x0_fine_gain_tlv,
 			.pcmdev_ctrl = pcmd3180_fine_gain_ctl,
 			.ctrl_array_size = ARRAY_SIZE(pcmd3180_fine_gain_ctl),
 			.get = pcmdevice_get_volsw,
@@ -1025,62 +965,6 @@ static const struct pcmdev_ctrl_info pcmdev_gain_ctl_info[][2] = {
 			.ctrl_array_size = 0,
 		},
 	},
-	// TAA5212
-	{
-		{
-			.gain = taa5412_fine_gain_tlv,
-			.pcmdev_ctrl = taa5412_fine_gain_ctl,
-			.ctrl_array_size = ARRAY_SIZE(taa5412_fine_gain_ctl),
-			.get = pcmdevice_get_volsw,
-			.put = pcmdevice_put_volsw,
-			.pcmdev_ctrl_name_id = 2,
-		},
-		{
-			.gain = taa5412_dig_vol_tlv,
-			.pcmdev_ctrl = taa5412_digi_vol_ctl,
-			.ctrl_array_size = ARRAY_SIZE(taa5412_digi_vol_ctl),
-			.get = pcmdevice_get_volsw,
-			.put = pcmdevice_put_volsw,
-			.pcmdev_ctrl_name_id = 1,
-		},
-	},
-	// TAA5412
-	{
-		{
-			.gain = taa5412_fine_gain_tlv,
-			.pcmdev_ctrl = taa5412_fine_gain_ctl,
-			.ctrl_array_size = ARRAY_SIZE(taa5412_fine_gain_ctl),
-			.get = pcmdevice_get_volsw,
-			.put = pcmdevice_put_volsw,
-			.pcmdev_ctrl_name_id = 2,
-		},
-		{
-			.gain = taa5412_dig_vol_tlv,
-			.pcmdev_ctrl = taa5412_digi_vol_ctl,
-			.ctrl_array_size = ARRAY_SIZE(taa5412_digi_vol_ctl),
-			.get = pcmdevice_get_volsw,
-			.put = pcmdevice_put_volsw,
-			.pcmdev_ctrl_name_id = 1,
-		},
-	},
-	// TAD5212
-	{
-		{
-			.ctrl_array_size = 0,
-		},
-		{
-			.ctrl_array_size = 0,
-		},
-	},
-	// TAD5412
-	{
-		{
-			.ctrl_array_size = 0,
-		},
-		{
-			.ctrl_array_size = 0,
-		},
-	},
 };
 
 static int pcmdev_dev_bulk_write(struct pcmdevice_priv *pcm_dev,
@@ -2002,10 +1886,6 @@ static const struct of_device_id pcmdevice_of_match[] = {
 	{ .compatible = "ti,pcmd3140" },
 	{ .compatible = "ti,pcmd3180" },
 	{ .compatible = "ti,pcmd512x" },
-	{ .compatible = "ti,taa5212"  },
-	{ .compatible = "ti,taa5412"  },
-	{ .compatible = "ti,tad5212"  },
-	{ .compatible = "ti,tad5412"  },
 	{},
 };
 MODULE_DEVICE_TABLE(of, pcmdevice_of_match);
diff --git a/sound/soc/codecs/pcm6240.h b/sound/soc/codecs/pcm6240.h
index 2d8f9e798139..86b1ef734a3d 100644
--- a/sound/soc/codecs/pcm6240.h
+++ b/sound/soc/codecs/pcm6240.h
@@ -33,10 +33,6 @@ enum pcm_device {
 	PCMD3140,
 	PCMD3180,
 	PCMD512X,
-	TAA5212,
-	TAA5412,
-	TAD5212,
-	TAD5412,
 	MAX_DEVICE,
 };
 
-- 
2.45.2

