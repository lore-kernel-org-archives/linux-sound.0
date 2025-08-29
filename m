Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6446531E111
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 15:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756480085; cv=none; b=UMp3JpRsyBKD5YcKufWk+0sI6jajzwt/aQI5nVB1DrbC3IrOuUZaLLJTiJxTdyOQO/fIo+crPLZQDFCFnKLIqizmBYtXZ9pWu5jTqsvR2iPxIESKogKWgebHi7KoO2RykBNMf/N9fsd9w8QfwnyAPYwfiPySpG3j8WyG/gzUlQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756480085; c=relaxed/simple;
	bh=hqVvq2dWJt+p6nZBtyZOHjRgPUoIOXUI4zmSng/7YOg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=px43RFCNCIHGw4wMj5c8FB4xQOrAu7m+NTGWUHqoMT054xZS14ikNQgz5Ze0kOI7qr/pu4tgNhW0hJLyhz6u/slkUdPKKC2883NOffrgKpUX0R+D/u3uzC2i8iMU+3yGQznFMqMs1gKRvsHKsIGUaLulvHmihVVS+E+uk3q0DbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wz1lqieD; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8SQBizWf; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wz1lqieD; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8SQBizWf; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wz1lqieD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8SQBizWf";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wz1lqieD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8SQBizWf"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5D4215C24F;
	Fri, 29 Aug 2025 15:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756480055; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Rhk/eRXgbXPmPV5E+w82OsfaV7uv13vcS76dfMaGD4k=;
	b=wz1lqieDrv2w4H6KeVqO9HBqbQ9yIAXCs4cxyq8c059hdQk9SA0buVWLVI1piQ8KazoWzg
	EioeVbOil9DxVrXTmANMFcTlaDEcUcDeCRTiOs5HZaONKGkk8WD/wyNcW0MAvNEZMXEt7E
	cHe/7iJleSykJihBmm8WkZuf8PeQPlM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756480055;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Rhk/eRXgbXPmPV5E+w82OsfaV7uv13vcS76dfMaGD4k=;
	b=8SQBizWfoDs5/Ch+AkqpEXdaepdBAS2K/AxZGGnnk0QLLPZaxHEzhxsPrDWTLIlveBPWkQ
	R74rGXSShhtjrTBw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=wz1lqieD;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=8SQBizWf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756480055; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Rhk/eRXgbXPmPV5E+w82OsfaV7uv13vcS76dfMaGD4k=;
	b=wz1lqieDrv2w4H6KeVqO9HBqbQ9yIAXCs4cxyq8c059hdQk9SA0buVWLVI1piQ8KazoWzg
	EioeVbOil9DxVrXTmANMFcTlaDEcUcDeCRTiOs5HZaONKGkk8WD/wyNcW0MAvNEZMXEt7E
	cHe/7iJleSykJihBmm8WkZuf8PeQPlM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756480055;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Rhk/eRXgbXPmPV5E+w82OsfaV7uv13vcS76dfMaGD4k=;
	b=8SQBizWfoDs5/Ch+AkqpEXdaepdBAS2K/AxZGGnnk0QLLPZaxHEzhxsPrDWTLIlveBPWkQ
	R74rGXSShhtjrTBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3EE8A13A72;
	Fri, 29 Aug 2025 15:07:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 0IUUDjfCsWjMHwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Aug 2025 15:07:35 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 8/9] ALSA: bcd2000: Use guard() for mutex locks
Date: Fri, 29 Aug 2025 17:07:16 +0200
Message-ID: <20250829150724.6886-9-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250829150724.6886-1-tiwai@suse.de>
References: <20250829150724.6886-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 5D4215C24F
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
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.01

Replace the manual mutex lock/unlock pairs with guard() for code
simplification.

Only code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/bcd2000/bcd2000.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/sound/usb/bcd2000/bcd2000.c b/sound/usb/bcd2000/bcd2000.c
index 392b4d8e9e76..bebb48cb9abc 100644
--- a/sound/usb/bcd2000/bcd2000.c
+++ b/sound/usb/bcd2000/bcd2000.c
@@ -369,23 +369,19 @@ static int bcd2000_probe(struct usb_interface *interface,
 	char usb_path[32];
 	int err;
 
-	mutex_lock(&devices_mutex);
+	guard(mutex)(&devices_mutex);
 
 	for (card_index = 0; card_index < SNDRV_CARDS; ++card_index)
 		if (!test_bit(card_index, devices_used))
 			break;
 
-	if (card_index >= SNDRV_CARDS) {
-		mutex_unlock(&devices_mutex);
+	if (card_index >= SNDRV_CARDS)
 		return -ENOENT;
-	}
 
 	err = snd_card_new(&interface->dev, index[card_index], id[card_index],
 			THIS_MODULE, sizeof(*bcd2k), &card);
-	if (err < 0) {
-		mutex_unlock(&devices_mutex);
+	if (err < 0)
 		return err;
-	}
 
 	bcd2k = card->private_data;
 	bcd2k->dev = interface_to_usbdev(interface);
@@ -413,14 +409,12 @@ static int bcd2000_probe(struct usb_interface *interface,
 	usb_set_intfdata(interface, bcd2k);
 	set_bit(card_index, devices_used);
 
-	mutex_unlock(&devices_mutex);
 	return 0;
 
 probe_error:
 	dev_info(&bcd2k->dev->dev, PREFIX "error during probing");
 	bcd2000_free_usb_related_resources(bcd2k, interface);
 	snd_card_free(card);
-	mutex_unlock(&devices_mutex);
 	return err;
 }
 
@@ -431,7 +425,7 @@ static void bcd2000_disconnect(struct usb_interface *interface)
 	if (!bcd2k)
 		return;
 
-	mutex_lock(&devices_mutex);
+	guard(mutex)(&devices_mutex);
 
 	/* make sure that userspace cannot create new requests */
 	snd_card_disconnect(bcd2k->card);
@@ -441,8 +435,6 @@ static void bcd2000_disconnect(struct usb_interface *interface)
 	clear_bit(bcd2k->card_index, devices_used);
 
 	snd_card_free_when_closed(bcd2k->card);
-
-	mutex_unlock(&devices_mutex);
 }
 
 static struct usb_driver bcd2000_driver = {
-- 
2.50.1

