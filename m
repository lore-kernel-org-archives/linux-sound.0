Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD45B32D43C
	for <linux-sound@vger.kernel.org>; Wed, 10 Jun 2026 21:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781126982; cv=none; b=n6FZ2G11SPd7RrOpqzPKCkIzRKEE7A1ORB0k8uwriKi0v5nSTpop0U1Pwn0c2hChIeT+PwUA7mO92FC9UNkJ8yAK5v4JMsMfdbkf2gBRhhWfJvu4zsuR0BLlw+mrKyPQtHTwWRWwHYG/loaaj6zy4waqq1tiDxCVTyiJDaGqF8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781126982; c=relaxed/simple;
	bh=gUzrcXWFBRd4+87BftZYwKJ52jua2o2zGHf5pOVqNd8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mhM7qTnSFIqsJrL0MqCenTYTsz5R6r+2u+c+TCMGKowT0qBU2YOMG7s5uxIVLranbDyI8D6H5Fjl5E6lREvQA7AAtwfU9P5xxcqEV78hzYvlWIel2AcVqglTV9jpGU336gWJAU3LE463Sb6ks861q1iM4TCY5h0UFBIHFrrAY2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=bAa9Z4fJ; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="bAa9Z4fJ"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-490b4a8e28bso61468165e9.1
        for <linux-sound@vger.kernel.org>; Wed, 10 Jun 2026 14:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781126978; x=1781731778; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SJRp2wrffSdTEzc2A0jyXhx0rgIi195AdOSsXPwcqzg=;
        b=bAa9Z4fJiEKTtJ+JG1Ve31Q2kl7DQAOEkE1PZoY0OASLVOF02OwHv3tFdTrr99mmWr
         OT8KvwxmX3KVwHk5/KejSSKAxO9WAJJKWmbu457dHzfOHWuPDboCfBRkQR8qoe9X3EGZ
         S+xx/i6+zgTeF4TG9/ic/2ohb4CKtqbpxqFzBvP/iwrq2uJNiUkwRrFUGJwO8n1g+rPT
         k9BtFBKdA0t+qxzT0PKNhMi7iPZ4LsrlsW8cqfgbgNKgnb206txbVxM31KiSXSkm1q/X
         y3ueOktefRWmLMESkpWtGJeCSnBjODxd5QpSCcyGRb/JAoV7R5G7q1a7XGM6foA49Z6C
         XszA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781126978; x=1781731778;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SJRp2wrffSdTEzc2A0jyXhx0rgIi195AdOSsXPwcqzg=;
        b=hvrUHT5qUxEWKyE/dn7lnQ47NJPeZIiVeYX7tzh5CT1vVMY4YLeLmQFqCC0yianVSd
         mT5q/CNPEXUulTGRDlk5na3DsilIphfebYk2QqGKdUBcYe91JOtzKMIbz7p8s68ZtzT4
         /ytw141M+h56+Dyn3m0TFfWXxUsP47we3qJ1VbCjZk/KXrbQVMWv6fX8r9VXHM2sO3ne
         e20FdNyjlceV97oKjnfnBDjsBa90bhtuRi+NsHo8kOEQ7Z8Syxigq7aVQPZA7fQFhLza
         vb8YuK8o761D7glyNxoCG2lLyIO9H0HMbpXd+XjqEdX7g/kSSCm/YAWsD6JmWGrmTAie
         7gMA==
X-Forwarded-Encrypted: i=1; AFNElJ+I0Gl+zRTvhFoJ4sQX7Hi+hEEpJXI0rMs2g64B/QB7pIRuT+rQUlfGRf7K/Imd8c3NQjVQmPI4TYWcpA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxYYgCf8Ljek/c/69TstttqvqRXoCuNBHiyEyt+3aTr9Bg8HhDo
	OwQom4ShXXL0DENozjhQiEFvzahm7g1WtUjnHd48dR5b0weo7RuGXVj24xuElxAzQUI=
X-Gm-Gg: Acq92OFOjNJ6JLhPXqvQ1/l+ILQvwmiXPb90SDh5pUA+3fbm3VTaFmrKxoW7FbC/CdC
	7oUNu3gBCoxsWjyRrmXDwBHZDCTJrJJusUgbePyIwB/y/IxSk8l+OtOqVHK18NkhAeXDeE3v2Ky
	l1fE8ie83ILfkWZoCEeid1KfERalD6gLm9/OwCePi9/lStk3eGF15qz23ifBgLkxdC6ROTmxxA8
	8+O9wINCcYsoMZXbvKvWSAPatnRUO9HfuvkU7lTSAsIdW7bNAefSFvxY1/ZT9/ZMrM+uKVlE2Ju
	Sl/tkk/YKNg6I84BuReSwE63L5m9rU4j6fDHhJ0V5I6gksD1QNOxKC7LgviqEmlb4FtRvu89F5Q
	VUyOQZIh/nssI+iD6y5oI/gd/VHJWRZBA2/bzUXPh8NmEnE9n5MnMUb4YpAknSZ2XZxW2EBKQsG
	20Ypg+mf0Eot/pGCa6BOuzPW7OjoIXcbU=
