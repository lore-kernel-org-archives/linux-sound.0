Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C8D18C937
	for <linux-sound@vger.kernel.org>; Mon,  3 Mar 2025 08:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740991307; cv=none; b=hKX/9KrmvUhqz6OL1/Qbzjzybu1VbOiUKHj9LAHnPTd6YY1PrPj4ynvk0oB2zNqDh4HalqDcvJ1LyUMP5WO8lImvVV/x7wrnLd/8vkZXYw68ZZh5SkONiPhoENMzmf5WGMfkZtFC4eqlbgG+FA7FDfdR/tUaa6aSJu7Xg0rIf/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740991307; c=relaxed/simple;
	bh=DwQKqMcLQDf5swLNOf368ASj2iVCZuQaLrhkTSzXcm4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VsqaCMsVTO9xaaqGLDxMukVkMpQJyBg5SGIQHWm1z+U9nZMdjz/OIBk/CqZXfhl+kp5QudFZIrwHZZSifk/2J79rkXB1Wy8s4Pz9108B37FHu9Kkslgo+MoqqxrgaoylDIqx/PzTmxkcl0lF3jUKCeq8g5fmCQStmXSM3lpP2rA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vrW0eOhy; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vrW0eOhy"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-30a3092a9ebso43340411fa.1
        for <linux-sound@vger.kernel.org>; Mon, 03 Mar 2025 00:41:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740991302; x=1741596102; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Qm3QR1l1rz75lcEGPLzMuxgJ74yGB+NJLQmmsI61JAE=;
        b=vrW0eOhyjHK3dnnZtBRatBCms7hHA0w2Cy+LrvQ3XLIfjFh21x8LbmKwLd3poHhlpS
         ybgj+RzpZmnzuT0o1gKKJnkgQ01SMt/XN90w7zRiYSOVkvoG4XS66Makesao8vH0+od0
         Iv3JSzQB/yoB+bKTahe4DGAvl2ftE7BZ4mQWPIgXwI3btFxYvtnelLuoNVtfeSwG/2zn
         uDx5SOdXDwfMJmYLbJ85Wnuns2SsUpQ1Mddl9ipoGS9SDW1LfUZrrqH874o/LhqtGg1o
         iiiznpC0tqVPA/txmFbOHIpteU1hs9jM+781/IBJeXZeDgbRxxDB4OYB+fNH8/8yW03T
         vOkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740991302; x=1741596102;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qm3QR1l1rz75lcEGPLzMuxgJ74yGB+NJLQmmsI61JAE=;
        b=wVgSVhFB0nUEVvFCeLe6uAXfBdisIJs6xvtrtkZN0/icMOOZJGkEcFgAOj/ScrhvlR
         IfVLq/E/6zeGYZY2tkxtl9qnEbGsuzZBt/aCn5RKviruHGMUUnIerHExv2ZNry0QsidK
         nEBNbnCUoLkY+lsYyqG3AeIomzMJ22tTvvP0ksQiBCCS+v0kToJqkP8wFVt4NG3VPv7t
         eWqXcE+2l4Vr6M8ibTTHB5BgRI8c2BPTEEDFKdHXCwKIo2PvWeMlMMTrl5ptnFqENgFu
         TfZwQxfFDwIyqFbn3rNGYIHWbE3wbZhMnwV75rvWcBuxZ2OnoQF7ExsAMV9IhGeez8nx
         VgLw==
X-Gm-Message-State: AOJu0YyXPiaSrrg+p40+0jubaERfOCuPZ/th7UNJZE+eSLvxIsa438Gu
	B1kCIyiZpy9CXbNhAsVhk3fqpd18SXS6ebnnQ6hn2uu0wQLXVYn8u1W/ye2Ve+s=
X-Gm-Gg: ASbGncvQ4iH/LMclN6DdvOTmcLrbOwkMR81kd/EJhIfYAxXB+apYEyIa3sZMU9fc5pY
	1hNrh4RvU/ZuvOqGTwm6no9Tp9H9lRmGfGEqbT6HZDrciidFeyyQ/9UqeOLb/l6xTIPqRyr0k8F
	K9snmOdpeKEpavmdu3ukEnBxfrclPCAE5Bc2LFZHCdV3j7ATvMOVC9ilzjxuzbrUysjF0KqxpAK
	G0gScMXlrcUUQ5Hq3Lk4MZuwJrINkOUAI4nLQGdmUSgKCvvB1jGgch0bwC1wP/9N4L9hJaR/XeB
	/skos1TPUQLlEUauVB6r5qEBysnL6skOjTA2G9pt752Aha9D3SC77Pw=
X-Google-Smtp-Source: AGHT+IHn6Tj7glT+a+fHasyXMm+tHoyL5R7gnvFAOlJhkpEYXGi85y3PLUTOtOvNOM+AGZKihutEzA==
X-Received: by 2002:a2e:9f45:0:b0:300:4107:6294 with SMTP id 38308e7fff4ca-30b933139damr42795381fa.35.1740991302342;
        Mon, 03 Mar 2025 00:41:42 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30bc49d8b56sm827371fa.80.2025.03.03.00.41.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 00:41:41 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 0/6] ASoC: samsung: GPIO descriptor conversion
Date: Mon, 03 Mar 2025 09:41:40 +0100
Message-Id: <20250303-samsung-codecs-v1-0-56a2299dd928@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAERrxWcC/x3MQQqAIBBA0avErBPMIYmuEi1Kx5pFFg5FIN49a
 fkW/2cQSkwCY5Mh0cPCZ6zo2gbcvsSNFPtqMNr0GrVRshxyx02505MTZdFa6lYMZkCo0ZUo8Ps
 Pp7mUD3sEYwRgAAAA
X-Change-ID: 20250302-samsung-codecs-6366e1b3f283
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.2

This drops unused includes and converts one Samsung
codec to use GPIO descriptors.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
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
 sound/soc/samsung/speyside.c   | 37 ++++++++++++++++++++++++++++++-------
 sound/soc/samsung/tm2_wm5110.c |  1 -
 sound/soc/samsung/tobermory.c  |  1 -
 6 files changed, 30 insertions(+), 12 deletions(-)
---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20250302-samsung-codecs-6366e1b3f283

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>

