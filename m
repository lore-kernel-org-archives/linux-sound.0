Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA351A2398;
	Thu, 16 Oct 2025 13:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760619855; cv=none; b=RHqDO4baaq1uQzEdMJ1q7X2bNM+1pL84KCkirp7pHtN53lTQKz2s6PBO6uM375PgMIzoQqjEsz3RjtB7cBKCH5/FyBuiElGbRpb7H4G6bNZxlAr7HJG7Ov5mRiiQic5hRrYoHEmhhQyfljek7A7acm0QT6WOBgStrovycKmtINg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760619855; c=relaxed/simple;
	bh=wXSJ8vAfRbg0Cxbpy/8fhVe9PDfk5GYN6dqCLBRsjeI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=tR+nCH5ai0TJtAMwNUYkMGhYoWFHljhsmUVSNYHFHUC1bBgOFTEIG9B+CNlbi+g8yKv2ibX5Abl2zzfpzAfO8BV4kFysOKVou/ISKQAzGrLQxTGY8CTxQt7aDrJsQjNSJ3eknzqUcGH8wRqsVrvJPW+7mPd4qJi++TXhWKvoIR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=L3YcXKFZ; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="L3YcXKFZ"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 8E0191A1428;
	Thu, 16 Oct 2025 13:04:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 565136062C;
	Thu, 16 Oct 2025 13:04:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6207A102F22FC;
	Thu, 16 Oct 2025 15:03:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760619849; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=n0bZV/YxdfuyhZ+9D9ALeORpVV6Z1ZAtqfLZkUaKoiE=;
	b=L3YcXKFZYt//X0LhtF5xpe8YI64HF/v0HiQIU6nlAwJ0EM9HFB2eYlrNlYBp2pVpnJm3gC
	U34WQlBC05Lxnr95SnQN4ZHKiewGajBzuhB3G/ERjVJy7gsQoc8ZCdgObhqr7DJSaTxwim
	6yAv5KVAAvI83JA/eLb0OnvD8Pf2ZvYnT2UqH43y4kzcQoptDksakVrTbwdip+WsMIH41M
	fHlI4ric3GbhoV1IDTbNnPgUkCFIKx2pH+OxyHNy8vGlS2ToFwwAUIP5pLyA3vGkPMZlJM
	r3mfPG4m6OJUW1hrVR+d/BocKNBFZmQVhFlTyyIXvrS0OAyq89V6D7AK2q+qow==
From: Herve Codina <herve.codina@bootlin.com>
To: David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Nikita Shubin <nikita.shubin@maquefel.me>,
	Axel Lin <axel.lin@ingics.com>,
	Brian Austin <brian.austin@cirrus.com>
Cc: linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Herve Codina <herve.codina@bootlin.com>
Subject: [PATCH 0/3] Add support for an external Master Clock in the Cirrus CS4271 codec
Date: Thu, 16 Oct 2025 15:03:36 +0200
Message-ID: <20251016130340.1442090-1-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

The Cirrus CS4271 codec can have its Master Clock provided by an
external clock when no crystal is used.

This series adds support for this external Master clock.

The first patch in the series is not related to the clock but fixes an
issue related to module loading and MODULE_DEVICE_TABLE() due to a
driver split between i2c part and spi part.

The next patch document the Master clock in the binding and the last
patch implement this clock handling in the existing driver.

Best regards,
Hervé

Herve Codina (3):
  ASoC: cs4271: Fix cs4271 I2C and SPI drivers automatic module loading
  ASoC: dt-bindings: cirrus,cs4271: Document mclk clock
  ASoC: cs4271: Add support for the external mclk

 .../bindings/sound/cirrus,cs4271.yaml         | 10 +++++
 sound/soc/codecs/cs4271-i2c.c                 |  6 +++
 sound/soc/codecs/cs4271-spi.c                 |  6 +++
 sound/soc/codecs/cs4271.c                     | 43 +++++++++++++------
 sound/soc/codecs/cs4271.h                     |  1 -
 5 files changed, 53 insertions(+), 13 deletions(-)

-- 
2.51.0

