Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 849BE1DA53
	for <linux-sound@vger.kernel.org>; Mon, 17 Mar 2025 10:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742206395; cv=none; b=oUQjvLp9lQ0KnaDIGeP/+rws49K1Q9SxXjBW+YfWZQMEYyp3aW4UkmKhgYZmhyBZjHGgg4bHGNp7EcLAdZQEbKogTCyIYoC5dqIsiKMZKcuDVlLZcJDDteGPxVCKEnGbCYz/no+OnGQtTt0OGtaj2Gwg9aLdfpCyF4WnRy7qai4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742206395; c=relaxed/simple;
	bh=zR7z/PA0/ns2JIEYGAfGiyWOrz9GXhwNXm8ZM23tf2M=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WHvKpMRwYiTt6vqJm41njVqtiDHIyt/SA+5LKcmafVPra/dHY1gD0H0ryE6Ho0fXiUQgenv/wp77bfhHHeZlJXLUjWkvdaLhvFrj21H8yN3cWUBQlTmbaY+KstGALelGFmIemt7TERFaYnhng13sasG+RlEuTVxfqtN+rJXtLmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=nKUJGdCM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Xxn14Qr/; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=nKUJGdCM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Xxn14Qr/; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="nKUJGdCM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Xxn14Qr/";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="nKUJGdCM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Xxn14Qr/"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id BC1F11F853;
	Mon, 17 Mar 2025 10:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742206391; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Cp80IlDz2xvgXYDL44u4ykTaaymBdY9PD+cTqqO902o=;
	b=nKUJGdCMGp0gtxRvu5sStBV18kSGgBCqr/oN/mwfkGIKrel74qXsuHprdBRAEsA6fgdNsk
	AMweU0htgINeKkPpStlNI6xzY6OKlY21XDYG5ajgXmD/RYRlb12nqZQm9jTM/ITCTleLM7
	JLUTeevf/HMgQ9cl/zfS3Fx4rc49CAA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742206391;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Cp80IlDz2xvgXYDL44u4ykTaaymBdY9PD+cTqqO902o=;
	b=Xxn14Qr/WgO3Ag0mIAOnkb/c5fpoTa/vBT/f4sf/nnZX4psrjol8BSRWSmNtoJepa5jikW
	iyuyk62CedkzQDDw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742206391; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Cp80IlDz2xvgXYDL44u4ykTaaymBdY9PD+cTqqO902o=;
	b=nKUJGdCMGp0gtxRvu5sStBV18kSGgBCqr/oN/mwfkGIKrel74qXsuHprdBRAEsA6fgdNsk
	AMweU0htgINeKkPpStlNI6xzY6OKlY21XDYG5ajgXmD/RYRlb12nqZQm9jTM/ITCTleLM7
	JLUTeevf/HMgQ9cl/zfS3Fx4rc49CAA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742206391;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Cp80IlDz2xvgXYDL44u4ykTaaymBdY9PD+cTqqO902o=;
	b=Xxn14Qr/WgO3Ag0mIAOnkb/c5fpoTa/vBT/f4sf/nnZX4psrjol8BSRWSmNtoJepa5jikW
	iyuyk62CedkzQDDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 967ED132CF;
	Mon, 17 Mar 2025 10:13:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id EhlgI7f112cRHgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 17 Mar 2025 10:13:11 +0000
Date: Mon, 17 Mar 2025 11:13:11 +0100
Message-ID: <87wmco2ceg.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	Mark Brown <broonie@kernel.org>,
	<linux-sound@vger.kernel.org>
Subject: Re: [PATCH v2 62/88] ASoC: intel: catpt: Convert to RUNTIME_PM_OPS() & co
In-Reply-To: <363cb7bf-7ff5-4f14-8de8-4809f7afe891@intel.com>
References: <20250317095603.20073-1-tiwai@suse.de>
	<20250317095603.20073-63-tiwai@suse.de>
	<363cb7bf-7ff5-4f14-8de8-4809f7afe891@intel.com>
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
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Score: -3.30
X-Spam-Flag: NO

On Mon, 17 Mar 2025 11:08:54 +0100,
Cezary Rojewski wrote:
> 
> On 2025-03-17 10:55 AM, Takashi Iwai wrote:
> > Use the newer RUNTIME_PM_OPS() and SYSTEM_SLEEP_PM_OPS() macros
> > instead of SET_RUNTIME_PM_OPS() and SET_SYSTEM_SLEEP_PM_OPS() together
> > with pm_ptr(), which allows us dropping ugly __maybe_unused
> > attributes.
> 
> Off-topic comment:
> While __maybe_unused may not be the prettiest, it is still better
> alternative than #if/ifdef spam all over the code if you ask me.

Yeah, that's why we introduced it in the past.

The downside is it's often more cumbersome to rip it off than the
explicit ifdef.


thanks,

Takashi
