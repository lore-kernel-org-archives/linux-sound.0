Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794486961;
	b=GMHdqe5pMFreP2p/9a+zOh3Z4EJK+A14WTFcNX7ba+DYjSNWUrsRXY8woaDLvQV7gxzU
	 SW75+BOnS9WdiIcEtpNu3uL6NLakPbhhdPSrjjEFmYiEIyp1LnNAO91H3drzXBhfvIsAH
	 w1pB3RL927B+9ITH81hRJ08yZe785Ng2vdc8vrkFCBZud10d+ypYJEfkCYZQIfSn2qqGY
	 /ALtW1LmLfhpP3dgX5Hh145MhAPXbreX35C08ItsbyHouraUU7WFeKnAGm8cejvLosOhK
	 hDvQCCGAQM2XwAq6KxGM9Z8WOB00Pkh4SKznhga45VbtuLSLryv7EYkzrR0MnTYxZbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794486961;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Rspamd-Queue-Id:X-Spam-Level:X-Rspamd-Server:X-Rspamd-Action:
	 X-Spam-Flag:X-Spamd-Result:X-Spam-Score;
	bh=ewpv9HXrHQ6h9jnVieHJtWDttL40ER/pDPSEmjoaCZg=;
	b=C/iy/3emcM98M4f/8j5oXqvvIrxqvZ/7gYyCIlGSBVs+OBxH2cRT+3qHrbcVTw+CJuT1
	 sxIq9e2T7r8fpMcgbUyottCyZPRn0FOF3yrQI87oNww9Mfe3+KMEHFWu9cWkZxV5B8YiG
	 mWTK3c31DWXzKZm58rKfWEhTXYcehO4lOje4WnxVcF/lWtWB15zsMJqq7ohd7VzTBIo+f
	 O8fUf/6Huo9ElNARV1XwxCnyaXOzysAiFOmQlYIgAWBGbw5+Z6M9SASdGPmEB6CbgWuol
	 dYvmv9hVI9KVJKlhLACPtZQYCKODgMz+y2kojXznoSZRMo6RT3+YxRITSfKHUo0Y5bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b="Xk6br/6y";
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=fLDesDd6;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b="Xk6br/6y";
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=fLDesDd6;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D98606A321
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 12:36:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57D98606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Xk6br/6y;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=fLDesDd6;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Xk6br/6y;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=fLDesDd6
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7B9D71F792;
	Thu, 12 Nov 2026 12:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794486959; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ewpv9HXrHQ6h9jnVieHJtWDttL40ER/pDPSEmjoaCZg=;
	b=Xk6br/6y8ZGKppD3tKl4g9s29T4x3AjbPIifhbC6wKropq+lInyiqdZVIBC+RwC2nXi//3
	vslI4xuZ35UWYcmr2qEPFfA/ZhITPR5lfJ/nIbE+GUhmq1Bcd7aTtNjFWErjya/BvBZEEd
	Utkvvbn4PcfCV6nenS0/SzcMiU1AOno=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794486959;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ewpv9HXrHQ6h9jnVieHJtWDttL40ER/pDPSEmjoaCZg=;
	b=fLDesDd6bkaOzZ0c/eaebd5ZIJ377irS0cA76fRnIWyOFJfycEeGqrMV6vYsTyYmajzLvu
	hpVQKFsPKRrzGHCw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="Xk6br/6y";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=fLDesDd6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794486959; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ewpv9HXrHQ6h9jnVieHJtWDttL40ER/pDPSEmjoaCZg=;
	b=Xk6br/6y8ZGKppD3tKl4g9s29T4x3AjbPIifhbC6wKropq+lInyiqdZVIBC+RwC2nXi//3
	vslI4xuZ35UWYcmr2qEPFfA/ZhITPR5lfJ/nIbE+GUhmq1Bcd7aTtNjFWErjya/BvBZEEd
	Utkvvbn4PcfCV6nenS0/SzcMiU1AOno=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794486959;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ewpv9HXrHQ6h9jnVieHJtWDttL40ER/pDPSEmjoaCZg=;
	b=fLDesDd6bkaOzZ0c/eaebd5ZIJ377irS0cA76fRnIWyOFJfycEeGqrMV6vYsTyYmajzLvu
	hpVQKFsPKRrzGHCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3C0F813432;
	Thu, 12 Nov 2026 12:35:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +LzgBK+y9WpnSwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 12 Nov 2026 12:35:59 +0000
Date: Thu, 12 Nov 2026 13:35:58 +0100
Message-ID: <87o6burzv5.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mikael Magnusson <mikachu@gmail.com>
Cc: linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH v2] ALSA: pcm: update state after xrun
In-Reply-To: <20261112094636.13671-1-mikachu@gmail.com>
References: <20261112094636.13671-1-mikachu@gmail.com>
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
X-Rspamd-Queue-Id: 7B9D71F792
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-12.51 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -12.51

On Thu, 12 Nov 2026 10:46:36 +0100,
Mikael Magnusson wrote:
> 
> If the snd_pcm_update_hw_ptr call from snd_pcm_status is what triggers
> the xrun state (eg, as opposed to an IRQ), the returned status->state
> was stale and told userspace the device was still playing, so they could
> get confused about device state and hang indefinitely.
> 
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=222201
> Signed-off-by: Mikael Magnusson <mikachu@gmail.com>

Applied now.  Thanks.


Takashi
