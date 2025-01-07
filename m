Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B36B01F0E41;
	Tue,  7 Jan 2025 13:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736256953; cv=none; b=NRsxKUvuwfrB5l0jc8EZ5BlXILPkYhepE9TOlYWdGyECZDFNA8ZxIqE9/q+FIk3PAQXUeHh1DAOXF+SPhlS1puNtdq+T7j+6QUxv/8os5pzupobKU+VwHrcHvkW34saLbi4iWTQR8m1hrGExs5yVuliijNiSCi17sWYZYK9ojfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736256953; c=relaxed/simple;
	bh=3iYi1rZ4URlPoTwm31YZpZ9JD5DgT9h6LL500ut/Q88=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GXmsRJZutAq5IIfmhJtOTLzJ0d1UG7IaOXeyYkUwVjnvTJB3eJcFW+2C7gNQPKw9klbB0W6HLUeFbuHQlTMFKi0R4bv4KJnETL68hTJOfoCNTyVEl9X+9+ECoDPl4U8o9/ktXkCn4aWiLVzZxujrZs25rjaG5VbVRqOnTHBtnvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=In/u1bcH; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=LMa+ieP+; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=In/u1bcH; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=LMa+ieP+; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="In/u1bcH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LMa+ieP+";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="In/u1bcH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LMa+ieP+"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B12321F385;
	Tue,  7 Jan 2025 13:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736256939; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gnySLUjz3DZBwYTkWURu5F0NHYWDi1nNMPN32QMqJsE=;
	b=In/u1bcHdo/HYGDMN7BJlQ7tOUkppmA20p0VccVxoNQhqj3i11yUDTlIBgOg8Ejj7Huhdg
	T95EP28+7vAT3xS3KAIjPM9r/TBrAXP+ktNKo6vMkXo7FK6SdmrTtJJwjJ9nN39A0i9LIa
	4n111PJ4sHi429ZpzhLSGFpiKIenxhY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736256939;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gnySLUjz3DZBwYTkWURu5F0NHYWDi1nNMPN32QMqJsE=;
	b=LMa+ieP+GwtdExGN1utGQzirk5XGkaC1C5kBUaoayKPoHTPVYsYY6QEuYQnWa34lTkmpeZ
	s1G4IIP840phWfBQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736256939; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gnySLUjz3DZBwYTkWURu5F0NHYWDi1nNMPN32QMqJsE=;
	b=In/u1bcHdo/HYGDMN7BJlQ7tOUkppmA20p0VccVxoNQhqj3i11yUDTlIBgOg8Ejj7Huhdg
	T95EP28+7vAT3xS3KAIjPM9r/TBrAXP+ktNKo6vMkXo7FK6SdmrTtJJwjJ9nN39A0i9LIa
	4n111PJ4sHi429ZpzhLSGFpiKIenxhY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736256939;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gnySLUjz3DZBwYTkWURu5F0NHYWDi1nNMPN32QMqJsE=;
	b=LMa+ieP+GwtdExGN1utGQzirk5XGkaC1C5kBUaoayKPoHTPVYsYY6QEuYQnWa34lTkmpeZ
	s1G4IIP840phWfBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7693213A6A;
	Tue,  7 Jan 2025 13:35:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id QK44G6stfWdUJQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 07 Jan 2025 13:35:39 +0000
Date: Tue, 07 Jan 2025 14:35:39 +0100
Message-ID: <87o70iwxuc.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: ens137x: Use str_on_off() helper in snd_ensoniq_proc_read()
In-Reply-To: <20250107120809.4393-1-thorsten.blum@linux.dev>
References: <20250107120809.4393-1-thorsten.blum@linux.dev>
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
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Flag: NO
X-Spam-Level: 

On Tue, 07 Jan 2025 13:08:06 +0100,
Thorsten Blum wrote:
> 
> Remove hard-coded strings by using the str_on_off() helper function.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Thanks, applied now.


Takashi
