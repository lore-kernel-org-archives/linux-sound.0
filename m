Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792702151;
	b=N5qGmSbqHSW3cQNofcCkcwBB6z8lc9iEywYqUOh5YhnWtCFt4p35GMpjmckP/xxHeyE/
	 RwPF5Daz1oqJMJ80SvZEBMsOGJBID05xBoey9yb83a5Tm8a1Cji2EsgyNr2ivt5nSKZLI
	 60Z5CMfP8GHebivuILdgvYEURx6a682/kXPxiNy3cljemEgfNDWhXuveBN/bIz8y+gRy2
	 PkOmvI1+cuAT5V5MmDFXfEgL3FqGGMPCZkukpCopDdSAQRkGP4us5vAZ8yVy6YkI+0oHI
	 eB1a5T3q+5DDxZTfEQIC1GWjVLMPcv1HZCNipcEkgEE8KkJG8XwNIWiAoadjdGnVDug==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792702151;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=OvzPCxIrkqhvZBNjMscOG7UdsRW24r6x7d5VqQHpYiE=;
	b=gg8ls5GVGablfiGJqNLGPKXNw4V08C5sAtidC+uGbT2iRlxQUrVp91w/L9cgIf0m9Xdr
	 x8Yyo1SvxAFpsymwYM6xbosepD3nSWC24zka1ZKWoCciuGpj7fA4grGeLwGEbCMNyyPwj
	 sZws20E+yqhtutH/PKJ6OmKnNKplg8sgQl7dYJYuHvRF9+F5vvybHooVO8lX9U8bOldBF
	 0rxDf9e2L9sxOHROCmLOUSY53enYkN6vwuaRV3BRTgLQ5GldVKqITn+ZW6q8rmvLDaWjb
	 Z5ohC5uAPE3pMJlD+aXIoqa6WGCLKYAnI4jONoY3w5VabYQo1zq0kAZM5neESX196fA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=iHeG9thE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 790D1606A31A
	for <linux-sound@vger.kernel.org>; Thu, 22 Oct 2026 20:49:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 790D1606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=iHeG9thE
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6ae305e3bd9so271114a12.0
        for <linux-sound@vger.kernel.org>; Thu, 22 Oct 2026 13:49:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792702150; cv=none;
        d=google.com; s=arc-20260327;
        b=i3HOZEz1ADcUe8lYgg+iohATwrTc9EJVC+BZX2w4BottR5Z2zitr320yAGbGRvBqIG
         HBXXFdWksWJS11tS9DSbJktrjlb6F0JbmlwM3lITbxTL/Db8l9ZyDfZSJMFLlWYRb710
         qU6ncg8y8bRr71GG42KYfk6dJh/abXTHkb1u/cdXX5P/l8HuhiVZfkjAGminjF9cmPcR
         W7yCz6LCujXC0STYYjbkc3cFSxvFiMWdtUo6N0pSxbXHnRavP7Nia12O/JYl0QsWnn5d
         Ix5ev5XficpHI9t1Gz6rNNZphUwieUhm4jzOCMKghgmpafh0QAB73XVxHTUcXWoOkpdv
         TfBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=OvzPCxIrkqhvZBNjMscOG7UdsRW24r6x7d5VqQHpYiE=;
        fh=/dHOP71qu1cfPJmYV8N+IQbCgEs7JPCvzs1lA8sdluM=;
        b=ePEi7uc/UUu5wbEc/c0Mej1cEEgvyEmYQ7Duuy6gpiOn/0oaZLWkOoEqUhe/In2KIe
         nX47uPFWFEtw2lrsiliUXwZsxYie84r1EAmmd4sDZ8PRrMmNP2dO5L2nA+ldYoZ1YcYL
         lXvF1WNNkOwnxCr0AYZgdKZlbCtk/rzPs7n2oHXiTQ6pY1JgPmuBoA42R5hNqLb1dBRo
         FPcP3A2qOen3/p60EOS+70gis7I4PvF+KZbCIeu81zosp4D6HajfPU1XyhPxVUmIuOdN
         msudjsLfbjAcEy8VSFe6Gs0xW+Fq47Ab7A3f60zwe6RIX+buHxCzsgO4NSxgEiKlBCDw
         5Mzg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792702150; x=1793306950; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OvzPCxIrkqhvZBNjMscOG7UdsRW24r6x7d5VqQHpYiE=;
        b=iHeG9thE3s9LcKelk71iglCN4F0Afd1LeQv0OUazHFT5/yzyvP7hDjbH75G0x56Tdj
         xWppbOD2Ildu+aq5RVND9vxGp+SIu5/76bgxeQrx9Bk9hVGoma7IOnsleLTlOXd6HMDa
         cyrijq9a9zWk9jC9QdTbeQKOfHJFp+jS6r9Cpdyq8C7eyK3utqLzVnYShlNYezFf0ibS
         CgSST+CKZRtQ0/5IJR8rLJCShYW2Mezp7XlbVuzKLcWDGcJ+Zpz5esSQg8wDxgOJ6yQN
         ECiR2VPqDHnuMF1+LwFX52xzodRJcuxCYBXui3McxTIGYu+OfLmjVE8xqtOzUrwlLZKR
         6Isg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792702150; x=1793306950;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OvzPCxIrkqhvZBNjMscOG7UdsRW24r6x7d5VqQHpYiE=;
        b=ifpNvtVZScOruXIEcADDLHDEhF2P71Dc5Sje8Iq+VCjMgkZXAEEBJn8uInlBJfdEgj
         gmFlEUMUVEy5suR3HSoAqQCEJ+02A56Z4gaFWBtl1hbIxB3igWcGfnwhGkBw2oygvrBa
         YIdpzL7YQ/lg7T5aypRAPgNysLt3Op3uf2g1Nu37R8FPj5ION8EPmPBDVGHRNIbFAam8
         UCAMi2euq8xkJ4VIfRhddi7EZ0IACLp7jwHRH39Nrwg13zZGDGD+E0iKyAUF4SIevaQO
         9mhp95tJPbkHmK26aOMxfcWOsYls1VZCwWDREa7NjKub9k+ji5I1tjQoVF0MGQlVw4jS
         GaOw==
