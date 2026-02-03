Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11D5121D3F6
	for <linux-sound@vger.kernel.org>; Tue,  3 Feb 2026 17:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770138918; cv=none; b=YO7G+Y7+AraTpp6ku9uIDK/WSMMYWx9oaV20uv4zA8490WbaO0RvDsVrPsQ8P48vRkkwNB0SzFGdtULDgDZkVMVod8RU2XDUHNU4svr/oTC7hK4zfyvDvTcW9Fmg2jfJUoF/MPlPZC9uh+hdqclJusGA13KElaQ1V/ypxibnNP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770138918; c=relaxed/simple;
	bh=ZoC7kB/XOa83lqNtWAwXfrLey3mE9+gM80GbLTKOdQs=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hmpInXroAJopglMIHU7Om3/oHXlW3hCZ/UJ+uSKvr0/K9VaT9Ms3fl2SowLoMijLuLU655kKFzvEUkmdePJdveWNIVJQ994w/oKFf45DCur8Lt4tCABVFo6xHujT65gsQYrTtZORqiLvwga0bBIEqBaXG+nL4F04CKl0305O1Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=KbMgm4pX; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=d/MHfN2r; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=M6iEWI8U; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=lxa/Q7Tq; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="KbMgm4pX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="d/MHfN2r";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="M6iEWI8U";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lxa/Q7Tq"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5D5675BCCC;
	Tue,  3 Feb 2026 17:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1770138910; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ml9iSGJq4y1rZLwTcDpTo93B9/idFrHA9RwWnfA4qQM=;
	b=KbMgm4pXLIk4KHu0GbcgjuCEyURnmdiU1P/43hAfCVVKM9RtX5RgAIvuwWXIW0cV7rOViK
	8WRUCndQePKz7CNuaPmTr7bWUDlEKdx11W0sMUBDFDhrED7hCyJz3OHO3pBFq55nYQeaEb
	rhyp6WTjfCoUw91vScbZUsyX5+oOH6Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1770138910;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ml9iSGJq4y1rZLwTcDpTo93B9/idFrHA9RwWnfA4qQM=;
	b=d/MHfN2rrH1ydOw3L3MAFj8pNzjPC8IDTcQaUqtyGpLVbPL7Q/VT/6+Rt4SW6ufqv2i6jp
	/89Ld4JBdbruvfCg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1770138909; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ml9iSGJq4y1rZLwTcDpTo93B9/idFrHA9RwWnfA4qQM=;
	b=M6iEWI8UVZrWXUQF1cJ+ZUgacLByPR2YNpPG7JKim+dVw0i9951kchvUyTgsPy7SeftTEb
	DODOeRnxrAmwjtnRK6D3288zw41XFbQ00zCGc0RXsmS9htXcefDQbpJDcc9wlm2bpEz8ll
	XRsrhApBWTsu4RrxvAp3Hm3GzOODDSA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1770138909;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ml9iSGJq4y1rZLwTcDpTo93B9/idFrHA9RwWnfA4qQM=;
	b=lxa/Q7TqqQr+e37Dz7qWn1HcRC716YadsVyXbU8ajs+sN6cSxMzPB567hHz8AMX3DDk/x+
	FK5sTNWm4oOLPnDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 29E153EA62;
	Tue,  3 Feb 2026 17:15:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id FSgECR0tgmmHdgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 03 Feb 2026 17:15:09 +0000
Date: Tue, 03 Feb 2026 18:15:08 +0100
Message-ID: <87tsvxkaub.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Sergey Shtylyov <s.shtylyov@auroraos.dev>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	<linux-sound@vger.kernel.org>,
	Mathieu Bouffard
	<mbouffard@strangequarks.org>
Subject: Re: [PATCH] ALSA: usb-audio: fix broken logic in snd_audigy2nx_led_update()
In-Reply-To: <20260203161558.18680-1-s.shtylyov@auroraos.dev>
References: <20260203161558.18680-1-s.shtylyov@auroraos.dev>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 
X-Spam-Flag: NO

On Tue, 03 Feb 2026 17:15:57 +0100,
Sergey Shtylyov wrote:
> 
> When the support for the Sound Blaster X-Fi Surround 5.1 Pro was added,
> the existing logic for the X-Fi Surround 5.1 in snd_audigy2nx_led_put()
> was broken due to missing *else* before the added *if*: snd_usb_ctl_msg()
> became incorrectly called twice and an error from first snd_usb_ctl_msg()
> call ignored.  As the added snd_usb_ctl_msg() call was totally identical
> to the existing one for the "plain" X-Fi Surround 5.1, just merge those
> two *if* statements while fixing the broken logic...
> 
> Found by Linux Verification Center (linuxtesting.org) with the Svace static
> analysis tool.
> 
> Fixes: 7cdd8d73139e ("ALSA: usb-audio - Add support for USB X-Fi S51 Pro")
> Signed-off-by: Sergey Shtylyov <s.shtylyov@auroraos.dev>

Applied now.  Thanks.


Takashi
