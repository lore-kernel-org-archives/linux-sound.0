Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qOmapnSW"
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8614BD7F
	for <linux-sound@vger.kernel.org>; Wed, 29 Nov 2023 13:28:47 -0800 (PST)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2c9c82a976bso1631341fa.3
        for <linux-sound@vger.kernel.org>; Wed, 29 Nov 2023 13:28:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701293326; x=1701898126; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YU/umhZ4xMv6PXObbvZL6R5y01gsoGYZgYp3KJFvARs=;
        b=qOmapnSW5GLcKq7hzpbZQklUCY8/JzOIhPzOMP55fM6MUFE7O+ydi8JTluhQ4by6/2
         XEaixxMI+Vs7mC6fDukIySkMVPybwK3SqWiVTd9yWoODsJkg614F/TrMgGQR7LwguQDm
         ex0fEDr0OW6kBBcf9ALimh9o2O3MggEzLyWkHrzSN1QVrzWMZA6Kr0ppQSRwzEmz9zCf
         lZ61Pc30wVILOUESmubfCoTmrk/sCsiJfB0sF6ZlE0FR8HoUAQnS38plNQXZcmTDCXni
         hq/9FF0ZJnyXg0KwdKOF/vdhneNa044VjZJuJolFgPD4/an/z0a6t8PdcJWB7keP3b4A
         Uqqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701293326; x=1701898126;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YU/umhZ4xMv6PXObbvZL6R5y01gsoGYZgYp3KJFvARs=;
        b=YThyTkTiS97KNnZ+Z5xC7bA6bAj9jb7ar2H2X8TrdEe4xlhSipuQzZGGS/If228pZM
         5oBqH3fwZkXHg2gI+k9U3/zUhIdR5meyN6CRTiynrYfa2Ew1VR6s4AxbKj9jRvVvjsPL
         7voIEaE3bjAYj6lB7Sk30zdSoU0u+A8LW/qz7+pYNW21ry0owLfnUg+0SR5bR8phHf+G
         Q03rLxPu5GJ8brfRLRdz75Btk1jKpR7KdR9YGLdVeeG8M5ogQatFZBudvQgDCro+LwwH
         7ZcYnCGA6khz0tumnulDeU9tRFoPLLdOvQ0QTLEID1mRepsPtEzpwToSvP2tkZAh08FB
         kShA==
X-Gm-Message-State: AOJu0YyXxtfOl66jiyzxj+uzABKX3TZ8+Ik6vvSeEpQzywic47JoxrJg
	AZaLwo442aInVxiEgrqAcxVEHQ==
X-Google-Smtp-Source: AGHT+IE+lDIdHAdte4rENQsg0tSBQfqVYqAjeDvwRKqHOtDWVAZmyuqpLukchZeA3cMSJEgTRjKklw==
X-Received: by 2002:a2e:88c6:0:b0:2c9:c438:d0fb with SMTP id a6-20020a2e88c6000000b002c9c438d0fbmr1191629ljk.34.1701293325848;
        Wed, 29 Nov 2023 13:28:45 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id b5-20020a05651c032500b002bcdbfe36b9sm2106196ljp.111.2023.11.29.13.28.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 13:28:45 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 29 Nov 2023 22:28:40 +0100
Subject: [PATCH 04/10] ASoC: cs35l35: Drop legacy includes
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231129-descriptors-sound-cirrus-v1-4-31aa74425ff8@linaro.org>
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

