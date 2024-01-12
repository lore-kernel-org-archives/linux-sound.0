Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E812F17540
	for <linux-sound@vger.kernel.org>; Fri, 12 Jan 2024 17:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="U6frbj+F";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7piTajs/";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OlWSUI3n";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bHEh8nrf"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B488D1F396;
	Fri, 12 Jan 2024 17:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1705079406; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=3+9rHgoNWtmOGB0StsaAjgce4FruhMyuTzL48vL/7pc=;
	b=U6frbj+FyiH3nbY/2c3c9SsF7yxNw9VYUi9GirK00oQLeZCFEGPqR+Updk61pwfFHynV0+
	3WHLzziUudAhIr3K4QgTjuclyygfLM9XaZTiF0+bjNO/x6Ect4xxXKAO6in0m6t1yqs0vA
	zYR4VsO6iQQeElh5x0gBSsGSJf6vxwk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1705079406;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=3+9rHgoNWtmOGB0StsaAjgce4FruhMyuTzL48vL/7pc=;
	b=7piTajs/sK9EazkR5X9KQ+nimtlWff19ltmmHvZ0Zl4qqdwrgUJDeGSPHqBFIaYACsUxxm
	A3ieFY9I8m2cayDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1705079405; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=3+9rHgoNWtmOGB0StsaAjgce4FruhMyuTzL48vL/7pc=;
	b=OlWSUI3ntdiY812oiVTWbLsKvisd7xZ6VC9OhNB12VlXBih6vbxcGTSC95OaJ9bFGv+53t
	8kDTWLHQmpm5d0cNseR/n1w5rt3uBVRjUzOXMPOVvrdNLJqowiym7Z0QDVyHTkIYPHLgWE
	w7NLFGzMYdP8nrJQ/moPvqtx45spbt8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1705079405;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=3+9rHgoNWtmOGB0StsaAjgce4FruhMyuTzL48vL/7pc=;
	b=bHEh8nrfLAo4Jg3n+ilQ2n2P2QVSKnPBQM1mERyk7nSK/14J4SqFhnsiiaSvHuSACvvTHW
	bnkyXxatpUNoPuAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 906F613782;
	Fri, 12 Jan 2024 17:10:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id iGQmIW1yoWX+NAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 12 Jan 2024 17:10:05 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: "Geoffrey D . Bennett" <g@b4.vu>
Subject: [PATCH] ALSA: scarlett2: Fix yet more -Wformat-truncation warnings
Date: Fri, 12 Jan 2024 18:10:00 +0100
Message-Id: <20240112171000.31855-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Bar: /
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=OlWSUI3n;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=bHEh8nrf
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [0.49 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 DKIM_TRACE(0.00)[suse.de:+];
	 RCPT_COUNT_TWO(0.00)[2];
	 MID_CONTAINS_FROM(1.00)[];
	 MX_GOOD(-0.01)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email,intel.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%]
X-Spam-Score: 0.49
X-Rspamd-Queue-Id: B488D1F396
X-Spam-Flag: NO

The recent code change introduced a few false-positive compile
warnings with -Wformat-trucation again.  Suppress them by replacing
snprintf() with scnprintf().

Fixes: 0a995e38dc44 ("ALSA: scarlett2: Add support for software-controllable input gain")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202401062344.AzZCYlpa-lkp@intel.com/
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/mixer_scarlett2.c | 42 ++++++++++++++++++-------------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index 1de3ddc50eb6..6de605a601e5 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -5361,9 +5361,9 @@ static int scarlett2_add_line_out_ctls(struct usb_mixer_interface *mixer)
 			if (private->vol_sw_hw_switch[index])
 				scarlett2_vol_ctl_set_writable(mixer, i, 0);
 
