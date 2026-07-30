Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B05673D891B
	for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 08:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785401139; cv=none; b=L5/9C0ziBc41a4jiifidiU5ywDEuewihpLVno3OnnsFZzweJ7cQhozKGEsnUEGbrGArNnw9IuGO+mkElglb7cy0VxqPnAAzR9q4JIWG7ZErx6yCVIKrINhaSw7C0XELJQk7yHI68lYY8DHNu3fkFk4MmDxqxWbFBaHYvqqo2DbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785401139; c=relaxed/simple;
	bh=tdgLhKzrtdIz+QT26PR6cirhM2XKNXkodKE2HK1RedE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OzIhPKSthAw+D97n/3JdkTeRelNvIHn8vZfjFUofnzGFqMbIArrTEorD5IjDkecbzNluc3aA4Qq08oUxfNz8JLEmfCOhQPpVnVhUT6cuauBBA/E/2VedFg+zr7TzFXz7c5UxgomtfPChsQ7KGu1kPXpJe5NvzW6ethic9EvWg4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=l5LtSowd; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wStcBEmh; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Jseg/6EL; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=4zBw10Pl; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="l5LtSowd";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wStcBEmh";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Jseg/6EL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4zBw10Pl"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7A5D73F0D;
	Thu, 30 Jul 2026 08:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785401120; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3V77A1/E5QksCRPyjzZOZWR22aPQaz40mxy+VqWzOys=;
	b=l5LtSowd71JCRlwMIcG6uyY9ZM2mzfKut/Jln0T5zrOw2GeUcqmEVLPWNhXbNmgxFzMpVm
	Ic9Uf9LJ+Rv6fU/EhV/8RCLo8NbQOAjaTJLAj2m16NuLL1PPjfRolGY+76dN+/uVH14AIa
	ekkl9WvZ/gSklsBNerprF0UinsD2ZfM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785401120;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3V77A1/E5QksCRPyjzZOZWR22aPQaz40mxy+VqWzOys=;
	b=wStcBEmh/rBkoWbpUVgA1oo8v/Xi3ywzZ3tDjDOaZhwBFUVpEvNPa7/DLn9hNzENOReR1Q
	I8kXxjuOhORf1eDA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="Jseg/6EL";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=4zBw10Pl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785401116; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3V77A1/E5QksCRPyjzZOZWR22aPQaz40mxy+VqWzOys=;
	b=Jseg/6ELb7xvOp1dksi1AZ51oCKUdD3UtKdZJu9O/p2rhLmo+/4gHQN+EaePgDOCTS82vJ
	JrxYdNE81E28/SfFeb+1QpaiI4du23eMkHH0Wo31lVOist3JjzDCJv/QY1zGCf0V/Yx3WW
	5YUDZ3DLR1AKOZLYBf9bmBG8a9kClYc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785401116;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3V77A1/E5QksCRPyjzZOZWR22aPQaz40mxy+VqWzOys=;
	b=4zBw10PlWBlDEYOJWhtrkBCCyG1/iTtyhXWNaHa6rnwUU5aMJJhCSea4rg2pI9Tmx8qnx3
	R1Stg17DxF9y+sDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 62857779D0;
	Thu, 30 Jul 2026 08:45:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id iCzaFhwPa2qeSQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 30 Jul 2026 08:45:16 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 2/2] ALSA: hda: Drop index handling from snd_hda_get_pin_label()
