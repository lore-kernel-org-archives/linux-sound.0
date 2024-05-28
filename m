Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B260D2745B
	for <linux-sound@vger.kernel.org>; Tue, 28 May 2024 11:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716894484; cv=none; b=CaPY1ZOd6PKdtJZxX8xhIA01wG5ccNc/YUyzablZw1yryJysoERNQYdLT/GqPE7+n6858s4w71l/Qz5d+x2vj0gcrs0ULFAeabGQtCasWcnY5WS0/MdUiBxz9FEHve8l+ZM2+KH4CUwCSPrhVQx1qYrF4BsR3eQJ6c16JIoOPfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716894484; c=relaxed/simple;
	bh=o9tuEq20eThK1If2jG9YQDwn+YL3GhLVbpw5wMIdEIc=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QoQ5wuCMYlD05p6xIDstp+NG8cIKpxOTR9mSWiZTmHopCTXM80fR1ZRg6uD8tnIS5Mb0FVMgM84FijBERuGEVN6c7nfIvmG6xtunkOfipj3Wzt7kFUSUZR0pSl9vcop4RHNR1ZVWrb1PCIRTrlejF59E+sdpRCiB6ZQInNOtRuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=UBww7Dro; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=LZrrQqdS; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=UBww7Dro; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=LZrrQqdS; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="UBww7Dro";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LZrrQqdS";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="UBww7Dro";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LZrrQqdS"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D2E5022690;
	Tue, 28 May 2024 11:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1716894480; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OUMCjON2Njr+snGHVQ1hWR0AqSuBsUQndjWasr/bdG8=;
	b=UBww7DroLJ8SAowaYNsaOgtLggZqY6aPSNbILSOGKt4Xvn9sT/r4Zf9iZNYB045pLqrusu
	fGCvwVq/sINCa3c9JbHz+7L98BygnlkK4WTcLW8dBy4y6xayueEatn6yk7nJYAlX14+1x1
	hJumnIkbMm1r+7bojTA4+qhM8OoP0D8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1716894480;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OUMCjON2Njr+snGHVQ1hWR0AqSuBsUQndjWasr/bdG8=;
	b=LZrrQqdSi2kZfcxUtR8Wy4bF2vuQXDR/Nit0QRilOElINuWyZnT+BbQoRqe/mKqOSeZzge
	HrSjibb9SqaYYhCQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1716894480; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OUMCjON2Njr+snGHVQ1hWR0AqSuBsUQndjWasr/bdG8=;
	b=UBww7DroLJ8SAowaYNsaOgtLggZqY6aPSNbILSOGKt4Xvn9sT/r4Zf9iZNYB045pLqrusu
	fGCvwVq/sINCa3c9JbHz+7L98BygnlkK4WTcLW8dBy4y6xayueEatn6yk7nJYAlX14+1x1
	hJumnIkbMm1r+7bojTA4+qhM8OoP0D8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1716894480;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OUMCjON2Njr+snGHVQ1hWR0AqSuBsUQndjWasr/bdG8=;
	b=LZrrQqdSi2kZfcxUtR8Wy4bF2vuQXDR/Nit0QRilOElINuWyZnT+BbQoRqe/mKqOSeZzge
	HrSjibb9SqaYYhCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BF11913A6B;
	Tue, 28 May 2024 11:08:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id YozLLRC7VWZVDQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 28 May 2024 11:08:00 +0000
Date: Tue, 28 May 2024 13:08:22 +0200
Message-ID: <87sey26vo9.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org,
	broonie@kernel.org,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] ALSA/hda: intel-dsp-config: reduce log verbosity
In-Reply-To: <20240527193808.165652-1-pierre-louis.bossart@linux.intel.com>
References: <20240527193808.165652-1-pierre-louis.bossart@linux.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spamd-Result: default: False [-3.25 / 50.00];
	BAYES_HAM(-2.95)[99.80%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -3.25
X-Spam-Flag: NO

On Mon, 27 May 2024 21:38:08 +0200,
Pierre-Louis Bossart wrote:
> 
> The information on PCI class/subclass was interesting in the Skylake
> timeframe, since the DSP was only enabled on a limited number of
> platforms. Now most Intel platforms do enable the DSP, so the
> information is less interesting to log.
> 
> When a DSP driver is used, the common helper may be called multiple
> times due to deferred probes, but there's no reason to print the same
> information multiple times. Using dev_info_once() covers all the
> existing usages for internal cards with DSPs. External cards don't
> rely on DSPs so far.
> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>

Applied now, thanks.


Takashi
