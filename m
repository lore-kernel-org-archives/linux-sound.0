Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 864DA8002A
	for <linux-sound@vger.kernel.org>; Mon,  1 Jul 2024 07:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719817367; cv=none; b=nuwozr5wlRVLm78JN3SpZb8n2xxEQi7KNxAU6FrqVN9gLsM8TOJ0gOWrItWrlHU1C87L5eB1QmiBLwmXPng/29UZ8vKp34vsKZftsg0bKj2Jv4bqfeiCcLIDMwF9N9xMNWXaSDcWZ/2hX+yRw3jgzsq1idOS/0ICYC5NG7IK7EM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719817367; c=relaxed/simple;
	bh=aJ1LZosClX5NnP0cJXhnk/NVUavVqkeU0v2SDbbuCfI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M02uSm2u3OcKG5/a7aMJelFASIk4xaV5adVsgEXcU2RvPFFyKjKDS3zMWtf+IYh6N5vUzGGc9ekv1A03TRr/nfdv+zCY3V+eJxl7YeJAi90AoAHFD3qaSsV6Mu661fCOQoqdKCBTsQYnzp2Mcp1I0a35i7D+eYAVguN63sy0cig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tJGwj9c/; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tJGwj9c/"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-57d20d89748so2835819a12.0
        for <linux-sound@vger.kernel.org>; Mon, 01 Jul 2024 00:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719817363; x=1720422163; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GMJ9ytIbd8fpZ+zpiTVxchehIRD6mB7COwsKFHn30yI=;
        b=tJGwj9c/tqICWraCp9z0ytaRnu5yRSRO2tZA4+tV2bv6v47mm3jY3Rr+LFy1gr7Sxq
         kvCgySZSfVNadga8gX8ALZLHA1A9YJ5A+YpOkRkE25vICgjVMugcsLRjEv9Y/Oa3fm08
         gJkErZq+n0M1wpZOJxelR/jmabSt3ZPCVf9yrfYmMVdCmpdbF0ObayUT87M0rtVtMa2b
         R4lJh2/HMY4Pn4klHSCJRPgq1ReUb0dV5GLtRix04fNxutYJLPLXaMa+bv4xnbsW/ri2
         tvAfl4C5gxGsDZZm2aXfHhHOlP9uW/sQiBAlybDBoT877lyszein7KsqL/58ePEqyjUk
         l6UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719817363; x=1720422163;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GMJ9ytIbd8fpZ+zpiTVxchehIRD6mB7COwsKFHn30yI=;
        b=cNFCPiORi2YRCw3YvTNe34BrAQwaxyqDY0in6I0d/pr9+LElsYSB9M51YAQzsoqaOI
         yZngOHO6BM1+A9zG8UnNfoLpZe6ZHjyNkKQnbeDtKl1FM5qvzjvWPzX7AY8ZgULSYcmC
         v6Q5yd3SzJ9wHn4qoStVDkriOaq2X/QSqH2SewVNlucR9Ebz+kkjfahEIrjlWs+xdbIJ
         fS5nBNf9J+dVhewyASTOGyMGRHRGpp3pQPSjomDfgOR1apyHv4PPP22ISi5QT3rRdjVC
         6/k4ADCKo4Sm2e01WlabeZnFMMy+idPt5MXv25YpywcOX2Q74HoeQAQIMbX39LtpTVIv
         wC3w==
X-Gm-Message-State: AOJu0Ywq+HsHzEOu0gTUwk1qnyq+32cXa6Lju4MV2BTd0sDbN3E/A7NJ
	/CtoLLdzWT9dU8QErvWJ8uOETsGH4Cc4X20vYfINM7T4TX+kPSeMCqlSN5wO7qs=
X-Google-Smtp-Source: AGHT+IHR5yOOsqPZFJrRu7Wk8J8cXhauusw1meNRgDWk7XLLZNs2DncjjI+qUlPMsRkkGHRfGt2GEw==
X-Received: by 2002:a05:6402:5cd:b0:57c:c10c:eee8 with SMTP id 4fb4d7f45d1cf-5879fa7f71emr2584654a12.19.1719817362830;
        Mon, 01 Jul 2024 00:02:42 -0700 (PDT)
