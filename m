Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D49A81448E8
	for <linux-sound@vger.kernel.org>; Thu, 13 Jun 2024 12:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718280696; cv=none; b=dTeKOrmmTwmzABFyEyvAb+exTxlDpaJ5o2knB+A55LUTxo0KywdPbG3i2TJKOac2lUNvN1/r/RSUfwkEZT+y1qpg3VwMaTWt25qnFpewYOrN1MZIlr7D18lE74fsAQEb+bkr/Yljgpl/6Jq2IeDfa4WdeVDBMiT0vqXllbzwP0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718280696; c=relaxed/simple;
	bh=qFSEXZxE2LXGmX1pUbTlcOCDIAslRx8bXrnaSmrzxv8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Gdt1i/6ZMg8de1YJdeeh/nvvnV+tOmvhxgcPcuTH1CoU/WznLs8jEKC2RpsjKofj+KIYlBmQpVs9X2KFcv6dHKWY1oaGcj4ghDSKUSvxq+eqi0J9v409xl1C1vp+O9kxv1qmBC+osbR8yEd6lNj+b8N3GSn7JNRsAZaHR2IrGsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=zamdUheq; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Ftvk4OQV; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=cmqmAnWH; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Jv7niD/H; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zamdUheq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Ftvk4OQV";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cmqmAnWH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Jv7niD/H"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id DE3265D2FC;
	Thu, 13 Jun 2024 12:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1718280693; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zlrTtloILTWCtRNcwrDEbosWHR5SPiSqExyEr3Yzz5M=;
	b=zamdUheq/z4rdSgIKSM7UVWTcP64nS5twwehgevRdBuBlUI6ZBc6RN7lww16ahJwswVxVh
	KWwHavNKJ2+5MG4PvXMniWCp0GMUvAjtK2Rn/iJWCje8J5NC2ZzFVukaYRfdSarge9MdYR
	jSpmd6Kuka2UfIVjGzyngM+bDHX+Gho=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1718280693;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zlrTtloILTWCtRNcwrDEbosWHR5SPiSqExyEr3Yzz5M=;
	b=Ftvk4OQVBMK/k66PEQi8Sl/mJ0LnqsKhgJJQKZpXuGRkGeYaab6ibBxy86g/scc6A4+8qJ
	8qaQTCN86/PDiNCg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=cmqmAnWH;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="Jv7niD/H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1718280692; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zlrTtloILTWCtRNcwrDEbosWHR5SPiSqExyEr3Yzz5M=;
	b=cmqmAnWHji98gIefFMvX5KKVj0t2QAnJAgOi8URZonR1jjepaKsfH9/Hk6FtBkrCSd/ib2
	FiJhhtH6N3PEze9fMr4v1d6X5j3UsrG4NBwig1D1/jgd1fWnO+SDTSX8qUjWmUFrRWPeLl
	femfpEml6Dqc5afB7Z1fkWeRGVqrReU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1718280692;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zlrTtloILTWCtRNcwrDEbosWHR5SPiSqExyEr3Yzz5M=;
	b=Jv7niD/HJnuzTSSQTlh8fiedRtwi1qclB9vokdba/1TPwpLXiBNjKdZJemnCBYli/Gh8f4
	Xv9VJ/564dXHqoDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A8A6113A7F;
	Thu, 13 Jun 2024 12:11:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id gkfWJ/ThambWIgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 13 Jun 2024 12:11:32 +0000
Date: Thu, 13 Jun 2024 14:11:56 +0200
Message-ID: <87ed91nisz.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	cezary.rojewski@intel.com,
	broonie@kernel.org
Subject: Re: [PATCH] ALSA/hda: intel-dsp-config: Document AVS as dsp_driver option
In-Reply-To: <20240607060021.11503-1-peter.ujfalusi@linux.intel.com>
References: <20240607060021.11503-1-peter.ujfalusi@linux.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-5.49 / 50.00];
	BAYES_HAM(-2.98)[99.93%];
	DWL_DNSWL_MED(-2.00)[suse.de:dkim];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[7];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,intel.com:email,suse.de:dkim];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: DE3265D2FC
X-Spam-Flag: NO
X-Spam-Score: -5.49
X-Spam-Level: 

On Fri, 07 Jun 2024 08:00:21 +0200,
Peter Ujfalusi wrote:
> 
> dsp_driver=4 will force the AVS driver stack to be used, it is better to
> docuement this.
> 
> Fixes: 1affc44ea5dd ("ASoC: Intel: avs: PCI driver implementation")
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

Thanks, applied.


Takashi
