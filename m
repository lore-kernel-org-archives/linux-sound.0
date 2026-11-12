Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794487729;
	b=xUFb08QCSQRk0MWOBEWQkiX/NaHcpeushZZweS9I+4zLXGqxKw/jXeO4L3onfcTKC4A5
	 jzAjfdNpureCUOqqbNvuDj8epb32983bKzjnlXKyz9gS3WNBmZWHep/mV433mbB4I/BEq
	 d9Nuym+p0P4XvyRkKcyz69BSqLFE36ANAVfewJUFR6nyZmKZUpetJQrOjH8Vr/nzcDyQP
	 kXlv5HOMTkHrF054DgTnVQlQmF9pv+LqrYjTUDTJP+fvbqMfY5fgSgji86r561GQVpe5F
	 ksZWL/S4zyrHYaLZ5tdVukbhs/+8Cjm4tW3Sk6uUonbGsDs7ZaYdFj+p59wPdrnwL2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794487729;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-Spamd-Result:
	 X-Rspamd-Server:X-Rspamd-Action:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Rspamd-Queue-Id;
	bh=ElsR9IQL8yAdYrIPHFtjA+2otf4Zq34tMQzkZeZgDAg=;
	b=cFXkvRmDb0QETE6X30GMnoL23JAJI5f6hoaJ6eKHXJOwLpoGjODdWNR1Ub+xti7EDBX6
	 PuUnIxmlaeUJSlx9T7rnc9IqhJJFn37CFfL3i9sE40UWXZ8RkqBULtwEazAXJFCnohWxV
	 vjNkj6DhXCNtrLejD8RKOQ+LlIZK3QUPc9UqyoJYyp96QPkoSEowtKnTbIU6TTELQsq95
	 n//xBmFWmLiYYnbaq8XLGfOY91Gevc9srEWq6Sfqixj09FQ+LFImES6HTppnWitT1LhZe
	 IOzxUlzk5KNVIOQOPaab60CW18FKpvcuolJG/Dge1es2JAFBesJmhLZOqQBGcRS7sqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=hqhSi7ov;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=O5WmCjL2;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=hqhSi7ov;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=O5WmCjL2;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2231E606A323
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 12:48:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2231E606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=hqhSi7ov;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=O5WmCjL2;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=hqhSi7ov;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=O5WmCjL2
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4FAA221E29;
	Thu, 12 Nov 2026 12:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794487727; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=ElsR9IQL8yAdYrIPHFtjA+2otf4Zq34tMQzkZeZgDAg=;
	b=hqhSi7ovBFeDheGDRc5Fk3CxfHh6skyq+drIy43GRrONrcZoPSnXVxSsEv8o2iv0iyQt0f
	ORF8YUGSYL0DDxH9pIrGYMbAbKd65hAN5WooNfTNjAP3cBpPwMAyCbCt+B+WfwRgoaahdi
	tHkdiHm5PDs8lsywTUhGZLIANoxEhJk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794487727;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=ElsR9IQL8yAdYrIPHFtjA+2otf4Zq34tMQzkZeZgDAg=;
	b=O5WmCjL2pNQnEVZ5ZIyL6XhNSake9W+calQYSwqxCxMV8fq3gM7rsyEB3q7CgUmbXScfdX
	5QB5dqENaN+zkpBg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=hqhSi7ov;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=O5WmCjL2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794487727; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=ElsR9IQL8yAdYrIPHFtjA+2otf4Zq34tMQzkZeZgDAg=;
	b=hqhSi7ovBFeDheGDRc5Fk3CxfHh6skyq+drIy43GRrONrcZoPSnXVxSsEv8o2iv0iyQt0f
	ORF8YUGSYL0DDxH9pIrGYMbAbKd65hAN5WooNfTNjAP3cBpPwMAyCbCt+B+WfwRgoaahdi
	tHkdiHm5PDs8lsywTUhGZLIANoxEhJk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794487727;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=ElsR9IQL8yAdYrIPHFtjA+2otf4Zq34tMQzkZeZgDAg=;
	b=O5WmCjL2pNQnEVZ5ZIyL6XhNSake9W+calQYSwqxCxMV8fq3gM7rsyEB3q7CgUmbXScfdX
	5QB5dqENaN+zkpBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 076A613432;
	Thu, 12 Nov 2026 12:48:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id XlIzNK619WoAWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 12 Nov 2026 12:48:47 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Arlou Kier Motas <motasarloukier@icloud.com>,
	William MacKinnon <wh6cyy@gmail.com>,
	Jonne Vuorela <jonne.vuorela@proton.me>
Subject: [PATCH] Revert "ALSA: hda/cs420x: Add CS4208 fixup for MacBookAir 7,2"
Date: Thu, 12 Nov 2026 13:48:42 +0100
Message-ID: <20261112124844.694544-1-tiwai@suse.de>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-12.01 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_CC(0.00)[icloud.com,gmail.com,proton.me];
	DKIM_TRACE(0.00)[suse.de:+];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_THREE(0.00)[4];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,icloud.com]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -12.01
X-Spam-Level: 
X-Rspamd-Queue-Id: 4FAA221E29

This reverts commit 82cfab6a52621febf36752bd5ed5184f82c96e07.

The quirk entry seems matching with other multiple irrelevant models
that lead to a regression on those.

Maybe we should use HDA_CODEC_QUIRK() entry for the corresponding
codec SSID, instead.  But let's revert for addressing the regression
at first.

Fixes: 82cfab6a5262 ("ALSA: hda/cs420x: Add CS4208 fixup for MacBookAir 7,2")
Closes: https://lore.kernel.org/71fb1e29-60e1-4522-a071-c53557cea39b@icloud.com
Closes: https://lore.kernel.org/CABWzDrqrskmtb7MVFgJ54k4WNSqby7Qo3R1XeoVBaJ+djaO1ew@mail.gmail.com
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/codecs/cirrus/cs420x.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/hda/codecs/cirrus/cs420x.c b/sound/hda/codecs/cirrus/cs420x.c
index 6cba01228c27..85c2ecf46d38 100644
--- a/sound/hda/codecs/cirrus/cs420x.c
+++ b/sound/hda/codecs/cirrus/cs420x.c
@@ -571,7 +571,6 @@ static const struct hda_model_fixup cs4208_models[] = {
 
 static const struct hda_quirk cs4208_fixup_tbl[] = {
 	SND_PCI_QUIRK_VENDOR(0x106b, "Apple", CS4208_MAC_AUTO),
-	SND_PCI_QUIRK(0x8086, 0x7270, "MacBookAir 7,2", CS4208_MAC_AUTO),
 	{} /* terminator */
 };
 
@@ -584,7 +583,6 @@ static const struct hda_quirk cs4208_mac_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x106b, 0x7800, "MacPro 6,1", CS4208_MACMINI),
 	SND_PCI_QUIRK(0x106b, 0x7b00, "MacBookPro 12,1", CS4208_MBP11),
 	SND_PCI_QUIRK(0x106b, 0x7f00, "iMac 16,1", CS4208_MBP11),
-	SND_PCI_QUIRK(0x8086, 0x7270, "MacBookAir 7,2", CS4208_MBA6),
 	{} /* terminator */
 };
 
-- 
2.53.0

