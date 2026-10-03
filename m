Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA783AE1A8
	for <linux-sound@vger.kernel.org>; Sat,  3 Oct 2026 09:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791018839; cv=none; b=D62UXHd6TDiv+5zw0X+u2wKf4mQhJaNE9IQ6eBvyiSwNFNgGSj/yYhf59V5LZ6VNKD4Je+H34MbOCjRhDoegtJHPmIiQ3pmdQnchFe366MjMGJKKylKghtIs7/b7J0JyrPIEqEYj25iQt/i2FKzXXvOzvA3VQ/QLwPKGFyoQ8D8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791018839; c=relaxed/simple;
	bh=b27L2EOW8aFwaqhgaW1jn78rQ/owSReniNuQKXqnurk=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jDsMb0BVvSoc5Hx0M9wi4q+9czAqwX35BGNmN9kOBGCPJmrrho7K0Ir7RxZj8XzQSsP6dDrCciZdM+hCjCzcTELEQdpxygfcIPTXOJv4VRhT6kB1vCdnyX9qNSz0j8jzMJUErgi4QP/m/5jX+G5NNQwooZPzh6yTU4bkLERzHzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=omghDiEN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=sXm32pOj; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=nwpeAx1u; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=tDFpwS8g; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="omghDiEN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="sXm32pOj";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="nwpeAx1u";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="tDFpwS8g"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1C0AA1FECF;
	Sat,  3 Oct 2026 09:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791018830; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vkQM2a1VxWx72Lxa+FuMrOwZwdGkiPsVWJDJw9ACcLg=;
	b=omghDiENE2RzsQHfEszna109sEiTmpR2yoi1lTzwUSciKH58Q1mdWtjk8i3AuhPozN2MQt
	uLDguUwOevt65HxItel17NF5vUu7iKGOzbDRuyyyPHQGynfl9zxnqj25tNJaaTGz4AEo3Y
	R6ipm5s7QK7XyZWs///XWa49J2BzT+k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791018830;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vkQM2a1VxWx72Lxa+FuMrOwZwdGkiPsVWJDJw9ACcLg=;
	b=sXm32pOjnYcoHMSeNcKjDv7DNJBva/w63z17hyP61tsA3KzHF+6iy9a21/2gAhOS8jM/Kd
	1Mqa7y5FRUXNQnDg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=nwpeAx1u;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=tDFpwS8g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791018826; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vkQM2a1VxWx72Lxa+FuMrOwZwdGkiPsVWJDJw9ACcLg=;
	b=nwpeAx1uE3ucCSnj2TLz79YtxYSy2XR4rKBgSs3r0MwBtvmFIvOayUY8CkESqPeQPXChKO
	xMYclefvvBUuTewwTXujydeQEbCC7+fQ0O89qo0Nynccrrqt1IR60BX09kwnFdd+IVboVl
	yRd8vM9jqpoHJZPcwjbBo96IgeCIdrY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791018826;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vkQM2a1VxWx72Lxa+FuMrOwZwdGkiPsVWJDJw9ACcLg=;
	b=tDFpwS8g97si6mgjWTTqMu9Sqc9/CEj2AzRsah4vEeVZDGzlojQpFza8ta/jEoMBeuwUX5
	oWohGnf9iUHfCeDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A75E713712;
	Sat,  3 Oct 2026 09:13:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id gr1cHknHwGrOIQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 03 Oct 2026 09:13:45 +0000
Date: Sat, 03 Oct 2026 11:13:45 +0200
Message-ID: <87mrsvxi2e.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Vadym S <0xsheff@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org
Subject: Re: [BUG] ALSA: usb-audio: Shanling UP4 (0a12:1244) silent at 44.1 kHz due to MaxPacketsOnly
In-Reply-To: <CAPHAwzdUNRbZjBQuYKLf18EK_QGq0gR6Vx3YMZ=ffYKBogUtLA@mail.gmail.com>
References: <CAPHAwzdUNRbZjBQuYKLf18EK_QGq0gR6Vx3YMZ=ffYKBogUtLA@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 1C0AA1FECF
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 

