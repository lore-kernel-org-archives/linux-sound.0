Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABC291514C8
	for <linux-sound@vger.kernel.org>; Tue,  7 May 2024 10:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715077671; cv=none; b=ai41lsFBCH49oPwPqaP7BC/txeyu+s7w88847G63a/NBXEc3dwLSSaX5tFTCPSASUXJGMXbAQqou425Mjitx+m2vFNycc6R8nVf8FFUeA/sWgreCINKbaE27qT4x7xzKWumFMJQT36+AYrtCxpAPEayHqDnhJq0/4M5EwJIfSbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715077671; c=relaxed/simple;
	bh=61rdmjNwJzA0Rtp3TjaO5PN4giA8+BNLRSAlZB30sVw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V2MprY2yPKTPjhceee5bGocju8VeGvMK7McOqHQyniBfb0HBVaiqLF+m7Mi+E3DpA/GFv3WGddtNWysHV6dfKkZF/nnxCOGYKo24cNru12BKOMstXE8gerJCQDqcSd7NLFVaAuItiWusOdvsvcxRcUP/CwQL1BbwYn84txqOozU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YO7bnWpT; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YO7bnWpT"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a59b81d087aso618100666b.3
        for <linux-sound@vger.kernel.org>; Tue, 07 May 2024 03:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715077667; x=1715682467; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fudiQRTJbxGJqty5CRk/uevh8tsrjGRaaIqrnS9XFA8=;
        b=YO7bnWpTjgGMIv+4oWS3EYt2oK8L2JMip7PAVyooVDtmzkn/tkdaTLhHD+yEyxlSbA
         dfNTPuHM7IZjVMOeJVObS3o+3dIQ75z6RM0Gl7SfJgV1mWe/WW425pozwnQFYUpWUY0S
         piDjMDbHQp+T+HanCyqbSAuw6g/xC4jM1gdniGF1WWaj6GQw3JKHiCYWQsae20VG1/qp
         FgJY4wRx/H10eeoOFUAZAUTe+jSp4pNZTQnGqxVWd2b0Ta3KT1AQLHTQzTEZV71zcuWb
         N2SI/exSodMjxyp/OS70YqinGpe4LqubnAIo6bg8o/MyxafvGHKY8/zemmeWiWjGE2MZ
         WXJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715077667; x=1715682467;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fudiQRTJbxGJqty5CRk/uevh8tsrjGRaaIqrnS9XFA8=;
        b=SNmrrmYq9xYRmb4iZLBkf9my1xSTp+gKIi/+Xvcmq1JwPa8nMPuo9I8JicIjObsRQ0
         lzRuUovXBzWWJDV3ipHu++oFhnBK3CTXL21PsJHazgUJhtGszMOvrekCDwhNHxQhSr5L
         FfMYNVRSxCMegVDptk/bxF/4FGgKjJTAlJsawsrXH6W+LXTeNB01EWHM+h3FEpwSCoFN
         Jvrh+Kp7vwd29h0AQRvu3E7zw+X+LAcvPxVCHh2SKv5ZapX8g8CwZSQiWJX7Z77bCOCq
         9pdIObIkqhlH+umQF0Q1mvWwQvLz+8+WVRwPdy9VQX8h5eafxS5bVXdUOWKrsAtPmhw9
         ZEYg==
X-Forwarded-Encrypted: i=1; AJvYcCVqqFEQ/egSWz++EYIyP+jOKaSf5JsWW6GL9l3nJ/lHKZgTMu4UcBo9/2/XT2h12FObrFPtTcGbUJk8nj7V8gzsr+GiZNSDOlo7h0Y=
X-Gm-Message-State: AOJu0YygreU8Bd8P5qO+RdqPbM2RmXTho9NPWKaGkx3AaUfjqLKomjHP
	ddTaFQ8tM0xu7SkQGvlnZmjIndZT23JiRKXSe1KcJON1tDwxC0emQN8HQePubWRrCfWLTjc1tBW
	k
X-Google-Smtp-Source: AGHT+IHeOlkBiIXj8Ch31jd6t9X4LVA9p4Vu0ILX858d59ZVwRVIRHE6OkXJlDTMC2ytyTIzzPodsw==
X-Received: by 2002:a17:907:968a:b0:a59:d39a:8d6b with SMTP id hd10-20020a170907968a00b00a59d39a8d6bmr5605681ejc.43.1715077667462;
        Tue, 07 May 2024 03:27:47 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.206.169])
        by smtp.gmail.com with ESMTPSA id bo15-20020a170906d04f00b00a59b87dd0bbsm3370093ejb.161.2024.05.07.03.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 03:27:47 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 07 May 2024 12:27:32 +0200
