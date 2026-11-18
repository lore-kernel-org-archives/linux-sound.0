Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795006229;
	b=jvZE1wR1afz3Wfaw9rpblDePqZq2jlNCfmXJov56odyQN6c4tCyqPdPGxUKfo7wMOjiN
	 xOJK47n0nD/tUMKlO5f6vcaWjzCa5Y57HSl6CvfoSIDZ8gs5WeZHA5Rg4SnyWiK9lRuIw
	 t7M3xEak9XARM46+EwPvhr1TeoqyPCm+ye+2KHNBvG/8E8TeDI1TLUSeRDrWh4i2E7SSH
	 qamcdGZn2GkyWwWBypfsOHjlPDDva64ST9Py+VP277h6jRIvn2IVQReFqS2TVlt1Zdwxy
	 W9tCc7nSoCmo1RtX/OFSgYrZMvnKcFLLWy/rAyU/aL29YNzJih4rWhPPng/IyQnPkMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795006229;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-Spamd-Result:
	 X-Rspamd-Server:X-Rspamd-Action:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Rspamd-Queue-Id;
	bh=Spjsami8Is6M8lNnwy9SCE/hyV3Ly9ebxyJgV453Xbc=;
	b=ldCfJSdFWHt++ulr/TTJ2BJMx2Yxw5kjMhlVnRwyM9Zer7QRJmR1kp2vtr6k1T3vqVzx
	 HBXrX7iyoy3AmI2kMCShgSvNOp4iUcsDcbat4ijkkxNwczONjkM8JYg3IJhC+jRQJ12ok
	 hJ6DYknne3doS2YIjjkj8sDx4NESFa3cn4q6vCDV4pYl680mkRcB85eolxe0x5QIjssTj
	 R+MMEkF1pNYspBBcunmIsmYVHl2ynXdydmV3eQPZGxIivqf5OgoIj/J7Kicftwhe4x7Dk
	 c03cAa/7/8gFMxEMANnnY8Ddy41dewhoiR62MclMQ8p6SfaTWdF1S58o6LEwgCPFV6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=0Plmm3fx;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=vtffl0mq;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=ES4AsAc5;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b="50YL/Yap";
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE4BD606A337
	for <linux-sound@vger.kernel.org>; Wed, 18 Nov 2026 12:50:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE4BD606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=0Plmm3fx;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=vtffl0mq;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=ES4AsAc5;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=50YL/Yap
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D3CB8221BC;
	Wed, 18 Nov 2026 12:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795006226; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Spjsami8Is6M8lNnwy9SCE/hyV3Ly9ebxyJgV453Xbc=;
	b=0Plmm3fxtpZc8ih+L9dKx6k44jhkxZm1Kccnx6mDaRmcH5GxjiwvLBzdGbd5N+MSz5mMEy
	BQX4l3epSJL7sKP/myV7ogK6u2oc7AEEwwFjHY4gOne8ymipgzK9NJZ6UGeiPyRS1FVz1G
	K6Nt1o8lPyzL0kZHs5tm4l+XyERvzO8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795006226;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Spjsami8Is6M8lNnwy9SCE/hyV3Ly9ebxyJgV453Xbc=;
	b=vtffl0mqzIpTM2r7Q7NNDzaXEC7xDNbF8JNAXf2wrxijgYfDrCGON7mUok4lUICC6YgtDP
	G6owADR1nzk88tAw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ES4AsAc5;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="50YL/Yap"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795006225; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Spjsami8Is6M8lNnwy9SCE/hyV3Ly9ebxyJgV453Xbc=;
	b=ES4AsAc5kkOmllHb0FL5l3YXj3JfWlul2QrS7B6GGe8X0ehO+lvyJnMyw/+T7fpw4R35cN
	6FNo7/QPcz7V7FDIo09har9q0ugRJoZDBgU9u9FFvbvvAETH1lO+03k28FzaDimkpdpHL1
	o8KLGAgpzLI/huZVSg1sispavsz1qIY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795006225;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Spjsami8Is6M8lNnwy9SCE/hyV3Ly9ebxyJgV453Xbc=;
	b=50YL/YapBfohcNrdVBj0Os9aJQmKvDPlQyM/ft1v+bgCR3KKS4EVJbj2maxYXmxR+1Qx3M
	ahBPEZkcqAA97ZDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 854AB134E9;
	Wed, 18 Nov 2026 12:50:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id YwDUFhGf/WouVQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 18 Nov 2026 12:50:25 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: hda/realtek: Fix regression on Lenovo Legion 16IRX9H
Date: Wed, 18 Nov 2026 13:50:23 +0100
Message-ID: <20261118125024.1900126-1-tiwai@suse.de>
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
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -12.01
X-Spam-Level: 
X-Rspamd-Queue-Id: D3CB8221BC

Lenovo Legion 16IRX9H has the very same PCI SSID (17aa:3842) as the
recently added quirk for Lenovo Thinkpad X G2 IAH, but it needs a
different qurik.  Although the quirk for Legion 16IRX9H is present,
it's not applied because the PCI SSID 17aa:3842 matches at first and
the new quirk for Thinkpad X G2 is taken instead.

As a workaround, put the codec SSID matching (17aa:38cd) for Legion
before the conflicting PCI SSID quirk entry.

Fixes: f2293e7b2ddd ("ALSA: hda/realtek: Enable all four speaker amps on Lenovo ThinkBook X G2 IAH")
Cc: <stable@vger.kernel.org>
Closes: https://lore.kernel.org/CAFjFWEjt+DPJ_gM1uTBZ_NoV6-3mi57ArjZ_Qdah2DqY-GCD1w@mail.gmail.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/codecs/realtek/alc269.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 2c541c68ff5b..1d609584e778 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -8542,6 +8542,8 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x17aa, 0x3827, "Ideapad S740", ALC285_FIXUP_IDEAPAD_S740_COEF),
 	SND_PCI_QUIRK(0x17aa, 0x3834, "Lenovo IdeaPad Slim 9i 14ITL5", ALC287_FIXUP_YOGA7_14ITL_SPEAKERS),
 	SND_PCI_QUIRK(0x17aa, 0x383d, "Legion Y9000X 2019", ALC285_FIXUP_LEGION_Y9000X_SPEAKERS),
+	/* Legion 16IRX9H shares PCI SSID 17aa:3842 with Thinkpad X G2 below */
+	HDA_CODEC_QUIRK(0x17aa, 0x38cd, "Lenovo Legion 16IRX9H", ALC287_FIXUP_TAS2781_I2C),
 	SND_PCI_QUIRK(0x17aa, 0x3842, "ThinkBook X G2 IAH", ALC287_FIXUP_MG_RTKC_CSAMP_CS35L41_I2C_4_THINKPAD),
 	/* IdeaPad Pro 5 14IAH10 shares PCI SSID 17aa:3843 with Yoga Book 9i;
 	 * use codec SSID to distinguish them
-- 
2.53.0

