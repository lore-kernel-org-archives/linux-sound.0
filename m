Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1374450E2
	for <linux-sound@vger.kernel.org>; Sun, 28 Apr 2024 09:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714298224; cv=none; b=kn8pMYB8NROHLvn+K029o6wZd9B112UBXuZ0VUKVrRMbzMZXQTnHR3WFbYfuzjgNf5TlnSXYO6e5BG+2UIPsQoQo9iQ7kcTQIIHmiS9Dxe3w9Et/UG8g/5xRNkPG9a3wXP9IEPqcoMGXr5NDj+jRXEeL3gmuyM6x9lkR5iaifZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714298224; c=relaxed/simple;
	bh=+S4Dg3uf+XhQZEPpsdQVe3KQpPWn9TcixzrUaVmChh4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DsGPF01LoW0FBaRP6i9p/7pRphnZLfGIRCr0zfGotBNBTy9/cMNqDw5wwlCnYam3IdR8eqPwHwlJSwxb66xaiwBpet3cOsJ3NVJfvvriJyCjJcbVKt1XsUF45bSMBrWab/ugUKI8fakak/JuTlxbKOOzzv/Qp181U9kQPBQe3Xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Ebxdh/rg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=bqMLVqAT; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Ebxdh/rg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=bqMLVqAT; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Ebxdh/rg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bqMLVqAT";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Ebxdh/rg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bqMLVqAT"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9496E6095C;
	Sun, 28 Apr 2024 09:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1714298214; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sBgpVp7tDZ8Dn6Cugs3ZGFXi93iPJ/++C3/8thAvv5M=;
	b=Ebxdh/rgJzB0XWz21spWqHVoL52mvJDyomi4Qu6Ct/n/1TweHc9mWQxEJWnD1jxfwrIh5l
	cF/CpGCOkpCf6oRLnFTag4idFVHrLGNNxQB94wd8XlSxlRFgiXPoTgn75+IITYoxDwW0Z4
	XGGnnsnHSJ82b2m9QUx1NhpqFr7NHYo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1714298214;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sBgpVp7tDZ8Dn6Cugs3ZGFXi93iPJ/++C3/8thAvv5M=;
	b=bqMLVqATyE2y48PaImDom6sxJTJtNy712mvN4KmLpmSNuDah8welDCyVl6tY3KWwaq/Oo3
	URAG+1frjpc/+tBw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="Ebxdh/rg";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=bqMLVqAT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1714298214; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sBgpVp7tDZ8Dn6Cugs3ZGFXi93iPJ/++C3/8thAvv5M=;
	b=Ebxdh/rgJzB0XWz21spWqHVoL52mvJDyomi4Qu6Ct/n/1TweHc9mWQxEJWnD1jxfwrIh5l
	cF/CpGCOkpCf6oRLnFTag4idFVHrLGNNxQB94wd8XlSxlRFgiXPoTgn75+IITYoxDwW0Z4
	XGGnnsnHSJ82b2m9QUx1NhpqFr7NHYo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1714298214;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sBgpVp7tDZ8Dn6Cugs3ZGFXi93iPJ/++C3/8thAvv5M=;
	b=bqMLVqATyE2y48PaImDom6sxJTJtNy712mvN4KmLpmSNuDah8welDCyVl6tY3KWwaq/Oo3
	URAG+1frjpc/+tBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6CABA138A7;
	Sun, 28 Apr 2024 09:56:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id lNLNGGYdLmZrRwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 28 Apr 2024 09:56:54 +0000
Date: Sun, 28 Apr 2024 11:57:05 +0200
Message-ID: <87v84124jy.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Cc: tiwai@suse.de,
	linux-sound@vger.kernel.org,
	colin.i.king@gmail.com
Subject: Re: [PATCH] ALSA: kunit: use const qualifier for immutable data
In-Reply-To: <20240425233653.218434-1-o-takashi@sakamocchi.jp>
References: <20240425233653.218434-1-o-takashi@sakamocchi.jp>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -2.00
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 9496E6095C
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-2.00 / 50.00];
	BAYES_HAM(-2.99)[99.96%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TAGGED_RCPT(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[suse.de,vger.kernel.org,gmail.com];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[suse.de:+]

On Fri, 26 Apr 2024 01:36:53 +0200,
Takashi Sakamoto wrote:
> 
> Some data for testing is immutable. In the case, the const qualifier is
> available for any loader to place it to read-only segment.
> 
> Fixes: 3e39acf56ede ("ALSA: core: Add sound core KUnit test")
> Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>

Applied now.  Thanks.


Takashi
