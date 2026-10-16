Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D51F63E3C53
	for <linux-sound@vger.kernel.org>; Fri, 16 Oct 2026 10:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792146857; cv=none; b=mwnXbzmr4MO6tFUbvUVifAUAGnCqXVqTJU1/sAFCtym3u2TGCaE8LLOELK0zfrSWGsdXUA65upogJGTO2RRzTAHvUoBKsd1T5iPnjQb5Tkmp12hbSnAeWrhZoSX8U7Lwx9uF2PAQerFjYlBNejT2kwAaekyWWZxIVpo6BOL4pdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792146857; c=relaxed/simple;
	bh=BnTr82S8w9wakAEeUEBfR1LlMbPBAs/IS0VPp87s/50=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=D+dSxGrVnt5nGFwOFIcuEyAt67MkKyCcUaM8qp+saAcQZBHSOLuA2KS/LoECA1PL/OSEMwSyTE5nsuhv3HzDLQyuhP6LQHsxbPh/TnfGv4In/45W2IokaSb+O3ltrohH/yQOsPZcsVm1ofhVv6PgCgpJABE9L5Ec2ARgn+s7iZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=QK1ahZAd; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="QK1ahZAd"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a02753c04fso33948055e9.3
        for <linux-sound@vger.kernel.org>; Fri, 16 Oct 2026 03:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1792146854; x=1792751654; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kIHJ0txQc8+sqtyNixhwGX7E5WSVvBAZuK9qukcWHcA=;
        b=QK1ahZAd4FUDQxSn6v1HSOGutEKOhjnbLoOOZdMRp2yj3NrwKZSxHCFPBZfkL2lqW/
         lNSDygSCQXbIQfaoYwicAYqr0mH5CbxbRE3bYkI4VZo9as4EE9jXtZbOZ+WRzuJcs9Uv
         7DXDgDQfqhp91+hWEntqil3Ui/srt8kMwPKrA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792146854; x=1792751654;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kIHJ0txQc8+sqtyNixhwGX7E5WSVvBAZuK9qukcWHcA=;
        b=SpHZcewZpXzO8sidvZz38Qp2Kc+T/9G+TJzKQhtxnzwJLMgcG/79QPooqz0CfzBEqJ
         RIO3ybOIJFN9zSBBRqp0MHW48WaskIvnPhbkfY5hqIgTbcc3Ls1CHp0yBPfyCf2chQXd
         a4ERumNwuFRA0sUBDpQIhewTBJRApfWWM/kccNbRNRnqU83i6fMSdSZVYaYM/VrMPCrZ
         G9k07RNPrxMTA1XaEO8o7d4E/AKjTQyGEFkEaYYKa0a5ujTI/9HKEwvP6H292Nc4wW4X
         19yuhP8noDf8i9TKH/y85MxDC/acoSnBIfpaVR21zNaN4JH2V0L/pY24P6z1QO89dEvj
         7bTQ==
X-Forwarded-Encrypted: i=1; AKwUvByZXX8z9XfgINiZ1sUG7ulGVg9w9G/iVtUPjaEiO+yZaC4ypLuPdPbrwaDN4ABS9U6t+Wqe39kM3UcEuQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYKcS8TpDisFubwhj/mibGY4f6z8zRcVRo2hwSsz5HQhEejSX/QD
	/6G8HWLLi9oVxtbmD9Vbw+olf3mMh6U64hOYyJvzANdpiH+ZZeiM8wTeJtj2hgRR3Bo=
X-Gm-Gg: AYBFou2s+5dtEPuEmQr/WPTYAbvy2SxJN+MlOkZ3wfh4HTxo6GevxxpN+4/3wPGkCCK
	x+zW0dI7u9kwHgfz9FYsMkik+Eyq2kED6QnlDHE6zLyE5b10y4hsPCEsEVQQEqf52du4xHcEzVf
	PmZd8qx6h7kQPCdKZhheVt3HD0LnHaAFiUKxQwp3Nbvklk5cWRUXAyQ79rUrtwMuSlmE2kOPXsN
	oez/GlqNPnM49NoJZr5eZnGXm5C+TESfPIeAtwN68PBKY53b4dErL9RMfCCBy76YX4O4NimYxcE
	9HKNI0rme4we3fYeVDjfe3SxlxZdMtPncLHq9V0lVfvi3pNzP18txi82a9yDmv3Aedbs5OvVf45
	g3963jQEIi/j1AxTWjZxK4Mo8TRVK1Tafzd3u2NYb0GJcwdpqWBnxsJrtNyhU4ayrRLp6yFvOUz
	wZdRZN+XSVomD8K0XQWpLi1nDWXZR7l3yu2WRIFJGUuWAP696M3vIhi4cDw0WsunABhtYXGOfxv
	j695fN/tz3DQpqJ8PKbhq/l//upaA95FcK+Z08ud327HJTIVirSCv4mXsgymXpLJA==
