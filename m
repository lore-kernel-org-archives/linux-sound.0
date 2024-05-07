Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C1C816E88C
	for <linux-sound@vger.kernel.org>; Tue,  7 May 2024 15:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715097339; cv=none; b=qSde6u+J4n3TlqYobTjpM3ZyS/w8vZ3zvOMukFwfoodNTaToOWADogdvn15hfNsJ6Fv9KM/aTnXHUm7zuzY1SoUJa5v+de5EOoAbIFBolzASL/7Xp2NSMtdM8MRW3YkSEsOYKjul3NVsyL12H8arJ1vSnSBx5LjM1uhMJrUOd38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715097339; c=relaxed/simple;
	bh=KpZ3NGEdhA+HzIZ+7RO4qg/vBhcOJ4kXID54/dITqu0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oVD4BOGhT4MX9FlXNNyOfggT+OvCi709kPJ6i4EiTjwiXeRYA9l17Bq+GCJkp29dMFn/zGl9Ma2BtF2xOSjfopn/8lsOV1VU7NAGsPO5fC/MxgQ2sEbJn3EZNxf5u2tVLVGYW+p7JVq6XE8fjL1+PNlFh0ztExXsepVgOgx+LBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jzke49K/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=VXwyqoZD; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jzke49K/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=VXwyqoZD; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jzke49K/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="VXwyqoZD";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jzke49K/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="VXwyqoZD"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9B89D22148;
	Tue,  7 May 2024 15:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715097333; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MCgdv0zA5q+kKt/RV0IfGSkTsq5aw8Nllis7afiWHEI=;
	b=jzke49K/KacqJ22F1PvTZfCXpxUoLGboS/b3kurKBrgoDCnzl+u1oZy9jkcmUIA9tvNGX8
	eELzKyFLgM3ZEoHHgNN502sZ0AYsjnGSaVpz1qI+W0rqfTfLOYo8fV1gKIETEYGB9ILdjD
	PcGV5GYI5ynBj0YY9krHShFKwM8em5Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715097333;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MCgdv0zA5q+kKt/RV0IfGSkTsq5aw8Nllis7afiWHEI=;
	b=VXwyqoZDnN9ID0c9R4pwgcZXo5SiYD0CiUsTjUKQwQgkpGSwuv0IOZX6eUzOXvqc+4Mtno
	RK+vNulUhgMIT4AQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715097333; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MCgdv0zA5q+kKt/RV0IfGSkTsq5aw8Nllis7afiWHEI=;
	b=jzke49K/KacqJ22F1PvTZfCXpxUoLGboS/b3kurKBrgoDCnzl+u1oZy9jkcmUIA9tvNGX8
	eELzKyFLgM3ZEoHHgNN502sZ0AYsjnGSaVpz1qI+W0rqfTfLOYo8fV1gKIETEYGB9ILdjD
	PcGV5GYI5ynBj0YY9krHShFKwM8em5Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715097333;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MCgdv0zA5q+kKt/RV0IfGSkTsq5aw8Nllis7afiWHEI=;
	b=VXwyqoZDnN9ID0c9R4pwgcZXo5SiYD0CiUsTjUKQwQgkpGSwuv0IOZX6eUzOXvqc+4Mtno
	RK+vNulUhgMIT4AQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7D41213A3A;
	Tue,  7 May 2024 15:55:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id yG1XHfVOOmaNXQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 07 May 2024 15:55:33 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 19/34] ASoC: pxa: Use *-y instead of *-objs in Makefile
Date: Tue,  7 May 2024 17:55:23 +0200
Message-ID: <20240507155540.24815-20-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240507155540.24815-1-tiwai@suse.de>
References: <20240507155540.24815-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -6.80
X-Spam-Level: 
X-Spamd-Result: default: False [-6.80 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[]

*-objs suffix is reserved rather for (user-space) host programs while
usually *-y suffix is used for kernel drivers (although *-objs works
for that purpose for now).

Let's correct the old usages of *-objs in Makefiles.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/pxa/Makefile | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/pxa/Makefile b/sound/soc/pxa/Makefile
index 406605fc7414..93b4e57eaa5c 100644
--- a/sound/soc/pxa/Makefile
+++ b/sound/soc/pxa/Makefile
@@ -1,10 +1,10 @@
 # SPDX-License-Identifier: GPL-2.0
 # PXA Platform Support
-snd-soc-pxa2xx-objs := pxa2xx-pcm.o
-snd-soc-pxa2xx-ac97-objs := pxa2xx-ac97.o
-snd-soc-pxa2xx-i2s-objs := pxa2xx-i2s.o
-snd-soc-pxa-ssp-objs := pxa-ssp.o
-snd-soc-mmp-sspa-objs := mmp-sspa.o
+snd-soc-pxa2xx-y := pxa2xx-pcm.o
+snd-soc-pxa2xx-ac97-y := pxa2xx-ac97.o
+snd-soc-pxa2xx-i2s-y := pxa2xx-i2s.o
+snd-soc-pxa-ssp-y := pxa-ssp.o
+snd-soc-mmp-sspa-y := mmp-sspa.o
 
 obj-$(CONFIG_SND_PXA2XX_SOC) += snd-soc-pxa2xx.o
 obj-$(CONFIG_SND_PXA2XX_SOC_AC97) += snd-soc-pxa2xx-ac97.o
@@ -13,5 +13,5 @@ obj-$(CONFIG_SND_PXA_SOC_SSP) += snd-soc-pxa-ssp.o
 obj-$(CONFIG_SND_MMP_SOC_SSPA) += snd-soc-mmp-sspa.o
 
 # PXA Machine Support
-snd-soc-spitz-objs := spitz.o
+snd-soc-spitz-y := spitz.o
 obj-$(CONFIG_SND_PXA2XX_SOC_SPITZ) += snd-soc-spitz.o
-- 
2.43.0

