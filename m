Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D521030F943
	for <linux-sound@vger.kernel.org>; Wed, 18 Feb 2026 08:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771403945; cv=none; b=bUzZRzi9jhygFUShBelwKrobdJUoiFkpSnY4S/NUsCGQhE2BZals18lRor3NMhFYAU15sMzskbcbUxdRyjnTbxAg1/aKMykjZ+rymrRGjuLjfy2VbC8euvVGIud02/Lha2eZeFiHAFji8JjCRqAC51QDgbGJRpvApm28tF3o8EU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771403945; c=relaxed/simple;
	bh=44EdXOwBuypuVNetVNF0AeKEQ6jUOevvzwrh9HHJTMg=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QbocIasUaCkBWVbKUPJI/JJBLXQ7GgOiHkBxdYoBnfNLzU34Y7TEvL6+8wre39/XKG5mMSc/n18tLhMUs8rLaLJVYr/kwr7+/0ki2F62YvhN2BxnYr6irR38Tn/k+8Tr+7qDWI1v5Jl9HAN+08s0xX2BpxgbRXtGHfdeqaCzO5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=S7ynkSrL; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=X/cBkV/U; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=S7ynkSrL; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=X/cBkV/U; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="S7ynkSrL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="X/cBkV/U";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="S7ynkSrL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="X/cBkV/U"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1C6DD3E6EF;
	Wed, 18 Feb 2026 08:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1771403942; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5FMXXPqj3Ti1dmndF31/6GB3Cc8mBPBZgZ/SGR3KIvY=;
	b=S7ynkSrL17CqvceAGC4Nf8Yh2SVoirBHM+ttn/LfRcIDR+N9mTB0cCGm+LF0/zavR+joWP
	vofvgPQuygJstAVDIHza2waX7ht6Em0BICLHmrGf3Vq90nRrcS/AwpHSRl7r8kRBm+kqal
	DyzOZ1/ZFTy9Vyme8diH8KMOFNJmmlg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1771403942;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5FMXXPqj3Ti1dmndF31/6GB3Cc8mBPBZgZ/SGR3KIvY=;
	b=X/cBkV/ULGD9T5c/xmcAyPZX+Vug2u3LOOgv8vUTcdxlGY9TytLOWtuVeBgGpKZeWbXBel
	kDrEk61qrzOKSWCA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1771403942; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5FMXXPqj3Ti1dmndF31/6GB3Cc8mBPBZgZ/SGR3KIvY=;
	b=S7ynkSrL17CqvceAGC4Nf8Yh2SVoirBHM+ttn/LfRcIDR+N9mTB0cCGm+LF0/zavR+joWP
	vofvgPQuygJstAVDIHza2waX7ht6Em0BICLHmrGf3Vq90nRrcS/AwpHSRl7r8kRBm+kqal
	DyzOZ1/ZFTy9Vyme8diH8KMOFNJmmlg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1771403942;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5FMXXPqj3Ti1dmndF31/6GB3Cc8mBPBZgZ/SGR3KIvY=;
	b=X/cBkV/ULGD9T5c/xmcAyPZX+Vug2u3LOOgv8vUTcdxlGY9TytLOWtuVeBgGpKZeWbXBel
	kDrEk61qrzOKSWCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C20B83EA65;
	Wed, 18 Feb 2026 08:39:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id RfA+LqV6lWn3LwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 18 Feb 2026 08:39:01 +0000
Date: Wed, 18 Feb 2026 09:39:01 +0100
Message-ID: <87qzqia1ju.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Sean Rhodes <sean@starlabs.systems>
Cc: linux-kernel@vger.kernel.org,
	tiwai@suse.com,
	david.henningsson@canonical.com,
	perex@perex.cz,
	kailang@realtek.com,
	linux-sound@vger.kernel.org,
	edip@medip.dev,
	sbinding@opensource.cirrus.com,
	chris.chiu@canonical.com
Subject: Re: [PATCH] ALSA: hda/realtek: Fix speaker pop on Star Labs
In-Reply-To: <87seaya1lx.wl-tiwai@suse.de>
References: <CABtds-3QpFkofJydHXindqvABH8uT=t0p-vdMyfQDH04B4=cPQ@mail.gmail.com>
	<87seaya1lx.wl-tiwai@suse.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.30
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
	RCPT_COUNT_SEVEN(0.00)[10];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.com:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO

On Wed, 18 Feb 2026 09:37:46 +0100,
Takashi Iwai wrote:
> 
> On Wed, 18 Feb 2026 09:18:42 +0100,
> Sean Rhodes wrote:
> > 
> > From a673e45b345d494b7ec7143a8ace72faf6aa85f1 Mon Sep 17 00:00:00 2001
> > From: Sean Rhodes <sean@starlabs.systems>
> > Date: Tue, 17 Feb 2026 11:53:41 +0000
> > Subject: [PATCH v2] ALSA: hda/realtek: Fix speaker pop on Star Labs
> >  StarFighter
> > To: linux-kernel@vger.kernel.org
> > Cc: tiwai@suse.com,
> >     perex@perex.cz,
> >     sbinding@opensource.cirrus.com,
> >     kailang@realtek.com,
> >     chris.chiu@canonical.com,
> >     edip@medip.dev,
> >     david.henningsson@canonical.com,
> >     linux-sound@vger.kernel.org
> 
> Those lines appear in the patch description by some reason.
> I guess your mailer put it wrongly...

Also, when resubmitting a new patch, please put 'v2' or such prefix
("[PATCH v2] ALSA: hda/realtek: ....") to distinguish from the
previous submission.


thanks,

Takashi
