Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793154064;
	b=AxW68jwrzZm5P2ZEpp61roT/R3PXIvDmG+0rPZka3CvTkgQHmNbQozkPUm7XLsYATypt
	 waHOWwoUXpAffMkQtgWnpBCLa8BFbh5hBnjxxvO0sD3y66p8FRKNRUaxJgOGm62FFbvE0
	 m7q8v6cS0+Jtf2ZHFcfYHchGk6UPVnDV8wm8NCKo7aQ2g/XFbPtCmsIx6pWR6Ds98vD6A
	 4571aEro7UtHEsTif3ZdMovk0+4brT5JR0QqfQygyJTluK257oI6wNjUs3r2iwK7pC2rU
	 qcPkVciuKMj7/gk5UfjCk2xl0fO9BHEeaz+aJMBLSdG3bPjstZa23SB4MYaEsKPjnig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793154064;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Q0cHOpTbc5RUIYYKCvB3YmXUhGKHSVntf8zg0JX8EWk=;
	b=CofYM6j7WjVvsr+pKkmVo9T0Qik3idjkpqEkcLdPCn5JePVmqyy7ntfIRZmqn3DqOVoj
	 f//dKgML+P7jDAa565G+rjaqo8bDQnOXGTY0V9kXw6qkHcTMLO4Z+7u+DE1lh+rQ4iqRj
	 OH+abqOWsUBg2VqI8LhIJtA39lqaR32Eqm7BIDNN253YytrXPuSfdCjm8G9iCxJW66sJs
	 ttFntw3iFlt5+t3XV6oZUPFnklyEjL5nnZMUPWcCySowpGchzcKm9Lsj2JRcL1n5xPqjV
	 rDBTjT0NgJeHFnp4fWUf6lV4K8pzs8gL32paUBPoqnasJXuXX0WTleetzBHs4oLY/0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RdSSEYzX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE39B606A31A
	for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 02:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RdSSEYzX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FBE01F01825;
	Wed, 28 Oct 2026 02:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793154063;
	bh=Q0cHOpTbc5RUIYYKCvB3YmXUhGKHSVntf8zg0JX8EWk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RdSSEYzXG7HJhydQ8rcp/TT0ABvQBl7YI8Z21jzbfQ6GifOI6pVgAueUdouq5CGFT
	 mm9BXwakVFwYSNSU5GPwAfgtnCYBjMLaIJT1bpG6jCSEEiirJkWpDVyj7/6oHpF03G
	 VbvtiAD21MFUAtiyGblHEJBPXb6qU9KK02+rdAH31F+feLj/QGDzN9STFUfMX2dq0y
	 AlsTACZiuKuUt1Kp7rL8frRh/IWxfoQWGtsKhNT3JC7PmnYhtKbUiSC2kxpeCglnYw
	 aGeXnFUCn2KOLODrdiFpEwgJAIcfC+y4RVXHjPCq0mKL10609mqnWFkFY2zraf2WDZ
	 6+klUoDp2qEmg==
Message-ID: <sashiko-outbox-187339@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 10/11] ASoC: amd: ps: harden the ACP interrupt path for
 ACP6x
Reply-To: sashiko-reviews@lists.linux.dev
To: "Corey Smith" <corsmith@gmail.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261028020552.35278-11-corsmith@gmail.com>
References: <20261028020552.35278-1-corsmith@gmail.com>
 <20261028020552.35278-11-corsmith@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 28 Oct 2026 02:21:02 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] ASoC: amd: ps: unacknowledged DMA IRQ and NULL sdw_data in acp63_i=
rq_handler()
- [High] ASoC: amd: ps: NULL sdw->pdev[i] dereference in acp63_irq_handler()
--

commit 00d5bef454b30567a1333bcc6ac7ae59904adf98
Author: Corey Smith <corsmith@gmail.com>

ASoC: amd: ps: harden the ACP interrupt path for ACP6x

This commit adds NULL checks for adata->sdw, adata->pdm_dev, and
adata->sdw_dma_dev in acp63_irq_handler(), and extends
check_and_handle_sdw_dma_irq() to handle ACP6X_PCI_REV and ACP6XR_PCI_REV.

> diff --git a/sound/soc/amd/ps/pci-ps.c b/sound/soc/amd/ps/pci-ps.c
> index 235cb1ef25f14..b06b399060288 100644
> --- a/sound/soc/amd/ps/pci-ps.c
> +++ b/sound/soc/amd/ps/pci-ps.c

[ ... ]

