Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60E62155324
	for <linux-sound@vger.kernel.org>; Fri,  1 Nov 2024 16:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730479927; cv=none; b=bS/q//z0pFM9vx5N728IPbIFmE0cjDkcfKOO5XGaoxpsUZPKUqLnoGQftVfDF8/1uAMC9Eu9MxS+L/FlI3cxRVNU7t5qlIMLTgbI4nnMFly17QQ3l9VbLBIQmLB031FS/LyLqDRgv3wSdqwPiWmjx/jqucrI5Nw1iP5smFMJmM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730479927; c=relaxed/simple;
	bh=T3qzsJEB2tFdfch3vsOxcb/vEpPvkjcRe3QzIZdh4bs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FddsCwPdgVeTYrGiVJlt5aDXlHIYkTgIkiWVdVF29qhXv16P+rPxkoSJKk4jrvzJIMyQOarcmqaZ178aJRgtDbOauH4IvVNeoHt5Gw7IFDmyFv/9lOPDOwrbKaCI5FL1kit5j3ZHQQBkpmF4m6CavrgALDe41g0mgjA4IH33Rik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K/Izc+rA; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K/Izc+rA"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5c99bcda599so256355a12.1
        for <linux-sound@vger.kernel.org>; Fri, 01 Nov 2024 09:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730479924; x=1731084724; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i8PB5dBaZud3vPt9H+NMfe4uFOttps97cf61U+CxGh4=;
        b=K/Izc+rApkBrg7aDZJyRm7eB/1Y6Yn+3vEUT/FY1ZSIsvrZd2mmhcHOIfn/A/tts5p
         wBS/Rp3OOYmU+sKUCGXVENfZwnC4usLcuRMd6nOEUDTiz64N+WxYOhAE5F35HZRhOGgG
         On9DlcElTrMaC4CuoTfJh6+FhvTPkJ1MkYiqbnXqTaIfy/oMeNR1HiIMvB54+y0uF/4e
         SLq/Px78XD1q1S1vr3cxyOYSfJnOyHPcnhf11RcRDtuLSi7Z6f1KgyC3Fog5axXl4ajS
         tXCrB+K4IWxh6q5aAYBxq33FuwIufXlJxmHvzpk35C6fzV459+I2xeAAGEJy96AOh260
         Yo9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730479924; x=1731084724;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i8PB5dBaZud3vPt9H+NMfe4uFOttps97cf61U+CxGh4=;
        b=j+LrQUYC6SoqlxwYtx80PlTGkgk+gJoR+qjldF7oikTg4tRbqX0+PtB5ybEse0wkmc
         MeAl7pvByc/QQJp38Me7DCf1z9N/IWDedwOcJ+Yn62hHnmYUjlUQz69FFJof4ZiDPmBJ
         AZdF8joIlc5IILoY0yuFh+U8Z3w8Q5xeBL1ycxzVo6aFYjMbacopaqMzfympokjEyW4b
         BLH3d8w1IU/IW4T6lgwwua5Fu1+BTE4qQO3tyUw11TrL2NitA+0pGQqBTAsRJ34ax6NE
         LqM6nh9UzCUQesfth0qsNwCwtWSpVleucachXLoKYyfBnIGoDO4W0IMPGXLSUTSwtIG8
         aqlA==
X-Forwarded-Encrypted: i=1; AJvYcCWUJYHcaZsJ0a2Iy0tDzFvVT5Owd0v1nyG0HDEXMTX2mKAt1d/oT4Bhu1QGQcO9gAw3NRLqknkusdTyuA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq8lqvbm+kkaMIe40rOW10hOes0dnRywBSY+KjOfWigVsklgHv
	ZkOjAJgc06syD2o177k7k2A45WuQdZi07LFgNxLWR5UhCY4ArMvsdsmL/6vosM8=
X-Google-Smtp-Source: AGHT+IGRtANYvGWrhQtu3vdhNfP0IhSFvA/Ip7py6OvKZ1/U2o6Uvsc6P0869kN6OpzIIy5XVgAZbg==
X-Received: by 2002:a17:906:dc8f:b0:a99:f388:6f49 with SMTP id a640c23a62f3a-a9de61a0fc0mr906312266b.9.1730479923682;
        Fri, 01 Nov 2024 09:52:03 -0700 (PDT)
Received: from krzk-bin.. ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9e564942b1sm202087566b.5.2024.11.01.09.52.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 09:52:02 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] ASoC: dt-bindings: qcom,sm8250: Add SM8750 sound card
Date: Fri,  1 Nov 2024 17:51:58 +0100
Message-ID: <20241101165159.370619-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add bindings for SM8750 sound card, compatible with older SM8450
variant.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index 2e2e01493a5f..b9e33a7429b0 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -25,6 +25,7 @@ properties:
           - enum:
               - qcom,sm8550-sndcard
               - qcom,sm8650-sndcard
+              - qcom,sm8750-sndcard
           - const: qcom,sm8450-sndcard
       - enum:
           - qcom,apq8096-sndcard
-- 
2.43.0

