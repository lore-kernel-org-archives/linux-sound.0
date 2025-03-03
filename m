Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 814371EE7BD
	for <linux-sound@vger.kernel.org>; Mon,  3 Mar 2025 08:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740991307; cv=none; b=ZjCxj2pCbupjRLc/Rnn6411eq2NL/64Yc/KsrhXrBZBuTMgWEsMEDE8SwCKCl1HVnV7CSalPSH9lsiKV1VvzesMO2cIxyUUtx8p4Mu5iCmql2J2vn+sGYd0HbP9FvFDccv5VYyyZHoqGP/YkDcKkotSTpGpTxlG4apcm3J0w918=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740991307; c=relaxed/simple;
	bh=XCp5c16ZgVKSAEkvjHMfHjmWOGcrUzoqi2AjLg6iSqQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M2EUiW4qqwdD0pMXK9gAg8EIQJJXobO8FSg9q+q2gHcm0ZBXrhy55l+YRvoFBgh0hh9BSJEW027y1FyHKThSwoxWZ7BZ7gl+VqpdhG9zmw1auYqg1M9GmLSPRt/3+co1YXCVgn6EwUCt+5QewLnxYm4NoPWfECZ0BRwupNTs1+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=peW2A/vw; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="peW2A/vw"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-307325f2436so43013541fa.0
        for <linux-sound@vger.kernel.org>; Mon, 03 Mar 2025 00:41:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740991304; x=1741596104; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+wTp/DewPWwVucRrfprxY7chF4qiLf0sCuwP2ZtpEwA=;
        b=peW2A/vwJXd9HP5MLpvPRmH35JkjyRxcyfv2NfT3MXVOlB+AUAbfyN4Uo7vkrmLAum
         s0i56ANTvxtlz2cH+F0W2bWuNZw17vqHeBHbdJ+G4DRUYi1GU8AuZwWaWisP2M641ioI
         p+wAchH0YlMwxb9eQPAM4h5hZdykdEdNuhCVBN5R0T49m5mIvbkGsxTnuHCngkzo0A94
         PeJRE2v7KizAHYV2TU/VvmV6EdEVRqX95+2qrd8lBMjvYPKVaEndh5lhkW4yzV+ci+Xg
         pepUIvCBU/N9JVL8JU2fo7gBX+gEXAbQMDtLJeWh/6w2PPGEZlWwTwrmLMLyFFj5CNlg
         0p5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740991304; x=1741596104;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+wTp/DewPWwVucRrfprxY7chF4qiLf0sCuwP2ZtpEwA=;
        b=EXO2cPC0NoL/Je/5KnanoJYXAfR/FJ1UY+QGLMny/O21cabKGusTm80gUECRj1LxKc
         4i2UwDgF2ZzHGojz888fVcpDy/K3g//C+56jtGsCvZxTuvwvhzKACwTWGTPkzjCh1RBm
         K7GKURcB0yBEXh3wCLpa8XQJ9L8z1oNuer03S6V/tG4KtqawowK48rEA4uSLohPxHwe3
         nlMVSnGW8HN4XQMDkoWUJRhF0W8KPzws9GLqyMwHbU5J7+bch2TlS2G6VIP3he+yDEh+
         t/WONlJB6rdQON33dSHRqEA4SRVF88sFNkC90uRmDPqGNY8MtUPuQ//rZ9kpt7v2Mg+k
         ea3Q==
X-Gm-Message-State: AOJu0Yw9cEV2yZBeIYi3BTn+4txP6nz9072gEC7V4lYmPMcYC7S+zAP+
	Bi9LMCfYp7erbRwDJK6E3zW34Ceo3PFjRMuFttzu5i3+yA+CNvN9PBW4zOaO4F4=
X-Gm-Gg: ASbGncu370tY5/9/HR/e+FdpFFqEOm6fc8wtsJB/DUpBBfqhi6FfeDNWgX8HeL4+AzV
	hprqLzBpOJZE7kx0BSuoMS0bz6V1gsQjrFW5FFcHzbN8qVyIiNu1L2bdZJnHwHGAZP5tc2UJUl4
	sylxp++UVLwbuGiYA8aJV8Uf9nw219JlWG3toUkvB4AiyoSxNRUAgahzTb47pLFn+NdjqwwcfFy
	gVDoqaTxCkJ9jkRYm4KJQM6LQTFbXcwTNA60JtyRlVnurlrcZGe8nqybn0KejFZnaG90dCsbAL0
	UFgs6g7EOjYQfKiXbD7+IsXVqly8t6GO32caEA+WF/xc0RdtJx+SbhI=
X-Google-Smtp-Source: AGHT+IF2jEkaDyi16l+36h88tRe5CgK092ZTp/XvBwN0aDOK9nZNIn9ADMq46aBdbDPRqRrYzuRY5A==
X-Received: by 2002:a2e:be85:0:b0:30a:448a:463 with SMTP id 38308e7fff4ca-30b93216587mr47291471fa.4.1740991303634;
        Mon, 03 Mar 2025 00:41:43 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30bc49d8b56sm827371fa.80.2025.03.03.00.41.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 00:41:42 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 03 Mar 2025 09:41:41 +0100
Subject: [PATCH 1/6] ASoC: samsung: bells: Drop unused include
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250303-samsung-codecs-v1-1-56a2299dd928@linaro.org>
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
 sound/soc/samsung/bells.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/samsung/bells.c b/sound/soc/samsung/bells.c
index 365b1aca4855c885e0b59a1101475d8edb86374f..b4c0857ae35134b58a125b0746af07a5fff040fa 100644
--- a/sound/soc/samsung/bells.c
+++ b/sound/soc/samsung/bells.c
@@ -7,7 +7,6 @@
 #include <sound/soc.h>
 #include <sound/soc-dapm.h>
 #include <sound/jack.h>
-#include <linux/gpio.h>
 #include <linux/module.h>
 
 #include "../codecs/wm5102.h"

-- 
2.48.1

