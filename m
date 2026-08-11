Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC8337C903
	for <linux-sound@vger.kernel.org>; Tue, 11 Aug 2026 06:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786428572; cv=none; b=cGI68mI9+1IaBkfHDacnmhqgs6asIZUgCnvCqdI5/c/kHekc7/7tTJZboi/MTv60dm0TZF6VVn13Ve0J8WQMEsg7Je6QvDRg9nPthzqnDrY/fbeLT+gtSBUZ4U6YXqARNslxclQYPbukpWohEk0htIBqFnnmPZruSgXFsBe8JM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786428572; c=relaxed/simple;
	bh=xVoY/Kou9m+IdGZVU1C6aN/l9BasvkanRe2a0lCeI6E=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FQr4lAleR9k08Ej6dS4v+ZHCYpCUa8MThMcKSxclMQIqXnpwgN+1nePojMVmHoBud+9N5TAMiWmIrLQ+RLsNcEpcqCNJF3fU3JxUwSx9l5+2gfHXzMhAaN3Caepwrr5K28kFrIHjizWHwkrJTL+BqHlRShgwAwlGrksdjXb7IRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=q4SDhoN5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=zWAgz6QN; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ZVkSTJv8; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=aMZpJGJk; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="q4SDhoN5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zWAgz6QN";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZVkSTJv8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="aMZpJGJk"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 233228188F;
	Tue, 11 Aug 2026 06:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786428565; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=u9vR8ts62dQ3+6eAJC+w2fYrd0f1EFeutu6TFq9n0d8=;
	b=q4SDhoN5v5Qz1o83iuT2SvF1VBPfiKbd8tZq0uKSb+z8+kWSQr1om72fxu8QVf3LUUjFou
	hizOZtQLQCjnp8KhnYdPlqelT8IBrqo2AKbXFkGYogegmo3zS+4QLN5wiwD+VaoYv3S9P1
	3cf96vy0EWaf2u01Ht4DpCkqkPCKcEQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786428565;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=u9vR8ts62dQ3+6eAJC+w2fYrd0f1EFeutu6TFq9n0d8=;
	b=zWAgz6QNgZ5PJE1ZlYwn2QXDTFqWW9FSKlTXpdrXctMQVmsAno2Zsyjd6fxsG+0szZ2hUl
	WoP0M3q1FW84DnCA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786428561; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=u9vR8ts62dQ3+6eAJC+w2fYrd0f1EFeutu6TFq9n0d8=;
	b=ZVkSTJv8VjupkPAKkN2bdiXki8ctNaz9SA31gPqcP/h7UcrqHNLgL3NoanSB1L2yeoWMDn
	fHb/lIL2xs7X2K5OFuIZ3cqeeeD6bEwrDKQlmvRzPwkjlYClV3ifGPBZmblONMGp4PJVZn
	PAGHYMTl6rZ8rZElHme3vPygkiWoVAE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786428561;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=u9vR8ts62dQ3+6eAJC+w2fYrd0f1EFeutu6TFq9n0d8=;
	b=aMZpJGJkmJsMPYPdcustazz8ZFYU+TnvoWHp22Dsa4c7GQNR80RGNdiD9DJoS22rp2Fonj
	V7SPqVPba/AQJdBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F0654779B2;
	Tue, 11 Aug 2026 06:09:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id nX9rOZC8empVOgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 11 Aug 2026 06:09:20 +0000
Date: Tue, 11 Aug 2026 08:09:20 +0200
Message-ID: <87h5l1b33j.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Neil Andrews <neil@androos.io>
Cc: linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz
Subject: Re: [BUG] snd-usb-audio: Audient iD14 (2708:0008) 20 dB channel imbalance
In-Reply-To: <0102019fed22f9d3-fa294ec5-02f1-4fd3-b3fa-76efc14331cc-000000@eu-west-1.amazonses.com>
References: <0102019fed22f9d3-fa294ec5-02f1-4fd3-b3fa-76efc14331cc-000000@eu-west-1.amazonses.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]

