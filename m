Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E35186324
	for <linux-sound@vger.kernel.org>; Wed,  5 Mar 2025 07:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741160360; cv=none; b=OEcbssNwFWpJqnB6d5rjAHrFmvQrdnLUEN+ZOjJBYGATGXWFKQJKGqc/RspolumbD5Nn5agOedDPF7fHZ4/Iv//s4V/NAl+zXvh7++A7RJWBO34Wb6OHf5aSdsfD1g69FldHWLcafBEzEbmCoZmp0fRReKHAhAwMLQIn4y+eG5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741160360; c=relaxed/simple;
	bh=q0+S22WPuElk/jcAtxVYX7JIk0wQaEUy6YQfzqxUpAk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ICImWo3wv+JQljN5ZGbQYrOxYd5XBPJwR9mygj6BVQQXlmq/YmBnaDNdAPG1ZD5OK9rutnKkUVhc9gdEpOTdGXjQDSngDY+19FEZfhr3or8unvGW8u1d+w8LL/tEiNlVNnBB3jaOUCbCoG9onRuEcBgxkk6TLJ/AO6rbROXHDMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LcmIU+6o; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LcmIU+6o"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-30bb64a4060so26883791fa.2
        for <linux-sound@vger.kernel.org>; Tue, 04 Mar 2025 23:39:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741160355; x=1741765155; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LJW9aE2UhCV0B4dc2B3h84ZOkRVFNml7XUku3ywU8Fo=;
        b=LcmIU+6oNkqq2pgT+NXIm5en99t4d2egQhCR89dHdDVkowu3CseSd/84xC5EXMg/Er
         GF+whD4fAKQToZ7Ep51fB+rQIs4Yt5QxotNI6hD95HeHHSJDh3vqnq+lKcpMXmbAl5Fc
         AhuXrWPsAYygA+orp7PXeMT+FXCnAxAoGjxpuTJtYQ1udWX9MbJbRnYhrwMCiTfmpb30
         srMZ+QOOoAAUkahxT7tZfucEgnnSxzwbUViWLBZkagiZ2llPeHkHP0lDjO8ZoEPsbMgt
         +nyncl8tmgE4Q+DWx9XHXT4RRubu0HBY3eYdFgg6jWiuEj/OgQpEpmrDZM/6QNAUiNFu
         TdGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741160355; x=1741765155;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LJW9aE2UhCV0B4dc2B3h84ZOkRVFNml7XUku3ywU8Fo=;
        b=jr5vcIvWmSegRE8ta4i+XWHs3sbwiWedX8J8Lu53V3kCvJ6TrNX1W5yteGMMCIkayt
         wsj9qzGktVCn1H0HRl0GMoNdlg2Rk7ulR0q7zk92Tk6aZlh93c3qHM2BPI0Vbr0Cp+xP
         gO4z6mfeJg7jwgFYUvNIZj9HqeDKdbDGfyReTepOUF18xzeBJyBauUrOdvNJAs3911xN
         7ZHQqC53LjyNaJGYhfSaYmLPRDNBWQ1vYNkNX/O1aMety+0YGI5Uw46B7hu69BWMmwjN
         9vmBvUZm+XATiErnzka199X3ZXE0alhrpzU+tvAj8hjY74afnI+ilL21L9rxEBe5s7jb
         mlQQ==
X-Gm-Message-State: AOJu0Yx0V6r6Y96dQp5fkW6ltw58F8qV/QqSeOgOIn3yZlUSrupXtsNJ
	7tMtcZu5MpOd2lB7AocMmiCXTXDtEgtrlqnVSWpA8e+8vL0ZfL9QoB3WU8ZdZug=
X-Gm-Gg: ASbGncvCYzBlmCUpYGIoYwUNvJK5PrZdLKegZVVjUe+uEkh9BPia7njMeONuD5QE/r9
	KW++waWBq4CTKWOnuuyGCE31AmxVf0epNooixB2vhq2axgmqunChgdvG15X6kjLlT+EsqiMPqGX
	RQa1QWajFEMPHV0CbqeV3OBN1tGbyqU+NbcnvRu1M8KxmH2ETIm9iK64ACUlc+qFR/FwhdZsnl0
	zAXDsCn83dFtIpYFwh6RK3K0o2k+z6GiBkrX7WZov1aT9eCaWERcDy2KUZJyg2DoC6pUDpHr0QS
	NAt8Koy7BpgODPsfiDSjruAv30eGxrMRI2FF6MvBWbdaLFYNunEszZk=
X-Google-Smtp-Source: AGHT+IEyQAzaW4gq+8l1Jw587sTvvOjYY8IgYjgeac3pSvj7GEl+4Qb0eshDTUKdJvdxEf1rchKeSg==
X-Received: by 2002:a2e:a7ca:0:b0:30b:971c:96e6 with SMTP id 38308e7fff4ca-30bd7af6208mr8775671fa.26.1741160355350;
        Tue, 04 Mar 2025 23:39:15 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30bbae78e73sm8902351fa.75.2025.03.04.23.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 23:39:15 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v2 0/6] ASoC: samsung: GPIO descriptor conversion
Date: Wed, 05 Mar 2025 08:39:12 +0100
Message-Id: <20250305-samsung-codecs-v2-0-20bc980c6445@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKH/x2cC/13MQQrCMBCF4auUWRtJJzS0rrxH6SI203ZAE8loU
 Urubiy4cfk/eN8GQolJ4FRtkGhl4RhK4KGCcXFhJsW+NKDGRhuNStxNnmFWY/Q0irLGWqovZsL
 WQDndE0382sF+KL2wPGJ67/5af9cfZf6ptVZaNdYhdp33HbbnKweX4jGmGYac8wdF5AK2rQAAA
 A==
X-Change-ID: 20250302-samsung-codecs-6366e1b3f283
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2

This drops unused includes and converts one Samsung
codec to use GPIO descriptors.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Changes in v2:
- Collect Review tags
- Add a devm action to drop the gpiod table in speyside
- Link to v1: https://lore.kernel.org/r/20250303-samsung-codecs-v1-0-56a2299dd928@linaro.org

---
Linus Walleij (6):
      ASoC: samsung: bells: Drop unused include
      ASoC: samsung: littlemill: Drop unused include
      ASoC: samsung: lowland: Drop unused include
      ASoC: samsung: speyside: Convert to GPIO descriptor
      ASoC: samsung: tobermory: Drop unused include
      ASoC: samsung: tm2_wm5110: Drop unused include

 sound/soc/samsung/bells.c      |  1 -
 sound/soc/samsung/littlemill.c |  1 -
 sound/soc/samsung/lowland.c    |  1 -
 sound/soc/samsung/speyside.c   | 47 +++++++++++++++++++++++++++++++++++-------
 sound/soc/samsung/tm2_wm5110.c |  1 -
 sound/soc/samsung/tobermory.c  |  1 -
 6 files changed, 40 insertions(+), 12 deletions(-)
---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20250302-samsung-codecs-6366e1b3f283

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>

