Received: from r3-78.sinamail.sina.com.cn (r3-78.sinamail.sina.com.cn [202.108.3.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D01E95477E
	for <linux-sound@vger.kernel.org>; Wed, 13 May 2026 03:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778642174; cv=none; b=HchxuIOTVdcV12ZwAVac2EL4Oj3I3NqSImLuuxNM6W+ucbTkqbEYTWuGq94nqNz8O33l5E8hPu3nqggUgEo0xZn+xeKH2bDx/c1jqAogTpjg+rDdKjsMY7+evbPKpZRK8nG7NZuMqhhkmyAqguS4TmNuIEzeGKq6BNuLx/88SOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778642174; c=relaxed/simple;
	bh=J3dF0L8R8MsfHZuyTrFEnbTtlyw1WbNtHce97T38ig0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=cS86h/VWprLZ7mvi1K0xvC0zukLeoSlfN2OwtbALUQ5EYBYmlUcgYbj0C5nWe/DtS5IK63PcOVHfQ+N2k18HzuBNbpBrfnLQ2mdhz4PQOl6S25jOwLOotPINdsYF9CUxQVl6h/nKmigr73idWaUwYdHVCDiSfA1whqtJVk5nZK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=202.108.3.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([58.38.107.94])
	by sina.net (10.54.253.37) with ESMTP
	id 6A03ECEF00004B68; Wed, 13 May 2026 11:16:01 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: C8C4F6DE21DE45FA80EC17B2C0AC9A06
X-SMAIL-UIID: C8C4F6DE21DE45FA80EC17B2C0AC9A06-20260513-111601
From: Zhang Yi <zhangyi@everest-semi.com>
To: broonie@kernel.org,
	tiwai@suse.com,
	linux-sound@vger.kernel.org
Cc: peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ckeepax@opensource.cirrus.com,
	vkoul@kernel.org,
	Zhang Yi <zhangyi@everest-semi.com>
Subject: [PATCH v14 2/6] ASoC: sdw_utils: add ES9356 in codec_info_list
Date: Wed, 13 May 2026 11:15:50 +0800
Message-Id: <20260513031554.5422-3-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260513031554.5422-1-zhangyi@everest-semi.com>
References: <20260513031554.5422-1-zhangyi@everest-semi.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

Add ES9356 in codec_info_list

Signed-off-by: Zhang Yi <zhangyi@everest-semi.com>
---
 sound/soc/sdw_utils/soc_sdw_utils.c | 50 +++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/sound/soc/sdw_utils/soc_sdw_utils.c b/sound/soc/sdw_utils/soc_sdw_utils.c
index 85291bfb5..5bb9b6972 100644
--- a/sound/soc/sdw_utils/soc_sdw_utils.c
+++ b/sound/soc/sdw_utils/soc_sdw_utils.c
@@ -1090,6 +1090,56 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 		},
 		.aux_num = 1,
 	},
+	{
+		.vendor_id = 0x04b3,
+		.part_id = 0x9356,
+		.name_prefix = "es9356",
+		.version_id = 3,
+		.dais = {
+			{
+				.direction = {true, false},
+				.dai_name = "es9356-sdp-aif1",
+				.dai_type = SOC_SDW_DAI_TYPE_JACK,
+				.dailink = {SOC_SDW_JACK_OUT_DAI_ID, SOC_SDW_UNUSED_DAI_ID},
+				.init = asoc_sdw_es9356_init,
+				.exit = asoc_sdw_es9356_exit,
+				.rtd_init = asoc_sdw_es9356_rtd_init,
+				.controls = generic_jack_controls,
+				.num_controls = ARRAY_SIZE(generic_jack_controls),
+				.widgets = generic_jack_widgets,
+				.num_widgets = ARRAY_SIZE(generic_jack_widgets),
+			},
+			{
+				.direction = {false, true},
+				.dai_name = "es9356-sdp-aif4",
+				.dai_type = SOC_SDW_DAI_TYPE_MIC,
+				.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_DMIC_DAI_ID},
+				.rtd_init = asoc_sdw_es9356_dmic_rtd_init,
+				.widgets = generic_dmic_widgets,
+				.num_widgets = ARRAY_SIZE(generic_dmic_widgets),
+			},
+			{
+				.direction = {false, true},
+				.dai_name = "es9356-sdp-aif2",
+				.dai_type = SOC_SDW_DAI_TYPE_JACK,
+				.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_JACK_IN_DAI_ID},
+			},
+			{
+				.direction = {true, false},
+				.dai_name = "es9356-sdp-aif3",
+				.component_name = "es9356",
+				.dai_type = SOC_SDW_DAI_TYPE_AMP,
+				.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_UNUSED_DAI_ID},
+				.init = asoc_sdw_es9356_amp_init,
+				.rtd_init = asoc_sdw_es9356_spk_rtd_init,
+				.controls = generic_spk_controls,
+				.num_controls = ARRAY_SIZE(generic_spk_controls),
+				.widgets = generic_spk_widgets,
+				.num_widgets = ARRAY_SIZE(generic_spk_widgets),
+			},
+		},
+		.dai_num = 4,
+	},
 	{
 		.vendor_id = 0x0105,
 		.part_id = 0xaaaa, /* generic codec mockup */
-- 
2.17.1

