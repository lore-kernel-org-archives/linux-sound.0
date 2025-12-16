Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7AEA346AEA
	for <linux-sound@vger.kernel.org>; Tue, 16 Dec 2025 14:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765894018; cv=none; b=cYpFFvNjYRGpsCF/mOwbsDQ1dmpKFHPxC/RJ9QwdNTDGlJAHJVLOriWE3t9a1h+gkLYW6voVv3LBgsKcBtqcixkbSbv2I0roQKYVoooKXhLWk3+p6tj5YMbW+/VNdibAXM1C7qOmqxi+xYti9yErlAfwSRyAbDqnzFUAH+eJnTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765894018; c=relaxed/simple;
	bh=W0lAzhfjmhX+EPsdw0ITHJxT1rgiD9Z75cJbJKpQWlI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OzilVy5kQFBy+L1tUZZX2dbNXQZ+5dDHckhiNQt/q81iicDzl1Tuy2VPr2rYIMHjFFaerWUYwGuYGJGQzxZ+aPgeaF4fK7IP9tnA0Vo8MJwxaPPjIfiuA+JLqmQ7bsx+5jOTdxjTSsEwZYTrz4XOZzuICahq1SeHbSzPEMYhJxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=2U8da/Bh; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=mXzIl+IT; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=2U8da/Bh; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=mXzIl+IT; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="2U8da/Bh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mXzIl+IT";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="2U8da/Bh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mXzIl+IT"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1A1035BCE9;
	Tue, 16 Dec 2025 14:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1765894003; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ncWazMTQCF4RbuyR5JEkBeBd3r2jJ2F9kSVFCBRblqk=;
	b=2U8da/Bh7H6m9rhX+04/ixKxQqJjykz1e5Aq4mZJeNuNNsAjj5pEgD/8WkPRXojjafog0B
	bUGtlwDBjcXK0gLGe+8BeXWiLqHUV0ZiHHnci2SWlZUtrRQ2mmaHUG0QgPAT3Rois7l2Uu
	bYw5R+/bNHFaTugSrTA6uB5EyKmaKRU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765894003;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ncWazMTQCF4RbuyR5JEkBeBd3r2jJ2F9kSVFCBRblqk=;
	b=mXzIl+ITgM8I5XSCFpxqoXvXoHpJSPNG57uU+4M0UDkWCDJuiB464MttAmS6nxdnqy6MlA
	2+Lw/eluyuxPV7Aw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="2U8da/Bh";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=mXzIl+IT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1765894003; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ncWazMTQCF4RbuyR5JEkBeBd3r2jJ2F9kSVFCBRblqk=;
	b=2U8da/Bh7H6m9rhX+04/ixKxQqJjykz1e5Aq4mZJeNuNNsAjj5pEgD/8WkPRXojjafog0B
	bUGtlwDBjcXK0gLGe+8BeXWiLqHUV0ZiHHnci2SWlZUtrRQ2mmaHUG0QgPAT3Rois7l2Uu
	bYw5R+/bNHFaTugSrTA6uB5EyKmaKRU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765894003;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ncWazMTQCF4RbuyR5JEkBeBd3r2jJ2F9kSVFCBRblqk=;
	b=mXzIl+ITgM8I5XSCFpxqoXvXoHpJSPNG57uU+4M0UDkWCDJuiB464MttAmS6nxdnqy6MlA
	2+Lw/eluyuxPV7Aw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0CD663EA63;
	Tue, 16 Dec 2025 14:06:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 4GiRAnNnQWnrNgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 16 Dec 2025 14:06:43 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 09/11] ALSA: hda: Relax __free() variable declarations
