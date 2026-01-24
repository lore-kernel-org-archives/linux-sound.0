Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E12A683A14
	for <linux-sound@vger.kernel.org>; Sat, 24 Jan 2026 10:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769250075; cv=none; b=HKDzl8fVwA0lNRY7DHOcAt84hrF7oqkDhjfj+F5doQwhA25GLepzEL8ICaCH6PSPhVGJMnvSrdz7zJD/BFLGiJXj/Xmmzr5k2PVAwXgkJzAiwUEekPd0GRkMUwX9+xcwiyoRwmyQWqTmWKvR4q0YDe6DWKyMejPvVArxnjYDdVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769250075; c=relaxed/simple;
	bh=E5Cp2t1fZ8SWEIMeYMos+KcpaaeBddoOhmGlRmtHuXc=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C1OkldZaOex1Qwe9dIcRB7OsIXZYsJr779QcnQQwnD88CMQ6ppERECaF1bTjcIyJGBU2NMsTWko6vKj0e+gidy4bmWm+qXP1Jy1SLqJrzDeVV1GgdNKs7ApSBokbBX2HGZGlq7eOR428ckfn3NSBnNxYyrAAdaHCnMGU33n1pfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=GFdQWIxo; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=sbUylIEG; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=TpXBRdVt; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1aPLn/pI; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GFdQWIxo";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="sbUylIEG";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TpXBRdVt";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1aPLn/pI"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 150903368F;
	Sat, 24 Jan 2026 10:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1769250072; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mryu/c21eZL50YbPE3RLjjUX4m0hxCuaewD6HBe06BE=;
	b=GFdQWIxoN/KYyIMp6DCrgP9gyz6sfq3NuqjkhK8hGeK6Lxz+pp3lsVPxI4wjShDBzeRGWe
	SSZoeoU/tXhlXrN/QTAFq/T5i3LQf74o/dCaZjN5k0vu/EZd7m4Nz4FcMh2SUBrURbtTrb
	95kLX88VKWZxFsGFACw2K5Arq4tJYtY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1769250072;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mryu/c21eZL50YbPE3RLjjUX4m0hxCuaewD6HBe06BE=;
	b=sbUylIEG8Szyrrnb34wME/KewYlwyrxhdVy3KC2FQILWmsnvmK3O8BsJj673TmOIjkowSM
	GERJRIuu5AG1R3Cg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1769250071; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mryu/c21eZL50YbPE3RLjjUX4m0hxCuaewD6HBe06BE=;
	b=TpXBRdVtcBhp5yzhtAe6eNEbVo2Iph/lkNOz/seuOcazDmSBMj/FoDjavlTQaPcrMoCalB
	WY9Rs88hgMyYugZyTaayEA84V4hn2KHai9rnZkWR5fN3kmPBDiu1m5n8TyW+2XgsOMP+/y
	f0f7CiGpSG3Fbbg0gzzOzE44ivEB4Ys=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1769250071;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mryu/c21eZL50YbPE3RLjjUX4m0hxCuaewD6HBe06BE=;
	b=1aPLn/pIzrj548mDNMP752eXIbIAfmEXYLsanIW48qVuuPxUdeanmx7ZoN9UwGvTsIH+fD
	EVxwZSSVS9y1L9Bw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C9CF2137DE;
	Sat, 24 Jan 2026 10:21:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 0eR9LhaddGnaCQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 24 Jan 2026 10:21:10 +0000
Date: Sat, 24 Jan 2026 11:21:10 +0100
Message-ID: <87ikcrcnvt.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Damien <damien.dagorn29@gmail.com>
Cc: perex@perex.cz,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH 0/1] ALSA: hda/realtek: fix LG Gram Style 14 speakers
In-Reply-To: <CAN59QMUhd4kHrkRoJA6VzEr2VKezN2yjHnANaQoZn2-Bnwe3bQ@mail.gmail.com>
References: <CAN59QMUSiJjGrpVzW2czHqdbVUf4yshxUFdKQPws2Fe8veSsdQ@mail.gmail.com>
	<871pjge180.wl-tiwai@suse.de>
	<CAN59QMUhd4kHrkRoJA6VzEr2VKezN2yjHnANaQoZn2-Bnwe3bQ@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-7
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_DN_SOME(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -1.80
X-Spam-Level: 

On Fri, 23 Jan 2026 18:20:44 +0100,
Damien wrote:
> 
> 
>  Hi Takashi,
> 
>  Thanks for the feedback. I¢ve reworked the patch as requested:
>  - single patch (no cover letter), with the full description in the commit
> message
>  - proper Signed-off-by with my full name
>  - added comments for the quirk
>  - use AC_VERB_SET_PROC_COEF for 0x400 and 0xb011 instead of 0x4b0
> 
> I hope this rework matches your request
> 
>  Please find the updated patch attached.
> 
>   Thanks,
>   Damien

Thanks, I applied now to for-next branch.

At the next time, please try to submit via git-fixes directly without
attachments.  An attachment is rather a last-resort when no direct
submission is possible by some reasons.


Takashi
