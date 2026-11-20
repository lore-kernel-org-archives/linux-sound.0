Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795135465;
	b=Qlkf0sLdWbp7RdhNZzEjdOQeSxOeeczPl3Gz2vNKNc2pZ7FTcjm12wha20cM2cfukne3
	 9QqrPO5DiKCov9Tl2mAqc+eqkqF+EJRFyh5CetYRKncpqcayknb/zwNF1M4i6LI2oXhUs
	 kX7RVPAgjuOg+CNQ1Kxl/dyVcZJWfVmAzYBUjOR//yha680Ea2wdd8VleEERLFs1Ng3Gj
	 VQrj0eq3ohfesclrEMg12HBXrMdy9TdmPEqiNqPHb+AACPdwwJzAKaeZKnB9mKdDCSsjd
	 Q5J9DSL7zdZkRCdPK441kdP3XqY4A/D/Fn0ZRI4CazGW7jLTJaMOJ2xvrCO0l+5w/IA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795135465;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lq4xVgtNlmtEagdZAmjDen81yw3EXLE97jdOjgf12ho=;
	b=kCmk/4Ex4uL2domV7MrfpUKmBH5u/lVCsbmHOVNlS6/Yx/azS2rzkn8XAvpf8uKWqtXw
	 R2kdXjUFJZ4QYqKnomXkOmn2Sg9qGlAE0p7OvBwn3BErravvT0o5NNziu3cswm4xshcyq
	 9dBQVgEOqZ+hiqGnNsEUwu76JqE6MbWAaHAb6RuMXAXP6CInFXMECOeqdaqCappMlDABB
	 0X/odIR7HZ8+uortY6LlNSF0F8A+VxkEvP+32WseWmcykhU84qDlJOchCvAIT7w3aTS1U
	 AXby0sfbJdQpk98UjShkeZjnWJ9P9P8nwZ10oN9tyQGou3TvJ3vhLoKt4w5HvLmCTRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IRFlv3VN;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC7B606A325
	for <linux-sound@vger.kernel.org>; Fri, 20 Nov 2026 00:44:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBC7B606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IRFlv3VN
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so264915f8f.1
        for <linux-sound@vger.kernel.org>; Thu, 19 Nov 2026 16:44:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795135463; x=1795740263; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lq4xVgtNlmtEagdZAmjDen81yw3EXLE97jdOjgf12ho=;
        b=IRFlv3VNsJ1GzKjSCCB7rSjUtYgDKXWzZhfkSD3dJQiG4X9YmvRIAgxwKegRoqEf4c
         DPm9/TLjvO2VxHjeHj91AaKMhQoCj0kmRhRYaiR+46zSKr9qk0DZlqqSDTV5qXAlvaGY
         Oq0PTBJ8ZPz4q/QeeOgpU8C/7HbdXncslutjkH7MI+yPdKCzCf+OtZ9HYU789kIpbq/5
         v9NkbLCVirR5k930wDDy4oqZ4bubxOdAQ+6bJHeTJX7PZfXcQnWeUmdXs9NG9lc9BJ+I
         OughswD6Thx5e3VpkEXvj4WWC/zcYjFrnx9Qt8gAs8WMXrZJ46EAafW+FRsR+UjgfdC+
         DjUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795135463; x=1795740263;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lq4xVgtNlmtEagdZAmjDen81yw3EXLE97jdOjgf12ho=;
        b=DtbXgzvR4n+xbcRlybbouNJczNM/XaCoeckMhJ7mOOoaVJzx1AWU7lpZhTZ+BaFepX
         43TlaN1QUfCppGTLbpymZLUCzcqW4HLMpSBWpFixR4nQwfE8gevbCobTY5x4XcraufPH
         jf5GxL2JvCUv/7S2qCLo158u1e7Z4fb5rjkEde2cKGoIrgvu3saHRsxGA37+ntlD8kF3
         D8Cb4gKzyhToId0v4cj/2yp4gFwnKY36dkcr9GRPP+wwwBqCsZv7gYRFnnUZQ/RIdehG
         xMDNbOnZzJu0Kz4Lsot6ZjJDJ6usSqZVBX5msF1Df7c0zAgv+jzHUGsZnDpxj4YUtkb+
         sh2g==
X-Forwarded-Encrypted: i=1; AL+hErFZkXsG2/Fuam55eZlCcDV6DF0ROGEY8ltQTGijAbnxtTcYfiA5qthknRRsK2FHv2u4XO/d2X4T8bEY8A==@vger.kernel.org
X-Gm-Message-State: APuU4Z8C92W6rmTxnZijUr8PI3S1QhXG0l0Up6XH2/C/ht/TLwWJrrhD
	aS5R9+c47SLJPrPC9RReYi21skLyYopsJCJ152G6DCu1JA08v5I4dbP2
