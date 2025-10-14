Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 007C42877CB
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 09:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760433797; cv=none; b=FbeNJXdRJUYJnSDl4fCBWZTqWXTZ4mWxx63DzkEJwo8ySaEgnujgum3BNvurYDTn+2ftksJMzeJNbJQIMOi+irZBonPIpfduU9p7XLAdsbS82wQEhzqUxZeVzboilU8oL3iwxAWmyh4z3oVYfbDHqUxoeKMmyby6/0xbrtGC7aY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760433797; c=relaxed/simple;
	bh=WAz0WbvG90fVmTZ4u3de9WRxRTjU5NIb/oJcT4Ds9DA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=S13g+iDOl0lEIzJcbtkfqAQQYhnXAv2KI3XgApQtVaau2vGRyH7p9IMNG5EifRem70NEYjclldMW4e4dGlFYgBDOhsb4+yQQggRjemT4NZccpbR73hJpZMXB97Z1AvHmS0PTLrliXlyBs+GaOnfzOOpGFbT2vZdsk/Vq2kNVJGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=ttwyTiqJ; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="ttwyTiqJ"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 59E9Mbp063049688, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1760433757; bh=Xaofi8tmLcV+uPYkNwUp7cfIzISu7FsF781MiC9Rui0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=ttwyTiqJFGgYWg43Y5gPxW3v7kHhKdt7r8ONiYjw+qwaUmEEHRhpGt6I4jl3lAbGT
	 IDjqqHPIVic1vtnwk7ggW1Bm2BGKGhYkbOXpv+MW7k4/QcnJCaghH0dPJ0MpibeV05
	 Ru7p0HgYzAq6nnZgaHhqm/WXkWgnNzwkZvW50Ygb++4L08ixASTyfjTgJ0TyTlQV4d
	 62kjInMkIdwSzfOzXs1JXinwcWdCUhvhtYU+Xqm8fHW/O6YZ0uN3Tn2VEXk29zZGce
	 1S9IHOtFXk/FtOYTx/4q7Bz9fE8trB605PRbwsAJXG/bTc2O35sNDaewmVrUs9iXNw
	 a7YAet7pUc/wg==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.13/5.93) with ESMTPS id 59E9Mbp063049688
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 14 Oct 2025 17:22:37 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.27; Tue, 14 Oct 2025 17:22:38 +0800
Received: from sw-server.localdomain (172.24.54.4) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.27; Tue, 14 Oct 2025 17:22:37 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
CC: <linux-sound@vger.kernel.org>, <lars@metafoo.de>, <flove@realtek.com>,
        <oder_chiou@realtek.com>, <jack.yu@realtek.com>,
        <derek.fang@realtek.com>, <bard.liao@intel.com>,
        Shuming Fan <shumingf@realtek.com>
Subject: [PATCH] ASoC: sdw_utils: add rt1321 part id to codec_info_list
Date: Tue, 14 Oct 2025 17:21:57 +0800
Message-ID: <20251014092157.2789054-1-shumingf@realtek.com>
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

The SdW machine driver supports the part id rt1321 amplifier.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
---
 sound/soc/sdw_utils/soc_sdw_utils.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/sound/soc/sdw_utils/soc_sdw_utils.c b/sound/soc/sdw_utils/soc_sdw_utils.c
index 56c72ef27e7b..270c66b90228 100644
--- a/sound/soc/sdw_utils/soc_sdw_utils.c
+++ b/sound/soc/sdw_utils/soc_sdw_utils.c
@@ -311,6 +311,26 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 		},
 		.dai_num = 1,
 	},
+	{
+		.part_id = 0x1321,
+		.dais = {
+			{
+				.direction = {true, false},
+				.dai_name = "rt1320-aif1",
+				.component_name = "rt1320",
+				.dai_type = SOC_SDW_DAI_TYPE_AMP,
+				.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_UNUSED_DAI_ID},
+				.init = asoc_sdw_rt_amp_init,
+				.exit = asoc_sdw_rt_amp_exit,
+				.rtd_init = asoc_sdw_rt_amp_spk_rtd_init,
+				.controls = generic_spk_controls,
+				.num_controls = ARRAY_SIZE(generic_spk_controls),
+				.widgets = generic_spk_widgets,
+				.num_widgets = ARRAY_SIZE(generic_spk_widgets),
+			},
+		},
+		.dai_num = 1,
+	},
 	{
 		.part_id = 0x714,
 		.version_id = 3,
-- 
2.34.1

