Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 309211F417B
	for <linux-sound@vger.kernel.org>; Wed,  5 Mar 2025 07:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741160364; cv=none; b=Ds5vWC2PGNx2U3B0J195BW5ni0mtH/D6M6HLP5zzfDM+zu7QkCO8qP+NdN2Gpnv4jHC2wS/6Hk7pfD9F4NqxDw/35NhfDiYNqrsh1Zep2gwLNu0M9Y9ubYnxPd1DWJuFEkluk1hzb83NqUBBFZu7uLC00H2wFxaqkQnTYBtprDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741160364; c=relaxed/simple;
	bh=FPsods1okZg+2n7K+5gdrPCN8BRbmue2zxfh3ZvNi1M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WUIpL5NTbDuHh6e0SXgKDlcC55fEkMOoOA3xQEHgatD+XNTCaP8mwsImTizhjoXpLr2xhDxj5ADwpxh3Z5Gshe/j7IH8AWN1DcgyJP4TzvB8ptKFFL7p0YGC1yXnzjQtQ/R6YS/9kjdXX/V4DWsmwvTGvII5lmoqiOtqLJ/6H5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VgxWM+sD; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VgxWM+sD"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-30613802a04so65931561fa.2
        for <linux-sound@vger.kernel.org>; Tue, 04 Mar 2025 23:39:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741160361; x=1741765161; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Xq6WCZuy53SY6E5JRkLaEWKcw/1LYZzsuxTVSWOWMU=;
        b=VgxWM+sDsDwsJnNDnGExVEdpXMDcd6389U1FynNVaamph3p1LmBr8igzB3mvFYwzkq
         dfg9UMZdMfHIg+run73ptoNtMeOXaCTrEh+bGM7Xo65Tm692Q4s+NrTyiDoCJ6qNSenh
         dqRud9nPW445OwCJLRQr3Rn9lTa22qpdYxeSvDI4CmfqlTmjaOhcj8DDUr1HUWXhzrB3
         c9O1W+T9zipFMUOY9UjvtRY/70HgsFm4YfcBkGojbwHZA6N8G1YBwMBNRU5dkCZ2KLex
         pPzRHSsG6vLp+c+N0mrlFm5Z5dMpfZxi7YNVkEFo8jKtHVvKAVMVrWvwDX7waxVg+Bo2
         8D8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741160361; x=1741765161;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Xq6WCZuy53SY6E5JRkLaEWKcw/1LYZzsuxTVSWOWMU=;
        b=JiDGgvWVfrAHE2awXtO7DEcoE430iIiEcnbeNAnBOqt7N3sBcCBfNYg2gSrTxKZFz2
         t5d/NSkKHWoB9pZS1+O9gemwAcgldZTXdXUSwnQHGaPBFv7KM6TrwsaTpTE/EhB8d091
         Yh9VmNEnUT44UT/Hg9+fXYSviVIE/for/VobuZxGf/n5P4Qt+AO5jpa3hLeUrUny5WvS
         L8f4k+9KfCRUpuuXbZlm/mKs07foDtKKq0RQI1NbkBihZnCzVODI1HiMYgGF/VYY0XLp
         OcflI19LN+u/5fbvYtucYUYGtzjfuqzE8a9Cr+cyZDudE99jnbZ22fyrQBKI/dPdrg/i
         0lMQ==
X-Gm-Message-State: AOJu0YwHl9QNW01S8f3WfMOPrJvU9aoRhV4qb4qLoiuscMRNvZb0A0+x
	C5z/iVyfEeaizCSkHhudnKSRfUG0jMnWyrzjE2Fcx+FXg47552BKlmnAh0yAAuc=
X-Gm-Gg: ASbGncthQM+p88rX0ajaK55NRjJuWIve6GgLiokDowEvp+MpVwBGnpcQjcDUGBR+fUX
	NkUybzbmQNcHCeRZ01B5+Sxf25FZ+Z3RmBz618Esk9i7SGkzTkTopM9hBDwCB/ckwVi3mK8AkBE
	QEohpjBaPaeEQgr5Cg/O5asiiSBb+0VdNN5BLtztdJELSnkYQYuSDjTQ8HlWZ8RDHgYXgdy1dm5
	/LTeOl3oZvqFJOIeE9uO3Y0qFF0tjkiKSQ28qlnCl4ZAXrAzjtMxuhFVcqd2RYkAHA3RVTNeSqC
	6ODG8NiP3ni3JvZ7IloVPEyaji1yzYOGbvNZRFLcr6EqSAmy5y6yysA=
X-Google-Smtp-Source: AGHT+IFuOFGm7cWUgm1XubEB6Y5DzlSM0d1dNuDSjZteOLgYTKgJYxkyoZBk7U8n5a+V22Y4944yLg==
X-Received: by 2002:a2e:b888:0:b0:30b:cd68:b6c4 with SMTP id 38308e7fff4ca-30bd7a4f493mr8310471fa.13.1741160361110;
        Tue, 04 Mar 2025 23:39:21 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30bbae78e73sm8902351fa.75.2025.03.04.23.39.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 23:39:20 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 05 Mar 2025 08:39:17 +0100
Subject: [PATCH v2 5/6] ASoC: samsung: tobermory: Drop unused include
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250305-samsung-codecs-v2-5-20bc980c6445@linaro.org>
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
 sound/soc/samsung/tobermory.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/samsung/tobermory.c b/sound/soc/samsung/tobermory.c
index 2bdd81bf821a5b9bdc56479bb2cd5d0089fab339..bc2608dbaddc4feeb9af77639699fed89540b44b 100644
--- a/sound/soc/samsung/tobermory.c
+++ b/sound/soc/samsung/tobermory.c
@@ -7,7 +7,6 @@
 #include <sound/soc.h>
 #include <sound/soc-dapm.h>
 #include <sound/jack.h>
-#include <linux/gpio.h>
 #include <linux/module.h>
 
 #include "../codecs/wm8962.h"

-- 
2.48.1

