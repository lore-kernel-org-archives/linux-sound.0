Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81DB8283138
	for <linux-sound@vger.kernel.org>; Thu, 21 Aug 2025 15:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755788921; cv=none; b=ClS48cNW2Us0VC7S9gVU0dUBrTpsLZJ7n9QXQOibjL3g2yIE73VeQCu26lcc2lbY9Y7kTxNFPvsTkrPDvASI0oI2rcbiEzrtZFVRR1rO+gcanPaG4UYOxtOA+QmOma13uBIhisnB7OHvBxS2rHgGjg1tjd6Fhp5LE8KudVZTmYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755788921; c=relaxed/simple;
	bh=S6V8/els7I0cu8SMuF3Xr5oirfpO827TlRPuoy7qQA0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=beDPAFqSOMs8u94O3iirHObi5DFaJWzHSrcN3bjkInZLJrLEKAh/ZiUsX6nJBbCVDOWdSw1ucqNe4URVF205BIBezVteAehjnVp8IBQAz+vi3u73tWWw8iNVJUH3hZk0bUCwS5W4k/EqSYWcArr5u3RkqpOj2Ce+LizWIOXVXuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=lBk4QOZs; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=cbGXOacL; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=lBk4QOZs; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=cbGXOacL; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="lBk4QOZs";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="cbGXOacL";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="lBk4QOZs";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="cbGXOacL"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 92A8321BA3;
	Thu, 21 Aug 2025 15:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1755788917; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=UiYx8c3X1Y8/qxTBDhZZj0lxBgF2k6LBheRsWGYr5jk=;
	b=lBk4QOZsKAnqNuO1jyBqGhfulgGsNXB1XmbFyNx6rYPpJYj7ZbYBhAdWMZTBebu6q3Sh7o
	r6kCy4myLWhWsyF7O0/CGcASKfwI3bKdY/feHzbM+1wN0UBcNe1e94yhaqOjI61G+yjCMT
	ajXzbMW1KCdZ2XbNFZeTwqMmRL5XekA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1755788917;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=UiYx8c3X1Y8/qxTBDhZZj0lxBgF2k6LBheRsWGYr5jk=;
	b=cbGXOacLHIt5CAyCfJqyMrO7217ooNjNkGqp3i+jqrdBtbqOLtWssvyXjQFsbOhENwfNnm
	EhRe92g7bs2JSABw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=lBk4QOZs;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=cbGXOacL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1755788917; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=UiYx8c3X1Y8/qxTBDhZZj0lxBgF2k6LBheRsWGYr5jk=;
	b=lBk4QOZsKAnqNuO1jyBqGhfulgGsNXB1XmbFyNx6rYPpJYj7ZbYBhAdWMZTBebu6q3Sh7o
	r6kCy4myLWhWsyF7O0/CGcASKfwI3bKdY/feHzbM+1wN0UBcNe1e94yhaqOjI61G+yjCMT
	ajXzbMW1KCdZ2XbNFZeTwqMmRL5XekA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1755788917;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=UiYx8c3X1Y8/qxTBDhZZj0lxBgF2k6LBheRsWGYr5jk=;
	b=cbGXOacLHIt5CAyCfJqyMrO7217ooNjNkGqp3i+jqrdBtbqOLtWssvyXjQFsbOhENwfNnm
	EhRe92g7bs2JSABw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 76005139A8;
	Thu, 21 Aug 2025 15:08:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id MUs6G3U2p2jtCwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 21 Aug 2025 15:08:37 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: usb-audio: Use correct sub-type for UAC3 feature unit validation
Date: Thu, 21 Aug 2025 17:08:34 +0200
Message-ID: <20250821150835.8894-1-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_NONE(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 92A8321BA3
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01

The entry of the validators table for UAC3 feature unit is defined
with a wrong sub-type UAC_FEATURE (= 0x06) while it should have been
UAC3_FEATURE (= 0x07).  This patch corrects the entry value.

Fixes: 57f8770620e9 ("ALSA: usb-audio: More validations of descriptor units")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/validate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/usb/validate.c b/sound/usb/validate.c
index 4f4e8e87a14c..a0d55b77c994 100644
--- a/sound/usb/validate.c
+++ b/sound/usb/validate.c
@@ -285,7 +285,7 @@ static const struct usb_desc_validator audio_validators[] = {
 	/* UAC_VERSION_3, UAC3_EXTENDED_TERMINAL: not implemented yet */
 	FUNC(UAC_VERSION_3, UAC3_MIXER_UNIT, validate_mixer_unit),
 	FUNC(UAC_VERSION_3, UAC3_SELECTOR_UNIT, validate_selector_unit),
-	FUNC(UAC_VERSION_3, UAC_FEATURE_UNIT, validate_uac3_feature_unit),
+	FUNC(UAC_VERSION_3, UAC3_FEATURE_UNIT, validate_uac3_feature_unit),
 	/*  UAC_VERSION_3, UAC3_EFFECT_UNIT: not implemented yet */
 	FUNC(UAC_VERSION_3, UAC3_PROCESSING_UNIT, validate_processing_unit),
 	FUNC(UAC_VERSION_3, UAC3_EXTENSION_UNIT, validate_processing_unit),
-- 
2.50.1

