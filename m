Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9373C1EEA5D
	for <linux-sound@vger.kernel.org>; Wed,  5 Mar 2025 07:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741160361; cv=none; b=EJEBYv5fh3MdGVo1d/83B3JJJtpZjzMTFnEiy3H+R9DzPb5mvH5Jaj6XLfx28x7NFjWMMUN0Xmq6/SFJ9FkkOCVpqWUcKS73ZFuZ1WTO3JclkxQMaGy1yPnn0poEoNPGL0AmKjY89VG8aS9qnvVAuYUk7cgFI7m0j9lFZpnnB8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741160361; c=relaxed/simple;
	bh=aKUzsJKnxa0ztywZH0CofONFPLW5j11mzL0+jRK6M0I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fEeT+qxK1fBrqCaBMQJfwHzZs+HeCElACetpYgJGi9Z7CSuMCiGRe+oR1lFZje1PXFucvEhR/1oDYqMhybczeNPGgd/7KaHOaGwR0ZYgXIcuvYN70HKk2MnGOURQPK8v7g3HfMv74EED2anKt3tnQzpIBKitmrhVjKzBnZXVEnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aAJGQ0TY; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aAJGQ0TY"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-30b9f7c4165so38718641fa.3
        for <linux-sound@vger.kernel.org>; Tue, 04 Mar 2025 23:39:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741160358; x=1741765158; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n6j98wzmws3yBjPpQCP6g3erFXEQ03ngjmGwTh500vM=;
        b=aAJGQ0TYghQ1+jkJMN3Sr8o58MpkPI3kJ0ibmO76TE0zdQGDIHp/uoqyT4BEs0QWiH
         ssvufMkfT5/7nphLwsx0i4KZaUTg9K+FtJFxj+u2GvSAIZm28LW5r2QoFRl0pWIAX6i1
         tcjul7GExQ0eSF/IwrcttOayxVeeHLnHBFKBljWCuJ4Prm/eH5AItgZJmFsYfQb0FM7w
         C+2+c90trD1di6KIj1xfg6AuqXoGOyfInGKNbxKaufqJUoJkWvFaXYOVjAoHgc6GXieW
         U0QtyiIOu0+VbsEidWOmsSPI29Hx6+5yda5M6TIqAtQ9O2aT25/l7G21mdUCyC/qS+eW
         M6iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741160358; x=1741765158;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n6j98wzmws3yBjPpQCP6g3erFXEQ03ngjmGwTh500vM=;
        b=gipnJjW9fVMvvwpKQAr2mUzwSpD4L3qGEv6rohpbuOQasNIuw5ZAvcsIXohW/RICl7
         GBPjwYsQjNDY9A1a+qEgJvf3x7TbwbliZyzZGvDkzK9fFUDOZjeoI31/0tOKLJG0dKZY
         uJamYxX4nw5CEMs7OdpthHX9U7T6QYDwFtadz22CkeYdLpVD3rAQRB2MyCc9BW0JiMhj
         wEP77aW2CEgBZblF3tvBT/wbD4DF1PKFlerd3Po66+W/a2EKJ4lNZ8znPwZ2V6tfg87e
         UNi8UR/QOxzsVONiiEfYrpRjJcYYMBqjDRA7wa0NjZa/68+lV143V1Jd8Mdv3xDmwEFS
         PAjw==
X-Gm-Message-State: AOJu0Yz1nXKDjJRpwk1W3bWDM45BwBsn9fJZS3yrBxVutKjGy1ulKuTy
	edbSPF3ofs2JuVqIo/Uf7LqPrKl0fM09QdHH0Bfsn0FqkNxbwQaFfk9PMr7n2UQ=
X-Gm-Gg: ASbGncs0+FV1KUlps8000xay1WzQF61azM+QxaARtyj+Cmx1zqQVHh+37ZUdWsK0//B
	8lxEAcvAZR5+IcFtICs6NAhgUwZKJsHJfEIcESlrr5j5aL8tS0AZJgVXLB2scRqbwwbnRBMm+/S
	M3WcQ+UzIwEJAvkAP3sDjM+aLGShh67uTix8ymkF0YCradGTO8cUrCRhFHYxCK2a+tRx1KWEzya
	i898R5NjZ8mXgpPDMiYiyf2qGnkwBEXoir47s+xWIdyUl0Bd9LP/ziG2D5+QFibY5Yyd4leYBzd
	kp1aK4ok/zuy8NYNnLFCbM32ybqJv6kIqAbYg06cijjsQJRN6gGMFnk=
X-Google-Smtp-Source: AGHT+IGMwrfa7udQAfBfFF3CQtvSnUTEAriZdTrADFcKxLMUZRIgfPtcVBaneZI9rdL95/Sp1Nv4Rw==
X-Received: by 2002:a2e:95d0:0:b0:30b:b28d:f0a7 with SMTP id 38308e7fff4ca-30bd7a5732dmr8079901fa.18.1741160357450;
        Tue, 04 Mar 2025 23:39:17 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30bbae78e73sm8902351fa.75.2025.03.04.23.39.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 23:39:16 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 05 Mar 2025 08:39:14 +0100
Subject: [PATCH v2 2/6] ASoC: samsung: littlemill: Drop unused include
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250305-samsung-codecs-v2-2-20bc980c6445@linaro.org>
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
 sound/soc/samsung/littlemill.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/samsung/littlemill.c b/sound/soc/samsung/littlemill.c
index c5260e101c2a136001c6273200fa35740e618829..9fa5e3ff9215164491839d6ffdf499a3eeadfbaa 100644
--- a/sound/soc/samsung/littlemill.c
+++ b/sound/soc/samsung/littlemill.c
@@ -7,7 +7,6 @@
 #include <sound/soc.h>
 #include <sound/soc-dapm.h>
 #include <sound/jack.h>
-#include <linux/gpio.h>
 #include <linux/module.h>
 
 #include "../codecs/wm8994.h"

-- 
2.48.1

