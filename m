Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5AE41CDFD5
	for <linux-sound@vger.kernel.org>; Fri, 14 Nov 2025 13:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763126371; cv=none; b=XTJjG2M6G2kDu8oYS4AFKXPZv58QuxWR/vx6mfU1piKiprftvyzTbkXkp2V8AdCQ+ELcifOZeA1Dm2LZza+lyuZ2EjJ+7+tVl7KpepA+j3JHaL9FUOapmcQsTfqxBSNvZXgPI4LcDaUlioSHmBoyl/zw/VPKhcbZPq+tlA/yk7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763126371; c=relaxed/simple;
	bh=b1yQ7dIgCPD7rsD7EN8De6jx2kuoltQg7bq+UugDXBQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Kl1iQbQmcb4/Xuh3P8wOhWV0wHqD7WBUOb5QFpqw3AIfIwecAddBEm3wOi4aMrcc4NrMRTGa0dL/nAHBRDm69c4xgmEQvhlgMkg3NYosHwhoyYL9YwVwmEu5MEx0bS+3G4AQYrDtzNhvv52Sjw8xRk4D9KK/+TahPFCdnlS63W0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=my5llB5O; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HpC3pdWo; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=my5llB5O; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HpC3pdWo; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="my5llB5O";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HpC3pdWo";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="my5llB5O";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HpC3pdWo"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1BCF01F790;
	Fri, 14 Nov 2025 13:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1763126362; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZSwJ2dvg6dGLe6M1eMg4muncvxkXPdY/882QKbDQslY=;
	b=my5llB5ORJI2LMBM6vRuwP+jZ0E3H1Gst9r34B+W6u/pK+jDp7iYV2xhZlHsbqxln9f2oE
	n3KzECuahmqjJe4tVlbl8SmSFIsqoxTzbD/fPIahxoGRPBlLfCFAqq/MW6l20QxyqsZG71
	XJaRy2mKfrH51Fd+glLn5gOrw+nADvU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1763126362;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZSwJ2dvg6dGLe6M1eMg4muncvxkXPdY/882QKbDQslY=;
	b=HpC3pdWolplTS9kRbjLVjRWmgJJE90wOdlfZhmBJHDaX4OltU0c9Wa4i0fcZVE9my7CCge
	jrJFyewLP16KzfDQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1763126362; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZSwJ2dvg6dGLe6M1eMg4muncvxkXPdY/882QKbDQslY=;
	b=my5llB5ORJI2LMBM6vRuwP+jZ0E3H1Gst9r34B+W6u/pK+jDp7iYV2xhZlHsbqxln9f2oE
	n3KzECuahmqjJe4tVlbl8SmSFIsqoxTzbD/fPIahxoGRPBlLfCFAqq/MW6l20QxyqsZG71
	XJaRy2mKfrH51Fd+glLn5gOrw+nADvU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1763126362;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZSwJ2dvg6dGLe6M1eMg4muncvxkXPdY/882QKbDQslY=;
	b=HpC3pdWolplTS9kRbjLVjRWmgJJE90wOdlfZhmBJHDaX4OltU0c9Wa4i0fcZVE9my7CCge
	jrJFyewLP16KzfDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EDB453EA61;
	Fri, 14 Nov 2025 13:19:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 9BvDOFksF2kuNgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 14 Nov 2025 13:19:21 +0000
Date: Fri, 14 Nov 2025 14:19:21 +0100
Message-ID: <87pl9kiwfa.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v6.18-rc5
In-Reply-To: <979d5936ff7b727be317ba6d8c3a5e36@kernel.org>
References: <979d5936ff7b727be317ba6d8c3a5e36@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
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
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,alsa-project.org];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Thu, 13 Nov 2025 20:59:09 +0100,
Mark Brown wrote:
> 
> The following changes since commit 6146a0f1dfae5d37442a9ddcba012add260bceb0:
> 
>   Linux 6.18-rc4 (2025-11-02 11:28:02 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.18-rc5
> 
> for you to fetch changes up to 360b3730f8eab6c4467c6cca4cb0e30902174a63:
> 
>   ASoC: rsnd: fix OF node reference leak in rsnd_ssiu_probe() (2025-11-13 00:36:01 +0000)
> 
> ----------------------------------------------------------------
> ASoC: Fixes for v6.18
> 
> A small collection of fixes, all driver specific and none especially
> remarkable unless you have the hardware (many not even then).

Pulled now.  Thanks.


Takashi
