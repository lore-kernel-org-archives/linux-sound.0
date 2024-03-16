Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6661E560
	for <linux-sound@vger.kernel.org>; Sat, 16 Mar 2024 08:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710578277; cv=none; b=Drx+YvRvQA0xoFajQPNmWsKCK3JFA8EZIcMfGnU/5jUG6X8scEZYOKM1Wf24mDLSFJySuKAwqDhcO0FukTalJ2/tEEuRv+Cp4iAEOexWxrEKGPOvHpnqGpdI4orPoVQas4YXzip+ZWv9MGeI5reWkx1pgEsO19Td49Yok1UN8rM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710578277; c=relaxed/simple;
	bh=BnWx1dV2R+9nfz+GYUttb9wZEDAOubd6INsUpXjqcMk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uHKdoNQ+eOq6jQlsqLq5ESPcWq22LFrARrBNSVi6yfdU28wMAnBeGefDB15gQhRN7VuQbhT0N40M/j2CAN1gOZfT9KcfN3fcvLuZa4nazpbkw4bOzDB+8MzqgNXKtfL0APfPgIJO072gSe2n7rsUN2353A4jtUy/e+fbCkv/qVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OWg/FD4H; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=AvRvUToU; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OWg/FD4H; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=AvRvUToU; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OWg/FD4H";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="AvRvUToU";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OWg/FD4H";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="AvRvUToU"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9BDDE1FC05;
	Sat, 16 Mar 2024 08:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1710578273; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=VN3+EVgQ6MYAhKewc2mfJmjJh8U+PyT45uKNe54YJF8=;
	b=OWg/FD4H6ZthttQFDR5C2AuRWuRDwPKiAIKNeHTFyklqu91dZlPkXjJ9g0TC8/0hFQPKHB
	6puw1p33dI72BQs7bd9yyALTZ4WVXlo7Q5cFvGtUxbPaW7n5Xy6TQeFVhbQ0WhBo+kXike
	PzAOhdqIWGmJXwVpYVvJcayePAXLqjM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1710578273;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=VN3+EVgQ6MYAhKewc2mfJmjJh8U+PyT45uKNe54YJF8=;
	b=AvRvUToUJXnG5D/mSWdnlkTIPASvuFb90Dji0E6HGfNRajI8wLcVA5iW/6HkrwG3uT0Nit
	FDiKortspjr8vZAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1710578273; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=VN3+EVgQ6MYAhKewc2mfJmjJh8U+PyT45uKNe54YJF8=;
	b=OWg/FD4H6ZthttQFDR5C2AuRWuRDwPKiAIKNeHTFyklqu91dZlPkXjJ9g0TC8/0hFQPKHB
	6puw1p33dI72BQs7bd9yyALTZ4WVXlo7Q5cFvGtUxbPaW7n5Xy6TQeFVhbQ0WhBo+kXike
	PzAOhdqIWGmJXwVpYVvJcayePAXLqjM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1710578273;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=VN3+EVgQ6MYAhKewc2mfJmjJh8U+PyT45uKNe54YJF8=;
	b=AvRvUToUJXnG5D/mSWdnlkTIPASvuFb90Dji0E6HGfNRajI8wLcVA5iW/6HkrwG3uT0Nit
	FDiKortspjr8vZAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6E68013A66;
	Sat, 16 Mar 2024 08:37:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id BvbuGGFa9WUSaAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 16 Mar 2024 08:37:53 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Kenny Levinsen <kl@kl.wtf>,
	=?UTF-8?q?Nikl=C4=81vs=20Ko=C4=BCes=C5=86ikovs?= <pinkflames.linux@gmail.com>
