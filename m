Received: from r3-72.sinamail.sina.com.cn (r3-72.sinamail.sina.com.cn [202.108.3.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E80F24E4C4
	for <linux-sound@vger.kernel.org>; Tue,  7 Apr 2026 10:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775556220; cv=none; b=I9TrhCrkWsWXsX0taF/mgFX4LMG3CG9qMvDqgDrr188e8N0Qg0vOWASBD4c4GyyckZMv+jSPscCZeJwhFOX9ma4/NAufeqVH45z85BcrDcP6DIpNa0Gx+wlc3OeSe+mJy/jLZM/pD1XWe6zhfpi8E4u4Wlj60MLsv5A+lQ4XQYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775556220; c=relaxed/simple;
	bh=dtZ8/W39N3hmTDcDKtmDOQp0npQ9SBLiKkkWAQvr8yg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=tgH+JQUMgc++uM05P5EgT0BD4k9KryqE+PBYJ1qjTWGtonxFdKRxCes6yHmRJXI+K1jW6tjjKB2i7QbZV5AB1ZYu8/GMGbLHhSICUHI6nziOSnXdZXnr3uSOmkCrUc0IWbC3fb4e90+6yeH6+GDkE+XlJ+ZlJ5QAuh/RUDKtoLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=202.108.3.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([180.154.36.64])
	by sina.net (10.54.253.39) with ESMTP
	id 69D4D5E3000040FD; Tue, 7 Apr 2026 18:01:11 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 1C76C03E84D34EA7BF2E73DB445B5FE8
X-SMAIL-UIID: 1C76C03E84D34EA7BF2E73DB445B5FE8-20260407-180111
From: Zhang Yi <zhangyi@everest-semi.com>
To: broonie@kernel.org,
	tiwai@suse.com,
	linux-sound@vger.kernel.org
Cc: peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ckeepax@opensource.cirrus.com,
	Zhang Yi <zhangyi@everest-semi.com>
Subject: [PATCH v5 2/5] ASoC: sdw_utils: add ES9356 in codec_info_list
Date: Tue,  7 Apr 2026 18:01:02 +0800
Message-Id: <20260407100105.123041-3-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260407100105.123041-1-zhangyi@everest-semi.com>
References: <20260407100105.123041-1-zhangyi@everest-semi.com>
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
index 2807f536e..840242d7f 100644
--- a/sound/soc/sdw_utils/soc_sdw_utils.c
+++ b/sound/soc/sdw_utils/soc_sdw_utils.c
@@ -938,6 +938,56 @@ struct asoc_sdw_codec_info codec_info_list[] = {
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

