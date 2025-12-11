Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 420892EBB93
	for <linux-sound@vger.kernel.org>; Thu, 11 Dec 2025 08:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765442076; cv=none; b=rihkBFkOaB7CW8Hao95T3WTJUiJeUj0P62wjMs2DesF/17DLcCVKsCiHKb14DW/G1azK0bSguncch0h8JdQgQ2vLWfFUBD7Z9KF1IA0r1RWILl15I/3hkSXsrRexOv0AonHvjOSDPmal35FnOhECdLIxWOq5ihrJy7A5R5XvWpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765442076; c=relaxed/simple;
	bh=iwWmDXoiN0Ap/jP5OdLUtw7mJk8qvjBw6zIJin2J4ms=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oJuRF+4BU6gHhDvj1/CkNYroRf7rNtGPyJrfawc51JVt42v+nIgeULv58blhb5BFZhASiSinxmKILGMDPYviDdIxZzj4rzu3HVMbElmP2tHp86Nxswempn5bhLiM0V+2tfSYIfMoYKjBNFIEU8SX2+q2E/GboM+QnY2qhjLbCTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=PFdhbfb8; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=KHXHpCWJ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=uCOoRNWn; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=cZNz4rQM; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="PFdhbfb8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KHXHpCWJ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="uCOoRNWn";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="cZNz4rQM"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 094175BDD1;
	Thu, 11 Dec 2025 08:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1765442072; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ooz8CDSg1yOxcZI0vaishpRCJBg/fFQnrBJ4aV/NNiw=;
	b=PFdhbfb83eXTBHhMzoluHyY3xkR3BCMl4bAq4Xc8W9tqwOLDnUbWzoxP9hXOB6ikVViBqg
	++Q5lzpa95S7/w4DIUhj9vBgcP/BNJNAR3+oHyEZ9HYACodkfAY+bh9Pv1gbGs4LbuqcIm
	zJoCzDPYwg6VLsp0XQnVIqsRHfXD2N0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765442072;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ooz8CDSg1yOxcZI0vaishpRCJBg/fFQnrBJ4aV/NNiw=;
	b=KHXHpCWJl+MnXSIztZkXaW2swLBGgePg/J7lHPJPiHkDKfvY+zrnDOQak5kmVNsh775VUS
	ijxV78IV/Lx4U1Bw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1765442071; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ooz8CDSg1yOxcZI0vaishpRCJBg/fFQnrBJ4aV/NNiw=;
	b=uCOoRNWn7Hu31l8JaFLNfycbs63d43u5BhoFuwzrMtpenW3l2szAXsWhMqScGwVbR175oS
	ve8afa5bd76nlKMYCVgp3hz0npid4ApGJ6Hca/KMALGJk0fFFOZdx1FcwNxGhHG/ETPP3k
	JaH4dSv3I+h2TjPJmutZt1PfOF2GanQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765442071;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ooz8CDSg1yOxcZI0vaishpRCJBg/fFQnrBJ4aV/NNiw=;
	b=cZNz4rQMqEb+TlHGvBVzSSOOroy57VPCy4zj8dJiwf+1BvS+QLPqwBUnFSz7IPKPfiY0Kq
	sWCAEwHBSMorxZAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D4CA93EA63;
	Thu, 11 Dec 2025 08:34:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Nz+8MhaCOmkvSQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 11 Dec 2025 08:34:30 +0000
Date: Thu, 11 Dec 2025 09:34:30 +0100
Message-ID: <875xadct7t.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v6.19-merge-window
In-Reply-To: <20251211004847.5B15D1ACB974@finisterre.sirena.org.uk>
References: <20251211004847.5B15D1ACB974@finisterre.sirena.org.uk>
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
	NEURAL_HAM_SHORT(-0.20)[-0.992];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -3.30

On Thu, 11 Dec 2025 01:48:41 +0100,
Mark Brown wrote:
> 
> The following changes since commit c5fae31f60a91dbe884ef2789fb3440bb4cddf05:
> 
>   ASoC: fsl_micfil: Set default quality and channel (2025-11-29 00:59:00 +0000)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.19-merge-window
> 
> for you to fetch changes up to f34836a8ddf9216ff919927cddb705022bf30aab:
> 
>   ASoC: amd: acp: update tdm channels for specific DAI (2025-12-10 09:17:53 +0900)
> 
> ----------------------------------------------------------------
> ASoC: Fixes for v6.19
> 
> A small pile of fixes that came in during the merge window, it's all
> fairly standard device specific stuff.

Pulled now.  Thanks.


Takashi
