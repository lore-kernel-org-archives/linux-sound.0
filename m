Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434DE21C9F7
	for <linux-sound@vger.kernel.org>; Tue, 10 Jun 2025 06:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749537808; cv=none; b=TPOKia4zLoXiPYemjHtZ70QFDsbRCCOgIyhwTBgOs59Uc4bVgd8qmBXrORfqlm8+N3JRTxjyqsCi6AKd34QmMQtAzgQGSfax86ELStJsCMEU7u/yE1XcHEQQqj0JgJPYnsS6VoCQwYSrMICL4TsH03H3i1UxTAQUQQGjwp9MXaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749537808; c=relaxed/simple;
	bh=sVG/XRwmiiLTtQ945CSDZv81XXLtl51pLOYlUMGBZg8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QlBdJ9QUdcKkdGrIVuTKnvY+jbciyOlyC+lv+uS6/M8xwEKNQD50msAn7OWi89jQOL4FHZRdb71P43W9pvuJWKMI97cnh0JYemXDSliYLvo75AFPlW7mzMm06bdR1tv+niCeg1K9bbkCfSrjDhfnrpJJxD2tBqmMTBAyG7hx9rA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ry3w3NQc; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=kaaGkBP0; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ry3w3NQc; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=kaaGkBP0; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ry3w3NQc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="kaaGkBP0";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ry3w3NQc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="kaaGkBP0"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 73423211F2;
	Tue, 10 Jun 2025 06:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749537805; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=570fUP7H1QVLvl9XA5jAijRgzNOYJT5ctXKbYeB9d4Y=;
	b=ry3w3NQc6sCv7lldMjSOpTCAlQE+1GG1KFSlSNp8uoswbbMRKdfdwoXNbyQieWg0eXKdJ3
	+WBw2wY9SxrR2rDeKL2nzwBmJUHm97w6Jxuz4DL+uC42JCTFT9OaAbeenlHQZdw3RToXv7
	PLHhtOapopFrH0+fm0kGxrkXydB6Xsg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749537805;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=570fUP7H1QVLvl9XA5jAijRgzNOYJT5ctXKbYeB9d4Y=;
	b=kaaGkBP0zTwHxsiOYkJJl0Rrj2cuyH9+hevWJQSDX4CqT2CZpe64H2kdOwmk7pUhVoRCts
	5zCTa0vUwiznUCBA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ry3w3NQc;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=kaaGkBP0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749537805; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=570fUP7H1QVLvl9XA5jAijRgzNOYJT5ctXKbYeB9d4Y=;
	b=ry3w3NQc6sCv7lldMjSOpTCAlQE+1GG1KFSlSNp8uoswbbMRKdfdwoXNbyQieWg0eXKdJ3
	+WBw2wY9SxrR2rDeKL2nzwBmJUHm97w6Jxuz4DL+uC42JCTFT9OaAbeenlHQZdw3RToXv7
	PLHhtOapopFrH0+fm0kGxrkXydB6Xsg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749537805;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=570fUP7H1QVLvl9XA5jAijRgzNOYJT5ctXKbYeB9d4Y=;
	b=kaaGkBP0zTwHxsiOYkJJl0Rrj2cuyH9+hevWJQSDX4CqT2CZpe64H2kdOwmk7pUhVoRCts
	5zCTa0vUwiznUCBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 58524139E2;
	Tue, 10 Jun 2025 06:43:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8O0/FA3UR2iqdAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 10 Jun 2025 06:43:25 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 2/2] ALSA: sb: Force to disable DMAs once when DMA mode is changed
Date: Tue, 10 Jun 2025 08:43:20 +0200
Message-ID: <20250610064322.26787-2-tiwai@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250610064322.26787-1-tiwai@suse.de>
References: <20250610064322.26787-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_NONE(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 73423211F2
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -3.01

When the DMA mode is changed on the (still real!) SB AWE32 after
playing a stream and closing, the previous DMA setup was still
silently kept, and it can confuse the hardware, resulting in the
unexpected noises.  As a workaround, enforce the disablement of DMA
setups when the DMA setup is changed by the kcontrol.

https://bugzilla.kernel.org/show_bug.cgi?id=218185
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/isa/sb/sb16_main.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/isa/sb/sb16_main.c b/sound/isa/sb/sb16_main.c
index c4930efd44e3..5a083eecaa6b 100644
--- a/sound/isa/sb/sb16_main.c
+++ b/sound/isa/sb/sb16_main.c
@@ -714,6 +714,10 @@ static int snd_sb16_dma_control_put(struct snd_kcontrol *kcontrol, struct snd_ct
 	change = nval != oval;
 	snd_sb16_set_dma_mode(chip, nval);
 	spin_unlock_irqrestore(&chip->reg_lock, flags);
+	if (change) {
+		snd_dma_disable(chip->dma8);
+		snd_dma_disable(chip->dma16);
+	}
 	return change;
 }
 
-- 
2.49.0

