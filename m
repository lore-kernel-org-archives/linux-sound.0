Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C38018665E
	for <linux-sound@vger.kernel.org>; Thu,  1 Feb 2024 14:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706797639; cv=none; b=YHKCeRiypeq1R8+7Wtd2OgyPzWt69D47H1VyVmWTTPoQvTMRgmR7HEiG7R4hWa3laoa0ItjikvTwzoDU2OP8gFSV5tBKQK2aew8199laUca828V9BacrFhCvsOGUHF9JFKJH8ByzxOhKKKECH0l7HnuLyO1bEIa/H2gFaeS9vMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706797639; c=relaxed/simple;
	bh=Fe9UQfEggsnOs+3YIncuqaa5Wxqy2ZMz/nyaakVEG1A=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JPogsUAFNrXB+5VyHeARuL+yW4AxVng6/ejEQHe72MSFUXxzJyzzWwdhF+HDZOji2kkc+cq4ty/11L8bdj52XecfgL/kx6945aWhE5Fb8+XBny4fYwteuTOnB8usFmL1I7vQVfZQoTF1tml4rs+Z4sSKQ/i3SYTvzTUzmu/nOq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=U/4Rp45H; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3LXiIE2y; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=NjxcaULI; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=A8JCbF56; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="U/4Rp45H";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3LXiIE2y";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NjxcaULI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="A8JCbF56"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id DC1E91FBB3;
	Thu,  1 Feb 2024 14:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1706797635; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n1uXP3mGdz6A3teYkkXBd909669EOB+li8akYK/XwSI=;
	b=U/4Rp45HXaNcVwK3voGqnT0uvX0rJT596esL7GSbvRvX8DSlg8kmgeRnduoybDE/qQt5f+
	rKmwYurUvI+Bpmtq9nvEKiX0uC13BZjpGcFzZ20KnsDv3AnPheu3XFQ8M+KZrFH30msV7C
	8xeH5jeiJ6OL0jOmvvoxEz768swp5yU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1706797635;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n1uXP3mGdz6A3teYkkXBd909669EOB+li8akYK/XwSI=;
	b=3LXiIE2yEigUmVPhAaCurW85kNCDGmko38XFoGsxx3VLFn7gGU8WvAbgt5i9PGg/3xt8y9
	5/Px2QBK5JADzIDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1706797634; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n1uXP3mGdz6A3teYkkXBd909669EOB+li8akYK/XwSI=;
	b=NjxcaULIMVCAlCpWuCffkmIjPSBcQ4oi+xccMdr5Jf2ivTz1fjtES7LS/BlnAP5A7ZEszn
	zotIT9sTx7jYvNLSRjfqK8s0KMATM7lb80HhWMVdIsds1xu+5H4bjp5QyL15JiBUaa4yfa
	h5OtfO5lwiOSweueTTBrR8Fax4O/zpc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1706797634;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n1uXP3mGdz6A3teYkkXBd909669EOB+li8akYK/XwSI=;
	b=A8JCbF565fZ9wNGLm+0/YmHkggOYiYZkIxpPmK3RxC0Vds5G5a4H4uGQDCPv/tf8wHdB8n
	/PZlDhRJdmYmbVAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A842C13672;
	Thu,  1 Feb 2024 14:27:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +Y/xJ0Kqu2VVVAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 01 Feb 2024 14:27:14 +0000
Date: Thu, 01 Feb 2024 15:27:14 +0100
Message-ID: <877cjoz2d9.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Alexander Tsoy <alexander@tsoy.me>
Cc: linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org,
	Takashi Iwai
	 <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH] ALSA: usb-audio: Ignore clock selector errors for single connection
