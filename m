Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E452E38F93B
	for <linux-sound@vger.kernel.org>; Thu,  9 Apr 2026 14:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775745424; cv=none; b=A/2/aWf7fGFY3sY5pcbWoNJUQlp07e7WvhmxrqwSPURjmaHx28SBhK4QtDwamypNKrTkcQMrUSFE9xl+nM4eaY/NiYrcJpjIY2msvVllr7JaOFi2lTZX8g7IJ8LDB5b1tHoizY4VIfKNwmq4VMdPqHiXlieNM0sBA/wEtePIoPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775745424; c=relaxed/simple;
	bh=WthZKrrIKrz3gM8P83X5PDhXQBHWYUYKPix7pwHse64=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UFHBVv/mLVoaSVAMncHB9gcSv0AQHUv9RaEZIOo5w1nWmQ3pOwGPwMht9UiQGWQoOdrt/dTDcseXs/Xm2pu/Ru0Lt8fghKRpi7CNYHnzhY6fh5WbuLynb5IDAJIit03KEDMMbbYj0YOCW+o6dpZUnIDux6IOzGslIY50OJA1AFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vfcVn0Cw; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HNdhiz/q; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vfcVn0Cw; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HNdhiz/q; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vfcVn0Cw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HNdhiz/q";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vfcVn0Cw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HNdhiz/q"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 80AEA5BD28;
	Thu,  9 Apr 2026 14:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775745420; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2UlEptL6lkagA2/oPJg88c+OsYtSYC4XpczH07X1mV8=;
	b=vfcVn0Cw3WDjyXqRfioSivOkezJT6HTOrcjZImjEDwTaApUOo8LoBRX4t2bSpFibW5KxH7
	wQO5WlEb82+Ht1x9pxhhobzTWI61lygpxk+JehrpiyYtdeoTlDjhWkX0gvlyvr/dxFCCfr
	Iholdn7BjQBtH9HR1dHJ4Jw5gMNT8zg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775745420;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2UlEptL6lkagA2/oPJg88c+OsYtSYC4XpczH07X1mV8=;
	b=HNdhiz/qArt4jCmkTTsfpbbMuZRPeiAlGVHwsnKV+q99mWgD44oVf3u5+EoXQVm8RJqWHq
	IoLGgiWHOfsrDICQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=vfcVn0Cw;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="HNdhiz/q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775745420; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2UlEptL6lkagA2/oPJg88c+OsYtSYC4XpczH07X1mV8=;
	b=vfcVn0Cw3WDjyXqRfioSivOkezJT6HTOrcjZImjEDwTaApUOo8LoBRX4t2bSpFibW5KxH7
	wQO5WlEb82+Ht1x9pxhhobzTWI61lygpxk+JehrpiyYtdeoTlDjhWkX0gvlyvr/dxFCCfr
	Iholdn7BjQBtH9HR1dHJ4Jw5gMNT8zg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775745420;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2UlEptL6lkagA2/oPJg88c+OsYtSYC4XpczH07X1mV8=;
	b=HNdhiz/qArt4jCmkTTsfpbbMuZRPeiAlGVHwsnKV+q99mWgD44oVf3u5+EoXQVm8RJqWHq
	IoLGgiWHOfsrDICQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4B6DD4A0B3;
	Thu,  9 Apr 2026 14:37:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id gf84EYy512kdCAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 09 Apr 2026 14:37:00 +0000
Date: Thu, 09 Apr 2026 16:36:59 +0200
Message-ID: <87ldewi4j8.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Rong Zhang <i@rong.moe>
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Icenowy Zheng
	 <uwu@icenowy.me>
Subject: Re: [PATCH 2/2] ALSA: usb-audio: Do not expose sticky volume control mixers
In-Reply-To: <e604ac36567a2ae2fad4d4c4346a71e83eb3da64.camel@rong.moe>
References: <20260409-feaulle-rainbow-v1-0-09179e09000d@rong.moe>
	<20260409-feaulle-rainbow-v1-2-09179e09000d@rong.moe>
	<87o6jsk3vs.wl-tiwai@suse.de>
	<e604ac36567a2ae2fad4d4c4346a71e83eb3da64.camel@rong.moe>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_TLS_ALL(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,rong.moe:email,suse.de:dkim,suse.de:mid];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid,rong.moe:email];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Queue-Id: 80AEA5BD28
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 

