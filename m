Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C7A1D5CC9
	for <linux-sound@vger.kernel.org>; Wed, 27 Aug 2025 07:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756279820; cv=none; b=gRlzGglcs6M680LG6FBhfGkqggwg+h8UlK9cfb131Mzg+QnuS8hI5TpkzjbpmijqJF/5Iu2HjPWlw7eCBsw4ze/wqTQiZG91L6o5x/hfiCds07cN5jgvx3txLczNgpyWFpKwgcdGtNtUrFS34M/ooIPfUmo/bWOfnsJfcfAO/vM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756279820; c=relaxed/simple;
	bh=+Ekx7PJfEMiPLDnhggvASNTSPw+xAQTODjuchxfgzsw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ptfhxkk45Ov/6PCo3gx7G3YO/wGoJVDBPODNz2ERCjeyE+udY9dPXDhad/br4mxHE1tFH7EMyQ94X2lMc08nGWyovD7seXG2yUH3EguvRR+BVlZHYQ4rVi55AwyhVKfxeLnI7ZikhcpeKaZ/zdnBg4/dZ+SJBVzxbWIQK33Tugo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=v3KmptsM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8V04s3fC; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=v3KmptsM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8V04s3fC; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="v3KmptsM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8V04s3fC";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="v3KmptsM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8V04s3fC"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D7D4E1FF1A;
	Wed, 27 Aug 2025 07:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756279762; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2/TyXS1q2cPfoRgXZaMkSypmtl22zRU/qt9o+FHjtSo=;
	b=v3KmptsM1ew+X8IsDtrnI4ilbnYJaKf7W4SO1aBui6oi/XwnKjPVFh0WCKEmEOYB2gGDFf
	n7o9xlE+OoDlLuUx82MTE95/rwjcjNGnguUdhbHWH2mAmPanuEvjQhONHTDeth6+9Xi3a8
	KtjexKrTAlC6pUyBWgozDFCl3c+ySjg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756279762;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2/TyXS1q2cPfoRgXZaMkSypmtl22zRU/qt9o+FHjtSo=;
	b=8V04s3fCMNfFdrPw+b1gAOEaSQRQ6WTsLzb/aVcYvvphWLdX9CPqB92gyfMEuBR+gNtzXX
	hQ+GBtmCbi8GKzAA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=v3KmptsM;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=8V04s3fC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756279762; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2/TyXS1q2cPfoRgXZaMkSypmtl22zRU/qt9o+FHjtSo=;
	b=v3KmptsM1ew+X8IsDtrnI4ilbnYJaKf7W4SO1aBui6oi/XwnKjPVFh0WCKEmEOYB2gGDFf
	n7o9xlE+OoDlLuUx82MTE95/rwjcjNGnguUdhbHWH2mAmPanuEvjQhONHTDeth6+9Xi3a8
	KtjexKrTAlC6pUyBWgozDFCl3c+ySjg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756279762;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2/TyXS1q2cPfoRgXZaMkSypmtl22zRU/qt9o+FHjtSo=;
	b=8V04s3fCMNfFdrPw+b1gAOEaSQRQ6WTsLzb/aVcYvvphWLdX9CPqB92gyfMEuBR+gNtzXX
	hQ+GBtmCbi8GKzAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 90AC713867;
	Wed, 27 Aug 2025 07:29:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 0KdDIdKzrmjoagAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 27 Aug 2025 07:29:22 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH v2 21/25] ALSA: hda/generic: Use auto cleanup for temporary buffers
Date: Wed, 27 Aug 2025 09:29:01 +0200
Message-ID: <20250827072916.31933-22-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250827072916.31933-1-tiwai@suse.de>
References: <20250827072916.31933-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: D7D4E1FF1A
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
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
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.01

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

