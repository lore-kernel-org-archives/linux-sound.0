Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794901046;
	b=JeANFVTJV77dXKgYx+AY1YnbxBggC/lQa1e9a0G84yhxe+Y/4RDivBKHrY+YcY3wNVJt
	 f+5reI/z6xHgEYknlXVgEGWdXzG+GaGRH9nuOxADmC8usm+SRFh11kGC8XjtROLKalbO5
	 DHfcW3UrOn1qC3oGoihDiOW1GuOAi2269OuhRRXy1k37nGgQgpO8wV9ahuQJhX9TLTbkV
	 mSrOt6jVSrDIj8w+j8SNkOevZSx1Grtv7azAx4D8ydxnZqfphguar+oVp5tLSKoHk8/jp
	 nScrzYhAqcCXhSXiepEipMYzmWIQTAEJ7u0NDhBdSVfFtUyypp9SC8ad2tdlpUBNwRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794901046;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=li5clM3wOfPPCdSbLxXwtQ3UUNdOZuoXkL+wFYuMuZs=;
	b=maHDEcHyB2PHR4knS2GlS+GL86GldEFeTtCZ07viqqmy1T3HIcMuDwM2PO6K5z1KJmKf
	 NKPE2UVDnCrZ8+95qrvLrgSj7JrJ/UDiOHJdXeyBANRzXVLhNeJSjUAIhi4IW2+AHmnj2
	 /MZd0UMZgyIc36KXOzNq8qSESVV4NcvUeGa62G5Gdu1T9+UTPrAn/IOnbatCinoC+eAtu
	 HuXWDUjioBrwpFYO4dUdl0P9DlFg6VkgYioI7kVe9rB3qUVQ2ziIXWbUL3ygxeU9XYxRP
	 1K3FFtXRd4DZI1uP5jr7eTMnKsp9IMERvLrabXpcThgYaCvak/EQhfNnb+g54Au5w/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G843luBc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E12606A31C
	for <linux-sound@vger.kernel.org>; Tue, 17 Nov 2026 07:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G843luBc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 377F11F000C4;
	Tue, 17 Nov 2026 07:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794901046;
	bh=li5clM3wOfPPCdSbLxXwtQ3UUNdOZuoXkL+wFYuMuZs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=G843luBcmf0RNKMh67ARfVtu2Yng+lb5V33BT28fMEBddjiT/UG4jHJxHHWoRJyLh
	 3z3aIftN/Mtly7uIaDrGn16+R84eb5Bbg7J4t2vtuvDr09N2qM54zuXxhZBRPzq/D+
	 ZZhyAiNJzseF1KZZ04incnkXEuWn1oAM2H15mJYkVy8Lzm5/z65lNA24zkM7vMIZlO
	 PKmr9f2h6DY7IdV6Qemi3zgq7U5fdk6ylwc/DFqn89c9PucoDXLnP6UgtL5UZb80Pv
	 dLUgkVNLi9JJEK7AHOEa/KkNZZblFT0JO0vMbMocj3e/52br8EobWaPUNE5zZNQWe1
	 fvfBYtwZCGrKQ==
Message-ID: <sashiko-outbox-218362@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 15/23] soundwire: amd: use interrupt_enabled flag to
 guard IRQ work scheduling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vijendar Mukunda" <Vijendar.Mukunda@amd.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261117070906.803139-16-Vijendar.Mukunda@amd.com>
References: <20261117070906.803139-1-Vijendar.Mukunda@amd.com>
 <20261117070906.803139-16-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 07:37:25 +0000
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
- [Medium] soundwire: amd: race with in-flight IRQ queuing
  amd_sdw_irq_thread
- [Medium] soundwire: amd: race re-enabling IRQ masks in
  amd_disable_sdw_interrupts()
--

commit 14261a7c7d9c5975a602a89ef71b261091c3414b
Author: Vijendar Mukunda <Vijendar.Mukunda@amd.com>

soundwire: amd: use interrupt_enabled flag to guard IRQ work scheduling

This commit adds an interrupt_enabled flag to struct amd_sdw_manager to
prevent queued amd_sdw_irq_thread work items from running after interrupts
are disabled.

> diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_mana=
ger.c
> index f3e9614b9ac82..5536a4fd137aa 100644
> --- a/drivers/soundwire/amd_manager.c
> +++ b/drivers/soundwire/amd_manager.c
[ ... ]
> @@ -135,6 +136,18 @@ static void amd_disable_sdw_interrupts(struct amd_sd=
w_manager *amd_manager)
>  {
>  	u32 irq_mask;
> =20
> +	/*
> +	 * Clear the flag before updating hardware masks. Work items already
> +	 * queued but not yet started will see the flag false at entry and
> +	 * return early; work items already running will complete their current
> +	 * invocation. Callers that need to ensure no instance of
> +	 * amd_sdw_irq_thread() is executing on return must follow this call
> +	 * with cancel_work_sync(&amd_manager->amd_sdw_irq_thread). Once the
> +	 * mask registers are written, the ACP hardware will not assert any new
> +	 * SDW interrupt.
> +	 */
> +	WRITE_ONCE(amd_manager->interrupt_enabled, false);
> +
>  	mutex_lock(amd_manager->acp_sdw_lock);
>  	irq_mask =3D sdw_manager_reg_mask_array[amd_manager->instance];
>  	amd_updatel(amd_manager->acp_mmio, ACP_EXTERNAL_INTR_CNTL(amd_manager->=
instance),

[Severity: Medium]
Can an in-flight parent PCI IRQ handler still queue amd_sdw_irq_thread after
amd_disable_sdw_interrupts() and cancel_work_sync() have returned?

The parent PCI hard IRQ handlers (such as acp63_irq_handler() in
sound/soc/amd/ps/pci-ps.c and acp_irq_handler() in sound/soc/sof/amd/acp.c)
call schedule_work(&amd_manager->amd_sdw_irq_thread) without synchronizing
with amd_disable_sdw_interrupts():

sound/soc/amd/ps/pci-ps.c:acp63_irq_handler() {
    ...
		if (adata->sdw) {
			amd_manager =3D dev_get_drvdata(&adata->sdw->pdev[0]->dev);
			if (amd_manager)
				schedule_work(&amd_manager->amd_sdw_irq_thread);
		}
    ...
}

If the interrupt fires just before ACP_EXTERNAL_INTR_CNTL is masked, the ha=
rd
IRQ handler on another CPU can schedule the work after cancel_work_sync()
completes:

CPU0                                  CPU1 (<hardirq>)
amd_sdw_manager_remove()              acp63_irq_handler()
  amd_disable_sdw_interrupts()
    interrupt_enabled =3D false
    mask ACP_EXTERNAL_INTR_CNTL
  cancel_work_sync(
    &amd_manager->amd_sdw_irq_thread)
                                        schedule_work(
                                          &amd_manager->amd_sdw_irq_thread)
  devres frees amd_manager
                                      amd_sdw_irq_thread()
                                        READ_ONCE(
                                          amd_manager->interrupt_enabled)
                                          <-- use-after-free

During amd_suspend() (in AMD_SDW_CLK_STOP_MODE) and amd_suspend_runtime()
(in AMD_SDW_CLK_STOP_MODE or ACP6.3 AMD_SDW_POWER_OFF_MODE), interrupt_enab=
led
is set back to true before suspend finishes, so a work item queued by an
in-flight hard IRQ handler after cancel_work_sync() sees
interrupt_enabled =3D=3D true and accesses SoundWire MMIO registers while t=
he
manager is clock-stopped or powered down.

Using disable_work_sync(&amd_manager->amd_sdw_irq_thread) when disabling
interrupts and enable_work() when re-enabling them (or synchronizing with t=
he
parent IRQ) would prevent late scheduling.

[ ... ]

> @@ -1481,6 +1497,7 @@ static int __maybe_unused amd_suspend_runtime(struc=
t device *dev)
>  				return ret;
>  		} else if ((amd_manager->acp_rev =3D=3D ACP63_PCI_REV_ID) &&
>  			   amd_manager->wake_en_mask) {
> +			WRITE_ONCE(amd_manager->interrupt_enabled, true);
>  			mutex_lock(amd_manager->acp_sdw_lock);
>  			val =3D sdw_manager_reg_mask_array[amd_manager->instance];
>  			amd_updatel(amd_manager->acp_mmio,

[Severity: Medium]
Can an in-flight amd_sdw_update_slave_status_work() overwrite the zeroed
interrupt masks during amd_disable_sdw_interrupts() and leave non-wake
interrupts unmasked in runtime suspend?

amd_disable_sdw_interrupts() zeroes ACP_SW_STATE_CHANGE_STATUS_MASK_0TO7 and
ACP_SW_STATE_CHANGE_STATUS_MASK_8TO11 before callers drain amd_sdw_work with
cancel_work_sync(&amd_manager->amd_sdw_work).  Meanwhile,
amd_sdw_update_slave_status_work() unconditionally writes AMD_SDW_IRQ_MASK_=
0TO7
and AMD_SDW_IRQ_MASK_8TO11 back to those registers without checking
interrupt_enabled:

drivers/soundwire/amd_manager.c:amd_sdw_update_slave_status_work() {
    ...
	if (amd_manager->status[0] =3D=3D SDW_SLAVE_ATTACHED) {
		if (retry_count++ < SDW_MAX_DEVICES) {
			writel(AMD_SDW_IRQ_MASK_0TO7, amd_manager->mmio +
			       ACP_SW_STATE_CHANGE_STATUS_MASK_0TO7);
			writel(AMD_SDW_IRQ_MASK_8TO11, amd_manager->mmio +
			       ACP_SW_STATE_CHANGE_STATUS_MASK_8TO11);
    ...
}

In amd_suspend_runtime() under AMD_SDW_POWER_OFF_MODE, that race leaves
state-change interrupts enabled while the manager is powered off:

CPU0                                  CPU1 (kworker)
amd_suspend_runtime()                 amd_sdw_update_slave_status_work()
  ...
  amd_disable_sdw_interrupts()
    interrupt_enabled =3D false
    writel(0, ..._MASK_0TO7)
    writel(0, ..._MASK_8TO11)
                                        writel(AMD_SDW_IRQ_MASK_0TO7,
                                               ..._MASK_0TO7)
                                        writel(AMD_SDW_IRQ_MASK_8TO11,
                                               ..._MASK_8TO11)
  cancel_work_sync(&amd_sdw_work)
  amd_sdw_wake_enable(..., true)
    /* RMW preserves MASK_8TO11 */
  interrupt_enabled =3D true
  unmask ACP_EXTERNAL_INTR_CNTL       <-- non-wake IRQs remain unmasked

Draining amd_sdw_irq_thread and amd_sdw_work (or checking interrupt_enabled=
 in
amd_sdw_update_slave_status_work()) before clearing the mask registers in
amd_disable_sdw_interrupts() would avoid re-arming those masks.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117070906.8031=
39-1-Vijendar.Mukunda@amd.com?part=3D15
