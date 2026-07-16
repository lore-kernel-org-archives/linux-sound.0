Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E846435E1AA
	for <linux-sound@vger.kernel.org>; Thu, 16 Jul 2026 09:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784192931; cv=none; b=RmwVdMGDaKfiR0NtQMo0MZIToqpDnHHXg3qFZuTMTCoCMwE1RAfSH0d42sGXcDS5Tp+yRatBPdGPCZEFHZkD0Vcb/DOgHjkmjW0DfiA36pqZN90265BkjKvmSCXE5MsgoBYkW9hpAh8qtyBUsgYpzKunZ7WkzU6W6kw0TpUTpCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784192931; c=relaxed/simple;
	bh=BGRxIGzV5F2amCG/5z64SRgI5hIKfJeXA3e3Pz1V9yQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OtC4M/LolJRSArEFFD8k0YwTdXlrk6KQIDY2i51nGgmRu7EILhZf/vlkqg5gzGXkOzajbG3ovgHqvPeA5SWYVBiBTdn0+LMu5Oa4PKdRV3Th+gSL92fBBaeCbDdISIcRiEaLdbwBnMbZqGV3HGI3ZlJtE3tkRTN0l7bDWJJB79Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QOT2DqDG; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QOT2DqDG"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8484f229529so2190431b3a.2
        for <linux-sound@vger.kernel.org>; Thu, 16 Jul 2026 02:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784192926; x=1784797726; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oLJXUpxY0UPS6/a7VhqudDZufGgCMV4Lpojx0iuFHFM=;
        b=QOT2DqDGb0ON/Kv7/v8Ht8h6BwMIe3mAgChFAt0o047LISvudnKH86S7pfFIbw+nx+
         7ImQHb6fj7BSxX9OKUoQ1RQTMXH4E3sCO50EpmiDJ2lSoQiq0MPuOxF2V/dQuOto4nt2
         FMJGojNGuq+IUiDldM2u4+s0bGVNhHJhnlFuZ+A7qFVIaRwjwF7CaLIT5TcCQCE8gHiF
         rkC3tG59gzXVtr68r5WZwVPWq8eocq4KmAmMbPrVXPrPLTw7VLbnHxXtz0B5c5zSKjxD
         gCztIG1kZ4kwCjGyWIOhvHzVceF+Cr9UDSFqKRTxcbguzUwMhLAq6UtP7O4puUoBt78D
         G7bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784192926; x=1784797726;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oLJXUpxY0UPS6/a7VhqudDZufGgCMV4Lpojx0iuFHFM=;
        b=UjmFGHcUuiLYr0gxAl669ntQ5rcL5gw1A1WGkg019jyUcNZbCKt0KTCU6dVudXYTHH
         kPZ0CwZ6F4C4C8PYyay79Q+HlLd4YynQWorCqUE5F/gcfp/kkllrJGyQynAzZg/nAopb
         H40AjcYvaFj70/ArgkloQmK7560t7kDQYHKnJQyWcgN0hzN8u7QHBe+H6UCtqMJGcnZ9
         IhHTGaD94/wAFITxWKNO9LS6oWbYr2dyeqyIqz/wzJCvPJOj3+8LXsNrynO4rTSHQadO
         NfGfc9iaZ4VJJE6fKzFLU+lN6E+/DUTTsJBhzF6vqxgcbzTQR/9kyaJkm8mQ41B8QaIO
         EKpA==
X-Forwarded-Encrypted: i=1; AHgh+RpnIyFvKB8OZZdCNyYVU5QeST6qzPADyzMT6AnxIEea1zTbaf9Tz2zJl6h1Yw2YEb8jXTwVZNnO2GqAKg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwNRejcvcybe2dA2aeHUjc+PJ/7bhQYGdGAUNtUwLANKT/EPQ6J
	iP3gvPOOWrsrWkme+FmvgW0pVfR7YC3ljX/JsgVvGWJSDL7hax7BB0IP
