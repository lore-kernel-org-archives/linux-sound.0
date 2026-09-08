Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E8F3976A4
	for <linux-sound@vger.kernel.org>; Tue,  8 Sep 2026 07:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788852237; cv=none; b=maBwMt6GSNb29NxzVhM+ywLPZ4niO9yPMcbSwVOtjj9Yn0qhxnhcir0V8GLQfQLe0PD3NjKbDzUrYVfeatcpyLHIP4W1piAC1CxQg4ESveW7jrXlt1eLHj6L7poOyq47a6/uoQGpYOUsb4+U9kjml/uKjyBQMpTtl1TocRmk8nU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788852237; c=relaxed/simple;
	bh=3yYG2e/G3CPH6YWd02aktJTwbA0NsDfBx9XmrrZQY3o=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tNECjpXcU7R4B9yU6vppxkTN5yadCfhtKcxPydi0TId1+oDBnA7jMnz6hNhmlkpEr3TskpXwZNketVBqYPqdXDC19i2TfQcc/tmZW9p3kO/wPARjx2PkPORqGVROoc5aucuP/qIZEfCzDO+r3UV3ZkCocojj+6FKMheDksu7rIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=TPsMkYvm; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ieJOTfmS; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Sf4Gj/Ve; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=hOklRepv; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TPsMkYvm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ieJOTfmS";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Sf4Gj/Ve";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hOklRepv"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id DB3EA219DF;
	Tue,  8 Sep 2026 07:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788852230; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4VSqU4n0BXWAV+kOoC4l58w5z3lkckSS/AxiHTXHKaQ=;
	b=TPsMkYvmleQcitc5GBOuv9yxLbh1+f1twOrSs0AcC1HDg20GQZ9/rlgxZmq0jHnvIoybut
	uMeMKVKntn8ELwqoZGmwTA0W8/n1OhI7YokLrVEZofv2nGDJpfn77D+pS5CrZWCaVrsRhM
	R3d+sndQGwzHfD7/j83CeE3on1AbIqE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788852230;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4VSqU4n0BXWAV+kOoC4l58w5z3lkckSS/AxiHTXHKaQ=;
	b=ieJOTfmSpOdZOIxTuUx/xqLeAhFivnxRzXPZmDyE4ObB/KQMXtdCz/28xIQfYqmkfwovDz
	iW5lFMLj5FuumPAQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="Sf4Gj/Ve";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=hOklRepv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788852225; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4VSqU4n0BXWAV+kOoC4l58w5z3lkckSS/AxiHTXHKaQ=;
	b=Sf4Gj/VeawWE8yDPlAlCCAWIg0NW9pztK4KmXvVfJNKiHzm6VWfwiqrKV38x6eycVhlgJR
	ZzDF1CPIuT4FPmT+y0f5Ydc0m0qSsSch5RizPfCgybzxl0tURIGpOYSi8vySf2H/i8M11a
	hBWNDw0cSbY7G3HSEnibdWVwDoFdO+Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788852225;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4VSqU4n0BXWAV+kOoC4l58w5z3lkckSS/AxiHTXHKaQ=;
	b=hOklRepvHohBDkZj61ep02A/9YJ1IrH343GLHtBfjxrzOsZHLVGBHjzWsbaMwdp84NGw3E
	Ky0riUkBp1UpNVBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A60FD13332;
	Tue,  8 Sep 2026 07:23:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id aQYoJgG4n2oJXAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 08 Sep 2026 07:23:45 +0000
Date: Tue, 08 Sep 2026 09:23:45 +0200
Message-ID: <878q5cqk8u.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Eirik Kvalheim <eirikkva@gmail.com>
Cc: linux-sound@vger.kernel.org,
	tiwai@suse.de
Subject: Re: Jabra Evolve2 30 SE (0b0e:0e36) needs QUIRK_FLAG_MIXER_GET_CUR_BROKEN
In-Reply-To: <CAKwi-_QqvHSDFnt3A71RRZRyaWPAOWArZBHVHffE8znQw+B8+g@mail.gmail.com>
References: <CAKwi-_QqvHSDFnt3A71RRZRyaWPAOWArZBHVHffE8znQw+B8+g@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: DB3EA219DF
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_THREE(0.00)[3];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -3.51

