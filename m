Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 603492D047
	for <linux-sound@vger.kernel.org>; Fri,  1 Nov 2024 00:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730422775; cv=none; b=Qk/d+s7m94UPFh6iHZ5o2xnWktXtnk/bq+otK1OUF4ezK/joF6z8EPwfKsqLYsj/60Z9a/AhorRRy0uh7PilWMhxxU8s4BUd8cnsaIWOzMhTY8HZ3wDt9EAXG3J1K7f8KC0eWTYclN5vjS3uTZcCbhB3FFa6L7ce2ryNsuR2L/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730422775; c=relaxed/simple;
	bh=VYOcc9RVqAC3xOcalVCeGB8TpM4JFvOp4HfDK7tCROM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tn9vOPoTAxqmi2UCP64TaCYI4xY1bpgflTo5Xpjgbo1ATN8nlONYNZcPlpHGrnE9x8sX6OiagkiX7UaPwWCXf9nJFv36GDuhTJ572vpeVWImwqaSBnwCIL9AJEMhiq8JC80wBrqdfdslVl6DnCqGEAGqtcF06WDVO+iYuIcW1EM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SSa0rUuG; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SSa0rUuG"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4316f3d3c21so11956945e9.3
        for <linux-sound@vger.kernel.org>; Thu, 31 Oct 2024 17:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730422767; x=1731027567; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IzDTogGhhkM8ckQfZ1srs6eHShvXoQY5Qk/joVtqUSk=;
        b=SSa0rUuG3kyfgmXynKvpjaS0Os6tYfJiCOza2JlBCpmuffMmkWAbtAsL8xHJ8wAakY
         pVfFeDXaBhnoKS8FB3bp2crYmUx5OFIKecnX+9kDoNDmCR6COIsRgMpKnTU8EfsieI5L
         Sa9TG6L1eHcl1w8u/38EMRZJCZdokI/3/eYMiJg6AYvTldluIzCQd0BzoaQBlDagYS4D
         F0LNb654NkP+OeCZfPlWsbFj2aN7iGNlpkxlJWcp2P5LwM9y03PvTW0O22LbuOyh9599
         NYCIsq5b1kO2ym2XrHAz57zLjyZ6t1gIYjcPVastvmFy/e+A3RGSIyNCyF4BioVHK7kj
         U9RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730422767; x=1731027567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IzDTogGhhkM8ckQfZ1srs6eHShvXoQY5Qk/joVtqUSk=;
        b=OWDR/dsQU2ts7WYfgpOasjNYr0tIF+of/OkyYOSQvfHX3f9O3MKfSO4I/oXsudZtNA
         WBw7nyGRMiSfrMKIC/98oyyb3tzmsXagzVjx93WGO1QtPQobTy99um1D158wxYH6haW8
         wfn8Yj21gLbMdVK65SRkn1T9wa1nhlmGa01C7eJASDNVUj/szcglLsVNuNoqnXGII23Y
         0ic+ytfxiKRyOr8gqU/8AuXKORrxqmTbfe0r8d2AXHwdZ4WDxlRO3OkvikB5MisnhRT0
         eu6sL5VdaHzA5fBRo5noDu/aNcPSVueIf84+oMU1//M2fHZQXyanuzfr74OlWWit2AVW
         g2mg==
X-Gm-Message-State: AOJu0YxY3xvAO4DidEu9BLMDGsQOo/YIHh6NRjN6sCskNwQ5vbsDrF0T
	MRLCe45ypXP8Hi+jyisICmYzpmcFSLKwbyxrZFKjDUw+eCYnEFqGI9/EmH33Zyg+vvtWGHI3/GG
	i6Kw=
X-Google-Smtp-Source: AGHT+IGoo1Wx0x9GicVS6Lf8vGvXGXy7SteUPJXzc0hWHa1ePvPlZLE7pqw6+/D43PB2BhmqrBjLvw==
X-Received: by 2002:a05:600c:3c8d:b0:431:58cd:b260 with SMTP id 5b1f17b1804b1-431bb9d0bdemr85023455e9.25.1730422767291;
        Thu, 31 Oct 2024 17:59:27 -0700 (PDT)
Received: from localhost.localdomain ([2.222.231.247])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd947a9fsm74208035e9.22.2024.10.31.17.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 17:59:26 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
To: linux-sound@vger.kernel.org,
	srinivas.kandagatla@linaro.org,
	broonie@kernel.org
Cc: lgirdwood@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	dmitry.baryshkov@linaro.org,
	krzysztof.kozlowski@linaro.org,
	caleb.connolly@linaro.org,
	linux-kernel@vger.kernel.org,
	a39.skl@gmail.com
Subject: [PATCH v4 1/5] ASoC: qcom: sm8250: add handling of secondary MI2S clock
Date: Fri,  1 Nov 2024 00:59:21 +0000
Message-ID: <20241101005925.186696-2-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241101005925.186696-1-alexey.klimov@linaro.org>
References: <20241101005925.186696-1-alexey.klimov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add handling of clock related to secondary MI2S_RX in
sm8250_snd_startup().

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 sound/soc/qcom/sm8250.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
index 91e9bba192c0..45e0c33fc3f3 100644
--- a/sound/soc/qcom/sm8250.c
+++ b/sound/soc/qcom/sm8250.c
@@ -63,6 +63,14 @@ static int sm8250_snd_startup(struct snd_pcm_substream *substream)
 		snd_soc_dai_set_fmt(cpu_dai, fmt);
 		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
 		break;
+	case SECONDARY_MI2S_RX:
+		codec_dai_fmt |= SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
+		snd_soc_dai_set_sysclk(cpu_dai,
+			Q6AFE_LPASS_CLK_ID_SEC_MI2S_IBIT,
+			MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
+		snd_soc_dai_set_fmt(cpu_dai, fmt);
+		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
+		break;
 	case TERTIARY_MI2S_RX:
 		codec_dai_fmt |= SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
 		snd_soc_dai_set_sysclk(cpu_dai,
-- 
2.45.2

