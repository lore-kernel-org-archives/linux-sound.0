Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31AA12DA76A
	for <linux-sound@vger.kernel.org>; Sat, 11 Jul 2026 14:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783781857; cv=none; b=JZV4f5sNjQ/aDJ7HhTEZPgFRBxf+aIfCFArcOHsgPAq0QPZHwybpT3xy8vpfJV7mDGOORXZfwSOwk+7mKsA1sx/Mrn1vTMmLu/+CXcSBRCW2wwdQj7j7FP/W/bo3qXTzbFBP71wdR0XeuqFUwhVrgvaMO21dJmkvHIo8MtMXCQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783781857; c=relaxed/simple;
	bh=WOZpH6ZzkiptQuYtsQ0HAkvuWu4GVUAox8tKUDQn1NE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LglkLBJu3e9In20oNxzzUrSUw2A5IP5+oSbkUWoOT/ndxSohaFIqQ+DYY3815hTymuALCB3sP5p6NLlGrcvyNswv09wZqV5JXBsgLrZSMx1fKV3guvZQLe2d/p9OmfaKKGuR7jnxcpcrVuBImB5KilXVxh71y9Yg4SPXIBX9VEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xu/RHE01; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xu/RHE01"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-47c2b362ee2so1696779f8f.1
        for <linux-sound@vger.kernel.org>; Sat, 11 Jul 2026 07:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783781854; x=1784386654; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=O6hhLi0AmyezWNZX2hXWDH4NM39lEvmgcD954JqZzXM=;
        b=Xu/RHE01oxlkCPkYuylwE6Xz/nbBRcM2mL34nv5DWsI+JWY8p92Rrzd55ldkNRYgdC
         3SrBtg5gHPITzH/P2T6tNKtB881GFiUe0cVlMueVvcmzYNIDBIpTlh8FbG/2E/+LyFcy
         J2XHOIDuPRAzm6TI8eur0hbGX+srFj66oWO/JuJoEizRIABHEzLUytDnmBOVOnTobzvB
         Ntd2bQaUbRMcMThSjpO2dJNgkNYQqHXheaFOl5BoR+uIqWX+JtEJDe94ifozUHPBc4wr
         JsvrZCEGj2WreygbfvTQTtyYLh0m+MSSPKrtirvUxuq/Czg+vhDprvlmQVNQTDmK7fLo
         GdQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783781854; x=1784386654;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O6hhLi0AmyezWNZX2hXWDH4NM39lEvmgcD954JqZzXM=;
        b=RXB1B9zH02DcXQht6pK67zuqpVYxxmxPU4ff5pOTkWdWfKEAxJEmwEZThl3vHL0j3C
         HDctQdCO45grJXVm7DjLZXd4QVfGDmju4vYgs454wW6pSfYwRt/Lfh/N7G31+HrkBH0u
         X/s+qSye6n8gKxIp7Vlykoh9WnfbjkTFFW4z7zXgodhc1eICfV/qNQ531smyTy8DLO+n
         7EvSpkZl4naUMUHappPGfKajnFzVYd8E9+xgZCp8Eu+4LD5oWXron05NOhepQ4qXb+zd
         u9NNstkW4MCGUCj2fTIYhPDwz+rMg3B6+6cBYWYofegRKR8480z5+DFsHxpNTD6RASuP
         J+Hg==
X-Forwarded-Encrypted: i=1; AHgh+RoktMtsIc5IalnHlB9zOk3OiHpDCyycaU0oWm4zN2+TutFMndrT4vHE2zH2HL7/FqW0UYkd1vlioK2cHA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzhtdEO1bBMnpkrHAvrZnbh+3fZo+wxSP2x+ETqp26hoyDJPAz+
	mjtjDA2QOeXZfCaTys0s6eAOMh/WVljMhqwL+ELP8tQPTOanJKjtTa+j
