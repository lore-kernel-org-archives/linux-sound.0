Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C2313699A
	for <linux-sound@vger.kernel.org>; Mon, 20 May 2024 14:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716214814; cv=none; b=uF9mr2LFntoBTd/Qmc/6fsjTxJcjDfS0rQHXMvEULxCz+8Pu03IdYTr9v/Ka33dXLZEHkWCWJfbjF2NG5GUJAvwePgS6G9B6ngj5cQBKyVLZDI3PCeYfItXNSkNPfF2R/Ul9QMDesjWgxWyAbIiOhZxw6GIngKqQE2iwV4Iyhgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716214814; c=relaxed/simple;
	bh=KcXmjnJ0AY0poUqIW4e8b27TbRb3h9g0TWVdcoOZzQc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JY+4emyCQIt/a9C2yDpWabf0K9uxmQpTewKj4JPwZmPDDmQS3sl0s/LHHFue83VMT5Wja/TdUNtQUxPk6lxdHgI1IB2qpwm1WMNXQ70EwOArLbuZhaW9qrI+AJzjIRt4gZghgEV4HRa43yVEJscyQF4ARC+YfXNTpoQAJDufTUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Uqgn09vY; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Uqgn09vY"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-41fd5dc04f0so15494995e9.0
        for <linux-sound@vger.kernel.org>; Mon, 20 May 2024 07:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716214811; x=1716819611; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xHRQQE65RAI65GXyR0YkZ7EC6+UVgVpJwZAhrM/DH1g=;
        b=Uqgn09vYxEmuNN7S5znlix7+Ld7czHMKGPhunEAKc11jsT5ekmFdOAKA6Gam3JRG9o
         KNfzusIIOYJQ60qTQryJ7VpMghjFzZy3xlktSwNt1D0OWDURHb9VX4UqpTNMb00J7q2R
         FMDTvazGmhl2oY6zJ+LT4Rj4Jr+//5nAbuPmyggSHo8m62rD/KxL51xRikCairEnuz8H
         C4Vqh5uNz3qKuYtC2PLEC51YXj5+ev0+K9NTa/J0eUFtKLpAtnAlva374HbmhX2fh26o
         fCHyZiKIai39MS2wm0N14rzNLTrHI7S6ku0DDBP8cNygpFHzsV7YsHmP1mGQFURdUerq
         R8Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716214811; x=1716819611;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xHRQQE65RAI65GXyR0YkZ7EC6+UVgVpJwZAhrM/DH1g=;
        b=HBZTP2TaxIJHDJy3tQK8YzCpD+1XFw6Me6VOtwQE1po/05Rl2dusuDXQSQEBbaeMJf
         2rtijSnnJ4aOXK2Nnc8rFXyffRbB0RlKurdd56R9u3aNdLC6t7FT2cRsNWxBHCLn0O1U
         9ilFl9csATVCqcOUHCrFKmJ68VTdtCGyuIHh3RrF4B0hlKP75r3OdcLqM+JoQyoJkHEn
         8It9R9AgOdqaoKhyG/j9fIpRG88hDu7vU3UvMFt/mDy1wGLFaxWCMEE9+Sm0JAdHa8aP
         bFNeOffzugIkIHdGwdXqTUa8/fg6hEpYcVdTXjOi1KQOBPiUkPrr27WHQPmFFJP3K789
         kVjQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+BtSTpFJT2iEDJjeqmhbUH45JZCsvih5dZjpfJSP6x6OHSUZxAfkRlm0E171XGXgzqNMcen653Qq96hy+CAiFWnpUz0FvOVw5vlc=
X-Gm-Message-State: AOJu0YxzfKyglWvExtq39Oba+xZ8mKgOG0J2okxLiz5SazmFIgFaeaCi
	MB93qzp6uHVdazq51rbKSmgTJ3sy4jcZkEL1tGsaZeikcJ0bcrsNM9BaltWISPg=
X-Google-Smtp-Source: AGHT+IGdwFfpSiCb5k+nHbLrV2SfE/QSc4k9N6wA3+1dezFaLcQXWKVJz2Cr8xwIDD5iaWnMb+BlQQ==
X-Received: by 2002:a05:600c:41d6:b0:41a:8b39:8040 with SMTP id 5b1f17b1804b1-41feaa43677mr303456185e9.20.1716214810883;
        Mon, 20 May 2024 07:20:10 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.206.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41fccee962esm421612625e9.31.2024.05.20.07.20.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 07:20:10 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 20 May 2024 16:19:57 +0200
