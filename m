Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 578CA2727F3
	for <linux-sound@vger.kernel.org>; Mon,  2 Feb 2026 10:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770026412; cv=none; b=thx46B3nV651xhBKNL2FwbU8BSn3v9qBVE1NCYvD/4wn1jDvDqaPPydddPTxeVzz5+PWP6ki3ZQOQ96UULIhpI32/VWvaW3fHTxLs+y9XmYE/Fu71Ko0wOGRwuRuCvmu2FJlZZHYJUSU3NXCZCxcE5dt8ynqdtGycDgxmX5EliY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770026412; c=relaxed/simple;
	bh=VVvzN5U0pGB46vyCroUr8TO7KEPMpwKHnKjP2iuKjp4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FqTacnxaiMgSLDDZ2xyP8kFgJKqmujo2XhLFM1A+XTVsNqe7bAa3SBuSzCp2QJM6N3S+1JgO3abKA+S0szi7OKB7C7ha12XRXxgikC6ebFhze8h8ccEwiqMEwpAzE7y8xP3QuwfR0me64gjieciT+9D3yWTvGxR2XcPJYPtUo0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=V27/VSBG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=LPOGM6Q8; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=f9Bt0Dd5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=zUbUFp9Q; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="V27/VSBG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LPOGM6Q8";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="f9Bt0Dd5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zUbUFp9Q"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 96E3D5BD64;
	Mon,  2 Feb 2026 10:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1770026403; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fvLN3N0TlD0Lah9jE23TCz283M2/KGWaPRSsOcz1yv8=;
	b=V27/VSBGeQWsK/kfYOkwu1of+GDubz3FcSDC07eEkE8phEGQB/F5V1nk0O9DUV2Q10MoTl
	gMowtLLsLNeiiCcJP+ySme8nKH0JwLOyZgrWKbrHwn+q04tcGJwNAJniF46VXcIYQc0UCD
	SBjxT31rmPix+8jeJNHaVzwysAqHIMw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1770026403;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fvLN3N0TlD0Lah9jE23TCz283M2/KGWaPRSsOcz1yv8=;
	b=LPOGM6Q8M4FwKIK04tflYzchgFv2Iiw9hLXwzzUUM8gG3tTv5OQRGd7NB3jtOL3N7q0I6K
	8WW0BuASoG2dQAAA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=f9Bt0Dd5;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=zUbUFp9Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1770026402; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fvLN3N0TlD0Lah9jE23TCz283M2/KGWaPRSsOcz1yv8=;
	b=f9Bt0Dd5+ZXMiKzPc9ELdYYZpMA0jUKK7P/3tLTCNyUeLOYkYIvOVKMf59LTGlGxrn5qXW
	5eV1QzSvNG33hAJFnr7w4c8Kvuxx3YfFeOhYZqz/cMpXD8BQZ4NZlb0fSL+L7Wg/p5ct2S
	rHskxVujkAszI88btCnaremyqOzxHl8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1770026402;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fvLN3N0TlD0Lah9jE23TCz283M2/KGWaPRSsOcz1yv8=;
	b=zUbUFp9Qxkddvt4onAclK+ozPfdT6ehdOv3BPIuqMkqw3rPnpuvsWb7iYIDL6pA9MidSpV
	YQwEILihfruR+ADQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 644703EA62;
	Mon,  2 Feb 2026 10:00:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id hZQ8F6J1gGkbLgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 02 Feb 2026 10:00:02 +0000
Date: Mon, 02 Feb 2026 11:00:01 +0100
Message-ID: <87o6m71n4u.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Samuel Dionne-Riel <samuel@dionne-riel.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] ALSA: hda/realtek: Add quirk for Minisforum V3 SE
In-Reply-To: <20260201231216.1655154-3-samuel@dionne-riel.com>
References: <20260201231216.1655154-1-samuel@dionne-riel.com>
	<20260201231216.1655154-3-samuel@dionne-riel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-2022-JP
X-Spam-Score: -3.51
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 96E3D5BD64
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

