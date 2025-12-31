Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681141B81D3
	for <linux-sound@vger.kernel.org>; Wed, 31 Dec 2025 15:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767195927; cv=none; b=MtdI6/ZyRGmPoM+6X9i24VeH90oh2/xH4qz7mcxfSeqx/d60d9hoHlNHWgu7qpBdlf7LHC5ZiIHIb0I6ywU9RqPuFeNLf6WWKhOIXp+RNwbY7Yt6HIft6NpyRhRM3MnGX9hRTWqh71hMts+1ZLYH0S6mFVETakqGLDgnnrx7hnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767195927; c=relaxed/simple;
	bh=YVf+ZQkPbsABmc9NBVM4uwlq7/LuQD3NqE+eARahSpk=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SIIZnPA/5DliAjghwOJF3xCZ0ISV28srQOGcaud2yxk8jsck8gJYkuZ7jRVsIaWMIYmCSX2gxgu5qul36xY60Xdrlt/4hqAwPIj1l6dhshDREZxO2RclaGhz5PpC4+AJaK0e827neDOg85kUIiS/zdas79beeQjPE+7AyEeLtAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=FRSo14cA; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=14wxyMW8; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=FRSo14cA; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=14wxyMW8; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FRSo14cA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="14wxyMW8";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FRSo14cA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="14wxyMW8"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A76F05BD41;
	Wed, 31 Dec 2025 15:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1767195924; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5+rXzaW5b5VmAaZbsFKZIsfgXoW2GkmKgJzm1NE7pYo=;
	b=FRSo14cAOVgYCrZnvJvEsEHfxUoVTus1YeJQ/fUWKpaY4HwrKLZO4SdHBKEFdeYh9RKXLK
	aGZnMmygXD6uav8WWJGL3/Q6orvX8b3RDkuNfo4y9X69zll8lK8PvN8A+Cbf09cv6hbXrX
	IeVPJkH88iYrvmoAJ9VJeXVZtcSi334=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1767195924;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5+rXzaW5b5VmAaZbsFKZIsfgXoW2GkmKgJzm1NE7pYo=;
	b=14wxyMW88HLkAlEgTFYsxgfxl4griaqbSd+wL3dnmxc/uuXJOAlOVE1wy9Vmtp1fvTeh7o
	bTu1MR/7A/zmOfDg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1767195924; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5+rXzaW5b5VmAaZbsFKZIsfgXoW2GkmKgJzm1NE7pYo=;
	b=FRSo14cAOVgYCrZnvJvEsEHfxUoVTus1YeJQ/fUWKpaY4HwrKLZO4SdHBKEFdeYh9RKXLK
	aGZnMmygXD6uav8WWJGL3/Q6orvX8b3RDkuNfo4y9X69zll8lK8PvN8A+Cbf09cv6hbXrX
	IeVPJkH88iYrvmoAJ9VJeXVZtcSi334=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1767195924;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5+rXzaW5b5VmAaZbsFKZIsfgXoW2GkmKgJzm1NE7pYo=;
	b=14wxyMW88HLkAlEgTFYsxgfxl4griaqbSd+wL3dnmxc/uuXJOAlOVE1wy9Vmtp1fvTeh7o
	bTu1MR/7A/zmOfDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6C786137FE;
	Wed, 31 Dec 2025 15:45:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id o494GBRFVWnLaQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 31 Dec 2025 15:45:24 +0000
Date: Wed, 31 Dec 2025 16:45:24 +0100
Message-ID: <87cy3uy7sb.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Julia Lawall <Julia.Lawall@inria.fr>
Cc: Jaroslav Kysela <perex@perex.cz>,
	yunbolyu@smu.edu.sg,
	kexinsun@smail.nju.edu.cn,
	ratnadiraw@smu.edu.sg,
	xutong.ma@inria.fr,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: mixart: adjust field name reference
In-Reply-To: <20251230132235.90687-1-Julia.Lawall@inria.fr>
References: <20251230132235.90687-1-Julia.Lawall@inria.fr>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -3.26
X-Spam-Level: 
X-Spamd-Result: default: False [-3.26 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.16)[-0.794];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]

On Tue, 30 Dec 2025 14:22:35 +0100,
Julia Lawall wrote:
> 
> buf_period_pos seems to not have existed in the git history, but the
> buf_period_frag field is used with the buf_periods field in the
> function snd_mixart_stream_pointer in mixart.c, so it seems that
> buf_periods is what was intended.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

Thanks, applied now to for-next branch.


Takashi
