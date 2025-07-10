Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A9D2D59EA
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 10:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752142106; cv=none; b=jxorl4xgoOTpAA0q4X+ue6tyaOY+ikR3LsGAmQI7YsjrFvmnvxwmIIu2JnEcd76491WejTGYe7W9i9YifKdmgMO0nxJexkG60TAOPJpMt/w/UQ4zy/lXPGYhi34vg3n2EFj+B2ivSyc8hIy4WZFjFL+DZ6/ARrYld4+NAifG7Bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752142106; c=relaxed/simple;
	bh=BAdR+uA8UvM1YqxJy4g5AyeAXg+35LrUabmfLVNcZJg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AJmHX+ci1obj5sLaUzau6Dk5mqJYQ0g0bW/T51cHrFWuIo3tRHJqn6wqLEdYEzRsDUb4SAsfJEFBowIPaSYqskZkvQWW8D4QdFZP48pXUe1t04yu7dhCl0ZIWjYdz8Fk26RGJC4FPZWWeEQmJ3lgB0kJzZFJxFKUga7LYi2eQik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QkLFHfr8; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=NmfWJi32; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QkLFHfr8; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=NmfWJi32; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QkLFHfr8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="NmfWJi32";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QkLFHfr8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="NmfWJi32"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3A92821181;
	Thu, 10 Jul 2025 10:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142058; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n/jPuCD0QibnPfCaXL0MX8XkMmy0APZS2RKqNkrjHts=;
	b=QkLFHfr8m9f18DUu+PnEcNsgK5K/as+i0W3f4YYhouI3Mz8/Cc9J3TZBQ2wkfbr/OsxjMZ
	eUT9Z05ZwPqygOXOSgwwl0d0ra5K128DD5WAFHEd50aHA6TEIcsvH9iQsR9rtHRebR6G2C
	pYG9lXIL6nuXiQsXAgnKHoDii5PEuIk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142058;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n/jPuCD0QibnPfCaXL0MX8XkMmy0APZS2RKqNkrjHts=;
	b=NmfWJi32ns2BQz1+om4PsHYKWx8O709CSu8HTHAElSXayCpxMnvhbdj+t9qtg/xI/Hwl1F
	qmvUKJG5AUgsRPCg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=QkLFHfr8;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=NmfWJi32
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142058; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n/jPuCD0QibnPfCaXL0MX8XkMmy0APZS2RKqNkrjHts=;
	b=QkLFHfr8m9f18DUu+PnEcNsgK5K/as+i0W3f4YYhouI3Mz8/Cc9J3TZBQ2wkfbr/OsxjMZ
	eUT9Z05ZwPqygOXOSgwwl0d0ra5K128DD5WAFHEd50aHA6TEIcsvH9iQsR9rtHRebR6G2C
	pYG9lXIL6nuXiQsXAgnKHoDii5PEuIk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142058;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n/jPuCD0QibnPfCaXL0MX8XkMmy0APZS2RKqNkrjHts=;
	b=NmfWJi32ns2BQz1+om4PsHYKWx8O709CSu8HTHAElSXayCpxMnvhbdj+t9qtg/xI/Hwl1F
	qmvUKJG5AUgsRPCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2166213A70;
	Thu, 10 Jul 2025 10:07:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id wMHvBuqQb2jZWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 10 Jul 2025 10:07:38 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 011/103] ALSA: virmidi: Use safer strscpy() instead of strcpy()
Date: Thu, 10 Jul 2025 12:05:53 +0200
Message-ID: <20250710100727.22653-12-tiwai@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 3A92821181
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01

Use a safer function strscpy() instead of strcpy() for copying to
arrays.

Only idiomatic code replacement, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/drivers/virmidi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/drivers/virmidi.c b/sound/drivers/virmidi.c
index 5f7b65ad63e3..a204f42d1026 100644
--- a/sound/drivers/virmidi.c
+++ b/sound/drivers/virmidi.c
@@ -95,11 +95,11 @@ static int snd_virmidi_probe(struct platform_device *devptr)
 		if (err < 0)
 			return err;
 		vmidi->midi[idx] = rmidi;
-		strcpy(rmidi->name, "Virtual Raw MIDI");
+		strscpy(rmidi->name, "Virtual Raw MIDI");
 	}
 
-	strcpy(card->driver, "VirMIDI");
-	strcpy(card->shortname, "VirMIDI");
+	strscpy(card->driver, "VirMIDI");
+	strscpy(card->shortname, "VirMIDI");
 	sprintf(card->longname, "Virtual MIDI Card %i", dev + 1);
 
 	err = snd_card_register(card);
-- 
2.50.0