Received: from lino.lan ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5861324f036sm4034383a12.34.2024.07.01.00.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 00:02:42 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 01 Jul 2024 09:02:15 +0200
Subject: [PATCH 4/4] ASoC: tas*: Drop unused GPIO includes
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240701-asoc-tas-gpios-v1-4-d69ec5d79939@linaro.org>
References: <20240701-asoc-tas-gpios-v1-0-d69ec5d79939@linaro.org>
In-Reply-To: <20240701-asoc-tas-gpios-v1-0-d69ec5d79939@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Shenghao Ding <13916275206@139.com>, alsa-devel@alsa-project.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.0

These drivers all use <linux/gpio/consumer.h> and has no business
including the legacy headers <linux/gpio.h> or <linux/of_gpio.h>.
Drop the surplus includes.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 sound/soc/codecs/tas2552.c | 2 --
 sound/soc/codecs/tas2764.c | 2 --
 sound/soc/codecs/tas2770.c | 2 --
 sound/soc/codecs/tas2780.c | 2 --
 4 files changed, 8 deletions(-)

diff --git a/sound/soc/codecs/tas2552.c b/sound/soc/codecs/tas2552.c
index a7ed59ec49a6..684d52ec6600 100644
--- a/sound/soc/codecs/tas2552.c
+++ b/sound/soc/codecs/tas2552.c
@@ -12,8 +12,6 @@
 #include <linux/errno.h>
 #include <linux/device.h>
 #include <linux/i2c.h>
-#include <linux/gpio.h>
-#include <linux/of_gpio.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
diff --git a/sound/soc/codecs/tas2764.c b/sound/soc/codecs/tas2764.c
index 1dc719d726ab..d482cd194c08 100644
--- a/sound/soc/codecs/tas2764.c
+++ b/sound/soc/codecs/tas2764.c
@@ -10,12 +10,10 @@
 #include <linux/delay.h>
 #include <linux/pm.h>
 #include <linux/i2c.h>
-#include <linux/gpio.h>
 #include <linux/gpio/consumer.h>
 #include <linux/regulator/consumer.h>
 #include <linux/regmap.h>
 #include <linux/of.h>
-#include <linux/of_gpio.h>
 #include <linux/slab.h>
 #include <sound/soc.h>
 #include <sound/pcm.h>
diff --git a/sound/soc/codecs/tas2770.c b/sound/soc/codecs/tas2770.c
index 67bc1c8b0131..9f93b230652a 100644
--- a/sound/soc/codecs/tas2770.c
+++ b/sound/soc/codecs/tas2770.c
@@ -14,13 +14,11 @@
 #include <linux/delay.h>
 #include <linux/pm.h>
 #include <linux/i2c.h>
-#include <linux/gpio.h>
 #include <linux/gpio/consumer.h>
 #include <linux/regulator/consumer.h>
 #include <linux/firmware.h>
 #include <linux/regmap.h>
 #include <linux/of.h>
-#include <linux/of_gpio.h>
 #include <linux/slab.h>
 #include <sound/soc.h>
 #include <sound/pcm.h>
diff --git a/sound/soc/codecs/tas2780.c b/sound/soc/codecs/tas2780.c
index a18ccf5fb7ad..a1963415c931 100644
--- a/sound/soc/codecs/tas2780.c
+++ b/sound/soc/codecs/tas2780.c
@@ -7,11 +7,9 @@
 #include <linux/err.h>
 #include <linux/pm.h>
 #include <linux/i2c.h>
-#include <linux/gpio.h>
 #include <linux/gpio/consumer.h>
 #include <linux/regmap.h>
 #include <linux/of.h>
-#include <linux/of_gpio.h>
 #include <sound/soc.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>

-- 
2.45.2

