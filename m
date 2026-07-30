Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A3C45FFA1
	for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 16:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785427441; cv=none; b=r284Z46qEBQOLnAi4BdPJMKeMzo9vELak0mIOF59rdFv4JurCoASc18t+TIBrVWFYkGVnli1LyR3V8WmnIaiXjBh41DvpJKMuDC/On9YSjYflvXYSpoCnoaIbImuevANVlTXbTx7IMUrqrx1ZQ0JlAXkEK/UZIfBYhN59nUEj2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785427441; c=relaxed/simple;
	bh=tzFp1lBnEZWth5r67QqOTmrCDrPOlfTKxvyNkBj8EZ4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NCaOs19y05pENxqWu7Ejsee+kSF58nXcCMowaHF0zM1J8v28cOqx03qlQRjKE0kkb1r/nF4RVN2KjWLE4aheDg2Fn8Xem6j4Sk8g18rJ/Q2cbOQ1szaScYiYoLb8n5fRJuntyr0Ym2+kxv2sN7h84m64W6BFzv1s48YoTWth+Kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=V/czC7WJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=V43PS9Z7; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=lIbrc4ee; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=nRimTEQO; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="V/czC7WJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="V43PS9Z7";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="lIbrc4ee";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nRimTEQO"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 22B6A3E63;
	Thu, 30 Jul 2026 16:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785427434; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3vEI32uIJdhfMYeNfDuPACLNCIw4l7C8LkTK4YpdCE8=;
	b=V/czC7WJtddyLzFXC/cx4LwXXPHFAVIZQ0boxkmL4oDM/94ifKCtQ7j/GX4NmNzLiYK+YZ
	K6uQkN411kR38SSuEQetgQd1siqdZXDf++nhxmW6UliK0XlzzPlxH+Xc1fMJ9iBat3sO4V
	Z/yyDtk3RXaX0hX7JOO3NCOo09JSWAQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785427434;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3vEI32uIJdhfMYeNfDuPACLNCIw4l7C8LkTK4YpdCE8=;
	b=V43PS9Z7QQvkjzA6lvq21n2zIK/DPfNr30Kepy6A6qceWSy3emSHVg2OQWvu1AqqOLCJeq
	TQfqLxaIlqHr8AAQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785427430; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3vEI32uIJdhfMYeNfDuPACLNCIw4l7C8LkTK4YpdCE8=;
	b=lIbrc4eeMKVjcD6tzzKJPhIMf+on/DPUGQKeGLZJ49N237hyRCeWOWVJE7y6OYjV1k+wLA
	qtsrqAq0dV3p7tPwfONL6k7ZRhVuXL7Ufj6n9HfMnahrg4pUeDa0WGm8mtK9D2xQXwDcDx
	ntJAwolxAkK9KcLYWTRYP/+VaAor8No=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785427430;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3vEI32uIJdhfMYeNfDuPACLNCIw4l7C8LkTK4YpdCE8=;
	b=nRimTEQOYfNK1TwyGA0ovOFNZeo1ULbJ8vh0NysjMuROfpC0savtMWOvS0uiasF3oDI4A1
	bbd2TOgprxtHEtCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E4867779CD;
	Thu, 30 Jul 2026 16:03:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id tHl/NuV1a2pmfgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 30 Jul 2026 16:03:49 +0000
Date: Thu, 30 Jul 2026 18:03:49 +0200
Message-ID: <87qzkk1n2y.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Shi <liaronce@hotmail.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	Gordon Chen <chengordon326@gmail.com>,
	linux-sound@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: add IFB_SILENCE_ON_EMPTY quirk for Behringer Flow 8
