Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8790216D4F1
	for <linux-sound@vger.kernel.org>; Tue,  7 May 2024 15:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715097335; cv=none; b=SAa5FTOv9cGbF/emTaauJ3ar8k8VIW1DYj4zeF6CpXt0lqcwKYv1Xi1lM0IGSqBvcYaDt+Hg8WJpgo4o+D+MmCtqEzEz1BQzpsNofxyl0fAO4cvAGv6NI6Hy/eRUKyk7geHW0+PJMmn1N0NZmlMCnYnO+q3j8Xf1VZESLjHIAa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715097335; c=relaxed/simple;
	bh=BkxA0jx/rZHGslxekmjC8PD+uWkxbRGVQDIOcMv1YGw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u4i7NL4JWHJTGGvqGSG1GCDPgXdWhri5GCQOSQzcuLN3bXOzZ1+w1PffsjwkoxJavBQzD20dNgTXEEZxS2rn5TmgOF01qd0pmINEXFOLCbQezU9EOgHEO8jctAYkYiFg8LhnY+gw0nFjvrMox2Kc7Ix49t64gNNVknoccpbqCXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=pJFjmoma; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=QBcPFEsY; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=pJFjmoma; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=QBcPFEsY; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="pJFjmoma";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QBcPFEsY";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="pJFjmoma";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QBcPFEsY"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B805B20C92;
	Tue,  7 May 2024 15:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715097331; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GJrfQTslRggapD81hq1xUbVgwlHha7leit0FEOd/p4c=;
	b=pJFjmomarJ6xjUXMXOKddM6Nvf8WxASJWihCbU+DUaSE63X7lcuNBlu1KoK/Ntv30umth4
	E1XKwUQFxfojm4QwhGsdPlt7rDuQKD/4PEjmFU13AiqQg79y6gcW++qV6acahBB8CMczu+
	m2NaiXFUNNpAiE096Dq2CPbg216F72U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715097331;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GJrfQTslRggapD81hq1xUbVgwlHha7leit0FEOd/p4c=;
	b=QBcPFEsY65jjsIlZIU0c0CgfrzrA1WFhRuM5WFYo54+AGmw8saJNE3ORtmMkUgZ/H1lY0e
	81Ur2mf6LqKlmXAg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715097331; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GJrfQTslRggapD81hq1xUbVgwlHha7leit0FEOd/p4c=;
	b=pJFjmomarJ6xjUXMXOKddM6Nvf8WxASJWihCbU+DUaSE63X7lcuNBlu1KoK/Ntv30umth4
	E1XKwUQFxfojm4QwhGsdPlt7rDuQKD/4PEjmFU13AiqQg79y6gcW++qV6acahBB8CMczu+
	m2NaiXFUNNpAiE096Dq2CPbg216F72U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715097331;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GJrfQTslRggapD81hq1xUbVgwlHha7leit0FEOd/p4c=;
	b=QBcPFEsY65jjsIlZIU0c0CgfrzrA1WFhRuM5WFYo54+AGmw8saJNE3ORtmMkUgZ/H1lY0e
	81Ur2mf6LqKlmXAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 99D8013A2D;
	Tue,  7 May 2024 15:55:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id aNVIJPNOOmaNXQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 07 May 2024 15:55:31 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 08/34] ASoC: bcm: Use *-y instead of *-objs in Makefile
Date: Tue,  7 May 2024 17:55:12 +0200
Message-ID: <20240507155540.24815-9-tiwai@suse.de>
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
 sound/soc/bcm/Makefile | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/bcm/Makefile b/sound/soc/bcm/Makefile
index 7c2d7899603b..0c1325a97b70 100644
--- a/sound/soc/bcm/Makefile
+++ b/sound/soc/bcm/Makefile
@@ -1,15 +1,15 @@
 # SPDX-License-Identifier: GPL-2.0-only
 # BCM2835 Platform Support
-snd-soc-bcm2835-i2s-objs := bcm2835-i2s.o
+snd-soc-bcm2835-i2s-y := bcm2835-i2s.o
 
 obj-$(CONFIG_SND_BCM2835_SOC_I2S) += snd-soc-bcm2835-i2s.o
 
 # CYGNUS Platform Support
-snd-soc-cygnus-objs := cygnus-pcm.o cygnus-ssp.o
+snd-soc-cygnus-y := cygnus-pcm.o cygnus-ssp.o
 
 obj-$(CONFIG_SND_SOC_CYGNUS) += snd-soc-cygnus.o
 
 # BCM63XX Platform Support
-snd-soc-63xx-objs := bcm63xx-i2s-whistler.o bcm63xx-pcm-whistler.o
+snd-soc-63xx-y := bcm63xx-i2s-whistler.o bcm63xx-pcm-whistler.o
 
 obj-$(CONFIG_SND_BCM63XX_I2S_WHISTLER) += snd-soc-63xx.o
\ No newline at end of file
-- 
2.43.0

