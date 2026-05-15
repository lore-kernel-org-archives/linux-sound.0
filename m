Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 640E647DF8C
	for <linux-sound@vger.kernel.org>; Fri, 15 May 2026 10:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778842625; cv=none; b=SU7CC30Sq3HgHTN/vos0K1tTfrMdiExjg+5HnPY0sK4WsyX4EExf2H0aGi1koyzEbVhgWkjdAzm3k5MCWNmCxNr/Fn1iSMresHuxCU00bBn5Mvs597O8ieNEqQDiML+ZUSMi6FpNXWLO+i8LsgvMb3NdYnUWyQHrk0ZHRd5wrtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778842625; c=relaxed/simple;
	bh=Afr8Gj1/gUkBHG8QhNCY7vBGym19orN6hD4XepGd5fc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=t4j3yglr63synrKNyZTLif+EJoXC5wZZyXVWpHm3bMZ4FHSEOzyO3fr1bbpY/6mniEuZgvgbr37lFAgvHtZcrq14nfGcCIv5ClbX5Unlogs8QAGb1pLL3PvKnn1k+y1d5MqBsFOD46sHj71debsimsXLxyq9174wTi8kYDV+haM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Dj/Anh7a; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=SNjXwcbj; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Dj/Anh7a; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=SNjXwcbj; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Dj/Anh7a";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SNjXwcbj";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Dj/Anh7a";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SNjXwcbj"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9CB6967043;
	Fri, 15 May 2026 10:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1778842622; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=NBUwC4nc64qXM5GMgQULDmMTGAQagWTatYwg8repsUM=;
	b=Dj/Anh7awXnIyDM1S3w6sLW9PTT42InFenqnNDKzMSh84jqdrVkZvlLKaFTi756H81iwbG
	wY+9Bswj60wTtNwJA5a4Thi4qNBcQ6RJ2R7rzqANXiUK9cpXLWak7Qb8XznfHzQMhuG97a
	V4acsX4otEae5DCq/ToNU1TGHY9PHYI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1778842622;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=NBUwC4nc64qXM5GMgQULDmMTGAQagWTatYwg8repsUM=;
	b=SNjXwcbjvTgmZEl0BVULFR0XTL2jagbU6q6PYinaMd721CJsA/jfCc+Ri/VqHPX30PSd81
	8m9Net9Wd35psCAQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="Dj/Anh7a";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=SNjXwcbj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1778842622; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=NBUwC4nc64qXM5GMgQULDmMTGAQagWTatYwg8repsUM=;
	b=Dj/Anh7awXnIyDM1S3w6sLW9PTT42InFenqnNDKzMSh84jqdrVkZvlLKaFTi756H81iwbG
	wY+9Bswj60wTtNwJA5a4Thi4qNBcQ6RJ2R7rzqANXiUK9cpXLWak7Qb8XznfHzQMhuG97a
	V4acsX4otEae5DCq/ToNU1TGHY9PHYI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1778842622;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=NBUwC4nc64qXM5GMgQULDmMTGAQagWTatYwg8repsUM=;
	b=SNjXwcbjvTgmZEl0BVULFR0XTL2jagbU6q6PYinaMd721CJsA/jfCc+Ri/VqHPX30PSd81
	8m9Net9Wd35psCAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 78EE8593A9;
	Fri, 15 May 2026 10:57:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id UydQHP77Bmq3SwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 15 May 2026 10:57:02 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Heiko Schmid <heiko@future-machines.org>
Subject: [PATCH] ALSA: hda: Avoid quirk matching with zero PCI SSID
Date: Fri, 15 May 2026 12:56:59 +0200
Message-ID: <20260515105700.276420-1-tiwai@suse.de>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:dkim,suse.de:mid,future-machines.org:email];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 9CB6967043
X-Spam-Level: 

Heiko reported that BIOS on some recent machines doesn't set up PCI
SSID properly but leave with zero (e.g. on HP Dragonfly Folio 13.5
inch G3 with SSID 103c:8a05/8a06), which confuses the quirk table
matching and results in the non-functional state.

Fix it by skipping the PCI SSID matching when either vendor or device
ID is zero and falling back to the codec SSID that is supposed to be
more stable for those cases.

Reported-by: Heiko Schmid <heiko@future-machines.org>
Tested-by: Heiko Schmid <heiko@future-machines.org>
Closes: https://lore.kernel.org/20260514133110.12302-1-heiko@future-machines.org
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/common/auto_parser.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/hda/common/auto_parser.c b/sound/hda/common/auto_parser.c
index 8923813ce424..5bc95d3116ff 100644
--- a/sound/hda/common/auto_parser.c
+++ b/sound/hda/common/auto_parser.c
@@ -1013,7 +1013,7 @@ void snd_hda_pick_fixup(struct hda_codec *codec,
 	const char *name = NULL;
 	const char *type = NULL;
 	unsigned int vendor, device;
-	u16 pci_vendor, pci_device;
+	u16 pci_vendor = 0, pci_device = 0;
 	u16 codec_vendor, codec_device;
 
 	if (codec->fixup_id != HDA_FIXUP_ID_NOT_SET)
@@ -1066,7 +1066,7 @@ void snd_hda_pick_fixup(struct hda_codec *codec,
 	/* match primarily with the PCI SSID */
 	for (q = quirk; q->subvendor || q->subdevice; q++) {
 		/* if the entry is specific to codec SSID, check with it */
-		if (!codec->bus->pci || q->match_codec_ssid) {
+		if (!pci_vendor || !pci_device || q->match_codec_ssid) {
 			if (hda_quirk_match(codec_vendor, codec_device, q)) {
 				type = "codec SSID";
 				goto found_device;
-- 
2.54.0

