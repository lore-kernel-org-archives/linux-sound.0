Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794075099;
	b=zsHiZaeA9e66aOOdqiBPE88/TqflE7LU59wq8cFTaI/Pzesdub0MA1gY/0aMpIALZSXw
	 rDuBq1f5PbHXtTIFmYo7/IvAsS2CTAgqKK6S/yNi9lREvp/BqtleUGfvaE+aasSCe5u3F
	 rLyuXegyh/8uIXteAWEg6mmnQXzb3PQA76jGdouVbYWMo7qXmH6uO9nauG8PjaB/Lkrbt
	 FLV7fHppOENmLvuACF+UoMrF9cO8GqeJ6Hr7Joo5Bht9H0FI1WLxRq5XmLl+POVoGdLHb
	 HoiXS1RYbjvH7BWUbpAIdhy6EL0IDy0OhpoVzU4VcXGkPC++TNCvBEDZDvTvQw7TdSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794075099;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=qxMkaNXijIcj2xvA+MMhwAbWtRFb58PpfLtuxFQZ9nE=;
	b=q2Du1yi5qEZ+6gIe2o/lAhLShpEpVVCImTL/1hsFvOERb1WVbiDHR3yyU5k7boQqIUk8
	 a/7Ltrr2ndUqryXDDO9v+QL6a7/eBmtH7BHpHe9Ys5x9SSD8iMzmCeeyJ6lS65TNpHXBE
	 ZuQXw0hnedq8Qr4FqAn9xbKHZVDAfZfzoWzf+GdaFAihee4IJCCvbPR78oR0ZU8mNUANv
	 ezD2XN+nOdbqPyaRZWRyStqvVNsQt4kfsshQcoiE4zrap7qAbC49XX1gVur3cvQirVUkY
	 kNMddkRGskPQ8GPHpGOGeREbr3tU7APlfUdVV8ZXwftxExK27MB7e06oQXSDXvI9vNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U6r5gCrY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EBDD606A326
	for <linux-sound@vger.kernel.org>; Sat,  7 Nov 2026 18:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U6r5gCrY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04DCD1F0089F;
	Sat,  7 Nov 2026 18:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794075099;
	bh=qxMkaNXijIcj2xvA+MMhwAbWtRFb58PpfLtuxFQZ9nE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=U6r5gCrY1NTrnCqCT7svQw4On7OzCKBghtSMhUCCkASGNxwOuNL3aaUoxkNXHQ4tW
	 VAs6O4DAGJA7M0a1Rqx0KFElJ0lk9/kIgR7RsHUJwozA9jUCVem70CMxA0Y1YlfKp+
	 snnhLBcsV9vmIkj7KL3zIuI2ygaRSET8yds5PxtiUw7bfJlRiC9sYNx38Lr6RWv+1S
	 /sPSH3faLdzogSgNtwqoh5w/xESHI02iDFSqdKxsjgQfNL08KveJs9v+vcOku4a8kh
	 3d/m0HbqNPyzNVs8aXzFf/5QAoWI98TKmh/qwwepCK3HY9UORO8szf801ZCREWfOC/
	 lEfpP6XP/Suxg==
Message-ID: <sashiko-outbox-203155@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/4] ASoC: SOF: amd: guard adata->sdw dereferences with
 NULL check in IRQ handler
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vijendar Mukunda" <Vijendar.Mukunda@amd.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261107175339.3547918-3-Vijendar.Mukunda@amd.com>
References: <20261107175339.3547918-1-Vijendar.Mukunda@amd.com>
 <20261107175339.3547918-3-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 18:11:38 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] ASoC: SOF: amd: NULL dereference of adata->sdw->pdev[i] in
  acp_irq_handler()
- [Low] ASoC: SOF: amd: inaccurate teardown claim and missing Fixes tag
It also noticed 1 related pre-existing issue this patch does not
introduce:
- [Medium] soundwire: amd: memory and platform device leaks in
  sdw_amd_probe() [1]
--

commit 920e1ff1deb60367eb67bae9d4d4b5880a64d07f
Author: Vijendar Mukunda <Vijendar.Mukunda@amd.com>

