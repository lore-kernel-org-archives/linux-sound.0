Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B34F249CF55
	for <linux-sound@vger.kernel.org>; Wed,  2 Sep 2026 13:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788356637; cv=none; b=lEV9XLt83gYlDpSnlguwzjgGkTEamF7HsOhfIeSE3ayle5xTnljMDNRKnN82UgA77kNqUeMe5WEPJCwo1vefFjHXzRQfMOs72tPU+4DJURGICMvjVTpDhH/kivg0bJBZ9iHYf/BT14yiB1XrJxSUKdhycr1cldT58rXcNNSwz9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788356637; c=relaxed/simple;
	bh=RCciGfFw5taz+gW2IwVYOqAVTqelCqMB3uj3vnGVhFU=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rbo2XL+aOtBTqLO7+jS8RNjE2YlIOlnNLAZDP+j94/csBZG8OpesqkuPVyJIzNhCbTmFoseNb9iKp7Rpijx2/wGVIQD0P3lQUFie0dhITB/3KXgJJl5gtEHY9HzFgddjTWZZXhkYmYQ++Pwt0kfs1tBYDE3NBp9KChxMz6D2Xhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=XwlnLwR/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=KrBqmiU/; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1dm50bIB; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=4bNQWHK0; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="XwlnLwR/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KrBqmiU/";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1dm50bIB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4bNQWHK0"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8A6BE21D21;
	Wed,  2 Sep 2026 13:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788356627; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1S4HyPPqundG+6X2hPWcInQaECd4G+vFEjW5Z+bIx5g=;
	b=XwlnLwR/y6UBSWE5Hau1XgXA5BlQVvI0folXl826CBjybPIPdsnIRkrhmzf6zg/gWWS3aS
	auve/8Cz8YEf3IHS09WQ57eNtvOwGL+usy7mGnL0f9a+HHm8Ywm7yoaIj4/+LtOI3EXwSZ
	ScT56fS91B01CuCuavShCF0BCKbGY/Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788356627;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1S4HyPPqundG+6X2hPWcInQaECd4G+vFEjW5Z+bIx5g=;
	b=KrBqmiU/fyTX3gz+kim8uW1APNeq+d+ONwBrnOXKeagg+F+893a/iwwLKeBPTHhlrXp3la
	3n4oGQJpAciooLAQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=1dm50bIB;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=4bNQWHK0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788356623; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1S4HyPPqundG+6X2hPWcInQaECd4G+vFEjW5Z+bIx5g=;
	b=1dm50bIB7Rx4e8xBEbHJS379gAt15E7twyo9/BPHfK5nEKg20Q9469G+hxZ6DLl6qe1uoj
	fbS+GLeg7D6LeqB9+pN80j39w0+ZmMH44mgDG4QNg2pPpxsc3R+NHcZV2o/gSlB0DUxHFa
	pIj3hpeZ80uTqcao2tHPjV+pHaz2Ykc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788356623;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1S4HyPPqundG+6X2hPWcInQaECd4G+vFEjW5Z+bIx5g=;
	b=4bNQWHK0x8edgYg8vuTn2hqZP22Wh4znU4zHVUseOGvkxUiqx7hMJ7+hwURsQvOi3yG8Ls
	QubzyyBoE5VOroDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4528413515;
	Wed,  2 Sep 2026 13:43:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id m2+oDw8omGp/ZwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 02 Sep 2026 13:43:43 +0000
Date: Wed, 02 Sep 2026 15:43:42 +0200
Message-ID: <87h5k7ahv5.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: broonie@kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v4 02/10] ALSA: hda: ext: Clean up streams if their initialization fails
In-Reply-To: <20260902081814.1590883-3-cezary.rojewski@intel.com>
References: <20260902081814.1590883-1-cezary.rojewski@intel.com>
	<20260902081814.1590883-3-cezary.rojewski@intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.51
X-Rspamd-Queue-Id: 8A6BE21D21
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:email,suse.de:mid];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO

On Wed, 02 Sep 2026 10:18:06 +0200,
Cezary Rojewski wrote:
> 
> snd_hdac_ext_stream_init_all() does not rollback changes done when
> the allocation fails. Fix that to simplify its usage.
> 
> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>

In case the series go through Mark's tree:

Acked-by: Takashi Iwai <tiwai@suse.de>


thanks,

Takashi
