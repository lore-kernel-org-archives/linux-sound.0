Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SZ74a/xk"
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F66213E
	for <linux-sound@vger.kernel.org>; Fri,  1 Dec 2023 05:20:38 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-50aabfa1b75so3085912e87.3
        for <linux-sound@vger.kernel.org>; Fri, 01 Dec 2023 05:20:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701436836; x=1702041636; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QXDjDPaMbvQx1bg37W4jgjJHDDiGcy2tlOvY5Yp+dBc=;
        b=SZ74a/xkRlP3R4CZMf9s9Asc07otU2b3B0jal1K4fcn/gLX4CWSkpgeUlwYH86gr6W
         lm2dkZmwj2ZpEIl9o2NPbo7dSm8bXSvV+gefu+5ja3iFZlSYS8NhN4I7RcDDWk7UnPVC
         5tKlQNSy3umNva95WxnngQV8JeoaVbqdd0ztnO/V7E6IsOhqnAZ4+1G4nVhBFGsN3sPf
         DSxM4Oly4bR2xTdspywToBUzE6CYgXNA7XVF1dE+OtjGU7/K+28WkK1VrTW0IQZe8RZQ
         hHxb8HapZIzy3WMnPF3vle6CSn5BljQmVHMXRRD59f8sS59N/Mf10PG4369RBA8Huly0
         U/tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701436836; x=1702041636;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QXDjDPaMbvQx1bg37W4jgjJHDDiGcy2tlOvY5Yp+dBc=;
        b=kw+X7YuXAObTy6WjHPP4IdoV9mrpm4w6FyCROkzZ3qJ+/EPcyfXvVRe34MOvcjvbHr
         O6FooHjT+WUkZ13vA/G5vXc0rRPaAeOTyotS4vlfOrY1esMn3l4crZ6uSITcXQLtRhYm
         ND3q9uc7C3zbt6ovB5aGBqv6up5SSsVGIByLiArV1tM0cEZ/jAk/+lfyqptBWU9g7+9o
         Y8G2nahvxMOILr/dkqZwCiJV2pdmthS76lFMzWGh+cK1jM8Srlw7sqJ/3bKJtAUKT0J8
         4G4XavCrstsi8gcYOPklZSxq2grqdQILRPWwdwyZi17dnliwBZ/tPPUMA/ii5xfkJdQI
         r/aQ==
X-Gm-Message-State: AOJu0YxwKEYb4lUkyLIZhkI8YviyJWlEJ0701dv2/ILEp91VQGFbUdSE
	UdUW5g7+G7dEtU0SeEMOpEAd2w==
X-Google-Smtp-Source: AGHT+IGIItJJwYORlQRXrQG7gfQ5ooIDSNWEgNp2rLh/rkXJ7icDeuvVSqIoEojB48neS29HuUSSVw==
X-Received: by 2002:a05:6512:239f:b0:50b:c2f4:ad44 with SMTP id c31-20020a056512239f00b0050bc2f4ad44mr1028231lfv.29.1701436836629;
        Fri, 01 Dec 2023 05:20:36 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id u25-20020ac243d9000000b0050be054b4e8sm1081lfl.121.2023.12.01.05.20.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 05:20:36 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 01 Dec 2023 14:20:33 +0100
Subject: [PATCH v2 04/10] ASoC: cs35l35: Drop legacy includes
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231201-descriptors-sound-cirrus-v2-4-ee9f9d4655eb@linaro.org>
References: <20231201-descriptors-sound-cirrus-v2-0-ee9f9d4655eb@linaro.org>
In-Reply-To: <20231201-descriptors-sound-cirrus-v2-0-ee9f9d4655eb@linaro.org>
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
 Linus Walleij <linus.walleij@linaro.org>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>
X-Mailer: b4 0.12.4

This driver includes the legacy GPIO APIs <linux/gpio.h> and
<linux/of_gpio.h> but does not use any symbols from any of
them.

Drop the includes.

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 sound/soc/codecs/cs35l35.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/codecs/cs35l35.c b/sound/soc/codecs/cs35l35.c
index 63a538f747d3..ddb7d63213a3 100644
--- a/sound/soc/codecs/cs35l35.c
+++ b/sound/soc/codecs/cs35l35.c
@@ -18,14 +18,12 @@
 #include <linux/regulator/consumer.h>
 #include <linux/gpio/consumer.h>
 #include <linux/of.h>
-#include <linux/of_gpio.h>
 #include <linux/regmap.h>
 #include <sound/core.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
 #include <sound/soc-dapm.h>
-#include <linux/gpio.h>
 #include <sound/initval.h>
 #include <sound/tlv.h>
 #include <sound/cs35l35.h>

-- 
2.34.1

