Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7EC426F289
	for <linux-sound@vger.kernel.org>; Wed, 27 May 2026 05:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779859263; cv=none; b=HVuwjovJ2+z0I+eRo7GBpZIVOL4NYgAfhsH3RnLEkbKid2GzT7KKlDIloIDsFQASkNmAb+7q6ixmHH3R9Z1aXY+EP2RAm0M02JKxwAGzRs7gXiYblT4h8A+hjSzMIfEVo8nJ0T3UGaD6/IWpDCc43MXBE8xKf8p2ZwLDeFchA5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779859263; c=relaxed/simple;
	bh=VaLYkT9kxTkK1H/NP6q2bXQB4SDODpALdpuu0SPK9ig=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=U4kbGz18dRBZQpUzH6izVdkxyX5wWorOFhdmifi6cP88zm2M5KrJ33qt1wozWMaCUNkGKj9xCIajNaSsvUvDxrgRfL0+C664Sw8ukWRW9QS/Vv05mXzlyfxUmXGZAOZ2uMxnaAMm4Z2bCKvCJDFa6sNYoUHjYxyxmN5e1/I7XU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=NleIZP2X; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=9Q90QXLB; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0u86UegZ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=PkJq1GVg; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NleIZP2X";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9Q90QXLB";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0u86UegZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PkJq1GVg"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E0F3366D0E;
	Wed, 27 May 2026 05:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779859260; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KunEnHy3Z23KH2avng618/6NNIeBgT7KgZb5Etnd3hY=;
	b=NleIZP2XPusHx69yN4J/Gz3z/yLLpLgkvudPtfQegV7QwW+PIkTqn4vkki7fgyZvOtmrsk
	QjpIzWktOdZ+6/7BD7ul+FIOPb7deWUKSJUY0F+k7TEDAXePHZlKGI39u/a300hvw9IMXZ
	h0r96xXwt8MyOcWpdPN5Hw7HCyHCbfQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779859260;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KunEnHy3Z23KH2avng618/6NNIeBgT7KgZb5Etnd3hY=;
	b=9Q90QXLB7hi+dOdQcSXPOmj7RzCtt4o9rVvYvZj0124ewvsmjo0zJXBmMJLBcUxZy+I883
	sOMTrIPPr5BZAFAQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=0u86UegZ;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=PkJq1GVg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779859259; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KunEnHy3Z23KH2avng618/6NNIeBgT7KgZb5Etnd3hY=;
	b=0u86UegZz23dNSPk0fl7SBSD/dbMxtvLgaFAKH5dKfWdO/8lxlBE4JIDRSh0okdAfez4yo
	oT6r/wfLOOUcb0ri+8JL6Nx617Uiq5QnRvMBf2e2lRM32Y1TOOYR5TgH068mPIjKlShfQ3
	Sf5UenCuie076bOOPuDajE0xfoNW7i0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779859259;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KunEnHy3Z23KH2avng618/6NNIeBgT7KgZb5Etnd3hY=;
	b=PkJq1GVgnIbyO6oDXe+Qv6hJC/ypaDxkQNCrO+lXCSALuPCVTcXvKK+81NOE0o0NH2zZQf
	rs8GSZk3YxEtMGCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B5FDC5A661;
	Wed, 27 May 2026 05:20:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 2ngUKzt/Fmq0EQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 27 May 2026 05:20:59 +0000
Date: Wed, 27 May 2026 07:20:59 +0200
Message-ID: <871pexxwas.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Fabian Lippold <fabianlippold1184@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALC269/Realtek: add quirk for HP Dragonfly Folio G3 2-in-1
In-Reply-To: <20260526154418.1850568-3-fabianlippold1184@gmail.com>
References: <87ldd6zp8w.wl-tiwai@suse.de>
	<20260526154418.1850568-3-fabianlippold1184@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: E0F3366D0E
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]

On Tue, 26 May 2026 17:41:01 +0200,
Fabian Lippold wrote:
> 
> Add PCI quirk for HP Dragonfly Folio G3 (PCI ID 103c:8a06) to select the
> CS35L41 SPI4 & GPIO LED fixup variant.
> 
> Signed-off-by: Fabian Lippold <fabianlippold1184@gmail.com>

Applied now.  Thanks.


Takashi
