Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F641509AB
	for <linux-sound@vger.kernel.org>; Sun, 31 May 2026 13:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780233811; cv=none; b=l9LJJszflu7ZMwrcXyvixo+7WZpTUjp3fbUdJadITOo8GQEyflnXPoeLKAAdLDNOw1oG/DSzoebZvlHhRI0pYsfMUJ9QP8CA2/hoV+oNPVL8XxKtaV+hBb+1MslZzGaoEnuClBvvkHX/qr8MHG6jsnG2J12LXBvmvHyl5USyySQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780233811; c=relaxed/simple;
	bh=QcoXZdHQ0re3HKyK6hOGcV7AjYLDbGwmieWiPvvZz0Q=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=p6sa+MTehDAZLjIOLWPuDT2Oql/xz31ggIN4q0TuXw20rlbRoc+xdwiNr+jer3imAC3KWwJ1118dFkehDAYaaJU54lCsbbDrSw2/1fpqhYcF9aKum9YIYFbpi/l0ESnm4mgwBjtqvA6i0SWWLFrbwTjErTvkUYED0jWaVcXIGiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=UWM9HdfJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=jOSclws9; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=UWM9HdfJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=jOSclws9; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="UWM9HdfJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jOSclws9";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="UWM9HdfJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jOSclws9"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 74CAD66FCC;
	Sun, 31 May 2026 13:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1780233808; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=saUQY7igWP4IyllS7+bxXkKPP98nqu4uovJOa5V4wQ8=;
	b=UWM9HdfJ+QJT2KhSIQ4zdA9mwUKWYH0k1QroHoSYwI7LcTgmMalcTddupp2vjoHkqvoJXK
	L7TSyyBWuCcZGhmz2tCfihkdcAtBRz2GwrHo8oA9vmEL7J36h7Dx0u688kTLF80P4LTg17
	CmeZJ4y4grk0vbAyUdT4cxrqs9D+6NI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1780233808;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=saUQY7igWP4IyllS7+bxXkKPP98nqu4uovJOa5V4wQ8=;
	b=jOSclws9ma4t+QUla0j5nacIVdFsf2blZDuzzh1wd1qCZU2V4ntfWoNbieA0xr1bEWxsMH
	P/DJlpa5FPWl8UBQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=UWM9HdfJ;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=jOSclws9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1780233808; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=saUQY7igWP4IyllS7+bxXkKPP98nqu4uovJOa5V4wQ8=;
	b=UWM9HdfJ+QJT2KhSIQ4zdA9mwUKWYH0k1QroHoSYwI7LcTgmMalcTddupp2vjoHkqvoJXK
	L7TSyyBWuCcZGhmz2tCfihkdcAtBRz2GwrHo8oA9vmEL7J36h7Dx0u688kTLF80P4LTg17
	CmeZJ4y4grk0vbAyUdT4cxrqs9D+6NI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1780233808;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=saUQY7igWP4IyllS7+bxXkKPP98nqu4uovJOa5V4wQ8=;
	b=jOSclws9ma4t+QUla0j5nacIVdFsf2blZDuzzh1wd1qCZU2V4ntfWoNbieA0xr1bEWxsMH
	P/DJlpa5FPWl8UBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3ADA7779A7;
	Sun, 31 May 2026 13:23:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id c3gDDVA2HGrBWAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 31 May 2026 13:23:28 +0000
Date: Sun, 31 May 2026 15:23:27 +0200
Message-ID: <877bojpvao.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Rong Zhang <i@rong.moe>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Takashi Iwai <tiwai@suse.de>,
	Steve Smith <tarkasteve@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: Set the value of potential sticky mixers to maximum
In-Reply-To: <20260531-uac-sticky-error-path-v1-1-12c2329d17ef@rong.moe>
References: <20260531-uac-sticky-error-path-v1-1-12c2329d17ef@rong.moe>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 74CAD66FCC
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,suse.de,gmail.com,vger.kernel.org];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]

On Sat, 30 May 2026 21:52:49 +0200,
Rong Zhang wrote:
> 
> It makes no sense to restore the saved value for a sticky mixer, since
> setting any value is a no-op.
> 
> However, in some rare cases, SET_CUR is effective despite GET_CUR always
> returns a constant value. These mixers are not sticky, but there's no
> way to distinguish them. Without any additional information, the best
> thing we can do is to set the mixer value to the maximum before bailing
> out, so that a soft mixer can still reach the maximum hardware volume if
> the mixer turns out to be non-sticky. Meanwhile, all channels must be
> synchronized to prevent imbalance volume.
> 
> Fixes: 86aa1ea1f15c ("ALSA: usb-audio: Do not expose sticky mixers")
> Signed-off-by: Rong Zhang <i@rong.moe>
> ---
>  sound/usb/mixer.c | 33 +++++++++++++++++++++++++++++----
>  1 file changed, 29 insertions(+), 4 deletions(-)
> 
> diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
> index 5fba456eb4a9..fb37bb8ad9a9 100644
> --- a/sound/usb/mixer.c
> +++ b/sound/usb/mixer.c
> @@ -1371,10 +1371,8 @@ static int get_min_max_with_quirks(struct usb_mixer_elem_info *cval,
>  				goto no_checks;
>  
>  			ret = check_sticky_volume_control(cval, minchn, saved);
> -			if (ret < 0) {
> -				snd_usb_set_cur_mix_value(cval, minchn, 0, saved);
> -				return ret;
> -			}
> +			if (ret < 0)
> +				goto sticky;
>  
>  			if (cval->min + cval->res < cval->max)
>  				check_volume_control_res(cval, minchn, saved);
> @@ -1431,6 +1429,33 @@ static int get_min_max_with_quirks(struct usb_mixer_elem_info *cval,
>  	}
>  
>  	return 0;
> +
> +sticky:
> +	/*
> +	 * It makes no sense to restore the saved value for a sticky mixer,
> +	 * since setting any value is a no-op.
> +	 *
> +	 * However, in some rare cases, SET_CUR is effective despite GET_CUR
> +	 * always returns a constant value. These mixers are not sticky, but
> +	 * there's no way to distinguish them. Without any additional
> +	 * information, the best thing we can do is to set the mixer value to
> +	 * the maximum before bailing out, so that a soft mixer can still reach
> +	 * the maximum hardware volume if the mixer turns out to be non-sticky.
> +	 * Meanwhile, all channels must be synchronized to prevent imbalance
> +	 * volume.
> +	 */
> +	if (!cval->cmask) {
> +		snd_usb_set_cur_mix_value(cval, 0, 0, cval->max);
> +	} else {
> +		for (i = 0; i < MAX_CHANNELS; i++) {
> +			idx = 0;
> +			if (cval->cmask & BIT(i)) {
> +				snd_usb_set_cur_mix_value(cval, i + 1, idx, cval->max);
> +				idx++;
> +			}
> +		}
> +	}
> +	return ret;

This change is supposed to be applied only to 7.1, and 7.2 should take
another your series ("ALSA: usb-audio: MIXER_GET_CUR_BROKEN related
changes for 7.2") instead, right?  If so, at merging the latter, I'll
revert this one as a preliminary.


thanks,

Takashi
