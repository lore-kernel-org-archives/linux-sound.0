Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A4202E62D4
	for <linux-sound@vger.kernel.org>; Thu, 16 Oct 2025 15:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760628374; cv=none; b=gP/LqKj+ASK5kBlfW+WG93t9/eqcKm468/IkggpiP2c+/YLrVgH+Y540/1FmUeLkGJjFKTW00Ful9hmkPm6kaLVLYUlgc4AedTe30xJ82KgIIEqaJj/uY2/x6pthMZW9y48lmF6PGbJgjT/wBiQ0hZ6Fg0/w1yK+tIE2dZcObxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760628374; c=relaxed/simple;
	bh=DaHrjA4vH4oEtW0Y5haZmVYoXSr2uu2gAeDC9pW+8b4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RoZfc/8s7k1jOmi3jozM3YYMmXSNN+QFxF2Fzm0sqHfVO1UYW1DNvhhRcHkEkOApCnxcQLnbasyF+iyiV5qM9Fkr6ZJhhkRH/+1AgOwE36YsiPZPYUznRTuNQcSLc/PhM2FFBJRnJeXjRWQXn/+2VAFYomF9Q76Be2U+VzTrrek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Q8wpJGwM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=gpM9DB2/; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Q8wpJGwM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=gpM9DB2/; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Q8wpJGwM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gpM9DB2/";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Q8wpJGwM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gpM9DB2/"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3C6DB21DA8;
	Thu, 16 Oct 2025 15:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1760628369; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hlCpI6bUOW1ZDt3AQsTSccRyfZ5jeh5ELvNMslTtOX8=;
	b=Q8wpJGwMIA9qM5jhK5d4RNBJsuhqudGf/UpX3SfolRZmgeFXfZTZmAtGkvk6H3vzVWIEBC
	bl2qYW4R8rf8sf22RC2YGiWs/0vAOchuXRz/IxxRblPgA7SwdCHB0NhoyKqwn3xvMv7xWB
	UCo9j/ytUX9sU/YvSNd1WvCJBlb6bhk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1760628369;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hlCpI6bUOW1ZDt3AQsTSccRyfZ5jeh5ELvNMslTtOX8=;
	b=gpM9DB2/lD2tHg6PPrk3NjYLLQyPwbNc3cu6yBVP1OUw+IkE9Oq7Ue5BgUv7obnsdXD0fc
	d4IfFGce6CbEaiBw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Q8wpJGwM;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="gpM9DB2/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1760628369; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hlCpI6bUOW1ZDt3AQsTSccRyfZ5jeh5ELvNMslTtOX8=;
	b=Q8wpJGwMIA9qM5jhK5d4RNBJsuhqudGf/UpX3SfolRZmgeFXfZTZmAtGkvk6H3vzVWIEBC
	bl2qYW4R8rf8sf22RC2YGiWs/0vAOchuXRz/IxxRblPgA7SwdCHB0NhoyKqwn3xvMv7xWB
	UCo9j/ytUX9sU/YvSNd1WvCJBlb6bhk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1760628369;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hlCpI6bUOW1ZDt3AQsTSccRyfZ5jeh5ELvNMslTtOX8=;
	b=gpM9DB2/lD2tHg6PPrk3NjYLLQyPwbNc3cu6yBVP1OUw+IkE9Oq7Ue5BgUv7obnsdXD0fc
	d4IfFGce6CbEaiBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 16A021340C;
	Thu, 16 Oct 2025 15:26:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id nMtDBJEO8WiDOgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 16 Oct 2025 15:26:09 +0000
Date: Thu, 16 Oct 2025 17:26:08 +0200
Message-ID: <87ecr27trj.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Pawel / Xj <xj@wp.pl>
Cc: Takashi Iwai <tiwai@suse.de>,
	linux-sound <linux-sound@vger.kernel.org>,
	Roy Vegard Ovesen <roy.vegard.ovesen@gmail.com>
