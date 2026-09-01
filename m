Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB70C3D47A7
	for <linux-sound@vger.kernel.org>; Tue,  1 Sep 2026 22:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788302631; cv=none; b=tv/1iVnvlWf41qoQsLOMGU53eDQ7l5uYi1S4SrsRkcxlPbzbKsEENb8/Rp+03qc7PEWUY8V8ksUm2iYI30me9tFJGJ8VLwsdO1rofBsI4mVt1R4EQy8lU4NSXjmJ7XCjS6oEyxgTsn5RS8qYH3N8qDqWMhgo5L1AHf50iNIUxZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788302631; c=relaxed/simple;
	bh=OnkHwvL0Hhw5nwcYb/ksO4Q5esMWcF1JsgkvsrX7GYQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=K2BBkSySeH3s33oECo2Ch42495dyCAXBqPE2MrGEyYcCLKDpIW0xG8NP6k1UcUQLZXzdB/uk0UmhpU6RMq0B5rEX6LtR9V+ouehqRGmVt4NvNA/KrcPdQhtHXQvGUcHT+COsDnGZbKqOETsrvsv7QQTPoLqr3qBLnX7PqnhJ7Q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hxSX8n60; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hxSX8n60"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2085E1F000E9;
	Tue,  1 Sep 2026 22:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788302630;
	bh=vTJ2gpPGz9wngNtCoGYd7szMJsXO/NTt+bKcznpzwtc=;
	h=From:Subject:Date:To:Cc;
	b=hxSX8n60Rlg1jKLGFS5L+wIZ9a86R5QLdbNKxZkpAEBq4+KU/ws7f/R8V2jHaFrqF
	 xO4v0l9N9AwzXnfmAOyAZ60Z4ZHQRKji8dBFeTDXeL7SR78tFVxIDQxmD/zUMMEuuN
	 /8X/AGv0FxkAqa2Itv53rKdMnJMPVhQMuVcvfMNP7qAm0k563yq0gBzLGktkU4mo2k
	 WvT6QbmS42iZ/t0zpKmVn5tW+iV9IBRVq6iXF3OJLYcFCteAKx35qSi81nFMlnTxnD
	 GviHo2Jzx0EkMx4E9mzD17NrXjgeXoJwHP85zU4ldYc4xvBZYvZEf3hzLTCWCJpr8a
	 K7+Rk+wB6oO8w==
From: Linus Walleij <linusw@kernel.org>
Subject: [PATCH 0/9] ASoC: ux500: Fix MSP lifecycle, clocking and resources
Date: Wed, 02 Sep 2026 00:43:43 +0200
Message-Id: <20260902-ux500-msp-fixes-v1-0-da1447fd9f7b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3LQQqAIBBA0avErBswzaiuEi3MpppFJQ5FIN09a
 fn4/ARCkUmgLxJEuln4PDKqsgC/uWMl5DkbtNKNarXF67FK4S4BF35I0LZzbWrXTc4byFeI9Ic
 8DeP7fljyExNhAAAA
X-Change-ID: 20260825-ux500-msp-fixes-58d434a9bac3
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-sound@vger.kernel.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3

Repair independent correctness problems in the DB8500 multichannel
serial port driver. The series fixes duplex and repeated-prepare stream
ownership, error propagation, frame and divider programming, FIFO
watermarks, DAI validation, reset handling, and MMIO resource ownership.
It also removes obsolete PRCMU QoS calls which are unconditional stubs.

The register programming follows the DB8500 v2 reference manual. These
changes are independent of the later sound-card devicetree conversion.

Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
Linus Walleij (9):
      ASoC: ux500: Fix MSP stream lifecycle handling
      ASoC: ux500: Propagate MSP setup errors
      ASoC: ux500: Correct MSP frame and bit clock setup
      ASoC: ux500: Validate MSP DAI configuration
      ASoC: ux500: Deassert the MSP reset during probe
      ASoC: ux500: Request the MSP MMIO resource
      ASoC: ux500: Remove obsolete PRCMU QoS calls
      ASoC: ux500: Allow repeated MSP prepare calls
      ASoC: ux500: Program the MSP FIFO watermarks

 sound/soc/ux500/ux500_msp_dai.c | 189 ++++++++++++----------------
 sound/soc/ux500/ux500_msp_dai.h |  14 +--
 sound/soc/ux500/ux500_msp_i2s.c | 264 +++++++++++++++++++++++++++-------------
 sound/soc/ux500/ux500_msp_i2s.h |  12 +-
 4 files changed, 271 insertions(+), 208 deletions(-)
---
base-commit: 73ae59e975966d24e32926247ddb45a537ebe184
change-id: 20260825-ux500-msp-fixes-58d434a9bac3

Best regards,
-- 
Linus Walleij <linusw@kernel.org>

