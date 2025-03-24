Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8385D3FBA7
	for <linux-sound@vger.kernel.org>; Mon, 24 Mar 2025 15:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742830358; cv=none; b=SeqcVElSs+1s1YmnvIaAjhAwAX2k7sBC9i0f8caHa1LQsSaaqjXa2Vpa+zgfzw78W9uEJ20BO0Ivnrk2RU30fvi1r9xAfjgKEpvIovTpFoFvltLjcYzI7Csov7Coh1yo8d4qb7fFSgu3W0wComF54DSy5/mQYDJTWkdf4cFf9t4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742830358; c=relaxed/simple;
	bh=N2g11U1eHjPmlSkSUgLrsTwY/mxFFO3W6BzF20vTGgI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=j57TMtDYEniVmyDDH/Kj5t5e0gsr6oPC/RjEfmv/nE1CsA7AAHkgvRKIK5rDX4m0uVr1H6CxPTtmoM1gUnD9qQoMVS6qTaiO3MEDBSAhfdS2QOQi/5sxW+2B+a82Bkl1KOqzR1y0byhzrNfF8DD9VcC8Z8y0nYtyOS8ZafK9rPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=UdWjMLRm; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=9yOAEB4q; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=UdWjMLRm; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=9yOAEB4q; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="UdWjMLRm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9yOAEB4q";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="UdWjMLRm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9yOAEB4q"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B7A3321184;
	Mon, 24 Mar 2025 15:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742830354; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=jD5x4Vv9JGP4goOF/mLdkTIlNwH9Yxmu2Yra8JV8Nag=;
	b=UdWjMLRmsUaxDIlAdrZeXlwQ+n2JRbfk7aa/0XhVgLEBhcnmN3xVAz1NXxIfFuEpi8+Zlq
	5+TGrJ5gJHxjGWaIFMeHDA5CzN691jCfVt21Kviy0XiurmKaDjWJ6ZmLMvWKPWTv3q2dUg
	gQPfF8Jo/sXbb2qDNUlGvD0T15qYFlk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742830354;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=jD5x4Vv9JGP4goOF/mLdkTIlNwH9Yxmu2Yra8JV8Nag=;
	b=9yOAEB4qLYWDS9elEn5cZNCQOB/mhUNPMeu8VxMM/+NtJI2t2XOvtyijb5QseJJCYRZCTr
	/Z3sulSOz359AlDw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=UdWjMLRm;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=9yOAEB4q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742830354; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=jD5x4Vv9JGP4goOF/mLdkTIlNwH9Yxmu2Yra8JV8Nag=;
	b=UdWjMLRmsUaxDIlAdrZeXlwQ+n2JRbfk7aa/0XhVgLEBhcnmN3xVAz1NXxIfFuEpi8+Zlq
	5+TGrJ5gJHxjGWaIFMeHDA5CzN691jCfVt21Kviy0XiurmKaDjWJ6ZmLMvWKPWTv3q2dUg
	gQPfF8Jo/sXbb2qDNUlGvD0T15qYFlk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742830354;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=jD5x4Vv9JGP4goOF/mLdkTIlNwH9Yxmu2Yra8JV8Nag=;
	b=9yOAEB4qLYWDS9elEn5cZNCQOB/mhUNPMeu8VxMM/+NtJI2t2XOvtyijb5QseJJCYRZCTr
	/Z3sulSOz359AlDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9DB1E137AC;
	Mon, 24 Mar 2025 15:32:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id hks+JRJ74WfzYAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 24 Mar 2025 15:32:34 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: hda/realtek: Fix built-in mic assignment on ASUS VivoBook X515UA
Date: Mon, 24 Mar 2025 16:32:32 +0100
Message-ID: <20250324153233.21195-1-tiwai@suse.de>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: B7A3321184
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_NONE(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:email,suse.de:dkim,suse.de:mid]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO

ASUS VivoBook X515UA with PCI SSID 1043:106f had a default quirk
pickup via pin table that applies ALC256_FIXUP_ASUS_MIC, but this adds
a bogus built-in mic pin 0x13 enabled.  This was no big problem
because the pin 0x13 was assigned as the secondary mic, but the recent
fix made the entries sorted, hence this bogus pin appeared now as the
primary input and it broke.

For fixing the bug, put the right quirk entry for this device pointing
to ALC256_FIXUP_ASUS_MIC_NO_PRESENCE.

Fixes: 3b4309546b48 ("ALSA: hda: Fix headset detection failure due to unstable sort")
Link: https://bugzilla.kernel.org/show_bug.cgi?id=219897
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 26510ab6ce67..da8f21db607b 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -10770,6 +10770,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1043, 0x103f, "ASUS TX300", ALC282_FIXUP_ASUS_TX300),
 	SND_PCI_QUIRK(0x1043, 0x1054, "ASUS G614FH/FM/FP", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x1043, 0x106d, "Asus K53BE", ALC269_FIXUP_LIMIT_INT_MIC_BOOST),
+	SND_PCI_QUIRK(0x1043, 0x106f, "ASUS VivoBook X515UA", ALC256_FIXUP_ASUS_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1043, 0x1074, "ASUS G614PH/PM/PP", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x1043, 0x10a1, "ASUS UX391UA", ALC294_FIXUP_ASUS_SPK),
 	SND_PCI_QUIRK(0x1043, 0x10a4, "ASUS TP3407SA", ALC287_FIXUP_TAS2781_I2C),
-- 
2.49.0

