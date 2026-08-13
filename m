Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8772478E5E
	for <linux-sound@vger.kernel.org>; Thu, 13 Aug 2026 14:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786631730; cv=none; b=t1wkTmSsC0jUK+Fk/7MZAmFeBh2lCEeiSOIE1qt4DvCSoEu0fmD/h3VG9fsjLxAI8nt7nMJ0tArJAB7te/c4pxM/YlpX0gkQ7QYaQoF591wPRRelJr9sXOtAN1F+jZksB8NdFZZLL5Hqb0JP8RpRdMRpXXiSzaNiH+gAACIBif0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786631730; c=relaxed/simple;
	bh=Ypo2/dLzzXsHjDcz9+fXpGjuNXOywvAxBq4MKB4liv0=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kED0QO5CLReeQfH1rxhwANNjaFLPaUKKjIiV73v8tGr0G57DSVXLFuvyAlnhdnp29oxO5DlKFJn7TyGn2Pwmrq/SnQEBVZDTXhaizj5m5rSclfbzOMtbXvpublF7GO/1lHSX+K86jMI5HtI5SJONsCDgyBvVoboB8os+2nNqZcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fFjc9FNP; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=zEtMhMks; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=shIFDITu; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=MTXq7YX2; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fFjc9FNP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zEtMhMks";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="shIFDITu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MTXq7YX2"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 99E553E9E;
	Thu, 13 Aug 2026 14:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786631722; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NWu/dWef1OuXSDDyi7cWIti5FAb3GEsFodPyL0XiCeI=;
	b=fFjc9FNP57aC2Z5vZ6O9P71nl1TCC3ZhTwx/l/Py0Uzq1ZX8FlvNI4WsBJe6lZIKP9fzFy
	3/13I5LyYZKQGBGw4vathurbgSZfoRGkxOfzEvfwJy40HL602iRMUVu113LzyrrRTqyxZg
	AoKLEAejpFG3t/QDJ8LtcFlUcslfwlg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786631722;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NWu/dWef1OuXSDDyi7cWIti5FAb3GEsFodPyL0XiCeI=;
	b=zEtMhMksx3+87mcygZ6tWrnSfSra++Oz8fyKMx94IEN4kT5MI+yPqsrM9xMxlWo7YCO2YH
	DcTL8lg7KnicG5BA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786631718; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NWu/dWef1OuXSDDyi7cWIti5FAb3GEsFodPyL0XiCeI=;
	b=shIFDITuXHQ2hVgnjX/Kof2w7NVEXCsA1Pgmv2dkdnbVRdHrpjHFc+/Pd1ZpSGiFFBjpqw
	F10Y2XaFBkvHa/IhpRmo/bJYBZP7POjNebUiyIsz9mqD51nH8JtdrtAs9MsBj8UCFEjbtH
	rC7dHWFosFr9xFsQ7qwNzHzQkomwGVQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786631718;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NWu/dWef1OuXSDDyi7cWIti5FAb3GEsFodPyL0XiCeI=;
	b=MTXq7YX2VCtCg3W7J87WKwk5QQhq37tHajxG+ZOlaX3i00W7Z8qVcoY8s366VfYHg7QIGh
	lrXJzG31usxTaeDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6CF2B77E7C;
	Thu, 13 Aug 2026 14:35:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id uQJVGSbWfWqgSQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 13 Aug 2026 14:35:18 +0000
Date: Thu, 13 Aug 2026 16:35:18 +0200
Message-ID: <87cxvmxf4p.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v7.2-rc7
In-Reply-To: <317e8543ff401f09ccc2e93c8cd70e71@kernel.org>
References: <317e8543ff401f09ccc2e93c8cd70e71@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,alsa-project.org];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]

On Thu, 13 Aug 2026 14:16:39 +0200,
Mark Brown wrote:
> 
> The following changes since commit db2ddb87143519e20a95aa36c60b36107b736a58:
> 
>   Linux 7.2-rc7 (2026-08-09 14:54:50 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v7.2-rc7
> 
> for you to fetch changes up to 079e27f52b929b554b90514b081ea40b3d632a25:
> 
>   ASoC: Intel: NVL: Add entry for HDMI-In capture support to non-I2S codec boards. (2026-08-11 17:14:15 +0100)
> 
> ----------------------------------------------------------------
> ASoC: Fixes for v7.2
> 
> This set of fixes is bulked out quite a bit by the inclusion of a lot of
> quirks for various x86 platforms, though there are a few driver specific
> fixes in here too.  Nothing here is terribly critical, we should be fine
> waiting for the merge window if it's too much.

Pulled now.  Thanks.


Takashi
