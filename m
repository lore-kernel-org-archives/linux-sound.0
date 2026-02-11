Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5994C2F25FB
	for <linux-sound@vger.kernel.org>; Wed, 11 Feb 2026 02:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770775415; cv=none; b=QOxUKQEh4Ft4FSK1edsgH2MstmIOhbpIbiiHv2bpvBLkle9QIvvsa4wJxgDIBuU2ruqi96zu9EqNoOLQA2Yb7nkuyQB9T0wtS83/U980EeKunnaVgLS/JCRlRZGrcBep4TdOzuDDRVnvSWwa1nM069CZwkTEwm359KjbxnSLZOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770775415; c=relaxed/simple;
	bh=FUwD9F8Iz5eo71Y2bnIIZAmmu2oxZd+6v2B/zGTonO8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jKrYCwY5EojPLTODAj2Ka6BFJjqyve3OKH6tTjxmF4jnzSKwu0VNR9r/LCYe35dAWhzJrliXMbfPzHHewR4HuAO62yq9CFcqKdXJvsTpoXRWMSbaZvujyXj089Y9cLhjAOeM96hwuJezlsoatrNxx+hf4/jh5MCgJhzIFEb+ehA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PEX+mrVH; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PEX+mrVH"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-8954c9daaeaso51865896d6.1
        for <linux-sound@vger.kernel.org>; Tue, 10 Feb 2026 18:03:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770775412; x=1771380212; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gt575dBNBRRhS9fBmhA5a1S0d5GWcSnTvUyNr2H8bgA=;
        b=PEX+mrVHdb5PyTxiNHn+QNTFce99LFq4kiRb4u9SoLu3pRC7i+O/sYN6od/z5rCgdG
         4uFLBxHhrQv9HLITf2lsRklV2U3g64Wvd0GDM+U4aLvcBtpETkAf9bUO9WtKDSDFCCQ9
         9hzZ5j8HgI7fhE9XwMx2OMhxa/umbnnLs03pWbk7FDsMCfi0/sREiujrIOTZgkQorQvL
         FKVD0n0gCRslqnTfq8SxK3XmMJzcj1fnTdWPaoSQLYSwcdTX4+HJgY09SufyjFoY7ksk
         0U+/c2+HY/B59Lrn7cjLSOHNFKMr9NGDwv/GqBvWVSZo5DVcVywIA4SAXTwD/eO4KWK1
         2UUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770775412; x=1771380212;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Gt575dBNBRRhS9fBmhA5a1S0d5GWcSnTvUyNr2H8bgA=;
        b=AU78/YLbdCxSdVnuldme96lOh3kYtwmibB3HBXJS0YOFCEve8uGM256/9XOuCpeUD8
         YwRLZKnyLaf98Y6e7NFgPzxFT5/Vp+RCFRwenpiPMwd4fP0VqIJoWWbkKAFqsG27JOh8
         KKJHpZPpxzAakfjcLn60gHlinfF7RBmPdpD453X27I/DBzl+0abmQg/HGdmIexT1MaBS
         xIy3IMZYaDg+O42nB8QrWlVnKc+FfVFyPtVpdGfQcZAs9+QL8KOLCPkEeEAtVp9vuoiD
         fsoY78NzjPyHngBSKYKqiU6xBBC68QxukXVlmI8h58DS0FuTcjhIv4i2QN17NIT1e0i3
         mqWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXoy6mXCK3wS3qAgLX1n7XryaJbzGAAMcmrge5ZJOU+MdubJf4ACtiPUIGWW1g4kutpS9GYuDJngkHusQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywtu5x3fJqeXUF+Ml6aTj3uBN+Myn2FPN/HdQUTZsA5we3aP3Oz
	Eyz3fSeO6zR/KnBJbXK6IfWklrJq2DjYcHQL9UyvPLBNNWO6NPAZzVC5
