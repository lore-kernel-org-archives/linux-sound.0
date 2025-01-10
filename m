Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46DBD212F84
	for <linux-sound@vger.kernel.org>; Fri, 10 Jan 2025 16:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736527450; cv=none; b=C+pNZQd6XwrLearT1fsyu9sSCtISHbiZVZKXeu/H1IuCO/YHNMhtsoF207Ukk7tKTbIfGhi6e4PhWvplGkJFWUFLnRp3qMHGD5zXnfR1+hr5+KPbhF/mRMg7PNieLuUfPfC1ifXWd+pgh950+k5bn9N4v2HkvC8yCXqKNJiaV9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736527450; c=relaxed/simple;
	bh=VvBGlF+NU+7FpKZaRJMqsCQ85MaPawEGEU1Bmfw6ZI0=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y/kcA7IwYrKiOE+6pX3iuJpvcixhgwgLq9i4tXVrtA4dx4rktZTYZg20NAA8jeq3EdKunQcyVHtlwLFChb7IyveAdG/x+qoq6oCeTQdbdoBKxuMyISVTlzRZWcwTHv0ky3PSToUEDxXBom4VSTczXc9NgFhq8C4c/X507pmux7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=aAn7UTRE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=6ozjIxrH; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=aAn7UTRE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=6ozjIxrH; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="aAn7UTRE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6ozjIxrH";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="aAn7UTRE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6ozjIxrH"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2EC3D2116E;
	Fri, 10 Jan 2025 16:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736527447; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aL/YhaReIGnJffw/1eB44y9Q1ug+TXxlCrn1iyja7hY=;
	b=aAn7UTREx+V998uvgt1S1qNFakQnk13drULYyxwFdiqMyPaNPcDlAd6dEAgIjH47lYmL5L
	qEkAkLQdacjRnhOLUezKy/e1Ad07/pSXb2tYOxFgZSVH9pDOlvq0sgtZEqCa1NhPimpatQ
	eNPNsYIFzbBzYzpmT/TP1/ZjFJ0MJZk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736527447;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aL/YhaReIGnJffw/1eB44y9Q1ug+TXxlCrn1iyja7hY=;
	b=6ozjIxrHFuhVMGsKTtskrHElgiucO5fD8GnymaYmFWOAhozFr2xvokxl0JUvVf4xHSCkEw
	vtpjqMrX86qUKoAg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736527447; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aL/YhaReIGnJffw/1eB44y9Q1ug+TXxlCrn1iyja7hY=;
	b=aAn7UTREx+V998uvgt1S1qNFakQnk13drULYyxwFdiqMyPaNPcDlAd6dEAgIjH47lYmL5L
	qEkAkLQdacjRnhOLUezKy/e1Ad07/pSXb2tYOxFgZSVH9pDOlvq0sgtZEqCa1NhPimpatQ
	eNPNsYIFzbBzYzpmT/TP1/ZjFJ0MJZk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736527447;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aL/YhaReIGnJffw/1eB44y9Q1ug+TXxlCrn1iyja7hY=;
	b=6ozjIxrHFuhVMGsKTtskrHElgiucO5fD8GnymaYmFWOAhozFr2xvokxl0JUvVf4xHSCkEw
	vtpjqMrX86qUKoAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0093F13763;
	Fri, 10 Jan 2025 16:44:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id wweLOlZOgWd2HwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 10 Jan 2025 16:44:06 +0000
Date: Fri, 10 Jan 2025 17:44:06 +0100
Message-ID: <87zfjyty95.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: tiwai@suse.com,
	linux-sound@vger.kernel.org,
	broonie@kernel.org,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com
Subject: Re: [PATCH v2 2/2] ALSA: hda: Transfer firmware in two chunks
In-Reply-To: <20250110113326.3809897-3-cezary.rojewski@intel.com>
References: <20250110113326.3809897-1-cezary.rojewski@intel.com>
	<20250110113326.3809897-3-cezary.rojewski@intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,intel.com:email,suse.de:mid]
X-Spam-Score: -3.30
X-Spam-Flag: NO

On Fri, 10 Jan 2025 12:33:26 +0100,
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

I still think that it's not best place to change.

For PCM, this workaround isn't needed in most cases, because
setup_bdle() is called per period, and periods_min = 2 for
snd-hda-intel.  Doing extra splitting is superfluous for PCM.

That said, if we need a workaround of the split, it should be done
conditionally for the firmware stream.


thanks,

Takashi
