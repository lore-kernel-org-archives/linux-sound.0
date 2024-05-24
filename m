Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC2C712D75C
	for <linux-sound@vger.kernel.org>; Fri, 24 May 2024 15:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716563564; cv=none; b=WIMUwXWbApKLmnQpv+nbyXFJk2cmbNIRnxFL/EE428pr4uj4ddngvJjhMLxCbBfVqyACwIiq6KTSawdCbAcBDjcW9FFeoukPTJ6pbGAz0iY0MlTHMLFG0SNjvmZL9A8kNw8+TaKM3bkI9k/6BgfoYq2iyOcBCBGvUgJ2s02SBcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716563564; c=relaxed/simple;
	bh=IbXanhCIZ0v6BSiODo0QJgdtv2jynwSMd3O0tOvbotI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=fYX1/gwCf+17dUQ1jnL9Ukvjp2Ifcuz8F/LTJxpTwfXmhmXjHcsd86+Yhr4OrXO2DnNy4k9LRvPGSULsKJA68lF7Uxqfpq/I2aPhFZmhyJaOl+2EdPItBFeVdGFuxPybhSyv8ez/fVPI2krs1QuIr+SUlWv/9NkkrWtz8231/KU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wEBaDvRJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=U43M00EO; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wEBaDvRJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=U43M00EO; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wEBaDvRJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="U43M00EO";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wEBaDvRJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="U43M00EO"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id DFC2B33BB7;
	Fri, 24 May 2024 15:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1716563560; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=pNR9LpgPms+t065cBG1O2sE8AvhW8+Ko8vumMYEGzsY=;
	b=wEBaDvRJeIjOXBQ+WWLwfmnsgKuiMVMex3pz2W0iwYGQOiencQvXsx4KDJacRBDQrs+2jX
	Wn9G9/G7Zw6DzmZ4/brSpbzwACILATa8abwjINQkk28wt/GmBU8jkxe6STqRC4YdcJ539J
	fC1n5fDFtiQLjclSIBQ7gAcZRxSIjuE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1716563560;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=pNR9LpgPms+t065cBG1O2sE8AvhW8+Ko8vumMYEGzsY=;
	b=U43M00EOq1RrARLJmi5ZyoHH89jjP4yBZaJ2a3gUKUf+82sEG3mI4Lc6YtakM9jjp/pBac
	yk750sv5FrQcGQCg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1716563560; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=pNR9LpgPms+t065cBG1O2sE8AvhW8+Ko8vumMYEGzsY=;
	b=wEBaDvRJeIjOXBQ+WWLwfmnsgKuiMVMex3pz2W0iwYGQOiencQvXsx4KDJacRBDQrs+2jX
	Wn9G9/G7Zw6DzmZ4/brSpbzwACILATa8abwjINQkk28wt/GmBU8jkxe6STqRC4YdcJ539J
	fC1n5fDFtiQLjclSIBQ7gAcZRxSIjuE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1716563560;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=pNR9LpgPms+t065cBG1O2sE8AvhW8+Ko8vumMYEGzsY=;
	b=U43M00EOq1RrARLJmi5ZyoHH89jjP4yBZaJ2a3gUKUf+82sEG3mI4Lc6YtakM9jjp/pBac
	yk750sv5FrQcGQCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B415113A3D;
	Fri, 24 May 2024 15:12:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id W1E0KmiuUGZ6MgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 24 May 2024 15:12:40 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: core: Remove debugfs at disconnection
Date: Fri, 24 May 2024 17:11:46 +0200
Message-ID: <20240524151256.32521-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
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
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -2.80
X-Spam-Flag: NO

The card-specific debugfs entries are removed at the last stage of
card free phase, and it's performed after synchronization of the
closes of all opened fds.  This works fine for most cases, but it can
be potentially problematic for a hotplug device like USB-audio.  Due
to the nature of snd_card_free_when_closed(), the card free isn't
called immediately after the driver removal for a hotplug device, but
it's left until the last fd is closed.  It implies that the card
debugfs entries also remain.  Meanwhile, when a new device is inserted
before the last close and the very same card slot is assigned, the
driver tries to create the card debugfs root again on the very same
path.  This conflicts with the remaining entry, and results in the
kernel warning such as:
  debugfs: Directory 'card0' with parent 'sound' already present!
with the missing debugfs entry afterwards.

For avoiding such conflicts, remove debugfs entries at the device
disconnection phase instead.  The jack kctl debugfs entries get
removed in snd_jack_dev_disconnect() instead of each kctl
private_free.

