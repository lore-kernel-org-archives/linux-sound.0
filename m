Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Hufk7gH1"
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAB85171F
	for <linux-sound@vger.kernel.org>; Fri,  8 Dec 2023 02:09:34 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-50bf32c0140so2095099e87.1
        for <linux-sound@vger.kernel.org>; Fri, 08 Dec 2023 02:09:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702030173; x=1702634973; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Vr8M8yZHzu2ksi2MzWtdEAgZ+qqFOPpjjDUo6GVzqJQ=;
        b=Hufk7gH14sLgGgeZx95qJdcv+l4Jnwt6x6HTuowtBLgK4P8Pp4IPv1NPdgWxe7bgJS
         X/dqEDDdMbBO9lEjhcBvcGnjH4BB4S6Jenyr4+1gQys5BLG1/3/gz6JOPBtG8Ck0MG5x
         IHtebSK/RiaUi3WUSbsRk62PokTFo3oDiFd1GdgT16nmYFeMzDUUg4v3emQ/ouPtRzPE
         5R3738jpS7Gf8oc1No9wod2YqDmHKGNxBO2GdX47YHaHshG3Vq9nzKl2sv27NHEfT/5f
         qpfHVHTvE7GTxzx4uGxRw44+rnMSN21Oal6dSH3sGDn7XQEAyqEcFzzIFWf0Buor3jxe
         2TVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702030173; x=1702634973;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vr8M8yZHzu2ksi2MzWtdEAgZ+qqFOPpjjDUo6GVzqJQ=;
        b=Bv0knBsYfvFvaLAXSWYJyfnQNMI9/SCOJrqRr62U54MDiyjiVrYcPYFRfPo3EYlvjP
         Ydvj9RfIOaxyNvJGJWFnzCqAYESPkGWIv0qFxcSsFwACcGSJ0THfAWPML2P0XSJWEIL1
         UI6WEh2he9cb8fclE3MtOg8ehe2gGt/0LlnA0PUJCc/LKzxoSfkK3JidXtChG6OGKsDZ
         IKzAt9tiYLAXqyPi7jcn+nYB1GvQhN7xY7VStfyy3yVJNhEZ66f1FG9vqPHe7zxyGSqy
         7PMzZB3fMiwIoSBQCAbTVxSMkbuRdJbo6GrfwU2nv+9fnkWX9FkM6lQN4uYHN9jQffiI
         5KxQ==
X-Gm-Message-State: AOJu0Yz0xm6d0GVQ9oB2auj3oC6MTD8Iqn6F95EQeYQY+yLM9UzhuXLZ
	hzFCRxJysX/6hHxVqj6HACZAqQ==
X-Google-Smtp-Source: AGHT+IFkWaFLQVbEyBeJsLHYwb/f8kEmtw9Zwi8vn7hFTd1uWMGLbOUV8za2gYMRIDbeZ12y40lXAw==
X-Received: by 2002:a05:6512:68f:b0:50b:e995:d9e6 with SMTP id t15-20020a056512068f00b0050be995d9e6mr2623614lfe.93.1702030172939;
        Fri, 08 Dec 2023 02:09:32 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id m4-20020a194344000000b0050bfd7d8873sm174295lfj.254.2023.12.08.02.09.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 02:09:32 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 0/5] GPIO descriptor cleanup for some Wolfson codecs
Date: Fri, 08 Dec 2023 11:09:24 +0100
Message-Id: <20231208-descriptors-sound-wlf-v1-0-c4dab6f521ec@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFTrcmUC/x3MOQqAQAxA0atIagM6LoVXEQvJRA3IjCRuIN7dw
 fIV/z9grMIGXfaA8ikmMSSUeQa0jGFmFJ8MrnBV6YoGPRupbHtUQ4tH8HitE3JLI1NF1NYOUrs
 pT3L/33543w+fojWFZwAAAA==
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: patches@opensource.cirrus.com, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-sound@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.4

This converts the remaining Wolfson ASoC codecs to
use GPIO descriptors.

These Wolfson codecs are mostly used with different
Samsung S3C (especially Cragganmore 6410) board files,
so the in-tree users are fixed up in the process.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Linus Walleij (5):
      ASoC: wm0010: Convert to GPIO descriptors
      ASoC: wm1250-ev1: Convert to GPIO descriptors
      ASoC: wm2200: Convert to GPIO descriptors
      ASoC: wm5100: Convert to GPIO descriptors
      ASoC: wm8996: Convert to GPIO descriptors

 arch/arm/mach-s3c/mach-crag6410-module.c |  60 ++++++++++++----
 arch/arm/mach-s3c/mach-crag6410.c        |  24 +++----
 include/sound/wm0010.h                   |   6 --
 include/sound/wm1250-ev1.h               |  24 -------
 include/sound/wm2200.h                   |   2 -
 include/sound/wm5100.h                   |   4 --
 include/sound/wm8996.h                   |   3 -
 sound/soc/codecs/wm0010.c                |  44 +++---------
 sound/soc/codecs/wm1250-ev1.c            | 118 ++++++++++++-------------------
 sound/soc/codecs/wm2200.c                |  67 +++++++++---------
 sound/soc/codecs/wm5100.c                | 107 ++++++++++------------------
 sound/soc/codecs/wm8996.c                |  58 +++++++--------
 12 files changed, 211 insertions(+), 306 deletions(-)
---
base-commit: cbf5552fa580b78c690ca5829264f2fd2e2bafc1
change-id: 20231205-descriptors-sound-wlf-e6caec3cc642

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>

