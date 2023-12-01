Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UAusfU3e"
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC07310F8
	for <linux-sound@vger.kernel.org>; Fri,  1 Dec 2023 05:20:43 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-50bc8a9503fso2917202e87.3
        for <linux-sound@vger.kernel.org>; Fri, 01 Dec 2023 05:20:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701436842; x=1702041642; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k2Zjl+ghnoX/3uQpkhvwTgBBfYBwCJ4hUzQ4RLGrPPQ=;
        b=UAusfU3eTMojzKvxgNYFEl+apPkPQINrhAc/b/g2uEi5TGt0o4QlW0AL+YPmtOfYyO
         KD39PXAh3HOl7dmc2c3bYK4rG+oVvyPuswleg7paks9ivABcNs9boZgC67N6pufrwoLh
         +j7WNacmiK1T5Pj27IA9gSUYf+JrFLRLMnhuOBPkbgzSCJqBt4JOy187H/zHpJX323Dr
         LKsuHGk3zwTTj2svAGuoYFxpPG5H6kUkAaUSVikAFZp06jKN9L42zUHt4LovAtN3RMxn
         T2Uiv57ykJ6+/oxaPh8+hTkS0mwGkp3QWSfxiS6fU5NMx+jL0bkfPINjW+dHDCcMJpHM
         QTMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701436842; x=1702041642;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k2Zjl+ghnoX/3uQpkhvwTgBBfYBwCJ4hUzQ4RLGrPPQ=;
        b=r5jdf4uKhQSmcgKdhUMogOUAa+1TsH4X54ndIos++lcJtQn64++TW8shEDLrZUC2oT
         9mJs4cKZI0JbGhnIxBodqJxhTe7JUsqtmkNIQ89/G0Vu3Ut5Y22/Lp7KYAOpeZIZyTUs
         4INBZrN/LRxF/F0KuWRI9eIPY61nOk6uxWaTlCk5jOxJGEwc3F/Dr69K1PK1hs2ki5v3
         TyrHJFsS97fs4d9m4TlnwhI+ftLyjxv5Le1vx5Q7Kpvy/VdbO0yjWETYqpAv5WjBvTkv
         mavMT7R/w0teB5YDGy8ba197xK+3vFSB9o5pZ2MpTvl3XVyh9Q95nkQ8eZrO8weOYUP5
         nqqg==
X-Gm-Message-State: AOJu0YxgHG8NNyXG18xLOh5IJ0UsBmL+4ucd4EgOZQ1DIUEZnhhJ6K41
	224whUqhJrDjVwBBlEYgb0VwSA==
X-Google-Smtp-Source: AGHT+IEP9YooEM6UIg2kUPyWgnGCZVy2TmLr2VGSLb6afACF8IimZsUAaROd3HdHHX8+hnBq6Qopkw==
X-Received: by 2002:a05:6512:118f:b0:50b:c7b0:ecaf with SMTP id g15-20020a056512118f00b0050bc7b0ecafmr892089lfr.49.1701436842052;
        Fri, 01 Dec 2023 05:20:42 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id u25-20020ac243d9000000b0050be054b4e8sm1081lfl.121.2023.12.01.05.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 05:20:41 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 01 Dec 2023 14:20:38 +0100
Subject: [PATCH v2 09/10] ASoC: cs43130: Drop legacy includes
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231201-descriptors-sound-cirrus-v2-9-ee9f9d4655eb@linaro.org>
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

