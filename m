Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794219960;
	b=fer3FuMDan2qdxFqtPf4Xb27AIM/dufLTsswXg7FqFSJc74mu/cdIFsxVj5jObfeLVEc
	 PoWUfqaIT/3abWidTFQ1zBLZbYG4r4dhjcHSBgsfLBACvJX/hnb/NBMcS+jqdwqbqby9U
	 6HMyJcp5BbGQHhi9AKwXWORgeDYedq3vwGcGmzm09ebzLIuHFDeyzCi7sNn86guCJlWxe
	 7MvZ/pn8WQnBZYiqG76Ra7tCgCv6hm0pqictk4BpjbbmrUJOxmZE/OEIhAoHkN+itUOUV
	 k030U31Bj/w1lg2vdX+QcOaiQO0BeAdT9S64lpDBt6sDTbITxM+VoN/EY0RADBb13pA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794219960;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=uHPeML+Gj2Ysyid/5nBfP8omp9YpKenMsUd7Cm1Nnmg=;
	b=u2D+0mObgMtYNsNwOt8ovVkJqQFpcP7zXLScjQRwlKmyyrnZTSWTsJ/Zh3MU/Swn6g47
	 O47X9hjc/FKx7gRk3QFtkac8gO+BJodlZ5XxuShFgqChYpBK9d8d6I/x/PtzoizLAUPAY
	 /GWZdmGyRIxYitk2tYPxIQc7b2dIU5I1A0NwV9lGawCeKVJRY3AhKQMuuKbczJmpVL/8G
	 gkPeavac/pCFfo/2R9MOaAaZ2K3i7dtOyP3KdAsg7WNIP4YG9D/bErnO+OzWLmfmFYOwr
	 A6zY8TLwTlAc2AlDUkXcS2rLhoRcoY0m+ioSO0Tac3r8W5l7CuwsngmkQU7F/9sVXSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Lg73tQk8;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86DD2606A31C
	for <linux-sound@vger.kernel.org>; Mon,  9 Nov 2026 10:26:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86DD2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Lg73tQk8
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4922523d1afso340069f8f.0
        for <linux-sound@vger.kernel.org>; Mon, 09 Nov 2026 02:26:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794219959; x=1794824759; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uHPeML+Gj2Ysyid/5nBfP8omp9YpKenMsUd7Cm1Nnmg=;
        b=Lg73tQk8Ygi5OLpl6XZxHqCz2vd7pk2pZtjs5xQu5TZ+YLl6/ScJdYY7jI7Cals4FH
         qepztcy5IfS+SfS2Nnge0UZ8DJnBW1jh4/iwnN8N2CSqadh31idvtYCSAeYz//KdKMM2
         xagjOGRGKPXzIeFbsbONbIsy+ilTqy8nJ7XEF32DQasWL1cWsskAW3F+/beoWezYsfez
         jpwU8ajOa4UcbEqZx7sxtYzb3Iw53XVmD0h4uLvYNLHUuFHJFp+H4I3sxKtuJk0wAQNA
         8Tzybw1ruBG8h2znvmi0Xoract6pXBCkZvvnZNx5UzfTVreszMNumyBc71V9aOhtLVNU
         xkMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794219959; x=1794824759;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uHPeML+Gj2Ysyid/5nBfP8omp9YpKenMsUd7Cm1Nnmg=;
        b=qKhNQsIELFZvXoFagOP3x5DyEZ1xppCSicNkkiZUQ4IZgtXNRk3t4Lj5IJHycMH7cI
         aldSGv9p1twSdMGaLIY1KToKgMyL9S+69MOMES1U5wMQma47Ca97C+nqJGOqprSw/5ix
         CZJXWI78wZLV3qUcuGR9otPttFc345Uydpr5S/mlVzOr+MQ96wayge3Yz9XY/B9VbCi0
         DPpSIu+7BuWHvy7PtJIa4pxJs5Oeng9g3IKgjgwzI3572KjGkoF0w74oqZzD8pC8q1KD
         If/CU23AYlTXaDFVL01ld51pwccyRk7fN7snKcnHuFTWA5N/qUZJ71/iHCTQRlhjtq5S
         djuw==
X-Forwarded-Encrypted: i=1; AL+hErE2wgzh/XJ/SPnxOyQubnXbjpzp4QxPlBWu3p7PABx7k+EzZ+8q5V0UEXOfekqRThcG+bDoj1lvxgcK2g==@vger.kernel.org
X-Gm-Message-State: APuU4Z88jCmk1Mv+rsJILUVSzY50iX3qjL8pB7GP36G16jV0SHO40ECV
	U/m2pGUM4BrzSFFQMy59sGsHbdxNbsxAqSjOF6pwS1XiB6YlNpdjfnHA
