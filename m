Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B62152F95
	for <linux-sound@vger.kernel.org>; Mon, 29 Apr 2024 11:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714391352; cv=none; b=a18wvDEBZjFLhqjbqGar7YF2HUihH847E31n5HL6F8fO4cIZtUGuPjKknO86RelnW2m7gU5mKIHtXYMmkMpXhgchGv3KqG47GtDxH+K4XX5e2CJ3LMtv7Ek8N6kDEOfrX6mmF+yG5Do0xalJBV/MqQAdTbqY0hnznoCwmFM9u64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714391352; c=relaxed/simple;
	bh=gich1JRWEld7frP5eaWjzjWGBaaM+RGhkK+WPH3Hgf4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nMWE2NnL8dlsazr9Pfpf06lJbfqU4lASP8lMLeEH7AX0iJHCXa8mzikGuXD2DG6HT1CMUe8rPmOsurrJXyycC+Io6zZ+vKpCsH18fuEAaKC6iJbMxx8dMLK9zBwdr6Ql6dehsp+XQS4epMThj1t2Jix5TS2l2Na1Zwq5wusXjnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CVBJaFtB; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CVBJaFtB"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-57255e89facso3421867a12.2
        for <linux-sound@vger.kernel.org>; Mon, 29 Apr 2024 04:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714391350; x=1714996150; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W2ZUcqC+torIBGZl2jfKZ8j0WRKINo9TI5z6SJwgmg4=;
        b=CVBJaFtBROdKFgdm+fNtW8Drf/i7rmhkhafgV367OkoI7S/5y7X7+MYE1BNp/ReM0M
         EqmQLuHd/OT5yBWwdlUQn6BJM3R+mVB3XSfIzxcsRt3UX5e3Ks/YFqPryu2Wvqn/XzSV
         TooD49IdWiu3Jrm+IJ0KPSrNsPiS+bIGr+w/db6oz9nqIIsdnNAFVH4S+sW71537CMXK
         luoJwPCqrWFZlXecDwdJLJFHwTZfBzIh0kNa98nv2Y6xBiBvrROT5lqGl9v8xZ8QYXAi
         hQqWzFbsM4d0qO+T4emzLUiCVWIz0pbPj0YCjCn9oeGidcL7XKKFID42jRar/k7fYUox
         VqOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714391350; x=1714996150;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W2ZUcqC+torIBGZl2jfKZ8j0WRKINo9TI5z6SJwgmg4=;
        b=pPW6vIzePaYj+96+5H0vdH7r8pID2YGiy1VG0MLEl9vmLn2TVTihI8nl0RaigjM1nd
         RsldDcRjNDsuDvz0g5lbx9LxE38O35yc+rtOTEnRy+KwiEfBjQw3922SJiwdnqpsm/kJ
         jz7wFBu58COQYBLsutvWV9EZpM/XfYZ9fPmmja8J/Q5+fFE/Xf3RsPCspmnr+H7ewuVX
         gj5B10sO8r8DVCX1hswepMP1qgv+slU5nRT/2zDSU9wz3sEV+Ua0f6A9aYkA1O56puK3
         SPEzW8vVKeeNavYl0iK+LC1b1Tyv7bhW8z6cpwOsE4/COnvjtSvbwccMicDn+l/VeUMm
         uElg==
X-Forwarded-Encrypted: i=1; AJvYcCUF1qgpYgDDH2Lmm/9N31RKhHbaftd440RyKqK5xXpiQx2XyEzYp8JBKfQGhSZr/BvxczMwdczC+9YwYhrYc8r7sccfHWtRrjRQhOs=
X-Gm-Message-State: AOJu0YwOOG7u02XtCGTz9VhbaL86/Wb5vA+UkM0f3Tz6eOvc/T3VPlEh
	PCfVdv20guOZK3BtlMv4yHBBAGXgiksF+mU91G/Dy1mJxH6ZYkN/fDAJb2III6Y=
