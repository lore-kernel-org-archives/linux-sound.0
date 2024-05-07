Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8DD616E880
	for <linux-sound@vger.kernel.org>; Tue,  7 May 2024 15:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715097338; cv=none; b=H2v3yDg8Zc/RGF0TVgO3SQ7pqHU8oxaTIxQDhehg2YZVSQmzRt4WhyYqi56UzlJhgmfhcNArk4Z/kCSKvYgNcTDLJEN5y+f1hXsjsAdYW7cjCrR39xqDPMlqpxeCn99phGGynPhfQBaVGQT8xFLl59uqK6msT71ziijvQw4hj88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715097338; c=relaxed/simple;
	bh=fyHH5YiZ3Nve/rxEqwYF+uTGGrmw0s12qeHlqIf2A5Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kmnNQgXM3sTbai3VNsnxxGxvz20MkSaFK/zfJNUqpmDlWStY+ekqsAo08moO7mi8wtHuPsh+RLwQULKmzhAR4VTNCX1vGwKQB0enoHtQeH9sgwc6d2NoCe8iJPxND7Dy8rsuwttaArqXX9BmKfaflyOOJk3d311aLzi1cKFV7E4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mLZkgXDK; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=gidb19QW; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mLZkgXDK; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=gidb19QW; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mLZkgXDK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gidb19QW";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mLZkgXDK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gidb19QW"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4257D20C97;
	Tue,  7 May 2024 15:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715097334; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1pCuhBeQM2FBP4iKS52sOihN4xFxaQ/YVGltUeUV80w=;
	b=mLZkgXDKUywO9kmoMe+8m8ck/+IdAcZO8vATH6JGerT67tk6JsGVjvZxf8D6QB1LIAYOGW
	+9FyQnwOTAqm3K753RCcmgCbnDcMPN0AJkjEfEZRO/zvCUP7+s4bZan+jrtjHmTiQT4QIL
	CAvlPoUhErxb0cuq0GVFPfeIHzfH4m0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715097334;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1pCuhBeQM2FBP4iKS52sOihN4xFxaQ/YVGltUeUV80w=;
	b=gidb19QWdjqrQmSPUW/8q8eKJ4H3YLpkQNDnOk6a1PbD0psS4KrGMg4vFKedmj0WRrzEA4
	GxM6vcgveJUr8oBA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715097334; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1pCuhBeQM2FBP4iKS52sOihN4xFxaQ/YVGltUeUV80w=;
	b=mLZkgXDKUywO9kmoMe+8m8ck/+IdAcZO8vATH6JGerT67tk6JsGVjvZxf8D6QB1LIAYOGW
	+9FyQnwOTAqm3K753RCcmgCbnDcMPN0AJkjEfEZRO/zvCUP7+s4bZan+jrtjHmTiQT4QIL
	CAvlPoUhErxb0cuq0GVFPfeIHzfH4m0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715097334;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1pCuhBeQM2FBP4iKS52sOihN4xFxaQ/YVGltUeUV80w=;
	b=gidb19QWdjqrQmSPUW/8q8eKJ4H3YLpkQNDnOk6a1PbD0psS4KrGMg4vFKedmj0WRrzEA4
	GxM6vcgveJUr8oBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 237C813A2D;
	Tue,  7 May 2024 15:55:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id IIpJB/ZOOmaNXQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 07 May 2024 15:55:34 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 23/34] ASoC: sh: Use *-y instead of *-objs in Makefile
Date: Tue,  7 May 2024 17:55:27 +0200
Message-ID: <20240507155540.24815-24-tiwai@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:email];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[]

*-objs suffix is reserved rather for (user-space) host programs while
usually *-y suffix is used for kernel drivers (although *-objs works
for that purpose for now).

Let's correct the old usages of *-objs in Makefiles.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/sh/Makefile      | 16 ++++++++--------
 sound/soc/sh/rcar/Makefile |  2 +-
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/sound/soc/sh/Makefile b/sound/soc/sh/Makefile
index f6fd79948f6a..f0e19cbd1581 100644
--- a/sound/soc/sh/Makefile
+++ b/sound/soc/sh/Makefile
@@ -1,13 +1,13 @@
 # SPDX-License-Identifier: GPL-2.0
 ## DMA engines
-snd-soc-dma-sh7760-objs	:= dma-sh7760.o
+snd-soc-dma-sh7760-y		:= dma-sh7760.o
 obj-$(CONFIG_SND_SOC_PCM_SH7760)	+= snd-soc-dma-sh7760.o
 
 ## audio units found on some SH-4
-snd-soc-hac-objs	:= hac.o
-snd-soc-ssi-objs	:= ssi.o
-snd-soc-fsi-objs	:= fsi.o
-snd-soc-siu-objs	:= siu_pcm.o siu_dai.o
+snd-soc-hac-y		:= hac.o
+snd-soc-ssi-y		:= ssi.o
+snd-soc-fsi-y		:= fsi.o
+snd-soc-siu-y		:= siu_pcm.o siu_dai.o
 obj-$(CONFIG_SND_SOC_SH4_HAC)	+= snd-soc-hac.o
 obj-$(CONFIG_SND_SOC_SH4_SSI)	+= snd-soc-ssi.o
 obj-$(CONFIG_SND_SOC_SH4_FSI)	+= snd-soc-fsi.o
@@ -17,12 +17,12 @@ obj-$(CONFIG_SND_SOC_SH4_SIU)	+= snd-soc-siu.o
 obj-$(CONFIG_SND_SOC_RCAR)	+= rcar/
 
 ## boards
-snd-soc-sh7760-ac97-objs	:= sh7760-ac97.o
-snd-soc-migor-objs		:= migor.o
+snd-soc-sh7760-ac97-y		:= sh7760-ac97.o
+snd-soc-migor-y			:= migor.o
 
 obj-$(CONFIG_SND_SH7760_AC97)	+= snd-soc-sh7760-ac97.o
 obj-$(CONFIG_SND_SIU_MIGOR)	+= snd-soc-migor.o
 
 # RZ/G2L
-snd-soc-rz-ssi-objs		:= rz-ssi.o
+snd-soc-rz-ssi-y		:= rz-ssi.o
 obj-$(CONFIG_SND_SOC_RZ)	+= snd-soc-rz-ssi.o
diff --git a/sound/soc/sh/rcar/Makefile b/sound/soc/sh/rcar/Makefile
index d07eccfa3ac2..45eb875a912a 100644
--- a/sound/soc/sh/rcar/Makefile
+++ b/sound/soc/sh/rcar/Makefile
@@ -1,3 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0
-snd-soc-rcar-objs	:= core.o gen.o dma.o adg.o ssi.o ssiu.o src.o ctu.o mix.o dvc.o cmd.o debugfs.o
+snd-soc-rcar-y		:= core.o gen.o dma.o adg.o ssi.o ssiu.o src.o ctu.o mix.o dvc.o cmd.o debugfs.o
 obj-$(CONFIG_SND_SOC_RCAR)	+= snd-soc-rcar.o
-- 
2.43.0

