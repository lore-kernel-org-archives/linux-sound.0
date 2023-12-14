Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="foP7ko3I"
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0404121
	for <linux-sound@vger.kernel.org>; Thu, 14 Dec 2023 05:15:45 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2ca02def690so103151841fa.3
        for <linux-sound@vger.kernel.org>; Thu, 14 Dec 2023 05:15:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702559744; x=1703164544; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XFPvhE2TfppE4P1yrXLwpu8QNBSRgd4h1Csi59de14s=;
        b=foP7ko3IO8DAwAEYc7zmB+sgmK2URm0gvDRkYZWcMLD9Yewh0axNzZfuh4vfILZh5D
         TrTBeeQhFZsDqIvLFqjN0J0LrbJprsemLgoMg1PMWpo9cBPxfWHAe1qMn0IY1kV7xl3I
         TlqZtyKgJ/DxkqwvzNpoQXofQ0LdtxS1NoYYzoO68iu0SqFvF/Cm7d/hpRCMd8Leutkm
         mhCgsoPTb+lmSB4NDA7HoIgIbiB2Uv8qdJPXBa7ouf1i+oRL5VrD/Ap6F4CLaMT5jiyL
         DI36RHi+M9w1qUFKWllQ53nkN7FHvdLesrYaKnJ4zFktZmgl8BBN1EVcdwcFHSpPi9Hx
         H0JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702559744; x=1703164544;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XFPvhE2TfppE4P1yrXLwpu8QNBSRgd4h1Csi59de14s=;
        b=Ed2AvjdlWr80UHesE0/d0LGJFUeVNnfr6TqqFwh4vJEgQUcDvfGbn9QU58aob/q+N/
         3V4WcOcUTxxwLHMhfalKPMAXzGncbtuS0nSNghxsCO0XE6+UrrR/ADoeLKmhS9eiiLbb
         b1I1IIEBJzRlTAHmpak6/nxrxL8NdSzQrdOm0zZXOee/tsigsTT3ceWcs0ar37S3GLkM
         xvqyrZS5M5FWfgiNlkjnQwQ8RFQVHLd+qt7KEqXZEtM73XHpCidIQVVZEJe9bVIlbI9S
         kXRfyWHNJftZZzxKiKcvkmmK0zAUNKwGyF4y21C5IvWjIeg6e2Gajl3SucCHExYeB4O0
         xSgQ==
X-Gm-Message-State: AOJu0Yz7bHy6gw51EQv7OQi/zQIfLbEBqfTSnwiTZfiaXFnpcHNvAEzm
	mr5kpVJ7oJn/M2r2SZgdII6fbQ==
X-Google-Smtp-Source: AGHT+IFZ57yYzKJ7lhsSP4PBKVG28nM00flMj6xzVKrNm2pHPIBAti0LYIyzlqr3hZAxbG5Uc+OLtQ==
X-Received: by 2002:a05:651c:88b:b0:2cc:1c75:3494 with SMTP id d11-20020a05651c088b00b002cc1c753494mr5912328ljq.55.1702559744240;
        Thu, 14 Dec 2023 05:15:44 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id p23-20020a2e93d7000000b002ca02ceae84sm2080478ljh.83.2023.12.14.05.15.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 05:15:43 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 14 Dec 2023 14:15:42 +0100
Subject: [PATCH 1/4] ASoC: hisilicon: Drop GPIO include
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231214-gpio-descriptors-sound-misc-v1-1-e3004176bd8b@linaro.org>
References: <20231214-gpio-descriptors-sound-misc-v1-0-e3004176bd8b@linaro.org>
In-Reply-To: <20231214-gpio-descriptors-sound-misc-v1-0-e3004176bd8b@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, 
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.4

This driver is including the legacy GPIO header <linux/gpio.h>
but not using any symbols from it. Drop the include.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 sound/soc/hisilicon/hi6210-i2s.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/hisilicon/hi6210-i2s.c b/sound/soc/hisilicon/hi6210-i2s.c
index dd7d2a077248..250ae3781d14 100644
--- a/sound/soc/hisilicon/hi6210-i2s.c
+++ b/sound/soc/hisilicon/hi6210-i2s.c
@@ -15,7 +15,6 @@
 #include <linux/clk.h>
 #include <linux/jiffies.h>
 #include <linux/io.h>
-#include <linux/gpio.h>
 #include <sound/core.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>

-- 
2.34.1

