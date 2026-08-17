Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30AB03B71B1
	for <linux-sound@vger.kernel.org>; Mon, 17 Aug 2026 07:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786953238; cv=none; b=JM04mHCpHUnY7Kdm2M2xaou4QFRfjlm/T8WAKceYeGJMUOsxJeyyn8eZIkLa6tGK6xlSCTU/W6lWmi0V05yxCHr6lnGGe9zpbol3tuMSLB2dNHzYq2a52BgN1i0vBkeYQVTzmOorBvRbd6hlV7Mx4RlCCowIjBmx81iS+QhSNSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786953238; c=relaxed/simple;
	bh=CFNxdCq3cUzDzyuxBl+S0TNUzK8Xbp0qp4I5mkx/fW8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IKb64QsV8UsQIJd3yGH6cCRPi/DrIuiCHtANvDj+jghbvEA391iw0MpjZA/hLHJUeighppSMNy6lDDm9K6E1Smz6AMO5ZBM9PbyvFUydzm2nkfFTu6S7jdUoWDYBW2ub0sZsqIE2qtkdtd2cgE1VQ9001OqB8q8T97nt/Vl0b2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0o+07OPb; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=H3DtvVQj; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=EOH+JToP; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=yNvwjsuz; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0o+07OPb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="H3DtvVQj";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EOH+JToP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="yNvwjsuz"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id DEA4183EBA;
	Mon, 17 Aug 2026 07:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786953231; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=r6BVzCk2Ep+Ua2Zn/BMxfB+y84buyf820M9z5wCgrhQ=;
	b=0o+07OPbfjEvkLViLBv9tdcqhwUBIkR0mbKLEbyRqMfjALaBXmFgVjS6kNv1BK8I7VjR/Y
	uUZzRIOP/juG7tcbpen8nZN0/lOvghIrkzQayxMRl2S0/FlXkCismUlDb0Kt02a193G5JO
	AgsI5FLy3lMmhMduZLPazb0cDLdMzRo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786953231;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=r6BVzCk2Ep+Ua2Zn/BMxfB+y84buyf820M9z5wCgrhQ=;
	b=H3DtvVQj+q4DkKV3RPRe9vx5nHhEKmyh0N+ULTgWV3Tjr32jD3XwcUSAWIeZ8TNE7nS2+q
	1DRIcsYgNf5EhiDA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786953226; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=r6BVzCk2Ep+Ua2Zn/BMxfB+y84buyf820M9z5wCgrhQ=;
	b=EOH+JToPFYajkGy2gh1vMPzkzvztqbCFDzqDh/t8PuUtK11fBxNSYtGdcueOJmO9v89SK1
	OEzAqb7Ffs6+f34BCKja0j5h/JIQEaqeX+ig6oU84DumJ6rHjPjLqkqz6fLoPXLR2u2PUX
	D1Tgs9Re4gKinALCX/2PdZyOJJQXs3w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786953226;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=r6BVzCk2Ep+Ua2Zn/BMxfB+y84buyf820M9z5wCgrhQ=;
	b=yNvwjsuzQMuN7mmuYdEaDV3rUEtBqeKMR0nr2raoK2cGiu+v/m0PDIU7BibDJTWR4smQ9N
	AELBd7db5b1fc9Ag==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B5BB379364;
	Mon, 17 Aug 2026 07:53:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id OVHuKgq+gmrpYAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 17 Aug 2026 07:53:46 +0000
Date: Mon, 17 Aug 2026 09:53:46 +0200
Message-ID: <875x19mbcl.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Giulio Gualtierotti <ggualtierotti.dev@mailbox.org>
Cc: linux-sound@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Subject: Re: [PATCH] ALSA: hda/realtek: Add micmute LED quirk for Acer Aspire A515-57
In-Reply-To: <20260816094223.36617-1-ggualtierotti.dev@mailbox.org>
References: <20260816094223.36617-1-ggualtierotti.dev@mailbox.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]

On Sun, 16 Aug 2026 11:42:23 +0200,
Giulio Gualtierotti wrote:
> 
> The Acer Aspire A515-57 with subsystem ID 1025:1616 and Realtek
> ALC256 uses GPIO2 (0x04) for the microphone mute LED. Without a
> quirk, the GPIO mask and direction are not configured and the LED
> does not follow the microphone mute state.
> 
> Reuse ALC256_FIXUP_ACER_SFG16_MICMUTE_LED, which configures GPIO2
> as the microphone mute LED.
> 
> Tested on an Acer Aspire A515-57 with ALC256 (10ec:0256,
> subsystem 1025:1616). GPIO mask and direction are 0x04 and GPIO
> data switches between 0x00 and 0x04; the LED device is registered
> and follows the microphone mute state.
> 
> Signed-off-by: Giulio Gualtierotti <ggualtierotti.dev@mailbox.org>

Applied now.  Thanks.


Takashi
