Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8054F37E2E9
	for <linux-sound@vger.kernel.org>; Wed,  1 Apr 2026 07:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775029448; cv=none; b=F6J1P0H2kj9dKQjUiWJi2vz1cwJRvckzq7jmN/XL5wQiDlZGGPC6r0YIjy82CXswdYxV+GpytBSjwouugMlJd9s474ih4QlraDcCIHCV/mCqxiLRibctWxPkxE2Hl9M8BiXNYlpMCZ7gSZ5yhH9s+F8b3v2yuWCQof0SL/v4cYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775029448; c=relaxed/simple;
	bh=PAtBrnPGmA/F6UD0jexhzOtEkO1Nb0RZzL5yExtqwsk=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RrKZ+7expGCMRmlH823r1tJF+ttrBnErzUJkZ+vSUt6Jr9zLOtscgdVh4s0IMqtnYUk092ec5dhS3AAtFMoXn7j7in0GdUXR1t9NMCHGnBVKjtH/ereYc0VKq2qe19CPHpnZJYdGx67CHON3ZlOn6TnpfVHTFTOfMFYEPMnvmQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=yDrwGhiZ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=A3JeUNIk; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=yDrwGhiZ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=A3JeUNIk; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="yDrwGhiZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="A3JeUNIk";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="yDrwGhiZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="A3JeUNIk"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id AEA8E4D2B5;
	Wed,  1 Apr 2026 07:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775029445; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=14UQeb4g1oTBZN0KEN8eUoOjrUs/hrjZXKQT7Zd7yZc=;
	b=yDrwGhiZYvw2cY6jXGYK/bwDxeGty0T+7XD3wHo1TlAxQ50VA05DXHY6z/FNE6C5cFwSbx
	kGWgARVKn4RGD8GaAb1BM/X2wlfEsvpLx1DxL0msBEhcIVdkl3poBYbWNmxNG2GDTqeqZz
	LvMfJjGmZO1y4buZKgOKTPVQE3iOCOg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775029445;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=14UQeb4g1oTBZN0KEN8eUoOjrUs/hrjZXKQT7Zd7yZc=;
	b=A3JeUNIkide0qK00l0cvaw3BLacCS4Fg53dGWGydV1gdOErlRzIxMI3BiihlJJddKRQhCo
	q1BcZxFErtY4koCg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775029445; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=14UQeb4g1oTBZN0KEN8eUoOjrUs/hrjZXKQT7Zd7yZc=;
	b=yDrwGhiZYvw2cY6jXGYK/bwDxeGty0T+7XD3wHo1TlAxQ50VA05DXHY6z/FNE6C5cFwSbx
	kGWgARVKn4RGD8GaAb1BM/X2wlfEsvpLx1DxL0msBEhcIVdkl3poBYbWNmxNG2GDTqeqZz
	LvMfJjGmZO1y4buZKgOKTPVQE3iOCOg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775029445;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=14UQeb4g1oTBZN0KEN8eUoOjrUs/hrjZXKQT7Zd7yZc=;
	b=A3JeUNIkide0qK00l0cvaw3BLacCS4Fg53dGWGydV1gdOErlRzIxMI3BiihlJJddKRQhCo
	q1BcZxFErtY4koCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8EC1D4A0B0;
	Wed,  1 Apr 2026 07:44:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 35eVIcXMzGnYVwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 01 Apr 2026 07:44:05 +0000
Date: Wed, 01 Apr 2026 09:44:05 +0200
Message-ID: <87y0j7qg56.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "Geoffrey D. Bennett" <g@b4.vu>
Cc: Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: Exclude Scarlett 2i2 1st Gen (8016) from SKIP_IFACE_SETUP
In-Reply-To: <acytr8aEUba4VXmZ@m.b4.vu>
References: <acytr8aEUba4VXmZ@m.b4.vu>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
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
	RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Wed, 01 Apr 2026 07:31:27 +0200,
Geoffrey D. Bennett wrote:
> 
> Same issue as the other 1st Gen Scarletts: QUIRK_FLAG_SKIP_IFACE_SETUP
> causes distorted audio on this revision of the Scarlett 2i2 1st Gen
> (1235:8016).
> 
> Fixes: 38c322068a26 ("ALSA: usb-audio: Add QUIRK_FLAG_SKIP_IFACE_SETUP")
> Reported-by: lukas-reineke [https://github.com/geoffreybennett/linux-fcp/issues/54]
> Signed-off-by: Geoffrey D. Bennett <g@b4.vu>

Thanks, applied now.


Takashi
