Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF19205502
	for <linux-sound@vger.kernel.org>; Wed,  2 Apr 2025 07:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743579733; cv=none; b=B7UNLZBdNKP8AVunpWJu+n6Rzit3IraubkhBpZu+mwmOliBAVpc8CwNEHkcBojbfw1de6LOBigxJq7OV5SQtGf1LOLRM7GQDZt1z5zBmYsNYLiwP3pHWd8eCwcheHmfPc/TRCZ9LYbI9NotoON7Nug/AM2ryk/ZmbWocYMfeI1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743579733; c=relaxed/simple;
	bh=oS1xJOL+WG89XUgwqOc+1qHN5QWM/LOu2D+eUUoHZgc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=E7norCctAmSBUACTZRtNgF5hxUXS5d4N9CNXxSHPAJHpR3ilUsGA2rx418KMmj2YK0iyDre/7eHa3EvnzZ0jmYipfFFNC6GYkqPMz9JSTkSigujfi/A5XS3FFIBcL0bR/IHnEavEbfFWynqUNN1mWKNvF0NqF6MneVSX4JY7AO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mI2t6KKA; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=jxjd5MGV; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mI2t6KKA; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=jxjd5MGV; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mI2t6KKA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jxjd5MGV";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mI2t6KKA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jxjd5MGV"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 884E7211AD;
	Wed,  2 Apr 2025 07:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743579730; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=z/i0zkM0HFYOiiHx5cKUg/J121KBMkRZGTqboddHxD8=;
	b=mI2t6KKAXhqiYkpBHNZ2DoNDGjByMJGC9/PlVpyqGaLaRLt0dCA63y7prm7MhLnnXci3sG
	YxrRbDKBQK2AW0GhkK3Qs3h3OIy6ZHAj1a36DCVo1SgoCCxFiSUcsv1gP9XqKBhjm8Yof/
	B98JEKaxu+A2I6V4E1Kd+fY1JgultMM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743579730;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=z/i0zkM0HFYOiiHx5cKUg/J121KBMkRZGTqboddHxD8=;
	b=jxjd5MGVRbInGnay9INIDCS3iyLiSlJNXoqNNlGvqsqYJnGOcnckOMznM7Bf2wAeUkF82a
	3X/pJRDLjy5fqQDw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=mI2t6KKA;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=jxjd5MGV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743579730; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=z/i0zkM0HFYOiiHx5cKUg/J121KBMkRZGTqboddHxD8=;
	b=mI2t6KKAXhqiYkpBHNZ2DoNDGjByMJGC9/PlVpyqGaLaRLt0dCA63y7prm7MhLnnXci3sG
	YxrRbDKBQK2AW0GhkK3Qs3h3OIy6ZHAj1a36DCVo1SgoCCxFiSUcsv1gP9XqKBhjm8Yof/
	B98JEKaxu+A2I6V4E1Kd+fY1JgultMM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743579730;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=z/i0zkM0HFYOiiHx5cKUg/J121KBMkRZGTqboddHxD8=;
	b=jxjd5MGVRbInGnay9INIDCS3iyLiSlJNXoqNNlGvqsqYJnGOcnckOMznM7Bf2wAeUkF82a
	3X/pJRDLjy5fqQDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6CC2A13A4B;
	Wed,  2 Apr 2025 07:42:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id jTz1GFLq7Gf9IAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 02 Apr 2025 07:42:10 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: hda/realtek: Fix built-in mic on another ASUS VivoBook model
Date: Wed,  2 Apr 2025 09:42:07 +0200
Message-ID: <20250402074208.7347-1-tiwai@suse.de>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 884E7211AD
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_NONE(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_ONE(0.00)[1];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO

There is another VivoBook model which built-in mic got broken recently
by the fix of the pin sort.  Apply the correct quirk
ALC256_FIXUP_ASUS_MIC_NO_PRESENCE to this model for addressing the
regression, too.

Fixes: 3b4309546b48 ("ALSA: hda: Fix headset detection failure due to unstable sort")
Closes: https://lore.kernel.org/Z95s5T6OXFPjRnKf@eldamar.lan
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index eec3ea1a7e08..79004bc8107b 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -10889,6 +10889,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1043, 0x1c43, "ASUS UX8406MA", ALC245_FIXUP_CS35L41_SPI_2),
 	SND_PCI_QUIRK(0x1043, 0x1c62, "ASUS GU603", ALC289_FIXUP_ASUS_GA401),
 	SND_PCI_QUIRK(0x1043, 0x1c63, "ASUS GU605M", ALC285_FIXUP_ASUS_GU605_SPI_SPEAKER2_TO_DAC1),
+	SND_PCI_QUIRK(0x1043, 0x1c80, "ASUS VivoBook TP401", ALC256_FIXUP_ASUS_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1043, 0x1c92, "ASUS ROG Strix G15", ALC285_FIXUP_ASUS_G533Z_PINS),
 	SND_PCI_QUIRK(0x1043, 0x1c9f, "ASUS G614JU/JV/JI", ALC285_FIXUP_ASUS_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1043, 0x1caf, "ASUS G634JY/JZ/JI/JG", ALC285_FIXUP_ASUS_SPI_REAR_SPEAKERS),
-- 
2.49.0

