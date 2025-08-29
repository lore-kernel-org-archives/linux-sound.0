Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33F8E25F984
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 06:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756450410; cv=none; b=HZuIEvdhN38QmnY5aJsjaLCilUROY5yoVCV0I4ehqfiBq3T8XdypFlLfHUV41IfYZWWaGPgJe3TaCGZwe4XTaf8i31Hc9CCttZCo/vSk06TR+FU8FUBr9GsdZAAQoozUbsKS3Xp/7pK5jrl3kzumetJ3NUzVctu1qV99KNLy6Lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756450410; c=relaxed/simple;
	bh=e00XLVJ5jqwQr4bPtmGvi7P0csnwXHl1gha/55dWe6c=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cS1Mvr9b3OE/d6q0X+ivFQ/Rp2pZQJpy9f9b7EN6D/NOckGmR2Se4wx6nqajcAlhjuVUJGVjLdxCZWX98xVsSQfXHGvHxzNuncg8PZ8bgiwnTeVSgNAjN0jKvQ7K65yFWZo8pY3ebJHHfinK9l9zdC7eLoVzcLKWQa7AAHdW/EI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=fJbleU4D; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="fJbleU4D"
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57T6rEmx1694404;
	Fri, 29 Aug 2025 01:53:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756450394;
	bh=jFagQeh4oj2HpTJYvNMi3aqmCSl0lIsdzOcVD8jyMms=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=fJbleU4Dd1bQNN5MORkGimmwQRObCdU8cwEVX4whxqc98uwkAM4G/EN4SBzXAIqNE
	 F5wxxj0qvth6K7fHUb1OyAApXFPryfZ7tqln3DI1vbGr8zwcokKf+U8TpPl9+ybLVZ
	 nqh/df3y2ZirO4ZDKaeBzKzf2I7XKyhOEbViIdqc=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57T6rED6355125
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 29 Aug 2025 01:53:14 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 29
 Aug 2025 01:53:13 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 29 Aug 2025 01:53:13 -0500
Received: from LTPW0EX92E.dhcp.ti.com (ltpw0ex92e.dhcp.ti.com [10.82.30.14])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57T6qq5u1653389;
	Fri, 29 Aug 2025 01:53:09 -0500
From: Niranjan H Y <niranjan.hy@ti.com>
To: <linux-sound@vger.kernel.org>
CC: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
        <tiwai@suse.com>, <yung-chuan.liao@linux.intel.com>,
        <cezary.rojewski@intel.com>, <peter.ujfalusi@linux.intel.com>,
        <ranjani.sridharan@linux.intel.com>, <kai.vehmanen@linux.intel.com>,
        <pierre-louis.bossart@linux.dev>, <navada@ti.com>,
        <shenghao-ding@ti.com>, <v-hampiholi@ti.com>, <baojun.xu@ti.com>,
        Niranjan H Y <niranjan.hy@ti.com>
Subject: [PATCH v1 3/4] ASoc: tas2783A: add machine driver changes
Date: Fri, 29 Aug 2025 12:22:05 +0530
Message-ID: <20250829065206.1631-3-niranjan.hy@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
In-Reply-To: <20250829065206.1631-1-niranjan.hy@ti.com>
References: <20250829065206.1631-1-niranjan.hy@ti.com>
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

Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
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
2.25.1

