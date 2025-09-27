Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02A7F26E6FF
	for <linux-sound@vger.kernel.org>; Sat, 27 Sep 2025 09:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758966450; cv=none; b=Jo8YGqNbiLmSO2xVvQVJ3arOCTfAEdK2cWZLwQ4BsCjtvovmMu7wKdm34GdMM2LwZPOzpKTfbFEPNaPSdDP+H4OMR/arYl/gB6XEDhkBNpLaO5FSbNVE86VpEqMoudKx9NMBRAd9t8JJMP0ZiTkMv4B+ynxeJ18CFM7jeAMVcOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758966450; c=relaxed/simple;
	bh=w2iEvHWnPJUyOJKTgABXfwyuYwt4Q1HDGnMOQFhv5Kw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=ds0cVtFtHK6ZO45+nq/4aH1Era8JaBRd+SyN1fQjbXFPkydWPA1wbei7GCS6dIswzfPNJpO4uoTDkNF0CeBtlK5DCo/FXtOf1VDey4uF0oalTKw2EY9MTqX1sz11A2szygPP7OucrxN/+Le5qNlsLGHuOEzAsCd2pKjPEHvCzy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=cjTJdUb+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HMrGdtVj; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dGdY7y7m; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=jHE7jAqi; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cjTJdUb+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HMrGdtVj";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dGdY7y7m";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jHE7jAqi"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0E3A0267CD;
	Sat, 27 Sep 2025 09:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1758966447; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=BcJGEgrU7vBnvJwXRZYASKLlEpW3rnAuDXOelmly7RM=;
	b=cjTJdUb+5o+5tPKmTaDfjyUFcl4UuUqX3xhu2z2/5XL8rVy9+onFgsxWL6l3NN5qi9Fvdp
	6jKxHnLCgrjk62jSyOpwnmNwM9CiSc7k+xsnYgwwOAK0dpFGkj0e1KFiQ678T0Bu9VeGpq
	Bo8caoxWJML3FuJ5L0xvjTnW7uReYU8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1758966447;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=BcJGEgrU7vBnvJwXRZYASKLlEpW3rnAuDXOelmly7RM=;
	b=HMrGdtVjYX5VktevjLo2qSGG4DyUV5RclQjO72m1EqYA9HhuXc4kWxhQ6jHEAA7GmsY71M
	Ez1Bd0UTBPAKozAg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=dGdY7y7m;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=jHE7jAqi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1758966446; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=BcJGEgrU7vBnvJwXRZYASKLlEpW3rnAuDXOelmly7RM=;
	b=dGdY7y7mJLl6Pn3idwNmdBs7erNX9norsHEc2yv0h/4gJyVo8u5gc6AlUDyJ3w9mDg7qSs
	9l39gfvSTjeMnJMyP48inD/G0mntWTz+zCjkkNDJ1p5UhQLZXhTKgQwQyK95UYdXQ8deNB
	e84ezSwxwuq6O/Do2k00P/tyCRUpm9k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1758966446;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=BcJGEgrU7vBnvJwXRZYASKLlEpW3rnAuDXOelmly7RM=;
	b=jHE7jAqiPDTYay64ouPFgtlZEpV8RyClAwI+sLUklebwpR7Gvn22ZEYROLLmzUQ/kPMoQO
	mV3m4GqkIHCv/CDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E36F21373E;
	Sat, 27 Sep 2025 09:47:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id /8m2Na2y12jfTwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 27 Sep 2025 09:47:25 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: hda/realtek: Add quirk for HP Spectre 14t-ea100
Date: Sat, 27 Sep 2025 11:47:23 +0200
Message-ID: <20250927094724.9703-1-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.de:email];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 0E3A0267CD
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01

HP-Spectre 14t-ea100 model has no speaker output unless booting
previously from Windows on dual boot, a reboot while on Linux will
stop the speakers working.  Applying the existing quirk for HP Spectre
X360 EU0xxx seems fixing this speaker problem.

Reported-by: Kaden Berger <kadenb816@gmail.com>
Cc: <stable@vger.kernel.org>
Link: https://lore.kernel.org/aMxdGAmfOQ6VPNU8@archlinux
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index f267437c9698..07ea76efa5de 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -6487,6 +6487,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x89c6, "Zbook Fury 17 G9", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x89ca, "HP", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
 	SND_PCI_QUIRK(0x103c, 0x89d3, "HP EliteBook 645 G9 (MB 89D2)", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
+	SND_PCI_QUIRK(0x103c, 0x89da, "HP Spectre x360 14t-ea100", ALC245_FIXUP_HP_SPECTRE_X360_EU0XXX),
 	SND_PCI_QUIRK(0x103c, 0x89e7, "HP Elite x2 G9", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8a0f, "HP Pavilion 14-ec1xxx", ALC287_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8a20, "HP Laptop 15s-fq5xxx", ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
-- 
2.50.1