X-Gm-Gg: AfdE7cltjhZXFP3bhqK/F4WaXuSZo9B/+A+MEvvZ4GyDDMO3o3supZUyOBttvWnNiHR
	NQafB3aiUDU8o7A2quI8fu+parJnPyPCNn7v6E79NF8uxsgOehfmCmJSU+69j+MwMOx3Vi9go6A
	1Bv5TdPoeg0pMmEqLOigvGfFxTOE4+WT4lV33AsyozqIcLJF8tAny6EY1yWDttqYo38JHrOX+L3
	zE61VEvFxBf0678gWKjJGeJKDlH7dMwvOg+9DU5KbFAJgTVaf8QjATr6S656qq5xaR5ni7OjMuK
	WB6yXOmiuGXkd/ftlzQLBwk/Yakpo+OWd5/7ZyBPxrBwnfWipfpE2EGqc54IVbxWhDH9f2j5/qQ
	4ROBd4YAuGCVQkIz/Sx5MCB1sTy82lxZx2phUAjRgq5oR6bje7A3+N62a1JZnOk9EjlAlNv9hPl
	uZ4E4U+ab+LBCxP8eqaNfiupE8sM5tDcI6w6n4
X-Received: by 2002:a05:6a00:bb88:b0:845:2ff5:b66d with SMTP id d2e1a72fcca58-848897d3008mr19810146b3a.35.1784192926084;
        Thu, 16 Jul 2026 02:08:46 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f6bf5ecsm4511800b3a.29.2026.07.16.02.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 02:08:45 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Sen Wang <sen@ti.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jarkko Nikula <jarkko.nikula@bitmer.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-omap@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 00/10] ASoC: ti: Improve probe error handling
Date: Thu, 16 Jul 2026 16:08:19 +0700
Message-ID: <20260716090829.72082-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

This series cleans up probe error handling across several TI ASoC
drivers.

The changes fall into two categories:
 1.Replace dev_err() with dev_err_probe() when reporting probe
   failures. This preserves the original error code while suppressing
   unnecessary log messages for deferred probe errors.
 2.Preserve the original error codes returned by helper functions
   instead of converting them to -ENODEV, and remove redundant error
   messages where the helper already reports the failure.

Build-tested only.

Changes in v2:
 - Add missing parentheses to `snd_soc_register_card()` (Christophe).
 - Remove an extra blank line (Christophe).

Best regards,
Phuc

bui duc phuc (10):
  ASoC: ti: ams-delta: Use dev_err_probe() for error handling
  ASoC: ti: davinci-evm: Use dev_err_probe() for error handling
  ASoC: ti: j721e-evm: Return the original error from card name parsing
  ASoC: ti: omap-abe-twl6040: Preserve error code and drop redundant log
  ASoC: ti: omap-abe-twl6040: Use dev_err_probe() for error handling
  ASoC: ti: omap-dmic: Use dev_err_probe() for error handling
  ASoC: ti: omap-hdmi: Use dev_err_probe() for error handling
  ASoC: ti: omap-twl4030: Return the original error code
  ASoC: ti: omap-twl4030: Use dev_err_probe() for error handling
  ASoC: ti: rx51: Use dev_err_probe() for error handling

 sound/soc/ti/ams-delta.c        |  4 ++--
 sound/soc/ti/davinci-evm.c      |  3 +--
 sound/soc/ti/j721e-evm.c        |  7 +++----
 sound/soc/ti/omap-abe-twl6040.c | 15 ++++++---------
 sound/soc/ti/omap-dmic.c        |  7 +++----
 sound/soc/ti/omap-hdmi.c        |  6 ++----
 sound/soc/ti/omap-twl4030.c     | 15 ++++++---------
 sound/soc/ti/rx51.c             | 28 ++++++++++++----------------
 8 files changed, 35 insertions(+), 50 deletions(-)

-- 
2.43.0

