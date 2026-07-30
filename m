Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA6193D9DD4
	for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 08:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785401133; cv=none; b=Ogr0OnY4XFP6gKzzRs5TDxzhT734bOxiiGx13gs+YIg9mpNW59+d0Gn/DVCwbvbkq5fqS3qUGNOkWFSeuUVc6oeHHS72BF9MUcv9mxro5sbA9Uhe9tsVpYVSplrsf/SoEWmUV6GFML9RYigz65cDApCPevtN2uvqbVuqNXHw+1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785401133; c=relaxed/simple;
	bh=2YzJVwoT+xxuSvz+5jyKI5V/Md9Cdc5sn4tI5rZlWEs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TlDBsUoyC6A+NHv96xj6pmyD6qVKjdb+ujhWuHOpxlocLOpi+E7eyDnvcmef1y2iPtK4H9GrJ07UZ6P3fvJ3ir5iLH/QkCyJZZ/kQzRFMXB5KebH7mPFRYUiL42ZV3WFE4BZvTJn1VwglEz6rxGma3WkbVxrJ1L20rMDqmPGFQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=HymGjBZp; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=pKsUQY5j; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=DIpwY9jv; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HFPZwMCm; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HymGjBZp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pKsUQY5j";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DIpwY9jv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HFPZwMCm"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5C1CA3F09;
	Thu, 30 Jul 2026 08:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785401120; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aK9rBYFBFCunZ0NLqpxPYhO89vIG4Nrh3pm68FGFBnk=;
	b=HymGjBZpJCAVT50KI7RwtXjQYi2fuuOXvQYu+CojlN4I2VdxPKV+fO7W2jpMWvcdR9CYWz
	o+cSITePvrczxeGvG59CVvoA5AP+JK5QuwGDEZa1RbVwhrY0jcEhTuJz4tsdE4JbYJQkzr
	lPc9JajaJHjz62HQG/VX4yZrGPaz094=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785401120;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aK9rBYFBFCunZ0NLqpxPYhO89vIG4Nrh3pm68FGFBnk=;
	b=pKsUQY5jic6S3k6iC0IkYPT1xD/C0xpMo8hFwqps5mhrIc8YZXYQyI4B9Swwx5VUBC35Wi
	7kWo3zU9Rxjc3vDQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785401116; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aK9rBYFBFCunZ0NLqpxPYhO89vIG4Nrh3pm68FGFBnk=;
	b=DIpwY9jvo2P2lXIkKb0E2CLV+eONd+5CH7b8Mz/eZObbYt1uoj8mfj29RIaaPMuKtil6jW
	WdVa3FMLRn4F/0fDMHWWfVTu6mMO9XDisqit4OesHsOyZywUmmJ0BtFGEv9pMyzFqVTL8p
	+QZgZKwOu1BMd/0FTmUQuOLasUDTnLk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785401116;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aK9rBYFBFCunZ0NLqpxPYhO89vIG4Nrh3pm68FGFBnk=;
	b=HFPZwMCmZw/ZF99IIH5OV159kkjz+D5J5DFOssx3IgNKni1quwROSOSgkM3dIqBEkE/3XK
	osyqWsz0ZrQ+HhCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 435E4779CD;
	Thu, 30 Jul 2026 08:45:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id SMJUDxwPa2qeSQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 30 Jul 2026 08:45:16 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 1/2] ALSA: hda: Drop unneeded calculation of index at get_jack_mode_name()
Date: Thu, 30 Jul 2026 10:44:32 +0200
Message-ID: <20260730084513.327992-2-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260730084513.327992-1-tiwai@suse.de>
References: <20260730084513.327992-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.63
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-2.63 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-0.999];
	R_MISSING_CHARSET(0.50)[];
	MIME_GOOD(-0.10)[text/plain];
	NEURAL_HAM_SHORT(-0.03)[-0.132];
	ARC_NA(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]

get_jack_mode_name() tries to identify the (potential) index number of
the control element to be created, but this index number isn't
actually used, since the index is set automatically at instantiating
the controls.

Drop the unneeded index retrieval and calculation as a cleanup.
Along with the change, find_kctl_name() is no longer used, hence drop
this function as well.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/codecs/generic.c | 19 +------------------
 1 file changed, 1 insertion(+), 18 deletions(-)

diff --git a/sound/hda/codecs/generic.c b/sound/hda/codecs/generic.c
index 660a9f2c0ded..9f6f44cdbe1e 100644
--- a/sound/hda/codecs/generic.c
+++ b/sound/hda/codecs/generic.c
@@ -2695,30 +2695,13 @@ static const struct snd_kcontrol_new out_jack_mode_enum = {
 	.put = out_jack_mode_put,
 };
 
-static bool find_kctl_name(struct hda_codec *codec, const char *name, int idx)
-{
-	struct hda_gen_spec *spec = codec->spec;
-	const struct snd_kcontrol_new *kctl;
-	int i;
-
-	snd_array_for_each(&spec->kctls, i, kctl) {
-		if (!strcmp(kctl->name, name) && kctl->index == idx)
-			return true;
-	}
-	return false;
-}
-
 static void get_jack_mode_name(struct hda_codec *codec, hda_nid_t pin,
 			       char *name, size_t name_len)
 {
 	struct hda_gen_spec *spec = codec->spec;
-	int idx = 0;
 
-	snd_hda_get_pin_label(codec, pin, &spec->autocfg, name, name_len, &idx);
+	snd_hda_get_pin_label(codec, pin, &spec->autocfg, name, name_len, NULL);
 	strlcat(name, " Jack Mode", name_len);
-
-	for (; find_kctl_name(codec, name, idx); idx++)
-		;
 }
 
 static int get_out_jack_num_items(struct hda_codec *codec, hda_nid_t pin)
-- 
2.55.0