X-Gm-Gg: AZFdTZe+3Nzp+MjvxqsluaOftC8JvZ7wn81uKw+KbpngxTcb0D9N/mETqryPE/zNYVu
	rEJCvyLfertJtQNxmlEGxfNkfyk9t2xL0S+4l0C3P/RX2fhSzk2JEwPs64hW0KDJlCAl7i7iL7B
	/f4aTABWsFgRHXBJ1tjRr/PX+M4Ovkkjfz45wicvlCjCgNSIU5QOqnabHAP0Zvg5Qd6nH7zEDhu
	jZouSt1TaKPjcqe9VD8PeQbsARw0Fkp9llY2gs1dnpFh1Mm2wmnlonYLKFgYxryZNF42w/xTALE
	xwYAZmecnFjRbijjXo8c6hv1epsjkx+PKF0TDL1HP5WKuLgyGe93G3Q+hSO65jFZXRIl67BcllC
	CYt3MueWM8Wm/GYI1Prgpzcera4t59vslgIQEv6mVEBdR7Z+vcRh6pYyXqkND+6y6UoCchaUE64
	LqHCUiDnvGcYdzX3NouW75voC5G69wqv37i8mC/b1BdGxpNUI40gRvw5MjvhwJF5R3mrdVAGOko
	uvof71l2G4qZ2p8rDDxTcWvPco+oIbmqrncEPjN7P614iJUtsGN/f8GGZeFyVBNTsc7zZFmNbCS
	X9azcdE/ysJ3t90HS2SuWGAVoXL1WIEylWN4tQ==
X-Received: by 2002:a05:6000:250e:b0:492:7efe:3fc4 with SMTP id ffacd0b85a97d-4abb4b86685mr2252995f8f.21.1795135463090;
        Thu, 19 Nov 2026 16:44:23 -0800 (PST)
Received: from unknown.m0rf30.ray ([2a02:b027:10:5673:5f22:93eb:1bb8:839c])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4ab6a67f204sm2686669f8f.21.2026.11.19.16.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 16:44:22 -0800 (PST)
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
	Markus Elfring <Markus.Elfring@web.de>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/2] ASoC: codecs: add Texas Instruments TAS2557 smart amplifier driver
Date: Fri, 20 Nov 2026 01:43:22 +0100
Message-ID: <20261120004414.1686884-1-morf3089@gmail.com>
X-Mailer: git-send-email 2.56.1
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

The TAS2557 is a mono Class-D smart amplifier with an on-chip DSP for
speaker protection, controlled over I2C, with audio over I2S/TDM. The
DSP needs a firmware image tuned for the speaker; without it the chip
passes no audio.

Patch 1 adds the binding, patch 2 the driver. One node describes one
chip or a stereo pair on one bus, using the reg-array convention of
ti,tas2781.yaml: reg index 0 is DEV_A, index 1 is DEV_B.

v4 uses tas2781-comlib for register access, adds the firmware rate
constraint asked for in the v2 review, and addresses the v3 review
from Mark Brown, Krzysztof Kozlowski and Markus Elfring. The
ti,imon-slot-nos/ti,vmon-slot-nos properties are gone: the register
they were written to only holds the I-sense scale. I/V sense now stays
on while the amplifier plays, as in TI's driver. Details are in the
per-patch changelogs.

Testing: built against broonie/sound for-next with W=1, checkpatch
--strict and dt_binding_check clean. The v4 driver was run in mono on
a Xiaomi Redmi Note 6 Pro (SDM636, ASI2) on a 7.2-based kernel:
firmware load, playback, stream restarts without a program reload and
unbind/bind. Stereo pairs, TDM, DSP_A, ASI1 and suspend were not
tested with v4.

Link to v3: https://lore.kernel.org/linux-sound/20260717233402.414326-1-morf3089@gmail.com/
Link to v2: https://lore.kernel.org/linux-sound/20260711145722.188556-1-morf3089@gmail.com/
Link to v1: https://lore.kernel.org/linux-sound/20260709221331.989109-1-morf3089@gmail.com/

Gianluca Boiano (2):
  ASoC: dt-bindings: add Texas Instruments TAS2557
  ASoC: codecs: add TAS2557 mono smart amplifier driver

 .../devicetree/bindings/sound/ti,tas2557.yaml |  158 +
 MAINTAINERS                                   |    1 +
 sound/soc/codecs/Kconfig                      |   13 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/codecs/tas2557.c                    | 2973 +++++++++++++++++
 sound/soc/codecs/tas2557.h                    |  207 ++
 6 files changed, 3354 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/ti,tas2557.yaml
 create mode 100644 sound/soc/codecs/tas2557.c
 create mode 100644 sound/soc/codecs/tas2557.h


base-commit: cee03387d20bb267663085d9ac2622ff9263d302
-- 
2.56.1

