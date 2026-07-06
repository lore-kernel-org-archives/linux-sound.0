Received: from out203-205-221-164.mail.qq.com (out203-205-221-164.mail.qq.com [203.205.221.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 239A3478E51;
	Mon,  6 Jul 2026 08:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.164
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783328002; cv=none; b=jczKfsKAUxoGCgi3vuee77y5GsLH4fs7ysbqj/ODmziDCnPxrmAMZ0iNZhZ3lxLD3D5Rt+jnJo/FYx8eJjZo/AVCke33tFupKgenfgZ58tqa9haTi1T2iMgQrtFGO0kUukmBa1AmaLFn+NffuAonPfVQBC3mzmUBAzBTiLlwxgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783328002; c=relaxed/simple;
	bh=xb+Aq4nEWNkGpW+EPioP6/DHmBEvlpnxXn3CzHZLm28=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=KoZWcIwxEGlpVhDzSS877zFE37kAEg5SlT32gzUtU+IyuWwEtS3QFGwF898edqcgERZ2g4rBWUpVQ2FROw3IzOcMZuEAy3WpRkx5iCabjgZCVdhgjIRoBFHOrCs5elzpv5lJxOQxoCWg+nRaIlvDkNLQlpTHuoRaacTBRavsX1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=jAwJHH5X; arc=none smtp.client-ip=203.205.221.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="jAwJHH5X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1783327972;
	bh=GOkDZjkzWAY45UbQP8QU2In0TxvbJGwkkNf1lgmFYco=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=jAwJHH5Xh+J0VFbzGS/J+gHJ6PAunn9yAao2gT+xq3AAoE9WyIUYa6eK0ixLm5adA
	 PYc+BbczLV6u91x/wa8MkABhMuH9sx3QEPR7AjYEK6Ko9YLh6eGqXNNFV8EsJ8fKPE
	 1dE84aJiVcZuicjCWdOxqPVoBBIy4VL5fOT3ENuA=
Received: from localhost.localdomain ([116.128.244.169])
	by newxmesmtplogicsvrszc50-0.qq.com (NewEsmtp) with SMTP
	id CDA9DE34; Mon, 06 Jul 2026 16:51:26 +0800
X-QQ-mid: xmsmtpt1783327886tyjr0qeen
Message-ID: <tencent_6643D4C4FD3A63DCC5AEDDEEEEAAB8F12605@qq.com>
X-QQ-XMAILINFO: N/WmRbclY25G0mXUP5n1zqPWz5sBUuzsT8qgZmz170QGw6T5epy5ZvZyrqOYCe
	 3PEZGghO2Mn/7B/8Fq4SZXSFpLF1frNzq/QPAgbqYL2Jlg2QGX5dkVAvmdvOzxZj2gLfXMySnhb4
	 19AT2hF12KAmoMbXBcK94Kl8s0RjOX7dmOPrZPLDyjR+ZRnR7oZDgZRO6a2JYYjVBZipzzLN9u5S
	 /zirkmd05sF42dJ58ZTUluus8508pot12kANyrjXqVl5G3e5E+JB7quvZ4MpGbkJo5RTEWPGnYgv
	 AQwcz4oepsAgKE7rTwN2XHhJN70UxSD40nK4Fa/OaHs1PxTi0J7sUhQFF/rR2FdEZgf7KLzBqi1h
	 iboEVQRiCM5qSBvl36CIxTPsWDhwcmgrd4axhRcfAZ3y/oX4M2CtHYLMqgrllLuGT2D+rjT5CTvH
	 N7eiK2Yay3pAbFP5XtDmSIpUpV1FfKCZDtfQ6I0dpGAwhOWF645DyhCuM3wFyUwN1V/SXbQ+7v7Y
	 8gSW2cCEdN5+OfgzkEUjvS4bnBaHrD/IjcDsGPqi1lDaUk8ibXbziDggCFmnshknxqm1t0brBt0g
	 cUAzuf5wBicul9ulJQjtRrFevIV+nEM6p+gKOhG6yGFhccfnVUJu8mwSsl4qv005hPkhFGzVg4ZL
	 HuzXYuZIEUvCdVK23OKhCNUD4C481ZhtX4PJ4pVXDzVil4Gp3ffwZshI0+1Efku09LFq4m9sVh35
	 ry7Cu+0Vhxp4aDwmIZpYphyYx3pZaNtpqvYtzMdyGIBYpWee1CYoLo4buYQTYaQkZJWRB2Jl0VS7
	 f60PgJwQ6oIih7Sy+LkISevgA56RGEZZOzmDI+gHSTl1IxiF6fvYKF3OKB+Z5a6IF/wgnWSDlT5j
	 CaN7RGEB8TF25VdF47R9ei4jYzipEqL5pkfgHPi92rv/pdMOjUuBlGt34S9kGZL4dCD89xzTDLlH
	 2YGg8k+klhoAIcxlGaM9aeee4R0g0hXmfS+CkenAJ7OfOOEwwm1PNDs+F0AXV0MyyISxtDpZPFRw
	 o8fAK1RLKLUrAi7Ec7cdQ4BHLAHMD3oDUxsTgFikpgk69RCDpsLRQwVZrfnxEuomSzGsGi4A==
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
From: Zhao Dongdong <winter91@foxmail.com>
To: tiwai@suse.de
Cc: joakim.zhang@cixtech.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	winter91@foxmail.com,
	zhaodongdong@kylinos.cn
Subject: Re: [PATCH] ALSA: hda/core: fix memory leak in snd_hdac_bus_alloc_stream_pages()
Date: Mon,  6 Jul 2026 16:51:11 +0800
X-OQ-MSGID: <20260706085111.434623-1-winter91@foxmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <878q7o5ygj.wl-tiwai@suse.de>
References: <878q7o5ygj.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 06 Jul 2026 10:11:56 +0200, Takashi Iwai <tiwai@suse.de> wrote:
>
> On Mon, 06 Jul 2026 09:41:10 +0200,
> Zhao Dongdong wrote:
> > 
> > From: Zhao Dongdong <zhaodongdong@kylinos.cn>
> > 
> > In snd_hdac_bus_alloc_stream_pages(), there are three memory leak paths:
> > 
> >   1. If snd_dma_alloc_pages() for the BDL fails at stream i, the
> >      previously allocated BDL DMA buffers (0..i-1) are not freed.
> > 
> >   2. If snd_dma_alloc_pages() for the position buffer fails, all
> >      previously allocated BDL DMA buffers are leaked.
> > 
> >   3. If snd_dma_alloc_pages() for the ring buffer fails, all
> >      previously allocated BDL DMA buffers and the position buffer
> >      are leaked.
> > 
> > Add proper error cleanup: free buffers that have been allocated
> > before each failure point.
> > 
> > Fixes: b2660d1ebde1 ("ALSA: hda: Move HD-audio core stuff into sound/hda/core")
> > Signed-off-by: Zhao Dongdong <zhaodongdong@kylinos.cn>
>
> They don't actually leak, as those are supposed to be released by
> callers (via snd_hdac_bus_free_stream_pages() call at destructor).
> That is, it's no bug, per se.
>
> Of course, it won't be bad to clean up in the function itself, which
> is more self-contained and safer.  But please rephrase the patch
> subject and description, so that it won't be taken as a security issue
> incorrectly.
>
>
> thanks,
>
> Takashi

Thanks for your review. 
You are right that snd_hdac_bus_alloc_stream_pages and snd_hdac_bus_free_stream_pages 
are paired, so the extra free call is unnecessary, please ignore this patch.


-- 
Regards,
    Zhao Dongdong

