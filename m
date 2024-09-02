Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE4ED14E2FA
	for <linux-sound@vger.kernel.org>; Mon,  2 Sep 2024 06:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725258103; cv=none; b=fft+1uW+MtusPp8CaLa98VyMEaUaq+1gfO0fHdixKvuoXFPwd4sAYkPrja0BqCFN9f1fELlye7WRBlS+eqezaJBnfOzuF5rBrkHkwQHYV0brWhp7gheaCMyOked+nuKdmgqGrx5kwX81FOo/IWNVxmX8AK3FOGLo85pXmTxkzs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725258103; c=relaxed/simple;
	bh=E9Nxr0x+rAN04u+trP9sW6Bq/MRJ0wbD0Gg5OMuhtHo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A/mw1kfQdPPvd9/T22jYH8aU55hLLHsGPmwab9Pvz8mK1vqNqFw4uWZMmNwWqmSUP+fFOoD5AItE+Wt4KQZUqamGHZhxqDoVV+w62v8eXN4u/wN8MWTHSGV7s8dRA5bqIlD0llaG+GfmL2QkMx0KCCW3Gr1x6DDBwwBM/xPerAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=t8a4GpGM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ck+oJNI2; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Vj4nJVm5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=abnirMVF; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="t8a4GpGM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ck+oJNI2";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Vj4nJVm5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="abnirMVF"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D9CA41FB97;
	Mon,  2 Sep 2024 06:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1725258098; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=k+7JI27m7nb8XcUfp7dz2AmfxQ+Ic9mDnHZ6WN5weUk=;
	b=t8a4GpGMRYjXKNs8QS5oPLA6PBA/TvjCaQLiRdqE+BsQMquzMPc8w8hTnvmT4EI0m1/kH/
	fmkindGd/tCtJ0Xcn83Da5+wmJMnPCwN+b2e8HotgMOia+mjMMh7B+sSs4BogJ4X/RBngv
	JyRU6yLfIq2yFe2CItjq7rwYpRgYnpA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1725258098;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=k+7JI27m7nb8XcUfp7dz2AmfxQ+Ic9mDnHZ6WN5weUk=;
	b=ck+oJNI2v5iZbEyivyDjAUKEOFvB4TA0dPlJiocrm/15P+g4j8Zfs6nzBjEotKyAwooPfe
	NAKzRKkOJN2by5Aw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Vj4nJVm5;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=abnirMVF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1725258097; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=k+7JI27m7nb8XcUfp7dz2AmfxQ+Ic9mDnHZ6WN5weUk=;
	b=Vj4nJVm5+gTVE5HpryXNjhvP7T2mdiTc7NrfugUXyBcExV/EClbMPLXKJggE0wbp7wE/kT
	8PngdNVF8uzW+2rDsDH1iex4021vG69IYCxow33c/2UjUDWRUmHPmmqf97kJ1G0Ly4Jjx4
	aj1zFc3CrCbHmg8R+vtcQo4GxNG8P9E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1725258097;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=k+7JI27m7nb8XcUfp7dz2AmfxQ+Ic9mDnHZ6WN5weUk=;
	b=abnirMVF715cM1XVv+Cw/Yk2Wj+m0jfCEXhoJRj4VXZOHEFvzTUHG3TnC7lykCbVMwMVr6
	WZ78BokUcw7d3+Bw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B485A13AE5;
	Mon,  2 Sep 2024 06:21:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id IZzNKnFZ1WYyGwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 02 Sep 2024 06:21:37 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH] ALSA: pcm: Fix yet more compile warning at replacement with kstrtoul()
Date: Mon,  2 Sep 2024 08:22:16 +0200
Message-ID: <20240902062217.9777-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: D9CA41FB97
X-Spam-Score: -5.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	DWL_DNSWL_MED(-2.00)[suse.de:dkim];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

The previous fix brought yet another compile warning at pr_debug()
call with the changed size.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://lore.kernel.org/20240902132904.5ee173f3@canb.auug.org.au
Fixes: 43b42ed438bf ("ALSA: pcm: Fix the previous conversion to kstrtoul()")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/pcm_memory.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/pcm_memory.c b/sound/core/pcm_memory.c
index 5001181208df..ea3941f8666b 100644
--- a/sound/core/pcm_memory.c
+++ b/sound/core/pcm_memory.c
@@ -212,7 +212,7 @@ static void snd_pcm_lib_preallocate_proc_write(struct snd_info_entry *entry,
 					   substream->stream,
 					   size, &new_dmab) < 0) {
 				buffer->error = -ENOMEM;
-				pr_debug("ALSA pcmC%dD%d%c,%d:%s: cannot preallocate for size %zu\n",
+				pr_debug("ALSA pcmC%dD%d%c,%d:%s: cannot preallocate for size %lu\n",
 					 substream->pcm->card->number, substream->pcm->device,
 					 substream->stream ? 'c' : 'p', substream->number,
 					 substream->pcm->name, size);
-- 
2.43.0

