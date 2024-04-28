Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B01C7319A
	for <linux-sound@vger.kernel.org>; Sun, 28 Apr 2024 18:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714328165; cv=none; b=J6mI/C0rhflJO0wK9RBF+iRYjCe88u70MY/gxXvAvur3ioU6HIdxWyzn+4qjXWKAplTKrrJ2LffX+8P9Kav6eNNXLkZtnY3u92qZ//cgagOnhfRowit1qgrVcNiODu2MMLS8g2PQlakly+iyW2+l06pJrkOE2zmYKxU+7TLidwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714328165; c=relaxed/simple;
	bh=mVTqCKG5S5Ys4ycUolfm+aT1l41wFwuMFu5fvqNYTuA=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nePhOFTWXSRseJHG85cSLRtcKcujn1jSVdIvidymZloSKMbZWYclJ0C282rIPEOUdw0MFME9RfavgKJKzl6uad/+riiIr9b7cLh8vmhsRdn9uy4tSE6eVXXm/mIdWCf1nLvWXr+L6QO61M3mSQF5mVQ+39AHHExJVV5rBe9txaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=18hZgTSL; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Lt4jT84w; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=18hZgTSL; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Lt4jT84w; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="18hZgTSL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Lt4jT84w";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="18hZgTSL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Lt4jT84w"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 23B141F820;
	Sun, 28 Apr 2024 18:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1714328162; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=booSf1MO4Gc142wvkoSc+Rh+C+0zmt+O7+Kl/xNAU7Q=;
	b=18hZgTSLnFd9S3FQRfZQ3V6PrsNx97rjoZekpyJcCfSxA8EKzRVzNNPG2HRGGORORueHxH
	TJ4foDL9+6NXa/GDVFVx/9x/LqqPD2WknoOnILaLnUj0aJ1tnzuUpnRvjIGHngX7Bkxb/n
	sYLEbAkwC2gqnoiSVJt1J5rgahlRIRI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1714328162;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=booSf1MO4Gc142wvkoSc+Rh+C+0zmt+O7+Kl/xNAU7Q=;
	b=Lt4jT84wFVk8CFcL8ZuHhRlMXKKUxABlVBrZgfEErG+fKuOlKK1Rj0cLodKgHnWVrTIxrr
	AuPEckUvSltKmJBQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=18hZgTSL;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Lt4jT84w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1714328162; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=booSf1MO4Gc142wvkoSc+Rh+C+0zmt+O7+Kl/xNAU7Q=;
	b=18hZgTSLnFd9S3FQRfZQ3V6PrsNx97rjoZekpyJcCfSxA8EKzRVzNNPG2HRGGORORueHxH
	TJ4foDL9+6NXa/GDVFVx/9x/LqqPD2WknoOnILaLnUj0aJ1tnzuUpnRvjIGHngX7Bkxb/n
	sYLEbAkwC2gqnoiSVJt1J5rgahlRIRI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1714328162;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=booSf1MO4Gc142wvkoSc+Rh+C+0zmt+O7+Kl/xNAU7Q=;
	b=Lt4jT84wFVk8CFcL8ZuHhRlMXKKUxABlVBrZgfEErG+fKuOlKK1Rj0cLodKgHnWVrTIxrr
	AuPEckUvSltKmJBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EA1B0136DB;
	Sun, 28 Apr 2024 18:16:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 9ILpN2GSLmYyNQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 28 Apr 2024 18:16:01 +0000
Date: Sun, 28 Apr 2024 20:16:13 +0200
Message-ID: <87r0ep1hg2.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
Cc: linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Pietro Caruso <pietrocaruso50@gmail.com>
Subject: Re: [PATCH v2 0/4] ALSA: emu10k1: more improvements related to uploading firmware to the E-MU dock
In-Reply-To: <20240428093717.3198716-1-oswald.buddenhagen@gmx.de>
References: <20240428093717.3198716-1-oswald.buddenhagen@gmx.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spamd-Result: default: False [-4.28 / 50.00];
	DWL_DNSWL_MED(-2.00)[suse.de:dkim];
	BAYES_HAM(-1.77)[93.64%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[gmx.de];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,suse.de,perex.cz,gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim]
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 23B141F820
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Score: -4.28

On Sun, 28 Apr 2024 11:37:13 +0200,
Oswald Buddenhagen wrote:
> 
> ---
> v2:
> - split off from more critical part of the series
> - re-ordered two commits to reduce diff churn
> ---
> This patch series needs to be applied on top of the patch titled "ALSA:
> emu10k1: make E-MU FPGA writes potentially more reliable".

Applied to for-next branch (on top of the previous set).


Takashi
