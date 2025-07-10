Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A9952D5C6D
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 10:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752142229; cv=none; b=Jh93KpL0Infn3bR5adEjeu+vFGloEd+VoDbvyhHVh6n4+nxFCDx/QyhvOHlXHhO7xvn4FccIzbFMHs31NDI1fDCo/DfS3bU1HkDQ2vtxWKWbirHhTJhpbrzs/UFTwzj4avb/hKBzzQrprG/QFjUBDb01YOg4qYfYfJ1I+FozUUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752142229; c=relaxed/simple;
	bh=fs5ybda6o0e1tWB19cda83jZsKcbMPOPADkyo5CLblc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ddXZVqGOtGpT3i9eQxfvjUlPCa5lXlwvEmbUwh3oWGevRAnmgYP1Z2RBnbrNoGNdwYF6VTb5NFwa7Oln/Jn5RF5fJkbENBwaoa+9gYMZ7Kd+7Ar91zz+thOQhhjhifnLdZFjfWnOu1PnBcVru9yYnWjCYWTqWZKe4jjtM2xp4zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=HwV1nmEU; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ep2h+W7b; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=HwV1nmEU; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ep2h+W7b; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HwV1nmEU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ep2h+W7b";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HwV1nmEU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ep2h+W7b"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 246F51F74D;
	Thu, 10 Jul 2025 10:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142066; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S0JdzQfxemxJ7pe0be2K5zZ/5DLDuELS5JdQp8Cooi8=;
	b=HwV1nmEUicOolsvkKx5VxnElGM6wO6zU5sKuj6wFoSYdApLx97Ua2CII4sL1a2zFCL2UmL
	6/PBbMo81hMoDhOZGTeZTGyie3FG+FIVwDgt4DLDPF89RsazShsayXsfZGcjlmXGEB2WR9
	06RE3KBNrcfePV9gr7GX5rBYoKbQN1U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142066;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S0JdzQfxemxJ7pe0be2K5zZ/5DLDuELS5JdQp8Cooi8=;
	b=ep2h+W7bYZ3RI1eFJPDviXJ2MmNhBgo8N68mwCkeQts7wQSZ8pWpiVpMajGEH+w/nMImRP
	i4rrmu7rOnqyzRCQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=HwV1nmEU;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=ep2h+W7b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142066; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S0JdzQfxemxJ7pe0be2K5zZ/5DLDuELS5JdQp8Cooi8=;
	b=HwV1nmEUicOolsvkKx5VxnElGM6wO6zU5sKuj6wFoSYdApLx97Ua2CII4sL1a2zFCL2UmL
	6/PBbMo81hMoDhOZGTeZTGyie3FG+FIVwDgt4DLDPF89RsazShsayXsfZGcjlmXGEB2WR9
	06RE3KBNrcfePV9gr7GX5rBYoKbQN1U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142066;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S0JdzQfxemxJ7pe0be2K5zZ/5DLDuELS5JdQp8Cooi8=;
	b=ep2h+W7bYZ3RI1eFJPDviXJ2MmNhBgo8N68mwCkeQts7wQSZ8pWpiVpMajGEH+w/nMImRP
	i4rrmu7rOnqyzRCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0B5B6136DC;
	Thu, 10 Jul 2025 10:07:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id QDucAfKQb2jZWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 10 Jul 2025 10:07:46 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 070/103] ALSA: lola: Use safer strscpy() instead of strcpy()
Date: Thu, 10 Jul 2025 12:06:52 +0200
Message-ID: <20250710100727.22653-71-tiwai@suse.de>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250710100727.22653-1-tiwai@suse.de>
References: <20250710100727.22653-1-tiwai@suse.de>
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
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim,suse.de:email];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLe1mc1hwayk397878n5a1j337)];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 246F51F74D
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01

Use a safer function strscpy() instead of strcpy() for copying to
arrays.

Only idiomatic code replacement, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/lola/lola.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/pci/lola/lola.c b/sound/pci/lola/lola.c
index fb8bd54e4c2d..8d927ecba165 100644
--- a/sound/pci/lola/lola.c
+++ b/sound/pci/lola/lola.c
@@ -630,12 +630,12 @@ static int lola_create(struct snd_card *card, struct pci_dev *pci, int dev)
 	if (err < 0)
 		return err;
 
-	strcpy(card->driver, "Lola");
+	strscpy(card->driver, "Lola");
 	strscpy(card->shortname, "Digigram Lola", sizeof(card->shortname));
 	snprintf(card->longname, sizeof(card->longname),
 		 "%s at 0x%lx irq %i",
 		 card->shortname, chip->bar[0].addr, chip->irq);
-	strcpy(card->mixername, card->shortname);
+	strscpy(card->mixername, card->shortname);
 
 	lola_irq_enable(chip);
 
-- 
2.50.0

