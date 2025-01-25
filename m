Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCBF123B0
	for <linux-sound@vger.kernel.org>; Sat, 25 Jan 2025 12:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737806757; cv=none; b=ZzGm5m8BABS0IGSVUq3J2nh7V/qowXP3dgODagXhR0kpH1ZT/wGOUDRq8mnusNSuE6AToSE2gvKSQeqZIZ0BX6yMzKK8wDEJ9JyWVdWo8GIJQ+yBgtcQ+fBkvLdCatnfswbdnyy+oLFFMwvLVN0Mqd2NjUZT/HyiYdFD/G3odtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737806757; c=relaxed/simple;
	bh=weiSZpjgVWF7L1FCrl3H5ZubFmDf0sFDivsivpyfy+8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gRCEYZlMXMg2udpDLd0wBtK3lxN94L+OmSQG5uiVXYQaR1ei+pKbgS/dHdoN+7hf69252Tg1InuCEbQ37MXqotHcZpXHEVn7nX24Ism5o7z2lYm/S585ldNtaPOygkjsXo78NX0ugrgIRE9ObAd78KbbJotQNlgjRppWrQe6km4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Sr6U0xc8; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ZQiZlp6t; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Sr6U0xc8; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ZQiZlp6t; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Sr6U0xc8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ZQiZlp6t";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Sr6U0xc8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ZQiZlp6t"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 592CF21165;
	Sat, 25 Jan 2025 12:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1737806748; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=b41HaDpM+Elx3x3g7dJytBrkDJ7saP0CCpcumi+J2VQ=;
	b=Sr6U0xc8kOSKuWY0zWEFIggHSi6Rbv7/B2suYBPU2WpWFZrfpuk2WJrhORK24f+wZATAVD
	T1docPSD0a6pnvQeKVhiG5iMYjhztEQucj9Fg4v+KXI9ODFcHoYFsdHPst+t/7ZBH9brcJ
	yui7Aj549ksub0x7uGNVcRGC85ov3NA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1737806748;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=b41HaDpM+Elx3x3g7dJytBrkDJ7saP0CCpcumi+J2VQ=;
	b=ZQiZlp6tZ8Ulv1/4Ernhmv7IjPliMTd/Td1+dj5hRN7DspANzzWPvJPkEFTT+QWoC+tFnP
	jXLWq1KHXmOnzYBQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1737806748; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=b41HaDpM+Elx3x3g7dJytBrkDJ7saP0CCpcumi+J2VQ=;
	b=Sr6U0xc8kOSKuWY0zWEFIggHSi6Rbv7/B2suYBPU2WpWFZrfpuk2WJrhORK24f+wZATAVD
	T1docPSD0a6pnvQeKVhiG5iMYjhztEQucj9Fg4v+KXI9ODFcHoYFsdHPst+t/7ZBH9brcJ
	yui7Aj549ksub0x7uGNVcRGC85ov3NA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1737806748;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=b41HaDpM+Elx3x3g7dJytBrkDJ7saP0CCpcumi+J2VQ=;
	b=ZQiZlp6tZ8Ulv1/4Ernhmv7IjPliMTd/Td1+dj5hRN7DspANzzWPvJPkEFTT+QWoC+tFnP
	jXLWq1KHXmOnzYBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3537B13882;
	Sat, 25 Jan 2025 12:05:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id /ce7C5zTlGdsQAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 25 Jan 2025 12:05:48 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Samantha Glocker <iam@anislandsomewhere.com>
Subject: [PATCH] ALSA: hda/realtek: Fix quirk matching for Legion Pro 7
Date: Sat, 25 Jan 2025 13:04:40 +0100
Message-ID: <20250125120519.16420-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 

The recent cleanup of the quirk table entries with the codec ID
matching caused a regression on some Lenovo Legion 7 models with PCI
SSID 17aa:386f: it assumed wrongly as if the codec SSID on the machine
were also 17aa:386f, but in this case, it was 17aa:38a8.  This made
the binding with a wrong sub-codec, instead of TAS2781, the Cirrus
codec was bound.

For addressing the regression, correct the quirk entry to the right
value 17aa:38a8.

Note that this makes the entry appearing in an unsorted position.
This exception is needed because the entry must match before the PCI
SSID 17aa:386f.

Also there is another entry for 17aa:38a8, but the latter is for PCI
SSID matching while the new entry is for the codec SSID matching.

Fixes: 504f052aa343 ("ALSA: hda/realtek: Use codec SSID matching for Lenovo devices")
Reported-and-tested-by: Samantha Glocker <iam@anislandsomewhere.com>
Link: https://lore.kernel.org/CAGPQRHYd48U__UKYj2jJnT4+dnNNoWRBi+wj6zPRn=JpNMBUrg@mail.gmail.com
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/patch_realtek.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index d3c9ed963588..d36a79a8ecbf 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -10918,7 +10918,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x17aa, 0x3869, "Lenovo Yoga7 14IAL7", ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN),
 	HDA_CODEC_QUIRK(0x17aa, 0x386e, "Legion Y9000X 2022 IAH7", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x17aa, 0x386e, "Yoga Pro 7 14ARP8", ALC285_FIXUP_SPEAKER2_TO_DAC1),
-	HDA_CODEC_QUIRK(0x17aa, 0x386f, "Legion Pro 7 16ARX8H", ALC287_FIXUP_TAS2781_I2C),
+	HDA_CODEC_QUIRK(0x17aa, 0x38a8, "Legion Pro 7 16ARX8H", ALC287_FIXUP_TAS2781_I2C), /* this must match before PCI SSID 17aa:386f below */
 	SND_PCI_QUIRK(0x17aa, 0x386f, "Legion Pro 7i 16IAX7", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x17aa, 0x3870, "Lenovo Yoga 7 14ARB7", ALC287_FIXUP_YOGA7_14ARB7_I2C),
 	SND_PCI_QUIRK(0x17aa, 0x3877, "Lenovo Legion 7 Slim 16ARHA7", ALC287_FIXUP_CS35L41_I2C_2),
-- 
2.43.0

