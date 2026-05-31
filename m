Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0EBE2F747A
	for <linux-sound@vger.kernel.org>; Sun, 31 May 2026 15:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780242612; cv=none; b=mWuJ699rDt8OvqcOAFbYzjyMKQpSxfOQDRxM1xPSSUidf2xTxMY6IGBpoIKu7iq2kM4HHrfp7hZ06i9dWCccrmZ4eFAwtbbMVhLT4DVxjZE6cM0/aNeXChgPNWYHaRfuFNU0Af8ZlallcAb1dZF/GfdTXRytQwyfA1jwKp4FMJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780242612; c=relaxed/simple;
	bh=VqzMw8FmhPwzlUod1n5f67VL0c8Y6IUmC6UIuIq+Edc=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=h9V5tvU7SXlhDdqc6l0s4OuTG3JlCy0RuCbQIqO0T8Sm4xkQpNXzvtrGAxmyJD2m80hUD/v2EeBb4kGFiCtdFdKtnR2QLxg7HPVQIDTGhg/kHTUtP7lE7Hw33+DDqqeIaj6I1vmw/erTmOMjy43STfX9f61QaXkrrmPrD8a78cE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=JxkAPWDE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=6FnSnsQR; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=JxkAPWDE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=6FnSnsQR; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="JxkAPWDE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6FnSnsQR";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="JxkAPWDE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6FnSnsQR"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0465F66FB1;
	Sun, 31 May 2026 15:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1780242609; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=M6Vi7un2m+9b8cFJG5A6vPbqEnxP1F5pSz4L6Go5Eo4=;
	b=JxkAPWDE244PmVv6XeRLnB+itf7u93g21wWtY52tqEmyc+lNRdTfF5NicIkooP9EHCrqP8
	trRsEWVr4cJwXsxa2dP70QmHCCtgUyWGR9PJNz47KUjRLG4bkQCP1QGIZb2lQakr+5mqUS
	+lv4Fy+1EIUV3ebaqDmmiF9bT4VdR/8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1780242609;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=M6Vi7un2m+9b8cFJG5A6vPbqEnxP1F5pSz4L6Go5Eo4=;
	b=6FnSnsQRitJyerZp0wWyhvEgwLW8XjQMCDCnOdJt7YAWfo8N9ZY6v9OYcJW+qSompsrgmh
	6aTxxSqU/VSUe7Bg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1780242609; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=M6Vi7un2m+9b8cFJG5A6vPbqEnxP1F5pSz4L6Go5Eo4=;
	b=JxkAPWDE244PmVv6XeRLnB+itf7u93g21wWtY52tqEmyc+lNRdTfF5NicIkooP9EHCrqP8
	trRsEWVr4cJwXsxa2dP70QmHCCtgUyWGR9PJNz47KUjRLG4bkQCP1QGIZb2lQakr+5mqUS
	+lv4Fy+1EIUV3ebaqDmmiF9bT4VdR/8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1780242609;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=M6Vi7un2m+9b8cFJG5A6vPbqEnxP1F5pSz4L6Go5Eo4=;
	b=6FnSnsQRitJyerZp0wWyhvEgwLW8XjQMCDCnOdJt7YAWfo8N9ZY6v9OYcJW+qSompsrgmh
	6aTxxSqU/VSUe7Bg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A0A1B779A7;
	Sun, 31 May 2026 15:50:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id DmqJJbBYHGqDYQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 31 May 2026 15:50:08 +0000
Date: Sun, 31 May 2026 17:50:08 +0200
Message-ID: <87se77o9xr.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Rong Zhang <i@rong.moe>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Takashi Iwai <tiwai@suse.de>,
	Steve Smith <tarkasteve@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/3] ALSA: usb-audio: Add QUIRK_FLAG_MIXER_GET_CUR_BROKEN
In-Reply-To: <20260531-uac-quirk-get-cur-vol-v4-0-ede643dca151@rong.moe>
References: <20260531-uac-quirk-get-cur-vol-v4-0-ede643dca151@rong.moe>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spam-Score: -3.30
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,lwn.net,linuxfoundation.org,suse.de,gmail.com,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[rong.moe:email,suse.de:mid]

