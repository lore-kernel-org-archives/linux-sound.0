Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A220E152E0C
	for <linux-sound@vger.kernel.org>; Thu, 28 Nov 2024 10:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732790985; cv=none; b=uxgCd1wATOrrX2Yd3sZXT2uHHY8PQ0/Heq9oxPGqnzsqh7okd2svR+mquDWtaa9KfDG388oEuLDrsxjw+Wg+4cEitMy6iYDN/xh8onNbvOH8Cd4R+dHmlwgg0OOyNEiS6Iuy5B6m06Fb6Q+bndILYkUoHLlOMNypRRuYh0t7SZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732790985; c=relaxed/simple;
	bh=1jn4xDvGgaEUB5L/dwocIX1KhnJyAuuVoCS2ryCgXSs=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=r32IY3E6N33+Q6pWUoFCu/8wF/Ct36cK3bFnlj0hTRg2hpX8pKP95HsuC1SuKbF1xLR1vMJWlzLc/3OWN21x+ZLJrncMOzs6vBjAkSyeiYlxYcour6+fh6vSXBQedelKikV1Z/kORnvELtsAfwddKYBjKLHfC/9iJBhAxaWlGiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qfBUNTPs; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=pFdh206S; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qfBUNTPs; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=pFdh206S; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qfBUNTPs";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pFdh206S";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qfBUNTPs";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pFdh206S"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9203F21101;
	Thu, 28 Nov 2024 10:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1732790981; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=KwMhn+zrd1O6YFS2iHx9hUjrX5c00Fz7MfRKAssZcdM=;
	b=qfBUNTPsHm3Eyoo5fEwfAJ9oQBmHUe7m8Ij/e+pyQ4OXJN/iYnWkQp07qVBIY/4iJJGypR
	igWHIlZNYgXSoeyoA38dv5JylBQLF2By2Wb6mVB52PDx75qHQ2jaWt7yXPuUoY2ZOAL7Me
	rrNST5HYCVKuVjwZxnL/mz04EoOG4lk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1732790981;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=KwMhn+zrd1O6YFS2iHx9hUjrX5c00Fz7MfRKAssZcdM=;
	b=pFdh206SNUUgFKw8zXZUiuJ7nu83zYvIMn325lM6LpwrtAXNQMSn3CYTkANuuj9o64W/XG
	4tfDsI15Ojd3SlBQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=qfBUNTPs;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=pFdh206S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1732790981; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=KwMhn+zrd1O6YFS2iHx9hUjrX5c00Fz7MfRKAssZcdM=;
	b=qfBUNTPsHm3Eyoo5fEwfAJ9oQBmHUe7m8Ij/e+pyQ4OXJN/iYnWkQp07qVBIY/4iJJGypR
	igWHIlZNYgXSoeyoA38dv5JylBQLF2By2Wb6mVB52PDx75qHQ2jaWt7yXPuUoY2ZOAL7Me
	rrNST5HYCVKuVjwZxnL/mz04EoOG4lk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1732790981;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=KwMhn+zrd1O6YFS2iHx9hUjrX5c00Fz7MfRKAssZcdM=;
	b=pFdh206SNUUgFKw8zXZUiuJ7nu83zYvIMn325lM6LpwrtAXNQMSn3CYTkANuuj9o64W/XG
	4tfDsI15Ojd3SlBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 67BEC13974;
	Thu, 28 Nov 2024 10:49:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id h6iHF8VKSGe9TAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 28 Nov 2024 10:49:41 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: sh: Use standard helper for buffer accesses
Date: Thu, 28 Nov 2024 11:49:38 +0100
Message-ID: <20241128104939.13755-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 9203F21101
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_NONE(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,suse.de:mid,intel.com:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO

The SH DAC audio driver uses the kmalloc'ed buffer as the main PCM
buffer, and the data is transferred via hrtimer callbacks manually
from there to the hardware.  Meanwhile, some of its code are written
as if the buffer is on iomem and use the special helpers for the iomem
(e.g. copy_from_iter_toio() or memset_io()).  Those are rather useless
and the standard helpers should be used.

Similarly, the PCM mmap callback is set to a special one with
snd_pcm_lib_mmap_iomem, but this is also nonsense, because SH
architecture doesn't support this function, hence it leads just to
NULL -- the fallback to the standard helper.

This patch replaces those special setups with the standard ones.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202411281337.I4M07b7i-lkp@intel.com/
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/sh/sh_dac_audio.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/sh/sh_dac_audio.c b/sound/sh/sh_dac_audio.c
index e7b80328f0ef..a4d07438ad64 100644
--- a/sound/sh/sh_dac_audio.c
+++ b/sound/sh/sh_dac_audio.c
@@ -163,7 +163,7 @@ static int snd_sh_dac_pcm_copy(struct snd_pcm_substream *substream,
 	/* channel is not used (interleaved data) */
 	struct snd_sh_dac *chip = snd_pcm_substream_chip(substream);
 
-	if (copy_from_iter_toio(chip->data_buffer + pos, src, count))
+	if (copy_from_iter(chip->data_buffer + pos, src, count) != count)
 		return -EFAULT;
 	chip->buffer_end = chip->data_buffer + pos + count;
 
@@ -182,7 +182,7 @@ static int snd_sh_dac_pcm_silence(struct snd_pcm_substream *substream,
 	/* channel is not used (interleaved data) */
 	struct snd_sh_dac *chip = snd_pcm_substream_chip(substream);
 
-	memset_io(chip->data_buffer + pos, 0, count);
+	memset(chip->data_buffer + pos, 0, count);
 	chip->buffer_end = chip->data_buffer + pos + count;
 
 	if (chip->empty) {
@@ -211,7 +211,6 @@ static const struct snd_pcm_ops snd_sh_dac_pcm_ops = {
 	.pointer	= snd_sh_dac_pcm_pointer,
 	.copy		= snd_sh_dac_pcm_copy,
 	.fill_silence	= snd_sh_dac_pcm_silence,
-	.mmap		= snd_pcm_lib_mmap_iomem,
 };
 
 static int snd_sh_dac_pcm(struct snd_sh_dac *chip, int device)
-- 
2.43.0

