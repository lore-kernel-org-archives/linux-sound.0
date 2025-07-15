Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D6C2609C4
	for <linux-sound@vger.kernel.org>; Tue, 15 Jul 2025 06:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752560963; cv=none; b=IBAqI38okE4aXkbfK3gsLSrWA9Ph3tTB/DrVMGRLPR21GbYfk92KI972YP6BCMwZ3h8cwieHEdpsEs/nhj1gWDLVyRLIU75sFIwEhmV0KNebClPKjBYTqNwwkMUI+r+PfjatoafuWGFac6iXa7L1Mv86rbYimu56Z0v2DRIO9eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752560963; c=relaxed/simple;
	bh=YtDvL44cvURg+Ciyzvw5Ftdgig57WmmfsOMu5etyHuE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=hxyoAJ8zTybHCo0gF0ELppk3n8vkEXjJy/qQjmm37nzUqLwUN/SeAHXDRBhTFhaHxjDgighVhnEreor9+nu2/B/TCHvyMMAJw0hJh3+IgHRWKQyiFY2J/sayjp/MbjjQMk9iEJztx7oQl8R/US+QhdPyWsbgGL/NuBQh68AhbIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ERwKCIoX; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=//Fvy9s1; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CVHkGhP4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=bQv0Xmkw; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ERwKCIoX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="//Fvy9s1";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CVHkGhP4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bQv0Xmkw"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D87231F38F;
	Tue, 15 Jul 2025 06:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752560950; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=bIAMeM/H7sWyIR1dqskOAlXIwpMxokjAod0noHx8jwk=;
	b=ERwKCIoXO3F0gcVgnoWc6Y1qVrPByqS+PNt4Z+iPCUmw7L8MSriUCWMoTUjXICI6RKeiD8
	gUw41ai6EeVpTiPQxu03e3i9lEeLnVkuBce2DAXu7xjIHAP5kbqeWukLLKQ8/kv6EaGpL6
	Jf2OAMbingSocxHHIPRfbe9AEDgNi60=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752560950;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=bIAMeM/H7sWyIR1dqskOAlXIwpMxokjAod0noHx8jwk=;
	b=//Fvy9s1MeJrLh2oRSI4YXQbH1LFpdmD+uv7jPFnCYjjKZboNA0NgglGSNWbTV+4M2NMon
	KQZjSUweUSnAqFBw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752560948; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=bIAMeM/H7sWyIR1dqskOAlXIwpMxokjAod0noHx8jwk=;
	b=CVHkGhP4B6rWdlgtT1yp+sh3oCcQ1rCvO5WhSwQ2kdsRa3a5q+i3hZDMRbKwc6XTzux+Uz
	yM8Ey8X98j40XAtkIJAUAyVX1+oRbUqmea53ilLxONl11rYo/mlH3y/18yupWyaF3t3+wE
	On/WiFYpX/muQNCDr39hZRaGFrDm1Vw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752560948;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=bIAMeM/H7sWyIR1dqskOAlXIwpMxokjAod0noHx8jwk=;
	b=bQv0Xmkw6zklopN2xkcH89s+ozg8FiJ+B5+gOD894wamwfKdCjCqcDd/BrHFD2lzcEZmUi
	Vy0nMW08YId2XPCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BF79F13306;
	Tue, 15 Jul 2025 06:29:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 7M97LTT1dWh9LwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 15 Jul 2025 06:29:08 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: hda/realtek: Add quirk for ASUS ROG Strix G712LWS
Date: Tue, 15 Jul 2025 08:29:04 +0200
Message-ID: <20250715062906.11857-1-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -2.80

ASUS ROG Strix G712LWS (PCI SSID 1043:1a83) requires the quirk for
ALC294 headset mode in order to make the speaker and headset I/O
working properly.

Cc: <stable@vger.kernel.org>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=220334
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 47ceb6f32291..d91aac06adde 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -11010,6 +11010,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1043, 0x1a13, "Asus G73Jw", ALC269_FIXUP_ASUS_G73JW),
 	SND_PCI_QUIRK(0x1043, 0x1a63, "ASUS UX3405MA", ALC245_FIXUP_CS35L41_SPI_2),
 	SND_PCI_QUIRK(0x1043, 0x1a83, "ASUS UM5302LA", ALC294_FIXUP_CS35L41_I2C_2),
+	SND_PCI_QUIRK(0x1043, 0x1a8e, "ASUS G712LWS", ALC294_FIXUP_LENOVO_MIC_LOCATION),
 	SND_PCI_QUIRK(0x1043, 0x1a8f, "ASUS UX582ZS", ALC245_FIXUP_CS35L41_SPI_2),
 	SND_PCI_QUIRK(0x1043, 0x1b11, "ASUS UX431DA", ALC294_FIXUP_ASUS_COEF_1B),
 	SND_PCI_QUIRK(0x1043, 0x1b13, "ASUS U41SV/GA403U", ALC285_FIXUP_ASUS_GA403U_HEADSET_MIC),
-- 
2.50.1

