Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04CAA352C4E
	for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 09:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774604657; cv=none; b=OFXZLmZOulmbLaRaarD4TRfD5MAlqWpvGro5naTLYKHYiNrR5dMTkQOjDNDlEn3xtClWMWc6M71dzhKV0DJbXN/dSL55Y+fncuGbepJ3PfuBEbKOIAp3mNN9cCnMK9iN12bl+JTf9erP4nMYE+Tx/MS3v6eLM8vz150cJJoYqNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774604657; c=relaxed/simple;
	bh=Cs/uZjdWGAYe1ZSpUB1KNIt1kJX00zMQwPaIJ85kvZ8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UpnL4jYWXlQK865quo8dAKrupfpQcljsEuiGFSRGipGEAkbJd7mLitF3M3KISKG6mo3fi+rBawoNkV7hojF5DbLWN/QKT5se6CV7ha6+7DESR36O33RrjqUC2gBCQ1Fhv27qEIY+C7g/YJ1j2KkfdI5u+F2OeU6gTkIrq8bwt2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ZFuxuU3p; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Zc4QT3DW; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ZFuxuU3p; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Zc4QT3DW; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZFuxuU3p";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Zc4QT3DW";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZFuxuU3p";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Zc4QT3DW"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 68D204D1E1;
	Fri, 27 Mar 2026 09:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774604654; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ynkhkaWjdFA1WWXOxb9T8AteOlIuUWnVqj5mFKdOC/Y=;
	b=ZFuxuU3p/ki7aakEjBDTdcW37gi7ANY4dhKHUNXVQ6w4GTlsfhVli8H/FY0HCgkQfR0uu7
	JyaQLLwiceRPLgMQzvDzk/QrtE69Bhzr3biXHXKIlcA+E0+EjjiRYTHeUI5Bis44QmC8Rb
	KCTZe6benjGyaEJe+7AteEr96+AWQwM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774604654;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ynkhkaWjdFA1WWXOxb9T8AteOlIuUWnVqj5mFKdOC/Y=;
	b=Zc4QT3DWTLr/w8ME2gInbDSfXnr9L1ZZcycq58XQwZYRCmbM2gT7nI5RkgwLIZq3x41wyX
	eedjK/woV2XNI3DA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774604654; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ynkhkaWjdFA1WWXOxb9T8AteOlIuUWnVqj5mFKdOC/Y=;
	b=ZFuxuU3p/ki7aakEjBDTdcW37gi7ANY4dhKHUNXVQ6w4GTlsfhVli8H/FY0HCgkQfR0uu7
	JyaQLLwiceRPLgMQzvDzk/QrtE69Bhzr3biXHXKIlcA+E0+EjjiRYTHeUI5Bis44QmC8Rb
	KCTZe6benjGyaEJe+7AteEr96+AWQwM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774604654;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ynkhkaWjdFA1WWXOxb9T8AteOlIuUWnVqj5mFKdOC/Y=;
	b=Zc4QT3DWTLr/w8ME2gInbDSfXnr9L1ZZcycq58XQwZYRCmbM2gT7nI5RkgwLIZq3x41wyX
	eedjK/woV2XNI3DA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3EA874A0A2;
	Fri, 27 Mar 2026 09:44:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id LPGgDW5RxmlqLgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 27 Mar 2026 09:44:14 +0000
Date: Fri, 27 Mar 2026 10:44:13 +0100
Message-ID: <87ecl5sj2q.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "Kshamendra Kumar Mishra" <kshamendrakumarmishra@gmail.com>
Cc: "Jaroslav Kysela" <perex@perex.cz>,
	"Takashi Iwai" <tiwai@suse.com>,
	<linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ALSA: hda/realtek: add HP Laptop 15-fd0xxx mute LED quirk
In-Reply-To: <DHAB51ISUM96.2K9SZIABIDEQ0@gmail.com>
References: <DHAB51ISUM96.2K9SZIABIDEQ0@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.29 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.19)[-0.974];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -3.29
X-Spam-Level: 

On Mon, 23 Mar 2026 17:37:50 +0100,
Kshamendra Kumar Mishra wrote:
> 
> HP Laptop 15-fd0xxx with ALC236 codec does not handle the toggling of
> the mute LED.
> This patch adds a quirk entry for subsystem ID 0x8dd7 using
> ALC236_FIXUP_HP_MUTE_LED_COEFBIT2 fixup, enabling correct mute LED
> behavior.
> 
> Signed-off-by: Kshamendra Kumar Mishra <kshamendrakumarmishra@gmail.com>

Thanks, applied now.


Takashi
