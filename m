Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 140CF86324
	for <linux-sound@vger.kernel.org>; Wed,  5 Mar 2025 07:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741160362; cv=none; b=puTmpPLc1AfqMkaE9ZMyW4F73kOtd3S12qdfkSgAI+aXohyrX7Rm3zMNyPVvujg9zr6CX64Y7jzLKIO+Lf3KbGWMyIV6+8zOe5MlsBrj4/g1LQPwgnTirjcBzRwnhhrd6++bBPM+/ABvVJuGP3M4wNtUsoHZb65PlJNgqJD5+PU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741160362; c=relaxed/simple;
	bh=7FxqJsPjZ1UH5r8Irq/KUdbcSb20pe39nWC0xAotRmM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kvEF74A7ndDbrXaeGECS/Xp+CWSujAoacT62vFfeIR28A7gpeq9U3s0Ekwvdu9cxt8NWX4xa7GNMp2nbpRfyODpbc+qIxW2HxjdeJ1ZiUSjZ4AM/3mQwyoh9/c7G4sj6/qoCpU7SajK+m7hfqoiKnduq8MHj5RnoaAugiLZ8kKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lKLTZ4pV; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lKLTZ4pV"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-30b99c6cd35so43704241fa.0
        for <linux-sound@vger.kernel.org>; Tue, 04 Mar 2025 23:39:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741160359; x=1741765159; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ytd3uDAUr77k/QvwA0I1JyX55i1pJLknFBSR7pg6DWU=;
        b=lKLTZ4pVzeZWP7hpaXZAZwWQ8/xHAH3Sitee3ewj2zAOR21F5e1ZilGCAgUFfc2aCy
         oAfoBq5tulSXQ6dP4FKGDSWcievz6uYo7CDZ54fUOAIJjAL8YTblt2/KSQlG3+33bhX9
         BcyNw7rAhR8g84sAr/ehLVIoAQ4hunxr9JG6ib4BMDXZiKpeswYh3+00ZuU/WNqGig0k
         gIDvGQQ1m3u2VOtxTMiI6g8CHX17i1uCepnwqkFuxbLtWp8jkVDJcbcP0H4cf7OfRRqm
         htTTzy6okH+M2sBqf1MlWI9dgfr7CeBAxqltk2+gqqQyTx20OREm4t0pzHhhDeGwiUoq
         Vqjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741160359; x=1741765159;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ytd3uDAUr77k/QvwA0I1JyX55i1pJLknFBSR7pg6DWU=;
        b=tlpFc4vx5UYR1B+RknkLhRw3JzEOgC9EyDiXN1AkoyB+1gFFV8NfbGIAOMBYylnu/9
         BESYrSZXOH/GI3dQEFObbZc5iOXGq7tgGRTmIRtdHNWyf8ZRIFum08Xxr8B1yhH509Zg
         S1Cn12ng2xU9T2zREOpcl3QCcBWtbtNAwCBWubaapY2j0g6QXB3MemRH2zMNkuoasewv
         6FeIndztycmO5aVHcbSXnz2dcsrjqrjmYMiXlupzNJRrfOUHQh9YaR/qbhmQBmXkvbuY
         u9fV17BYPH7U+sEeukhXs0pzfgYAUcsWy5ul0br7wkRaaH60559L3yPN4ZIBjduZY1Rw
         qLIA==
X-Gm-Message-State: AOJu0Yx3/6xfxQsWR7cVUqypkkLD3vAn5rtGR+gMiSlmsg4KAwKE35Y4
	0QoUZEO5GbcJC0cVdLSMqLDGquVYwQDxddCrh2Ngfk50O6zcjSZqvq4A7XGI6XU=
X-Gm-Gg: ASbGnctO0b6bJjdyF53YrMqoYSd5yrZYrTC8fXhL/8kyn63h+G0pdDj3ZbWZJHaWoTy
	hqDsQiKJU3a0iBuEN7+pNlTcmdh2o6tFr0BOWfa3qFRQA+bWuR3fv+Z0/3vGhyWBnVf8Tx1ToA7
	NWa/nPxnMvxahR7rk9zmHcSPtM/VuWtc9TzzFbwch8tS9e8TE+YACxn9TSnSBVkxuRBTCKEmXKS
	aj9plLpzGAZPro56IzeRfSSDwrhsTiCkAOlOp+9hUtag7haH3e1DJu6QpXT3H3iRR5UMM5LmkPl
	cBgBQoa3OGiE9AJ9szKSqoAs36QyfeQNQmKkik5R0tM1+DaTdPbmy/w=
X-Google-Smtp-Source: AGHT+IHja8Xqz27pMBgC+ctDlcXS+7JRihmA5ZDREPfugVRdHY/NUOad9X+cPrSfCkKGb0fC7sHjrQ==
X-Received: by 2002:a05:651c:220e:b0:30b:b7c3:ea71 with SMTP id 38308e7fff4ca-30bd7a65e82mr6645381fa.15.1741160359096;
        Tue, 04 Mar 2025 23:39:19 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30bbae78e73sm8902351fa.75.2025.03.04.23.39.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 23:39:18 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 05 Mar 2025 08:39:15 +0100
Subject: [PATCH v2 3/6] ASoC: samsung: lowland: Drop unused include
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250305-samsung-codecs-v2-3-20bc980c6445@linaro.org>
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
 sound/soc/samsung/lowland.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/samsung/lowland.c b/sound/soc/samsung/lowland.c
index 702cb4cc1ce9f07e55ddf9435b19c4691e0236e5..d4088b72d43c2295102d850197f8b9eac50d7120 100644
--- a/sound/soc/samsung/lowland.c
+++ b/sound/soc/samsung/lowland.c
@@ -7,7 +7,6 @@
 #include <sound/soc.h>
 #include <sound/soc-dapm.h>
 #include <sound/jack.h>
-#include <linux/gpio.h>
 #include <linux/module.h>
 
 #include "../codecs/wm5100.h"

-- 
2.48.1

