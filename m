Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE431C01
	for <linux-sound@vger.kernel.org>; Thu,  4 Jun 2026 08:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780560813; cv=none; b=e9pvSWLYf8yft7oEAfuvrquDEwCXuo5BxBCWHTj6oL5KpoMn8cMGqIxT0CsZUEekkUY9sMwBSkFv1EYxIWGCnL0Q/MCOxo0yi6La1PIYvyH46F057MwrjB0TMLH4ia/QCbNZBQojJQN0t9Bxf625+Doxx6KN2/XQrg+S7e3f4M0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780560813; c=relaxed/simple;
	bh=rEhoK5PDJ+j4k6vCaqMZnT9scBWSJo2FQW4jTZ9jPNk=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tFflAMPDXQSDDDf/PW7brUsIoWVGCr6nFYgFaWE55D2nf44R/jfe51TeeJue3o+GDossORjdyuuMDeVwBvaYSm3pP6OEcAPmJnW71WYtHcLe1mM6zmqAUGRMKwBNVg/DUgIMk8ybFoBQYL+biyDhGolIiycwg8mmabcrK0h55Yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=XlIH/aPb; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=RsTb6P78; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=XlIH/aPb; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=RsTb6P78; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="XlIH/aPb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="RsTb6P78";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="XlIH/aPb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="RsTb6P78"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0FFF36AC06;
	Thu,  4 Jun 2026 08:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1780560811; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/LVE3JhYszbSFU0hVBw1baAkBPrjyhBH/2uiGWuxNJ8=;
	b=XlIH/aPb2U+/oaLVH9Ez0cFwRumJhFHkSPmAe/lYd81BVFt36fmpGWz9bWeSv0lzkrb/KC
	hv60WvO5YZvdC2trf4PUUYKKODHO1L+01m4Eb9Jg/2JdHlNkxxKNO0lKbd1SRvP9okXzNB
	K/pOTo3gSYsICASfPecwYSQN/ICAFJg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1780560811;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/LVE3JhYszbSFU0hVBw1baAkBPrjyhBH/2uiGWuxNJ8=;
	b=RsTb6P78bRE98rZ6L3tSN2HtrFrE7t4N1/sEhjNgWEVq36iAuP2pk6vVD/PMoPEs4xP5yb
	vuizTgiuuMJ8LHAg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1780560811; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/LVE3JhYszbSFU0hVBw1baAkBPrjyhBH/2uiGWuxNJ8=;
	b=XlIH/aPb2U+/oaLVH9Ez0cFwRumJhFHkSPmAe/lYd81BVFt36fmpGWz9bWeSv0lzkrb/KC
	hv60WvO5YZvdC2trf4PUUYKKODHO1L+01m4Eb9Jg/2JdHlNkxxKNO0lKbd1SRvP9okXzNB
	K/pOTo3gSYsICASfPecwYSQN/ICAFJg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1780560811;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/LVE3JhYszbSFU0hVBw1baAkBPrjyhBH/2uiGWuxNJ8=;
	b=RsTb6P78bRE98rZ6L3tSN2HtrFrE7t4N1/sEhjNgWEVq36iAuP2pk6vVD/PMoPEs4xP5yb
	vuizTgiuuMJ8LHAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DD2A3779A8;
	Thu,  4 Jun 2026 08:13:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id LE/SNKozIWrbfQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 04 Jun 2026 08:13:30 +0000
Date: Thu, 04 Jun 2026 10:13:30 +0200
Message-ID: <87ecimwwnp.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Evelyn Ali <evelynali99@gmail.com>
Cc: linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.com>
Subject: Re: [v2] ALSA: hda/realtek: ALC882: Fixup for Clevo P775TM1
In-Reply-To: <20260602214122.78020-1-evelynali99@gmail.com>
References: <20260602214122.78020-1-evelynali99@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.993];
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
	RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Level: 

On Tue, 02 Jun 2026 23:41:22 +0200,
Evelyn Ali wrote:
> 
> Clevo P775TM1 laptops come with an ESS Sabre HiFi DAC. Setting
> 0x1b pin VREF to 80% enables said DAC output.
> 
> Signed-off-by: Evelyn Ali <evelynali99@gmail.com>
> ---
> Notes: Since 0x1b seems only to enable the external headphone amp,
> the non-VREF bit preservation of v1 seemed extraneous.
> 
> Changes in v2:
> 	- Move fixup from HDA_FIXUP_ACT_INIT to HDA_FIXUP_ACT_PRE_PROBE.
> 	- Drop pin-target read/modify/write logic.

Applied now to for-next branch.  Thanks.


Takashi
