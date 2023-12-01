Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RMeMo7Qn"
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BC0213E
	for <linux-sound@vger.kernel.org>; Fri,  1 Dec 2023 05:20:41 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-50bc743c7f7so2879672e87.3
        for <linux-sound@vger.kernel.org>; Fri, 01 Dec 2023 05:20:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701436839; x=1702041639; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h1YwCm+XH2HIMFvp7NT2GALpzlzAqPDpRrGRX4ZS3D8=;
        b=RMeMo7Qn1JFYgqhi7H9+WvV0UAhIjPDOcGq5ZJTBe5i78N4eSBTu3vSH7D4ORyN38k
         gbnH4TYpedILJr4/jQ6Zm9He6d/UUJjgx1jhu6X1Sd6ezvLVZj4WUWHLGdlzdCCLwzh5
         h3l9XyylWFzxnsan5yULpfXh5Mv7ox9GPWGVy/tSKV7XgPSsa+xqLbjooRIjjqlnZytY
         KpG5YV7I+U1SiRLM69b10O+Tg9Djs6zSDZDnWGnqd5jp33IJ/PZ7a41cDu79CSR9WwG3
         pPiNKD/2a8Rgz2A4+Sj4lTxrrm6xUzTvaPxaVJOQDLZS31uZzKJKqdzL4eeElwfOBzE5
         LMQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701436839; x=1702041639;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h1YwCm+XH2HIMFvp7NT2GALpzlzAqPDpRrGRX4ZS3D8=;
        b=S0yo6166Yaa4XXa1I4DiceiOUZMI4AXqv4skiRrs3wbH8Drrz+6Rx14TWfztpyI/RP
         rLUCU0ODAEoSV+NowZ5R4hUQ1SJT/1DBuHo82obj5pF563I7C2lDFg21GXUHAWQvFz6E
         eUuxp628a2o4tVqKLMkkDprCe4h6LQ9BZTn8uY785QgDBHCYLiRRHYc1KwkSqyFrrjmz
         VZ+AC8MaaL8elZE/Y/WcREqCH/hGpZ6nSpM7s0N3hXk48XRzPW2to0zIt7sCI4VLbyGH
         oPUnAotZMEu2TZtjFanbZfNZNXQETX5vWzwLj5QxVGg7VuqnF9m/A9AS7XFfch0Imcnw
         SITQ==
X-Gm-Message-State: AOJu0YxlY+BsOnxOoDar1WpKieihqg28e/DMipuUSA/O8o9ms4AHnh6y
	NKXK7GFFYYNUO6tlnX6QvQsbug==
X-Google-Smtp-Source: AGHT+IHz0vX9CqCj+qD3UQTWnTMff91+vQiG2xdvgEoaXCXAVJNAM8ut2DNGIFy42sB0tfaYdArJbQ==
X-Received: by 2002:a05:6512:1597:b0:50b:c9c1:19ba with SMTP id bp23-20020a056512159700b0050bc9c119bamr868333lfb.63.1701436839678;
        Fri, 01 Dec 2023 05:20:39 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id u25-20020ac243d9000000b0050be054b4e8sm1081lfl.121.2023.12.01.05.20.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 05:20:39 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 01 Dec 2023 14:20:36 +0100
Subject: [PATCH v2 07/10] ASoC: cirrus: edb93xx: Drop legacy include
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231201-descriptors-sound-cirrus-v2-7-ee9f9d4655eb@linaro.org>
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

Reviewed-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Link: https://patchwork.kernel.org/project/alsa-devel/patch/20231122-ep93xx-v5-38-d59a76d5df29@maquefel.me/
Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>
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

