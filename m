Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9AE638DC4A;
	Fri,  7 Aug 2026 08:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786091950; cv=none; b=gutrmvMkrN8/w5SbcBKI5H/x1/MJrRV7lUtcd2LHF1maZzPmV46IcMXwEimdIk0yHoAXGdZLfbqWFRQ5+paPwJT3D+SdPc0eoAzzdot36fL48RzJaQ96XsMvaYwpC9bfdKBEZPIeO3lDbPw4T4ZZ2uMHknZgvfKhiFTNh0FLOt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786091950; c=relaxed/simple;
	bh=QZ9wUXZTGrUEMvp/WsCD+RLBd0dbPYKEgqwDNPnVp7g=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KBxMdE16KY6jW8UUO/E0guDr5lJrW8AJjJSSAWugyY1y0TbMqwBAwJe8hDyn9Omse1CA8pF1ZjeHJjXVnpTTJf4VF5RAULM40rlAflCi2UeG5VoAR5Qvc9mz6TvsLlYIO6gTt0zKGhU1W/AZjk91bXOvIADlE/G2jFgRKB/j3Ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=X2tFlbRY; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=L7ZwM7VT; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=pUwH4/X0; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=BHmbIEgt; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="X2tFlbRY";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="L7ZwM7VT";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="pUwH4/X0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BHmbIEgt"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D895D3DF6;
	Fri,  7 Aug 2026 08:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786091943; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/Pobd8eTf0Lkx0eaGGh89VOen2XEzZ2Yut1P8RZsPO4=;
	b=X2tFlbRY6jP+ZvL5sfeX2k7pAnD4Gdiqx4RXDqtZPyX413VEQsaTvYj1hEszG/iBmw6zmH
	I3nXMaGWfvrteSsPm2v+z+RTyVSK0cCIDD63tYgW+5YcPDZtG3sya0NVXjBUCmoWOmyBYa
	tIgrqSFwOjnvWSRk4+EIX9hwVpu8nXA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786091943;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/Pobd8eTf0Lkx0eaGGh89VOen2XEzZ2Yut1P8RZsPO4=;
	b=L7ZwM7VTY78PPHNNTeLAzir8KceKGwvg08AN2qMi1FKXxaSxIhZQDMQuaoaslPR5SjRaxK
	9kci/0M1RlAVnsBw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786091938; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/Pobd8eTf0Lkx0eaGGh89VOen2XEzZ2Yut1P8RZsPO4=;
	b=pUwH4/X0eRO4sPGzVeoDSUG+CzQI2HsxaIehs4MIPwdCZNnKwN9qfPQdOYtr4PnDm5R2BT
	gZyyLMyhoRN5/Rr3D1gsGoWT8noBkjfWuzXXdFW52mf9uR9s4wEaEV8JGBihr82lcdJNsx
	3CehlYi2vAgr4OwclEyBIJapYAcJUH0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786091938;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/Pobd8eTf0Lkx0eaGGh89VOen2XEzZ2Yut1P8RZsPO4=;
	b=BHmbIEgtlnDmuTWAGFG6+ASSh0vZRcZOqEJuGxwb+7LnhiyzGHXYALeMBHxbRA/7X2sxAG
	Y6UEQmoh4juZiTCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B0812779BF;
	Fri,  7 Aug 2026 08:38:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Q7DuKaKZdWrZVgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 07 Aug 2026 08:38:58 +0000
Date: Fri, 07 Aug 2026 10:38:58 +0200
Message-ID: <87wlu2b9zx.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Marco Giunta <marco_giunta@outlook.it>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: enable headset buttons on Lenovo Yoga Pro 7 14ASP10
In-Reply-To: <IA1PR19MB77127DE4BC25300BAD284E30FCD22@IA1PR19MB7712.namprd19.prod.outlook.com>
References: <IA1PR19MB77127DE4BC25300BAD284E30FCD22@IA1PR19MB7712.namprd19.prod.outlook.com>
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
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[outlook.it];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[outlook.it];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Thu, 06 Aug 2026 20:03:52 +0200,
Marco Giunta wrote:
> 
> Inline headset buttons (play/pause, volume up/down) are unresponsive on
> the Lenovo Yoga Pro 7 14ASP10. Enable headset jack handling by chaining
> alc_fixup_headset_jack to the existing bass speaker fixup for this model.
> 
> Signed-off-by: Marco Giunta <marco_giunta@outlook.it>

Applied to for-next branch.  Thanks.


Takashi
