Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 915EC24EF8C
	for <linux-sound@vger.kernel.org>; Fri, 17 Oct 2025 07:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760686865; cv=none; b=Dpc9DWRMvtq0CEl4Uel6sMQPGNxVVCmvZNleRg+ao+u0hZ+25jmknbaMya2heLHbBVeo0S3lnU5ElvbhOuMpqW3rgCFVZWW6bTbiIrywPZ3BA6AryQ1kn4kl459kfEvZwq7aGT6Jc5c1anIrC0kBOe0cwHS8D6mMXKWwc9PJBu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760686865; c=relaxed/simple;
	bh=LdFMmNVlMPFM1aNDZrsZY9hrHTXxAMU1dH4MLq0Fo2g=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q7kCNl3enw0EDPYtlBqCAQRYocDOb5mYiWVxG22OpN/7HutJNgQD4cUphnuWOXPD8hYh9FNkSuEG3x06L/0VI6RUKBNmH99jnFx7g6D1Ng7J+yW94w/PCDq0VbE2UMm9kpjw5oyoXR+BdlwAFsoO67JhrKhFKKPqYzFgXHC/B+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=x5veYaO2; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Hy5aNDrz; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=x5veYaO2; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Hy5aNDrz; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="x5veYaO2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Hy5aNDrz";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="x5veYaO2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Hy5aNDrz"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8CB5121291;
	Fri, 17 Oct 2025 07:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1760686859; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/MzHCh6W+ho6cNHbqMbjyz5RU8OIl0w1M0aUgySHXOY=;
	b=x5veYaO2xh00pXOk3ZK9WjtvmjDk0vGVmSsvrSpxEmLfXQp+EFqGSQqId7Xd5uqGBOpL1R
	My+jXvlshUjF7KTilMDs25vBh/C8X1TlK3zSBVk7dU5wev0I6ljZNRwQrW287CRKWDL9Ff
	6h84WAen9Ijz4SsglPJ7NvJqdMc1Ayw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1760686859;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/MzHCh6W+ho6cNHbqMbjyz5RU8OIl0w1M0aUgySHXOY=;
	b=Hy5aNDrzmaRxarSY57pBtHz2WCi2hP/o7Y8IgX91ziQOtdsjUtn/pe6nGpc03dXPj+RHGq
	IQbkQSrRHv/abBAQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=x5veYaO2;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Hy5aNDrz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1760686859; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/MzHCh6W+ho6cNHbqMbjyz5RU8OIl0w1M0aUgySHXOY=;
	b=x5veYaO2xh00pXOk3ZK9WjtvmjDk0vGVmSsvrSpxEmLfXQp+EFqGSQqId7Xd5uqGBOpL1R
	My+jXvlshUjF7KTilMDs25vBh/C8X1TlK3zSBVk7dU5wev0I6ljZNRwQrW287CRKWDL9Ff
	6h84WAen9Ijz4SsglPJ7NvJqdMc1Ayw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1760686859;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/MzHCh6W+ho6cNHbqMbjyz5RU8OIl0w1M0aUgySHXOY=;
	b=Hy5aNDrzmaRxarSY57pBtHz2WCi2hP/o7Y8IgX91ziQOtdsjUtn/pe6nGpc03dXPj+RHGq
	IQbkQSrRHv/abBAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5949F136C6;
	Fri, 17 Oct 2025 07:40:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mN5vFAvz8WiMRAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 17 Oct 2025 07:40:59 +0000
Date: Fri, 17 Oct 2025 09:40:58 +0200
Message-ID: <871pn26kmt.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Roy Vegard Ovesen <roy.vegard.ovesen@gmail.com>
Cc: Xj <xj@wp.pl>,
	Takashi Iwai <tiwai@suse.de>,
	linux-sound <linux-sound@vger.kernel.org>
