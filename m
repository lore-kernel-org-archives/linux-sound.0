Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB85F79E1
	for <linux-sound@vger.kernel.org>; Thu, 12 Jun 2025 06:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749710889; cv=none; b=l0tYlMlcRdMhWPdBMwKN1SSyHO61dKtvQHKOSeykFY7hs0YrarTxOa73IAAb6MWWRyR0pTNc/boixKm6+96wxJ36ruiCzfCjwQy4aROzdnmYfuSv9q4FIIUr/qzIJU6YcxswLbF4FkVqoQBGhni2MCC1vrT3WrpMDWvbOp3CUas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749710889; c=relaxed/simple;
	bh=rbDS4LfRjv5R9uVuna3KvZds+fo+TMC+21uXm2XFPnM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=X1wszPRt3EUzhKiTOec8qZjnF1fWRNQtURmlRCxArOQov+3IOKHTPEZ2KYvPLLhWhf14nhyhZGoBtxuGTkJfnuuEaX3CcrrEMPH6TWtaYzESCRNk48xkg1UowoHtIAKUU+woi67yM5kcDGu0eGTcuk1mfd3WJ/ksJXKscGYssk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1ppwuDt8; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=9PxLkpCG; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fX88hRfq; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=l4terie/; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1ppwuDt8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9PxLkpCG";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fX88hRfq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="l4terie/"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E70272186F;
	Thu, 12 Jun 2025 06:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749710885; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=ZOuoM4ZXDjWy7wPr8gMN5C2gdavG4ZHQ0Ho2lAHeHQI=;
	b=1ppwuDt8Xw30p0U58Bx5MX4pZdyjMgsmtM3L6hSVRyLgBbGDvNkyNiGOOPxvJRJhAmbCQL
	t5KIw4Cr+qnnEmDvR94jp8HqqpQQJJxdAcIUTRzn1uJ9LxCpIck9ssKe77cD8deYiq9U4y
	Jv/WGWZLY67+eac6ZyDJVzWfXw2sDkY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749710885;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=ZOuoM4ZXDjWy7wPr8gMN5C2gdavG4ZHQ0Ho2lAHeHQI=;
	b=9PxLkpCGb0Q2AVakwYM7KeGDJxFkawgU6VYteaLHkPsrm5N4eKpkZg9YcQAPEOQgbsravL
	M/D0yB7YmkCsVACA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=fX88hRfq;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="l4terie/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749710884; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=ZOuoM4ZXDjWy7wPr8gMN5C2gdavG4ZHQ0Ho2lAHeHQI=;
	b=fX88hRfqBC9mnI4VUhtwPG4HuPTeqZpehgEWzG5V8KX2u0WE4ofWcNa/eQ/MO/4/pY26Gf
	fFoHhd1uokMVWD9sDhd+9u8f/+UuwubOCRtIfBHzRAnsxnSDiuxX+xObmwPlc8mOMTLRJb
	n9aR8ps4gO+osJPKTzYaZbxPFCXPczc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749710884;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=ZOuoM4ZXDjWy7wPr8gMN5C2gdavG4ZHQ0Ho2lAHeHQI=;
	b=l4terie/lWtS+fQ47QDxeka0e14RsBgpbwXrFhndjzixaAKxTJFRg3zoo5M1YLsy+XCWSy
	a0Q2+PkVqqd6D0CA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CC952139E2;
	Thu, 12 Jun 2025 06:48:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Pq2LMCR4Smi+DgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 12 Jun 2025 06:48:04 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: hda/ca0132: Use const char * for strings
