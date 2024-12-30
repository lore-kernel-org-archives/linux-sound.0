Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A60851991D2
	for <linux-sound@vger.kernel.org>; Mon, 30 Dec 2024 11:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735556750; cv=none; b=kRsqnPbvvWz6sI3VgdXsdFDwr9GXmVR1v3B3iNeE3w7I84tIbmuXc6b4u9P75Js/jTy136TVMarcg37EHMY0Eyl+cDMFKAff27AgaFZVT1Js2JL7eVe77UCu8o8eCbkJ22NNk8G5feJz4h6hhwcNnY8ItHmgNuWa08NXaxr2MEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735556750; c=relaxed/simple;
	bh=UiG2pse+GSxwpI90N+X8m6SDBUeCANgkSHQou7gnack=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BbthkwgPp8IGl0/XM6LThF8dYOVDszRI9guwLsOUZyNspqUGLFD6saodbLwA+DWOZpPjnjC652F43F7HOxfahBQI5tEbmBw4AQuISp5ifdk7abKHU+bvB0UfNTE1SzWsBg4L+PiChkjisLP3HLeoIABQrfhAgNnT/oFIO4FhIW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=IxjbW+mm; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=iy8gJQ6f; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=IxjbW+mm; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=iy8gJQ6f; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="IxjbW+mm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="iy8gJQ6f";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="IxjbW+mm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="iy8gJQ6f"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id AF93D1F381;
	Mon, 30 Dec 2024 11:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1735556746; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=2jQf5F6B6aS8qXCzBOe/43rvv2352jQ3oVXVmEQG9HQ=;
	b=IxjbW+mmpuSxkPXEVKQdpKDpMiVnPdvAWP2KstEEBOHEARzRhzJwfG4IjOWW8If67Fz3nZ
	NRaQYj0SyKlzNRQycFoav76E0ESuGXx+f8rGPQpm1wCT3FerLSCfsMWngwawz8b+g6z7Vl
	wv7UMedjMlpiKaRA/yRLLrma3o85qeI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1735556746;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=2jQf5F6B6aS8qXCzBOe/43rvv2352jQ3oVXVmEQG9HQ=;
	b=iy8gJQ6f30QuzHQ1jVTj+EOkExLaYZoM4mTLTaZgjxQ7ahzxA6gZ7v6HBR0z95H/Y5OkpE
	mG6kKNBp28OyGvBw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=IxjbW+mm;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=iy8gJQ6f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1735556746; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=2jQf5F6B6aS8qXCzBOe/43rvv2352jQ3oVXVmEQG9HQ=;
	b=IxjbW+mmpuSxkPXEVKQdpKDpMiVnPdvAWP2KstEEBOHEARzRhzJwfG4IjOWW8If67Fz3nZ
	NRaQYj0SyKlzNRQycFoav76E0ESuGXx+f8rGPQpm1wCT3FerLSCfsMWngwawz8b+g6z7Vl
	wv7UMedjMlpiKaRA/yRLLrma3o85qeI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1735556746;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=2jQf5F6B6aS8qXCzBOe/43rvv2352jQ3oVXVmEQG9HQ=;
	b=iy8gJQ6f30QuzHQ1jVTj+EOkExLaYZoM4mTLTaZgjxQ7ahzxA6gZ7v6HBR0z95H/Y5OkpE
	mG6kKNBp28OyGvBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8AFF113A30;
	Mon, 30 Dec 2024 11:05:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 3FdnIIp+cmfmbgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 30 Dec 2024 11:05:46 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Kun Hu <huk23@m.fudan.edu.cn>
Subject: [PATCH] ALSA: seq: oss: Fix races at processing SysEx messages
Date: Mon, 30 Dec 2024 12:05:35 +0100
Message-ID: <20241230110543.32454-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: AF93D1F381
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:email,suse.de:dkim,suse.de:mid];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_TWO(0.00)[2];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO

OSS sequencer handles the SysEx messages split in 6 bytes packets, and
ALSA sequencer OSS layer tries to combine those.  It stores the data
in the internal buffer and this access is racy as of now, which may
lead to the out-of-bounds access.

As a temporary band-aid fix, introduce a mutex for serializing the
process of the SysEx message packets.

Reported-by: Kun Hu <huk23@m.fudan.edu.cn>
Closes: https://lore.kernel.org/2B7E93E4-B13A-4AE4-8E87-306A8EE9BBB7@m.fudan.edu.cn
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/seq/oss/seq_oss_synth.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/core/seq/oss/seq_oss_synth.c b/sound/core/seq/oss/seq_oss_synth.c
index e3394919daa0..51ee4c00a843 100644
--- a/sound/core/seq/oss/seq_oss_synth.c
+++ b/sound/core/seq/oss/seq_oss_synth.c
@@ -66,6 +66,7 @@ static struct seq_oss_synth midi_synth_dev = {
 };
 
 static DEFINE_SPINLOCK(register_lock);
+static DEFINE_MUTEX(sysex_mutex);
 
 /*
  * prototypes
@@ -497,6 +498,7 @@ snd_seq_oss_synth_sysex(struct seq_oss_devinfo *dp, int dev, unsigned char *buf,
 	if (!info)
 		return -ENXIO;
 
+	guard(mutex)(&sysex_mutex);
 	sysex = info->sysex;
 	if (sysex == NULL) {
 		sysex = kzalloc(sizeof(*sysex), GFP_KERNEL);
-- 
2.43.0

