Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B29352F9E
	for <linux-sound@vger.kernel.org>; Mon, 13 May 2024 10:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715597349; cv=none; b=Hq6KvBy0Qrn7p+c5Z98WUqLmET2FkwrMaoCR+OwsKjTT9POoUeCGbfIsV+wYZoXK3GaYZcy07qbonz11QkSA1W23zaQ63FSgMnn/SZ6NFcD9y8tlFhZieZvevbEkH1en9UGjEXsln1D5xOhCJODOt4ePnpE0fg6rWm2NFQ4rAyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715597349; c=relaxed/simple;
	bh=ArdBfAV6CgILSl6tt8i6nruTXgHcYVpNc89v4Lydmpk=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QIowyGvL7kPNKmrwmbwnwLwQF7cuBjpHGC6RRA5kehGZAV06fVjibTjTS7NBH9h1hn0Rm7qcDgT2rTJ/Z/+jFzLPBeWgU5HRH1FRNAMuzC32yonjMReju7lxW/AF0NfKqPPA2Bs0kCAaE9v4H0Tyxy7ENfyD5fHX+U5KNynXmlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=cFExLWlP; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Lcs6G0vm; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=cFExLWlP; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Lcs6G0vm; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cFExLWlP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Lcs6G0vm";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cFExLWlP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Lcs6G0vm"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 55BD8343F4;
	Mon, 13 May 2024 10:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715597340; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=m9t/POZMpbtR0TG6mysI+MKGacuZosegXg3wr2034aE=;
	b=cFExLWlPpipTXwDvHKqi1FMXicypw2sqVioLCOh+l/lYICXW9DiCzctsxRGFBuYguMsQrA
	B3Q0Q1hm1hwFYYMtHsvVC+I6bWusCYmsVwoN8393GH3lBNoIL+7aQN+qw/Hl7UwKdlYbwo
	HnFOKFLVtTMhPBI7EwVSamXgwWRMvmg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715597340;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=m9t/POZMpbtR0TG6mysI+MKGacuZosegXg3wr2034aE=;
	b=Lcs6G0vmawDxxZpcB8fBDBnDMeCv74wqotqYh3xXyFaHJ3auWl7wOVsen1QJdvPHAtVJBI
	j9gChcNgkvg7e/Ag==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=cFExLWlP;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Lcs6G0vm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715597340; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=m9t/POZMpbtR0TG6mysI+MKGacuZosegXg3wr2034aE=;
	b=cFExLWlPpipTXwDvHKqi1FMXicypw2sqVioLCOh+l/lYICXW9DiCzctsxRGFBuYguMsQrA
	B3Q0Q1hm1hwFYYMtHsvVC+I6bWusCYmsVwoN8393GH3lBNoIL+7aQN+qw/Hl7UwKdlYbwo
	HnFOKFLVtTMhPBI7EwVSamXgwWRMvmg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715597340;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=m9t/POZMpbtR0TG6mysI+MKGacuZosegXg3wr2034aE=;
	b=Lcs6G0vmawDxxZpcB8fBDBnDMeCv74wqotqYh3xXyFaHJ3auWl7wOVsen1QJdvPHAtVJBI
	j9gChcNgkvg7e/Ag==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 36A2F13A52;
	Mon, 13 May 2024 10:49:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id eyomDBzwQWYFWwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 13 May 2024 10:49:00 +0000
Date: Mon, 13 May 2024 12:49:15 +0200
Message-ID: <878r0egf6c.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] ASoC: SOF: amd: Fix build error with built-in config
In-Reply-To: <20240510073656.23491-1-tiwai@suse.de>
References: <20240510073656.23491-1-tiwai@suse.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 55BD8343F4
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Score: -3.51

On Fri, 10 May 2024 09:36:54 +0200,
Takashi Iwai wrote:
> 
> Makefile in AMD ACP driver has a line substitution with "=" instead of
> "+="; this overrides the preexisting item, hence it broke the build
> after the recent change to replace *-objs with *-y.
> 
> This patch corrects the line.
> 
> Fixes: 1a74b21ce59f ("ASoC: SOF: amd: Add Probe functionality support for amd platforms.")
> Fixes: 9c2f5b6eb8b7 ("ASoC: SOF: Use *-y instead of *-objs in Makefile")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Closes: https://lore.kernel.org/r/20240510170305.03b67d9f@canb.auug.org.au
> Signed-off-by: Takashi Iwai <tiwai@suse.de>

This seems overlooked, and since the latest ASoC code reached to my
tree, I applied this fix now on my tree.


Takashi

> ---
>  sound/soc/sof/amd/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/sof/amd/Makefile b/sound/soc/sof/amd/Makefile
> index 380a9769c321..d1424c09172d 100644
> --- a/sound/soc/sof/amd/Makefile
> +++ b/sound/soc/sof/amd/Makefile
> @@ -5,7 +5,7 @@
>  # Copyright(c) 2021, 2023 Advanced Micro Devices, Inc. All rights reserved.
>  
>  snd-sof-amd-acp-y := acp.o acp-loader.o acp-ipc.o acp-pcm.o acp-stream.o acp-trace.o acp-common.o
> -snd-sof-amd-acp-$(CONFIG_SND_SOC_SOF_ACP_PROBES) = acp-probes.o
> +snd-sof-amd-acp-$(CONFIG_SND_SOC_SOF_ACP_PROBES) += acp-probes.o
>  snd-sof-amd-renoir-y := pci-rn.o renoir.o
>  snd-sof-amd-rembrandt-y := pci-rmb.o rembrandt.o
>  snd-sof-amd-vangogh-y := pci-vangogh.o vangogh.o
> -- 
> 2.43.0
> 
