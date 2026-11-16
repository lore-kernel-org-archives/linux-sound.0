Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794840605;
	b=fRfWdjkkS3DxLAqeFe4G+9Po/CbNr7g5kadAY00phS6v/Ik0DWW/rVzSzBt/VJG35tG8
	 bg8ay4LSgD60wJDpIEx2tqFhk050eE2VSr4P7x0JfpoFFwCmaJ1tYFW8s8jT/3vw+R3mZ
	 pab685f3MxfomXm9fEoXX9g2Tp7p8GPgOKSNjuGz2uFzt3mb37FktzJ87JYOfmWlEmYYt
	 Ld25j6uaMBRbnHzifPKhPHEZBiggfiCY3A8BkJVv/lgnDWFA1msfD5Fq+JMUL2i3N0a2l
	 e6frQpkUpedrGHy0Ck1kOW37V5799rNFpjvp2G9iB89IRtHmMscNm7CGaYpwvl4uUBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794840605;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Rspamd-Queue-Id:X-Spam-Level:X-Rspamd-Server:X-Rspamd-Action:
	 X-Spam-Flag:X-Spamd-Result:X-Spam-Score;
	bh=fI0T0/EDAaXOCYdGQuzbd6IeJp0iPi6gIh9jBV6cF1Q=;
	b=qIiXuDszIDJ0w9t/KKV+aIKFvt3GFXc1NPzTW/fh536gsJcSt/AO4FpNyaXnErUvT1qU
	 OtKl3PBVgAuQuL/uS8hlxaDaDYKiOU/XOiEYTatbunABVI83RcQPM04dzUe2WPyy+rsx3
	 rGz3hUrz0RkIXJSOHI9zGE1dRYA8332aF4DXccsr+q2m/61a6p+SwvG9zbVKw6sCjQRjQ
	 ixP/KWGrI33qAQR89vfSVQf2vrJ4CpCZQ51zoNGC5XqjMo6m32A67ZlrOiyOT932/OW/s
	 bJnpczDf7wMbyIpxKaQYFh299wNT3x3lzRAs8P2UofOXlk+nSuqhAJ27f/bIuG/05ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=hMue060Q;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=RebwcN5h;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b="gwH6/YnB";
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=hOkpmEBn;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64DE1606A31C
	for <linux-sound@vger.kernel.org>; Mon, 16 Nov 2026 14:50:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64DE1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=hMue060Q;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=RebwcN5h;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=gwH6/YnB;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=hOkpmEBn
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 35E8022138;
	Mon, 16 Nov 2026 14:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794840603; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fI0T0/EDAaXOCYdGQuzbd6IeJp0iPi6gIh9jBV6cF1Q=;
	b=hMue060QRf/oadP5QVbBZPinX52LiGNdBB5uDsc4XpSpfPXzt6ipEFfQaMYkheLEeff1H/
	OC7RDgIvRSHvtj3hKF7+BthfctHEpP+qidZKRGHf2GEeqeRBkfV1w6DfuDIsqAl3MoZ5kf
	23K8inOmMRMWuyyA+FHtBh8sb+RpQHw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794840603;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fI0T0/EDAaXOCYdGQuzbd6IeJp0iPi6gIh9jBV6cF1Q=;
	b=RebwcN5hpoZfcZ58dCo99xE0ME7I0erAiQmNrvYQQDK9BOpVhUzSitVQPGU0xaz2QbYjIQ
	gcZoNIFW7MqUoVDA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="gwH6/YnB";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=hOkpmEBn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794840602; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fI0T0/EDAaXOCYdGQuzbd6IeJp0iPi6gIh9jBV6cF1Q=;
	b=gwH6/YnBemnLClsT1YtHr+y4/aM6JyxlYbm/dRMtQufumUsE12WqdYmShqo9gHWWjkGh+M
	ZvADwVfxSv+Fm4pHS4NT2cqu2Jl4mk+mWUWlTW5kZCpsJdmIO+dcrfqqlKOmjh4aK0pLgd
	qphG9iRdSp0NTEOzRdhnRaZlG4hEK8E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794840602;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fI0T0/EDAaXOCYdGQuzbd6IeJp0iPi6gIh9jBV6cF1Q=;
	b=hOkpmEBnIbEg9DaWdKg7OgAESl+x+8ys+vOgQdvrx4xzYM/hkI6ocUMHKQbFy19cI/PUrA
	8jWAo5eiwzLOoFBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E888F1334C;
	Mon, 16 Nov 2026 14:50:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id S15NLxkY+2pvAgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 16 Nov 2026 14:50:01 +0000
