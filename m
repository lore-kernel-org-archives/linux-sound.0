Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8044A3BA22E;
	Mon, 30 Mar 2026 10:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774865784; cv=none; b=uJf0tFa4fgei2PAQKlAeCZ9LIK8ZlNUAYo1QLw+P2tOAKNpoY9D2tTnkpHtzz8mVHdMHmYimiJznnoNRS3zWY4/v/3xF8bSVkGOxlPAnbF+xGHeFIUU36z6A2xwt2fgNyZPGv9PjxTn4nDdFr8F6Z60XKF+iEiDhJUENM3ZMExY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774865784; c=relaxed/simple;
	bh=XVaA58YR00VZ/8ZgNILvjnA8ILVF9O0EbY9bxCrPW78=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=rHGQW9yCBxMkOAFvPlLTVGXbyJ5IhxIiLTdMiaZhmEd2dn9rLJIEEoELxA6y6shppEzRMUE6lgE95Iv6xmHeTuLBthn3KiUD1wa3+oY/FxjzzyFxwNLYqd8mZYEwkVD+mC2IbxdttfAF9aPK3yDgilNP6pr39Cd8etT+39n4Gi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=PXog3ORw; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="PXog3ORw"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id C2BABC40683;
	Mon, 30 Mar 2026 10:16:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 85FA95FFA8;
	Mon, 30 Mar 2026 10:16:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9C321104507FB;
	Mon, 30 Mar 2026 12:16:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774865778; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=OmaaNGH6kWgk6vo0uEtus2Jv2VBl+BQVGOxRO91Lrx4=;
	b=PXog3ORwUZBI3LUsSIWJVfmRofPhfUS8a3/UMTDiLAor7QfYVAvaraKlpCYY8WlUBA+bYN
	55jU0S7aL0WNtrdO5j78hMGTsP+nzNKBOsbJTWPUs0zYblmhvFmatdR0pLfxRmMJda8oZB
	HIvquxYuCQ2KRp/cyYWpLdsR6ZkZ6/89PrcxLe9Oemu3fjOFj9Xs4haN2VMT8GECX/H5aT
	GFqk7cX/FfO+h6YKqGSjkGVxXRmoruXMA0HqVY4eXZdx33e69jGX1ZVCaTijZ9Nn/KHl+c
	LxoWNdLZWV6+egqBJGST9fIHnPX0Bkv3yVbQFB3mokqUKKKHm6Sv68pvejHWNw==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH 0/4] ASoC: Add support for GPIOs driven amplifiers
Date: Mon, 30 Mar 2026 12:16:04 +0200
Message-ID: <20260330101610.57942-1-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

On some embedded system boards, audio amplifiers are designed using
discrete components such as op-amp, several resistors and switches to
either adjust the gain (switching resistors) or fully switch the
audio signal path (mute and/or bypass features).

Those switches are usually driven by simple GPIOs.

This kind of amplifiers are not handled in ASoC and the fallback is to
let the user-space handle those GPIOs out of the ALSA world.

In order to have those kind of amplifiers fully integrated in the audio
stack, this series introduces the audio-gpio-amp to handle them.

This new ASoC component allows to have the amplifiers seen as ASoC
auxiliarty devices and so it allows to control them through audio mixer
controls.

Best regards,
Hervé

Herve Codina (4):
  of: Introduce of_property_read_s32_index()
  ASoC: dt-bindings: Add support for the GPIOs driven amplifier
  ASoC: codecs: Add support for the GPIOs driven amplifier
  MAINTAINERS: Add the ASoC gpio amplifier entry

 .../bindings/sound/audio-gpio-amp.yaml        | 309 +++++++
 MAINTAINERS                                   |   7 +
 include/linux/of.h                            |   7 +
 sound/soc/codecs/Kconfig                      |  12 +
 sound/soc/codecs/Makefile                     |   2 +
 sound/soc/codecs/audio-gpio-amp.c             | 765 ++++++++++++++++++
 6 files changed, 1102 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/audio-gpio-amp.yaml
 create mode 100644 sound/soc/codecs/audio-gpio-amp.c

-- 
2.53.0

