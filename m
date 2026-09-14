Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C343E357D0C
	for <linux-sound@vger.kernel.org>; Mon, 14 Sep 2026 16:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789401719; cv=none; b=N8KBCo8bH5B3kxwRymD1GprqqRqtr7Br84M3rNFFoOgLPc5yZpxFMh19uQWI4LeKylYNKOhR1JKshMcCZwrmi+9Bc6CF8ZY1L23RW0tg2TjYrRCi2SqnKM/VKuHAXVlspeJxN6MDe5XlnqcQoKxYd0PIcRS8ArP/X426Zfivmlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789401719; c=relaxed/simple;
	bh=ZLolwCQDhO/l6epDDxASxgPft4yuUUkGPUeOx4Ay4vE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Lc0CA47ALQxut03vxetYDiMwqGNCRDdLMSuVmqmw/q37MQNJhShfRqyhGTee+BSMjBwEDnpTd5r/R2oqKc/rZdPvzk52f+YT5X9Pj3w2Q8G7rE8C8O8EJI0IO/5IQJ1tegIa0QuRUdcrCuZ+KZE0bT4XKTp2UkNlgVoWtf9U8qA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=k/4Mcokj; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=mSGguGct; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dUbzA/CA; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=GS5oUsSA; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="k/4Mcokj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mSGguGct";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dUbzA/CA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GS5oUsSA"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 87B5E21A7B;
	Mon, 14 Sep 2026 16:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789401711; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XbRAFQnIEQvj3sbYnytXHAqVioMXpCvoFoR4VJTRWho=;
	b=k/4McokjYCri+W9rxFKx7KC2t5KI7crocWM6DIiJ/4nou0ZKNjDI+lQLHxkBRJDSgLNgkc
	+ZGORoNw3br1ebUmcmI4gLAnpZbu02pZlOU6/1ERjEzgoIPkir2lv2AaA3iSpSGM35FlBe
	fZnN2ZDH6EuuYR81gXky3hXr5dWYgYM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789401711;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XbRAFQnIEQvj3sbYnytXHAqVioMXpCvoFoR4VJTRWho=;
	b=mSGguGctjmqEecbCYFusbLJtdpQ83eg5IUq6AfdM7fp+/b1RROP2ftJg7pQPJjYVacs+RL
	vVLzevFUzqM9lpAg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789401707; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XbRAFQnIEQvj3sbYnytXHAqVioMXpCvoFoR4VJTRWho=;
	b=dUbzA/CABhw9HKwydQ1y9MZ61tJD06SnGmmbyFioj00OzzukTscJfZeRjr7ratGQah7Sis
	1qIK+VTwRpBpyRFflH/xmCOekRNKmmVLakz3YinoXkrqkX848E1+pVYxPCzHUlnNOlsgQd
	WwQV1baW0AKZz1JVWeDLzNvjkzrSQZQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789401707;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XbRAFQnIEQvj3sbYnytXHAqVioMXpCvoFoR4VJTRWho=;
	b=GS5oUsSAnWwH6g8p8REj4tB0wLnEr5joTzfFFMLPmPLAR8F3tqKX5BDauUHeF+VrYMuNL2
	izzwjtRFpyByVCAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3970013515;
	Mon, 14 Sep 2026 16:01:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id tVWlDGsaqGrhDwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 14 Sep 2026 16:01:47 +0000
Date: Mon, 14 Sep 2026 18:01:46 +0200
Message-ID: <87bj9zom8l.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: tiwai@suse.com,
	broonie@kernel.org,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda: Allow for codec model selection with module param
In-Reply-To: <20260914102253.2969724-1-cezary.rojewski@intel.com>
References: <20260914102253.2969724-1-cezary.rojewski@intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spam-Score: -3.30
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.995];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,alsa-project.org:url,intel.com:email]

On Mon, 14 Sep 2026 12:22:53 +0200,
Cezary Rojewski wrote:
> 
> Model selection allows for customization of codec behaviour and thus
> dealing with various problems on very specific configurations. The
> parameter already exists but is part of snd_hda_intel specifically.
> Non-Intel HDAudio controllers and DSP-capable drivers cannot benefit
> from it.
> 
> The common place for all the bus drivers is snd_hda_codec. Add modelname
> parameter there and honor it when initializing codec->modelname field.
> 
> Link: https://github.com/thesofproject/linux/issues/5683
> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>

The handling of the model option is a very long-standing PITA.
A few years ago, I proposed a change like:
  https://mailman.alsa-project.org/pipermail/alsa-devel/2022-September/206631.html
but it didn't reach to agreement.  So I'm not 100% sure whether adding
here is the best choice, either.


thanks,

Takashi
