Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D993E3DAF
	for <linux-sound@vger.kernel.org>; Thu,  9 Jul 2026 09:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783589469; cv=none; b=rQLbYa6nf7bQdy2oR2Rhw51njRLMK7fN0481JMjUTofFKOGYThDb9TZ8iGBuMceefuzucbJ8tuhahDf1RS3v5eq58h/OiTMegq2L03kqqC9tl4/BrgPi4AsPadfyuYyXg6MBRx8azq2BgE8GSJRsm6vtjjfQZeTSecavOiyrzpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783589469; c=relaxed/simple;
	bh=thStAH1j6Phi6ODpK4VYT/bxGHL9XLuNOrI8rkbO+II=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Lcc3EQBqE83+NoBbJAabw4kgJksPf/k8/bQrdGuPp/ImIgJGmnLIbYPtXXBfaF7Jk5n0tjUpI+neTYjbDg2O9/m5H8tQIc9EgiUvISVmhJfmeFrfluodcl6eAGdRMnB9qmCeCLwGcZYTjCXQZL4pUUFVdsU+2nkVkamaofRn4tI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=zPqVlCdN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=MM87S/Ae; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=zPqVlCdN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=MM87S/Ae; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zPqVlCdN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MM87S/Ae";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zPqVlCdN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MM87S/Ae"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 478DD75DE5;
	Thu,  9 Jul 2026 09:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783589466; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wSWVQx/lZ8NFhEbP2MSamqQAMZMEwHUklQxdpoFacV4=;
	b=zPqVlCdNQDxWUX/0dFmuge3gk9Qj0QT8cUnjiw+lwHk4IppRqSnj4EXxoH1v8N9YQy8vqJ
	ATxaK7a4h2ok0gsNeorZ12Amo6JvW+418d7B/xLrv6keizYBt/zFlRymmGTEh0Jt6e9IpE
	M5jrstwecEHcK0t0rJ7UPicTaM5Yfnk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783589466;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wSWVQx/lZ8NFhEbP2MSamqQAMZMEwHUklQxdpoFacV4=;
	b=MM87S/AeKUKum+684aYWiM+FerfMzPyV69PJdiUhangSpITieoY412hyVteqOxTh60yXkf
	0C/xCbx3WeC6heAQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=zPqVlCdN;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="MM87S/Ae"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783589466; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wSWVQx/lZ8NFhEbP2MSamqQAMZMEwHUklQxdpoFacV4=;
	b=zPqVlCdNQDxWUX/0dFmuge3gk9Qj0QT8cUnjiw+lwHk4IppRqSnj4EXxoH1v8N9YQy8vqJ
	ATxaK7a4h2ok0gsNeorZ12Amo6JvW+418d7B/xLrv6keizYBt/zFlRymmGTEh0Jt6e9IpE
	M5jrstwecEHcK0t0rJ7UPicTaM5Yfnk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783589466;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wSWVQx/lZ8NFhEbP2MSamqQAMZMEwHUklQxdpoFacV4=;
	b=MM87S/AeKUKum+684aYWiM+FerfMzPyV69PJdiUhangSpITieoY412hyVteqOxTh60yXkf
	0C/xCbx3WeC6heAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 050FD779AA;
	Thu,  9 Jul 2026 09:31:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id dX+WO1lqT2qnQgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 09 Jul 2026 09:31:05 +0000
Date: Thu, 09 Jul 2026 11:31:05 +0200
Message-ID: <87zf0033xi.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Callum Wong <mail@callumwong.com>
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	sbinding@opensource.cirrus.com,
	patches@opensource.cirrus.com,
	rf@opensource.cirrus.com,
	david.rhodes@cirrus.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] ALSA: hda: fix HP OmniBook 7 Laptop 14-fr0xxx speaker volume and mute LEDs
In-Reply-To: <0108019f32ad9dfb-ac2d3ace-aed9-401b-97d5-9d43f5b7e2db-000000@ap-southeast-2.amazonses.com>
References: <0108019f32ad9dfb-ac2d3ace-aed9-401b-97d5-9d43f5b7e2db-000000@ap-southeast-2.amazonses.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 478DD75DE5
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org

On Sun, 05 Jul 2026 16:27:46 +0200,
Callum Wong wrote:
> 
> The HP OmniBook 7 Laptop 14-fr0xxx (SSID 103c:8e3b) has a Realtek ALC245
> codec and two CS35L41 amplifiers. The speakers work, but the CS35L41
> amplifiers are not configured, so they play at a lower volume. The F6
> speaker-mute and F9 mic-mute keyboard LEDs also don't work.
> 
> Patch 1 supplies the CS35L41 _DSD configuration so the amplifiers probe
> and drive the speakers at full volume. Patch 2 switches the existing
> 8e3b quirk to a fixup that additionally enables the two mute LEDs.
> 
> Both patches were tested on the laptop.
> 
> Callum Wong (2):
>   ALSA: hda: cs35l41: Support HP OmniBook 7 Laptop 14-fr0xxx
>   ALSA: hda/realtek: Enable mute LEDs on HP OmniBook 7 Laptop 14-fr0xxx

Although the code changes look OK, I'd like to hear the confirmation
from Cirrus people before merging.


thanks,

Takashi
