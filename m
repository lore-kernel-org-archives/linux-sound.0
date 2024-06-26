Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A2DA1F94C
	for <linux-sound@vger.kernel.org>; Wed, 26 Jun 2024 16:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719420723; cv=none; b=Q8yDE8dZJEP8+XU8OTmpQNLsDNuY4LRwhqageS+pw9x4JB8aEH7NQIzq3QgLij1YO6JX8ihtFiG8pRGMnAcw5/JfYnPWdygB2DyM906bMbhNbvrMJXj7PLSdqAfr2wbsBr00RttnvUpfLShkAA5nfekjLlmcB3p5xDAc7D8Ghmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719420723; c=relaxed/simple;
	bh=fIs6vUzgULAxXcKyM9z21z3+5INSdYfT81Tv2T+Ne/Y=;
	h=Date:Message-ID:From:To:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AN6FCeFDTFVVMxYHPhzBFVHA7/FBoyQ0aW7P5HEcDXTtOfgLH3BgGv5v5lzPlS+PkdPrrkJe+AFqFJTV7Rctnn0qqojQBT+I7cqnb83dsjKn2smFi8Sj0EBxp5bbCTPrRUo/Y8CyyppB92MaUhrF462No4NDsa5b+aPvoCxxJMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=difMU22r; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3yltZ0IC; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=difMU22r; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3yltZ0IC; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="difMU22r";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3yltZ0IC";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="difMU22r";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3yltZ0IC"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5C0861FB65
	for <linux-sound@vger.kernel.org>; Wed, 26 Jun 2024 16:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1719420720; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=f1foJbpUoUrK3UTOC2H8VH88rxGG8APj2r7dMKNZqzg=;
	b=difMU22rBRXS4WSE3+nZRFqHPW8wAkaiIKqD4KBUl10cY5rRnxxVUIEyln3grzREhth/Mz
	AskzcJJ97v2oVOmAiNNIL5FcpoZfgxjdZbUgGNXx0ogUd732/4qO2KniFBznDybW4Wot2I
	dcK2omusaHdosCvL9co5Mox3PmBFmEE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1719420720;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=f1foJbpUoUrK3UTOC2H8VH88rxGG8APj2r7dMKNZqzg=;
	b=3yltZ0ICpP36Zufimi86hYY9O2tvHrth3UE9UXXRg0NUFodHk7rAgVVmabtwZSUECMSYIs
	cpCl5cMjrcG1jhBA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1719420720; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=f1foJbpUoUrK3UTOC2H8VH88rxGG8APj2r7dMKNZqzg=;
	b=difMU22rBRXS4WSE3+nZRFqHPW8wAkaiIKqD4KBUl10cY5rRnxxVUIEyln3grzREhth/Mz
	AskzcJJ97v2oVOmAiNNIL5FcpoZfgxjdZbUgGNXx0ogUd732/4qO2KniFBznDybW4Wot2I
	dcK2omusaHdosCvL9co5Mox3PmBFmEE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1719420720;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=f1foJbpUoUrK3UTOC2H8VH88rxGG8APj2r7dMKNZqzg=;
	b=3yltZ0ICpP36Zufimi86hYY9O2tvHrth3UE9UXXRg0NUFodHk7rAgVVmabtwZSUECMSYIs
	cpCl5cMjrcG1jhBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3C0E2139C2
	for <linux-sound@vger.kernel.org>; Wed, 26 Jun 2024 16:52:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 5157DTBHfGZuBAAAD6G6ig
	(envelope-from <tiwai@suse.de>)
	for <linux-sound@vger.kernel.org>; Wed, 26 Jun 2024 16:52:00 +0000
Date: Wed, 26 Jun 2024 18:52:27 +0200
Message-ID: <8734ozir3o.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: seq: Improve UMP SysEx packing
In-Reply-To: <20240626161017.9479-1-tiwai@suse.de>
References: <20240626161017.9479-1-tiwai@suse.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
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
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	PREVIOUSLY_DELIVERED(0.00)[linux-sound@vger.kernel.org];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email]