X-Gm-Gg: AZuq6aLn9u+KGwHboRe4Cp0LXZo7RmZpIzyXYndt++RQekSKzMvnuqkYkDLtlLyoOQF
	oMi2QayJ9CfKfZJRS6sYvXpPt+TTxMqdLj5fOlIAMjKetiOOqsTUYhmmvreOF3/QPcuJAbutBCU
	twl7MJwOXf3PACFB8ZId9ZnkU4OSIIhiuTbIzV+gTq/WHWvo61hq6WHcXjY+3B0PNZKVP6krgGB
	spu0Qt9Zq/zqatT4L4+kbyII6ulo2Et83R+T64bqoESsNWWVOx87xZ8ci1mDmzxjoGry9ENks4X
	wjy6TKSDn+5JPZ3BvayvdRrd1GBgGJphHOGhI/mToY7m1RWBmch0y9f4Bpai3HLUXcjGYmyCCXF
	7NNAhiRIFJoHafyQoCkMAri8CSgx29uEdc3Nui0rlytqI51hph4WUo8iZNXNEukIo+D03EB/bdX
	iz6s5XfmT0xT9tumPwtTWB/tJBjA==
X-Received: by 2002:a05:6214:1cc9:b0:896:fe42:e88f with SMTP id 6a1803df08f44-8971dbabf8amr2709246d6.61.1770775412360;
        Tue, 10 Feb 2026 18:03:32 -0800 (PST)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8971cca9b6bsm4006526d6.23.2026.02.10.18.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 18:03:31 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Johan Hovold <johan@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Nickolay Goppen <setotau@mainlining.org>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH 08/10] ASoC: qdsp6: q6routing: add internal mi2s support