On Mon, 10 Aug 2026 21:25:20 +0200,
Neil Andrews wrote:
> 
> Hi,
> 
> On an Audient iD14 (USB 2708:0008), snd-usb-audio exposes a mixer control
> "Speaker Playback Volume" that covers only 4 of the device's 6 playback
> channels, and does not cover PCM channel 0. Userspace (PipeWire, PulseAudio)
> adopts it as the card's hardware playback volume, so any setting below 100%
> attenuates some channels but not others. At a typical 80% setting the
> inter-channel imbalance is 20 dB. The device is balanced under Windows, where
> the vendor driver does not drive this control.
> 
> Not a regression: I diagnosed it on kernel 6.19.14 and re-measured on 
> 7.1.6 with identical results.
> 
> System:
>   Kernel:        7.1.6-1-cachyos (CachyOS)
>   alsa-lib:      1.2.16.1, alsa-utils 1.2.16
>   PipeWire:      1.6.8, WirePlumber 0.5.15
>   Device:        Audient iD14, USB 2708:0008, bcdDevice 1.11
> 
> The control, against a playback stream that is 6 channels
> (Channels: 6, Channel map: FL FR FC LFE RL RR):
> 
>   numid=11,iface=MIXER,name='Speaker Playback Volume'
>     ; type=INTEGER,access=rw---R--,values=4,min=0,max=127,step=0
>     : values=107,107,107,107
>     | dBminmax-min=-127.00dB,max=0.00dB
> 
> The driver records the partial coverage itself (from alsa-info):
> 
>   Unit: 12
>     Control: name="Speaker Playback Volume", index=0
>     Info: id=12, control=2, cmask=0xf, channels=4, type="S16"
> 
> Descriptor origin. FEATURE_UNIT bUnitID=12 advertises Volume on only 4 of its
> 6 logical channels:
> 
>   bmaControls(0)     0x00000000
>   bmaControls(1..4)  0x0000000c   Volume Control (read/write)
>   bmaControls(5)     0x00000000
>   bmaControls(6)     0x00000000
> 
> FU 12 is also not in the direct playback path. USB streaming input to Speaker
> output runs:
> 
>   INPUT_TERMINAL 2 (USB Streaming, 6ch)
>     -> EXTENSION_UNIT 51 (6ch)
>     -> FEATURE_UNIT 10 (6ch, bmaControls(0..6) all 0x00000000, no controls)
>     -> OUTPUT_TERMINAL 20 (0x0301 Speaker)
> 
> whereas FU 12 sits on the monitor-mixer branch:
> 
>   EXTENSION_UNIT 50 (16ch) -> MIXER_UNIT 60 (6ch) -> FEATURE_UNIT 12
>     -> EXTENSION_UNIT 54 (6ch) / EXTENSION_UNIT 55 (3ch)
>     -> back into EXTENSION_UNIT 51 and 52
> 
> So FU 12 is traced through to the Speaker output terminal and named
> "Speaker Playback Volume", but it is a partial-coverage control on a mixer
> branch rather than a master volume for the stream. Consistent with that, the
> measured coverage does not match a naive reading of cmask=0xf (logical
> channels 1-4): it is PCM channel 0 that escapes attenuation and PCM channel 1
> that receives it.
> 
> Measurements. The iD14 loops output channels 0 and 1 back onto capture
> channels 10 and 11. I played 6-channel S32_LE WAVs carrying a -12 dBFS sine in
> exactly one channel, straight to hw: with the card profile set to off so
> PipeWire was out of the path, and recorded all 12 capture channels. The two
> files are bit-identical in amplitude and differ only in which channel carries
> the tone.
> 
>   Speaker Playback Volume = 107/127 (-20.00 dB):
>     output ch0 -> loopback ch10   RMS -15.89 dBFS
>     output ch1 -> loopback ch11   RMS -35.89 dBFS
>     delta: 20.00 dB
> 
>   Speaker Playback Volume = 127/127 (0.00 dB):
>     output ch0 -> loopback ch10   RMS -15.89 dBFS
>     output ch1 -> loopback ch11   RMS -15.89 dBFS
>     delta: 0.00 dB
> 
> The delta tracks the control's own dB value exactly. PCM channel 0 is
> unaffected at either setting; PCM channel 1 is attenuated by precisely the
> amount the control reports. Output channels 2-5 are not carried on the
> loopback, so I could not measure them. Those four figures came out the same on
> 6.19.14 and 7.1.6.
> 
> Workaround. Setting api.alsa.soft-mixer = true for the device in WirePlumber,
> so PipeWire does volume in software and leaves the control at 0 dB, fixes it
> completely. That also requires the ALSA state saved at 0 dB, or alsa-restore
> reinstates the attenuation at the next boot and soft-mixer leaves it there.
> 
> Suggested fix. Ignoring the unit via sound/usb/mixer_maps.c looks like the
> minimal change, so no hardware volume control is exported and userspace falls
> back to software volume:
> 
>   /* Audient iD14: FU 12 advertises Volume on only 4 of 6 logical channels and
>    * sits on the monitor-mixer branch, but is traced to the Speaker output
>    * terminal and adopted by userspace as the stream's hardware volume,
>    * producing a large inter-channel imbalance. Ignore it.
>    */
>   static const struct usbmix_name_map audient_id14_map[] = {
>        { 12, NULL },
>        { 0 }
>   };
> 
> and in usbmix_ctl_maps[]:
> 
>   {
>        .id = USB_ID(0x2708, 0x0008),
>        .map = audient_id14_map,
>   },
> 
> Untested, and you may prefer a different approach - such as declining to
> export any feature unit whose channel coverage is narrower than the stream it
> is attached to, which would presumably help other interfaces with the same
> descriptor shape. Happy to test patches; I have the device and a measurement
> rig that gives an objective pass/fail in about thirty seconds.

It's fine to skip the volume if it actually improves -- so please test
it ;)

Judging from your description, an alternative with keeping the volume
control would be to just rename it; the problem is that it's tied with
"Speaker".  You can name it a different, some non-standard one,
instead, too.


thanks,

Takashi
