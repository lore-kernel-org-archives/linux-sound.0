Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D383CA4BF
	for <linux-sound@vger.kernel.org>; Fri,  1 May 2026 15:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777649546; cv=none; b=iE0UTEmK8SghW3J9bKlJibU2BeV4fjFv+ldQ7xwRzXLIEd4Vj2hRzMpiWpARQ1R8UyU5v8YpVtiSB0/lJHdYO1sVnQ0wnAX3txO2JDFYrWFSyBYQLutMjSihQpnKv76er3Y3i0Wdu1G7ukEEzgZSKxiTij3dEopERZuvlM6CZnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777649546; c=relaxed/simple;
	bh=i6n4kgYlK/kQHPEe7+5DwAlZeJEwIPoycv1dqqBd5II=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Yih8UrFgUhp+CBh75e5Ss/b/pM/0QixXvULws7eHmaxwf7QjBSgqmnjdzHA9YVzje9KoUUwFmlU/yhxcj68MERbKjg4qAebAovPrD7i7YTy7BafQJme/AnQZvuNSqE4uOtGDkIgQ3JhjyJqgEbMclLjL1o7nM5oazJ7JfOyElG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sbUVIfZb; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sbUVIfZb"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-8d67a483d3eso230246785a.1
        for <linux-sound@vger.kernel.org>; Fri, 01 May 2026 08:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777649543; x=1778254343; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BgmKodKO3BKZ5SGeQ+n3wh4X6xMoeU7XIti8CgEQnWk=;
        b=sbUVIfZbyitC/FUiyqErcl4TaYG8Q/G5l3eOg7a0SthEPQQapX08VabViUaz6Ao90C
         ALDjnwM1ggQfQC/tne7pRbxgrdyNWvnaB1FKbhyt3xQu+jEQwO7QsYdUa2kN1MzG39LU
         mpJimH1uZAf5uLqko26oV9TMR7urSkrACOSQTxOYmN64YUSST5JRB+08sNmcEU9/yzyb
         G+SsxuwAmbY0Ajmtso98bZhFKovOV5Dce8/e7/lX7MqzNSWI5llK0Xw2lguukWeQKCic
         z7mFl5dZPbky7gSFcxo101uwjubTrnaMwiKcUDJa7CgyA4JzO3DAw+9e95ilyRtUmrNS
         xnQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777649543; x=1778254343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BgmKodKO3BKZ5SGeQ+n3wh4X6xMoeU7XIti8CgEQnWk=;
        b=jmco4lU5WzeQHipuFBL0h+8XSpRWSItGPMOoeYbd5XSGB2m1Q7XyOtoTPt+ZMadMVz
         KKCGk8FGFd4kt3SgC7d2mdUjYcLLmpD+CttyhAw7UbTtZQUXVX7iftyBVDSj4yi0biC2
         fwrl+5mRAWr2FFc6Hd7MpqnwPtV2JWSYkBSxlTng3B+dpfcUUKbwAC8P7MUYiGbfElEc
         vAGiISP8X53CO09KQSto87X6wQZKTMKv6ckewuajf/cZVh+1AXiAsGXJNibq1nldnRiM
         G2vwGmjVb4wC4CQLrZZpptTSKUYRoBU1z5sMnJEYffhJEihRLD2QztQfKxUl4YTQ4Bt5
         +sXw==
X-Forwarded-Encrypted: i=1; AFNElJ9Mcr+joGiRsqLhAbcNNCA5amoUum6DJty4h5PT4lz4cXqNPursyFQR3QquWoXq6yDibpYDkO7n9qEJ6w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyEZAw2hZN/EgZL9xGQX/05H3nISWEdbtMtk51PkvOC4N27DxOJ
	wDJcGSdNmg6i2KfZMsPdhqOXMPqQK0+Y///kNervMr4aRZ8690ezgYSy
X-Gm-Gg: AeBDiet7vQypRnm3WZBi/UtwPa23tOXUKCRhWnaBuWhG6Y4hHWbg1+IpFZGCcnHAInw
	N9zN2B7oXTb94SNA8DzCw80BdLdhJIHCh6Ii6SjtFwu7IUXG+rd85FEfOLvPcCqA1KmMYHcXXnk
	LownZA3JiSbcAhKCKRKkF+xoKPwvwE5Ci6TmRlfV10Lq5hvQ5jl9WESnHlNVWISZ76dvn9iwS4y
	O4Gd5s88qB9E2hUjqxDhQHx9YNIFPMzm8rySgDdIfyM1dB7kBsyLmZqw1vlI3Vb+Jy86bx6aEwI
	e5CZJ8bpoqu3ei+SYWY+emtXwqWbtGCYEvQtDaKuVCQQoC9qXtVIjCbsLLa776kj2iiG7DV5I9f
	MulbvFpuNyjaFlyfTbs91lcslj0sAvi+E7Qq9F41ro6c8NFH3AA2Fgbh95sILhM6rYtFPz7xYJ7
	wJClaNmYOqAkx0RAVYXd0VqXqbEoQ/N8KsyvdO
X-Received: by 2002:a05:620a:1726:b0:8cf:da76:58ea with SMTP id af79cd13be357-8faafef903fmr1157541085a.25.1777649543538;
        Fri, 01 May 2026 08:32:23 -0700 (PDT)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fc29a7a627sm194432885a.17.2026.05.01.08.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 08:32:22 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Nickolay Goppen <setotau@mainlining.org>,
	Adam Skladowski <a39.skl@gmail.com>,
	Vladimir Lypak <vladimir.lypak@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v4 09/15] ASoC: qdsp6: q6routing: add internal mi2s support
Date: Fri,  1 May 2026 11:31:22 -0400
Message-ID: <20260501153128.8152-10-mailingradian@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260501153128.8152-1-mailingradian@gmail.com>
References: <20260501153128.8152-1-mailingradian@gmail.com>
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
index 7386226046fa..cfb953700f14 100644
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
2.54.0

