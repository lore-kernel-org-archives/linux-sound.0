Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45850332EBA
	for <linux-sound@vger.kernel.org>; Tue,  7 Apr 2026 12:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775565222; cv=none; b=RSGtxIIOX4r6CDKFY9vww6C9hq2J/XOQTZrGHdD1VA4rjvjdHSgS7/uj26DX9bhmbLojRBkuk0Pl/WDLfVXh0KsGsU5C6QrIYzIxjWDhkSuwRgoUfHfxF2oB8siOHLI1/r458GfDhosa6IRw7/hvQWeJxR+pnj3k/8Vxzq194yU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775565222; c=relaxed/simple;
	bh=bCyLaOqqDSDDKnAFCqa+iOlGpWtEIhyZcshJc0jqwVc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TMDthXDrNcC+xzKQwn63xDoRI4UiBDChyzjHSqOr/8yEAukbGFe9qdG3WGWZESXBbEsjuAp5fsnxElYfrR7WqZsi1q5/Q0I9VI+4X710XUIMxL5Ak0k5KzQM0mr+E9NPLYNrqnEUF5sSi0c5s7cu4Pt0DdERhhtzCeKyVfYNVvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=YpcUHlGZ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ua5F6Tlb; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=YpcUHlGZ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ua5F6Tlb; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YpcUHlGZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ua5F6Tlb";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YpcUHlGZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ua5F6Tlb"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5E0965BD96;
	Tue,  7 Apr 2026 12:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775565219; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=T3LDMZSfYc/1GLLvN39D2CaqhCqVeHrnF3LU9cFeC+I=;
	b=YpcUHlGZ1W9uQn7upOB826iMXBP4KG2Z/qutY2fT0Rtfq5u3F/eOyF4pBH/FP/1CFCD+tZ
	+vcK51h6gjV/Tl9tBtURIzRZHDEbOJxYNyMqF6QBqGRaDZOjL3o7hNh+n+SE78QOe50PRW
	TIIB6RDMMW+VnB+wCJDWL4MvCoHnEhM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775565219;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=T3LDMZSfYc/1GLLvN39D2CaqhCqVeHrnF3LU9cFeC+I=;
	b=ua5F6TlbNcNiJUmgZOEI3rE36JZyPLSWMJlALEvOGAbrSTBIHMCrTBPt1ujE4daa17hXRi
	pF0p+Sn7mlrao8BQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=YpcUHlGZ;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=ua5F6Tlb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775565219; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=T3LDMZSfYc/1GLLvN39D2CaqhCqVeHrnF3LU9cFeC+I=;
	b=YpcUHlGZ1W9uQn7upOB826iMXBP4KG2Z/qutY2fT0Rtfq5u3F/eOyF4pBH/FP/1CFCD+tZ
	+vcK51h6gjV/Tl9tBtURIzRZHDEbOJxYNyMqF6QBqGRaDZOjL3o7hNh+n+SE78QOe50PRW
	TIIB6RDMMW+VnB+wCJDWL4MvCoHnEhM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775565219;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=T3LDMZSfYc/1GLLvN39D2CaqhCqVeHrnF3LU9cFeC+I=;
	b=ua5F6TlbNcNiJUmgZOEI3rE36JZyPLSWMJlALEvOGAbrSTBIHMCrTBPt1ujE4daa17hXRi
	pF0p+Sn7mlrao8BQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 49B1A4A0B0;
	Tue,  7 Apr 2026 12:33:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id lzR2EaP51GlLGgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 07 Apr 2026 12:33:39 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Marcin Krycki <m.krycki@gmail.com>,
	Theodoros Orfanidis <teoulas@gmail.com>
Subject: [PATCH] Revert "ALSA: hda/realtek: Add quirk for Gigabyte Technology to fix headphone"
Date: Tue,  7 Apr 2026 14:33:17 +0200
Message-ID: <20260407123333.171130-1-tiwai@suse.de>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid,suse.de:email];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCPT_COUNT_THREE(0.00)[3];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Rspamd-Queue-Id: 5E0965BD96
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 

This reverts commit 56fbbe096a89ff4b52af78a21a4afd9d94bdcc80.

It caused regressions on other Gigabyte models, and looking at the
bugzilla entry again, the suggested change appears rather dubious, as
incorrectly setting the front mic pin as the headphone.

Fixes: 56fbbe096a89 ("ALSA: hda/realtek: Add quirk for Gigabyte Technology to fix headphone")
Cc: <stable@vger.kernel.org>
Reported-by: Marcin Krycki <m.krycki@gmail.com>
Reported-by: Theodoros Orfanidis <teoulas@gmail.com>
Closes: https://lore.kernel.org/CAEfRphPU_ABuVFzaHhspxgp2WAqi7kKNGo4yOOt0zeVFPSj8+Q@mail.gmail.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/codecs/realtek/alc662.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/sound/hda/codecs/realtek/alc662.c b/sound/hda/codecs/realtek/alc662.c
index 3a943adf9087..5073165d1f3c 100644
--- a/sound/hda/codecs/realtek/alc662.c
+++ b/sound/hda/codecs/realtek/alc662.c
@@ -313,7 +313,6 @@ enum {
 	ALC897_FIXUP_HEADSET_MIC_PIN2,
 	ALC897_FIXUP_UNIS_H3C_X500S,
 	ALC897_FIXUP_HEADSET_MIC_PIN3,
-	ALC897_FIXUP_H610M_HP_PIN,
 };
 
 static const struct hda_fixup alc662_fixups[] = {
@@ -767,13 +766,6 @@ static const struct hda_fixup alc662_fixups[] = {
 			{ }
 		},
 	},
-	[ALC897_FIXUP_H610M_HP_PIN] = {
-		.type = HDA_FIXUP_PINS,
-		.v.pins = (const struct hda_pintbl[]) {
-			{ 0x19, 0x0321403f }, /* HP out */
-			{ }
-		},
-	},
 };
 
 static const struct hda_quirk alc662_fixup_tbl[] = {
@@ -823,7 +815,6 @@ static const struct hda_quirk alc662_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1043, 0x8469, "ASUS mobo", ALC662_FIXUP_NO_JACK_DETECT),
 	SND_PCI_QUIRK(0x105b, 0x0cd6, "Foxconn", ALC662_FIXUP_ASUS_MODE2),
 	SND_PCI_QUIRK(0x144d, 0xc051, "Samsung R720", ALC662_FIXUP_IDEAPAD),
-	SND_PCI_QUIRK(0x1458, 0xa194, "H610M H V2 DDR4", ALC897_FIXUP_H610M_HP_PIN),
 	SND_PCI_QUIRK(0x14cd, 0x5003, "USI", ALC662_FIXUP_USI_HEADSET_MODE),
 	SND_PCI_QUIRK(0x17aa, 0x1036, "Lenovo P520", ALC662_FIXUP_LENOVO_MULTI_CODECS),
 	SND_PCI_QUIRK(0x17aa, 0x1057, "Lenovo P360", ALC897_FIXUP_HEADSET_MIC_PIN),
-- 
2.53.0

