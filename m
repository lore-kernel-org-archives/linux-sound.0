Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C89158A22
	for <linux-sound@vger.kernel.org>; Tue,  7 May 2024 12:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715085600; cv=none; b=oP4JsPXp9CQiTs66DeuYLwBqNONFrsr3auZ/4K6Spl+rWVmSpVUh0y+7nybPSzg+ZaDjXt8nP/97Ze+AZTjO+PzMM6k5ZMRPDmLGUhWl0pTZf9h54aB9pQ7y8teHnhEpgTiBlHInWOFNtlV57YGr3mCnkOWHF0nKpoDz6Pn20NY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715085600; c=relaxed/simple;
	bh=RbYUn+gUzW6HCnq8ikpevcpJ7+YW4H1Pl0jfAJ/jP3E=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r2YNILFXoU+wyEDWyAFyFslIwJvdmyIfvOxhA2Z2p9XJ2E5uCcdWCcl0/4FamIFWJ67U8nvFL2eJ/uy3qwFAatnrJH1akPTHg7hv/quVsRyAYZS6BxaqlfQImrnmvIwXE8ltsVqrlw1njBudRwczMQDTTtbbQUP+fiwYzoKccIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=KLS2uk42; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=R0t2CU0r; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ZgKk+Ylr; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=UCuKRzCw; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="KLS2uk42";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="R0t2CU0r";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZgKk+Ylr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="UCuKRzCw"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E3A1D33EA0;
	Tue,  7 May 2024 12:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715085597; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pRJLpcb3e/AH0sQ2T9KHVFpae2olZe5CthbT3PcTaXY=;
	b=KLS2uk42fTlxETtHnk/jVD7PCn9bL9vC5vxy+ql9sSolrCVC93hECb0vggv8akd4TpquZ5
	0mEjsZ5jbJGSucysb7+b71OuJbNaMugKQgZARPi0nvzByQFJzH16xf8RZ0PKQK/8JwqMLp
	Ugojdckhz6AHtKV4VDfAG4G9B6YZR/g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715085597;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pRJLpcb3e/AH0sQ2T9KHVFpae2olZe5CthbT3PcTaXY=;
	b=R0t2CU0rr89a0yQJKI0LogSR/+1Q8aiXAt4eT3EhKSZoFm1ri64vEsV1lT5V/pRRSkFnCk
	RDrS9j5G/J5xAsBA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ZgKk+Ylr;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=UCuKRzCw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715085595; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pRJLpcb3e/AH0sQ2T9KHVFpae2olZe5CthbT3PcTaXY=;
	b=ZgKk+YlrOFt//Tu+7OKm6Lc4C3yw3SSmxMbOBwU6x8dRQ1s2vGTWJykKPgCdUskmqXJueH
	nnAPAYTSF2KuDshfl/ZgtLuuRcuiArW6k655rXeRENxtmX8v2R491aeB26AxXQqYNLTxdZ
	tH5n5f2H98kxAoZAl/3DKhxoK5yUEH8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715085595;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pRJLpcb3e/AH0sQ2T9KHVFpae2olZe5CthbT3PcTaXY=;
	b=UCuKRzCw7Hc0D55DKyfv0VVxPCs2AaLyCrtW+rJk8nVK0raXjU4edUSYoeYLY6P+SaFtQV
	JZaarGaUwh1cRZBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C8904139CB;
	Tue,  7 May 2024 12:39:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id hLhmMBshOmbmFgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 07 May 2024 12:39:55 +0000
Date: Tue, 07 May 2024 14:40:10 +0200
Message-ID: <87jzk5eqxh.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jaroslav Kysela <perex@perex.cz>
Cc: <linux-sound@vger.kernel.org>,
	Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH v3 0/2] ALSA: pcm: reinvent the stream synchronization ID API
In-Reply-To: <20240507083142.557299-1-perex@perex.cz>
References: <20240507083142.557299-1-perex@perex.cz>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -4.50
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: E3A1D33EA0
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.50 / 50.00];
	BAYES_HAM(-2.99)[99.94%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	DWL_DNSWL_LOW(-1.00)[suse.de:dkim];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]

On Tue, 07 May 2024 10:26:17 +0200,
Jaroslav Kysela wrote:
> 
> Until the commit e11f0f90a626 ("ALSA: pcm: remove SNDRV_PCM_IOCTL1_INFO
> internal command"), there was a possibility to pass information
> about the synchronized streams to the user space. The mentioned
> commit removed blindly the appropriate code with an irrelevant comment.
> 
> The revert may be appropriate, but since this API was lost for several
> years without any complains, it's time to improve it. The hardware
> parameters may change the used stream clock source (e.g. USB hardware)
> so move this synchronization ID to hw_params as read-only field.
> 
> It seems that pipewire can benefit from this API (disable adaptive
> resampling for perfectly synchronized PCM streams) now.

I find the idea is fine.  But as Sakamoto-san suggested in the
previous thread, it's no urgent issue, and I'm inclined to postpone
the merge after 6.10 merge window.  So let's brew the stuff well for
now.


thanks,

Takashi
