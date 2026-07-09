Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D87BA3B14D0
	for <linux-sound@vger.kernel.org>; Thu,  9 Jul 2026 22:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783635224; cv=none; b=Pofotfa61tp3TLnJBgCQ4q0BOpitsm3rCTlR180UXL4WYgXQqW/Wv1YO1ktoiP0HDk1m+J4Tcm1jvL6VArVlaNaNfKSqhKfjb4IlYm8zhJZaahxsJz7fD6EE9BsIx3Vws3VIYtXMK9pDfgos+NhG+bh+UGwsF4SsR84NjdztLtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783635224; c=relaxed/simple;
	bh=c9aE93lkkyDRQAGKWchGNXimHCtf+KxRam7dICs83lA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nbjCyuGC3jiwKl1Y9ejolzWhCwQhwmKpeLYk9DY1J6XwF2Tw4zBvcbEn/EnlzecOgfkBHjhLCKUsR5Ce4V5Jsnx5VcRqDlfM1nIOYdN7+9P01rQvWVPt6ggDPd6pY1/qDZagYdj4xZgsqtL+TVaxP/3d1PQ00kIKbzQnCS6r7OE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PnrmI+Ma; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PnrmI+Ma"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-476a130c138so431970f8f.0
        for <linux-sound@vger.kernel.org>; Thu, 09 Jul 2026 15:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783635221; x=1784240021; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XUAu6I6BOkoB20ZosEqwiYIiRv3UnwmkNWFwoAnykFw=;
        b=PnrmI+MaqLudVxCPNN5SVi8Q0j/gDFdFrSZJTXFdm2U+vEAKCnW04r0JdlPIOqnUI0
         AehhrIbCdE0+365+N3aB+9C5HEaWfYhetVJ0l4lS+dRF2EPsK/iFfGVkW0XbVkf5CjSY
         +Q8GQo4OepL7TLNqcN6fZ1MfRo+Yv7v6dKO7kqRZFJofEutWfaUEY8Dq8hHYEzhDlO0C
         hgdvrXZrrJta6MoQjhw02diAktVAwUhq9Fvmb+TaFeh/wjUlNFaELwuhNCMW2FDfEwYU
         dE/IW9p7J7lOefycpQ1G4Hmk4kn3481azPOc3gF4qiXta4VbUptR44/dpfvapyxiehIk
         KyHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783635221; x=1784240021;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XUAu6I6BOkoB20ZosEqwiYIiRv3UnwmkNWFwoAnykFw=;
        b=Ydn4HSa01c9aWIjv/8FySqZLlaXFW7X15Ic3OmWNGssJVY69gtndevKjad6nGXILGc
         ERgtbdwDu+3uAdR4fMAtzwXro0Ta4hqn9cJM9Za5hTLPV6moJdR2K96az6m0tzQw1Lf8
         0s0biaAQgBf+dfLVOxmZhj6xVG08OcE6Nw+tzklzlw7glEoEuAtitR3xFOu3CylFCc2e
         XoWAijmp9pLkc5yR3ht5ahYjja+hJl9Ub8Poyg2VHjs6wK9Q7MUAeLnK5Hu7wJMcPKnM
         rvN1mzuSlaujcw5PNVx04n/JCikJ54GG9JG8XLZdN3plhvdFAlz6qRJVnEJpC0nR5ach
         bOEg==
X-Forwarded-Encrypted: i=1; AHgh+RombPXmQg/mL7A4KrM9FZDZIf2yBWTydzwyhRIELlFMdfYs2yiDce8A4tKJKXuh9F+gleNjWQ9obuCoeA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxns84hQEqZsPTYyNDJent8aktUzlKXyBMVWht47SbvX8g1JnMO
	9zrWOEZ45SQjS3jwGXF5jZd3Sk3LWxE1B4gHnOtmElOtvjVE1AI2qeJx8opeYRWaE4o=
X-Gm-Gg: AfdE7ckkN1cTvm/r1h+8dmJVTrEiTwDy05GRnDhbUmzkbKta7Mq5k0GmIFYGhYUEHso
	xWW4FrsyGKxXHpJMjAC0P7YwzLZvI99/cz5lQ9+Xw9+OJNXKR5/e+QTnEvwI7vMlpVv+1d8Txm1
	NtmlZ+WZwsHhoUH8aLP/r6uElZuCJ63AjmjU5DMAFUPAVP9fi6I+nveVj67vBVH8QNsKIr0sy8G
	KBrimjDwaRxaDp0IOhfku0b0+uL917jaEgLe/5AJlUU1UjpM2JyRGJZZN3/3U2l9umH9FpqJLg4
	7zo9/ksg1zS8uQxgV/KaG+R4GFNuBMI+uNA4+I+h28ega1Mb2bcpii9fcwVPLVIzQ5jHLlg1Y9B
	OGXq+hESyO/ho4v+PIAccMQhj7TCxia30olIWcdo7oyM+we70LQu61PcMtkELVrqTekcAHsG7m3
	OVDrEeX+gOSds/kclcfOJIA1F0jN1Ja0IG
X-Received: by 2002:a5d:5e92:0:b0:476:c622:d41f with SMTP id ffacd0b85a97d-47df0768507mr10065889f8f.47.1783635220736;
        Thu, 09 Jul 2026 15:13:40 -0700 (PDT)
Received: from unknown.tail46804.ts.net ([2a02:b023:8011:c993:4bf6:23f5:d942:9d70])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47f2465ae8bsm869008f8f.36.2026.07.09.15.13.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 15:13:40 -0700 (PDT)
From: Gianluca Boiano <morf3089@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Gianluca Boiano <morf3089@gmail.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] ASoC: codecs: add Texas Instruments TAS2557 smart amplifier driver
Date: Fri, 10 Jul 2026 00:13:27 +0200
Message-ID: <20260709221331.989109-1-morf3089@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The TAS2557 is a mono Class-D smart amplifier with an on-chip DSP for
speaker protection, controlled over I2C with audio carried over
I2S/TDM. The DSP requires a board-specific firmware image generated
with TI's PurePath Console tuning tools; without it the device passes
no audio.

Patch 1 adds the devicetree binding. Patch 2 adds the ASoC codec
driver: mono and dual-device stereo operation, per-device ti,channel
tuning, and fault-interrupt recovery that reloads the firmware
configuration on clock loss, over-current, brownout or
over-temperature.

Tested in mono configuration on Xiaomi Mi A2 (SDM660, jasmine),
Xiaomi Redmi Note 6 Pro (SDM636, tulip) and Xiaomi Redmi 5 Plus
(MSM8953, vince), driving the top speaker, and in dual-device stereo
configuration on Xiaomi Mi Pad 4 (SDM660, clover).

Based on v7.2-rc1.

Gianluca Boiano (2):
  dt-bindings: sound: add Texas Instruments TAS2557
  ASoC: codecs: add TAS2557 mono smart amplifier driver

 .../devicetree/bindings/sound/ti,tas2557.yaml |  123 +
 MAINTAINERS                                   |    1 +
 sound/soc/codecs/Kconfig                      |   11 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/codecs/tas2557.c                    | 2476 +++++++++++++++++
 sound/soc/codecs/tas2557.h                    |  218 ++
 6 files changed, 2831 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/ti,tas2557.yaml
 create mode 100644 sound/soc/codecs/tas2557.c
 create mode 100644 sound/soc/codecs/tas2557.h


base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
-- 
2.55.0

