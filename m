Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794068143;
	b=zXEiZ+2oZ39BgAHv5oibRtSR7RqV4bxVDGIxirHzvAf+GPk84oVbHKCOH5h/dwum7E98
	 qPv/ys0SJKmlomtGqcFrzIafLAp+GRCQK52wzghdpS/Y+kpJEnupvgKYSbHir3IU5qr2Y
	 xOYiHNA0CkC13YlD8qhrxBHm59bUos0zMowzk59yFOqTqjJlYoeJrc+UtYnkmXEKb7wxT
	 N7xT1PsK4TDUA3FZZ11fTvyh1UB27EvYjVDRkDdnNE9+H9KeZnBH8BQNkg6tjU0aS4XJS
	 Pwa8Jpneslx2kmxa7CHH669mMuu61KSVj+RZ82gCU9DbvkV0HDt6X5Lx42T/GA5FKvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794068143;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=20KOGzWVsJnlSP8TblDmszFREUjU4IHZLxdcKUXsaHg=;
	b=gn3QgxK44DUE3tWODVQuvRbTpex25qejZkqbL7NkKoat80Tk7rIuHRQVY0t56YtIoabp
	 cKVP/jK0v8CbPMvWN69gL8+YiJp4zYBDue1JY+WLIxam48KdVsMF+S+9XfbkDcIrOxobY
	 xethktc656JDdEl+LICxvCiiYKzQysnaq32wOwHu1AXjzwum2cKoJD9Ct3CG6czYW1mG7
	 SLe0MhGjmfh/H7/Y7iYaBildkwc5DlmyYQ6Oz2cmWlVjd+TcbxJd34VJxwRYBOIFQ7nig
	 AX9kzaQrZTx602b6bNpGLji1hRnM5hO/bSNAhwAKj23h75ODOd4/J0TWTxLk8HOx2VA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Wxh5StCG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517D0606D3D5
	for <linux-sound@vger.kernel.org>; Sat,  7 Nov 2026 16:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Wxh5StCG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBD6D1F0089F;
	Sat,  7 Nov 2026 16:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794068142;
	bh=20KOGzWVsJnlSP8TblDmszFREUjU4IHZLxdcKUXsaHg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Wxh5StCGfYRkbh8dZj929Xf8b8czMGTqn6Fg7RGWZ+j+HZGujR85sFngt4xynIhnL
	 FE5O2AiUrV1tliUrr72OdpHeyHkmCXMfHcu7VnyDW80vSTSQGq3doGDBhy1lEVpNml
	 LcneDNsHer1gWgu3L61xzLAYaIC2r9TxAayg/CuIIygd//16NhbznEMkxCkzQKd3Ru
	 Y6GBW7pi6789VEdHN9oWErcCTtrXDl7XAqwA7OAfbIERNeBodzu3AOnF1UWJSUlw+Q
	 pRON4lrqjIm8CESfuC5W4UizpNIXSCcsmI9VD3jYbzD52R6GWNeAPbzYwt/7f1TUdf
	 VJqC+Cxe1Cllw==
Message-ID: <sashiko-outbox-203039@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 18/25] soundwire: amd: delay *sdw_ctx publication
 until after startup succeeds
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vijendar Mukunda" <Vijendar.Mukunda@amd.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261107154659.3358223-19-Vijendar.Mukunda@amd.com>
References: <20261107154659.3358223-1-Vijendar.Mukunda@amd.com>
 <20261107154659.3358223-19-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 16:15:42 +0000
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
- [High] soundwire: amd: NULL adata->sdw dereference in IRQ during
  sdw_amd_startup()
--

commit a9bb217bfdd227aefc49880481f23f5b560ad717
Author: Vijendar Mukunda <Vijendar.Mukunda@amd.com>

soundwire: amd: delay *sdw_ctx publication until after startup succeeds

This commit delays assigning *sdw_ctx in sdw_amd_probe() until
sdw_amd_startup() succeeds, cleaning up the local context with
sdw_amd_exit() on failure.

> diff --git a/drivers/soundwire/amd_init.c b/drivers/soundwire/amd_init.c
> index 032697ea35906..ce40b1e5dbf31 100644
> --- a/drivers/soundwire/amd_init.c
> +++ b/drivers/soundwire/amd_init.c
> @@ -176,11 +176,20 @@ static int sdw_amd_startup(struct sdw_amd_ctx *ctx)
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
> +	ret =3D sdw_amd_startup(ctx);
> +	if (ret) {
> +		sdw_amd_exit(ctx);
> +		return ret;
> +	}
> +	*sdw_ctx =3D ctx;
> +	return 0;
>  }
>  EXPORT_SYMBOL_NS(sdw_amd_probe, "SOUNDWIRE_AMD_INIT");

[Severity: High]
Can delaying the assignment of *sdw_ctx until after sdw_amd_startup()
cause a NULL pointer dereference of adata->sdw in the ACP IRQ handler?

The callers (snd_acp63_probe(), amd_sof_acp_probe(), and
amd_sof_acp7x_probe()) register their IRQ handlers and enable global ACP
external interrupts before calling sdw_amd_probe(&sdw_res, &adata->sdw).
Inside sdw_amd_startup(), amd_sdw_manager_start() unmasks SoundWire
interrupts and enables the bus on each link before *sdw_ctx is populated:

CPU0                              <hardirq>
sdw_amd_probe()
  sdw_amd_startup(ctx)
    amd_sdw_manager_start()
      amd_enable_sdw_interrupts()
      amd_enable_sdw_manager()
                                  acp63_irq_handler()
                                    adata->sdw->pdev[0]  <-- NULL deref
  *sdw_ctx =3D ctx;

Once the link is enabled and attached peripherals signal attachment while
amd_enable_sdw_manager() polls or while the second link starts up,
acp63_irq_handler() and acp_irq_handler() dereference adata->sdw without a
NULL check:

sound/soc/amd/ps/pci-ps.c:acp63_irq_handler() {
    ...
	if (ext_intr_stat & ACP_SDW0_STAT) {
		writel(ACP_SDW0_STAT, adata->acp63_base + ACP_EXTERNAL_INTR_STAT);
		amd_manager =3D dev_get_drvdata(&adata->sdw->pdev[0]->dev);
    ...
}

On ACP7x, acp7x_irq_handler() checks if (adata->sdw) and skips
sof_acp7x_handle_sdw_manager_irq() when it is NULL, leaving the SoundWire
interrupt status unacknowledged and returning IRQ_NONE.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261107154659.3358=
223-1-Vijendar.Mukunda@amd.com?part=3D18
