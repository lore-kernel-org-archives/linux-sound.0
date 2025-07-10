Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A022D63FE
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 10:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752142242; cv=none; b=Rw2LZoNRL6nyvmFknXwx/XXP/8zPnY4HOsHiQ2QJfUd4VIsI/59XA6dhKj2RK5K46/ldqxB6i/H1CZccofmarbIwKzNMo49dhBcVgPUCHmTTnQwtIgtwrvTR1BPRQxmQbRY+IRMH4hJ6LKkrmcxZP8niSB5DlnhozDaeAowSqls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752142242; c=relaxed/simple;
	bh=LLwBI8lmiLg/OwwFskNrJprA9vkYXS+ro0hnTuVlqHg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Klcm8U0h28cJTmM1h7TQdkCLRZK4w9afTjPNI37qObaD7Sg5/U4fKhq+5Y4FqPO+ReoasRPhOzji/zNsZOzVl8txJnDvoZtgb7EHl4iWdOKDr5P7Qo01tKxKKZBuM2C8z8RwmhPVBJLrLtcUBCYPqXbSFb2CTXXZeclRTV2LG7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=upM5Q//u; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=YKcR8NOP; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=upM5Q//u; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=YKcR8NOP; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="upM5Q//u";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YKcR8NOP";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="upM5Q//u";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YKcR8NOP"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7C91E2119B;
	Thu, 10 Jul 2025 10:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142062; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EtSqN6kx1BUvpBN+fbzORLTCjPee5SE0o7TzsLPM0aQ=;
	b=upM5Q//uEB8AmMJdQm1ZgrSdCKfYCCn8joSGfEkFBrg8MZwaN1tZx6+uLGgdnhCQwWGrqZ
	VafxdMWXnRc6mYARzgzURJOUlUMJMS7O3cQrlfwJN/pRLcBPwXwhbazvMmNkdpElA6GSlm
	xhtZXWfEKeMruTtqhcZ16+DxqaSR+wY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142062;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EtSqN6kx1BUvpBN+fbzORLTCjPee5SE0o7TzsLPM0aQ=;
	b=YKcR8NOPAmUINphjA9LjpzLytjeSN/iH1LfnDYbLJrglBy6xO2mKxWi9OPRthCGGeW8DD4
	mRUdYRmWW+ooeQBw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="upM5Q//u";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=YKcR8NOP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142062; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EtSqN6kx1BUvpBN+fbzORLTCjPee5SE0o7TzsLPM0aQ=;
	b=upM5Q//uEB8AmMJdQm1ZgrSdCKfYCCn8joSGfEkFBrg8MZwaN1tZx6+uLGgdnhCQwWGrqZ
	VafxdMWXnRc6mYARzgzURJOUlUMJMS7O3cQrlfwJN/pRLcBPwXwhbazvMmNkdpElA6GSlm
	xhtZXWfEKeMruTtqhcZ16+DxqaSR+wY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142062;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EtSqN6kx1BUvpBN+fbzORLTCjPee5SE0o7TzsLPM0aQ=;
	b=YKcR8NOPAmUINphjA9LjpzLytjeSN/iH1LfnDYbLJrglBy6xO2mKxWi9OPRthCGGeW8DD4
	mRUdYRmWW+ooeQBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6279B13A70;
	Thu, 10 Jul 2025 10:07:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id QIG5Fu6Qb2jZWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 10 Jul 2025 10:07:42 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 043/103] ALSA: ak4531: Use safer strscpy() instead of strcpy()
Date: Thu, 10 Jul 2025 12:06:25 +0200
Message-ID: <20250710100727.22653-44-tiwai@suse.de>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250710100727.22653-1-tiwai@suse.de>
References: <20250710100727.22653-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 7C91E2119B
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
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
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLe1mc1hwayk397878n5a1j337)];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.01

Use a safer function strscpy() instead of strcpy() for copying to
arrays.

Only idiomatic code replacement, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/ak4531_codec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/ak4531_codec.c b/sound/pci/ak4531_codec.c
index 6af88e7b86f8..e54812bfb2c6 100644
--- a/sound/pci/ak4531_codec.c
+++ b/sound/pci/ak4531_codec.c
@@ -389,7 +389,7 @@ int snd_ak4531_mixer(struct snd_card *card,
 		snd_ak4531_free(ak4531);
 		return err;
 	}
-	strcpy(card->mixername, "Asahi Kasei AK4531");
+	strscpy(card->mixername, "Asahi Kasei AK4531");
 	ak4531->write(ak4531, AK4531_RESET, 0x03);	/* no RST, PD */
 	udelay(100);
 	ak4531->write(ak4531, AK4531_CLOCK, 0x00);	/* CODEC ADC and CODEC DAC use {LR,B}CLK2 and run off LRCLK2 PLL */
-- 
2.50.0