On Tue, 08 Sep 2026 09:14:19 +0200,
Eirik Kvalheim wrote:
> 
> Hi,
> 
> Note up front: this report was researched and written by Claude Code (an AI
> coding agent) on my behalf, on my machine. I have read it, reproduced the
> behaviour and verified the fix myself, and I am happy to run any further tests
> or try patches.
> 
> The sticky-mixer heuristic disables the playback volume control on a Jabra
> Evolve2 30 SE, leaving the headset stuck at roughly -48 dB and effectively
> inaudible. This looks like the same shape as the SteelSeries Arctis Nova 5
> issue fixed in commit 0663d1df8d28 ("ALSA: usb-audio: Fix mixer regression on
> SteelSeries Arctis Nova 5").
> 
> Device:  0b0e:0e36  GN Netcom Jabra Evolve2 30 SE
> Kernel:  7.1.9-arch1-2 x86_64 (Arch Linux)
> 
> On every hotplug the driver logs:
> 
>   usb 3-6: 2:0: sticky mixer values (-12288/3072/1024 => 3072), disabling
>   usb 3-6: check MIXER_GET_CUR_BROKEN if you believe the mixer is non-sticky
> 
> and the volume control is then absent entirely:
> 
>   numid=7,iface=MIXER,name='Speaker Playback Switch'
>   (no 'Speaker Playback Volume')
> 
> -12288 in 1/256 dB units is -48 dB, so the headset's internal amplifier is
> pinned near minimum with no control left to raise it. Userspace volume at 100%
> is then just software gain into a nearly-muted amplifier, which is what the
> symptom sounds like. Note the third value in the triple differs run to run
> (3072, -12287, -1023, 1 across reboots), so the readback looks unstable rather
> than genuinely sticky.
> 
> Interestingly a cold boot with the headset already attached was unaffected,
> which masked this for a while - only hotplug/re-enumeration triggered it.
> 
> With the quirk applied:
> 
>   options snd-usb-audio quirk_flags=0b0e:0e36:MIXER_GET_CUR_BROKEN
> 
> the driver instead logs
> 
>   usb 3-6: 2:0: broken mixer GET_CUR (-12288/3072/1024 => 1)
> 
> the control comes back
> 
>   numid=8,iface=MIXER,name='Speaker Playback Volume'
> 
> and the headset behaves correctly. This has been verified across hotplug,
> simulated re-enumeration via the USB authorized toggle, and a clean reboot.
> 
> The quirk table currently has one Jabra entry (0b0e:0349, Jabra 550a,
> QUIRK_FLAG_CTL_MSG_DELAY_1M) and nothing for 0e36. Suggested addition, in the
> same form as the Arctis Nova 5 fix:
> 
> --- a/sound/usb/quirks.c
> +++ b/sound/usb/quirks.c
> @@
> + DEVICE_FLG(0x0b0e, 0x0e36, /* Jabra Evolve2 30 SE */
> +   QUIRK_FLAG_MIXER_GET_CUR_BROKEN),
> 
> I have not sent this as a formal patch because I did not want to add a
> Signed-off-by for work an agent drafted; if you would prefer it as a proper
> patch submission, say the word and I will send one under my own sign-off.
> 
> One small documentation note while I am here: Documentation (the ALSA
> configuration guide) describes bit 30 as "mixer_get_cur_ok" and the kernel's
> own log message points at MIXER_GET_CUR_BROKEN. The string the parser actually
> accepts is MIXER_GET_CUR_BROKEN - passing MIXER_GET_CUR_OK gives
> "snd_usb_audio: unknown flag MIXER_GET_CUR_OK while parsing param quirk_flags".
> The doc wording may be worth a look.
> 
> Thanks,
> Eirik Kvalheim

Could you check the behavior with 7.3-rc?  The too-strict behavior
should have been already relaxed and it should work as is.


thanks,

Takashi
