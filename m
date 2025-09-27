Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E842D94B9
	for <linux-sound@vger.kernel.org>; Sat, 27 Sep 2025 10:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758968961; cv=none; b=JGCOQjMf0Xire+Zga6IKPkfrdiYnwS6g9rjvOgO4iuHInWxxmvzHPgKOa49/wFD94SmeFrHlqLZK51OAYKh5Qq+stA3tD9LnPKOQs4K44tEE2qdNoN3/KYWs/qrqf/6eF9nJ8z+UyOBSetNf3lRZLxB7zF+89udqdLsktDyiLNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758968961; c=relaxed/simple;
	bh=Z5pcAwrB/33ux/+eJ6XvpowjuS0twES0T43RYI5mGW4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V3z0fLZ2XTAVTNQP2e5ClK6nA1bYYzP02kBZqXGp8Fopr4gcCm5rqn89cWePHU1b5BokUNxqjHKaWJ6Ku9T+3J2A1zkMMwQWvlxcppwH2D7k9XG+G9yvg/IZWtPgQix/0tVxIyl7CMAXqamnf6+w5FIhnGNwwhsrF51ezW59Gac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=TPe0ak5E; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=sO8KRv1z; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=TPe0ak5E; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=sO8KRv1z; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TPe0ak5E";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="sO8KRv1z";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TPe0ak5E";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="sO8KRv1z"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 55D4138B22;
	Sat, 27 Sep 2025 10:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1758968958; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YjAWpYTJCDIuWRaBx+ukvyFRlq9yAsUBsYiQg8jCveM=;
	b=TPe0ak5EEDKBWeTsRo17gnT2k/tkFwt1cl018237tETdp80w1tS7q77VCwuj7rkizDdrkA
	yuA7q2E11QF/nYcDLsk5/247MkfvnEwQn+YQJDxswK8cwOYDW8NcOE7+GFNQ+ibFbHDAxk
	G3xmBgLyEp3dfevbb/98m+Zw0l+Rg/g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1758968958;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YjAWpYTJCDIuWRaBx+ukvyFRlq9yAsUBsYiQg8jCveM=;
	b=sO8KRv1z72lOGuCcKFQeSN2IVTHUmb5fqtuzKicJY/52/j8aRivNRQKy5Dwr6CibmmqiSc
	14vCTeZdX1DLt/Bg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1758968958; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YjAWpYTJCDIuWRaBx+ukvyFRlq9yAsUBsYiQg8jCveM=;
	b=TPe0ak5EEDKBWeTsRo17gnT2k/tkFwt1cl018237tETdp80w1tS7q77VCwuj7rkizDdrkA
	yuA7q2E11QF/nYcDLsk5/247MkfvnEwQn+YQJDxswK8cwOYDW8NcOE7+GFNQ+ibFbHDAxk
	G3xmBgLyEp3dfevbb/98m+Zw0l+Rg/g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1758968958;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YjAWpYTJCDIuWRaBx+ukvyFRlq9yAsUBsYiQg8jCveM=;
	b=sO8KRv1z72lOGuCcKFQeSN2IVTHUmb5fqtuzKicJY/52/j8aRivNRQKy5Dwr6CibmmqiSc
	14vCTeZdX1DLt/Bg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1039A13782;
	Sat, 27 Sep 2025 10:29:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id AA+VAn6812hgWwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 27 Sep 2025 10:29:18 +0000
Date: Sat, 27 Sep 2025 12:29:17 +0200
Message-ID: <87tt0o9ojm.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: syzbot <syzbot+f02665daa2abeef4a947@syzkaller.appspotmail.com>
Cc: aha310510@gmail.com,
	clemens@ladisch.de,
	hdanton@sina.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	syzkaller-bugs@googlegroups.com,
	tiwai@suse.de
Subject: Re: [syzbot] [sound?] [usb?] general protection fault in snd_usbmidi_do_output
In-Reply-To: <68d7b657.a70a0220.10c4b.000e.GAE@google.com>
References: <20250927091931.7691-1-hdanton@sina.com>
	<68d7b657.a70a0220.10c4b.000e.GAE@google.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[f02665daa2abeef4a947];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,sina.com];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,ladisch.de,sina.com,vger.kernel.org,perex.cz,googlegroups.com,suse.de];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid];
	RCVD_COUNT_TWO(0.00)[2];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -1.80

On Sat, 27 Sep 2025 12:03:03 +0200,
syzbot wrote:
> 
> Hello,
> 
> syzbot has tested the proposed patch but the reproducer is still triggering an issue:
> KASAN: slab-use-after-free Write in snd_usbmidi_in_urb_complete

OK, so another fix is needed in addition.
Let's try the below.


#syz test upstream master

--- a/sound/usb/midi.c
+++ b/sound/usb/midi.c
@@ -240,6 +240,9 @@ static void snd_usbmidi_in_urb_complete(struct urb *urb)
 {
 	struct snd_usb_midi_in_endpoint *ep = urb->context;
 
+	if (ep->umidi->disconnected)
+		return;
+
 	if (urb->status == 0) {
 		dump_urb("received", urb->transfer_buffer, urb->actual_length);
 		ep->umidi->usb_protocol_ops->input(ep, urb->transfer_buffer,
@@ -275,6 +278,10 @@ static void snd_usbmidi_out_urb_complete(struct urb *urb)
 		wake_up(&ep->drain_wait);
 	}
 	spin_unlock_irqrestore(&ep->buffer_lock, flags);
+
+	if (ep->umidi->disconnected)
+		return;
+
 	if (urb->status < 0) {
 		int err = snd_usbmidi_urb_error(urb);
 		if (err < 0) {
@@ -1522,6 +1529,8 @@ static void snd_usbmidi_free(struct snd_usb_midi *umidi)
 {
 	int i;
 
+	timer_shutdown_sync(&umidi->error_timer);
+
 	for (i = 0; i < MIDI_MAX_ENDPOINTS; ++i) {
 		struct snd_usb_midi_endpoint *ep = &umidi->endpoints[i];
 		if (ep->out)
@@ -1530,7 +1539,6 @@ static void snd_usbmidi_free(struct snd_usb_midi *umidi)
 			snd_usbmidi_in_endpoint_delete(ep->in);
 	}
 	mutex_destroy(&umidi->mutex);
-	timer_shutdown_sync(&umidi->error_timer);
 	kfree(umidi);
 }
 