Subject: [PATCH] Revert "ALSA: usb-audio: Name feature ctl using output if input is PCM"
Date: Sat, 16 Mar 2024 09:37:30 +0100
Message-ID: <20240316083744.28126-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: 0.55
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="OWg/FD4H";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=AvRvUToU
X-Spamd-Bar: /
X-Spam-Flag: NO
X-Spamd-Result: default: False [0.55 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 TO_DN_SOME(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 NEURAL_HAM_SHORT(-0.14)[-0.713];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 BAYES_HAM(-3.00)[100.00%];
	 ARC_NA(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[3];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 TAGGED_RCPT(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FREEMAIL_CC(0.00)[kl.wtf,gmail.com];
	 RCVD_TLS_ALL(0.00)[];
	 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 9BDDE1FC05

This reverts commit 1601cd53c7e3197181277326dbfc131d20a74e46.

This fix is applied globally to all devices, and it may change the
existing control names.  When the devices are managed with the fixed
configuration like UCM, such control name mismatch may lead to
significant regressions.

For avoiding that kind of regression, we would need to apply such
changes conditionally, but it'd take time to settle down.
While the original fix is a good thing in general, in order to address
the regression, let's revert the change for now.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=218605
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/mixer.c | 49 ++++++++++++++---------------------------------
 1 file changed, 14 insertions(+), 35 deletions(-)

diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index 81256ab56835..409fc1164694 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -1652,34 +1652,6 @@ static const struct usb_feature_control_info *get_feature_control_info(int contr
 	return NULL;
 }
 
-static int feature_unit_mutevol_ctl_name(struct usb_mixer_interface *mixer,
-					 struct snd_kcontrol *kctl,
-					 struct usb_audio_term *iterm,
-					 struct usb_audio_term *oterm)
-{
-	struct usb_audio_term *aterm, *bterm;
-	bool output_first;
-	int len = 0;
-
-	/*
-	 * If the input terminal is USB Streaming, we try getting the name of
-	 * the output terminal first in hopes of getting something more
-	 * descriptive than "PCM".
-	 */
-	output_first = iterm && !(iterm->type >> 16) && (iterm->type & 0xff00) == 0x0100;
-
-	aterm = output_first ? oterm : iterm;
-	bterm = output_first ? iterm : oterm;
-
-	if (aterm)
-		len = get_term_name(mixer->chip, aterm, kctl->id.name,
-				    sizeof(kctl->id.name), 1);
-	if (!len && bterm)
-		len = get_term_name(mixer->chip, bterm, kctl->id.name,
-				    sizeof(kctl->id.name), 1);
-	return len;
-}
-
 static void __build_feature_ctl(struct usb_mixer_interface *mixer,
 				const struct usbmix_name_map *imap,
 				unsigned int ctl_mask, int control,
@@ -1761,15 +1733,22 @@ static void __build_feature_ctl(struct usb_mixer_interface *mixer,
 	case UAC_FU_MUTE:
 	case UAC_FU_VOLUME:
 		/*
-		 * Determine the control name:
-		 * - If a name id is given in descriptor, use it.
-		 * - If input and output terminals are present, try to derive
-		 *   the name from either of these.
-		 * - Otherwise, make up a name using the feature unit ID.
+		 * determine the control name.  the rule is:
+		 * - if a name id is given in descriptor, use it.
+		 * - if the connected input can be determined, then use the name
+		 *   of terminal type.
+		 * - if the connected output can be determined, use it.
+		 * - otherwise, anonymous name.
 		 */
 		if (!len) {
-			len = feature_unit_mutevol_ctl_name(mixer, kctl, iterm,
-							    oterm);
+			if (iterm)
+				len = get_term_name(mixer->chip, iterm,
+						    kctl->id.name,
+						    sizeof(kctl->id.name), 1);
+			if (!len && oterm)
+				len = get_term_name(mixer->chip, oterm,
+						    kctl->id.name,
+						    sizeof(kctl->id.name), 1);
 			if (!len)
 				snprintf(kctl->id.name, sizeof(kctl->id.name),
 					 "Feature %d", unitid);
-- 
2.43.0

