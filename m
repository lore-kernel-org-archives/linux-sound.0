Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D9E943CE5B
	for <linux-sound@vger.kernel.org>; Tue, 28 Jul 2026 15:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785250982; cv=none; b=XnpI1YhFTGukWbPZXJzpj2MINMNyQI7FTF9TKHHwUc6Pn9By3SvZLi303N20TXa530mIyxIXEIzogcMd+MrElc9DM5Tyx6IaZjw7teU3RRSMc3vk2Hi1xXFDTSDykBAY4a8IS95EJGZLC6DwZdKfjcqo6q8w5i0vcFD8Pz2Xi94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785250982; c=relaxed/simple;
	bh=c7GQo9RH3bjuxxoWOLWrxWmW/AlTFhJlUWqBA8tNSsA=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JCHn14zt2vsnoQgJdZ0eOQ8XE3k4MGa87bI2J7NqLAbAd8Q35q0SXchnSjo8aW2snwJZfDNavznC0TVOAf8LnU1/MadejV5CE82D4Cux7Kjqe7h+r5Eqb9sDWsCqwvyv+TFP+IbazZ46hwwpBTUp3CbwCmueS2Lnbuo4j/ucvwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=UV+a0Bxi; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=zDoTZCzB; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=NYfUBbYo; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=b9TdE5PL; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="UV+a0Bxi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zDoTZCzB";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NYfUBbYo";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="b9TdE5PL"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8D22E3E01;
	Tue, 28 Jul 2026 15:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785250974; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FQbdZirJQ+TnQeSb++oLqBVd7Q5sdfo7+OI30YlJt/k=;
	b=UV+a0BxiJAfm5tHfvTh49NwIhwhK9tQsFJgpkjJz/nJAbypd/pZBPsR5YFk8YUJpgCB70U
	HiQObtPjWyGMfK2pjA4XS7NIxGddvvLvmUWu1A1BQIGQDvxtvN0IxSZUOCh0Pi8L/sPspw
	wrlXjTDjiuEK8RjW0E+Y9Y7FtwqvHz0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785250974;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FQbdZirJQ+TnQeSb++oLqBVd7Q5sdfo7+OI30YlJt/k=;
	b=zDoTZCzBvBKE7ATDPVNvN5f7AoWmPaL+GYurHXZUWrdnu9n9sa2/MUhDZTnUhk8vE27g1T
	IXoK/Paum4h9RQBA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=NYfUBbYo;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=b9TdE5PL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785250969; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FQbdZirJQ+TnQeSb++oLqBVd7Q5sdfo7+OI30YlJt/k=;
	b=NYfUBbYo5o42voq8P/19kYpr4nzn3J6XCv9J6BvxCXyzJOLZsfw66mBeQZtrF09aAVg33s
	8Nop14xl6Iw1MhUSxtzzze6AzTVCBZYO+Z9yJZD6mHD91OXD5O69iJjngMJeCAMeN4knZW
	Km/q9YYCEMsrLQVbu3Do7sMFPYynswY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785250969;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FQbdZirJQ+TnQeSb++oLqBVd7Q5sdfo7+OI30YlJt/k=;
	b=b9TdE5PLgxadeZo0HO97lIjhW2l6yW/mgBiBb8Ku4iwgWXMrqGuwemVaniivOXdiQ9Bol3
	hUHRagP/vEVBNRBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 71B60779B1;
	Tue, 28 Jul 2026 15:02:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id kPwYG5nEaGolNwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 28 Jul 2026 15:02:49 +0000
Date: Tue, 28 Jul 2026 17:02:34 +0200
Message-ID: <87bjbr6tth.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Shi <liaronce@hotmail.com>
Cc: Gordon Chen <chengordon326@gmail.com>,
	linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: add IFB_SILENCE_ON_EMPTY quirk for Behringer Flow 8
In-Reply-To: <OS3PR01MB8827AC846F82A406D22E3FB7DECB2@OS3PR01MB8827.jpnprd01.prod.outlook.com>
References: <20260526072906.90106-1-chengordon326@gmail.com>
	<OS3PR01MB8827AC846F82A406D22E3FB7DECB2@OS3PR01MB8827.jpnprd01.prod.outlook.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-2022-JP
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[hotmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,hotmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,suse.de,perex.cz];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Queue-Id: 8D22E3E01
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action

On Tue, 28 Jul 2026 16:27:35 +0200,
Mark Shi wrote:
> 
> Hi Gordon,
> 
> 在 2026/5/26 15:29, Gordon Chen 写道:
> > The Behringer Flow 8 (1397:050c) is an 8-channel USB mixer that
> > declares OUT EP 0x01 with implicit feedback from capture EP 0x81 via
> > its UAC2 endpoint companion descriptor. After 5-35 minutes of
> > continuous playback, the device occasionally returns a capture URB in
> > which every iso_frame_desc has a non-zero status (-EXDEV bursts,
> > visible as rate-limited "frame N active: -18" lines in dmesg from
> > pcm.c).
> > 
> > In that case snd_usb_handle_sync_urb() at endpoint.c counts bytes==0
> > and falls into the early "skip empty packets" return originally added
> > for M-Audio Fast Track Ultra. As a result the playback EP loses its
> > sole IFB-driven feeder and the OUT ring starves permanently: hw_ptr
> > stops advancing while substream state remains RUNNING. Only USB
> > re-enumeration recovers.
> > 
> > Three independent ftrace captures (taken at the moment of stall via a
> > userspace watchdog) consistently show:
> > 
> >    - 60-70 capture URB completions in the 70ms window before the marker
> >    - 0 retire_playback_urb / queue_pending_output_urbs /
> >      snd_usb_endpoint_implicit_feedback_sink calls
> >    - every usb_submit_urb in the window comes from
> >      snd_complete_urb+0x64e (capture self-resubmit), none from the
> >      queue_pending_output_urbs path
> > 
> > Add a new opt-in quirk QUIRK_FLAG_IFB_SILENCE_ON_EMPTY: when set, the
> > early return is skipped and we fall through to enqueue a packet_info
> > whose packet_size[i] are all 0 (the existing loop already maps
> > status!=0 packets to size 0). prepare_outbound_urb then emits a
> > silence packet, the OUT ring keeps moving, and the device rides
> > through the glitch.
> > 
> > The default behaviour (early return) is preserved for all existing
> > devices including M-Audio Fast Track Ultra. Only Flow 8 opts in here.
> > 
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Gordon Chen <chengordon326@gmail.com>
> > 
> Device: Mechrevo WUJIE14Pro A-7BC4U
> CPU: AMD Ryzen 7 7840HS (Codename "Phoenix")
> Firmware Version: T140_PHX_V20
> Firmware Release Date: 2024.1.8
> Kernel version: 7.1.4
> 
> In Linux kernel 7.1.4, I found that my laptop couldn't wake up from S3
> suspend; I had to hold down the power button to force a shutdown and
> then restart it.
> 
> Using `git bisect`, I discovered that if I revert this patch, the
> laptop resumes from S3 normally.

Do you have this USB-audio device (Behringer Flow 8 with USB ID
1397:050c)?  The commit must be harmless unless you have this device.
That is, if you don't have this device, it's likely a false-positive
bisection result.


thanks,

Takashi
