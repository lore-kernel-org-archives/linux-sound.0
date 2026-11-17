Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794900678;
	b=yyjTvqfRSnGIBO0fgGAe3dJtvLMDckJHD7+JQn7GORkVU0BmvrQGx5+j21Y49LK0XGTw
	 2i7xqzn/9aD/7hgPUYV1TCxV/nnKYZeJIs6k3BfT2ggL8egLIkxIH5yhorzt/fQtoLUHp
	 RAWLYo6ifN089d2y6xjVHmY/AUOwUU39to3caRd5Q1V05uBBOkJvem/KnNgUtrnmiJQmX
	 VWcMnyEnPTBCVvEYbfqDwfAm/LIHcHHdgzDlXmWuJu07yHZyo41Nz2grNLH3WnhNJiHUH
	 Y/8JPFSbjnGtmGbMehJ+b6gxUomxsIcJBFH5WsaQVhr1KlWy3Wys7gVCv3ND6tzBodQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794900678;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=+laPHjDRa6yVGpaKIADylsyv0PPMiDYEbiFDsePkH6M=;
	b=H/PXF4dZ/r6S8JhvXC7U6WDVEN2z0xF7o17azvaFssuzaCmqP15+ASamEe70UM0C3JIB
	 Pz20tv4bbwQMUZHGVf8GDMyyhCeTA5d/Avlf9feBvRQp2nw0e8ub3dKvOLdCpGbPHFC5K
	 kcYlz4Elngy3atBH6Qvh5PmFP+WkrmU0OZO8mb9dE20Uv+rt/Var+f+UT8xT79WY9C8k6
	 0P2iWUO3bjFLVnUclLNrCqsQo9HbEo2l/7NdmwL/TixXoNxuX9tj1OLyBXkmX96sq/kqV
	 vWM+4AqutoAx193qy3oMYDH+KmQ9WYwtBYn2gnruRtWNOb9Z5N751RHRbjWUUVDR1bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JJffagtP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B53606A323
	for <linux-sound@vger.kernel.org>; Tue, 17 Nov 2026 07:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JJffagtP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE0A41F000C4;
	Tue, 17 Nov 2026 07:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794900678;
	bh=+laPHjDRa6yVGpaKIADylsyv0PPMiDYEbiFDsePkH6M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JJffagtPDJh4csRTf0n/Q72pYNqprIvA8dlhQLH1Qk42J68pXQvZP/Fd2Tf2zBp21
	 4jO5mLrvQ9d1tYYrZTH/PSCaaCId6TutkuGmhDXWfL5j/P5QQF6M+y65NDa6M1+Tar
	 917I3Ox5jT4BqEmK+huclACSm+7UrqaY/MLWADdeA25OpxXYNOIFwCOkmKQjb+f8Kh
	 dWhDDVCs7e8ATOsgrfWvynmHwDZdvuhhHH70fNlEUzIGQ+WcRcl1opENUp1IyeMw95
	 ljKPiQMAwVhezTsJhgBqAq+4QJF/NmfMFz8E9jHS36WysyQkbqUk7Y3RVksHVnBmDa
	 nFOpQMH3FFG5A==
Message-ID: <sashiko-outbox-218354@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 16/23] soundwire: amd: delay *sdw_ctx publication
 until after startup succeeds
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vijendar Mukunda" <Vijendar.Mukunda@amd.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261117070906.803139-17-Vijendar.Mukunda@amd.com>
References: <20261117070906.803139-1-Vijendar.Mukunda@amd.com>
 <20261117070906.803139-17-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 07:31:17 +0000
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
- [Medium] soundwire: amd: lost IRQs in sdw_amd_startup() while *sdw_ctx
  is NULL
--

commit 63d0953ca7aecb37f123b556809d3ebfd5afacf0
Author: Vijendar Mukunda <Vijendar.Mukunda@amd.com>

soundwire: amd: delay *sdw_ctx publication until after startup succeeds

This commit delays assigning *sdw_ctx in sdw_amd_probe() until
sdw_amd_startup() succeeds, and calls sdw_amd_exit() on failure.

> diff --git a/drivers/soundwire/amd_init.c b/drivers/soundwire/amd_init.c
> index 8019a4faeae5b..74d6c0f371046 100644
> --- a/drivers/soundwire/amd_init.c
> +++ b/drivers/soundwire/amd_init.c
> @@ -182,11 +182,20 @@ static int sdw_amd_startup(struct sdw_amd_ctx *ctx)
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

[Severity: Medium]
Can delaying the assignment to *sdw_ctx until after sdw_amd_startup() drop
initial peripheral attachment interrupts?

All callers of sdw_amd_probe() register the top-level ACP PCI interrupt
handler before calling sdw_amd_probe(&sdw_res, &adata->sdw), and
sdw_amd_startup() -> amd_sdw_manager_start() unmasks the manager
interrupts and starts the bus before sleeping in readl_poll_timeout():

CPU0                              CPU1 (<hardirq>)
sdw_amd_probe()
  sdw_amd_startup(ctx)
    amd_sdw_manager_start()
      amd_enable_sdw_interrupts()
      amd_enable_sdw_manager()
        readl_poll_timeout(...)
                                  acp63_irq_handler()
                                    writel(ACP_SDW0_STAT, ...);
                                    if (adata->sdw)  <-- NULL, IRQ dropped
  *sdw_ctx =3D ctx;

In acp63_irq_handler() and acp_irq_handler():

sound/soc/amd/ps/pci-ps.c:acp63_irq_handler() {
	if (ext_intr_stat & ACP_SDW0_STAT) {
		writel(ACP_SDW0_STAT, adata->acp63_base + ACP_EXTERNAL_INTR_STAT);
		if (adata->sdw) {
			amd_manager =3D dev_get_drvdata(&adata->sdw->pdev[0]->dev);
			if (amd_manager)
				schedule_work(&amd_manager->amd_sdw_irq_thread);
		}
		irq_flag =3D 1;
	}
}

Because ACP_SDW0_STAT is cleared in ACP_EXTERNAL_INTR_STAT without
scheduling amd_sdw_irq_thread, ACP_SW_STATE_CHANGE_STATUS_0TO7 is never
processed and cleared, losing the peripheral attachment interrupt so
peripherals fail to enumerate.  On ACP7x SOF, acp7x_irq_handler() guards
sof_acp7x_handle_sdw_manager_irq() altogether with if (adata->sdw),
leaving the level-triggered shared PCI interrupt unacknowledged and
returning IRQ_NONE while sdw_amd_startup() sleeps.

Would it be better to publish *sdw_ctx before sdw_amd_startup(), and reset
*sdw_ctx =3D NULL on failure before calling sdw_amd_exit(ctx)?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117070906.8031=
39-1-Vijendar.Mukunda@amd.com?part=3D16
