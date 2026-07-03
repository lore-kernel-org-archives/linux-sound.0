Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 313C63B7B8E
	for <linux-sound@vger.kernel.org>; Fri,  3 Jul 2026 11:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783076829; cv=none; b=UWqjt1ckEdOmHtumCHfqoSMvABaRhuvK5LmVqnYQ3NDnDDZ/ooy/6QG5eUUTzHHd/I/LW3rBADKd5DU0QJBXO2KZEY54I/a7mPwOyjelVZSO+mGzS0HRmbVk6GJCAjq8gS9OggFGj8Kz4tr6H4kPwoPUBXgk2bxv9Jn5T/mGpiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783076829; c=relaxed/simple;
	bh=BibMIw6YENy+dc0ZylKbWdyuLeg0VbBlgAWzmG7BMvE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V3m8LvbHenuIO3dldK7HO9jIha9TGKxfyrsM4vnhyQrjkSLCv0vyr3WVX2n20+exei3fA6+WAzNp/3A/N8bwc/HREWcLyfeZVN80ZaF0X87PcJ1jnANOtdaSJXkvDZ6sS7nP7TSHC67gr6JUTN45JSxPSChBpScU39zQ3ibcGiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Pr+ZD8Cv; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+zvoy3dU; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ZHAMRSJJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=PnrtSvKT; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Pr+ZD8Cv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+zvoy3dU";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZHAMRSJJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PnrtSvKT"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2BBCE7489B;
	Fri,  3 Jul 2026 11:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783076826; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ryIHvSEpTKCb3g2iUFQsG/E+ZMuLQizxMfEHrajaD44=;
	b=Pr+ZD8CvdZUWumTUlFLI+KlfiQqmFoQ8mMA9cXyrdrsw8wK6d4Sm+o6HrknyvXO1F2dwqj
	/3zx5WKl9V7mRMvJ4RZBTDcVLUR44VG2OYLlQYzDaAwLsSuJZ+AC7iFZLWWjWgErHLK5BH
	LBpEwztwZFPhiB6Ed5LAE3mNN7Uc/Lg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783076826;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ryIHvSEpTKCb3g2iUFQsG/E+ZMuLQizxMfEHrajaD44=;
	b=+zvoy3dUq5+0NgI2Cl6/fysspozzDjkCYgYY/n0PExatSgXCMA5axCu0HOsoz7iWdTJwYb
	X4OB4Ds1PtOWlCCA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783076825; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ryIHvSEpTKCb3g2iUFQsG/E+ZMuLQizxMfEHrajaD44=;
	b=ZHAMRSJJy0IjtbcppyS3YQSYn7100vzEymhnruybOj46ptJT+cX9Q0pAeiNxS3Tyt91nTM
	KgSPkz6jJojMbi/klX4qc2GqMj+nUVIagVGd87DrN487a5LRVzdtCgrrlGo++LxumZA5WA
	Wp98qIy+38+Y5MEiFW/eC4Uvhj0uLzA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783076825;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ryIHvSEpTKCb3g2iUFQsG/E+ZMuLQizxMfEHrajaD44=;
	b=PnrtSvKT93IY8h10budNwa78PBSq19/OlJdKN/Qrr8aqL1kPOb9KLVtgNGlhPxDq1migFu
	1yTJPXE8/tCVyZAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EB226779AA;
	Fri,  3 Jul 2026 11:07:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id k6eIN9iXR2rBUwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 03 Jul 2026 11:07:04 +0000
Date: Fri, 03 Jul 2026 13:07:04 +0200
Message-ID: <87v7aw72nb.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Federico Lombardo <lombardo.federico.lf@gmail.com>
Cc: tiwai@suse.com,
	perex@perex.cz,
	nfraprado@collabora.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Enable mute LED quirk for HP Laptop  15-dw0xxx
In-Reply-To: <20260702204347.187524-1-lombardo.federico.lf@gmail.com>
References: <20260702204347.187524-1-lombardo.federico.lf@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Level: 
X-Spam-Score: -1.80

On Thu, 02 Jul 2026 22:43:47 +0200,
Federico Lombardo wrote:
> 
> HP Laptop 15-dw0xxx with subsystem ID 103c:85f0 needs the
> ALC236_FIXUP_HP_MUTE_LED_COEFBIT2 quirk to correctly disable and
> enable the Audio Mute LED.
> 
> Add the missing quirk entry.
> 
> Signed-off-by: Federico Lombardo <lombardo.federico.lf@gmail.com>

Applied now.  Thanks.


Takashi
