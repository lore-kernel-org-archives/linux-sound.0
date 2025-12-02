Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB932BE7C6
	for <linux-sound@vger.kernel.org>; Tue,  2 Dec 2025 16:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764694515; cv=none; b=RSH3NvjAmZbmEfdlaZEyqeT7FhqqIloddDTCDZmZGe3qMs4xxRgTy1kwfJ6kIBDxkLvzP8Sim8ufqH0cLNOMgQybI6qMNATrdKmuhdOJjA18+WMvY170F4msnclO7NVn1mEmvqnmH3IuRUEJsToyJQ6Bo6eS2jI3vUwumLN4cwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764694515; c=relaxed/simple;
	bh=Nm8CHo2/wVnkSx9CDFubjw/7urzCPmetAEy36Z/n0Sc=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=USppB1WWiKjzt3BNfS7/KsLlnGJ7/33cPp3xsRgSxW0B1KDzzz/GDfCjcRqiZg+5fCPhHChs7PEYaANVJcX+dy+6SjgYZJr719t37YRfO8rAGHqNt+WyhXROGkWu/LEGh/1wl/zVTHGqqeZSgfngJW9dCWgpQVoYKFeoCoCDLvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=KItYjhNB; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=FKZnD8TI; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=n1lRYyKx; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=hLJS0uro; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="KItYjhNB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FKZnD8TI";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="n1lRYyKx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hLJS0uro"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B363B5BCC4;
	Tue,  2 Dec 2025 16:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1764694512; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tKvHImWVJBoMb97AFfMIepg5sxKKV3YxIoneRlKLuJg=;
	b=KItYjhNB2RVhpt9u1v5abTIJfmpS40wXkJX5YK0r2nwJ0lMaRmlwoJU1J0ZdMseJ/GscWH
	CIzVp1abeod9wZ4TD2lGnK87nstTUSgxljSn4ZCuv/kAhUPskWmNlw1Intp4ott+MAdH5P
	oopPSbiUbpIScuO4nYkrK58MCG1y6t0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1764694512;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tKvHImWVJBoMb97AFfMIepg5sxKKV3YxIoneRlKLuJg=;
	b=FKZnD8TIlDBtftvgU907zIy4NKk6tCIFCa3R7l0HXPTxdKgxapg20PrVZcGZCFX2jNDkwJ
	C5npIsurt1anNsDg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1764694510; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tKvHImWVJBoMb97AFfMIepg5sxKKV3YxIoneRlKLuJg=;
	b=n1lRYyKx66CN8pWi0549QXtMWd10SjCpHAsIssuLQuGr1ihg8SFz24kO3TLsy50II9+DO4
	Rr3qsSGaxbjcUqapqwiJrcDjS8r106xOh7N7hVUrtxBTsXHISCfRPKilKbUrfwXIn3eSfb
	heK+J3A1RXMW/T7Oj9yHeLVmeUVmVVU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1764694510;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tKvHImWVJBoMb97AFfMIepg5sxKKV3YxIoneRlKLuJg=;
	b=hLJS0uromI1N+PPQ5avH6AaweWdOtiPxJky9eZTZ4UT2w4D79fOI6SbywBsXcFwTKDHhIv
	XjpieUQQVNtJXFAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8EDB73EA63;
	Tue,  2 Dec 2025 16:55:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id h7K5Ie4ZL2m5ewAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 02 Dec 2025 16:55:10 +0000
Date: Tue, 02 Dec 2025 17:55:10 +0100
Message-ID: <87ikeou8lt.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Ilyas Gasanov <public@gsnoff.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v2] ALSA: hda/realtek: Add PCI SSIDs to HP ProBook quirks
In-Reply-To: <20251202154930.74481-1-public@gsnoff.com>
References: <20251202131508.56184-1-public@gsnoff.com>
	<20251202154930.74481-1-public@gsnoff.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -3.27
X-Spam-Level: 
X-Spamd-Result: default: False [-3.27 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.17)[-0.864];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	URIBL_BLOCKED(0.00)[suse.de:mid,linux-hardware.org:url,gsnoff.com:email,imap1.dmz-prg2.suse.org:helo];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gsnoff.com:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo]

On Tue, 02 Dec 2025 16:49:30 +0100,
Ilyas Gasanov wrote:
> 
> According to HW probes, there exist upgraded variants of HP ProBook
> 440/450 G8 notebook PC hardware, with PCI SSIDs not yet covered:
> 
>  - https://linux-hardware.org/?id=pci:8086-a0c8-103c-8a76
>    (HP ProBook 440 G8, SSID 103C:8A76, Tiger Lake HDA, ALC236)
>  - https://linux-hardware.org/?id=pci:8086-a0c8-103c-8a77
>    (HP ProBook 450 G8, SSID 103C:8A77, Tiger Lake HDA, ALC236)
> 
> The HDA GPIO indices for the mic mute (0x1) and speaker mute (0x2) LEDs
> are virtually guaranteed to be identical for the HP ProBook 440/450 G8
> variants with motherboard SSIDs 8A74/8A75 (BIOS T87) and 8A76/8A77 (BIOS
> T88); especially since spare keyboard parts are interchangeable between
> different revisions of the same notebook models, and thus necessarily
> have the same slot pinouts.
> 
> Signed-off-by: Ilyas Gasanov <public@gsnoff.com>

Thanks, applied now.


Takashi
