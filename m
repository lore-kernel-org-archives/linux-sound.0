Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B5F1E885
	for <linux-sound@vger.kernel.org>; Sat,  7 Dec 2024 13:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733578684; cv=none; b=Jz8eNKgouGca1uDjXJwuT6ko27GrKnrD6MWs8hI3NQmqXUX61kXEvYBFLs2T+Xxb7baqDZom29R4t8nckHOmN/2dUEAVyIc4bunS+LUCFNMkznav2wl5NtfHAA6fkZebTf8FJh9x5ax2UnPjhbrt/8htFgOAY8UF45lA89Siu+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733578684; c=relaxed/simple;
	bh=Kh+CIILT9m+wY5dauJuWNnQf7lNBSLV03TMF0DzY9fE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=FdDHBZ94bWg+km19mAnA7YGDPHCpT301ZZE8zZb64eHM9qABowcALeEbRkOlLH/PRVeLZEbMQIiwTi9Uig/vqVsL/zBYS2gu+y61doAbtrRf532OUYdR4jrAwoVLvdey+EIaBKahTiitPor/bkSDPYw5rle7gmyyuibiJMVVA/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=S+ZpKRCb; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=2R/YO6GI; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=S+ZpKRCb; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=2R/YO6GI; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="S+ZpKRCb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2R/YO6GI";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="S+ZpKRCb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2R/YO6GI"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 61D0B21158;
	Sat,  7 Dec 2024 13:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1733578675; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=OHlZVRV0W1K4V4Dtd6uOh8UTU6JWfqzkTdvYuCKrmQU=;
	b=S+ZpKRCbqgUiAHetVzZsvs5JygE03ria1DHrEBNyuqGEG4xwmQ2xLonRtspebfUAT/XeV8
	NhbBlJPjCTOWRXYHb4952Oripzj4v+DBtbsmpCTTkeR3vtIHgkwZHZWN9I2X25Br0zbjPP
	dKq4rrlCDzKrAV8Q2MNEBtXQQExscWM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1733578675;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=OHlZVRV0W1K4V4Dtd6uOh8UTU6JWfqzkTdvYuCKrmQU=;
	b=2R/YO6GIuh38/41C6qSaLS5tABSYNhIRKc1RF54I4SWrHt/+qdBxoJKUiEX/6fB0WlsThI
	SPnd3EG0LJOnuzDg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1733578675; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=OHlZVRV0W1K4V4Dtd6uOh8UTU6JWfqzkTdvYuCKrmQU=;
	b=S+ZpKRCbqgUiAHetVzZsvs5JygE03ria1DHrEBNyuqGEG4xwmQ2xLonRtspebfUAT/XeV8
	NhbBlJPjCTOWRXYHb4952Oripzj4v+DBtbsmpCTTkeR3vtIHgkwZHZWN9I2X25Br0zbjPP
	dKq4rrlCDzKrAV8Q2MNEBtXQQExscWM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1733578675;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=OHlZVRV0W1K4V4Dtd6uOh8UTU6JWfqzkTdvYuCKrmQU=;
	b=2R/YO6GIuh38/41C6qSaLS5tABSYNhIRKc1RF54I4SWrHt/+qdBxoJKUiEX/6fB0WlsThI
	SPnd3EG0LJOnuzDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 42B90138A7;
	Sat,  7 Dec 2024 13:37:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id hE40DrNPVGfeQAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 07 Dec 2024 13:37:55 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: hda/ca0132: Use standard HD-audio quirk matching helpers
Date: Sat,  7 Dec 2024 14:37:53 +0100
Message-ID: <20241207133754.3658-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.71 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.11)[-0.571];
	MIME_GOOD(-0.10)[text/plain];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid]
X-Spam-Score: -2.71
X-Spam-Flag: NO

CA0132 used the PCI SSID lookup helper that doesn't support the model
string matching or quirk aliasing.

Replace it with the standard HD-audio quirk helpers for supporting
those, and add the definition of the model strings for supported
quirks, too.  There should be no visible change to the outside for the
working system, but the driver will parse the model option and apply
the quirk based on it from now on.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/patch_ca0132.c | 37 ++++++++++++++++++++----------------
 1 file changed, 21 insertions(+), 16 deletions(-)

