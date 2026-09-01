Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08D9C3A1695
	for <linux-sound@vger.kernel.org>; Tue,  1 Sep 2026 11:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788262995; cv=none; b=VrwPMddJVV3E/mp4ANoxkf269Vm9GJf5c5+4sHKADU0iBq9Nli9XPBkluvH+PORuzHTc4ISM8vNWbA55omkp2/lbIbY1i42wX4FtVb30QB6doe9RcdHv9SqnaLx0dp9V2maJpikNzvrtuE09JPIJQT6ucgi+KZLfIPGqXvIHR3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788262995; c=relaxed/simple;
	bh=4SVmyaXL4HRefThEMObgxr1cj/vTMbCt4n6UkBus6O0=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YCk3A4qZ9wQEwaWloFHwzV+oWPRYvtkDUnpvLXVocTen3tXYGcgJFAtu8yHnkt5tbmaoyAkk58qcNg5jko7qZz7Mk+tV2D2rR37ZwJNldFWvdxo+CJG97Jz0CmdF20YjBdcQeo9fSu1gifB7YgFjioHtpCCu998o5IN4XYYeG44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=u8lQrRIz; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=9FtRypZ2; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Oa8mRJuf; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HcAofrxZ; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="u8lQrRIz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9FtRypZ2";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Oa8mRJuf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HcAofrxZ"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 898C81FD26;
	Tue,  1 Sep 2026 11:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788262981; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BsrwDx9AU9DgMbsRNVYm2mzy+dU5hGtwc8c5qXgNMO8=;
	b=u8lQrRIzjCYw4x1XRr7rUBW+bcaoax8krI1/nRfyoj0hCRiBTtjPLUpVnHUl+DWP9yoTaH
	7XaUzE+CWT3aFJVP5xu1S6YDLn50mN4wiAo1ui1CsA9s7KG7INwQkw9DK7sFj2ZNgZhVby
	ihKgncnyssqHgbtC7gytAWRaZYtpG3Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788262981;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BsrwDx9AU9DgMbsRNVYm2mzy+dU5hGtwc8c5qXgNMO8=;
	b=9FtRypZ26HNQHSZjeVWdYj1uDFemcaNLUtGw3X5Wpicsb0koDzP71nl7u9Nsfx/qfSpJ/u
	BIn1AB2ZEbvxAyBw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Oa8mRJuf;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=HcAofrxZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788262977; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BsrwDx9AU9DgMbsRNVYm2mzy+dU5hGtwc8c5qXgNMO8=;
	b=Oa8mRJuf4RxRaRMOcFkAPSpv12J5vi753E8mQsyTnMbegxfYyNG6rwvbZVvN/FXixPPJlO
	wesCWMru440XX8Z5sjW1Tiv5M0HwGZzB6sPXOAgO3JIDExO9BcqmOWmQrp/HadjQEC6RiS
	HlZ/lJ2RWkSmRwS3hZAAHkt/i8Drj8k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788262977;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BsrwDx9AU9DgMbsRNVYm2mzy+dU5hGtwc8c5qXgNMO8=;
	b=HcAofrxZaKM2kTlcnle9l5tHMaAP5IDzlZidFIM/2ZwfApAMww6zvtr6+mtAJtsFjz6K25
	MsLmGs9Ne+xAWzBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 59AF71369E;
	Tue,  1 Sep 2026 11:42:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id v1RGFUG6lmpYSgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 01 Sep 2026 11:42:57 +0000
Date: Tue, 01 Sep 2026 13:42:57 +0200
Message-ID: <87se3tci4e.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: broonie@kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v3 02/10] ALSA: hda: ext: Clean up streams if their initialization fails
In-Reply-To: <20260831164233.1487766-3-cezary.rojewski@intel.com>
References: <20260831164233.1487766-1-cezary.rojewski@intel.com>
	<20260831164233.1487766-3-cezary.rojewski@intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -4.51
X-Rspamd-Queue-Id: 898C81FD26
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	DWL_DNSWL_LOW(-1.00)[suse.de:dkim];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid,intel.com:email];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO

On Mon, 31 Aug 2026 18:42:25 +0200,
Cezary Rojewski wrote:
> 
> snd_hdac_ext_stream_init_all() does not rollback changes done when
> the allocation fails. Fix that to simplify its usage.
> 
> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
> ---
>  sound/hda/core/ext/stream.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/hda/core/ext/stream.c b/sound/hda/core/ext/stream.c
> index 517bd151fcc3..51adc42587b3 100644
> --- a/sound/hda/core/ext/stream.c
> +++ b/sound/hda/core/ext/stream.c
> @@ -94,6 +94,7 @@ int snd_hdac_ext_stream_init_all(struct hdac_bus *bus, int start_idx,
>  	int (*setup_op)(struct hdac_stream *, bool);
>  	int stream_tag = 0;
>  	int i, tag, idx = start_idx;
> +	struct hdac_stream *s, *_s;
>  
>  	if (pci->device == PCI_DEVICE_ID_INTEL_HDA_APL)
>  		setup_op = snd_hdac_apl_host_stream_setup;
> @@ -103,7 +104,7 @@ int snd_hdac_ext_stream_init_all(struct hdac_bus *bus, int start_idx,
>  	for (i = 0; i < num_stream; i++) {
>  		struct hdac_ext_stream *hext_stream = kzalloc_obj(*hext_stream);
>  		if (!hext_stream)
> -			return -ENOMEM;
> +			goto err_nomem;
>  		tag = ++stream_tag;
>  		snd_hdac_ext_stream_init(bus, hext_stream, idx, dir, tag);
>  		idx++;
> @@ -112,6 +113,14 @@ int snd_hdac_ext_stream_init_all(struct hdac_bus *bus, int start_idx,
>  
>  	return 0;
>  
> +err_nomem:
> +	list_for_each_entry_safe(s, _s, &bus->stream_list, list) {
> +		struct hdac_ext_stream *hext_stream = stream_to_hdac_ext_stream(s);
> +
> +		list_del(&s->list);
> +		kfree(hext_stream);
> +	}

We may reuse snd_hdac_ext_stream_free_all() but without calling
snd_hdac_ext_stream_decouple(), too?


thanks,

Takashi