> ASoC: SOF: amd: guard adata->sdw dereferences with NULL check in IRQ hand=
ler
>
> The ACP external IRQ handler is registered before sdw_amd_probe() assigns
> adata->sdw, so a stray interrupt in the probe window could reach the
> adata->sdw->pdev[i] dereference with adata->sdw still NULL.
>
> The same window exists on the teardown side: after sdw_amd_exit() frees
> the context but before adata->sdw is cleared by the caller.
>
> Add NULL checks for adata->sdw in acp_irq_handler() before dereferencing
> ->pdev[0] and ->pdev[1], and in amd_sof_handle_acp70_sdw_wake_event() for
> the same reason.  The interrupt-status register write that acknowledges t=
he
> IRQ is kept outside the guard so the hardware bit is always cleared
> regardless of whether the SoundWire context is live.
>
> Fixes: 96eb81851012 ("ASoC: SOF: amd: add interrupt handling for SoundWir=
e manager devices")
> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>

[Severity: Low]
Is the teardown window description in the second paragraph accurate?  In
amd_sof_sdw_exit(), sdw_amd_exit(acp_data->sdw) frees the context before
acp_data->sdw =3D NULL runs, so adata->sdw is still non-NULL during that
interval and an if (adata->sdw) check cannot guard it; teardown is safe
instead because callers invoke free_irq(sdev->ipc_irq, sdev) before calling
amd_sof_sdw_exit().

Also, since the unguarded adata->sdw dereferences in
amd_sof_handle_acp70_sdw_wake_event() were introduced by a later commit,
should this include:

  Fixes: 1f41bf67bfe3 ("ASoC: SOF: amd: add soundwire wake irq handling")

> diff --git a/sound/soc/sof/amd/acp.c b/sound/soc/sof/amd/acp.c
> index 86e2402b8ffd2..623e016f38b83 100644
> --- a/sound/soc/sof/amd/acp.c
> +++ b/sound/soc/sof/amd/acp.c
> @@ -478,16 +478,20 @@ static void amd_sof_handle_acp70_sdw_wake_event(str=
uct acp_dev_data *adata)
>  	struct amd_sdw_manager *amd_manager;
> =20
>  	if (adata->acp70_sdw0_wake_event) {
> -		amd_manager =3D dev_get_drvdata(&adata->sdw->pdev[0]->dev);
> -		if (amd_manager)
> -			pm_request_resume(amd_manager->dev);
> +		if (adata->sdw) {
> +			amd_manager =3D dev_get_drvdata(&adata->sdw->pdev[0]->dev);
> +			if (amd_manager)
> +				pm_request_resume(amd_manager->dev);
> +		}
>  		adata->acp70_sdw0_wake_event =3D 0;
>  	}
> =20
>  	if (adata->acp70_sdw1_wake_event) {
> -		amd_manager =3D dev_get_drvdata(&adata->sdw->pdev[1]->dev);
> -		if (amd_manager)
> -			pm_request_resume(amd_manager->dev);
> +		if (adata->sdw) {
> +			amd_manager =3D dev_get_drvdata(&adata->sdw->pdev[1]->dev);
> +			if (amd_manager)
> +				pm_request_resume(amd_manager->dev);
> +		}
>  		adata->acp70_sdw1_wake_event =3D 0;
>  	}
>  }
> @@ -579,10 +583,12 @@ static irqreturn_t acp_irq_handler(int irq, void *d=
ev_id)
> =20
>  	val =3D snd_sof_dsp_read(sdev, ACP_DSP_BAR, desc->ext_intr_stat);
>  	if (val & ACP_SDW0_IRQ_MASK) {
> -		amd_manager =3D dev_get_drvdata(&adata->sdw->pdev[0]->dev);
>  		snd_sof_dsp_write(sdev, ACP_DSP_BAR, desc->ext_intr_stat, ACP_SDW0_IRQ=
_MASK);
> -		if (amd_manager)
> -			schedule_work(&amd_manager->amd_sdw_irq_thread);
> +		if (adata->sdw) {
> +			amd_manager =3D dev_get_drvdata(&adata->sdw->pdev[0]->dev);
> +			if (amd_manager)
> +				schedule_work(&amd_manager->amd_sdw_irq_thread);
> +		}
>  		irq_flag =3D 1;
>  	}
> =20
> @@ -608,11 +614,13 @@ static irqreturn_t acp_irq_handler(int irq, void *d=
ev_id)
>  	if (desc->ext_intr_stat1) {
>  		val =3D snd_sof_dsp_read(sdev, ACP_DSP_BAR, desc->ext_intr_stat1);
>  		if (val & ACP_SDW1_IRQ_MASK) {
> -			amd_manager =3D dev_get_drvdata(&adata->sdw->pdev[1]->dev);
>  			snd_sof_dsp_write(sdev, ACP_DSP_BAR, desc->ext_intr_stat1,
>  					  ACP_SDW1_IRQ_MASK);
> -			if (amd_manager)
> -				schedule_work(&amd_manager->amd_sdw_irq_thread);
> +			if (adata->sdw) {
> +				amd_manager =3D dev_get_drvdata(&adata->sdw->pdev[1]->dev);
> +				if (amd_manager)
> +					schedule_work(&amd_manager->amd_sdw_irq_thread);
> +			}
>  			irq_flag =3D 1;
>  		}

[Severity: Medium]
Can adata->sdw->pdev[0] or adata->sdw->pdev[1] still be NULL here when
adata->sdw is non-NULL?

In sdw_amd_probe_controller(), ctx->pdev[index] is only populated for links
set in link_mask:

drivers/soundwire/amd_init.c:sdw_amd_probe_controller() {
	...
	for (index =3D 0; index < count; index++) {
		if (!(link_mask & BIT(index)))
			continue;
		...
		ctx->pdev[index] =3D platform_device_register_full(&pdevinfo[index]);
	...
}

On single-link configurations where only one SoundWire manager is active,
the unused link's pdev[i] remains NULL while adata->sdw is non-NULL.
Passing &adata->sdw->pdev[i]->dev to dev_get_drvdata() on a stray interrupt
or wake event for the unpopulated link will cause a NULL pointer dereference
in hard IRQ context, unlike the sibling ACP7x handlers in this file (such
as sof_acp7x_handle_sdw_manager_irq()) which check adata->sdw->pdev[instanc=
e]
before calling dev_get_drvdata().

[Severity: Medium]
This problem wasn't introduced by this patch, but in the same SoundWire
probe path [1], does a failure in sdw_amd_startup() leak the
sdw_amd_ctx memory and platform devices allocated by
sdw_amd_probe_controller(), as well as adata->dmic_dev in
amd_sof_acp_probe()?

drivers/soundwire/amd_init.c:sdw_amd_probe() {
	*sdw_ctx =3D sdw_amd_probe_controller(res);
	if (!*sdw_ctx)
		return -ENODEV;

	return sdw_amd_startup(*sdw_ctx);
}

sound/soc/sof/amd/acp.c:amd_sof_acp_probe() {
	...
	adata->dmic_dev =3D platform_device_register_data(sdev->dev, "dmic-codec",
							PLATFORM_DEVID_NONE, NULL, 0);
	...
	ret =3D amd_sof_sdw_probe(sdev);
	if (ret < 0) {
		dev_err(sdev->dev, "error: SoundWire probe error\n");
		free_irq(sdev->ipc_irq, sdev);
		return ret;
	}
	...
unregister_dev:
	platform_device_unregister(adata->dmic_dev);
	return ret;
}

When sdw_amd_startup() fails, sdw_amd_probe() returns without unregistering
the ctx->pdev[index] devices or freeing ctx, and amd_sof_acp_probe()
returns directly after free_irq() instead of jumping to unregister_dev to
unregister adata->dmic_dev.

[1] https://sashiko.dev/#/bug/linux-3af16781-2451-4877-8594-c12800a7bba5

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261107175339.3547=
918-1-Vijendar.Mukunda@amd.com?part=3D2
