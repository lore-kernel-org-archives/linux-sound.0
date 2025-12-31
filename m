Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B99D146D5A;
	Wed, 31 Dec 2025 20:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767211483; cv=none; b=Zas4KGSNT7smzFb14v5ISlijfMkl8uSLpiErLqaPJUXpmmFaQRoMAsx/ZCTsKtMpnF2j5KJbfDGgLkS9KYNvcxDvxsyM4X5SIpgX2PgfpESb2qBEE7/opy4O8HWQQuFZalQO7JZeAl5ybk0ZFvotHUURisnlLTjLErMVGCyrTHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767211483; c=relaxed/simple;
	bh=FSyROQNpaCOfetnqlkwUWQoitV2pHSuXe04Ok+SP2ho=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=uU5bTM9Ng5hh5y1RYlW8IhMU1I8T0xAhqrhV8D4NqrVKVThEtYnbDcTbAsbrzsqFrYQYdRAEuB8xAjgSip+Crv5RqHKawqQEobTenZTnXp6P8Hj2W0J66plFMiQidlEWcS1pfiIyysm1Rf+n45T4FMsS+kw82lmUMaw4fyT2xtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=C8lysLwv; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="C8lysLwv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1767211472;
	bh=FSyROQNpaCOfetnqlkwUWQoitV2pHSuXe04Ok+SP2ho=;
	h=From:Subject:Date:To:Cc:From;
	b=C8lysLwvMGktWm8cS18hkF/FvYbaL1zYSGW8A+/sY2VeoZR/j7HhU4/Zr3zsAGd0V
	 d2uC+6RgPS48cHTuLDM1HAUW9vQ8B+DUyOZacoI0SIOqYPw8SYX43Ifr7G45vbdIHa
	 jYKn8g6YdGdDjoSHem//V1Hsy6GqR9+tFLjF+lbjKQ9xrVC579mc5nuNG8lAtukfR9
	 M5RqsH4qGgvSdnp1OOoVr+RzbFcr09jLi8EO30xA/Q7DCBfWn3YFlpsQoKJKRgCc7R
	 rcpcyLjGmA1zi9cWuOyBUpBMfam9d2YFp2aFZm/W68M/rZwcuUq63b5VQ4LANcEoXU
	 dCOPpGrCia0ZA==
Received: from localhost (unknown [82.79.138.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 904A017E12A2;
	Wed, 31 Dec 2025 21:04:32 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: [PATCH 0/7] ASoC: nau8821: Fixes and driver cleanup
Date: Wed, 31 Dec 2025 22:04:14 +0200
Message-Id: <20251231-nau8821-cleanup-v1-0-6b0b76cbbb64@collabora.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL6BVWkC/x3MQQqAIBBA0avErBvICUu6SrQwnWogLJQiCO+et
 HyL/19IHIUTDNULkW9JcoQCVVfgNhtWRvHFQA1pRa3CYC9jSKHb2YbrRGo6Tb335GYDpTojL/L
 8x3HK+QMVBPzYYQAAAA==
X-Change-ID: 20251231-nau8821-cleanup-206527dd2cb8
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Seven Lee <wtli@nuvoton.com>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3

This series provides several fixes and cleanup patches for the Nuvoton
NAU88L21 audio codec driver.

Testing and validation has been performed on Valve Steam Deck.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
Cristian Ciocaltea (7):
      ASoC: nau8821: Fixup nau8821_enable_jack_detect()
      ASoC: nau8821: Cancel delayed work on component remove
      ASoC: nau8821: Cancel pending work before suspend
      ASoC: nau8821: Drop superfluous return statement
      ASoC: nau8821: Simplify conditional in nau8821_get_osr()
      ASoC: nau8821: Drop unneeded braces in nau8821_hw_params()
      ASoC: nau8821: Sort #include directives

 sound/soc/codecs/nau8821.c | 48 +++++++++++++++++++++++++++++++++-------------
 sound/soc/codecs/nau8821.h |  1 +
 2 files changed, 36 insertions(+), 13 deletions(-)
---
base-commit: f8f9c1f4d0c7a64600e2ca312dec824a0bc2f1da
change-id: 20251231-nau8821-cleanup-206527dd2cb8

