Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C039A189906
	for <linux-sound@vger.kernel.org>; Wed, 13 Nov 2024 07:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731482686; cv=none; b=kbGVAhm50A6+HPqAnOrUDbou9AaHQmq3PIgVIYqx4PNIoCAcbh0GJAt5GZzIhQeoyMDhZJfUxTe+Rm8Yh1EhmBN6IfPUtbjvA41zMugY6RBf6SXzvSAMlvN1bCt79kkP6sKg69zyeJdCQ6vz9g3QgH0b1IlwSZcZDyV036NkM80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731482686; c=relaxed/simple;
	bh=+aiCs6atbLHOR1LqrJ8afZ6vxbsFk3gMXPIGw9T0YPk=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tfOvEdqEM2Hp2myMIv6MnPx4fWFUhSCos13FnJwryl7srlpZAVVqF8U8k6REP9rnbQs1Jl3sBkog9Iwc3biv0LQ32VTUzDAHm5l5+A2Xr0D0qp6YMioroi7QRk1BrqUiQ9f7IkIRy1WdRmf9iolnvHM0EhUGqhN+WPO+KbWKwwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=PH6rFq3h; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=QrpWenAm; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xSi6/b3s; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=C4eR5NdI; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="PH6rFq3h";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QrpWenAm";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xSi6/b3s";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="C4eR5NdI"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E394C211E8;
	Wed, 13 Nov 2024 07:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1731482683; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FSL7y3Wx+AMj3ThwJQZovy5WKVjMzscuDYLBFJGMRRU=;
	b=PH6rFq3hGxIbwZIhRqx4u5YP9MUH+O61tFWBVfyuY/QppmzFT78BfB97cQ6sJzrXMX1Owu
	AvtMngTyqHsGPIqqB6AdMCkrUMoWtfwA51WdguaZLfDMBmU1Zr0teM8HkMFoPJ7Vk8ktLV
	F9mOrjcaJYGiBeBziZyFYI/tmI3c2Qs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1731482683;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FSL7y3Wx+AMj3ThwJQZovy5WKVjMzscuDYLBFJGMRRU=;
	b=QrpWenAmPVVVEjJ+Llw5fOZqu+zVq0HmtD+pETq+B4CkKIGL50tZgIKQrUVhLqwUwxI1PN
	oA6n5TQrlekEFTDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1731482682; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FSL7y3Wx+AMj3ThwJQZovy5WKVjMzscuDYLBFJGMRRU=;
	b=xSi6/b3sw7ccq1hPg/4MSEutrrXQMqCNyX8IDFDmsnJK4Rt3zdPaIn+pu9k9gTmIQLWzjF
	+Sjxn2+jNjodqRxkp+uaZzaeOdoH+ryMiQR0bElTHokmI3VAvGWK2ITJOYPYMjSBycpiqo
	FC5dUlsT/s25pduiK5op+6Dz4Z7/aOQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1731482682;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FSL7y3Wx+AMj3ThwJQZovy5WKVjMzscuDYLBFJGMRRU=;
	b=C4eR5NdIVoLPfCSlpuC+VfKM3oCcOKtrrhMy+SLZwmXRncdWmRAIxa0EReq0WNERGiu1Zu
	kzrjCJRVpIs773Dw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C383E13301;
	Wed, 13 Nov 2024 07:24:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id xNNzLjpUNGcrGAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 13 Nov 2024 07:24:42 +0000
Date: Wed, 13 Nov 2024 08:24:42 +0100
Message-ID: <87plmzsiit.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: tidyup SNDRV_PCM_TRIGGER_xxx numbering
In-Reply-To: <87ed3gsziy.wl-kuninori.morimoto.gx@renesas.com>
References: <87ed3gsziy.wl-kuninori.morimoto.gx@renesas.com>
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
	BAYES_HAM(-3.00)[99.99%];
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
	RCPT_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Score: -3.30
X-Spam-Flag: NO

On Wed, 13 Nov 2024 02:17:25 +0100,
Kuninori Morimoto wrote:
> 
> pcm.h has SNDRV_PCM_TRIGGER_xxx, but it is missing "2".
> Fixup it.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Let's hope that these numbers are purely internal.

Applied now, thanks.


Takashi
