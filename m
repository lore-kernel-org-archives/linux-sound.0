Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18C23033FB
	for <linux-sound@vger.kernel.org>; Thu,  2 Apr 2026 09:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775121358; cv=none; b=tIQ/zVYKEDiV27baaRr7YyRvvrwprQKeRlbtB+uganxQp4yLOnB2slfSESf/0XH2Jf4ONtafFV5PZ9YLnrh4ez5j5H74ctJT65Ntr2RC/pnuPit2BdjTJ9bqSKGK6h3rkhLft334ei6WE7ajIPoWWlMeWgGrRZ1mp0+L2kYayTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775121358; c=relaxed/simple;
	bh=1U4xraNfOSHTnsVVGIX6KUXGjid4mP6juP+1qtFhy50=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SgEw+3Sz2kvp4EOeE4zaQ3BAou7T+5sOBREPczAssPheKMAa3t969EFx/qWHbfbKVj6aNrK4NhVHYgmw/qeRP1fPvdBLNYWqQcXsSVv2r9jBc4v4PIZ8AG5pUfACEAoDBo2vY9ihfJUAkqYHe1C930ir5T0jwES3OHuiTUBsuaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Zx6mn4E5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Ll2PLxZk; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Zx6mn4E5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Ll2PLxZk; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Zx6mn4E5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Ll2PLxZk";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Zx6mn4E5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Ll2PLxZk"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 451235BD3D;
	Thu,  2 Apr 2026 09:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775121355; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fypoAZdExyl0gDOdy7BIuXDYsWD5MUwtA+w2Rj6HrCM=;
	b=Zx6mn4E5c4lecpFxAkPBkz+UAC88A5Q7RbYhOuQFW3pe3+bySjwEmVi3hvjO1hNYkWmHgW
	aqRcoxXPgfPH6vWw9/bqAaezQoDJti9LKVmDJ/2gLIL3RnYRXmWgVWhy1FCJptOQcybUVJ
	NZKFYwzajvpUQ1bKf/L/w0XnI+MOoXo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775121355;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fypoAZdExyl0gDOdy7BIuXDYsWD5MUwtA+w2Rj6HrCM=;
	b=Ll2PLxZkVfSaMOyxDwIDkhdHOl/cPB41rJ7HH8ofcasa6OV4tbAr9gM9e4+m5oLCOPZ5M9
	ddsz1Q1OS2XXcvDA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775121355; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fypoAZdExyl0gDOdy7BIuXDYsWD5MUwtA+w2Rj6HrCM=;
	b=Zx6mn4E5c4lecpFxAkPBkz+UAC88A5Q7RbYhOuQFW3pe3+bySjwEmVi3hvjO1hNYkWmHgW
	aqRcoxXPgfPH6vWw9/bqAaezQoDJti9LKVmDJ/2gLIL3RnYRXmWgVWhy1FCJptOQcybUVJ
	NZKFYwzajvpUQ1bKf/L/w0XnI+MOoXo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775121355;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fypoAZdExyl0gDOdy7BIuXDYsWD5MUwtA+w2Rj6HrCM=;
	b=Ll2PLxZkVfSaMOyxDwIDkhdHOl/cPB41rJ7HH8ofcasa6OV4tbAr9gM9e4+m5oLCOPZ5M9
	ddsz1Q1OS2XXcvDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 142674A0B0;
	Thu,  2 Apr 2026 09:15:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id x9+wA8szzmmKWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 02 Apr 2026 09:15:55 +0000
Date: Thu, 02 Apr 2026 11:15:54 +0200
Message-ID: <87y0j5iuyd.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>,	Jaroslav Kysela <perex@perex.cz>,	Takashi
 Iwai <tiwai@suse.com>,	=?ISO-8859-1?Q?P=E9ter?= Ujfalusi
 <peter.ujfalusi@linux.intel.com>,	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] ALSA: compress: Robustness improvements in pointer() handling
In-Reply-To: <20260401-alsa-unconfigured-tstamp-v1-0-694c2cb5f71d@kernel.org>
References: <20260401-alsa-unconfigured-tstamp-v1-0-694c2cb5f71d@kernel.org>
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
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Flag: NO

On Wed, 01 Apr 2026 18:57:33 +0200,
Mark Brown wrote:
> 
> While looking at an ASoC driver I happened to notice a divide by zero on
> a pointer operation, discussion of which with Péter Ujfalusi identified
> several other issues in the handling of pointer operations in the core.
> This isn't a comprehensive review, it's just fixing up issues that
> happened to be noticed.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
> Mark Brown (2):
>       ALSA: compress: Refuse to update timestamps for unconfigured streams
>       ALSA: compress: Pay attention if drivers error out retrieving pointers

As it's at a quite late stage, I applied to for-next branch for 7.1.


thanks,

Takashi
