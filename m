Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794068051;
	b=Mr9ezSkX5TAskPKBwo8idqL2o51lVY2kHkRrqQjH/KX0y3SZ2DZoVK1Dm+ze39deu7HX
	 Aa2rSgLEh/S/iVDBI3qNjoBfZ0ChtDB6Gi8+kDkxbDMvKa3UO8VfbO+GpOoOYUlTjvcK+
	 EMEP/wo29+zihFZpgkq124PfJcs6TNUBv2A+/Fm1jDvEk1M3fiByn5CIORBDmMywm2iLx
	 kpDnmY5UxFKrJp+pZ60ohBAIbGTpTk8dsxlCMj6SEvwmnwd5nkQnfT+mKLp1v53rS6Vcu
	 jbyFCcME5rrKhLEM4OF1coXxz/LsoEM8FAv76U7Kwoby046MMw6uAw0mxRwgVc5i/ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794068051;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ohlwrW7fhYtVFxHxgwQuoXABkk5JLfgaRXMHjELjpxA=;
	b=LKzKELUcl0xgTCl2ndIBDu6iIg4XbduygRfiwfzrEENw7SL3MRmsrPIX0eWm7s/YcE+e
	 sDiYQhGgJO31pcOFkCogKQgn4dnDjVL3/CMFm0uUud0Y3IXAMtDSnJwzyARaTl2qMuFnL
	 LUp3DxMRARz7Sd+xVSef/kpr9CELzGn07HpIXatJQdGSp25VxTXSn9RmqCeWEb7xHQXAM
	 Y/tvWJrBk+nxVOin5a0DaMF4G0Ck8ekxhc71zUHqR3TxUNwtap3BdbuRNtp8e97GGr+z+
	 xudby85ckqF9sGXcZl/RUzztQ1CUgPQZV9c6HQaQ3mjt0H8eGxgYn7AbjmtjdMrADQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="USKnzk/s";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B4AC606A32D
	for <linux-sound@vger.kernel.org>; Sat,  7 Nov 2026 16:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=USKnzk/s
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DF9C1F0089F;
	Sat,  7 Nov 2026 16:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794068051;
	bh=ohlwrW7fhYtVFxHxgwQuoXABkk5JLfgaRXMHjELjpxA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=USKnzk/sIufWBREMGhIf3qC5pGZDeWtfkRHXUIpQ8l2PtT+UlfyOnTlW5La897uig
	 j8u21AE2dlVQYHqH9NKrgPKD476PSLWZ1GpN7sn682wYMQDVA/3E0VZNDqJzg4a9pb
	 teZmzA6FH0WI3Gol2DGKTdfnO+1ZKq4jz2rLh8lvXAcRJU9Fh4HxJ7b80xGCD/CNUm
	 sLhsp7cHlO8EKC7DXo3h0xVN2427tEJfmCbdixIp1JaYjw87sOlexKs4Gp2QyoAPsl
	 853OQzJs+uJZB4a+tVzoXNJcBxwwRDwvHLXzQZ4hyzRfsqoPltzFUDXrkjesezsHhw
	 No7TSDW2aBrDQ==
Message-ID: <sashiko-outbox-203033@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 14/25] soundwire: amd: fix work drain ordering in
 remove path
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vijendar Mukunda" <Vijendar.Mukunda@amd.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261107154659.3358223-15-Vijendar.Mukunda@amd.com>
References: <20261107154659.3358223-1-Vijendar.Mukunda@amd.com>
 <20261107154659.3358223-15-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 16:14:10 +0000
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
- [High] soundwire: amd: race with in-flight IRQ handler in
  amd_sdw_manager_remove()
--

commit 96eb0e85d023d4d06d5fe26f4e91328e3104ebef
Author: Vijendar Mukunda <Vijendar.Mukunda@amd.com>

soundwire: amd: fix work drain ordering in remove path