Date: Tue, 16 Dec 2025 15:06:31 +0100
Message-ID: <20251216140634.171890-10-tiwai@suse.de>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251216140634.171890-1-tiwai@suse.de>
References: <20251216140634.171890-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -4.01
X-Rspamd-Queue-Id: 1A1035BCE9
X-Spamd-Result: default: False [-4.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	DWL_DNSWL_LOW(-1.00)[suse.de:dkim];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	TO_DN_NONE(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_HAS_DN(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim,suse.de:email];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Level: 

We used to have a variable declaration with __free() initialized with
NULL.  This was to keep the old coding style rule, but recently it's
relaxed and rather recommends to follow the new rule to declare in
place of use for __free() -- which avoids potential deadlocks or UAFs
with nested cleanups.

Although the current code has no bug, per se, let's follow the new
standard and move the declaration to the place of assignment (or
directly assign the allocated result) instead of NULL initializations.

Fixes: ee0b0f5d32fe ("ALSA: hda/generic: Use auto cleanup for temporary buffers")
Fixes: 03c5c350e38d ("ALSA: hda/realtek: Add support for new HP G12 laptops")
Fixes: b0550d4c2dd8 ("ALSA: hda/common: Use auto cleanup for temporary buffers")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/codecs/generic.c         | 4 ++--
 sound/hda/codecs/realtek/alc269.c  | 4 ++--
 sound/hda/codecs/realtek/realtek.c | 5 +++--
 sound/hda/common/codec.c           | 4 ++--
 sound/hda/common/sysfs.c           | 5 +++--
 5 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/sound/hda/codecs/generic.c b/sound/hda/codecs/generic.c
index 7bcf9aef8275..443500a3518f 100644
--- a/sound/hda/codecs/generic.c
+++ b/sound/hda/codecs/generic.c
@@ -1984,15 +1984,15 @@ static int parse_output_paths(struct hda_codec *codec)
 {
 	struct hda_gen_spec *spec = codec->spec;
 	struct auto_pin_cfg *cfg = &spec->autocfg;
-	struct auto_pin_cfg *best_cfg __free(kfree) = NULL;
 	unsigned int val;
 	int best_badness = INT_MAX;
 	int badness;
 	bool fill_hardwired = true, fill_mio_first = true;
 	bool best_wired = true, best_mio = true;
 	bool hp_spk_swapped = false;
+	struct auto_pin_cfg *best_cfg __free(kfree) =
+		kmalloc(sizeof(*best_cfg), GFP_KERNEL);
 
-	best_cfg = kmalloc(sizeof(*best_cfg), GFP_KERNEL);
 	if (!best_cfg)
 		return -ENOMEM;
 	*best_cfg = *cfg;
diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index c8a9b9b15cb4..85e7b5d4c496 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -2904,7 +2904,6 @@ static void find_cirrus_companion_amps(struct hda_codec *cdc)
 {
 	struct device *dev = hda_codec_dev(cdc);
 	struct acpi_device *adev;
-	struct fwnode_handle *fwnode __free(fwnode_handle) = NULL;
 	const char *bus = NULL;
 	static const struct {
 		const char *hid;
@@ -2934,7 +2933,8 @@ static void find_cirrus_companion_amps(struct hda_codec *cdc)
 			bus = "spi";
 	}
 
-	fwnode = fwnode_handle_get(acpi_fwnode_handle(adev));
+	struct fwnode_handle *fwnode __free(fwnode_handle) =
+		fwnode_handle_get(acpi_fwnode_handle(adev));
 	acpi_dev_put(adev);
 
 	if (!bus) {
diff --git a/sound/hda/codecs/realtek/realtek.c b/sound/hda/codecs/realtek/realtek.c
index ca377a5adadb..efe20b450529 100644
--- a/sound/hda/codecs/realtek/realtek.c
+++ b/sound/hda/codecs/realtek/realtek.c
@@ -215,12 +215,13 @@ void alc_update_knob_master(struct hda_codec *codec,
 {
 	unsigned int val;
 	struct snd_kcontrol *kctl;
-	struct snd_ctl_elem_value *uctl __free(kfree) = NULL;
 
 	kctl = snd_hda_find_mixer_ctl(codec, "Master Playback Volume");
 	if (!kctl)
 		return;
-	uctl = kzalloc(sizeof(*uctl), GFP_KERNEL);
+
+	struct snd_ctl_elem_value *uctl __free(kfree) =
+		kzalloc(sizeof(*uctl), GFP_KERNEL);
 	if (!uctl)
 		return;
 	val = snd_hda_codec_read(codec, jack->nid, 0,
diff --git a/sound/hda/common/codec.c b/sound/hda/common/codec.c
index c6d44168c7f9..ffe7c69d5a32 100644
--- a/sound/hda/common/codec.c
+++ b/sound/hda/common/codec.c
@@ -1854,9 +1854,9 @@ static int check_follower_present(struct hda_codec *codec,
 /* call kctl->put with the given value(s) */
 static int put_kctl_with_value(struct snd_kcontrol *kctl, int val)
 {
-	struct snd_ctl_elem_value *ucontrol __free(kfree) = NULL;
+	struct snd_ctl_elem_value *ucontrol __free(kfree) =
+		kzalloc(sizeof(*ucontrol), GFP_KERNEL);
 
-	ucontrol = kzalloc(sizeof(*ucontrol), GFP_KERNEL);
 	if (!ucontrol)
 		return -ENOMEM;
 	ucontrol->value.integer.value[0] = val;
diff --git a/sound/hda/common/sysfs.c b/sound/hda/common/sysfs.c
index f8c8483fd5e5..bedf10b30885 100644
--- a/sound/hda/common/sysfs.c
+++ b/sound/hda/common/sysfs.c
@@ -299,7 +299,6 @@ static void remove_trail_spaces(char *str)
 
 static int parse_hints(struct hda_codec *codec, const char *buf)
 {
-	char *key __free(kfree) = NULL;
 	char *val;
 	struct hda_hint *hint;
 
@@ -308,7 +307,9 @@ static int parse_hints(struct hda_codec *codec, const char *buf)
 		return 0;
 	if (*buf == '=')
 		return -EINVAL;
-	key = kstrndup_noeol(buf, 1024);
+
+	char *key __free(kfree) =
+		kstrndup_noeol(buf, 1024);
 	if (!key)
 		return -ENOMEM;
 	/* extract key and val */
-- 
2.52.0

