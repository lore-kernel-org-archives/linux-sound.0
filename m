Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EF9039E19D
	for <linux-sound@vger.kernel.org>; Thu,  5 Mar 2026 13:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772715898; cv=none; b=OT/70Eyw0TjAxJRJr9AhuyFJrDMunSb8YqyFeXaAKW4r5mAEU/Z6Z3PfhXrunb5hpvf+ncXmsHR2/B0fLMs5YvyaDLp6UGdMMZZKhn9ek5hnPAUS9ny9MUW3yduEc1WJAtVBhUjy7mc8iQCn2dpUzmy0zaDA0Txssrx6xM39qNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772715898; c=relaxed/simple;
	bh=jCf/RDj8r1BAT07Xqx73OlQdbLTgeGa2f8qhe5eBdUY=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SSqmEXTfnR2eMdyJqjZ1vdImwUA8cEW9rXH5bM/uuZejkiKheCwgBqaFQl/9EUZCYw5fQVonnIuDs/AeZ/ATxJNDd5sY7ZgB2Wfo/ecQZUqLOWoL85Hkoz6ZKJjkROZTD25YgwOSiMHoCv3R+C81kccT5x/BUz62VAQ31KP9YUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=NZyFisTB; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=UknXSdwO; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=eEsiotuq; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3vMfTrTS; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NZyFisTB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="UknXSdwO";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="eEsiotuq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3vMfTrTS"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4D3FD5BDC6;
	Thu,  5 Mar 2026 13:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772715894; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OxKoH/taiGVKOMBSKXFAGKKtmELW7NTt+IUuuLd0xyQ=;
	b=NZyFisTBgeXU66slxR3IgffVLebvf3p8mJoz+/V+Fg+HU4Z3Xi8k+4yJtB/CUTdfpbacQB
	zklVZnERzKABVkO6gyp9vZl6eltEsdVX/XtfQdNyr7k/9Kq+d2/1Jav97zoZ+Tu0hK4kKA
	9crGiyt1poWY+Mp3E3NPfbDUOPWvTwQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772715894;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OxKoH/taiGVKOMBSKXFAGKKtmELW7NTt+IUuuLd0xyQ=;
	b=UknXSdwOr2K8Lg9eX85VNCHCcNDB8m7rqw/vBkPQ92lz4/QHuJjv0Mrzm5ghvqPqDqRQPc
	RBVh58oy0tOujTCQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=eEsiotuq;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=3vMfTrTS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772715893; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OxKoH/taiGVKOMBSKXFAGKKtmELW7NTt+IUuuLd0xyQ=;
	b=eEsiotuquCkVtNUXoZZrfKNV8tMhXiBY2sRY1UAyoBkEnV4eahKSg/X2VGmJI0GMYx0GGq
	WVs0uLOFqieLEw6DlhsFOZ4oE8eAKFB2bDFXax0pz0zroDu4URcxM9nKAS7DN+6CwV5P3e
	8zcTXA2SeX7ErRvUcpx9CkM6+8AK814=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772715893;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OxKoH/taiGVKOMBSKXFAGKKtmELW7NTt+IUuuLd0xyQ=;
	b=3vMfTrTSNKN/CCuJb+L4fo35ahA/oasw+xg1UCWQMaQHhmopzJB8pUdfbNTaTakFniTrXO
	eZQVcVEe4ywSbCCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 239293EA68;
	Thu,  5 Mar 2026 13:04:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id WnJ+B3V/qWlQGgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 05 Mar 2026 13:04:53 +0000
Date: Thu, 05 Mar 2026 14:04:52 +0100
Message-ID: <871phyxw97.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Johan Hovold <johan@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: us122l: drop redundant interface references
In-Reply-To: <20260305111810.18688-1-johan@kernel.org>
References: <20260305111810.18688-1-johan@kernel.org>
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
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Queue-Id: 4D3FD5BDC6
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 

On Thu, 05 Mar 2026 12:18:10 +0100,
Johan Hovold wrote:
> 
> Driver core holds a reference to the USB interface and its parent USB
> device while the interface is bound to a driver and there is no need to
> take additional references unless the structures are needed after
> disconnect.
> 
> Similarly, USB core holds a reference to all interfaces in the active
> configuration so there is no need for a driver to take a reference to a
> sibling interface only to release it at disconnect either.
> 
> Drop the redundant references to reduce cargo culting, make it easier to
> spot drivers where extra references are needed, and reduce the risk of
> memory leaks when drivers fail to release them.
> 
> Signed-off-by: Johan Hovold <johan@kernel.org>

Thanks, applied now.


Takashi
