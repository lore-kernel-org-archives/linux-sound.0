Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC3E358387
	for <linux-sound@vger.kernel.org>; Wed,  4 Mar 2026 19:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772654326; cv=none; b=TPhhuZiAlRsjVPcNowsrxzYrWjp3r7qat4+e9OvuUeNn8X7NLbfpQj8RaVSQdWLGJJ+rLiBrUodHLB6j/w9Q5RgmIqwTihZID+9ehE3hMi4WTRRy9Ca5kqpNfutMfJ0tRQAC2yoTySOzs3nj8pNQtIrx6XQ1hERoIgcfqMaMwZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772654326; c=relaxed/simple;
	bh=P5kLVST21mq0WXtrvYwRskLpaUtwd4R/FfjlYu/PcQM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hpUSASdda0y1SkkgtIKt6/MZPKQucMu7/ruPyVfhyc+/ld/7u10fQ+XXLKUppUbAPJCKzrJFKh+C2jWyPGxIrHFl6XdHeNPUJ2n6h3W8AiiSwFArlOCzaXhCwkIJxtPMtP9FkHn7RSdq4vLz3w1sZ6RhV9n/4iuNcU3D029DFh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GSGJ/+8o; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GSGJ/+8o"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-899ee87355dso53042496d6.1
        for <linux-sound@vger.kernel.org>; Wed, 04 Mar 2026 11:58:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772654325; x=1773259125; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WsTdfccGqb1uJ0g1iA5avj4gtZCqVvJmBjk0T3KnHAo=;
        b=GSGJ/+8oceMImYWaJNRZbk71L3xn6J/23U2Ep0GDze3OZbl0fW3kYyKVoO8MGpKzXD
         nx02ZXvj6kF55eSPnvW2aUxSM2CuNiMCzbUByzimdVf7oczcOrYFVSPvalsKSXpRAGSd
         dqX3cr94LjJ4GLToBXfJq1DCiwr1qE1YR9dIS5QtSYiL/b60mVFxomkeOfbnjz8FZc21
         YwICkUCaAbschzBigkLdtgS82LHxw2Co4jZ48/9cnRMOk+zPhObytGiU9dTKNHLlBShP
         4lQoT2059ZrqzRwuDFwowfzb6i1KYqFjYihY1Hq78uiysnsn0a575agcZxhK/ZnSRRQx
         tH2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772654325; x=1773259125;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WsTdfccGqb1uJ0g1iA5avj4gtZCqVvJmBjk0T3KnHAo=;
        b=eXXuG+iSVYiyN6MJ5wVysheNXiYvDIWtr6Udcpljvxdd0k73voSz7P6GwNiTsVgdH4
         4ASSQZr2ljUDLIuKMLqO5HNWHKrzmabcJmuiQ8URfanA0QZRlqAt7mIT5m19hIhLJxsT
         teuZz/vJWQXsmyKx03pehZXVPC0acZwllSXUvje3m7MEwQfaX08m1pidrBjqkOykAGZf
         LPJV+AXB/Jl2MgB9VGXWm+EOrZMMUkdGLIwhD7imAMjc1+VxymlNb84k0Z3wRL+pljla
         Zj++PvFcQ/z3cF3XcvsxwDLvivbFkuJbwN1hMw3siwcvvKxrhtIp/v/M1oGBrcuzEUyO
         V7lg==
X-Forwarded-Encrypted: i=1; AJvYcCX1YycALGqt3PKmEaQ4F4zixKCFGqfP1/+k7bUpusEW47JrkaDKCZvVe0iFM9rlBr3U/kh7diGvgMbWYQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywcid220NxWXozxrXfSNkrJXoURCsZV3BQAi5U7exDYBSk7/Y1s
	jz3IRJ63Q23fFXaNVDDHlQXjlJsdf5oGbEVnea8eUE8RgXJiEC9VUDvy
X-Gm-Gg: ATEYQzwCMqT6SNRfsFrzpilxfJjvZfTTHnRFnKtKBQuYFbmiKkiB0D9Q+Zbn4n3llYC
	klbXdiB3Z1fvSeagKjBCk9c69WtSn9J2cBr6N9r1IBJc8pAq1LMefvrq6LeHxLP5zAgVwBPH6N1
	o/bz1Sve6oVyh68gkJYd4vEoFajrftj/KHpS58x6y3ngbPM8VKFoCTqNe13rwEF3m28aOa1NEIn
	CdtSkHU339zdsAVXIYwTt990taTPAk/ESh8njOyKju1K9NIbxmrfevOfFjSL+y+Qk3Isgm+eDu5
	3uQcwgBEPuKQFtJZjdnXOqBwmcF9iwxKtOnMMeWLnsanOqXuArk4meCGJDj+juC7FkawyQv4dEE
	eKCxeDspjERfZ1jAGB7vxT6iZBHCXd3Rx3Onntx6KUrQIc/2FqIRz5eL4a430FycOEfNfMkU/5B
	zDgD/k78WG8AAboW40mfakG5p2B3orIOwtw/ZB
X-Received: by 2002:a05:622a:34b:b0:503:4257:da03 with SMTP id d75a77b69052e-508db2bb5b3mr45036691cf.30.1772654324550;
        Wed, 04 Mar 2026 11:58:44 -0800 (PST)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-507451cda23sm175614671cf.18.2026.03.04.11.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 11:58:44 -0800 (PST)
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
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Nickolay Goppen <setotau@mainlining.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v2 05/11] ASoC: qdsp6: q6dsp-lpass-ports: add internal mi2s support
Date: Wed,  4 Mar 2026 14:58:09 -0500
Message-ID: <20260304195815.52347-6-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260304195815.52347-1-mailingradian@gmail.com>
References: <20260304195815.52347-1-mailingradian@gmail.com>
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

