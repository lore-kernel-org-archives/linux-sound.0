Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 753C8288C14
	for <linux-sound@vger.kernel.org>; Thu, 14 Aug 2025 08:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755159172; cv=none; b=lCsWWN4P7sK0Oy2e99nT+YUC3uDpazAxhEY0aWNKmz/c0IgHaBfKNy0ruPacsazUQvgkR/2M19hWM6M4BWQY5NmolMGXM5kWKt2lX7vGWWDtKfyHbxrjxWT8bdBrwfGvie2ytlyRQV8xuYrVXHtZcKeWolHTj23SD6JCRHZ494U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755159172; c=relaxed/simple;
	bh=FXSVcxrbUBW64N//dwx99HJduk7p9KN2odKCR7HTjgg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i2zVZBfOooWZiZvLxe2wB6iLJHLlEu5O4WEhfWcLHdwY+sjeaCbjoifglMXKOlbnSwnyO50Eb92rz3fdwja5Y1qnTctsSbMpjwSuxSAS2Vh+Jzxl4Ejdwi86cO1YbQM3U0my2fKb8EZrk68we7ItMsNHKK5JKoxVV1fwKsX9dNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=DIImCZBN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Yj5lHVHS; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=DIImCZBN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Yj5lHVHS; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DIImCZBN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Yj5lHVHS";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DIImCZBN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Yj5lHVHS"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 455D421B38;
	Thu, 14 Aug 2025 08:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1755159168; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=IjsoJ9O8UQR/LW6UvAhuPJrLoAkpazlaPihogCLb/6U=;
	b=DIImCZBNQTZcxYJJ9Q6GkXe/aMSFZBQTgy1YeNS8kJEfoCQ4czYCaGhhFDHA5O+mZqvlyL
	AMrVbVrbJ5eZtMP8KHfNhj6ohj/QZ4eW4h/874tT/gsMN+wuSHqK0oTiUT/W1G9v9sCroH
	6r3ZLtrjFqdykUqrmQpXzdZidM7uzSA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1755159168;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=IjsoJ9O8UQR/LW6UvAhuPJrLoAkpazlaPihogCLb/6U=;
	b=Yj5lHVHS04e53KQpoQD20OEhVFrKnkZGkB2pNS+zxtKYtGuUu3+awnGTH+E1nDjDTBU3zq
	jU/3I9sXhFvfqIBA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1755159168; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=IjsoJ9O8UQR/LW6UvAhuPJrLoAkpazlaPihogCLb/6U=;
	b=DIImCZBNQTZcxYJJ9Q6GkXe/aMSFZBQTgy1YeNS8kJEfoCQ4czYCaGhhFDHA5O+mZqvlyL
	AMrVbVrbJ5eZtMP8KHfNhj6ohj/QZ4eW4h/874tT/gsMN+wuSHqK0oTiUT/W1G9v9sCroH
	6r3ZLtrjFqdykUqrmQpXzdZidM7uzSA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1755159168;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=IjsoJ9O8UQR/LW6UvAhuPJrLoAkpazlaPihogCLb/6U=;
	b=Yj5lHVHS04e53KQpoQD20OEhVFrKnkZGkB2pNS+zxtKYtGuUu3+awnGTH+E1nDjDTBU3zq
	jU/3I9sXhFvfqIBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 24E0F1368C;
	Thu, 14 Aug 2025 08:12:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 5YeYB4CanWj2CwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 14 Aug 2025 08:12:48 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Youngjun Lee <yjjuny.lee@samsung.com>
Subject: [PATCH 1/2] ALSA: usb-audio: Validate UAC3 power domain descriptors, too
Date: Thu, 14 Aug 2025 10:12:42 +0200
Message-ID: <20250814081245.8902-1-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo,samsung.com:email];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -2.80

UAC3 power domain descriptors need to be verified with its variable
bLength for avoiding the unexpected OOB accesses by malicious
firmware, too.

Fixes: 9a2fe9b801f5 ("ALSA: usb: initial USB Audio Device Class 3.0 support")
Reported-and-tested-by: Youngjun Lee <yjjuny.lee@samsung.com>
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/validate.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/usb/validate.c b/sound/usb/validate.c
index 6fe206f6e911..4f4e8e87a14c 100644
--- a/sound/usb/validate.c
+++ b/sound/usb/validate.c
@@ -221,6 +221,17 @@ static bool validate_uac3_feature_unit(const void *p,
 	return d->bLength >= sizeof(*d) + 4 + 2;
 }
 
+static bool validate_uac3_power_domain_unit(const void *p,
+					    const struct usb_desc_validator *v)
+{
+	const struct uac3_power_domain_descriptor *d = p;
+
+	if (d->bLength < sizeof(*d))
+		return false;
+	/* baEntities[] + wPDomainDescrStr */
+	return d->bLength >= sizeof(*d) + d->bNrEntities + 2;
+}
+
 static bool validate_midi_out_jack(const void *p,
 				   const struct usb_desc_validator *v)
 {
@@ -285,6 +296,7 @@ static const struct usb_desc_validator audio_validators[] = {
 	      struct uac3_clock_multiplier_descriptor),
 	/* UAC_VERSION_3, UAC3_SAMPLE_RATE_CONVERTER: not implemented yet */
 	/* UAC_VERSION_3, UAC3_CONNECTORS: not implemented yet */
+	FUNC(UAC_VERSION_3, UAC3_POWER_DOMAIN, validate_uac3_power_domain_unit),
 	{ } /* terminator */
 };
 
-- 
2.50.1

