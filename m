Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBFA02E401;
	Mon, 10 Aug 2026 11:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786361958; cv=none; b=alO7cpEzvC2Sta4XkIfHLW6SwnJfZeiGrGGQRqzWtRaiUNr1vMq7A6umNq6q23i8TLbDCqj14Izyi9BsHxyJ2HUQUiqThZDgcx4AibPUH6v53lc2kX9INnoUNYpGzwuYCS45ug+rt3JXVdmf/sHg7/0anKPEIBnZ3FFVwaH9Wxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786361958; c=relaxed/simple;
	bh=bWPagbq0U5WZEcUOBGZ51WZoP+/PO6XFHwD8oDXRK/s=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QnideDUaTCB5YcfWYoTGnagXjO/s5gTC59J+XUz09v9e6vkL1RD2bvTchZy+TSj4PWQNlZjra2SPo0t+Ze6yd3RW+jMtrM5ODUP4qp41y9FyQoNFniTfqNyU442Y4a49r1EtJqmys2gGriGVgbPv9A4tSgeqwv536Odda0sptfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=HXrLW+AI; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=M9BdtWrj; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=R+XE/iNi; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=AUHTRBoh; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HXrLW+AI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="M9BdtWrj";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="R+XE/iNi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="AUHTRBoh"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A708A8090A;
	Mon, 10 Aug 2026 11:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786361950; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=52LUwH8i2LgnvE8Hbi2zvBKFWUosSnQmL5W035fZdLM=;
	b=HXrLW+AIiGSOjAOnrsrveoEWaKnY288WDuthRx28HO09MUhmYJ3LApbUoA8TXnGy6TqFvH
	mkuxHZgzjqjSOn//BKjq6SAGrOilTsbVYwrplzBmFeRqraIzBvujl7UThQ4NZ2j1H71fhC
	fz1GeP0hH7HlwswqUgHZ7RbLGViIMTs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786361950;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=52LUwH8i2LgnvE8Hbi2zvBKFWUosSnQmL5W035fZdLM=;
	b=M9BdtWrjHTjALZ7KKYjtWhGEGyhwaY32nI2vyiCipMxFDRIEnQM2fkVq0TmFVjwWUA6D8i
	5yF+zVB8HAjLVXBw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="R+XE/iNi";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=AUHTRBoh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786361946; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=52LUwH8i2LgnvE8Hbi2zvBKFWUosSnQmL5W035fZdLM=;
	b=R+XE/iNizFXUjvBMmof/PsGNsM252iZUhmylGOlfYtYKIzTvh8yzXvbE20yHG1DWQCNtFg
	NgVy/GyoB/5HgphLvqcl1F7tFeL+VR1XE1JIeV/CAhwz65lRUvBLR579vt+6M5pLfUHY96
	JxAhU8c8MO6pjgTrDRdkZK73Xxg4I/o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786361946;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=52LUwH8i2LgnvE8Hbi2zvBKFWUosSnQmL5W035fZdLM=;
	b=AUHTRBohF+x+/MZIjk4N8RthXU5gg8bIg3E5ZR5mJyVOWIz+gfW9wr8p9zlYqzLpyIvR1e
	/L4lua/hva7DPaAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 712F2779BC;
	Mon, 10 Aug 2026 11:39:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id GHJqGlq4eWoqKgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 10 Aug 2026 11:39:06 +0000
Date: Mon, 10 Aug 2026 13:39:05 +0200
Message-ID: <87wlty8asm.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: usx2y: Stop clearing urb->hcpriv before submission
In-Reply-To: <20260810075728.483c827e.michal.pecio@gmail.com>
References: <20260810075728.483c827e.michal.pecio@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -2.01
X-Spam-Level: 
X-Rspamd-Queue-Id: A708A8090A
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action

On Mon, 10 Aug 2026 07:57:28 +0200,
Michal Pecio wrote:
> 
> This is managed by USB core and drivers aren't expected to touch it.
> 
> It should only be not NULL on a submitted URB, in which case clearing
> defeats the "submitted while active" sanity check in usb_submit_urb()
> and may crash the HCD handling the URB and panic the kernel.
> 
> Signed-off-by: Michal Pecio <michal.pecio@gmail.com>

Applied to for-next branch.  Thanks.


Takashi