X-Forwarded-Encrypted: i=1; AKwUvByNFS0o71uxdtvrRIgCk46cfIyw/Auo/kKCu0OMdujSndG/vOBTP7ehlBbhFxMVPJN/Q68BircZsi7seQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJ6f3VAaSbFpa2hbenbavvEyy2VXPLzdf8K3rNJJ/s2d+HvzTQC
	3q97crH8XMFX7sUIRF38tcHNL2O767WdiapOAsQXIKS1SHmvmPSW/OZG8VE7reslfw+TwgIXAWb
	puqLFUYwovYsA8KfZcjsQXjS/9dCILQWvH5nl
X-Gm-Gg: AYBFou20wujZ3xAmgzEgXiZ4uIwY0HrLyX8w+mRffSM+rkE3GRLDMDn3v11r+VQms2D
	BTPbK+ng7MZpuAXARHOdXQK4kvOS6Jk3ubFFUvSa2Apng+YTTwSMEie/GiS9VLT+/hH0tph0G4/
	agG+aN8mdnE3cOHXDx9j28ls5pz6IFIy3WcckTLlesGrzz7OYdFvfT74LNLg0eXf8st33XLQlei
	y05MSULsT9vPrHivCEcsWjp/fWRVTwt2+KpUjaFfjdN+ZXYO3rYIRfBhdMzhmixGHmFUF55Iofh
	vWeXn/aql6iZzS1vZY3zMcBgsvNVBAkfsdZfPcSqjfiCB0UF17C42doFXA5muC1GUbXb6Mri9hl
	qOsADIgQeU/6QQrr8Rv/8FefHYPmYGcMDIcTFS988y+W7Y7O83VGtnnZZybJ0kCUjusoCZ+Lbfo
	xt/9ndPZZTLZj2pqbuaRyq+3yviH2UtQI4jTxTe/AA
