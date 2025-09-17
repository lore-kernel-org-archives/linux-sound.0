Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 688EE302CD1
	for <linux-sound@vger.kernel.org>; Wed, 17 Sep 2025 07:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758094381; cv=none; b=V+1TVSa3FzMwFBGhDlt6Sfe1Lvr0rmQGyf76DP3RVG/pum500kumw4diFuLl8hy45s3v6rLDvx4n1CPA8jyLnPT1uS2idlldeFMAQByBjbSwGFVhizdi5+2XJmmH5403L/QA3hSWxpYiwOkt8TW0n0CP3+GD5DCY5PWPlmPfDGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758094381; c=relaxed/simple;
	bh=7dBbJ2XDaICT5fY10gi7xHs1MZJM2ZIuPzivB427+9A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VLg2V+6cTrde8H62cy691pKCA7hawQrmlPGyFceMqWj9jmgQvubS1Noa4s8wpDze0fHTBCEuhjHPXHAACqbIybLv1M3JGzw8SWysGhuu+DgBRfdRTjNpU+Ti51tiIVQWJzRgePyf6XQm7Oe2JVfQ+K/zMxya+csvn6qrAHAYXOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RempHgvs; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RempHgvs"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-45de56a042dso42798305e9.3
        for <linux-sound@vger.kernel.org>; Wed, 17 Sep 2025 00:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758094376; x=1758699176; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V+S8Bi8p7Aa3TTJtUqEJlrmt11baBIIjX3yVkC4MHgM=;
        b=RempHgvsHJSCr06KxMaJOx74OnqcdET4GXTzGspDPkUUUJf95oX6idkHDtzSPAoZLg
         9GHV9DnL9CoKJ5ggWnojvVbVfaCaKmkaXvnS/7A7/saiNfmLC7kX8j6gCD0fYq/HtpGS
         82WmjJ567RHNS6DIfkzZiMlFe/c+5uAGEhavOJGFO6G6o8jAB1F76oAskpEMBqnb/S7f
         pzM4IGSa1he/dItjbcsX4n2GheEBYyvkd/DaCn8lEZb8RIv7owHg/fuD0IOAFlByuOv3
         GcRmNeTeiqW4VjggwINGjX1sVBZCalXXGzbn3ACJ2e4pU+fEcPMAkIkiOt/4zTZEqFBk
         +Ffw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758094376; x=1758699176;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V+S8Bi8p7Aa3TTJtUqEJlrmt11baBIIjX3yVkC4MHgM=;
        b=FIWAB/WYY7oqsvqtR+nTHcbqAfmc3XuV9wwkggpZk5vUIvhPnVdXcgksAw1TNfWQ2s
         Rm8WFfLcEAUcDxVtdxsWn8ccuGerZ8u7RKVfdRzcFXEjaSOotPsYaq5JVpUJCnSQgD26
         Vv7FQUIXWLq4yWQcj/fcGhV2zHluA9hXXFNIrRJmxj5vwY6IatX9f3kirSCdc/aZP1DU
         jNdqvFUvaHEfSRMi15cKv0CLbdnYPxxgYPuo4oGRjjOZ+ac3nafiOjo5+JN/ZBgMFhL3
         TKLxYuNMKt83k48aP4/cbBmz8pv/AnsnE/1isFraOY20rBpEcCnx1X1IC5q1kXfIRlwI
         JTJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUktX5n5m9YxnIyUBZpoj0lPJEVO1DtoFb5FxzmYMte+YPnCSmjnw04RkqWUTFSh+OAq3s7n+m+PNGkwQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YynAiODcbykO1nvJRUcqjk8J9nfQc/Vni9aqdUBm/IqwTBvckiH
	Wjj+zcqfwNfoukgZq83YabZ2+EuPF/N5rLRgX2KFIfFsgBWXF9pnaxlx9qX9oEwj/NPn/HsI8tS
	7FbpU
X-Gm-Gg: ASbGncuZn/cJ5qubE2nrRBGDcDmwTUX+pX3ovrCQO45DJzip5RbRCqf6f32hximJ3lc
	wuukSHPvlYAIQTikP0E0t6EKP2oW3yAm4lmZ6dvUOSA1RPzsYwNvqX2/P1/D+F2l1Z6Xamo34ak
	zPP/4sxHMkhCctf8V3OM0R0nklbyyop/aB9AHSLzkyoYzcASm7fgPs+xNv/n2ytT9jgRTVLKHS5
	pAR2D0tRwk52OKejb0XjhuwgMcKnf+crzAwwllWLaQmF6AFzDEDTDJ4wrd2CL8GafkrkeTgGiGK
	NT8YSEvbXdCLYgctQ7AUP/+wR56zwk3YECQpwG1KwlmZFYMIjqujmW071W5TLpiK4FxcDwwtDdo
	sxwvQPT6+A7Pzg9o950EuUvbISsVI
