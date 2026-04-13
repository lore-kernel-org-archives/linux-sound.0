Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 918F0340273
	for <linux-sound@vger.kernel.org>; Mon, 13 Apr 2026 18:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776103711; cv=none; b=RNJEoKweV+u8BHrzeVUknPBm6MP8Q0PiIo3ZrNmO8fZD0KLb4NVq6wY4ztMLxgR4NSizrfpENnTzqYpPxC/vWlV3eRw50NX22ipdxfoRGMgInXROBtbJ8GTPNsRPYJGg4d/HmGW+1mD6v4avn0xy7HEgCXwN3AHLSq48T0efZC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776103711; c=relaxed/simple;
	bh=tO7rnijo1SIh2d7Fwapc57aBZjWOBHp/+naAeHF7pnE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cih/IP5nCEQUmn2D/CjlnMI5ww2tRUqtTwHY+ETkm7yQu9DzvYIX5iN1icf6llncFgjLTCx1KpNkqbUOpJwBvVgSnpZVkbXFnNbu/cSTza1NeM009l5rJYAxBosr5LR3dqPqsnhoS2Ngn/45YEEM5H+9Gp0NeugNF3bnaqrAFeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=HBtZq+f9; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=MABd5NbV; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Bw/tfiS/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Kpm7rgAI; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HBtZq+f9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MABd5NbV";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Bw/tfiS/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Kpm7rgAI"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E87395BE60;
	Mon, 13 Apr 2026 18:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776103709; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hzb3MnSogp8djxy+2/PL2Oa/2x31XK6dS5mOSAwaeko=;
	b=HBtZq+f9x2gXgBBIfRXOoNh2hcbwK5aY+B2uCzVLrgZ+0cv/plB5OgUq1WZYYokKaE/RuG
	NRoReQ07xL2GdBAQIGLNPakRN9kn+DY9Jmn2dm8Uvb1mSGXhVQLFnaIPYrBniaS+n+NI83
	WaRyMgijzlehmJEPHskPhGQ09ZLmqdE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776103709;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hzb3MnSogp8djxy+2/PL2Oa/2x31XK6dS5mOSAwaeko=;
	b=MABd5NbVt9sT1eWr81Hvf8Bp4/ihG6c+U2YLvx/unT0JTglIgrlzyFQAEWLh8SYCcpUGEp
	C1hJSzcC6WLPL1Dw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776103708; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hzb3MnSogp8djxy+2/PL2Oa/2x31XK6dS5mOSAwaeko=;
	b=Bw/tfiS/3WDAlL0atlmWEp6HP6hne2D9GhfGWgvrC+yny0OtrUHSny0EJldhOYkTcHmifM
	LVWG+6jb2rQR1IQOGIIZdendh7bT3veYMq027l27G/z7v6vxEroOkucLxQHbSC6H4kbrT+
	YVSbSdeTW8zZmmNbuWKFRpzUqbaRJQY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776103708;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hzb3MnSogp8djxy+2/PL2Oa/2x31XK6dS5mOSAwaeko=;
	b=Kpm7rgAIMi3PuvxZ0c2S+/bBuw5TEPBi5OzXVOQaodk70py/E3nxvkco8w38yYELxinSf2
	9QiI3j8oVsfzJVCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C3C0C4AFFD;
	Mon, 13 Apr 2026 18:08:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 2N2aLhwx3WlLVwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 13 Apr 2026 18:08:28 +0000
Date: Mon, 13 Apr 2026 20:08:28 +0200
Message-ID: <87eckiu40z.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC updates for v7.1
In-Reply-To: <d2e0da35ba2c101c63b915e4bcbc707b@kernel.org>
References: <d2e0da35ba2c101c63b915e4bcbc707b@kernel.org>
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
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,alsa-project.org];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Mon, 13 Apr 2026 18:08:06 +0200,
Mark Brown wrote:
> 
> The following changes since commit 6b6f7263d626886a96fce6352f94dfab7a24c339:
> 
>   ASoC: amd: acp: update DMI quirk and add ACP DMIC for Lenovo platforms (2026-04-08 17:04:47 +0100)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-v7.1
> 
> for you to fetch changes up to 115e7d764dad66a10e150bd4b3ba3bbb95b04d85:
> 
>   ASoC: dt-bindings: rockchip: convert rk3399-gru-sound to DT Schema (2026-04-12 17:24:42 +0100)
> 
> ----------------------------------------------------------------
> ASoC: Updates for v7.1
> 
> There's one new core feature here but mostly this has been a fairly
> quiet release, we've got a few new drivers and one core feature that's
> likely to be relatively rarely used but the bulk of the work this time
> around has been on quality.
> 
>  - Support for bus keepers, this will be used by the Apple device
>    support.
>  - Enhancements to the SDCA support, incuding retaskable jacks.
>  - Unwinding of the pcm_new()/pcm_free() cleanups from Morimoto-san.
>  - Test improvements for the Cirrus Logic drivers.
>  - Large sets of fixes for the NXP, nVidia and Qualcomm drivers.
>  - Support for AMD RPL DMICs, Cirrus Logic CS42L43 and CS47L47, nVidia
>    machines with CPCAP and WM8962.

Thanks, pulled.


Takashi
