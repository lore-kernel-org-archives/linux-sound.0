Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0055215885D
	for <linux-sound@vger.kernel.org>; Mon,  6 May 2024 16:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715012147; cv=none; b=Grf7qF0BjBZezbUEd8FWbWCvBBieC3UsgRUg8aco140UcClh0D8DAMJp92g/Fw107qs9GVivrOe928Q29sSJPjxO9daHeF6lJXU3AlTOXEwaDpJixCZH9k0uiyVEcLt0N0SZDubxapnSXn1NvnCTqy/Mt/G6RYOptu2/8+yc+Dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715012147; c=relaxed/simple;
	bh=64iLJGzXGpWglZGYDV2bblZonEzTAVD6o4zSrYbmhIk=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UY/unqcQL/yCDRtqBh1c6pd8k5hpmiekMKdYV3DZTWfS6GX9HpQEU4gXJwR4pEz8MfL3g5y2nBez0k2VYFbIMiL8VWEvTqtxmKNIbkjVByJd/yJseC4QnBEVb2+YiAXfudxC/t50Ec7w9y3h3ZPPm3uOuODtmgRNnr1KaVBxCnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=lPt4ifHg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Fa/mPvay; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=lPt4ifHg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Fa/mPvay; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="lPt4ifHg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Fa/mPvay";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="lPt4ifHg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Fa/mPvay"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 217AE1F7A3;
	Mon,  6 May 2024 16:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715012144; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+cRncyoFCZuu6rG7KPinCvooEZpOSmDRYXtgKx8zrbA=;
	b=lPt4ifHgWcio9e/L3N9yEhL34UAzQqUEMABF15wqJQbdkjt5MDXFul8ndM7dMSFvy/IJNO
	NfsxpcaNiCq9esYpKVSbjldlqYV2biLIC0boUB3A+2SBuMVMEgHsORL+XWYie7wUoUObkS
	lsjsS2l3uvueilKR5Ki4kLMnyTALIP8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715012144;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+cRncyoFCZuu6rG7KPinCvooEZpOSmDRYXtgKx8zrbA=;
	b=Fa/mPvayFsoQghnyLpY8OfP+X2rhZfMQM4V/pnSrhJYJBPGSS5pKE3Tj/EtxxKiTy9IMd1
	BWWWIMUvsIDtgMBQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715012144; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+cRncyoFCZuu6rG7KPinCvooEZpOSmDRYXtgKx8zrbA=;
	b=lPt4ifHgWcio9e/L3N9yEhL34UAzQqUEMABF15wqJQbdkjt5MDXFul8ndM7dMSFvy/IJNO
	NfsxpcaNiCq9esYpKVSbjldlqYV2biLIC0boUB3A+2SBuMVMEgHsORL+XWYie7wUoUObkS
	lsjsS2l3uvueilKR5Ki4kLMnyTALIP8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715012144;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+cRncyoFCZuu6rG7KPinCvooEZpOSmDRYXtgKx8zrbA=;
	b=Fa/mPvayFsoQghnyLpY8OfP+X2rhZfMQM4V/pnSrhJYJBPGSS5pKE3Tj/EtxxKiTy9IMd1
	BWWWIMUvsIDtgMBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id ECF3B1386E;
	Mon,  6 May 2024 16:15:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id TzmaOC8COWagFgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 06 May 2024 16:15:43 +0000
Date: Mon, 06 May 2024 18:15:58 +0200
Message-ID: <87r0eegblt.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jaroslav Kysela <perex@perex.cz>
Cc: <linux-sound@vger.kernel.org>,
	Takashi Iwai <tiwai@suse.de>,
	John Hubbard <jhubbard@nvidia.com>,
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] selftests/alsa: make dump_config_tree() as void function
In-Reply-To: <20240506075419.301780-1-perex@perex.cz>
References: <20240506075419.301780-1-perex@perex.cz>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_FIVE(0.00)[5]

On Mon, 06 May 2024 09:54:19 +0200,
Jaroslav Kysela wrote:
> 
> dump_config_tree() is declared to return an int, but the compiler cannot
> prove that it always returns any value at all. This leads to a clang
> warning, when building via:
> 
>     make LLVM=1 -C tools/testing/selftests
> 
> Suggested-by: John Hubbard <jhubbard@nvidia.com>
> Cc: Mark Brown <broonie@kernel.org>
> Signed-off-by: Jaroslav Kysela <perex@perex.cz>

Applied now.  Thanks.


Takashi
