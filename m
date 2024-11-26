Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19CA1991D9
	for <linux-sound@vger.kernel.org>; Tue, 26 Nov 2024 07:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732607372; cv=none; b=G0wOqMJFylE137U4LedNMKfnkvly23ZjvSvlu/fO6aQXn6Tvq4nCEN2YNVSkWDt0RMgsAwWjfj6EOV3ENEnrAkcA2vPZQKekL7AK6LlxYvLEjViOgn59oJs+Aw+CrDHmrGuWYh46TbTC8JTrl/wv/nW7NY6u6ATiHyoAcUi7dH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732607372; c=relaxed/simple;
	bh=Zy3aoV2lOS+V2/w9p1/dqpSEHMnh19TZAfUink2F8DM=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lpTD3HmsTj7kc4+AAxMow+xUkBbXerrkcHdJtmZ1kA4chdqH32Y0cCJ7KY/mCQQsmBWHt5oda/6bM//6DAaDq4EKTtFVhgl0DRS8B0O/cQqMECPblo+zOUXqAieChTWxHwZq5hCR3DS9+ZkXjUnl/af9Qny116XK+a3lmMsyvZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=KLetT29u; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=RGhdWO/G; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=KLetT29u; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=RGhdWO/G; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="KLetT29u";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="RGhdWO/G";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="KLetT29u";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="RGhdWO/G"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4B09D21158;
	Tue, 26 Nov 2024 07:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1732607369; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6DaMHX20blofpomovnv7qmKQNzHmqHmKfJA5IZMHdgk=;
	b=KLetT29uf/6XiZikihyaGVvvRzTgUgUhGg6BopL1oMlGgDjHik7sxh2lzk444FPl9JcjJj
	el7M8SpmREOQkaYOjbh1xDJd0e8pUzaBV64jadtNvBYCAZAtoTtYQcDn5wG7EtVrnJuK+x
	AVJ68TLAdAv2E+ANW9ixmeSsrIH4ugA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1732607369;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6DaMHX20blofpomovnv7qmKQNzHmqHmKfJA5IZMHdgk=;
	b=RGhdWO/GLD3WxQhe68k5PSVbj33p/SnVNtZOlQ2un6uq4u4b+lwUFfqmJ+iBTrJQeRnDSC
	lajt98Xb3SlX1LDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1732607369; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6DaMHX20blofpomovnv7qmKQNzHmqHmKfJA5IZMHdgk=;
	b=KLetT29uf/6XiZikihyaGVvvRzTgUgUhGg6BopL1oMlGgDjHik7sxh2lzk444FPl9JcjJj
	el7M8SpmREOQkaYOjbh1xDJd0e8pUzaBV64jadtNvBYCAZAtoTtYQcDn5wG7EtVrnJuK+x
	AVJ68TLAdAv2E+ANW9ixmeSsrIH4ugA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1732607369;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6DaMHX20blofpomovnv7qmKQNzHmqHmKfJA5IZMHdgk=;
	b=RGhdWO/GLD3WxQhe68k5PSVbj33p/SnVNtZOlQ2un6uq4u4b+lwUFfqmJ+iBTrJQeRnDSC
	lajt98Xb3SlX1LDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2058713890;
	Tue, 26 Nov 2024 07:49:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id OgqKBol9RWeGZgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 26 Nov 2024 07:49:29 +0000
Date: Tue, 26 Nov 2024 08:49:28 +0100
Message-ID: <87y116juyf.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Kailang <kailang@realtek.com>
Cc: " (alsa-devel@alsa-project.org)" <alsa-devel@alsa-project.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Subject: Re: ALC225 update depop procedure
In-Reply-To: <5a27b016ba9d42b4a4e6dadce50a3ba4@realtek.com>
References: <5a27b016ba9d42b4a4e6dadce50a3ba4@realtek.com>
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
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Score: -3.30
X-Spam-Flag: NO

On Tue, 26 Nov 2024 07:30:57 +0100,
Kailang wrote:
> 
> Hi Takashi,
> 
> ALC225 update depop procedure.
> Many Thanks.
> 
> BR,
> Kailang

Applied now.  Thanks.


Takashi
