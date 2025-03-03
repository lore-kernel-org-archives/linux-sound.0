Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A881EE7BD
	for <linux-sound@vger.kernel.org>; Mon,  3 Mar 2025 08:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740991309; cv=none; b=JUK8dZYAeLPXMgKYPIPL13UTk+9YMN+m3nFAUkf+kPLTxlMU0mYdx5MpKjg5t2vFeKdqyHCH84oaPSJqubMeuSUaXn6WyKJUbJ+KBA3AvmK2xtFoMMs2tzOnn0tdyeTa2K6SlXdPMBoTl2V6aJTcxUmT9qo0wkA/XtPqE9kCrCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740991309; c=relaxed/simple;
	bh=4vhEEoeMcqqpbYOyn6fRj5QySsM+/GSxGmFJbcdx1QU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YuREcXaANjhunVq3rMKQ80gnIYbGV3y2Yl/vG7/YlDCr/OMlIPvy0zAK0EEobr2TG7Y7TZ/7DR2/Q7ySdx3G8w7tLEXkqRQGxLTJEHZokY6hY8dH7LyIY9DcZ12FkhFyqd2nI7xqj+e6i4v8SpjI/Ynq6+b/pgOu/RWtDeIweCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZnmdzQQh; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZnmdzQQh"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-30b9b1979b9so29086161fa.1
        for <linux-sound@vger.kernel.org>; Mon, 03 Mar 2025 00:41:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740991306; x=1741596106; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lyJvoamu1vQ7QlWJuNua8499N8G4uM9VfUW5xFlMx0A=;
        b=ZnmdzQQhoOhwmH/k8vfx1e+CChGOcKlaFrL0/nR3wY4yuuaVc8OPBZczjVfr/0g1Fh
         PSeJhMzMeB7ghtyEGndCb+bNF3oJXlO06pxdHNm5ECrATq9c3XbYzExIvajhsCByPkTY
         b4pdJBzfZyBgAhR+UqslqF1I9rmWBV9t3OphJFu7cKBny/RC0jtomtobTuAvfc3vgOiR
         osCHSw0F2cELp56+yAXHu0wJCklpx4W9Z/It1eOZagLS+M6E7BkHKFaQnC99U5q/6G8i
         u4XkModtQDxnxpYotyl6/Y50RCzzWGEhD4+gDNvprbUrJaK+XDt+Gfg740PixGWHaCf/
         Kh8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740991306; x=1741596106;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lyJvoamu1vQ7QlWJuNua8499N8G4uM9VfUW5xFlMx0A=;
        b=Qr3x2CbhffkR7af7Ful4em9nxZKOGN22Zyf1cuGkuHOSpMzJGvP14dFhKoEVWp5uan
         eBtkZEczbdqOMaSMCZDlfLHMZvh9IU7pZIB4XjxZQNfO0KhvQP++XH7HKLNVUt7m05a8
         KzSeRYpZpwUVzya+yBhL1fHvVimJGJ6WkPRjjTRlovaOax4SN5uIUvQxHNQa4FjNhfvb
         J0wU066z5Bzlx235obrjMs5F5iaKbhuXnzTzw2TQxmKSPFIRuZeLBd/8fRlYqHnyIVho
         nw7Xd/b1uzDmO6PhDNQ35MkTEQTq/BHH0WsP/mfUHLLe4kNIBW8VNQQAaqQ0x4XERZn8
         gg5A==
X-Gm-Message-State: AOJu0YzUuxpsl5aqwjMrQvpPwuRmcHm/C4stLmW/hdfgyg3GDAOirMb9
	/I9dtxdyRZLpKNQAoywQsTxsKD5cDjbYSWfDlPQbvgqiI9n/TOq44lpogc5rSho=
X-Gm-Gg: ASbGncvjK3HN0+ctxdLBCOF5ZUtTU06p6doJMh4iiXdye1I4zTyM3i3dnJ0XqqUnzML
	u64/oLnhgenXOmHi+2qqtZQIaTVrwZx9tcv0becGZyWsdyn+STGVz4gaKW+Ht73nj87yeufxhcf
	s91ntdzFYqpevP0hkI9o75tjupZqiSKwBMQNHZatH2SVTtdV1PNMfz6mZ0MWTo03EjXcfwnwouo
	Txo3ZbxLOfz/63Y9zjZ9jKusF0KJFwfmJxpdApqOTIX2psDBJDJnB2k5CfoR8fLLBolP9NlfFxk
	CvRPpsdODYUZBdxi8dkxBGQjWH+Kn6l55ffhr/bouWfKhAqRmRJGdS0=
X-Google-Smtp-Source: AGHT+IE7d1s8wsnrWzBD67JSiku6358hpjkfkoPXJoyaB/3LYLJ1ZI/ks6pTUv6jycEvlm+SBkMXxA==
X-Received: by 2002:a05:651c:b29:b0:30b:bf4e:f6fa with SMTP id 38308e7fff4ca-30bbf4ef932mr8626391fa.17.1740991306166;
        Mon, 03 Mar 2025 00:41:46 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30bc49d8b56sm827371fa.80.2025.03.03.00.41.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 00:41:45 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 03 Mar 2025 09:41:43 +0100
Subject: [PATCH 3/6] ASoC: samsung: lowland: Drop unused include
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250303-samsung-codecs-v1-3-56a2299dd928@linaro.org>
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
 sound/soc/samsung/lowland.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/samsung/lowland.c b/sound/soc/samsung/lowland.c
index 702cb4cc1ce9f07e55ddf9435b19c4691e0236e5..d4088b72d43c2295102d850197f8b9eac50d7120 100644
--- a/sound/soc/samsung/lowland.c
+++ b/sound/soc/samsung/lowland.c
@@ -7,7 +7,6 @@
 #include <sound/soc.h>
 #include <sound/soc-dapm.h>
 #include <sound/jack.h>
-#include <linux/gpio.h>
 #include <linux/module.h>
 
 #include "../codecs/wm5100.h"

-- 
2.48.1

