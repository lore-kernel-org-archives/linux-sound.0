Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F352BEFE5
	for <linux-sound@vger.kernel.org>; Sat,  6 Jun 2026 16:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780762712; cv=none; b=dZLQJ3SkR3JHQ1iB0FOPzEfIJRkfhOEOJ5w3N86ZdAqHFRDPXu7CjO6soJxljIRwB7Sz+YylWskriokRWK71Kktklqf+p6AJqg7dBTV6XGuZfm7/qU4bx7Rvgz52MiPTsKPXU2PwehrS5sqOtpL4S1Ojk17bogX7u7d74eIXjvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780762712; c=relaxed/simple;
	bh=/dztJLqyPeev/C8gP7hFXh9Eg0Gcpj/jL71TY0/PT24=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NSSpSaBk5aE8rrmTZcJKiFgpLFHS5i+ys+yT5o/VgPIQmXIk9m3km5l4c3Cw9tUvnnbjV+T43nLJiZbq/XBCPwysEqQqSGkO9NuUbRl5MnhY8JrgwKZjEc1INYmgvvLy7ZXHoxXgGuAbmUFkWYRLkPYGRcB1iJaZdnQZYmUSCZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=exiu+KDp; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=QwPWwhjk; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=exiu+KDp; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=QwPWwhjk; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="exiu+KDp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QwPWwhjk";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="exiu+KDp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QwPWwhjk"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D197A6B38B;
	Sat,  6 Jun 2026 16:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1780762708; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9zI/vBA1q69tqPKTO0iD2+L/XHgLtv2qcG0D5hopDdw=;
	b=exiu+KDp+HX/uUKT4WP33u42T1R8jE6e2vQTGteMvoCbiQEoLntPTCeDAuDuvRUQFKF7sb
	VsdTQZGIqnmPGzzjAHhB0dkCXLSpGSPTlT2QcntztISIZW/962fOJ2RxNCurM4u+LM6kjE
	aqsv05lWsNozDA7J9EAofveGSXPkCGM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1780762708;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9zI/vBA1q69tqPKTO0iD2+L/XHgLtv2qcG0D5hopDdw=;
	b=QwPWwhjkVzIjpswrKZX9gpiQGgbJoCe9GKfplwxSRr0UIjX2KU4XibPaCUFnavRO3P4CDw
	TifntCQy6mUlVJBA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1780762708; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9zI/vBA1q69tqPKTO0iD2+L/XHgLtv2qcG0D5hopDdw=;
	b=exiu+KDp+HX/uUKT4WP33u42T1R8jE6e2vQTGteMvoCbiQEoLntPTCeDAuDuvRUQFKF7sb
	VsdTQZGIqnmPGzzjAHhB0dkCXLSpGSPTlT2QcntztISIZW/962fOJ2RxNCurM4u+LM6kjE
	aqsv05lWsNozDA7J9EAofveGSXPkCGM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1780762708;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9zI/vBA1q69tqPKTO0iD2+L/XHgLtv2qcG0D5hopDdw=;
	b=QwPWwhjkVzIjpswrKZX9gpiQGgbJoCe9GKfplwxSRr0UIjX2KU4XibPaCUFnavRO3P4CDw
	TifntCQy6mUlVJBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9C715779A7;
	Sat,  6 Jun 2026 16:18:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Q3eqJFRIJGofdQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 06 Jun 2026 16:18:28 +0000
Date: Sat, 06 Jun 2026 18:18:28 +0200
Message-ID: <87qzmjskvf.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?C=E1ssio?= Gabriel <cassiogabrielcontato@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Cen Zhang <zzzccc427@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	notify@kernel.org
Subject: Re: [PATCH] ALSA: pcm: Fix unlocked runtime state reads in xfer ioctls
In-Reply-To: <20260605-alsa-pcm-xfer-state-helper-v1-1-eba97cecf820@gmail.com>
References: <20260605-alsa-pcm-xfer-state-helper-v1-1-eba97cecf820@gmail.com>
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
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[suse.com,perex.cz,gmail.com,vger.kernel.org,kernel.org];
	RCPT_COUNT_SEVEN(0.00)[7];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 

On Fri, 05 Jun 2026 17:48:27 +0200,
Cássio Gabriel wrote:
> 
> The recent runtime state locking cleanup converted several PCM ioctl state
> checks to snd_pcm_get_state(), including snd_pcm_pre_prepare(),
> snd_pcm_drain() and snd_pcm_kernel_ioctl(). The native and compat xfer
> ioctl paths still sample runtime->state directly before dispatching to the
> PCM transfer helpers, and snd_pcm_common_ioctl() still samples the
> DISCONNECTED state directly in its common precheck.
> 
> Use snd_pcm_get_state() for those ioctl-side prechecks as well. This keeps
> the externally visible ioctl entry checks consistent with the stream-locked
> state access used by the recent PCM state-read cleanup.
> 
> Fixes: 032322b44c02 ("ALSA: pcm: oss: use proper stream lock for runtime->state access")
> Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>

Applied to for-next branch now.  Thanks.


Takashi
