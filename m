Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792513515;
	b=wiqwaB1WL+0i0QG9SY2kGBPnNpSl8hkSxPYJ1U+xsgpuD1lQFo1IcTS0choBZTKl2Njv
	 lEKoPH8kMF+z5Pr4Y+Jq2v5fZFGR2lzLUjiWBLqMsclzQmAnKwVSg30ndCgTeCX+oZzm/
	 +iYrCH5ZFzdHUvGQi65B/8XjXXxhIN7AgIYWY9mav7ZWxVse5dmitGH3RLJCp0+YWFh8P
	 cxWiaQErhM5ED0EZt8V9Ew8/6tUkeJMoiXp0xtIylRY7VBKqvPeDH/0ADa0Fanie4RihR
	 x/wiwAW6YaAhH7iNHEYWScKGA2Elezd8FOtD1ZubHI9sCN2E/a9uc9aVAfX1AlQG7GQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792513515;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=/WZzvTV0o4Cct2YrzgchgsksenktGnjoF41y1u44DrU=;
	b=oCyDxciRIbpG4Py0cPYYOUC+8nnykh1H5fGP2kdZgTpwCy8GpIPCAwpEgKJOivBwQcZ+
	 xnoTwdDxWMKWGR9Fk1F//Bro06BrQbEyNsc5ubGepUY8wDbk+AjoWpicT/mjKG3CTiMCw
	 ibluUaeGc6Uuwsxh862xT1IDtggW3lzGPCpcdbDARC2AsR2RzuMiXJRZs531Ox0n/9NpV
	 l8gQHTeuWMjFf3OmpzIJOyi34lC4kovFSJnFz09E8XWvR2YSVxQCCDu+qvo8luBhxtYP2
	 lHUAmgAgR513hOGSzS9XcmowFlKeWFLpxxz/fSphmqstGiLg3c8h7jvXJSFb/E35/wA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FT2rIuBM;
	arc=none smtp.remote-ip=209.85.217.42
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4604606A32D
	for <linux-sound@vger.kernel.org>; Tue, 20 Oct 2026 16:25:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4604606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FT2rIuBM
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-7cc0892f92cso984453137.3
        for <linux-sound@vger.kernel.org>; Tue, 20 Oct 2026 09:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792513514; x=1793118314; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/WZzvTV0o4Cct2YrzgchgsksenktGnjoF41y1u44DrU=;
        b=FT2rIuBMmyXTaQsPut2rxO01PTvpI0lTY6Gq2VMb3qGEgVtC19MBPB/rn7nr7p6HyO
         TO/H/iA8b9O29s+mQZ+hfNcV2whFbpDaBm/g3ERJRPzbD+3TiOUWzHON0XVUBl5+5z/u
         8rtAha4fAXDelEfpY8h1/9qWzU8ajpi+ARdPc+slGCtkYBBy5M0rScjU5nAeZJBg7UTY
         V0Xi4igg/jtxBNWZCGcyIPyaE1zIFT1xr5UM4xDl1UfmdqJ20e050ITJ6tJ0Lguimjt6
         GyvCKsfV4cKgGwRNj8v4++sMdJzx7FX2YVBKb3AR18SodGJkMGuHIDrFt9xyAJnEfwkX
         wn2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792513514; x=1793118314;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/WZzvTV0o4Cct2YrzgchgsksenktGnjoF41y1u44DrU=;
        b=PdebATpSGQ7QXp4Uybze8Ph5ZYwB6zb5ZS9Q6sT5WKiI2hWqFkOJ61qkgmUv+ZkRyf
         1lBsPS3wffBdc5NPGProcBlL42ESSHheSSFfsQelqPQqlKaItD7D63gzr1wb73wyAFaj
         r0IVlt0NiucSYoSgcUo5WLX/VpKJNJ8ZIhd9VSglQn5aOYCiYyyLQZSgFq1ZExy40gzU
         8sGHe9MXYj35jkia++35Itj3x7ximXkBLN66spFEdCx9BHTKPTDU5dXbken2T6s1fDWl
         Cw18z6GEjLQ942ra394phPFJ8jPxB4s5N/gOpqClEPAZt2iGZCcToIf8eWHYAsBvYqQ4
         vLtQ==
X-Forwarded-Encrypted: i=1; AKwUvBwk5Vyz1tZNz5/QF3XxG5OKtZh+jCVJ0rDs+rvy+3JbmiPRcXwJmKE47FgCZ9GrX+UJI5mXbC8W/dp+4A==@vger.kernel.org
X-Gm-Message-State: AFq9FYJejYEfpRqFGulLXO4mK8qnRNQpgWFbgBZeRzwwPLDVW1uPrhnB
	aoIZc4M7ZCluKNOBNC28e7lPe6NQPRjwny8Wn660VRRyUDR/Wd+PWCwn30hZDy4n
