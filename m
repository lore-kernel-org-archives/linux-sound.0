Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB92634A3D6
	for <linux-sound@vger.kernel.org>; Sat, 15 Aug 2026 11:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786793827; cv=none; b=Kop2cdQHaYA0v0IenBUsz1kk24sIwqs8tZlosfYCq5vDMAEm5I+YZMKxkow6TwRXKbOxc9g4JkicRYsJrLK0SgleAqfMU0unpyjLowOledxj6uX/fQO/8WwBJD2pprL7s6ihbWb9GRtalR081C/FGc23jeJCprMwwpYoIED/Ca4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786793827; c=relaxed/simple;
	bh=/VJLipGv8nlUPxYfsQLuyz1wBzZg22cvFblmc9q8ic8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GI2odTgaiZM0g3r8pt1c1MFDEb66l2bUMZVwR4zKphAUYMyexQ/38yh+sjuKT1cFeWPxSXSBMjHkvIsQIl0sYV7eGQhS7E6cpbvNyuNi9pVZBnJFui7wNY3mg0B+2wxfdedkLhC2Esqy/XRbenXx1SsMqZIaAnDFt2fMZLpNxOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CFVSeJfy; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CFVSeJfy"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-39c9a3acd40so12624531fa.3
        for <linux-sound@vger.kernel.org>; Sat, 15 Aug 2026 04:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786793824; x=1787398624; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NiCOoyX4djpKCHG46Y1EL3GRsEMSWw5y3wh2vdI3ZR8=;
        b=CFVSeJfypnAVhuS60xAa8wGAhJcqsJw0Dr5L8Fy6iQ3r0LQmqLCE0D3bCi/R07vlrm
         g63e9n4pq7Lp8N4Bv1kc4rWk5lrYXxtkU8koe9sfHUAtEtvLoD+eqNtSsJB7ZjMtXMUT
         LgRx4HSX4QqFXDSdgQ3DAzB5VEA8Pz4jOqlqCRPMHNckBmp6HrEvE3Gv5YuzGFHJ+MVU
         dWYcZGXFtUkFHL12o00mbLhBu9VZADIcIpoFIXOMLinn1GZpzQ2w5jUlV1UlVOMOL9xW
         hF2nJSphPcSPY8C4KftMetn5Pt6ITmlDB3PddCLTLPBCf1peOAf2IP2VTQaQndqteLSl
         RB2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786793824; x=1787398624;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NiCOoyX4djpKCHG46Y1EL3GRsEMSWw5y3wh2vdI3ZR8=;
        b=si3Mbv8DofqNb2zOFsNX95XEeZOYCH/siJq3ztQAxDFuOYnujCzcERMqgzdMgCT0Lq
         SRQQGEH4TSXEjHbcIVNWIaK1iiRfjPK+YT5OmTWmkvtspynWupQp4RuVOIk77FJ5fPdY
         HegwrK9wpcVJ+zz9axqKF6SsWQkB8FjOexi3/FafMBIW25snkAqXS7c+zrLwhdiN7Qsm
         jm1+Nx1BGTP5TYr9fl6H0QMXNrROlkkGcC7NsCz9lCGSagXkbjsDbqBd3g5crYlEjJYQ
         o4xmbBwWiAUQJd3hs1Q9ywFgIq1lVTZLUQ0z0qdHZi4/1Mz5E7olJytDeE88+g/npbNS
         Hn5g==
X-Forwarded-Encrypted: i=1; AHgh+RqZlHMWSIP8FBSrKnv4hOocw5SqlukIoKxahYJRO5ZTOI8Fz+c9oJnn+kwgZt02aTq2OJkXPFYlMyi7wg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyWOrVWdNh5riXp++/nKAutt9bi80yFuxLLqCsu+xypaWpAXGpu
	I/aYP6s28mludKFE5w2BkHOC91XLxbo9zQz11ArCavQFOUC6Ebkev6gs
