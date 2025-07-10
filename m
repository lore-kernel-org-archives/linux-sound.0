Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C39132D59FA
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 10:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752142149; cv=none; b=qFJNDk3k/bw7JW6VSdlIDSfcemB3T/7nbOmhHtOjx5Fv24ybT6aa0kKWepmwsRJucF7OC5FnZ0OJVKoqr8mCgIGu8fYX4pzZ45GbFMa3qBq4BVnGUy8UP+4872VgyycdoYFF/T+FZKWXVmPxGeuO/3ixyDAqBXWmKoPY6im+OGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752142149; c=relaxed/simple;
	bh=EeqCPLLvkfI7NxA/0hEfLUglouwq2RMyPRklxAAOPNQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W8ATKeIF/rNmxk4Rsw2EvNagqV1tV/fD4VQHAA4D4a+uZQGLbhaAvny/6Kzf0JAoYlK3cIt5MIRgCcvHftM3UnifhMh02XknTDF/98FvW6Q/wbetU6P1ds+2Csli80aYFYyXn4T49fa7RwFLBu4MZnOTEqkta3DxvgK0wOGKSX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=AtEcbX9x; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Xv9IkHk4; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=AtEcbX9x; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Xv9IkHk4; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="AtEcbX9x";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Xv9IkHk4";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="AtEcbX9x";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Xv9IkHk4"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 455D01F45F;
	Thu, 10 Jul 2025 10:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142062; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6kd/u7k1EJMheTNnsXmLTXrDo9rTB4nxTUn3/CkK2Vk=;
	b=AtEcbX9xJF1ZlyApL7mxZlWvqJ9L5SmioI4PpqXzPipUAI5w34+TP5aHBkHqpSqCDSp9rx
	pe7mfZV0WmAhkL5uJZu3Tc8nzXGI1xjO6My5giiSIHpPZa32/pyuaZfyP1uS2sIvT2UHQL
	eCaH2n5/IPTyiwcjEJ0iye2Fm5WLW4E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142062;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6kd/u7k1EJMheTNnsXmLTXrDo9rTB4nxTUn3/CkK2Vk=;
	b=Xv9IkHk4Ri76jkbZDuprqYW7MmizA0ciCcjjUmWsUtUbbsqSCBtkKE3aCvOvX6XJ2W4NWj
	SkFxt6wdcQbTqqAw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142062; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6kd/u7k1EJMheTNnsXmLTXrDo9rTB4nxTUn3/CkK2Vk=;
	b=AtEcbX9xJF1ZlyApL7mxZlWvqJ9L5SmioI4PpqXzPipUAI5w34+TP5aHBkHqpSqCDSp9rx
	pe7mfZV0WmAhkL5uJZu3Tc8nzXGI1xjO6My5giiSIHpPZa32/pyuaZfyP1uS2sIvT2UHQL
	eCaH2n5/IPTyiwcjEJ0iye2Fm5WLW4E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142062;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6kd/u7k1EJMheTNnsXmLTXrDo9rTB4nxTUn3/CkK2Vk=;
	b=Xv9IkHk4Ri76jkbZDuprqYW7MmizA0ciCcjjUmWsUtUbbsqSCBtkKE3aCvOvX6XJ2W4NWj
	SkFxt6wdcQbTqqAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 201FD13A70;
	Thu, 10 Jul 2025 10:07:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qAqmBu6Qb2jZWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 10 Jul 2025 10:07:42 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 041/103] ALSA: ac97: Use safer strscpy() instead of strcpy()
Date: Thu, 10 Jul 2025 12:06:23 +0200
Message-ID: <20250710100727.22653-42-tiwai@suse.de>
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
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLsqo7dymd5dgmoaprf5rep8is)];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80

Use a safer function strscpy() instead of strcpy() for copying to
arrays.

Only idiomatic code replacement, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/ac97/ac97_codec.c | 4 ++--
 sound/pci/ac97/ac97_patch.c | 8 ++++----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/pci/ac97/ac97_codec.c b/sound/pci/ac97/ac97_codec.c
