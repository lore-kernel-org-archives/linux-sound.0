Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B803DA5CF
	for <linux-sound@vger.kernel.org>; Mon, 15 Jun 2026 09:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781516364; cv=none; b=Pbkpel4ZXzUe10a9v4yuf2VzPky+sVF0VcVZin/GXg34ka95m3WrPoQhkRrB2myilF1RQcyGyiKJWHlr80Tua1WqyFflx1Srgz+xuhhCixIfJ1hR9hcKNHzPj+xGl749HfFvBAOdCrQr4fsZYYYO3pCA0ReBEqPyH08CyEiaS2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781516364; c=relaxed/simple;
	bh=bSrLQmcCJB7fAevtWnTYtSpgVj3mkq7+M4acVTFsHO4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SuCsEKdTVonU5Q382I3omH8VI1zluyDg9vL05NbpQJw9VkQgcYbye8fe3X9KsedgpYKTZzoKv0phe47e3UGlZrZFy04fGSaCAmlcYfUkHLK9qEIpXZJuSA48Ek0EI7CD3gnWtcb62br9AWA1DX/n+SwYCxBS39s213XbS22OgHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ct0QvzMk; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ct0QvzMk"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-36b9033d230so1698678a91.1
        for <linux-sound@vger.kernel.org>; Mon, 15 Jun 2026 02:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781516363; x=1782121163; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v8RfSoNGjMJMgs5qfUtbdb1xy6XGXw4boE+GRcRxWog=;
        b=Ct0QvzMk40QMFveufaKmN0SHc4h4VU089YnRe8LrVDwgFlGJA+wp2tTvQf25bYE4Os
         oQS/TAbzrTzr8fE7C0YcKDpOc0ZUYR4Frv8gle0tRhcngTPM7TFAfAl90ZXlOwKwQTRN
         hiK2IQd1A2OtIh/4aVHLX/de/lzn8uJn16NrYxywTbKzy5eWOvssnzFU/Eu5mnIaOTT3
         A6v9/vlH/erkT19fkoxGMXq9Bt3PSY0UkBeoTHfR2q0vbiRcf3BDGlvwIdiHDc3WK4Lx
         vGtX1CSZf9uSZiViq70WlFO98iA0Z4ymiQoM1Znw4FhuiCsConbSf1XZTxR0IrPI8QYT
         iZew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781516363; x=1782121163;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v8RfSoNGjMJMgs5qfUtbdb1xy6XGXw4boE+GRcRxWog=;
        b=JzucSYZ7VnF57NY3pC6G0bGhoojZvCyZwRC6F+8TeP1cgx00da7DRz7vE1hHMAWLLn
         7gOJJPnFMTC1LfCRx/2P68jVwZxNv13sPKVZ6vfmVcTmn03ZhmSDzupGN7SKHrTPCiF2
         Upt6oroXheizZluOq9Z4xTGuYKb7OeOiCq0tIxiZfu4bHK2wYcc/y+ZvxXBUc5VGEri8
         w5fQuGllnclxRbPFVrs7WkACwal/CPV6FYlpYxdDqtlmOsjIOiGcttvpMcL54xpEWaQB
         CN++rPjHC5o3SWY6r3hbFKITXVaUPtvjXJZgGg/H5D0Fd+6+8XK3U8cEcif8C8qVjAQw
         CZ8Q==
X-Forwarded-Encrypted: i=1; AFNElJ9Vez4nIFoG0FJY+0Q66TvZb9JVqnDclovA3lE9KdUyJhGUZRAEYocI5h7GwYwjibQxf1L+lZVhhnKXug==@vger.kernel.org
X-Gm-Message-State: AOJu0YyAZw01GnO2mjj+gFDgDUJWEQzo3XYoxavxRpB8aMw9RFS7anM4
	IjrosKDQGU2tX1R0i315zEc7DDU64ogGRVwQcgS3g8zDF1jcw+aBYzv6
