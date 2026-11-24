Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795511515;
	b=ogBlHLMJPSLvDinRr90t4VGcX/HBuyKwUmOpkzdl2d7Y5Fc20snjESvm3+TSxuf/JLxC
	 6bx8h9XkLijOifR3oKrhCneCQ9UVec+Qcv75tKAyiKeprjQAs0MR0Xwec7/jOHC5Za1SN
	 KSuBKDZ3aF48U5FMabZqE/yifI33ijQ09J2KJk01jP5C/e6a58aTyzW2dBoQwCNQ5PDsX
	 0mcDi3wvOKRpz9dj6+w5Rza5WoIAhxcGubDomO0cOLRRk1oreLyAj+VJLgeBARNNsOBbK
	 Z17aYFem3uBsunc6Z8upZpW+BVGbiSLbvWhu4Srn8z9e43FIJf8DZv8JyAdlkMUfgXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795511515;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=tPP4VfgZ18KOyO6XzCjkkH10YRbdr1m0aZEAhj/pz+0=;
	b=RtUssg0mv1LN5llJIu2yz05GdlZw9FPkEToBiLocGHwJ9rUyP2utnWVmbx5ksOktLMUT
	 8hpOR/emKfJ7oOeKAw0Sq4tpPDhay+uJP2trSmiC9bbuHbbE1z00ez1OpK9noJZQoybR+
	 lCaTqfqtrSs8KaB+d9e7PY6nZLJY9YimjrrtVnSv0dDB5oWxLoXX/5Fsdj7UaQFFtfvuH
	 QuTd+8epNOcy1LBIjlVvwXPrleqNAi+lwZaKnKHQzSYCF+KZ/N+EtX8ffzuZMLtoneZE3
	 NYMZx8OMl1+ZRjCurJYddpW10EleHNR5J/L8/xCD1Oi3/D2P0EmpZurA8kZLyUvS3FQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ig7MpjJF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93AED606A321
	for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 09:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ig7MpjJF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C5791F000D1;
	Tue, 24 Nov 2026 09:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795511514;
	bh=tPP4VfgZ18KOyO6XzCjkkH10YRbdr1m0aZEAhj/pz+0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ig7MpjJFdZEjYYg9Py2q0UV+OSoGGcGX+xwzA0MKkWbvl+P5oWdba/sxXWSBOUSrO
	 FILnhU2Ak6IO+N9JaCEMqMxvRQ25Kt1fCt8BHWUojny8tOQeqefY0pSozbYHIH/Eo+
	 172cBCt/LCFSwUNf3ZBbDMVjZzgNdxRMa1AgZL7hX2BBVqah5NLGQfmEb76qCoGpcO
	 xhMPn2ZvMfSF2BKwE/5n7Da3jJ6vkUVPZgZOlHRrxeb7vYNfM91n6hrdgc/FhPXk+3
	 1MLyIiwTd2ixb4WIi2QuJVEY6J1xZEgdI+PyIkNb64XS2g3wqNggWiyfv7+aUCBdu8
	 0a7xREAPEtiVw==
Message-ID: <sashiko-outbox-230792@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 16/24] soundwire: amd: fix *sdw_ctx leak when
 sdw_amd_startup() fails
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vijendar Mukunda" <Vijendar.Mukunda@amd.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261124085033.682755-17-Vijendar.Mukunda@amd.com>
References: <20261124085033.682755-1-Vijendar.Mukunda@amd.com>
 <20261124085033.682755-17-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 09:11:54 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] soundwire: amd: race with hardirq handlers on
  sdw_amd_startup() failure
--

commit fb658db6de398fb5ff736ed8e17029fdf853a4c4
Author: Vijendar Mukunda <Vijendar.Mukunda@amd.com>

soundwire: amd: fix *sdw_ctx leak when sdw_amd_startup() fails

This commit cleans up the allocated SoundWire context and resets *sdw_ctx
to NULL if sdw_amd_startup() fails during sdw_amd_probe().

> diff --git a/drivers/soundwire/amd_init.c b/drivers/soundwire/amd_init.c
> index 8019a4faeae5b..50e487e409a9b 100644
> --- a/drivers/soundwire/amd_init.c
> +++ b/drivers/soundwire/amd_init.c
> @@ -182,11 +182,21 @@ static int sdw_amd_startup(struct sdw_amd_ctx *ctx)
> =20
>  int sdw_amd_probe(struct sdw_amd_res *res, struct sdw_amd_ctx **sdw_ctx)
>  {
> -	*sdw_ctx =3D sdw_amd_probe_controller(res);
> -	if (!*sdw_ctx)
> +	struct sdw_amd_ctx *ctx;
> +	int ret;
> +
> +	ctx =3D sdw_amd_probe_controller(res);
> +	if (!ctx)
>  		return -ENODEV;
> =20
> -	return sdw_amd_startup(*sdw_ctx);
> +	*sdw_ctx =3D ctx;
> +	ret =3D sdw_amd_startup(ctx);
> +	if (ret) {
> +		*sdw_ctx =3D NULL;
> +		sdw_amd_exit(ctx);
> +		return ret;
> +	}
> +	return 0;
>  }
>  EXPORT_SYMBOL_NS(sdw_amd_probe, "SOUNDWIRE_AMD_INIT");

[Severity: Medium]
Can clearing *sdw_ctx and tearing down ctx here race with the parent ACP
hardirq handler?

The callers of sdw_amd_probe() register their PCI IRQ handler before
probing SoundWire, and amd_sdw_manager_start() unmasks manager interrupts
in hardware via amd_enable_sdw_interrupts() before
amd_enable_sdw_manager() and before subsequent managers in
sdw_amd_startup() are started.  If startup fails after interrupts are
unmasked on a manager, the IRQ handler can fire while sdw_amd_probe()
clears *sdw_ctx (adata->sdw) and runs sdw_amd_exit():

CPU0                                  CPU1 (<hardirq>)
sdw_amd_probe()
  *sdw_ctx =3D ctx
  sdw_amd_startup(ctx)
    amd_sdw_manager_start()
      amd_enable_sdw_interrupts()
      /* startup fails */
                                      acp7x_irq_handler()
                                        if (adata->sdw)
                                          sof_acp7x_handle_sdw_manager_irq()
                                            snd_sof_dsp_write(...)
  *sdw_ctx =3D NULL
                                            if (!adata->sdw->pdev[instance])
                                              <-- NULL pointer dereference

If the hardirq handler instead loads adata->sdw->pdev[instance] right
before *sdw_ctx =3D NULL, it runs unsynchronized with sdw_amd_exit(ctx),
which unregisters the platform devices (freeing amd_manager without
waiting for in-flight hardirqs) and frees ctx, allowing a use-after-free
or scheduling amd_sdw_irq_thread after cancel_work_sync().  In addition,
because *sdw_ctx is cleared before amd_sdw_manager_remove() calls
amd_disable_sdw_interrupts(), any SoundWire interrupt arriving on ACP7x
in that window sees adata->sdw =3D=3D NULL and returns IRQ_NONE without
acknowledging the status registers.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124085033.6827=
55-1-Vijendar.Mukunda@amd.com?part=3D16
