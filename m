Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00418310779
	for <linux-sound@vger.kernel.org>; Sun, 31 May 2026 14:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780236437; cv=none; b=SZbXZMlinTRmJoRr6a9rdBMiVAFfJpkm3PQiXw35UtRhE5OcuSD7jOvAIQ9jhAT3ZP605qpH3rpZ6AvxV6IA/tX+2B2xtUHgOf3xDxZfF9UFmtFeb+JV4Y8m+3sj0kyvmGX/QWtlMNDkF65lhzbdSHxj3sav6LeXcoL+F6IbGIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780236437; c=relaxed/simple;
	bh=EeHzH7z4jrZ+dWg3HQz9aaHXnUrxfxfElbnfG2xD8lA=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sTK/2zHs5MmWWPA6J5l96xJ2TdfFBB0D0J9juNn1YPu4xOSQQv8fnM6G6eqeBxpcouHSuFieALSBq9AHDo5FWKm97cEaWrvftMiZzyxDCIbTxHLaGU3pKcmzsM+DNruH22mYo7IfyYfeuSCVrzVZrtz4nPQdUif7X0lYvYqjbQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Xzy20PH/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=/5F7y36b; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Xzy20PH/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=/5F7y36b; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Xzy20PH/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/5F7y36b";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Xzy20PH/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/5F7y36b"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 3019867D58;
	Sun, 31 May 2026 14:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1780236433; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sHnCs/v8BOdTpdOJhfuoaW1eCdqD8ct2nHhg9/je7nY=;
	b=Xzy20PH/e3RHNIeRsqctP998DFx4ta/g9Mgxiqq5oLuLkXNInwPWcm4Ekvx9zz0oXjSpEX
	19xhB+K/DINQvQKruifluYZwy9FrOSh9eTdWQgJKS3MgLN7JsNSvj3Mko5FEAGBrtun1Ce
	+mCGEN0/pf5PMBVPlRMfS5sqiMYv72o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1780236433;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sHnCs/v8BOdTpdOJhfuoaW1eCdqD8ct2nHhg9/je7nY=;
	b=/5F7y36bCzt6VsOEfxVDN4iTRa6ol5cBO3w6ai2bNUdsozRM0v4Mh5eYFS0fmA9y0bu8yb
	tLWLnVkIunwBYMDQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1780236433; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sHnCs/v8BOdTpdOJhfuoaW1eCdqD8ct2nHhg9/je7nY=;
	b=Xzy20PH/e3RHNIeRsqctP998DFx4ta/g9Mgxiqq5oLuLkXNInwPWcm4Ekvx9zz0oXjSpEX
	19xhB+K/DINQvQKruifluYZwy9FrOSh9eTdWQgJKS3MgLN7JsNSvj3Mko5FEAGBrtun1Ce
	+mCGEN0/pf5PMBVPlRMfS5sqiMYv72o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1780236433;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sHnCs/v8BOdTpdOJhfuoaW1eCdqD8ct2nHhg9/je7nY=;
	b=/5F7y36bCzt6VsOEfxVDN4iTRa6ol5cBO3w6ai2bNUdsozRM0v4Mh5eYFS0fmA9y0bu8yb
	tLWLnVkIunwBYMDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E5991779A7;
	Sun, 31 May 2026 14:07:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id QUYRNpBAHGqlAgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 31 May 2026 14:07:12 +0000
Date: Sun, 31 May 2026 16:07:12 +0200
Message-ID: <87y0gzoepb.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Rong Zhang <i@rong.moe>
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Steve
 Smith <tarkasteve@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: Set the value of potential sticky mixers to maximum
In-Reply-To: <47f764913c6a7ee6e01825f711a30ec44bf2d7bb.camel@rong.moe>
References: <20260531-uac-sticky-error-path-v1-1-12c2329d17ef@rong.moe>
	<877bojpvao.wl-tiwai@suse.de>
	<47f764913c6a7ee6e01825f711a30ec44bf2d7bb.camel@rong.moe>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_CC(0.00)[suse.de,perex.cz,suse.com,gmail.com,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,rong.moe:email,suse.de:mid]

