Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A8F3F54D8
	for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 09:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785404138; cv=none; b=MnPlRDkJmy0F1M9K5tbDBreuX4dm2eY8Rs2KbtS1mtUi52HRL4ix9I+ikbNz2JU2OMRm11do/GbsN0LuBKDhsuyNO1n53Rg+iceloLOvl+Wft9alDNpf5JZs0xgNXBwSGXax7mMwMbWhWoFdKJTKmxgUVxDYqEWJGz70n8TK3W0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785404138; c=relaxed/simple;
	bh=zs1J8snldzHlfrfQrnPfT9sMQvai2z5GYkXsfha9+vU=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZMRxXs1n/cG4bF0kRjtjtKEITpZ0uAOISc4ljtQ6dKX5yCK7MFcH5k7yKuJey6LXhSETKMX5j6KqirTdantaXAOuQxc5O9pE4a8vqETGZ8x25ADzGkfq+TdoavU5wdo+M8gms1isTsMtMfeWA1/c+h1WAltzmpI0u3ELJH+jar8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=XuTBEfBD; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=rLc7dj1w; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=MGqDH0UV; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=uEaYBrBH; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="XuTBEfBD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rLc7dj1w";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MGqDH0UV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="uEaYBrBH"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id AEE047B76C;
	Thu, 30 Jul 2026 09:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785404130; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3mDSESGaemKlzEjaPj+PnlVlFVEhgWFr5NcqYb8qbNE=;
	b=XuTBEfBDXpDZMK1faQYE7ixSCUe92JifDXbwGxtQxCs890FH+Mxso+1myMYZzrZskj+O7y
	jcV0fXrNf5UheZXUbtyV9R0gstU49p4bEKwGpSMwf3jV0vA5LXwwFbyJEWpgzOhfrQZXC4
	1YInx0fQvj6sG4ubYegMS7IS5AD9iQU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785404130;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3mDSESGaemKlzEjaPj+PnlVlFVEhgWFr5NcqYb8qbNE=;
	b=rLc7dj1wFMYV/uiRcBi1EPP4xOmNQp95+zqRJrr4/midraX+jJJnqe2KC9PL+sBlMQEe6C
	tHCAGFAKrVU8BoCQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=MGqDH0UV;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=uEaYBrBH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785404126; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3mDSESGaemKlzEjaPj+PnlVlFVEhgWFr5NcqYb8qbNE=;
	b=MGqDH0UVqjbZ80NOTwUhrSGY39ywmE80zgd9KEUZFoGx1vPxJC2j131GKD/DUEVfUIIjv3
	QG5Bep9wEYAM2DMj4DUDoIszT3HL93Fau+rK09Z4iboevc0Q+W4zaVFT2UwWt1LxKg2+5D
	cVpSj1j43kN/3QtG5l7y2HC2h5h3mFI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785404126;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3mDSESGaemKlzEjaPj+PnlVlFVEhgWFr5NcqYb8qbNE=;
	b=uEaYBrBHghNberoFhwws7E67IPZlU8sl0JrmURC7+ZngUTIg1WaYDeHok4RTTX9lWhwN6x
	Y+ELrRLPeMFZ1ACQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 81DEA779CC;
	Thu, 30 Jul 2026 09:35:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id pyJUHt4aa2ocewAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 30 Jul 2026 09:35:26 +0000
Date: Thu, 30 Jul 2026 11:35:26 +0200
Message-ID: <87o6fo3jmp.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: songxiebing <songxiebing@kylinos.cn>
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ALSA: hda/realtek: add missing error checks for COEF index reads in alc269
In-Reply-To: <20260730015302.253008-1-songxiebing@kylinos.cn>
References: <20260729063803.1453980-1-songxiebing@kylinos.cn>
	<20260730015302.253008-1-songxiebing@kylinos.cn>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -4.51
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: AEE047B76C
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	DWL_DNSWL_LOW(-1.00)[suse.de:dkim];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kylinos.cn:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

On Thu, 30 Jul 2026 03:53:01 +0200,
songxiebing wrote:
> 
> From: Bob Song <songxiebing@kylinos.cn>
> 
> alc_read_coef_idx() and alc_read_coefex_idx() can return -1 on error
> via snd_hda_codec_read(). Several codec initialization and shutdown
> functions save these return values and later write them back to
> hardware registers without checking for errors, potentially corrupting
> COEF register state on a read failure.
> 
> Add error checks in:
> - alc282_init() and alc282_shutup(): check coef78 before write-back
> - alc285_hp_init(): check coef38/coef0d/coef36 before update, check
>   val before write-back, and break polling loop on error
> - alc294_hp_init(): break polling loop on read error
> 
> Signed-off-by: Bob Song <songxiebing@kylinos.cn>
> ---
> v2:
>  - Separate processing of return values from reading COEF and
> null pointer detection for device.

Applied to for-next branch.  Thanks.


Takashi
