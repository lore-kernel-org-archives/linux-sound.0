Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3E72D5C7B
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 10:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752142391; cv=none; b=dU+B+MADzl2JOD7lLkfnjL/5KyS4YFr36G03MuPR1ms3kmXzg80U+DR2TychjCIcy7fehErXm5WsVL/s+SL2pbo4LRyTOkq/NPuSuOERHNRaKenPOvM7PbDHXOSAOfYVbxR/qgOkpWB0eC6cBMnOmlPeSVOlJb0Dd9EiryxbF3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752142391; c=relaxed/simple;
	bh=taPmjNAMR5WkMMcurNadTRtQs8EkCPUqN5dwzdZt1cI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TShv0Jl9XQmG3NsrhFJQ7uXLa4Q1Sv0KF8Ozk4ItNwExrD0y2OOEnVjm0chPi9PruVfSCemrNVttrBWS2wi2o9fdU1++K9xpia3hHEbkhfPmK27R17aqUBRv1GyPTTefhv1GkSmX/CqDcuRN699zAgqU3MPHLv0aP2Y5gVlk3qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=XuOh2/FX; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=V5o0GJFn; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=g1EYz6Mi; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=xbujW+WA; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="XuOh2/FX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="V5o0GJFn";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="g1EYz6Mi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xbujW+WA"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D89B1211C4;
	Thu, 10 Jul 2025 10:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142069; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qce1dT7SL+9ScbKG2YRm0n1Wd3zFx4rcjwKwW26TWvQ=;
	b=XuOh2/FXs0Jp7f8osQxtnNGfWGxCT948vse9HMoFaQYDlgcNWaXzAQjfdvPukGlauu4ana
	SAenwO82qedXFMR21cEYcomveKaLUzCwUkGdHm9h2ZXq0itWYWv+Bwr5013H2bFtcqqHUZ
	3Fha2Oswa9ibk1CQ4QIVI3y6BKFUMaA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142069;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qce1dT7SL+9ScbKG2YRm0n1Wd3zFx4rcjwKwW26TWvQ=;
	b=V5o0GJFnPdeBsndgiVbGzKFk1sAAI3PfpdMIo8G666zTv9sS9gMzHOxx/RVk2LRWCMV7pr
	ff9DbZyF8LhooSBw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=g1EYz6Mi;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=xbujW+WA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142068; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qce1dT7SL+9ScbKG2YRm0n1Wd3zFx4rcjwKwW26TWvQ=;
	b=g1EYz6Mio9Yi7qN2kl64PenHKpkfQ+5xafe+QCX1H/euPKYik3SmH0B/O3FhD1Be+n8CN6
	4RQLFLX2Z85pC6qSUyVniN1pBO1Fk8yBvxdblyFdY6+d8szb5f/ZFQQPPaddEJEy85RuEc
	dVlWCGTb5nJrAOGxROkUJMH+RJ6bs2E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142068;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qce1dT7SL+9ScbKG2YRm0n1Wd3zFx4rcjwKwW26TWvQ=;
	b=xbujW+WAtEZIgLyLEuyghBgsR3FyZXSZ+bJi+ls43uc5EBe0V2wUNBjGXXh6QDj/FCAYnP
	n3IEIH0BV9AyI8Cw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B3F2313A70;
	Thu, 10 Jul 2025 10:07:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id QM7GKvSQb2jZWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 10 Jul 2025 10:07:48 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 089/103] ALSA: vxpocket: Use safer strscpy() instead of strcpy()
Date: Thu, 10 Jul 2025 12:07:11 +0200
Message-ID: <20250710100727.22653-90-tiwai@suse.de>
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
X-Rspamd-Queue-Id: D89B1211C4
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid,suse.de:email];
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
 sound/pcmcia/vx/vxpocket.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pcmcia/vx/vxpocket.c b/sound/pcmcia/vx/vxpocket.c
index d2d5f64d63b4..2e09f2a513a6 100644
--- a/sound/pcmcia/vx/vxpocket.c
+++ b/sound/pcmcia/vx/vxpocket.c
@@ -187,7 +187,7 @@ static int vxpocket_config(struct pcmcia_device *link)
 		/* overwrite the hardware information */
 		chip->hw = &vxp440_hw;
 		chip->type = vxp440_hw.type;
-		strcpy(chip->card->driver, vxp440_hw.name);
+		strscpy(chip->card->driver, vxp440_hw.name);
 	}
 
 	ret = pcmcia_request_io(link);
-- 
2.50.0

