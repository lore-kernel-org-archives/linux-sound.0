Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792586773;
	b=Axl+rKfjC4NqlpVmsN6NUEKmmSQoiJFGNBbhsaC8CJhoy++Xo9VhcXKXWGU5WyDTG2Tc
	 fnIVseV293Ov1idx80cOpWPioIKrYAMAy3UAFTqzBlL6sTjadca3xGk1Hu4Cuj7UE0T07
	 37nzCymjZwFGvr8G/L+tJKaan4HAxY8CQbiKtmXQYQrhUlhr+oujOE3I5pc0XEJxB7qc1
	 Fdy1IvOSCZXU2D8nljFnmeduv+ImU5rhHXKfTPwgSBRtulAs+4bYvreQTYnfKrwrmH0Ia
	 u0z6BrH1ZRKn0NVp/yvHgBN+Mbgno/UXCVBa7PyxEYzrN/Sxx9JIHokkypd3l5VJ0hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792586773;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=8cMpNSZYfsYlTclwX1/iQuhdswpG+2A2KBsZGqDHCHs=;
	b=09mQ2pgArHM9bK0hDw04g6KAn2C+VBedB6+8MpqbgTJX8GQh7Hd454MKFTBIaNWcfnbX
	 giDll5xVSO0vhaom6dG5ecvl5WKjsUqF/BAn8F1eFoZ1obch3xTjFCH6tMs3ZfpaeffhN
	 aiFlmh3odXCq/EKxSK/mwbHJt8poNTdLEDWIOfDtkKGFhsQE1OzFOGDhgYt/aWc/VmdV+
	 o9a9qFKSz9hk46RGXhz/oSuvZ/Q84WFFlbzToiidmJIjZ8KJVOJ2K0ZlFXRTJglMMj5Bq
	 EuLc2nKalmKy2TABPzLDDgYdcb4YuThU2xryYd9kErBStQolMGTwypwmYLvn5hzD6Jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="EIx/1TgW";
	arc=none smtp.remote-ip=209.85.210.169
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F7D606A320
	for <linux-sound@vger.kernel.org>; Wed, 21 Oct 2026 12:46:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71F7D606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EIx/1TgW
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8a06ca6e8f4so478857b3a.1
        for <linux-sound@vger.kernel.org>; Wed, 21 Oct 2026 05:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792586773; x=1793191573; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8cMpNSZYfsYlTclwX1/iQuhdswpG+2A2KBsZGqDHCHs=;
        b=EIx/1TgWsYsaROjnyKXuouTFp4S8mdflZu7TaP9YW8yAOLNK3xbTWLdZmhhREtYNni
         Exw0YHH3zm67YD36bEN3+manSvXZo5rWjWbf+RT/PLVAsynpAvgrOk9UC2zxndSgkrCE
         OGNIjfKWv06jaZbUyk2+9Jk3IZTVHw95SUjZo7tnlSw29CEwez7lhqNckM0ZzQaoy8oZ
         pNMOBlup/IO/BOzlk37ZlBqfrsTkBFYgmB7g3WKs7/fjosPdVAZL84q+aFLWyJishlwf
         vZ0FQcaZXiFyvV27hju/Ecg9NgfXm7Tyxwpql5NpZFA/GJCZGRjK8SfXPzhLh0YDqdjC
         gZLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792586773; x=1793191573;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8cMpNSZYfsYlTclwX1/iQuhdswpG+2A2KBsZGqDHCHs=;
        b=G95BOLdflbIq5rnoXHthpBlMza2+2yLw4qp+Jsa1WmOKeD85oKi/HFqYCA6+7FiK0/
         hLsiwJdvoh5mNPf1Ropulmj5RAr6VAxSEzXVLiUQQ1x5cjesHBTo435GLxBgk/UdjHdB
         zL+Ct9oVlTRUtgzMUaLz6M35nZ9RtT7BoeJAxTa15jAP28+weJj+wNiJzcYMO1LWQnf+
         uHbPwIJ/MHvemBS5nhIfFXYvPbed3lVfFvrn83YW6tF9j7kiFalU2u4B2dpi8evgqgYk
         iYLGi1wSt+UitrUFhte48mXmj37fCp3oM5DqtlJxSY7TcK+pMMbMgOeoPW2+9OWtF4e0
         EwZQ==
