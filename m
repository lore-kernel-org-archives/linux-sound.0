Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E58AB1E48A
	for <linux-sound@vger.kernel.org>; Wed, 12 Mar 2025 13:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741786320; cv=none; b=hZBXJWs3l/iFg8FS3WgvUfzT4Eqhisob1NnmF/5JgYTMNJoezUNd8qYdEIxlJMze1v3suOgQuJ65XJfpGpmdlcIjzuLodcQUwIvtxfn7kuqWZzIEJanBQHPARYGf/SQzUSHEN4dV04G2KrMHEUwOj1kCM1OmJrhtwPbyyx4yUM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741786320; c=relaxed/simple;
	bh=56Y5NLWpHAfbZjKvZyFHNFC8eMLzlMMysHPeP5iaDy0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=p2bREd3qhtCLf7HnA5TXer0HfJRp2F2w9/cpmN7PpE6sjlGSwSyBDZyZAftiS2uf27+hbKt9m0rUdb3jpBKwpY0tWo2beThMhYxL1xHLLMtzEE85UKFCwY7gfYhK2UVJ8zM4PQ/08dVBW2STbNd+Y/FTdk8TtzXgPnmTiI59OIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CtNLR62S; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CtNLR62S"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-549b12ad16eso1219242e87.0
        for <linux-sound@vger.kernel.org>; Wed, 12 Mar 2025 06:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741786316; x=1742391116; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KGyN1OdCDHn55um23XvthELP0vLmRMF58m5afAMvpIc=;
        b=CtNLR62SF6Ox4P0lUefWfSSJdCPudwtOxOOfMvmSWKduEd92hWd/ObwbxM/ITYLDjO
         2hWDhp4gEhYtyiJ8FBuf1ois9HGFxbMGTelbyUMqWm9woW31ukme6rRXMXRzfspn9027
         vnMUrOVs1vm+vlfK1aHj4OO4X8t+fjBvscfpabir6TMdVHNt5A8XucdaoTHe3UoqwjnV
         W2HFApbl+xGFkV6kas2J9ITAWyy4Tn7wRoMMkJ81uenfKi0cJf/LjWzzDyWjQFaL/p9N
         pTUd9psMmrYsXtr/Fp1IZ7p9JEgrpuFvBEHtSeZpcR993oBQyvVl9K5OfMIrlVHaPtKz
         KpoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741786316; x=1742391116;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KGyN1OdCDHn55um23XvthELP0vLmRMF58m5afAMvpIc=;
        b=Y6ULMi+fglNcPiL5Zs0fj5XJIXeVhwzt29aTs4z98JvaNTLEtGsJxdhdMGpd3DSbvO
         6czmDgJNrAIklMccek7ZXY7+dcfzuydLc3idmEJJutQsrnQGTxqfLEbN0TawOcq74atM
         M/tzTlS/wwrxC5YIN/kCeIL5l7OEgkb5GWWRX+GLD1RlC5s+mf0TQXmiJ2HFnM/B53Y/
         l5Bw7jSunbYQXVw3cNBt21l6El1t0yf4qfMKUsPsTMj4OFJqG6SdrIZeqUGcG8Rs+n92
         qgh2uHo72dTgJ/zPabWodFdnHFC+SDlSX+LR7hWW4DtI6AS8OytwfJ20iwDrU7gGy+4J
         bLdQ==
X-Gm-Message-State: AOJu0YzzvZ5jIoAy+Lgcg0D4jR2crhoQFjTcNG7KzUX6wbfNauYBe4zO
	nPM/UOmXhwKraU7HQG3R/fBYwwoq/HGNz8CUNULhJQzGgR6D3HnnabcLs7rqUYw=
X-Gm-Gg: ASbGncuLGuU3qGfV81b1O+OTv+7Lq1oSPS4QHSn6Rr9gFrQMAHNYkNm6TxWcDCJ4ifd
	aBgu7JPYCSksT7n6HTKXvepR1pjLK7bK3OiQuq+9abu8HL+Gq4lAfMjX78lFFF/0uENYbbkqeKm
	1iYUwooml++Tw0uA2zhrUpfu4wX1PBdkB7BqbkJMrfhMeNqnnWTA5TzAR4vlRmkk66gB9eGlinb
	1hYxAKO3Ua17hflN2U+sQFV0dKqdDjDzaiLFJqqImuQSY2oA0Ch+MzcOg5yRGg1pIj/8do64gmm
	D3u9/Igd7hj2Ewr67CQisZScqBf+cs4nyzJPSbPa1a5RLYEiqzjw2LU=
X-Google-Smtp-Source: AGHT+IFYGDBXUYA0H3In98EVuITrxJ9ljuAhQqGGzBSiKqK2nMLcHZBMFwIc/zW2li1pfZPQUHKHaA==
X-Received: by 2002:a05:6512:1195:b0:549:78bd:6b8e with SMTP id 2adb3069b0e04-549910b6127mr7823054e87.37.1741786315985;
        Wed, 12 Mar 2025 06:31:55 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5498ae460desm2121858e87.24.2025.03.12.06.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 06:31:55 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 0/3] ASoC: Convert PCM codecs to GPIO descriptors
Date: Wed, 12 Mar 2025 14:31:49 +0100
Message-Id: <20250312-pcm-codecs-v1-0-41ffc4f8fc5c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMWM0WcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDY0Mj3YLkXN3k/JTU5GLdVDMjkzQjY7NUg2RTJaCGgqLUtMwKsGHRsbW
 1ANxxO0ZcAAAA
X-Change-ID: 20250312-pcm-codecs-e624f236e0c5
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.2

Three remaining TI PCM codecs use the old GPIO API in
different ways, fix them all up and move over to
<linux/gpio/consumer.h> and get rid of <linux/gpio.h>.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Linus Walleij (3):
      ASoC: pcm1681: Drop unused include
      ASoC: pcm3008: Convert to GPIO descriptors
      ASoC: pcm6240: Drop bogus code handling IRQ as GPIO

 sound/soc/codecs/pcm1681.c |  1 -
 sound/soc/codecs/pcm3008.c | 61 ++++++++++++++++++++++++----------------------
 sound/soc/codecs/pcm3008.h | 19 ---------------
 sound/soc/codecs/pcm6240.c | 28 ++++++---------------
 sound/soc/codecs/pcm6240.h |  7 +-----
 5 files changed, 40 insertions(+), 76 deletions(-)
---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20250312-pcm-codecs-e624f236e0c5

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>

