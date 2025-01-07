Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A7F1F131A
	for <linux-sound@vger.kernel.org>; Tue,  7 Jan 2025 15:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736265420; cv=none; b=TAOKkIjSld643hbmFLu9YkWF/PzomwkR+K0ScRYiBWSgDUjUfSIQEGFS4KvXccFT4NOIc411rEYNbh1HK4YdhXCa+htfGKOIWHq43VOa+54W2BZGiV722ODJWOL5c7KyMyaupUGXmcqAEIy8PD1kRIlMNYFE2WOd7F1yYKs07ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736265420; c=relaxed/simple;
	bh=ToRvm/jV6OhA7YmdjSaQzAzjfS6mtpO8R0x3qDVN7s8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FkSpL7lzAdKMcihasCKxut4YOQK5jgi26RPhDlsYH1jCs8mqgS7yV/SazXXKSasasdjBYMDhp0PdjqYsE+AH6LLynDPXX/HtjFTOJ4pY5IihQ+AcmxksSuOZXalzkkElsvRsZXRHxcHX1tkd0RoaNf9cmVqRCrvVwcG1O393JQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=oPm6XPu3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=joC6vwlQ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=oPm6XPu3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=joC6vwlQ; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="oPm6XPu3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="joC6vwlQ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="oPm6XPu3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="joC6vwlQ"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5135921158;
	Tue,  7 Jan 2025 15:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736265415; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dZFpSU9d1xwTeym0jUmvNo8Gk/ks0ulEuzPjve5BMb0=;
	b=oPm6XPu3iB7VvrxiXmrIdnFk/DE2DR65I44Atn9r+yCabU/RPxh9OicTVVI6RAGihIhItG
	uDz9qD/2bPKjoCXiDGBmgsV/I15p6o9apI+ouTTT7a8U61YwPx1gQYEtM0DfcyVAx2DNZ+
	qJrHExhrOqNwAB94tiXmn/29t7n4Brs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736265415;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dZFpSU9d1xwTeym0jUmvNo8Gk/ks0ulEuzPjve5BMb0=;
	b=joC6vwlQazRKYnWtbGBe6uYL2DZCDGc5LXOCxhZ4UDF4Q3HKQ9nUIp7SJU9D81iSjMw4SL
	JUj62aMfNgieSPBg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=oPm6XPu3;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=joC6vwlQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736265415; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dZFpSU9d1xwTeym0jUmvNo8Gk/ks0ulEuzPjve5BMb0=;
	b=oPm6XPu3iB7VvrxiXmrIdnFk/DE2DR65I44Atn9r+yCabU/RPxh9OicTVVI6RAGihIhItG
	uDz9qD/2bPKjoCXiDGBmgsV/I15p6o9apI+ouTTT7a8U61YwPx1gQYEtM0DfcyVAx2DNZ+
	qJrHExhrOqNwAB94tiXmn/29t7n4Brs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736265415;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dZFpSU9d1xwTeym0jUmvNo8Gk/ks0ulEuzPjve5BMb0=;
	b=joC6vwlQazRKYnWtbGBe6uYL2DZCDGc5LXOCxhZ4UDF4Q3HKQ9nUIp7SJU9D81iSjMw4SL
	JUj62aMfNgieSPBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3780813A6A;
	Tue,  7 Jan 2025 15:56:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id QBM3DMdOfWfNUwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 07 Jan 2025 15:56:55 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 4/7] ALSA: emu10k1: Simplify with str_on_off()
Date: Tue,  7 Jan 2025 16:56:34 +0100
Message-ID: <20250107155641.4435-5-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250107155641.4435-1-tiwai@suse.de>
References: <20250107155641.4435-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 5135921158
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_NONE(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_ONE(0.00)[1];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

Use the standard helper str_on_off() to simplify the code.
Only code refactoring, no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/emu10k1/emuproc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/pci/emu10k1/emuproc.c b/sound/pci/emu10k1/emuproc.c
index 737c28d31b41..47448750f334 100644
--- a/sound/pci/emu10k1/emuproc.c
+++ b/sound/pci/emu10k1/emuproc.c
@@ -46,9 +46,9 @@ static void snd_emu10k1_proc_spdif_status(struct snd_emu10k1 * emu,
 
 		if (rate_reg > 0) {
 			rate = snd_emu10k1_ptr_read(emu, rate_reg, 0);
-			snd_iprintf(buffer, "S/PDIF Valid          : %s\n", rate & SRCS_SPDIFVALID ? "on" : "off");
-			snd_iprintf(buffer, "S/PDIF Locked         : %s\n", rate & SRCS_SPDIFLOCKED ? "on" : "off");
-			snd_iprintf(buffer, "Rate Locked           : %s\n", rate & SRCS_RATELOCKED ? "on" : "off");
+			snd_iprintf(buffer, "S/PDIF Valid          : %s\n", str_on_off(rate & SRCS_SPDIFVALID));
+			snd_iprintf(buffer, "S/PDIF Locked         : %s\n", str_on_off(rate & SRCS_SPDIFLOCKED));
+			snd_iprintf(buffer, "Rate Locked           : %s\n", str_on_off(rate & SRCS_RATELOCKED));
 			/* From ((Rate * 48000 ) / 262144); */
 			snd_iprintf(buffer, "Estimated Sample Rate : %d\n", ((rate & 0xFFFFF ) * 375) >> 11); 
 		}
@@ -208,7 +208,7 @@ static void snd_emu10k1_proc_spdif_read(struct snd_info_entry *entry,
 #if 0
 	val = snd_emu10k1_ptr_read(emu, ZVSRCS, 0);
 	snd_iprintf(buffer, "\nZoomed Video\n");
-	snd_iprintf(buffer, "Rate Locked           : %s\n", val & SRCS_RATELOCKED ? "on" : "off");
+	snd_iprintf(buffer, "Rate Locked           : %s\n", str_on_off(val & SRCS_RATELOCKED));
 	snd_iprintf(buffer, "Estimated Sample Rate : 0x%x\n", val & SRCS_ESTSAMPLERATE);
 #endif
 }
-- 
2.43.0

