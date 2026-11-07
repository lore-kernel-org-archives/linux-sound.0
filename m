Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794075181;
	b=HKa0Ge2USkyeY2rzKBza63lpa1nViPGRrNvKCXAvzUR/sbnX1bQljP49KHY0qDDBKCkR
	 V2g1R/gS29IUG0WeBiDs2W6Rjys+JYfqXcykxkTuqO1nc1CwKFC+0mN7lB02T0/tr1hL9
	 HS/zmX62HG22N4EqqtBdVQO9mmokXomFwIaF1r45FxqQqvB0zUHqx1EwF3AROLdI4TUnK
	 3N01ItXWDiPjfIax2i01g6WHOuSnkBPz04tFzm4s96ObX/Us3LBGCpydcLCTOSaQqZvTd
	 8BjpR785Ite7qsMzEahAmyxq5cDUjM+C07Bj1Ww7n/zCLKVAy5Np/29YHXDy4nazhtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794075181;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=7hx2fsmvWBJqrpYCDM3mywoi5nT/0Rn9MH8vdVf8jSA=;
	b=b9e79x27OZWIuQFi7mayMvEmdGc80ULvn43zUCzNBkMwrAp00cPJEMdy8clmQ0vPlvUV
	 vMaVys1NGkw9Sx1sRVfANeMImgOFnwIDVgHyllsYbUExZz+zEXz5FRYbrVaa8/LrbFG1C
	 jksRo3zcqoJ53kfpCNw0GSGa020tCpesMNxUmQpZalduyZNBhZKRPxHjeyBS3elOVFro9
	 LSrzwNnGMXcryK6e3J6U8ccWm5X34lQZUw/lvKUozCbhzdO5+3LpRFEZKJ6JdqjFIXZwl
	 f69gegjGYiEG4B5IAIBaW7yhFzLj3aO/XRiF0DBmROoYhq9vIHrEqkOV1jzn92wUvhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Nu/LWfuZ";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2423606A326
	for <linux-sound@vger.kernel.org>; Sat,  7 Nov 2026 18:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Nu/LWfuZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 657AC1F0089F;
	Sat,  7 Nov 2026 18:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794075180;
	bh=7hx2fsmvWBJqrpYCDM3mywoi5nT/0Rn9MH8vdVf8jSA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Nu/LWfuZbxwFUQz28RSc2AgrZmi4nYx/p1fprrbN+xRox6TZq7aI0t47eottFNgFY
	 6A6yJP9ZKmf9Z+FGpHYC40mL/xe2JSYm5x2uDgEk3feDxrdFo/AHYmL12t4KErXvE6
	 Kec3gTM9HxiD6jxzBj3hB1lNzQi62AOoW91e1CWwOxoYPuL7rjOOsmMHGo6PEozx30
	 56rML1f+5ymeTvvtor8Hym/WFnkzy4v0WJkClSufQCQ07m2yCXJ00IEkq2TA32Bnuz
	 3F/T+Yb5oGpWphBVyLA5FH5JIFNyYawFXuYqyFkDeNCEPv2vcsNBlz3qLQVpnfVbrI
	 VOMHMlKG+H90Q==
Message-ID: <sashiko-outbox-203159@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/4] ASoC: amd: ps: guard adata->sdw dereferences with
 NULL check in IRQ handler
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vijendar Mukunda" <Vijendar.Mukunda@amd.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261107175339.3547918-2-Vijendar.Mukunda@amd.com>
References: <20261107175339.3547918-1-Vijendar.Mukunda@amd.com>
 <20261107175339.3547918-2-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 18:12:59 +0000
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
- [Medium] ASoC: amd: ps: NULL deref of adata->sdw->pdev[i] on
  single-link SDW configs
- [Low] ASoC: amd: ps: inaccurate commit message teardown claim and
  Fixes tag
It also noticed 1 related pre-existing issue this patch does not
introduce:
- [Critical] soundwire: amd: use-after-free in amd_sdw_manager_remove()
  [1]
--

commit 929ea19624010c51ae72f2eb65f2e1a41edc5971
Author: Vijendar Mukunda <Vijendar.Mukunda@amd.com>

