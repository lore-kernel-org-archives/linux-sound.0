Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FACC2F8EB6
	for <linux-sound@vger.kernel.org>; Wed, 27 May 2026 05:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779860317; cv=none; b=XpQDoGlB+iYZFP5WdDtiFm6/j1Pa54Ez0EVXXNy0IShRcrdWq406Gh2uc0Z63gUx9gV6OSYS+o9UfZUzaxIhsoYFObGxj106JhJiYI3bmr52X9fgirdyJr7M4BuzZbO7kIazKUMzJan3CScHn3MCc7BCZb18Q6jUqGjybIGko1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779860317; c=relaxed/simple;
	bh=mUiHf/4Q+dGdEuLlDkdJckOvKcvBScqEScMdfduCKCs=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CizvjofeO7MpVmpRutSc9ZywJKXuzfX29wxrSwPzmY0O6gzEXuqtkdYy/KJya91k+gvChgGtXg9nPC2l7yzTzIKBz0mqOAlgXLsvy+HSXlxrux+286Xe7qWoD5vr/4cUNdePZT900ZBH0cHlq2alLNRKmcVkSd3T7VgzfP0KWEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=J+9Z2b37; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=6v4pRxc4; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ZOtpsX4x; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=MhD6IJ2w; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="J+9Z2b37";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6v4pRxc4";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZOtpsX4x";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MhD6IJ2w"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 909066B40A;
	Wed, 27 May 2026 05:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779860314; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=K4lKlltu/TWo8SLqU9EtZaFVLw23PhOjKGUhNibgMXQ=;
	b=J+9Z2b37aseClh+L+BUSZDG7bsjJBQqW8J3z+ZGC2F2NIZhwYiLD5HAeXuEYTgYF819qPK
	oz4jVee40SpMPd1m7ko+8KnzLaEvwNNChUlEW7fcgzCj0Gtj4+Y2HC9ZFWpcHryPn40tg8
	jo4HvQJekLsQS6831ntikxT5CzU3rUY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779860314;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=K4lKlltu/TWo8SLqU9EtZaFVLw23PhOjKGUhNibgMXQ=;
	b=6v4pRxc4YXmA6IPYlB71uN9SV3+OCIEm6f5mbw0avLsQFTscZVVi4BS3NekL/GnUBg/qTm
	pEaMLW8zGsGFzDAA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779860313; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=K4lKlltu/TWo8SLqU9EtZaFVLw23PhOjKGUhNibgMXQ=;
	b=ZOtpsX4xq55UvxiawFCUfsdX3QV1TC7+MSP3tdozDqygJa2nTP0DABmi8ju2/uwjUlIhn1
	lV6fyw/UEi31uTtDhZMWW0Rwt2NJDzy9t18OYgVJ6m0ZkivtOk3yUm+F/6wVh8mZjQ5Z5N
	BZXuCPUXhwAdBtNBLPWQ8wOj28283mM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779860313;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=K4lKlltu/TWo8SLqU9EtZaFVLw23PhOjKGUhNibgMXQ=;
	b=MhD6IJ2w5m6yrUoQew+mDQYT+9efEQHyBCk3rje+vcGU1xNiuIZD29gmXR43d3oSFHz0Sk
	hG8DgQRrQJefzyCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 520FD5A679;
	Wed, 27 May 2026 05:38:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id gFOdElmDFmpmPwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 27 May 2026 05:38:33 +0000
Date: Wed, 27 May 2026 07:38:32 +0200
Message-ID: <87se7dwgx3.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Rong Zhang <i@rong.moe>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Gordon Chen <chengordon326@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] ALSA: doc: usb-audio: Add doc for QUIRK_FLAG_IFB_SILENCE_ON_EMPTY
In-Reply-To: <20260527-uac-quirk-get-cur-vol-v1-1-e9362b712e5e@rong.moe>
References: <20260527-uac-quirk-get-cur-vol-v1-0-e9362b712e5e@rong.moe>
	<20260527-uac-quirk-get-cur-vol-v1-1-e9362b712e5e@rong.moe>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
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
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,lwn.net,linuxfoundation.org,gmail.com,vger.kernel.org];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,rong.moe:email]

On Tue, 26 May 2026 19:49:23 +0200,
Rong Zhang wrote:
> 
> QUIRK_FLAG_IFB_SILENCE_ON_EMPTY was introduced into usb-audio before
> without appropriate documentation, so add it.
> 
> Fixes: a23812004228 ("ALSA: usb-audio: add IFB_SILENCE_ON_EMPTY quirk for Behringer Flow 8")
> Signed-off-by: Rong Zhang <i@rong.moe>

I take this patch now as it's basically irrelevant with your code
change itself.


thanks,

Takashi
