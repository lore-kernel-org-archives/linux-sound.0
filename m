Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 672AB2AF19
	for <linux-sound@vger.kernel.org>; Wed, 30 Apr 2025 05:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745991137; cv=none; b=tWXb0GWXnWTqdZtsvzue8J/CbGabWF0GopbeGeUSMva5DnR830/y61J2WT3b4V1xBObJIWL5kmlxetjKN54jky2mLl4wKPs3g8NmnfW8wtrfMrYartMpkeJeiR1+G8A3hoa7jhY3vLUw+q+Ji2Z9KTDLW6Mlk5khZJ4nRz6fJVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745991137; c=relaxed/simple;
	bh=TU9jyx8PQWA8jN49oDnjb8+iPYNvxVh9sUVt6dfNx14=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=ljSTe8SoGGqB/g9a00YXQeLwMDEBVmrARYM038kh47DqhTebsLiKNJgsUm1PsIRY0vXH+IoOWrCeZfbuboWkHtRctb1YxPt81fYx9OSMNr9CNSgMAxgII6m4tn2QNxKI8R2mth513iiNtsVmv91czFYbO2y2E72JjWygXY5Kx20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CllTPqNp; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Tp2G+/T9; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Phxyl89l; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=L2K42Wrk; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CllTPqNp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Tp2G+/T9";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Phxyl89l";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="L2K42Wrk"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6CBBE1FB40;
	Wed, 30 Apr 2025 05:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1745991133; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=s6H3xVmAYaVTVmwJDX6RzufzPtayiDxDddMLnUCQ9+o=;
	b=CllTPqNpfN1z6s5qsWmSA/35D90oCcx+MOuO+jTGuuXqqoGgWFKKBCKEpU+8ynIsZW9F0T
	2kJjMyVcc49g6xzaswrNSJV/531+3WttmRWXnibLE/Mq/ZRVgrIxMPM4tq6gMueB5MTAVy
	cfFVEGm4yK24qv2tLtA8fOhfaVNRzkU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1745991133;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=s6H3xVmAYaVTVmwJDX6RzufzPtayiDxDddMLnUCQ9+o=;
	b=Tp2G+/T9kA8J1DqT9eitWxnuRxHcVBpKwX/qCDk8G0HdNalMlR/pldXBVElDZwVPQTbrJH
	WRBjuApAGWQygXAg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1745991132; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=s6H3xVmAYaVTVmwJDX6RzufzPtayiDxDddMLnUCQ9+o=;
	b=Phxyl89lG3WCPeY51t8fGOg8dmEMQbeMr/Xp+apuYpwgZ1WW/M10ZiTbzEXuqs/M9VWjlM
	fFSNWszD0HTWSlZUYtYN/BpO3Mqt9POMU9KDFhtmnCZUsTXDFhssYfDIVgPWly/hASVNFM
	oGiJayZ8ooj0s57BrfSStkLrUDqq4Cw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1745991132;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=s6H3xVmAYaVTVmwJDX6RzufzPtayiDxDddMLnUCQ9+o=;
	b=L2K42Wrk7NS1u2TBTN8VpdOnT9MuRxwgd3Gi1FhT1wNZLQFdTJD936kUcCsKVIz/2kJo3u
	GntpXRej2HzZlcDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5295C13A25;
	Wed, 30 Apr 2025 05:32:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id reDYEty1EWj4WgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 30 Apr 2025 05:32:12 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: hda/realtek: Fix built-mic regression on other ASUS models
Date: Wed, 30 Apr 2025 07:31:41 +0200
Message-ID: <20250430053210.31776-1-tiwai@suse.de>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.990];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -2.80
X-Spam-Flag: NO

