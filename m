Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE02213A865
	for <linux-sound@vger.kernel.org>; Thu, 28 Nov 2024 07:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732778811; cv=none; b=tyCIlBd7lGlrtwhdBFveqLKr9d0xlYtYVgldlai59RwnHyQRxuUjQVqnaEUqy4ce8Ih1kcgmRWoangQRvxgZqU8t0DLxQhm137VQ86n8h5tGw6KvrCKjlTgDFZ0Za04e3Mc9LDrJ9gFFsb5j2HTIIPQyg9aqg/ztKnIbnURbXvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732778811; c=relaxed/simple;
	bh=o5vSkkHjXWVTaFzELXyILiqRM2kR0sgNj0ikH/QdljA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=amUTR6ZnQnG8IXsYD0mdMwYhO5jAD0pPXgWuq3VsHxmWDn5574INcgQmGb6qjapkSvc95do1n559qM7BRrsD8vnhxiqvE3yiX88U8F4YhfETfaVpCmtjcN06/AmcZfjkpMbJckBsVbhmlTb7727VHs09HGQzF6sWrh8uL86Rd7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ayF57SJZ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=uT85HpfV; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ayF57SJZ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=uT85HpfV; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ayF57SJZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="uT85HpfV";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ayF57SJZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="uT85HpfV"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C6DAC21199;
	Thu, 28 Nov 2024 07:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1732778807; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=ASgsS88/MaiZAULZYLRLTdgaFBAIvFEeanFGyxkqkOc=;
	b=ayF57SJZhMc7izvwOLQDmSVln4Rw4L4XvtSoEY17H+VGZGG7CIUjr6iQB5NE6667vtou0K
	ak1xwVhjy+VgHICJhPcyYLkrAWkue1FBlC6t3xl1e0vhTFXPEsUoBJu+cW2V4Gd/fbdOIe
	I6qolJ7HqP/VCQPLVwweqvd8AVFsxjs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1732778807;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=ASgsS88/MaiZAULZYLRLTdgaFBAIvFEeanFGyxkqkOc=;
	b=uT85HpfVWEA+oinezcFqlx4t78WsYoBt/Hl8Wr1CyWBVfznt62X09uklmdjeCnq8CtMwws
	OMZqwlWmySfMamCg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ayF57SJZ;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=uT85HpfV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1732778807; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=ASgsS88/MaiZAULZYLRLTdgaFBAIvFEeanFGyxkqkOc=;
	b=ayF57SJZhMc7izvwOLQDmSVln4Rw4L4XvtSoEY17H+VGZGG7CIUjr6iQB5NE6667vtou0K
	ak1xwVhjy+VgHICJhPcyYLkrAWkue1FBlC6t3xl1e0vhTFXPEsUoBJu+cW2V4Gd/fbdOIe
	I6qolJ7HqP/VCQPLVwweqvd8AVFsxjs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1732778807;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=ASgsS88/MaiZAULZYLRLTdgaFBAIvFEeanFGyxkqkOc=;
	b=uT85HpfVWEA+oinezcFqlx4t78WsYoBt/Hl8Wr1CyWBVfznt62X09uklmdjeCnq8CtMwws
	OMZqwlWmySfMamCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AB80113690;
	Thu, 28 Nov 2024 07:26:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id J7CTKDcbSGcnFAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 28 Nov 2024 07:26:47 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: hda/realtek: Apply quirk for Medion E15433
Date: Thu, 28 Nov 2024 08:26:45 +0100
Message-ID: <20241128072646.15659-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: C6DAC21199
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	ARC_NA(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:url,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

Medion E15433 laptop wich ALC269VC (SSID 2782:1705) needs the same
workaround for the missing speaker as another model.

Link: https://bugzilla.suse.com/show_bug.cgi?id=1233298
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index c53a5f8d1559..182d357e5e93 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -10950,6 +10950,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x2782, 0x0228, "Infinix ZERO BOOK 13", ALC269VB_FIXUP_INFINIX_ZERO_BOOK_13),
 	SND_PCI_QUIRK(0x2782, 0x0232, "CHUWI CoreBook XPro", ALC269VB_FIXUP_CHUWI_COREBOOK_XPRO),
 	SND_PCI_QUIRK(0x2782, 0x1701, "Infinix Y4 Max", ALC269VC_FIXUP_INFINIX_Y4_MAX),
+	SND_PCI_QUIRK(0x2782, 0x1705, "MEDION E15433", ALC269VC_FIXUP_INFINIX_Y4_MAX),
 	SND_PCI_QUIRK(0x2782, 0x1707, "Vaio VJFE-ADL", ALC298_FIXUP_SPK_VOLUME),
 	SND_PCI_QUIRK(0x2782, 0x4900, "MEDION E15443", ALC233_FIXUP_MEDION_MTL_SPK),
 	SND_PCI_QUIRK(0x8086, 0x2074, "Intel NUC 8", ALC233_FIXUP_INTEL_NUC8_DMIC),
-- 
2.43.0

