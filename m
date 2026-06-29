Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF993EB0F5
	for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 10:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782728845; cv=none; b=ST0+loUp/DzYyi5DQOlCba/7Ha7Y9FOqUf+HZKVQ1/aTemsBk3DVZ3ykSqKmrIUTap1xzBS3ojGfuEouikwqMiJMwkCF9gKvbOY+AlVBKm2gsj/ZIVCkVbbl3i/FMKre4PVnsWJvdQthAc/cxCM+H9/FGYQItnydZZBpJeniF98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782728845; c=relaxed/simple;
	bh=Tl9bQ+51XPo/LulfGmSVbbF5nNVF2hL7yThKD/VLZg4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aPnsl3wgs+l+RlBIV50u+2/v9hDeOPWXFhSCkOQEHqOli2I6Gz0i4Lr5JRX+dbhcygWXZxVCpIz/ZI8gtUM9uF69J93CRvqe6f5DH1A4r7yRstYm7dkSKpVflmtTsv+yTtMalm/2TU2LQqSpYqFlQWmJ/AgZGPsYMpMEAThXufM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=x8JKdQPa; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=85ZC/ThA; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=x8JKdQPa; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=85ZC/ThA; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="x8JKdQPa";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="85ZC/ThA";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="x8JKdQPa";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="85ZC/ThA"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 3371675D81;
	Mon, 29 Jun 2026 10:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1782728842; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rGSIa4eM/0eYZdMY5DXFfdq8STEq7sU+S6e5gJolF2w=;
	b=x8JKdQPalLCHnNsWOJu8QJ82dgmTztI8fDMIw+rFhMSDR7CUfY8AyBJpaRW3sGRySq2Cgr
	b/yiWXMRXxZGrq7CaNoNT0ACRCIKkTf/NI+THjb9GjWCrZwaAXJ0yO+sMe174TpIuwct2x
	jLSf37cl/XqW9460yafnoT7Ej9a/0y8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1782728842;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rGSIa4eM/0eYZdMY5DXFfdq8STEq7sU+S6e5gJolF2w=;
	b=85ZC/ThAKEhI8KhBdEqSm6mTivKE4cYqJ2ga/N4IhCQVwRHwKSa62kOTClVv6ETnV3iNmg
	G2gKlrkt9qiOMUBA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=x8JKdQPa;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="85ZC/ThA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1782728842; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rGSIa4eM/0eYZdMY5DXFfdq8STEq7sU+S6e5gJolF2w=;
	b=x8JKdQPalLCHnNsWOJu8QJ82dgmTztI8fDMIw+rFhMSDR7CUfY8AyBJpaRW3sGRySq2Cgr
	b/yiWXMRXxZGrq7CaNoNT0ACRCIKkTf/NI+THjb9GjWCrZwaAXJ0yO+sMe174TpIuwct2x
	jLSf37cl/XqW9460yafnoT7Ej9a/0y8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1782728842;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rGSIa4eM/0eYZdMY5DXFfdq8STEq7sU+S6e5gJolF2w=;
	b=85ZC/ThAKEhI8KhBdEqSm6mTivKE4cYqJ2ga/N4IhCQVwRHwKSa62kOTClVv6ETnV3iNmg
	G2gKlrkt9qiOMUBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C501D779A8;
	Mon, 29 Jun 2026 10:27:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id U/qdLolIQmq1GwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 29 Jun 2026 10:27:21 +0000
Date: Mon, 29 Jun 2026 12:27:21 +0200
Message-ID: <874iilr69i.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Fu Hao <fuhao@open-hieco.net>
Cc: bhelgaas@google.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-pci@vger.kernel.org,
	tingyin.duan@gmail.com
Subject: Re: [PATCH v3 6/7] ALSA: hda: Add support for Hygon family 18h model 5h HD-Audio
In-Reply-To: <8b38f2941375553e4246167736c6acb5a541e833.1781523812.git.fuhao@open-hieco.net>
References: <cover.1781523812.git.fuhao@open-hieco.net>
	<8b38f2941375553e4246167736c6acb5a541e833.1781523812.git.fuhao@open-hieco.net>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Rspamd-Action: no action
X-Spam-Level: 
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[google.com,perex.cz,suse.com,vger.kernel.org,gmail.com];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 3371675D81
X-Spam-Score: -2.01

On Mon, 15 Jun 2026 14:22:40 +0200,
Fu Hao wrote:
> 
> Add the new PCI ID 0x1d94 0x14a9 for Hygon family 18h model 5h
> HDA controller.
> 
> Signed-off-by: Fu Hao <fuhao@open-hieco.net>

Applied to for-next branch now.


thanks,

Takashi
