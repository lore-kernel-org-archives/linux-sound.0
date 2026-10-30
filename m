Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793374926;
	b=HsoPZTnjd4TWHu9OAG2zvNry9YrLPBM9qPEZSyYlbZYXz/aOwJTCCJtHoviO27PsP7cI
	 EXbGagKXbTx7fj14vICBoE/4MYGkzGoGcL6L0xLzEIqdrYUAzbhoe4oIE+PuTWP/TKuEU
	 pm19owwk7B3T1oSnj2aZ9nxZMfOf3u8zMOeq9lJL4i3Diqt9cIYDKJ7zaJTes5g+3gazq
	 fJCsoobX7RroGJcnCzykUQnP1ImgxJ31H7YBuUDb14SLRnhhSjSQqsAK9Q+lf9jGmqLZW
	 JbPDZq4TYvIIM42SB93Xiih4GGkMax25mj/Dk08pG1VTsPuY88pOrnqDLFfsO2X2IyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793374926;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=POhY/41PhuxMSqZgcCWiywGbaYgiSE/QllHx5WvgqQU=;
	b=ANTfH7sqto19xo/NHHMUaq+OoQd9omQVQ5pNwpXBESYLKX6B756kINAe8jXEZ95mVouG
	 cerJN7VnzSnrpaTTvdj94TgtyKWmcuBpOqB3Cp0PGU3ew6QJHaHO8f21KoVTOmy/R+ipb
	 mrMRAMRu3Job24O34Z3i/5LrjWr7nXWEHyvJIYtlKRclj5JwyRniUzSq8CO3dGiwnrS8j
	 OSEIGVFCn98dIYc9d+QS6vV2ZCz2UsUcmTeaQiBLX2vrrE+udsqjcB4o2+cv9KgP/7UZP
	 ZQIP29L7pBTrAv75/3rCBj/19B8Vbox6/5YnciC5sL64tYVFhPr6IbZuJ9eEdJNr6LA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oofqVAc0;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A81E606A31C
	for <linux-sound@vger.kernel.org>; Fri, 30 Oct 2026 15:42:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A81E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oofqVAc0
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so6666615e9.0
        for <linux-sound@vger.kernel.org>; Fri, 30 Oct 2026 08:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793374924; x=1793979724; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=POhY/41PhuxMSqZgcCWiywGbaYgiSE/QllHx5WvgqQU=;
        b=oofqVAc0woCEGyx/cxu3pYBBvdASXJDrMlU84MQdGkKgQEA93GVn1ig0Csl1mcuKng
         EPXW1VNeDmvPkfIcHiphDp2Jb7SyHYgSZFo946rSAJa840pkP8icy6IyfnDoNxhC4Yg4
         /pnjenHd8fAj69qYTdOLmAuG3Xe2dJxUytQITsO6GUzbQx4o9X/TjifPLWrcvVD3lpeW
         ibjEEKcTi1Jos/choLtw5BkLwbYii+O1V/5lGxIKFkP1ppgaMccie8pWKKC2beMN4gJZ
         JZNxuf5FTv9dkw23HPKfK07hy68/P1bdgFcvLNp71wygj8yEuSNB7uxFf3cNc9UlDqNh
         R+Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793374924; x=1793979724;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=POhY/41PhuxMSqZgcCWiywGbaYgiSE/QllHx5WvgqQU=;
        b=xe6dnKuiyNIowKjTIb5/rMsjQ81Mc/noSH50wtaoboItf6lYeVSHfsTcTp841RKEx1
         O68dhZnbyds25HkWrNeRFNKxObjBObjFtK7kMPNrXGOzHoaG7Vc7ELWVoQFDIn5chP1L
         JiEqdaAHMvCi0dUtTlSCBzZPwV125pOVImFfhGQOUP1ChSZV6sD++vTKU/2QaZYgZ/8H
         WZao+xH3oxa76NZTu4olyuMGK34SEf/p7hxtRGFqob0IsPv4fkOfbJm6LpGBFEquCKvj
         XqgZ/nWdhkKeQfcxEWymMK6QC2L3VloIDN4L2r4jSGRNZIhyz9SiEo6iY0IqEKozYLpH
         xe5Q==
X-Forwarded-Encrypted: i=1; AKwUvBye6DYynv3od/v9miSMe0j6Jnc1J4e4eSKHtST68HRh9T+jEH9H2OTbGrKMP5xDsVDnxC5IW2lSd+8TlQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJGOLF881KjrBL2dAWfK6ljWMQeiNZk6rGxSA575OICuHasShQI
	nNa0oqpE2ELATPZGs1VJ7AGhUoBpoocMSgiZ5M0tBEeYNc3GmkPMDhI=
