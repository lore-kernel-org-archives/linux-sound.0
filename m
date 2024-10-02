Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D021517BD6
	for <linux-sound@vger.kernel.org>; Wed,  2 Oct 2024 02:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727835628; cv=none; b=s0gayiEGsG3nDGPcVx7nBG970EdMhvO2SvD6PxBhznbU86bd3W14zhvluYNzFa53IobfxASIv68Pr6ifMyMgguvooJUL3mZy3E9o3nPja68nHqMumqsuBgKb1ZHQnZvIEOIsmkllAYY3iGX4iJ+M5CU9xDYfhNhEdcG6VqSpN/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727835628; c=relaxed/simple;
	bh=LOfadXrLg7ZRoN+A8CWVlfI8ytsXadkatDmRlJNEVAg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VIGJaBB2G8fVKaGNsdfBRy14ibY1qzhl0NuXN5GSMwzUK2MupuaVFfp4v90TOlT6+gPAJKr7zDDi+pRlUHC7dK0npc1VI5U3xVJh25kTLga5L77HhZ5HzsZ031kefFDz5xtCDNR2ZeIWokGMyTf6Xnn5fVsJkQqExkzyMmKPaww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MSPHdhaT; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MSPHdhaT"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a8d51a7d6f5so802091166b.2
        for <linux-sound@vger.kernel.org>; Tue, 01 Oct 2024 19:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727835625; x=1728440425; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OCYOTM8/0Ug4V9lj8bQNm7elnTCjMFp7xXGYdHTDU3c=;
        b=MSPHdhaTgmrYkMv+nfF0ucq6Q2yt8NL/FoXOKvB8Ya237KlalA75OfLZzP7N36IHNZ
         wmsFxajkYHYfWDXw+fv1ZD6Hwny6PQasQakgrJCOT6owYYTvrWfg8aAdnhsGEfb9UhS5
         T1YGf7VqfqI7huYHL7q5mDRu5vqjCgHbXTBK2FrmNYzpx2ljeLvCFIvYfwwdFblMFMid
         qkRgOeVlgP0MDIAG7UJr4u1K3zikMq90NLL2ho4qfnJS+cQYIBCrrUU8g6IK0q8LR3yR
         XSLoJegG/34m+sQRc0Z1j2Z7d9hVnAokrS5tCz6wod91jz1JWGMq5FZTgAySX/ppoJXf
         jzrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727835625; x=1728440425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OCYOTM8/0Ug4V9lj8bQNm7elnTCjMFp7xXGYdHTDU3c=;
        b=jQgFTcUhkcgGMsViEd2lSz7e8WVrvpNUPGqSntewZ7cdH2jQCE6CUiFL9U8KqkEYKx
         3lPQu8btfDurFHliM1iGORhZVvxIUIvDT379bimx7BH0BHaoTUL8s40yOJ3SC/+cqsQK
         bueOBtOH11oxm5Pq5gcI82+wdgSGBqu6KiDg4o549aHpYF7b08f4V6bZ57sFfPZKY8M5
         P3N7VKbFHX4gJsWPOOSTRBxR1EkfkBitXgE70UHKndiSe7ayrpEGZ8t+kxEZlaFPTGuI
         QTIkqFkRMK7qe6f1tLd4KRQG39Avz8uAlbatHOiJRLAZJGdIRd4SOJAy42mpC9ScrucZ
         nvzw==
X-Gm-Message-State: AOJu0YwUwALaGKoii0aO4rWfsIA1+MDe9rz6846mjKKSoRxyhgFqDl/f
	zRXQeBH6uFYFwr493+/F9d2njze/uHUP/cRP872ENZQCQm8ULJwKDZeDohYZMyIzf/K8DEZzszZ
	XYpw=
X-Google-Smtp-Source: AGHT+IG+Q/gURHat1q3AUvb0+GovkmpG4ajTJTbVyAEb1VAT3Jst29VyqLUHNkKFUyiefEeDXTOUcg==
X-Received: by 2002:a17:906:99c5:b0:a7a:9144:e256 with SMTP id a640c23a62f3a-a98f8213366mr125224866b.6.1727835624893;
        Tue, 01 Oct 2024 19:20:24 -0700 (PDT)
Received: from localhost.localdomain ([2.125.184.148])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c2945f2esm787518866b.117.2024.10.01.19.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 19:20:23 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
To: linux-sound@vger.kernel.org,
	srinivas.kandagatla@linaro.org,
	bgoswami@quicinc.com,
	lgirdwood@gmail.com,
	broonie@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	konrad.dybcio@linaro.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	elder@linaro.org,
	dmitry.baryshkov@linaro.org,
	krzysztof.kozlowski@linaro.org,
	caleb.connolly@linaro.org,
	linux-kernel@vger.kernel.org,
	a39.skl@gmail.com,
	alexey.klimov@linaro.org
Subject: [PATCH v2 3/7] ASoC: qcom: sm8250: add handling of secondary MI2S clock
Date: Wed,  2 Oct 2024 03:20:11 +0100
Message-ID: <20241002022015.867031-4-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241002022015.867031-1-alexey.klimov@linaro.org>
References: <20241002022015.867031-1-alexey.klimov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add handling of clock related to secondary MI2S_RX in
sm8250_snd_startup().

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 sound/soc/qcom/sm8250.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
index 19adadedc88a..8776c35a98df 100644
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

