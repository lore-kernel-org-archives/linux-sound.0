Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ngKbmoUU"
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0FA9D7F
	for <linux-sound@vger.kernel.org>; Wed, 29 Nov 2023 13:28:52 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2c9c1e39defso3625361fa.1
        for <linux-sound@vger.kernel.org>; Wed, 29 Nov 2023 13:28:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701293331; x=1701898131; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Iu+jnDbRLvNSd29JPH0PlE0Rt4h1OZvlGiQIvlLElkY=;
        b=ngKbmoUUT5FuNtEHWf5Ps5LydKMHS7Td03FEC97NElV6fGj0JJhxjy1YnN/pLSiO7x
         ytrqzclKM9i3n9pwQkrR8BnC6g3tgYvovY7Mb2UWohfdayJYio1OaXpKLNuRVhI/ZSuA
         1Yg6c7zUgsRN9e/b759PNtDtIzPBM7lypJzpkz+LXXZ3TqYeMYwCdRoEoF1o5ezkv45K
         sM6SjswQVtfEm6OhucQztWtVC2J3//d7bclS0xJPFo+4jde35PLjNU19/mvujgEGH7TQ
         RRtSXpW8tOLzaWq9DViwrsfow9jA1lFgqMVHBNYaFQrS8hX2s1dvp0p7velZN082p7vr
         2gMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701293331; x=1701898131;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Iu+jnDbRLvNSd29JPH0PlE0Rt4h1OZvlGiQIvlLElkY=;
        b=BD/BVWNw55wG9xqKYGfo9aZTowqhCicJy6p9EoHySxb0DSj6LoVZFJL6gZ6cSmIOb6
         J4r8pOtdatRj+ifxSa+PsYmXpUjYyPYb5WSCnRm65YOEjp+k3ax0ThKv1zlaLbByNfyl
         Y026OFXcMIixoT1HtDIL1+1koElHegR5GozWpzzvA0wfUx9mxLAMNT59K0SPg93pBrsy
         U/dkVN/qvaYdPZNfEhDxy6Sy8ABFPN482bZkE98eKOuAqVfMyXuMEigrFRa6yXSMUNfZ
         u+NHEpUb3YjMLh2PJIbVXdaAUzyP/AVXG43tAGapbxLSBH0shg9rg9mJbWYmiTBTZE/8
         qulA==
X-Gm-Message-State: AOJu0YyB/NZtJs5c/Ldd9xH6UMtjkqLSB/zHgGbNs6EkZvUjUMPUpk5s
	aEK40NShR+kcgWBdyrg0lGPxYw==
X-Google-Smtp-Source: AGHT+IF/28zICERnGlS5+OnSEEJkvgxEGnITMU5KpHeObXbDWy5BHjwpi8sDYXn7h5PUPVbGD2wWHA==
X-Received: by 2002:a2e:87d9:0:b0:2c9:bfb1:aa75 with SMTP id v25-20020a2e87d9000000b002c9bfb1aa75mr2165119ljj.29.1701293331064;
        Wed, 29 Nov 2023 13:28:51 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id b5-20020a05651c032500b002bcdbfe36b9sm2106196ljp.111.2023.11.29.13.28.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 13:28:50 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 29 Nov 2023 22:28:44 +0100
Subject: [PATCH 08/10] ASoC: cs42l42: Drop legacy include
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231129-descriptors-sound-cirrus-v1-8-31aa74425ff8@linaro.org>
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
 sound/soc/codecs/cs42l42.c | 1 -
 sound/soc/codecs/cs42l42.h | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index 94bcab812629..2d11c5125f73 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -15,7 +15,6 @@
 #include <linux/types.h>
 #include <linux/init.h>
 #include <linux/delay.h>
-#include <linux/gpio.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
 #include <linux/acpi.h>
diff --git a/sound/soc/codecs/cs42l42.h b/sound/soc/codecs/cs42l42.h
index 7785125b73ab..3d85ebc59489 100644
--- a/sound/soc/codecs/cs42l42.h
+++ b/sound/soc/codecs/cs42l42.h
@@ -14,7 +14,7 @@
 
 #include <dt-bindings/sound/cs42l42.h>
 #include <linux/device.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/mutex.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>

-- 
2.34.1

