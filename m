Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C48C2AE90
	for <linux-sound@vger.kernel.org>; Mon,  4 Nov 2024 13:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730726519; cv=none; b=IN9fxUjbN7bQbHMcq/Bz30U1xbNER9S2ItSCTR233UfpbLbhPnYddh97y+jqLHvibA4hVLWSHMM60Tn4LFw/vho/I5pQTimC16YeFWG6G9mHsuL6P1vhYMM9dKta534feCxrlDFU2YmvFkHt010zPJdwP6OQvwpoQIYDz/Hjd7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730726519; c=relaxed/simple;
	bh=LKiqSdZeGPFAW+waKnjT9t62u/ap80/kX8rJhea+708=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lFhk20mcVRcH/V5/mGmw+2a40hz2DTlGx0miGym6XiReUqfS5vIOOQ+w2ig/as1/SJNF5AlKrT6tXTBNBYk+R61cKScO8n9nfYaufcviJ3MOK17vp5JHZHgAkUY322Kyx0grBXDK+DcQJnzoEJhJkPSCU6GlwPfpq0Z+feP68s8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vUOInzsQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=c1AmS5Vv; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vUOInzsQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=c1AmS5Vv; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vUOInzsQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="c1AmS5Vv";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vUOInzsQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="c1AmS5Vv"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9CBC61F7C1;
	Mon,  4 Nov 2024 13:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1730726515; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Tmux75fdenFNH4UR2MCyKP4pJN/VZJekL/G66vrSwpA=;
	b=vUOInzsQjJ9/a5UmQt1D1lciGCO3oUP8pcJU7UbjLAR31j8Cf3gDi8kds8BrkD/ZJqRlJw
	RWDO1kSrx69WnwBhA1T1MRAxNfniUwSmdvyhC39kCZTgq/szIrYZXKO6hJqwEGxJYDYqMi
	usXOIJhpNKyhRb1+udrvAcRE43KSxW4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1730726515;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Tmux75fdenFNH4UR2MCyKP4pJN/VZJekL/G66vrSwpA=;
	b=c1AmS5Vvcub8mywuCWPNB20BSzsBxstEGIt0E+E4ht4QhPAI3ZqXIT1tj09n+CAxPsktOF
	hKittiVxbjdZPaBg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1730726515; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Tmux75fdenFNH4UR2MCyKP4pJN/VZJekL/G66vrSwpA=;
	b=vUOInzsQjJ9/a5UmQt1D1lciGCO3oUP8pcJU7UbjLAR31j8Cf3gDi8kds8BrkD/ZJqRlJw
	RWDO1kSrx69WnwBhA1T1MRAxNfniUwSmdvyhC39kCZTgq/szIrYZXKO6hJqwEGxJYDYqMi
	usXOIJhpNKyhRb1+udrvAcRE43KSxW4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1730726515;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Tmux75fdenFNH4UR2MCyKP4pJN/VZJekL/G66vrSwpA=;
	b=c1AmS5Vvcub8mywuCWPNB20BSzsBxstEGIt0E+E4ht4QhPAI3ZqXIT1tj09n+CAxPsktOF
	hKittiVxbjdZPaBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6A83E1373E;
	Mon,  4 Nov 2024 13:21:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id NSa5GHPKKGc1aQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 04 Nov 2024 13:21:55 +0000
Date: Mon, 04 Nov 2024 14:23:01 +0100
Message-ID: <87ses7b0ay.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda: intel: Don't free interrupt when suspending
In-Reply-To: <1b7e109b-eb69-4542-8022-4ac8f9116474@gmail.com>
References: <1b7e109b-eb69-4542-8022-4ac8f9116474@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
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
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_TLS_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Level: 

On Thu, 31 Oct 2024 20:32:52 +0100,
Heiner Kallweit wrote:
> 
> There's no need to free/re-request the interrupt on system suspend.
> PCI core takes care, using functions like pci_restore_msi_state().
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Applied to for-next branch now.  Thanks.


Takashi
