Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9337716C68B
	for <linux-sound@vger.kernel.org>; Tue, 25 Jun 2024 15:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719330716; cv=none; b=hiG4Pg3x5oEtUaH7vubg0yrNEdLiBXe96AVlyjVA8RoYmT+EwIZpSdDQ6QweVBhjn422VyvCZ4EzXKBNEESz8y60Ax5du3LkaBqvW2jTXK337Rp5vsxQ9sY0IVR/pEA6PG5k6u3kloJ4sTVtsEqbtX+YwugOtl+FNGAxqN/1efo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719330716; c=relaxed/simple;
	bh=nTgpJp4HB6NvTh+pUa668QZ6+9na33C/yS6/LY44v4w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TudZ1nEulbWPaV5RCc8mz0O3yXS2XccOqaCkPFetIZaNYl6f0raFnbNtnpDZYx6GKBkNTkCZkGoTBbrieDGKfiQNObgdDBGtRIz+00hTYVt/O+2CrFnyvW81cFQuWyYNNqLST57XkfpDTUgU0/IKlWnv9/XMMPk8cBzMTvAR9dU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=WEHB8niC; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=RWb7sSHP; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=WEHB8niC; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=RWb7sSHP; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="WEHB8niC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="RWb7sSHP";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="WEHB8niC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="RWb7sSHP"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 924C11F893;
	Tue, 25 Jun 2024 15:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1719330712; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=NfZyQc3Ip1yuM4aV9BSA0E4xPqcmBlp162xw5quOOxk=;
	b=WEHB8niCnP2M8YDEDqq03uVcK+3WUxs/U2YPzzrnXQRmhHUApLSZ9opCdAjgd3G7pKU/bi
	JT6CfpRfEfCjev22d3uH57rZaiUhfzvKUZChcsDMqKRcOqkQ4qJg1LlxfVGSjYpaI6FRqA
	vcOFlY7RgTyheaquRhWrACdAFf9a/dw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1719330712;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=NfZyQc3Ip1yuM4aV9BSA0E4xPqcmBlp162xw5quOOxk=;
	b=RWb7sSHPiMu2CEQVgYFWGVkLEX/ojZZXJhuQQ8yyXzG+V5vvfmS/nI6L721SeH+aDXKXpx
	lNJOqyxFmqemhCAA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=WEHB8niC;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=RWb7sSHP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1719330712; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=NfZyQc3Ip1yuM4aV9BSA0E4xPqcmBlp162xw5quOOxk=;
	b=WEHB8niCnP2M8YDEDqq03uVcK+3WUxs/U2YPzzrnXQRmhHUApLSZ9opCdAjgd3G7pKU/bi
	JT6CfpRfEfCjev22d3uH57rZaiUhfzvKUZChcsDMqKRcOqkQ4qJg1LlxfVGSjYpaI6FRqA
	vcOFlY7RgTyheaquRhWrACdAFf9a/dw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1719330712;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=NfZyQc3Ip1yuM4aV9BSA0E4xPqcmBlp162xw5quOOxk=;
	b=RWb7sSHPiMu2CEQVgYFWGVkLEX/ojZZXJhuQQ8yyXzG+V5vvfmS/nI6L721SeH+aDXKXpx
	lNJOqyxFmqemhCAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6464413A9A;
	Tue, 25 Jun 2024 15:51:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id hJQ7F5jnembGRgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 25 Jun 2024 15:51:52 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Ajrat Makhmutov <rauty@altlinux.org>,
	Zihao Wang <wzhd@ustc.edu>,
	Gergo Koteles <soyer@irl.hu>
Subject: [PATCH] ALSA: hda/realtek: Fix conflicting quirk for PCI SSID 17aa:3820
Date: Tue, 25 Jun 2024 17:52:12 +0200
Message-ID: <20240625155217.18767-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 924C11F893
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 

The recent fix for Lenovo IdeaPad 330-17IKB replaced the quirk entry,
and this eventually breaks the existing quirk for Lenovo Yoga Duet 7
13ITL6 equipped with the same PCI SSID 17aa:3820.

