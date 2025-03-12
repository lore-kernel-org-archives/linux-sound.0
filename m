Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20DDE5474C
	for <linux-sound@vger.kernel.org>; Wed, 12 Mar 2025 13:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741786320; cv=none; b=UExaEj/OjBUvqeiU3uGOiMkiaUvMfw5RdvnxWMVA7wamyQc3tJ3A3mmPRgzLRUGnAURpPcM2jBRO+bEkCEVLF78SB0Mu06w/6NNTmET+0oGTms8ONzUN0LEJWHrx/6WBaFSHcwVY1bkcqIi156YPJmPN8a1YGgQ4XQSFMGz92lI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741786320; c=relaxed/simple;
	bh=0lBofCX6g27h8ZYIWlpX5XDIcclfdXbqFe5axN5qaO4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FKtFSFMAVU13RRt1hLEiPm4NROSdi7mrEV4jZjecO7HT/PwBs7FTaMRimSAS0N5fqwlmYcSRJu5tBGF78oRydMg7eqCClbJDBPfWJJjkaTUm7ArQArWBQY2eXu6HxEt09NsL75ahNXqybtFpLr8bVLUsvtFtgPOft6+8b73fDJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KsA9tvEg; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KsA9tvEg"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-54298ec925bso9064592e87.3
        for <linux-sound@vger.kernel.org>; Wed, 12 Mar 2025 06:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741786317; x=1742391117; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HCSC23yZBDagGDh6Umna2avJcVR5NE9Nb/Nl+uRoktk=;
        b=KsA9tvEg2fq02W1JLAZy/pNW9pCbZN0+pIlcpuFBOPLkf6mLJpOz5t5jRIn6JMLm0P
         LISJfh7+GbqfP9JmBOxkd8w+sLyzBviPAdbFYQYibsUI/DQ11Ynm0z9EhqV5r5cwqwSf
         TzmGR/btvwohCQhEp2k5D0knl4y75Gbnl64WDdGKKZ2tK6M/HqmWEWn0PE6gkysTgOG3
         sI5DL3C3dC6QksrSgnAefFzSBdYz+Ip6IscLP+09FwYfIVoY4YCJdAxPzEhlOYsiZNg5
         G8WA18W54lIGlfiH5yp3RAVy57jdz6pCxuLQumNjQzpXL7ofQLibPppvQvUJf/LCNM6w
         rBUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741786317; x=1742391117;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HCSC23yZBDagGDh6Umna2avJcVR5NE9Nb/Nl+uRoktk=;
        b=gkIvhSi7Jv2YUy+OZyULbnt0n3jBO5jK95fUfJP2wS3QwH/ElC9v8kZ+CD2Ktiy1H6
         6/YHXaZxGgp3M35WLF02DI9Ckx211rGzl7+JaR2BWywyJrMgUXODVbOz2nmZyf1c/e2H
         Y+PT9wCn+SpHWa5Hfw//YP/D03zejguisSYJPUU5eYMK6pXE0jSfrGgAwsHR89nzPj/r
         PWk6Y1dYNOEu5uGJiItKgfaMbUKsYnwIvm+gPGJDDTpDzm/iE+icNt9D7n2XkBLNhdu7
         igboJxqWeHNE7ylBrlHABbl8sxVup/V7WM6jQSHNplVO/edsQQG28Xz55vOUD5xOABlH
         nrFA==
X-Gm-Message-State: AOJu0Yy+lIesLqyvYKiHmO32Slgv+i7WmaksnuzGgEqU+vhx9CT7YnoG
	MVCtodpfBwn2VvG8M8BL7AE2YRDSR/TC03VgPUZJjVQS2n3+W2HQeUewJp8WZp4=
X-Gm-Gg: ASbGncsEIGxPcpKjRwPcgMp3OmCROsqg/w0rAAvw0Yzhz/AEQqd/mW/E7n5MoW15ogj
	r8wzLY4jYERHH5JDEzWrz/C4PbX6MCXO0sa2HcsR/YtscnAEHPxj3R94ILfrJzf4UBAilJLQOPa
	VRCH6AQkDj71wGdbGi2r1vFliT3ev6DNjR4bh8su0fktxySg++tKwhqJf9KLtAtm5Ax5G2JPhku
	RYcNfYvX6NsKSsmnsM0MxYJbtut8yqv4Y++AioaVLA/K+hU5CMcBuCOX8UH7C3dHZrrW8zbWrM2
	U7R2+svqI8pIt0o0rxSbhxlQ/dciQtznt8sb/lXFcdWgajS60fwKjik=
X-Google-Smtp-Source: AGHT+IGkeuRFRrDQUVjbYY2DOOImsP2qePYqpHH0bQIKsDXf3iZf2a5DWrTYE0cLmP5HctIa/Xg+1g==
X-Received: by 2002:a05:6512:ea5:b0:545:2f9b:7584 with SMTP id 2adb3069b0e04-549910b5e7emr7273720e87.36.1741786317099;
        Wed, 12 Mar 2025 06:31:57 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5498ae460desm2121858e87.24.2025.03.12.06.31.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 06:31:56 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 12 Mar 2025 14:31:50 +0100
Subject: [PATCH 1/3] ASoC: pcm1681: Drop unused include
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250312-pcm-codecs-v1-1-41ffc4f8fc5c@linaro.org>
References: <20250312-pcm-codecs-v1-0-41ffc4f8fc5c@linaro.org>
In-Reply-To: <20250312-pcm-codecs-v1-0-41ffc4f8fc5c@linaro.org>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.2

This driver includes the legacy GPIO header <linux/gpio.h>
but does not use any symbols from it so drop the include.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 sound/soc/codecs/pcm1681.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/pcm1681.c b/sound/soc/codecs/pcm1681.c
index fc152496d5dc53dae527a537146f18a44387222c..a1ec881d70841ad10cbb65ad7d59419ebb6f7722 100644
--- a/sound/soc/codecs/pcm1681.c
+++ b/sound/soc/codecs/pcm1681.c
@@ -9,7 +9,6 @@
 #include <linux/module.h>
 #include <linux/slab.h>
 #include <linux/delay.h>
-#include <linux/gpio.h>
 #include <linux/i2c.h>
 #include <linux/regmap.h>
 #include <linux/of.h>

-- 
2.48.1

