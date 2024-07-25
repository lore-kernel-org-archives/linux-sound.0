Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2227716DC0F
	for <linux-sound@vger.kernel.org>; Thu, 25 Jul 2024 06:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721890454; cv=none; b=WTqhX0tIG/dPkLjWm8BfI46aUxPoGl9GNC3e5aLAH5gU+Jcc5KkcKDq7ksjyinIC5t4+2wH+LquIMdcxdKgn+Uk8Z/xjkdTjjENrLW8BZ8wSU7+0HcKM3oByMVyei3JQlXUY7hApFADBpPziobaJ8BZv+5gUulrta3Lp51TNKUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721890454; c=relaxed/simple;
	bh=ndZC2AjJxGoSvZqZbh6vVzXkCOWFMfY+pWTcjVF41Hc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KTncPyM4iSXyHtpj/+PyfTTsCM8lgF5mZz2ReOz2ccJ0lD+6BnuMm/3q5qlV0xzVfs1zjuymtFTBDdvi7j8r/LjyXN/qZH8CYP6qwus7LwLXtrAi/mhOzTR/DUDMlfifpP49hML7jSiHjnLm4fLyGsXzxg5I3SisAOQADJkIWXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=c5lNgUmj; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=79UlAaXi; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=c5lNgUmj; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=79UlAaXi; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="c5lNgUmj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="79UlAaXi";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="c5lNgUmj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="79UlAaXi"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 23B651F7E6;
	Thu, 25 Jul 2024 06:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1721890451; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=nHPjyekPn1AFx+IN+zbyhpqnHymqb2ejZkei1ELek6o=;
	b=c5lNgUmjtX6SylGyRHSfmoHfKozs1W7RGjUQY8yqfKxQrZCW3vsDbC8NVlZRxOUXY29aHL
	z396nMam7G/0rkEuGx2lUKMhxsaDIM6KM2lmn4UcPFiun9XDIWff0tLKewyPID5D6Z5FlH
	pbIXEl1OORq2Whifgo1bVDMyBZ24rSw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1721890451;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=nHPjyekPn1AFx+IN+zbyhpqnHymqb2ejZkei1ELek6o=;
	b=79UlAaXiYb8U1feqsGmeqIZCrrvG24xxMj8Ld/KnhszBB/ljF9Yf3fq1Ky1/41KifCL+w7
	HwYQG6N1NI3rhMCQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=c5lNgUmj;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=79UlAaXi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1721890451; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=nHPjyekPn1AFx+IN+zbyhpqnHymqb2ejZkei1ELek6o=;
	b=c5lNgUmjtX6SylGyRHSfmoHfKozs1W7RGjUQY8yqfKxQrZCW3vsDbC8NVlZRxOUXY29aHL
	z396nMam7G/0rkEuGx2lUKMhxsaDIM6KM2lmn4UcPFiun9XDIWff0tLKewyPID5D6Z5FlH
	pbIXEl1OORq2Whifgo1bVDMyBZ24rSw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1721890451;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=nHPjyekPn1AFx+IN+zbyhpqnHymqb2ejZkei1ELek6o=;
	b=79UlAaXiYb8U1feqsGmeqIZCrrvG24xxMj8Ld/KnhszBB/ljF9Yf3fq1Ky1/41KifCL+w7
	HwYQG6N1NI3rhMCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EDE4B13927;
	Thu, 25 Jul 2024 06:54:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id cYSdN5L2oWZTDQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 25 Jul 2024 06:54:10 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
	linux-sound@vger.kernel.org
Subject: [PATCH] ASoC: amd: yc: Support mic on Lenovo Thinkpad E16 Gen 2
Date: Thu, 25 Jul 2024 08:54:28 +0200
Message-ID: <20240725065442.9293-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [0.19 / 50.00];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.com:url,suse.de:email,suse.de:dkim];
	FROM_HAS_DN(0.00)[];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spamd-Bar: /
X-Rspamd-Queue-Id: 23B651F7E6
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: 0.19

Lenovo Thinkpad E16 Gen 2 AMD model (model 21M5) needs a corresponding
quirk entry for making the internal mic working.

Link: https://bugzilla.suse.com/show_bug.cgi?id=1228269
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>

---
 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index f54466ed8e3e..1769e07e83dc 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -220,6 +220,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "21J6"),
 		}
 	},
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "21M5"),
+		}
+	},
 	{
 		.driver_data = &acp6x_card,
 		.matches = {
-- 
2.43.0