diff --git a/sound/pci/hda/patch_ca0132.c b/sound/pci/hda/patch_ca0132.c
index e4673a71551a..d40197fb5fbd 100644
--- a/sound/pci/hda/patch_ca0132.c
+++ b/sound/pci/hda/patch_ca0132.c
@@ -1134,7 +1134,6 @@ struct ca0132_spec {
 
 	struct hda_codec *codec;
 	struct delayed_work unsol_hp_work;
-	int quirk;
 
 #ifdef ENABLE_TUNING_CONTROLS
 	long cur_ctl_vals[TUNING_CTLS_COUNT];
@@ -1166,7 +1165,6 @@ struct ca0132_spec {
  * CA0132 quirks table
  */
 enum {
-	QUIRK_NONE,
 	QUIRK_ALIENWARE,
 	QUIRK_ALIENWARE_M17XR4,
 	QUIRK_SBZ,
@@ -1176,10 +1174,11 @@ enum {
 	QUIRK_R3D,
 	QUIRK_AE5,
 	QUIRK_AE7,
+	QUIRK_NONE = HDA_FIXUP_ID_NOT_SET,
 };
 
 #ifdef CONFIG_PCI
-#define ca0132_quirk(spec)		((spec)->quirk)
+#define ca0132_quirk(spec)		((spec)->codec->fixup_id)
 #define ca0132_use_pci_mmio(spec)	((spec)->use_pci_mmio)
 #define ca0132_use_alt_functions(spec)	((spec)->use_alt_functions)
 #define ca0132_use_alt_controls(spec)	((spec)->use_alt_controls)
@@ -1293,7 +1292,7 @@ static const struct hda_pintbl ae7_pincfgs[] = {
 	{}
 };
 
-static const struct snd_pci_quirk ca0132_quirks[] = {
+static const struct hda_quirk ca0132_quirks[] = {
 	SND_PCI_QUIRK(0x1028, 0x057b, "Alienware M17x R4", QUIRK_ALIENWARE_M17XR4),
 	SND_PCI_QUIRK(0x1028, 0x0685, "Alienware 15 2015", QUIRK_ALIENWARE),
 	SND_PCI_QUIRK(0x1028, 0x0688, "Alienware 17 2015", QUIRK_ALIENWARE),
@@ -1316,6 +1315,19 @@ static const struct snd_pci_quirk ca0132_quirks[] = {
 	{}
 };
 
+static const struct hda_model_fixup ca0132_quirk_models[] = {
+	{ .id = QUIRK_ALIENWARE, .name = "alienware" },
+	{ .id = QUIRK_ALIENWARE_M17XR4, .name = "alienware-m17xr4" },
+	{ .id = QUIRK_SBZ, .name = "sbz" },
+	{ .id = QUIRK_ZXR, .name = "zxr" },
+	{ .id = QUIRK_ZXR_DBPRO, .name = "zxr-dbpro" },
+	{ .id = QUIRK_R3DI, .name = "r3di" },
+	{ .id = QUIRK_R3D, .name = "r3d" },
+	{ .id = QUIRK_AE5, .name = "ae5" },
+	{ .id = QUIRK_AE7, .name = "ae7" },
+	{}
+};
+
 /* Output selection quirk info structures. */
 #define MAX_QUIRK_MMIO_GPIO_SET_VALS 3
 #define MAX_QUIRK_SCP_SET_VALS 2
@@ -9957,17 +9969,15 @@ static int ca0132_prepare_verbs(struct hda_codec *codec)
  */
 static void sbz_detect_quirk(struct hda_codec *codec)
 {
-	struct ca0132_spec *spec = codec->spec;
-
 	switch (codec->core.subsystem_id) {
 	case 0x11020033:
-		spec->quirk = QUIRK_ZXR;
+		codec->fixup_id = QUIRK_ZXR;
 		break;
 	case 0x1102003f:
-		spec->quirk = QUIRK_ZXR_DBPRO;
+		codec->fixup_id = QUIRK_ZXR_DBPRO;
 		break;
 	default:
-		spec->quirk = QUIRK_SBZ;
+		codec->fixup_id = QUIRK_SBZ;
 		break;
 	}
 }
@@ -9976,7 +9986,6 @@ static int patch_ca0132(struct hda_codec *codec)
 {
 	struct ca0132_spec *spec;
 	int err;
-	const struct snd_pci_quirk *quirk;
 
 	codec_dbg(codec, "patch_ca0132\n");
 
@@ -9987,11 +9996,7 @@ static int patch_ca0132(struct hda_codec *codec)
 	spec->codec = codec;
 
 	/* Detect codec quirk */
-	quirk = snd_pci_quirk_lookup(codec->bus->pci, ca0132_quirks);
-	if (quirk)
-		spec->quirk = quirk->value;
-	else
-		spec->quirk = QUIRK_NONE;
+	snd_hda_pick_fixup(codec, ca0132_quirk_models, ca0132_quirks, NULL);
 	if (ca0132_quirk(spec) == QUIRK_SBZ)
 		sbz_detect_quirk(codec);
 
@@ -10068,7 +10073,7 @@ static int patch_ca0132(struct hda_codec *codec)
 		spec->mem_base = pci_iomap(codec->bus->pci, 2, 0xC20);
 		if (spec->mem_base == NULL) {
 			codec_warn(codec, "pci_iomap failed! Setting quirk to QUIRK_NONE.");
-			spec->quirk = QUIRK_NONE;
+			codec->fixup_id = QUIRK_NONE;
 		}
 	}
 #endif
-- 
2.43.0

