Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB0C27281E
	for <linux-sound@vger.kernel.org>; Wed, 29 Apr 2026 05:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777441965; cv=none; b=hJqfB3JUjwjN07X0oUHPps06hgAJj0qFgsCkiutskGUpock67d16+c9gI5gRkaxxljyo3BYaK2378pXUN8ynD3dGfM+9O4VNg2BNk1o+zCdDTL63KiQZUuH13+lslR72mSBQMT/gK3c+xOKztSlgTbQEFe1ZcaoYp3K4jYYGVY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777441965; c=relaxed/simple;
	bh=SBNe4G8/X1mf15vUXNVpzp0ekL8sbDhv8F+gyeAd440=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=huio5bGSVmKFFKh0ETvCvFN43L+oSOzdIsm1QM/mSh8TXbMuuQ8y0rzgzOFqCqdbxL8/Vj8fG001uUX3/L5qo/50JiyZlc1+WkUHvvCdE6NeVhYqnYu0NXOH1UPHlHXCLRMDKIX4wtTNfHntSKLJSWFq3xE1s9hrwz6+RtiBy/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jsEReIMr; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=GuEzb4o5; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jsEReIMr; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=GuEzb4o5; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jsEReIMr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GuEzb4o5";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jsEReIMr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GuEzb4o5"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 2A0325BCD5;
	Wed, 29 Apr 2026 05:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777441963; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SzNyjss8XyLkYnRwTpQlth9l4b5nxurycxLqFvQ3kcU=;
	b=jsEReIMrbsBToM2th5rT0f0XDruh2UsiMkp+i0M7WCbMML7X2geXoE8svvKpZPuytL1VQZ
	r8ldlpcRXXVsjIIMzrGq1qqxv3aqrDEoYBgx8wcpACRwIGnkWyCzFUk8Mq9irb1GZRyGZR
	EIdIb0cZWf7cA+ovqhbVhkIalsh8quc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777441963;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SzNyjss8XyLkYnRwTpQlth9l4b5nxurycxLqFvQ3kcU=;
	b=GuEzb4o5v5xnwPB9731rBHYpYtZE0uzgh4h7RpyBcZyjdLZ8bSQycQq+4OlTo4AeYtBlmd
	zaMWDXGNscfv4dBQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777441963; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SzNyjss8XyLkYnRwTpQlth9l4b5nxurycxLqFvQ3kcU=;
	b=jsEReIMrbsBToM2th5rT0f0XDruh2UsiMkp+i0M7WCbMML7X2geXoE8svvKpZPuytL1VQZ
	r8ldlpcRXXVsjIIMzrGq1qqxv3aqrDEoYBgx8wcpACRwIGnkWyCzFUk8Mq9irb1GZRyGZR
	EIdIb0cZWf7cA+ovqhbVhkIalsh8quc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777441963;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SzNyjss8XyLkYnRwTpQlth9l4b5nxurycxLqFvQ3kcU=;
	b=GuEzb4o5v5xnwPB9731rBHYpYtZE0uzgh4h7RpyBcZyjdLZ8bSQycQq+4OlTo4AeYtBlmd
	zaMWDXGNscfv4dBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 00C79593B0;
	Wed, 29 Apr 2026 05:52:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id lGh1Oqqc8WmVMQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 29 Apr 2026 05:52:42 +0000
Date: Wed, 29 Apr 2026 07:52:42 +0200
Message-ID: <871pfyqpn9.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?C=E1ssio?= Gabriel <cassiogabrielcontato@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: wavefront: add suspend and resume support
In-Reply-To: <20260427-wavefront-pm-v1-1-9c1b6a898673@gmail.com>
References: <20260427-wavefront-pm-v1-1-9c1b6a898673@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spam-Score: -3.30
X-Spam-Level: 
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
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO

On Mon, 27 Apr 2026 17:36:49 +0200,
Cássio Gabriel wrote:
> 
> The WaveFront driver still lacks support for suspend and resume
> in both the ISA and PnP driver tables.
> 
> Wire the driver into ALSA PM by storing the WSS codec pointer in the card
> private data and adding shared suspend/resume callbacks. Resume cannot
> simply rerun snd_wavefront_start(), because with the default fx_raw=1
> setting that would reset the synth on every resume and discard uploaded
> WaveFront RAM contents.
> 
> Cache wavefront.os for PM, probe the ICS2115 after resume and only run
> the full reset/bootstrap path when the board comes back raw. When the
> firmware is still running, refresh the software slot bookkeeping and
> restore the MIDI routing state without forcing a synth reset.
> 
> Also quiesce and restart the WaveFront MIDI output timer across suspend
> and resume so active rawmidi output does not race the PM transition.
> 
> This restores the card to a usable baseline after resume while preserving
> uploaded samples and programs when the hardware state survives suspend.
> If the board resumes raw, userspace still needs to reload custom synth
> contents.
> 
> Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>

Applied to for-next branch now.  Thanks.


Takashi
