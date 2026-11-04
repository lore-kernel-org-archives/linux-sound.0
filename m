Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793770040;
	b=VgedRVJshvxaMbz1KqDpmSRyYrxynTmfnvLxmZsv8gpk27sVYjObzwAnu5hWbAZDxs4f
	 UK+yKV0u+W7qnBajHJJ2W4GsXrE1WyxXMGSN4c8ZtMyjGRELhJx8CfKGIo/0P9YXrvyUD
	 Fh+xXGjke3lm7lcOHicqku/cUgIPdxqRMJUb3EA5elHx4ODy7OhEXueab+1VF3qoIP5bc
	 MbmOy68Cu9sBHpM7HADlKB5qogQI5dhTsbMX5vx2mSip1u7WezkY0Sdo50xTpPEavzE5u
	 uDEdX8Szk7UgAWygLpKWx1yyhIgcI5mo151a0Gne//HUz4uu4rMrluJyYjbkclG9t/w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793770040;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:Subject:To:Cc:References:From:Organization:Message-ID:Date:
	 X-Mailer:MIME-Version:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=H7+oC5TK62LzRG8ffyfbqUH4V0UodtgPvvVq8+xuVic=;
	b=bwu/rKUTGrirNuQ3L4n2LSM/J/ER/Fg0iL3aJOh+LzR0zCCR6iLh/ALOQFgtSrCaKni/
	 tjlcPslrHhG6hIJA3Z5x1Z1sJxgvmrWEYRwFtIBpSwncsRE7m0wvpuoonJiaEx8++Cu3+
	 vyr7ekmJsEpnz7hQtXKwIpweKMzv8/NTy/GFcYipW81AVFk5Vcy1SC3+8M69jXulkSfJu
	 xtge3Ymf99uU6LNC1KKN+kTG+mYdMREWtdAZgbx3+B2KB6O4G81ruj6gmc5zj1T0ov7/V
	 4rImOGTUKmpUYCgh767N+9/cX9DobondDWeR0N1mToDThUo5dLeVFfeX1Xdrpn7Yi2w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=xenosoft.de;
	spf=none smtp.mailfrom=xenosoft.de;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=hvD0SvTw;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=payAzuLt;
	arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.50
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBE27606A31B
	for <linux-sound@vger.kernel.org>; Wed,  4 Nov 2026 05:27:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBE27606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=xenosoft.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=hvD0SvTw;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=payAzuLt
ARC-Seal: i=1; a=rsa-sha256; t=1793770021; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=HxNWctJ/lBG3wcbPf8vozLU2BBQ1TAklcANVCLEqCTxe09bpWFm+o/EmoVZzkSqR+L
    7TpPShOs0Ap5T93yZnqA5yo7G4FzWU7B9YKQd+VSPUNFQyzYo4qJ/474AHSgSpexhUFU
    zrudXcqZk9UxHWtEOqdiwhFp1UCQuB/r+T4lXJLg20IeaBkie0cfnSzGhWdizI3I+dGW
    jvgfSmOAkr7Q/6nQe8pEjYfK3gJddMdmXZz+5m8wVIfXaea3FyQnYguWMuPq+N38XQ1f
    IfKZcjBGyG7ywaOedL8km5+v9YIjySXvFmlmN1NM/tLZGoUH3M/1OVyFpxWkwLnk5NIw
    0KQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1793770021;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
    From:Subject:Sender;
    bh=H7+oC5TK62LzRG8ffyfbqUH4V0UodtgPvvVq8+xuVic=;
    b=LUrm+7B/AXiwln2WKJBJwE7Ee/N+FlYTE7UNBqUVMnR+MXyx5LJrLTq4GcMWCG4NJ6
    GYACqWM70gBylae+KlBiPa0yZdBXYmMgPrkiv5c6YxBn5fAxYxurUBGDPsaJr9gnZV/r
    coqEuALATUHprLdSbr/VWhOmr3LFwAx06jbDDXrqAKIpIq4HIh+snWuFlD72n4LO56ue
    ESJdMB16QlKmrqkj7OlB75osZvjQEuexFWKVyewhz+gi1ywXLkJxNIy0p3tC6BwmR6FY
    QmHubL66KwioZYtQQlpkjeG/Qe4cJMm7bWLwz6haaXXxEOx0h4k6RgoBOWYQ6hWyptcC
    QLgQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1793770021;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
    From:Subject:Sender;
    bh=H7+oC5TK62LzRG8ffyfbqUH4V0UodtgPvvVq8+xuVic=;
    b=hvD0SvTw2P1gIH5U9EgN1l2BA/kIR6i8VTxYDPkpkCBWDnioJwZl1x8X2aCLnSn+9O
    ctQgs8FZrK5mYjzjbaIgdldYUwATgjyaopDjI+CAtciSMTcerCLAPTzdJ3iueuQKbwyZ
    M/RtuT1z+SkqeojI05DjFGrMFzU+cekQ5nklpuorW4+SgmMZv8mbrBz5j+J2H9SiIBMa
    RcaI+Da46JhXs7xrindFAJBMboGpCbp1WGo0Evfp7MEXgAJwZHRIjPgxMcXTSStomi1v
    jjgIfCd0IaZvwCJCXIuYn2Af2G+t+2etv2RnKdsp86Jl3q6ewHe+O0rRPz/MYiIY05F4
    YxTQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1793770021;
    s=strato-dkim-0003; d=xenosoft.de;
    h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
    From:Subject:Sender;
    bh=H7+oC5TK62LzRG8ffyfbqUH4V0UodtgPvvVq8+xuVic=;
    b=payAzuLtEdJ9n2kUCwkZ5Mv1IDzB9yr/Gmy1jUowH1+yUN7uh2S8Yrv9npJ10kX8oj
    AcrfjsV+tvXqn+qY9FBQ==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr4thIFiqT9BURIC+l6Rzg"