X-Google-Smtp-Source: AGHT+IG39wg4+SfI6QbDsnNVP9k5NdIqdTUynjs+9INnoKNB2fdUr4/IiXpXxER5ArqUSoMK0pfKtQ==
X-Received: by 2002:a05:600c:548e:b0:45b:8ac2:975e with SMTP id 5b1f17b1804b1-4620665613amr8870305e9.26.1758094375874;
        Wed, 17 Sep 2025 00:32:55 -0700 (PDT)
Received: from orion.home ([2a02:c7c:7259:a00:75ac:2ea2:dfdc:89c7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4613eb27f25sm25442035e9.23.2025.09.17.00.32.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 00:32:55 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Wed, 17 Sep 2025 08:32:52 +0100
Subject: [PATCH v3 3/3] ASoC: qcom: qdsp6/audioreach: add support for
 offloading raw opus playback
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250917-opus_codec_rfc_v1-v3-3-7737ad40132e@linaro.org>
References: <20250917-opus_codec_rfc_v1-v3-0-7737ad40132e@linaro.org>
In-Reply-To: <20250917-opus_codec_rfc_v1-v3-0-7737ad40132e@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: Patrick Lai <plai@qti.qualcomm.com>, 
 Annemarie Porter <annemari@quicinc.com>, 
 srinivas.kandagatla@oss.qualcomm.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 kernel@oss.qualcomm.com, Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, 
 Alexey Klimov <alexey.klimov@linaro.org>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
X-Mailer: b4 0.14.2

Add support for OPUS module, OPUS format ID, media format payload struct
and make it all recognizable by audioreach compress playback path.

At this moment this only supports raw or plain OPUS packets not
encapsulated in container (for instance OGG container). For this usecase
each OPUS packet needs to be prepended with 4-bytes long length field
which is expected to be done by userspace applications. This is
Qualcomm DSP specific requirement.

Cc: Annemarie Porter <annemari@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>
Co-developed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 sound/soc/qcom/qdsp6/audioreach.c | 27 +++++++++++++++++++++++++++
 sound/soc/qcom/qdsp6/audioreach.h | 17 +++++++++++++++++
 sound/soc/qcom/qdsp6/q6apm-dai.c  |  3 ++-
 sound/soc/qcom/qdsp6/q6apm.c      |  3 +++
 4 files changed, 49 insertions(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index bbfd51db879766445fa0fea564659fabd06b59ad..7e9c48ad0b88213fd39eab222c104a8e41c583da 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -883,6 +883,7 @@ static int audioreach_set_compr_media_format(struct media_format *media_fmt_hdr,
 	struct payload_media_fmt_aac_t *aac_cfg;
 	struct payload_media_fmt_pcm *mp3_cfg;
 	struct payload_media_fmt_flac_t *flac_cfg;
+	struct payload_media_fmt_opus_t *opus_cfg;
 
 	switch (mcfg->fmt) {
 	case SND_AUDIOCODEC_MP3:
@@ -925,6 +926,32 @@ static int audioreach_set_compr_media_format(struct media_format *media_fmt_hdr,
 		flac_cfg->min_frame_size = mcfg->codec.options.flac_d.min_frame_size;
 		flac_cfg->max_frame_size = mcfg->codec.options.flac_d.max_frame_size;
 		break;
+	case SND_AUDIOCODEC_OPUS_RAW:
+		media_fmt_hdr->data_format = DATA_FORMAT_RAW_COMPRESSED;
+		media_fmt_hdr->fmt_id = MEDIA_FMT_ID_OPUS;
+		media_fmt_hdr->payload_size = sizeof(*opus_cfg);
+		p = p + sizeof(*media_fmt_hdr);
+		opus_cfg = p;
+		/* raw opus packets prepended with 4 bytes of length */
+		opus_cfg->bitstream_format = 1;
+		/*
+		 * payload_type:
+		 * 0 -- read metadata from opus stream;
+		 * 1 -- metadata is provided by filling in the struct here.
+		 */
+		opus_cfg->payload_type = 1;
+		opus_cfg->version = mcfg->codec.options.opus_d.version;
+		opus_cfg->num_channels = mcfg->codec.options.opus_d.num_channels;
+		opus_cfg->pre_skip = mcfg->codec.options.opus_d.pre_skip;
+		opus_cfg->sample_rate = mcfg->codec.options.opus_d.sample_rate;
+		opus_cfg->output_gain = mcfg->codec.options.opus_d.output_gain;
+		opus_cfg->mapping_family = mcfg->codec.options.opus_d.mapping_family;
+		opus_cfg->stream_count = mcfg->codec.options.opus_d.chan_map.stream_count;
+		opus_cfg->coupled_count = mcfg->codec.options.opus_d.chan_map.coupled_count;
+		memcpy(opus_cfg->channel_mapping, mcfg->codec.options.opus_d.chan_map.channel_map,
+		       sizeof(opus_cfg->channel_mapping));
+		opus_cfg->reserved[0] = opus_cfg->reserved[1] = opus_cfg->reserved[2] = 0;
+		break;
 	default:
 		return -EINVAL;
 	}
diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
index 790fba96e34db0fc9d5c90504747174f56b65b32..d1b60b36468a86301601b61a7f8e7f6051561c3e 100644
--- a/sound/soc/qcom/qdsp6/audioreach.h
+++ b/sound/soc/qcom/qdsp6/audioreach.h
@@ -31,6 +31,7 @@ struct q6apm_graph;
 #define MODULE_ID_MP3_DECODE		0x0700103B
 #define MODULE_ID_GAPLESS		0x0700104D
 #define MODULE_ID_DISPLAY_PORT_SINK	0x07001069
+#define MODULE_ID_OPUS_DEC		0x07001174
 
 #define APM_CMD_GET_SPF_STATE		0x01001021
 #define APM_CMD_RSP_GET_SPF_STATE	0x02001007
@@ -257,6 +258,22 @@ struct payload_media_fmt_aac_t {
 	uint32_t sample_rate;
 } __packed;
 
+#define MEDIA_FMT_ID_OPUS	0x09001039
+struct payload_media_fmt_opus_t {
+	uint16_t bitstream_format;
+	uint16_t payload_type;
+	uint8_t version;
+	uint8_t num_channels;
+	uint16_t pre_skip;
+	uint32_t sample_rate;
+	uint16_t output_gain;
+	uint8_t mapping_family;
+	uint8_t stream_count;
+	uint8_t coupled_count;
+	uint8_t channel_mapping[8];
+	uint8_t reserved[3];
+} __packed;
+
 #define DATA_CMD_WR_SH_MEM_EP_EOS			0x04001002
 #define WR_SH_MEM_EP_EOS_POLICY_LAST	1
 #define WR_SH_MEM_EP_EOS_POLICY_EACH	2
diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index 09da26f712a6ada97196090d760b91bc2dc2a732..4ecaff45c51860cddc631725953ba7dfa84eeb50 100644
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -551,10 +551,11 @@ static int q6apm_dai_compr_get_caps(struct snd_soc_component *component,
 	caps->max_fragment_size = COMPR_PLAYBACK_MAX_FRAGMENT_SIZE;
 	caps->min_fragments = COMPR_PLAYBACK_MIN_NUM_FRAGMENTS;
 	caps->max_fragments = COMPR_PLAYBACK_MAX_NUM_FRAGMENTS;
-	caps->num_codecs = 3;
+	caps->num_codecs = 4;
 	caps->codecs[0] = SND_AUDIOCODEC_MP3;
 	caps->codecs[1] = SND_AUDIOCODEC_AAC;
 	caps->codecs[2] = SND_AUDIOCODEC_FLAC;
+	caps->codecs[3] = SND_AUDIOCODEC_OPUS_RAW;
 
 	return 0;
 }
diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index b4ffa0f0b188e2c32fdfb863b9130d1d11e578dd..0e667a7eb5467bdd65326099132e8ba9dfefa21e 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -354,6 +354,9 @@ int q6apm_set_real_module_id(struct device *dev, struct q6apm_graph *graph,
 	case SND_AUDIOCODEC_FLAC:
 		module_id = MODULE_ID_FLAC_DEC;
 		break;
+	case SND_AUDIOCODEC_OPUS_RAW:
+		module_id = MODULE_ID_OPUS_DEC;
+		break;
 	default:
 		return -EINVAL;
 	}

-- 
2.47.3

