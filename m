Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 529F62989A7
	for <linux-sound@vger.kernel.org>; Fri, 23 May 2025 18:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748026764; cv=none; b=gu4450mMaCIB14/298rPyynhuDJKSpiNvCW9aVeCU4gL0eeeYqWHzZPPE38z31CDvDrJqvfcg9W1K8MmKmsqLD5v/R+KtK6dg5xyZfJQiBf5L2ictMygQSaeRETFJ8FhcJnbEOKoMjlViw4D1UIWLCnYu2YIwOXVLGiDyzH9f1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748026764; c=relaxed/simple;
	bh=8JFFw8zNKIi7z6qBfnBHQ5SyzNHJ8aUXYnybVBG/79M=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZJSPeamjNxDKuFcHr1HcjqF5R6OYLXfRwkOxDVXMPdssNEsqmBCk8uP4fCPOcYRLdcz4wxvY0NmY8SvcTTWZ8LhAvHq29QKY32IRS4Wgm69iQzbKQ6Ckuo8JtAsx7c+UPKx672kXSEGqw18nUqlNJCBvKdGAiDmIl65stzvpmCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=f+VcHwGS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=jlubhF7a; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=f+VcHwGS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=jlubhF7a; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="f+VcHwGS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jlubhF7a";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="f+VcHwGS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jlubhF7a"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 58FBC1F7D8;
	Fri, 23 May 2025 18:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1748026760; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VdY8rO5jBOkqBpq4q126ri/uFEbFyx4oVTCP0e+l+R0=;
	b=f+VcHwGSlDRSIYHs1635283+eySrIcdyeBlzbF72KglpP4DCwXfJMUETHrkDJj6gvsxzMP
	02ezBh+A14FYO+ht20Yv4AihWHkJHCSYagwX7BfBjMISELYHZHV6Ysf+i/hAwbOz25pty9
	hcA7cJzWZ+nH+e1nj60/5fCIzYakYIA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1748026760;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VdY8rO5jBOkqBpq4q126ri/uFEbFyx4oVTCP0e+l+R0=;
	b=jlubhF7a2b0OsYKkXRv7lhTlIzNOL7Acwp3tLdMZvIgtnTK91QarGPKVVNFEAO+BzSVwpm
	PEFyaYt58EbOIiCA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=f+VcHwGS;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=jlubhF7a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1748026760; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VdY8rO5jBOkqBpq4q126ri/uFEbFyx4oVTCP0e+l+R0=;
	b=f+VcHwGSlDRSIYHs1635283+eySrIcdyeBlzbF72KglpP4DCwXfJMUETHrkDJj6gvsxzMP
	02ezBh+A14FYO+ht20Yv4AihWHkJHCSYagwX7BfBjMISELYHZHV6Ysf+i/hAwbOz25pty9
	hcA7cJzWZ+nH+e1nj60/5fCIzYakYIA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1748026760;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VdY8rO5jBOkqBpq4q126ri/uFEbFyx4oVTCP0e+l+R0=;
	b=jlubhF7a2b0OsYKkXRv7lhTlIzNOL7Acwp3tLdMZvIgtnTK91QarGPKVVNFEAO+BzSVwpm
	PEFyaYt58EbOIiCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2ADE4137B8;
	Fri, 23 May 2025 18:59:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id z8jCCIjFMGh7VgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 23 May 2025 18:59:20 +0000
Date: Fri, 23 May 2025 20:59:19 +0200
Message-ID: <87frgvrw54.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mario Limonciello <superm1@kernel.org>
Cc: mario.limonciello@amd.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: Decrease level of 'cannot get freq at ep' message
In-Reply-To: <20250523184829.1099198-1-superm1@kernel.org>
References: <20250523184829.1099198-1-superm1@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spamd-Bar: /
X-Spam-Flag: NO
X-Spam-Score: -0.51
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 58FBC1F7D8
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-0.51 / 50.00];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim]

On Fri, 23 May 2025 20:48:16 +0200,
Mario Limonciello wrote:
> 
> From: Mario Limonciello <mario.limonciello@amd.com>
> 
> Not all USB audio devices support reading the sample rate from a
> control message.  For the audio controller in Lenovo Thinkpad Thunderbolt
> 3 dock this message is emitted multiple times.
> 
> As this is expected behavior for some devices, decrease the message
> to debug.
> 
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

Could you try to set the quirk flag QUIRK_FLAG_GET_SAMPLE_RATE for the
device instead (as found in quirk_flags_table[] in quirks.c)?

The error is real, and if it's known to be broken, we shouldn't try to
read the result rate on such a device at all.


thanks,

Takashi

> ---
>  sound/usb/clock.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/usb/clock.c b/sound/usb/clock.c
> index 842ba5b801eae..521d8733bce5c 100644
> --- a/sound/usb/clock.c
> +++ b/sound/usb/clock.c
> @@ -498,7 +498,7 @@ static int set_sample_rate_v1(struct snd_usb_audio *chip,
>  			      UAC_EP_CS_ATTR_SAMPLE_RATE << 8,
>  			      fmt->endpoint, data, sizeof(data));
>  	if (err < 0) {
> -		dev_err(&dev->dev, "%d:%d: cannot get freq at ep %#x\n",
> +		dev_dbg(&dev->dev, "%d:%d: cannot get freq at ep %#x\n",
>  			fmt->iface, fmt->altsetting, fmt->endpoint);
>  		chip->sample_rate_read_error++;
>  		return 0; /* some devices don't support reading */
> -- 
> 2.43.0
> 
> 
