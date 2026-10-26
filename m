Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793008083;
	b=uzTrRVGZkPQjeeMy6QFcc2aOKro6mi2I+yEuqkb5gARA+ul7OY4rEpRjUGPJot4UWjFU
	 HJisK670ZMTGMHNF+keMKgYB/h158aUfqS1h0/RcGNSD5O9SdMWNMKaVhD3L19v5K8R7Y
	 3TEh4qKY9wtghdkeBxbmhnYpIZgOZ2JF+yM/uS9kAasTeWHsj0Q7y6Wc9yYsqJhMKQDIH
	 9XopV+S6rgR56d92f87bw8jLyg2obB5tlUucFSJv+nIks9N+7am9alHzBeVqYU8EDy6cr
	 IV4ewz/v74OjheduYjqgHeyDWgYpNiB5aBIP46QvEwcYmAS41ErJTCMGTeuRoD+T2LQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793008083;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=xYGKqxAVU0GI320uv4h+tY8hT1ruD/xgwuuyS6PrZXg=;
	b=T0++zqwoNlZUmDN/80K4S/t9KGJqxmQt6zdy8PQZEFZrxFvv3QrExAXs7qYEYACqdguk
	 dUOP/OuAsLidTrRbuAlqawhI6hrIhJjqVjw1NSxFqmlX8UziJz6FKF1wq0xtQccErgtFB
	 HW0dz8CJpTF81XRkQ0Zti//Gr5K+Qpy3UCN4bajM7EWYD8KwIC7YgbaMsf9g2ToepwpjC
	 toZMfPtaM8CE+6tft33WHt+CCTAqn/ElBiJASIR8m15eV1JktE0yr/XF5L9lO7AL98tK/
	 0OzYBjs5i3QTDBr1SAoYcidcDnqSuBpYNj8idUWh0Ylw18ulw6qEkYNRiC09rzF3TGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GBIgfjKz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32347606A321
	for <linux-sound@vger.kernel.org>; Mon, 26 Oct 2026 09:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GBIgfjKz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A526E1F01825;
	Mon, 26 Oct 2026 09:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793008082;
	bh=xYGKqxAVU0GI320uv4h+tY8hT1ruD/xgwuuyS6PrZXg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GBIgfjKzSNUSp+dzOIMSRZB+n9uzpbCqtRZDdRK8Rle+arTlXod/OK9oFlUuT4lUp
	 88uNX0G5zJ5e1uGdSTErBQ1e3JnlFjm/Qo4kVZZxl61nMLgdAOApvBFM4X3Regm5ds
	 LEUixz0840NPjsSRomjQHihjH9swQMjVAR7COYym9mFBAf2NzRlCh6/4vYZeiiBFG+
	 PkYnfxsRhNFrvL6BFmawiowyVn9+UkAe6bK+58+JKEgiqhHBpRr61OQWWwms3WiERk
	 61X6k2ldSTFt3KkpTrumoNfEVxe/ZSP/Ja7RHsBdQLAmTVvsLS4fL1thORXVze0tLx
	 h6vAdJ1I5ANHQ==
Message-ID: <sashiko-outbox-184836@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 07/13] soundwire: amd: fix ctx leak when
 sdw_amd_startup() fails
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vijendar Mukunda" <Vijendar.Mukunda@amd.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261026044507.2310694-8-Vijendar.Mukunda@amd.com>
References: <20261026044507.2310694-1-Vijendar.Mukunda@amd.com>
 <20261026044507.2310694-8-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 26 Oct 2026 09:48:02 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] soundwire: amd: race and UAF in sdw_amd_probe() error cleanup with=
 active IRQ
--

commit 60bd17e72e211d96b5525ff2d9fb05330bb627b0
Author: Vijendar Mukunda <Vijendar.Mukunda@amd.com>

soundwire: amd: fix ctx leak when sdw_amd_startup() fails

This commit cleans up the SoundWire context and registered platform devices=
 via
sdw_amd_exit() and clears *sdw_ctx if sdw_amd_startup() fails during
sdw_amd_probe().

