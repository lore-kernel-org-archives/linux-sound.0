Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FN5b0IS+"
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FCBED67
	for <linux-sound@vger.kernel.org>; Wed, 29 Nov 2023 13:28:48 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2c9c82a976bso1631551fa.3
        for <linux-sound@vger.kernel.org>; Wed, 29 Nov 2023 13:28:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701293327; x=1701898127; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BhewE5OJd+lUpEbKMUw+a2p3lLwyC+mccGsAap2s2vQ=;
        b=FN5b0IS+ZIklVM8Zj7o/c8aRg9ajBoXyLBkrQIZxBsxmPNwoqLQ/uRJ1yN4TfYYkmh
         yw+kdBGRmRhU2g6wfMjB4de1jZtG4r+CgQLL6Eft1WP6FXcmO8ZQFA0I9eGxim8dJWiZ
         EEyBaVe7wU136LVx8SKeomQKJ6vzYFBJVCz3bxU6MGpbIxP4NPPxj6fxeVKHZFzzj4Xg
         4hVxbh3TuLQtdMesMaA6tcb3xziTf0nLKiu9gWEe8zjyljjqOzoeU5Q/neRjcP1dfvo4
         lXtaV0LIrCNIGQ3YcW0PcLHQJTB1RFREh4m/hCKc33JPztpoA8svMPHEQLlf68+p8awx
         Mh5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701293327; x=1701898127;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BhewE5OJd+lUpEbKMUw+a2p3lLwyC+mccGsAap2s2vQ=;
        b=LfsDFTrk9bERMUFJCTH40Ds6yFtBu1XdUClm0+B/OHfx1dd0PXK4l0aFTr7K8OMhZZ
         //LaFUqDUnuSb0qfzT9Z2GpjToBwl9FiYNYKUwjGlKIl/EA41OuQTNs/h8gPrQDyfVJ9
         jBt7eGf3xPv2uzMTe6AywYEffpOiQhanax1WcG/LA1edWOs6gteXfSduxplYfu90Qve1
         qh24OO5DZbRJqTmEQm17978c42R7ugtTfcnqFC7YvLnvfDyeXG5ea2EB97nV7h9zbIwT
         E4mEU8xAJLgJ0YbDwGA6UiVOZipldLWQuXOIRzAM741rov8xGw/M5Un8Z5ZXFthauqy1
         3pPg==
X-Gm-Message-State: AOJu0Yy9BAWwYsMH1ueLC9pvNBv7GDeYOahp4mEN4sONuNUjibYiI8ni
	X4l6pTxHPor49zlSI6zs6VPCDw==
X-Google-Smtp-Source: AGHT+IGxbQDzbtRllfk3uIL9CtkIkPKjX8R74m1/levpV4rcuCDOPksrJ0QcmNJ3lIdNQ3SMD2Q4bg==
X-Received: by 2002:a2e:8e27:0:b0:2c9:9a87:6683 with SMTP id r7-20020a2e8e27000000b002c99a876683mr8118803ljk.1.1701293327016;
        Wed, 29 Nov 2023 13:28:47 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id b5-20020a05651c032500b002bcdbfe36b9sm2106196ljp.111.2023.11.29.13.28.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 13:28:46 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 29 Nov 2023 22:28:41 +0100
Subject: [PATCH 05/10] ASoC: cs35l36: Drop legacy includes
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231129-descriptors-sound-cirrus-v1-5-31aa74425ff8@linaro.org>
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
 sound/soc/codecs/cs35l36.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/codecs/cs35l36.c b/sound/soc/codecs/cs35l36.c
index f2fde6e652b9..ec407aca33e9 100644
--- a/sound/soc/codecs/cs35l36.c
+++ b/sound/soc/codecs/cs35l36.c
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
 #include <sound/cs35l36.h>

-- 
2.34.1