In-Reply-To: <OS3PR01MB8827209050FF390ABE33A4E2DEC92@OS3PR01MB8827.jpnprd01.prod.outlook.com>
References: <20260526072906.90106-1-chengordon326@gmail.com>
	<OS3PR01MB8827AC846F82A406D22E3FB7DECB2@OS3PR01MB8827.jpnprd01.prod.outlook.com>
	<87bjbr6tth.wl-tiwai@suse.de>
	<OS3PR01MB8827BF7068BF30726C2C8A1BDECB2@OS3PR01MB8827.jpnprd01.prod.outlook.com>
	<875x1z6q0t.wl-tiwai@suse.de>
	<OS3PR01MB88275E7D7BCF41FE0689E701DECA2@OS3PR01MB8827.jpnprd01.prod.outlook.com>
	<87a4r95007.wl-tiwai@suse.de>
	<OS3PR01MB882785126324D216CD667577DEC92@OS3PR01MB8827.jpnprd01.prod.outlook.com>
	<877bmc39j5.wl-tiwai@suse.de>
	<OS3PR01MB8827209050FF390ABE33A4E2DEC92@OS3PR01MB8827.jpnprd01.prod.outlook.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,hotmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[hotmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_CC(0.00)[suse.de,gmail.com,vger.kernel.org,perex.cz];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]

