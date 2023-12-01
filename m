Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pzAPEedG"
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C081610D0
	for <linux-sound@vger.kernel.org>; Fri,  1 Dec 2023 05:20:34 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-50bce78f145so2344277e87.0
        for <linux-sound@vger.kernel.org>; Fri, 01 Dec 2023 05:20:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701436833; x=1702041633; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6nBS0qEXkMT109HJpJHOUn0za4cdp5UY2TNq9aMO3Co=;
        b=pzAPEedGiuGQQr3XfWkoV7Udxo2F6wvwzhq8DAMPC/ik3tgMDKtT5efAfHmmAbaK8+
         KE4HMQDJHVjDpFX+BJgc9TSHMr7pDnSLhhB0hVrR2jtof4ZkqlIPUaf3GnKqBro7Fglp
         YJwJkbacAmywo6Vb31QJQ+OstKjutixf666p1f5Mgstj4bJrds8Yroe/TEDOh7jxCEzI
         QEReUXX4aHPuCIMmu51HSSUqGQknnhDkVzzr3S/4GFkoT6UeqNqbH6Y1FCxnTqG3nzHI
         nupYXjwi2KGh5qjWlEcyMAR0WpMur82sqALvb5bmbEkFvy8QhBumY9j6z+mAnFQVV4tC
         7D0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701436833; x=1702041633;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6nBS0qEXkMT109HJpJHOUn0za4cdp5UY2TNq9aMO3Co=;
        b=U2OyIjSy4JOpDIQlaRZFqso6CfqKBh/APW3etK2bzy+rF4bAWUIREFaBEuujyyFs1m
         mag56VEvutDJzJjviFFpd90HCod31mdNTjAUhb23GcD/RkrRk+faFGvp+IfbJxPrEso1
         A9nkTgMjBYG4RSJVIRyWQhcvLJKL1p4dxV8jau4tjtbMXdXHVpOEQUvv1z+MB57a1da9
         elBnXt29yt5wjsFuKQbvXpK+gLBVhzzFGeKITVyABrXpFi/9LNxjmtNpIoihWCRMxIBs
         6+5CT+FQXfwFWuMVHQqSEhbpcEkhAK2qWF3CknRSX5ut6BYCRhJ4s9UttLt3ywxdOdhJ
         Dx2g==
X-Gm-Message-State: AOJu0YzpEa628uTZUhBdlVZddYuNJ3z53flwp1GIiCKXC51rZ3Zy9IR+
	nKOmWT1OAo+1N4GAvNc3QLVKrA==
X-Google-Smtp-Source: AGHT+IEZBoALYT2AI/HvZGmMjYehDRhxvtPlZru/apoTdsAj69LXnriJmkSP9pMwuY+NY+SyLAK8qw==
X-Received: by 2002:ac2:46db:0:b0:50b:d764:8e5f with SMTP id p27-20020ac246db000000b0050bd7648e5fmr446890lfo.113.1701436832963;
        Fri, 01 Dec 2023 05:20:32 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id u25-20020ac243d9000000b0050be054b4e8sm1081lfl.121.2023.12.01.05.20.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 05:20:32 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 01 Dec 2023 14:20:30 +0100
Subject: [PATCH v2 01/10] ASoC: cs35l32: Drop legacy include
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231201-descriptors-sound-cirrus-v2-1-ee9f9d4655eb@linaro.org>
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

This driver includes the legacy GPIO API <linux/gpio.h> but
does not use any symbols from it.

Drop the include.

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 sound/soc/codecs/cs35l32.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/cs35l32.c b/sound/soc/codecs/cs35l32.c
index 138040618438..d1350ffbf3bd 100644
--- a/sound/soc/codecs/cs35l32.c
+++ b/sound/soc/codecs/cs35l32.c
@@ -13,7 +13,6 @@
 #include <linux/init.h>
 #include <linux/delay.h>
 #include <linux/i2c.h>
-#include <linux/gpio.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
 #include <linux/platform_device.h>

-- 
2.34.1

