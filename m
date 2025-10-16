Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 074D230EF9D
	for <linux-sound@vger.kernel.org>; Thu, 16 Oct 2025 09:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760606537; cv=none; b=YFj9qXElL6W/KjIUvpIRLj/I7XPKDN9ncDMa7hJPBgtV4S5ZSI/V/2nVy8JvFCucFzXgvHv55Rs0WhYNdgjYL2+TG8m/Q16lffeyhUZX0dKQe3Fbn/UXqTeuF6rGnkz09Q/UEc/edse2fSuQd6YaoEBIw7GekU3Ehw0GfcUz84Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760606537; c=relaxed/simple;
	bh=PYSypvNTMta3IE6oaRSj3//h0bWsjBxHS7uaxBINOmc=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AuswxwhVO7HyWx20mA1byhZFBUh+OiIX++9mdWy+V5Sot+6vG8t2/C9zuGaOPdpamFY7cjptLkTWxnMZN2b/MhuyXbJgMzERqobshI4pQyIELPJ+FKoHuXHnce+UEKyEmEh+Z2biqOMqKHRotBSE2KdGSdYJPQlsftNo2Zy6+0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Mggvujzf; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ABfk0IBj; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Mggvujzf; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ABfk0IBj; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Mggvujzf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ABfk0IBj";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Mggvujzf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ABfk0IBj"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 205F321DAA;
	Thu, 16 Oct 2025 09:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1760606527; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QS5zBLqTXu+aWJnEfC1Ch9bIMt6xLpulUuHulV8NRIE=;
	b=Mggvujzfm5CN/m6RMI4b8HB069qTDGWubCaZtf0xq6DG8Grq+gNTWjmeQ48W7XeYa3+4U7
	7NprSycK+qUigjkl6/oMDMlR7senIpvRayamAZFze+4ved/EVvvqqJkUQHZvlNoY5Rf1Lw
	PIMdjVOacD4xlAMYYuV2/RDTueFMx1I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1760606527;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QS5zBLqTXu+aWJnEfC1Ch9bIMt6xLpulUuHulV8NRIE=;
	b=ABfk0IBjz/PwVhUN4wVwmlghAEeO7lbxtST//OMexrNGB4rFo+DeSZ79oHSTCO0iHqPqSL
	6pEfEZpDutJ/3yAg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Mggvujzf;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=ABfk0IBj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1760606527; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QS5zBLqTXu+aWJnEfC1Ch9bIMt6xLpulUuHulV8NRIE=;
	b=Mggvujzfm5CN/m6RMI4b8HB069qTDGWubCaZtf0xq6DG8Grq+gNTWjmeQ48W7XeYa3+4U7
	7NprSycK+qUigjkl6/oMDMlR7senIpvRayamAZFze+4ved/EVvvqqJkUQHZvlNoY5Rf1Lw
	PIMdjVOacD4xlAMYYuV2/RDTueFMx1I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1760606527;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QS5zBLqTXu+aWJnEfC1Ch9bIMt6xLpulUuHulV8NRIE=;
	b=ABfk0IBjz/PwVhUN4wVwmlghAEeO7lbxtST//OMexrNGB4rFo+DeSZ79oHSTCO0iHqPqSL
	6pEfEZpDutJ/3yAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DEC3F13B03;
	Thu, 16 Oct 2025 09:22:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id h2B1ND658GjSTAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 16 Oct 2025 09:22:06 +0000
Date: Thu, 16 Oct 2025 11:22:06 +0200
Message-ID: <87frbj8am9.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Pauli Virtanen <pav@iki.fi>
Cc: linux-sound@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: fix vendor quirk for Logitech H390
In-Reply-To: <11bbdceb778c30173d540e198db740127f8306ed.1760562126.git.pav@iki.fi>
References: <11bbdceb778c30173d540e198db740127f8306ed.1760562126.git.pav@iki.fi>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 205F321DAA
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.51

On Wed, 15 Oct 2025 23:11:30 +0200,
Pauli Virtanen wrote:
> 
> Vendor quirk QUIRK_FLAG_CTL_MSG_DELAY_1M was inadvertently missing when
> adding quirk for Logitech H390. Add it back.
> 
> Fixes: 2b929b6eec0c ("ALSA: usb-audio: add mixer_playback_min_mute quirk for Logitech H390")
> Signed-off-by: Pauli Virtanen <pav@iki.fi>
> ---
> 
> Notes:
>     Sorry, I missed that there was a Logitech-wide vendor quirk
>     QUIRK_FLAG_CTL_MSG_DELAY_1M when sending the previous patch.

Applied now.  Thanks.


Takashi