X-Gm-Message-State: AFq9FYJgESWFRU65merhw5lM1d8tRSQGX3Ey/NDFvVOOod72crXsDuF3
	NeYsAGx7aG8XkW0hcRSHgwNZGs1Nq/bx/0Nlx5G+Oc47fxDSXj9X1zlK
X-Gm-Gg: AYBFou1nxz3/teasoeWc6mbe1qGpWAHhbGO6eEynSiwf7lH46Qt6enfxVX74Hn0EJez
	WjOwkdwcNGpNGU26qjWoIUJ6TYfUio9FgoeAPpBeGr3CUx2oYHopVQds8l8cun8F3czRfeVaxhv
	A38fsH69gm/LjwrKEQctUc6OV83ekUM61VYoEQjTuEJR3TTN0R5HFk0RcnX1+otXPQmtYQS8tPi
	10bqo/ccx5XydIxQoYqzfx4+JPDl8trpUWtAKvgwkWCtOcdk1vPkPlYzAJESQ7QKReeet7OjUaS
	HUUpZ9Y/q8YHB+uuAjMkfAzVCkOar4DRhMdDBGw4jS08nJp9lxHEbXeQeHu55es8Dp1QlF2Roqp
	EDFqJcqvnMjvoAJcBiqdgLuXTEXKXiC3rScURsPGKGZsahS9OsCYWWqgq7O5XsVLLCibyxEugTr
	/8+lvgxja2VFrXjogbi44+Y6n8x38EmlSFxEIwX+7PUu6zJj+/IbKMt0a5eVxVzHMeleZJUJneu
	BLj5772sm3EaoVQfrJfVjz8N0ScKgHelrWn2IUbUMUSUGhRJ9fs6ISsnN2H0y7mgPQ+4PINq+4f
	kQmiQNS9dBKJPZ0=
X-Received: by 2002:a05:6a00:ad82:b0:899:632a:9613 with SMTP id d2e1a72fcca58-8a089d2c36bmr1490501b3a.40.1792586772365;
        Wed, 21 Oct 2026 05:46:12 -0700 (PDT)
Received: from arch.localdomain (123202092053.ctinets.com. [123.202.92.53])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a08960fa88sm832964b3a.53.2026.10.21.05.46.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 05:46:11 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Heiko Stuebner <heiko@sntech.de>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jun Yan <jerrysteve1101@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH v2 0/2] ASoC: codecs: Add Everest ES7202 support
Date: Wed, 21 Oct 2026 20:45:46 +0800
Message-ID: <20261021124552.767218-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds support for the Everest ES7202, a 2-channel PDM
analog-to-digital converter controlled over I2C. Patch 1 adds the DT
bindings and patch 2 the ASoC codec driver.

The driver is based on the Rockchip BSP driver, reworked for mainline to
use regmap and devm_ helpers, probe the device ID, and report the actual
per-step PGA gain.

Changes in v2:
- Drop the hard-coded 30.75 dB PGA gain from the power-up sequence; the
  PGA keeps its power-on default and the capture volume controls apply
  the requested gain.
- Keep the PDM outputs muted until a capture stream starts, instead of
  unmuting at the end of the init sequence.
- Re-run the power-up sequence on resume before syncing the regmap cache.
- Handle the regulator_get_voltage() error return as an int.
- Drop the unnecessary of_match_ptr().
- Fix the copyright header.

Link to v1: https://lore.kernel.org/linux-sound/20261020143135.623897-1-jerrysteve1101@gmail.com

Jun Yan (2):
  dt-bindings: sound: add Everest ES7202
  ASoC: codecs: add support for Everest ES7202 PDM ADC

 .../bindings/sound/everest,es7202.yaml        |  56 +++
 sound/soc/codecs/Kconfig                      |  10 +
 sound/soc/codecs/Makefile                     |   2 +
 sound/soc/codecs/es7202.c                     | 367 ++++++++++++++++++
 sound/soc/codecs/es7202.h                     | 131 +++++++
 5 files changed, 566 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/everest,es7202.yaml
 create mode 100644 sound/soc/codecs/es7202.c
 create mode 100644 sound/soc/codecs/es7202.h

-- 
2.56.0