X-Received: by 2002:a05:6402:24a2:b0:6b3:e399:406b with SMTP id
 4fb4d7f45d1cf-6b432bd8c35mr771506a12.17.1792702149698; Thu, 22 Oct 2026
 13:49:09 -0700 (PDT)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022163241.2504922-1-fuchsfl@gmail.com>
In-Reply-To: <20261022163241.2504922-1-fuchsfl@gmail.com>
From: Adrian McMenamin <adrianmcmenamin@gmail.com>
Date: Thu, 22 Oct 2026 21:48:58 +0100
X-Gm-Features: AclHuK8cDu37qi0ceXqicT2LWOMRDAcC3-mTU4N-HReiSSPGpfvVUaMqm6R8bQU
Message-ID: <CACwZE5RA=WSgkUv98+CUfnT4Q2N231+ejggofDuYHB7x+Uz+gQ@mail.gmail.com>
Subject: Re: [PATCH] ALSA: sh: aica: Fix spu_memset() stride
To: Florian Fuchs <fuchsfl@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	Kees Cook <kees@kernel.org>, Markus Elfring <elfring@users.sourceforge.net>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 22 Oct 2026 at 17:46, Florian Fuchs <fuchsfl@gmail.com> wrote:
>
> spu_memset() writes one 32-bit word per iteration, but advances the
> destination offset by only one byte. spu_reset() calls it with
> 0x200000 / 4 words to clear the 2 MiB of sound RAM, so:
>
>  - three out of four writel() calls target an unaligned address. The
>    SH4 can't do that. Each one traps and is emulated by the unaligned
>    access fixup. This call to spu_memset() causes 393216 unaligned
>    accesses, visible in /proc/cpu/alignment.
>  - the clear covered only about 512 KiB of sound RAM, not 2 MiB.
>
> Advance the offset by the size of the written word, to clear the full
> sound RAM using aligned writes.
>
> Fixes: 198de43d758c ("[ALSA] Add ALSA support for the SEGA Dreamcast PCM device")
> Signed-off-by: Florian Fuchs <fuchsfl@gmail.com>
> ---
> The patch has been tested on the hardware and sound is also still
> working well, the boot is faster by about 4s due to less unaligned
> fixups.
>
> Previously: 7.9s to boot:
> [    2.900000] AICA AICA: ALSA Driver for Yamaha AICA Super Intelligent Sound Processor
> ..
> [    7.872000] ALSA device list:
> [    7.876000]   #1: Yamaha AICA Super Intelligent Sound Processor for SEGA Dreamcast
>
> After: 3.8s to boot:
> [    2.892000] AICA AICA: ALSA Driver for Yamaha AICA Super Intelligent Sound Processor
> ..
> [    3.796000] ALSA device list:
> [    3.800000]   #1: Yamaha AICA Super Intelligent Sound Processor for SEGA Dreamcast
>
>  sound/sh/aica.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/sound/sh/aica.c b/sound/sh/aica.c
> index 078fc7fc08f9..04f80c8c89c0 100644
> --- a/sound/sh/aica.c
> +++ b/sound/sh/aica.c
> @@ -94,7 +94,7 @@ static void spu_memset(u32 toi, u32 what, int length)
>                 local_irq_save(flags);
>                 writel(what, toi + SPU_MEMORY_BASE);
>                 local_irq_restore(flags);
> -               toi++;
> +               toi += sizeof(what);
>         }
>  }
>
>
> base-commit: c1b1c25de0d6008c3fcabc942fba635ea3693c3f
> --
> 2.43.0
>

Yes, I don't know what I was thinking there - nobody who reviewed the
code picked it up either, though.

The trapping presumably stops the whole thing from falling over and
answers the "how on Earth did this ever work" question.

Acked-by: Adrian McMenamin <adrianmcmenamin@gmail.com>
