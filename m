Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9103D19CC02
	for <linux-sound@vger.kernel.org>; Thu, 28 Nov 2024 13:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732802018; cv=none; b=ZAYaKX1lF9DKam7dgafNmzDbM7nglSiAzW2T4Tzh0cT0bJtcYl9bB0diPcfwjuLnsGGJ17I8ACXqwE09I+y9R/luUpylw7I0kUAJKewVaJiHliCyKjtZ/ClhTsNGBWLPUUm74fVL1X28n9VnhIBMP6diybqJPNPTsG24Rj4Mj0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732802018; c=relaxed/simple;
	bh=rtCbeOJjeUaqMOfoXfsJsNtAK2sJwFZrZnYnj2E4Hiw=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JLwcRPAijUVl4pvQqFT0fQFvqowwTlYstIS8lMNXXlpI59vv7gk2gRY68akyDoVEOqq8MmBHPlVEGr5Mqe2k/cTFdEfTfws8a7MuO3tkPdMaf6/jL4w/NQWOW8zgXqTdBdSnUjOhBcynCI4LhFuH4yLFXcMzM8dWrO+ktYcGkFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CjE6Bu0t; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=It+rS1eR; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CjE6Bu0t; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=It+rS1eR; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CjE6Bu0t";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="It+rS1eR";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CjE6Bu0t";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="It+rS1eR"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A685F21177;
	Thu, 28 Nov 2024 13:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1732802014; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AYQzlAaj6JhrTYITDl6yUPsfi1VYN5xBVnwvlkTFnf8=;
	b=CjE6Bu0tR5ceK0zqbmY0BuWi836byhAiJG/jbvy1YZq2t0kRRWsME8aRqswt5PGcCK62Ox
	UZ84qYvZgOACkL0negKr0laOheVFa7iW89OB/Gnli3L3+loecxZ8Q8V/lsUKKARC9J7nG9
	M4BNd7ZnFY6v7EgFKroI6LdkTtvhw1I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1732802014;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AYQzlAaj6JhrTYITDl6yUPsfi1VYN5xBVnwvlkTFnf8=;
	b=It+rS1eR35BrMKx0dT/IW9Dxq5wXOBAUOXQb3OFyimbLQ5DI5yBJ1i9+3rgckHwxeXXEMB
	XjaQtgfk7Ixn6UDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1732802014; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AYQzlAaj6JhrTYITDl6yUPsfi1VYN5xBVnwvlkTFnf8=;
	b=CjE6Bu0tR5ceK0zqbmY0BuWi836byhAiJG/jbvy1YZq2t0kRRWsME8aRqswt5PGcCK62Ox
	UZ84qYvZgOACkL0negKr0laOheVFa7iW89OB/Gnli3L3+loecxZ8Q8V/lsUKKARC9J7nG9
	M4BNd7ZnFY6v7EgFKroI6LdkTtvhw1I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1732802014;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AYQzlAaj6JhrTYITDl6yUPsfi1VYN5xBVnwvlkTFnf8=;
	b=It+rS1eR35BrMKx0dT/IW9Dxq5wXOBAUOXQb3OFyimbLQ5DI5yBJ1i9+3rgckHwxeXXEMB
	XjaQtgfk7Ixn6UDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8317C13690;
	Thu, 28 Nov 2024 13:53:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id N31RHt51SGd2BgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 28 Nov 2024 13:53:34 +0000
Date: Thu, 28 Nov 2024 14:53:34 +0100
Message-ID: <8734jb4g81.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jaroslav Kysela <perex@perex.cz>
Cc: Linux Sound ML <linux-sound@vger.kernel.org>,
	Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH] ALSA: hda: improve bass speaker support for ASUS Zenbook UM5606WA
In-Reply-To: <20241128112145.3409492-1-perex@perex.cz>
References: <20241128112145.3409492-1-perex@perex.cz>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
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
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Level: 

On Thu, 28 Nov 2024 12:21:45 +0100,
Jaroslav Kysela wrote:
> 
> This hardware has ALC294 codec with speaker NID 0x17 and bass speaker
> NID 0x15.
> 
> This patch removes DAC NID 0x06 (without volume control) from
> the connection list for bass speaker NID 0x15. Both speaker PINs
> are routed to DAC NID 0x03 with this change.
> 
> Link: https://github.com/alsa-project/alsa-ucm-conf/issues/467
> Signed-off-by: Jaroslav Kysela <perex@perex.cz>

Applied now.  Thanks.


Takashi
