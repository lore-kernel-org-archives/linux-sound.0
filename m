Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E9A2045B2;
	Wed, 22 Jan 2025 08:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737534556; cv=none; b=gGYKnXa6E0nZCenH6KUaMSg3jTQAYomuCb6ZlSqD9lJHn6estCrjPhDb63JbLiDNFBypd8qxTC1kCPrzwkWh/3plvJPFT4txGVQV6cTvUJtj8gHczl/f57YNmZYAhw9y2tLhx0ahJQtFzK++knHV/L89Wr6k/xAKdGy/pdiLlw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737534556; c=relaxed/simple;
	bh=CVq5xltmM0Cley0Er0FX/4Dj1j/t5vS6NzLTfwso22Q=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lLKEGxAgNiwezo1cXMNFmEfVN1DvLP5z279ffzIJ9pcG52t8cHd3NifsN6C/hjJiipISP5TR2y/oQSDecHfzgaRmPxI4CWMnCxXrg5xV0QiWjU7eE5Bgcm+ohhyteTs8kNLaUQlKWWiQuMPIKTrauj9LEdwA77mqnoojEkrz+HA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=FYyQF9wu; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HE29vusH; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=FYyQF9wu; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HE29vusH; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FYyQF9wu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HE29vusH";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FYyQF9wu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HE29vusH"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 230BD1F7CB;
	Wed, 22 Jan 2025 08:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1737534553; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=C979fM05W5O0Oolf48y53+TS8lGXfGY4QwrsCCdVHi4=;
	b=FYyQF9wuDw2YSFfIPlIprBW8Z+a9CuaCN2QCzn5o1yoQvR9fr1/+XRIFsQQwKEHqyNIPaV
	/w6DS37UTGElWvNP5C7chbvcKohBR0Juiib8xEbY7PQWlwFoc48hA9lxYnO0Qi/Z+Xl+Ch
	1uVf1mzSYePFpkwgfyp+gmA9yEHk0r0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1737534553;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=C979fM05W5O0Oolf48y53+TS8lGXfGY4QwrsCCdVHi4=;
	b=HE29vusHUPomfo17/VZGjeWIUSWkbNiV4OljeTmWJhpXwyDMj1AJr8dP1iY+9Wu6bxQsBZ
	V2oTu9Pk7sGtUBBQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1737534553; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=C979fM05W5O0Oolf48y53+TS8lGXfGY4QwrsCCdVHi4=;
	b=FYyQF9wuDw2YSFfIPlIprBW8Z+a9CuaCN2QCzn5o1yoQvR9fr1/+XRIFsQQwKEHqyNIPaV
	/w6DS37UTGElWvNP5C7chbvcKohBR0Juiib8xEbY7PQWlwFoc48hA9lxYnO0Qi/Z+Xl+Ch
	1uVf1mzSYePFpkwgfyp+gmA9yEHk0r0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1737534553;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=C979fM05W5O0Oolf48y53+TS8lGXfGY4QwrsCCdVHi4=;
	b=HE29vusHUPomfo17/VZGjeWIUSWkbNiV4OljeTmWJhpXwyDMj1AJr8dP1iY+9Wu6bxQsBZ
	V2oTu9Pk7sGtUBBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E2326136A1;
	Wed, 22 Jan 2025 08:29:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qnUeNliskGdAeQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 22 Jan 2025 08:29:12 +0000
Date: Wed, 22 Jan 2025 09:29:12 +0100
Message-ID: <8734hb8d5z.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Baojun Xu <baojun.xu@ti.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH 0/2] ALSA: hda: tas2781-spi: Fix a couple Smatch things
In-Reply-To: <45cc3652-a7a1-4e0c-9a61-5ed5579cd9a9@stanley.mountain>
References: <45cc3652-a7a1-4e0c-9a61-5ed5579cd9a9@stanley.mountain>
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
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -3.30
X-Spam-Flag: NO

On Wed, 22 Jan 2025 08:17:57 +0100,
Dan Carpenter wrote:
> 
> Fix a couple Smatch warnings in this new driver.
> 
> Dan Carpenter (2):
>   ALSA: hda: tas2781-spi: Delete some dead code
>   ALSA: hda: tas2781-spi: Fix error code in tas2781_read_acpi()

Applied both now.  Thanks.


Takashi