X-Gm-Gg: AYBFou3q7Dm5MBGwuKNpTOlLVxIEh4szL2Du47cLpnpUexv+uJz8UhFeC3JgELtRZcx
	/4+67CtL4sRNODOqfMC65QmLG66Fj6fHa3qZoJo4GdtHxx1EefjNW/ic9vQmZYeW/5lx/udD7Fw
	HyOp/Fy5/kVUxJmFmb08KX/XrCd0xV84JEh85a8Kjby5+8cHG2q7HnOmTIhwbCUQObz5uZEX8zD
	qFFmFTglECVlqguHNSGbE7wLbzgWbvJU6ktOpdMzEBIRxJKAnOKTmm8dIp3/Cal4fxtPOrG08bF
	LfssZTvkFTUcGO30BbR+9EwmocMyH1MPl/W1Q62F3AX3JWa/WuhKH+9GgMtZrI2gbvK9PhJzbgI
	FqgC/kcHOpCQKi0QVwpmYea4TloRZ6A/70qCzpeEGEutwYD3KsBrFeSeDHanw0TLO1P0/P97Gyt
	XH+GArdl4MDb5jBtaEe7NSN0CXKZK4q/ztmp0Y3wE6N45GeaixbI76X/Gw8Vh20m/MOQC9hIpdZ
	+B+2K1+NqZYMg4+6aVRRBWvUVe0slcFysVQ2E4EupNu2djrTuLAt6dhUCZYy9jbxYWCymwsh1pd
	Ru2Bj/ZRproSke0Dfkm7spK4t/HV7IcY
X-Received: by 2002:a05:6102:947:b0:7c3:68c9:d24b with SMTP id ada2fe7eead31-7cc369c11fbmr1937696137.17.1792513513614;
        Tue, 20 Oct 2026 09:25:13 -0700 (PDT)
Received: from alsa-dev.int.suenodeluz.com.do ([74.244.193.177])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-990d0e0ba56sm297984241.1.2026.10.20.09.25.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 09:25:13 -0700 (PDT)
Date: Tue, 20 Oct 2026 12:25:10 -0400
From: Frank van de Pol <fvdpol@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: perex@perex.cz, corbet@lwn.net, khan@linuxfoundation.org, 
	rdunlap@infradead.org, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 00/13] ALSA: jockey3: Add support for Reloop Jockey 3
 DJ controllers
Message-ID: <u74rh4prk6dvevot57p5ewimezjfcrkidw7zznqomcebixvmrg@rngpubtcmrnm>
References: <20261019174445.1931263-1-fvdpol@gmail.com>
 <874iegh5u1.wl-tiwai@suse.de>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <874iegh5u1.wl-tiwai@suse.de>

On Tue, Oct 20, 2026 at 03:14:30PM +0200, Takashi Iwai wrote:
> > 
> > Frank van de Pol (13):
> >   ALSA: jockey3: Add probe skeleton for Reloop Jockey 3 DJ controllers
> >   ALSA: jockey3: Start the bulk streams
> >   ALSA: jockey3: Add PCM playback
> >   ALSA: jockey3: Add PCM capture
> >   ALSA: jockey3: Add KUnit tests for the Ploytec codec
> >   ALSA: jockey3: Add optimized codec variants
> >   ALSA: jockey3: Coalesce several packets into one URB
> >   ALSA: jockey3: Recover a stalled stream
> >   ALSA: jockey3: Add a watchdog for mid-stream stalls
> >   ALSA: jockey3: Add sample rate switching
> >   ALSA: jockey3: Add MIDI support
> >   ALSA: jockey3: Add power management
> >   ALSA: jockey3: Add driver documentation
> 
> Thanks, this makes it much easier to digest and review.

Thank you.  The functional splitting took quite a bit more effort than I
initially expected, but am happy with the result and makes it much easier to
understand how and why it all pieces together.

> Now it's already a time for 7.4 merge window, so I'll check the series
> after merge window is closed.  Meanwhile, Sashiko already reviewed,
> and you can enjoy its complaints :)

I already started analysing the Sashiko feedback and take advantage of the
findings/analysis to further improve/harden the driver.  I'm quite impressed
with this tool and think it will help improve the code base.

Good luck with the merge!  I'll regularly rebase the driver to keep up-date
with the latest kernel, and submit a v6 patch-series (same split as the v5)
for your review in two weeks or so.

> 
> 
> Takashi
>  