Subject: [PATCH 3/4] ASoC: qcom: q6dsp: Set channel mapping instead of
 fixed defaults
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240507-asoc-x1e80100-4-channel-mapping-v1-3-b12c13e0a55d@linaro.org>
References: <20240507-asoc-x1e80100-4-channel-mapping-v1-0-b12c13e0a55d@linaro.org>
In-Reply-To: <20240507-asoc-x1e80100-4-channel-mapping-v1-0-b12c13e0a55d@linaro.org>
To: James Schulman <james.schulman@cirrus.com>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5315;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=61rdmjNwJzA0Rtp3TjaO5PN4giA8+BNLRSAlZB30sVw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmOgIbJbQul/L/8gMPvUdCdFm1n2BLVDa2rGuTT
 vd895AN+lyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZjoCGwAKCRDBN2bmhouD
 1xuFD/4j2Tg7l1A0ljCHS9wL5fFYDjnOz06WS1T18RBCRlyN4NQ/j474jqc2h/FBN0Zlo+v3Ovl
 J7qzwq7HL5C4l+Zan5FRXXcAujOhPK4USRvN4uZFKEyNz8LLKEx+Rk2XACNcZYDO8NQie2+IqVf
 IvE0prnkEjVOTrqmGWzbUV7Yrw5jzR9fmGG0iTYcLhsdmpC3GX+iKqiMZPy+lsc77EKJfe6ajpw
 kad/dTTUbHuWNyfygNAwZ4fmq0gZ3+VihnTIhcxDvli84fEr2reiZfzjtIo0oIWLqE9AO4mFoMI
 svJiGg5z0l64QhSnN4AWf3euEdUat7oViLkMpY06lrENrr/Vg4gIqTGRr7tnkOueOt/wGFoHXUG
 wIa65wXzRNA1TpNPaB6Fox6Pig6ImS8qbvPsBdigarlh49d42NKlPGTFHmNbtqnUTyoKfiz1yP6
 pMB5UD2vF7SvKSsHImW7dHuXdVYGKkbRnimEi0pcGrCoG1VQEGqrYaTbuxs+Y/0YvObF3bk1Sx+
 90pYsJ8rX+RxNRs2LyfuC6jxIrzxvrWkSjkmt+Lo7Nl/dIH3ChQ013kmKXfYIxk9zRF9Gmow8/O
 rnHDyhpunMW9tGqAfJx+VOOVD4sopCh7ZCGOQnbwwJJQuypXuZlFsitiyFkTZ/h4jQZLlerg99v
 fK+FD8dkPIwZB/Q==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Use previously set channel mapping instead of defaults when preparing
frontent Q6APM component.  This allows machine sound card drivers to
override channel mappings.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/qcom/qdsp6/audioreach.c | 14 +++++---------
 sound/soc/qcom/qdsp6/audioreach.h |  2 +-
 sound/soc/qcom/qdsp6/q6apm-dai.c  | 12 ++++++++++++
 sound/soc/qcom/qdsp6/q6apm.c      |  2 +-
 4 files changed, 19 insertions(+), 11 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index 8175678d8843..83b33e4c9de2 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -267,7 +267,7 @@ void *audioreach_alloc_apm_cmd_pkt(int pkt_size, uint32_t opcode, uint32_t token
 }
 EXPORT_SYMBOL_GPL(audioreach_alloc_apm_cmd_pkt);
 
