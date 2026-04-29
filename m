Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60028405F7
	for <linux-sound@vger.kernel.org>; Wed, 29 Apr 2026 05:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777441805; cv=none; b=EFnkgEaau1uddu9vfAxeTO2D4Lanky1j6OYihxoayH1guTdCyA2AlRj/mAH/uI3hcTKaR5wROTp+IAhlhy6hGr/p24DJTD5xtzLg0pvCZiZ7e6xPu0ZDJyvuhQRJNt0d5Kewv3YgQckPE/GuwAk3mTQB0x04JBZBE3bs0LTk5Z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777441805; c=relaxed/simple;
	bh=pnqOEoZTlx6DK3stz6Q7dP21S8AzimFJgn8M5ImAoCA=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=koncYpZ53CveiFxv255mPOZ0JY5gadAIg6ewwUhVmsitEpKy5auay7gEVL4VFkxT84x8ZpiXOs2GwIPTGo90m+mN19LQAFw9bRIyNz9baf7b3ufCUjc6bmZbba9T9K9Uy4Fy+aO7c+9smUQpAdPeWHKmDreEy9aSBNk9WJKbaQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=sO9e3T+a; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ZdLD0zfX; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qABY3sTR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+D7d8LFu; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="sO9e3T+a";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ZdLD0zfX";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qABY3sTR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+D7d8LFu"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id BAEF25BCD5;
	Wed, 29 Apr 2026 05:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777441802; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dnMnxg7U3xfdjdggDzKUTjO5QVf9ef4HLtJNuTdwsLY=;
	b=sO9e3T+a3fL8s1Tu6C9vnwLHiS9kwBJUTQ3ii5dhsvwOUdP/vkTcN4YM1akM0sEY1UIEuZ
	qBj/AjMmJGBYykMZNMJ9wyuldt9eG183HRA+nMLkUuvfnZK3BIREgFcF5j5snxC8gOTiIg
	i2jP4E0CXdUMK+GIEd2hXueRPCFp3tc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777441802;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dnMnxg7U3xfdjdggDzKUTjO5QVf9ef4HLtJNuTdwsLY=;
	b=ZdLD0zfXMig0CoDnf80fWrd0qywBEfdocLN0CLNUgxGp0eB0mbS5YF0yfW/WA18Y2mXmJB
	0If6RzssacxhSwCg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=qABY3sTR;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=+D7d8LFu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777441801; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dnMnxg7U3xfdjdggDzKUTjO5QVf9ef4HLtJNuTdwsLY=;
	b=qABY3sTRBYNqMgZcw1Iyk4MOJVxBVk+TWNORZwjIZ1lyeQL7eiNs8MOgue3+Yirk6lyDJB
	/xLLAFajv93iHkdMEwgNuccjUTrYVqgnBRuQJDnwFr80bWig4uA43yBZtmdDdZzOjZTl+Z
	TjjyrDjVvTAw3Pw9EVyym9hF+9ubvUk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777441801;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dnMnxg7U3xfdjdggDzKUTjO5QVf9ef4HLtJNuTdwsLY=;
	b=+D7d8LFuQntYUgGzIsRvTsDtosBLR4CklJX4/TNGn5ybx0x7Nvh2USO65mlTPPCmXLZG2x
	Ui9icSm6X/bly1DQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8239E593B0;
	Wed, 29 Apr 2026 05:50:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id gPd6Hgmc8WnQLgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 29 Apr 2026 05:50:01 +0000
Date: Wed, 29 Apr 2026 07:50:01 +0200
Message-ID: <877bpqqprq.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: wangdich9700@163.com
Cc: tiwai@suse.com,
	bo.liu@senarytech.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	wangdicheng <wangdicheng@kylinos.cn>
Subject: Re: [PATCH v2] ALSA: hda/conexant: Fix missing error check for jack detection
In-Reply-To: <20260428080450.108801-1-wangdich9700@163.com>
References: <20260428080450.108801-1-wangdich9700@163.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[163.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	FREEMAIL_ENVRCPT(0.00)[163.com];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,kylinos.cn:email,suse.de:dkim,suse.de:mid];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: BAEF25BCD5

On Tue, 28 Apr 2026 10:04:50 +0200,
wangdich9700@163.com wrote:
> 
> From: wangdicheng <wangdicheng@kylinos.cn>
> 
> In cx_probe(), the return value of snd_hda_jack_detect_enable_callback()
> is ignored. This function returns a pointer, and if it fails (e.g., due
> to memory allocation failure), it returns an error pointer which must
> be checked using IS_ERR().
> 
> If the registration fails, the driver continues to probe, but the jack
> detection callback will not be registered. This can lead to a kernel
> crash later when the driver attempts to handle jack events or accesses
> the uninitialized structure.
> 
> Check the return value using IS_ERR() and propagate the error via
> PTR_ERR() to the probe caller.
> 
> Fixes: 7aeb25908648 ("ALSA: hda/conexant: Fix headset auto detect fail in cx8070 and SN6140")
> Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>

Applied now.  Thanks.


Takashi
