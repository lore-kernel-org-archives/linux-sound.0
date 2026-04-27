Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A86B37BE72
	for <linux-sound@vger.kernel.org>; Mon, 27 Apr 2026 11:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777290462; cv=none; b=W6LWYJC9N5CtCIXmx/UEUOYgetF6StVmIb8aa7on1qNPRdkkipDaUbEDxCN9DU/nfoqr1wS8cKH2J7OJMnChx5VH3nyw5fdbspU6Ml7hdC8zgLlhpUTsW+23vjQot/doG0YgYQCiOa7bB2MlNV1wg/Mq0LVthl1AQOrWN3tkiY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777290462; c=relaxed/simple;
	bh=ILqfsGSrrvq1bPfYmO0roegyQiYyyJyVVoJ1Ios4Qxc=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QgAwp/UPxBlofYn06nM4QaUA8NFeHGGToV3s7/V1fjY16t2+7CsREIBuHccqf/kk9aW9Apz0Z4UPC/1gFDgt+aA7S8BpYdamvtevU9kWwSzk9GDlUeo4hybzh2Ff+Y9e/+85z66tlW68pu7UJqbw01fzk1qaGpOn/J2aP14p+Zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=HAIHwrtc; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wZiYHa9C; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=HAIHwrtc; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wZiYHa9C; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HAIHwrtc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wZiYHa9C";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HAIHwrtc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wZiYHa9C"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id BA6CB6A8FE;
	Mon, 27 Apr 2026 11:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777290459; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9EfKnEy8mX6Cg7fw0bgU2lULNSmDWdqhMeFlAfJ3Uew=;
	b=HAIHwrtc+41a/RQ/NsfyBmv3gMdvwcwD8PKh04INq5pYei2iSVOGRx1xw65cxaNZQWdU8o
	mpDVBn0H3JNrxJOVwrlKUXcFRWBHFQ7jwBMMUu4Wt0ZpVr4G+yfnKCc0KCwl5EqWMNXQt7
	ufHRKldU5cINg/Smxl0eHTO5GTgKUyQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777290459;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9EfKnEy8mX6Cg7fw0bgU2lULNSmDWdqhMeFlAfJ3Uew=;
	b=wZiYHa9C0brEnT6pWslBGMEoakUC6m+lA6/nEou/02VK92R5Jx81M9J3R81JjzEFRyMtkr
	XbXfmhdFG1UGO4Aw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777290459; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9EfKnEy8mX6Cg7fw0bgU2lULNSmDWdqhMeFlAfJ3Uew=;
	b=HAIHwrtc+41a/RQ/NsfyBmv3gMdvwcwD8PKh04INq5pYei2iSVOGRx1xw65cxaNZQWdU8o
	mpDVBn0H3JNrxJOVwrlKUXcFRWBHFQ7jwBMMUu4Wt0ZpVr4G+yfnKCc0KCwl5EqWMNXQt7
	ufHRKldU5cINg/Smxl0eHTO5GTgKUyQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777290459;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9EfKnEy8mX6Cg7fw0bgU2lULNSmDWdqhMeFlAfJ3Uew=;
	b=wZiYHa9C0brEnT6pWslBGMEoakUC6m+lA6/nEou/02VK92R5Jx81M9J3R81JjzEFRyMtkr
	XbXfmhdFG1UGO4Aw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8F170593B0;
	Mon, 27 Apr 2026 11:47:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id YYCqIdtM72ngbQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 27 Apr 2026 11:47:39 +0000
Date: Mon, 27 Apr 2026 13:47:39 +0200
Message-ID: <87qzo0zktg.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?C=E1ssio?= Gabriel <cassiogabrielcontato@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: opti9xx: restore snd-miro state after resume
In-Reply-To: <20260413-alsa-miro-pm-v1-1-07cc1ce3463c@gmail.com>
References: <20260413-alsa-miro-pm-v1-1-07cc1ce3463c@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Mon, 13 Apr 2026 21:45:34 +0200,
Cássio Gabriel wrote:
> 
> snd-miro has no PM callbacks, so system resume leaves the OPTi
> master-control registers and the board-specific ACI mixer state
> unrestored.
> 
> Like snd-opti9xx, the driver needs to reprogram the OPTi routing
> registers before bringing the codec back. snd-miro also keeps mixer
> state in the ACI block, so the codec resume callback alone is not
> enough here. Save the ACI mixer state on suspend, reinitialize the
> OPTi and ACI state on resume, replay the saved ACI values, and then
> resume the WSS codec. Hook the PM handlers into both the ISA and PnP
> paths.
> 
> Also initialize miro->card on the ISA path for the existing dev_*()
> logging and keep the cached solo-mode value aligned with the value
> written to hardware.
> 
> PCM20 radio tuner state remains outside this driver's PM scope.
> 
> Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>

Applied to for-next branch.  Thanks.


Takashi
