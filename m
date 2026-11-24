Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795524970;
	b=vVjVOuwbNFE4lOJ/G4OpFOkXclVIsA/HD3lTkdbJWXPJ7xacfELdA6HFcPN/zhsT4tNp
	 VLi8asPds4mmY7aff18QuarkCUOmsjyAwTriBKZDaugoICn9/xEnqdZ511v7W92mLe6PC
	 lvX0AFwjjbdUE8SS/DT6L4wwERrwahkK2kYgVvO1wTC+4/rOnVaoJrTjiBbHcTMZRQpeO
	 LVwNtbiXuSOtfZUb9gNY5l9W90x3U9vIfJ3lPl3DJ9sfnDRePFJm94Ab3KI/02JGvMsjb
	 ca/hWHcgnyX6Bhpbhp0+rfQBjxy8S/VLUZBI6q8jXI9N71k+DNFUp4ZnWggfDPWNfBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795524970;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-Spamd-Result:
	 X-Rspamd-Server:X-Rspamd-Action:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Rspamd-Queue-Id;
	bh=KTNRmoNtN1OF/Yb/GMUjfy7Tt3NfwZkoUVmzm4Zqd3k=;
	b=f7KfHhracdJUVcP9PxMlugTQWH2NfxFAb/bu0b1N2G+tMAHfUArgZ7dkjkwKoYnqtAnQ
	 d/+jZ314YxdsH/zcaOGMoHSfnUfFyb/n2pFKPgCU6jiZBoTmzW0QTKDUFeB6iADpYqZXW
	 qk2dvxJiPv255iKmIbnJV8xglpbh70x4OK5AXHPl7vY/ixnCgDlmiJCs1kjD/Hiy9BMkD
	 dpwk94cD083g45pEE5gWWWEkLg09HB6cT6CpWYsbC/qEyBKTwmu6p98F0y8Sdbupn39GA
	 rsaJg9eRzE3vLNrL+jaJgotcN5caPaJ9hAnptSNV5JLb2BPTGmJcU1MAz2Ax6QhQs4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=F5pjzGNS;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=f1y3q59w;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=F5pjzGNS;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=f1y3q59w;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52133606A321
	for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 12:56:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52133606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=F5pjzGNS;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=f1y3q59w;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=F5pjzGNS;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=f1y3q59w
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5B1512209F;
	Tue, 24 Nov 2026 12:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795524968; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=KTNRmoNtN1OF/Yb/GMUjfy7Tt3NfwZkoUVmzm4Zqd3k=;
	b=F5pjzGNSafDNlCafY/9LqhtL2TlHhbk+0MR27UKSEBJxCfuZXSAoIC/mwTz/kZBINe9uPp
	XPoWf4Bkt5ZxOryWnHCq3H4GpLX5j12GlBi7HiMH018q5+fWCtqiz1Vnei6pHoK8cJZwja
	Tcb4JMcsSbAf06JihzoukIXO/jtVNeg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795524968;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=KTNRmoNtN1OF/Yb/GMUjfy7Tt3NfwZkoUVmzm4Zqd3k=;
	b=f1y3q59wODNZI+KxsZtCWxmD4Q3Kx3CvvEzyRC5aTpb98hMfI8jdmzZ7+uAiNsqy8uLOwG
	yCq/GkD3H+Mg2XBw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=F5pjzGNS;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=f1y3q59w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795524968; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=KTNRmoNtN1OF/Yb/GMUjfy7Tt3NfwZkoUVmzm4Zqd3k=;
	b=F5pjzGNSafDNlCafY/9LqhtL2TlHhbk+0MR27UKSEBJxCfuZXSAoIC/mwTz/kZBINe9uPp
	XPoWf4Bkt5ZxOryWnHCq3H4GpLX5j12GlBi7HiMH018q5+fWCtqiz1Vnei6pHoK8cJZwja
	Tcb4JMcsSbAf06JihzoukIXO/jtVNeg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795524968;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=KTNRmoNtN1OF/Yb/GMUjfy7Tt3NfwZkoUVmzm4Zqd3k=;
	b=f1y3q59wODNZI+KxsZtCWxmD4Q3Kx3CvvEzyRC5aTpb98hMfI8jdmzZ7+uAiNsqy8uLOwG
	yCq/GkD3H+Mg2XBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2E58C1339F;
	Tue, 24 Nov 2026 12:56:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id KWxnAmiJBWvJIAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 24 Nov 2026 12:56:08 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: hda/realtek: Fix regression on another Lenovo Legion 16IRX9H model
Date: Tue, 24 Nov 2026 13:55:56 +0100
Message-ID: <20261124125606.570355-1-tiwai@suse.de>
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
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -12.01
X-Spam-Level: 
X-Rspamd-Queue-Id: 5B1512209F

There is yet another Lenovo Legion 16IRX9H model with the codec SSID
17aa:38cb that suffers from the same regression as stated in the
commit 0b4d69e8d2b5 ("ALSA: hda/realtek: Fix regression on Lenovo
Legion 16IRX9H").

Cover this device in the same way, too.

Fixes: f2293e7b2ddd ("ALSA: hda/realtek: Enable all four speaker amps on Lenovo ThinkBook X G2 IAH")
Cc: <stable@vger.kernel.org>
Reported-by: Edward Bentall <bentallea@gmail.com>
Closes: https://lore.kernel.org/CACw1+JLf_0i+GvJ4POkFUrPo_AWNHp9X2aCxyQVFRcdrKbKVxQ@mail.gmail.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index dfdcf8b98c9e..f8bcdba23a07 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -8592,6 +8592,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x17aa, 0x3834, "Lenovo IdeaPad Slim 9i 14ITL5", ALC287_FIXUP_YOGA7_14ITL_SPEAKERS),
 	SND_PCI_QUIRK(0x17aa, 0x383d, "Legion Y9000X 2019", ALC285_FIXUP_LEGION_Y9000X_SPEAKERS),
 	/* Legion 16IRX9H shares PCI SSID 17aa:3842 with Thinkpad X G2 below */
+	HDA_CODEC_QUIRK(0x17aa, 0x38cb, "Lenovo Legion 16IRX9H", ALC287_FIXUP_TAS2781_I2C),
 	HDA_CODEC_QUIRK(0x17aa, 0x38cd, "Lenovo Legion 16IRX9H", ALC287_FIXUP_TAS2781_I2C),
 	SND_PCI_QUIRK(0x17aa, 0x3842, "ThinkBook X G2 IAH", ALC287_FIXUP_MG_RTKC_CSAMP_CS35L41_I2C_4_THINKPAD),
 	/* IdeaPad Pro 5 14IAH10 shares PCI SSID 17aa:3843 with Yoga Book 9i;
-- 
2.53.0

