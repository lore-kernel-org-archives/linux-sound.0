Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=85.128.243.59
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795550245;
	b=Q3S608shkWaJ8oTFqN1iTaH3XhsJ65RqPilzw9xgX2MRbZwfJqNavFACxCXxdgvtisQw
	 uVmHWR/zLXC4xshutCQOMT0L7KHyT685tve+cDl8VXz343dyx+J5fZRf1zIdNS6x0J/cd
	 IwH/7rF4Q4pWQgxz5K7FTNc/pno9aAE/tyUQ9xNhiFEvWUqhtIuX1rP5qn/kghVVxgx58
	 GeZV/88c93zbiRsf8Nef/qKHRAZ5WEvJh/dfJWu/TKg8Yvt1AhbMoob+rg0QFP5PpBTjE
	 niqJfYy0+9fs0pLyS3MDZvVJo1dNSdW0nWPKwZu7bIGnt68wU2vm0ySTnGMFngPm40w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795550245;
	h=DMARC-Filter:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=a/1aRVFfXrk4XHDK49g903zIytRh8k/Pb/SPKnjKhpk=;
	b=y848p6OCqa86CrO4UnxVxv0SUbcWIsIl8bMJIcP3yp7PIW0pRkUld6RfuzMrpF8gd9/X
	 0R9IuPJ8KanORodpE8hyXZmqcxp1uqE7/n4RT9amFpqoSff/QiDTSsQ5zhR6LTH+oUmaf
	 l+RaqLAUs2t5CyeG7WTNcAYZl6xpzKRsBXx8fi2SlL9vN5UhpjfsctRZ+6q2CDYG5i/Yw
	 pngIKvAy6Yh8ig3rcu/uInlGUmYT70Y1rA7prI4VUmdk3xHsRHS3hfv6/i066hX+uEV7V
	 czmV3WefoyMDcVm/r4ZFmAYVwP2EGE0w87UwHtsf+qw3HTohyktNyz70RCkGuS06wfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=asmblr.net;
	spf=pass smtp.mailfrom=asmblr.net;
	dkim=pass header.d=asmblr.net header.i=@asmblr.net header.a=rsa-sha256 header.s=1706450368.internal header.b=SCKFj3Pr;
	arc=none smtp.remote-ip=85.128.243.59
Received: from shared-aoh59.rev.nazwa.pl (shared-aoh59.rev.nazwa.pl [85.128.243.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 553DE606A321
	for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 19:57:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 553DE606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asmblr.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asmblr.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asmblr.net header.i=@asmblr.net header.a=rsa-sha256 header.s=1706450368.internal header.b=SCKFj3Pr
X-Virus-Scanned: by amavisd-new using ClamAV (17)
X-Spam-Flag: NO
X-Spam-Score: -0.625
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asmblr.net;
	s=1706450368.internal; t=1795550242;
	bh=a/1aRVFfXrk4XHDK49g903zIytRh8k/Pb/SPKnjKhpk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=SCKFj3PrSFVs1BPxjsfzz/VOhUIx7D7JUac2Z4rT09Lgd0SP3i4MReiFawhbSQINc
	 t7fKI4SJHkYXj2c8SWbHvm2TVUnnDul2FBB1swRl9s6eWNbMxwsjiR4lZOLxJM4oUT
	 t1Gn8K/3F7LhBOQX6OeZHZoMP/1zvl5E/h4mHSG1IgPYsD5WAJWD/sF6IMb3730dvg
	 DuHrwhwccbJV8YqMNLeJOUhN5bOX2Om/L1F3DiwzA2YjUbctnDe6iCFMRO4bWKqZ/6
	 vifIW63wQZSrPeSGpf9s42qaTEpSutYSdaW90qs1AepH1/MetWJpLZlc6TeIdfO+j4
	 euIwtkchhfQOg==
Received: from milkyway (91-150-220-230.dynamic.play.pl [91.150.220.230])
	by server753313.nazwa.pl (Postfix) with ESMTP id 711EE1BE90A;
	Tue, 24 Nov 2026 20:57:22 +0100 (CET)
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amade@asmblr.net>
To: linux-sound@vger.kernel.org
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amade@asmblr.net>
Subject: [PATCH 2/5] ALSA: hda: Remove orphaned snd_hda_get_codec_name() prototype
Date: Tue, 24 Nov 2026 20:57:01 +0100
Message-ID: <20261124195704.41649-3-amade@asmblr.net>
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

snd_hda_get_codec_name() was replaced by static get_codec_name() in
commit f44ac8378d3d ("ALSA: hda - Allocate name string of each codec"),
leaving behind an unused prototype in hda_codec.h. Remove it.

Signed-off-by: Amadeusz Sławiński <amade@asmblr.net>
---
 include/sound/hda_codec.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/sound/hda_codec.h b/include/sound/hda_codec.h
index 084f06488a95..c68a0076d42c 100644
--- a/include/sound/hda_codec.h
+++ b/include/sound/hda_codec.h
@@ -479,7 +479,6 @@ int snd_hda_attach_pcm_stream(struct hda_bus *_bus, struct hda_codec *codec,
 /*
  * Misc
  */
-void snd_hda_get_codec_name(struct hda_codec *codec, char *name, int namelen);
 void snd_hda_codec_set_power_to_all(struct hda_codec *codec, hda_nid_t fg,
 				    unsigned int power_state);
 
-- 
2.56.1