X-Gm-Gg: Acq92OGFmGy8KbuLd1OOk4jP9hLnftRTljOmYmXu9K3YOiXhsNrV3Deb8VjvctahK7r
	mWbcbYdFC1o2Bv5TOI9xLrZtVvvdABnedqm6Fi3VP6qRKDRyFswKPwB7Q1jTFwB+fA4cfq1Q5Xu
	++tYVA3pc8wrygaYxRijBY1ocMNEdHR3VqWHL5VgkLkyxXTZUaWY31/Su47i3gixyEJ367pTHM6
	qqGKKHbZP6GaZza9sdeHgv+I6cu2yxmBE6tfOJXFH3YHdg2sxC/7yPicM8uzMJP43A7rGXYYzfx
	/UX9+Au0zoiAIdQLXmbSEYQj6Xxebz41z85NhJw24iThg0IbrMDFDqvbsxVLEWambFkTpkVUJ0T
	Bo78mDTFRKg+4J7HBWZzZqrO1yvYj6t3DHiuE9gsFGcpWBq6m6dIimPkr69p3WM2ol9/V9DmYb2
	HkygoP0gVzw/hWVnjubYo/6T//aGDcspvDOaH0oGyOZCnYaxIW5LbA5lpX8iS6WbsX5Hpf
X-Received: by 2002:a17:90b:3e8e:b0:369:74b3:a103 with SMTP id 98e67ed59e1d1-379edacfef0mr11864728a91.8.1781516362913;
        Mon, 15 Jun 2026 02:39:22 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a1eba8e9asm9936290a91.2.2026.06.15.02.39.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 02:39:22 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 00/11] ASoC: fsl: Use guard() for mutex & spin locks
Date: Mon, 15 Jun 2026 16:38:13 +0700
Message-ID: <20260615093824.115751-1-phucduc.bui@gmail.com>
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

This series converts mutex and spinlock handling in the FSL sound drivers
to use guard() helpers.
The changes are code cleanup only and should have no functional impact.

Compile tested only.

Changes in v2:
 - mpc5200_psc_ac97: Fix scoped_guard() usage by replacing
   scoped_guard(mutex_lock, ...) with scoped_guard(mutex, ...).
 - Added compile testing for mpc5200_dma and mpc5200_psc_ac97,
   which were not compile-tested in v1.

Best regards,
Phuc


bui duc phuc (11):
  ASoC: fsl_asrc: Use guard() for spin locks
  ASoC: fsl_audmix: Use guard() for spin locks
  ASoC: fsl_easrc: Use guard() for spin locks
  ASoC: fsl_esai: Use guard() for spin locks
  ASoC: fsl_spdif: Use guard() for spin locks
  ASoC: fsl_ssi: Use guard() for mutex locks
  ASoC: fsl_xcvr: Use guard() for spin locks
  ASoC: imx-audio-rpmsg: Use guard() for spin locks
  ASoC: fsl_rpmsg: Use guard() for mutex & spin locks
  ASoC: fsl: mpc5200_dma: Use guard() for spin locks
  ASoC: fsl: mpc5200_psc_ac97: Use guard() for mutex locks

 sound/soc/fsl/fsl_asrc.c         | 10 +----
 sound/soc/fsl/fsl_audmix.c       | 11 ++---
 sound/soc/fsl/fsl_easrc.c        | 36 +++++------------
 sound/soc/fsl/fsl_esai.c         | 16 +++-----
 sound/soc/fsl/fsl_spdif.c        |  8 +---
 sound/soc/fsl/fsl_ssi.c          | 13 ++----
 sound/soc/fsl/fsl_xcvr.c         | 29 ++++++--------
 sound/soc/fsl/imx-audio-rpmsg.c  | 25 ++++++------
 sound/soc/fsl/imx-pcm-rpmsg.c    | 69 ++++++++++++++------------------
 sound/soc/fsl/mpc5200_dma.c      | 56 +++++++++++++-------------
 sound/soc/fsl/mpc5200_psc_ac97.c | 34 ++++++----------
 11 files changed, 121 insertions(+), 186 deletions(-)

-- 
2.43.0

