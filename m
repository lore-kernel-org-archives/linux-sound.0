Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793006855;
	b=OUIuLBLC7SXpmlsae6esK8ITICouk+JddeCT8ugmrIVRrVX9+thMTIIxEqhLhae39HcK
	 wE8+HHJbdyvQPIjuIbC4p12GcGJXCWvnbSD+FXd1lZ7xXDMf4X0MHmScvAkG2P6E/rqT/
	 WRg3nHVskKLkgitbQ/6JdbSR/54X7HQUNbxko96Sf0UMAU1f3NWngLGns0rk2IGwLJDyk
	 HtBROGmq/VyARek+bDtptysVV+rbSJ51ooClvm9kKeWj2Vpqu51wd+/dAFrSpIsrdeuXu
	 tZMT16wgiWp5VfEGRV5DUEnuzsN3v4ARGU/14dHLQLSMYRFoK5SAx9qaVQA0JCU+azQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793006855;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=SXB/Vkb3Pqx0FpsYZXDmfVnN32JA4T3ZzW6laxcE6uE=;
	b=uQeAAtg4lx+Oq8sz6JJYjVS9z7iCmCMyfS78m+eIk7ZaT6YGW0aqd7D4fVfwuzDvuBOQ
	 YDtwamT/NNIOvEmjhG9xtjHMkrSDCaUaIVwh7FxxR/SHXWanRY44rfr6PlNtTbFRGutei
	 KqylO7aPoyeI2VOO2llNjXrz2pw0oiXkTxCfzpuf9W5zCsKDVhlhuN3YqAILfOBIQDZvN
	 h5GmHL2SPmG0nSOegqRqfJYiEVg+oNIxdARJX/7GbXc5o4fDiWxKQV7yPwtK3Ri14v1at
	 H+b421ew7gosTQDThj078J9uFmlN86ni6cZcZXArZFZaHe+lW5UOy667qjl0hmZqxiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UUaJBbg0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B5DA606A31A
	for <linux-sound@vger.kernel.org>; Mon, 26 Oct 2026 09:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UUaJBbg0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED09A1F031E0;
	Mon, 26 Oct 2026 09:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793006855;
	bh=SXB/Vkb3Pqx0FpsYZXDmfVnN32JA4T3ZzW6laxcE6uE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UUaJBbg0mX9AtPwap+wa8wpwLMGL+yROH6ADErUaMxvgvJM+rvAxSL+4HFbtAkx7F
	 Ps5VtcwEGebGdvEONCb2WcPUKi3/4kmZskbFKKhXD4HA9HDo2nInS60DHhvDTLgxh7
	 eBUBPAkaEkS+WFOFBfQkb2TACJq8zmJmmdy8Ccb+TGkykeWhhVCePP3idq0dvI7qyx
	 Bbio5Sy+fwBWv7nf9n5IDEXrImRJjem/mN9hDZLSnhRAU5WT+KVRZlK/vINez24w/4
	 DXw0l4Mp19mWmL8fSjQq3xRvS3hJMRR+UemBc5AHr8jzttDimECpAtwYG0oXwP+H6s
	 se7bNxFsiKY7Q==
Message-ID: <sashiko-outbox-184787@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 05/13] soundwire: amd: fix work drain ordering in
 remove path
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vijendar Mukunda" <Vijendar.Mukunda@amd.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261026044507.2310694-6-Vijendar.Mukunda@amd.com>
References: <20261026044507.2310694-1-Vijendar.Mukunda@amd.com>
 <20261026044507.2310694-6-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 26 Oct 2026 09:27:34 +0000
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
- [High] soundwire: amd: race with in-flight IRQ handler in amd_sdw_manager=
_remove()
--

commit 25a684110adde4056bf6250565965402e67408ca
Author: Vijendar Mukunda <Vijendar.Mukunda@amd.com>

soundwire: amd: fix work drain ordering in remove path

This commit reorders work cancellation in amd_sdw_manager_remove() so that
interrupts are disabled before calling cancel_work_sync() on
amd_sdw_irq_thread and amd_sdw_work.

> diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_mana=
ger.c
> index 5e9d228d09d06..a82714cc2f6c4 100644
> --- a/drivers/soundwire/amd_manager.c
> +++ b/drivers/soundwire/amd_manager.c
> @@ -1169,8 +1169,9 @@ static void amd_sdw_manager_remove(struct platform_=
device *pdev)
>  	int ret;
> =20
>  	pm_runtime_disable(&pdev->dev);
> -	cancel_work_sync(&amd_manager->amd_sdw_work);
>  	amd_disable_sdw_interrupts(amd_manager);
> +	cancel_work_sync(&amd_manager->amd_sdw_irq_thread);
> +	cancel_work_sync(&amd_manager->amd_sdw_work);

[Severity: High]
Can an in-flight parent ACP IRQ handler still schedule amd_sdw_irq_thread
after cancel_work_sync() returns, causing a use-after-free of amd_manager
and its MMIO regions?

The commit message states:

  An IRQ handler already in flight may still queue amd_sdw_irq_thread, so
  cancel_work_sync() is used to drain both amd_sdw_irq_thread and any
  amd_sdw_work items it may have scheduled. This fully quiesces the driver
  workqueues, making synchronize_irq() unnecessary.

However, cancel_work_sync() only cancels a work item that is already
pending or waits for one that is currently executing at the moment
cancel_work_sync() checks it, and re-enables the work item before
returning. Unlike disable_work_sync(), it does not block future
schedule_work() calls, nor does it wait for an in-flight hardirq handler on
another CPU that has not yet called schedule_work().

In addition, amd_disable_sdw_interrupts() only clears the enable mask in
ACP_EXTERNAL_INTR_CNTL via a posted write without clearing already-latched
status bits in ACP_EXTERNAL_INTR_STAT:

drivers/soundwire/amd_manager.c:amd_disable_sdw_interrupts() {
	mutex_lock(amd_manager->acp_sdw_lock);
	irq_mask =3D sdw_manager_reg_mask_array[amd_manager->instance];
	amd_updatel(amd_manager->acp_mmio, ACP_EXTERNAL_INTR_CNTL(amd_manager->ins=
tance),
		    irq_mask, 0);
	mutex_unlock(amd_manager->acp_sdw_lock);
...
}

Meanwhile, the parent IRQ handlers such as acp63_irq_handler() in
sound/soc/amd/ps/pci-ps.c and acp_irq_handler() in sound/soc/sof/amd/acp.c
check ACP_EXTERNAL_INTR_STAT and call schedule_work():

sound/soc/amd/ps/pci-ps.c:acp63_irq_handler() {
...
	ext_intr_stat =3D readl(adata->acp63_base + ACP_EXTERNAL_INTR_STAT);
	if (ext_intr_stat & ACP_SDW0_STAT) {
		writel(ACP_SDW0_STAT, adata->acp63_base + ACP_EXTERNAL_INTR_STAT);
		amd_manager =3D dev_get_drvdata(&adata->sdw->pdev[0]->dev);
		if (amd_manager)
			schedule_work(&amd_manager->amd_sdw_irq_thread);
		irq_flag =3D 1;
	}
...
}

If acp63_irq_handler() or acp_irq_handler() is executing on CPU 1 during
device unbind, module unload, or probe error unwind, and has read
ACP_EXTERNAL_INTR_STAT and dev_get_drvdata() just before CPU 0 runs
amd_disable_sdw_interrupts() and both cancel_work_sync() calls, both
cancel_work_sync() calls will observe idle work items and return
immediately.

CPU 1 can then call schedule_work(&amd_manager->amd_sdw_irq_thread),
queuing amd_sdw_irq_thread (and subsequently amd_sdw_work) to run
concurrently with sdw_bus_master_delete(), amd_disable_sdw_manager(), and
the devres release of amd_manager and its ioremapped mmio/acp_mmio regions.

Should this use disable_work_sync() instead of cancel_work_sync() (or
synchronize with the parent IRQ after masking and clearing pending status)
so that an in-flight IRQ handler cannot re-queue the work after the drain
completes?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261026044507.2310=
694-1-Vijendar.Mukunda@amd.com?part=3D5
