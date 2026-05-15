Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0131433C50D
	for <linux-sound@vger.kernel.org>; Fri, 15 May 2026 07:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778828905; cv=none; b=IJb762Xp++G1ryreSETZlUUVNE09doAklz79YslW5g5FWgGZmqNQT+sJCKHQOXc9uPlcLBYRq2ba98V8CA4KB1cjR4R1wq3Anid0w4yWxGJ+BzuSJ5Sx7CXc8uqeDmCQQkGMeYAdMNTiro9lDndH1hiF9ck8WVXYURb38knGgb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778828905; c=relaxed/simple;
	bh=w61ZRh9y7Qp6rqQrZTfM4bnjsxADpfi6L81PnfDkYvI=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a1PyGPgzG/qd2kfjS2A6ZXY4xw+T9a6g0whod2RSolsD4ezBpL8kuIQ71jIEZpql3nn4eFF5lT/L/zXIeReV2zfj/Djhs3VN+ARsiPPQWcMR7Kwsa0mKi3F+kJ+OXts4Vyyph3lthwfADymmNOhRefkhprX9dtlyAVpQtB64gBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xuxLccoq; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ib8OY2gG; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xuxLccoq; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ib8OY2gG; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xuxLccoq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ib8OY2gG";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xuxLccoq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ib8OY2gG"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5E98A6B2AE;
	Fri, 15 May 2026 07:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1778828902; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NIbLlga98wdMQMMq/0sVCN8Z5phw3HmK3OWlkKj1f44=;
	b=xuxLccoqvsy5G+7RYeGVFSkM6ylZ+mnuP4l+dLPY4x3UGvgVXAQmKhXt+4Nwg+EMa1fTqE
	cAOv3DlrhL/Z3YKkmdC2ANyRwJS8LgIInfJnBgGSwYBEQHEqrPqlOjD4m4DTWQ+Nd765+c
	XOZbIRMVkv+ita9ksJf8Szl1cce0qI4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1778828902;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NIbLlga98wdMQMMq/0sVCN8Z5phw3HmK3OWlkKj1f44=;
	b=ib8OY2gG2ENIE4i/anUk808kV9Casq317B/AvZVxwmQAhFJ85ltu9RwWL/JB5kttIZKeUY
	mp1w61aldOvUqPDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1778828902; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NIbLlga98wdMQMMq/0sVCN8Z5phw3HmK3OWlkKj1f44=;
	b=xuxLccoqvsy5G+7RYeGVFSkM6ylZ+mnuP4l+dLPY4x3UGvgVXAQmKhXt+4Nwg+EMa1fTqE
	cAOv3DlrhL/Z3YKkmdC2ANyRwJS8LgIInfJnBgGSwYBEQHEqrPqlOjD4m4DTWQ+Nd765+c
	XOZbIRMVkv+ita9ksJf8Szl1cce0qI4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1778828902;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NIbLlga98wdMQMMq/0sVCN8Z5phw3HmK3OWlkKj1f44=;
	b=ib8OY2gG2ENIE4i/anUk808kV9Casq317B/AvZVxwmQAhFJ85ltu9RwWL/JB5kttIZKeUY
	mp1w61aldOvUqPDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2A49D593A9;
	Fri, 15 May 2026 07:08:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +YsTCWbGBmpaXwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 15 May 2026 07:08:22 +0000
Date: Fri, 15 May 2026 09:08:21 +0200
Message-ID: <8733ztup3u.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: Re: [PATCH v1 1/1] ALSA: hda/cs35l56: Drop malformed default N from Kconfig
In-Reply-To: <20260513162758.365972-1-andriy.shevchenko@linux.intel.com>
References: <20260513162758.365972-1-andriy.shevchenko@linux.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,intel.com:email,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -3.30

On Wed, 13 May 2026 18:27:58 +0200,
Andy Shevchenko wrote:
> 
> First of all, it has to be 'default n' (small letter n), otherwise
> it looks for CONFIG_N which is absent and in case of appearance
> will enable something unrelated. Second and most important is that
> 'n' *is* the default 'default' already. Hence just drop malformed
> line.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Applied now.  Thanks.


Takashi