In-Reply-To: <63f56132a10263e29a7b667225a756e3ed4223dd.camel@tsoy.me>
References: <20240201115308.17838-1-alexander@tsoy.me>
	<87le84z6t8.wl-tiwai@suse.de>
	<63f56132a10263e29a7b667225a756e3ed4223dd.camel@tsoy.me>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 TO_DN_SOME(0.00)[];
	 RCPT_COUNT_FIVE(0.00)[5];
	 RCVD_COUNT_THREE(0.00)[3];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 BAYES_HAM(-3.00)[100.00%];
	 ARC_NA(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 MIME_GOOD(-0.10)[text/plain];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO

On Thu, 01 Feb 2024 15:12:51 +0100,
Alexander Tsoy wrote:
> 
> ÷ þÔ, 01/02/2024 × 13:51 +0100, Takashi Iwai ÐÉÛÅÔ:
> > On Thu, 01 Feb 2024 12:53:08 +0100,
> > Alexander Tsoy wrote:
> > > 
> > > For devices with multiple clock sources connected to a selector, we
> > > need
> > > to check what a clock selector control request has returned. This
> > > is
> > > needed to ensure that a requested clock source is indeed selected
> > > and for
> > > autoclock feature to work.
> > > 
> > > For devices with single clock source connected, if we get an error
> > > there
> > > is nothing else we can do about it. We can't skip clock selector
> > > setup as
> > > it is required by some devices. So lets just ignore error in this
> > > case.
> > > 
> > > This should fix various buggy Mackie devices:
> > > 
> > > [š 649.109785] usb 1-1.3: parse_audio_format_rates_v2v3(): unable
> > > to find clock source (clock -32)
> > > [š 649.111946] usb 1-1.3: parse_audio_format_rates_v2v3(): unable
> > > to find clock source (clock -32)
> > > [š 649.113822] usb 1-1.3: parse_audio_format_rates_v2v3(): unable
> > > to find clock source (clock -32)
> > > 
> > > There is also interesting info from the Windows documentation [1]
> > > (this
> > > is probably why manufacturers dont't even test this feature):
> > > 
> > > "The USB Audio 2.0 driver doesn't support clock selection. The
> > > driver
> > > uses the Clock Source Entity, which is selected by default and
> > > never
> > > issues a Clock Selector Control SET CUR request."
> > > 
> > > Link:
> > > https://learn.microsoft.com/en-us/windows-hardware/drivers/audio/usb-2-0-audio-drivers
> > > š[1]
> > > Link: https://bugzilla.kernel.org/show_bug.cgi?id=217314
> > > Link: https://bugzilla.kernel.org/show_bug.cgi?id=218175
> > > Link: https://bugzilla.kernel.org/show_bug.cgi?id=218342
> > > Signed-off-by: Alexander Tsoy <alexander@tsoy.me>
> > > ---
> > > šsound/usb/clock.c | 10 +++++++++-
> > > š1 file changed, 9 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/sound/usb/clock.c b/sound/usb/clock.c
> > > index a8204c6d6fac..60fcb872a80b 100644
> > > --- a/sound/usb/clock.c
> > > +++ b/sound/usb/clock.c
> > > @@ -347,8 +347,16 @@ static int __uac_clock_find_source(struct
> > > snd_usb_audio *chip,
> > > š			ššš !writeable)
> > > š				return ret;
> > > š			err = uac_clock_selector_set_val(chip,
> > > entity_id, cur);
> > > -			if (err < 0)
> > > +			if (err < 0) {
> > > +				if (pins == 1) {
> > > +					usb_audio_dbg(chip,
> > > +						ššššš "%s():
> > > selector returned an error, "
> > > +						ššššš "assuming a
> > > firmware bug, id %d, ret %d\n",
> > > +						ššššš __func__,
> > > clock_id, err);
> > > +					return ret;
> > > +				}
> > > š				return err;
> > > +			}
> > 
> > Hmm, what's the difference of the behavior except for the additional
> > debug message?š Both returns ret, so I don't see how it fixes.
> 
> If pins == 1, then ret is returned, otherwise err is returned. They are
> not equal here. But yes, the code is a bit confusing.

Ah yeah, ret and err...  OK, I'll take it.


thanks,

Takashi