index 88ac37739b76..588c094080be 100644
--- a/sound/pci/ac97/ac97_codec.c
+++ b/sound/pci/ac97/ac97_codec.c
@@ -2303,7 +2303,7 @@ int snd_ac97_mixer(struct snd_ac97_bus *bus, struct snd_ac97_template *template,
 	if (ac97_is_audio(ac97)) {
 		char comp[16];
 		if (card->mixername[0] == '\0') {
-			strcpy(card->mixername, name);
+			strscpy(card->mixername, name);
 		} else {
 			if (strlen(card->mixername) + 1 + strlen(name) + 1 <= sizeof(card->mixername)) {
 				strcat(card->mixername, ",");
@@ -2324,7 +2324,7 @@ int snd_ac97_mixer(struct snd_ac97_bus *bus, struct snd_ac97_template *template,
 	if (ac97_is_modem(ac97)) {
 		char comp[16];
 		if (card->mixername[0] == '\0') {
-			strcpy(card->mixername, name);
+			strscpy(card->mixername, name);
 		} else {
 			if (strlen(card->mixername) + 1 + strlen(name) + 1 <= sizeof(card->mixername)) {
 				strcat(card->mixername, ",");
diff --git a/sound/pci/ac97/ac97_patch.c b/sound/pci/ac97/ac97_patch.c
index cd83aa864ea3..3002be9d88f3 100644
--- a/sound/pci/ac97/ac97_patch.c
+++ b/sound/pci/ac97/ac97_patch.c
@@ -298,7 +298,7 @@ static int patch_yamaha_ymf7x3_3d(struct snd_ac97 *ac97)
 	err = snd_ctl_add(ac97->bus->card, kctl);
 	if (err < 0)
 		return err;
-	strcpy(kctl->id.name, "3D Control - Wide");
+	strscpy(kctl->id.name, "3D Control - Wide");
 	kctl->private_value = AC97_SINGLE_VALUE(AC97_3D_CONTROL, 9, 7, 0);
 	snd_ac97_write_cache(ac97, AC97_3D_CONTROL, 0x0000);
 	err = snd_ctl_add(ac97->bus->card,
@@ -891,7 +891,7 @@ static int patch_sigmatel_stac9700_3d(struct snd_ac97 * ac97)
 	err = snd_ctl_add(ac97->bus->card, kctl = snd_ac97_cnew(&snd_ac97_controls_3d[0], ac97));
 	if (err < 0)
 		return err;
-	strcpy(kctl->id.name, "3D Control Sigmatel - Depth");
+	strscpy(kctl->id.name, "3D Control Sigmatel - Depth");
 	kctl->private_value = AC97_SINGLE_VALUE(AC97_3D_CONTROL, 2, 3, 0);
 	snd_ac97_write_cache(ac97, AC97_3D_CONTROL, 0x0000);
 	return 0;
@@ -906,13 +906,13 @@ static int patch_sigmatel_stac9708_3d(struct snd_ac97 * ac97)
 	err = snd_ctl_add(ac97->bus->card, kctl);
 	if (err < 0)
 		return err;
-	strcpy(kctl->id.name, "3D Control Sigmatel - Depth");
+	strscpy(kctl->id.name, "3D Control Sigmatel - Depth");
 	kctl->private_value = AC97_SINGLE_VALUE(AC97_3D_CONTROL, 0, 3, 0);
 	kctl = snd_ac97_cnew(&snd_ac97_controls_3d[0], ac97);
 	err = snd_ctl_add(ac97->bus->card, kctl);
 	if (err < 0)
 		return err;
-	strcpy(kctl->id.name, "3D Control Sigmatel - Rear Depth");
+	strscpy(kctl->id.name, "3D Control Sigmatel - Rear Depth");
 	kctl->private_value = AC97_SINGLE_VALUE(AC97_3D_CONTROL, 2, 3, 0);
 	snd_ac97_write_cache(ac97, AC97_3D_CONTROL, 0x0000);
 	return 0;
-- 
2.50.0