Date: Tue, 10 Feb 2026 21:03:00 -0500
Message-ID: <20260211020302.2674-9-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260211020302.2674-1-mailingradian@gmail.com>
References: <20260211020302.2674-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the ASM-AFE routing for internal MI2S ports.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 sound/soc/qcom/qdsp6/q6routing.c | 78 +++++++++++++++++++++++++++++++-
 1 file changed, 77 insertions(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/q6routing.c b/sound/soc/qcom/qdsp6/q6routing.c
index aaa3af9f1993..f5d285c6590f 100644
--- a/sound/soc/qcom/qdsp6/q6routing.c
+++ b/sound/soc/qcom/qdsp6/q6routing.c
@@ -127,7 +127,14 @@
 	{ mix_name, "TX_CODEC_DMA_TX_2", "TX_CODEC_DMA_TX_2"},	\
 	{ mix_name, "TX_CODEC_DMA_TX_3", "TX_CODEC_DMA_TX_3"},	\
 	{ mix_name, "TX_CODEC_DMA_TX_4", "TX_CODEC_DMA_TX_4"},	\
-	{ mix_name, "TX_CODEC_DMA_TX_5", "TX_CODEC_DMA_TX_5"}
+	{ mix_name, "TX_CODEC_DMA_TX_5", "TX_CODEC_DMA_TX_5"},	\
+	{ mix_name, "INT0_MI2S_TX", "INT0_MI2S_TX" },		\
+	{ mix_name, "INT1_MI2S_TX", "INT1_MI2S_TX" },		\
+	{ mix_name, "INT2_MI2S_TX", "INT2_MI2S_TX" },		\
+	{ mix_name, "INT3_MI2S_TX", "INT3_MI2S_TX" },		\
+	{ mix_name, "INT4_MI2S_TX", "INT4_MI2S_TX" },		\
+	{ mix_name, "INT5_MI2S_TX", "INT5_MI2S_TX" },		\
+	{ mix_name, "INT6_MI2S_TX", "INT6_MI2S_TX" }
 
 #define Q6ROUTING_TX_MIXERS(id)						\
 	SOC_SINGLE_EXT("PRI_MI2S_TX", PRIMARY_MI2S_TX,			\
@@ -320,6 +327,27 @@
 		id, 1, 0, msm_routing_get_audio_mixer,			\
 		msm_routing_put_audio_mixer),				\
 	SOC_SINGLE_EXT("TX_CODEC_DMA_TX_5", TX_CODEC_DMA_TX_5,		\
+		id, 1, 0, msm_routing_get_audio_mixer,			\
+		msm_routing_put_audio_mixer),				\
+	SOC_SINGLE_EXT("INT0_MI2S_TX", INT0_MI2S_TX,			\
+		id, 1, 0, msm_routing_get_audio_mixer,			\
+		msm_routing_put_audio_mixer),				\
+	SOC_SINGLE_EXT("INT1_MI2S_TX", INT1_MI2S_TX,			\
+		id, 1, 0, msm_routing_get_audio_mixer,			\
+		msm_routing_put_audio_mixer),				\
+	SOC_SINGLE_EXT("INT2_MI2S_TX", INT2_MI2S_TX,			\
+		id, 1, 0, msm_routing_get_audio_mixer,			\
+		msm_routing_put_audio_mixer),				\
+	SOC_SINGLE_EXT("INT3_MI2S_TX", INT3_MI2S_TX,			\
+		id, 1, 0, msm_routing_get_audio_mixer,			\
+		msm_routing_put_audio_mixer),				\
+	SOC_SINGLE_EXT("INT4_MI2S_TX", INT4_MI2S_TX,			\
+		id, 1, 0, msm_routing_get_audio_mixer,			\
+		msm_routing_put_audio_mixer),				\
+	SOC_SINGLE_EXT("INT5_MI2S_TX", INT5_MI2S_TX,			\
+		id, 1, 0, msm_routing_get_audio_mixer,			\
+		msm_routing_put_audio_mixer),				\
+	SOC_SINGLE_EXT("INT6_MI2S_TX", INT6_MI2S_TX,			\
 		id, 1, 0, msm_routing_get_audio_mixer,			\
 		msm_routing_put_audio_mixer),
 
@@ -709,6 +737,26 @@ static const struct snd_kcontrol_new rxcodec_dma_rx_6_mixer_controls[] = {
 static const struct snd_kcontrol_new rx_codec_dma_rx_7_mixer_controls[] = {
 	Q6ROUTING_RX_MIXERS(RX_CODEC_DMA_RX_7) };
 
+static const struct snd_kcontrol_new int0_mi2s_rx_mixer_controls[] = {
+	Q6ROUTING_RX_MIXERS(INT0_MI2S_RX) };
+
+static const struct snd_kcontrol_new int1_mi2s_rx_mixer_controls[] = {
+	Q6ROUTING_RX_MIXERS(INT1_MI2S_RX) };
+
+static const struct snd_kcontrol_new int2_mi2s_rx_mixer_controls[] = {
+	Q6ROUTING_RX_MIXERS(INT2_MI2S_RX) };
+
+static const struct snd_kcontrol_new int3_mi2s_rx_mixer_controls[] = {
+	Q6ROUTING_RX_MIXERS(INT3_MI2S_RX) };
+
+static const struct snd_kcontrol_new int4_mi2s_rx_mixer_controls[] = {
+	Q6ROUTING_RX_MIXERS(INT4_MI2S_RX) };
+
+static const struct snd_kcontrol_new int5_mi2s_rx_mixer_controls[] = {
+	Q6ROUTING_RX_MIXERS(INT5_MI2S_RX) };
+
+static const struct snd_kcontrol_new int6_mi2s_rx_mixer_controls[] = {
+	Q6ROUTING_RX_MIXERS(INT6_MI2S_RX) };
 
 static const struct snd_kcontrol_new mmul1_mixer_controls[] = {
 	Q6ROUTING_TX_MIXERS(MSM_FRONTEND_DAI_MULTIMEDIA1) };
@@ -938,6 +986,27 @@ static const struct snd_soc_dapm_widget msm_qdsp6_widgets[] = {
 	SND_SOC_DAPM_MIXER("USB_RX Audio Mixer", SND_SOC_NOPM, 0, 0,
 			   usb_rx_mixer_controls,
 			   ARRAY_SIZE(usb_rx_mixer_controls)),
+	SND_SOC_DAPM_MIXER("INT0_MI2S_RX Audio Mixer", SND_SOC_NOPM, 0, 0,
+		int0_mi2s_rx_mixer_controls,
+		ARRAY_SIZE(int0_mi2s_rx_mixer_controls)),
+	SND_SOC_DAPM_MIXER("INT1_MI2S_RX Audio Mixer", SND_SOC_NOPM, 0, 0,
+		int1_mi2s_rx_mixer_controls,
+		ARRAY_SIZE(int1_mi2s_rx_mixer_controls)),
+	SND_SOC_DAPM_MIXER("INT2_MI2S_RX Audio Mixer", SND_SOC_NOPM, 0, 0,
+		int2_mi2s_rx_mixer_controls,
+		ARRAY_SIZE(int2_mi2s_rx_mixer_controls)),
+	SND_SOC_DAPM_MIXER("INT3_MI2S_RX Audio Mixer", SND_SOC_NOPM, 0, 0,
+		int3_mi2s_rx_mixer_controls,
+		ARRAY_SIZE(int3_mi2s_rx_mixer_controls)),
+	SND_SOC_DAPM_MIXER("INT4_MI2S_RX Audio Mixer", SND_SOC_NOPM, 0, 0,
+		int4_mi2s_rx_mixer_controls,
+		ARRAY_SIZE(int4_mi2s_rx_mixer_controls)),
+	SND_SOC_DAPM_MIXER("INT5_MI2S_RX Audio Mixer", SND_SOC_NOPM, 0, 0,
+		int5_mi2s_rx_mixer_controls,
+		ARRAY_SIZE(int5_mi2s_rx_mixer_controls)),
+	SND_SOC_DAPM_MIXER("INT6_MI2S_RX Audio Mixer", SND_SOC_NOPM, 0, 0,
+		int6_mi2s_rx_mixer_controls,
+		ARRAY_SIZE(int6_mi2s_rx_mixer_controls)),
 	SND_SOC_DAPM_MIXER("MultiMedia1 Mixer", SND_SOC_NOPM, 0, 0,
 		mmul1_mixer_controls, ARRAY_SIZE(mmul1_mixer_controls)),
 	SND_SOC_DAPM_MIXER("MultiMedia2 Mixer", SND_SOC_NOPM, 0, 0,
@@ -1031,6 +1100,13 @@ static const struct snd_soc_dapm_route intercon[] = {
 	Q6ROUTING_RX_DAPM_ROUTE("RX_CODEC_DMA_RX_6 Audio Mixer", "RX_CODEC_DMA_RX_6"),
 	Q6ROUTING_RX_DAPM_ROUTE("RX_CODEC_DMA_RX_7 Audio Mixer", "RX_CODEC_DMA_RX_7"),
 	Q6ROUTING_RX_DAPM_ROUTE("USB_RX Audio Mixer", "USB_RX"),
+	Q6ROUTING_RX_DAPM_ROUTE("INT0_MI2S_RX Audio Mixer", "INT0_MI2S_RX"),
+	Q6ROUTING_RX_DAPM_ROUTE("INT1_MI2S_RX Audio Mixer", "INT1_MI2S_RX"),
+	Q6ROUTING_RX_DAPM_ROUTE("INT2_MI2S_RX Audio Mixer", "INT2_MI2S_RX"),
+	Q6ROUTING_RX_DAPM_ROUTE("INT3_MI2S_RX Audio Mixer", "INT3_MI2S_RX"),
+	Q6ROUTING_RX_DAPM_ROUTE("INT4_MI2S_RX Audio Mixer", "INT4_MI2S_RX"),
+	Q6ROUTING_RX_DAPM_ROUTE("INT5_MI2S_RX Audio Mixer", "INT5_MI2S_RX"),
+	Q6ROUTING_RX_DAPM_ROUTE("INT6_MI2S_RX Audio Mixer", "INT6_MI2S_RX"),
 	Q6ROUTING_TX_DAPM_ROUTE("MultiMedia1 Mixer"),
 	Q6ROUTING_TX_DAPM_ROUTE("MultiMedia2 Mixer"),
 	Q6ROUTING_TX_DAPM_ROUTE("MultiMedia3 Mixer"),
-- 
2.53.0

