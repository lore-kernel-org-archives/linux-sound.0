Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B5503914F0
	for <linux-sound@vger.kernel.org>; Wed, 13 May 2026 10:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778669030; cv=none; b=unGWrkqMFX5ZK/KGeFRbzGAcvMxGRg8zg5vcNqWsv/zO1Wja76oMivkxpU3JxMvxS4V0rsixQK2kmHZ4eyj3iA+zAEbJ02QBp18C4Z7FqkGTjFDjA4CVlWJ/8ctddAFAe/TPf5taUCOLwqz8usc4BtwMGltudTWMrxWzcd5zueY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778669030; c=relaxed/simple;
	bh=kB3RWgbwd9xyexyW1MJz1kljXrvPUbZsLXYIA8IMZXk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RsXBfSUk/4NgtQGUM+cEx559Q/i4VcplEAENyB200ea78MR1MwUqNlQi+E3yJpKQqGiF/Nvf5CP//0tiVGPqrEtLwq1vequKaZ3Zj6ymYvM4+nFUqdXZGfA78wdo9z2RAKySAtXEecQXQkPd/Ez8IaQq31Dcl8VsjunmzG8hjnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CrEKzKSH; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CrEKzKSH"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2b9fcf7c91bso66197245ad.0
        for <linux-sound@vger.kernel.org>; Wed, 13 May 2026 03:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778669028; x=1779273828; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WJhDTZ96rCLwuybfvMwu4DRpewl1qW7+n/gNAgLcqec=;
        b=CrEKzKSHTKKnlHHz4rHf6sLmUHyvZaJfY+cum32rzZ+qJE6MVLSQgmN+S/tweom7dz
         jTUBg3h+2XViFEjX+qzvZVlxFMBZJbedzjWREOwSO1FTMR+IHv6EqGu9MnTGozAzNa6b
         BxTyXldJ+/I3pmtsD0+ZtrzoiFrAFnXHfsitxkrBOds4FziZJ5eEJ3vKY6bHclMGZ+as
         rwD8kXC8Fe9lAld3GVoLoveSqeNtDBAOC2Ry7+t+cV+ebIegrkLccLMVTXAnCmtXG+Tj
         QngNpp37GGApiwyhPfzBB18I27BjqCiRgUmxy9MAiTTmsTEEbYGp/e3jzxo6WKOiaGbc
         GdNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778669028; x=1779273828;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WJhDTZ96rCLwuybfvMwu4DRpewl1qW7+n/gNAgLcqec=;
        b=XZEeG6trArwT0Rh2ZgpvHn7o7xXMypqCla5f/Y4GjOim8Nv8n+KX8iqW1HCp8vo9MM
         9fVq2H+dZpgpL3cZNSGUrxXt4jEL+/NR+72W06UJqcxpztkIf+Rb30UyWyD/KyMvENQg
         W9fJqturhogurf4C0akfhg31ww5Rx8SUnxSwCg0sucM0EuYj42v/GsaDqShOqCQ+y6Xj
         OgzaQGTq3mE692XDMaApx/m7Nwr7vgbT33FkQQrSpYCDHKVXeJ4ShFlKUJCyYgJHJYaa
         ej52NlG3mTfHlyQNz5BY0+YyMgw/fecW7SU6XosCb0fEBGWCGX4rslZpsOIRtIdvKZ21
         mhfw==
X-Forwarded-Encrypted: i=1; AFNElJ9jj3t52D91+OahvrS03sooTGrjlu+cMG58oGTvV8TXXOmAuVtxY+WtuvJXRsFgYtlc4IPSaLRofUkRFQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxfYdrHE09lxlpi54ph88akZNPgvtqVZBAcBnWGDxc27FV5Ujuc
	aat3S4B52Jns3/pFOn+0F0u0jDMKLMjyK05TsJnVawggdwRtr4YjAQ2E
X-Gm-Gg: Acq92OFsgsd/mJAw/qewn/to6mJCyflB7AZmTpg+a3ksytZt57KY3IkDlE534rJKFx0
	KjyThNbWm6bxxYvHBdBqgqBJY9Ui8TI2OqDiaH5YBnYM8omBjSOXUzNuoD1EnzMzTW+/OvK+av+
	YioZjCDhnLNyuD6T5nk6SQeI/cFQJreQ6FOPTeAWnaqXwacYQaw//11t4MEb7rk8HN9jm7Y0pDk
	UGMU1XSjRCMCfkhqNA5+u9bPQTExCxvJHUrx4asWDvkSlQF2WihN2bE5nFBehsrehxVdclEONzZ
	CdDzt17+SPgQ4uplVPb5/mFinPkv15cd9GttiFNWRyJFBS1zQN+nItAulpNEP8f6oo+5mtb9ItM
	8mjl3aiuHiDaSij4F+mvLQkscuCbGL+Oy2n5/4Df1ye0KUbz0vNthwP68K+70LgJAneok12euXn
	TZojAKrB05wCPrAc7ECZxeQPakzgtbSzdVoZ+RMTO8H7H6cFIgVL+mZVLRF70K/hBcLTQ9
X-Received: by 2002:a17:903:986:b0:2ba:6ca2:bd9 with SMTP id d9443c01a7336-2bd30640442mr23589835ad.41.1778669028312;
        Wed, 13 May 2026 03:43:48 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e35e9dsm170479535ad.39.2026.05.13.03.43.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 03:43:48 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Olivier Moysan <olivier.moysan@foss.st.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-sound@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 0/4] ASoC: stm: Use guard() for mutex & spin locks
Date: Wed, 13 May 2026 17:43:25 +0700
Message-ID: <20260513104329.81592-1-phucduc.bui@gmail.com>
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

This series converts mutex and spinlock handling in the STM drivers
to use guard() helpers.
The changes are code cleanup only and should have no functional impact.

Best regards,
Phuc

bui duc phuc (4):
  ASoC: stm: stm32_adfsdm: Use guard() for mutex locks
  ASoC: stm: stm32_i2s: Use guard() for spin locks
  ASoC: stm: stm32_sai_sub: Use guard() for mutex & spin locks
  ASoC: stm: stm32_spdifrx: Use guard() for spin locks

 sound/soc/stm/stm32_adfsdm.c  | 10 ++----
 sound/soc/stm/stm32_i2s.c     | 67 ++++++++++++++++-------------------
 sound/soc/stm/stm32_sai_sub.c | 29 ++++++---------
 sound/soc/stm/stm32_spdifrx.c | 44 +++++++++--------------
 4 files changed, 60 insertions(+), 90 deletions(-)

-- 
2.43.0

