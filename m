Received: from mail-m32107.qiye.163.com (mail-m32107.qiye.163.com [220.197.32.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D87F0480950;
	Wed, 15 Jul 2026 15:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784128759; cv=none; b=EFXLJUgPL6qi8hsGVgyOGfpiAPzyHffrBltcicuZirAsY7iIg8SzIr5yWgj4zTuXeA2Fvvm+aY8e0uc0Z02ZMZaVjpPKAaGid57/UcOoRRT+7XNPaGDRAIyTAytMhrC4OBFhXXvPMOTLTj79uHXdJ9Ycav2OPqcRJm8/JbHq5qA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784128759; c=relaxed/simple;
	bh=bq8g9xkHiuWTkk3XAF0GfB67818hIQ3ys42KjTG2uy4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ty9FBUXaFiO1OxLPgXMi49lSDa54tH/uGvkoe0PylbYJLPEO0xMDKAuV2LJ7bjOnX64YP1OMy2RDUt33SpBSHsr4AQaaDEuVLzsMXhTex66fSSD274+V4bl24eEZNbAly4lTCGEhy1EIhGh69s7p9gZGmxpJVxRC1uqWOEPvGWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com; spf=pass smtp.mailfrom=thundersoft.com; dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b=k+egMmu7; arc=none smtp.client-ip=220.197.32.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b="k+egMmu7"
Received: from [127.0.1.1] (unknown [36.129.139.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 464e8f2f7;
	Wed, 15 Jul 2026 22:03:29 +0800 (GMT+08:00)
From: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Date: Wed, 15 Jul 2026 22:02:54 +0800
Subject: [PATCH v2 5/6] ASoC: qcom: sc8280xp: Add RubikPi 3 sound card
 support
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-rubikpi-next-20260605-v2-5-67601d7a8581@thundersoft.com>
References: <20260715-rubikpi-next-20260605-v2-0-67601d7a8581@thundersoft.com>
In-Reply-To: <20260715-rubikpi-next-20260605-v2-0-67601d7a8581@thundersoft.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Daniel Drake <drake@endlessm.com>, 
 Katsuhiro Suzuki <katsuhiro@katsuster.net>, 
 Matteo Martelli <matteomartelli3@gmail.com>, 
 Binbin Zhou <zhoubinbin@loongson.cn>, 
 Srinivas Kandagatla <srini@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Roger Shimizu <rosh@debian.org>, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Hongyang Zhao <hongyang.zhao@thundersoft.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784124199; l=2744;
 i=hongyang.zhao@thundersoft.com; s=20260127; h=from:subject:message-id;
 bh=bq8g9xkHiuWTkk3XAF0GfB67818hIQ3ys42KjTG2uy4=;
 b=TU7Y/vfqmmE3PBsbqNs4aV/CQQffqcLkoSLbTM0lIPPmV0JfO1gyXi39GOLkApezBiAvz6Tp6
 WZu4NSZ8D/4AkOgJKsOXi6Qz2qjcZAYPqFQJK6BbFtQd+TjpRj+xR/O
X-Developer-Key: i=hongyang.zhao@thundersoft.com; a=ed25519;
 pk=D9yL5W9Zj0lPBDAq9gzY++1849VlXuTWAkROzZ88J/4=
X-HM-Tid: 0a9f6616f8a409d5kunm638899c2110dd
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZGhlKVkwfHUsYHklKQh1JSVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlITVVKSUJVSkhCVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0
	lPT09IVUpLS1VKQktLWQY+
DKIM-Signature: a=rsa-sha256;
	b=k+egMmu7mBB0s1EmV64EDydgX7fiejPU7BYLztvt0twcKzu5Ah7CkB0NnFPkxIX06ZmnuDDEQnuCLtzT2Lq0IkiqTb725a0E+TbH9/gzBpr8fn5/NrULl4+A0LMEc2xHhxgIYZ/zObH5e/Gss1zuonGYPxYteAXVITeJni14AfQ=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=sF1yQe3cHSrdtvnwidVs42rm5Q0btdZJti8KGLZLjp4=;
	h=date:mime-version:subject:message-id:from;

RubikPi 3 connects an ES8316 codec to the primary MI2S interface for
headset playback and capture, and an LT9611 bridge to the quaternary
MI2S interface for HDMI audio.

Add board-specific DAI data for these links. Configure both directions
of the primary interface for I2S with normal clock polarity and the
codec as bit and frame clock consumer. Program the LPASS MCLK and BCLK,
drive the ES8316 with its required 19.2 MHz MCLK, and enable the generic
codec jack-detection setup on the playback link.

Configure the quaternary playback link with the same I2S clock format.
Do not request a codec sysclk for this link because the LT9611 HDMI
codec DAI does not implement set_sysclk().

Select this configuration through the RubikPi 3 sound-card compatible.

Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
---
 sound/soc/qcom/sc8280xp.c | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index 885ec1e3e575..1354eecb56c9 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -410,6 +410,41 @@ static const struct snd_soc_common qcs6490_priv_data = {
 	}),
 };
 
+static const struct snd_soc_common qcs6490_rubikpi3_priv_data = {
+	.driver_name = "qcs6490",
+	.dapm_widgets = sc8280xp_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
+	SC8280XP_DAI_DATA(
+		{
+			.id = PRIMARY_MI2S_RX,
+			.codec_dai_fmt = SND_SOC_DAIFMT_I2S |
+					 SND_SOC_DAIFMT_NB_NF |
+					 SND_SOC_DAIFMT_BC_FC,
+			.mclk_rate = 19200000,
+			.codec_sysclk_set = true,
+			.mi2s_mclk_enable = true,
+			.mi2s_bclk_enable = true,
+			.jack_setup = SC8280XP_JACK_SETUP_CODEC,
+		},
+		{
+			.id = PRIMARY_MI2S_TX,
+			.codec_dai_fmt = SND_SOC_DAIFMT_I2S |
+					 SND_SOC_DAIFMT_NB_NF |
+					 SND_SOC_DAIFMT_BC_FC,
+			.mclk_rate = 19200000,
+			.codec_sysclk_set = true,
+			.mi2s_mclk_enable = true,
+			.mi2s_bclk_enable = true,
+		},
+		{
+			.id = QUATERNARY_MI2S_RX,
+			.codec_dai_fmt = SND_SOC_DAIFMT_I2S |
+					 SND_SOC_DAIFMT_NB_NF |
+					 SND_SOC_DAIFMT_BC_FC,
+		}
+	),
+};
+
 static const struct snd_soc_common qcs8275_priv_data = {
 	.driver_name = "qcs8300",
 	.dapm_widgets = sc8280xp_dapm_widgets,
@@ -480,6 +515,10 @@ static const struct of_device_id snd_sc8280xp_dt_match[] = {
 	{ .compatible = "qcom,sm8550-sndcard", .data = &sm8550_priv_data },
 	{ .compatible = "qcom,sm8650-sndcard", .data = &sm8650_priv_data },
 	{ .compatible = "qcom,sm8750-sndcard", .data = &sm8750_priv_data },
+	{
+		.compatible = "thundercomm,qcs6490-rubikpi3-sndcard",
+		.data = &qcs6490_rubikpi3_priv_data,
+	},
 	{}
 };
 

-- 
2.43.0