Date: Thu, 30 Jul 2026 10:44:33 +0200
Message-ID: <20260730084513.327992-3-tiwai@suse.de>
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
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	ARC_NA(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 
X-Rspamd-Queue-Id: 7A5D73F0D
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action

Now no one calls snd_hda_get_pin_label() with the index pointer, so
let's drop the index handling from this helper function as a code
cleanup.  This results in reduction of unneeded code.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/codecs/generic.c         |  2 +-
 sound/hda/common/auto_parser.c     | 66 +++++-------------------------
 sound/hda/common/hda_auto_parser.h |  2 +-
 sound/hda/common/jack.c            |  2 +-
 4 files changed, 14 insertions(+), 58 deletions(-)

diff --git a/sound/hda/codecs/generic.c b/sound/hda/codecs/generic.c
index 9f6f44cdbe1e..a4623dd67f81 100644
--- a/sound/hda/codecs/generic.c
+++ b/sound/hda/codecs/generic.c
@@ -2700,7 +2700,7 @@ static void get_jack_mode_name(struct hda_codec *codec, hda_nid_t pin,
 {
 	struct hda_gen_spec *spec = codec->spec;
 
-	snd_hda_get_pin_label(codec, pin, &spec->autocfg, name, name_len, NULL);
+	snd_hda_get_pin_label(codec, pin, &spec->autocfg, name, name_len);
 	strlcat(name, " Jack Mode", name_len);
 }
 
diff --git a/sound/hda/common/auto_parser.c b/sound/hda/common/auto_parser.c
index 5bc95d3116ff..b3f16f616396 100644
--- a/sound/hda/common/auto_parser.c
+++ b/sound/hda/common/auto_parser.c
@@ -601,9 +601,9 @@ static int find_idx_in_nid_list(hda_nid_t nid, const hda_nid_t *list, int nums)
 	return -1;
 }
 
-/* get a unique suffix or an index number */
+/* get a unique suffix */
 static const char *check_output_sfx(hda_nid_t nid, const hda_nid_t *pins,
-				    int num_pins, int *indexp)
+				    int num_pins)
 {
 	static const char * const channel_sfx[] = {
 		" Front", " Surround", " CLFE", " Side"
@@ -615,11 +615,8 @@ static const char *check_output_sfx(hda_nid_t nid, const hda_nid_t *pins,
 		return NULL;
 	if (num_pins == 1)
 		return "";
-	if (num_pins > ARRAY_SIZE(channel_sfx)) {
-		if (indexp)
-			*indexp = i;
+	if (num_pins > ARRAY_SIZE(channel_sfx))
 		return "";
-	}
 	return channel_sfx[i];
 }
 
@@ -638,27 +635,9 @@ static const char *check_output_pfx(struct hda_codec *codec, hda_nid_t nid)
 	return "";
 }
 
-static int get_hp_label_index(struct hda_codec *codec, hda_nid_t nid,
-			      const hda_nid_t *pins, int num_pins)
-{
-	int i, j, idx = 0;
-
-	const char *pfx = check_output_pfx(codec, nid);
-
-	i = find_idx_in_nid_list(nid, pins, num_pins);
-	if (i < 0)
-		return -1;
-	for (j = 0; j < i; j++)
-		if (pfx == check_output_pfx(codec, pins[j]))
-			idx++;
-
-	return idx;
-}
-
 static int fill_audio_out_name(struct hda_codec *codec, hda_nid_t nid,
 			       const struct auto_pin_cfg *cfg,
-			       const char *name, char *label, int maxlen,
-			       int *indexp)
+			       const char *name, char *label, int maxlen)
 {
 	unsigned int def_conf = snd_hda_codec_get_pincfg(codec, nid);
 	int attr = snd_hda_get_input_pin_attr(def_conf);
@@ -671,19 +650,11 @@ static int fill_audio_out_name(struct hda_codec *codec, hda_nid_t nid,
 
 	if (cfg) {
 		/* try to give a unique suffix if needed */
-		sfx = check_output_sfx(nid, cfg->line_out_pins, cfg->line_outs,
-				       indexp);
+		sfx = check_output_sfx(nid, cfg->line_out_pins, cfg->line_outs);
+		if (!sfx)
+			sfx = check_output_sfx(nid, cfg->speaker_pins, cfg->speaker_outs);
 		if (!sfx)
-			sfx = check_output_sfx(nid, cfg->speaker_pins, cfg->speaker_outs,
-					       indexp);
-		if (!sfx) {
-			/* don't add channel suffix for Headphone controls */
-			int idx = get_hp_label_index(codec, nid, cfg->hp_pins,
-						     cfg->hp_outs);
-			if (idx >= 0 && indexp)
-				*indexp = idx;
 			sfx = "";
-		}
 	}
 	snprintf(label, maxlen, "%s%s%s", pfx, name, sfx);
 	return 1;
@@ -699,7 +670,6 @@ static int fill_audio_out_name(struct hda_codec *codec, hda_nid_t nid,
  * @cfg: the parsed pin configuration
  * @label: the string buffer to store
  * @maxlen: the max length of string buffer (including termination)
- * @indexp: the pointer to return the index number (for multiple ctls)
  *
  * Get a label for the given pin.  This function works for both input and
  * output pins.  When @cfg is given as non-NULL, the function tries to get
@@ -708,47 +678,33 @@ static int fill_audio_out_name(struct hda_codec *codec, hda_nid_t nid,
  * This function tries to give a unique label string for the pin as much as
  * possible.  For example, when the multiple line-outs are present, it adds
  * the channel suffix like "Front", "Surround", etc (only when @cfg is given).
- * If no unique name with a suffix is available and @indexp is non-NULL, the
- * index number is stored in the pointer.
  */
 int snd_hda_get_pin_label(struct hda_codec *codec, hda_nid_t nid,
 			  const struct auto_pin_cfg *cfg,
-			  char *label, int maxlen, int *indexp)
+			  char *label, int maxlen)
 {
 	unsigned int def_conf = snd_hda_codec_get_pincfg(codec, nid);
 	const char *name = NULL;
 	int i;
 	bool hdmi;
 
-	if (indexp)
-		*indexp = 0;
 	if (get_defcfg_connect(def_conf) == AC_JACK_PORT_NONE)
 		return 0;
 
 	switch (get_defcfg_device(def_conf)) {
 	case AC_JACK_LINE_OUT:
 		return fill_audio_out_name(codec, nid, cfg, "Line Out",
-					   label, maxlen, indexp);
+					   label, maxlen);
 	case AC_JACK_SPEAKER:
 		return fill_audio_out_name(codec, nid, cfg, "Speaker",
-					   label, maxlen, indexp);
+					   label, maxlen);
 	case AC_JACK_HP_OUT:
 		return fill_audio_out_name(codec, nid, cfg, "Headphone",
-					   label, maxlen, indexp);
+					   label, maxlen);
 	case AC_JACK_SPDIF_OUT:
 	case AC_JACK_DIG_OTHER_OUT:
 		hdmi = is_hdmi_cfg(def_conf);
 		name = hdmi ? "HDMI" : "SPDIF";
-		if (cfg && indexp)
-			for (i = 0; i < cfg->dig_outs; i++) {
-				hda_nid_t pin = cfg->dig_out_pins[i];
-				unsigned int c;
-				if (pin == nid)
-					break;
-				c = snd_hda_codec_get_pincfg(codec, pin);
-				if (hdmi == is_hdmi_cfg(c))
-					(*indexp)++;
-			}
 		break;
 	default:
 		if (cfg) {
diff --git a/sound/hda/common/hda_auto_parser.h b/sound/hda/common/hda_auto_parser.h
index 87af3d8c02f7..3c5f3ad40074 100644
--- a/sound/hda/common/hda_auto_parser.h
+++ b/sound/hda/common/hda_auto_parser.h
@@ -46,7 +46,7 @@ const char *hda_get_autocfg_input_label(struct hda_codec *codec,
 					int input);
 int snd_hda_get_pin_label(struct hda_codec *codec, hda_nid_t nid,
 			  const struct auto_pin_cfg *cfg,
-			  char *label, int maxlen, int *indexp);
+			  char *label, int maxlen);
 
 enum {
 	INPUT_PIN_ATTR_UNUSED,	/* pin not connected */
diff --git a/sound/hda/common/jack.c b/sound/hda/common/jack.c
index e0a5cc38540b..c4338f03a54d 100644
--- a/sound/hda/common/jack.c
+++ b/sound/hda/common/jack.c
@@ -612,7 +612,7 @@ static int add_jack_kctl(struct hda_codec *codec, hda_nid_t nid,
 	if (base_name)
 		strscpy(name, base_name, sizeof(name));
 	else
-		snd_hda_get_pin_label(codec, nid, cfg, name, sizeof(name), NULL);
+		snd_hda_get_pin_label(codec, nid, cfg, name, sizeof(name));
 	if (phantom_jack)
 		/* Example final name: "Internal Mic Phantom Jack" */
 		strncat(name, " Phantom", sizeof(name) - strlen(name) - 1);
-- 
2.55.0