Date: Thu, 12 Jun 2025 08:48:01 +0200
Message-ID: <20250612064802.1170-1-tiwai@suse.de>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: E70272186F
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_NONE(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.01
X-Spam-Level: 

Some static strings have been stored in fixed char arrays although
they could be gracefully "const char *" instead.  Also, a few other
definitions use the raw "char *" without const.

Converting those to "const char *" will save some memory and give more
safety, in addition to a side-effect to address the bogus compiler
warning with snprintf().

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202506121025.G9uunMlx-lkp@intel.com/
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/patch_ca0132.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/sound/pci/hda/patch_ca0132.c b/sound/pci/hda/patch_ca0132.c
index 1904964591db..686ce0947131 100644
--- a/sound/pci/hda/patch_ca0132.c
+++ b/sound/pci/hda/patch_ca0132.c
@@ -174,7 +174,7 @@ static const unsigned int effect_slider_defaults[] = {67, 65, 50, 74, 50};
 #define DSP_SPEAKER_OUT_LATENCY         7
 
 struct ct_effect {
-	char name[SNDRV_CTL_ELEM_ID_NAME_MAXLEN];
+	const char *name;
 	hda_nid_t nid;
 	int mid; /*effect module ID*/
 	int reqs[EFFECT_VALS_MAX_COUNT]; /*effect module request*/
@@ -305,7 +305,7 @@ enum {
 };
 
 struct ct_tuning_ctl {
-	char name[SNDRV_CTL_ELEM_ID_NAME_MAXLEN];
+	const char *name;
 	hda_nid_t parent_nid;
 	hda_nid_t nid;
 	int mid; /*effect module ID*/
@@ -418,14 +418,14 @@ static const struct ct_tuning_ctl ca0132_tuning_ctls[] = {
 #define VOICEFX_MAX_PARAM_COUNT 9
 
 struct ct_voicefx {
-	char *name;
+	const char *name;
 	hda_nid_t nid;
 	int mid;
 	int reqs[VOICEFX_MAX_PARAM_COUNT]; /*effect module request*/
 };
 
 struct ct_voicefx_preset {
-	char *name; /*preset name*/
+	const char *name; /*preset name*/
 	unsigned int vals[VOICEFX_MAX_PARAM_COUNT];
 };
 
@@ -514,14 +514,14 @@ static const struct ct_voicefx_preset ca0132_voicefx_presets[] = {
 #define EQ_PRESET_MAX_PARAM_COUNT 11
 
 struct ct_eq {
-	char *name;
+	const char *name;
 	hda_nid_t nid;
 	int mid;
 	int reqs[EQ_PRESET_MAX_PARAM_COUNT]; /*effect module request*/
 };
 
 struct ct_eq_preset {
-	char *name; /*preset name*/
+	const char *name; /*preset name*/
 	unsigned int vals[EQ_PRESET_MAX_PARAM_COUNT];
 };
 
@@ -679,7 +679,7 @@ enum {
 };
 
 struct ca0132_alt_speaker_channel_cfg {
-	char *name;
+	const char *name;
 	unsigned int val;
 };
 
@@ -755,7 +755,7 @@ static const struct ae_ca0113_output_set ae7_ca0113_output_presets = {
 /* ae5 ca0113 command sequences to set headphone gain levels. */
 #define AE5_HEADPHONE_GAIN_PRESET_MAX_COMMANDS 4
 struct ae5_headphone_gain_set {
-	char *name;
+	const char *name;
 	unsigned int vals[AE5_HEADPHONE_GAIN_PRESET_MAX_COMMANDS];
 };
 
@@ -772,7 +772,7 @@ static const struct ae5_headphone_gain_set ae5_headphone_gain_presets[] = {
 };
 
 struct ae5_filter_set {
-	char *name;
+	const char *name;
 	unsigned int val;
 };
 
@@ -5787,7 +5787,7 @@ static int ca0132_alt_effect_slider_put(struct snd_kcontrol *kcontrol,
 static int ca0132_alt_mic_boost_info(struct snd_kcontrol *kcontrol,
 				 struct snd_ctl_elem_info *uinfo)
 {
-	char *sfx = "dB";
+	const char *sfx = "dB";
 	char namestr[SNDRV_CTL_ELEM_ID_NAME_MAXLEN];
 
 	uinfo->type = SNDRV_CTL_ELEM_TYPE_ENUMERATED;
@@ -5839,7 +5839,7 @@ static int ca0132_alt_mic_boost_put(struct snd_kcontrol *kcontrol,
 static int ae5_headphone_gain_info(struct snd_kcontrol *kcontrol,
 				 struct snd_ctl_elem_info *uinfo)
 {
-	char *sfx = " Ohms)";
+	const char *sfx = " Ohms)";
 	char namestr[SNDRV_CTL_ELEM_ID_NAME_MAXLEN];
 
 	uinfo->type = SNDRV_CTL_ELEM_TYPE_ENUMERATED;
-- 
2.49.0