> diff --git a/drivers/soundwire/amd_init.c b/drivers/soundwire/amd_init.c
> index 8e419ddfa5161..88004d59322ee 100644
> --- a/drivers/soundwire/amd_init.c
> +++ b/drivers/soundwire/amd_init.c
> @@ -166,11 +166,18 @@ static int sdw_amd_startup(struct sdw_amd_ctx *ctx)
> =20
>  int sdw_amd_probe(struct sdw_amd_res *res, struct sdw_amd_ctx **sdw_ctx)
>  {
> +	int ret;
> +
>  	*sdw_ctx =3D sdw_amd_probe_controller(res);
>  	if (!*sdw_ctx)
>  		return -ENODEV;
> =20
> -	return sdw_amd_startup(*sdw_ctx);
> +	ret =3D sdw_amd_startup(*sdw_ctx);
> +	if (ret) {
> +		sdw_amd_exit(*sdw_ctx);
> +		*sdw_ctx =3D NULL;
> +	}

[Severity: High]
Could calling sdw_amd_exit(*sdw_ctx) before clearing *sdw_ctx race with the
parent ACP interrupt handler and trigger a use-after-free?

The callers of sdw_amd_probe() (snd_acp63_probe() ->
create_acp63_platform_devs() -> amd_sdw_probe() in sound/soc/amd/ps/pci-ps.=
c,
and amd_sof_acp_probe() / amd_sof_acp7x_probe() -> amd_sof_sdw_probe() in
sound/soc/sof/amd/acp.c) enable ACP external interrupts and register their
shared hard IRQ handlers (acp63_irq_handler(), acp_irq_handler(), and
acp7x_irq_handler()) before passing &adata->sdw as sdw_ctx to sdw_amd_probe=
().

In sdw_amd_probe(), *sdw_ctx (adata->sdw) is assigned immediately before
sdw_amd_startup() runs. Inside sdw_amd_startup() -> amd_sdw_manager_start()=
 in
drivers/soundwire/amd_manager.c, interrupts are unmasked before the fallible
manager enable step and before subsequent manager instances in the loop are
started:

drivers/soundwire/amd_manager.c:amd_sdw_manager_start() {
    ...
		amd_enable_sdw_interrupts(amd_manager);
		ret =3D amd_enable_sdw_manager(amd_manager);
		if (ret)
			return ret;
    ...
}

If amd_enable_sdw_manager() fails, or if manager 0 starts and manager 1 fai=
ls
in amd_sdw_manager_start(), sdw_amd_probe() calls sdw_amd_exit(*sdw_ctx) wh=
ile
the parent PCI IRQ is active and *sdw_ctx (adata->sdw) is still non-NULL:

drivers/soundwire/amd_init.c:sdw_amd_exit() {
	sdw_amd_cleanup(ctx);
	kfree(ctx->peripherals);
	kfree(ctx);
}

Because sdw_amd_cleanup() unregisters and frees ctx->pdev[i] (and its devres
amd_manager) and kfree(ctx) frees the context before *sdw_ctx is set to NUL=
L, a
concurrent hard IRQ handler on another CPU can observe the non-NULL adata->=
sdw
pointer and dereference freed ctx or ctx->pdev[i]->dev, or schedule
amd_sdw_irq_thread after amd_sdw_manager_remove() has already canceled the =
work
and freed amd_manager:

sound/soc/sof/amd/acp.c:acp7x_irq_handler() {
    ...
	if (adata->sdw) {
		for (instance =3D 0; instance < ACP7X_SDW_MAX_MANAGER_COUNT; instance++) {
			if (ext_intr_stat & acp7x_sof_sdw_ext_stat[instance]) {
				sof_acp7x_handle_sdw_manager_irq(sdev, adata, desc, instance,
								 acp7x_sof_sdw_ext_stat[instance]);
				irq_flag =3D 1;
			}
		}
	}
    ...
}

sound/soc/amd/ps/pci-ps.c:acp63_irq_handler() {
    ...
	if (ext_intr_stat & ACP_SDW0_STAT) {
		writel(ACP_SDW0_STAT, adata->acp63_base + ACP_EXTERNAL_INTR_STAT);
		amd_manager =3D dev_get_drvdata(&adata->sdw->pdev[0]->dev);
		if (amd_manager)
			schedule_work(&amd_manager->amd_sdw_irq_thread);
		irq_flag =3D 1;
	}
    ...
}

Unlike the normal remove paths (which call free_irq() before sdw_amd_exit()=
),
the IRQ remains active here. Should sdw_amd_probe() hold ctx in a local
variable and only publish *sdw_ctx after sdw_amd_startup() succeeds, while =
also
ensuring any interrupts enabled during a partial sdw_amd_startup() are mask=
ed
and synchronized before sdw_amd_exit() frees the devices and context?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261026044507.2310=
694-1-Vijendar.Mukunda@amd.com?part=3D7
