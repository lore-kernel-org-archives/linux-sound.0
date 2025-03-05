Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D32C1DE4EC
	for <linux-sound@vger.kernel.org>; Wed,  5 Mar 2025 07:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741160366; cv=none; b=XnRmjF7KcXUQO+96OQDp1t0Trt9Qdo7igRsOv6mM3SXmD2594wllklQr7ovLeYPrQWsTqyal5eY+HT3MVRO3gdtP/v3yoBsr2jj1BTi7WEo/jmP1Bf4WM4VrnDL30UVfj70hU6lvWDTFLzZluO5aG1CKe5X2x2XnGdHj0kNBT3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741160366; c=relaxed/simple;
	bh=ewfArlmqqehACvR+E/gMTUfZuilJnoCWWDdT+IMsluA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PZS8xkuFTypCBbfLeoLf7sFOgmW52g4oSL5DnXpWdNRQvkIE0oithMMoCxskeNaPCuQNdZIJIaG0LKAnRCtBEQOVGP4raQ8K2hPzEs4lsN/hVV2xCWKKTfymCO7onuIvAuBC3kRvaMa+8FpN+Kr1Pcc3vxKdUetqarCg/oceeGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ol0Jotkt; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ol0Jotkt"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-549662705ffso3536480e87.0
        for <linux-sound@vger.kernel.org>; Tue, 04 Mar 2025 23:39:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741160362; x=1741765162; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rvMg7xlfJga8JPXOikC0tZb6M+MeWNROouU7uXoyuKU=;
        b=ol0Jotktgxsd8WCPRshqhWCfvRWGLBZFqVuFrlHNAJtewYdrlOcXb8hJcl0Y2PjIJk
         ckpZIAIm3gOu7VmtOp7qeYQAQmjZKEcXmppSiUMh5UYKBfnNqE0svy0dry7d1wDJM4zS
         HUN4b6DRO/ZFlXgG28YrQj3Yqhk9cjSYaQwRnBkRNRhNxyPUFMK/wB2eBIBsfmqlRdWj
         MVFm+0+DGaKhM1artB5UFvDyIJsnQhNl+GB71aEtc9choG3N5etBDPMtjaziwievkTRW
         otItmPQwB/loF+byn67vFk0STHM2PxNTyn7AdHDkM8ak3j0jfmx5JDWomyhReve4xRDY
         BcIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741160362; x=1741765162;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rvMg7xlfJga8JPXOikC0tZb6M+MeWNROouU7uXoyuKU=;
        b=Ml0veDGACOjqcX6XM1oy3o9eQwjfEzU8TtJp3xGJzk+LdMq8ljyAc/+C5vKStUP36q
         joJC3TXmvXSj0jWJ7MD+3Fx13VeMH3z1MRJczfrcgBeo3tTIBNTBB1JlEb/i0oETiLe5
         X1wRhqGta3ptc3nss6aCmSbczebe5YI3njxDavfsG3FKgu4QyMELF5wdEDYDEj8appiz
         KqEkIvnc/w6bURAfwZGROuei3i4bS3gkWpjcfAG9zf3GZXekDrPNJUBE4mxldycynOsJ
         8XU+eZJxLRRyMXxWIM1lFScER033IhMUVrNJVj519t1X5yYBXsc5kOL/QQuXhLHkq5RH
         0dtA==
X-Gm-Message-State: AOJu0YwvlHzLPxolMn3X/PzNIc9jMmeexmZBXVDgvVwC1QZQhoj5d1/Z
	XYMyV+F5z3SELp5yRrMdhf84D6r1cwF8V3tD2dt6IwRqGFHQ99YGMwG8cEmYLC4=
X-Gm-Gg: ASbGncs6lfu07MrSD0aror9xMmh2iK5Ce0+/4320QYNjjbFSkWqwBkwLFH0MN5ZvFgn
	MycfmIopxBAaWngwjiA8cafMOIPbsuF8bWkzOUBLVUyBUxaRh3w3SUgkdP9B+lZXoTKCzMwMeps
	7Lyb2DT+a9gWKETi5OIgLOwvyVI8V6fgb+rpRyq4QjvuiC9K0ATSUOdUpOwAYSSQ20yllbVk/El
	Yboppq9RmACg2ZYY16ohDPzhQsaMwhFu6VvPzkkpgglZJ52KB4jW2Re0zVcvRb/gKir3J9uF4eJ
	Hr2E0Qd1mYorY8frh+p8DS2Pmxgh/fOfTs4mxaXnaJNwaIQG0SpgvZg=
X-Google-Smtp-Source: AGHT+IEtLI5nI7Bn3OrfjpaA3Uhj2NQz5pnTloc8Oo+6GBcf8NHxPSUkm7UW17xx2XaVIcFRKTemtQ==
X-Received: by 2002:a05:6512:3ba4:b0:545:981:1bc4 with SMTP id 2adb3069b0e04-5497d3776a0mr644805e87.38.1741160362095;
        Tue, 04 Mar 2025 23:39:22 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30bbae78e73sm8902351fa.75.2025.03.04.23.39.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 23:39:21 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 05 Mar 2025 08:39:18 +0100
Subject: [PATCH v2 6/6] ASoC: samsung: tm2_wm5110: Drop unused include
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250305-samsung-codecs-v2-6-20bc980c6445@linaro.org>
References: <20250305-samsung-codecs-v2-0-20bc980c6445@linaro.org>
In-Reply-To: <20250305-samsung-codecs-v2-0-20bc980c6445@linaro.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2

This file does not use the symbols from the legacy
<linux/gpio.h> header, so let's drop it.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 sound/soc/samsung/tm2_wm5110.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/samsung/tm2_wm5110.c b/sound/soc/samsung/tm2_wm5110.c
index 2417b91a328f083f991af8505c5586d3b27d9bbd..cc76963105d9fa37fe0bc45acf9a28720fdde158 100644
--- a/sound/soc/samsung/tm2_wm5110.c
+++ b/sound/soc/samsung/tm2_wm5110.c
@@ -6,7 +6,6 @@
 //          Sylwester Nawrocki <s.nawrocki@samsung.com>
 
 #include <linux/clk.h>
-#include <linux/gpio.h>
 #include <linux/gpio/consumer.h>
 #include <linux/module.h>
 #include <linux/of.h>

-- 
2.48.1