> @@ -209,18 +213,28 @@ static irqreturn_t acp63_irq_handler(int irq, void =
*dev_id)
>  	ext_intr_stat =3D readl(adata->acp63_base + ACP_EXTERNAL_INTR_STAT);
>  	if (ext_intr_stat & ACP_SDW0_STAT) {
>  		writel(ACP_SDW0_STAT, adata->acp63_base + ACP_EXTERNAL_INTR_STAT);
> -		amd_manager =3D dev_get_drvdata(&adata->sdw->pdev[0]->dev);
> -		if (amd_manager)
> -			schedule_work(&amd_manager->amd_sdw_irq_thread);
> +		/*
> +		 * The handler may run before the SoundWire manager devices
> +		 * have been created (shared IRQ lines can fire as soon as
> +		 * they are registered, and the ACP interrupts are enabled by
> +		 * acp_hw_init() before create_acp63_platform_devs() runs).
> +		 */
> +		if (adata->sdw) {
> +			amd_manager =3D dev_get_drvdata(&adata->sdw->pdev[0]->dev);
> +			if (amd_manager)
> +				schedule_work(&amd_manager->amd_sdw_irq_thread);
> +		}
>  		irq_flag =3D 1;
>  	}
> =20
>  	ext_intr_stat1 =3D readl(adata->acp63_base + ACP_EXTERNAL_INTR_STAT1);
>  	if (ext_intr_stat1 & ACP_SDW1_STAT) {
>  		writel(ACP_SDW1_STAT, adata->acp63_base + ACP_EXTERNAL_INTR_STAT1);
> -		amd_manager =3D dev_get_drvdata(&adata->sdw->pdev[1]->dev);
> -		if (amd_manager)
> -			schedule_work(&amd_manager->amd_sdw_irq_thread);
> +		if (adata->sdw) {
> +			amd_manager =3D dev_get_drvdata(&adata->sdw->pdev[1]->dev);
> +			if (amd_manager)
> +				schedule_work(&amd_manager->amd_sdw_irq_thread);
> +		}
>  		irq_flag =3D 1;
>  	}

[Severity: High]
Can adata->sdw->pdev[0] or adata->sdw->pdev[1] still be NULL here when
adata->sdw is non-NULL?

