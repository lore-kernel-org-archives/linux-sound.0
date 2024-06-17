Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B48F19047F
	for <linux-sound@vger.kernel.org>; Mon, 17 Jun 2024 10:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718618707; cv=none; b=H+/J1ZyzvSxpvqbw63wUN2vp4tcCJN1cXuNztyzkz8pnbAAOsQTmcjhWcbbq3kmdbDX+Q3d6ElbyIsZTs0dVpbChg3HHI1JM6jDJ1fyP8GkcK+LeswMknTrGuVjXuci6US+NfcPDodSJpH79KvMcegTtlftsn+Xhv5lUFN/jZNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718618707; c=relaxed/simple;
	bh=rOGJN3dEEeXhfh9VRmegir8SjBGFmJOwvGPAJ2OxRts=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gne834cPPnXdYoQp0KMEhz66+VjJODIc5zFFb+ceE+OhoKn9oSz4ruMXMlts1POBODjdNQAYQ0dYRPWXAs6+KGjbHQYSztHzsx9hHj47ToInHN8/BReDoDEX5252M/gDo8F4tHTvC1r8HbB/H5UUhvFXrtKHlvyC24eoLCdrXf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0Y3MBDx8; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=/LllwXAL; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0Y3MBDx8; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=/LllwXAL; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0Y3MBDx8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/LllwXAL";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0Y3MBDx8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/LllwXAL"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B878537FCE;
	Mon, 17 Jun 2024 10:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1718618704; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JTSz3xCQbF1FkIS8O1r2SLhzKMlYtOs7VGil3BDwEeQ=;
	b=0Y3MBDx8cOU4ZDtsPZ5/goUbCyHSAyErBu06ysO6vVDOwkBaAT3YIQn4SC/+gYhBnRZm/Q
	2AA+Gs0lwhBtJDGtiL0NhhSFo0ay5uLTixGJAyYHTp2Tl/RUQQj7ED7Thvn9j+Z5LOkxQC
	ujqr538t8eFEgy1qLTWqvED1e1DMfvI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1718618704;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JTSz3xCQbF1FkIS8O1r2SLhzKMlYtOs7VGil3BDwEeQ=;
	b=/LllwXALhW/TE7cpGbMdEy4FGZmW3aNZuH8Wv2rglR2WitZNIUFMElSX9UEfvQf6z8hHj4
	z679gc8/HofjelDw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=0Y3MBDx8;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="/LllwXAL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1718618704; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JTSz3xCQbF1FkIS8O1r2SLhzKMlYtOs7VGil3BDwEeQ=;
	b=0Y3MBDx8cOU4ZDtsPZ5/goUbCyHSAyErBu06ysO6vVDOwkBaAT3YIQn4SC/+gYhBnRZm/Q
	2AA+Gs0lwhBtJDGtiL0NhhSFo0ay5uLTixGJAyYHTp2Tl/RUQQj7ED7Thvn9j+Z5LOkxQC
	ujqr538t8eFEgy1qLTWqvED1e1DMfvI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1718618704;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JTSz3xCQbF1FkIS8O1r2SLhzKMlYtOs7VGil3BDwEeQ=;
	b=/LllwXALhW/TE7cpGbMdEy4FGZmW3aNZuH8Wv2rglR2WitZNIUFMElSX9UEfvQf6z8hHj4
	z679gc8/HofjelDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9F419139AB;
	Mon, 17 Jun 2024 10:05:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id eKO5JVAKcGYfAgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 17 Jun 2024 10:05:04 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 3/5] ALSA: emu10k1:  Drop NULL check for snd_ctl_remove()
Date: Mon, 17 Jun 2024 12:05:25 +0200
Message-ID: <20240617100529.6667-4-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240617100529.6667-1-tiwai@suse.de>
References: <20240617100529.6667-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCVD_TLS_ALL(0.00)[];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:email,suse.de:dkim];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: B878537FCE
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 

Since snd_ctl_remove() accepts the NULL kcontrol argument now, we can
drop the check in the caller side.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/emu10k1/emufx.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/sound/pci/emu10k1/emufx.c b/sound/pci/emu10k1/emufx.c
index 03efc317e05f..34f385b5cd46 100644
--- a/sound/pci/emu10k1/emufx.c
+++ b/sound/pci/emu10k1/emufx.c
@@ -959,7 +959,6 @@ static int snd_emu10k1_del_controls(struct snd_emu10k1 *emu,
 {
 	unsigned int i;
 	struct emu10k1_ctl_elem_id id;
-	struct snd_emu10k1_fx8010_ctl *ctl;
 	struct snd_card *card = emu->card;
 	int err;
 	
@@ -968,9 +967,7 @@ static int snd_emu10k1_del_controls(struct snd_emu10k1 *emu,
 				       in_kernel);
 		if (err < 0)
 			return err;
-		ctl = snd_emu10k1_look_for_ctl(emu, &id);
-		if (ctl)
-			snd_ctl_remove(card, ctl->kcontrol);
+		snd_ctl_remove(card, snd_emu10k1_look_for_ctl(emu, &id));
 	}
 	return 0;
 }
-- 
2.43.0

