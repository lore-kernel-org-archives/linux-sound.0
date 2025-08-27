Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4066B3218AB
	for <linux-sound@vger.kernel.org>; Wed, 27 Aug 2025 08:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756281991; cv=none; b=dJyxy64zQ3oUtuWdafOcgJIqbdfL+J/tabi1sn101366rrhTembKz+GKSkDG2TMsiRky2yRJGnXtXO27iEf6Afkcjx4HCprRYhhXJnYqoC09IHHF3AnQiAx7daccaYLcoCXslo13v1EiWH5+0cRK5DOl5HyWzGAYg/drbfFT5x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756281991; c=relaxed/simple;
	bh=3SvOyLjGV6rRhRZ7F/OPhUmjlphCO5aW/22nKNe04t8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=Fnk5KaPpu7PTie6/pcyzp5mLnE/zgnD9jMwQcyvDaY6iPzqa0zN/N/NBcDbLzMiXhXIKASY4J1JkLMVUP9866Uso7ehxMY/TfOCf1Wog5DOZkffMwG3Tr23a84McBXImFGQ9BPfG85LFWYb+TgiqlU7TptU06Ohv3Hxa7NTIY6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=lsqaEsmG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=WUkNZkUw; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=lsqaEsmG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=WUkNZkUw; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="lsqaEsmG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WUkNZkUw";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="lsqaEsmG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WUkNZkUw"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B8CFF1FEE5;
	Wed, 27 Aug 2025 08:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756281979; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=RHIaRCRtOwu6EmuOjAGL6cVDVT6y3zWvH0ttlzK0bEM=;
	b=lsqaEsmGGUXtkdCGWyupeKseFGF3M4iYK1oLXHLN/Gsalnvht4cylksVeqleMd7r/JhA8O
	Sq8CFiJPO2vgleImrUsgFDVXvrdHDlMwGdBof9n0Z1/VipiNs8WI4wj3IrKpRbYUy030Pf
	8JaD0C9i+XPhzJs0K+Tb5k1clSYjzyE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756281979;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=RHIaRCRtOwu6EmuOjAGL6cVDVT6y3zWvH0ttlzK0bEM=;
	b=WUkNZkUwz4bIIvwfasFEm7H6JTyjYQ1D78CqGZQK7q2xssZiABKtlr+FeZAsXOLsLnF49T
	bsYSvaE+usUGEWCg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756281979; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=RHIaRCRtOwu6EmuOjAGL6cVDVT6y3zWvH0ttlzK0bEM=;
	b=lsqaEsmGGUXtkdCGWyupeKseFGF3M4iYK1oLXHLN/Gsalnvht4cylksVeqleMd7r/JhA8O
	Sq8CFiJPO2vgleImrUsgFDVXvrdHDlMwGdBof9n0Z1/VipiNs8WI4wj3IrKpRbYUy030Pf
	8JaD0C9i+XPhzJs0K+Tb5k1clSYjzyE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756281979;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=RHIaRCRtOwu6EmuOjAGL6cVDVT6y3zWvH0ttlzK0bEM=;
	b=WUkNZkUwz4bIIvwfasFEm7H6JTyjYQ1D78CqGZQK7q2xssZiABKtlr+FeZAsXOLsLnF49T
	bsYSvaE+usUGEWCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 939E713310;
	Wed, 27 Aug 2025 08:06:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id lRPCInu8rmhNdwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 27 Aug 2025 08:06:19 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: pcm: oss: Use guard() for spin locks
Date: Wed, 27 Aug 2025 10:06:13 +0200
Message-ID: <20250827080618.7682-1-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80

Clean up the code using guard() for spin locks.

Merely code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/oss/pcm_oss.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/core/oss/pcm_oss.c b/sound/core/oss/pcm_oss.c
index 4ecb17bd5436..a82dd155e1d3 100644
--- a/sound/core/oss/pcm_oss.c
+++ b/sound/core/oss/pcm_oss.c
@@ -2002,9 +2002,8 @@ static int snd_pcm_oss_set_fragment(struct snd_pcm_oss_file *pcm_oss_file, unsig
 
 static int snd_pcm_oss_nonblock(struct file * file)
 {
-	spin_lock(&file->f_lock);
+	guard(spinlock)(&file->f_lock);
 	file->f_flags |= O_NONBLOCK;
-	spin_unlock(&file->f_lock);
 	return 0;
 }
 
-- 
2.50.1

