Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793775553;
	b=Sy5lzI915vg11W3Vz9QeLFnseh19ewJhiiUDAon6+tD5mjAOvh+0XOaOZu7vSrTc7BXZ
	 hC61pQFtZ/cmYYAud8AmSdoGpFtgX/nZiuGoGVy1bDnBwrcD1YaN5fKO4f+dSTsOgy7b7
	 tM3MBSCG/6f+m4oyTKsqBlRNvfILuSS17Un6Zc8Xb0Q5QwYomVrOgPp/A4pVgbUUJQ69J
	 r0UbY3gg6/4yAVxo/a3j/lZMYv6Qk/XG7F1TxQqkwyfWmY3zJVP2GrianoNs+9v8Pmy3i
	 X/Z+TpFzoeWZyQQn4/75vojADw6JeRi/TRwWXU7rTBh6YkM1ITNPvmQm5Q9Cjkidl4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793775553;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Spamd-Result:X-Spam-Score:X-Spam-Level:
	 X-Spam-Flag;
	bh=Rfwl6MzgyJFI2cy+Fk1e5NjTCItGYYzUPCOWzgKYsbs=;
	b=pT8JZ2da+yX3rjybxCcB+mJDq4Pvq1EywLss27QzuJRzutC9wlvAjL9SHE8AmaRYAu5v
	 ss1/dv/7M7cMml26bYFYq/lqUJsRtW+CaSiuCPE/DG7WoiQrpmzrP5IWt3AxUa1KscfJY
	 3D9CQ+uEWWyO4ey9wNOXlx6traDVHSNFW3AsrQhN5O7rclFgqlgxWVMi1KBdJyjbm72ss
	 3x/Gz60VmJBU+AcdqSiC3ttxtB3sSAEwSkt2dVPn4MdzfdWRiHy+eXhVoQT6X/qzabWL0
	 G4/XRMM2ULluT+VoPvLPN6T5nzl20P0nzGZ/aUgdkdUIeghQ8EpmkzdVww6gb8zxsag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=QwWJGMSc;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b="/Rq0n+aN";
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=vnYepYH3;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=7A8fpyoA;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 318D2606A31B
	for <linux-sound@vger.kernel.org>; Wed,  4 Nov 2026 06:59:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 318D2606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=QwWJGMSc;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=/Rq0n+aN;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=vnYepYH3;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=7A8fpyoA
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5AA991F45B;
	Wed,  4 Nov 2026 06:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793775551; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Rfwl6MzgyJFI2cy+Fk1e5NjTCItGYYzUPCOWzgKYsbs=;
	b=QwWJGMScmJoIiGVR96mw+ejmhN0hk2OLL7HA2Mj5MjKbprFLaDlxlMK1vr+gYlWDKOvl6M
	f7lAE/MvTNwAjEFmIye8OgVX7aXUgHDToFdZlHMd3dGXoI7CaIZ2+DLYByAKN+SmPsTdFX
	0/FcCFFHf/epNjpj5+84F4rG6Tpwz2Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793775551;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Rfwl6MzgyJFI2cy+Fk1e5NjTCItGYYzUPCOWzgKYsbs=;
	b=/Rq0n+aNh3Yu/bsJ1cHKkqdiohxwFj/65r7gJ3yjuEWEmJI3ivAO47T8tnqoJbfmDeqXRW
	/zTBkAYsKHbzsPCg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793775550; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Rfwl6MzgyJFI2cy+Fk1e5NjTCItGYYzUPCOWzgKYsbs=;
	b=vnYepYH3Pu0AFpYsmjgiLsuBtpsUFfDZsvV3PriifnqNw+r10tjQsYKmg844PsRMJIY95q
	beBPOFYQ0zUamm7xBgrvswvqg0DCnNTgUjCUvLd+y2hQI7a0gaHjENol40acQfctegAa8R
	VFRerqTICcjrW4Xw5t44SFuyUxpDjJw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793775550;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Rfwl6MzgyJFI2cy+Fk1e5NjTCItGYYzUPCOWzgKYsbs=;
	b=7A8fpyoAF4nz3EoFjqHBhie96hOmClDftZoBFo5zXSx59uAYORcWx3DvL01BsP3Bc+EqZL
	UtOBrcoIC3h+hTAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1C4CF134A5;
	Wed,  4 Nov 2026 06:59:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qsb+OL3X6mq2GwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 04 Nov 2026 06:59:10 +0000
