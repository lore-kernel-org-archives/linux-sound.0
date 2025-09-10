Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF6AB31CA57
	for <linux-sound@vger.kernel.org>; Wed, 10 Sep 2025 11:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757502607; cv=none; b=HF+8CYPMa5wYOCdFddmxW3HZFDTowrPe9Ft8HJX7BP882XBt2XoCdVkLVkoZ8SIv91L8TFkz3fOVJ8mmeTgXsNtVNfIof0OpXXREuArnDjACBsniH0G2MeEujpWMDp+vILRMi44MiRgGZbu/599Hv4DKAwYOuhD8A03v361KPwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757502607; c=relaxed/simple;
	bh=pMLQU6j7pk5mARF6N+7jvs5jgmRidPGI+lwXXeqRnmY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AS9/kNOVn0FicfJxKxhdXOfLf72C9NE8EOUWxp/+MI2carvybfkZH+4aiUF9TlQqyq71YWdSlL0+7tAsxwClSet5yBdba0G6QtutPUAZi/B87hlnrsraMdbhswe1uksB9KmvHYSMqaVMWb2Dy2GKk5Qdf9ca4pRXeCU8gsLD4wY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=TIfbe0KL; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=LBl7NCta; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=TIfbe0KL; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=LBl7NCta; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TIfbe0KL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LBl7NCta";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TIfbe0KL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LBl7NCta"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0BD07601B3;
	Wed, 10 Sep 2025 11:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1757502585; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xj0QzBc63Bl9FCh0jQxszXNryK9JJP5rxMjilH4K9vw=;
	b=TIfbe0KLK9b4/hQZI0A1k5POfdG4fnMLR5Jg5QYKipOUt2xpZLENQXX27Zmje8SIM4aOuy
	z6kSEyp775YTbQNmg2TGXjv9N6MXuAiDUQQabBDcc4tyL08AkclqcwMDiP6JSzJh9X4uhO
	KTTvEuxID0+wGil2bOX/uYf+Ln5/c2Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1757502585;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xj0QzBc63Bl9FCh0jQxszXNryK9JJP5rxMjilH4K9vw=;
	b=LBl7NCtanx+3Nyy44tHHuBCLtQkqh8xMj1SHfeL9P9jl/8gbclnwi2F2cbOaRqy82mBiAN
	wguEdMcIllilUwCA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=TIfbe0KL;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=LBl7NCta
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1757502585; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xj0QzBc63Bl9FCh0jQxszXNryK9JJP5rxMjilH4K9vw=;
	b=TIfbe0KLK9b4/hQZI0A1k5POfdG4fnMLR5Jg5QYKipOUt2xpZLENQXX27Zmje8SIM4aOuy
	z6kSEyp775YTbQNmg2TGXjv9N6MXuAiDUQQabBDcc4tyL08AkclqcwMDiP6JSzJh9X4uhO
	KTTvEuxID0+wGil2bOX/uYf+Ln5/c2Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1757502585;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xj0QzBc63Bl9FCh0jQxszXNryK9JJP5rxMjilH4K9vw=;
	b=LBl7NCtanx+3Nyy44tHHuBCLtQkqh8xMj1SHfeL9P9jl/8gbclnwi2F2cbOaRqy82mBiAN
	wguEdMcIllilUwCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E649013301;
	Wed, 10 Sep 2025 11:09:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id sP33NnhcwWi+YAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 10 Sep 2025 11:09:44 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 02/14] ALSA: aoa: Don't split string across lines
Date: Wed, 10 Sep 2025 13:09:17 +0200
Message-ID: <20250910110932.15234-3-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250910110932.15234-1-tiwai@suse.de>
References: <20250910110932.15234-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_NONE(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim,suse.de:email];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 0BD07601B3
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01

We shouldn't split a quoted string, as it worsens the grep-ability.
Put back to the single line, which also makes checkpatch.pl happier.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/aoa/soundbus/i2sbus/pcm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/aoa/soundbus/i2sbus/pcm.c b/sound/aoa/soundbus/i2sbus/pcm.c
index fe11fee3c78f..4c480ad2c05d 100644
--- a/sound/aoa/soundbus/i2sbus/pcm.c
+++ b/sound/aoa/soundbus/i2sbus/pcm.c
@@ -637,8 +637,8 @@ static inline void handle_interrupt(struct i2sbus_dev *i2sdev, int in)
 				if (!(status & ACTIVE) && (!in || (status & 0x80)))
 					break;
 				if (--timeout <= 0) {
-					printk(KERN_ERR "i2sbus: timed out "
-					       "waiting for DMA to stop!\n");
+					printk(KERN_ERR
+					       "i2sbus: timed out waiting for DMA to stop!\n");
 					break;
 				}
 				udelay(1);
-- 
2.50.1