X-Gm-Gg: AYBFou0owJ4fW3EAWCh0zeWnLvOmUbUco2qhRUDfZMbyWdNUexLccRwcc3bnaA/Xtgz
	s3IgKl4+m6no6thrfqqdYQm60iQlXR+k/S89hJzYNtMaO8UKPIQW0jCyweh0hIaecSy9UYOG8cI
	p9jsjrR1STeEhuo5l5v6MVRGbj6BMJC+v+6dX46iblGOpM1DcF4/H9X3P9ra9pH/A1H4ROXV8T4
	EOArsj5zkV4R3R4TzFuqVYToCijCB4gsoy0lIbPGfU55Y8/5X6QGxCAqAn/M6o0dB+bKfinN4g4
	54LSjc/QU99RM1eoha1grtvWuz1+Ec0oh31TuiIJONg3FGUUHtHQRfe3BPtiaVvGq5Kaxgd1QOd
	PRR/B1MJE4UM12pOEFS1zGamdwmohBWEQBYPzvH+2lGQaoix8UexD2MP7H2ZuKJD2o4ipDTilU+
	Xma9iOq1fAHb00nh9/0QZnBD3b7Z4Pekhx0e2OSPfL7g6/gWp+678ffQtl1eMLYhA2mRF+VQYcq
	trHjZmR+g21wLi7eV0DAU8BWRQkSm9mTiqwN2Ux8zQxbYrKyHsyWFgjySONNdv+autAV8sgciOT
	iVCBPa+4aHM=
X-Received: by 2002:a05:600c:5249:b0:4a7:7f3f:6f8e with SMTP id 5b1f17b1804b1-4ac1228b5bfmr59543675e9.0.1793374924310;
        Fri, 30 Oct 2026 08:42:04 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa80f047bfsm144419935e9.3.2026.10.30.08.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 08:42:03 -0700 (PDT)
From: Tristan Madani <tristmd@gmail.com>
X-Google-Original-From: Tristan Madani <tristan@talencesecurity.com>
To: Mark Brown <broonie@kernel.org>
Cc: Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Bard Liao <bardliao@realtek.com>,
	Misael Lopez Cruz <misael.lopez@ti.com>,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH v3 0/4] ASoC: cancel pending delayed works on codec removal
Date: Fri, 30 Oct 2026 15:41:58 +0000
Message-ID: <20261030154202.2989936-1-tristan@talencesecurity.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Several ASoC codec drivers schedule delayed works for jack detection
and microphone polling but do not cancel them on component removal,
leaving handlers that can run against freed memory.

This series adds proper teardown ordering in four codec drivers:
rt5668, rt5659, twl6040, and wm8994.

Changes since v2:
  - rt5668 (1/4): also cancel jd_check_work (re-arms itself every
    500 jiffies while jack inserted). Disable IRQ before cancelling
    to prevent the handler from scheduling new work in the window
    between cancel and devm IRQ release.
  - rt5659 (2/4): no code change from v2.
  - twl6040 (3/4): swap ordering -- free_irq() first, then cancel
    residual work. Fixes the race where the handler fires between
    cancel and free_irq and re-arms the work.
  - wm8994 (4/4): no code change from v2.

Changes since v1:
  - Unified series per Mark Brown request.
  - rt5659: guard cancel with jack_detect_work_inited flag since
    INIT_DELAYED_WORK is conditional on jd_src, per Mark Brown.
  - wm8994: cancel mic_work before and after jackdet_bootstrap for
    cyclic re-arming through DAPM power-up chain.

Tristan Madani (4):
  ASoC: rt5668: cancel delayed works on component removal
  ASoC: rt5659: cancel jack_detect_work on component removal
  ASoC: twl6040: cancel headset jack work on component removal
  ASoC: wm8994: drain delayed works on remove and probe error

Tristan Madani (4):
  ASoC: rt5668: cancel delayed works on component removal
  ASoC: rt5659: cancel jack_detect_work on component removal
  ASoC: twl6040: cancel headset jack work on component removal
  ASoC: wm8994: drain delayed works on remove and probe error

 sound/soc/codecs/rt5659.c  | 20 +++++++++++++++++++-
 sound/soc/codecs/rt5659.h  |  3 +++
 sound/soc/codecs/rt5668.c  |  7 +++++++
 sound/soc/codecs/twl6040.c |  1 +
 sound/soc/codecs/wm8994.c  | 14 ++++++++++++++
 5 files changed, 44 insertions(+), 1 deletion(-)

-- 
2.47.3

