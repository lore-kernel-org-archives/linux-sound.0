Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C92C3BCD0A
	for <linux-sound@vger.kernel.org>; Thu, 28 May 2026 12:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779969768; cv=none; b=Gy7R7LGoaW2LkMy0yqz1VXUP/UJbqHZH8cIXP1bq8tFfNkwI2wEZ6AH+8rkFhZZ9nEeqgL7t3kqT0gMcu9GCOiILoTuTLPOJQfPQ16+ap1pnKPbsAHKmqK/Y4K4cm3JUWHNRNwfwnI7IyMLSSSqjlFwdv7zNmOqSQI+Bjo6kVpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779969768; c=relaxed/simple;
	bh=kLXdfIu3TDXvhgdmIMOlcTwukAOIVFTN+jy1SXAecZE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fFWsnUi/J1OC28sDoBFi38PiSe6xNrSqKkQOvU7luDYSgjd9fohw3IQYmTCud73sQZDVqK5r92SbtkpFhMFSUiJ7OBu2VU3Gc3Rg5tJk4gX7O6avIvlOl9rcVWgW4gou/V3tbXy5xQ4XUXFy3ews1b7lCZ5M0QNd60bZ+lbRb7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qtcAg6YE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=0gMeqoDh; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=IMVNXIRo; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=IUU4TxLa; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qtcAg6YE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0gMeqoDh";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="IMVNXIRo";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="IUU4TxLa"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 70DD06A8E1;
	Thu, 28 May 2026 12:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779969765; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8IWXAOyH83XZYhGf4hPtS9ap06We8NE01Pzy5wY+UUo=;
	b=qtcAg6YEBFLyTbtXCZbf1kghLYodQl6NL9qpjRjagFcBMM6QALU9dP94YI4Ph1Mv5+03e2
	/sm2CU3sZ4R4djflmkjL9Yy3wlwonNB/DesSmGCTa/qVqKILBAUZ9tKUxKfQ+Fca4gsE3V
	lpg2fyt1M0QZ9pGjFrencpPY2+JsVsk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779969765;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8IWXAOyH83XZYhGf4hPtS9ap06We8NE01Pzy5wY+UUo=;
	b=0gMeqoDhmRd27WNj80fYSx1iiuWpQQP1kygmYKwiZv7CrVdZfKyDO0E5c4u351S3kaj+dT
	7fR9uihmit4YS2Aw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779969764; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8IWXAOyH83XZYhGf4hPtS9ap06We8NE01Pzy5wY+UUo=;
	b=IMVNXIRobJflV6VDXxDbEXiphZfnikfQsrO0eYOsMSCApiU8wjXM5GR1LwyuMRv9iJNBxK
	0h6T1UzPfNtsld8fniuIhmeeBElnd3Pqw4a/Jh4acBG60bv/nx1uK9gM4FP70iI9Lsv/D1
	WGkcn+OAN9GCgWQR1n0Qp/Xrgzvvvfc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779969764;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8IWXAOyH83XZYhGf4hPtS9ap06We8NE01Pzy5wY+UUo=;
	b=IUU4TxLawvB6n9j0VXFmZuP/PBnR61XaB8h4rvMrE4214zthu7ZSb9bfYZNBgwf0OeoCWW
	xNH2AHeQIQSTVaAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4CCB45AD93;
	Thu, 28 May 2026 12:02:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id KIFrEeQuGGpXZQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 28 May 2026 12:02:44 +0000
Date: Thu, 28 May 2026 14:02:43 +0200
Message-ID: <87se7bu4gs.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v7.1-rc5
In-Reply-To: <69088c924b372c57eeb1e4e49a2c09ba@kernel.org>
References: <69088c924b372c57eeb1e4e49a2c09ba@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
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
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,alsa-project.org];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]

On Thu, 28 May 2026 13:44:09 +0200,
Mark Brown wrote:
> 
> The following changes since commit e7ae89a0c97ce2b68b0983cd01eda67cf373517d:
> 
>   Linux 7.1-rc5 (2026-05-24 13:48:06 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v7.1-rc5
> 
> for you to fetch changes up to f63ad68e18d774a5d15cd7e405ead63f6b322679:
> 
>   ASoC: codecs: simple-mux: Fix enum control bounds check (2026-05-27 13:43:20 +0100)
> 
> ----------------------------------------------------------------
> ASoC: Fixes for v7.1
> 
> This round of fixes is mostly Sirini's Qualcomm cleanups that have been
> in review for a while, we also have a couple of small fixes from Cássio.

Pulled now.  Thanks.


Takashi