X-Google-Smtp-Source: AGHT+IG+PpPYt5gJrRGC1b559rFwqcY02Y7afPcoTHrR3gteiPesqjrrRq6V/qr9zfo7soqjuK3G8Q==
X-Received: by 2002:a50:8ac7:0:b0:56e:2452:f867 with SMTP id k7-20020a508ac7000000b0056e2452f867mr4484403edk.37.1714391349889;
        Mon, 29 Apr 2024 04:49:09 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id y43-20020a50bb2e000000b0057000a2cb5bsm13549651ede.18.2024.04.29.04.49.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 04:49:09 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 29 Apr 2024 13:48:49 +0200
Subject: [PATCH 4/4] ASoC: uniphier: Constify static snd_pcm_hardware
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240429-n-asoc-const-snd-pcm-hardware-v1-4-c6ce60989834@linaro.org>
References: <20240429-n-asoc-const-snd-pcm-hardware-v1-0-c6ce60989834@linaro.org>
In-Reply-To: <20240429-n-asoc-const-snd-pcm-hardware-v1-0-c6ce60989834@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, 
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>, 
 Nicolin Chen <nicoleotsuka@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=778;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=gich1JRWEld7frP5eaWjzjWGBaaM+RGhkK+WPH3Hgf4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmL4km9txiF1WGA7UWw3CfsFA6VB2MZtNJU+MOU
 FKjqCQu/4qJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZi+JJgAKCRDBN2bmhouD
 16ccD/9l4cVT56DbQ4s528ydZBWtzc/oqXGu1ZQbNITz14ONADT4bPlxkanL2O0tMltrVTrFj8N
 yCn7wufeyWdt6hobAeT2jnVzkG4kPP2xuFUJiw0pKpgPViDQYQQvypq31/wxF5wzMSJkrW/UClZ
 bBWRtRqsGDuBrUvJ+KQT4y0YzBjxTyieyo0MR2V6ctFh3XKFCW31u2lJSH7xSxiRcyZCeFVyLlC
 I3C0yBX1ofQrBohBO/sGp1xIkY542Vyyb0oYn2HCEiuCgP+2aJz9Uzd5nzG2D8ifsfCZDe1W2fJ
 BBo+ylftctAuKNbBXptE6DiZ/sueGCmNlIOLx1y4jtFbODWgFIG3M8WIB4tB3LimjuI00JTUfdJ
 EXptaN0tyS1nlKORVjO5N2bDN4aaRB+nVEKlcVvOlSMWicMUHepZnzKDP34A+zXPSaKHDyLHiE6
 IaPAkr6rUUVwEK/bI6iC/VKCp4A9TaeQKOmbab41FPXLFr7kS8Vy1KNyrpgxyPSRSQsSD4KjYPp
 4RUTHpCPh8X6nbbbHv2nUUnpwFIGATLbI2x8gsubcs13KPkg57nn3JNnaNhEcr88Vl/3vU652O5
 7AbhSRpcdk7w/Zb9QhAm45Osql//C85WJu45trFQ7Ntpn15eubGiD1sld2555lrF+y4UGAHWksS
 xblzapxOFjAtX0g==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Static 'struct snd_pcm_hardware' is not modified by the driver and its
copy is passed to the core, so it can be made const for increased code
safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/uniphier/aio-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/uniphier/aio-dma.c b/sound/soc/uniphier/aio-dma.c
index fe272befd967..265d61723e99 100644
--- a/sound/soc/uniphier/aio-dma.c
+++ b/sound/soc/uniphier/aio-dma.c
@@ -14,7 +14,7 @@
 
 #include "aio.h"
 
-static struct snd_pcm_hardware uniphier_aiodma_hw = {
+static const struct snd_pcm_hardware uniphier_aiodma_hw = {
 	.info = SNDRV_PCM_INFO_MMAP |
 		SNDRV_PCM_INFO_MMAP_VALID |
 		SNDRV_PCM_INFO_INTERLEAVED,

-- 
2.43.0

