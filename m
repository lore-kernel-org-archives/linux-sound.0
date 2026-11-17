Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794944340;
	b=nSAngZGB+QugPUwWhiKIPvGzk3F2A0LKheFH1IubgUetWVQs9W5ItEpWTvB3d7uLlM7Y
	 0w5LFl13Kqn3xLrePsuRk57eDT3nPFpe1RQMxFPeHA1QZOA1Fp81bJm0zpIJlA/QgSRg3
	 k1mcMc8z08memFUPWJpSCh6VWvQ7/vhLTA0ojoI0/eF9FEGXq6S8eL00k7AgyHc/pKGqc
	 TVdDf0uLrjptMlgA8sQPP7CoKs1YIKCE9ADAESVNsJ9Zu4ex1sAW52SwzE4ITTUw+5W95
	 3QTCQc1tgPl6SM0VLSCm9SvphZaytlsvVSiQsftgoJ5m22767/EYlpUhQHvA/6x+Raw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794944340;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=mCdB6Y2b1KlIUU0/RI1kPyC4zaNgqRo05w312NX8tBo=;
	b=DVb6ARbKSZ5yqg+WFMp74iEE5SnQynCoitvUbKkAVI0W0PlgYmctuRM10HOpQvx8EdEr
	 pDEgyav7LLl1fZ8MEay4PztMX//FIQ9voz+kZQWbxQIuNYJY+hmGk25VnquMCMdgN8YtG
	 j+qTA8pr3TmZXZCd7MQ5Oo7JbLWAILpbCAbdku1ViARCNXZ0o0Yk74wUc5+GF82R54nr9
	 mUjpH0sJP/PyGPcNe4cNd/WCeY64/892icgz/scMtv79B341v/G/RRqn7lDdiii9TlMYi
	 aJSYEuRbfSdiKyeMZYKKUSlHluKu1YZo7aNssJD/9gVNQUe402vkHx9lfNxW1BIG8dQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QubTfkMQ;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93306606A32F
	for <linux-sound@vger.kernel.org>; Tue, 17 Nov 2026 19:39:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93306606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QubTfkMQ
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-491846221ffso115787f8f.3
        for <linux-sound@vger.kernel.org>; Tue, 17 Nov 2026 11:39:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794944339; x=1795549139; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mCdB6Y2b1KlIUU0/RI1kPyC4zaNgqRo05w312NX8tBo=;
        b=QubTfkMQH+Ts0n7PGqp1tfezAFVn35HsdibP1yHdaShIti+vssRzeb7X3pVYVF3py+
         N+TBbj+V55oqnTdry0GwJJn81ooSWONI1H4OqaGzjbVRKQNvVwNadF2Kw8BFNYXjyjkg
         7A2OOy7g1wgh0ZIrLn/xljY8N126J8qBVJCgfw07L4yyljs2F80Jx0nA/+EXU22hUPvz
         0MPB4eTkinZFKUyAnwCQn5TG1P5udaz5AeQEDvub8iZYc+Yj1e9RfOoDnFe2+RoOGw2z
         kBySSvkQpUjLY+W/mH1PHjfnoTnXTNFZjTtcA7spK/+oGHCJU9JuT5UKcPWosDYI/uct
         2VFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794944339; x=1795549139;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mCdB6Y2b1KlIUU0/RI1kPyC4zaNgqRo05w312NX8tBo=;
        b=jzoSwJ0BZPQb9fsFMHotpGjE0Supg481fHQbMd9hpNTYRaM8N3cXECYTWz5OLOLaqB
         bmQsWjP9fmD6FVhf3Hb6CmEBH3mKyj2Q/2SVXUqvzOoaLxuzBnuPNxoQY4spkkTiUaUA
         OL7UaYDB3deSTh1qZslihCWBeI2KIaTUDJW19KehKBV7Y9FYX8YG4LuWEHmOC7JjyZob
         NBBz+/IKPWLaFFe9Dczf6gzB0R6VT4aaU+GghDk0DiOCt0XSO11NAafkziXdUSfSxbi8
         sGPmceFtARKSg0DXmKjDiLjEYDpN4V+192wFCyU3w56ERfGiDiOiDzeV5U5MOCLotjyZ
         8Jng==
X-Forwarded-Encrypted: i=1; AL+hErFCInD/pqUxfGp7TGx5huXsMcJPhj2IHrWqgc25zqAWbFLr/1uFqXid8iCd1oJlPcWhP0m7hXWP2mpTTQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9PF9XRJUoXABQknA3dJgPrVVAUTfbWdhu1uUWT+846gqTt0lH4
	n4zmdYTlDCRRYRpntVfQiH+AhE8jwN5jJho5K7mPgKDvQ5msZTA8AeW0
