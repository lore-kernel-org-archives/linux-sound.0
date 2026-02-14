Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9950F1FC7
	for <linux-sound@vger.kernel.org>; Sat, 14 Feb 2026 08:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771056323; cv=none; b=HIAQL0YDzUrh3fzLIv6eU90qY4zZhPPH0HgSX6kd0Zpj1V1s9KsIpw/7KODf65uQy5bA0O3Vppgip4biKxbW0ytOhWeF9KKVcMRBG08J25onyyC22YI7eC65v/70m91zKnFOVJFzoZKzazX6axx9RfUF+2VjHFszA6pkt9F6R8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771056323; c=relaxed/simple;
	bh=D7206X/qJNSC/hwPAhqkY71Ds37Q4tYEZ9YfsLsF2Ng=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Pyr7CHy/REHzk9c/rhedHewRiKevvEwGwNzyLZypbTPSuvo9T4rB1GiDga4xlQYrnvqj/Q0Sl2VKBopL4BtwWrluwoTmTmn0+xz6EEjNjKNA14RgQoRlU14wA3oTMzWcZdbxGHLCUMpUS8m4Q/2nSPPleIbL2ebPG78WyAuvF5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=zoeBU5GA; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=6x2wB0y1; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=zoeBU5GA; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=6x2wB0y1; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zoeBU5GA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6x2wB0y1";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zoeBU5GA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6x2wB0y1"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9ED825BCE8;
	Sat, 14 Feb 2026 08:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1771056320; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pZis4Gl55kZSaPqy3RvXYSkgY8zG6Gc7hFQd/64xFFw=;
	b=zoeBU5GA08BRZNV5b/nzkUz9hTQUXYb3ivO2eXqN7rOJa+/qyioDsBRGqv2OZAHFgAgBgd
	f2T3Ape5vJAGp2RxGPJumVfthQKPR3/siy8uUuXMAygkkUnLHrKeVt0p3RMpGIEuOL3qg1
	t6+wJyiazE8gaastWOk4Bp3qJ9CcQy8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1771056320;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pZis4Gl55kZSaPqy3RvXYSkgY8zG6Gc7hFQd/64xFFw=;
	b=6x2wB0y1asYiW+WAAB9bazGN1/yg/KjTUuzAJ2jYDKFWs4f/u/2056fGVTuC0VHh3bkHNg
	YuB2PmGksoTAwMCA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1771056320; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pZis4Gl55kZSaPqy3RvXYSkgY8zG6Gc7hFQd/64xFFw=;
	b=zoeBU5GA08BRZNV5b/nzkUz9hTQUXYb3ivO2eXqN7rOJa+/qyioDsBRGqv2OZAHFgAgBgd
	f2T3Ape5vJAGp2RxGPJumVfthQKPR3/siy8uUuXMAygkkUnLHrKeVt0p3RMpGIEuOL3qg1
	t6+wJyiazE8gaastWOk4Bp3qJ9CcQy8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1771056320;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pZis4Gl55kZSaPqy3RvXYSkgY8zG6Gc7hFQd/64xFFw=;
	b=6x2wB0y1asYiW+WAAB9bazGN1/yg/KjTUuzAJ2jYDKFWs4f/u/2056fGVTuC0VHh3bkHNg
	YuB2PmGksoTAwMCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 55C543EA62;
	Sat, 14 Feb 2026 08:05:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Tt/7EsAskGkObQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 14 Feb 2026 08:05:20 +0000
Date: Sat, 14 Feb 2026 09:05:19 +0100
Message-ID: <875x7zu4w0.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: <tiwai@suse.com>,
	<broonie@kernel.org>,
	<perex@perex.cz>,
	<amade@asmblr.net>,
	<linux-sound@vger.kernel.org>,
	<kuninori.morimoto.gx@renesas.com>
Subject: Re: [PAATCH v4] ALSA: control: Verify put() result when in debug mode
In-Reply-To: <fde361f5-55ee-43e0-a5a9-1e458a2b9bcd@intel.com>
References: <20260210152737.347279-1-cezary.rojewski@intel.com>
	<fde361f5-55ee-43e0-a5a9-1e458a2b9bcd@intel.com>
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
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Fri, 13 Feb 2026 21:48:32 +0100,
Cezary Rojewski wrote:
> 
> On 2026-02-10 4:27 PM, Cezary Rojewski wrote:
> > The put() operation is expected to return:
> > 1) 0 on success if no changes were made
> > 2) 1 on success if changes were made
> > 3) error code otherwise
> ...
> 
> Only just now I've realized that there is a typo in the title - should
> have been "PATCH v4" instead. Let me know if I should resend this one.

It doesn't matter :)

But beware that I'm not going to take this for 7.0, as it's no urgent
bug fix.  So we have enough time for more reviews.


thanks,

Takashi
