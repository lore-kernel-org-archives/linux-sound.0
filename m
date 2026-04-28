Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 684EF28B4E2
	for <linux-sound@vger.kernel.org>; Tue, 28 Apr 2026 06:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777356293; cv=none; b=Iitvu/R/rvBSKX3zboCWDxpw/75ZASai92CQ2D1mtkNmzm2C66fycfebFspFEbrcMXYq0kqmVEAWsWND6HDuOimbQZNX10jwnITCDG6u6GNOtUo3vTOWez7MMUyQ2EJSYF6Q/jdB9U+oaNZIQ+Lkme8X0Y1kZk6evA9nOytEYdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777356293; c=relaxed/simple;
	bh=2Mt7uUJePTtBOs80C/UCxpiCjlEW0lAPBbbyTxJ6Fwg=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ne3dVpk1odW+XBNAeQ3XYdQm4R/i8jFry3/td6rcX3jMDlg/bnGQALmZdYLPYW4gC976lN/FhvA42c2htBePAF/+zQPqR/7Swv1BexC5CzZ3xs4GT7X12kzwhGxSaGd+GDQMedSAcRkPjXYYT9GCzwlu8ctQqQ1MbMGjNsLg9Q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=WaDQ/4In; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=GWnblFVM; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=WaDQ/4In; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=GWnblFVM; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="WaDQ/4In";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GWnblFVM";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="WaDQ/4In";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GWnblFVM"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 3E17C5BD0A;
	Tue, 28 Apr 2026 06:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777356290; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/ER5LZCAAsHKY1g7Hwq6Kpzv3g+WbuVWN8L24K2+jxQ=;
	b=WaDQ/4In72V9X9zFGYYc9JiPccBho0exUQOM6I1j/3JyKl5wvIajjH/sx67v3mF1Be0uqC
	sFC8RO649eUVO5wFgnMjaZW4I3o5C5fzPEsjMfLAGf3G2jBTQuQcxdi45VkJTD/gbjCr8L
	F6cfPy1KXCGa8sDtojev02/Y5bOcXZE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777356290;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/ER5LZCAAsHKY1g7Hwq6Kpzv3g+WbuVWN8L24K2+jxQ=;
	b=GWnblFVMPAqHsC/CdJTK7jazZRF0tyYmj/a5lzCKNGKCA91uOzIHTImx+m5jbtjUJzhKzn
	+NZIVrKDZoiGjCDg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="WaDQ/4In";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=GWnblFVM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777356290; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/ER5LZCAAsHKY1g7Hwq6Kpzv3g+WbuVWN8L24K2+jxQ=;
	b=WaDQ/4In72V9X9zFGYYc9JiPccBho0exUQOM6I1j/3JyKl5wvIajjH/sx67v3mF1Be0uqC
	sFC8RO649eUVO5wFgnMjaZW4I3o5C5fzPEsjMfLAGf3G2jBTQuQcxdi45VkJTD/gbjCr8L
	F6cfPy1KXCGa8sDtojev02/Y5bOcXZE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777356290;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/ER5LZCAAsHKY1g7Hwq6Kpzv3g+WbuVWN8L24K2+jxQ=;
	b=GWnblFVMPAqHsC/CdJTK7jazZRF0tyYmj/a5lzCKNGKCA91uOzIHTImx+m5jbtjUJzhKzn
	+NZIVrKDZoiGjCDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E707E593B0;
	Tue, 28 Apr 2026 06:04:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qTRmMgFO8GmrJgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 28 Apr 2026 06:04:49 +0000
Date: Tue, 28 Apr 2026 08:04:49 +0200
Message-ID: <87340ffwn2.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Abhinav Mahadevan <abhi220204@gmail.com>
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ALSA: usb-audio: Add quirk for PreSonus AudioBox USB
In-Reply-To: <20260428005433.6326-1-abhi220204@gmail.com>
References: <20260410143335.5974-1-abhi220204@gmail.com>
	<20260428005433.6326-1-abhi220204@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 3E17C5BD0A

On Tue, 28 Apr 2026 02:51:19 +0200,
Abhinav Mahadevan wrote:
> 
> The PreSonus AudioBox USB (0x194f:0x0301) only supports S24_3LE
> format for both playback and capture. It does not support S16_LE
> despite being a USB full-speed device. Add explicit format quirks
> for both the playback (interface 2) and capture (interface 3)
> interfaces to ensure correct format negotiation.
> 
> Signed-off-by: Abhinav Mahadevan <abhi220204@gmail.com>
> ---
> 
> v2: Fix placement -  entry was incorrectly inside a #if 0 disabled block.
> Moved to after the #endif /* disabled */.

The patch description doesn't match with what you actually change
here.  Also, as it's a correction, it should have a Fixes tag.
Please update the description and resubmit.


thanks,

Takashi

>  
>  sound/usb/quirks-table.h | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/usb/quirks-table.h b/sound/usb/quirks-table.h
> index 803e03d4d..4e9cfff40 100644
> --- a/sound/usb/quirks-table.h
> +++ b/sound/usb/quirks-table.h
> @@ -2652,6 +2652,9 @@ YAMAHA_DEVICE(0x7010, "UB99"),
>  		}
>  	}
>  },
> +
> +#endif /* disabled */
> +
>  {
>  	/*
>  	 * The AudioBox USB advertises S24_3LE as the only supported format
> @@ -2700,7 +2703,6 @@ YAMAHA_DEVICE(0x7010, "UB99"),
>  		}
>  	}
>  },
> -#endif /* disabled */
>  
>  {
>  	/*
> -- 
> 2.43.0
> 
