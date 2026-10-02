Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10A08316905
	for <linux-sound@vger.kernel.org>; Fri,  2 Oct 2026 12:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790943723; cv=none; b=SVXxOJbHKyVTt88Lzs0JJ4HkhH18gp0HU6WsmfW7n89gBWzD1e5EuYgMwLDv+51yrsJdJ1On3pkk0Sx+6YcLTXB14W3hO3xolZEFb1AtywEnsTsrJxdw221L9KBcsXk+hyeocy5bYHGbWRr1yx6MFW2SHUIiq05Ngcq7pY7q2pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790943723; c=relaxed/simple;
	bh=XQBpefkRL1Wm5lIlLN8idM6uQn72MD5sTrjG4H/lTyM=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C6QIdbFEu3s9f/nvQM9nyWokKoVLw9aU65U3ERsCnRU+ESz3lsQtJGOmHGOGEJkLxsDXmv5JuhrAB+7WGgVRTKZiYjIajfB6i4QdxfBQqSIV3eukDyWST/bSHFDBHbpJZGKN7z0zS4VZ7Y/r8mklhNj51zXfhu2yqrgeWio1YlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=C8KL522C; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=kPypst8c; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Y5fdCfbY; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=5exSrjVy; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="C8KL522C";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="kPypst8c";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Y5fdCfbY";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5exSrjVy"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C6CF41FE33;
	Fri,  2 Oct 2026 12:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790943709; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MXtcVmjDvcEA8z1UIIWveCvmu7R8RnEuNqbKQTEqXAw=;
	b=C8KL522CC16MqzessvAGSXQz67Uk88SMA+i/R5IHeJogf1YYoyI0kZhWFVlDpZ0RoOEWer
	pna4zLY0GVqHDChy9o1g9jGH8G31wGopwN9MF1AjYgymbWncaISExBCq1lfgL9WoZhdrzY
	gM3CQoSd4UVYqz0480LYUZ8hsURZFTo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790943709;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MXtcVmjDvcEA8z1UIIWveCvmu7R8RnEuNqbKQTEqXAw=;
	b=kPypst8cIK3pyfVCH17nJq9toKyTG7IEzITU+978Rb3+97wB74pmcQRIwC4HRQ0LUKdixe
	r+pmcgWzXJhuO2AA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790943705; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MXtcVmjDvcEA8z1UIIWveCvmu7R8RnEuNqbKQTEqXAw=;
	b=Y5fdCfbYKt7oqh/Nnvsg9b07CJ5+96Op9eNe4tThOaXNBelfsvqpFhNNE0/pyGIJ4wAOO4
	4BPYc0cBiju4jNEIlX8hvLMjO1URkq/niXt3f2BcgiCGA4yleBz0w1xZE5oWv01jP3QlnK
	Q0a+v6aGjOha6M7IElbh2n8VSRp7GnU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790943705;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MXtcVmjDvcEA8z1UIIWveCvmu7R8RnEuNqbKQTEqXAw=;
	b=5exSrjVynyptSGpbeZ+WdsgWVQ7xORcWjgDSPyApisATBppJN7l9djXmdaJHRFCt3ARzTt
	mSVtHClKp+z1b2AQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8343213C73;
	Fri,  2 Oct 2026 12:21:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id SdL4Ftmhv2r/NwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 02 Oct 2026 12:21:45 +0000
Date: Fri, 02 Oct 2026 14:21:45 +0200
Message-ID: <874if41eee.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v7.3-rc5
In-Reply-To: <68deab21-b10e-47d5-b0f3-f533c995a87e@sirena.org.uk>
References: <20261002115438.DD6341AC57CB@finisterre.sirena.org.uk>
	<877bk01fii.wl-tiwai@suse.de>
	<68deab21-b10e-47d5-b0f3-f533c995a87e@sirena.org.uk>
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
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,alsa-project.org];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spam-Flag: NO

On Fri, 02 Oct 2026 14:05:02 +0200,
Mark Brown wrote:
> 
> On Fri, Oct 02, 2026 at 01:57:41PM +0200, Takashi Iwai wrote:
> > Mark Brown wrote:
> 
> > > ASoC: Fixes for v7.4
> > 
> > This is meant for a PR for 7.3-rc6?  Or really for 7.4?
> 
> v7.3, sorry - I thinkoed when I was typing stuff and fixed up the tag
> name but not the subject.

OK, I corrected it at merging :)  Pulled now.


thanks,

Takashi
