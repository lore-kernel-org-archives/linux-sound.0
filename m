Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B8153FF887
	for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 14:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779805729; cv=none; b=SlL6Uho6duUp1H90r5a++RSv+3Lz+2Ow8BXDLsjU+aVkLI6Rc5HsQXlPbEypAfwiba27T06JZnToifnPLnO9QqxsB1XDxgkNzz9gAJ+fIS2Nt83HqbgXjYeRdZLnnnFD88HZ+V2rzdBtJ6IYwK3ioye/KH61ykPbR/9dKSoSnM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779805729; c=relaxed/simple;
	bh=2EyS5sQ+B1W1Q1kIGeOGUMQ6M/ZctG9RmLvpbtxFzVg=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S5m7l8x016FIf3Mq6skgFJDOd9ZKZsKbJVfbijhzi/gLp/9m/L9Cyrlo29nvyOHLCYGNloVhz8a6CM9RoTVjynW9Rt5Qig5nSPwI4o+FWdTNXnSee8M3UKrOx4kSm93J4X9w048Zx7mE83pbVAjAuut/ilg3GXdOHv4TnuUd0uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=KZJ6GRRq; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=fSidyib+; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=KZJ6GRRq; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=fSidyib+; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="KZJ6GRRq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fSidyib+";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="KZJ6GRRq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fSidyib+"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6862C66D2C;
	Tue, 26 May 2026 14:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779805726; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=r0hZ6SlqEjynVAZ+H3Bi2h47M9ZYdrFqWDGt0xLqOwM=;
	b=KZJ6GRRq9VUEx0iBAX66M5LP/J+Op5B7xOS4acqANNH4XMXNZajTo2DBuY1BmIqi5b8v70
	4NGRqPv+QIum+7U+2TM29PXJrovZ0GfD8ob5sYUUqjzycEtBIRVqVXbm3hOaiEf4YsmWGz
	1riAiWq1Lrh/Knlj/zCFqRUUiVtTy04=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779805726;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=r0hZ6SlqEjynVAZ+H3Bi2h47M9ZYdrFqWDGt0xLqOwM=;
	b=fSidyib+1fHjEYHlE3+Uq0cLfHXjorDUNZFD5npWxM/xWlzOKFftnx33z1LjyD3djqH95H
	LewsnpK2mSBA8zBA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=KZJ6GRRq;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=fSidyib+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779805726; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=r0hZ6SlqEjynVAZ+H3Bi2h47M9ZYdrFqWDGt0xLqOwM=;
	b=KZJ6GRRq9VUEx0iBAX66M5LP/J+Op5B7xOS4acqANNH4XMXNZajTo2DBuY1BmIqi5b8v70
	4NGRqPv+QIum+7U+2TM29PXJrovZ0GfD8ob5sYUUqjzycEtBIRVqVXbm3hOaiEf4YsmWGz
	1riAiWq1Lrh/Knlj/zCFqRUUiVtTy04=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779805726;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=r0hZ6SlqEjynVAZ+H3Bi2h47M9ZYdrFqWDGt0xLqOwM=;
	b=fSidyib+1fHjEYHlE3+Uq0cLfHXjorDUNZFD5npWxM/xWlzOKFftnx33z1LjyD3djqH95H
	LewsnpK2mSBA8zBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 503D75A257;
	Tue, 26 May 2026 14:28:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 2pnkEh6uFWo3LwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 26 May 2026 14:28:46 +0000
Date: Tue, 26 May 2026 16:28:42 +0200
Message-ID: <87qzmyxn1h.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Gordon Chen <chengordon326@gmail.com>
Cc: linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: add IFB_SILENCE_ON_EMPTY quirk for Behringer Flow 8
In-Reply-To: <20260526072906.90106-1-chengordon326@gmail.com>
References: <20260526072906.90106-1-chengordon326@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 6862C66D2C
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.51

On Tue, 26 May 2026 09:29:06 +0200,
Gordon Chen wrote:
> 
> The Behringer Flow 8 (1397:050c) is an 8-channel USB mixer that
> declares OUT EP 0x01 with implicit feedback from capture EP 0x81 via
> its UAC2 endpoint companion descriptor. After 5-35 minutes of
> continuous playback, the device occasionally returns a capture URB in
> which every iso_frame_desc has a non-zero status (-EXDEV bursts,
> visible as rate-limited "frame N active: -18" lines in dmesg from
> pcm.c).
> 
> In that case snd_usb_handle_sync_urb() at endpoint.c counts bytes==0
> and falls into the early "skip empty packets" return originally added
> for M-Audio Fast Track Ultra. As a result the playback EP loses its
> sole IFB-driven feeder and the OUT ring starves permanently: hw_ptr
> stops advancing while substream state remains RUNNING. Only USB
> re-enumeration recovers.
> 
> Three independent ftrace captures (taken at the moment of stall via a
> userspace watchdog) consistently show:
> 
>   - 60-70 capture URB completions in the 70ms window before the marker
>   - 0 retire_playback_urb / queue_pending_output_urbs /
>     snd_usb_endpoint_implicit_feedback_sink calls
>   - every usb_submit_urb in the window comes from
>     snd_complete_urb+0x64e (capture self-resubmit), none from the
>     queue_pending_output_urbs path
> 
> Add a new opt-in quirk QUIRK_FLAG_IFB_SILENCE_ON_EMPTY: when set, the
> early return is skipped and we fall through to enqueue a packet_info
> whose packet_size[i] are all 0 (the existing loop already maps
> status!=0 packets to size 0). prepare_outbound_urb then emits a
> silence packet, the OUT ring keeps moving, and the device rides
> through the glitch.
> 
> The default behaviour (early return) is preserved for all existing
> devices including M-Audio Fast Track Ultra. Only Flow 8 opts in here.
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Gordon Chen <chengordon326@gmail.com>

Applied to for-next branch now, as it's no urgent fix like a
regression.


thanks,

Takashi
