Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793626327;
	b=mqGPYENoEoY7Q04W1o345kbMd5Xe4gqiP4Srt1VRa14EIASJhiwR/HUpyeiD05hN4ePR
	 U4sQXyFmnnnUUbU7vcsbleh8muq2vuwyZflmkniP0B9FkeOYow9fYkGctjlESo5h2ShYa
	 219Y8nhVvQSDDAR7EoffWiBTy5swOkSD4vcBaClGBaCqbxfpqRKKNki315AbO5w9d8sx6
	 me/EcPjBjBYEDCXw4gcPXqcxXLkW0TI2LoEfzcWPueF6tXdyST8CvytMaCGiw4sNM3EJ1
	 qi2YysqAqmbO2NbRBCEQ/Q8VUMHB7sCs26OhU85BPBj4/x10PC78Uv4qh3XWFsKhMHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793626327;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Spam-Score:X-Spam-Level:X-Spam-Flag;
	bh=f0kV9BMGYJhNj5GKBIccLQVNn9woQvPDjg6SiVPbt/Y=;
	b=TmWgkXDG5Nzn7dadIF1em9RRn/3aKl3XA0RCJv53nldU0ePBTwppooa5vFVuPi8Atb7H
	 GOYSVUFNtGsjWGJtrm1Jhm4BAUro15tra+jp/NeXies1LJN4q8nXb7VZEQc47DPOgVSc+
	 FlJHghX95LRXw+30iwphD3a60KKJlqDQHlak3lFXMev6TZpFIsSJ7wyIZ7uyvt8+Azxvh
	 Ja9t86WStDwjxLY2jEUXKRktOWjQjPkDx4wwYizy3bGCSY+OLk90J+ikvcUqVIvaWZU89
	 XWV0zcYvMMYTfvsJlb5lmajZJwrwpnQqn5KlM3z30C0Rnx9aNmi0G77z3xn7riJbEuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=IjsghM45;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=X2mehGxm;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=IjsghM45;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=X2mehGxm;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95063606A327
	for <linux-sound@vger.kernel.org>; Mon,  2 Nov 2026 13:32:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95063606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=IjsghM45;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=X2mehGxm;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=IjsghM45;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=X2mehGxm
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id DA1871F7A5;
	Mon,  2 Nov 2026 13:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793626324; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=f0kV9BMGYJhNj5GKBIccLQVNn9woQvPDjg6SiVPbt/Y=;
	b=IjsghM454kxXtm2O6YPRsIyOxOp3cIs8o5oFFTHrX2XauH8zwcvvhUtHESmTDOWNG7HC4e
	Q8QL+3tJ7mPbSMkx8UgtX8dqtGfZGfkiyTyaGsXaOMhiwCRBelM2xZszdxXvRH+zlOzHQW
	ePzHyi6BPIT0ldLqdMngHfX+a1gkXDc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793626324;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=f0kV9BMGYJhNj5GKBIccLQVNn9woQvPDjg6SiVPbt/Y=;
	b=X2mehGxmzpSrV/1rjQ9PV605T4kmHELvyG2StCsXnQSZ4FAzB5hKIJbJcoYJtvaz07MqgM
	w/bQbx1F3A802fBg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793626324; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=f0kV9BMGYJhNj5GKBIccLQVNn9woQvPDjg6SiVPbt/Y=;
	b=IjsghM454kxXtm2O6YPRsIyOxOp3cIs8o5oFFTHrX2XauH8zwcvvhUtHESmTDOWNG7HC4e
	Q8QL+3tJ7mPbSMkx8UgtX8dqtGfZGfkiyTyaGsXaOMhiwCRBelM2xZszdxXvRH+zlOzHQW
	ePzHyi6BPIT0ldLqdMngHfX+a1gkXDc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793626324;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=f0kV9BMGYJhNj5GKBIccLQVNn9woQvPDjg6SiVPbt/Y=;
	b=X2mehGxmzpSrV/1rjQ9PV605T4kmHELvyG2StCsXnQSZ4FAzB5hKIJbJcoYJtvaz07MqgM
	w/bQbx1F3A802fBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9CCE6134B3;
	Mon,  2 Nov 2026 13:32:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id KY6FHNSQ6GpCfAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 02 Nov 2026 13:32:04 +0000
Date: Mon, 02 Nov 2026 14:32:04 +0100
Message-ID: <871p939x63.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Riccardo Belli <belli.notari@gmail.com>
Cc: linux-sound@vger.kernel.org,
	"Cc: Takashi Iwai" <tiwai@suse.de>
Subject: Re: [BUG] ALSA: usb-audio: list_add corruption in snd_usb_endpoint_start()
In-Reply-To: <CAK_58X+DXZLLwJir1NZ7p7NTqqetfqYci479ez9pTG9PuoOo2g@mail.gmail.com>
References: <CAK_58X+DXZLLwJir1NZ7p7NTqqetfqYci479ez9pTG9PuoOo2g@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-12.30 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_TLS_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -12.30
X-Spam-Level: 
X-Spam-Flag: NO

