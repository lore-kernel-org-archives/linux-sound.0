Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A07C3E3DBE
	for <linux-sound@vger.kernel.org>; Fri, 15 May 2026 09:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778837083; cv=none; b=WPDv1iZUDp2C8O3Uoi91Otl34zgOeu8xLFy1GQPD5ywNeOoqS2ZUNycFJUlQnXEZ1r6LlvPYSVcfZIK0MvzlPUM2pjc3JjY2RCdoOnhr8Z1YcMCzYzR/+Ngg3KEKphr+x3eRDHf0ri7GBpkoY9ObX50t8466ERXA+RKK9Uwq4oI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778837083; c=relaxed/simple;
	bh=92JTTIf4gYsBrbSVgqQgXq4llv5pOTJKv3s7dXBwr6Q=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZeVsN49clCial0gJ3dwJRz/XJt1iim3p075nUS7qm92OlMpEDo9vx7nw7cj3EhZVtt+MLvRl16xHl+5Jok0M+WigGC80qS0lPM1hmRVS1BzqTsU4c7lbTohfi0VUeUdR+NOeu/kY1aLupxmRRbM1vr3JMdeh2zvZcryfYRFWN/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=TGJf0wYE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=UCIrmUp9; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=TGJf0wYE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=UCIrmUp9; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TGJf0wYE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="UCIrmUp9";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TGJf0wYE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="UCIrmUp9"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A0F056B508;
	Fri, 15 May 2026 09:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1778837080; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=D1P23YpYrSlVbLXKHOGuNZXwMScRb5beh5n0/OwBFW8=;
	b=TGJf0wYEz1GsshsD+5ixPBoO6jvVpnqXiyPLvX5jvK2qcAsZeGdjJVPV1GQnd969WcCf0Z
	/SC7IWIv12TwNkcwUbZ8KVxrzoF++Ax4/5kD041inYW7kLOtWx3X5E59jyIVLrojG7XBmt
	TUHv7vGRKPY5QbByWP5IzfhPa4y/apU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1778837080;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=D1P23YpYrSlVbLXKHOGuNZXwMScRb5beh5n0/OwBFW8=;
	b=UCIrmUp9ICB/tdRj2U5mGzF533s+OxDfJajCctxpQbZXNg6PWF6r7SuaQIZAWCClU8qzCm
	FrCGVLWzHR5pqbAA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1778837080; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=D1P23YpYrSlVbLXKHOGuNZXwMScRb5beh5n0/OwBFW8=;
	b=TGJf0wYEz1GsshsD+5ixPBoO6jvVpnqXiyPLvX5jvK2qcAsZeGdjJVPV1GQnd969WcCf0Z
	/SC7IWIv12TwNkcwUbZ8KVxrzoF++Ax4/5kD041inYW7kLOtWx3X5E59jyIVLrojG7XBmt
	TUHv7vGRKPY5QbByWP5IzfhPa4y/apU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1778837080;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=D1P23YpYrSlVbLXKHOGuNZXwMScRb5beh5n0/OwBFW8=;
	b=UCIrmUp9ICB/tdRj2U5mGzF533s+OxDfJajCctxpQbZXNg6PWF6r7SuaQIZAWCClU8qzCm
	FrCGVLWzHR5pqbAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6C281593A9;
	Fri, 15 May 2026 09:24:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id PJYBGVjmBmqIawAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 15 May 2026 09:24:40 +0000
Date: Fri, 15 May 2026 11:24:40 +0200
Message-ID: <87ecjdt487.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Zhang Heng <zhangheng@kylinos.cn>
Cc: Takashi Iwai <tiwai@suse.de>,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: Fwd: [PATCH] ALSA: hda/generic: Add mic autoswitch support for dyn_adc_switch mode
In-Reply-To: <be6ddfdc-7cd2-460f-be75-c30f90a1bceb@kylinos.cn>
References: <5b215802-4c94-4f94-9cee-f8e497b31337@kylinos.cn>
	<a7daf8a3-559b-4532-a2ee-a211a7e0e0b0@kylinos.cn>
	<87ecjnp8dx.wl-tiwai@suse.de>
	<7493b4e0-2b8c-435f-8421-ed397593356a@kylinos.cn>
	<be6ddfdc-7cd2-460f-be75-c30f90a1bceb@kylinos.cn>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Level: 

On Fri, 08 May 2026 04:50:22 +0200,
Zhang Heng wrote:
> 
> I tested this change:
> 
> In create_capture_mixers in generic.c:
> 
> - name = nums > 1 ? "Input Source" : "Capture Source";
> + name = "Input Source";
> 
> And it also works normally. It seems that user-space does not handle
> "Capture Source" very well. So should we just remove "Capture Source"?

If this really works, it is rather a question to user-space behavior,
specifically alsa-lib's interpretation.


Takashi
