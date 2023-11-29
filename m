Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H7rB1wto"
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB24410C2
	for <linux-sound@vger.kernel.org>; Wed, 29 Nov 2023 13:28:53 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2c9c5d30b32so3510171fa.2
        for <linux-sound@vger.kernel.org>; Wed, 29 Nov 2023 13:28:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701293332; x=1701898132; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GU757npNrUowgHMI8BxiU0vGtre+9oPF8HlBVHP1/Qc=;
        b=H7rB1wtokBIDME4Yp/S3xHalZe+0WnVOEOh7j0jolKG4XZt/kKdUy1/R2NoJnKRvSx
         XM/rS8kaSeTIEakse/XUKF0ieYzR+tyPdQb3r4fCHCGp/6gRStvKjcAozqkYK6BF0eya
         dUVKlORSrhOWAVChxQ4GLvJu6spyvAdyibGz4i5Zb/YZtt3lh559DWFZHafWzRzA3yfl
         dq7drB4onry8vO2o/MEvgWuv2YtAR2DIBt5Yu6WyofPt9OLGUDh9/gHXwNqNk6KqL/lI
         I2kMsgYLH8pspClyMsASjSPiG+bmPQ2m0Gtu9ZAIxFbbpdQ1drqROZ4Vh8dffxvBHhvU
         ZDJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701293332; x=1701898132;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GU757npNrUowgHMI8BxiU0vGtre+9oPF8HlBVHP1/Qc=;
        b=pph2IhgklYfh1OJX9QgIedFTgaH+r2l+CpyUfTX2wkxaMZ2cz+tqKxf8z9Aa1WQiKp
         wrfXc/LAZCen5EiZKMlUkzzfsfOPQPdi+p95FqdhFnQ/QOYSKUaIQo6Cc4dF3OUyamtg
         kGsMz96UUCOKft8vG9/7dk6dvyu2gpcYGqNwCY9nqcXh0bzfDLXRxMgvWlZJ9Cv9Islo
         ew96uwUvXGWROcpo0Qyiq7Q1MudfhpiyvTjaqw+uaBtU2laIbsCCkLoBQ7mQPn9g6uf3
         AADeVoCJ6pdXhiFFehdHt/+LxGowqlD4b1J+MqdDc2J6jeajg6/+6Nzvlmxu44aBINJ4
         T15A==
X-Gm-Message-State: AOJu0Yxp+LqrrRDZKD4tEgLEh8RymknpfSvgQ+M+r4WVRugCgmxeKcYi
	JtbYxTjT+Z//eT1MYYNXgJytXQ==
X-Google-Smtp-Source: AGHT+IEdyUI6Rv6RH6eVMr/I17nk4CK9OjZr5lyleg/5SJIpqBPmIm2LRa2NEJpv2cv9yqxd+ociMg==
X-Received: by 2002:a2e:7203:0:b0:2c9:bf97:81d1 with SMTP id n3-20020a2e7203000000b002c9bf9781d1mr1989104ljc.27.1701293332163;
        Wed, 29 Nov 2023 13:28:52 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id b5-20020a05651c032500b002bcdbfe36b9sm2106196ljp.111.2023.11.29.13.28.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 13:28:51 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 29 Nov 2023 22:28:45 +0100
Subject: [PATCH 09/10] ASoC: cs43130: Drop legacy includes
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231129-descriptors-sound-cirrus-v1-9-31aa74425ff8@linaro.org>
References: <20231129-descriptors-sound-cirrus-v1-0-31aa74425ff8@linaro.org>
In-Reply-To: <20231129-descriptors-sound-cirrus-v1-0-31aa74425ff8@linaro.org>
To: Paul Handrigan <Paul.Handrigan@cirrus.com>, 
 James Schulman <james.schulman@cirrus.com>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Hartley Sweeten <hsweeten@visionengravers.com>, 
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
 Nikita Shubin <nikita.shubin@maquefel.me>
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com, 
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.4

This driver includes the legacy GPIO APIs <linux/gpio.h> and
<linux/of_gpio.h> but does not use any symbols from any of
them.

Drop the includes.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 sound/soc/codecs/cs43130.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/codecs/cs43130.c b/sound/soc/codecs/cs43130.c
index 0b40fdfb1825..18933bf04684 100644
--- a/sound/soc/codecs/cs43130.c
+++ b/sound/soc/codecs/cs43130.c
@@ -11,7 +11,6 @@
 #include <linux/kernel.h>
 #include <linux/init.h>
 #include <linux/delay.h>
-#include <linux/gpio.h>
 #include <linux/gpio/consumer.h>
 #include <linux/platform_device.h>
 #include <linux/pm.h>
@@ -26,7 +25,6 @@
 #include <sound/soc-dapm.h>
 #include <sound/initval.h>
 #include <sound/tlv.h>
-#include <linux/of_gpio.h>
 #include <linux/regulator/consumer.h>
 #include <linux/pm_runtime.h>
 #include <linux/completion.h>

-- 
2.34.1

