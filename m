Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uw3wiAJ4"
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A399DD67
	for <linux-sound@vger.kernel.org>; Wed, 29 Nov 2023 13:28:51 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2c9b5e50c1fso4101791fa.0
        for <linux-sound@vger.kernel.org>; Wed, 29 Nov 2023 13:28:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701293330; x=1701898130; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y5TZCHl5JrsKzVzdedTBOjjaGJPtqogPOahlRjnAK3I=;
        b=uw3wiAJ4T0B+RHiz6qEy3mNAL9bPy+MFF+0MRp9lbwFNPXAHTJ61Ov3tMfP5zmAur2
         jdKimxnelbYRUntLj4F4bHjeBg3fOyjEgGO+qAeVfBK6vL3SRf8XYHd/4xKqWblD7hlz
         9PgV9+ZFCq8KhCBgXK2NTno+whua27beAaf9jhoiImC9XnVFoqTnQDP2wokHNVJIBTh7
         ACl/pZTS4Hk5UN5VzcHFwOmdqh7XTTAbrmZ0/5DU76Thv3zAwAdr/usJ1FiUl0FNShtU
         IdvVbg5A8JKg0ausQsFTG/POjBm9XKk0pUB4ZnavAACF25p7x5SQa1PHsDoJGwzJGwlW
         sDQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701293330; x=1701898130;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y5TZCHl5JrsKzVzdedTBOjjaGJPtqogPOahlRjnAK3I=;
        b=C06cNL+4H7MtY4DWwCNl0qfijId6jGt/5VvEySXpGs00YG/3wMRxJrEPcpi8T6nXew
         21aMqmgFltj4OWfSs9lnwitdmoRVVw4o8eZasLCldkTajJkCWWroLy8eTZ8vtqRbRvOA
         CIYdXwY1VYy04WMgXhzzzzvHD0VxAfUs/4U4ZQhE2VdHInLvZJz1K0F81OA3YUVvDSK6
         cPdaRsesPSUneIF0bY9/TcY2AyWYisRHV7/3Vb465KB+q9Ft8GFFk/JyjR2wtrUMFm3W
         5lMAcZRPDDjWYd9P8lZNGRpvvsjR/DOW2jPsvvXHbsn0JuVXf+t7OGYphR2NMcJATrJU
         DFpw==
X-Gm-Message-State: AOJu0YwhlpZYugimVmSP5VNh0s79wu+yaXBhjknxvlloXPdPnmi8lCL4
	37QodoOsvbxFqOlNZAe8/qLsHQ==
X-Google-Smtp-Source: AGHT+IG2iJRuG1eHTWV98yu7FrzVbLk4F45mt7qi99SvzYEoV5Esdv1xtlzmQWw30MGgDqcTjnHMVA==
X-Received: by 2002:a2e:9b4d:0:b0:2c9:b4c6:a7ff with SMTP id o13-20020a2e9b4d000000b002c9b4c6a7ffmr3942168ljj.40.1701293329961;
        Wed, 29 Nov 2023 13:28:49 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id b5-20020a05651c032500b002bcdbfe36b9sm2106196ljp.111.2023.11.29.13.28.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 13:28:49 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 29 Nov 2023 22:28:43 +0100
Subject: [PATCH 07/10] ASoC: cirrus: edb93xx: Drop legacy include
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231129-descriptors-sound-cirrus-v1-7-31aa74425ff8@linaro.org>
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
 sound/soc/cirrus/edb93xx.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/cirrus/edb93xx.c b/sound/soc/cirrus/edb93xx.c
index 6b6817256331..8bb67d7d2b4b 100644
--- a/sound/soc/cirrus/edb93xx.c
+++ b/sound/soc/cirrus/edb93xx.c
@@ -11,7 +11,6 @@
  */
 
 #include <linux/platform_device.h>
-#include <linux/gpio.h>
 #include <linux/module.h>
 #include <linux/soc/cirrus/ep93xx.h>
 #include <sound/core.h>

-- 
2.34.1

