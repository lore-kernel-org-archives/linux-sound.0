Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54EB42E827
	for <linux-sound@vger.kernel.org>; Mon, 13 May 2024 06:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715582402; cv=none; b=HiSFJj/vGYKd8Qj0rxEqrZgAcxw970IjSaRtMZvIkX4RxY7MhusbejytYyCobdlvYyGxEUDxJ+hzNgNO4aiGyHOkOF82qqWSpmnFbpY0D5xrVDrYlnW6iljiabTHHuSATaMvabRPD+A9dPohfRzAz+XwfokGMyqXorskmMDE9+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715582402; c=relaxed/simple;
	bh=M2sph715jyASjPA83XomoOxuHz7ozA/xPs2Z5v2dDBA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ERvykjmJ5vYTOXsLK6XZeXEpIlHHFSVs7xFjghk+uP2W75ENM1RhENZca1ZxUxOKgMrOailmv0krA/V/tSC8sPBci4Y1je6eywgkhCD3AR4k1yHiKYGaUy65etNoEhSlPKkWSZHmrkeTlRTXfm0dQBCcdezbt3rJ6gnG+a36QxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fFEtdBG0; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wNLAnlpV; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fFEtdBG0; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wNLAnlpV; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fFEtdBG0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wNLAnlpV";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fFEtdBG0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wNLAnlpV"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8A3FF3E71D;
	Mon, 13 May 2024 06:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715582399; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=rxEDdooV+tA/dzcD8dfkOroVz4KvT51q+yrRvsh4Wgw=;
	b=fFEtdBG02RiNnhn79mo/3dZR8mzoTSJAO97larjsM53R5gxu4JbKXXHT7NZPwY5K2a55Wx
	wdE6Pmxge187kbbk4Xxj/N/QAWMWNyzVaOrtd6CMQ2opEgA+DkDeYFnN3g2QdZD1uWFB8X
	dN0m2tkK+iEEZJ8NeWQA4OXpcuE4cNQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715582399;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=rxEDdooV+tA/dzcD8dfkOroVz4KvT51q+yrRvsh4Wgw=;
	b=wNLAnlpVizVc2Zqx+7guGIIJjXa7zMQpcmkoHx1JGM1PTQhegWBFJrxLG+Ef3JA4//R3Id
	/GnPd6tS4eYUoPCw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715582399; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=rxEDdooV+tA/dzcD8dfkOroVz4KvT51q+yrRvsh4Wgw=;
	b=fFEtdBG02RiNnhn79mo/3dZR8mzoTSJAO97larjsM53R5gxu4JbKXXHT7NZPwY5K2a55Wx
	wdE6Pmxge187kbbk4Xxj/N/QAWMWNyzVaOrtd6CMQ2opEgA+DkDeYFnN3g2QdZD1uWFB8X
	dN0m2tkK+iEEZJ8NeWQA4OXpcuE4cNQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715582399;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=rxEDdooV+tA/dzcD8dfkOroVz4KvT51q+yrRvsh4Wgw=;
	b=wNLAnlpVizVc2Zqx+7guGIIJjXa7zMQpcmkoHx1JGM1PTQhegWBFJrxLG+Ef3JA4//R3Id
	/GnPd6tS4eYUoPCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6732E13A52;
	Mon, 13 May 2024 06:39:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id AVeIF7+1QWYNDgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 13 May 2024 06:39:59 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Stefan Binding <sbinding@opensource.cirrus.com>
Subject: [PATCH] ALSA: hda/realtek: Drop doubly quirk entry for 103c:8a2e
Date: Mon, 13 May 2024 08:40:08 +0200
Message-ID: <20240513064010.17546-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.66 / 50.00];
	BAYES_HAM(-2.86)[99.42%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -2.66
X-Spam-Flag: NO

There are two quirk entries for SSID 103c:8a2e.  Drop the latter one
that isn't applied in anyway.

As both point to the same quirk action, there is no actual behavior
change.

Fixes: aa8e3ef4fe53 ("ALSA: hda/realtek: Add quirks for various HP ENVY models")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/patch_realtek.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index b29739bd330b..807634acbdc0 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -10103,7 +10103,6 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8a2c, "HP Envy 16", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8a2d, "HP Envy 16", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8a2e, "HP Envy 16", ALC287_FIXUP_CS35L41_I2C_2),
-	SND_PCI_QUIRK(0x103c, 0x8a2e, "HP Envy 17", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8a30, "HP Envy 17", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8a31, "HP Envy 15", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8a6e, "HP EDNA 360", ALC287_FIXUP_CS35L41_I2C_4),
-- 
2.43.0

