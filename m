Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 898B41E0B9C
	for <linux-sound@vger.kernel.org>; Thu, 16 Jul 2026 06:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784184568; cv=none; b=r9yzi1CN2ai8kwuhgQ3csP/EaL9kqSbpIaSd8NBVJ8u1e/mE42rlYBvxzV6S3hWj2iex007IxYd2k7fJ0ztelqZgMGG7jCkKzexYyRgjNrUSZpcMGg8lA11DXesMFCRApL4STQVLHOdH61HorN7+4TvhJqylhIF2QhHCe90mYNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784184568; c=relaxed/simple;
	bh=gi42Hq+I+nKgI+qvTuH9qPzxTOyCmU7I/vtAC84CTyU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hTkL1PuoLZyrRPCKUrZRRcpP0zrJxcOQJPL/p4nKY8YI1TO2J07WUYHnb5n2DJDPcPXqcYEOorHlyNets0TL9gQ4rp0ekyw43F1024p6cI6aKCPGzaf9vR4U7DHBCjlhMLnS+z+nViDcfpDp7a43GpaRkUduUdTcW0f0PJ2795o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=c50WiYEO; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=eemABVKl; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=c50WiYEO; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=eemABVKl; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="c50WiYEO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="eemABVKl";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="c50WiYEO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="eemABVKl"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5A4123E2F;
	Thu, 16 Jul 2026 06:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784184565; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=vLaXbYmrvs4FqmrDVqLrK7UFiSXfiM+P4FGlY11Cb+8=;
	b=c50WiYEOkhfhZ5lVL9P6pjg1KWN6YWTLTuwE6nNEGPY7GnpmZhZ/X3g+/JspN8Ax8XlMFg
	kmv+TCSnss2968wxtMgIXZsoc7dmi8stbtGM8IUIPc4IuALu75OxdN+426Cq87fraoK1Dq
	GFleHYgPRDP4C5/bldDYWbmg297rx8s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784184565;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=vLaXbYmrvs4FqmrDVqLrK7UFiSXfiM+P4FGlY11Cb+8=;
	b=eemABVKly8P5E/kzex3E4CEZO1uBAJi82hi5V59Ouboh6zrvMAqVClYfnD4m+D4L4IWFhN
	hq+FKIhOVi4M7dCw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=c50WiYEO;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=eemABVKl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784184565; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=vLaXbYmrvs4FqmrDVqLrK7UFiSXfiM+P4FGlY11Cb+8=;
	b=c50WiYEOkhfhZ5lVL9P6pjg1KWN6YWTLTuwE6nNEGPY7GnpmZhZ/X3g+/JspN8Ax8XlMFg
	kmv+TCSnss2968wxtMgIXZsoc7dmi8stbtGM8IUIPc4IuALu75OxdN+426Cq87fraoK1Dq
	GFleHYgPRDP4C5/bldDYWbmg297rx8s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784184565;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=vLaXbYmrvs4FqmrDVqLrK7UFiSXfiM+P4FGlY11Cb+8=;
	b=eemABVKly8P5E/kzex3E4CEZO1uBAJi82hi5V59Ouboh6zrvMAqVClYfnD4m+D4L4IWFhN
	hq+FKIhOVi4M7dCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 38EE7779AD;
	Thu, 16 Jul 2026 06:49:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id oeqWDPV+WGqscwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 16 Jul 2026 06:49:25 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: hda/realtek: Add quirk for HP Pavilion x360
Date: Thu, 16 Jul 2026 08:49:06 +0200
Message-ID: <20260716064916.540616-1-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Rspamd-Action: no action
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_NONE(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,suse.de:mid]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 5A4123E2F
X-Spam-Score: -3.01

HP Pavilion x360 sets a bogus PCI SSID (103c:0000), hence the driver
picks up a wrong quirk entry, resulting in an almost silent output.
And yet, the existing quirk for x390 doesn't seem sufficing, and we
need the extra setup for the amp.

This patch adds the quirk entry for the codec SSID (103c:8486) to
initialize the amp via COEF verbs and chains to the existing quirk for
another x360 model to address the silent output.

Closes: https://lore.kernel.org/CAF2ktaUW2oaWwGazGtJQ3o1JyE2R4O2xPd-Dchr=qqi7_QRruQ@mail.gmail.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/codecs/realtek/alc269.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 92feb2df0007..6c87e2513fe7 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -4019,6 +4019,7 @@ enum {
 	ALC256_FIXUP_HUAWEI_MACH_WX9_PINS,
 	ALC298_FIXUP_HUAWEI_MBX_STEREO,
 	ALC295_FIXUP_HP_X360,
+	ALC295_FIXUP_HP_PAVILION_X360,
 	ALC221_FIXUP_HP_HEADSET_MIC,
 	ALC285_FIXUP_LENOVO_HEADPHONE_NOISE,
 	ALC295_FIXUP_HP_AUTO_MUTE,
@@ -5343,6 +5344,19 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC269_FIXUP_HP_MUTE_LED_MIC3
 	},
+	[ALC295_FIXUP_HP_PAVILION_X360] = {
+		.type = HDA_FIXUP_VERBS,
+		.v.verbs = (const struct hda_verb[]) {
+			/* force amp gain and processing state */
+			{ 0x20, AC_VERB_SET_COEF_INDEX, 0x07 },
+			{ 0x20, AC_VERB_SET_PROC_COEF, 0x7770 },
+			{ 0x20, AC_VERB_SET_COEF_INDEX, 0x0d },
+			{ 0x20, AC_VERB_SET_PROC_COEF, 0x3000 },
+			{}
+		},
+		.chained = true,
+		.chain_id = ALC295_FIXUP_HP_X360
+	},
 	[ALC221_FIXUP_HP_HEADSET_MIC] = {
 		.type = HDA_FIXUP_PINS,
 		.v.pins = (const struct hda_pintbl[]) {
@@ -7059,6 +7073,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x82c0, "HP G3 mini premium", ALC221_FIXUP_HP_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x103c, 0x83b9, "HP Spectre x360", ALC269_FIXUP_HP_MUTE_LED_MIC3),
 	SND_PCI_QUIRK(0x103c, 0x841c, "HP Pavilion 15-CK0xx", ALC269_FIXUP_HP_MUTE_LED_MIC3),
+	HDA_CODEC_QUIRK(0x103c, 0x8486, "HP Pavilion x360", ALC295_FIXUP_HP_PAVILION_X360),
 	SND_PCI_QUIRK(0x103c, 0x8497, "HP Envy x360", ALC269_FIXUP_HP_MUTE_LED_MIC3),
 	SND_PCI_QUIRK(0x103c, 0x84a6, "HP 250 G7 Notebook PC", ALC269_FIXUP_HP_LINE1_MIC1_LED),
 	SND_PCI_QUIRK(0x103c, 0x84ae, "HP 15-db0403ng", ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
-- 
2.55.0