Subject: Re: [BUG] Presonus Studio 1824c firmware 3.11 no longer exposes mixer interface ("Quirk or no altset; falling back to MIDI 1.0")
In-Reply-To: <bafec1e8819e47f1bea6e0bfa3f877cf@grupawp.pl>
References: <874irz86en.wl-tiwai@suse.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 3C6DB21DA8
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[wp.pl];
	TO_DN_ALL(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,wp.pl];
	FREEMAIL_CC(0.00)[suse.de,vger.kernel.org,gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid]
X-Spam-Score: -2.01

On Thu, 16 Oct 2025 17:15:46 +0200,
Pawel / Xj wrote:
> 
> 
> Thanks for answer.
> Unfortunately didn't help. I just checked 6.18rc1.
> The problem is in this "no altset".
> In my previous mail there is analyze that I made with help from ChatGPT :)

Don't trust ChatGPT, seriously...

The "no altset" message comes from USB MIDI2 probe, and the message
itself is neither error nor warning, but informs that it's no MIDI2
but MIDI1 device, and the MIDI1 driver code is used.  So, it's almost
always shown unless the device has a MIDI2 interface.

That said, the message has little to do with the audio mixer problem.

> [  +4,174933] usb 3-2: new high-speed USB device number 3 using xhci_hcd
> [  +0,125582] usb 3-2: New USB device found, idVendor=194f, idProduct=010d,
> bcdDevice= 3.11
> [  +0,000007] usb 3-2: New USB device strings: Mfr=1, Product=3, SerialNumber=
> 2
> [  +0,000001] usb 3-2: Product: Studio 1824c
> [  +0,000001] usb 3-2: Manufacturer: PreSonus
> [  +0,000000] usb 3-2: SerialNumber: SC4E25040072
> [  +0,973997] usb 3-2: Presonus Studio 1810c, device_setup: 0
> [  +0,000006] usb 3-2: (8out/14in @ 96kHz)
> [  +0,278930] usb 3-2: Quirk or no altset; falling back to MIDI 1.0
> 
> I also see something like this
> [  +0,000001] Call Trace:
> [  +0,000002]  <TASK>
> [  +0,000001]  usb_start_wait_urb+0x89/0x190
> [  +0,000002]  usb_control_msg+0xe5/0x150
> [  +0,000002]  snd_usb_ctl_msg+0xa5/0x160
> [  +0,000003]  snd_sc1810c_get_status_field.constprop.0+0xc0/0x140
> [  +0,000005]  snd_s1810c_get_switch_state.constprop.0.isra.0+0x54/0xa0
> [  +0,000002]  snd_s1810c_switch_set+0x69/0x130
> [  +0,000001]  snd_ctl_elem_write+0x18b/0x260
> [  +0,000003]  snd_ctl_ioctl+0x3b8/0x7e0
> [  +0,000002]  __x64_sys_ioctl+0x97/0xe0
> [  +0,000003]  do_syscall_64+0x81/0x7f0
> [  +0,000003]  ? __x64_sys_ioctl+0x97/0xe0
> [  +0,000003]  ? do_syscall_64+0x81/0x7f0
> [  +0,000002]  ? __x64_sys_ioctl+0x97/0xe0
> [  +0,000000]  ? do_syscall_64+0x81/0x7f0
> [  +0,000002]  ? snd_ctl_ioctl+0x20e/0x7e0
> [  +0,000002]  ? __x64_sys_ioctl+0x97/0xe0
> [  +0,000001]  ? do_syscall_64+0x81/0x7f0
> [  +0,000001]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> [  +0,000002] RIP: 0033:0x7f3da2d112ff

Please give the full content.  It trimmed too much and can't judge
exactly.  I guess it's a problem in the recent quirk code, and it
might not be working well with your firmware.

Roy, could you check whether the recent kernel still works properly
with S1824c?


Takashi
