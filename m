Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BEE01EEA33
	for <linux-sound@vger.kernel.org>; Wed,  5 Mar 2025 07:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741160361; cv=none; b=I7nvem5nMao/A2z60XQFTVkhcrjk+Y8mOFD+2bTUXXSbLk2MgqtOdjjTUKVQeubZXnUJpTf5ex+2jfyIEdhl/1y3J8PSZaJTs2B+NKPXHINQ7kz6uuGMNIgcJQG7ZREnyxtvlJMbAsEKmypf8VokeRlIp7/4JizH9qbAoPjnRnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741160361; c=relaxed/simple;
	bh=DT9lmpA7KZjLSFTViglUBV0sYd/LKVM61HJ8c5dl6nc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TGud6I545vLYys2L9P8lHo9cb5brua4Nf7j4yLsTJrG0DaCFhdzxM16YRrUGfGrzbeS9rdRyQ5m/RAA56A1CYoy22EXvnTgAug+jCa047DTyUtGNpEc07446Ezfd5aBIBgPnfuoaH5jy9m04B4ssiI4UoUF1gqgIFyUMR6HsBqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=C7vL+USH; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C7vL+USH"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-30613802a59so72996961fa.0
        for <linux-sound@vger.kernel.org>; Tue, 04 Mar 2025 23:39:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741160356; x=1741765156; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9O2qXfR8B101GmR82kjgNZDoLonCMfebNSZtNGz6z3s=;
        b=C7vL+USHKmd384VFO0abH8XsHw3t7qjNP64CX9rvlhoWJEIuYBw6Hj2mF1M6XjF9ys
         iGC1ilyy3LWkOPJh/gyGXEeWfpHo4deBhiLCulQu/tpBhxVfYfkyn+SPkykMdItCC4xq
         1SB1F3lEqClBZv8Lt7iBCLSwBqXKzk4tjiecr/uAQz+Th3Ysfs2E3GFJkp0qRG8udb75
         R1cCOjZGG43fPeI9rxWhghJ1n+cDAoCyhd6Jf/KBQrWLcLwGWzw54NbMDNIxBrCkp/Tc
         S6yPCzjxrR6hRRXCrkaJxP7ssRI6Kr/nNo/f/XeJ73WosHvCm7ypJNxGwuKtr6Mfl7Qq
         09Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741160356; x=1741765156;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9O2qXfR8B101GmR82kjgNZDoLonCMfebNSZtNGz6z3s=;
        b=d5mWFfAXWlGzo/BY7fDr92xqbbhprGWZ2E4f2CRXEzb+p0ifLuXrFFjWX7NjG25Mgv
         CcbD7au+lHX7KfOR/H77rH8gAdNO5cQWbH2meEwSAVv8f/XLYDrJ3q28FnKXEpqF441e
         xcNLVg1x22j9zAY0K6Dy021flxjuw2r3B5Wt31qNdjDF7/xOs5aECiXRyFcWYsoxOAU1
         IIl0Q2vXDYyIoHTU5V2eZ0L/zihdaNSsKQEPYcih7fY0q8rf7JEp68GJVcW56aRHw40B
         4Jue4+xQJPs+zR1EMN1qLN35FVqOg9oc7WBrdiXRFX0OvIsS0c5Ga3TkRn4lBnw+aLtq
         MeVQ==
X-Gm-Message-State: AOJu0YwYSvWlt+HxoAuqrZDW43Bpjh8a0nn70d18lDs1VAyD89W1anZm
	GJSy8z6/ACiTtt1FQ0M/re/X3sCDN8PFHM0CgoiC7/Ld0f9qLzo7OR//FoeuoJQ=
X-Gm-Gg: ASbGncsLCRuTyG+v2F925ukYq8B4e5JHkBz2lYRxgkXz3JFyrlRIVYMnZgGg8ONVxyL
	Wogvfliq7lb/0QCM+tdXZgjd7TcAyzbMdS0ZbQEoQfzubbQjWfI08llcmIReau7SY5LnjhIla/e
	xSO0rHl/ur/qWi1AUwA4DAPvmBHDvrwK8WUiYHURgqOSE41gqS3GHtKKfwemROlky/OZkUuwzyX
	wVXjgZ4ik/LlWJ4nw4BNVkhnNLT5+2xvpILhAuHY2W6EQjXDjvNfQnEs5y0D3BL2Ow3rgrTBuO2
	JlXwUsR8opvWmoM/x6j2WCzh2l++MryiGvAfyaQPWek+OxNvQ+3pKuk=
X-Google-Smtp-Source: AGHT+IHPSQp1sMr7Rrf/l9lcn+EQseF/Qe+jZ3cFqBGhxMioF6AUDMWmKnx6hoowTamZYf5w+OgQoA==
X-Received: by 2002:a05:651c:508:b0:30a:4428:dead with SMTP id 38308e7fff4ca-30bd7af5f94mr8944781fa.27.1741160356428;
        Tue, 04 Mar 2025 23:39:16 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30bbae78e73sm8902351fa.75.2025.03.04.23.39.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 23:39:15 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 05 Mar 2025 08:39:13 +0100
Subject: [PATCH v2 1/6] ASoC: samsung: bells: Drop unused include
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250305-samsung-codecs-v2-1-20bc980c6445@linaro.org>
References: <20250305-samsung-codecs-v2-0-20bc980c6445@linaro.org>
In-Reply-To: <20250305-samsung-codecs-v2-0-20bc980c6445@linaro.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2

This file does not use the symbols from the legacy
<linux/gpio.h> header, so let's drop it.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
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

