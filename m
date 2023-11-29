Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PZXJFKMB"
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1230AD67
	for <linux-sound@vger.kernel.org>; Wed, 29 Nov 2023 13:28:55 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2c887d1fb8fso3928421fa.0
        for <linux-sound@vger.kernel.org>; Wed, 29 Nov 2023 13:28:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701293333; x=1701898133; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HSsSWusvyuFKnB0n59GG/ZJpbxUajSal4/kkXB4+BwY=;
        b=PZXJFKMBTUVrKVvqZ/68DQT3iiTk5dSPHxWJOmhSdX2Z5yq2ZDXgY5JOTL0jQCGSBJ
         ASlO1h3r3BvUyOT3Ol/yA4rE5VyS/J6/VR33z8kl9zsfTN9juCJudwcJfoLTxGKMIRVy
         yh0VPhsLPNqD0KUdTdKmtR5SsQWKdfqjwlBApUuSpvNalxZzYiHUevUKptMnLGQgvIsG
         8ncCDQt9OjPVcToMV7vRtEkc6ZL63gb6TKXhAxLgOV0igrPwzEyie0vwoQraNMnhv+jU
         tBzJH6bE6DC5vWYm79GaEDH3RveJ2VrOrff6Kur72MXCbpKG0hwVFz1/fvtuLYoNeuC/
         D6bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701293333; x=1701898133;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HSsSWusvyuFKnB0n59GG/ZJpbxUajSal4/kkXB4+BwY=;
        b=jXvffNczydFRRmo72Lfm+izhOH4kZuM5L399meyxND6leOYwGQx8EpsY2sQ/FvlEks
         BfvNvlciHQX+I4giBoEpH87cHUwzUcebmRDPuazJdghqmx/RB0k8x4XTrELjowWJKbao
         b6qlimRpZR12WQsEWMRSQe3qLBWKcSv0p++erV8NRXVEZhI+w+Q3sCjP73dv60eyUlm5
         EyUxZ/F1FlUcYF3aDxBxg+FC34ZrgtvMVYikDG+M6Mgb0CBYsBunim8MfmTRTECkHl2G
         tA1Q0ij1g34CkDMrlgwAF44Phy20TwzN5MhMZC540bPVKgEF8V5UMCoWhq0PisoKAIc2
         2RHQ==
X-Gm-Message-State: AOJu0YwmFDE/4VWPa5aBYffNga7UqodyAYSrl+mlR8n/i9rA3B78FOz8
	qHNzr7/cIgyhZP2ebHx5tG5oMg==
X-Google-Smtp-Source: AGHT+IEkmWdPL4oWl2UHqoreap/8MLKCw3gg/vwTWvzAYgZdYOH7cYqyChHDv5dnd47KwZaWZPj/7A==
X-Received: by 2002:a2e:9f06:0:b0:2c9:b9bc:b029 with SMTP id u6-20020a2e9f06000000b002c9b9bcb029mr3098669ljk.17.1701293333337;
        Wed, 29 Nov 2023 13:28:53 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id b5-20020a05651c032500b002bcdbfe36b9sm2106196ljp.111.2023.11.29.13.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 13:28:52 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 29 Nov 2023 22:28:46 +0100
Subject: [PATCH 10/10] ASoC: cs4349: Drop legacy include
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231129-descriptors-sound-cirrus-v1-10-31aa74425ff8@linaro.org>
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

This driver includes the legacy GPIO API <linux/gpio.h> but
does not use any symbols from it.

Drop the include.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 sound/soc/codecs/cs4349.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/cs4349.c b/sound/soc/codecs/cs4349.c
index 9083228495d4..ca8f21aa4837 100644
--- a/sound/soc/codecs/cs4349.c
+++ b/sound/soc/codecs/cs4349.c
@@ -13,7 +13,6 @@
 #include <linux/kernel.h>
 #include <linux/init.h>
 #include <linux/delay.h>
-#include <linux/gpio.h>
 #include <linux/gpio/consumer.h>
 #include <linux/platform_device.h>
 #include <linux/pm.h>

-- 
2.34.1

