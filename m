Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACED62E283A
	for <linux-sound@vger.kernel.org>; Mon, 13 Oct 2025 07:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760341046; cv=none; b=kywxw842Ulki91JLAzJuiHhgzpSPi5XXb0mZtQQXo9zkCRyEUJTaZivK7ovpZZBFU7qkMf1Mr1yU5irstbY4VgEObSWKWIxiXQkfRxmZn9JPCF6vz9SSECxpnKdWwvoMu84LWXKVodDl3R1zcAxMdEDwN+aMNsCdrAx+GUJQ+rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760341046; c=relaxed/simple;
	bh=RQjgcKv+86w10qKlD3yhuoH3ZebFWiYatwy7hep2ybI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=IP1DTKSrJRuLkby71rYWUYrkrXOik60y1fNiBCNgTi/y7gLb/LM9fC40wgeOc9S8tq9Y9ZwRt7EPqb0eJQckEQSuh0wRyWfuUKDfjnYnNBxAKQ3xrJmaitGoqUBvxBA1q4z/IIkj606Ds/6ImxrjLnbjrU3io9w1pDCz3MX0N5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QSqtFx4k; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=mYhqbymR; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QSqtFx4k; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=mYhqbymR; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QSqtFx4k";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mYhqbymR";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QSqtFx4k";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mYhqbymR"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9C6771F76B;
	Mon, 13 Oct 2025 07:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1760341041; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=lXeBdKcZh19nq8PICrhQp+lPVtdmvS5qYutxnJyeIAs=;
	b=QSqtFx4kFt0vvimvgSfQm3uj0pAXRiE1Y7T/Gqda8G7+ynfekn+3SulCbzW6IArCN/JnVt
	JhasZ8SWK3249oxR5TPEml9W0pO0bc9+hIooPwnWs76me3SXgHqCRL7X7TDTlLZYHtJeJD
	l+K0emFfUtGpT7PL1ds5OwgoVn+mCDA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1760341041;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=lXeBdKcZh19nq8PICrhQp+lPVtdmvS5qYutxnJyeIAs=;
	b=mYhqbymR/pywA4z50XF4SzuL10rIy9W7kujCLZcfCbKIsU6pv9phacoT1LtuDGe8App1lt
	ml3FzXdC7u6ZTDBg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1760341041; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=lXeBdKcZh19nq8PICrhQp+lPVtdmvS5qYutxnJyeIAs=;
	b=QSqtFx4kFt0vvimvgSfQm3uj0pAXRiE1Y7T/Gqda8G7+ynfekn+3SulCbzW6IArCN/JnVt
	JhasZ8SWK3249oxR5TPEml9W0pO0bc9+hIooPwnWs76me3SXgHqCRL7X7TDTlLZYHtJeJD
	l+K0emFfUtGpT7PL1ds5OwgoVn+mCDA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1760341041;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=lXeBdKcZh19nq8PICrhQp+lPVtdmvS5qYutxnJyeIAs=;
	b=mYhqbymR/pywA4z50XF4SzuL10rIy9W7kujCLZcfCbKIsU6pv9phacoT1LtuDGe8App1lt
	ml3FzXdC7u6ZTDBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7A46B1374A;
	Mon, 13 Oct 2025 07:37:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id YUtLHDGs7GjbeAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 13 Oct 2025 07:37:21 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: hda/realtek: Add quirk entry for HP ZBook 17 G6
Date: Mon, 13 Oct 2025 09:37:18 +0200
Message-ID: <20251013073719.13202-1-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
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
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
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
X-Spam-Flag: NO
X-Spam-Score: -2.80

HP ZBook 17 G6 with SSID 103c:860c requires a similar workaround as
its 15-inch model in order to make the speaker and mute LED working.
Add the corresponding quirk entry to address it.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=220372
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 214eb9df6ef8..6b9e5c091bf3 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -6397,6 +6397,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x854a, "HP EliteBook 830 G6", ALC285_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x85c6, "HP Pavilion x360 Convertible 14-dy1xxx", ALC295_FIXUP_HP_MUTE_LED_COEFBIT11),
 	SND_PCI_QUIRK(0x103c, 0x85de, "HP Envy x360 13-ar0xxx", ALC285_FIXUP_HP_ENVY_X360),
+	SND_PCI_QUIRK(0x103c, 0x860c, "HP ZBook 17 G6", ALC285_FIXUP_HP_GPIO_AMP_INIT),
 	SND_PCI_QUIRK(0x103c, 0x860f, "HP ZBook 15 G6", ALC285_FIXUP_HP_GPIO_AMP_INIT),
 	SND_PCI_QUIRK(0x103c, 0x861f, "HP Elite Dragonfly G1", ALC285_FIXUP_HP_GPIO_AMP_INIT),
 	SND_PCI_QUIRK(0x103c, 0x869d, "HP", ALC236_FIXUP_HP_MUTE_LED),
-- 
2.50.1

