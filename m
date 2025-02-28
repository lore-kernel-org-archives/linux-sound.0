Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C525188CCA
	for <linux-sound@vger.kernel.org>; Fri, 28 Feb 2025 16:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740759276; cv=none; b=n2zjBznKMd/H86qU2SJXsk1sR5GwwTRqphBfua/+ognAHbSz2BAfJ+4hWxKyxoqVy2ajAaO1xxSruAfSY50Z4IOvk+q853xKMa3pgtyed/Qk+EYRCfbSCr12ACyl8T/E5G2g5WRASjYd45saJyeQOIB8Sw9C25RI2aRHzupUvXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740759276; c=relaxed/simple;
	bh=TsOMlzyWGhLPB8XA0OFllVNotLhXSAWLfRCutrm2gDA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Jm6Wnmgbxe7XGYszsaQQU+j4NL3MsmwueecBHYEYvEP6sSALudAxzhhQ2HVAz+eemdV/aVtxxFWdpqCuBM1LKqbjtSLrjevA/kFELxdy6ErsAieMA8evwuPcthmzFxUrf+djX86QQUsR14nhvww6vUGZV+Xn1sixdYXHr0dGWWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fSR635T8; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fSR635T8"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-390edaee0cfso665590f8f.2
        for <linux-sound@vger.kernel.org>; Fri, 28 Feb 2025 08:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740759272; x=1741364072; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mA0q1eDANk1VuTwQiJxyjICzoV7Kt4ns/vCaHe1Vf1s=;
        b=fSR635T8Kz+puUHI2t35h/u3ZBDd6ZToYjmF4jyGBsk3OKDYMqAgFhAv+gUqZDA9++
         KfhHtcev2KBB5BYVM3nG3ro0OiieDOIy2nMFmu1v3igUG+q9NeyYQN5v2lXa0IREIxwO
         R19pNE63UIe7PDs3uyoyhcfHP+lX6xg9iAvjVaJ9C/B+P6ik0sXOUDkdhAvGpZN1cd4E
         DCmebjW+CzpC9kxT28P0iiF7nUA19l0B3YLtD5CzFe0OT30AFvsdN1+62A4g8SppxAIV
         vnttJU7LYREJQIzbrOy4jL8QVw6o+M+GoQgGkLrJxjCJmFCnj+Nw8Uz00jw0EEJ+rs8O
         qfPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740759272; x=1741364072;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mA0q1eDANk1VuTwQiJxyjICzoV7Kt4ns/vCaHe1Vf1s=;
        b=CwvT0/T4BSFgqJf1RRg+aKLYPX/AzOd3nKYW9qkpwU6wF+OVK1nSXcLb76H1rVFLpx
         SLjysYB4a8keb7sPhPbctCSMdpEIhx7fTqnX2+IHAHCsTG+sHKhVJgE4gAdvxRRZYnzo
         agf1gAZFZEaJPGp2yNqU63UunvQmkfRGvXBTnIumW81PqtgYM3V2OloexcO1DKM6z16Y
         3dGytTZnNaWPZHWGprOrLEwIwZchkN3RCvaHY5Y4x2OMY2zz3XLC7MwJI4Wgs6YfAUNU
         xMmL4o1Fb+BbLdhUh82KSGDfmizUpUm0NVVYtazWPYGfa0PBn8/DnvtoJht2a3Bmro/x
         5zdw==
X-Forwarded-Encrypted: i=1; AJvYcCWyjR/ZLJZpWd1i+bY06qQDOXRa6l64AYveCrOB1UCZuotMkc10s2x5L3iwzIzaMC2Gdwne3FBWF7ffJg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+89cOh/IRa5Sp1Gmq48g6c6IPYTz3aPiongqcf6EDbA8YPwg7
	ftZtutzzE4TS00yogHGYBzkanuxNtpCqb0X7akpxFo/jTbTy2WdX7syPz3CTc60=
X-Gm-Gg: ASbGnctBHCVclW2rvh4BuvqkNpB66CzOj4RO0qGrYVS5Csf3y1GNazKNmRn8pFMTus4
	z6PSQXg5OxFNwpH5z6fsqzE/Bx9++8L0kURkt3YysiHpTHUIXxAR5qCdpcY+WWlCXLCP76w2HF7
	db77X9B0SiVNt2ufxHyi/pCy5FwVOKqG2cb2odtX+HYiDRjnvkXFTbWIGuOFMGW2ycDJHx6sJnA
	v5axDzflxFvuCHc82DciWrwfWZgfAwBK/jJgdciaP0eZj8XbuG1XZgbHAg8WDD/p6kijwjaKnhV
	mtxsF6rJjilCIwCB/m/BFlzJlglyCD81necK5wTDrvCaDM02
X-Google-Smtp-Source: AGHT+IEorpcQWBNQMknvoMwXDyrUVNGuGeLWwhyPQjwWgrfHo9N4oJU2oROHaGMiKCwUM7rlOaPVbg==
X-Received: by 2002:a5d:5c84:0:b0:390:e62e:f31f with SMTP id ffacd0b85a97d-390ec7c67damr3299605f8f.3.1740759272554;
        Fri, 28 Feb 2025 08:14:32 -0800 (PST)
Received: from localhost.localdomain ([2a02:c7c:7213:c700:e992:6869:474c:a63f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e4795d30sm5690232f8f.10.2025.02.28.08.14.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 08:14:31 -0800 (PST)
From: Alexey Klimov <alexey.klimov@linaro.org>
To: srinivas.kandagatla@linaro.org,
	broonie@kernel.org,
	lgirdwood@gmail.com
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: qcom: sm8250: explicitly set format in sm8250_be_hw_params_fixup()
Date: Fri, 28 Feb 2025 16:14:30 +0000
Message-ID: <20250228161430.373961-1-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Setting format to s16le is required for compressed playback on compatible
soundcards.

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 sound/soc/qcom/sm8250.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
index 45e0c33fc3f3..9039107972e2 100644
--- a/sound/soc/qcom/sm8250.c
+++ b/sound/soc/qcom/sm8250.c
@@ -7,6 +7,7 @@
 #include <sound/soc.h>
 #include <sound/soc-dapm.h>
 #include <sound/pcm.h>
+#include <sound/pcm_params.h>
 #include <linux/soundwire/sdw.h>
 #include <sound/jack.h>
 #include <linux/input-event-codes.h>
@@ -39,9 +40,11 @@ static int sm8250_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 					SNDRV_PCM_HW_PARAM_RATE);
 	struct snd_interval *channels = hw_param_interval(params,
 					SNDRV_PCM_HW_PARAM_CHANNELS);
+	struct snd_mask *fmt = hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT);
 
 	rate->min = rate->max = 48000;
 	channels->min = channels->max = 2;
+	snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S16_LE);
 
 	return 0;
 }
-- 
2.47.2