X-Gm-Gg: AZFdTZfJxVxC6izo3GmFgpeFblHawolEu+mvUCmtWU29rCb944a5s1an52nmYT2Aeqe
	3IdR/RBAo20HNUGSR+BR3Xhbqx2DL9BIcxxTrM8gZRVLPHySzC2sxUWsnj/pYkBqn0hrkyXU2FF
	Ias3WWA42PHZrAKLHUlkycHaP8PlqygKpOhpxJCPuYuk0tVLXoq5nOp+rLxU0MWWaEnGSn3smBu
	1dE2su1AM8qigFAuUiMo4qhLZcv+y83ZqOJ/aWS5HA01oISyPuEyjw0BW9hgXh5PqP2Vq1XdlvW
	ZgVqh1YPW2S0Y2CnbEZT4TEGpW99ZeL1yDbfCaiaARZa7maASlZZM21DQbX4LnL/5ojbhfDanK3
	uJXKVmrTQiYsjaKsTt3Ky1fyDwNpVhc4xQW1FgOE+7HrH2JjiLgpAfpHVlnFHX0ngQL/2zNpkF3
	ZGYgD93e8xAFXaShS2JmiJWOQlus4jb4a5yfsbDPa13jG0lGz2XgLR/UFFoRMZ6x7jFHMTpbZb1
	3WYUXj4j9jA3S9Q6xcAaGoDmkbm4OhW8VuEurS/hMVh57rDm+Hdo954PdfeEXB4OtYJGI5fXvlx
	biXMqHyQ5alDa4rzY4D9uswTXH6WniAA4+Kn/a7mq9kezN2U4Jtoo5gAzKQ8lqtSaaULlkPRaYo
	NpF/ahZjIyqwmTXMhlrCa2MiIJUcsDDDLLg==
X-Received: by 2002:a05:6000:178c:b0:490:9fe2:6a39 with SMTP id ffacd0b85a97d-4a6394756a8mr1002586f8f.20.1794944338756;
        Tue, 17 Nov 2026 11:38:58 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4a64b60940csm509521f8f.0.2026.11.17.11.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 11:38:57 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 0/2] ASoC: Add support for AN7581 PCM driver
Date: Tue, 17 Nov 2026 20:38:46 +0100
Message-ID: <20261117193851.235272-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
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

The Airoha AN7581 SoC provides a PCM interface for VoIP applications,
supporting playback and capture at sample rates of 8 kHz and 16 kHz.
The driver configures the PCM bit clock to 2.048 MHz and supports
8-bit and 16-bit samples, with up to 32 channels.

Add YAML and driver. This has been verified with loopback
and confirmed by Airoha with ZSI voice chip.

Changes v6:
- Better handle IRQ with IRQ_NONE
- Drop wrong DPCM values
- Add comments about CHBF_OFFSET
- Add comments for HW pointer reset
- Validate that slot fit in the BCLK
- Add INFO_BATCH
- Fix wrong define name for 2048KHz
- Drop unused header
- Select CONFIG_REGMAP_MMIO

Changes v5:
- Use local reset variable
- Fix validation for channel and bit mask
- Drop use of threaded IRQ
- Return if snd_pcm_hw_constraint_integer errors out

Changes v4:
- Add review by tag for DT patch
- Address shashiko bot comments
- Better protext tx pos
- Set DMA mask for coherent DMA
- Use more managed resource
- Increase users in startup

Changes v3:
- Out of RFC
- Add Documentation patch
- Drop SLIC testing code
- Add MAINTAINERS entry
- Follow normal pattern for commit title
- Improve commit description

Changes v2:
- Rentirely rework IRQ handling
- Fix problem for timeslow configuration
- Better support duplex mode
- Better handle descriptor tracking
- Move to Soc directory
- General code fixup and cleanup

Christian Marangi (2):
  ASoC: dt-bindings: airoha: Add AN7581 PCM controller
  ASoC: airoha: Add support for AN7581 PCM driver

 .../bindings/sound/airoha,an7581-pcm.yaml     |  52 +
 MAINTAINERS                                   |   7 +
 sound/soc/Kconfig                             |   1 +
 sound/soc/Makefile                            |   1 +
 sound/soc/airoha/Kconfig                      |  11 +
 sound/soc/airoha/Makefile                     |   3 +
 sound/soc/airoha/an7581-pcm.c                 | 931 ++++++++++++++++++
 7 files changed, 1006 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/airoha,an7581-pcm.yaml
 create mode 100644 sound/soc/airoha/Kconfig
 create mode 100644 sound/soc/airoha/Makefile
 create mode 100644 sound/soc/airoha/an7581-pcm.c

-- 
2.55.0

