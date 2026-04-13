Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B392C11E4
	for <linux-sound@vger.kernel.org>; Mon, 13 Apr 2026 05:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776058422; cv=none; b=mN603Up9eLKQ2Qk3bIqNHK1qZHZT0vyZWpBtd1dWV1Z2myGWphlE/xnLvH5oqGeX7PU9v9i2SPiHN3OPASEH7g8toagUSxcn5g3O6MpOEqmdVaqrIA3IfFbFN+0MUfx08l1tAyYSMxBXH2nRnn28jIzb8/Mqnzm2Y1Lv+Z/db4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776058422; c=relaxed/simple;
	bh=A0nu626TADKLfjtCgXkRbKcHACBoyiqg060ZCo71ypc=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ixH2JGuqW9Ik/xG7sXUSGFVjQEkjl7S4csQbWov6jiIQVl4DvY01nuLilv/fGXvcV7dlLPM5tAtzeO/UjKOK2I/qRtWZrVmOWICw+8ANtGcAantqCcS3TwVlQQO67XrhLKRj0EPKA04oqSxdf09xdAzHZVnAv6jPh7J0Z8LyDn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=pI30No/l; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Qo+kfPqR; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=pI30No/l; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Qo+kfPqR; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="pI30No/l";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Qo+kfPqR";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="pI30No/l";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Qo+kfPqR"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 38FA16A83A;
	Mon, 13 Apr 2026 05:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776058419; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Y5niuR9q35mIjdDEZmcnXmS9rJJpAvPyQ4QlYSqcgfw=;
	b=pI30No/lsPoZOHRpMR/SOD2NRVqB/8f+hMHVJIA47ZaZQ6l/25vHiFF2MjnjqV4K+X2zLe
	8nyr7D29UgVixLKIzDfE19S/OsTU3g9t3xAVkois57wXSB71excQwMyQh91y59j02gdVZj
	Cx3akdDgXYL1NIlOtXs4qmM1GBfbPD4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776058419;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Y5niuR9q35mIjdDEZmcnXmS9rJJpAvPyQ4QlYSqcgfw=;
	b=Qo+kfPqRM0UWHGBdIXjoRerQqnBr3TjDro6K3HHCpogx1iWhGntjgkibsFECKFGqJNasPt
	Jf7V8rdGaS1RaxBg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776058419; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Y5niuR9q35mIjdDEZmcnXmS9rJJpAvPyQ4QlYSqcgfw=;
	b=pI30No/lsPoZOHRpMR/SOD2NRVqB/8f+hMHVJIA47ZaZQ6l/25vHiFF2MjnjqV4K+X2zLe
	8nyr7D29UgVixLKIzDfE19S/OsTU3g9t3xAVkois57wXSB71excQwMyQh91y59j02gdVZj
	Cx3akdDgXYL1NIlOtXs4qmM1GBfbPD4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776058419;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Y5niuR9q35mIjdDEZmcnXmS9rJJpAvPyQ4QlYSqcgfw=;
	b=Qo+kfPqRM0UWHGBdIXjoRerQqnBr3TjDro6K3HHCpogx1iWhGntjgkibsFECKFGqJNasPt
	Jf7V8rdGaS1RaxBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EC0384AD0A;
	Mon, 13 Apr 2026 05:33:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id tvFSNzKA3GkiXwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 13 Apr 2026 05:33:38 +0000
Date: Mon, 13 Apr 2026 07:33:38 +0200
Message-ID: <87mrz7whjh.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Berk Cem Goksel <berkcgoksel@gmail.com>
Cc: zonque@gmail.com,
	tiwai@suse.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	andreyknvl@gmail.com,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 2/2] ALSA: caiaq: take a reference on the USB device in create_card()
In-Reply-To: <20260413034941.1131465-3-berkcgoksel@gmail.com>
References: <20260413034941.1131465-1-berkcgoksel@gmail.com>
	<20260413034941.1131465-3-berkcgoksel@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,suse.com,perex.cz,vger.kernel.org];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Mon, 13 Apr 2026 05:49:41 +0200,
Berk Cem Goksel wrote:
> 
> The caiaq driver stores a pointer to the parent USB device in
> cdev->chip.dev but never takes a reference on it. The card's
> private_free callback, snd_usb_caiaq_card_free(), can run
> asynchronously via snd_card_free_when_closed() after the USB
> device has already been disconnected and freed, so any access to
> cdev->chip.dev in that path dereferences a freed usb_device.
> 
> On top of the refcounting issue, the current card_free implementation
> calls usb_reset_device(cdev->chip.dev). A reset in a free callback
> is inappropriate: the device is going away, the call takes the
> device lock in a teardown context, and the reset races with the
> disconnect path that the callback is already cleaning up after.
> 
> Take a reference on the USB device in create_card() with
> usb_get_dev(), drop it with usb_put_dev() in the free callback,
> and remove the usb_reset_device() call.
> 
> Fixes: b04dcbb7f7b1 ("ALSA: caiaq: Use snd_card_free_when_closed() at disconnection")
> Cc: stable@vger.kernel.org
> Cc: Andrey Konovalov <andreyknvl@gmail.com>
> Signed-off-by: Berk Cem Goksel <berkcgoksel@gmail.com>
> ---
> v2:
>  - Correct "Fixes:" tag
>  - Remove null check before the usb_put_dev() call in card_free()

Applied now.  Thanks.


Takashi
