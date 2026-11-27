Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795800638;
	b=OOqUesuMRDyEfCEy3tp9ZiYettCHqanThju1GOwGzAsRe5ojUGVVsH7LWez+RLS5e74P
	 CYmI6MWUtS8vM68I42ioXDnc2dOfQI8QO27/uQzahK7LJxP+3DBZHI2TJk4mPnG37YqUz
	 YsXYZwq/2sEK6YhHVejfNHGUAgWW7P+jpChzurPtp+C5HfsBHf1Skz4frq/tSFm+OoqVa
	 8/R0/SjyGDWAPYFxzmRedZ92k+7DB9Vi95bmhhQKbzCVF0kNFGlNtJrmqcUlLKVixys+v
	 NdOfDWAKxXnutVzH6XKB5P4R8KyhejfhYr1hVlVpO7KH1UHwdOBQJM28lgXwfyUo31w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795800638;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Spam-Score:X-Spam-Level:X-Spam-Flag;
	bh=lkm/eUMn8PAKpmAnkqBFPkUDZBmD1AQMpMPV+UJ+R1Q=;
	b=WZNrR+YkNz/oOnf+A3asOoOqZgKwgwL4Si7imc0nlhLx3mhpWAgbDN8wObYyVgZaJWSD
	 uMs8IQlB1inCv7mYBUUsZXalO6ImxdoX41JYui87JPnJ09II8Cc9a5xMEUCJGRNLU9BHo
	 KcLXYqoMAHhuaLU5o3acJrJZasb6O5Sj++WGMp6a2rq6OZofV4cUFXVeSEAXTkN7qtQS1
	 vAt3xBCrugiFXgFleUIb0lmpG/w3lEb94kY/XMYyfwsAbuzogSm9Mfq6/hUsxdqQM7vHn
	 HD8CRGB68z/MAqTp0coNYrLRLRGEN9qVyoWcvON7gZmv07NqWvskA/4Kyk/63nZ3bnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b="LMq/oXJt";
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b="7giT/FCY";
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b="LMq/oXJt";
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b="7giT/FCY";
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB56606A31E;
	Fri, 27 Nov 2026 17:30:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EB56606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=LMq/oXJt;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=7giT/FCY;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=LMq/oXJt;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=7giT/FCY
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 37746223B8;
	Fri, 27 Nov 2026 17:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795800636; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lkm/eUMn8PAKpmAnkqBFPkUDZBmD1AQMpMPV+UJ+R1Q=;
	b=LMq/oXJtdF5U9xNuk7NOPuXAQ8XCRe+8XvvkodKozur4Z252/AngJ3AvdrXeM6crbvZZ/H
	UyQ7D4AWV2y0U1WioRj3kenJr8v5rcfSgR1XDja9BOkOVg7fNYdScVmwwPmH2c5kfouM5Q
	MZTZD6mzY4sV9t+Ihb22/hvMTePZokE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795800636;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lkm/eUMn8PAKpmAnkqBFPkUDZBmD1AQMpMPV+UJ+R1Q=;
	b=7giT/FCYYorwnnphwfMG01YfNZjC1dXN5nw7eSegykab9yTqoXpIZEmXjnzJGgnUPe3Xx0
	cZhtVeXru/evbyCA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795800636; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lkm/eUMn8PAKpmAnkqBFPkUDZBmD1AQMpMPV+UJ+R1Q=;
	b=LMq/oXJtdF5U9xNuk7NOPuXAQ8XCRe+8XvvkodKozur4Z252/AngJ3AvdrXeM6crbvZZ/H
	UyQ7D4AWV2y0U1WioRj3kenJr8v5rcfSgR1XDja9BOkOVg7fNYdScVmwwPmH2c5kfouM5Q
	MZTZD6mzY4sV9t+Ihb22/hvMTePZokE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795800636;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lkm/eUMn8PAKpmAnkqBFPkUDZBmD1AQMpMPV+UJ+R1Q=;
	b=7giT/FCYYorwnnphwfMG01YfNZjC1dXN5nw7eSegykab9yTqoXpIZEmXjnzJGgnUPe3Xx0
	cZhtVeXru/evbyCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E5E12134E8;
	Fri, 27 Nov 2026 17:30:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id I3FtLju+CWsLDwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 27 Nov 2026 17:30:35 +0000
Date: Fri, 27 Nov 2026 18:30:35 +0100
Message-ID: <87ik1imbb8.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Cc: perex@perex.cz,
	tiwai@suse.de,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v2] ALSA: vmaster: Restore follower values on put failure
In-Reply-To: <20261126063225.3166-1-sreekuttan2156239@gmail.com>
References: <20261126061910.2840-1-sreekuttan2156239@gmail.com>
	<20261126063225.3166-1-sreekuttan2156239@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-12.30 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -12.30
X-Spam-Level: 
X-Spam-Flag: NO

On Thu, 26 Nov 2026 07:32:25 +0100,
Sreeraj S Kurup wrote:
> 
> Restore the cached follower values when the underlying put
> callback fails.
> 
> Otherwise, a retry with the same value may be skipped
> because the cache already contains the requested value.
> 
> Fixes: 3b0a5f22d464 ("[ALSA] Add virtual master control helpers")
> Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>

Applied to for-next branch now.  Thanks.


Takashi
