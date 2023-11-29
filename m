Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wdS4zqNz"
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B83A2D67
	for <linux-sound@vger.kernel.org>; Wed, 29 Nov 2023 13:28:41 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2c50fbc218bso3369261fa.3
        for <linux-sound@vger.kernel.org>; Wed, 29 Nov 2023 13:28:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701293320; x=1701898120; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JVtouacVrrR5Jn9scn4yjT9l92Jv7EbZPGxiKjWiiDI=;
        b=wdS4zqNz2dNHIdXV7RsbShYPHiiGc5HJGCjvPXQxhPh8fx340EzxgbD++LWsxPngGQ
         M5vlhYO03b18BGatAmOHAfNQ1a4+m3dyIGN1EZMvI2lkgmZj0p/ucbluT8VBNh2wGjHA
         S7BjMgj6D/vUeZ/eCwQ8AOI6yQjTPxXhexFnNDDPaJEIxrta3GezsYv3eo7ZL6LTV/28
         VoV+DFIFG9/mTp2a6UwFogR4db+rGrY98n2iiNWgeg6/wMDTLqmyWgJFYB5irtwVn7dh
         XM9o3kTQtCRRc254Qd6Jo/RIHGKTBbRkleZEmPugkBBeEU2GSdNFCoV5rNaAAZCkyXw0
         /5JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701293320; x=1701898120;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JVtouacVrrR5Jn9scn4yjT9l92Jv7EbZPGxiKjWiiDI=;
        b=W2w+kmBfvr6kvPgzBW79iih/KHAaEWUhagKBllITJFmXNEGUsBcPi2g9V1hEt2oM9L
         L4iklNHJO3nzsUkQx5zu3WeXSbyH1B/4mDNDBzRbEiHvpSUhKAg8WOGc0npxwU4gUiDv
         WfITR3VownjH28vR0wLGaFNI2+Ql2EcYCpyz+qVWdtYH4XmQd3UYyw7i/PMEWCW7CLws
         a9Lt8aoT56bu3ZBjm50qcU6s4TmleH28O/VbM3o4fBqtsbLeF/JqfG9Mu//do4ZYwSYI
         81aeju6nFerO6kqIP9AKPXqCnZK8zdazZCFDrFG7edeT9afNqi7XAkv/GQ9H5uq0w8N+
         tkNQ==
X-Gm-Message-State: AOJu0YwRx8DsOcKXgLobt29Do2445XJttNh8Qk5AYkbIqecv1NW1pdqy
	N1uB5y5XPO+rlOEAmGyWKtDvAg==
X-Google-Smtp-Source: AGHT+IEwkINnI/mpd3rYVPrRN6fdLm/mchI5FP5PJu+561pNnVnQiZR0QEViJMJGk62lvxiV+rXBxA==
X-Received: by 2002:a2e:c51:0:b0:2c9:b84d:b8e with SMTP id o17-20020a2e0c51000000b002c9b84d0b8emr4053036ljd.17.1701293320014;
        Wed, 29 Nov 2023 13:28:40 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id b5-20020a05651c032500b002bcdbfe36b9sm2106196ljp.111.2023.11.29.13.28.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 13:28:39 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 00/10] ASoC: Convert Cirrus codecs to GPIO descriptors
Date: Wed, 29 Nov 2023 22:28:36 +0100
Message-Id: <20231129-descriptors-sound-cirrus-v1-0-31aa74425ff8@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAStZ2UC/x3MwQqDMAyA4VeRnA20GY66VxEP0mZbLq0kU4TSd
 7fs+B3+v4KxChu8hgrKp5iU3OHHAeJ3yx9GSd1Ajh7e04yJLarsv6KGVo6cMIrqYTgRpdk9fXC
 Boee78luu/3pZW7sBZerrHGoAAAA=
To: Paul Handrigan <Paul.Handrigan@cirrus.com>, 
 James Schulman <james.schulman@cirrus.com>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Hartley Sweeten <hsweeten@visionengravers.com>, 
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
 Nikita Shubin <nikita.shubin@maquefel.me>
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com, 
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.4

This series walks over the Cirrus Logic ASoC drivers and
clean out the use of legacy GPIO numbers and legacy
GPIO APIs.

The CS4271 affects an ASoC driver for EP93xx which Nikita is
actively working on moving over to device tree, so I don't
know about that patch specifically, but I think the collision
would be max "the file was deleted".

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Linus Walleij (10):
      ASoC: cs35l32: Drop legacy include
      ASoC: cs35l33: Fix GPIO name and drop legacy include
      ASoC: cs35l34: Fix GPIO name and drop legacy include
      ASoC: cs35l35: Drop legacy includes
      ASoC: cs35l36: Drop legacy includes
      ASoC: cs4271: Convert to GPIO descriptors
      ASoC: cirrus: edb93xx: Drop legacy include
      ASoC: cs42l42: Drop legacy include
      ASoC: cs43130: Drop legacy includes
      ASoC: cs4349: Drop legacy include

 arch/arm/mach-ep93xx/edb93xx.c       | 32 +++++++++++++++++++++++++----
 arch/arm/mach-ep93xx/vision_ep9307.c | 12 ++++++++++-
 include/sound/cs4271.h               |  1 -
 sound/soc/cirrus/edb93xx.c           |  1 -
 sound/soc/codecs/cs35l32.c           |  1 -
 sound/soc/codecs/cs35l33.c           |  4 +---
 sound/soc/codecs/cs35l34.c           |  4 +---
 sound/soc/codecs/cs35l35.c           |  2 --
 sound/soc/codecs/cs35l36.c           |  2 --
 sound/soc/codecs/cs4271.c            | 39 ++++++++++++------------------------
 sound/soc/codecs/cs42l42.c           |  1 -
 sound/soc/codecs/cs42l42.h           |  2 +-
 sound/soc/codecs/cs43130.c           |  2 --
 sound/soc/codecs/cs4349.c            |  1 -
 14 files changed, 55 insertions(+), 49 deletions(-)
---
base-commit: 267aea213ae042f779a8054401a8a5f301518605
change-id: 20231129-descriptors-sound-cirrus-522d9061808e

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>

