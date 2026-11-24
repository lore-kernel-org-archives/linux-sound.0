Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=85.128.243.59
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795550241;
	b=e2cEnRQPLbm1340FtedDh70dUgOK9wp+BNIdgfFFKknjCErvlv9hOZZE1jtyvEgAPql2
	 XMZPUWZ9VRRgRVc1droMSWkqOeeEOrtVtYaompjp5bGFCI5bImQK7riKHz8PKjfx7B0fP
	 HP9SBukGUOTT9O8enZ+GrTZW5yaOv4AxzAWkq6dvTaDH5CgclOc+hOphtBc8I9/RGxdEL
	 vpGon3rMO1ThdAp5ox+/S3bJSt2TNzugdccDrxBYaSFiNOK4axt3qi8Lv2+u4tMZSRbAt
	 7Myh4A3HmUtdpRucLpio6NOWxt5b1IIurUjW1yBqJnK/dxh+CUBgq/LCDd+r2x4wF3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795550241;
	h=DMARC-Filter:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=zNz8lFaJHMduKJe09IyLfcNQ325aacH7F2sVzuh6mC8=;
	b=HXWjqihFJRZnZ+AahAqpVFTZe+UkbbkIM9tPnWcFr4oMyA47aFrQx0Tg7y0D6jGlrJ1w
	 7mpUSG32blXWOL3ws4s1T1ir1JlosEROGBd6hoV4sf2u1xPWoH+TtLa+XfKLCgdYy21wc
	 yA8qirVyOJwiU3WMTMJSShV8WEIMrUXiP+x14Xracfb5EO2sEqtHE6m3Lyt1P7LcMJtz8
	 vVLpXhV8sv1c609BEStURfPtgZjyKDFhdk3nUd8SV1ZjIbUvlD1e2SOFMUC1GleEYUYq3
	 ggYtSSh+NMEA4Ye23CpdkleNSaAXv2T25DCikN+zi9MdTsH3Vs8R87id6tBKmX9i/dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=asmblr.net;
	spf=pass smtp.mailfrom=asmblr.net;
	dkim=pass header.d=asmblr.net header.i=@asmblr.net header.a=rsa-sha256 header.s=1706450368.internal header.b=bUNQlo6Y;
	arc=none smtp.remote-ip=85.128.243.59
Received: from shared-aoh59.rev.nazwa.pl (shared-aoh59.rev.nazwa.pl [85.128.243.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06161606A32A
	for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 19:57:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06161606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asmblr.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asmblr.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=asmblr.net header.i=@asmblr.net header.a=rsa-sha256 header.s=1706450368.internal header.b=bUNQlo6Y
X-Virus-Scanned: by amavisd-new using ClamAV (16)
X-Spam-Flag: NO
X-Spam-Score: 3.401
X-Spam-Level: ***
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asmblr.net;
	s=1706450368.internal; t=1795550231;
	bh=zNz8lFaJHMduKJe09IyLfcNQ325aacH7F2sVzuh6mC8=;
	h=From:To:Cc:Subject:Date;
	b=bUNQlo6YgiyYbMl/hHzZcK+Bi/wxX5CD6aQtk+nLHaYUaIrrxlK3qpYda5pnKuz9y
	 lnMGqaiGvXZILP26ykbXLcKikAG6CJS1y/QnDPsc3/xKwgQPpyP7aIbVNcd1uhkpXh
	 iMmtja68PCO6jUtd64g5dqjB2xZEA0KyHwmiQd/oKBYnmNVb2Cc88fMt1asCLV4CC0
	 NHaKHDkGJRPzFleLUWLTX46dG751VfHQGcMOne6LKStgo7Auegp+5yfrtjIidpmQGb
	 q9gg9nHRIklXlbORtkxCpPEIgCGSfK3IFLF1N7VOTtDL08fScO0N8poSJwBeWnNCg8
	 mPCtufeR/Z9Dg==
Received: from milkyway (91-150-220-230.dynamic.play.pl [91.150.220.230])
	by server753313.nazwa.pl (Postfix) with ESMTP id 697871BC925;
	Tue, 24 Nov 2026 20:57:11 +0100 (CET)
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amade@asmblr.net>
To: linux-sound@vger.kernel.org
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amade@asmblr.net>
Subject: [PATCH 0/5] ALSA: Remove orphaned prototypes
Date: Tue, 24 Nov 2026 20:56:59 +0100
Message-ID: <20261124195704.41649-1-amade@asmblr.net>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Some of the ALSA code either declares functions that were never
implemented or at some point were removed leaving orphaned declarations.

Clean up by removing them. Build tested with make allyesconfig.

Amadeusz Sławiński (5):
  ALSA: hda: Remove orphaned function prototypes from hda_local.h
  ALSA: hda: Remove orphaned snd_hda_get_codec_name() prototype
  ALSA: gus: Remove orphaned snd_gf1_mem_free_owner() prototype
  ALSA: sb8: Remove orphaned PCM open/close function prototypes
  ALSA: emu10k1: Remove orphaned snd_emu10k1_memhdr_init() prototype

 include/sound/gus.h                     | 1 -
 include/sound/hda_codec.h               | 1 -
 include/sound/sb.h                      | 4 ----
 sound/hda/common/hda_local.h            | 3 ---
 sound/pci/emu10k1/emu10k1_synth_local.h | 1 -
 5 files changed, 10 deletions(-)


base-commit: 2321b0b895394124f25b40ab91681c5639e3e1fe
-- 
2.56.1