Date: Mon, 16 Nov 2026 15:50:01 +0100
Message-ID: <87mrr8ygo6.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Alexander Toth <alexandertoth96@gmail.com>
Cc: linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Subject: Re: ALSA: usb-audio: lowlatency playback runs 25% slow, no xrun (Scarlett 2i2)
In-Reply-To: <avhyadCiNUguBI-P@xhanost>
References: <avhyadCiNUguBI-P@xhanost>
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
X-Rspamd-Queue-Id: 35E8022138
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-12.51 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -12.51

On Sat, 14 Nov 2026 15:38:33 +0100,
Alexander Toth wrote:
> 
> Hi,
> 
> On a Focusrite Scarlett 2i2 3rd Gen (1235:8210), playback with
> lowlatency=1 (the default) and a two-period ring runs at about 75% of
> the nominal rate when the application does some work between
> snd_pcm_wait() and snd_pcm_writei(). No xrun is reported; hw_ptr just
> advances slower than real time. With lowlatency=0 every case runs at
> the full rate.
> 
> Setup: S32_LE, 2 ch, 48 kHz on hw:CARD=USB,DEV=0 (EP 0x01 OUT, sync
> type SYNC, 125 us packets). Kernel 6.14.0-24-generic (Ubuntu 24.04),
> alsa-lib 1.2.9.
> 
> The test loop is: snd_pcm_wait() for a free period, busy-wait N us,
> then write one period of silence. The rate is frames written minus
> snd_pcm_delay(), over 5 s. Frames consumed per second:
> 
>   period x n    work    lowlatency=1   lowlatency=0
>   128 x 2       0 us       47,999         47,999
>   128 x 2     300 us       36,159         47,997
>   128 x 2    1500 us       36,569         47,999
>   128 x 3     300 us       48,002         47,999
>   256 x 2     300 us       41,090         47,999
>   512 x 2     300 us       48,010         47,999
> 
> Other observations:
> - SCHED_RR priority 20 doesn't help, so it isn't late wakeups.
> - Writing the previous period first and computing afterwards holds 48k.
> - The loss doesn't scale with the work: a run is either at 48k or at
>   about 36k (one period in four lost). Near 50 us, runs flip between
>   the two.
> - At 128x2, delay is 510 frames with lowlatency=1 and 512 with
>   lowlatency=0, so low-latency mode gains nothing on this card.
> 
> From reading sound/usb in v6.14 (not traced): snd_usb_pcm_playback_ack()
> only queues pending output URBs when !ep->active_mask. If the write
> lands after one URB has completed short of data but while the other is
> still in flight, the new data waits for a whole URB. With two URBs per
> ring the stream loses time, but submitted_urbs never reaches zero, so
> notify_xrun() never fires. Is it intended that ack only queues URBs
> when none are in flight?
> 
> I'm happy to test a patch or collect traces. The reproducer is a short
> alsa-lib program, and I can send it if it helps.
> 
> This was investigated with Claude Code (Anthropic's Claude Opus 5.5
> model). It ran the measurements, wrote the test program, read the
> sound/usb source and drafted this mail. I steered and approved each
> step, ran the lowlatency=0 tests myself and reviewed this mail before
> sending it. No fix has been written, no trace taken, and only this one
> device has been tested.

Thanks for the report.  While the numbers sound interesting, let's see
whether we're looking at the right things.

First off, the low-latency mode doesn't mean that it'll give lower
latency at the wakeup.  It's for avoiding the latency at the stream
start.  Only speaking about the wake-up timing, the non-low-latency
mode is even better.

For the playback in the traditional (non-low-latency) mode, the driver
submits URBs of silent data already at the PCM prepare phase before
actually starting the playback.  When the playback is triggered, then
the driver starts submitting the URBs with the actual audio data.
That is, for small period buffer cases like the above, almost a full
buffer will be the latency *before* starting the first sample.

This behavior is to align with the implicit feedback mode that needs
the capture packet to be fed to the playback.  Also, this makes the
wakeup timing easier; because the stream has been already running, the
queued URB will return exactly after the given samples have been
actually fed to the hardware.  Since the driver processes the
period-elapsed procedure at each URB complete callback, the timing to
call the period-elapsed is fairly close to the finish of the audio
period.

OTOH, in the low-latency mode, the URB submissions starts at the very
start of the playback.  For a configuration with small period and
buffer, it means that the driver may get the URB complete callbacks
immediately right after submission (they are on hardware queue).
In the API level, this already allows user-space to fill further audio
data, hence it returns.  But the actual audio playback is far behind
it, hence the delay is reported much higher.  Depending on the
application, this difference might be a problem, indeed.  But for
normal applications like PipeWire or such that does manage the timing
to fill up by itself, the reduction of the start-up latency would be a
bigger win.  Also, for an engine like JACK, this wouldn't matter much,
as it's also just filling up the next period when available.

So, the whole results depend on what you're seeing and asking for.

Of course, there can be any driver code bugs and logic failures, too.
In that case, I'd happily correct the flaw.  Please investigate
further and report back.


thanks,

Takashi
