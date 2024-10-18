Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF91C14E2E8
	for <linux-sound@vger.kernel.org>; Fri, 18 Oct 2024 02:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729220099; cv=none; b=Uz3/Bfd+Qg1FLbv9ZVxAUeBbMYNap1MhDXmmtfOjcoZ8A3HPbJbS7BjEZwkIFgzdc62niphkbisGgCbRMzclDIXHqjvq4iirPlW3jVVdPE6+FzJ8Nr8lSuRJgeKFZgRROq9ihDMZ+ZSrqCsCf0MbsgCt7E88HT/NpxmX7yf9cKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729220099; c=relaxed/simple;
	bh=VYOcc9RVqAC3xOcalVCeGB8TpM4JFvOp4HfDK7tCROM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iRVa3bLKYhD6MJkxb9EPI11WPly2Ljc5U+A+xhM+XoOkdHqdC68udgGpwj/ioOpxOhnMibmEtLs56+07qZWmZOVltx+Baa+vO0ZLF5MaTFXdpenNWd8U5Tob18NvkSJKw2dH43TEftAF99IWqrG9EI5536zAVMflcXRTGsprLxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tl4AXo94; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tl4AXo94"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-37d55f0cf85so1135858f8f.3
        for <linux-sound@vger.kernel.org>; Thu, 17 Oct 2024 19:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729220096; x=1729824896; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IzDTogGhhkM8ckQfZ1srs6eHShvXoQY5Qk/joVtqUSk=;
        b=tl4AXo94JawXI4aZnlXIhYb/pp0FePYhsNY0KmihyfqQnkyoF2ULEze4OolmkPtN37
         rnEKWKuWOTMnj6XBvY9vg2xxmFKWsijfIFYoEGvxdoEDf9mAZKoXTjTRFB5hlQqdEqi+
         W8GwTADwHWF9tdkwxB+zA7skmV7Bapb9TlpMoQdoX+SWYEElDMXkbhsKlJzQ4IuDb6zb
         iZy0jKwWouvxEsfOeN+j2zMw0i67c0S/8UCQii/2y4aoyDRLVj1KxfCZan609u2uYSdg
         hmsLQPxKTmfnh7G3Io+dGWyf0EjBO3sY90evfQlSQVUFKcMEK3JdZ3J54M3wW2IRy20G
         wJNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729220096; x=1729824896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IzDTogGhhkM8ckQfZ1srs6eHShvXoQY5Qk/joVtqUSk=;
        b=OfbDmsTHgyu+BzJQkdhm1j+X5MqD9jntAxg5Q8Kb0nMcYyRB4wp1LFObnPibewmhVx
         bk/qQW2mPbraRnA2nC0zj4twxlaxMFiVVeKNtkKnmwYMETW5XV96GjPdDI3b/LI/v+42
         J8Lk3CGJ89pxljNWGbr3tmR/Ayija0QpEwzcOTH4EEhCDmfMtv1m7nfhpXcgGgKqnAGC
         JmoMR8pkjuWn0YUAGvfviwyJuhT7yE5u3a9uDtqcI+2T1FH3Z5+fZIAYDSv4gSPA56O/
         N0SoI7t75kwvU7g7n4sX93AIbLKq3BnyWhRQwCGbWV+XCA9o35u3LVbOeXa7R1eGBYzZ
         /19Q==
X-Gm-Message-State: AOJu0Yxc8Y5CopXBLNLBF9slwWUmW74IaSlfD6OKQ5M3DvI6JXKnStOa
	SX59CV7Cg26MJtrM9fKn0sNnq1s5jUhO9PcHeTC0xeGAG2X4dzEQoLtdHC1GMJLQ8nSgZFWQWB8
	31yE=
X-Google-Smtp-Source: AGHT+IG3QrTDKAJwACMKKsazABlgr9tE3nlrIDdOrBRAbB1H3cVIrDGUpkSiHJ434J6s8XNZtjKUuA==
X-Received: by 2002:a5d:61c3:0:b0:37d:524e:9431 with SMTP id ffacd0b85a97d-37eab73368emr496858f8f.57.1729220095916;
        Thu, 17 Oct 2024 19:54:55 -0700 (PDT)
Received: from localhost.localdomain ([2.125.184.148])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ecf0ed599sm596135f8f.69.2024.10.17.19.54.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 19:54:55 -0700 (PDT)
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
Subject: [PATCH v3 1/5] ASoC: qcom: sm8250: add handling of secondary MI2S clock
Date: Fri, 18 Oct 2024 03:54:47 +0100
Message-ID: <20241018025452.1362293-2-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241018025452.1362293-1-alexey.klimov@linaro.org>
References: <20241018025452.1362293-1-alexey.klimov@linaro.org>
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

