Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B985175A9C
	for <linux-sound@vger.kernel.org>; Wed,  2 Sep 2026 07:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788335758; cv=none; b=qwg2A4L39IFKK/j8SM6TTSFRsdsViVal5Q3QiFh4xChMux+EVFxOVQJrSwPxySnytXl+gRTIo+tCg6lYVHKcBhui7qNnT/BRWnFBFnty/zAK7tLqgjDSSsBzHkoC/46MHWWC+eaRMDDFjg3jbVywcdM4S695yoo6Pq6OHwgXPJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788335758; c=relaxed/simple;
	bh=qb/sBb3TGFcj5tghkHn19gWaiOcGuMKIwXh2UNhmTe0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZH4RNe8IBMHkG6LDMkqnPjqXjqpjr6EOJwZuQ61x4v7xR2gSt5pGTJdbwxaGUa9ggAXzbl3YwFuoLytfCPzpvbnUxbf2xhlAf7dOPw1hBuXDZsMB/fYM5vmo5P0QJjtgJbhFTja8OorKt0sHWIN290jvTNXCJepujK1VXVggPHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DVTBz1Qv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DVTBz1Qv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19B451F000E9;
	Wed,  2 Sep 2026 07:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788335757;
	bh=gsjXAgn7PUpUOF0wMC+GyvU72fd1fz8F99t2f3n8XpY=;
	h=From:Subject:Date:To:Cc;
	b=DVTBz1QvFFozrSWvQ0BcRQPCGKY/oUBBkBkCnQ+e4oDD9JHLyM4B1XoNkfCkekE5n
	 cV0KtsnsRDu10Bz85qMA6E4xJm4V+thEHf3pkYVKfhs+4bKJg8YrsDJTkl4wC7BkkN
	 w1n26MNiwOvPagicYVbKYJAHdEr1MaEsFYdCtgOsHLCNT9wl8BUESvnlIRZdgylcP9
	 YHks3siwjQVgarSTKQV6sKTeSkKMGc2iXh6LYgcMus+fEyUjDdTwJI9sC7VB7zQiJz
	 L9ioRu5VW2edrc89f/8QLD7d6aQWAQH63Gn6Gc053eI7kGQQJdrzVnsXOgDJhGmohe
	 2VbRJ4MJcLh/w==
From: Linus Walleij <linusw@kernel.org>
Subject: [PATCH v2 0/9] ASoC: ux500: Fix MSP lifecycle, clocking and
 resources
Date: Wed, 02 Sep 2026 09:55:50 +0200
Message-Id: <20260902-ux500-msp-fixes-v2-0-4b60b002d55a@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2WNwQ6CMBBEf4Xs2TVtaQU8+R+GQ6ELNColXSUYw
 r9b8ejxzeTNrMAUPTGcsxUizZ59GBOoQwbtYMee0LvEoIQ6iVIZfC1GCHzwhJ1fiNGUTufaVo1
 tc0jWFGkvknStEw+enyG+94NZftPfViXU39YsUaCzUuuic1VXNJcbxZHuxxB7qLdt+wApu8Sjr
 wAAAA==
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
Changes in v2:
- Rebased on v7.3-rc1
- Link to v1: https://lore.kernel.org/r/20260902-ux500-msp-fixes-v1-0-da1447fd9f7b@kernel.org

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
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260825-ux500-msp-fixes-58d434a9bac3

Best regards,
-- 
Linus Walleij <linusw@kernel.org>

