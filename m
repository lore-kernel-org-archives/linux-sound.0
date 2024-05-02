Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E490721A04
	for <linux-sound@vger.kernel.org>; Thu,  2 May 2024 07:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714635087; cv=none; b=pk8b1j5xgYks60sEK3chBvVTvMgKhaEfCF3whrXO0pMo+VMqJEDlWf0Hxzk+bbXRhHNghTRD+c8Zm4enXznVMvWKIX5g4U2HCYLLRClYUVuCHff9MCn/1IYjqvgXTBuODcf51ynnB/wNi/bmUPJgEml7kwwbz+V7B8CDH/h49Po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714635087; c=relaxed/simple;
	bh=BqiBwAw5yqAHE+j0zdewiTNyEITmcBLjOY+uBc+x798=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QELWrTlZJlftUzb0T1AmyFQppRXJShLs2/yrP+Xid4a5ZXgta2p3Vu6et3XwuTP6eCcuTbxFalZFwYd6WQcg7+BONJUDmMuBKzct1ixflqKB8J3SUMi93u+ekiwGE+ah/yf6RIfSx4x9Nh5zwH08YoSyQN/KgjQMHfoFTyKRR1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tkgjT535; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Qj0iegL5; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tkgjT535; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Qj0iegL5; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tkgjT535";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Qj0iegL5";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tkgjT535";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Qj0iegL5"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3145135082;
	Thu,  2 May 2024 07:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1714635084; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Pb4dl9miviLjn0JKb2vgCkSKs5YZJ6qwOBpIFjEzmLA=;
	b=tkgjT535sSLagqOFdZ58ZYA7ARQ+Wlzbpjl8xRyULc8xQhzGvJfZAT6FHgjqkSMOJWxNai
	ddszPPDHisqiD85OIxKpTL6UOItPmdk+Nxe1fmqDPQZnbdPDR+0l5/DsGB7n4Gcfa+m5jn
	Yre8TtCotc+ZfQ+vgCSyG3vY/CToIwA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1714635084;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Pb4dl9miviLjn0JKb2vgCkSKs5YZJ6qwOBpIFjEzmLA=;
	b=Qj0iegL5EhrW5OFLJYUDTPj3QnrRvpPOnsi4sVy/CsDgBzocKhDoNCEQ+QCPhcjnyxrwaL
	QcUa+YdO2hJNOBDA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=tkgjT535;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Qj0iegL5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1714635084; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Pb4dl9miviLjn0JKb2vgCkSKs5YZJ6qwOBpIFjEzmLA=;
	b=tkgjT535sSLagqOFdZ58ZYA7ARQ+Wlzbpjl8xRyULc8xQhzGvJfZAT6FHgjqkSMOJWxNai
	ddszPPDHisqiD85OIxKpTL6UOItPmdk+Nxe1fmqDPQZnbdPDR+0l5/DsGB7n4Gcfa+m5jn
	Yre8TtCotc+ZfQ+vgCSyG3vY/CToIwA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1714635084;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Pb4dl9miviLjn0JKb2vgCkSKs5YZJ6qwOBpIFjEzmLA=;
	b=Qj0iegL5EhrW5OFLJYUDTPj3QnrRvpPOnsi4sVy/CsDgBzocKhDoNCEQ+QCPhcjnyxrwaL
	QcUa+YdO2hJNOBDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0AF2813957;
	Thu,  2 May 2024 07:31:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id X39sAUxBM2YcTwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 02 May 2024 07:31:24 +0000
Date: Thu, 02 May 2024 09:31:37 +0200
Message-ID: <87v83wk6ue.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jaroslav Kysela <perex@perex.cz>
Cc: <linux-sound@vger.kernel.org>,
	Takashi Iwai <tiwai@suse.de>,
	Takashi Sakamoto <takaswie@kernel.org>
Subject: Re: [PATCH] ALSA: pcm: reinvent the stream synchronization ID API
In-Reply-To: <20240430161012.4011064-1-perex@perex.cz>
References: <20240430161012.4011064-1-perex@perex.cz>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -3.05
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 3145135082
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.05 / 50.00];
	BAYES_HAM(-2.54)[97.94%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]

On Tue, 30 Apr 2024 18:10:12 +0200,
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

What's the benefit of moving to hw_params?  The current inquiry via
ioctl can also follow the dynamic change, no?  I'm not entirely
objecting to the idea, but need to understand better.

> It seems that pipewire can benefit from this API (disable adaptive
> resampling for perfectly synchronized PCM streams) now.

If the support by pipewire is planned, it'd be good to revive the
feature, yes.

> 
> --- a/include/uapi/sound/asound.h
> +++ b/include/uapi/sound/asound.h
(snip)
> @@ -334,6 +334,7 @@ union snd_pcm_sync_id {
>  	unsigned char id[16];
>  	unsigned short id16[8];
>  	unsigned int id32[4];
> +	__u64 id64[2];
>  };

What's the reason for this __u64 addition?  For the easiness of
zero-compare?


thanks,

Takashi