Date: Wed, 04 Nov 2026 07:59:09 +0100
Message-ID: <871p91w08y.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?=22Juan_M=2E_M=E9ndez_Rey=22?= <juan.mendezr@proton.me>
Cc: "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	Takashi Iwai <tiwai@suse.de>
Subject: Re: snd-usb-audio: list_add corruption in snd_complete_urb, fatal panic in softirq (7.2.9)
In-Reply-To: <J1sr9AtFJ_J1bpxFaO0ivZEW9qZBdme6iMaAISltxABWM7FcdjLX9Svl18kcV1QM1jRFjzPqjdIr5wuC4VzPer3b-iHa05OovdSHx0isMlE=@proton.me>
References: <J1sr9AtFJ_J1bpxFaO0ivZEW9qZBdme6iMaAISltxABWM7FcdjLX9Svl18kcV1QM1jRFjzPqjdIr5wuC4VzPer3b-iHa05OovdSHx0isMlE=@proton.me>
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
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-12.30 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -12.30
X-Spam-Level: 
X-Spam-Flag: NO

On Tue, 03 Nov 2026 21:33:21 +0100,
Juan M. Méndez Rey wrote:
> 
> Hi Linux Sound/ALSA team,
> 
> My desktop panicked with a list_add corruption inside snd_complete_urb().
> It happened in softirq context, so the box hung instead of logging to disk.
> I only got the trace because efi_pstore saved it.
> 
> Kernel is Debian 7.2.9+deb14-amd64 (7.2.9-1), not tainted, 16 days of uptime.
> Board is an ASUS ROG STRIX B650-A GAMING WIFI, BIOS 3042.
> 
> Two USB audio devices use snd-usb-audio:
> 
>   0b05:1a52 ASUS USB Audio (onboard), high speed, bus 1
>   338a:1517 Aisa Expert TEMPEST PRO 20 (headset), full speed, bus 5,
>             the default PipeWire sink
> 
> The trace doesn't say which one it was. As far as I know nobody was
> playing audio at that moment. A KDE notification popped up about 20 s
> before the crash, and PipeWire (1.6.9) keeps a speech-dispatcher dummy
> stream linked to the headset, so a short-lived stream is my best guess.
> I haven't reproduced it, and it's the first time I've seen it.
> 
>   list_add corruption. prev->next should be next (ffff8a5849b8f590), but was ffff8a5849b8e148. (prev=ffff8a5849b8e148).
>   kernel BUG at lib/list_debug.c:32!
>   Oops: invalid opcode: 0000 [#1] SMP NOPTI
>   CPU: 21 UID: 0 PID: 0 Comm: swapper/21 Not tainted 7.2.9+deb14-amd64 #1 PREEMPT(lazy)  Debian 7.2.9-1
>   RIP: 0010:__list_add_valid_or_report+0xa6/0xb0
>   Call Trace:
>    <IRQ>
>    snd_complete_urb+0xff/0x750 [snd_usb_audio]
>    __usb_hcd_giveback_urb+0xa0/0x120 [usbcore]
>    usb_giveback_urb_bh+0xb3/0x150 [usbcore]
>    process_one_work+0x19e/0x370
>    bh_worker+0x1cb/0x1f0
>    tasklet_hi_action+0x13/0x30
>    handle_softirqs+0xd9/0x310
>    __irq_exit_rcu+0xa1/0xf0
>    common_interrupt+0x85/0xa0
>    </IRQ>
>   Kernel panic - not syncing: Fatal exception in interrupt
> 
> I decoded it with the Debian 7.2.9 debug symbols. snd_complete_urb+0xff
> is the list_add_tail() in push_back_to_ready_list(), called from the
> low-latency / implicit-fb branch of snd_complete_urb():
> 
>   __list_add_valid       include/linux/list.h:96
>   list_add_tail          include/linux/list.h:198
>   push_back_to_ready_list sound/usb/endpoint.c:452
>   snd_complete_urb       sound/usb/endpoint.c:572
> 
> The addresses line up with one struct snd_usb_endpoint (5744 bytes, so
> kmalloc-8k, starting at ffff8a5849b8e000):
> 
>   next = ...f590 = ep + 0x1590 = &ep->ready_playback_urbs
>   prev = ...e148 = ep + 0x148  = &ep->urb[0].ready_list
> 
> So ep->ready_playback_urbs.prev still pointed at urb[0], but urb[0]'s
> ready_list was already self-linked, like after the list_del_init() in
> snd_usb_queue_pending_output_urbs(). The list head and the entry
> disagree. I'd guess urb[0] got onto the list twice, or the
> INIT_LIST_HEAD() in stop_urbs() raced with a completion, but I haven't
> proven either.
> 
> I looked through the stable changes up to 7.2.12 and didn't find a fix
> for this. The full pstore dump is attached, with the UPS serial removed.

This should have been already addressed in the upstream.
Could you try 7.3 kernel, or cherry-pick the fix commit
dbd9d1cbf970 ("ALSA: usb-audio: fix list_add double-add in
push_back_to_ready_list")?


thanks,

Takashi
