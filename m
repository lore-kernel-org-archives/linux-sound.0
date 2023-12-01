Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hv8Fh6R1"
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 290CB10F8
	for <linux-sound@vger.kernel.org>; Fri,  1 Dec 2023 05:20:37 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-50bc4fe8158so3001575e87.0
        for <linux-sound@vger.kernel.org>; Fri, 01 Dec 2023 05:20:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701436835; x=1702041635; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lDKFgSOaPuVFur80bPhP3dFYnn3zUMFtVllkw5He9o4=;
        b=hv8Fh6R1nweNNqSDTh70Avl3Zen3zf1n76HYzFAtUKl3mB3vdTQq1ssxy8PWsHYy6t
         sK9jvEPg4k48jK45Qr3dc0X8HJtqGjLJNRFTY2v02MQRLuB8pnnU2Eu9zbD5PMESalL2
         nZKMMXMX8nPwE3G+cHcgEnqk6HGJrTogVj8kQPzyqPC2vEJe7eE6XDtZzM/KIyoddar9
         cSNeWmztSJr9sx3d3CRUCYGziLHZJu8suwBFob96gMnlOmKc47PRrIyt0LjNbiYa5epA
         Q/4radCB/KbKAnMlx7wcDZ2XazYt146Blia+Fz5G+3QI4QcGI1thTA5m6C3LfJex3h5f
         e2jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701436835; x=1702041635;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lDKFgSOaPuVFur80bPhP3dFYnn3zUMFtVllkw5He9o4=;
        b=vWBU5ifCw9URPQw1FkOSD+IYotGvy977jjJmJFKzZOeugsofcDmf8Pwn2KUFQZ/79V
         JQGP9MtidnZxi48Dy7BwJGOPr4SDjcA21EDf1RJ8jZ/ES+isg0Y/AE3B54lRuyCI13yh
         ace/wTeIxzmJpBHmxHSZxohBHCT2iG0fbT0XB+Dj+CDJ93Qw9KQ3HYCKJYpJOpqMW4zT
         fAAEwWag/a68xKyUbzmFT0ib6JLZhgyD/z8vN+ahLtgrqpYXM33TcAD8ZOGRgZk+UpER
         +scU4IXCwc6mlJRdj2X8NzLZtCs29sft1IrxfqnT5pl6EKw5Wl2k7XpE4UaLpvLOYzVC
         7Qow==
X-Gm-Message-State: AOJu0YyZCVU3YR4axMrs/VNTV68CRlr2dQeJrpsxBOgRTNDMJv/CvT8N
	5y5bPMEnJw1+8/T8BJNQ9AnHyw==
X-Google-Smtp-Source: AGHT+IHPhwhCcZemWJXPkwH3F0g8I2ogdr+dlRUEBR2WBwxAYjUakxV0jDfSRYYeCIC7/cyqXFUOUQ==
X-Received: by 2002:a05:6512:615:b0:50b:d764:9683 with SMTP id b21-20020a056512061500b0050bd7649683mr765669lfe.103.1701436835426;
        Fri, 01 Dec 2023 05:20:35 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id u25-20020ac243d9000000b0050be054b4e8sm1081lfl.121.2023.12.01.05.20.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 05:20:34 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 01 Dec 2023 14:20:32 +0100
Subject: [PATCH v2 03/10] ASoC: cs35l34: Fix GPIO name and drop legacy
 include
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231201-descriptors-sound-cirrus-v2-3-ee9f9d4655eb@linaro.org>
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

Further the driver is requesting "reset-gpios" rather than
just "reset" from the GPIO framework. This is wrong because
the gpiolib core will add "-gpios" before processing the
request from e.g. device tree. Drop the suffix.

The last problem means that the optional RESET GPIO has
never been properly retrieved and used even if it existed,
but nobody noticed.

Fixes: c1124c09e103 ("ASoC: cs35l34: Initial commit of the cs35l34 CODEC driver.")
Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>
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

