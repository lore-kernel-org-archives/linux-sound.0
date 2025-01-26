Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BFCB14884F;
	Sun, 26 Jan 2025 09:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737885578; cv=none; b=jtY9rYNUgJEugOOxTGX7wdRG3rNISi7UaEH6aM+zKch/OZ3vqwstTOdpR/r+xhENfuEBADYo0oHJniivR5B487ky0XIiwSajak/+kcPlotH8XS1eEicMw3+2X3wydsxxXwIsPbgPO4lzj6Zgu4Wx8Gl97QuXGjrbePrFX0Xb5mA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737885578; c=relaxed/simple;
	bh=g92Jnt2+ZIgUaPZU5Z8Rkbo8h8W4b6/nWpJ5eBbT1N8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VXeEFlk/q6na4RSNcexmTp+0U1qKMWf33vcRyfajW0NtAANcQkzWcNO7/lZUUHsNFVjVOASTGQl7oGl9m47e5mMlQeTipLjG1UfB6+kkDbFF0ldw0kaOtiyvmRUqmYR8OQ3J5/LCKR7qXLtO4oG8XHC2OgsA3XIR8ThIWYw4MI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Y9ekB+rM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=QC3jC9m6; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vHpfGefs; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=XZ2v6NB9; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Y9ekB+rM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QC3jC9m6";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vHpfGefs";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="XZ2v6NB9"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E4BC81F38F;
	Sun, 26 Jan 2025 09:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1737885574; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zGKLSzCxn+vqzWJDeBaqwnHFqYApRIm39t+3Hi67VGM=;
	b=Y9ekB+rM4hAkwk/KFAzps3X5RFx15eiEsddc4Y/AM6AXFZ7LQd8BRJ/mBlZ8a39Z+XGbE6
	4xQAdCgbOcFZmdwWpKIUK5EtQ5OQnLzBymZVnhB/Slp7FEQLdW8uuAgH1kdajsTpl4fPc3
	n7pRzkkquvuHWEnZpMbFnW4FYrM8awE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1737885574;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zGKLSzCxn+vqzWJDeBaqwnHFqYApRIm39t+3Hi67VGM=;
	b=QC3jC9m6CwdglgmVyHmOWVqYF5+jpwHHmPU+dYzQxPqRYB3dW/aEq5gsvWPqowCh1dIwsW
	OhE89hmnVaC6dbDw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=vHpfGefs;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=XZ2v6NB9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1737885573; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zGKLSzCxn+vqzWJDeBaqwnHFqYApRIm39t+3Hi67VGM=;
	b=vHpfGefsm8kwikxHLBszZWngnQ9/YnFXyXdGlwWmbzBKVTyrqklMEMo5NXkqdsn00iHwxX
	MhF5P0tzixtbIJsAu92e9DEdOiQkjAeoG+79Sleh+X/ktqzxNacA1bLrwFn47G437imha4
	Qb/wTqyqB/Uy7DVgnaAMuRIbschDGLc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1737885573;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zGKLSzCxn+vqzWJDeBaqwnHFqYApRIm39t+3Hi67VGM=;
	b=XZ2v6NB9Zp+3Bsg5GnEV9gClqoy6Z1sY5dj8GzWZuu8E3GxGO/LudHV9ZSBAkxymQ9IZ66
	fXNQO7EroXN9pkDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9162D13A60;
	Sun, 26 Jan 2025 09:59:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id C5SaIYUHlmfncQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 26 Jan 2025 09:59:33 +0000
Date: Sun, 26 Jan 2025 10:59:33 +0100
Message-ID: <8734h528vu.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?GB2312?B?uvrBrMfa?= <hulianqin@vivo.com>
Cc: "perex@perex.cz" <perex@perex.cz>,
	"tiwai@suse.com" <tiwai@suse.com>,
	"lina@asahilina.net" <lina@asahilina.net>,
	"mbarriolinares@gmail.com"
	<mbarriolinares@gmail.com>,
	"wangdicheng@kylinos.cn"
	<wangdicheng@kylinos.cn>,
	"cyan.vtb@gmail.com" <cyan.vtb@gmail.com>,
	"dan.carpenter@linaro.org" <dan.carpenter@linaro.org>,
	"bsevens@google.com"
	<bsevens@google.com>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ALSA: usb-audio: Add delay quirk for iBasso DC07 Pro
In-Reply-To: <TYUPR06MB62174A48D04E09A37996DF84D2ED2@TYUPR06MB6217.apcprd06.prod.outlook.com>
References: <TYUPR06MB62174A48D04E09A37996DF84D2ED2@TYUPR06MB6217.apcprd06.prod.outlook.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: E4BC81F38F
X-Spam-Score: -2.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,asahilina.net,gmail.com,kylinos.cn,linaro.org,google.com,vger.kernel.org];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On Sun, 26 Jan 2025 04:51:11 +0100,
ºúÁ¬ÇÚ wrote:
> 
> From: Lianqin Hu <hulianqin@vivo.com>
> 
> Audio control requests that sets sampling frequency sometimes fail on
> this card. Adding delay between control messages eliminates that problem.
> 
> usb 1-1: New USB device found, idVendor=2fc6, idProduct=f0b7
> usb 1-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
> usb 1-1: Product: iBasso DC07 Pro
> usb 1-1: Manufacturer: iBasso
> usb 1-1: SerialNumber: CTUA171130B
> 
> Signed-off-by: Lianqin Hu <hulianqin@vivo.com>

Applied now.  Thanks.


Takashi
