Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A22445AE5
	for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 17:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785433475; cv=none; b=JCmcktiRf+4Tko+AqYpLoJUAibQ3wPbs/Go7twNue51ZpQZPo5qY94eYuPNrSTlQCanqKBWBVbEASHjC/aTTfFEcW8ToBpJGKHeQ3DqxPfRIwTw/8TNmy2JVCT9aB+VkLriTYa2mRRT/XUxmGUwYXFnEQhIaEOvBgbz9zU3Nvo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785433475; c=relaxed/simple;
	bh=ljVvS0BUS7R4b5wDtG5Wbuwfp6OJzEvFBy31SyV8i9w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cdyMk14bH9h3Hwt3AtMj602o9DGkEBkCgd8cBpmAq6Nkmrp9JiPV90krMFeFbAEYmENm3FuXl9fBsrCCKHx0gIca8eQ3/9f9xodMp73Sa0ZuQWFN22TA1oa3sDDX+DzbIKFa7JET9vPCt8zwK30CQoekvlQjNSpI8TU//W/KclM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d6M6cBlx; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d6M6cBlx"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-92e622cc874so7893785a.0
        for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 10:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785433473; x=1786038273; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6VjXTlsAu/xfF+J0pW1vvFa80HYH88DclGm+FOBDPs8=;
        b=d6M6cBlx+M5NoQh/oi7W24q5suwlF24mOeXacm0fFEPImeN3MQruPNqB7oVN5nENQ8
         hrbvetNr5T72/spR+enjPdfW6/hDj1W1PcPqQyjJNHbYC4GTnI1Kyr9DeInCd20FKpOF
         oDgQSslJ7k676nAPqlIrSt6O1Z4PyTs5oBKO02JlOAEUT9Y0wB1nm5ombGV4uXkkgIlO
         UuOu0ByObAe9dSceu2SNJCWHb30/43ReXuvm0OMg/qiWhFcNlSIC4+mySWrJ8icU+VRI
         Rjw7k4HkgUoBZWu94Aqyx39BrOYyH20DLHRwAXckDTeKXD7v022/fu9Tu9fTndZkok91
         xwHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785433473; x=1786038273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6VjXTlsAu/xfF+J0pW1vvFa80HYH88DclGm+FOBDPs8=;
        b=RfnnnfHTbO1Qbb7Be5982y2Xkkm5yDCPIcw5caL8hZFsLvmTXBP5vCye88PezJePE4
         rbMkcvrk1k5o7X4JyVG3gX2+D8G8inMXc7H6wc9+gU+GlkM4XTW0G7VbQf+b9gOGfBQk
         w1ckdahcuRbGiBJJxyQJPqPeTI2M8lNNY1qOyP/gmr3j3Xzobc6DEqzOd5GtlPKKLlJr
         aqFMvLDIPA7AxZ5GNBiOJHBCmR+GtdsvgJDmajJrwC9m1fYL4ySbqP1w2ZiSXPC0HV5O
         gV1JContd5Zo5JqD1K+iEZPaSjWcosYsKyiIWOPFvUUF8SanzcBS/pFeVmPvCCYnYYRT
         al7Q==
X-Forwarded-Encrypted: i=1; AHgh+RoSpELGOAcgYyWhQW2O2V5bAVeiWJigwd19xGoOoN9MfSxpOYjTkHqqXjgoh92rJYUMrpVE1cdYUgGbEg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1twuceXobfZp0ORSfZaxPDRKW/Ih/D5wTFg3C6r0BCvlivKkN
	hCQwfVPZmhpG8SZOhhNZ+1J0SvbG0oUT85Qnj7L+qZwJ9wxstN8G3dzx