-			snprintf(s, sizeof(s),
-				 "Line Out %02d Volume Control Playback Enum",
-				 i + 1);
+			scnprintf(s, sizeof(s),
+				  "Line Out %02d Volume Control Playback Enum",
+				  i + 1);
 			err = scarlett2_add_new_ctl(mixer,
 						    &scarlett2_sw_hw_enum_ctl,
 						    i, 1, s,
@@ -5406,8 +5406,8 @@ static int scarlett2_add_line_in_ctls(struct usb_mixer_interface *mixer)
 
 	/* Add input level (line/inst) controls */
 	for (i = 0; i < info->level_input_count; i++) {
-		snprintf(s, sizeof(s), fmt, i + 1 + info->level_input_first,
-			 "Level", "Enum");
+		scnprintf(s, sizeof(s), fmt, i + 1 + info->level_input_first,
+			  "Level", "Enum");
 		err = scarlett2_add_new_ctl(mixer, &scarlett2_level_enum_ctl,
 					    i, 1, s, &private->level_ctls[i]);
 		if (err < 0)
@@ -5416,7 +5416,7 @@ static int scarlett2_add_line_in_ctls(struct usb_mixer_interface *mixer)
 
 	/* Add input pad controls */
 	for (i = 0; i < info->pad_input_count; i++) {
-		snprintf(s, sizeof(s), fmt, i + 1, "Pad", "Switch");
+		scnprintf(s, sizeof(s), fmt, i + 1, "Pad", "Switch");
 		err = scarlett2_add_new_ctl(mixer, &scarlett2_pad_ctl,
 					    i, 1, s, &private->pad_ctls[i]);
 		if (err < 0)
@@ -5425,8 +5425,8 @@ static int scarlett2_add_line_in_ctls(struct usb_mixer_interface *mixer)
 
 	/* Add input air controls */
 	for (i = 0; i < info->air_input_count; i++) {
-		snprintf(s, sizeof(s), fmt, i + 1 + info->air_input_first,
-			 "Air", info->air_option ? "Enum" : "Switch");
+		scnprintf(s, sizeof(s), fmt, i + 1 + info->air_input_first,
+			  "Air", info->air_option ? "Enum" : "Switch");
 		err = scarlett2_add_new_ctl(
 			mixer, &scarlett2_air_ctl[info->air_option],
 			i, 1, s, &private->air_ctls[i]);
@@ -5481,9 +5481,9 @@ static int scarlett2_add_line_in_ctls(struct usb_mixer_interface *mixer)
 
 		for (i = 0; i < info->gain_input_count; i++) {
 			if (i % 2) {
-				snprintf(s, sizeof(s),
-					 "Line In %d-%d Link Capture Switch",
-					 i, i + 1);
+				scnprintf(s, sizeof(s),
+					  "Line In %d-%d Link Capture Switch",
+					  i, i + 1);
 				err = scarlett2_add_new_ctl(
 					mixer, &scarlett2_input_link_ctl,
 					i / 2, 1, s,
@@ -5492,30 +5492,30 @@ static int scarlett2_add_line_in_ctls(struct usb_mixer_interface *mixer)
 					return err;
 			}
 
-			snprintf(s, sizeof(s), fmt, i + 1,
-				 "Gain", "Volume");
+			scnprintf(s, sizeof(s), fmt, i + 1,
+				  "Gain", "Volume");
 			err = scarlett2_add_new_ctl(
 				mixer, &scarlett2_input_gain_ctl,
 				i, 1, s, &private->input_gain_ctls[i]);
 			if (err < 0)
 				return err;
 
-			snprintf(s, sizeof(s), fmt, i + 1,
-				 "Autogain", "Switch");
+			scnprintf(s, sizeof(s), fmt, i + 1,
+				  "Autogain", "Switch");
 			err = scarlett2_add_new_ctl(
 				mixer, &scarlett2_autogain_switch_ctl,
 				i, 1, s, &private->autogain_ctls[i]);
 			if (err < 0)
 				return err;
 
-			snprintf(s, sizeof(s), fmt, i + 1,
-				 "Autogain Status", "Enum");
+			scnprintf(s, sizeof(s), fmt, i + 1,
+				  "Autogain Status", "Enum");
 			err = scarlett2_add_new_ctl(
 				mixer, &scarlett2_autogain_status_ctl,
 				i, 1, s, &private->autogain_status_ctls[i]);
 
-			snprintf(s, sizeof(s), fmt, i + 1,
-				 "Safe", "Switch");
+			scnprintf(s, sizeof(s), fmt, i + 1,
+				  "Safe", "Switch");
 			err = scarlett2_add_new_ctl(
 				mixer, &scarlett2_safe_ctl,
 				i, 1, s, &private->safe_ctls[i]);
@@ -5902,8 +5902,8 @@ static int scarlett2_add_direct_monitor_ctls(struct usb_mixer_interface *mixer)
 			for (k = 0; k < private->num_mix_in; k++, index++) {
 				char name[SNDRV_CTL_ELEM_ID_NAME_MAXLEN];
 
-				snprintf(name, sizeof(name), format,
-					 mix_type, 'A' + j, k + 1);
+				scnprintf(name, sizeof(name), format,
+					  mix_type, 'A' + j, k + 1);
 
 				err = scarlett2_add_new_ctl(
 					mixer, &scarlett2_monitor_mix_ctl,
-- 
2.35.3

