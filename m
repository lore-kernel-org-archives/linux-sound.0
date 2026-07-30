Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E145D3AFD08
	for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 17:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785433483; cv=none; b=jznZo/BrkssggxPV+vnYvaYOiqWav0OcKPed9qoTEmTiGqMyGSZhd+KlhvHpp79jEMJeOzY70YWflH/xrMJCLExUHVIKIijYoQe5jRMTy2IOVY8QbF7iOlLZ2HhNK3SXcuwK8wxN9aQDIfKuMAtTafcAO72Xgi98oWeGaSiyOS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785433483; c=relaxed/simple;
	bh=i57bIE3oWsXpjLi5eNTkvRkopFb2vCFsU9D752DApvs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TftiIxuzs9uuiHPSR79t8EUf8RI3t9dp5ta8G3ca6UsTgEjSeJw+NHARPYL7F5ahTaIlCQnj6mhXjS4QrWDnsKlUQp2BfcPAC1T/iW7MpBzV8hXrnK1x6YV10y+y7g40NohywVqYkrj5HucfIWaDUQvkvBA46xrmJRMkVnaLTHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Iy/q185g; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Iy/q185g"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-93108a3c326so69250085a.1
        for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 10:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785433481; x=1786038281; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eBYL17FVAMHOOqwKdjm1RVfjr5GLIDjm0/CO52+4a9o=;
        b=Iy/q185g5HdeRoZppXhkQBgcBD0Ok1n5NvaFQ7x9IF0LCWkh+cNo1SmDzbdf6CPtFD
         zKD9KwdY+13Btg2OCf0CuHy1pKqSHTibF20/eTn+OmY9TKoFLAmLpwMbrK3DyRLD+pz0
         LHcb39Y+goLQdtazxYA+zHY6KWvkHK0z5iy3bB5x3XwODfiewhzvJHoXKHzNZ15PFHgt
         l9KfWiFytiLl7zpbWKt8vnJzfUIsTc53cjPVAq2dZiV9TWX7QxAYvMnMJXTiBNgqvVLO
         04KnJ362ks2tQtp5Yj6p1+AzRIhUwy4eTCcM0SqmO1Px1UiptfXcsas+h6cJbpOh1TsI
         lB7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785433481; x=1786038281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eBYL17FVAMHOOqwKdjm1RVfjr5GLIDjm0/CO52+4a9o=;
        b=tJH9QYu5IBs87KPBVLkXHgoCUhr4Bz7cLRg+UbE4OI/6SdKFrABp5vBqaqb7xrDeMQ
         ig0U4jDPwcVAeTLTs5VYM3SaHeEfn9Hwfr9ZRHfLuSQuzloOuMKmcAU4UUSyQBjrlb8h
         oq9hIE9wGS0WcRL1U7OpLVBa3UmPUUiNexmu3lSv+o07al1dBKQtYfwdz0jnAdKQlVVV
         5rePQxtn4VlgyeKYOspH8SwbXHAcy61VuSfJVxVd5Vtd9laP2qDCjW8fkm5ymenX7rts
         pCkniRsabmYjBSzzFWy9edszZ+mSR/fQ81IC9D37jMO8RKnOB1HQyvuBh7biSQvsK/aV
         u8aQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp6MKVWI8fY9km22lk3/saRCPuLt+zghthtjARkRfxhITKMgx31UXl//IzG0gtjGbo3SWldkaIAxWF1hA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyBm03+gUud3ER2MosZxCJ/ysZaOIKJSDbxSx7fM4HGm0HYrk1U
	49odMigTnVBN4FSDEJGYPeikZkZ6kH/S79MsBICo04fe5vRfHbkTScJ+
X-Gm-Gg: AR+sD12FH2wiiRqoBl+9S+86xPGIWQoUGZBPgJdatzQkA24P+t0nb6nT8fO+Xp9XYe8
	8V+8fqN0HE3HwiJTWo1cOeLR3RRQ/dETk+2/2Vd3uWXS22KJ+Ud201XbHIk1TtWVlPL/c2oitx8
	11N/l6pjlpdeKzQ4R+l1zVyKj1LSRCIbfcaX3f8UY9dnSuttuAK5esTn27XFTmhw8xIKCmIN44p
	lp0NVRwX028aFqmak0MmnWpazuPX3OafPaUETtfuUmNmkBQggXt4H6kJtQkzROwMzWo3D/zj9Ra
	fulcHFRzF7kbAqljR4lZG00DlMqCz2H4x4VsslmRq75SV2avH9f7ymJ37W1mh9nYbNQ5q5A1PDx
	aEahFQkkyBXk7MWnKtuxhSLYRVhHRfJh4lI7SXoc77mWJt6tVK9auUmNqsvuToK3CvXt9I2vBgT
	U8fNT37+3MqQ312XWYbQQFGAGuXA8oNx6Es0icsxnJMpaTXz8fhyxJviWybqI=
X-Received: by 2002:a05:620a:2258:20b0:92e:fffc:a5ea with SMTP id af79cd13be357-9348eb77b5cmr121841785a.4.1785433480860;
        Thu, 30 Jul 2026 10:44:40 -0700 (PDT)
Received: from localhost ([70.54.57.80])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-933d3221ac2sm458440885a.3.2026.07.30.10.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 10:44:40 -0700 (PDT)
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
Subject: [PATCH v6 11/15] ASoC: qcom: sm8250: add support for LPI_MI2S_RX_0 and LPI_MI2S_TX_3
Date: Thu, 30 Jul 2026 13:43:49 -0400
Message-ID: <20260730174353.108023-12-mailingradian@gmail.com>
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

The LPI_MI2S_RX_0 and LPI_MI2S_TX_3 ports on SDM660 can be connected to
the digital and analog WCD codecs. They can be supported with the same
logic for other ports, but just need to be explicitly stated. Add
support for these ports.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 sound/soc/qcom/sm8250.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
index f193d0ba63d0..1952c599e004 100644
--- a/sound/soc/qcom/sm8250.c
+++ b/sound/soc/qcom/sm8250.c
@@ -112,6 +112,22 @@ static int sm8250_snd_startup(struct snd_pcm_substream *substream)
 		snd_soc_dai_set_fmt(cpu_dai, fmt);
 		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
 		break;
+	case LPI_MI2S_RX_0:
+		codec_dai_fmt |= SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
+		snd_soc_dai_set_sysclk(cpu_dai,
+			Q6AFE_LPASS_CLK_ID_INT0_MI2S_IBIT,
+			MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
+		snd_soc_dai_set_fmt(cpu_dai, fmt);
+		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
+		break;
+	case LPI_MI2S_TX_3:
+		codec_dai_fmt |= SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
+		snd_soc_dai_set_sysclk(cpu_dai,
+			Q6AFE_LPASS_CLK_ID_INT3_MI2S_IBIT,
+			MI2S_BCLK_RATE, SNDRV_PCM_STREAM_CAPTURE);
+		snd_soc_dai_set_fmt(cpu_dai, fmt);
+		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
+		break;
 	default:
 		break;
 	}
-- 
2.55.0