X-Received: by 2002:a05:600c:46cc:b0:4a0:8b1:f5c with SMTP id 5b1f17b1804b1-4a18e4b583fmr437610075e9.22.1792146854144;
        Fri, 16 Oct 2026 03:34:14 -0700 (PDT)
Received: from localhost (dynamic-2a00-1028-8382-0206-0000-0000-0000-0bc0.ipv6.o2.cz. [2a00:1028:8382:206::bc0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd471b06sm4783272f8f.5.2026.10.16.03.34.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 03:34:13 -0700 (PDT)
From: =?utf-8?q?Roman_Smr=C5=BE?= <roman@amarulasolutions.com>
Subject: [PATCH v2 0/5] ASoC: pcm179x: Add support for pcm1795 and pcm1796
Date: Fri, 16 Oct 2026 12:33:53 +0200
Message-Id: <20261016-work-v2-0-9340b9555fbb@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/12OTQ6CMBBGr0Jmbc20FTCuvIdhUepUqkBNB1BDu
 LsFdy5f8r6fGZiiJ4ZTNkOkybMPfQK1y8A2pr+R8NfEoFAVElGJV4gPUWLuFNYFquMBkvqM5Px
 7q7lUP+axvpMd1uxqNJ6HED/bziRX769ykgKFQ8p1bUutpTubzsSxNRzacUiveG9DB9WyLF/kR
 2KEtQAAAA==
X-Change-ID: 20261002-work-705f20b60284
To: Peter Rosin <peda@lysator.liu.se>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shenghao Ding <shenghao-ding@ti.com>, 
 Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
 Sen Wang <sen@ti.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, 
 Michael Trimarchi <michael@amarulasolutions.com>, 
 =?utf-8?q?Roman_Smr=C5=BE?= <roman@amarulasolutions.com>
X-Mailer: b4 0.16.0

This adds support for the PCM1795 and the PCM1796 to the pcm179x driver.

The PCM1795 is register compatible with the PCM1792A, but it encodes two
of the register 18 FMT[2:0] values differently, so the format encoding is
described with a per-codec table instead of the width switches. Only the
PCM1795 has real 32-bit formats; on the PCM1792A and the PCM1796 a 32-bit
container keeps the 24-bit code, as it always has. Left-justified, which
the driver accepted but never programmed, is added on the way.

This series is based on a work done in 2016 by my collegue:
https://lore.kernel.org/all/20160311232856.GC27257@panicking/

---
Changes in v2:
- Added missing entry to spi_ids.
- Added SND_SOC_POSSIBLE_DAIFMT_LEFT_J as supported format.
- Updated description of devicetree bindings commit.
- Link to v1: https://patch.msgid.link/20261002-work-v1-0-f0e53bc7331f@amarulasolutions.com

To: Peter Rosin <peda@lysator.liu.se>
To: Martin Povišer <povik+lin@cutebit.org>
To: Lars-Peter Clausen <lars@metafoo.de>
To: Nuno Sá <nuno.sa@analog.com>
To: Liam Girdwood <lgirdwood@gmail.com>
To: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Shenghao Ding <shenghao-ding@ti.com>
To: Kevin Lu <kevin-lu@ti.com>
To: Baojun Xu <baojun.xu@ti.com>
To: Sen Wang <sen@ti.com>
To: Jaroslav Kysela <perex@perex.cz>
To: Takashi Iwai <tiwai@suse.com>
Cc: asahi@lists.linux.dev
Cc: linux-sound@vger.kernel.org
Cc: patches@opensource.cirrus.com
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Michael Trimarchi (2):
      ASoC: dt-bindings: Add ti,pcm1795 and ti,pcm1796
      ASoC: pcm179x: Add support for pcm1975

Roman Smrž (3):
      ASoC: pcm179x: Refactor regmap value lookup
      ASoC: pcm179x: Add left-justified formats for pcm1792a
      ASoC: pcm179x: Add compatible string for pcm1796 and spi_ids entry

 .../devicetree/bindings/sound/trivial-codec.yaml   |   2 +
 sound/soc/codecs/pcm179x-i2c.c                     |   2 +
 sound/soc/codecs/pcm179x-spi.c                     |   4 +
 sound/soc/codecs/pcm179x.c                         | 117 +++++++++++++++------
 sound/soc/codecs/pcm179x.h                         |  12 ++-
 5 files changed, 104 insertions(+), 33 deletions(-)
---
base-commit: 2f2f7eeef8b0a1a9b9ca998231419873ccae8d4e
change-id: 20261002-work-705f20b60284

Best regards,
--  
Roman Smrž <roman@amarulasolutions.com>