Fixes: 2d670ea2bd53 ("ALSA: jack: implement software jack injection via debugfs")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/init.c |  9 +++++----
 sound/core/jack.c | 21 ++++++++++++++-------
 2 files changed, 19 insertions(+), 11 deletions(-)

diff --git a/sound/core/init.c b/sound/core/init.c
index 4e52bbe32786..b9b708cf980d 100644
--- a/sound/core/init.c
+++ b/sound/core/init.c
@@ -537,6 +537,11 @@ void snd_card_disconnect(struct snd_card *card)
 		synchronize_irq(card->sync_irq);
 
 	snd_info_card_disconnect(card);
+#ifdef CONFIG_SND_DEBUG
+	debugfs_remove(card->debugfs_root);
+	card->debugfs_root = NULL;
+#endif
+
 	if (card->registered) {
 		device_del(&card->card_dev);
 		card->registered = false;
@@ -586,10 +591,6 @@ static int snd_card_do_free(struct snd_card *card)
 		dev_warn(card->dev, "unable to free card info\n");
 		/* Not fatal error */
 	}
-#ifdef CONFIG_SND_DEBUG
-	debugfs_remove(card->debugfs_root);
-	card->debugfs_root = NULL;
-#endif
 	if (card->release_completion)
 		complete(card->release_completion);
 	if (!card->managed)
diff --git a/sound/core/jack.c b/sound/core/jack.c
index e08b2c4fbd1a..e4bcecdf89b7 100644
--- a/sound/core/jack.c
+++ b/sound/core/jack.c
@@ -37,11 +37,15 @@ static const int jack_switch_types[SND_JACK_SWITCH_TYPES] = {
 };
 #endif /* CONFIG_SND_JACK_INPUT_DEV */
 
+static void snd_jack_remove_debugfs(struct snd_jack *jack);
+
 static int snd_jack_dev_disconnect(struct snd_device *device)
 {
-#ifdef CONFIG_SND_JACK_INPUT_DEV
 	struct snd_jack *jack = device->device_data;
 
+	snd_jack_remove_debugfs(jack);
+
+#ifdef CONFIG_SND_JACK_INPUT_DEV
 	guard(mutex)(&jack->input_dev_lock);
 	if (!jack->input_dev)
 		return 0;
@@ -381,10 +385,14 @@ static int snd_jack_debugfs_add_inject_node(struct snd_jack *jack,
 	return 0;
 }
 
-static void snd_jack_debugfs_clear_inject_node(struct snd_jack_kctl *jack_kctl)
+static void snd_jack_remove_debugfs(struct snd_jack *jack)
 {
-	debugfs_remove(jack_kctl->jack_debugfs_root);
-	jack_kctl->jack_debugfs_root = NULL;
+	struct snd_jack_kctl *jack_kctl;
+
+	list_for_each_entry(jack_kctl, &jack->kctl_list, list) {
+		debugfs_remove(jack_kctl->jack_debugfs_root);
+		jack_kctl->jack_debugfs_root = NULL;
+	}
 }
 #else /* CONFIG_SND_JACK_INJECTION_DEBUG */
 static int snd_jack_debugfs_add_inject_node(struct snd_jack *jack,
@@ -393,7 +401,7 @@ static int snd_jack_debugfs_add_inject_node(struct snd_jack *jack,
 	return 0;
 }
 
-static void snd_jack_debugfs_clear_inject_node(struct snd_jack_kctl *jack_kctl)
+static void snd_jack_remove_debugfs(struct snd_jack *jack)
 {
 }
 #endif /* CONFIG_SND_JACK_INJECTION_DEBUG */
@@ -404,7 +412,6 @@ static void snd_jack_kctl_private_free(struct snd_kcontrol *kctl)
 
 	jack_kctl = kctl->private_data;
 	if (jack_kctl) {
-		snd_jack_debugfs_clear_inject_node(jack_kctl);
 		list_del(&jack_kctl->list);
 		kfree(jack_kctl);
 	}
@@ -497,8 +504,8 @@ int snd_jack_new(struct snd_card *card, const char *id, int type,
 		.dev_free = snd_jack_dev_free,
 #ifdef CONFIG_SND_JACK_INPUT_DEV
 		.dev_register = snd_jack_dev_register,
-		.dev_disconnect = snd_jack_dev_disconnect,
 #endif /* CONFIG_SND_JACK_INPUT_DEV */
+		.dev_disconnect = snd_jack_dev_disconnect,
 	};
 
 	if (initial_kctl) {
-- 
2.43.0

