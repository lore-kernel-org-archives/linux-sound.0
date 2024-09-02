Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A268A2032A
	for <linux-sound@vger.kernel.org>; Mon,  2 Sep 2024 08:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725265086; cv=none; b=mD/VHr0ezwS5M7D2T54iunExDPskAx1TQ7ROX2hZn+PGtrN143x/Dm/8bdZxAhsO/mB3ciXyMiRJGK2keWqbMKlL4Elyi+Wb/vAw+DW+uPmM1x3zaI5PUnA2fAE2itoWiVYcyOMRAZUmClz1Mp46hHawVbpyy4p5l2DeUT/5imw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725265086; c=relaxed/simple;
	bh=52assw0hGge016O8F2cjodqEk0vhSJkxCJ/gtHhLwU8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pYwBWLRsGRuPiRfNiFwORYTOvdpJljvDcXpERDGBCjBlYojxSkE47D7SND1LRAk8ikbff/6Zs0vG3wXrg+hfuF3p71fP9u+uUUqyx+vS63rhN6iyOGlvsD2/lTBiO3A6eEKulxl5P9DBujm0RWb/bG3IrYWvm1nJMV/80JArt20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=XlHC91e1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ukCadAz5; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=XlHC91e1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ukCadAz5; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="XlHC91e1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ukCadAz5";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="XlHC91e1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ukCadAz5"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id AF9D51F76E;
	Mon,  2 Sep 2024 08:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1725265082; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hV5IV01C08oAh7Gbpil4KkUZEN68BE9rNUyg9koF8YE=;
	b=XlHC91e1JLJJdu+bOTY4VE5ZpA2BQJnj+B9XwVIioodLzT2VyjDRN1CJwPy4k4+Yv3eKy1
	rnssMbaFV/BmWSUxSHpVtOgXc2JNd+l0VJ5XBU+XVfH9Ux+mLZ8VXXm8joDTgUhTqS2R7m
	v6306zTGgoxV96+7H/YuT8VdAgKJpPs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1725265082;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hV5IV01C08oAh7Gbpil4KkUZEN68BE9rNUyg9koF8YE=;
	b=ukCadAz5KaZ9L3vEUyf1p/rwpOJGemcHa/CiVXZCe3fQ0hTzegp7WePBzvLEkRelonpA2Q
	mHaxV40/NDBq1rBA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=XlHC91e1;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=ukCadAz5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1725265082; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hV5IV01C08oAh7Gbpil4KkUZEN68BE9rNUyg9koF8YE=;
	b=XlHC91e1JLJJdu+bOTY4VE5ZpA2BQJnj+B9XwVIioodLzT2VyjDRN1CJwPy4k4+Yv3eKy1
	rnssMbaFV/BmWSUxSHpVtOgXc2JNd+l0VJ5XBU+XVfH9Ux+mLZ8VXXm8joDTgUhTqS2R7m
	v6306zTGgoxV96+7H/YuT8VdAgKJpPs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1725265082;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hV5IV01C08oAh7Gbpil4KkUZEN68BE9rNUyg9koF8YE=;
	b=ukCadAz5KaZ9L3vEUyf1p/rwpOJGemcHa/CiVXZCe3fQ0hTzegp7WePBzvLEkRelonpA2Q
	mHaxV40/NDBq1rBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 86B7613AE5;
	Mon,  2 Sep 2024 08:18:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id TnWbH7p01WYHPgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 02 Sep 2024 08:18:02 +0000
Date: Mon, 02 Sep 2024 10:18:48 +0200
Message-ID: <87plpmii3b.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: <perex@perex.cz>,
	<tiwai@suse.com>,
	<ivan.orlov0322@gmail.com>,
	<linux-sound@vger.kernel.org>
Subject: Re: [PATCH -next] ALSA: core: timer: Use NSEC_PER_SEC macro
In-Reply-To: <20240902071622.3519787-1-ruanjinjie@huawei.com>
References: <20240902071622.3519787-1-ruanjinjie@huawei.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: AF9D51F76E
X-Spam-Score: -2.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,gmail.com,vger.kernel.org];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[huawei.com:email,suse.de:mid,suse.de:dkim]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On Mon, 02 Sep 2024 09:16:22 +0200,
Jinjie Ruan wrote:
> 
> 1000000000L is number of ns per second, use NSEC_PER_SEC macro to replace
> it to make it more readable
> 
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

Thanks, applied.


Takashi