On Mon, 02 Feb 2026 00:12:15 +0100,
Samuel Dionne-Riel wrote:
> 
> This likely will apply for the Minisforum V3, though there isn't a lot
> of information to confirm whether or not the identifiers are the same.
> 
> The Minisforum V3 is likely to benefit from the same fix, as it exhibits
> similar symptoms. Though users reportedly work around it by forcing the
> software mixer.
> 
> This was verified on the Minisforum V3 SE, and the root cause (the bass
> speakers routing) was found out by using pink noise, and playing with
> the mixers.
> 
> Signed-off-by: Samuel Dionne-Riel <samuel@dionne-riel.com>
> 
> ---
> 
> For posterity, and hoping it helps someone else in the future, here's
> the breadcrumbs I followed to get to this fix.
> 
> (Stopping other software, like Wireplumber, is needed here.)
> 
> The following command was used for the pink noise:
> 
>     speaker-test -Dhw:1,0 -c2
> 
> By using `alsamixer -c1`, muting either of the "Speaker" or "Bass
> Speaker" channels showed that the speakers were indeed separate. On the
> side of the device, there are two speaker grills next to each other, and
> by moving an obstacle in front clearly shows the channels are
> independent.
> 
> This differs from the “well-known” wisdom, where it is assumed the
> speaker can't be controlled with the mixer. To be fair, software like
> Wireplumber will mute the Bass Speaker in sync with the main Speaker,
> which makes it seem like there is no control at all.
> 
> Knowing this fact, finding plausible fixes in the sound stack pointed at
> the kernel driver being responsible for tying controls to the outputs.
> And after fighting with some of the tooling, finding out that the
> necessary knowledge is found in /proc/asound/card1/codec#0 in a quite
> usable format unblocked me.
> 
> As a final hint, selecting an output using `hda-verb` uses the following
> form:
> 
>    hda-verb /dev/snd/hwC1D0 $NODE SET_CONNECT_SEL $INDEX
> 
> Where `$NODE` is the node identifier found under
> `/proc/asound/card1/codec#0`, and `$INDEX` is the index of the desired
> DAC connection under `Connection:` in the same `/proc` file.
> 
> For my particular system, the `$NODE` is `0x17`, and the DAC can be
> either `0` or `1`, as `0x06` is the DAC without volume control, and
> `0x08` is an input.
> 
>     ~ $ cat /proc/asound/card1/codec#0 | grep -A15 '^Node 0x17'
>     Node 0x17 [Pin Complex] wcaps 0x40058d: Stereo Amp-Out
>       Control: name="Bass Speaker Playback Switch", index=0, device=0
>         ControlAmp: chs=3, dir=Out, idx=0, ofs=0
>       Amp-Out caps: ofs=0x00, nsteps=0x00, stepsize=0x00, mute=1
>       Amp-Out vals:  [0x80 0x80]
>       Pincap 0x0000001c: OUT HP Detect
>       Pin Default 0x90170120: [Fixed] Speaker at Int N/A
>         Conn = Analog, Color = Unknown
>         DefAssociation = 0x2, Sequence = 0x0
>         Misc = NO_PRESENCE
>       Pin-ctls: 0x40: OUT
>       Unsolicited: tag=00, enabled=0
>       Power states:  D0 D1 D2 D3 EPSS
>       Power: setting=D0, actual=D0
>       Connection: 4
>          0x02 0x03 0x06* 0x08
> 
>     ~ $ cat /proc/asound/card1/codec#0 | grep '^Node 0x0[2368]'
>     Node 0x02 [Audio Output] wcaps 0x41d: Stereo Amp-Out
>     Node 0x03 [Audio Output] wcaps 0x41d: Stereo Amp-Out
>     Node 0x06 [Audio Output] wcaps 0x411: Stereo
>     Node 0x08 [Audio Input] wcaps 0x10051b: Stereo Amp-In
> 
> Signed-off-by: Samuel Dionne-Riel <samuel@dionne-riel.com>
> ---
>  sound/hda/codecs/realtek/alc269.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
> index 5d38e371a6836..bcac3e9f106ca 100644
> --- a/sound/hda/codecs/realtek/alc269.c
> +++ b/sound/hda/codecs/realtek/alc269.c
> @@ -7370,6 +7370,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
>  	SND_PCI_QUIRK(0xf111, 0x0009, "Framework Laptop", ALC295_FIXUP_FRAMEWORK_LAPTOP_MIC_NO_PRESENCE),
>  	SND_PCI_QUIRK(0xf111, 0x000b, "Framework Laptop", ALC295_FIXUP_FRAMEWORK_LAPTOP_MIC_NO_PRESENCE),
>  	SND_PCI_QUIRK(0xf111, 0x000c, "Framework Laptop", ALC295_FIXUP_FRAMEWORK_LAPTOP_MIC_NO_PRESENCE),
> +	SND_PCI_QUIRK(0x1f4c, 0xe001, "Minisforum V3 (SE)", ALC245_FIXUP_BASS_HP_DAC),

The table is sorted in PCI SSID order.  Please put at the appropriate
position.


thanks,

Takashi