On Thu, 29 Oct 2026 09:04:23 +0100,
Riccardo Belli wrote:
> 
> Hi,
> 
> This morning I got a kernel BUG in snd-usb-audio. PipeWire crashed
> inside snd_usb_endpoint_start() with a list_add corruption. After that
> the USB hub of my monitor did not work anymore until I rebooted. It
> happened only once so far and I can't reproduce it on purpose.
> 
> Setup:
> - Kernel 7.2.8, Omarchy build (linux-omarchy 7.2.8-9). Its only extra
>   patches are the BORE CPU scheduler and the ADIOS I/O scheduler.
>   Not tainted.
> - Lenovo 21RX001LGE, BIOS R2XET37W (1.17)
> - Topping E2x2 USB audio interface (152a:8752), connected through the
>   USB hub of a Samsung LS49A950U monitor (TI hub 0451:8242). The
>   monitor has a KVM, so the hub and all devices on it are disconnected
>   and connected again when I switch the input.
> 
> Timeline (local time):
> - 19:35:52 the day before: hub disconnected (KVM switch)
> - 08:01:30: hub connected again, E2x2 enumerated normally
> - 08:14:59: the BUG below, while PipeWire calls SNDRV_PCM_IOCTL_PREPARE
>   on the E2x2. PipeWire exits with irqs disabled and preempt_count 1.
> - 08:15:27: KVM switched away. The kernel logs the disconnect of the
>   hub, the E2x2 and two other devices, but not of the fourth device
>   on the hub (Realtek 0bda:8153). After that a kworker on
>   usb_hub_wq stays in D state, nothing on the hub enumerates anymore
>   and pipewire stays a zombie.
> 
> Trace:
> 
>  slab kmalloc-part-14-8k start ffff8cb613a0a000 pointer offset 2120 size 8192
> list_add corruption. prev->next should be next (ffff8cb613a0b590), but
> was ffff8cb613a0a848. (prev=ffff8cb613a0a848).
> ------------[ cut here ]------------
> kernel BUG at lib/list_debug.c:32!
> Oops: invalid opcode: 0000 [#1] SMP NOPTI
> CPU: 1 UID: 1000 PID: 1407 Comm: pipewire Not tainted 7.2.8-9-omarchy
> #1 PREEMPT(full)  2a024ab81c03d9fcd6534aa9914b7956fa84b6ee
> Hardware name: LENOVO 21RX001LGE/21RX001LGE, BIOS R2XET37W (1.17 ) 11/07/2025
> RIP: 0010:__list_add_valid_or_report+0x7a/0xb0
> Code: 8f e8 9a 28 f9 ff 0f 0b 48 3b 16 74 1f 48 89 f7 e8 ab f1 5a 00
> 48 8b 13 48 89 d9 48 89 ee 48 c7 c7 10 dd 09 8f e8 76 28 f9 ff <0f> 0b
> 48 39 f7 74 05 48 39 d7 75 17 48 89 fe 48 89 e9 48 89 da 48
> RSP: 0018:ffffcf1948013cd0 EFLAGS: 00010046
> RAX: 0000000000000075 RBX: ffff8cb613a0a848 RCX: 0000000000000000
> RDX: 0000000000000000 RSI: 0000000000000001 RDI: ffff8cca6569d2c0
> RBP: ffff8cb613a0b590 R08: 0000000000000001 R09: 000000000014a5e6
> R10: 000000000014a5e6 R11: ffff8cca655494a0 R12: ffff8cb613a0a148
> R13: ffff8cb613a0b65c R14: 0000000000000256 R15: 0000000000000002
> FS:  00007fb6e53c9bc0(0000) GS:ffff8ccad4ddd000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00007ffded3a85d8 CR3: 000000017ddf4000 CR4: 0000000000f50ef0
> PKRU: 55555554
> Call Trace:
>  <TASK>
>  snd_usb_endpoint_start.cold+0x41/0x145 [snd_usb_audio]
>  start_endpoints+0x5a/0xb0 [snd_usb_audio]
>  snd_usb_pcm_prepare+0x143/0x200 [snd_usb_audio]
>  snd_pcm_do_prepare+0x40/0x190 [snd_pcm]
>  snd_pcm_prepare+0x508/0x690 [snd_pcm]
>  snd_pcm_ioctl+0x28/0x40 [snd_pcm]
>  __x64_sys_ioctl+0xb9/0xf0
>  ? do_syscall_64+0xaa/0x630
>  do_syscall_64+0xaa/0x630
>  ? snd_pcm_ioctl+0x28/0x40 [snd_pcm]
>  ? __x64_sys_ioctl+0xd5/0xf0
>  ? do_syscall_64+0xaa/0x630
>  ? do_syscall_64+0xaa/0x630
>  ? do_syscall_64+0x5f/0x630
>  ? exc_page_fault+0x90/0x1c0
>  entry_SYSCALL_64_after_hwframe+0x76/0x7e
>  </TASK>
> ---[ end trace 0000000000000000 ]---
> note: pipewire[1407] exited with irqs disabled
> note: pipewire[1407] exited with preempt_count 1
> 
> I can send the full log or the module list if it helps.

Unfortunately it's not clear how this happens.
Can you reproduce it easily?  If so, try to enable the 'dyndbg=+p' to
the module option snd-usb-audio for enabling the debug prints, and see
what the driver does around the crash.

But, before all, please verify whether this still happens with the
fresh 7.4-rc1.


thanks,

Takashi
