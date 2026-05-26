Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72EAB305666
	for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 05:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779774572; cv=none; b=AwkRjpaCSeBh5ch0O836W/f9vYOssWzxm4jjy+YdDTvAVEZo+sGOvvLKKISoYCQ/SlNRfb+uskHYx4csEcd6tpkFhSmhKBTPgvrfEJ4DY7B6t/PziaWWAopurVDzcF3OgdMd5Badipp6ol9fdT+KhQi6KYTi6pQTbXtftPu5opk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779774572; c=relaxed/simple;
	bh=IpjgLkwZqnd0sXnzqFXa5gBfpBlzX22zNXJBCa0Qj18=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FwhNQtpxP3iwMdn/Ae65hUas3utmXEXpieTfbE5+fzmYJSTzF0f8TFAZ9teWfOgouXd/D8gDeLi9VaC287cDO3D6sAo0LOyx+otLS9R2qwpVmwqVipXALnv0ktlks7awg4U56oVGsSU5xWu3Hf8ef+C1hFK395blPmqFwU6kTBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Iac0v9iX; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=c72eULX5; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=htIfvFUu; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=qYw37CCz; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Iac0v9iX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="c72eULX5";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="htIfvFUu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qYw37CCz"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 966F26537C;
	Tue, 26 May 2026 05:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779774569; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=f+wV+wkePOOh10FaJXyacmGJ5OUa9OFqGe07riXnHJA=;
	b=Iac0v9iXhxHXAIsjYBcN6MrSLO7D1oNoHzVV8VZ4u7p41WqHv7Qn5d1SAZFe5uhzzGp74/
	58qlB+I11C9baDfe7bjpnfMvAoRaYYIRWDqiGtddQCWaMVnszORpFxDl7Bnx6nx3fa7bEo
	NzuQMGR5XqE2SzXw8howxC8dH2UTUnE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779774569;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=f+wV+wkePOOh10FaJXyacmGJ5OUa9OFqGe07riXnHJA=;
	b=c72eULX56g9sKcNyUB3TcItSRDmyHf69sBdREQSCRDZc1dV1+Q7BUOJRx6ugQe6TKJhZrU
	Q/sMzHcHzmjrorCQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779774568; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=f+wV+wkePOOh10FaJXyacmGJ5OUa9OFqGe07riXnHJA=;
	b=htIfvFUuIXeflbdqdTHgEtSqNqpQ4zrbIfAFLOt8KcsI7mJLLEjfdNeIbtA9bz7sKnWQy/
	34Gnir2IMrZIXz/DxG7iFfOV4ztyiN3H6Q3ONU6bXYGs5QvcO4I23MDYijs8ab9k3aMxii
	p7jpsFuezxZb1WiJOUhT1s1NOLkBcbY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779774568;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=f+wV+wkePOOh10FaJXyacmGJ5OUa9OFqGe07riXnHJA=;
	b=qYw37CCzGkR6UOBpsTOEs0GDeD4ovc8tu+EkOTRipK2yO+kzLhg3S7S1cU7Of1G6Ypf1xj
	UXt31Nc7/DvSLFCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 70B5C5A04F;
	Tue, 26 May 2026 05:49:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id K22kGWg0FWo8IwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 26 May 2026 05:49:28 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: "Geoffrey D . Bennett" <g@b4.vu>
Subject: [PATCH 7.2] Revert "ALSA: scarlett2: Fix 2i2 Gen 4 direct monitor gain on firmware 2417"
Date: Tue, 26 May 2026 07:49:22 +0200
Message-ID: <20260526054923.210493-1-tiwai@suse.de>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Level: 
X-Spam-Flag: NO

This reverts commit db37cf47b67e38ade40de5cd74a4d4d772ff1416.

The fix was needed only for 7.1, while 7.2 devel branch already
received a better fix series (732a6397a526..a895279d060d), hence it's
superfluous.

Link: https://lore.kernel.org/ahUytAir51SvJjd7@m.b4.vu
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/mixer_scarlett2.c | 33 ++++-----------------------------
 1 file changed, 4 insertions(+), 29 deletions(-)

diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index 20fdf52f6212..78fb72e626ca 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -2737,27 +2737,6 @@ static int scarlett2_has_config_item(
 	return !!private->config_set->items[config_item_num].offset;
 }
 
-/* Return the configuration item's offset, applying any per-firmware
- * overrides.
- *
- * Firmware 2417 for the 2i2 Gen 4 moved DIRECT_MONITOR_GAIN by 4
- * bytes. Apply that shift here so that the rest of the driver can
- * keep using the single config set. This override can be removed
- * once the multi-config-set framework lands.
- */
-static int scarlett2_config_item_offset(
-	struct scarlett2_data *private, int config_item_num)
-{
-	int offset = private->config_set->items[config_item_num].offset;
-
-	if (config_item_num == SCARLETT2_CONFIG_DIRECT_MONITOR_GAIN &&
-	    private->info == &s2i2_gen4_info &&
-	    private->firmware_version >= 2417)
-		offset = 0x2a4;
-
-	return offset;
-}
-
 /* Send a USB message to get configuration parameters; result placed in *buf */
 static int scarlett2_usb_get_config(
 	struct usb_mixer_interface *mixer,
@@ -2767,7 +2746,6 @@ static int scarlett2_usb_get_config(
 	const struct scarlett2_config *config_item =
 		&private->config_set->items[config_item_num];
 	int size, err, i;
-	int item_offset;
 	u8 *buf_8;
 	u8 value;
 
@@ -2777,15 +2755,13 @@ static int scarlett2_usb_get_config(
 	if (!config_item->offset)
 		return -EFAULT;
 
-	item_offset = scarlett2_config_item_offset(private, config_item_num);
-
 	/* Writes to the parameter buffer are always 1 byte */
 	size = config_item->size ? config_item->size : 8;
 
 	/* For byte-sized parameters, retrieve directly into buf */
 	if (size >= 8) {
 		size = size / 8 * count;
-		err = scarlett2_usb_get(mixer, item_offset, buf, size);
+		err = scarlett2_usb_get(mixer, config_item->offset, buf, size);
 		if (err < 0)
 			return err;
 		if (config_item->size == 16) {
@@ -2803,7 +2779,7 @@ static int scarlett2_usb_get_config(
 	}
 
 	/* For bit-sized parameters, retrieve into value */
-	err = scarlett2_usb_get(mixer, item_offset, &value, 1);
+	err = scarlett2_usb_get(mixer, config_item->offset, &value, 1);
 	if (err < 0)
 		return err;
 
@@ -2953,8 +2929,7 @@ static int scarlett2_usb_set_config(
 	 */
 	if (config_item->size >= 8) {
 		size = config_item->size / 8;
-		offset = scarlett2_config_item_offset(private, config_item_num) +
-			 index * size;
+		offset = config_item->offset + index * size;
 
 	/* If updating a bit, retrieve the old value, set/clear the
 	 * bit as needed, and update value
@@ -2963,7 +2938,7 @@ static int scarlett2_usb_set_config(
 		u8 tmp;
 
 		size = 1;
-		offset = scarlett2_config_item_offset(private, config_item_num);
+		offset = config_item->offset;
 
 		err = scarlett2_usb_get(mixer, offset, &tmp, 1);
 		if (err < 0)
-- 
2.54.0

