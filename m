Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B63D222F07
	for <linux-sound@vger.kernel.org>; Mon, 11 Mar 2024 12:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710160693; cv=none; b=V6ivixIEl0WJUtud0pAZkhQyx7rVzT5Eu6jwj1xYeWv+muUxI0LpfSVylya3IiFFerDLCsXGu0rcp2vranzhdLRQcMPPMAG4GIVpickgz/q8fADdJkzKgXxEFEEfbH75TjiNE6+15sv4atsaMSRRUq8bwlvas0BN+qmqoTEkC/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710160693; c=relaxed/simple;
	bh=Mlv7sjeA4nNifq8gwRIDuMKgotpfVjcL396hMnVjP3g=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MryMpUXGnrX+zEBV3rsVfh/FL12b/K+H65PBh1vCvaoai2fGkI+JtgGmVMYrazt36wnaBaY60PQwx4iwtRDO88eIYCJJJCi9+iMfr8ASTFeqTOs2wIGyh9oF0TTR5hLI1JJheIJmrlZ8mj4Mqq0UBxsmpbszX88e/9VTTzaQx4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rCjAMR2I; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=KLPfU+ym; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rCjAMR2I; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=KLPfU+ym; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rCjAMR2I";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KLPfU+ym";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rCjAMR2I";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KLPfU+ym"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9151234C3A;
	Mon, 11 Mar 2024 12:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1710160689; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4dIiiI2VguoDL28iEkka4FgXOz3fd6Adgh52BSQMWx4=;
	b=rCjAMR2Itl0JFd5G8HckA9NQTCFTDoEq9FilHrvzVxML8BwwEJBbqJJL09oo/kIUj0Kfp7
	OUV0Xy6Sru2lkqm7EZ2gbCiDeiDjF6RdRTV1kZIrU23DJ+W5H8Ll/1xu4d5AJlmnw0I2WS
	5Lx4U7NwRDLvqtfpXeEcR6kLnZOhkDg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1710160689;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4dIiiI2VguoDL28iEkka4FgXOz3fd6Adgh52BSQMWx4=;
	b=KLPfU+ymVyr8OKKGZpoTudYLVdnmwCc3BaHFOgFwmpJ38MxWUt837xoFW6qaVxLNU4gxAB
	XtguGQ9R08XlqyAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1710160689; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4dIiiI2VguoDL28iEkka4FgXOz3fd6Adgh52BSQMWx4=;
	b=rCjAMR2Itl0JFd5G8HckA9NQTCFTDoEq9FilHrvzVxML8BwwEJBbqJJL09oo/kIUj0Kfp7
	OUV0Xy6Sru2lkqm7EZ2gbCiDeiDjF6RdRTV1kZIrU23DJ+W5H8Ll/1xu4d5AJlmnw0I2WS
	5Lx4U7NwRDLvqtfpXeEcR6kLnZOhkDg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1710160689;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4dIiiI2VguoDL28iEkka4FgXOz3fd6Adgh52BSQMWx4=;
	b=KLPfU+ymVyr8OKKGZpoTudYLVdnmwCc3BaHFOgFwmpJ38MxWUt837xoFW6qaVxLNU4gxAB
	XtguGQ9R08XlqyAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 51AE213695;
	Mon, 11 Mar 2024 12:38:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Y45OEjH77mXVRgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 11 Mar 2024 12:38:09 +0000
Date: Mon, 11 Mar 2024 13:38:08 +0100
Message-ID: <87zfv59c5r.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "Geoffrey D. Bennett" <g@b4.vu>
Cc: Takashi Iwai <tiwai@suse.de>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: scarlett2: Fix Scarlett 4th Gen input gain range again
In-Reply-To: <Ze7OMA8ntG7KteGa@m.b4.vu>
References: <Ze7OMA8ntG7KteGa@m.b4.vu>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -3.27
X-Spamd-Result: default: False [-3.27 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[4];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-2.97)[99.88%]
X-Spam-Flag: NO

On Mon, 11 Mar 2024 10:26:08 +0100,
Geoffrey D. Bennett wrote:
> 
> The 4th Gen input preamp gain range is 0dB to +69dB, although the
> control values range from 0 to 70. Replace SCARLETT2_MAX_GAIN with
> SCARLETT2_MAX_GAIN_VALUE and SCARLETT2_MAX_GAIN_DB, and update the TLV
> again.
> 
> Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
> Fixes: a45cf0a08347 ("ALSA: scarlett2: Fix Scarlett 4th Gen input gain range")

Thanks, applied now.


Takashi