X-Gm-Gg: AR+sD11MayR9t1k8IaJz0ber79Ob1LYaYvOxxmOfLrOdY+BAGHtodp4/CNGSAzcfTut
	oCsiD7Lz0MXNiL3DhhQV6NVik1PyOLcCfVcX4OiMjuGIGOkMKXe9JOMTBSSpyi4ADNzcfbijN8q
	WFLxgEldL5EMQgNS83V+ziIGmCkKgQ099bCeViju/4/yNG3BXbQ4EOe8Fnj/tTIP6/ogB4AkJpJ
	Ugt4TFSPB+yEKvNCaCqr8qu4YCphoGRkznqHOkBjTe+ZZu6UcOOnn3ClZVvhJf1XuxmUTuSRR2N
	FPyG2OuKtTHNnrpZ2IurUSc9NzzmYNkGQGVuLzBpQ1vUbo/Ca0QzNpEuD+DdjMc+ZOAuAfNrxkO
	B59HvIr6uoei2hnmmqDxf6lmBeKD/zjIUYwfC8KhxBlXwd7UJz4xH/ETChzKv8PP/KpJkv1CIEa
	DbamxfCzTA+nWXY1wBo+qDzbhOHgFnb5sY9asXAMG3/V4qE4b302rUZ+QcSwM=
X-Received: by 2002:a05:620a:4084:b0:930:9774:868e with SMTP id af79cd13be357-9348d89f8c3mr179724985a.7.1785433472921;
        Thu, 30 Jul 2026 10:44:32 -0700 (PDT)
Received: from localhost ([70.54.57.80])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-933e712d88fsm454439185a.30.2026.07.30.10.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 10:44:32 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Nickolay Goppen <setotau@mainlining.org>,
	Adam Skladowski <a39.skl@gmail.com>,
	Vladimir Lypak <vladimir.lypak@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
	Johan Hovold <johan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v6 09/15] ASoC: qdsp6: q6routing: add lpi mi2s support