On Thu, 30 Jul 2026 17:40:11 +0200,
Mark Shi wrote:
> 
> Hi Takashi,
> 
> 在 2026/7/30 21:13, Takashi Iwai 写道:
> > On Thu, 30 Jul 2026 14:33:44 +0200,
> > Mark Shi wrote:
> >> Hi Takashi,
> >> 
> >>> On Wed, 29 Jul 2026 16:28:23 +0200,
> >>> Mark Shi wrote:
> >>>> Hi Takashi,
> >>>> 
> >>>>       On Tue, 28 Jul 2026 17:46:05 +0200,
> >>>>       Mark Shi wrote:
> >>>>                Hi Takashi,
> >>>>                    在 2026/7/28 23:02, Takashi Iwai 写道:
> >>>>                        On Tue, 28 Jul 2026 16:27:35 +0200,
> >>>>               Mark Shi wrote:
> >>>>                                Hi Gordon,
> >>>>                                    在 2026/5/26 15:29, Gordon Chen
> >>>> 写道:
> >>>>                                        The Behringer Flow 8
> >>>> (1397:050c) is an 8-channel USB mixer that
> >>>>                       declares OUT EP 0x01 with implicit feedback from capture EP 0x81 via
> >>>>                       its UAC2 endpoint companion descriptor. After 5-35 minutes of
> >>>>                       continuous playback, the device occasionally returns a capture URB in
> >>>>                       which every iso_frame_desc has a non-zero status (-EXDEV bursts,
> >>>>                       visible as rate-limited "frame N active: -18" lines in dmesg from
> >>>>                       pcm.c).
> >>>>                                            In that case
> >>>> snd_usb_handle_sync_urb() at endpoint.c counts bytes==0
> >>>>                       and falls into the early "skip empty packets" return originally added
> >>>>                       for M-Audio Fast Track Ultra. As a result the playback EP loses its
> >>>>                       sole IFB-driven feeder and the OUT ring starves permanently: hw_ptr
> >>>>                       stops advancing while substream state remains RUNNING. Only USB
> >>>>                       re-enumeration recovers.
> >>>>                                            Three independent ftrace
> >>>> captures (taken at the moment of stall via a
> >>>>                       userspace watchdog) consistently show:
> >>>>                                                - 60-70 capture URB
> >>>> completions in the 70ms window before the marker
> >>>>                           - 0 retire_playback_urb / queue_pending_output_urbs /
> >>>>                             snd_usb_endpoint_implicit_feedback_sink calls
> >>>>                           - every usb_submit_urb in the window comes from
> >>>>                             snd_complete_urb+0x64e (capture self-resubmit), none from the
> >>>>                             queue_pending_output_urbs path
> >>>>                                            Add a new opt-in quirk
> >>>> QUIRK_FLAG_IFB_SILENCE_ON_EMPTY: when set, the
> >>>>                       early return is skipped and we fall through to enqueue a packet_info
> >>>>                       whose packet_size[i] are all 0 (the existing loop already maps
> >>>>                       status!=0 packets to size 0). prepare_outbound_urb then emits a
> >>>>                       silence packet, the OUT ring keeps moving, and the device rides
> >>>>                       through the glitch.
> >>>>                                            The default behaviour
> >>>> (early return) is preserved for all existing
> >>>>                       devices including M-Audio Fast Track Ultra. Only Flow 8 opts in here.
> >>>>                                            Cc:
> >>>> stable@vger.kernel.org
> >>>>                       Signed-off-by: Gordon Chen <chengordon326@gmail.com>
> >>>> 
> >>>>                   Device: Mechrevo WUJIE14Pro A-7BC4U
> >>>>                   CPU: AMD Ryzen 7 7840HS (Codename "Phoenix")
> >>>>                   Firmware Version: T140_PHX_V20
> >>>>                   Firmware Release Date: 2024.1.8
> >>>>                   Kernel version: 7.1.4
> >>>>                                    In Linux kernel 7.1.4, I found
> >>>> that my laptop couldn't wake up from S3
> >>>>                   suspend; I had to hold down the power button to force a shutdown and
> >>>>                   then restart it.
> >>>>                                    Using `git bisect`, I discovered
> >>>> that if I revert this patch, the
> >>>>                   laptop resumes from S3 normally.
> >>>>                                Do you have this USB-audio device
> >>>> (Behringer Flow 8 with USB ID
> >>>>               1397:050c)?  The commit must be harmless unless you have this device.
> >>>>               That is, if you don't have this device, it's likely a false-positive
> >>>>               bisection result.
> >>>> 
> >>>>               thanks,
> >>>>                            Takashi
> >>>>                        I don't have that device, but I partially
> >>>> reverted the code in that
> >>>>           section, and it went back to normal.
> >>>>                Hmm, that's odd.
> >>>>            Could you put a debug print what value does
> >>>> ep->chip->quirk_flags
> >>>>       have on your device?
> >>>> 
> >>>>       thanks,
> >>>>            Takashi
> >>>>       I added `usb_audio_info`, compiled and booted, but `dmesg |
> >>>> grep "quirk_flags"
> >>>> ` returned no output.
> >>> Then something wrong in your test :)
> >>> 
> >>> Put another debug print at another place like the probe function, in
> >>> order to verify whether the patched driver is really loaded, too.
> >>> And, make sure that you're running the exactly patched kernel.
> >>> 
> >>> 
> >>> Takashi
> >> 
> >> I used the `printk` function to retrieve the `quirk_flags` for the
> >> current function. Here is the output:
> >> 
> >> ```
> >> 
> >> [   23.225719] snd-usb-audio: quirk_flags = 0x100800
> >> 
> > And what about ep->chip->quirk_flags at the place in question?  Does
> > it show the very same value?
> > 
> > The value 0x100800 means that your device has the quirk bit 11
> > (QUIRK_TYPE_IFACE_DELAY) and bit 20 (QUIRK_TYPE_FORCE_IFACE_RESET),
> > and they have nothing to do with the commit you're testing.
> > 
> > 
> > thanks,
> > Takashi
> 
> I modified the output and added two log points for this purpose, and output:
> 
> ```
> 
> [   23.355939] snd-usb-audio:snd_usb_endpoint_start() quirk_flags = 0x100800
> [   23.437401] snd-usb-audio:snd_usb_endpoint_start() quirk_flags = 0x100800
> [   67.813139] snd-usb-audio:snd_usb_endpoint_start() quirk_flags = 0x100800
> 
> ```
> 
> Regardless of whether I added a log point,
> `snd_usb_endpoint_implicit_feedback_sink()` did not produce any
> output.
> 
> However, without the partial code rollback, during the 7.1.3–7.1.4
> period, I could only restore normal operation by disabling PCIe power
> management using the "pcie_port_pm=off" kernel parameter (from
> "amd_s2idle.py" script's report).
> 
> Unfortunately for me, the platform returned to normal in version 7.1.5
> (even though I hadn't applied any patches) (T_T). This makes it
> impossible for me to determine which side is at fault.

Well, that must be a false-positive, as you couldn't get the debug
print at the patch actually touching.

Let us know if you can reproduce the issue reliably and it still
points to this commit.


thanks,

Takashi
