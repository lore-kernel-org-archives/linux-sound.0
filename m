Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04444374A16;
	Thu, 13 Aug 2026 16:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786638029; cv=none; b=mKhvwYxdj9bVLsu+T0j8IN3hhgPMsTbQ5n0t8y2koBJY420vnDrCl/IE2OTcv1a1q8R2PKZ/ZHJeV/mJl6ks7yb/pLgfRX+ZSHaTIBNzAj7jfZpdUJnpsO22ddrnpcsGyPqF/FNRP1DHCqXUF7ScpCi2wm+EXCruMXsX+DZibII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786638029; c=relaxed/simple;
	bh=z/niohWcB4r4CvMbHQSoi4gc4SCIcOPmZRSIrfOoz7o=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K/MQuGr4xDPxXtNn6rF8ZSTLcAkVQnXY6RsHto/Pnfk/Y07go7WVBsKE2oTwB+3L8bnv+s3Mlynlgvw3MCwBe2hSDVwDs8ZMKLhjUIuMB+xDVkmpyGfuiqYS4MZSwwWZB9jRoqjNkH4JubSsIesotF+22tsMhy2T6r/CNdaKb6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mtZBrgGW; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=uhyE3JMo; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=KgS2sY5y; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=bxZdFUbb; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mtZBrgGW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="uhyE3JMo";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="KgS2sY5y";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bxZdFUbb"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 98839829DE;
	Thu, 13 Aug 2026 16:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786638018; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ffJwRdbBjxcMlp5rzecFelD69bR6xj6zsWscW9X5T6g=;
	b=mtZBrgGWkW5PooGAI/RQtNqX6Zst0iJSxcT79vCMBfUHexcKCLN7jkqlFktlZ7BP+EwXhG
	YJ5aqVfspd/O47CSa7k2KaBfvhFJ0UQ9xDMW2BilwPoYlXpuqB2VowpQDGSHp/v17BjKpD
	r5ec1o0ZpXYQPV4/YgmnYY8tT1O45Yo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786638018;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ffJwRdbBjxcMlp5rzecFelD69bR6xj6zsWscW9X5T6g=;
	b=uhyE3JMokrNaF3KMuksB96jQlcHZ1aoqSkBcQqufNBehQSlrJltDlBEbXUvRclEmvzVmfs
	FLEhnzAx8SR6lCAg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786638014; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ffJwRdbBjxcMlp5rzecFelD69bR6xj6zsWscW9X5T6g=;
	b=KgS2sY5yYQjLiHDoin65Qd1YGGDwVPXVc9rEo9r6Kpu6hJcO/K3c3lYOkqpJTmYq/EXEZL
	4zTVzxPlCDZ64EmBD5dRm9FOSE0MXpnfOqOxCjIlELmtGeI+poUseDNICtRfUL2cucy8kU
	XKsz3xlDfPW2eamKBLh8EFwwErOeNV8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786638014;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ffJwRdbBjxcMlp5rzecFelD69bR6xj6zsWscW9X5T6g=;
	b=bxZdFUbbtkrvw5LpseekdQhR/Ddfxgas+ngcfumoYvJGMzSr4Ou2gnhMkb7uuJ0BAsyZto
	4NRNOoNhx66FsvAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5E34477EE5;
	Thu, 13 Aug 2026 16:20:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id yq54Fb7ufWp5LgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 13 Aug 2026 16:20:14 +0000
Date: Thu, 13 Aug 2026 18:20:14 +0200
Message-ID: <874igyxa9t.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: John Keeping <jkeeping@inmusicbrands.com>
Cc: Takashi Iwai <tiwai@suse.com>,	Jaroslav Kysela <perex@perex.cz>,	Zhang
 Cen <rollkingzzc@gmail.com>,	Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?=
 <u.kleine-koenig@baylibre.com>,	Kees Cook <kees@kernel.org>,
	linux-sound@vger.kernel.org,	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ALSA: seq: midi: Serialize input teardown with event_input
In-Reply-To: <20260813150810.795393-1-jkeeping@inmusicbrands.com>
References: <20260813150810.795393-1-jkeeping@inmusicbrands.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[suse.com,perex.cz,gmail.com,baylibre.com,kernel.org,vger.kernel.org];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo,inmusicbrands.com:email]

On Thu, 13 Aug 2026 17:08:08 +0200,
John Keeping wrote:
> 
> snd_midi_input_event() must not be running while a rawmidi substream is
> closing, since this can lead to the trigger state becoming out-of-step
> through this sequence in snd_rawmidi_input_trigger():
> 
> 	snd_rawmidi_input_trigger(up=0)
> 					snd_midi_input_event()
> 					 -> snd_rawmidi_kernel_read()
> 					     -> snd_rawmidi_input_trigger(up=1)
> 	  -> cancel_work_sync()
> 
> which ends with the underlying device being active unexpectedly.
> 
> When this is called from close_substream(), further input can re-trigger
> the input event leaving it running after rawmidi_release_priv() has set
> rfile->rmidi to NULL which leads to:
> 
> 	Unable to handle kernel NULL pointer dereference at virtual address 00000000000000b0
> 	Call trace:
> 	 snd_midi_input_event+0x3c/0x134 [snd_seq_midi] (P)
> 	 snd_rawmidi_input_event_work+0x1c/0x2c
> 	 process_one_work+0x150/0x3a4
> 	 worker_thread+0x190/0x318
> 
> Apply a similar approach to commit ef7607ab1c8ad ("ALSA: seq: midi:
> Serialize output teardown with event_input") which fixed the same issue
> in the output direction, but updated to use RCU following Takashi Iwai's
> proposed follow-on patch [1].
> 
> With this change in place, midisynth_unsubscribe() clears the input file
> so snd_midi_input_event() will not re-trigger the stream and will be
> quiesced by the cancel_work_sync() in snd_rawmidi_input_trigger().
> 
> [1] https://lore.kernel.org/linux-sound/20260813144224.753399-1-tiwai@suse.de/
> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Signed-off-by: John Keeping <jkeeping@inmusicbrands.com>
> ---
> Changes in v2:
> - Switch to using RCU following Takashi's suggestion

Applied to for-next branch now.  Thanks.


Takashi
