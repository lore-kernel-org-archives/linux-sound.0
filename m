Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81EAE3FE7
	for <linux-sound@vger.kernel.org>; Tue, 19 Aug 2025 06:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755584854; cv=none; b=F2oSjlfHVFWix+XnWJHqtwc0NGCEqHM58wqOtn0S+jxbF2Cn6m6KYqzxb+goE1xLOGXySuCzGOFOyZXlR0YiFn9PztY00SwySMQYeQ7ZwxaSDqbQ3+0wzCNbHuITrPzGbLWyHP5sAXPtXXyDQROKzkgwjOK+pvY5r0M7QFcZTfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755584854; c=relaxed/simple;
	bh=cV05Eq02/nG0Q9sYIvBcAE8pEoJxtUZkAvLw/4uwtuk=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L3SI948N9/mGLPbD7yaR5M7Km2DU3u8Eu2JPTCxE7PqszwYVd36ACcKKgrc8oNdf1k81UaExX8H8a902sxEdB0tDUbhq/1Od9c/ly7T6CffO028RY0kXsWkeySruJJgkzD+LFWrZFZuYg+4u2Ey5OuoveLn40lJ8arw2Tv3rZdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=K9xACBtj; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7K7cdYtb; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=K9xACBtj; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7K7cdYtb; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="K9xACBtj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7K7cdYtb";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="K9xACBtj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7K7cdYtb"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id AC93F1F749;
	Tue, 19 Aug 2025 06:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1755584850; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=A6wMoqLgpNEKyx4tj2YTrdP3c6dN+MPsSq2WOcNX60I=;
	b=K9xACBtj1SWXExQjv5fpd0t9XVYrxQhuM7V9otcZ6bVWZ+HItJAt5VaaamFcm9gJ6BjPz8
	ko2fJykGNyXLqPrZMcWLcQWLm9GcKu5S/o+Z2IiZlN0cl2+OxjNS5NUHYNObYdtrSxVakD
	OuCh4FjEGww6bX+EXUTtCHh+D0f7bsw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1755584850;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=A6wMoqLgpNEKyx4tj2YTrdP3c6dN+MPsSq2WOcNX60I=;
	b=7K7cdYtbjCCodYjma7o0dQ4PvOSA0Ph9HC2lIBrQ5rGmj0wTZuZ3dFnoS+obM1r3DQmCsZ
	xUnFCsKc4795jaBA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1755584850; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=A6wMoqLgpNEKyx4tj2YTrdP3c6dN+MPsSq2WOcNX60I=;
	b=K9xACBtj1SWXExQjv5fpd0t9XVYrxQhuM7V9otcZ6bVWZ+HItJAt5VaaamFcm9gJ6BjPz8
	ko2fJykGNyXLqPrZMcWLcQWLm9GcKu5S/o+Z2IiZlN0cl2+OxjNS5NUHYNObYdtrSxVakD
	OuCh4FjEGww6bX+EXUTtCHh+D0f7bsw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1755584850;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=A6wMoqLgpNEKyx4tj2YTrdP3c6dN+MPsSq2WOcNX60I=;
	b=7K7cdYtbjCCodYjma7o0dQ4PvOSA0Ph9HC2lIBrQ5rGmj0wTZuZ3dFnoS+obM1r3DQmCsZ
	xUnFCsKc4795jaBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8C229139B3;
	Tue, 19 Aug 2025 06:27:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id gYsZIVIZpGjCEAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 19 Aug 2025 06:27:30 +0000
Date: Tue, 19 Aug 2025 08:27:30 +0200
Message-ID: <87qzx7vnal.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Kailang <kailang@realtek.com>
Cc: " (alsa-devel@alsa-project.org)" <alsa-devel@alsa-project.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Subject: Re: Bug 220109 - Audio disappears on HP 15-fc000 after warm boot again
In-Reply-To: <5317ca723c82447a938414fcca85cbf5@realtek.com>
References: <5317ca723c82447a938414fcca85cbf5@realtek.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-0.997];
	MIME_GOOD(-0.10)[text/plain];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -3.30

On Tue, 19 Aug 2025 08:19:45 +0200,
Kailang wrote:
> 
> Hi Takashi,
> 
> Attach patch will solve issue.
> 
> BR,
> Kailang

Thanks, applied now (with a slight reformat of patch description
texts).


Takashi