In drivers/soundwire/amd_init.c:sdw_amd_probe_controller(), ctx->pdev[index]
is only registered for links enabled in link_mask:

	for (index =3D 0; index < count; index++) {
		if (!(link_mask & BIT(index)))
			continue;
		...
		ctx->pdev[index] =3D platform_device_register_full(&pdevinfo[index]);

On single-link platforms where only one link is set in link_mask (for examp=
le,
link_mask =3D=3D BIT(0) where adata->sdw->pdev[1] remains NULL), if a pendi=
ng or
spurious ACP_SDW1_STAT or ACP_SDW0_STAT bit is set in ACP_EXTERNAL_INTR_STA=
T1
or ACP_EXTERNAL_INTR_STAT, acp63_irq_handler() will pass the adata->sdw che=
ck
and pass &adata->sdw->pdev[i]->dev to dev_get_drvdata(), dereferencing a NU=
LL
pdev[i] pointer in hard IRQ context.

Note that handle_acp70_sdw_wake_event() in sound/soc/amd/ps/pci-ps.c (called
from acp63_irq_handler() -> check_and_handle_acp70_sdw_wake_irq()) also
dereferences adata->sdw->pdev[0] and adata->sdw->pdev[1] without checking
adata->sdw or adata->sdw->pdev[i] first, whereas
handle_acp63_sdw_pme_event() in sound/soc/amd/ps/ps-common.c checks both
adata->sdw and adata->sdw->pdev[i]. Should both acp63_irq_handler() and
handle_acp70_sdw_wake_event() check adata->sdw->pdev[i] before calling
dev_get_drvdata()?

> @@ -237,16 +251,22 @@ static irqreturn_t acp63_irq_handler(int irq, void =
*dev_id)
>  		wake_irq_flag =3D check_and_handle_acp70_sdw_wake_irq(adata);
> =20
>  	if (ext_intr_stat & BIT(PDM_DMA_STAT)) {
> -		ps_pdm_data =3D dev_get_drvdata(&adata->pdm_dev->dev);
>  		writel(BIT(PDM_DMA_STAT), adata->acp63_base + ACP_EXTERNAL_INTR_STAT);
> -		if (ps_pdm_data->capture_stream)
> -			snd_pcm_period_elapsed(ps_pdm_data->capture_stream);
> +		if (adata->pdm_dev) {
> +			ps_pdm_data =3D dev_get_drvdata(&adata->pdm_dev->dev);
> +			if (ps_pdm_data && ps_pdm_data->capture_stream)
> +				snd_pcm_period_elapsed(ps_pdm_data->capture_stream);
> +		}
>  		irq_flag =3D 1;
>  	}
> =20
> -	sdw_dma_irq_flag =3D check_and_handle_sdw_dma_irq(adata, ext_intr_stat,=
 ext_intr_stat1);
> -	if (sdw_dma_irq_flag)
> -		return IRQ_WAKE_THREAD;
> +	/* The SoundWire DMA device may not exist yet during probe */
> +	if (adata->sdw_dma_dev) {
> +		sdw_dma_irq_flag =3D check_and_handle_sdw_dma_irq(adata, ext_intr_stat,
> +								ext_intr_stat1);
> +		if (sdw_dma_irq_flag)
> +			return IRQ_WAKE_THREAD;
> +	}

[Severity: High]
Does skipping check_and_handle_sdw_dma_irq() when adata->sdw_dma_dev is NULL
leave pending SoundWire DMA interrupt bits uncleared, and can waking the IRQ
thread as soon as adata->sdw_dma_dev is non-NULL dereference a NULL sdw_dat=
a?

Unlike the ACP_SDW0_STAT, ACP_SDW1_STAT, and BIT(PDM_DMA_STAT) branches abo=
ve,
which clear their status bits in ACP_EXTERNAL_INTR_STAT /
ACP_EXTERNAL_INTR_STAT1 before checking the device pointers, the writel()
calls that clear the SoundWire DMA interrupt status bits are inside
check_and_handle_sdw_dma_irq():

	if (ext_intr_stat & ACP63_SDW_DMA_IRQ_MASK) {
		for (index =3D ACP_AUDIO2_RX_THRESHOLD; index <=3D ACP_AUDIO0_TX_THRESHOL=
D; index++) {
			if (ext_intr_stat & BIT(index)) {
				writel(BIT(index), adata->acp63_base + ACP_EXTERNAL_INTR_STAT);

If a SoundWire DMA interrupt bit is pending while adata->sdw_dma_dev is NULL
(during snd_acp63_probe() before create_acp63_platform_devs(), or on a
PDM-only configuration), skipping check_and_handle_sdw_dma_irq() leaves the
hardware status bit asserted and returns IRQ_NONE on a shared level-trigger=
ed
PCI interrupt line, causing an unhandled interrupt storm.

Furthermore, in sound/soc/amd/ps/pci-ps.c:create_acp63_platform_devs():

	adata->sdw_dma_dev =3D platform_device_register_full(&pdevinfo);

adata->sdw_dma_dev becomes non-NULL before the amd_ps_sdw_dma driver
(acp63_sdw_platform_probe() in sound/soc/amd/ps/ps-sdw-dma.c, which may be =
in
a separate module) binds to the device and sets drvdata (or holds an ERR_PTR
if registration fails). Because this patch also adds ACP6X_PCI_REV and
ACP6XR_PCI_REV to check_and_handle_sdw_dma_irq(), an interrupt in that wind=
ow
returns IRQ_WAKE_THREAD and runs acp63_irq_thread() ->
acp63_sdw_dma_irq_thread() (or acp70_sdw_dma_irq_thread()) in
sound/soc/amd/ps/ps-common.c:

	sdw_data =3D dev_get_drvdata(&adata->sdw_dma_dev->dev);

	for (stream_id =3D 0; stream_id < ACP63_SDW0_DMA_MAX_STREAMS; stream_id++)=
 {
		if (adata->acp63_sdw0_dma_intr_stat[stream_id]) {
			if (sdw_data->acp63_sdw0_dma_stream[stream_id])
				snd_pcm_period_elapsed(sdw_data->acp63_sdw0_dma_stream[stream_id]);

which dereferences sdw_data without checking if it is NULL.

Should check_and_handle_sdw_dma_irq() always run to clear the hardware stat=
us
bits, and should acp63_sdw_dma_irq_thread() / acp70_sdw_dma_irq_thread() (or
acp63_irq_handler() before returning IRQ_WAKE_THREAD) verify that
adata->sdw_dma_dev and dev_get_drvdata(&adata->sdw_dma_dev->dev) are valid?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261028020552.3527=
8-1-corsmith@gmail.com?part=3D10
