Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 674231EF097
	for <linux-sound@vger.kernel.org>; Mon,  3 Mar 2025 08:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740991314; cv=none; b=sIAmYnHgpFXtZRX3D38geKbQPvCssPgeWNbm22Bja4r8sGd+YIQMHn3l7verrtwEtt6T6lNo+k/zNXpTjHLhZO6y9iA2vKExJ+neSJT8TctcIhaJKFMMEkrt7LVVDo7+QNT+cpiC8jhM5+R4WKKfiZGhlqMV96i9FadnnJem3JE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740991314; c=relaxed/simple;
	bh=5i+jXXjbAPwyvykuwjYpX3ZtCAWwTAbDIZdDjIPeE3I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b+LKatJln8qO6fNwgvQhorx6Nrsg+JBhFCyn/1gdBRU5UY2DM0/ZHYiyVm9+iLpBnnjU6U5ecsOWQN0jTfCTbit6Wt7ulVxr00p8Zioa98VvQoCcfLrZF7Wq7fLpe+ydGExRCBNGrilr1PhDdk0Sq9Yq5zg1mWgOVfkfPgirykM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iXBtwCvq; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iXBtwCvq"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-30bb64a4060so7255621fa.2
        for <linux-sound@vger.kernel.org>; Mon, 03 Mar 2025 00:41:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740991310; x=1741596110; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pwl7+pllkWzrn1RgXG9uolVfkLN1JlFHNAzydC3b9xY=;
        b=iXBtwCvqG/zmJ5EWaNp7SHFfJn411NpOEjfOZRd8qA+0tUkNESo4K/HdDCQM0MsUDY
         3w1pk5761w+Q8NWFQq8V7ygu5EI0HvhPcCV+66lc4z+lOS9h635B41NfeoEifQlfNoME
         5E7Mu0WN3ILvYVDOsCLHdzh6xRlEQQNXJHgNf6Haw3TiieUeCxW9KaBUiWbwqHPmgL8A
         PshaRYHytDzh/dxOEJntMdH4aP1pwWvHh2YDFnoneEMJHpiCCgj7EOJKNL++POKQalpt
         EuSAACjZRvINUv7TzwywcjIsVGxKAQihF/F3gyIoVrumYf8LSe1Lc/1D4VW+OVuZO7IZ
         G3tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740991310; x=1741596110;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pwl7+pllkWzrn1RgXG9uolVfkLN1JlFHNAzydC3b9xY=;
        b=skvieWACFtdP80J8S3+ccuWH029aY/O42Rf2QQUjGs7jajCzjvmVRJvAQ5CEqUd//T
         Hg0nUgkd2VPjMdjvWGPJEjHqy+8V42aP6OLjS9RUzDDsIyvocrpLSpyX1viOzzcfkWRR
         vVbXEF08ik8zTtKLEuuM00ekZuGVTz45Q8RSD1XSkOzcQdBIO2HBKB0omsqUjZzmPud9
         omu8B+qFZCVWZB4gZaDbUJgLD5EjCsMJEtfHUt8yZewdZYnnZVOCSS8mhnVB9ZNF1ABh
         1pixDPhN81si3ZLS6s6WkpcosnHchrDvaf4sLeWzvBYsfySW9ukADCRKzXUV8JxGKTQm
         H63Q==
X-Gm-Message-State: AOJu0Ywh/I3afqqDxinncwoWn6rdmhsxyZjvmQZrM52++cQhC6I7c3ok
	u0bUuHVYCSkY1oavqgJcaL9QHRcyHzzMQVOJsSTsL/AD+sfKLbEOAlrHhLyzzos=
X-Gm-Gg: ASbGncvaOrLRvijo45MCzYx4SN5kAwxnXKGkUO5chZqyOV9IMmYM+Oj96LGX4By21tZ
	XM/seM3uqNZD3s9vQ2fzvoDoYmcblMzUgzlJXBmIT4HY29GBVuZbp0e6rnN8wLkiRZGRXYk0Y/r
	vpiMhxbdS0uLzUUvRyD/1b76f9+ixmoNO41+LdEsNiTLOrLJJPs+BXyXEhgiE02WVVMXCFSkCiJ
	1Rk0FUgHqW731QDJjAyEv2kFsMdRcmp/jy7E+AFDRTL7BA8xx1F7FD2K0Y8DWJmWapDuzYvUjnD
	/fOPyNYg2SHYcbcWYHZkWZgMnLt4ndukZ84PwFWPlACZT79+uZy0mNI=
X-Google-Smtp-Source: AGHT+IGGU3RCEseQiiJjdkvq8zg4yqcm1ewTmddMWoo37YSveo5ACFl0sVfwHB6fh77iqxJDQ5B/QA==
X-Received: by 2002:a05:651c:1541:b0:308:f6cf:3619 with SMTP id 38308e7fff4ca-30b931fb851mr39880601fa.6.1740991310492;
        Mon, 03 Mar 2025 00:41:50 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30bc49d8b56sm827371fa.80.2025.03.03.00.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 00:41:49 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 03 Mar 2025 09:41:46 +0100
Subject: [PATCH 6/6] ASoC: samsung: tm2_wm5110: Drop unused include
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250303-samsung-codecs-v1-6-56a2299dd928@linaro.org>
References: <20250303-samsung-codecs-v1-0-56a2299dd928@linaro.org>
In-Reply-To: <20250303-samsung-codecs-v1-0-56a2299dd928@linaro.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.2

This file does not use the symbols from the legacy
<linux/gpio.h> header, so let's drop it.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 sound/soc/samsung/tm2_wm5110.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/samsung/tm2_wm5110.c b/sound/soc/samsung/tm2_wm5110.c
index 2417b91a328f083f991af8505c5586d3b27d9bbd..cc76963105d9fa37fe0bc45acf9a28720fdde158 100644
--- a/sound/soc/samsung/tm2_wm5110.c
+++ b/sound/soc/samsung/tm2_wm5110.c
@@ -6,7 +6,6 @@
 //          Sylwester Nawrocki <s.nawrocki@samsung.com>
 
 #include <linux/clk.h>
-#include <linux/gpio.h>
 #include <linux/gpio/consumer.h>
 #include <linux/module.h>
 #include <linux/of.h>

-- 
2.48.1

