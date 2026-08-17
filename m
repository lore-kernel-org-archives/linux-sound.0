Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D80C3BA241
	for <linux-sound@vger.kernel.org>; Mon, 17 Aug 2026 07:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786953273; cv=none; b=JjGCek/tP2TbkjQz9Wbp9TCParwqI3LaLa2tvEPc9I8H4/rV/xYj0bWoYdECbsGYeJN6zdyHiG+kIIfUh59pNl1+EV2m7C1ZGACBJSesMGxVsSen6cPxFPoc5gXW83Y9Xaw5pTIcRu6B9rmNx7YqSwJ6WCvcbkDiyVQ+CipWLmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786953273; c=relaxed/simple;
	bh=Qw+Ez5J0Oppf2ILzCNJ+lMW7svl1hLHaC3UOwsD4ypc=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HMJndo+2GpkQNQRSCdwobFEMrSUk/CZ7FoQNAywUeXRdfGlFIO+o9uZOmKGrBaZoNeNAYYJHcvajmgl2UxQlBSp/o62JGzxpOviIjstNK4kuH1XRGGA65rNzSZ8HdfqGhoHw8JqKquugSGkBHr69ODWvmEyxYMwwKagWv/CdRXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BWSERPmb; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=D4Wl3AEM; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=upfXhtFz; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=y302q7In; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BWSERPmb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="D4Wl3AEM";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="upfXhtFz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="y302q7In"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 41DD583EC9;
	Mon, 17 Aug 2026 07:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786953265; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cPQirfEGQ19iTnitl6rAxMrdTbzzzuO4z7X7cRe7UdQ=;
	b=BWSERPmbKfqylj+Px/mu/1rqaNkoKSbbgd72jtmDKPFuOcAcYJLVvyp/u8O4G3cnxxeJX2
	+IFSSDXEFMc6U20vJwkq9Y2cPOMELayYrKLAmgsF+sacnz079kFw3QLE4h1r5OUws1XV5O
	0HHs9GfUqTwVs5fd48UvnylopHEzLJU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786953265;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cPQirfEGQ19iTnitl6rAxMrdTbzzzuO4z7X7cRe7UdQ=;
	b=D4Wl3AEM/ZUkwrhx9xBNeXabtLyeRXJ1WcjtDS4bDajp/FKQhiitHg00KcpmUvQx3FwW0H
	OmwmSfGXwAXmAFBw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786953261; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cPQirfEGQ19iTnitl6rAxMrdTbzzzuO4z7X7cRe7UdQ=;
	b=upfXhtFzcrNgEuLbm3IdqU8LgP1eaTX9+UmzaArKPsvZYrsL7b4zQkervbFA4F/n1EFQL8
	Oa4Xs6VWX8uhurWrSiY7wVvIhV373m5zo0He3uM4TlTmFWVcP4oR7dqleZ1VChVb0n5Zt5
	AaAQrLbOIZngY1MFC5pGb6XAGG9HL5M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786953261;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cPQirfEGQ19iTnitl6rAxMrdTbzzzuO4z7X7cRe7UdQ=;
	b=y302q7InWGjR9VqunS0L20EOwdkGb+nSHN4kRLNNiH63hcMXT8lAoYBYvhY+EPmB64wsge
	jhYwQLiJ4pTSbSCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 19A3279364;
	Mon, 17 Aug 2026 07:54:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id gnLyBC2+gmoDYQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 17 Aug 2026 07:54:21 +0000
Date: Mon, 17 Aug 2026 09:54:20 +0200
Message-ID: <874igtmbbn.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Yashraj Ghule <yashrajghule.221@gmail.com>
Cc: perex@perex.cz,
	tiwai@suse.de,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v2] ALSA: hda/realtek: Fix mute LED for HP Victus 15-fa1xxx (MB 8C3F)
In-Reply-To: <20260816110655.11592-1-yashrajghule.221@gmail.com>
References: <20260815163312.29030-1-yashrajghule.221@gmail.com>
	<20260816110655.11592-1-yashrajghule.221@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -1.80
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	TAGGED_RCPT(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]

On Sun, 16 Aug 2026 13:06:55 +0200,
Yashraj Ghule wrote:
> 
> The HP Victus 15-fa1xxx with motherboard 8C3F is missing the
> existing mute LED quirk for ALC245 codecs.
> 
> Add the 103c:8c3f subsystem ID to the existing
> ALC245_FIXUP_HP_MUTE_LED_COEFBIT quirk.
> 
> Tested on HP Victus 15-fa1xxx (MB 8C3F). The mute LED works
> as intended.
> 
> Signed-off-by: Yashraj Ghule <yashrajghule.221@gmail.com>

Applied now.  Thanks.


Takashi
