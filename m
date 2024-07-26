Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30526101E2
	for <linux-sound@vger.kernel.org>; Fri, 26 Jul 2024 14:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722003957; cv=none; b=k/FuEtVHixaaKsm4090+cKpGQhG3B0kcT2rBNxzLcUJRgLKwcjjNo9iOqoQ2ZD0iwDHj4MH/4mR9GSlRWXxswtl60YNyt9YRfe/nWXOXrX8ZAZqRKEUEqUWK3Qv7eVcDnjmie5xd2XfHQneE+K5QKlOUcgZ8kyLQLT0cHtBMw24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722003957; c=relaxed/simple;
	bh=gw4wPf2HOzjxhvqoWEbGYPNqnBgx4hK1S/FE5kofA8k=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SFRwqlqmtEITWVcgpoxJmCVfzXxvVsp6+PkNgM8xdm1CNTVbbc4fVoFweXaoaZ46mBzaaT7M6T47uxKU/eYaiy/AE/aXvfuoTyBZJSr8Jo32cJ28ylHgTHYh6qkDXF83ej1sCpBl5v9j1hmCicKxTN+/ze+YNtiywBBjZokx+3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dcBGOFo3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=22tAOm9u; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=gXm2rhz5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=zLuUHmG1; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dcBGOFo3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="22tAOm9u";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gXm2rhz5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zLuUHmG1"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 64FBE1F8AE;
	Fri, 26 Jul 2024 14:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722003954; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sbNae9TNg504zcGg96qeYo2+LGuYHw0JlBrGbb8jfw4=;
	b=dcBGOFo39VqzUD9mm7AFCQ4tVzw2EofSXer89ndAZJQ4jZPOWSxD6qQ16Obn1zx908AuaA
	cYBv4I8HttI2n+v1S7fAdXxb9yc3HvmcCr/+T4iG1AO6FeRNmzmTUgbVQpSgYHDl6dpsJP
	FHymraQv6gA+MM3bw1yIzXCy6/DmkOk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722003954;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sbNae9TNg504zcGg96qeYo2+LGuYHw0JlBrGbb8jfw4=;
	b=22tAOm9uF4qsz8j5UfGHX8dcK/7ZNuIyhipw84n09dg2ro2g8gg9nOV2T3jW9Up79wuEyp
	0VR2ltyN/7kG/xDQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722003953; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sbNae9TNg504zcGg96qeYo2+LGuYHw0JlBrGbb8jfw4=;
	b=gXm2rhz5gB64sWiyyRlDasoia5lWS22FRy3JUYs7q3BT7a1Wr0UqJkmsEyPPPrFjgL7wla
	5oOdpLYBXsIXQp/UwYzmEBtcbLULcGb0pUYC4xjuk/BH6l19nBzAx17Y5LxfNVZAjdu5SB
	Go+9Ss3CLTkt6TvrV7GOOom0WBnodUk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722003953;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sbNae9TNg504zcGg96qeYo2+LGuYHw0JlBrGbb8jfw4=;
	b=zLuUHmG1MSlIRG9pFCfWjspuDYqm3Jb4WT+A9IzCmYVok0XDjdA9qbjwHsv51Xot16V3vS
	cqGQTi6NA/Tp+9Cw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3FEEB13A9D;
	Fri, 26 Jul 2024 14:25:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ABtjDvGxo2YwHwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 26 Jul 2024 14:25:53 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 2/2] ALSA: hda/conexant: Mute speakers at suspend / shutdown
Date: Fri, 26 Jul 2024 16:26:20 +0200
Message-ID: <20240726142625.2460-2-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240726142625.2460-1-tiwai@suse.de>
References: <20240726142625.2460-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.60 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo,suse.com:url]
X-Spam-Flag: NO
X-Spam-Score: -2.60

Use the new helper to mute speakers at suspend / shutdown for avoiding
click noises.

Link: https://bugzilla.suse.com/show_bug.cgi?id=1228269
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/patch_conexant.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/pci/hda/patch_conexant.c b/sound/pci/hda/patch_conexant.c
index 4472923ba694..f030669243f9 100644
--- a/sound/pci/hda/patch_conexant.c
+++ b/sound/pci/hda/patch_conexant.c
@@ -205,6 +205,8 @@ static void cx_auto_shutdown(struct hda_codec *codec)
 {
 	struct conexant_spec *spec = codec->spec;
 
+	snd_hda_gen_shutup_speakers(codec);
+
 	/* Turn the problematic codec into D3 to avoid spurious noises
 	   from the internal speaker during (and after) reboot */
 	cx_auto_turn_eapd(codec, spec->num_eapds, spec->eapds, false);
-- 
2.43.0

