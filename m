Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955FA4D8CB
	for <linux-sound@vger.kernel.org>; Sun,  8 Sep 2024 07:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725781245; cv=none; b=iB14c43S/RKUesaJLHybpXLBcR6cTTHedkg/avkOdPF1ajpTFjNCelNL9EAQ2zX16v5EpwCnFOEktekzdhxOB6j4NvxxnSELJQEkDILsSVcE2IHXZorsdnKWuXr2GgYi4NnItx9r8Zm+Yzcxpxxrm913H4biONgjk76+8tBE/pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725781245; c=relaxed/simple;
	bh=F2bpqOPO5F7p+9L1fIGOnKlkW/hs29BQXzxVssx5sSY=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pUyTJPBOPaJqYojNWenUt7q2mLUkHlifsgjVaHapLPqCKy5LT5aBdpE6B5OtCaCAf64e6HuTmW/chriAlWn+csxC4TNxxQ0/BVJAeKsFFHQNrpEO9c7daLrQZy0/ZPizCfECdH2eIAWaUlqE4DCe1L2N5kZ9m2zMZhaFDT8vlUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0C2tgA0+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=/vd+ANTq; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0C2tgA0+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=/vd+ANTq; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0C2tgA0+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/vd+ANTq";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0C2tgA0+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/vd+ANTq"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 83FEF21B7C;
	Sun,  8 Sep 2024 07:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1725781240; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gygF9J8oSeRsdSAii7gx6zvx1xUvw72rZKgbc2Y6LoE=;
	b=0C2tgA0++2TWCqxeVdCtl3NDybaeRg7/rYoIV8SqFgA9ahILBIucsJHnb+pLZ1JDqh7thK
	lwWV9wAbIZXWHTWhbnusVPtnRX9fyaPvIrOpIeRH8JarQi64yVu34tfrSTlsrwNycBHrTX
	J6pU8iAkI9wLOxgbrGhqqfhxIDOCo2c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1725781240;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gygF9J8oSeRsdSAii7gx6zvx1xUvw72rZKgbc2Y6LoE=;
	b=/vd+ANTqplySXInZAqZnPFCPS8SOcob9iIHD8wC/zCBWN748r+aJBlkE8RwEiIPnWO02il
	484lM2MYnl0zmdDQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=0C2tgA0+;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="/vd+ANTq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1725781240; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gygF9J8oSeRsdSAii7gx6zvx1xUvw72rZKgbc2Y6LoE=;
	b=0C2tgA0++2TWCqxeVdCtl3NDybaeRg7/rYoIV8SqFgA9ahILBIucsJHnb+pLZ1JDqh7thK
	lwWV9wAbIZXWHTWhbnusVPtnRX9fyaPvIrOpIeRH8JarQi64yVu34tfrSTlsrwNycBHrTX
	J6pU8iAkI9wLOxgbrGhqqfhxIDOCo2c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1725781240;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gygF9J8oSeRsdSAii7gx6zvx1xUvw72rZKgbc2Y6LoE=;
	b=/vd+ANTqplySXInZAqZnPFCPS8SOcob9iIHD8wC/zCBWN748r+aJBlkE8RwEiIPnWO02il
	484lM2MYnl0zmdDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5375013ADE;
	Sun,  8 Sep 2024 07:40:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Im+FEvhU3WYQBQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 08 Sep 2024 07:40:40 +0000
Date: Sun, 08 Sep 2024 09:41:27 +0200
Message-ID: <87a5gid23c.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: He Lugang <helugang@uniontech.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	kuninori.morimoto.gx@renesas.com,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA:rme9652:remove unused parameter in macro
In-Reply-To: <F53E9F10DA24705D+20240907142854.17627-1-helugang@uniontech.com>
References: <F53E9F10DA24705D+20240907142854.17627-1-helugang@uniontech.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 83FEF21B7C
X-Spam-Score: -3.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On Sat, 07 Sep 2024 16:28:54 +0200,
He Lugang wrote:
> 
> Parameter xindex is not used in macro HDSPM_TCO_LTC_FRAMES and
> HDSPM_TCO_VIDEO_INPUT_FORMAT,so just remove it to simplify the code.
> 
> Signed-off-by: He Lugang <helugang@uniontech.com>

Thanks, applied now.


Takashi
