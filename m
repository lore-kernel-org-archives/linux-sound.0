Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 732882566EA
	for <linux-sound@vger.kernel.org>; Wed,  9 Apr 2025 13:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744203819; cv=none; b=RrSwZoO6SLqPu9ZkwaitClefJ0XUCy3jRWplst4Hu9EgzioSKeDpH47/gYJ8f8Jc+2Z8DIzgKmQ0eKLe0PCF9RWe3nVHYkq6QLZzpP0E/GSRgW5y5H26QIYryyCg1d8X4YAMPaTiqz2O/5N7zXT8w2qdMxcTAz8Fiuci52hd9co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744203819; c=relaxed/simple;
	bh=dxvNXxLCMG1EYU/8RyX90iaxECFYJ+Zv7qBpEBfqlzw=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HGOg07Hb/RPyMkERQiYdqBfJCpA0OaVfmOeVca3KGHbZxXjvmVvJMO1KnxynhMdXZ2y9eHWrfjNwaFsiRQUHsw8crblw4ZpdifS9x5eltifNlXxROPX5Z8A/2Z89n0jg3tmNgVM+jgo/JMVMKfmzOZF86yJhmcgscJcZFII6fgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=HOvFLNl2; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=NLVIlKRZ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=HOvFLNl2; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=NLVIlKRZ; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HOvFLNl2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="NLVIlKRZ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HOvFLNl2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="NLVIlKRZ"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 673A721172;
	Wed,  9 Apr 2025 13:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744203815; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=R6RLOpaSXhx8ugWtyt2xdGoSlzCCi0e0X6L+dmYrK50=;
	b=HOvFLNl2SYOTrErOyRvzSTMsNl3diqS1hK9B9QnFEjrkKWmA05ek+safbvUaZ6LW4G4XuQ
	xNNju6fbmydON5Nix5PFMXjxiKsvwavHtwc/2/Ol8ESVllg78XPRzvI9zOBjcCujkfR47u
	UAmwMiO992yp47RlyhnMlU7R8MdXRkw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744203815;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=R6RLOpaSXhx8ugWtyt2xdGoSlzCCi0e0X6L+dmYrK50=;
	b=NLVIlKRZ6IQWs/WIgkrrfVP2SI+gsGxvt4xWJ9r4OwZjoZqyLub45mDn8AHS1NHxfeigpz
	I/Y9A5O3gnti/6AQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=HOvFLNl2;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=NLVIlKRZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744203815; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=R6RLOpaSXhx8ugWtyt2xdGoSlzCCi0e0X6L+dmYrK50=;
	b=HOvFLNl2SYOTrErOyRvzSTMsNl3diqS1hK9B9QnFEjrkKWmA05ek+safbvUaZ6LW4G4XuQ
	xNNju6fbmydON5Nix5PFMXjxiKsvwavHtwc/2/Ol8ESVllg78XPRzvI9zOBjcCujkfR47u
	UAmwMiO992yp47RlyhnMlU7R8MdXRkw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744203815;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=R6RLOpaSXhx8ugWtyt2xdGoSlzCCi0e0X6L+dmYrK50=;
	b=NLVIlKRZ6IQWs/WIgkrrfVP2SI+gsGxvt4xWJ9r4OwZjoZqyLub45mDn8AHS1NHxfeigpz
	I/Y9A5O3gnti/6AQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3FF1713691;
	Wed,  9 Apr 2025 13:03:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Iu5kDidw9mfqNwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 09 Apr 2025 13:03:35 +0000
Date: Wed, 09 Apr 2025 15:03:34 +0200
Message-ID: <87ecy1zduh.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Kailang <kailang@realtek.com>
Cc: " (alsa-devel@alsa-project.org)" <alsa-devel@alsa-project.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Subject: Re: Enable Headset Mic for ASUS platform
In-Reply-To: <0fe3421a6850461fb0b7012cb28ef71d@realtek.com>
References: <0fe3421a6850461fb0b7012cb28ef71d@realtek.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 673A721172
X-Spam-Score: -3.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On Wed, 09 Apr 2025 09:20:03 +0200,
Kailang wrote:
> 
> Hi Takashi,
> 
> Attach patch was fixed headset Mic issue for Asus platform.
> Many Thanks.
> 
> Kailang.

Thanks, applied now with Fixes tags to 7ab61d0a9a35 and c86dd79a7c33.


Takashi
