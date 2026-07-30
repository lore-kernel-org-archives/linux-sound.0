Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C5037CD2A
	for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 13:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785417227; cv=none; b=ODDkcndRFPYqAiR8CEY6vmkapLBTDMmkI7OYGhGH75Ijye/jZ0Fq7aMaKzIr4HFBfc2V4B0JTqRBPGkrgMoY4c+gIo7EmIQ0ZksRNWU0LrfzDShAlQtCL/PcTfKrGR2ci2e2AsbUL9ozPJG/1Wbfj3eoMS7/onTLiBbShoE10Zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785417227; c=relaxed/simple;
	bh=GPzGz8GGJ2GXofD9g+zf5Aw9lbYeHp8GH9rGaR4Y1Yw=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W9AMYz3pRVQvoc3DzuPUN/W/0W0IMtGmCf/nK2s6PksYIULJD/Tdk7atyY64T4uZASP2eSnBWOSzK+g9mWGhXneFYSFJf8iZGTNKv5bqcBC/VhPKis1+6gNeUFqQnYwSksArKGAkhKal7WB0yT5pMEpn4eFWhN6McH2UyxIL9r0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dMBW9fsS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=2VTPJriW; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=DUFHbV9M; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wmUsDQe4; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dMBW9fsS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2VTPJriW";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DUFHbV9M";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wmUsDQe4"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 33B257DA06;
	Thu, 30 Jul 2026 13:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785417219; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=66SNv5xkVfRLatH/3WrYs2VvzD7EVGXlxWAFshz6tPE=;
	b=dMBW9fsSFKfISVmqZ0jA8oJm7/h7wlr/vAIt808Eivt1Sory7hwdvj4TNDsLdQR5mkqsis
	lN/AkHyf21s58Srgmdml37ht7FkjrnVfAeLyaoJEd8N13tYEZbXpVavBQDkgpipKplnc4e
	gJzE/yFpk83G/HX6onjiMbTn36jooQw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785417219;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=66SNv5xkVfRLatH/3WrYs2VvzD7EVGXlxWAFshz6tPE=;
	b=2VTPJriW2ywOcqVeoy33KOvURRV9pk0XjsmS7vPCWKLqvJmIIkB3+eGBNw7OolT51zpxEL
	kLzK6g/Ul4BV/jBw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785417215; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=66SNv5xkVfRLatH/3WrYs2VvzD7EVGXlxWAFshz6tPE=;
	b=DUFHbV9MXcIrMz/Tf1AtZjeLhJCXBBrFExnDYLPsbCJOIkrIb6NQf/5r2/hXO66uyCaN08
	u+/vjrEJJ3DqVcfFM/1Twao/QbPy2WCXluimzF0daKXR2Aiq6f5qd1//88LqCozswWX/wB
	wSlaoz8fcetKoqauHw6l4JmKB73TdLQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785417215;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=66SNv5xkVfRLatH/3WrYs2VvzD7EVGXlxWAFshz6tPE=;
	b=wmUsDQe4HEDMBzN8+MyMArqTzKmSzOiE91evvPI9WtKi7QbwP3eesadMChnaT7LlXNboI7
	lojtb14ZajBhvOCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 02BE3779CC;
	Thu, 30 Jul 2026 13:13:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id OWQCO/5Na2qWVQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 30 Jul 2026 13:13:34 +0000
Date: Thu, 30 Jul 2026 15:13:34 +0200
Message-ID: <877bmc39j5.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Shi <liaronce@hotmail.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	Gordon Chen <chengordon326@gmail.com>,
	linux-sound@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: add IFB_SILENCE_ON_EMPTY quirk for Behringer Flow 8
In-Reply-To: <OS3PR01MB882785126324D216CD667577DEC92@OS3PR01MB8827.jpnprd01.prod.outlook.com>
References: <20260526072906.90106-1-chengordon326@gmail.com>
	<OS3PR01MB8827AC846F82A406D22E3FB7DECB2@OS3PR01MB8827.jpnprd01.prod.outlook.com>
	<87bjbr6tth.wl-tiwai@suse.de>
	<OS3PR01MB8827BF7068BF30726C2C8A1BDECB2@OS3PR01MB8827.jpnprd01.prod.outlook.com>
	<875x1z6q0t.wl-tiwai@suse.de>
	<OS3PR01MB88275E7D7BCF41FE0689E701DECA2@OS3PR01MB8827.jpnprd01.prod.outlook.com>
	<87a4r95007.wl-tiwai@suse.de>
	<OS3PR01MB882785126324D216CD667577DEC92@OS3PR01MB8827.jpnprd01.prod.outlook.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Thu, 30 Jul 2026 14:33:44 +0200,