-void audioreach_set_channel_mapping(u8 *ch_map, int num_channels)
+void audioreach_set_default_channel_mapping(u8 *ch_map, int num_channels)
 {
 	if (num_channels == 1) {
 		ch_map[0] =  PCM_CHANNEL_FL;
@@ -884,8 +884,8 @@ static int audioreach_set_compr_media_format(struct media_format *media_fmt_hdr,
 		mp3_cfg->endianness = PCM_LITTLE_ENDIAN;
 		mp3_cfg->num_channels = mcfg->num_channels;
 
-		audioreach_set_channel_mapping(mp3_cfg->channel_mapping,
-					       mcfg->num_channels);
+		audioreach_set_default_channel_mapping(mp3_cfg->channel_mapping,
+						       mcfg->num_channels);
 		break;
 	case SND_AUDIOCODEC_AAC:
 		media_fmt_hdr->data_format = DATA_FORMAT_RAW_COMPRESSED;
@@ -1104,9 +1104,7 @@ static int audioreach_pcm_set_media_format(struct q6apm_graph *graph,
 	media_cfg->num_channels = mcfg->num_channels;
 	media_cfg->q_factor = mcfg->bit_width - 1;
 	media_cfg->bits_per_sample = mcfg->bit_width;
-
-	audioreach_set_channel_mapping(media_cfg->channel_mapping,
-				       num_channels);
+	memcpy(media_cfg->channel_mapping, mcfg->channel_map, mcfg->num_channels);
 
 	rc = q6apm_send_cmd_sync(graph->apm, pkt, 0);
 
@@ -1163,9 +1161,7 @@ static int audioreach_shmem_set_media_format(struct q6apm_graph *graph,
 		cfg->q_factor = mcfg->bit_width - 1;
 		cfg->endianness = PCM_LITTLE_ENDIAN;
 		cfg->num_channels = mcfg->num_channels;
-
-		audioreach_set_channel_mapping(cfg->channel_mapping,
-					       num_channels);
+		memcpy(cfg->channel_mapping, mcfg->channel_map, mcfg->num_channels);
 	} else {
 		rc = audioreach_set_compr_media_format(header, p, mcfg);
 		if (rc) {
diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
index cef9a9015dcc..6ae95eb85118 100644
--- a/sound/soc/qcom/qdsp6/audioreach.h
+++ b/sound/soc/qcom/qdsp6/audioreach.h
@@ -767,7 +767,7 @@ struct audioreach_module_config {
 /* Packet Allocation routines */
 void *audioreach_alloc_apm_cmd_pkt(int pkt_size, uint32_t opcode, uint32_t
 				    token);
-void audioreach_set_channel_mapping(u8 *ch_map, int num_channels);
+void audioreach_set_default_channel_mapping(u8 *ch_map, int num_channels);
 void *audioreach_alloc_cmd_pkt(int payload_size, uint32_t opcode,
 			       uint32_t token, uint32_t src_port,
 			       uint32_t dest_port);
diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index 00bbd291be5c..5dfbd011bb97 100644
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -8,6 +8,7 @@
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <sound/soc.h>
+#include <sound/soc-dai.h>
 #include <sound/soc-dapm.h>
 #include <linux/spinlock.h>
 #include <sound/pcm.h>
@@ -223,7 +224,10 @@ static int q6apm_dai_prepare(struct snd_soc_component *component,
 			     struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct snd_soc_pcm_runtime *soc_prtd = substream->private_data;
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(soc_prtd, 0);
 	struct q6apm_dai_rtd *prtd = runtime->private_data;
+	struct q6apm *apm = prtd->graph->apm;
 	struct audioreach_module_config cfg;
 	struct device *dev = component->dev;
 	struct q6apm_dai_data *pdata;
@@ -238,9 +242,17 @@ static int q6apm_dai_prepare(struct snd_soc_component *component,
 		return -EINVAL;
 	}
 
+	if (cpu_dai->id >= ARRAY_SIZE(apm->dai_config)) {
+		dev_err(dev, "Unsupported DAI ID number %d (%s)\n",
+			cpu_dai->id, cpu_dai->name);
+		return -EINVAL;
+	}
+
 	cfg.direction = substream->stream;
 	cfg.sample_rate = runtime->rate;
 	cfg.num_channels = runtime->channels;
+	memcpy(cfg.channel_map, apm->dai_config[cpu_dai->id].channel_map,
+	       runtime->channels);
 	cfg.bit_width = prtd->bits_per_sample;
 	cfg.fmt = SND_AUDIOCODEC_PCM;
 
diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index c29a2dd36992..f6fa15f42633 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -758,7 +758,7 @@ static int apm_probe(gpr_device_t *gdev)
 	apm->dev = dev;
 	apm->gdev = gdev;
 	for (i = 0; i < ARRAY_SIZE(apm->dai_config); i++)
-		audioreach_set_channel_mapping(apm->dai_config[i].channel_map, 4);
+		audioreach_set_default_channel_mapping(apm->dai_config[i].channel_map, 4);
 	init_waitqueue_head(&apm->wait);
 
 	INIT_LIST_HEAD(&apm->widget_list);

-- 
2.43.0

