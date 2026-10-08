Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D809D3BD225
	for <linux-sound@vger.kernel.org>; Thu,  8 Oct 2026 08:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791447600; cv=none; b=bOeQjqIguSKVIVFDlCBW6lzxwkbSkedb9PdLIZu+MWYtguSFQejnwlretS3YM9O948t/Cgem4zD0nJSbLoToQA0FLWHoUwwjACrL1Z1RU9FBsA8PkGooaHhLia+iaFS1ICZwC3UdaEW/ucSH3YKNC6H1EiY5uU3f3ckGvz53ues=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791447600; c=relaxed/simple;
	bh=0zarvz5x3Nk8OyIrLjyRxUGuDWuyXiZCe2ZePYWBHuw=;
	h=From:To:Cc:Subject:Date:Message-Id; b=FKQ+Yz4WlojCSEAqwXhpWbqJtTp/W9bWoPPdeJVKFJXKM91VH8yhFAT5ihX9cEsD+LG0BouHZ2Dc7TCQCeSPFBM6GGQyMQCezijFZ24MYxU5woDAymjiojiG/em43HsQiSNDUuMpHl9cI0KuZsbCB2Zoh/KYb6IWNTf8fHLwbTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eomlYSQ0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eomlYSQ0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9218C1F000FF;
	Thu,  8 Oct 2026 08:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791447598;
	bh=BsvZFhaaw2FJn5OYj9chWaqMkSIvzRK4fs9/JiJiOvM=;
	h=From:To:Cc:Subject:Date;
	b=eomlYSQ0gklpPV0g46fSLEej16ma8xafegjEw6gxDY2ZS/+64eY0bicFu33db4G2C
	 xJz/nPeiXHqxZ78UCNrXXX4Mjnky8DYDjAnOG24I9tlBjLCZcGohDcHYFRGkPa4kAc
	 Dz2Jm0T3udiwDka/eZMgPe4OfV8dR6/8Qr21K0xFqXALuaIO4TQf02DHUVjFo28qKZ
	 oqIjSUm/HfkonNczxHaTouUeazM6L+As6ThDBHx9YpY/p3h7OHGuGQ9O/rNaz6p0xI
	 Vvv/odq3IY9k2nPZusr0Hp1AZnokRrjHsho3A1uXeihgEk8h3F+6J4Putnu2CTrZMd
	 +pMQbGbsSUjrw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id A2A6D1AC57CE; Thu, 08 Oct 2026 09:19:55 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v7.3-rc6
Date: Thu, 08 Oct 2026 10:19:42 +0200
Message-Id: <20261008081955.A2A6D1AC57CE@finisterre.sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

The following changes since commit a90ee4305c4a5df72c11b31dacfdc76e00fcf78a:

  Linux 7.3-rc6 (2026-10-04 13:45:25 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v7.3-rc6

for you to fetch changes up to 9ca0d0d0249230135dbf6fa1b9168e260151babc:

  ASoC: amd: acp: Add more ACP7.0 match entries for Cirrus Logic parts (2026-10-07 16:21:32 +0200)

----------------------------------------------------------------
ASoC: Fixes for v7.3

A fairly small collection of fixes and a few device quirks, nothing
especially remarkable unless you have the affected system.

----------------------------------------------------------------
Alvin Šipraga (2):
      ASoC: adau1372: allow sleepy powerdown GPIOs
      ASoC: adau1372: fix invalid default state of output ASRC and DAC muxes

Marek Szyprowski (1):
      ASoC: samsung: i2s: enable op_clk in probe to balance runtime PM

Mark Brown (2):
      ASoC: adau1372: two small bugfixes for the codec
      ASoC: cs35l56/57/62/63: Use the correct SoundWire DP for feedback

Michael Garland (1):
      ASoC: amd: yc: Add DMI quirk for Acer Aspire Go 15 (AG15-21P)

Richard Fitzgerald (2):
      ASoC: cs35l56: Add DAI for SDCA OT25 stream
      ASoC: sdw_utils: Switch CS35L56/57/62/63 to use OT25 DAI

Simon Trimmer (2):
      ASoC: amd: acp: Add DMI override for ASUS EXPERTBOOK AM7406CKA
      ASoC: amd: acp: Add more ACP7.0 match entries for Cirrus Logic parts

 include/sound/cs35l56.h                  |  1 +
 sound/soc/amd/acp-config.c               |  7 +++++
 sound/soc/amd/acp/amd-acp70-acpi-match.c | 35 +++++++++++++++++++++
 sound/soc/amd/yc/acp6x-mach.c            |  7 +++++
 sound/soc/codecs/adau1372.c              | 18 ++++++++---
 sound/soc/codecs/cs35l56-sdw.c           |  9 ++++--
 sound/soc/codecs/cs35l56.c               | 54 ++++++++++++++++++++++++++++++++
 sound/soc/samsung/i2s.c                  |  8 +++++
 sound/soc/sdw_utils/soc_sdw_utils.c      |  8 ++---
 9 files changed, 137 insertions(+), 10 deletions(-)
