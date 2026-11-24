Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=85.128.243.59
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795550256;
	b=4wgbyfy6KXQ4z4ub84FUfDk7MjgbYTMaI2X1/bVeAKye6auUK4a4hv6SI5oBa4HckfJ1
	 rybNmVsftWAE9wFsYDypdthjNdRQGudgHRblZ4C51XDzm1sTLA0JY36D69ah1P+BubaiI
	 UPDvSHgyI1+OJqJqxwgnNv+QJbBT+kMsHTFMxDmgzcHzBxmv7AiKCujY2Ozh4aAm1Va2O
	 AFPhS9BR3n8/kb0e+9j09Y2ym1wk17Wgyn/3Z2AeesLs3u4kkz1aurK2X7tMyFGQeUf5R
	 Y6YAwfA7YbcZ2deGDfiqEiLrIK/aErL7vu/z0TMUljKkcBnIL+Dek7CyraVm2MaXZVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795550256;
	h=DMARC-Filter:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=gX+adeL+QNUec3vHjcpD3zTEZXitZK9jrl2AHgbUYxU=;
	b=Sa0w+P9S0VfIcyk0IDdUhBQ2zw3a3MQ3D7l3q1zrw1EWz9QYXqJaIcoA3fLeBmR7SOGP
	 PxbrZRxEwwV3T9T0N8BHjeUQ7t3X4IniMgTUKC6B8vUfsTFRjO5tvlmj9mmm4Mjd6Lcxt
	 I4P3j1+gDzWVK0TEpXHbNA2UVHrp3WgjgDvezP1iOAgo6Tw4tlam/MwA80+JfcoFc2Czi
	 avMBs92EQWZoArtx8Q7bvSbs+X4hm2XDbHKGv1IcS/7/LFbGkTZ1GlLfRNfj5pZymRZ46
	 PmF5Olma4yjfn4NyR49pVwU8fjOTqc7Ks904VEQOzrPKeivOXeQ8cvTw/pjFJeIdcQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=asmblr.net;
	spf=pass smtp.mailfrom=asmblr.net;
	dkim=pass header.d=asmblr.net header.i=@asmblr.net header.a=rsa-sha256 header.s=1706450368.internal header.b=Cbh5sIm6;
	arc=none smtp.remote-ip=85.128.243.59
Received: from shared-aoh59.rev.nazwa.pl (shared-aoh59.rev.nazwa.pl [85.128.243.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A92606A31E
	for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 19:57:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78A92606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asmblr.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asmblr.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asmblr.net header.i=@asmblr.net header.a=rsa-sha256 header.s=1706450368.internal header.b=Cbh5sIm6
X-Virus-Scanned: by amavisd-new using ClamAV (23)
X-Spam-Flag: NO
X-Spam-Score: -0.625
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asmblr.net;
	s=1706450368.internal; t=1795550253;
	bh=gX+adeL+QNUec3vHjcpD3zTEZXitZK9jrl2AHgbUYxU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Cbh5sIm6mTCaTNQnPK1G85EcEuCTweqf5qTc7A3WbcGgurF5Rf6b0EZtDBxT9n+Wz
	 NJivXzERw0vwXeekijZZg9ETVNGKMGyuib2Yo3fId6Qi40Np16UWDEBPFX5t47iYkr
	 H75TYZBeHSb2VYua5JHpbJQYovBSaNOlaYZkAeStleabsb36IGtQjDBrWgNSbsnbu7
	 IW06VG0peWRO303b3nvAtl0+Tb/3xgUZKmlgxxgoenUyVa5ssBO1qjOq8C43tYM1PA
	 aBE8ibeFSlwGsiJEXrSdsUuXFgCzu0j3QnFYnRA3dmilVTpiXvddzhYWqELnQbLgOT
	 TgIBrzaGmnHMA==
Received: from milkyway (91-150-220-230.dynamic.play.pl [91.150.220.230])
	by server753313.nazwa.pl (Postfix) with ESMTP id 812ED1BED92;
	Tue, 24 Nov 2026 20:57:33 +0100 (CET)
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amade@asmblr.net>
To: linux-sound@vger.kernel.org
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amade@asmblr.net>
Subject: [PATCH 4/5] ALSA: sb8: Remove orphaned PCM open/close function prototypes
Date: Tue, 24 Nov 2026 20:57:03 +0100
Message-ID: <20261124195704.41649-5-amade@asmblr.net>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261124195704.41649-1-amade@asmblr.net>
References: <20261124195704.41649-1-amade@asmblr.net>
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

sb8_main.c uses static snd_sb8_open() and snd_sb8_close() callbacks for
both playback and capture, while snd_sb8_playback_open(),
snd_sb8_capture_open(), snd_sb8_playback_close() and
snd_sb8_capture_close() are not defined anywhere. Remove their orphaned
prototypes from include/sound/sb.h.

Signed-off-by: Amadeusz Sławiński <amade@asmblr.net>
---
 include/sound/sb.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/include/sound/sb.h b/include/sound/sb.h
index 24970f36c38a..f133cfee3788 100644
--- a/include/sound/sb.h
+++ b/include/sound/sb.h
@@ -299,10 +299,6 @@ static inline void snd_sbmixer_resume(struct snd_sb *chip) {}
 int snd_sb8dsp_pcm(struct snd_sb *chip, int device);
 /* sb8.c */
 irqreturn_t snd_sb8dsp_interrupt(struct snd_sb *chip);
-int snd_sb8_playback_open(struct snd_pcm_substream *substream);
-int snd_sb8_capture_open(struct snd_pcm_substream *substream);
-int snd_sb8_playback_close(struct snd_pcm_substream *substream);
-int snd_sb8_capture_close(struct snd_pcm_substream *substream);
 /* midi8.c */
 irqreturn_t snd_sb8dsp_midi_interrupt(struct snd_sb *chip);
 int snd_sb8dsp_midi(struct snd_sb *chip, int device);
-- 
2.56.1

