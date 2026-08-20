Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2544C46D2D9;
	Thu, 20 Aug 2026 13:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787233411; cv=none; b=fW1f1z1fuRlD5F10fzaUus/DlOkH451Y7KHQ1prBdmN4BT9nSUWJsIAag287SdLm/tdA3V1ekADbDbrqzSB1A3uNhHRHgvHBM/ommdMw4A+l2+XXysyvilcKgvBIoFz49nsBeJKbVgcabw+p8LTjaOh5Gs9rmitjWCEzzituxDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787233411; c=relaxed/simple;
	bh=kawpVZ+Rl70v1gUebftZS+iyLLei4n7A1IOhXJYp44E=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GB/HtR9FhCV//njDwVDvprHFnuoG+56PdnoUFYFV5K+7WSYSk+PMr5O8/CeKBJFFkscwMgVdlEyvHzSOa387fU2Va2bNNPezBwtiM3SHJJyzr1ybDp4ofTM+UIQ4C7ysrTV55atnQopiWbNUWLHI2F5xCN2aiZWahhjquBaUAy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=oms6/Yxq; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=4VswExsh; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=yqycIzqL; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=FnmpUVQp; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="oms6/Yxq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4VswExsh";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="yqycIzqL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FnmpUVQp"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0A46685079;
	Thu, 20 Aug 2026 13:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1787233401; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fencSGekVUGzLBliOL+9iAtr0oW997hkXbDom61Xl80=;
	b=oms6/YxqHtMbRVVn9hYloLswvndS8+HX0gIf/Hefa9LD6Ka/mt7ZS2mP8Bo3OsUoDCZoUf
	zpiD4+1r2XorXo4ZkoC874jJ0/+so+l/fxK4/WMIK6MqQ7gp7OEhJTW465FbwUbdw8fc3o
	SDqC52/+nVVH0dpLVt4VAMQvc09qQOA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1787233401;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fencSGekVUGzLBliOL+9iAtr0oW997hkXbDom61Xl80=;
	b=4VswExshotTVqv2fmsKGM5xXUOTFUT7+80rkstJEfl/GWFZ9mnsxDRtruXacXRfKT/RX6s
	1nmL18ao0l4YIcBw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1787233397; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fencSGekVUGzLBliOL+9iAtr0oW997hkXbDom61Xl80=;
	b=yqycIzqLJuxIXqiux9TESP3hRowVyooOvVfROGvRjG9HQ7eWzwi4adSPu3d5PQ6C3vvqgX
	Ss2akc6Ad1R01ouKG//vPKI8rZpsvTVJT5dWMLwTkaat9xGC3b4tueBo4DVIOyaYhws6CT
	OHOH7Ude3TaPv+/DaF8Rg549/onbCho=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1787233397;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fencSGekVUGzLBliOL+9iAtr0oW997hkXbDom61Xl80=;
	b=FnmpUVQptVCecxjn8DBejedfvxhFwm5E5DLnwg/c7nlOXT7kUnCPdu6evVSQOlG/6nFZNt
	1jpCMwGeOnKf+wBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CBF7E27A8;
	Thu, 20 Aug 2026 13:43:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id BVGJMHQEh2r2PwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 20 Aug 2026 13:43:16 +0000
Date: Thu, 20 Aug 2026 15:43:16 +0200
Message-ID: <87wltklxfv.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Runyu Xiao <runyu.xiao@seu.edu.cn>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jianhao Xu <jianhao.xu@seu.edu.cn>
Subject: Re: [PATCH] ALSA: mtpav: shut down output timer before card teardown
In-Reply-To: <20260820112749.9195-1-runyu.xiao@seu.edu.cn>
References: <20260820112749.9195-1-runyu.xiao@seu.edu.cn>
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
	NEURAL_HAM_SHORT(-0.20)[-0.995];
	MIME_GOOD(-0.10)[text/plain];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Thu, 20 Aug 2026 13:27:49 +0200,
Runyu Xiao wrote:
> 
> snd_mtpav_output_timer() rearms chip->timer while holding
> chip->spinlock and accesses the card-private mtpav state.
> 
> snd_mtpav_free() currently takes the same lock and calls
> timer_delete() when the timer is active. This only removes a
> pending timer; it does not wait for a callback that is already
> running and does not prevent the callback from rearming the timer.
> 
> A callback running on another CPU can therefore continue after
> snd_mtpav_free() releases the lock and access the card-private
> state while the card is being torn down. It can also rearm the
> timer after timer_delete() has returned.
> 
> Call timer_shutdown_sync() without holding chip->spinlock. This
> waits for any running callback to finish and prevents further
> rearming before the card-private mtpav state is released.
> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Signed-off-by: Runyu Xiao <runyu.xiao@seu.edu.cn>

Thanks, applied now.


Takashi