On Wed, 26 Jun 2024 18:10:15 +0200,
Takashi Iwai wrote:
> 
> The initial implementation of 7bit SysEx message conversion to UMP did
> a trick to deal with the first SysEx start byte (0xf7).  The converter
> trims it and sends the first packet with the content of 5 bytes.
> Although this is valid and should work, it's not ideal and a bit
> confusing as if something goes wrong.
> 
> This patch improves the handling to try filling always 6 bytes in the
> package.
> 
> Fixes: e9e02819a98a ("ALSA: seq: Automatic conversion of UMP events")
> Signed-off-by: Takashi Iwai <tiwai@suse.de>

Scratch this one.  It won't work properly when the sysex message is
split.  Will rework on it.


Takashi

> ---
>  sound/core/seq/seq_ump_convert.c | 48 +++++++++++++++++++-------------
>  1 file changed, 28 insertions(+), 20 deletions(-)
> 
> diff --git a/sound/core/seq/seq_ump_convert.c b/sound/core/seq/seq_ump_convert.c
> index e90b27a135e6..952e64c499dd 100644
> --- a/sound/core/seq/seq_ump_convert.c
> +++ b/sound/core/seq/seq_ump_convert.c
> @@ -1192,7 +1192,7 @@ static int cvt_sysex_to_ump(struct snd_seq_client *dest,
>  {
>  	struct snd_seq_ump_event ev_cvt;
>  	unsigned char status;
> -	u8 buf[6], *xbuf;
> +	u8 buf[6];
>  	int offset = 0;
>  	int len, err;
>  
> @@ -1200,36 +1200,44 @@ static int cvt_sysex_to_ump(struct snd_seq_client *dest,
>  		return 0;
>  
>  	setup_ump_event(&ev_cvt, event);
> +	len = 0;
> +	status = UMP_SYSEX_STATUS_START;
>  	for (;;) {
> -		len = snd_seq_expand_var_event_at(event, sizeof(buf), buf, offset);
> -		if (len <= 0)
> +		err = snd_seq_expand_var_event_at(event, sizeof(buf) - len,
> +						  buf + len, offset);
> +		if (err < 0)
> +			break;
> +		len += err;
> +		if (!len)
>  			break;
>  		if (WARN_ON(len > 6))
>  			break;
> -		offset += len;
> -		xbuf = buf;
> -		if (*xbuf == UMP_MIDI1_MSG_SYSEX_START) {
> -			status = UMP_SYSEX_STATUS_START;
> -			xbuf++;
> +		offset += err;
> +		if (status == UMP_SYSEX_STATUS_START &&
> +		    buf[0] == UMP_MIDI1_MSG_SYSEX_START) {
>  			len--;
> -			if (len > 0 && xbuf[len - 1] == UMP_MIDI1_MSG_SYSEX_END) {
> -				status = UMP_SYSEX_STATUS_SINGLE;
> -				len--;
> -			}
> -		} else {
> -			if (xbuf[len - 1] == UMP_MIDI1_MSG_SYSEX_END) {
> -				status = UMP_SYSEX_STATUS_END;
> -				len--;
> -			} else {
> -				status = UMP_SYSEX_STATUS_CONTINUE;
> -			}
> +			memmove(buf, buf + 1, len);
> +			continue; /* fill one more byte */
>  		}
> -		fill_sysex7_ump(dest_port, ev_cvt.ump, status, xbuf, len);
> +		if (buf[len - 1] == UMP_MIDI1_MSG_SYSEX_END) {
> +			len--;
> +			if (status == UMP_SYSEX_STATUS_START)
> +				status = UMP_SYSEX_STATUS_SINGLE;
> +			else
> +				status = UMP_SYSEX_STATUS_END;
> +		}
> +		fill_sysex7_ump(dest_port, ev_cvt.ump, status, buf, len);
>  		err = __snd_seq_deliver_single_event(dest, dest_port,
>  						     (struct snd_seq_event *)&ev_cvt,
>  						     atomic, hop);
>  		if (err < 0)
>  			return err;
> +
> +		if (status == UMP_SYSEX_STATUS_START)
> +			status = UMP_SYSEX_STATUS_CONTINUE;
> +		else if (status != UMP_SYSEX_STATUS_CONTINUE)
> +			break;
> +		len = 0; /* reset filling */
>  	}
>  	return 0;
>  }
> -- 
> 2.43.0
> 
