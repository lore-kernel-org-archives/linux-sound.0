Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4976516EC0E
	for <linux-sound@vger.kernel.org>; Tue,  7 May 2024 15:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715097343; cv=none; b=tpt4a5+NlQ0NHWjFco/gUW90lXlHGR0JSMcdpko2J7Vxsdt64OIhA1DRje5mEuFpoyIcC0ARBOXKbQWetr+4m67qTYRSUtnEPkJ7123/38vYDn7D4uEYbxvZRyMuVwab3PTeFxwuxTje/RWfg7tPEEUt3BkTzn1x9p7ei7WBWfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715097343; c=relaxed/simple;
	bh=Gbt8GFj1v8bOLnG4U58V81BrF+zAti5/RWgptfF/V88=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vu1B9TSyUepy4uJpW7vvR5ChDCif8mpg7E5qs2xcvItM8QE2QCMWLDkXLu15+abemLvWWiC3TLHaBlRUoItHtumYRM2Ya1FoB6YQ5rvCb7552gtYQVdQWjEB2QUCsc4Bg2BxUwh3zHxzxH58BNyexw2hA7r4jQaITmvYb+xFRgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=u4Ai9/wr; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=xQyZaZXA; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=u4Ai9/wr; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=xQyZaZXA; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="u4Ai9/wr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xQyZaZXA";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="u4Ai9/wr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xQyZaZXA"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id AFD8A22205;
	Tue,  7 May 2024 15:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715097335; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=doy5PxeKFetHBaGSYVbu9B8lRkK8T5uO1Jt8zBxCHhk=;
	b=u4Ai9/wrDIGzlGaFEMebnmul2uf8Pb+AEwVIvmRLrVHkBeKJL1NYoCddg2brXctuDf3rz2
	mOmBGFgt2g6p93CcCdE/RziEMSFRTEuS6KCbDMjv6rMxTmiXUdyGfp1aRO/BFOU1glQ67x
	dpG1t4eD6MJRoubwNcBPwujX057B5zo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715097335;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=doy5PxeKFetHBaGSYVbu9B8lRkK8T5uO1Jt8zBxCHhk=;
	b=xQyZaZXA7afRi4vMAE2OlftjwW/Jazb9Fy4bu33kOstw7LHGZGcw7Yqyt49loVk7EFPl4c
	kyhOU0AT119ZesAg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715097335; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=doy5PxeKFetHBaGSYVbu9B8lRkK8T5uO1Jt8zBxCHhk=;
	b=u4Ai9/wrDIGzlGaFEMebnmul2uf8Pb+AEwVIvmRLrVHkBeKJL1NYoCddg2brXctuDf3rz2
	mOmBGFgt2g6p93CcCdE/RziEMSFRTEuS6KCbDMjv6rMxTmiXUdyGfp1aRO/BFOU1glQ67x
	dpG1t4eD6MJRoubwNcBPwujX057B5zo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715097335;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=doy5PxeKFetHBaGSYVbu9B8lRkK8T5uO1Jt8zBxCHhk=;
	b=xQyZaZXA7afRi4vMAE2OlftjwW/Jazb9Fy4bu33kOstw7LHGZGcw7Yqyt49loVk7EFPl4c
	kyhOU0AT119ZesAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 926B913A2D;
	Tue,  7 May 2024 15:55:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id MONvIvdOOmaNXQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 07 May 2024 15:55:35 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 32/34] ASoC: ux500: Use *-y instead of *-objs in Makefile
Date: Tue,  7 May 2024 17:55:36 +0200
Message-ID: <20240507155540.24815-33-tiwai@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:email];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -6.80
X-Spam-Flag: NO

*-objs suffix is reserved rather for (user-space) host programs while
usually *-y suffix is used for kernel drivers (although *-objs works
for that purpose for now).

Let's correct the old usages of *-objs in Makefiles.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/ux500/Makefile | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/ux500/Makefile b/sound/soc/ux500/Makefile
index e7d6de51b32b..a63787d9d664 100644
--- a/sound/soc/ux500/Makefile
+++ b/sound/soc/ux500/Makefile
@@ -1,11 +1,11 @@
 # SPDX-License-Identifier: GPL-2.0
 # Ux500 Platform Support
 
-snd-soc-ux500-plat-msp-i2s-objs := ux500_msp_dai.o ux500_msp_i2s.o
+snd-soc-ux500-plat-msp-i2s-y := ux500_msp_dai.o ux500_msp_i2s.o
 obj-$(CONFIG_SND_SOC_UX500_PLAT_MSP_I2S) += snd-soc-ux500-plat-msp-i2s.o
 
-snd-soc-ux500-plat-dma-objs := ux500_pcm.o
+snd-soc-ux500-plat-dma-y := ux500_pcm.o
 obj-$(CONFIG_SND_SOC_UX500_PLAT_DMA) += snd-soc-ux500-plat-dma.o
 
-snd-soc-ux500-mach-mop500-objs := mop500.o mop500_ab8500.o
+snd-soc-ux500-mach-mop500-y := mop500.o mop500_ab8500.o
 obj-$(CONFIG_SND_SOC_UX500_MACH_MOP500) += snd-soc-ux500-mach-mop500.o
-- 
2.43.0