Subject: [PATCH v4 2/4] ASoC: qcom: q6apm-lpass-dais: Implement proper
 channel mapping
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240520-asoc-x1e80100-4-channel-mapping-v4-2-f657159b4aad@linaro.org>
References: <20240520-asoc-x1e80100-4-channel-mapping-v4-0-f657159b4aad@linaro.org>
In-Reply-To: <20240520-asoc-x1e80100-4-channel-mapping-v4-0-f657159b4aad@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2524;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=KcXmjnJ0AY0poUqIW4e8b27TbRb3h9g0TWVdcoOZzQc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmS1wT1xFhZckPx+G4fVsbfms73t1WEZI+lxA2g
 2s4CcjTjF+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZktcEwAKCRDBN2bmhouD
 17sjEACYXZI6kpL+uEMc+XDJnuwm5R3L7XoKQW/5PuLWOHqNvbY429ietCvF66+DiASSwd5QFh+
 TihhfNJCgkmsQGork59va9S5uv7MaGANL2mxK5sbYXu0z5WZQMZTyWHNs2IrayK1IkqhRAAuHDQ
 SX0uud1vJugwESiBNoHIK9QoVzmBZszNHOZYARYeQOZ/i2hNamF2kGh90vrSRsoC5H2PKJUlCaV
 MUr4/uZu9SXxg3gh9zcW6TMP0lBRzLzZILjf/dz7jTYhQ4o+abNOzoBiLbOnhJ2gDrJonXQdV9l
 D6v4WGu4z2EyjC/vzbJJSt45O6mOUstD2Kfl6GPQo2i+vXC0DdVYiM2JnPb5oqvuKxv84zGaR+b
 dXLNqaZZkDMqaD+nCEkB481NFqMJ9RI+PpvA+UBiIZjglDy8R9cE0gI4eoLTvizjfxcq/Ov1ZBX
 AxmgcgVrmMRhNk5aXy9DcnEKJLFuuHpIyeImO/kDbTrfSVLCpb3nkYcFWODAzxQxddNBpZfV7py
 8xEwDQp/OA12QSlYcMZL08Hhr5av386oCGS4Hk7xStUhgiZTYdA4T1IzAxWaUxf9XGSDPhbR3E6
 stiIIG5jtYb9R5AYnlAMmA+I0yCSkRquiIq4lXt5UpG4WZyAi/0kIYVCk+a9tIC5L4mF7XjUMFa
 h8DT/vVC7GVF8kA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

The set_channel_map() implementation in q6apm-lpass-dais driver was
copying older pre-Audioreach code from q6afe-dai driver, but not really
using it.  The code sets active channel mask based on passed channel
mapping, but Audioreach code does not use that mask ever.  Audioreach
module configuration does have on the other hand proper channel mapping
field, which should supersed that active channel mask.

Drop the unused active channel mask and implement proper mapping of
channels in q6apm-lpass-dais driver.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v3/v4:
1. None

Changes in v2:
1. Entirely replaced - now channel mapping is implemented in
   q6apm-lpass-dais.
---
 sound/soc/qcom/qdsp6/audioreach.h       |  1 -
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c | 10 +++++-----
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
index 2c82917b7162..eb9306280988 100644
--- a/sound/soc/qcom/qdsp6/audioreach.h
+++ b/sound/soc/qcom/qdsp6/audioreach.h
@@ -755,7 +755,6 @@ struct audioreach_module_config {
 
 	u16	data_format;
 	u16	num_channels;
-	u16	active_channels_mask;
 	u16	dp_idx;
 	u32	channel_allocation;
 	u32	sd_line_mask;
diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
index 6bfbb52345e1..a4ad1d0e6abd 100644
--- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
+++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
@@ -33,7 +33,7 @@ static int q6dma_set_channel_map(struct snd_soc_dai *dai,
 
 	struct q6apm_lpass_dai_data *dai_data = dev_get_drvdata(dai->dev);
 	struct audioreach_module_config *cfg = &dai_data->module_config[dai->id];
-	int ch_mask;
+	int i;
 
 	switch (dai->id) {
 	case WSA_CODEC_DMA_TX_0:
@@ -58,7 +58,8 @@ static int q6dma_set_channel_map(struct snd_soc_dai *dai,
 				tx_num);
 			return -EINVAL;
 		}
-		ch_mask = *tx_ch_mask;
+		for (i = 0; i < tx_num; i++)
+			cfg->channel_map[i] = tx_ch_mask[i];
 
 		break;
 	case WSA_CODEC_DMA_RX_0:
@@ -81,7 +82,8 @@ static int q6dma_set_channel_map(struct snd_soc_dai *dai,
 				rx_num);
 			return -EINVAL;
 		}
-		ch_mask = *rx_ch_mask;
+		for (i = 0; i < rx_num; i++)
+			cfg->channel_map[i] = rx_ch_mask[i];
 
 		break;
 	default:
@@ -90,8 +92,6 @@ static int q6dma_set_channel_map(struct snd_soc_dai *dai,
 		return -EINVAL;
 	}
 
-	cfg->active_channels_mask = ch_mask;
-
 	return 0;
 }
 

-- 
2.43.0