> ASoC: amd: ps: guard adata->sdw dereferences with NULL check in IRQ handl=
er
>
> The ACP external IRQ handler is registered before sdw_amd_probe() assigns
> adata->sdw, so a stray interrupt in the probe window could reach the
> adata->sdw->pdev[i] dereference with adata->sdw still NULL.
>
> The same window exists on the teardown side: after sdw_amd_exit() frees
> the context but before adata->sdw is cleared by the caller.
>
> Add NULL checks for adata->sdw in acp63_irq_handler() before dereferencing
> ->pdev[0] and ->pdev[1], and in handle_acp70_sdw_wake_event() for the same
> reason.  The interrupt-status register write that acknowledges the IRQ is
> kept outside the guard so the hardware bit is always cleared regardless of
> whether the SoundWire context is live.
>
> Fixes: e1cb350610ce ("ASoC: amd: ps: handle SoundWire interrupts in acp p=
ci driver")
> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>

[Severity: Low]
Is the teardown description and Fixes tag accurate here?

In amd_sdw_exit(), sdw_amd_exit(acp_data->sdw) frees the context while
acp_data->sdw is still non-NULL, and acp_data->sdw =3D NULL only runs after
sdw_amd_exit() returns, so an if (adata->sdw) check in that window would
see a dangling non-NULL pointer rather than NULL (snd_acp63_remove()
instead avoids this by calling acp_hw_disable_interrupts() and
devm_free_irq() before amd_sdw_exit()).

Also, e1cb350610ce ("ASoC: amd: ps: handle SoundWire interrupts in acp pci
driver") predates adata->sdw.  The adata->sdw dereferences in
acp63_irq_handler() were introduced by eaf825037d6d ("ASoC: amd: ps:
refactor acp child platform device creation code"), and
handle_acp70_sdw_wake_event() was added by 3898b189079c ("ASoC: amd: ps:
add soundwire wake interrupt handling").

> diff --git a/sound/soc/amd/ps/pci-ps.c b/sound/soc/amd/ps/pci-ps.c
> index b604db4942dd6..d0b66df101579 100644
> --- a/sound/soc/amd/ps/pci-ps.c
> +++ b/sound/soc/amd/ps/pci-ps.c
> @@ -26,16 +26,20 @@ static void handle_acp70_sdw_wake_event(struct acp63_=
dev_data *adata)
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
> @@ -209,18 +213,22 @@ static irqreturn_t acp63_irq_handler(int irq, void =
*dev_id)
>  	ext_intr_stat =3D readl(adata->acp63_base + ACP_EXTERNAL_INTR_STAT);
>  	if (ext_intr_stat & ACP_SDW0_STAT) {
>  		writel(ACP_SDW0_STAT, adata->acp63_base + ACP_EXTERNAL_INTR_STAT);
> -		amd_manager =3D dev_get_drvdata(&adata->sdw->pdev[0]->dev);
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

[Severity: Medium]
Can adata->sdw->pdev[0] or adata->sdw->pdev[1] still be NULL when
adata->sdw is non-NULL?

In sdw_amd_probe_controller(), ctx->pdev[index] is only registered for
links set in link_mask:

drivers/soundwire/amd_init.c:sdw_amd_probe_controller() {
    ...
	for (index =3D 0; index < count; index++) {
		if (!(link_mask & BIT(index)))
			continue;
    ...
		ctx->pdev[index] =3D platform_device_register_full(&pdevinfo[index]);
}

On single-link configurations (where link_mask is BIT(0) or BIT(1)),
adata->sdw is non-NULL while the unused link's pdev[i] remains NULL.  A
stray interrupt or wake event for that link in acp63_irq_handler() or
handle_acp70_sdw_wake_event() will then pass &adata->sdw->pdev[i]->dev to
dev_get_drvdata() and cause a NULL pointer dereference, as
acp70_enable_sdw_host_wake_interrupts() unmasks ACP70_SDW_HOST_WAKE_MASK
for both links whenever either link enables host wake.

Should these checks also verify adata->sdw->pdev[0] and
adata->sdw->pdev[1] (like handle_acp63_sdw_pme_event() does)?

[Severity: Critical]
This problem wasn't introduced by this patch, but can unbinding the child
SoundWire manager device race with acp63_irq_handler() and cause a
use-after-free of amd_manager [1]?

CPU0                                CPU1
acp63_irq_handler()
  amd_manager =3D dev_get_drvdata()
                                    amd_sdw_manager_remove()
                                      cancel_work_sync(...)
                                      amd_disable_sdw_interrupts()
                                    <driver core frees amd_manager>
  if (amd_manager)
    schedule_work(&amd_manager->amd_sdw_irq_thread);  <-- use-after-free

amd_sdw_manager_remove() masks SoundWire interrupts and cancels
amd_sdw_work, but does not synchronize with the parent ACP IRQ handler or
cancel amd_sdw_irq_thread before devres frees amd_manager.  If
acp63_irq_handler() reads amd_manager before removal finishes and calls
schedule_work() afterwards, it queues work on the freed amd_manager.

[1] https://sashiko.dev/#/bug/linux-ab458b2e-f505-4a41-8238-a93ceb5d9c77

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261107175339.3547=
918-1-Vijendar.Mukunda@amd.com?part=3D1
