Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE5FC4430
	for <linux-sound@vger.kernel.org>; Tue, 25 Feb 2025 15:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740498346; cv=none; b=YTfJw4Pkft0RkeTg9tuRLRMzLIBHr7lrzHrUlIQYGcpKrDnTpWkrTxt7N22twfpEOh9yMYTvk+TcP5hvUbVvZkSNsHDtQ8SByZeGirxO1+vsW9SUViA1QaXJmQBCh+IibY8jWBGe47cZJt0XqeOY3MSl6ibYmHSWDwOncIt2960=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740498346; c=relaxed/simple;
	bh=X1rVuWeya4vsWEyljOmX3a/AEVXBKMJ3Hit97t5WJFg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=LqAhIE2cIJUN2PhOHDyot6M5tD0cdvrUA2L/j/n9JwhyP06lDYJnrKyHPcctfAsWjsEGlCVvhHJffscld3gTadtgYt4glxU+AezmuNOVrS5m40XhDpHfYC/R2bmS+tTSaqvBlaiYZ8KQk5H2GY3Qtxda/hGccU+g0I347C6VyeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ti6hbggh; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=79T5uc72; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ti6hbggh; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=79T5uc72; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ti6hbggh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="79T5uc72";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ti6hbggh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="79T5uc72"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id AD2922116A;
	Tue, 25 Feb 2025 15:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1740498342; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=wqEZRWyyOZOH76pPmEXpPq0KzAECsJeuLIk0lD87W4Q=;
	b=ti6hbgghXq1xUBS4728NMbmvrIM8YSB2yIhgEES/PIl/quSvgJU88rYfSFaDUN6rNIEBa8
	JV+IUoRNoJLdHQHGKV2Q94mNeRz1esQ54wvNmITF35c676eeL6ldFYIbHQO8fy8VL3AgnP
	Fq5s97aIlmp8828IYlSBHjERGbDoi0M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1740498342;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=wqEZRWyyOZOH76pPmEXpPq0KzAECsJeuLIk0lD87W4Q=;
	b=79T5uc72y9Vu+vLMq2R5n0q0pa4NOMKjjCFwcgV3p2lfArCiZOLgrOUoDScQA6/XOXxHWr
	AUnvt47shQRcmxAQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1740498342; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=wqEZRWyyOZOH76pPmEXpPq0KzAECsJeuLIk0lD87W4Q=;
	b=ti6hbgghXq1xUBS4728NMbmvrIM8YSB2yIhgEES/PIl/quSvgJU88rYfSFaDUN6rNIEBa8
	JV+IUoRNoJLdHQHGKV2Q94mNeRz1esQ54wvNmITF35c676eeL6ldFYIbHQO8fy8VL3AgnP
	Fq5s97aIlmp8828IYlSBHjERGbDoi0M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1740498342;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=wqEZRWyyOZOH76pPmEXpPq0KzAECsJeuLIk0lD87W4Q=;
	b=79T5uc72y9Vu+vLMq2R5n0q0pa4NOMKjjCFwcgV3p2lfArCiZOLgrOUoDScQA6/XOXxHWr
	AUnvt47shQRcmxAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9261E13332;
	Tue, 25 Feb 2025 15:45:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Ynd8IqblvWeXMAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 25 Feb 2025 15:45:42 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: hda/realtek: Fix wrong mic setup for ASUS VivoBook 15
Date: Tue, 25 Feb 2025 16:45:32 +0100
Message-ID: <20250225154540.13543-1-tiwai@suse.de>
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
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 

ASUS VivoBook 15 with SSID 1043:1460 took an incorrect quirk via the
pin pattern matching for ASUS (ALC256_FIXUP_ASUS_MIC), resulting in
the two built-in mic pins (0x13 and 0x1b).  This had worked without
problems casually in the past because the right pin (0x1b) was picked
up as the primary device.  But since we fixed the pin enumeration for
other bugs, the bogus one (0x13) is picked up as the primary device,
hence the bug surfaced now.

For addressing the regression, this patch explicitly specifies the
quirk entry with ALC256_FIXUP_ASUS_MIC_NO_PRESENCE, which sets up only
the headset mic pin.

Fixes: 3b4309546b48 ("ALSA: hda: Fix headset detection failure due to unstable sort")
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=219807
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 224616fbec4f..e5c80d4be535 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -10623,6 +10623,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1043, 0x13b0, "ASUS Z550SA", ALC256_FIXUP_ASUS_MIC),
 	SND_PCI_QUIRK(0x1043, 0x1427, "Asus Zenbook UX31E", ALC269VB_FIXUP_ASUS_ZENBOOK),
 	SND_PCI_QUIRK(0x1043, 0x1433, "ASUS GX650PY/PZ/PV/PU/PYV/PZV/PIV/PVV", ALC285_FIXUP_ASUS_I2C_HEADSET_MIC),
+	SND_PCI_QUIRK(0x1043, 0x1460, "Asus VivoBook 15", ALC256_FIXUP_ASUS_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1043, 0x1463, "Asus GA402X/GA402N", ALC285_FIXUP_ASUS_I2C_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1043, 0x1473, "ASUS GU604VI/VC/VE/VG/VJ/VQ/VU/VV/VY/VZ", ALC285_FIXUP_ASUS_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1043, 0x1483, "ASUS GU603VQ/VU/VV/VJ/VI", ALC285_FIXUP_ASUS_HEADSET_MIC),
-- 
2.43.0

