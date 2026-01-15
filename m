Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA453A1CF3
	for <linux-sound@vger.kernel.org>; Thu, 15 Jan 2026 14:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768485982; cv=none; b=eZoL8tpvgiEEoer1yeE4/tu6gWpUH/bsPG8fNSUxAqS0WE/yKtKZuD+9iG8L62+XTcWD/mGuBPyNapWYpJ0ds9JP13le9pBlHtIywGx0Ob6kZUyzLcI5pYAVQyMtq/mFKHJkDPtvb0jCeITvIl/4qY7mLG7fEx8Xr7Rv++7wvc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768485982; c=relaxed/simple;
	bh=Sz1JVLetJgbXP7hYuetJkD/JIm6SjOvtMNuKGxwWyJU=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=j34reN3JtApY0pw+de/rFFLBG+eMiSAKKSL59OMA/MoWe3DmEcAwpO0iKXlHzk8Ct3UMXN0Pg6K4sDGEzLSYWGWeCt5Ao2eUpOCFvSLrwkYEPi/IMjA7tB9MXbUXvZIIicA3/0sf0mCs/09K+SBYCBpmH+yyaaRB71EdODLgA8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ESNmL/UN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=IZxksgOl; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ESNmL/UN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=IZxksgOl; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ESNmL/UN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="IZxksgOl";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ESNmL/UN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="IZxksgOl"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E7C9D3368D;
	Thu, 15 Jan 2026 14:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1768485978; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=w4hgFWxLdmhX1dWuRM3yAz1BB/oaa3MAPoAUTPBFzsE=;
	b=ESNmL/UNhOIW0F2Wwt/jzHpHCDYUzL9ebtN6Yg7IGP5EHQbtKDDu4vD6J+RjadAXYmQFxw
	Ip5+EkH6w+ZJrF15s8vVAfS5ZmFTJ81pecNHVmNUcqH5Wz4lgLRVOx3YX8PrXFjgMlLxHr
	kVjmgtAR8YgklhGqQzU/vibgJp+DZAc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1768485978;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=w4hgFWxLdmhX1dWuRM3yAz1BB/oaa3MAPoAUTPBFzsE=;
	b=IZxksgOlqHwBY89O7cSvBarTNEYijZSGWiG4rmWtAM2jSRRTZHYySGy2uN6a4nfUiBUftU
	s92DG18W4Ir392Dg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1768485978; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=w4hgFWxLdmhX1dWuRM3yAz1BB/oaa3MAPoAUTPBFzsE=;
	b=ESNmL/UNhOIW0F2Wwt/jzHpHCDYUzL9ebtN6Yg7IGP5EHQbtKDDu4vD6J+RjadAXYmQFxw
	Ip5+EkH6w+ZJrF15s8vVAfS5ZmFTJ81pecNHVmNUcqH5Wz4lgLRVOx3YX8PrXFjgMlLxHr
	kVjmgtAR8YgklhGqQzU/vibgJp+DZAc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1768485978;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=w4hgFWxLdmhX1dWuRM3yAz1BB/oaa3MAPoAUTPBFzsE=;
	b=IZxksgOlqHwBY89O7cSvBarTNEYijZSGWiG4rmWtAM2jSRRTZHYySGy2uN6a4nfUiBUftU
	s92DG18W4Ir392Dg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C42503EA63;
	Thu, 15 Jan 2026 14:06:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id OF61Llr0aGk5UQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 15 Jan 2026 14:06:18 +0000
Date: Thu, 15 Jan 2026 15:06:18 +0100
Message-ID: <871pjr3r8l.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v6.19-rc5
In-Reply-To: <7e292ad75850560429f37325a0656aae@kernel.org>
References: <7e292ad75850560429f37325a0656aae@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,alsa-project.org];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_DN_SOME(0.00)[]
X-Spam-Level: 
X-Spam-Flag: NO

On Thu, 15 Jan 2026 14:31:21 +0100,
Mark Brown wrote:
> 
> The following changes since commit 0f61b1860cc3f52aef9036d7235ed1f017632193:
> 
>   Linux 6.19-rc5 (2026-01-11 17:03:14 -1000)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.19-rc5
> 
> for you to fetch changes up to be5a39e7994ec9f003c8569b670c794a4e5d1551:
> 
>   ASoC: rt5640: Fix duplicate clock properties in DT binding (2026-01-15 11:21:44 +0000)
> 
> ----------------------------------------------------------------
> ASoC: Fixes for v6.19
> 
> A moderately large collection of fixes since I missed a week, plus a few
> new device IDs and quirks.  It's all fairly minor, including a bunch of
> work on the device tree bindings fixes which have no runtime effect.
> 
> There's one SoundWire change here exporting a symbol which was required
> for a fix to the ASoC SoundWire code.

Pulled now.  Thanks.


Takashi
