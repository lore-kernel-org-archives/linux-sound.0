Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F3A93090EE
	for <linux-sound@vger.kernel.org>; Sat,  7 Feb 2026 13:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770470062; cv=none; b=jC2xhWAzAPQS8iLvLMJkyUqPcrLLSvUSZ/cBKUTwcCtnxbkjCVDamyEaah2vn7geA/rJHjnlIX+/g6hcL+UCxKwDreSyBeH28tNd5oH6L4AHels+uY5lou5mEXYqwuTF4ZFfXF8vF88ZsuTKLOAG+4VNTSttpu5+azmICBLsWMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770470062; c=relaxed/simple;
	bh=YAy3BjTLwxhUVmIWihgxABicphPFEq9V072wkUJWlaU=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K9xu59VRZbdtzkS8TpFQBQ5yoBtgVXuQcd+/kHovcPacHvg9U8/k2hLTu+s5LNdP7IJk5rKKRFcE65z17e0w80HXmuEQZC2hUTis44aLuEfqth5mDOZ15JI3iTV9dApctCMdbyMXGGDy4boaQjlmqw3JulzAwddhAvMNFQ3nMvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=bPcegvjv; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=lsTZl98G; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=bPcegvjv; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=lsTZl98G; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="bPcegvjv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lsTZl98G";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="bPcegvjv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lsTZl98G"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 31A103E6D3;
	Sat,  7 Feb 2026 13:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1770470055; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e5lATmPIYnRlxz34499Bn1BA4TaAHCUA1Hj5fNzvwmo=;
	b=bPcegvjvs9hAkrrEBmhar4sigY/ZNw9t1UFTLcDUQamJfcd2PzAksxtNv+eG09iVTmNjab
	knI9QZ14xkW8NMv6ateom5wc/ftSevXEVy6ozbYCxPDKrZYBQhgpfBPR5jqBIL1eCH47Gx
	6JAp2QzpveyMREbgoHpS7gfk0u5qSVI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1770470055;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e5lATmPIYnRlxz34499Bn1BA4TaAHCUA1Hj5fNzvwmo=;
	b=lsTZl98G2SqdLfC8pNXsKqcdO2gdnhBmG+0TPAOpbDjKTedsnMQKv3ndw9+rVdH/qQ6xoc
	4FXgR+Bno2exGdCA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1770470055; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e5lATmPIYnRlxz34499Bn1BA4TaAHCUA1Hj5fNzvwmo=;
	b=bPcegvjvs9hAkrrEBmhar4sigY/ZNw9t1UFTLcDUQamJfcd2PzAksxtNv+eG09iVTmNjab
	knI9QZ14xkW8NMv6ateom5wc/ftSevXEVy6ozbYCxPDKrZYBQhgpfBPR5jqBIL1eCH47Gx
	6JAp2QzpveyMREbgoHpS7gfk0u5qSVI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1770470055;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e5lATmPIYnRlxz34499Bn1BA4TaAHCUA1Hj5fNzvwmo=;
	b=lsTZl98G2SqdLfC8pNXsKqcdO2gdnhBmG+0TPAOpbDjKTedsnMQKv3ndw9+rVdH/qQ6xoc
	4FXgR+Bno2exGdCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0213F3EA63;
	Sat,  7 Feb 2026 13:14:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id vafpOqY6h2kFQgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 07 Feb 2026 13:14:14 +0000
Date: Sat, 07 Feb 2026 14:14:14 +0100
Message-ID: <877bso8zmh.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: anton <antonvg7@gmail.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org
Subject: Re: Could you help me upstream a quirk for HP ZBook Studio G4 mute LED?
In-Reply-To: <64d78753-b9ff-4c64-8920-64d8d31cd20c@gmail.com>
References: <3ccd4c55-9b8d-47d2-bac9-8c1e9290c410@gmail.com>
	<64d78753-b9ff-4c64-8920-64d8d31cd20c@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-7
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	SUBJECT_ENDS_QUESTION(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_TLS_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_THREE(0.00)[4]
X-Spam-Flag: NO
X-Spam-Score: -2.30
X-Spam-Level: 

On Fri, 06 Feb 2026 15:21:51 +0100,
anton wrote:
> 
> 
> Dear kernel sound maintainers,
> 
> Could you help me with upstreaming the following Linux kernel patch to add a
> quirk for the HP ZBook Studio G4 mute LED?
> I don¢t know how to start, but I saw similar patches get upstreamed before.
> 
> An associated bug report was made to the kernel bugzilla at 
> https://bugzilla.kernel.org/show_bug.cgi?id=221002.
> 
> After some research on forums and wiki¢s I found that adding a file at /etc/
> modprobe.d/alsa-base.conf with the contents ¡options snd-hda-intel model=
> mute-led-gpio¢ makes the mute LED work as expected for this laptop. To my
> understanding, the patch below should configure the corresponding quirk. I
> have tested the patch on the HP ZBook Studio G4 laptop in fedora, which made
> the mute led work without the file mentioned above.
> 
> Thank you for reading this far. Please let me know if you can help, or what
> the next step would be.
> 
> Best regards,
> Anton
> 
> (the patch is also added as an attachment, in case the email messed with the
> formatting.)

OK, now I submitted the proper patch.  Will be included likely in the
next 6.20 / 7.0 rc1.


thanks,

Takashi