Date: Thu, 30 Jul 2026 13:43:47 -0400
Message-ID: <20260730174353.108023-10-mailingradian@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260730174353.108023-1-mailingradian@gmail.com>
References: <20260730174353.108023-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the ASM-AFE routing for LPI MI2S ports which represent internal MI2S
ports on SDM660.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 sound/soc/qcom/qdsp6/q6routing.c | 78 +++++++++++++++++++++++++++++++-
 1 file changed, 77 insertions(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/q6routing.c b/sound/soc/qcom/qdsp6/q6routing.c
index 7386226046fa..d076c99f197f 100644
--- a/sound/soc/qcom/qdsp6/q6routing.c
+++ b/sound/soc/qcom/qdsp6/q6routing.c
@@ -127,7 +127,14 @@
 	{ mix_name, "TX_CODEC_DMA_TX_2", "TX_CODEC_DMA_TX_2"},	\
 	{ mix_name, "TX_CODEC_DMA_TX_3", "TX_CODEC_DMA_TX_3"},	\
 	{ mix_name, "TX_CODEC_DMA_TX_4", "TX_CODEC_DMA_TX_4"},	\
-	{ mix_name, "TX_CODEC_DMA_TX_5", "TX_CODEC_DMA_TX_5"}
+	{ mix_name, "TX_CODEC_DMA_TX_5", "TX_CODEC_DMA_TX_5"},	\
+	{ mix_name, "LPI_MI2S_TX_0", "LPI_MI2S_TX_0" },		\
+	{ mix_name, "LPI_MI2S_TX_1", "LPI_MI2S_TX_1" },		\
+	{ mix_name, "LPI_MI2S_TX_2", "LPI_MI2S_TX_2" },		\
+	{ mix_name, "LPI_MI2S_TX_3", "LPI_MI2S_TX_3" },		\
+	{ mix_name, "LPI_MI2S_TX_4", "LPI_MI2S_TX_4" },		\
+	{ mix_name, "LPI_MI2S_TX_5", "LPI_MI2S_TX_5" },		\
+	{ mix_name, "LPI_MI2S_TX_6", "LPI_MI2S_TX_6" }
 
 #define Q6ROUTING_TX_MIXERS(id)						\
 	SOC_SINGLE_EXT("PRI_MI2S_TX", PRIMARY_MI2S_TX,			\
@@ -320,6 +327,27 @@
 		id, 1, 0, msm_routing_get_audio_mixer,			\
 		msm_routing_put_audio_mixer),				\
 	SOC_SINGLE_EXT("TX_CODEC_DMA_TX_5", TX_CODEC_DMA_TX_5,		\
+		id, 1, 0, msm_routing_get_audio_mixer,			\
+		msm_routing_put_audio_mixer),				\
+	SOC_SINGLE_EXT("LPI_MI2S_TX_0", LPI_MI2S_TX_0,			\
+		id, 1, 0, msm_routing_get_audio_mixer,			\
+		msm_routing_put_audio_mixer),				\
+	SOC_SINGLE_EXT("LPI_MI2S_TX_1", LPI_MI2S_TX_1,			\
+		id, 1, 0, msm_routing_get_audio_mixer,			\
+		msm_routing_put_audio_mixer),				\
+	SOC_SINGLE_EXT("LPI_MI2S_TX_2", LPI_MI2S_TX_2,			\
+		id, 1, 0, msm_routing_get_audio_mixer,			\
+		msm_routing_put_audio_mixer),				\
+	SOC_SINGLE_EXT("LPI_MI2S_TX_3", LPI_MI2S_TX_3,			\
+		id, 1, 0, msm_routing_get_audio_mixer,			\
+		msm_routing_put_audio_mixer),				\
+	SOC_SINGLE_EXT("LPI_MI2S_TX_4", LPI_MI2S_TX_4,			\
+		id, 1, 0, msm_routing_get_audio_mixer,			\
+		msm_routing_put_audio_mixer),				\
+	SOC_SINGLE_EXT("LPI_MI2S_TX_5", LPI_MI2S_TX_5,			\
+		id, 1, 0, msm_routing_get_audio_mixer,			\
+		msm_routing_put_audio_mixer),				\
+	SOC_SINGLE_EXT("LPI_MI2S_TX_6", LPI_MI2S_TX_6,			\
 		id, 1, 0, msm_routing_get_audio_mixer,			\
 		msm_routing_put_audio_mixer),
 
@@ -709,6 +737,26 @@ static const struct snd_kcontrol_new rxcodec_dma_rx_6_mixer_controls[] = {
 static const struct snd_kcontrol_new rx_codec_dma_rx_7_mixer_controls[] = {
 	Q6ROUTING_RX_MIXERS(RX_CODEC_DMA_RX_7) };
 
+static const struct snd_kcontrol_new lpi_mi2s_rx_0_mixer_controls[] = {
+	Q6ROUTING_RX_MIXERS(LPI_MI2S_RX_0) };
+
+static const struct snd_kcontrol_new lpi_mi2s_rx_1_mixer_controls[] = {
+	Q6ROUTING_RX_MIXERS(LPI_MI2S_RX_1) };
+
+static const struct snd_kcontrol_new lpi_mi2s_rx_2_mixer_controls[] = {
+	Q6ROUTING_RX_MIXERS(LPI_MI2S_RX_2) };
+
+static const struct snd_kcontrol_new lpi_mi2s_rx_3_mixer_controls[] = {
+	Q6ROUTING_RX_MIXERS(LPI_MI2S_RX_3) };
+
+static const struct snd_kcontrol_new lpi_mi2s_rx_4_mixer_controls[] = {
+	Q6ROUTING_RX_MIXERS(LPI_MI2S_RX_4) };
+
+static const struct snd_kcontrol_new lpi_mi2s_rx_5_mixer_controls[] = {
+	Q6ROUTING_RX_MIXERS(LPI_MI2S_RX_5) };
+
+static const struct snd_kcontrol_new lpi_mi2s_rx_6_mixer_controls[] = {
+	Q6ROUTING_RX_MIXERS(LPI_MI2S_RX_6) };
 
 static const struct snd_kcontrol_new mmul1_mixer_controls[] = {
 	Q6ROUTING_TX_MIXERS(MSM_FRONTEND_DAI_MULTIMEDIA1) };
@@ -938,6 +986,27 @@ static const struct snd_soc_dapm_widget msm_qdsp6_widgets[] = {
 	SND_SOC_DAPM_MIXER("USB_RX Audio Mixer", SND_SOC_NOPM, 0, 0,
 			   usb_rx_mixer_controls,
 			   ARRAY_SIZE(usb_rx_mixer_controls)),
+	SND_SOC_DAPM_MIXER("LPI_MI2S_RX_0 Audio Mixer", SND_SOC_NOPM, 0, 0,
+		lpi_mi2s_rx_0_mixer_controls,
+		ARRAY_SIZE(lpi_mi2s_rx_0_mixer_controls)),
+	SND_SOC_DAPM_MIXER("LPI_MI2S_RX_1 Audio Mixer", SND_SOC_NOPM, 0, 0,
+		lpi_mi2s_rx_1_mixer_controls,
+		ARRAY_SIZE(lpi_mi2s_rx_1_mixer_controls)),
+	SND_SOC_DAPM_MIXER("LPI_MI2S_RX_2 Audio Mixer", SND_SOC_NOPM, 0, 0,
+		lpi_mi2s_rx_2_mixer_controls,
+		ARRAY_SIZE(lpi_mi2s_rx_2_mixer_controls)),
+	SND_SOC_DAPM_MIXER("LPI_MI2S_RX_3 Audio Mixer", SND_SOC_NOPM, 0, 0,
+		lpi_mi2s_rx_3_mixer_controls,
+		ARRAY_SIZE(lpi_mi2s_rx_3_mixer_controls)),
+	SND_SOC_DAPM_MIXER("LPI_MI2S_RX_4 Audio Mixer", SND_SOC_NOPM, 0, 0,
+		lpi_mi2s_rx_4_mixer_controls,
+		ARRAY_SIZE(lpi_mi2s_rx_4_mixer_controls)),
+	SND_SOC_DAPM_MIXER("LPI_MI2S_RX_5 Audio Mixer", SND_SOC_NOPM, 0, 0,
+		lpi_mi2s_rx_5_mixer_controls,
+		ARRAY_SIZE(lpi_mi2s_rx_5_mixer_controls)),
+	SND_SOC_DAPM_MIXER("LPI_MI2S_RX_6 Audio Mixer", SND_SOC_NOPM, 0, 0,
+		lpi_mi2s_rx_6_mixer_controls,
+		ARRAY_SIZE(lpi_mi2s_rx_6_mixer_controls)),
 	SND_SOC_DAPM_MIXER("MultiMedia1 Mixer", SND_SOC_NOPM, 0, 0,
 		mmul1_mixer_controls, ARRAY_SIZE(mmul1_mixer_controls)),
 	SND_SOC_DAPM_MIXER("MultiMedia2 Mixer", SND_SOC_NOPM, 0, 0,
@@ -1031,6 +1100,13 @@ static const struct snd_soc_dapm_route intercon[] = {
 	Q6ROUTING_RX_DAPM_ROUTE("RX_CODEC_DMA_RX_6 Audio Mixer", "RX_CODEC_DMA_RX_6"),
 	Q6ROUTING_RX_DAPM_ROUTE("RX_CODEC_DMA_RX_7 Audio Mixer", "RX_CODEC_DMA_RX_7"),
 	Q6ROUTING_RX_DAPM_ROUTE("USB_RX Audio Mixer", "USB_RX"),
+	Q6ROUTING_RX_DAPM_ROUTE("LPI_MI2S_RX_0 Audio Mixer", "LPI_MI2S_RX_0"),
+	Q6ROUTING_RX_DAPM_ROUTE("LPI_MI2S_RX_1 Audio Mixer", "LPI_MI2S_RX_1"),
+	Q6ROUTING_RX_DAPM_ROUTE("LPI_MI2S_RX_2 Audio Mixer", "LPI_MI2S_RX_2"),
+	Q6ROUTING_RX_DAPM_ROUTE("LPI_MI2S_RX_3 Audio Mixer", "LPI_MI2S_RX_3"),
+	Q6ROUTING_RX_DAPM_ROUTE("LPI_MI2S_RX_4 Audio Mixer", "LPI_MI2S_RX_4"),
+	Q6ROUTING_RX_DAPM_ROUTE("LPI_MI2S_RX_5 Audio Mixer", "LPI_MI2S_RX_5"),
+	Q6ROUTING_RX_DAPM_ROUTE("LPI_MI2S_RX_6 Audio Mixer", "LPI_MI2S_RX_6"),
 	Q6ROUTING_TX_DAPM_ROUTE("MultiMedia1 Mixer"),
 	Q6ROUTING_TX_DAPM_ROUTE("MultiMedia2 Mixer"),
 	Q6ROUTING_TX_DAPM_ROUTE("MultiMedia3 Mixer"),
-- 
2.55.0