Subject: Re: [BUG] Presonus Studio 1824c firmware 3.11 no longer exposes mixer interface ("Quirk or no altset; falling back to MIDI 1.0")
In-Reply-To: <aPFTxD89mYhea2ZX@ark>
References: <874irz86en.wl-tiwai@suse.de>
	<87ecr27trj.wl-tiwai@suse.de>
	<2b24f320-3c6c-4adc-b5c4-ce6134d3b39e@wp.pl>
	<aPFTxD89mYhea2ZX@ark>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 8CB5121291
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,wp.pl];
	FREEMAIL_CC(0.00)[wp.pl,suse.de,vger.kernel.org];
	RCVD_COUNT_TWO(0.00)[2];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TAGGED_RCPT(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -2.01
X-Spam-Level: 

On Thu, 16 Oct 2025 22:21:24 +0200,
Roy Vegard Ovesen wrote:
> 
> > [    3.354758] ------------[ cut here ]------------
> > [    3.354761] usb 3-2: BOGUS control dir, pipe 80000280 doesn't match bRequestType 40
> > [    3.354769] WARNING: CPU: 12 PID: 1020 at drivers/usb/core/urb.c:412 usb_submit_urb+0x59f/0x650
> > [    3.354776] Modules linked in:
> > [    3.354779] CPU: 12 UID: 0 PID: 1020 Comm: alsactl Not tainted 6.18.0-rc1 #1 PREEMPT(full)  3ae07d8adb35c0aa13fd8a63520768d4d65cbe95
> > [    3.354782] Hardware name: ASRock B850M Pro-A/B850M Pro-A, BIOS 3.50 09/18/2025
> > [    3.354784] RIP: 0010:usb_submit_urb+0x59f/0x650
> > [    3.354786] Code: 89 44 24 0c 89 4c 24 08 e8 5e 1f ef ff 44 8b 44 24 0c 8b 4c 24 08 48 c7 c7 c0 a5 15 b8 48 8b 54 24 18 48 89 c6 e8 f1 e9 b8 fe <0f> 0b 4c 8b 54 24 10 e9 fe fc ff ff 80 3d e9 83 4a 02 00 74 50 b8
> > [    3.354788] RSP: 0018:ffffd1bdc23a3750 EFLAGS: 00010246
> > [    3.354789] RAX: 0000000000000000 RBX: ffff8bc7c1facfc0 RCX: 00000000000003f9
> > [    3.354790] RDX: 0000000000000000 RSI: ffffd1bdc23a35f0 RDI: 0000000000000003
> > [    3.354791] RBP: ffff8bc7c6a0d058 R08: 0000000000000000 R09: 00000000ffffdfff
> > [    3.354792] R10: ffffffffba11af80 R11: ffffd1bdc23a35e8 R12: 0000000000000000
> > [    3.354793] R13: 0000000000000000 R14: ffff8bc7c6a0d000 R15: 0000000000000001
> > [    3.354793] FS:  00007fab8f421b80(0000) GS:ffff8bcf24295000(0000) knlGS:0000000000000000
> > [    3.354795] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > [    3.354795] CR2: 00007fab8f52c000 CR3: 0000000112652000 CR4: 0000000000f50ef0
> > [    3.354796] PKRU: 55555554
> > [    3.354797] Call Trace:
> > [    3.354799]  <TASK>
> > [    3.354801]  usb_start_wait_urb+0x89/0x190
> > [    3.354804]  usb_control_msg+0xe5/0x150
> > [    3.354806]  snd_usb_ctl_msg+0xa5/0x160
> > [    3.354810]  snd_sc1810c_get_status_field.constprop.0+0xc0/0x140
> > [    3.354815]  snd_s1810c_get_switch_state.constprop.0.isra.0+0x54/0xa0
> > [    3.354817]  snd_s1810c_switch_set+0x69/0x130
> > [    3.354820]  snd_ctl_elem_write+0x18b/0x260
> > [    3.354824]  snd_ctl_ioctl+0x3b8/0x7e0
> > [    3.354826]  __x64_sys_ioctl+0x97/0xe0
> > [    3.354829]  do_syscall_64+0x81/0x7f0
> > [    3.354833]  ? vfs_write+0x3c4/0x480
> > [    3.354836]  ? ksys_write+0xbf/0xf0
> > [    3.354837]  ? do_syscall_64+0x81/0x7f0
> > [    3.354838]  ? __x64_sys_close+0x3d/0x80
> > [    3.354840]  ? do_syscall_64+0x81/0x7f0
> > [    3.354841]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> > [    3.354843] RIP: 0033:0x7fab8f3112ff
> > [    3.354844] Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <89> c2 3d 00 f0 ff ff 77 18 48 8b 44 24 18 64 48 2b 04 25 28 00 00
> > [    3.354845] RSP: 002b:00007ffc8d758ca0 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
> > [    3.354846] RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007fab8f3112ff
> > [    3.354846] RDX: 00007ffc8d758e30 RSI: 00000000c4c85513 RDI: 0000000000000004
> > [    3.354847] RBP: 00007ffc8d759480 R08: 00007ffc8d758e30 R09: 0000000000000000
> > [    3.354847] R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
> > [    3.354848] R13: 0000000000000003 R14: 0000000000000001 R15: 0000000000000001
> > [    3.354848]  </TASK>
> > [    3.354849] ---[ end trace 0000000000000000 ]---
> 
> This looks a bit sus.

Yes, this must be fixed.  It implies the pipe passed to
snd_usb_ctl_msg() in snd_sc1810c_get_status_field() is somehow
incorrect.


Takashi
