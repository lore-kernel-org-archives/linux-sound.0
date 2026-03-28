Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F3FF175A60
	for <linux-sound@vger.kernel.org>; Sat, 28 Mar 2026 09:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774691964; cv=none; b=WzKC7cJCzDS3IkoXKr7PW5TkBN2H179dOwI4RlEQscXuPbFkgrMNfvUcYEbeF8ZkGR8BSh13d855iai3NMQRWsfQUDQcH2eeBnNx5QRgEjR0a9boN2ANclmFJaSXahyRE+wDfMXOO1KKi/jgbpRJz1pP6oSWsMeeGhLkWYjK5gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774691964; c=relaxed/simple;
	bh=3C3vOE/tPqQdLPl63NuoPkNxsPIiIr4aFR5hcjqF0Zs=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DCx96Tzqhov/S7e4zifBKW1N70MaOJJLlphBakw9lcMDKZLE433a/kbYMdihOUC/wuKTH7QbW/k12/03b9lcex8HIW8zCcch/HECJfaam+05/MdZDYBIyE1iJ5jLSFaQxx5cBqcQp5uhiwGFlnj41csTr3d97OtUTTWhZ8xbPPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=G9DybMo2; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=bbj5Soaw; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=G9DybMo2; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=bbj5Soaw; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="G9DybMo2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bbj5Soaw";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="G9DybMo2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bbj5Soaw"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id AB0A94D38E;
	Sat, 28 Mar 2026 09:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774691960; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=psPgWy0m6US1igrbZNWgajDb20gaXCM3nAHUCHbRRek=;
	b=G9DybMo2pmGNof4hc9Q7ntCIxjFQmsp4xmftwy5MSAvxbGuqzTeiLhjtUgLDTSaLBgRrdS
	vxV3AwfuttBa72/RY66ECPIOR+hg8ZF+DGAgNVbBJy5K58+Sc5PZGUiaGduONe5VkN5huh
	m/M7yh/c3p2G+8QXSfTy5KNekd6If/k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774691960;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=psPgWy0m6US1igrbZNWgajDb20gaXCM3nAHUCHbRRek=;
	b=bbj5Soawl1Z3OTot+dhgjC7LG5ngTh57p//9hveCuE/PDg60YLni8XlStgs23TWbzz94ZO
	NZ7yMlVBsV1vMbDA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774691960; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=psPgWy0m6US1igrbZNWgajDb20gaXCM3nAHUCHbRRek=;
	b=G9DybMo2pmGNof4hc9Q7ntCIxjFQmsp4xmftwy5MSAvxbGuqzTeiLhjtUgLDTSaLBgRrdS
	vxV3AwfuttBa72/RY66ECPIOR+hg8ZF+DGAgNVbBJy5K58+Sc5PZGUiaGduONe5VkN5huh
	m/M7yh/c3p2G+8QXSfTy5KNekd6If/k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774691960;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=psPgWy0m6US1igrbZNWgajDb20gaXCM3nAHUCHbRRek=;
	b=bbj5Soawl1Z3OTot+dhgjC7LG5ngTh57p//9hveCuE/PDg60YLni8XlStgs23TWbzz94ZO
	NZ7yMlVBsV1vMbDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5E7534A0A3;
	Sat, 28 Mar 2026 09:59:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id RLGSFHimx2kMSwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 28 Mar 2026 09:59:20 +0000
Date: Sat, 28 Mar 2026 10:59:19 +0100
Message-ID: <87341kw9zc.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?C=E1ssio?= Gabriel <cassiogabrielcontato@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Omair Mohammed Abdullah <omair.m.abdullah@intel.com>,
	Mark Brown <broonie@opensource.wolfsonmicro.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: core: Validate compress device numbers without dynamic minors
In-Reply-To: <20260325-alsa-compress-static-minors-v1-1-0628573bee1c@gmail.com>
References: <20260325-alsa-compress-static-minors-v1-1-0628573bee1c@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[gmail.com];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO

On Wed, 25 Mar 2026 06:24:04 +0100,
Cássio Gabriel wrote:
> 
> Without CONFIG_SND_DYNAMIC_MINORS, ALSA reserves only two fixed minors
> for compress devices on each card: comprD0 and comprD1.
> 
> snd_find_free_minor() currently computes the compress minor as
> type + dev without validating dev first, so device numbers greater than
> 1 spill into the HWDEP minor range instead of failing registration.
> 
> ASoC passes rtd->id to snd_compress_new(), so this can happen on real
> non-dynamic-minor builds.
> 
> Add a dedicated fixed-minor check for SNDRV_DEVICE_TYPE_COMPRESS in
> snd_find_free_minor() and reject out-of-range device numbers with
> -EINVAL before constructing the minor.
> 
> Also remove the stale TODO in compress_offload.c that still claims
> multiple compress nodes are missing.
> 
> Fixes: 3eafc959b32f ("ALSA: core: add support for compressed devices")
> Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>

Applied to for-next branch now.  Thanks.


Takashi