On Sun, 31 May 2026 15:55:46 +0200,
Rong Zhang wrote:
>> 
> Hi Takashi,
> 
> On Sun, 2026-05-31 at 15:23 +0200, Takashi Iwai wrote:
> > On Sat, 30 May 2026 21:52:49 +0200,
> > Rong Zhang wrote:
> > > 
> > > It makes no sense to restore the saved value for a sticky mixer, since
> > > setting any value is a no-op.
> > > 
> > > However, in some rare cases, SET_CUR is effective despite GET_CUR always
> > > returns a constant value. These mixers are not sticky, but there's no
> > > way to distinguish them. Without any additional information, the best
> > > thing we can do is to set the mixer value to the maximum before bailing
> > > out, so that a soft mixer can still reach the maximum hardware volume if
> > > the mixer turns out to be non-sticky. Meanwhile, all channels must be
> > > synchronized to prevent imbalance volume.
> > > 
> > > Fixes: 86aa1ea1f15c ("ALSA: usb-audio: Do not expose sticky mixers")
> > > Signed-off-by: Rong Zhang <i@rong.moe>
> > > ---
> > >  sound/usb/mixer.c | 33 +++++++++++++++++++++++++++++----
> > >  1 file changed, 29 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
> > > index 5fba456eb4a9..fb37bb8ad9a9 100644
> > > --- a/sound/usb/mixer.c
> > > +++ b/sound/usb/mixer.c
> > > @@ -1371,10 +1371,8 @@ static int get_min_max_with_quirks(struct usb_mixer_elem_info *cval,
> > >  				goto no_checks;
> > >  
> > >  			ret = check_sticky_volume_control(cval, minchn, saved);
> > > -			if (ret < 0) {
> > > -				snd_usb_set_cur_mix_value(cval, minchn, 0, saved);
> > > -				return ret;
> > > -			}
> > > +			if (ret < 0)
> > > +				goto sticky;
> > >  
> > >  			if (cval->min + cval->res < cval->max)
> > >  				check_volume_control_res(cval, minchn, saved);
> > > @@ -1431,6 +1429,33 @@ static int get_min_max_with_quirks(struct usb_mixer_elem_info *cval,
> > >  	}
> > >  
> > >  	return 0;
> > > +
> > > +sticky:
> > > +	/*
> > > +	 * It makes no sense to restore the saved value for a sticky mixer,
> > > +	 * since setting any value is a no-op.
> > > +	 *
> > > +	 * However, in some rare cases, SET_CUR is effective despite GET_CUR
> > > +	 * always returns a constant value. These mixers are not sticky, but
> > > +	 * there's no way to distinguish them. Without any additional
> > > +	 * information, the best thing we can do is to set the mixer value to
> > > +	 * the maximum before bailing out, so that a soft mixer can still reach
> > > +	 * the maximum hardware volume if the mixer turns out to be non-sticky.
> > > +	 * Meanwhile, all channels must be synchronized to prevent imbalance
> > > +	 * volume.
> > > +	 */
> > > +	if (!cval->cmask) {
> > > +		snd_usb_set_cur_mix_value(cval, 0, 0, cval->max);
> > > +	} else {
> > > +		for (i = 0; i < MAX_CHANNELS; i++) {
> > > +			idx = 0;
> > > +			if (cval->cmask & BIT(i)) {
> > > +				snd_usb_set_cur_mix_value(cval, i + 1, idx, cval->max);
> > > +				idx++;
> > > +			}
> > > +		}
> > > +	}
> > > +	return ret;
> > 
> > This change is supposed to be applied only to 7.1, 
> > 
> 
> This patch is meant for both 7.1 and 7.2.
> 
> > and 7.2 should take
> > another your series ("ALSA: usb-audio: MIXER_GET_CUR_BROKEN related
> > changes for 7.2") instead, right?
> > 
> 
> Right.
> 
> >   If so, at merging the latter, I'll
> > revert this one as a preliminary.
> 
> Please don't revert this one in 7.2.
> 
> It is needed to make any future devices like that to at least have
> audible volume out-of-box. Without it, users will have to wait for an
> quirk table entry for their devices (or add one themselves). Since
> setting the mixer value to maximum should be safe on both categories of
> devices (sticky, effective SET_CUR but broken GET_CUR), I'd prefer to
> retain this patch in 7.2 too.
> 
> Another reason of retaining it is that the current error path only
> "restores" the garbage GET_CUR value for minchn, so it could lead to
> imbalance volume if the mixer has multiple channels. In the effective
> SET_CUR but broken GET_CUR case, we would still have to fix the error
> path anyway to synchronize all channels. Since this patch does the job
> and synchronize all channels using a non-garbage value, it should be
> fine to retain it in 7.2.
> 
> That being said, this patch has a trivial single-line conflict in 7.2
> because my series adding QUIRK_FLAG_MIXER_GET_CUR_BROKEN narrowed the
> sticky path down to `ret == -ENODEV'. I can resubmit the series for 7.2
> to include a rebased version of this patch, should you prefer.

OK, then let me merge this one to for-linus, and merge to for-next
branch at first.  Then resubmit the patches that can be applied
cleanly on for-next branch.  I can merge and resolve conflicts
locally, but this would become a problem when backporting to older
stable kernels in future.


thanks,

Takashi
