Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oDiahQQU"
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E3AAD67
	for <linux-sound@vger.kernel.org>; Wed, 29 Nov 2023 13:28:45 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2c8879a1570so3925561fa.1
        for <linux-sound@vger.kernel.org>; Wed, 29 Nov 2023 13:28:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701293323; x=1701898123; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w98h2S9ziwqYlZ5eRbk63Kp1zoQv2lCTleH6DrVq65w=;
        b=oDiahQQUL2hIrwkhtZ+38voKbKrhRzRIzb2VC56Wpkc6X3W+J+3I01qf71oCa8z32K
         mX0hciWHJLuQLyy0Z0f5KYKzhXk5rxEGnq2XyI1wGzUA7CJugJpcugUvplhkWHDhwt0+
         ydmM16GZRpApq5gMqlXTUuuJT+IaV87wTkNs5/JpUSD1CngBgzx568k/MPDCRqCJdYy4
         Zwd3lAzov8LJhXxJIKTkOQVcrXn9kMkOqp9zwHpEY5Pgc/6h5YGIGhNOwLXAbeU9G8Lm
         +Ee5HdPRiyMx/uIayCwEb5FSald0Pd4vmmrsA/1T6szm42R9tCBiPxOI+Uis6Ak2k8sF
         ms3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701293323; x=1701898123;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w98h2S9ziwqYlZ5eRbk63Kp1zoQv2lCTleH6DrVq65w=;
        b=eID7uQeslVrgCSYAmNZ1ClWhZkRbeiucVjXQgTnF+UB7lw9m9gXqPcmplqIetlxIf1
         7CoLlxHo/xWGV6jmPB2VWfmW5Sa3gDhUvLxN+NG4xHGUQAZVJsqUIQppna9g1gVAbBOd
         dw7odBuOtPFxZ8T1Oc2ofir415v60Za778KlrErpits5zzOBVjYm7edM+En+SLu6Qj7m
         H3rmCLWVJQ4FVlbl0G1/71uB07QxGqoGII3au/pPVjz2hxZK0a4YYj+ScZwXFluxHWrw
         im9qVq9jXorozlBos05kHy9MvRMF1X4aTe3h9VmiwwswR6Ct/d8MIqRkEOeLdOe0J46s
         oBbg==
X-Gm-Message-State: AOJu0YzJEZE4Xv4m/LrNqhh5JDauNZahsM9+ZkhyjnmPJcXkc4tbmvtA
	Ui/08rb3Hxr4OdfXUcpNdNhUlw==
X-Google-Smtp-Source: AGHT+IEC56sw8UX2ii4LX1W7ed8InaZsSu/jcEIqr13PU5ZEBtax1tJX/hGuJk6YOIA9moirDg3WrA==
X-Received: by 2002:a2e:874b:0:b0:2c9:c58a:b2f4 with SMTP id q11-20020a2e874b000000b002c9c58ab2f4mr1049900ljj.41.1701293323490;
        Wed, 29 Nov 2023 13:28:43 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id b5-20020a05651c032500b002bcdbfe36b9sm2106196ljp.111.2023.11.29.13.28.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 13:28:43 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 29 Nov 2023 22:28:38 +0100
Subject: [PATCH 02/10] ASoC: cs35l33: Fix GPIO name and drop legacy include
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231129-descriptors-sound-cirrus-v1-2-31aa74425ff8@linaro.org>
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

Further the driver is requesting "reset-gpios" rather than
just "gpios" from the GPIO framework. This is wrong because
the gpiolib core will add "-gpios" before processing the
request from e.g. device tree. Drop the suffix.

The last problem means that the optional RESET GPIO has
never been properly retrieved and used even if it existed,
but nobody noticed.

Fixes: 3333cb7187b9 ("ASoC: cs35l33: Initial commit of the cs35l33 CODEC driver.")
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 sound/soc/codecs/cs35l33.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/codecs/cs35l33.c b/sound/soc/codecs/cs35l33.c
index 4010a2d33a33..a19a2bafb37c 100644
--- a/sound/soc/codecs/cs35l33.c
+++ b/sound/soc/codecs/cs35l33.c
@@ -22,13 +22,11 @@
 #include <sound/soc-dapm.h>
 #include <sound/initval.h>
 #include <sound/tlv.h>
-#include <linux/gpio.h>
 #include <linux/gpio/consumer.h>
 #include <sound/cs35l33.h>
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
 #include <linux/regulator/machine.h>
-#include <linux/of_gpio.h>
 #include <linux/of.h>
 
 #include "cs35l33.h"
@@ -1165,7 +1163,7 @@ static int cs35l33_i2c_probe(struct i2c_client *i2c_client)
 
 	/* We could issue !RST or skip it based on AMP topology */
 	cs35l33->reset_gpio = devm_gpiod_get_optional(&i2c_client->dev,
-			"reset-gpios", GPIOD_OUT_HIGH);
+			"reset", GPIOD_OUT_HIGH);
 	if (IS_ERR(cs35l33->reset_gpio)) {
 		dev_err(&i2c_client->dev, "%s ERROR: Can't get reset GPIO\n",
 			__func__);

-- 
2.34.1

