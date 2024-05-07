Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96E3916E891
	for <linux-sound@vger.kernel.org>; Tue,  7 May 2024 15:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715097339; cv=none; b=BL/VNiL7alNiWYa3DnTgHRr/9Tww4rnKwAeBFqIdQujKkdP+Hxwd+RWt/8EOLrklbmP3CSyWAMsvjxHJ+hHg+9E8d68pMTqJ+CpVa/Bvfqif+pKqNYceBS0W6zyGyjf3BmFAYW7zGde8hykoEtW8tFncwjYMo3xPTLmO+sYbF8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715097339; c=relaxed/simple;
	bh=h6owL6fEGgYSzDEEJYGjSRQyeyu4TeovxIrHbZkBG60=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MFlt2MaIfpGK6YX0SUopXPNOvZYN4UsgoUCuECv9nr6m3Jep8cV2Jko8BmBqUiqnrep0Ch30CPE3DoN2K9AcMeUYtOpb8XRl5cEPdtOKwrH1LHgDccqjkPpWBCVmnXE4ohfkobr5YtFBKv5hWCjKH7oAM/Fg8m86P07W9m9IpOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Hc/m2iX7; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=872HPMuq; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Hc/m2iX7; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=872HPMuq; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Hc/m2iX7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="872HPMuq";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Hc/m2iX7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="872HPMuq"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1805C20C9A;
	Tue,  7 May 2024 15:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715097335; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VgzBMsLa5eUfzU4FoELOvU82WBbIw7DQ2m9YR0kp7n0=;
	b=Hc/m2iX73rh5k7sVkg6lTDC4+FP7nv5zDXpwWHGe1+ngvWxRnXYqANY4adyI4JwHodDnRn
	nj4edRuDciM46BX65oSKxLpR2i80AQ7iWYq6f1S/MQOHjLfBTQHd/IlLadYsGoQhf/zgp4
	dQFEfbq5OPE2EDFS417iC0aVWU3PT0o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715097335;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VgzBMsLa5eUfzU4FoELOvU82WBbIw7DQ2m9YR0kp7n0=;
	b=872HPMuq7AMmyIpS7exY7fuhmYoELbVxzRPRf9pL87eIXr8jBW2blMMKks6Ssc47qGpNMo
	eIhamz8JBr4y9qCA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715097335; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VgzBMsLa5eUfzU4FoELOvU82WBbIw7DQ2m9YR0kp7n0=;
	b=Hc/m2iX73rh5k7sVkg6lTDC4+FP7nv5zDXpwWHGe1+ngvWxRnXYqANY4adyI4JwHodDnRn
	nj4edRuDciM46BX65oSKxLpR2i80AQ7iWYq6f1S/MQOHjLfBTQHd/IlLadYsGoQhf/zgp4
	dQFEfbq5OPE2EDFS417iC0aVWU3PT0o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715097335;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VgzBMsLa5eUfzU4FoELOvU82WBbIw7DQ2m9YR0kp7n0=;
	b=872HPMuq7AMmyIpS7exY7fuhmYoELbVxzRPRf9pL87eIXr8jBW2blMMKks6Ssc47qGpNMo
	eIhamz8JBr4y9qCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EF0F113A2D;
	Tue,  7 May 2024 15:55:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id aLX5OPZOOmaNXQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 07 May 2024 15:55:34 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 28/34] ASoC: stm: Use *-y instead of *-objs in Makefile
Date: Tue,  7 May 2024 17:55:32 +0200
Message-ID: <20240507155540.24815-29-tiwai@suse.de>
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
 sound/soc/stm/Makefile | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/stm/Makefile b/sound/soc/stm/Makefile
index 3143c0b47042..3372432faa09 100644
--- a/sound/soc/stm/Makefile
+++ b/sound/soc/stm/Makefile
@@ -1,17 +1,17 @@
 # SPDX-License-Identifier: GPL-2.0
 # SAI
-snd-soc-stm32-sai-sub-objs := stm32_sai_sub.o
+snd-soc-stm32-sai-sub-y := stm32_sai_sub.o
 obj-$(CONFIG_SND_SOC_STM32_SAI) += snd-soc-stm32-sai-sub.o
 
-snd-soc-stm32-sai-objs := stm32_sai.o
+snd-soc-stm32-sai-y := stm32_sai.o
 obj-$(CONFIG_SND_SOC_STM32_SAI) += snd-soc-stm32-sai.o
 
 # I2S
-snd-soc-stm32-i2s-objs := stm32_i2s.o
+snd-soc-stm32-i2s-y := stm32_i2s.o
 obj-$(CONFIG_SND_SOC_STM32_I2S) += snd-soc-stm32-i2s.o
 
 # SPDIFRX
-snd-soc-stm32-spdifrx-objs := stm32_spdifrx.o
+snd-soc-stm32-spdifrx-y := stm32_spdifrx.o
 obj-$(CONFIG_SND_SOC_STM32_SPDIFRX) += snd-soc-stm32-spdifrx.o
 
 #DFSDM
-- 
2.43.0