A few ASUS models use the ALC256_FIXUP_ASUS_HEADSET_MODE although they
have no built-in mic pin on NID 0x13, as found in the commit
c1732ede5e80 ("ALSA: hda/realtek - Fix headset and mic on several Asus
laptops with ALC256").  This was relatively harmless in the past as
NID 0x13 was assigned as the secondary mic.  But since the fix for the
pin sort order, this pin became the primary one, hence user started
noticing the broken input, and we've fixed already for a few ASUS
models to switch to ALC256_FIXUP_ASUS_MIC_NO_PRESENCE.

This patch corrects the other ASUS models to use the right quirk entry
for fixing the built-in mic regression.  Here we cover X541SA
(1043:12e0), X541UV (1043:12f0), Z550SA (1043:13bf0) and X555UB
(1043:1ccd).

Fixes: 3b4309546b48 ("ALSA: hda: Fix headset detection failure due to unstable sort")
Link: https://bugzilla.kernel.org/show_bug.cgi?id=220058
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/patch_realtek.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 1799203af35a..7810d5f9b5aa 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -10910,10 +10910,10 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1043, 0x12a3, "Asus N7691ZM", ALC269_FIXUP_ASUS_N7601ZM),
 	SND_PCI_QUIRK(0x1043, 0x12af, "ASUS UX582ZS", ALC245_FIXUP_CS35L41_SPI_2),
 	SND_PCI_QUIRK(0x1043, 0x12b4, "ASUS B3405CCA / P3405CCA", ALC294_FIXUP_ASUS_CS35L41_SPI_2),
-	SND_PCI_QUIRK(0x1043, 0x12e0, "ASUS X541SA", ALC256_FIXUP_ASUS_MIC),
-	SND_PCI_QUIRK(0x1043, 0x12f0, "ASUS X541UV", ALC256_FIXUP_ASUS_MIC),
+	SND_PCI_QUIRK(0x1043, 0x12e0, "ASUS X541SA", ALC256_FIXUP_ASUS_MIC_NO_PRESENCE),
+	SND_PCI_QUIRK(0x1043, 0x12f0, "ASUS X541UV", ALC256_FIXUP_ASUS_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1043, 0x1313, "Asus K42JZ", ALC269VB_FIXUP_ASUS_MIC_NO_PRESENCE),
-	SND_PCI_QUIRK(0x1043, 0x13b0, "ASUS Z550SA", ALC256_FIXUP_ASUS_MIC),
+	SND_PCI_QUIRK(0x1043, 0x13b0, "ASUS Z550SA", ALC256_FIXUP_ASUS_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1043, 0x1427, "Asus Zenbook UX31E", ALC269VB_FIXUP_ASUS_ZENBOOK),
 	SND_PCI_QUIRK(0x1043, 0x1433, "ASUS GX650PY/PZ/PV/PU/PYV/PZV/PIV/PVV", ALC285_FIXUP_ASUS_I2C_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1043, 0x1460, "Asus VivoBook 15", ALC256_FIXUP_ASUS_MIC_NO_PRESENCE),
@@ -10967,7 +10967,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1043, 0x1c92, "ASUS ROG Strix G15", ALC285_FIXUP_ASUS_G533Z_PINS),
 	SND_PCI_QUIRK(0x1043, 0x1c9f, "ASUS G614JU/JV/JI", ALC285_FIXUP_ASUS_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1043, 0x1caf, "ASUS G634JY/JZ/JI/JG", ALC285_FIXUP_ASUS_SPI_REAR_SPEAKERS),
-	SND_PCI_QUIRK(0x1043, 0x1ccd, "ASUS X555UB", ALC256_FIXUP_ASUS_MIC),
+	SND_PCI_QUIRK(0x1043, 0x1ccd, "ASUS X555UB", ALC256_FIXUP_ASUS_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1043, 0x1ccf, "ASUS G814JU/JV/JI", ALC245_FIXUP_CS35L41_SPI_2),
 	SND_PCI_QUIRK(0x1043, 0x1cdf, "ASUS G814JY/JZ/JG", ALC245_FIXUP_CS35L41_SPI_2),
 	SND_PCI_QUIRK(0x1043, 0x1cef, "ASUS G834JY/JZ/JI/JG", ALC285_FIXUP_ASUS_HEADSET_MIC),
-- 
2.49.0

