Received: from r3-89.sinamail.sina.com.cn (r3-89.sinamail.sina.com.cn [202.108.3.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C98F346AFB
	for <linux-sound@vger.kernel.org>; Fri, 24 Apr 2026 05:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777009926; cv=none; b=iZ9cOPLh54sD3LdMHe2ur9uo/U67W4dv/9WEs/b9nAcVqgIOF9YhcH9WZXgbwHtic6LZTcyKN/aqtuneDWaPVuSfxYVsmApwIl/hYpDx2u7/XEyHJ6hgqICrcXBnjaM7QrtdafN2ladtetMVch1XJnMVgwFB24MhDZ/TwCLYSqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777009926; c=relaxed/simple;
	bh=dtZ8/W39N3hmTDcDKtmDOQp0npQ9SBLiKkkWAQvr8yg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=QoIBK0Qbx6A7BKJoD8w5r9t47Qq0UCvPyQujXtNRPgn9qbPJ9gKeXTWIcfLvmZk9aFWnmwF+lvH9e30q+UR5p8phICZLR22mHDWD8M/UsyKUpFJLNgr9ILyIVsAQNWLLbsR/IVkw2iu9Y5M1LKz9dZ+7WG0u9JHnEN1LausIr7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=202.108.3.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([180.154.36.64])
	by sina.net (10.54.253.36) with ESMTP
	id 69EB046A00003A69; Fri, 24 Apr 2026 13:49:33 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 9D563D10DCA74B64B883B198DB1091F4
X-SMAIL-UIID: 9D563D10DCA74B64B883B198DB1091F4-20260424-134933
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
Subject: [PATCH v10 2/5] ASoC: sdw_utils: add ES9356 in codec_info_list
Date: Fri, 24 Apr 2026 13:49:25 +0800
Message-Id: <20260424054928.3257-3-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260424054928.3257-1-zhangyi@everest-semi.com>
References: <20260424054928.3257-1-zhangyi@everest-semi.com>
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

