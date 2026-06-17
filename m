Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF97F3F4DF8
	for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 13:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781704701; cv=none; b=FXn/UqzkLZ6MjlBlqWTJMVBPT3xtUlv9UaVqmi3OFH4gaMISlavmRAYsoFlmDpdlISMrGdO3Kk5m+LG2FJXyG0Dcv7sZEQ30l9yEtr1roBTTo5xb+W30+nLVkOlU4WfqmZ12Ed3cX8qQO0ltkwljU18Gslx/GsqSZ8j96+cjgN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781704701; c=relaxed/simple;
	bh=hdVVoP84YQPCS4Al45zNH5okQRSdWuww/jZO2WyR/Rk=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jdPT0BU5dM063qUCzFQ4boepavNaWmsxOsvC0X8CDAnLSVQXrX89cuOIt9EB6Hg7x/1dtR8jBfuls0jJIZKGTdIohMP9HNc3xvSEE2TGJKPqszLANaUVKMOnqYVw58VC5naFlM0W7sumXmTtTL+yR+Iqv5eZrMrpeAwBiaJ3mAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=a77dKfQJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=V5USZuQl; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=SJrDubuD; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Y+75sAq2; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="a77dKfQJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="V5USZuQl";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SJrDubuD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Y+75sAq2"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id EBDC975AE0;
	Wed, 17 Jun 2026 13:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781704698; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1nwGCAZVqnLtndpsO/C4x2lQeeYK6cgLyJwkLfI/1VI=;
	b=a77dKfQJFuwsSlyDdgySozHn7ZBGA8LJRpFvg7rZ3UIqByrl8zKqfYXWzT1ki/+rRt0Vtg
	1txpM1ZrDMEuaMU2J0j7o/chP4GGBY9OPAVhD7oH/XBbxZIc5Ob1TKQZY/P1MEb+C0cHov
	twVf/oqtaFzbUtXI4cPn0EpvfF2PutY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781704698;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1nwGCAZVqnLtndpsO/C4x2lQeeYK6cgLyJwkLfI/1VI=;
	b=V5USZuQlxfYnGGfK/dpPnVQZJo7e2SgZirR2j2++Z3Ub5hln4Cs61V2gDVlZ9B7Pmn7D5G
	V3DfCMSbuDdI1/Ag==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781704697; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1nwGCAZVqnLtndpsO/C4x2lQeeYK6cgLyJwkLfI/1VI=;
	b=SJrDubuD68nbOiWN1d/nbuh016fT9bJHjFJtn84aHaWJAwrFPyKBtnX7x31vvkBykyOZiI
	5SG8s9nQxuHE6lks3wFdFC7NSYCp05rF0aNDUujt8Xvv2y6Y41PZp5SeqIZYwpyla8xXDg
	d0K6oSM3C82AUeHoRDJyxtBRua7aoDI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781704697;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1nwGCAZVqnLtndpsO/C4x2lQeeYK6cgLyJwkLfI/1VI=;
	b=Y+75sAq2tJip6ig+L0xdmT+SKLI/0mKJUS/y5qiT7Kl+n4biY3e8oBI8XZsrbZB7ONVUCk
	TMVtGn5tjlfatOBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BCE8E779A8;
	Wed, 17 Jun 2026 13:58:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id z3FsLPmnMmrnfwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 17 Jun 2026 13:58:17 +0000
Date: Wed, 17 Jun 2026 15:58:17 +0200
Message-ID: <878q8dp8ue.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Maoyi Xie <maoyixie.tju@gmail.com>
Cc: Daniel Mack <zonque@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: ALSA: caiaq: possible out of bounds read in Traktor Kontrol S4 dispatch
In-Reply-To: <87eci5pc6x.wl-tiwai@suse.de>
References: <178169970022.2950989.3295624331262791202@maoyixie.com>
	<87eci5pc6x.wl-tiwai@suse.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spamd-Result: default: False [-1.79 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.19)[-0.972];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,perex.cz,suse.com,vger.kernel.org];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Level: 
X-Spam-Score: -1.79

