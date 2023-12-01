Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zvUB69li"
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A453010D0
	for <linux-sound@vger.kernel.org>; Fri,  1 Dec 2023 05:20:42 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-50bd928b13cso974344e87.2
        for <linux-sound@vger.kernel.org>; Fri, 01 Dec 2023 05:20:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701436841; x=1702041641; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kJ+3Y6BEIrIf7qh9svq9OVzbI1CjxUGno02MCFoO1oo=;
        b=zvUB69liLPXcAbWUti3AncjW/OlmM6nz9VIj0rPYAEptUHZo18wusjPH4VnO9h4T2o
         8k9CRw0S8sNsqxyYNejqBXxnK8mlVvZj0ECW7JW9D3J2qyL7cWElwuMOLU9WqFMu0ggU
         6FqNC0m8r68JgwDE6e3/Bc/H8s4F4OF5HMRA8cF+GXja6N2VQhZxpfFf0ZFhc+eZiz34
         9odauVRWQeeKytR4ixNv/Knw7W7273AZWckshxWib/lKQy9hdcbNpsjCYnlHvHOlzb+v
         InXy0lCqQvGtpzZ1xIlfhU2VTIG2q3poOcukL/SPG7p0UIqq5rA8lObhqlRt2yXod+5w
         Ca/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701436841; x=1702041641;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kJ+3Y6BEIrIf7qh9svq9OVzbI1CjxUGno02MCFoO1oo=;
        b=l2LxRyNBn7/cKnMk4YZPqWpv2O5DZPmqOqnPOY7P2OjsZgeDilAln+mccpg9jfuDs/
         8PVE2q1v1vc3vsQqYDizqQ7hAg+ZSsgKsiacYvjhoRptDHOVc9PMf1JDyqTAt4tkhBCY
         bo+kYX7k0BGILNzfUTWax8DnDS2EjiS8sQFvJQv/HirLjy6aRoRsM0Zp2IOPcdvaZW9n
         V71SeHkQEdS0xsM4JUlk0gqn1NgiPftsSEi+UpHBPh5CE7FBv/XR4bpjDO7c5LAnTtlQ
         x0j13Phs28CLExpoC9YmdoejbieYSpPcnicQTwDXwT+M04r+tZPZC79Awrh/08yJ92ro
         Wkkg==
X-Gm-Message-State: AOJu0YwG+Z37kQl2sl+Ax1Y1948qQKpWhD8Q5TNhfmiUrqzCPUAy8wc4
	Vf6bIrKzF3JHubh2PF6KAi6sTQ==
X-Google-Smtp-Source: AGHT+IFCWkhwbCMo2Kf7qMaVHd44Tp9vXFDKbzrS0UCWqndYYop0TULKRfjWVlBGS5I0GO/2TXb3TQ==
X-Received: by 2002:a19:915e:0:b0:50b:d764:6edb with SMTP id y30-20020a19915e000000b0050bd7646edbmr666344lfj.139.1701436840946;
        Fri, 01 Dec 2023 05:20:40 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id u25-20020ac243d9000000b0050be054b4e8sm1081lfl.121.2023.12.01.05.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 05:20:40 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 01 Dec 2023 14:20:37 +0100
Subject: [PATCH v2 08/10] ASoC: cs42l42: Drop legacy include
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231201-descriptors-sound-cirrus-v2-8-ee9f9d4655eb@linaro.org>
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

