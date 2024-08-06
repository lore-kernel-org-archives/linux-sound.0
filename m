Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C68631BC066
	for <linux-sound@vger.kernel.org>; Tue,  6 Aug 2024 06:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722926927; cv=none; b=f1sy/93gfZ8hKJumqiLqiHZclpqpOBbz+WqNa0x8hYT0wage4fnL78u6euzX6K4RlpgaSk+uxrZzzVO1rLQcVmgXWCEME5taP9MR4DDEoEJ08yWgtxzqUGbJ49ghnPiF3LcdEseyIpew8objLHjid6vGZ0fqpz8Fkq/nwYTvCeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722926927; c=relaxed/simple;
	bh=XVeGsh5ehZkO0p3Kdor3jFQ7vMOzmMpqzgCDp/hUqs4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=edRm5Sf+9PDkD0CZcmVc56133woZAQOa16MDj2adC2uq8BUEMGBNOb6JnJf2nX00qNtm1SW4vvlayOJoO0c81kSWi2Dn25nFKoBLn2LFsiDotkOEECUYflzv0YMcGshSG9TXBNra6Y7LreOO4nGky+Xzykn9yVYEyDDAg7s/rjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0mgvR3RJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8BtkYqEp; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0mgvR3RJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8BtkYqEp; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0mgvR3RJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8BtkYqEp";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0mgvR3RJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8BtkYqEp"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C2ABD21BFB;
	Tue,  6 Aug 2024 06:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722926923; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=vY2BLAaUi1UcGeXDAzPtD1RdnrtTY5rdcyT/pOpD5ts=;
	b=0mgvR3RJUeIibMpKBsdjZ6WLjIu9vDnsgfwAltrEvxyGM4hGCwVuV03pNYxvR29BwUtpOt
	a85q+3jYVUwgcwSv4aod/zKtlKNdzaJbLk9/MLK6Apz48qe9frtGBaXbXPq6an0LUlRwaB
	cDrxpiFOvKaBWHzdgPaGKbSPWDONSVs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722926923;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=vY2BLAaUi1UcGeXDAzPtD1RdnrtTY5rdcyT/pOpD5ts=;
	b=8BtkYqEpQlSOKFyEXSybT2Qs/yQh2fmDUdYRq0UONlTEnZpssyl67E8HYQ/Czm9G+6+ZWg
	wwJPbIdqmUrH4DBg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722926923; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=vY2BLAaUi1UcGeXDAzPtD1RdnrtTY5rdcyT/pOpD5ts=;
	b=0mgvR3RJUeIibMpKBsdjZ6WLjIu9vDnsgfwAltrEvxyGM4hGCwVuV03pNYxvR29BwUtpOt
	a85q+3jYVUwgcwSv4aod/zKtlKNdzaJbLk9/MLK6Apz48qe9frtGBaXbXPq6an0LUlRwaB
	cDrxpiFOvKaBWHzdgPaGKbSPWDONSVs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722926923;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=vY2BLAaUi1UcGeXDAzPtD1RdnrtTY5rdcyT/pOpD5ts=;
	b=8BtkYqEpQlSOKFyEXSybT2Qs/yQh2fmDUdYRq0UONlTEnZpssyl67E8HYQ/Czm9G+6+ZWg
	wwJPbIdqmUrH4DBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9B5F513770;
	Tue,  6 Aug 2024 06:48:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 1jVIJEvHsWaHTwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 06 Aug 2024 06:48:43 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: hda/hdmi: Yet more pin fix for HP EliteDesk 800 G4
Date: Tue,  6 Aug 2024 08:49:16 +0200
Message-ID: <20240806064918.11132-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -2.80
X-Spam-Flag: NO
X-Spam-Level: 

HP EliteDesk 800 G4 (PCI SSID 103c:83e2) is another Kabylake machine
where BIOS misses the HDMI pin initializations.  Add the quirk entry.

Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/patch_hdmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index 4e7361d1d518..78042ac2b71f 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -1989,6 +1989,7 @@ static int hdmi_add_cvt(struct hda_codec *codec, hda_nid_t cvt_nid)
 }
 
 static const struct snd_pci_quirk force_connect_list[] = {
+	SND_PCI_QUIRK(0x103c, 0x83e2, "HP EliteDesk 800 G4", 1),
 	SND_PCI_QUIRK(0x103c, 0x83ef, "HP MP9 G4 Retail System AMS", 1),
 	SND_PCI_QUIRK(0x103c, 0x870f, "HP", 1),
 	SND_PCI_QUIRK(0x103c, 0x871a, "HP", 1),
-- 
2.43.0