Mark Shi wrote:
> 
> Hi Takashi,
> 
> > On Wed, 29 Jul 2026 16:28:23 +0200,
> > Mark Shi wrote:
> >> 
> >> Hi Takashi,
> >> 
> >>      On Tue, 28 Jul 2026 17:46:05 +0200,
> >>      Mark Shi wrote:
> >>               Hi Takashi,
> >>                   在 2026/7/28 23:02, Takashi Iwai 写道:
> >>                       On Tue, 28 Jul 2026 16:27:35 +0200,
> >>              Mark Shi wrote:
> >>                               Hi Gordon,
> >>                                   在 2026/5/26 15:29, Gordon Chen
> >> 写道:
> >>                                       The Behringer Flow 8
> >> (1397:050c) is an 8-channel USB mixer that
> >>                      declares OUT EP 0x01 with implicit feedback from capture EP 0x81 via
> >>                      its UAC2 endpoint companion descriptor. After 5-35 minutes of
> >>                      continuous playback, the device occasionally returns a capture URB in
> >>                      which every iso_frame_desc has a non-zero status (-EXDEV bursts,
> >>                      visible as rate-limited "frame N active: -18" lines in dmesg from
> >>                      pcm.c).
> >>                                           In that case
> >> snd_usb_handle_sync_urb() at endpoint.c counts bytes==0
> >>                      and falls into the early "skip empty packets" return originally added
> >>                      for M-Audio Fast Track Ultra. As a result the playback EP loses its
> >>                      sole IFB-driven feeder and the OUT ring starves permanently: hw_ptr
> >>                      stops advancing while substream state remains RUNNING. Only USB
> >>                      re-enumeration recovers.
> >>                                           Three independent ftrace
> >> captures (taken at the moment of stall via a
> >>                      userspace watchdog) consistently show:
> >>                                               - 60-70 capture URB
> >> completions in the 70ms window before the marker
> >>                          - 0 retire_playback_urb / queue_pending_output_urbs /
> >>                            snd_usb_endpoint_implicit_feedback_sink calls
> >>                          - every usb_submit_urb in the window comes from
> >>                            snd_complete_urb+0x64e (capture self-resubmit), none from the
> >>                            queue_pending_output_urbs path
> >>                                           Add a new opt-in quirk
> >> QUIRK_FLAG_IFB_SILENCE_ON_EMPTY: when set, the
> >>                      early return is skipped and we fall through to enqueue a packet_info
> >>                      whose packet_size[i] are all 0 (the existing loop already maps
> >>                      status!=0 packets to size 0). prepare_outbound_urb then emits a
> >>                      silence packet, the OUT ring keeps moving, and the device rides
> >>                      through the glitch.
> >>                                           The default behaviour
> >> (early return) is preserved for all existing
> >>                      devices including M-Audio Fast Track Ultra. Only Flow 8 opts in here.
> >>                                           Cc:
> >> stable@vger.kernel.org
> >>                      Signed-off-by: Gordon Chen <chengordon326@gmail.com>
> >> 
> >>                  Device: Mechrevo WUJIE14Pro A-7BC4U
> >>                  CPU: AMD Ryzen 7 7840HS (Codename "Phoenix")
> >>                  Firmware Version: T140_PHX_V20
> >>                  Firmware Release Date: 2024.1.8
> >>                  Kernel version: 7.1.4
> >>                                   In Linux kernel 7.1.4, I found
> >> that my laptop couldn't wake up from S3
> >>                  suspend; I had to hold down the power button to force a shutdown and
> >>                  then restart it.
> >>                                   Using `git bisect`, I discovered
> >> that if I revert this patch, the
> >>                  laptop resumes from S3 normally.
> >>                               Do you have this USB-audio device
> >> (Behringer Flow 8 with USB ID
> >>              1397:050c)?  The commit must be harmless unless you have this device.
> >>              That is, if you don't have this device, it's likely a false-positive
> >>              bisection result.
> >> 
> >>              thanks,
> >>                           Takashi
> >>                       I don't have that device, but I partially
> >> reverted the code in that
> >>          section, and it went back to normal.
> >>               Hmm, that's odd.
> >>           Could you put a debug print what value does
> >> ep->chip->quirk_flags
> >>      have on your device?
> >> 
> >>      thanks,
> >>           Takashi
> >>      I added `usb_audio_info`, compiled and booted, but `dmesg |
> >> grep "quirk_flags"
> >> ` returned no output.
> > Then something wrong in your test :)
> > 
> > Put another debug print at another place like the probe function, in
> > order to verify whether the patched driver is really loaded, too.
> > And, make sure that you're running the exactly patched kernel.
> > 
> > 
> > Takashi
> 
> 
> I used the `printk` function to retrieve the `quirk_flags` for the
> current function. Here is the output:
> 
> ```
> 
> [   23.225719] snd-usb-audio: quirk_flags = 0x100800
> 

And what about ep->chip->quirk_flags at the place in question?  Does
it show the very same value?

The value 0x100800 means that your device has the quirk bit 11
(QUIRK_TYPE_IFACE_DELAY) and bit 20 (QUIRK_TYPE_FORCE_IFACE_RESET),
and they have nothing to do with the commit you're testing.


thanks,

Takashi