On Thu, 09 Apr 2026 16:20:30 +0200,
Rong Zhang wrote:
> 
> Hi Takashi,
> 
> Thanks for your review.
> 
> On Thu, 2026-04-09 at 09:08 +0200, Takashi Iwai wrote:
> > On Wed, 08 Apr 2026 20:33:06 +0200,
> > Rong Zhang wrote:
> > > 
> > > Some devices expose sticky mixers that accept SET_CUR but do absolutely
> > > nothing. Registering mixers for them confuses userspace and results in
> > > ineffective volume control.
> > > 
> > > Check if the volume control is sticky by setting the volume to the
> > > maximum or minimum value, and prevent the mixer from being registered
> > > accordingly.
> > > 
> > > Quirky device sample:
> > > 
> > >   usb 7-1: New USB device found, idVendor=0e0b, idProduct=fa01, bcdDevice= 1.00
> > >   usb 7-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
> > >   usb 7-1: Product: Feaulle Rainbow
> > >   usb 7-1: Manufacturer: Generic
> > >   usb 7-1: SerialNumber: 20210726905926
> > >   (Mic Capture Volume)
> > > 
> > > Signed-off-by: Rong Zhang <i@rong.moe>
> > > ---
> > >  sound/usb/mixer.c | 37 +++++++++++++++++++++++++++++++++++--
> > >  1 file changed, 35 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
> > > index a25e8145af67..9f0aed36e27d 100644
> > > --- a/sound/usb/mixer.c
> > > +++ b/sound/usb/mixer.c
> > > @@ -27,6 +27,7 @@
> > >   *  	- parse available sample rates again when clock sources changed
> > >   */
> > >  
> > > +#include <linux/array_size.h>
> > 
> > It's only for ARRAY_SIZE()?  Then no need for extra inclusion.  It's
> > already included by others.
> > 
> > >  #include <linux/bitops.h>
> > >  #include <linux/init.h>
> > >  #include <linux/list.h>
> > > @@ -1287,17 +1288,49 @@ static int get_min_max_with_quirks(struct usb_mixer_elem_info *cval,
> > >  		if (cval->res == 0)
> > >  			cval->res = 1;
> > >  
> > > -		/* Additional checks for the proper resolution
> > > +		/* Additional checks
> > > +		 *
> > > +		 * Some devices expose sticky mixers that accept SET_CUR
> > > +		 * but do absolutely nothing.
> > >  		 *
> > >  		 * Some devices report smaller resolutions than actually
> > >  		 * reacting.  They don't return errors but simply clip
> > >  		 * to the lower aligned value.
> > >  		 */
> > > -		if (cval->min + cval->res < cval->max) {
> > > +		if (cval->min < cval->max) {
> > > +			int sticky_test_values[] = { cval->min, cval->max };
> > >  			int last_valid_res = cval->res;
> > >  			int saved, test, check;
> > > +			bool effective = false;
> > > +
> > >  			if (get_cur_mix_raw(cval, minchn, &saved) < 0)
> > >  				goto no_res_check;
> > > +
> > > +			for (i = 0; i < ARRAY_SIZE(sticky_test_values); i++) {
> > > +				test = sticky_test_values[i];
> > > +				if (test == saved)
> > > +					continue;
> > > +				/* Assume non-sticky on failure. */
> > > +				if (snd_usb_set_cur_mix_value(cval, minchn, 0, test) ||
> > > +				    get_cur_mix_raw(cval, minchn, &check) ||
> > > +				    check != saved) { /* SET_CUR effective, non-sticky. */
> > > +					effective = true;
> > > +					break;
> > > +				}
> > > +			}
> > > +			if (!effective) {
> > > +				usb_audio_warn(cval->head.mixer->chip,
> > > +					"%d:%d: sticky mixer values (%d/%d/%d => %d), disabling\n",
> > > +					cval->head.id, mixer_ctrl_intf(cval->head.mixer),
> > > +					cval->min, cval->max, cval->res, saved);
> > > +
> > > +				cval->initialized = 1;
> > > +				cval->min = cval->max = cval->res = 0;
> > > +				return -ENODEV;
> > > +			}
> > > +
> > > +			if (cval->min + cval->res >= cval->max)
> > > +				goto no_res_check;
> > 
> > Hm, it's quite lots of changes, and I'd like this to be factored out
> > as a function instead.  Maybe the resolution check code could be moved
> > into a function, too; get_min_max_with_quirks() is too lengthy.
> 
> Sure, I will refactor the current code path beforehand when I resubmit
> this.
> 
> Hmm, does patch 1 make sense to you? If so, I would be grateful if you
> could you apply it separately so that I can send a new series solely
> focusing on refactoring and adding the sticky mixer check.

OK, I'm going to apply only the first patch now.

> > 
> > Also, note that currently there is no error check for get_min_max*().
> > Your code works just because you set cval->min = cval->max, and there
> > is an additional check at a later point of this.
> > 
> > Ideally speaking, we should have an error check to explicitly handle a
> > case like this.  But the current code allows the error at init, at
> > least, we tolerate the errors at reading UAC_GET_MIN and _MAX.  So, if
> > any, the error check would need to evaluate the error number and
> > ignore -EINVAL or such...
> 
> Makes sense, I will address it beforehand when I resubmit this.
> 
> BTW, how about checking against -ENODEV instead? It can be considered to
> be an indication that the caller should not register the mixer and is
> much more readable. I don't have a strong preference for this though,
> and ignoring -EINVAL also makes sense to me.

The -EINVAL could be a temporary error at the probe time, and there
were cases where the later read works.  I meant the code:

		if (get_ctl_value(cval, UAC_GET_MAX, (cval->control << 8) | minchn, &cval->max) < 0 ||
		    get_ctl_value(cval, UAC_GET_MIN, (cval->control << 8) | minchn, &cval->min) < 0) {
			usb_audio_err(cval->head.mixer->chip,
				      "%d:%d: cannot get min/max values for control %d (id %d)\n",
				   cval->head.id, mixer_ctrl_intf(cval->head.mixer),
							       cval->control, cval->head.id);
			return -EINVAL;
		}

... and maybe -EINVAL isn't really a good sign, but better to replace
with -EAGAIN.  Then continuing after -EAGAIN in the caller side would
become more logical.


thanks,

Takashi
