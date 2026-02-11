Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com [209.85.167.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6344934FF62
	for <linux-sound@vger.kernel.org>; Wed, 11 Feb 2026 03:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770782096; cv=none; b=MMC414T2EwYonjxH/H5zMMDlU0Tm7w/fbvEgiQAFx9IYBaTVWCnAy4bm908xSfC4kgtoL553JrxWJ76DakZzzgrh/4E1c06QE2K320YoNT1gWaROiWx0LcOg3acSVrZWFurEkcbMq7g82aIXiGuUhEctPK3NGLdVHJYRLwCfVmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770782096; c=relaxed/simple;
	bh=P5kLVST21mq0WXtrvYwRskLpaUtwd4R/FfjlYu/PcQM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NAOX1uf95g5B4ay4Wum8rN6FrbGNkFxikJ7LfiWxqAH3MHj48UNaGfzCD9mV5TzpykkWhxgCXz5ih2lGrRTfPvyOgM+g9fKYsNZFyo+o31024QjFDR2Auf23rrPuqIeb9uqgGeuA7/5K6qr8fjQEGj3l5r58sYQHspPNsYRjT+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cq60VWuL; arc=none smtp.client-ip=209.85.167.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cq60VWuL"
Received: by mail-oi1-f196.google.com with SMTP id 5614622812f47-45f004e7d71so337955b6e.1
        for <linux-sound@vger.kernel.org>; Tue, 10 Feb 2026 19:54:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770782094; x=1771386894; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WsTdfccGqb1uJ0g1iA5avj4gtZCqVvJmBjk0T3KnHAo=;
        b=Cq60VWuLGlQVI2wRx3T9kYOhpfA6Ag71++WoU1kamkdAZeQMMjwa+gBpeU3P9aMDS4
         duj1qweOOqfesr7wfLQV8UIV0ysWwLxg3XGt/SERQar76YfhWnzdz4VO+2JgiJIsg++o
         4Bm9rsncgB/t6Mv8zyGgL1L4NO7LQu0EmIUX11wMC2RPGflH+01vX2gILcE+x9Wth/sk
         T7DvftbYFBADSZ3sJindnhJkiJWTeVtdScE1IgfCVv89ZBB7pkH3t6XTqDXWCwCyrblw
         Vm5z98BIFj88KWeOcOzjvVvXNs4kOJL7bvui+BCRvfUmS1SEbkeXUJ3qOXvwBua6+WIV
         +tMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770782094; x=1771386894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WsTdfccGqb1uJ0g1iA5avj4gtZCqVvJmBjk0T3KnHAo=;
        b=qvhWsWZNoZeMGpld2fkOyp2eBKNl5A+TO1zg7NwtwvBrp0TSSTeUa/PEHCtxl/B6Zh
         amGxDcmR+FIC8oCO+tP2eZ+KPahhUojtpgH92JsgVQruC8D0GeMvd93HipK+OALGyBUH
         T2y24i3SSduie0NKTGoAXGUVsjyQBopovtIiJNQyV7D/CwUfZLT9A5b0JzqkO83Rn5x4
         agddAdFaVIUyNqMgghn6dCg6CTNjRNRaDzEEcbLMBE68s7Vb3dDW7nneefsciJsjQwi2
         uxFNo6zF0tCmK2d3SjT2V7JTCSCAWT53UMEXwCzHlLFBWp8M7gTa+H4//2ShSKdyMbK2
         dhfA==
X-Forwarded-Encrypted: i=1; AJvYcCVb0E2UhQR347taalhMeel9nGvLIDeC7eokXL1zgUikJvY2JU0YG1LxP3r05GiF9TtX2LlsRCfw5Js/Cg==@vger.kernel.org
X-Gm-Message-State: AOJu0YykvRKmPm3apAWqU8JbQjoZid52NrGXNyP31fnIpfs0DOOfc1Xw
	MhZ2sfXhucA95Xyl8kXrNDX4XTniJOLkVKGHTzBdE+2LhaeCusjOpZdyz/btr61N
X-Gm-Gg: AZuq6aLr3ORw1yCdE2Qa0fVhsIOWYRKf0azNfZJCSK9bpge2nsTn+DmQGcKwcqqQvFN
	xi7+Rpn34gKiPglr+FgESSPs0AF90kSo+a8B+D6eGRwg6dbmRPpznVzDVWYvej9Xkp8uBxz3vxr
	dLwHeZrHKkluW+Ld+aosSXeRsn8rgUYxb0BXA8ctFmzb8PtBPP59DYafpZsIaGeuLaE3TBZQV0v
	slODpyyV8Prpq10y0WiQlO2L9wiG+DUGnZ2hvgYAAaPJwkU+9RMtZ5KEiX2YqeaIiLFnt0LgU+I
	H5SFrt087xsatvIEr1+qJ8npH4tEjTGY91DDg01R1tNEQCtY9QGbsF9olgRyRZ0YKN2vY18dOrB
	nqcvGXseKV6TUUwNiKENGExk1tLhNmM/nh2o8CP8JxVAo40V56Vkbbdd9r1Pp3vRYWYLQm+P77n
	X8H6ibC60WqkdDxgKSZiySM4flwQ==
X-Received: by 2002:a05:622a:1353:b0:4f1:e79a:1e0 with SMTP id d75a77b69052e-50672e0c220mr51930831cf.20.1770775386125;
        Tue, 10 Feb 2026 18:03:06 -0800 (PST)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50684b6b220sm1673851cf.18.2026.02.10.18.03.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 18:03:05 -0800 (PST)
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
Subject: [PATCH 05/10] ASoC: qdsp6: q6dsp-lpass-ports: add internal mi2s support
Date: Tue, 10 Feb 2026 21:02:57 -0500
Message-ID: <20260211020302.2674-6-mailingradian@gmail.com>
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

Add the internal MI2S stream capabilities as specified by the audio
kernel modules and configure the ports as MI2S ports.

Link: https://android.googlesource.com/kernel/msm-extra/+/530cffa4cc977a348753831b163eb9d3302b954a/asoc/msm-dai-q6-v2.c#4597
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c | 200 +++++++++++++++++++++++
 1 file changed, 200 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c b/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c
index 4eed54b071a5..fc79934fc1bf 100644
--- a/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c
+++ b/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c
@@ -594,6 +594,205 @@ static struct snd_soc_dai_driver q6dsp_audio_fe_dais[] = {
 	Q6AFE_CDC_DMA_TX_DAI(TX_CODEC_DMA_TX_5),
 	Q6AFE_CDC_DMA_RX_DAI(RX_CODEC_DMA_RX_6),
 	Q6AFE_CDC_DMA_RX_DAI(RX_CODEC_DMA_RX_7),
+	{
+		.playback = {
+			.stream_name = "INT0 MI2S Playback",
+			.rates = SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000 |
+				 SNDRV_PCM_RATE_44100 | SNDRV_PCM_RATE_48000 |
+				 SNDRV_PCM_RATE_192000,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE |
+				   SNDRV_PCM_FMTBIT_S24_LE |
+				   SNDRV_PCM_FMTBIT_S24_3LE,
+			.channels_min = 1,
+			.channels_max = 8,
+			.rate_min =     8000,
+			.rate_max =     192000,
+		},
+		.id = INT0_MI2S_RX,
+		.name = "INT0_MI2S_RX",
+	}, {
+		.capture = {
+			.stream_name = "INT0 MI2S Capture",
+			.rates = SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000 |
+				 SNDRV_PCM_RATE_48000,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE,
+			.channels_min = 1,
+			.channels_max = 8,
+			.rate_min =     8000,
+			.rate_max =     48000,
+		},
+		.id = INT0_MI2S_TX,
+		.name = "INT0_MI2S_TX",
+	}, {
+		.playback = {
+			.stream_name = "INT1 MI2S Playback",
+			.rates = SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000 |
+				 SNDRV_PCM_RATE_48000,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE |
+				   SNDRV_PCM_FMTBIT_S24_LE |
+				   SNDRV_PCM_FMTBIT_S24_3LE,
+			.channels_min = 1,
+			.channels_max = 8,
+			.rate_min =     8000,
+			.rate_max =     48000,
+		},
+		.id = INT1_MI2S_RX,
+		.name = "INT1_MI2S_RX",
+	}, {
+		.capture = {
+			.stream_name = "INT1 MI2S Capture",
+			.rates = SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000 |
+				 SNDRV_PCM_RATE_48000,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE,
+			.channels_min = 1,
+			.channels_max = 8,
+			.rate_min =     8000,
+			.rate_max =     48000,
+		},
+		.id = INT1_MI2S_TX,
+		.name = "INT1_MI2S_TX",
+	}, {
+		.playback = {
+			.stream_name = "INT2 MI2S Playback",
+			.rates = SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000 |
+				 SNDRV_PCM_RATE_48000,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE |
+				   SNDRV_PCM_FMTBIT_S24_LE |
+				   SNDRV_PCM_FMTBIT_S24_3LE,
+			.channels_min = 1,
+			.channels_max = 8,
+			.rate_min =     8000,
+			.rate_max =     48000,
+		},
+		.id = INT2_MI2S_RX,
+		.name = "INT2_MI2S_RX",
+	}, {
+		.capture = {
+			.stream_name = "INT2 MI2S Capture",
+			.rates = SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000 |
+				 SNDRV_PCM_RATE_48000,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE,
+			.channels_min = 1,
+			.channels_max = 8,
+			.rate_min =     8000,
+			.rate_max =     48000,
+		},
+		.id = INT2_MI2S_TX,
+		.name = "INT2_MI2S_TX",
+	}, {
+		.playback = {
+			.stream_name = "INT3 MI2S Playback",
+			.rates = SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000 |
+				 SNDRV_PCM_RATE_48000,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE |
+				   SNDRV_PCM_FMTBIT_S24_LE |
+				   SNDRV_PCM_FMTBIT_S24_3LE,
+			.channels_min = 1,
+			.channels_max = 8,
+			.rate_min =     8000,
+			.rate_max =     48000,
+		},
+		.id = INT3_MI2S_RX,
+		.name = "INT3_MI2S_RX",
+	}, {
+		.capture = {
+			.stream_name = "INT3 MI2S Capture",
+			.rates = SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000 |
+				 SNDRV_PCM_RATE_48000,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE,
+			.channels_min = 1,
+			.channels_max = 8,
+			.rate_min =     8000,
+			.rate_max =     48000,
+		},
+		.id = INT3_MI2S_TX,
+		.name = "INT3_MI2S_TX",
+	}, {
+		.playback = {
+			.stream_name = "INT4 MI2S Playback",
+			.rates = SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000 |
+				 SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_96000 |
+				 SNDRV_PCM_RATE_192000,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE |
+				   SNDRV_PCM_FMTBIT_S24_LE |
+				   SNDRV_PCM_FMTBIT_S24_3LE,
+			.channels_min = 1,
+			.channels_max = 8,
+			.rate_min =     8000,
+			.rate_max =     192000,
+		},
+		.id = INT4_MI2S_RX,
+		.name = "INT4_MI2S_RX",
+	}, {
+		.capture = {
+			.stream_name = "INT4 MI2S Capture",
+			.rates = SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000 |
+				 SNDRV_PCM_RATE_48000,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE,
+			.channels_min = 1,
+			.channels_max = 8,
+			.rate_min =     8000,
+			.rate_max =     48000,
+		},
+		.id = INT4_MI2S_TX,
+		.name = "INT4_MI2S_TX",
+	}, {
+		.playback = {
+			.stream_name = "INT5 MI2S Playback",
+			.rates = SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000 |
+				 SNDRV_PCM_RATE_48000,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE |
+				   SNDRV_PCM_FMTBIT_S24_LE |
+				   SNDRV_PCM_FMTBIT_S24_3LE,
+			.channels_min = 1,
+			.channels_max = 8,
+			.rate_min =     8000,
+			.rate_max =     48000,
+		},
+		.id = INT5_MI2S_RX,
+		.name = "INT5_MI2S_RX",
+	}, {
+		.capture = {
+			.stream_name = "INT5 MI2S Capture",
+			.rates = SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000 |
+				 SNDRV_PCM_RATE_48000,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE,
+			.channels_min = 1,
+			.channels_max = 8,
+			.rate_min =     8000,
+			.rate_max =     48000,
+		},
+		.id = INT5_MI2S_TX,
+		.name = "INT5_MI2S_TX",
+	}, {
+		.playback = {
+			.stream_name = "INT6 MI2S Playback",
+			.rates = SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000 |
+				 SNDRV_PCM_RATE_48000,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE |
+				   SNDRV_PCM_FMTBIT_S24_LE |
+				   SNDRV_PCM_FMTBIT_S24_3LE,
+			.channels_min = 1,
+			.channels_max = 8,
+			.rate_min =     8000,
+			.rate_max =     48000,
+		},
+		.id = INT6_MI2S_RX,
+		.name = "INT6_MI2S_RX",
+	}, {
+		.capture = {
+			.stream_name = "INT6 MI2S Capture",
+			.rates = SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000 |
+				 SNDRV_PCM_RATE_48000,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE,
+			.channels_min = 1,
+			.channels_max = 8,
+			.rate_min =     8000,
+			.rate_max =     48000,
+		},
+		.id = INT6_MI2S_TX,
+		.name = "INT6_MI2S_TX",
+	},
 };
 
 int q6dsp_audio_ports_of_xlate_dai_name(struct snd_soc_component *component,
@@ -636,6 +835,7 @@ struct snd_soc_dai_driver *q6dsp_audio_ports_set_config(struct device *dev,
 			break;
 		case QUINARY_MI2S_RX ... QUINARY_MI2S_TX:
 		case PRIMARY_MI2S_RX ... QUATERNARY_MI2S_TX:
+		case INT0_MI2S_RX ... INT6_MI2S_TX:
 			q6dsp_audio_fe_dais[i].ops = cfg->q6i2s_ops;
 			break;
 		case PRIMARY_TDM_RX_0 ... QUINARY_TDM_TX_7:
-- 
2.53.0