On Fri, 02 Oct 2026 11:17:51 +0200,
Vadym S wrote:
> 
> 
> Hello,
> 
> The Shanling UP4 (Bluetooth DAC/amp with a USB DAC mode; CSR-based,
> USB ID 0a12:1244, UAC1, full speed, S16_LE, 44100/48000 Hz) outputs
> silence at 44.1 kHz on Linux, while 48 kHz works. On Windows the same
> unit plays fine with the default format set to 16 bit / 44100 Hz.
> 
> The cause appears to be the MaxPacketsOnly bit in the class-specific
> AS isochronous endpoint descriptor (bmAttributes 0x81). snd-usb-audio
> maps it to UAC_EP_CS_ATTR_FILL_MAX, so next_packet_size() always
> returns maxframesize: wMaxPacketSize 192 / 4 bytes = 48 frames per
> 1 ms packet, whatever rate is selected. At 44.1 kHz the device gets
> 48 frames per packet instead of the nominal 44/45 and plays nothing.
> 
> Measurement with plain ALSA (PipeWire not involved): a 4-second
> S16_LE stereo tone played with `aplay -D hw:UP4,0`, hw_ptr sampled
> from /proc/asound/UP4/pcm0p/sub0/status over 2 seconds:
> 
>   rate     hw_ptr advance    wall time for 4 s of audio
>   48000    47991 frames/s    4.01 s
>   44100    48030 frames/s    3.68 s
> 
> /proc/asound/UP4/stream0 while streaming at 44.1 kHz also shows the
> full packet size:
> 
>   Status: Running
>     Interface = 1
>     Altset = 1
>     Packet Size = 192
>     Momentary freq = 44100 Hz (0x2c.199a)
> 
> Listening tests (through PipeWire): 48 kHz is audible, 44.1 kHz is
> silent, reproducible. There are no errors in dmesg; setting the rate
> works (no "cannot set freq" messages).
> 
> This looks like the MOTU MicroBook IIc case (07fd:0004), which already
> clears FILL_MAX in snd_usb_audioformat_attributes_quirk(). Possibly
> related: the disabled Nura entry (0a12:1243) in quirks-table.h says
> "only the 48 kHz sample rate works for the playback interface" and
> sets FILL_MAX as well; that may be the same effect rather than a
> hardware limit. I can't verify this, I don't have that device.
> 
> As 0a12:xxxx IDs are CSR defaults that other products may share (cf.
> commit 5ebf6b1e4596, bugzilla 199905), note that the change below has
> no effect at 48 kHz: with wMaxPacketSize = 192 and 16-bit stereo,
> packsize[0] = packsize[1] = maxframesize = 48 frames, so the packets
> are identical with or without FILL_MAX. A device with the same ID that
> only works at 48 kHz would not be affected; only lower rates change.
> 
> Suggested change (untested on my side so far):
> 
> diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
> --- a/sound/usb/quirks.c
> +++ b/sound/usb/quirks.c
> @@ -2366,6 +2366,14 @@ void snd_usb_audioformat_attributes_quirk(struct
> snd_usb_audio *chip,
>   */
>   fp->attributes &= ~UAC_EP_CS_ATTR_FILL_MAX;
>   break;
> + case USB_ID(0x0a12, 0x1244):  /* Shanling UP4 */
> + /*
> + * MaxPacketsOnly is set, but the device expects nominal-size
> + * packets. Filling 48 frames per packet at 44.1 kHz results
> + * in silence. No effect at 48 kHz, where both sizes match.
> + */
> + fp->attributes &= ~UAC_EP_CS_ATTR_FILL_MAX;
> + break;
>   case USB_ID(0x1224, 0x2a25):  /* Jieli Technology USB PHY 2.0 */
>   /* mic works only when ep packet size is set to wMaxPacketSize */
>   fp->attributes |= UAC_EP_CS_ATTR_FILL_MAX;
> 
> Environment: Ubuntu 26.04, kernel 7.0.0-34-generic, PipeWire 1.6.2.
> Checked tiwai/sound.git for-next at b61a2369085f (2026-10-02): there
> is no entry for 0a12:1244 yet.

If the above change actually works for your device, it's fine to
apply.  Could you submit a proper patch for upstream?


thanks,

Takashi
