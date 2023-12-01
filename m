Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IJM8OTO4"
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFBAD10E2
	for <linux-sound@vger.kernel.org>; Fri,  1 Dec 2023 05:20:35 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-50bc22c836bso3028909e87.0
        for <linux-sound@vger.kernel.org>; Fri, 01 Dec 2023 05:20:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701436834; x=1702041634; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hvwEnfEWC7X3PkrakUYA7rH73mlgP4mcx3Rphz/0vOk=;
        b=IJM8OTO4byvSlW9lNhOVEvl9W9xORYkxq2l0w5vVuoCdklwN0aVGPuir0IyHOOeSd+
         kmeaL/AOVJ53W4lxWXXPJ1vIICjnU5CD/uK+w/y1sq/fyZz+zeVXWUQ018BsOepKImCq
         jl9SODPPXbIOCmznMquvgM6qrbqW0JuQBi0tl42qXjegytNQ1PBXkvvmsC5PrWgp0Wgq
         34HY8pyYWSB/LtAxvRjj+i527xd3XBV/+mxFIfpEiDNUzZ5/Ej7ito24j/vCvQvAi8Sq
         VwHO9EyXRzAAIP0q1hK/PBdK9Xtobss3wA3bvANI2heowUq44jMpaxr3zHyygW8CXQI8
         Luxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701436834; x=1702041634;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hvwEnfEWC7X3PkrakUYA7rH73mlgP4mcx3Rphz/0vOk=;
        b=iE3QWHGuJkPq0FBI1RSU0XCLnG7nen6p9lHdwHonI+DHn0XPjSdGh2c/RijG8i6uXm
         Az28g3r7iluiLeNHSqLehROSqC4vgoKhjmoW95pWBDDnbSWZurgDAIJG2aEugC8Gj/rk
         AtWypq7FFmcJoFlh9moYtE77Iyvtx/dJrpklhY/Rdglx6CTSgEN3A1PmH/mjM0xkoB0Q
         E5IGI7Bh/JZGCAoLgAn5xIYGQ1XV30Mph7bJ6Q72x/0IcTw1+f2qyr7l5CDDNk7L1Zsm
         6sLgdaH9D2dyl6EWty71muyFVQXxe3XeGeFe0KehyliSbEF2p8ZVQVjoWQEjqiUtkYdf
         PxEQ==
X-Gm-Message-State: AOJu0YyqANazV4G+AmWTTfVKvnPW8Vmilz94WJVwLLeN8VPuUnzwb0AQ
	54T/m2mg0AkRzpibuuzm3bHS7g==
X-Google-Smtp-Source: AGHT+IHy8r+VGJLhcKYulz95n0Llz8QkGNwo3fVIlOQzYeCx6OX80VUxPFF/MbvUz9dVuCcnHSKjPw==
X-Received: by 2002:a05:6512:36d2:b0:50b:d764:6ec8 with SMTP id e18-20020a05651236d200b0050bd7646ec8mr745977lfs.120.1701436834148;
        Fri, 01 Dec 2023 05:20:34 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id u25-20020ac243d9000000b0050be054b4e8sm1081lfl.121.2023.12.01.05.20.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 05:20:33 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 01 Dec 2023 14:20:31 +0100
Subject: [PATCH v2 02/10] ASoC: cs35l33: Fix GPIO name and drop legacy
 include
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231201-descriptors-sound-cirrus-v2-2-ee9f9d4655eb@linaro.org>
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

Fixes: 3333cb7187b9 ("ASoC: cs35l33: Initial commit of the cs35l33 CODEC driver.")
Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>
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