Received: from void-ppc.a-eon.tld
    by smtp.strato.de (RZmta 55.6.3 DYNA|AUTH)
    with ESMTPSA id e825d92A45R1J9T
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Wed, 4 Nov 2026 06:27:01 +0100 (CET)
Subject: Re: [PATCH] ALSA: pcm: Allow HW_REFINE queries with mapped buffers
To: Vincent Cloutier <vincent.cloutier@icloud.com>,
 Takashi Iwai <tiwai@suse.de>
Cc: Vincent Cloutier <vincent@cloutier.co>, Cen Zhang <zzzccc427@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, linux-sound@vger.kernel.org,
 "R.T.Dickinson" <rtd2@xtra.co.nz>, mad skateman <madskateman@gmail.com>,
 Damien Stewart <hypexed@yahoo.com.au>, Christian Zigotzky <info@xenosoft.de>
References: <874idyx9n6.wl-tiwai@suse.de>
 <20261104004113.546712-1-vincent.cloutier@icloud.com>
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Organization: A-EON Open Source
Message-ID: <18b03c3e-a6d7-f500-50ce-3097d01ab042@xenosoft.de>
Date: Wed, 4 Nov 2026 06:27:00 +0100
X-Mailer: BrassMonkey/35.0.2
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261104004113.546712-1-vincent.cloutier@icloud.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/04/2026 01:40 AM, Vincent Cloutier wrote:
> From: Vincent Cloutier <vincent@cloutier.co>
>
> PulseAudio 16.1 queries supported formats after configuring and mapping
> a PCM buffer. Sharing HW_PARAMS' state checker with HW_REFINE causes
> these queries to fail with -EBADFD because a non-OSS stream has active
> buffer mappings. PulseAudio then fails to create its sinks and sources.
>
> Make the mmap restriction optional in the shared state checker. Keep it
> for HW_PARAMS, which can reconfigure the mapped buffer, but skip it for
> HW_REFINE, which only refines the caller's constraint structure. Keep
> the stream-state checks and buffer access locking for native, compat
> and legacy refinement ioctls rather than bypassing their wrapper.
> Leave the accepted stream states unchanged.
>
> On Librem 5, both L5 and Modem cards reproduce the failure for playback
> and capture: refinement succeeds before setup and after RW setup, but
> fails after MMAP setup in PREPARED state. With this change, all eight
> cases pass, PulseAudio starts normally and audible playback works.
> The reproducer does not start streams or transfer audio data.
>
> Fixes: ad28d2f607d1 ("ALSA: pcm: Serialize and check HW_REFINE ioctls")
> Link: https://lore.kernel.org/linux-sound/41a2e39a-5637-8afa-f84f-f79e63b3b56e@xenosoft.de/
> Link: https://lore.kernel.org/linux-sound/874idyx9n6.wl-tiwai@suse.de/
> Assisted-by: OpenCode:GPT-6.1 Sol
> Signed-off-by: Vincent Cloutier <vincent@cloutier.co>
> ---
>   sound/core/pcm_native.c | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
> index 5cbf88da7626..01d9f5ad4ea9 100644
> --- a/sound/core/pcm_native.c
> +++ b/sound/core/pcm_native.c
> @@ -776,14 +776,15 @@ static void pcm_qos_req_update(struct snd_pcm_substream *substream, int usecs)
>   					    usecs);
>   }
>   
> -static int hw_params_state_check(struct snd_pcm_substream *substream)
> +static int hw_params_state_check(struct snd_pcm_substream *substream,
> +				 bool check_mmap)
>   {
>   	guard(pcm_stream_lock_irq)(substream);
>   	switch (substream->runtime->state) {
>   	case SNDRV_PCM_STATE_OPEN:
>   	case SNDRV_PCM_STATE_SETUP:
>   	case SNDRV_PCM_STATE_PREPARED:
> -		if (!is_oss_stream(substream) &&
> +		if (check_mmap && !is_oss_stream(substream) &&
>   		    atomic_read(&substream->mmap_count))
>   			return -EBADFD;
>   		return 0;
> @@ -806,7 +807,7 @@ static int snd_pcm_hw_params(struct snd_pcm_substream *substream,
>   	err = snd_pcm_buffer_access_lock(runtime);
>   	if (err < 0)
>   		return err;
> -	err = hw_params_state_check(substream);
> +	err = hw_params_state_check(substream, true);
>   	if (err)
>   		goto unlock;
>   
> @@ -944,7 +945,8 @@ static int snd_pcm_hw_refine_with_lock(struct snd_pcm_substream *substream,
>   	err = snd_pcm_buffer_access_lock(runtime);
>   	if (err < 0)
>   		return err;
> -	err = hw_params_state_check(substream);
> +	/* Refinement queries constraints without changing the mapped buffer. */
> +	err = hw_params_state_check(substream, false);
>   	if (err)
>   		goto unlock;
>   
>
> base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d
@Takashi

Should I still try to find out which replacement of 
snd_pcm_hw_refine_with_lock() actually matters or has the issue been 
sorted out with Vincent's patch?

- Christian

-- 
Sent with BrassMonkey 35.0.2 (https://github.com/chzigotzky/Web-Browsers-and-Suites-for-Linux-PPC/releases/tag/BrassMonkey_35.0.2)

