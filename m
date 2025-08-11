Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54E94220685
	for <linux-sound@vger.kernel.org>; Mon, 11 Aug 2025 10:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754906951; cv=none; b=B6I93d9VBgH/wpGYSehnfIB0rvQUKm6fpMsZZcYrOtE3HaBko9OhVbXxAu1Jci10CPJf7U8ciBRJJQ31NEq1MJpHyi65GFAb/acrCRIgThVnxY2se3H+/GATNuBPpzdX+uCgEwY8xeomZ7Q79FjicnGLk3gxm9GeDfS5YJwx6ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754906951; c=relaxed/simple;
	bh=+Ekx7PJfEMiPLDnhggvASNTSPw+xAQTODjuchxfgzsw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mJkzB4gdt7OBXraxf1F2WJdp6EpVGRkj0iNRz10sI3RkI//q+Y+KyfaBYC+EXaCyoRPtSWf1CuEaF5IjTh4nHg9lzIU8WZspr5j5UjSEzG0u/jAKy4GMpBm2oOrF7WrH5ZkFgtk7oU0JZsuzWx1LMY/eIq4ZWdYbCdXCWdrMSFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=d5HBbphB; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=nrGhuNmK; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=d5HBbphB; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=nrGhuNmK; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="d5HBbphB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nrGhuNmK";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="d5HBbphB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nrGhuNmK"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2A46B33E76;
	Mon, 11 Aug 2025 10:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1754906898; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2/TyXS1q2cPfoRgXZaMkSypmtl22zRU/qt9o+FHjtSo=;
	b=d5HBbphBsUJYi0pqWQatZ1r6tWtNntLAU5IUhjg9KxOc3u3K9E78ybwlvf187Sikqbaaxl
	Bl9RucCEILHSD0Hs5u7BKtRFoe9lqgp5Y/yIAQ+U1Z2XxtLKcFmdKfGVzHh0ah1Sb72RH6
	8JazaX5mqJxkEXmSaG7usxhJJfSsbFY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754906898;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2/TyXS1q2cPfoRgXZaMkSypmtl22zRU/qt9o+FHjtSo=;
	b=nrGhuNmK7Yjp4wJjF/P8j8SGbsNFXve+kDuEOB43pTMW/tNHgTq31tDYPkFB98EFNmQb74
	Vzkhe9JNMHAM3cCg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1754906898; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2/TyXS1q2cPfoRgXZaMkSypmtl22zRU/qt9o+FHjtSo=;
	b=d5HBbphBsUJYi0pqWQatZ1r6tWtNntLAU5IUhjg9KxOc3u3K9E78ybwlvf187Sikqbaaxl
	Bl9RucCEILHSD0Hs5u7BKtRFoe9lqgp5Y/yIAQ+U1Z2XxtLKcFmdKfGVzHh0ah1Sb72RH6
	8JazaX5mqJxkEXmSaG7usxhJJfSsbFY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754906898;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2/TyXS1q2cPfoRgXZaMkSypmtl22zRU/qt9o+FHjtSo=;
	b=nrGhuNmK7Yjp4wJjF/P8j8SGbsNFXve+kDuEOB43pTMW/tNHgTq31tDYPkFB98EFNmQb74
	Vzkhe9JNMHAM3cCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E791D13A7E;
	Mon, 11 Aug 2025 10:08:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id cEtONxHBmWiVBwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 11 Aug 2025 10:08:17 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	patches@opensource.cirrus.com,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>
Subject: [PATCH 21/25] ALSA: hda/generic: Use auto cleanup for temporary buffers
Date: Mon, 11 Aug 2025 12:07:55 +0200
Message-ID: <20250811100807.7962-22-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250811100807.7962-1-tiwai@suse.de>
References: <20250811100807.7962-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	R_RATELIMIT(0.00)[to_ip_from(RLf66hkhxcz6y1w5afddqk81z3)];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -2.80

The release of temporary kmalloced buffers can be nicely handled via
the standard __free(kfree).

Only code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/codecs/generic.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/sound/hda/codecs/generic.c b/sound/hda/codecs/generic.c
index e1324f9671dd..7bcf9aef8275 100644
--- a/sound/hda/codecs/generic.c
+++ b/sound/hda/codecs/generic.c
@@ -1984,7 +1984,7 @@ static int parse_output_paths(struct hda_codec *codec)
 {
 	struct hda_gen_spec *spec = codec->spec;
 	struct auto_pin_cfg *cfg = &spec->autocfg;
-	struct auto_pin_cfg *best_cfg;
+	struct auto_pin_cfg *best_cfg __free(kfree) = NULL;
 	unsigned int val;
 	int best_badness = INT_MAX;
 	int badness;
@@ -2000,10 +2000,8 @@ static int parse_output_paths(struct hda_codec *codec)
 	for (;;) {
 		badness = fill_and_eval_dacs(codec, fill_hardwired,
 					     fill_mio_first);
-		if (badness < 0) {
-			kfree(best_cfg);
+		if (badness < 0)
 			return badness;
-		}
 		debug_badness("==> lo_type=%d, wired=%d, mio=%d, badness=0x%x\n",
 			      cfg->line_out_type, fill_hardwired, fill_mio_first,
 			      badness);
@@ -2096,7 +2094,6 @@ static int parse_output_paths(struct hda_codec *codec)
 	if (spec->indep_hp && !indep_hp_possible(codec))
 		spec->indep_hp = 0;
 
-	kfree(best_cfg);
 	return 0;
 }
 
-- 
2.50.1

