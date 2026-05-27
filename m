Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B677B3C3BED
	for <linux-sound@vger.kernel.org>; Wed, 27 May 2026 10:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779876143; cv=none; b=gC2RwDTuxBfsyP7gpQOFj3eSta0HbaNt3IY1D3t/ioDD/yZxAY5MjWPCDcUGzLnp151ncdynrWdQQ1EH7z853b7s3J5A6NGBjy3Cvz84vSVRCSqB/Jhjc1c/77TpL2GiA/XVlTqfWYWFoQrmFqiKACvoNYWo/QF76owDjiHdGRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779876143; c=relaxed/simple;
	bh=lycjylbjCgaIENFz5M2scbCTxzzceGJtSv5HuJuCA9A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kF5lozhCq+Pavi1B68XuwB6iywu9ys0mhBy/ynfBrqjpF/Fr5/suDrXe1Q8Y5al9O1vJptJK48tVaRjYwgcETjKhAq98t4BhNdgUroJ/ENZz6Qdw531Vcl5II57Gw5elO6h3U+KqdNGz0z8oux9YU/kdM3XcIUDUAwQpBxmQH0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n6D5dvro; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n6D5dvro"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-36af4b7840aso2036364a91.3
        for <linux-sound@vger.kernel.org>; Wed, 27 May 2026 03:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779876141; x=1780480941; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EpbY/tvppVcXqclapKUcVTdAH5sbXKe0yk48md0o7Qw=;
        b=n6D5dvrokix89jYSa+1iAOL85PK6/UChRZc0NVsqM+n5/DXVvIerdGD17PbXNVFkHH
         AaMDyBcyRCsI9J2wfmiV7zwKVhvZMcA58EWcodxdMU4YSHVBo2VsszBmmremhTWvZyvO
         jqMEMmrjcIqhvd+4Ud3sYONxpltwdvybaxr5W3fL0P4LzjTj5xQqEhEVXWPw1CssDDkg
         iCK6xKLJuq18q73cXuBVJ7J8Lk3sf0wRA30RoZKcw/l1fhn2ea+VBpd+4h1lcE39sEkg
         lbQeDuVC3SU2x1AeUawtMLsuXGHgu/ErGSYnqmEYCtFUbHF6UjMJz560HWr47L+yn7It
         ansg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779876141; x=1780480941;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EpbY/tvppVcXqclapKUcVTdAH5sbXKe0yk48md0o7Qw=;
        b=bS3qHZaWLBAt/M57gSyY69KmEiny6lZRBnzJm3qHM6H0sbwp5MhDisTUsTV5DNkr2Q
         oyiFvlakYObft2K9+gST/8XWQTNpO0KvlQFNKBpOegrOxPO4U8QVVKxipCaEjhtWyXm3
         KGr/cjCzLwEkdw7JgV+RR4WK0EWLu1hOI/YZ3HPaooVc8ACHDR6ULF9UY6AsTzCA+XqK
         V6mrzXXvMocF7pWEJT14ksS5cTAmaiNygSC544i1aX3FaU1DLM2vK/oidxCTKvgyIVGg
         /DdQycwP2sYJChRhVdYbx2pW39bSDg3IgcgS6vFI/pe8usphJjllQeUj5wsxOwz/uRap
         94FA==
X-Forwarded-Encrypted: i=1; AFNElJ9mS73CaNEq1Ymnx+XzUa/xf1EVImCaGNfCILm9+qfAZQgtwDdA0Q3e1j5VZh+zK1i6OD7ZWRCFV/QDhg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzmb6iz2ckMAFHSxPkMFYSMfSPM244jlAtlMtbbQ6IHebu9QK4r
	ecDGrtvVikYsDw2nA0eiCEQHL1w8W12weI+GMvF4+Kb35qDpf9RChwOb
X-Gm-Gg: Acq92OHZRfFNOPSyhvkmnHiQqjJ+ojsI5X5XGc4aRE9/cMoiwCp72n+c1BFWnIjj2Yk
	yL5BlTgPYuhdSqDXBr4vcSy2VjwwMQULHAJF+y5mrIUhHg5KjFXaSe89cjzwiKuZ/thPI9P5AsQ
	QApJ697vRqg8u6+iEdxhHzXVYKpEzLdgXKE+7F3V6If+NFhDP9phu91G3AyXgbolPIOhZcanE+t
	kqnUaqJ/IBES0yffnR9mFAZAD5sIlASbNPUfLzfX8FlFBqN6KcrxP7sGLXq2jbnrhpOfJ+VzaHE
	jGuBT06nYqxECJaSP/SAbTd+RFgdAwmImYHI4ndlcCL6hMQPcFO3a9aAQpakAin8qUdFzF9c9Dz
	/rA+TvI5MsuSVZ/y17aiY3qnm/wJX/jptjRxl75sf8aRcL0xljRtbvDpGqH7TN6WSL67k1VMr/a
	xIQjNpWWrJrL05INbfeKA1+i+e6bIS+Nwh2bZl/4tSjq69W4uS1TDZLHbHaN79USlkGzPIVktoF
	YEmt/Y=
X-Received: by 2002:a17:90b:38ca:b0:36a:5d1f:7ac with SMTP id 98e67ed59e1d1-36a67403a71mr22354310a91.3.1779876140935;
        Wed, 27 May 2026 03:02:20 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85202902b1sm12205631a12.6.2026.05.27.03.02.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 03:02:20 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 0/2] ASoC: sti: Use guard() for mutex & spin locks
Date: Wed, 27 May 2026 17:02:04 +0700
Message-ID: <20260527100206.26788-1-phucduc.bui@gmail.com>
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

This series converts mutex and spinlock handling in the STI drivers
to use guard() helpers.
The changes are code cleanup only and should have no functional impact.
Compile tested only.

Best regards,
Phuc

bui duc phuc (2):
  ASoC: sti: uniperif_reader: Use guard() for spin locks
  ASoC: sti: uniperif_player: Use guard() for mutex & spin locks

 sound/soc/sti/uniperif_player.c | 73 ++++++++++++++-------------------
 sound/soc/sti/uniperif_reader.c | 20 ++++-----
 2 files changed, 38 insertions(+), 55 deletions(-)

-- 
2.43.0

