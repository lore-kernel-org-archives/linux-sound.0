Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G4WKVQYL"
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F95613E
	for <linux-sound@vger.kernel.org>; Fri,  1 Dec 2023 05:20:33 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-50bc501081fso3088210e87.1
        for <linux-sound@vger.kernel.org>; Fri, 01 Dec 2023 05:20:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701436832; x=1702041632; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3WxPktasKkZEej0sqgFg3/J9Uo7JHJmWFpjxeLxWfYc=;
        b=G4WKVQYLN6UZkXnJbYrTbwt8PrYTZPGqAo2aNpVSPA1xevI6hipVZMKwG+wm1GWAxc
         DU363fgeYedv13reu2ghqjY1Fk6AVvjr5u+korMx589U8EnVbS/TjAKyEsXehCHr8i3y
         o7HhmiiErCDkf50o1KoJwmrdbGxV+tsHXpamWmvHjqti/OhRV8kL+M7vQ/qC+/NJKXSt
         9YUdFgeXALo36zt58wo511aN0tA6P4O7kMe3rfvE1dofqci2D+NsWUY4qmQ6WOHqUw3A
         WQhBWW0kaWDw/dW23ncndLC30/cbUeOe8oTtqAjTurnJk1reK8fyV1urqir9Dn8y8+o0
         UFNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701436832; x=1702041632;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3WxPktasKkZEej0sqgFg3/J9Uo7JHJmWFpjxeLxWfYc=;
        b=sX69DLZXWIsYvmjZe461E1dNMeCeKS4usRaB72t7zo8FcQlMOhrUroboj4EsuSEHet
         DPw0/dXyAEfCMezawYGos87dCPhma+JzS0732UsLLzcZKNgmrFeRUq512P0nUVvymxfQ
         cOsMpQurOpTmA4Bo2bARGHAs6AGLwnkE4blt5Q9TnKMVCxtLpo8crIargUAOLYBgRQTx
         TvnafzNLfbWnsL+kTZB1ax/q7UJAEXHRVVJ51YkVeoq8yNz24PPp2/idupfI4Ku8HZCL
         w0lbOCEMD4FO56uiq1ETngYc81OaUIQBl4DV04ZAoX2QvuI1GzNtAnZkaT3GkyLWhQTI
         U5/A==
X-Gm-Message-State: AOJu0YxXRj0shtKfUacTSqZNhlo2Xx0QjfQKdqzCHOiSxzsle/wvkXA7
	8Bjgpz+sY/easXkR66wvTikrAQ==
X-Google-Smtp-Source: AGHT+IHnkI/nqzO/GyNwmeS7iBCAivqXeSYuwkz4bEKNd4hhmJw/EAoXBhuD7RcEBSZRCHCeEWL6mw==
X-Received: by 2002:a05:6512:239f:b0:50b:c2f4:ad44 with SMTP id c31-20020a056512239f00b0050bc2f4ad44mr1028147lfv.29.1701436831756;
        Fri, 01 Dec 2023 05:20:31 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id u25-20020ac243d9000000b0050be054b4e8sm1081lfl.121.2023.12.01.05.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 05:20:31 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v2 00/10] ASoC: Convert Cirrus codecs to GPIO descriptors
Date: Fri, 01 Dec 2023 14:20:29 +0100
Message-Id: <20231201-descriptors-sound-cirrus-v2-0-ee9f9d4655eb@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ3daWUC/42NQQ6CMBBFr0JmbU07gIIr72FYNHSASUxLZoRoC
 He3cgKX7yfv/Q2UhEnhVmwgtLJyihnwVEA/+TiS4ZAZ0GLpHLYmkPbC8yuJGk1LDKZnkUVNjRh
 ae3GNbQiyPgsN/D7Sjy7zxJqlz/G0ut/6R3R1xprSeX+tKqyHobk/OXpJ5yQjdPu+fwGdVkqIw
 QAAAA==
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
 Linus Walleij <linus.walleij@linaro.org>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>
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
Changes in v2:
- Add explicit <linux/irq.h> include in the cs35l36 driver, apparently
  the driver useeed this implicitly through the <linux/gpio.h> include.
- Fix commit messages "gpios" -> "reset" on two patches.
- Test builds OK
- Link to v1: https://lore.kernel.org/r/20231129-descriptors-sound-cirrus-v1-0-31aa74425ff8@linaro.org

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
 sound/soc/codecs/cs35l36.c           |  3 +--
 sound/soc/codecs/cs4271.c            | 39 ++++++++++++------------------------
 sound/soc/codecs/cs42l42.c           |  1 -
 sound/soc/codecs/cs42l42.h           |  2 +-
 sound/soc/codecs/cs43130.c           |  2 --
 sound/soc/codecs/cs4349.c            |  1 -
 14 files changed, 56 insertions(+), 49 deletions(-)
---
base-commit: 267aea213ae042f779a8054401a8a5f301518605
change-id: 20231129-descriptors-sound-cirrus-522d9061808e

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>