X-Gm-Gg: AR+sD11EpJe8q6GlwZVHDOhD432cYUpb/RMRSZ3uBEFyav9BiJX0CeOUgIP1RPN7GzW
	gMz9XqEn6Ulp2rd9IiFKF7CRNxJRO3zAn6K4eaugJcPxbdAKGOluP7fNPX6T41YsZ30lvse3S0H
	pU0r1k1K1iA6a0p5vCMHFvgAeWXHfVuAm1Wi6dtvzX0WevtxV38LI43a6KEtmUFvESCaclQ98z2
	XczNxOMc1V6Kk9oDswL0c9zRT3KPcfzzb6NfbB5HEvaLmuE7ugVmc8+NB+GSxpX9VML5/v4f03s
	4k2JfuBm58U5JjMe26AMKQIFouUP6lg4TpHn2IXgTbOvTPb6yUaDPlXuz1uQMkQBO6q348b5dZG
	Pi7fLOl0rs2JNrG82Go5LtwrELlQHCepCBZelokP+I9ul5uI76coUynNOmoT2Mz9xiAkD8u9nr0
	7kx1d486RXkP1O8ys0A7IWmffftibkxuIufJ0z+z7Vqha7HKrzjlFI9bLbKlrNVv8/KcrNlsonZ
	P9sZt68ZMru97ADslUaYIc=
X-Received: by 2002:a05:651c:19a4:b0:39c:6d3a:2dd9 with SMTP id 38308e7fff4ca-3a132417828mr12998001fa.12.1786793823548;
        Sat, 15 Aug 2026 04:37:03 -0700 (PDT)
Received: from localhost (host-80-73-162-2.rev.as20985.net. [80.73.162.2])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b458beda8esm1070671e87.54.2026.08.15.04.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 04:37:03 -0700 (PDT)
From: Andrey Golovko <andrey.golovko@gmail.com>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: "Holalu Yogendra, Niranjan" <niranjan.hy@ti.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Antoine Monnet <antoine@montane.tech>,
 Robin Everaars <robineveraars@pm.me>,
 Ville Saarinen <wiza@saarinenkoti.fi>,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] ASoC: tas2783-sdw: fix the read-only Control handling
Date: Sat, 15 Aug 2026 14:40:00 +0300
Message-ID: <20260815112000.4180-1-andrey.golovko@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The 1/2 of v2 is in for-7.3 as 0c7aeb0f5ece, so this is the rest of it,
rebased on that, with one more patch in front.

Mark asked whether marking the read-only Controls volatile works for
multi-byte reads.  It does not, on its own.  Twenty of the Controls that
patch marks volatile are wider than one byte: nineteen of four - the
Latency of FU23, FU26 and FU127, XU22 0x06, SAPU29 0x05, PPU21 and PPU26
0x06, the 0x08 Control of IT21, IT26, IT28, IT29, OT23, OT24, OT25, OT28
and OT127, MU26 0x06, MFPU21 and MFPU26 0x08 - and XU22 0x07 of two.
With val_bits = 8 the MBQ layer refuses each of them before anything
reaches the bus, so the patch on its own would turn a read that used to
be answered from the cache into -EINVAL.  What the cache answered was
the placeholder from tas2783_reg_default[] rather than anything the
device had said, and the driver performs no register reads at all, so
nothing in tree can tell the difference today - but -EINVAL is not what
the patch should leave behind.

1/2 widens val_bits to 32 and repairs the one place that relied on the
old width, the calibration write, which used regmap_bulk_write() to
spread a four-byte value over four one-byte registers.

Both patches have been running on an ASUS ProArt PX13 (HN7306EAC, two
TAS2783 on one AMD ACP link) since 13 August - the 2/2 in that kernel is
the pre-v2 one, differing only in the File Download Status handling.
Playback, suspend to idle and the calibration path are unaffected.

Andrey Golovko (2):
  ASoC: tas2783-sdw: make multi-byte MBQ registers reachable
  ASoC: tas2783-sdw: do not cache read-only Controls

 sound/soc/codecs/tas2783-sdw.c | 105 +++++++++++++++++----------------
 1 file changed, 55 insertions(+), 50 deletions(-)


base-commit: 0c7aeb0f5eceb95b5887bd8e83fef865e5a49a13
-- 
2.53.0