X-Gm-Gg: AYBFou3k0Y92Y1yIyPgq3/ADqcd61da9/LJeNDCeueFes1/CDG8j7e4Pw9+DS4iDgVT
	lInO35ErGx49XgaU844MnGwe2krAoyyZzk3HoxEI7BPFhikvzi/nFI1mreSzP+bBhOwHgx74/b2
	Uo7zJjm5RXcJL4FB2UlpiyKcC+ANmWUKfBaJC5iY7nB7JDOofLRplopNXMaisueuE2a9+Thkfg4
	Z/Zf8flNsO1P7sWfS8rJWzlG0eYOX8up3eKBiioCRtmW/f0BdxDYQAXBRZZlmCcddAfaQ6Ynwbg
	PqJzkN2mgWIs6liGawjlZr9okgQOr8D/dWLmMvFJarzg/6yHFQlgs+xNUr7s8ZVKXA5xFnqmlsI
	VzAIwNXEVdDgAJkCU5RxeSq6Ap1oMsc/3+4FMQpbzjx3MU3l8m/54koI4KmNmzuGbcSIG5eE2nq
	CwgTJWa6c995A4iFobzlKEzD+AHohppQCuLx/jwOzjBXJ8ty9zaOUOOJefCco/gXimzvR/ZR7p3
	WvfON+/DOOYXAyd0DuHgrA7xnyuA70YHup2VLAMYBRrQ7D+3bK6pwhUzvXdLGbyxY695x4RA5FD
	CxVh5pYdiaoD5d+myJENGv1kysVx3sfq9Vu6fp7ZJ0x2G9RcuoQtj6AUbJe1Y9M/i0EiwySMNNn
	HIH/Vbg==
X-Received: by 2002:a05:6000:260a:b0:491:f150:caa7 with SMTP id ffacd0b85a97d-4958487b45fmr6791123f8f.54.1794219958787;
        Mon, 09 Nov 2026 02:25:58 -0800 (PST)
Received: from emanueleg-nb (host-87-10-175-32.retail.telecomitalia.it. [87.10.175.32])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4967003fefbsm5057940f8f.13.2026.11.09.02.25.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 02:25:58 -0800 (PST)
From: Emanuele Ghidoli <ghidoliemanuele@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: soc-core: reset rtd->num_components after allocation
Date: Mon,  9 Nov 2026 11:25:20 +0100
Message-ID: <20261109102536.357134-1-ghidoliemanuele@gmail.com>
X-Mailer: git-send-email 2.53.0
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

From: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>


Commit 4dd10fbbeb9c ("treewide: Convert devm_kmalloc() family to the
devm_kmalloc_obj() family") switched the snd_soc_pcm_runtime allocation
in soc_new_pcm_runtime() to devm_kzalloc_flex(). components[] is
annotated with __counted_by(num_components), so when the compiler
provides __builtin_counted_by_ref() the allocation now also sets
rtd->num_components to the number of allocated slots.

snd_soc_rtd_add_component() fills components[] one entry at a time and
expects num_components to start at zero. Starting from the allocated
size, for_each_rtd_components() stops at the first, still NULL, entry,
so the runtime has no components: they are not probed, no controls or
user-visible PCM devices are created and the card registers empty,
without any error message. In addition, each added component is stored
past the end of components[]. On the tested board these stores still
land in the slack of the kmalloc bucket that devres rounds the
allocation up to, so KASAN does not report them.

Reset num_components after the allocation.

Seen on a Colibri iMX7D (simple-audio-card, fsl-sai, sgtl5000): the card
is listed in /proc/asound/cards, but /proc/asound/pcm is empty and

  amixer: Unable to find simple control 'Capture Mux',0
  aplay: main:850: audio open error: No such file or directory

Tested on that board with v7.4-rc2 built with GCC 15.2 (first seen with
GCC 16.2): the failure is there without this change; with it, playback,
capture and the codec controls work again.

The root cause analysis, this change and the testing were done with the
help of an AI coding assistant (Claude Code, Claude Opus 5.5).

Fixes: 4dd10fbbeb9c ("treewide: Convert devm_kmalloc() family to the devm_kmalloc_obj() family")
Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
---
4dd10fbbeb9c only reached mainline in v7.4-rc2 (not in broonie/sound yet),
so this is based on v7.4-rc2.

The other devm_k[mz]alloc_flex() sites added by 4dd10fbbeb9c were checked
too: none of them fills a __counted_by() counter one entry at a time, so
this one looks like the only user hit by the preset counter.

 sound/soc/soc-core.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 68b54e509b65..06a1d5718997 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -387,6 +387,12 @@ static struct snd_soc_pcm_runtime *soc_new_pcm_runtime(
 		device_unregister(dev);
 		return NULL;
 	}
+	/*
+	 * devm_kzalloc_flex() presets the __counted_by() counter to the
+	 * allocated size when the compiler has __builtin_counted_by_ref(),
+	 * but snd_soc_rtd_add_component() expects it to start from zero.
+	 */
+	rtd->num_components = 0;
 
 	rtd->dev = dev;
 	INIT_LIST_HEAD(&rtd->list);

base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.53.0

