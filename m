Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D79CB290F
	for <linux-sound@vger.kernel.org>; Thu,  9 Jan 2025 14:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736432971; cv=none; b=qpfSX+JJYXlWIGm0s/xa5Y+Onue+1vi5YzURnTZEYvevfaFHCZVKQnIUQhLhjF5h/gTfUlgDBw5GwRoVyeK1axjp2GLiqHG06B/ZRSSK2PW0oMunNP/EGTyysig6j8UMPq1PPOQ7qBOHKfB/m6OSucsu+AR8+RAMDQ/WdNIQdWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736432971; c=relaxed/simple;
	bh=PCky3xwPGirX7NfO9klVU8jh/pdtrmL1N8aUB1DF9GI=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QVHY9ZspTVZII0VlMA+lkt0IcdGUt+IeXeWv2yHV9pJU363D5wEYwXIqcdsYQnkvrkgpgP9U+14jmAzHTzf7PwGW8c/LZW82oIu1qtVS1JO6yoU2TdqvZ0Cb8Ctl4WFb4fUZnPBfo0JJcG785rp+6rhVfzQFNjM+5dGr60oZTwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dmEkilEv; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=FRE2B+To; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ytmEiG9Q; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=VzVesoYz; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dmEkilEv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FRE2B+To";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ytmEiG9Q";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="VzVesoYz"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D9F45210E4;
	Thu,  9 Jan 2025 14:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736432967; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bDNpVUuDawOisbXS0f2Dl3ChJMs+M2T3lPXR/F9Q3Og=;
	b=dmEkilEv3PomS1GWx/xPJ9y1xS5F5i7hKMtxu1u6v5mrITNPIGYAeSH4koPBvO9rfclh3T
	8qhEG84AIJr3vHtZQP6VorunAwUHLJ8Gmm8prm0Cxj0xbRLWBprK6b/5dM17dAsS/IlaLg
	JLls5zI4Q9xRA64Bks7GlfYt3xf0xU4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736432967;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bDNpVUuDawOisbXS0f2Dl3ChJMs+M2T3lPXR/F9Q3Og=;
	b=FRE2B+To7Xk/TH9nVNhliJxE/mn/+41oe3ainZzCLKDmN+FAcvLGJO3hLcBADVvrmNpfGl
	wSEXK2ezUH29ziAA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ytmEiG9Q;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=VzVesoYz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736432966; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bDNpVUuDawOisbXS0f2Dl3ChJMs+M2T3lPXR/F9Q3Og=;
	b=ytmEiG9Q63DRVgLuz1rw9GbG4V+OfkukL1YMsvQQYvkZwqMEyfdxpL+PZCe3nPriQy2i/3
	LdtwB40UEA8aMKvi7ZUq+jN//euWqYvjRTrmNkVJNDppoQDWVWRrJco7ZkTxQczIwS5CgY
	B14Pzdrmo1ZzwSXFWGJ0eEwcN9s3E6I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736432966;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bDNpVUuDawOisbXS0f2Dl3ChJMs+M2T3lPXR/F9Q3Og=;
	b=VzVesoYzRiVdqSwsu62ndt5GFBslsp5QoYLtb2QD7RLDrf08GvrBoidwdf9uNdnlsjOvwF
	0ZQM/OyAL8OlT2AQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A2447139AB;
	Thu,  9 Jan 2025 14:29:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id O91nJkbdf2ckYAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 09 Jan 2025 14:29:26 +0000
Date: Thu, 09 Jan 2025 15:29:26 +0100
Message-ID: <87y0zk5ad5.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: tiwai@suse.com,
	linux-sound@vger.kernel.org,
	broonie@kernel.org,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com
Subject: Re: [PATCH 2/3] ALSA: hda: Transfer firmware in two chunks
In-Reply-To: <20250109125204.3668961-3-cezary.rojewski@intel.com>
References: <20250109125204.3668961-1-cezary.rojewski@intel.com>
	<20250109125204.3668961-3-cezary.rojewski@intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: D9F45210E4
X-Spam-Score: -3.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On Thu, 09 Jan 2025 13:52:03 +0100,
Cezary Rojewski wrote:
> 
> As per specification, SDxLVI shall be at least 1 i.e.: two chunks to
> perform a valid transfer. This is true for the PCM transfer code but
> not firmware-transfer one.
> 
> Technical background:
> - the LVI > 0 rule shall be obeyed in PCM transfer
> - HW permits LVI == 0 when transfer is SW-controlled (SPIB)
> - FW download is not a PCM transfer and is SW-controlled (SPIB)
> 
> The above is the fundament which AudioDSP firmware loading functions
> have been built upon and worked since 2016. The presented changes are to
> align the loading flows and avoid rising more questions in the future.
> 
> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
> ---
>  sound/hda/hdac_stream.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/hda/hdac_stream.c b/sound/hda/hdac_stream.c
> index 2670792f43b4..18d74a28a246 100644
> --- a/sound/hda/hdac_stream.c
> +++ b/sound/hda/hdac_stream.c
> @@ -455,6 +455,7 @@ static int setup_bdle(struct hdac_bus *bus,
>  		      struct hdac_stream *azx_dev, __le32 **bdlp,
>  		      int ofs, int size, int with_ioc)
>  {
> +	u32 bdle_size = size / 2;
>  	__le32 *bdl = *bdlp;
>  
>  	while (size > 0) {
> @@ -469,7 +470,7 @@ static int setup_bdle(struct hdac_bus *bus,
>  		bdl[0] = cpu_to_le32((u32)addr);
>  		bdl[1] = cpu_to_le32(upper_32_bits(addr));
>  		/* program the size field of the BDL entry */
> -		chunk = snd_sgbuf_get_chunk_size(dmab, ofs, size);
> +		chunk = snd_sgbuf_get_chunk_size(dmab, ofs, bdle_size);
>  		/* one BDLE cannot cross 4K boundary on CTHDA chips */
>  		if (bus->align_bdle_4k) {
>  			u32 remain = 0x1000 - (ofs & 0xfff);

Note that we set up BDLE also for the fragment for pos_adj correction
at the beginning of the buffer.  With your patch, this small BDLE
would be split again.  I don't think it's the desired outcome.

The requirement is to have at least two BDL entries?


thanks,

Takashi
