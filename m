Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9BD8361650
	for <linux-sound@vger.kernel.org>; Wed,  8 Apr 2026 08:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775638337; cv=none; b=jE8mlCUeg4vxPbhd8RZEfN4eIQ9Umu2NGo0+jPWVDXAfjk+vBdjX7kCPCX7zDFYc+6W6Iq4GHaPnK0y3Ao6/GTbwxjQyCL+XgxbIqk6Az7m7lrmEE90Gy+84dwAsPD8ktoN7gILgBrctqpaHUC0K9yVsY7Ng3oZb+H8Lkou/w+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775638337; c=relaxed/simple;
	bh=1ECACd3AwoGqTHSpy6t1YLc5VaWJhwRb/JsxGUjyd28=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WgF6IJ/7+fmX/Emaqe5cBqEFPWpsUgEfNpBGYg57m8W4WAZUE3xssl4asGj4hBKcTULLNx5tQEywWSHcamCj/kU42o+eD6WrQUVx3GH6xmdOHqzZuN5XNfAf+04ZO5DyjvkgGjnYe5Y+rQg4x0P8y6kuj37a8tQdskZu1aLN1O8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=oFrjwwA7; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=stfUOfFU; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=FrCnHEAm; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=xy/CRlhM; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="oFrjwwA7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="stfUOfFU";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FrCnHEAm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xy/CRlhM"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 42E194E8F2;
	Wed,  8 Apr 2026 08:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775638331; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=syImbox63TyfBj/l1Ye3zsIucZk9oCPn1DmdfD7HjgQ=;
	b=oFrjwwA7UmoVCVgZcsmZrdt7hp2nJ64Z0az6eNlZYVPrXZ+nQDYJRbuyfAb9mqnm9USz9t
	zNTDxIPtQgbd8sTATPNAPVdlHSKZUJL6QigrqLxKqQXEHTR4CHJv4Li+24t7Uby551+pIn
	XJsjnM2M5AYmqJpZP8SCONu0MF20e8w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775638331;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=syImbox63TyfBj/l1Ye3zsIucZk9oCPn1DmdfD7HjgQ=;
	b=stfUOfFU9XHE1lU4IOn6fOIXuKf8diqUf8NCY5GRvg0Ni77wRQMQEdwQ5DMTvznR7dWheE
	/f7IroeD9kykDWCw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=FrCnHEAm;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="xy/CRlhM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775638330; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=syImbox63TyfBj/l1Ye3zsIucZk9oCPn1DmdfD7HjgQ=;
	b=FrCnHEAmEZgPurOKvm2FU4O2OGNUNLnRF3Uj9bR5c/yDiE0s6LonbyqhV8gWYeODCDaNUG
	lPYDOAf9BBJ0YWwl+VNyTTr3BAXiNhK5n6PJLWHQkAuixhdRpYT9B2d8/ddhgMi3LJM6UD
	BQaYZpyYhNF2LtMONF0NWKclZDqAvK4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775638330;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=syImbox63TyfBj/l1Ye3zsIucZk9oCPn1DmdfD7HjgQ=;
	b=xy/CRlhM24MaeIwn3ZY8AtnzXulWA+2mMrauQRpfcO3Deptb0iB1GCdQwVe53QKpaY2y/i
	l+vXGPc07DE92NAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1469B4A0B3;
	Wed,  8 Apr 2026 08:52:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id H6VkAzoX1mkrDgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 08 Apr 2026 08:52:10 +0000
Date: Wed, 08 Apr 2026 10:52:09 +0200
Message-ID: <87se95ltqe.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: songxiebing <songxiebing@kylinos.cn>
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2] ALSA: usb-audio: qcom: Fix incorrect type in enable_audio_stream
In-Reply-To: <20260408083311.774173-1-songxiebing@kylinos.cn>
References: <20260408054304.497277-1-songxiebing@kylinos.cn>
	<20260408083311.774173-1-songxiebing@kylinos.cn>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,intel.com:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 42E194E8F2

On Wed, 08 Apr 2026 10:33:11 +0200,
songxiebing wrote:
> 
> Fix sparse warning:
> sound/usb/qcom/qc_audio_offload.c:943:27: sparse: incorrect type in argument 2
> expected unsigned int val but got snd_pcm_format_t.
> 
> Explicitly cast pcm_format to unsigned int for snd_mask_leave().
> 
> Fixes: 326bbc348298 ("ALSA: usb-audio: qcom: Introduce QC USB SND offloading support")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202604062109.Oxi8JjWW-lkp@intel.com/
> Signed-off-by: songxiebing <songxiebing@kylinos.cn>
> ---
> v2:
>  - Add __force prefix for cast

Applied to for-next branch.  Thanks.


Takashi
