Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BhraCzG7"
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53BE510C0
	for <linux-sound@vger.kernel.org>; Wed, 29 Nov 2023 13:28:46 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2c9b5b72983so3743521fa.2
        for <linux-sound@vger.kernel.org>; Wed, 29 Nov 2023 13:28:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701293324; x=1701898124; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gxA1zyyyxC7/6y6RpRxRpLmaP1pTY49ZhzDzMcyXsOY=;
        b=BhraCzG75ggv57D/T7VOHe8Aa61nPtYk8FJffp8rqxA5ChK45FwQoJLq1uh2R4pWjQ
         J9AquvLvqHEKa61xo2z5sDJkmk/3EqHSBMrBZFF10FMfjCv7emaB78+uPcriWYj/cqLq
         BU4iLH3wgEf1ITpmtUzjJetBL6H1qiVPxBvj/X6sl6zCwkyS6fcSleZW6DXmwu1YGIz+
         zxsFwR+svgdq26h9ciOip37HmTcu5gXb1cMfvaiVz7nqMlO0zkVbL2J1QJU98GP9OMaE
         YJ+NPjxKWtUldBYFnz05ikUqwdS9kwx+enXw6NzPrvKg7AUI//D3F/Yt+J62zxTOlXiq
         oFuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701293324; x=1701898124;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gxA1zyyyxC7/6y6RpRxRpLmaP1pTY49ZhzDzMcyXsOY=;
        b=AtbGUmwjFe7lNlvko2zOy/WmvwZppbg2hV5Ij/ry9Q5g6OT8NuwAufuLxf1kIomo1o
         NvhWjwJ2E1Vpjrtfaq5XlYq7Shj0FKI3zrZCinGdwXZRu2jGU/265tvVEFSDk8RRp8xj
         zS3G/sbEsVIRY4RXO7yPtQiBpCXXzKUg8BD85tx+Mqokcd3lwHZw3mfMxY9qmFHusMBj
         fatgV+NftOZymNSiKJ+3jl7Dodst1DSQE4zaL1uvjAZgHLWmQZDXAA8Vf3ehGZMVr4Cs
         fKMR/SM4aPvtTVAVtTwqX3xPQUbyBlrzzUjPP7t3C/LqeHL2C6B8Y3bzTZylJvYi5N9a
         UUaA==
X-Gm-Message-State: AOJu0YyrDu+snMt+Ka4rA/NvWskJEgs28D/IfFA0cvbfHPQ1eOILcjVY
	+IG9eehcxE69VAhGQeTjQw+RMQ==
X-Google-Smtp-Source: AGHT+IH2XK3VmzyApGKH2dJRP5mNU0HGdkujQYH19VxvKR71Nk9rdeM2oIikSY71v9WV2Mt3FvghIA==
X-Received: by 2002:a2e:8709:0:b0:2c9:c192:42a8 with SMTP id m9-20020a2e8709000000b002c9c19242a8mr1654073lji.38.1701293324577;
        Wed, 29 Nov 2023 13:28:44 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id b5-20020a05651c032500b002bcdbfe36b9sm2106196ljp.111.2023.11.29.13.28.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 13:28:44 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 29 Nov 2023 22:28:39 +0100
Subject: [PATCH 03/10] ASoC: cs35l34: Fix GPIO name and drop legacy include
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231129-descriptors-sound-cirrus-v1-3-31aa74425ff8@linaro.org>
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

Fixes: c1124c09e103 ("ASoC: cs35l34: Initial commit of the cs35l34 CODEC driver.")
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 sound/soc/codecs/cs35l34.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/codecs/cs35l34.c b/sound/soc/codecs/cs35l34.c
index e5871736fa29..cca59de66b73 100644
--- a/sound/soc/codecs/cs35l34.c
+++ b/sound/soc/codecs/cs35l34.c
@@ -20,14 +20,12 @@
 #include <linux/regulator/machine.h>
 #include <linux/pm_runtime.h>
 #include <linux/of.h>
-#include <linux/of_gpio.h>
 #include <linux/of_irq.h>
 #include <sound/core.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
 #include <sound/soc-dapm.h>
-#include <linux/gpio.h>
 #include <linux/gpio/consumer.h>
 #include <sound/initval.h>
 #include <sound/tlv.h>
@@ -1061,7 +1059,7 @@ static int cs35l34_i2c_probe(struct i2c_client *i2c_client)
 		dev_err(&i2c_client->dev, "Failed to request IRQ: %d\n", ret);
 
 	cs35l34->reset_gpio = devm_gpiod_get_optional(&i2c_client->dev,
-				"reset-gpios", GPIOD_OUT_LOW);
+				"reset", GPIOD_OUT_LOW);
 	if (IS_ERR(cs35l34->reset_gpio)) {
 		ret = PTR_ERR(cs35l34->reset_gpio);
 		goto err_regulator;

-- 
2.34.1

