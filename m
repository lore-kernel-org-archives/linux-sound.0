Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE4543D7D75
	for <linux-sound@vger.kernel.org>; Fri,  4 Sep 2026 07:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788508296; cv=none; b=n6/sHcfuXEP+Gw7Dnd42eqyoq2cEdC4doqOnubkoHcT1EDbGjoMaFEhOfzYvLzkYQIQOD70IulEsPAa6RhU9tVeSSoOpixcUIr9a4ECW2I+q7WWrFUgM9A/lzZjLlGu+cFsOtZJQns35Bh/pMAQeFIJepSF20e4mVmQwMoQh1rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788508296; c=relaxed/simple;
	bh=OAVTpRalSrlPBdaVwPjSrol5eJPt8K/vleR0Lgp23gQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mnI2cySS98UBWfZpOzRQCmFNKfewIhr+M6k/+yl1QF6fFfdVM3pIUOA4sdmR2k/dXHZpu/5uoBx94CHHXdW2+rh5vDi1fAb8lTrSWSYUOhU6z5MbPlau3/w3xDXXHpIGk6S3elDs47d8cqnRe4NdlnwSHk49rpIKi4x/LldZbhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BDx9fTar; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=atNU9TL6; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=i8MvQQ8R; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=vBrdjdwv; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BDx9fTar";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="atNU9TL6";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="i8MvQQ8R";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vBrdjdwv"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 69C0B1FB06;
	Fri,  4 Sep 2026 07:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788508288; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oYeiMt8ADRTtsQE52NSgdYOFNUr3QbYdNaluuRHdbGc=;
	b=BDx9fTarXGDuF8JbTYq1DRZtzbXz9JtlLj5Xa3uQOswr01lM6SzexeNUXaajuKvpEUJc3f
	mdMHn+0p35AkxCwkcPQGcGTnHrqJo6fCIa8xr3Snx/bT+Uj7xlZ27zrDO0tdgETC1Ckf1y
	jQ81Mz3EG3E0U4cozt2pHSKStq79LW4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788508288;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oYeiMt8ADRTtsQE52NSgdYOFNUr3QbYdNaluuRHdbGc=;
	b=atNU9TL6Fwu/nESNIqYQjPS9IpY1igUqJ3+QkjiqR16OR13vKt1m95qoEk6ma1p+9SelRh
	JapnXYlLefnN2FCw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788508284; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oYeiMt8ADRTtsQE52NSgdYOFNUr3QbYdNaluuRHdbGc=;
	b=i8MvQQ8RL1132Fr87CpfiMcFz2sgJuTc90fX7r49er/+YSChGgitDOF0zccAYrOXHAYl39
	zZcU4E4ZeJl6OOhdF4PY5o6FYrpf5MrtRnm7DkS3K7eFoVcpvZF2/G7LroH3geFN95+TPw
	oE+hhvd0wspZHnXGCNSyf5vnS3zaaoM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788508284;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oYeiMt8ADRTtsQE52NSgdYOFNUr3QbYdNaluuRHdbGc=;
	b=vBrdjdwvuC8csj6Hq8Ie4UCLd2rHG2ie93tiHurdxH9otrjE4W7ryNk/4fMZvzaaMiIfOq
	hBt9vuuksvXctzBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F10F513678;
	Fri,  4 Sep 2026 07:51:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id yqSzN3t4mmpmJgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 04 Sep 2026 07:51:23 +0000
Date: Fri, 04 Sep 2026 09:51:23 +0200
Message-ID: <878q5h78uc.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: vkoul@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	srinivas.kandagatla@oss.qualcomm.com,
	linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	daniel.baluta@nxp.com,
	Vijendar.Mukunda@amd.com
Subject: Re: [PATCH 02/23] ALSA: compress: stop active streams on disconnect
In-Reply-To: <20260904073134.29648-3-peter.ujfalusi@linux.intel.com>
References: <20260904073134.29648-1-peter.ujfalusi@linux.intel.com>
	<20260904073134.29648-3-peter.ujfalusi@linux.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spam-Score: -3.30
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,perex.cz,suse.com,gmail.com,oss.qualcomm.com,vger.kernel.org,linux.intel.com,linux.dev,nxp.com,amd.com];
	RCVD_TLS_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo]

On Fri, 04 Sep 2026 09:31:13 +0200,
Peter Ujfalusi wrote:
> 
> Track open compressed streams per device so disconnect can stop
> active streams and wake waiters before snd_unregister_device().
> 
> This aligns compressed stream teardown with PCM disconnect behavior
> and prevents active userspace streams from running into unregister
> races.
> 
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
> Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>

Reviewed-by: Takashi Iwai <tiwai@suse.de>


thanks,

Takashi