This commit reorders work cancellation in amd_sdw_manager_remove() to disab=
le
SoundWire interrupts first and then cancel amd_sdw_irq_thread and amd_sdw_w=
ork.

> diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_mana=
ger.c
> index 767bc5510dfef..4083a3f0ec2f8 100644
> --- a/drivers/soundwire/amd_manager.c
> +++ b/drivers/soundwire/amd_manager.c
> @@ -1278,8 +1278,9 @@ static void amd_sdw_manager_remove(struct platform_=
device *pdev)
>  	int ret;
> =20
>  	pm_runtime_disable(&pdev->dev);
> -	cancel_work_sync(&amd_manager->amd_sdw_work);
>  	amd_disable_sdw_interrupts(amd_manager);
> +	cancel_work_sync(&amd_manager->amd_sdw_irq_thread);
> +	cancel_work_sync(&amd_manager->amd_sdw_work);
>  	sdw_bus_master_delete(&amd_manager->bus);
>  	ret =3D amd_disable_sdw_manager(amd_manager);
>  	if (ret)

[Severity: High]
Can an in-flight parent ACP interrupt handler still queue amd_sdw_irq_thread
after cancel_work_sync() returns?

Unlike disable_work_sync(), cancel_work_sync() only drains work that is
already queued or running and leaves the work item enabled before returning.
Without synchronize_irq() or disable_work_sync(), an interrupt asserted just
before amd_disable_sdw_interrupts() masks ACP_EXTERNAL_INTR_CNTL can already
be running acp63_irq_handler() on another CPU:

sound/soc/amd/ps/pci-ps.c:acp63_irq_handler() {
	...
	if (ext_intr_stat & ACP_SDW0_STAT) {
		writel(ACP_SDW0_STAT, adata->acp63_base + ACP_EXTERNAL_INTR_STAT);
		amd_manager =3D dev_get_drvdata(&adata->sdw->pdev[0]->dev);
		if (amd_manager)
			schedule_work(&amd_manager->amd_sdw_irq_thread);
	...
}

This allows schedule_work() to run after both cancel_work_sync() calls fini=
sh:

CPU0                                      CPU1 (<hardirq>)
amd_sdw_manager_remove()                  acp63_irq_handler()
                                            readl(... + ACP_EXTERNAL_INTR_S=
TAT)
                                            amd_manager =3D dev_get_drvdata=
(...)
  amd_disable_sdw_interrupts()
  cancel_work_sync(&...->amd_sdw_irq_thread)
  cancel_work_sync(&...->amd_sdw_work)
                                            schedule_work(&...->amd_sdw_irq=
_thread)
  sdw_bus_master_delete(&amd_manager->bus)
  ...
  devres_release_all()
                                          amd_sdw_irq_thread()
                                            readl(amd_manager->mmio + ...)
                                              <-- use-after-free

Even with commit "soundwire: amd: use interrupt_enabled flag to guard IRQ
work scheduling" later in this series, interrupt_enabled is only checked
inside amd_sdw_irq_thread() before queueing amd_sdw_work, so the hardirq
handler still schedules amd_sdw_irq_thread unconditionally.

Also, because amd_disable_sdw_interrupts() now runs before
cancel_work_sync(&amd_manager->amd_sdw_work), an already running
amd_sdw_update_slave_status_work() with status[0] =3D=3D SDW_SLAVE_ATTACHED=
 can
write AMD_SDW_IRQ_MASK_0TO7 and AMD_SDW_IRQ_MASK_8TO11 back to
ACP_SW_STATE_CHANGE_STATUS_MASK_0TO7 and ACP_SW_STATE_CHANGE_STATUS_MASK_8T=
O11,
overwriting the 0x00 masks written by amd_disable_sdw_interrupts().

Using disable_work_sync() instead of cancel_work_sync() (or synchronizing w=
ith
the parent IRQ after masking) and masking the state-change registers after =
the
work items are drained would prevent both races.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261107154659.3358=
223-1-Vijendar.Mukunda@amd.com?part=3D14