On Sun, 31 May 2026 17:45:19 +0200,
Rong Zhang wrote:
> 
> Since commit 86aa1ea1f15c ("ALSA: usb-audio: Do not expose sticky
> mixers"), the UAC mixer core utilizes volume SET_CUR and GET_CUR to
> identify devices with sticky mixers. Unfortunately, even though most
> devices with sticky GET_CUR also have corresponding sticky SET_CUR,
> which I actually met more since the commit had been merged, there is
> also a rare case that some devices may have volume mixers that responds
> to SET_CUR properly but with its GET_CUR stubbed. This cause the sticky
> check to consider the mixer to be sticky and unnecessarily disable it.
> 
> As the sticky check can't distinguish between sticky mixers and working
> SET_CUR but broken GET_CUR, add QUIRK_FLAG_MIXER_GET_CUR_BROKEN to tell
> that the device should fall into the second category when GET_CUR
> returns a constant value. In this case, the sticky check becomes
> non-fatal and only disables GET_CUR instead of the whole mixer. The
> current volume will then be provided by the internal cache that stores
> the last set volume.
> 
> An info message prompting users to check MIXER_GET_CUR_BROKEN for
> potential sticky mixers is also added, so that users can learn how to do
> some experiments to determine what's going on. If the mixer surprisingly
> turns out to be non-sticky, they can submit a patch for a new quirk
> table entry.
> 
> The Sennheiser MOMENTUM 3 and Edifier MF200 need the quirk flag. Though
> their UAC mixers respond to SET_CUR by tuning the volume, the
> corresponding GET_CUR methods are somehow stubbed and return constant
> values, resulting in them being disabled by the sticky check.
> 
> Signed-off-by: Rong Zhang <i@rong.moe>
> ---
> Changes in v4:
> - Rebase since a patch improving the error path of the sticky check has
>   been applied earlier
>   - https://patch.msgid.link/20260531-uac-sticky-error-path-v1-1-12c2329d17ef@rong.moe
> - Integrate a follow-up series into this one
>   - https://patch.msgid.link/20260531-uac-edifier-mf200-v1-0-be69657c3f87@rong.moe
> - Link to v3: https://patch.msgid.link/20260529-uac-quirk-get-cur-vol-v3-0-bde363188ca4@rong.moe
> 
> Changes in v3:
> - Make the log less noisy (thanks Takashi Iwai)
> - Do not propagate mixer values written by sanity checks when GET_CUR is
>   broken, nor restore the garbage backed-up value. Instead, rely on
>   init_cur_mix_raw() to initialize the mixer properly
> - Gate cache invalidation as well, so that the current volume is always
>   available to userspace
> - Update the comment of check_sticky_volume_control()
> - Link to v2: https://patch.msgid.link/20260528-uac-quirk-get-cur-vol-v2-0-84d3c8f48150@rong.moe
> 
> Changes in v2:
> - Turn the approach into a less radical one
>   - Rename the quirk flag to QUIRK_FLAG_MIXER_GET_CUR_BROKEN
>   - Add a flag `get_cur_broken' to `struct usb_mixer_elem_info'
>   - When the sticky check fails, check quirk flags. Gate further GET_CUR
>     by setting `cval->get_cur_broken' if QUIRK_FLAG_MIXER_GET_CUR_BROKEN
>     is set, otherwise disable the mixer as usual
>   - The quirk flag still applies to all mixers, but as long as a mixer
>     makes the sticky check happy, it won't be affected at all. Only
>     those mixers with constant GET_CUR values will have their GET_CUR
>     gated. I assume the impact is minimal, since it's very unlikely a
>     device would have sticky mixers (broken SET_CUR) along with mixers
>     with working SET_CUR but broken GET_CUR at the same time
> - Link to v1: https://patch.msgid.link/20260527-uac-quirk-get-cur-vol-v1-0-e9362b712e5e@rong.moe
> 
> ---
> Rong Zhang (3):
>       ALSA: usb-audio: Add QUIRK_FLAG_MIXER_GET_CUR_BROKEN
>       ALSA: usb-audio: Add quirk flag for Sennheiser MOMENTUM 3
>       ALSA: usb-audio: Add quirk flag for Edifier MF200

Now took all three patches onto for-next branch.  Thanks.


Takashi