X-Gm-Gg: AfdE7cltHTESspw9QivEwZrPj9KNxrt5nj40Unlr8eJC0QKuHEHjr2glx3XR4cTNZUM
	78quRRLYS1+WWNe4PnYaCmBCVUqJxSXct6IzY007ZGGzfQkjowvDdVRQfH1Qy212p0soY8Jr9Nh
	cYeKAMxFH6EnuU7HS6ULCQHHeA1//qHf7uviP7g2rAV1+tmKHupPhdvCVC/L9QiBRXArbzbodGY
	vMvmHczvLDPdnvpH+T7YfigMJ/xzwYCblBkBM7T1Jw99XonH9+Ck9q1aAUqnMG1Su0nLk3ezijF
	VCGGcKVDFI0QITF8QvrhZLLCU+IWugzfbntMn9v+EdUOG2E8whN8iRx89jlg/L8t+RCPLQUgTgO
	yRnIr6bhoBLnRGmcPurBqeLKSL1tgBwshZ3ZVjC2lqresBY09B+J0PP6Y9Cv4JIJtD35BhGtjVD
	sqeuYrOktLf3nbvQvzo93mVf/o9BpU
X-Received: by 2002:a5d:64e4:0:b0:47d:f620:557a with SMTP id ffacd0b85a97d-47f2dca7e81mr2835354f8f.6.1783781854371;
        Sat, 11 Jul 2026 07:57:34 -0700 (PDT)
Received: from unknown.tail46804.ts.net ([2a02:b027:15:795f:9b40:189:2716:6c6b])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47aa039b126sm67213819f8f.24.2026.07.11.07.57.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 07:57:33 -0700 (PDT)
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
	"Wang, Sen" <sen@ti.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] ASoC: codecs: add Texas Instruments TAS2557 smart amplifier driver
Date: Sat, 11 Jul 2026 16:57:19 +0200
Message-ID: <20260711145722.188556-1-morf3089@gmail.com>
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

Changes in v2:
- add the four mandatory supplies (vbat/iovdd/avdd/dvdd) to the
  devicetree binding's "required" list (Wang Sen)
- propagate register-write failures out of hw_params() instead of
  only logging them (Wang Sen)
- return IRQ_NONE instead of IRQ_HANDLED from the fault interrupt
  handler when the device isn't in a state to have raised it, so
  shared-IRQ accounting stays correct (Mark Brown)
- re-apply cached runtime state (DAI format, sense enables, DAC gain,
  ASI slot offsets) after every device reset, including fault
  recovery, instead of letting a hardcoded startup sequence silently
  override set_dai_fmt()/the ISENSE/VSENSE mixer controls (Mark Brown)
- honour explicit snd_soc_dai_set_tdm_slot() configuration in
  hw_params, and restore TX (OFFSET2) slot offsets after reset
- wait for the asynchronous firmware load on first stream start
  instead of failing with -ENODEV
- make mute_stream direction-aware so capture-only IV-sense streams
  are unmuted and stopping playback no longer mutes a live capture
- corrected a comment implying the ASI2/GPIO5-8 wiring in
  tas2557_startup_data comes from a TI reference sequence; it does
  not (TI's own driver never touches ASI2)

Link to v1: https://lore.kernel.org/linux-sound/20260709221331.989109-1-morf3089@gmail.com/

Gianluca Boiano (2):
  dt-bindings: sound: add Texas Instruments TAS2557
  ASoC: codecs: add TAS2557 mono smart amplifier driver

 .../devicetree/bindings/sound/ti,tas2557.yaml |  127 +
 MAINTAINERS                                   |    1 +
 sound/soc/codecs/Kconfig                      |   11 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/codecs/tas2557.c                    | 2648 +++++++++++++++++
 sound/soc/codecs/tas2557.h                    |  218 ++
 6 files changed, 3007 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/ti,tas2557.yaml
 create mode 100644 sound/soc/codecs/tas2557.c
 create mode 100644 sound/soc/codecs/tas2557.h


base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
-- 
2.55.0

