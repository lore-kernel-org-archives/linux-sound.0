Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD603C1F
	for <linux-sound@vger.kernel.org>; Wed, 26 Mar 2025 15:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743002532; cv=none; b=fSLornZAfdwsnW8ftLm8daaeukfEodlhamroJEcs5G33AFw3lUZjPMPcR7n7HXzsauM1HLcJFffFQ3G/XazuJEEVwHfssbYKn+BYOrghFXmSa2C+1j59yre4HZLXsqNVPnJ0mWMTFPD1Bs66ud+7mcI/UhncQx1Kwq6yjHpThzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743002532; c=relaxed/simple;
	bh=iWCCJqR3fe9gEKutQLN1amo/U1JlZuG3q95OvMlNrK0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=kuZXiF/Br22bf42FSvY7CggjznsjyBBqS8U/bn7JrAs3N80XOYtMv53lIEGV1/aswOsVXl+rXu+CtoH7MilJeFHEsEP+LVMVXK/+wNBg4SJRVHw8ResAAIOddyGMsosP+W3ks8BOJXW7vuWJDLTYHdwqMgSFArQSpzX2PS6wjNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QmEUyBZF; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1x1wgPrn; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ssG8Xemi; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3H/jAUN8; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QmEUyBZF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1x1wgPrn";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ssG8Xemi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3H/jAUN8"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 55A0421164;
	Wed, 26 Mar 2025 15:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743002529; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=icqJSEwAPRsCqahzYmZzO6k0VGCHIqshdD9YdyuZrnE=;
	b=QmEUyBZFeRAjNwvCNs8vI5sbN1v+0gE4AtgrXjf7BYCDISeisUjkRQMoibp+s6nj199ly5
	pm/eaYddc8DDw2KlTswWEjsyGm6gp7OTWrkboTXBm8ggTTEXl6wCDJtTcP2mL68PLLB+r7
	uXQiMgkoCxJqipZK68TzL5asln52cjA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743002529;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=icqJSEwAPRsCqahzYmZzO6k0VGCHIqshdD9YdyuZrnE=;
	b=1x1wgPrn+yC/5v+JIp06av/2Z9QJhbZ3XCz+dopwLrZ/15XS1z7vekxW0R0uQZFuvOIH3C
	Zj/OrXFmsoAtEtAA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743002528; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=icqJSEwAPRsCqahzYmZzO6k0VGCHIqshdD9YdyuZrnE=;
	b=ssG8XemigpuMxbUfTyc3zBVWC7tr/kDqAhw2MHqtet3/sKpdz6hRshVEWxe8uOD/mivGyN
	yy6uH0a4owI8Ntx15igpzBaTktj0tjq7mSWfE7po6jMO8fbyEHuCo8jV1lE+8yokV7mHh7
	l2Mg51mIlbaviCmKej4pHpOGhMiBJ/4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743002528;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=icqJSEwAPRsCqahzYmZzO6k0VGCHIqshdD9YdyuZrnE=;
	b=3H/jAUN8RxHSIYNlXO3P0/ypw3Dpsx6Nvr64QiLGZdhwF8hslV9ryhjaxKz4UXsf40zyFu
	3/wOquHO6EOi6LCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3D5671374A;
	Wed, 26 Mar 2025 15:22:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 7NNsDqAb5GddWgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 26 Mar 2025 15:22:08 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: hda/realtek: Fix built-in mic breakage on ASUS VivoBook X515JA
Date: Wed, 26 Mar 2025 16:22:01 +0100
Message-ID: <20250326152205.26733-1-tiwai@suse.de>
X-Mailer: git-send-email 2.49.0
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
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Level: 

ASUS VivoBook X515JA with PCI SSID 1043:14f2 also hits the same issue
as other VivoBook model about the mic pin assignment, and the same
workaround is required to apply ALC256_FIXUP_ASUS_MIC_NO_PRESENCE
quirk.

Fixes: 3b4309546b48 ("ALSA: hda: Fix headset detection failure due to unstable sort")
Link: https://bugzilla.kernel.org/show_bug.cgi?id=219902
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index b4fe681ec3cb..bbe22530e241 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -10804,6 +10804,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1043, 0x1493, "ASUS GV601VV/VU/VJ/VQ/VI", ALC285_FIXUP_ASUS_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1043, 0x14d3, "ASUS G614JY/JZ/JG", ALC245_FIXUP_CS35L41_SPI_2),
 	SND_PCI_QUIRK(0x1043, 0x14e3, "ASUS G513PI/PU/PV", ALC287_FIXUP_CS35L41_I2C_2),
+	SND_PCI_QUIRK(0x1043, 0x14f2, "ASUS VivoBook X515JA", ALC256_FIXUP_ASUS_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1043, 0x1503, "ASUS G733PY/PZ/PZV/PYV", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x1043, 0x1517, "Asus Zenbook UX31A", ALC269VB_FIXUP_ASUS_ZENBOOK_UX31A),
 	SND_PCI_QUIRK(0x1043, 0x1533, "ASUS GV302XA/XJ/XQ/XU/XV/XI", ALC287_FIXUP_CS35L41_I2C_2),
-- 
2.49.0