On Wed, 17 Jun 2026 14:45:58 +0200,
Takashi Iwai wrote:
> 
> On Wed, 17 Jun 2026 14:35:00 +0200,
> Maoyi Xie wrote:
> > 
> > Hi all,
> > 
> > I think the Traktor Kontrol S4 input path in sound/usb/caiaq/input.c can read
> > past the end of the URB buffer when the device sends a reply whose length is
> > not a multiple of 16. I would appreciate it if you could take a look.
> > 
> > The dispatch loop walks the reply in fixed 16 byte blocks.
> > 
> > 	while (len) {
> > 		unsigned int i, block_id = (buf[0] << 8) | buf[1];
> > 		...
> > 		len -= TKS4_MSGBLOCK_SIZE;
> > 		buf += TKS4_MSGBLOCK_SIZE;
> > 	}
> > 
> > Each pass reads up to buf[15] and then does len -= 16. But len is the raw
> > device length. It comes straight from urb->actual_length in
> > snd_usb_caiaq_ep4_reply_dispatch and there is no check that it is a multiple
> > of 16. The X1 and Maschine arms in that same handler do bound check the
> > length, but the S4 arm does not.
> > 
> > If len is not a multiple of 16, say 8, the final len -= 16 underflows because
> > len is unsigned. The loop condition while (len) then stays true and the walk
> > keeps consuming 16 byte blocks far past the end of the buffer. That is an out
> > of bounds read. The buffer is cdev->ep4_in_buf of size EP4_BUFSIZE.
> > 
> > The attacker model is a malicious or emulated USB device that claims the
> > Native Instruments Traktor Kontrol S4 id and returns a short reply on its bulk
> > in endpoint once the input device is opened.
> > 
> > I reproduced this under KASAN on 7.1-rc7. A length of one whole block runs the
> > loop once and reads nothing past the buffer. A length of 8 underflows and
> > KASAN reports a slab out of bounds read just past the allocation.
> > 
> > The fix I tried is to only consume a block when a whole block is present.
> > 
> > 	-	while (len) {
> > 	+	while (len >= TKS4_MSGBLOCK_SIZE) {
> > 
> > That stops the decrement from underflowing and drops any trailing partial
> > block.
> > 
> > Does this look like a real bug to you? If the direction is right I am happy to
> > send a proper patch with a Fixes tag pointing at 15c5ab607045 ("ALSA:
> > snd-usb-caiaq: Add support for Traktor Kontrol S4").
> 
> Yes, feel free to submit the patch.
> 
> BTW, it seems that there are lots of other places missing the length
> check, and we'd need to paper over them, too:
> snd_caiaq_input_read_analog(), snd_caiaq_input_read_erp(),
> snd_caiaq_input_read_io(), and snd_usb_caiaq_maschine_dispatch().

Actually for snd_caiaq_input_read_analog() and
snd_usb_caiaq_maschine_dispatch(), the callers have already the length
checks, so they are OK.  But snd_caiaq_input_read_erp() and
snd_caiaq_input_read_io() may be called via
snd_usb_caiaq_input_dispatch(), and they need the length check,
something like below (totally untested).


Takashi

-- 8< --
--- a/sound/usb/caiaq/input.c
+++ b/sound/usb/caiaq/input.c
@@ -237,12 +237,16 @@ static void snd_caiaq_input_read_erp(struct snd_usb_caiaqdev *cdev,
 
 	switch (cdev->chip.usb_id) {
 	case USB_ID(USB_VID_NATIVEINSTRUMENTS, USB_PID_AK1):
+		if (len < 2)
+			return;
 		i = decode_erp(buf[0], buf[1]);
 		input_report_abs(input_dev, ABS_X, i);
 		input_sync(input_dev);
 		break;
 	case USB_ID(USB_VID_NATIVEINSTRUMENTS, USB_PID_KORECONTROLLER):
 	case USB_ID(USB_VID_NATIVEINSTRUMENTS, USB_PID_KORECONTROLLER2):
+		if (len < 16)
+			return;
 		i = decode_erp(buf[7], buf[5]);
 		input_report_abs(input_dev, ABS_HAT0X, i);
 		i = decode_erp(buf[12], buf[14]);
@@ -263,6 +267,8 @@ static void snd_caiaq_input_read_erp(struct snd_usb_caiaqdev *cdev,
 		break;
 
 	case USB_ID(USB_VID_NATIVEINSTRUMENTS, USB_PID_MASCHINECONTROLLER):
+		if (len < 22)
+			return;
 		/* 4 under the left screen */
 		input_report_abs(input_dev, ABS_HAT0X, decode_erp(buf[21], buf[20]));
 		input_report_abs(input_dev, ABS_HAT0Y, decode_erp(buf[15], buf[14]));
@@ -308,9 +314,13 @@ static void snd_caiaq_input_read_io(struct snd_usb_caiaqdev *cdev,
 	switch (cdev->chip.usb_id) {
 	case USB_ID(USB_VID_NATIVEINSTRUMENTS, USB_PID_KORECONTROLLER):
 	case USB_ID(USB_VID_NATIVEINSTRUMENTS, USB_PID_KORECONTROLLER2):
+		if (len < 5)
+			return;
 		input_report_abs(cdev->input_dev, ABS_MISC, 255 - buf[4]);
 		break;
 	case USB_ID(USB_VID_NATIVEINSTRUMENTS, USB_PID_TRAKTORKONTROLX1):
+		if (len < 7)
+			return;
 		/* rotary encoders */
 		input_report_abs(cdev->input_dev, ABS_X, buf[5] & 0xf);
 		input_report_abs(cdev->input_dev, ABS_Y, buf[5] >> 4);
