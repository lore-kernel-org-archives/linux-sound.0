Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1AC73C943B
	for <linux-sound@vger.kernel.org>; Mon, 15 Jun 2026 11:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781522994; cv=none; b=V0Kc7/LVxqb7WA/jmWSLpXMxMfeTWhjIGBEgz2N1v7GQ3lM0CTthJqlV0EZ1nZYtENoKk1YjYrMr44zrjfDNvRY/04tjMF7oWZTO3negSw7dDaJDi5ZuoCKnkQFr0lY3HvXxY2T7tLZoMFzBBqRlhpmtGOJWS2UrIkmrW/ya9jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781522994; c=relaxed/simple;
	bh=BK0KNyftah6Yvz+TeIZ2FO6iAdkB2ZkO13H3jD+C1w4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BZpcJU6TCl/CBtWCyxuSPsnnbhH6TE6S/J9LfoFrmy6u1QnS2YKpgUlxy2HqLLP8Qrboc40ivO7OWIdfdd4tha3dNvIzX6peQN8vZxukxsul5I7CKlJEWkbX9/GA/S6SIAdCfAgORhGIFH24NzYFgFDpuHxyMMy12Tu0Fe5sN3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rl7KjGxi; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wqrVnTNW; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0YfkBKNd; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=npcuAQmu; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rl7KjGxi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wqrVnTNW";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0YfkBKNd";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="npcuAQmu"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id F10486AD39;
	Mon, 15 Jun 2026 11:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781522991; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=L4+RfMuKU7xpV3G5ZvnJm/Aj28B56po2qmmakldR3Dk=;
	b=rl7KjGxishN/9dCRXWC4MIl+OCWmCLyuhNat3Ty9EvVoF8p3oZMJ4iK9Mfmx6FTJnRV0Gb
	RhxKYHfTcCJc34oxeEfPFc7izSF2xeU+RsWwHFhpxZNny+az0FMy+M8y1yJUZmlfgB2EFE
	6bpInS/XMrLgv7HgDmMhLP55+/uZuNQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781522991;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=L4+RfMuKU7xpV3G5ZvnJm/Aj28B56po2qmmakldR3Dk=;
	b=wqrVnTNWQRLp9HDvTGj+Iehmd+Aj9TptqIdQCbjJiYmUKyDicCtIBVY0w9zoaucb6ZXbeC
	8UQWqsSyF8N8p/Bw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781522990; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=L4+RfMuKU7xpV3G5ZvnJm/Aj28B56po2qmmakldR3Dk=;
	b=0YfkBKNdQUb23Sp+c5xPujcv9aqOb4d6k72PBoq5tfZWNXHufan4UPQRG1/6axMWzRDxSj
	45L78KcY+LILShMdTTmwk8VOSRhRIGwZUF+DUlC1OiSwCYcnhi4P6apqCVSkNXsdJ/grzQ
	SF0TkyJE/bJ55n2/NVky2u1oWodNrFw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781522990;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=L4+RfMuKU7xpV3G5ZvnJm/Aj28B56po2qmmakldR3Dk=;
	b=npcuAQmuTZyds4cS8inUY6ed3OMgvN6DUNwNVQvemeTJaJZipko6EXbiygwhhV1zoKINrb
	oR1yGrMl3Lr8UFBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C84A9779A7;
	Mon, 15 Jun 2026 11:29:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 1+GnLy7iL2q3OAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 15 Jun 2026 11:29:50 +0000
Date: Mon, 15 Jun 2026 13:29:50 +0200
Message-ID: <87y0ggrqhd.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Viktor Menshin <ripeeerr@gmail.com>
Cc: linux-sound@vger.kernel.org,
	tiwai@suse.de,
	perex@perex.cz
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirk for Lenovo Xiaoxin 14 GT
In-Reply-To: <20260615092515.1082-1-ripeeerr@gmail.com>
References: <20260615092515.1082-1-ripeeerr@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
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
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Level: 
X-Spam-Score: -3.30

On Mon, 15 Jun 2026 11:25:15 +0200,
Viktor Menshin wrote:
> 
> The Lenovo Xiaoxin 14 GT (Chinese market model, AMD Ryzen AI 9 365)
> produces constant electrical hissing and crackling noise from both
> internal speakers and 3.5mm headphone jack during audio playback.
> Audio works correctly on Windows.
> 
> The PCI SSID 17aa:3912 is not present in the quirk list. The device
> shares the same AMD platform and ALC287 codec as neighboring Lenovo
> 14" AMD models (17aa:3911, 17aa:390d), so apply the same fixup.
> 
> Note: the fixup selection is based on similarity with neighboring
> models and has not been verified by testing a compiled kernel.
> Guidance from maintainers on the correct fixup is welcome.
> 
> Signed-off-by: Viktor Menshin <ripeeerr@gmail.com>

Applied now.  Thanks.


Takashi
