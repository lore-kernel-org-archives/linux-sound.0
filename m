Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Fjda7kAI"
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC2B510E2
	for <linux-sound@vger.kernel.org>; Fri,  1 Dec 2023 05:20:44 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-50bbfad8758so2888054e87.3
        for <linux-sound@vger.kernel.org>; Fri, 01 Dec 2023 05:20:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701436843; x=1702041643; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+fvbs0Xp4GpuorKL8Tfj6BakgsRgukno1Vk7LhvLiBQ=;
        b=Fjda7kAIte4KopGlVDv1zFPCcpxE/5458cod4v6furtM4uXLLceKFXt84gaVaf2+dR
         zxDwPY3Rcfdb5vnOzkxKv5IPIdP9UBAXVsvwQGNfduQp1wXb2suiTO/ERAfsWfQ0FzJ9
         /4fqRbrxuvWx6hhrBp+/R8cUKVrlhUYY4+6zBlky5qS/hLqkFtM/41hIewNoeHkDUyC5
         2/0fqprL9JxHXWbpRCgdBygjmBKSWs9JO4lWXJiYyuPQ42eweQZS6Blfyexseww0ZCzl
         VVdz2BHfAbj9gdwuuHPNTYmqTPbkbY7ZOgcJZmrfKkyHd42sd9dcQmN1SvWWH3PYe/ws
         Lurw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701436843; x=1702041643;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+fvbs0Xp4GpuorKL8Tfj6BakgsRgukno1Vk7LhvLiBQ=;
        b=te0YCUHoLd2ImW0fxct5u6D8k3yR7d4wpgR+PyavPu08kP0uvnPmFj3TpCeggCKjM9
         psEYPWInXPkj5bFVjSefqCEF9sTB4b8n6OTv5IpV7+UmuHAmN1ySgDK3rIf8dQ2e6e0j
         q23T5WwHO/1MTVhfHDblq9tkQW68BEC+RAABLhjfH8zsKfPDa6of1B0YGebuDVyt3V2R
         WE7fA9v17gTQzEuu12hs+8942Zd8FailPAW7B+z6mZItLZIM7o+wUxYLR54fo7UxTGEX
         QvCcYMl7/ZLybqYMKFLc66tBLNzwj8JKne/3Hwt0E+pjYdi1VrhYKqodBsOsrXCYX8F0
         1iEg==
X-Gm-Message-State: AOJu0Yw/23NIUW91KPsNa9DxoQnWLBf4bU3UB3f53pbdiw3FRCdG5U27
	IyQBQJYeiII7aWdagVHVpUmn6Q==
X-Google-Smtp-Source: AGHT+IHtjQtt799xLpoVCezjOYP5wu/F6yl+pLI9Fcs3e2ywoijlCxrF0bm3T9nOT+wMNRQXj8UvwQ==
X-Received: by 2002:a05:6512:1046:b0:50b:b9f3:9fc6 with SMTP id c6-20020a056512104600b0050bb9f39fc6mr534218lfb.54.1701436843083;
        Fri, 01 Dec 2023 05:20:43 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id u25-20020ac243d9000000b0050be054b4e8sm1081lfl.121.2023.12.01.05.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 05:20:42 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 01 Dec 2023 14:20:39 +0100
Subject: [PATCH v2 10/10] ASoC: cs4349: Drop legacy include
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231201-descriptors-sound-cirrus-v2-10-ee9f9d4655eb@linaro.org>
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
 sound/soc/codecs/cs4349.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/cs4349.c b/sound/soc/codecs/cs4349.c
index 9083228495d4..ca8f21aa4837 100644
--- a/sound/soc/codecs/cs4349.c
+++ b/sound/soc/codecs/cs4349.c
@@ -13,7 +13,6 @@
 #include <linux/kernel.h>
 #include <linux/init.h>
 #include <linux/delay.h>
-#include <linux/gpio.h>
 #include <linux/gpio/consumer.h>
 #include <linux/platform_device.h>
 #include <linux/pm.h>

-- 
2.34.1

