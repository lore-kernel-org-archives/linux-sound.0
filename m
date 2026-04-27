Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D32F13B95E0
	for <linux-sound@vger.kernel.org>; Mon, 27 Apr 2026 12:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777293688; cv=none; b=dlTQvTOV1Dy5dJipU5T7XOF1eN8xTLQNtI/KZW/DBAxBhmQVjIQfo9KFITGaBwqd4NMQ8+kd+SRLRe2e7cgFZNI6r4o5n6OYnTycsCMDTcq2pP1eJvfj8BrMX03p4WMc151PKkh6Z95aGUHTDm3wSlTKbPJG2hFjAsCxcm3VESI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777293688; c=relaxed/simple;
	bh=dmFhXH4uHsASO3bXhlcP6lbQxjZFrBKhsY33X/J0tuI=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UNKlRMP66AHsnEm4eiLfCQuQvN/NT2pUnYNZRhZmqxxnDS6lo4vsSxmmYVLHiDlcut2KxuLPXOwSsLuazrZpvA0e1BMkMh3h+wjVd5clbCA6um0urs5YY7creeK1nUsqrcyZDXGcsDlSdT5zjywtAdm90REBevgCZ35/EiAugc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xSRchCDi; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=lEZ0TjC6; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xSRchCDi; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=lEZ0TjC6; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xSRchCDi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lEZ0TjC6";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xSRchCDi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lEZ0TjC6"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 13D6E5BD23;
	Mon, 27 Apr 2026 12:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777293685; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8ntCZ0J3zFRuX204rlPxSz0GyoczNW5yBpcG8Hw6waA=;
	b=xSRchCDiRiKFFcWofwuCUI6E/nz90IC29025s+J8AkdS7oMosxtbHOl8IcbuFIy8OXwH5O
	hlC89nGGPNxXeuC9wi0lQQfDASVBm9k9E1LjbwnjZYFZxPpSbsSKptkQGmDGOedgnmmB4g
	SBo45K2z3zywc++YKnLv0456wfhTWtg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777293685;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8ntCZ0J3zFRuX204rlPxSz0GyoczNW5yBpcG8Hw6waA=;
	b=lEZ0TjC6it+BoEyovbc/snNSWVhePyd1lZ3E/gWAZiJLHPC1ODU/9hIasyMr/7B4opslSN
	M6Tjq2p+WVg+ayAA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=xSRchCDi;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=lEZ0TjC6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777293685; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8ntCZ0J3zFRuX204rlPxSz0GyoczNW5yBpcG8Hw6waA=;
	b=xSRchCDiRiKFFcWofwuCUI6E/nz90IC29025s+J8AkdS7oMosxtbHOl8IcbuFIy8OXwH5O
	hlC89nGGPNxXeuC9wi0lQQfDASVBm9k9E1LjbwnjZYFZxPpSbsSKptkQGmDGOedgnmmB4g
	SBo45K2z3zywc++YKnLv0456wfhTWtg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777293685;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8ntCZ0J3zFRuX204rlPxSz0GyoczNW5yBpcG8Hw6waA=;
	b=lEZ0TjC6it+BoEyovbc/snNSWVhePyd1lZ3E/gWAZiJLHPC1ODU/9hIasyMr/7B4opslSN
	M6Tjq2p+WVg+ayAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D044E593B0;
	Mon, 27 Apr 2026 12:41:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id wJd8MXRZ72lCJgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 27 Apr 2026 12:41:24 +0000
Date: Mon, 27 Apr 2026 14:41:24 +0200
Message-ID: <874ikwzibv.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: wangdich9700@163.com
Cc: perex@perex.cz,
	tiwai@suse.com,
	kees@kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	wangdicheng <wangdicheng@kylinos.cn>
Subject: Re: [PATCH] ALSA: hda/conexant: Fix missing error check for jack detection
In-Reply-To: <20260427070739.133369-1-wangdich9700@163.com>
References: <20260427070739.133369-1-wangdich9700@163.com>
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
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	FREEMAIL_TO(0.00)[163.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[163.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,kylinos.cn:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid,kylinos.cn:email];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Queue-Id: 13D6E5BD23
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 

On Mon, 27 Apr 2026 09:07:39 +0200,
wangdich9700@163.com wrote:
> 
> From: wangdicheng <wangdicheng@kylinos.cn>
> 
> In cx_probe(), the return value of snd_hda_jack_detect_enable_callback()
> is ignored. If this function fails (e.g., due to memory allocation
> failure), the driver continues to probe, but the jack detection callback
> will not be registered. This can lead to a kernel crash later when the
> driver attempts to handle jack events or accesses the uninitialized
> structure.
> 
> Check the return value and propagate the error to the probe caller.
> 
> Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>
> ---
>  sound/hda/codecs/conexant.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/hda/codecs/conexant.c b/sound/hda/codecs/conexant.c
> index 3a9717df39b4..4c01c6270bd3 100644
> --- a/sound/hda/codecs/conexant.c
> +++ b/sound/hda/codecs/conexant.c
> @@ -1190,7 +1190,9 @@ static int cx_probe(struct hda_codec *codec, const struct hda_device_id *id)
>  	case 0x14f11f86:
>  	case 0x14f11f87:
>  		spec->is_cx11880_sn6140 = true;
> -		snd_hda_jack_detect_enable_callback(codec, 0x19, cx_update_headset_mic_vref);
> +		err = snd_hda_jack_detect_enable_callback(codec, 0x19, cx_update_headset_mic_vref);
> +		if (err < 0)
> +			goto error;

The function returns a pointer.  Use IS_ERR() and PTR_ERR() to check
and get the error, instead.

Also, don't forget to put Fixes tag.


thanks,

Takashi
