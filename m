Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 139173568EE
	for <linux-sound@vger.kernel.org>; Thu, 11 Sep 2025 15:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757606285; cv=none; b=FfZQgGYuKQT5O3pLybLX2Y5OQdthyikbI6RKk0rTRMTX4YNR2gRVuVGVVIepOuqSeisCRhQOwI8znF7sLbIKgyUcAAIf3M/KCdURQRH6Nklbofv5/jqQDBK5OegSja18NxSlPgdXVE69g7g5zqzeY4Vrcpp/3nCKrCSQuynZZaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757606285; c=relaxed/simple;
	bh=8/GHwW0Y+9Y9IUnpL17+yW/RmJwF9R/KShC0xllh8j8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZdP5OnAYkuf/zZ1wMM+yhFB0SriNusGW/6DNmvkBN9/tJCl18KAP4pR2bJHCVQsPITJVnlQwdxUQPzfiAiwFgUSKAfTSGJgqtaqOJhe5gGs7P6YcCxehMXz92nJFuD030CaIlUZ9K3bHB41Z+nwLWRxJXAa/80yU7iaorZFa2CM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=YrT822yf; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="YrT822yf"
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58BFvmF0411232;
	Thu, 11 Sep 2025 10:57:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757606268;
	bh=jCb4v09bPw1MiUGH9n/tMfZEizxwD5WJUekIe7nnIvw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=YrT822yfU14d2opTt/QSR/e1bWC6oHIF1yAssq9t2usVkAEmfW1cYQTODYRuQXU/y
	 EL4ye+YTiFEam8f/11kfHUGWCyH5FZ+SamQc6ESYGhA6/5oVw9S4JC7gCFConJMUM4
	 EGh6xWoQhnMAQopHfWeQJ5a8FtwH8HxrKSw8SMKc=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58BFvlV41268495
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 11 Sep 2025 10:57:48 -0500
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 11
 Sep 2025 10:57:47 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 11 Sep 2025 10:57:47 -0500
Received: from LTPW0EX92E.dhcp.ti.com (ltpw0ex92e.dhcp.ti.com [10.82.30.14])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58BFvFFM2366393;
	Thu, 11 Sep 2025 10:57:42 -0500
From: Niranjan H Y <niranjan.hy@ti.com>
To: <alsa-devel@alsa-project.org>
CC: <linux-sound@vger.kernel.org>, <lgirdwood@gmail.com>, <broonie@kernel.org>,
        <perex@perex.cz>, <tiwai@suse.com>, <yung-chuan.liao@linux.intel.com>,
        <cezary.rojewski@intel.com>, <peter.ujfalusi@linux.intel.com>,
        <ranjani.sridharan@linux.intel.com>, <kai.vehmanen@linux.intel.com>,
        <pierre-louis.bossart@linux.dev>, <navada@ti.com>,
        <shenghao-ding@ti.com>, <v-hampiholi@ti.com>, <baojun.xu@ti.com>,
        Niranjan H Y <niranjan.hy@ti.com>
Subject: [PATCH v4 5/6] ASoc: tas2783A: add machine driver changes
Date: Thu, 11 Sep 2025 21:27:02 +0530
Message-ID: <20250911155704.2236-5-niranjan.hy@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
In-Reply-To: <20250911155704.2236-1-niranjan.hy@ti.com>
References: <20250911155704.2236-1-niranjan.hy@ti.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Add tas2783-codec for codec_info

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
---
 sound/soc/sdw_utils/soc_sdw_utils.c | 38 +++++++++++++++++++++--------
 1 file changed, 28 insertions(+), 10 deletions(-)

diff --git a/sound/soc/sdw_utils/soc_sdw_utils.c b/sound/soc/sdw_utils/soc_sdw_utils.c
index 1580331cd..56c72ef27 100644
--- a/sound/soc/sdw_utils/soc_sdw_utils.c
+++ b/sound/soc/sdw_utils/soc_sdw_utils.c
@@ -35,12 +35,12 @@ static const struct snd_kcontrol_new generic_spk_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Speaker"),
 };
 
-static const struct snd_soc_dapm_widget maxim_widgets[] = {
+static const struct snd_soc_dapm_widget lr_spk_widgets[] = {
 	SND_SOC_DAPM_SPK("Left Spk", NULL),
 	SND_SOC_DAPM_SPK("Right Spk", NULL),
 };
 
-static const struct snd_kcontrol_new maxim_controls[] = {
+static const struct snd_kcontrol_new lr_spk_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Left Spk"),
 	SOC_DAPM_PIN_SWITCH("Right Spk"),
 };
@@ -58,6 +58,24 @@ static const struct snd_kcontrol_new rt700_controls[] = {
 };
 
 struct asoc_sdw_codec_info codec_info_list[] = {
+	{
+		.part_id = 0x0000, /* TAS2783A */
+		.dais = {
+			{
+				.direction = {true, true},
+				.dai_name = "tas2783-codec",
+				.dai_type = SOC_SDW_DAI_TYPE_AMP,
+				.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_AMP_IN_DAI_ID},
+				.init = asoc_sdw_ti_amp_init,
+				.rtd_init = asoc_sdw_ti_spk_rtd_init,
+				.controls = lr_spk_controls,
+				.num_controls = ARRAY_SIZE(lr_spk_controls),
+				.widgets = lr_spk_widgets,
+				.num_widgets = ARRAY_SIZE(lr_spk_widgets),
+			},
+		},
+		.dai_num = 1,
+	},
 	{
 		.part_id = 0x700,
 		.dais = {
@@ -450,10 +468,10 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 				.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_AMP_IN_DAI_ID},
 				.init = asoc_sdw_maxim_init,
 				.rtd_init = asoc_sdw_maxim_spk_rtd_init,
-				.controls = maxim_controls,
-				.num_controls = ARRAY_SIZE(maxim_controls),
-				.widgets = maxim_widgets,
-				.num_widgets = ARRAY_SIZE(maxim_widgets),
+				.controls = lr_spk_controls,
+				.num_controls = ARRAY_SIZE(lr_spk_controls),
+				.widgets = lr_spk_widgets,
+				.num_widgets = ARRAY_SIZE(lr_spk_widgets),
 			},
 		},
 		.dai_num = 1,
@@ -469,10 +487,10 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 				.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_UNUSED_DAI_ID},
 				.init = asoc_sdw_maxim_init,
 				.rtd_init = asoc_sdw_maxim_spk_rtd_init,
-				.controls = maxim_controls,
-				.num_controls = ARRAY_SIZE(maxim_controls),
-				.widgets = maxim_widgets,
-				.num_widgets = ARRAY_SIZE(maxim_widgets),
+				.controls = lr_spk_controls,
+				.num_controls = ARRAY_SIZE(lr_spk_controls),
+				.widgets = lr_spk_widgets,
+				.num_widgets = ARRAY_SIZE(lr_spk_widgets),
 			},
 		},
 		.dai_num = 1,
-- 
2.45.2

