Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9904B37F731
	for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 10:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782728858; cv=none; b=ElsuYe454VbwgnTtf3pUcaK03PSUVI40nTy6+TBjwuK6bRd8vME8/8rD614S8Sy02DumQx3XV6JIeyxh9m/QJ1wxr6nCZwnt1nv+MZ/2qFZyF2p9lbHwMo71Z30mNTl+42decr4D9c5SoemM59m/5ZMxb/TDXFFuciLPsoR/thU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782728858; c=relaxed/simple;
	bh=2VLmZjcZ2fyNWEc+y1qLnEgjF1+y1V+Aa70rv4lCfyA=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uMn4QY4E/8iKcySroJb4yi/NpV7eHRvwfTrBzEQdeNWcPUhFrh7S8QsMbbnehsJPdfbGsBg+HZTTe+OHMjCXsVZBhTKd+KdMvW7ulq3clr0jSJ0nLPKiHC25pmX9PEs++z6lKWwbNJHqy7AZ6ZXNDTR0fQT7GMt/UKl8zG78+gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=k2Yx7pRO; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=BDPAYitC; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=k2Yx7pRO; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=BDPAYitC; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="k2Yx7pRO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BDPAYitC";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="k2Yx7pRO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BDPAYitC"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D8AA97300B;
	Mon, 29 Jun 2026 10:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1782728855; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Nr8TMhILiCpQNbXeKv1uj6eCQzZQqhphKOyK4aPbx1g=;
	b=k2Yx7pROC5jxQlO1q80dR8hkI137IjjAQK9x1DKfpdyt47U/HX09Qbo6g/uGN4zruTDuai
	yFdlPVD17Oh+/DEMmRWM93cF8aH7G7druNr9Dg4G65+cJWR7pLgPETvq+dqPbRpuogqAjU
	hYOwyrcCg1laXw0dqQXkety/vhvVzZU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1782728855;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Nr8TMhILiCpQNbXeKv1uj6eCQzZQqhphKOyK4aPbx1g=;
	b=BDPAYitCsYlDaqygkZj5qU+oubpEUTHGza70u2Hko8U1rR0+HeegNq9c0MU7ApqsmaoMBE
	dz2X5jOvu2o8viDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1782728855; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Nr8TMhILiCpQNbXeKv1uj6eCQzZQqhphKOyK4aPbx1g=;
	b=k2Yx7pROC5jxQlO1q80dR8hkI137IjjAQK9x1DKfpdyt47U/HX09Qbo6g/uGN4zruTDuai
	yFdlPVD17Oh+/DEMmRWM93cF8aH7G7druNr9Dg4G65+cJWR7pLgPETvq+dqPbRpuogqAjU
	hYOwyrcCg1laXw0dqQXkety/vhvVzZU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1782728855;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Nr8TMhILiCpQNbXeKv1uj6eCQzZQqhphKOyK4aPbx1g=;
	b=BDPAYitCsYlDaqygkZj5qU+oubpEUTHGza70u2Hko8U1rR0+HeegNq9c0MU7ApqsmaoMBE
	dz2X5jOvu2o8viDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 95628779A8;
	Mon, 29 Jun 2026 10:27:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id MDxQI5dIQmoUHAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 29 Jun 2026 10:27:35 +0000
Date: Mon, 29 Jun 2026 12:27:35 +0200
Message-ID: <8733y5r694.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Fu Hao <fuhao@open-hieco.net>
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	tingyin.duan@gmail.com
Subject: Re: [PATCH v3 7/7] ALSA: hda: Fix single byte writing issue for Hygon family 18h model 5h
In-Reply-To: <dd4a0b6743751dfb495a371c135ac052191e99f6.1781523812.git.fuhao@open-hieco.net>
References: <cover.1781523812.git.fuhao@open-hieco.net>
	<dd4a0b6743751dfb495a371c135ac052191e99f6.1781523812.git.fuhao@open-hieco.net>
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
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_DN_SOME(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,vger.kernel.org,gmail.com];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,open-hieco.net:email]
X-Spam-Level: 
X-Spam-Score: -1.80

On Mon, 15 Jun 2026 14:23:25 +0200,
Fu Hao wrote:
> 
> On Hygon family 18h model 5h controller, some registers such as
> GCTL, SD_CTL and SD_CTL_3B should be accessed in dword, or the
> writing will fail.
> 
> Signed-off-by: Fu Hao <fuhao@open-hieco.net>

Applied to for-next branch now.


thanks,

Takashi