X-Received: by 2002:a05:600c:1d27:b0:48f:d5b8:5b07 with SMTP id 5b1f17b1804b1-490c25e10f9mr448608335e9.20.1781126978195;
        Wed, 10 Jun 2026 14:29:38 -0700 (PDT)
Received: from [127.0.1.1] ([151.61.238.34])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490e4228768sm970965e9.0.2026.06.10.14.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 14:29:37 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Subject: [PATCH v2 0/4] ASoC: meson: aiu: align I2S design to the AXG one
Date: Wed, 10 Jun 2026 23:29:24 +0200
Message-Id: <20260610-reshape-aiu-as-axg-v2-0-cac3663a8b51@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADTXKWoC/32NQQ6CMBBFr0Jm7ZiWUlFW3sOwGMoAkyglrRII4
 e5WDuDyveS/v0HkIByhyjYIPEsUPybITxm4gcaeUdrEkKv8oqy2GDgONDGSfJAi0tKjbsndlCk
 dtQbScArcyXJEH3XiQeLbh/X4mPXP/s3NGhVa0xS2LK9F15l7Q+tTmsBn519Q7/v+BX8wK5a3A
 AAA
X-Change-ID: 20260515-reshape-aiu-as-axg-1dac9037cad3
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 Valerio Setti <vsetti@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2673; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=gUzrcXWFBRd4+87BftZYwKJ52jua2o2zGHf5pOVqNd8=;
 b=owGbwMvMwCF2z3ty7kUrRgbG02pJDFma1x2MVZdFz6h6XLD0jbTR6jPFnzWS+jw9IgWcEp6WL
 l88Pdmto5SFQYyDQVZMkYVl+r3fBaVqD40TThbAzGFlAhnCwMUpABO5u57hf5FU44xSJwaJaYv0
 X+yelXb9at+csHUfI3V+Bpjcm9w6dRkjw7d5wre+ss0TW1H5qWXGWtMXOafTJ7z8xrZEUe9mnEr
 rZkYA
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100

The goal of this series is to reshape Amlogic GX's AIU implementation for
I2S to let it follow the same design as in AXG's TDM. Keeping the same
design allows for unifying the two platform implementations in the future
and it also allows for an easy addition of I2S input.

The first commit introduces gx-formatter as the basic block which takes
care of properly formatting audio data. Formatters are DAPM widgets
(c.f. axg-tdm-formatter in AXG) which are dynamically attached/detached
to the streams when the latters starts/stop, respectively.
aiu-formatter-i2s is introduced as formatter implementation for the i2s
output.

By the end aiu-encoder-i2s will only need to handle interface clocks and
enforce interface wide rate symmetry (c.f axg-tdm-interface on the AXG
platform). Right now rate symmetry is not relevant because only i2s output
is supported, but it will become useful when following patch series will
introduce the i2s input part.

This series was tested on an OdroidC2 board (Amlogic S905 SOC) both with
HDMI output and with NXP SGTL5000 codec connected to the I2S pins.
This series was also verified using "pcm-test" test tool and all tests
are passing.

Changes in v2:
- Fixed most of the weaknesses found by Sashiko review tool [1].
- Resolved testing failures with "pcm-test" as reported by Mark Brown
  (thanks for the heads up!). I left a comment in
  "aiu_encoder_i2s_startup" to explain the fix.

Link to v1: https://lore.kernel.org/r/20260515-reshape-aiu-as-axg-v1-0-53b457784ff3@baylibre.com

[1]: https://sashiko.dev/#/patchset/20260515-reshape-aiu-as-axg-v1-0-53b457784ff3%40baylibre.com

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
Valerio Setti (4):
      ASoC: meson: gx: add gx-formatter and gx-interface
      ASoC: meson: aiu-encoder-i2s: prepare for multiple streams
      ASoC: meson: aiu: introduce I2S output formatter
      ASoC: meson: aiu: use aiu-formatter-i2s to format I2S output data

 sound/soc/meson/Makefile            |   2 +
 sound/soc/meson/aiu-encoder-i2s.c   | 281 +++++++++++++++++++++++++----------
 sound/soc/meson/aiu-formatter-i2s.c | 104 +++++++++++++
 sound/soc/meson/aiu.c               |  32 +++-
 sound/soc/meson/aiu.h               |   4 +
 sound/soc/meson/gx-formatter.c      | 282 ++++++++++++++++++++++++++++++++++++
 sound/soc/meson/gx-formatter.h      |  56 +++++++
 sound/soc/meson/gx-interface.h      |  48 ++++++
 8 files changed, 731 insertions(+), 78 deletions(-)
---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260515-reshape-aiu-as-axg-1dac9037cad3

Best regards,
-- 
Valerio Setti <vsetti@baylibre.com>

