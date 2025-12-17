Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 288E2224AF2
	for <linux-sound@vger.kernel.org>; Wed, 17 Dec 2025 19:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766000082; cv=none; b=Ir2x+Nvkb62rWYsH/zxtzWbxm/QCZXldS5byaVpEaG6tf+pWBF3gW00Gs5q6pCaluqpz9D+Kb1AiINtKMNGtzju4hM3TmN84I794I4ZGmTlv7rakWD6oDtgZCMMmZX1g2JHFcxH5O2HcBfPORA6mJrT7W4rPqEyzxOjXSsHpFJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766000082; c=relaxed/simple;
	bh=4Pau1NFkTZwBG71u5JBZGC1KnymkQuEaFAU/gavN0N4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fhzdJrbRnjHZuZXt31K+a5j9Aeh+Ruiw34rpjqPV34l2IRvhkX3nx98qkhMLSnf1sy3ZfYdUS/gZSXgA7AU15xfGlhqIoOQG03GUfr8fJkpESLWe4nLe0Qa7xJUtF5AOkmEjsxaGLjUMFC7MGsu7ewRCVAkE4rWbWHVwgN5dHuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=kbQudgkn; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Lcb/v6f4; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=kbQudgkn; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Lcb/v6f4; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="kbQudgkn";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Lcb/v6f4";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="kbQudgkn";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Lcb/v6f4"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 45AAE5BDF2;
	Wed, 17 Dec 2025 19:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1766000078; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FbSDF4qeUw5371vvxn0Cm3Z+RXqgHsRPK+NYeN7pOvc=;
	b=kbQudgknAhI2oHD8xz51/KFyQGqJfeMkMmoaoUFuCAaUG1b47KCM5HbwyT0Y2DWeQbxNQ3
	gr52yimimoyIbFA0rhJYeejRB3Iyy4Yf14OxdjFuccYNlegRR+A6uJvuDGxsMkqEN/bfiM
	dH8vnZMDLceNKQLdWJp22TuCfcbe7l0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1766000078;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FbSDF4qeUw5371vvxn0Cm3Z+RXqgHsRPK+NYeN7pOvc=;
	b=Lcb/v6f4fqzSl/X+E2oDMdGuuGgDG6sPp5SOaN/jvlgR7yZoc+DSFbuegsHUsNUxgB2Zhu
	0S7gKAuMYHKEWsBw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1766000078; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FbSDF4qeUw5371vvxn0Cm3Z+RXqgHsRPK+NYeN7pOvc=;
	b=kbQudgknAhI2oHD8xz51/KFyQGqJfeMkMmoaoUFuCAaUG1b47KCM5HbwyT0Y2DWeQbxNQ3
	gr52yimimoyIbFA0rhJYeejRB3Iyy4Yf14OxdjFuccYNlegRR+A6uJvuDGxsMkqEN/bfiM
	dH8vnZMDLceNKQLdWJp22TuCfcbe7l0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1766000078;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FbSDF4qeUw5371vvxn0Cm3Z+RXqgHsRPK+NYeN7pOvc=;
	b=Lcb/v6f4fqzSl/X+E2oDMdGuuGgDG6sPp5SOaN/jvlgR7yZoc+DSFbuegsHUsNUxgB2Zhu
	0S7gKAuMYHKEWsBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 00D893EA65;
	Wed, 17 Dec 2025 19:34:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id FLeFOs0FQ2n8JQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 17 Dec 2025 19:34:37 +0000
Date: Wed, 17 Dec 2025 20:34:37 +0100
Message-ID: <87h5toc376.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Antheas Kapenekakis <lkml@antheas.dev>
Cc: Shenghao Ding <shenghao-ding@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	matthew.schwartz@linux.dev,
	stable@kernel.org
Subject: Re: [PATCH v1] ALSA: hda/realtek: Add Asus quirk for TAS amplifiers
In-Reply-To: <20251216211714.1116898-1-lkml@antheas.dev>
References: <20251216211714.1116898-1-lkml@antheas.dev>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -3.25
X-Spam-Level: 
X-Spamd-Result: default: False [-3.25 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.15)[-0.758];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]

On Tue, 16 Dec 2025 22:17:14 +0100,
Antheas Kapenekakis wrote:
> 
> By default, these devices use the quirk ALC294_FIXUP_ASUS_SPK. Not
> using it causes the headphone jack to stop working. Therefore,
> introduce a new quirk ALC287_FIXUP_TXNW2781_I2C_ASUS that binds
> to the TAS amplifier while using that quirk.
> 
> Cc: stable@kernel.org
> Fixes: 18a4895370a7 ("ALSA: hda/realtek: Add match for ASUS Xbox Ally projects")
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>

Applied now.  Thanks.


Takashi
