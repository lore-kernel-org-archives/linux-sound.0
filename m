Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F8353101B1
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 13:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760449645; cv=none; b=O1VBlL4Xm16HfMeGzBceg0IBqbYA6PnOXj+Vxbl+Cw4gZXTbO1arLNXK/tL8UfSJehbvAvokcisdSEaJM661ra9xbJXqw2M3KotGOZ8JHCJumWhbiESHr5Er76mpo5puzrNZ4RL+to0rgPa/mItUOBhdltkhIMdtiaDHjCxdRx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760449645; c=relaxed/simple;
	bh=CjyWPembvdVgDue4t7S/L9jn0e3Gdmw6d4TFBswEdh0=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MjCZiO0kpIinjSeoGfhz3ZYUhgWBfI70eFYgdmufVt4mYBY0u1XA2qYx6MMLitgf2Mm/ldGO2n/i1mceLLah7QCr8JC6+N1vMOmPUj18/MbyZoktUUfPO5cdmpV2I98L8MpGnj9EbXHIDHglsX+Uyeyb5UuG3rbM6Qx560gGBFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=psKMWx3+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=W99JeMne; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=psKMWx3+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=W99JeMne; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="psKMWx3+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="W99JeMne";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="psKMWx3+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="W99JeMne"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7481521D3F;
	Tue, 14 Oct 2025 13:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1760449641; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FxEjkvyCXONNXcb7Z0yvTyuXk2SZ3ml4MdHIBFzuPNk=;
	b=psKMWx3+tyEX2b2cIML7521EJGFI/TK7CoCFeQqSZC23gC4ZT/Rx3IrdKudkirD8MKitJf
	cm6zmixhsj2tW+891rCFDJCd0TvrSKyZphYcNKB0Q9M3Es/+AVV2zcvslMxfiqXuQRoRvB
	eLvKBZ2Z9r3YsnQFp1u+Mu2PV3rcnQg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1760449641;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FxEjkvyCXONNXcb7Z0yvTyuXk2SZ3ml4MdHIBFzuPNk=;
	b=W99JeMneo769WAjsj/fWtkrXbt4MN8KDB9Og+XyOGKY+ElXmruPN13QfaxfTWJk8n7tX1c
	KOggwGrjecAHMBAQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1760449641; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FxEjkvyCXONNXcb7Z0yvTyuXk2SZ3ml4MdHIBFzuPNk=;
	b=psKMWx3+tyEX2b2cIML7521EJGFI/TK7CoCFeQqSZC23gC4ZT/Rx3IrdKudkirD8MKitJf
	cm6zmixhsj2tW+891rCFDJCd0TvrSKyZphYcNKB0Q9M3Es/+AVV2zcvslMxfiqXuQRoRvB
	eLvKBZ2Z9r3YsnQFp1u+Mu2PV3rcnQg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1760449641;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FxEjkvyCXONNXcb7Z0yvTyuXk2SZ3ml4MdHIBFzuPNk=;
	b=W99JeMneo769WAjsj/fWtkrXbt4MN8KDB9Og+XyOGKY+ElXmruPN13QfaxfTWJk8n7tX1c
	KOggwGrjecAHMBAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5EDDD139B0;
	Tue, 14 Oct 2025 13:47:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 7hSoFmlU7mhNUgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 14 Oct 2025 13:47:21 +0000
Date: Tue, 14 Oct 2025 15:47:21 +0200
Message-ID: <87ikgh7fyu.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-sound@vger.kernel.org,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Takashi Iwai <tiwai@suse.de>,
	Clemens Ladisch <clemens@ladisch.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH] sound: amdtp-stream: fix enum kernel-doc warnings
In-Reply-To: <20251014030552.760648-1-rdunlap@infradead.org>
References: <20251014030552.760648-1-rdunlap@infradead.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -3.30

On Tue, 14 Oct 2025 05:05:52 +0200,
Randy Dunlap wrote:
> 
> Fix spelling of CIP_NO_HEADER to prevent a kernel-doc warning.
> 
> Warning: amdtp-stream.h:57 Enum value 'CIP_NO_HEADER' not described in enum 'cip_flags'
> Warning: amdtp-stream.h:57 Excess enum value '%CIP_NO_HEADERS' description in 'cip_flags'
> 
> Fixes: 3b196c394dd9f ("ALSA: firewire-lib: add no-header packet processing")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>

Applied now (with the correction of subject prefix).


thanks,

Takashi
