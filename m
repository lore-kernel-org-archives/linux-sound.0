Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CAFF1EF097
	for <linux-sound@vger.kernel.org>; Mon,  3 Mar 2025 08:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740991308; cv=none; b=naGDHclMNHpJSvJHkkpRzMFCJd9CgBRkb83BiwUu3szufqkmjIy+HlRqY3ceiXfI23GxqWTDvOyhR+4DMrNnzZAd+QmEg272coxb6Tfw7fxkpofO7I1BzfMCpfECVmC+lweoZakAaNuOYqNlwoLY76aAtJQj8sYypnQPigqkshg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740991308; c=relaxed/simple;
	bh=6JNx0BB+Ksp62N8jJzh1xiCfoZC0GtwmJruh6iVryAY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Iia24LRYawyqcnncSzjxPLl85NX+mdiWYZ5PokqOuwgA5SWs3603zHhh3zT04ZXn0c11orQ56BMi0vPtH0S0s/++RxJNZGUvyF7DsM1bqC3MJGowADvgj0lBwZTF/7SYKmNGWOaiwttqQQ5Bo4LrIavdCRBnEC6eSDY+glLH6BE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KewAEEBl; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KewAEEBl"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-30797730cbdso40632151fa.3
        for <linux-sound@vger.kernel.org>; Mon, 03 Mar 2025 00:41:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740991305; x=1741596105; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kmkkrf+ULKLb1rk8K4EIvV0fKSzN/tbTSC+F4L4NGxw=;
        b=KewAEEBlGbVkSfph2mLtXA9JaENPAIUXe9ZdSNORvX73kUpo9fEFfq1zGdW8crwRIb
         +5YpExCppVdhg2+GpI2MmgsweH3InJuSrN5ksKpMTwNSr85PPpN+wY4ZcFZEfRAl89+P
         xLNaquJSq/k+Buu8Z04Idddwh8uAJHfvB5IxJKC+kO9lje2OZbRsewjhH6Nalr239U6f
         VtreFATAJRrZvJzSCw9kgFHSKr3YlRo206KlK+CcnXYUpKjOFj5Z+giCuhL9CiJnF+HE
         QwG4ktTggtvkqzwvkYiO/Ka6WKqGdH9tGYHQgA2yEZQsgLj9P6CUO2TcNPaCvVggL0W0
         I36g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740991305; x=1741596105;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kmkkrf+ULKLb1rk8K4EIvV0fKSzN/tbTSC+F4L4NGxw=;
        b=B0ulml3Ub9ygzZcfhOs449nfa/7X+8ArdW5umyyIhF+xVJ+OFfOaMq+3y+4BYJLe+U
         lz/2EGo00rKZygq4ydf8xGZuuomrZfLRTkxd2ud+JPS6mSRmvdeXTGCeWr3tUL6XDhPV
         JuUQqtS3QM8XjB4Ijn5ZLoEJLlvF1l27rV7XUJYxfEn2E4sXV0mNqAsQBiUyyFlls+bp
         WDonTfUGFPgUHdHV2x5XAPni58pQgQuIOVoMYaRPjGIevYLw5olDteU2vA8tJk5CEgHD
         xwcEuckRgunAD1zAR8Sdz1IpolTsiYi+1RH52zvd4J+dHqmzpLobLSOJ8XFpgX+U5Qx9
         vfRQ==
X-Gm-Message-State: AOJu0Yyf03RdSejA0ZTvVrpLy5jYKChNT+Rw0bmKQO3if05J9/rLh3rB
	lSwhTC9g1zwuelH6tE2L/n87bLZYs7BEtBmebPsyxv1oS9e2M+h4ZXax1gB+0ZqT57WJkiDJlhP
	J
X-Gm-Gg: ASbGncvxidIRUlSHUzeqNKRtXMPxmJkp72X4suyChyUzndNJdMxaYMeTMuw7y0c/fYy
	ndq20H849Fu5ZvuSH+gluuPOm5Bd1842RI6BsDwjEKOG8a/Ic/88Ex4iVdDz/xE6aqEBZL1F/BW
	EqcryPkctIiBArpnxyf3DU1ZYoMamj8MrppVtMFs/xLeAfQrwKO8CGmPR3MM+iFxOOO5qxHVGw6
	UEqKt51qLK0N4wV7AwNiFM3PdXoc7J6izA0WcS9s5R49Z38DqcnD/Z2vbCllukeaHXwcClhVTtQ
	+BUaP43rdA4lXcK2Fr6vV7/G5Lh18TyMNBleQrT0HYZ0zx5LUJCI2Hg=
X-Google-Smtp-Source: AGHT+IEf+WBH4U7D1mLtWBRggy3cAAJWEZH/7SBq/nZSNOR1wS6qXstBv+1295UUt712TMSOJEx8AQ==
X-Received: by 2002:a05:651c:400f:b0:306:124c:69d5 with SMTP id 38308e7fff4ca-30b9345fd1fmr33846181fa.34.1740991304639;
        Mon, 03 Mar 2025 00:41:44 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30bc49d8b56sm827371fa.80.2025.03.03.00.41.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 00:41:44 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 03 Mar 2025 09:41:42 +0100
Subject: [PATCH 2/6] ASoC: samsung: littlemill: Drop unused include
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250303-samsung-codecs-v1-2-56a2299dd928@linaro.org>
References: <20250303-samsung-codecs-v1-0-56a2299dd928@linaro.org>
In-Reply-To: <20250303-samsung-codecs-v1-0-56a2299dd928@linaro.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.2

This file does not use the symbols from the legacy
<linux/gpio.h> header, so let's drop it.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 sound/soc/samsung/littlemill.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/samsung/littlemill.c b/sound/soc/samsung/littlemill.c
index c5260e101c2a136001c6273200fa35740e618829..9fa5e3ff9215164491839d6ffdf499a3eeadfbaa 100644
--- a/sound/soc/samsung/littlemill.c
+++ b/sound/soc/samsung/littlemill.c
@@ -7,7 +7,6 @@
 #include <sound/soc.h>
 #include <sound/soc-dapm.h>
 #include <sound/jack.h>
-#include <linux/gpio.h>
 #include <linux/module.h>
 
 #include "../codecs/wm8994.h"

-- 
2.48.1

