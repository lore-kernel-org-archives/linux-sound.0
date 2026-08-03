Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5211730D419
	for <linux-sound@vger.kernel.org>; Mon,  3 Aug 2026 07:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785740631; cv=none; b=ZtLkJko3sckweqAfdwnuA/iF5U+56NXkn8TdYKsQ502/WgPfaC76GBA+P0eh8gR/JF3tXt6Yy7rzU1h5QYSK/agDm9D8GTqnUCwqFWlkLLJ9dGauWGWyJ11vlnYPxPpKLkQI/43JuPSTGvF1oa7v2Ze6+Cytj4FYvMJM1czv+CU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785740631; c=relaxed/simple;
	bh=8yysKVOWpogR1HmFgFUK0g/XMM6vDWengkeGGMXvZ20=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gVtuFTonMsJhm/vEw4GZhgXRdr6SDYnVcszeIr4QJFUasJlhNxNSNzgdfoNXVHUzPJWhCAnEy19fatXo4L7U3XM7rk4r0+/pw8wk0ukDxQxWUWzMFp7CqAdzC80mjsARtM7h2RpcTA6Qc+qDXxF0u8oUqNZCFrYbaBcGTYTclu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=I+IVOj5I; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=kniYQgcI; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=IFdoJv+f; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Cwd2hr/s; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="I+IVOj5I";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="kniYQgcI";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="IFdoJv+f";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Cwd2hr/s"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3E4377EF14;
	Mon,  3 Aug 2026 07:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785740624; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3dY737DE9mICSHqR0GVB191uimumacIlF7hK9S/LE6c=;
	b=I+IVOj5IfNFLiSFi5fQUoq97H2vpHtRWp5yCcnQxs9xHofo9pNJ0YtKfYQ4jkW7VP2DjiJ
	GjnGPwt5jynQJWVUZfqrU2Wcc5bUtuAq7K5N+f9aoqmJwh2ai3ZjBHrjY9HMVjf0QgOPUT
	RYVcSZf7voxF41naWJsX4kui3YUpg9Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785740624;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3dY737DE9mICSHqR0GVB191uimumacIlF7hK9S/LE6c=;
	b=kniYQgcIPiZa8Bh8gjGPW0f2aLIL5kBm0eh5uCY/Of7ewqWWzwfA1n6v8exo0ratysuPPd
	/yMyDA/7/zvoFsAg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=IFdoJv+f;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="Cwd2hr/s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785740620; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3dY737DE9mICSHqR0GVB191uimumacIlF7hK9S/LE6c=;
	b=IFdoJv+f2sD12ReNfeanKcfApH+yqKzWC2I5D19SABwqJ1ekRmxrheUW9BvgRwzsz1F+au
	Rdw9EP37QhfkdwyQxb2UL/GRjDZJ303O/7oczlbX64xzMgiuiK96jpRrgmaowkKxiZ65Az
	eMlZRRCJMrfzZ46svVegsS7FN1I8JkE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785740620;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3dY737DE9mICSHqR0GVB191uimumacIlF7hK9S/LE6c=;
	b=Cwd2hr/sl/FG+XARTKcDT9dCUZOB+6w+Ac9PRm1he7pXSTI/2XjipYhIcCq7kHohaPuxBx
	Dfcp+/l6fg4aXTBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EC024779A1;
	Mon,  3 Aug 2026 07:03:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id EFY7N0s9cGocDAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 03 Aug 2026 07:03:39 +0000
Date: Mon, 03 Aug 2026 09:03:39 +0200
Message-ID: <877bm7bs8k.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Sean Rhodes <sean@starlabs.systems>
Cc: linux-kernel@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Zhang Heng <zhangheng@kylinos.cn>,
	Kailang Yang <kailang@realtek.com>,
	Damien Dagorn <damien.dagorn29@gmail.com>,
	Chris Chiu <chris.chiu@canonical.com>,
	Lei Huang <huanglei@kylinos.cn>,
	Eric Naim <dnaim@cachyos.org>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 1/2] ALSA: hda/realtek: Limit Star Labs internal mic boost
In-Reply-To: <be87292613b24150d6321adac102b4b25d00e9e6.1785532385.git.sean@starlabs.systems>
References: <be87292613b24150d6321adac102b4b25d00e9e6.1785532385.git.sean@starlabs.systems>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,perex.cz,suse.com,kylinos.cn,realtek.com,gmail.com,canonical.com,cachyos.org];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	URIBL_BLOCKED(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -2.01
X-Spam-Level: 
X-Rspamd-Queue-Id: 3E4377EF14
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action

On Fri, 31 Jul 2026 23:13:08 +0200,
Sean Rhodes wrote:
> 
> The 30 dB internal mic boost is too high for laptops, especially with fans. Limit Star Labs internal mic boost to 10 dB.
> 
> Signed-off-by: Sean Rhodes <sean@starlabs.systems>

Applied both patches to for-next branch now.  Thanks.


Takashi
