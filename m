Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B4103D6689
	for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 09:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774604563; cv=none; b=l0IDY70jB4Tpa2j5lbZFRQ0sSjRiR92TBtqO0n6f73D9SsS1CqrTT52bCwPOlqb6ooVPqZVtUPk+hGzum5qf18+3cNRPhuyjPHnk3iPO6Oa8IRhxfnTVq98VIGXOhCb8ZLBVeuB6EE8+gru249vZKGINBJ68T8JWz2ChBW1S0Fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774604563; c=relaxed/simple;
	bh=jL8t22XALs92h9sqf6ddCv3tl6EA6imI/Y3P7+zkEVc=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aApygT0ewG62tiVWAeR+ZbQ5T8HWxIi3667JXV3WOAMKdJExXcrPAYi975lQRuyu/nO34hWv5/piN24AfjLc7+YDe/oxKLKZPOdWFEtVcYeAXqonSc+3+mTCeJGJRHCgGPr6Z4coE3VlqqkYtsRT5Z+O82s6lENhs0UI9odi7Ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qTSpZuNQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=hHKTPnme; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qTSpZuNQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=hHKTPnme; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qTSpZuNQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hHKTPnme";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qTSpZuNQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hHKTPnme"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A2BA95BCF9;
	Fri, 27 Mar 2026 09:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774604560; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yE6xUXRqr6J7HGDY/RpqAadT+QiAOFP5AaZfXi+X4Ao=;
	b=qTSpZuNQFgpfAhHuxauZ2w4Quw64gd9CBVBdrggwabiJAZkS6BMjdQ9oylr2edLY7TgCCh
	yO994QbiPA1m4R73ozynfAoi5pMZEtMrgWuJMI8FVP9WEqXKLhvCjmeWDt+/f3JSCZ/e1D
	lH/7MUu/cAE8Y5Boxxe4V7Hu4388kp0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774604560;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yE6xUXRqr6J7HGDY/RpqAadT+QiAOFP5AaZfXi+X4Ao=;
	b=hHKTPnmeAGnEWsP0n6IXbLQ4Tae7+EyFwHglv8uAS0A2enGs2sKizcBQUjvE+DcGgU7cuT
	ReHpgfM9bhwE/PDQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774604560; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yE6xUXRqr6J7HGDY/RpqAadT+QiAOFP5AaZfXi+X4Ao=;
	b=qTSpZuNQFgpfAhHuxauZ2w4Quw64gd9CBVBdrggwabiJAZkS6BMjdQ9oylr2edLY7TgCCh
	yO994QbiPA1m4R73ozynfAoi5pMZEtMrgWuJMI8FVP9WEqXKLhvCjmeWDt+/f3JSCZ/e1D
	lH/7MUu/cAE8Y5Boxxe4V7Hu4388kp0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774604560;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yE6xUXRqr6J7HGDY/RpqAadT+QiAOFP5AaZfXi+X4Ao=;
	b=hHKTPnmeAGnEWsP0n6IXbLQ4Tae7+EyFwHglv8uAS0A2enGs2sKizcBQUjvE+DcGgU7cuT
	ReHpgfM9bhwE/PDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 70E1A4A0A2;
	Fri, 27 Mar 2026 09:42:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id U1vNGBBRxmncLAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 27 Mar 2026 09:42:40 +0000
Date: Fri, 27 Mar 2026 10:42:40 +0100
Message-ID: <87h5q1sj5b.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/7] ALSA: asihpi: bound control name formatting
In-Reply-To: <20260323070310.42827-1-pengpeng@iscas.ac.cn>
References: <20260323070310.42827-1-pengpeng@iscas.ac.cn>
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
	NEURAL_HAM_SHORT(-0.20)[-0.996];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Mon, 23 Mar 2026 08:03:10 +0100,
Pengpeng Hou wrote:
> 
> asihpi_ctl_init() builds mixer control names in the fixed 44-byte
> hpi_ctl->name buffer, but it currently does so with sprintf(). Some
> source/destination node names are already long enough that combining both
> endpoints, their indices, the direction prefix, and the control name can
> run past the end of the buffer.

Does it really overflow?  IOW, it's just for a defensive programming,
right?  Please clarify it, otherwise we'll receive an unnecessary CVE
number judged only from the description.

> Switch the formatting to snprintf() so the driver never writes past the
> ALSA control name storage.

For that purpose, please use scnprintf() instead.  snprintf() would
lead to other unnecessary warnings due to the potential overflow when
built with W=1, too.

> @@ -2957,4 +2960,3 @@ static void __exit snd_asihpi_exit(void)
>  
>  module_init(snd_asihpi_init)
>  module_exit(snd_asihpi_exit)
> -

This is unneeded change.  Please drop.


thanks,

Takashi
