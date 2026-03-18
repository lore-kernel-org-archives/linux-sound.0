Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0652E37998A
	for <linux-sound@vger.kernel.org>; Wed, 18 Mar 2026 11:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773833818; cv=none; b=FZWIH8PeroeojaEemrR9GZgNnVd78zBN6PXo3CrBp1cjDyjKjACo5aeMuF4wIwA09hEAyDzlFCrpzqnrUEw2256ogq+9+yj3LBX8BsnyGXVsdwnrPmnZ4cAd1dhXKPUatNe4Q1dHptHQgxczy0dLSIsHury0+L7sSP/FYb8Tdro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773833818; c=relaxed/simple;
	bh=xFdHR/XpXSbArAjFbBcJE5O5tqxE+oS9NVqrBmnD3wo=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UCvNyi2vcAZpG9ENPNpB70pvB+g7fsEL4Wavy1sP41kkKmYZsSBQAbZgcHlKoelGef0TFxa18dqopESHySeE9O6qh+Kqv3/U6eAqA7jpN3ng1H2CcXCzLQTimClaYPQCFGNb+lTUDK6EHA6gIB1A++vJSu+ywufdrpWX0ZUZVGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xBXXqv3Y; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=2N3qRCJt; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xBXXqv3Y; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=2N3qRCJt; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xBXXqv3Y";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2N3qRCJt";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xBXXqv3Y";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2N3qRCJt"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 55E2C4D330;
	Wed, 18 Mar 2026 11:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773833815; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tpXCPqSoRHXl2a/JFAfw+jg+apVvqSAXnqEqfAjgN0o=;
	b=xBXXqv3YrELpTTlyFKXm8lPfj7J/55P72gORpDqmjiTzsnebOc+hc3GmlfP+e67U24wvi5
	63ZLFkSgoiFzSV/PwYx3v9mj5vp/RH/nUcsXJccogb1qUTnyt71baxMkl8/4Z3D45695uP
	p+MqbtxEKSc5wyT5zZrbxFhTd2sc65c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773833815;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tpXCPqSoRHXl2a/JFAfw+jg+apVvqSAXnqEqfAjgN0o=;
	b=2N3qRCJt5gmKz8yQlLdMBNH191h3i6nd5t1mg7xkffpJBWSeovF6CFNEBf+bb33dm6G65G
	miCwwg0dm7jnwKAQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773833815; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tpXCPqSoRHXl2a/JFAfw+jg+apVvqSAXnqEqfAjgN0o=;
	b=xBXXqv3YrELpTTlyFKXm8lPfj7J/55P72gORpDqmjiTzsnebOc+hc3GmlfP+e67U24wvi5
	63ZLFkSgoiFzSV/PwYx3v9mj5vp/RH/nUcsXJccogb1qUTnyt71baxMkl8/4Z3D45695uP
	p+MqbtxEKSc5wyT5zZrbxFhTd2sc65c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773833815;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tpXCPqSoRHXl2a/JFAfw+jg+apVvqSAXnqEqfAjgN0o=;
	b=2N3qRCJt5gmKz8yQlLdMBNH191h3i6nd5t1mg7xkffpJBWSeovF6CFNEBf+bb33dm6G65G
	miCwwg0dm7jnwKAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 25F484273B;
	Wed, 18 Mar 2026 11:36:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 6HoECFeOummALQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 18 Mar 2026 11:36:55 +0000
Date: Wed, 18 Mar 2026 12:36:54 +0100
Message-ID: <87h5qdcqsp.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Frank Zhang <rmxpzlb@gmail.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	quic_wcheng@quicinc.com,
	arnd@arndb.de,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA:usb:qcom: add AUXILIARY_BUS to Kconfig dependencies
In-Reply-To: <20260317102527.556248-1-rmxpzlb@gmail.com>
References: <20260317102527.556248-1-rmxpzlb@gmail.com>
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
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Tue, 17 Mar 2026 11:25:27 +0100,
Frank Zhang wrote:
> 
> The build can fail with:
> 
> ERROR: modpost: "__auxiliary_driver_register"
> [sound/usb/qcom/snd-usb-audio-qmi.ko] undefined!
> ERROR: modpost: "auxiliary_driver_unregister"
> [sound/usb/qcom/snd-usb-audio-qmi.ko] undefined!
> 
> Select AUXILIARY_BUS when SND_USB_AUDIO_QMI is enabled.
> 
> Signed-off-by: Frank Zhang <rmxpzlb@gmail.com>

Applied now.  Thanks.


Takashi
