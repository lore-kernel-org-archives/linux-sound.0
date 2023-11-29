Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WcPxlb1r"
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E185D7D
	for <linux-sound@vger.kernel.org>; Wed, 29 Nov 2023 13:28:44 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2c9bf8964c3so3599441fa.1
        for <linux-sound@vger.kernel.org>; Wed, 29 Nov 2023 13:28:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701293323; x=1701898123; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uGzqJZeCIvHWgx50HcN8P2Sdt/SHVZafM+S/3T4/ITk=;
        b=WcPxlb1rvfwiFf9/6+qE9ZRL/4+EdRBIoPBvRpBqE0j9u40zIlse4JraXLPQcgusiU
         f12rbHu1B1SMEncy1MYVKSkV/ReGNyEc2ogCK1YDQgFyBqX4GwG7ovHfwE9Igwin9b9K
         KQuVbi97UDajHpkpETNcCZ5ALzmBt4BK0UoPQI+cJK68KbkfC8U7SItR0XLQBZFZ8KP5
         oVM7tQakk9jHgWHxQp8NGDSH6IIM6YEjLEzHyp2ZhOl9kl3gnkjI3i3fbFRUxc6im3C1
         HjTp5tig53iwohafmd6RBWnRof4B/mV6hPwykh+hLEx6q+IwqHyR5AS6IuyNgmZyROVM
         1r+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701293323; x=1701898123;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uGzqJZeCIvHWgx50HcN8P2Sdt/SHVZafM+S/3T4/ITk=;
        b=vyE0Bvf1N2dm8oBcqAH07xOEqOQl9igE02L5/gSenQWhhcQNxH/1FMRhkdaFKXTDm7
         MHcm6cakTQHk91NDW1ccD+ewpNrQjKyb+zKEsRNfs2aTlaLAkWBAGqa5yjlgffU/idOT
         QgbnF3P4eW9rq1PAKJmBIbvaj5oeTVuUqq/krDf3+KZkNaSspcT5Vg0A9xqNy99NDl0n
         Hs/5neAbnaD2rAS98tQmtGbA3uACHMRXaWVnc5VVPOukb3BemlC3OfZH8/NywJqB9RIu
         GYqpBd0YWrdwgWC1zaEQ6HX/b57GeYgnzY8VKgYWg8Mdb/tsW7/TDn6NGoFwucXbTOFx
         dukQ==
X-Gm-Message-State: AOJu0YxNHxDHQ5RyU8fzNGTNBzDPAQDtaQ0uy9oHqcTQvuKMF4YR+XBN
	QNu7u7sVzFBONPIgcI+yzZsyig==
X-Google-Smtp-Source: AGHT+IH2iP1+SnhRh5dk6NH/SIXt5a1DgU9BeCKEI9Kd5MNkN/wjAcRvj26p+QcR+8v7vqnF7DFCiA==
X-Received: by 2002:a05:651c:b27:b0:2c9:a9ba:97ec with SMTP id b39-20020a05651c0b2700b002c9a9ba97ecmr6389122ljr.38.1701293322448;
        Wed, 29 Nov 2023 13:28:42 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id b5-20020a05651c032500b002bcdbfe36b9sm2106196ljp.111.2023.11.29.13.28.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 13:28:41 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 29 Nov 2023 22:28:37 +0100
Subject: [PATCH 01/10] ASoC: cs35l32: Drop legacy include
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231129-descriptors-sound-cirrus-v1-1-31aa74425ff8@linaro.org>
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