For applying a proper quirk for each model, check the codec SSID
additionally.  Fortunately Yoga Duet has a different codec SSID,
0x17aa3802.

(Interestingly, 17aa:3802 has another conflict of SSID between another
Yoga model vs 14IRP8 which we had to work around similarly.)

Fixes: b1fd0d1285b1 ("ALSA: hda/realtek: Enable headset mic on IdeaPad 330-17IKB 81DM")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/patch_realtek.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 1aeaeab68437..7d9ba15f7846 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -7524,6 +7524,7 @@ enum {
 	ALC287_FIXUP_LENOVO_THKPAD_WH_ALC1318,
 	ALC256_FIXUP_CHROME_BOOK,
 	ALC287_FIXUP_LENOVO_14ARP8_LEGION_IAH7,
+	ALC287_FIXUP_LENOVO_SSID_17AA3820,
 };
 
 /* A special fixup for Lenovo C940 and Yoga Duet 7;
@@ -7595,6 +7596,20 @@ static void alc287_fixup_lenovo_legion_7(struct hda_codec *codec,
 	__snd_hda_apply_fixup(codec, id, action, 0);
 }
 
+/* Yet more conflicting PCI SSID (17aa:3820) on two Lenovo models */
+static void alc287_fixup_lenovo_ssid_17aa3820(struct hda_codec *codec,
+					      const struct hda_fixup *fix,
+					      int action)
+{
+	int id;
+
+	if (codec->core.subsystem_id == 0x17aa3820)
+		id = ALC269_FIXUP_ASPIRE_HEADSET_MIC; /* IdeaPad 330-17IKB 81DM */
+	else /* 0x17aa3802 */
+		id =  ALC287_FIXUP_YOGA7_14ITL_SPEAKERS; /* "Yoga Duet 7 13ITL6 */
+	__snd_hda_apply_fixup(codec, id, action, 0);
+}
+
 static const struct hda_fixup alc269_fixups[] = {
 	[ALC269_FIXUP_GPIO2] = {
 		.type = HDA_FIXUP_FUNC,
@@ -9831,6 +9846,10 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC225_FIXUP_HEADSET_JACK
 	},
+	[ALC287_FIXUP_LENOVO_SSID_17AA3820] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc287_fixup_lenovo_ssid_17aa3820,
+	},
 };
 
 static const struct snd_pci_quirk alc269_fixup_tbl[] = {
@@ -10530,7 +10549,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x17aa, 0x3813, "Legion 7i 15IMHG05", ALC287_FIXUP_LEGION_15IMHG05_SPEAKERS),
 	SND_PCI_QUIRK(0x17aa, 0x3818, "Lenovo C940 / Yoga Duet 7", ALC298_FIXUP_LENOVO_C940_DUET7),
 	SND_PCI_QUIRK(0x17aa, 0x3819, "Lenovo 13s Gen2 ITL", ALC287_FIXUP_13S_GEN2_SPEAKERS),
-	SND_PCI_QUIRK(0x17aa, 0x3820, "IdeaPad 330-17IKB 81DM", ALC269_FIXUP_ASPIRE_HEADSET_MIC),
+	SND_PCI_QUIRK(0x17aa, 0x3820, "IdeaPad 330 / Yoga Duet 7", ALC287_FIXUP_LENOVO_SSID_17AA3820),
 	SND_PCI_QUIRK(0x17aa, 0x3824, "Legion Y9000X 2020", ALC285_FIXUP_LEGION_Y9000X_SPEAKERS),
 	SND_PCI_QUIRK(0x17aa, 0x3827, "Ideapad S740", ALC285_FIXUP_IDEAPAD_S740_COEF),
 	SND_PCI_QUIRK(0x17aa, 0x3834, "Lenovo IdeaPad Slim 9i 14ITL5", ALC287_FIXUP_YOGA7_14ITL_SPEAKERS),
-- 
2.43.0

