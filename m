Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794900604;
	b=H5xLYo0KL/S11dwNHgDiOSJtFYuRQ9w/lt2QZiyDVZMdBjdo5qDfpXcn08LYoxUYdNWl
	 +ROHZciiI1FIkA7t7eptB7d8yWEx1jLIJURXm3XcjukjjxctEhAwYS/1pky2ZDK0ckboY
	 sPNOUaAUuaoRXM8+nq3kKtpe7bpNGJgXywaiifctnkN1q5LhnGkgEWkDIw0gh8gYxIHMK
	 Yb47Y+7HKrFEzdT/FkQAqSjQddF7gknc/jmZcuWev5JTCNAyZd+ls5td+FtaZfwc1yNpZ
	 8ZGa/hyBw0eovhnyulAPPDlUtM89r1ToRPZx/+YBTm3jBC4o7kJdfUmBFk4gdWuyfYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794900604;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=+T8zUQcWkEnPqvggB2ucqmx5kFxXNjNMX7HT4P5U4YE=;
	b=Nm5V8tTjSN3MP9v4XEyslfL0Q0kDY75QIJIvKY3upKBXimMt2cdmORHzM5IM/E9zUZjj
	 /73FJ4GhPXoRMxMiUNZuierACCDOzKtfvGq+kgAQIaiT7cR4fqbgZREblsSwLTxYp6TH+
	 EUNRow9oiAUCle/YjLbyxxU8ndDfdfScNmkr/lXd4A23TFi7p+m+ShVng9yrWz0NISOGx
	 xycHbiESXlBaTYaXSAEA2whahb7cJkABimh8CVYTftXnp5wyYnlsqS37KmKXWfWNZL8CR
	 S5Rc7vknMEEjEQ4/azMMmevN/36Hg0lO0YW9cE/icLs/bdZAyfuHctkLvz6vah9PBBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VAphIjLx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A62606A323
	for <linux-sound@vger.kernel.org>; Tue, 17 Nov 2026 07:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VAphIjLx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E13D41F000C4;
	Tue, 17 Nov 2026 07:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794900604;
	bh=+T8zUQcWkEnPqvggB2ucqmx5kFxXNjNMX7HT4P5U4YE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VAphIjLx02Rp1D9jq+L6mXV1Iqbe0w7Wzd8xku5eDe0/6G2EGqYLRCbpuVTLJy3UA
	 7FDcMJnfLubjYkWyAVuJRmVnuAOZI3QeEA4HdFKpt0rRQ9qmoJOaV4f9Jo2ddoeZ5F
	 51E1/3zOkV9o/YyRnNW02DmWB/E6ohJgV2BAymQ6yewDzIzZL5mZhyu8LECvG979z0
	 PjHV/4a8EYdTVmylABAJ23INxe7p6IHDLtx6b+FsPiq4mv+JClq4zKTAn6CSzOfMeU
	 ocVWuy/AXzVmWGj4N3ydYri3fWkR7O7n6AvF5L9XMaNmHJEWTF5EYZ5XTXqE79dOZg
	 znzqx8ktxtQRw==
Message-ID: <sashiko-outbox-218350@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 12/23] soundwire: amd: fix work drain ordering in
 remove path
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vijendar Mukunda" <Vijendar.Mukunda@amd.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261117070906.803139-13-Vijendar.Mukunda@amd.com>
References: <20261117070906.803139-1-Vijendar.Mukunda@amd.com>
 <20261117070906.803139-13-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 07:30:03 +0000
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
- [Medium] soundwire: amd: unsynchronized in-flight IRQ in
  amd_sdw_manager_remove()
--

commit 3506edf69d0fb093063647130bfc49c4745d7c81
Author: Vijendar Mukunda <Vijendar.Mukunda@amd.com>

soundwire: amd: fix work drain ordering in remove path

This commit masks SoundWire interrupts before cancelling amd_sdw_irq_thread
and amd_sdw_work in amd_sdw_manager_remove().

> diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_mana=
ger.c
> index 9715e2eb22498..44ef45ba943bc 100644
> --- a/drivers/soundwire/amd_manager.c
> +++ b/drivers/soundwire/amd_manager.c
> @@ -1265,8 +1265,9 @@ static void amd_sdw_manager_remove(struct platform_=
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

[Severity: Medium]
Can an in-flight parent hard IRQ handler queue amd_sdw_irq_thread after
cancel_work_sync() returns?

The commit message notes that an IRQ handler already in flight may still
queue amd_sdw_irq_thread and relies on cancel_work_sync() to drain it
without synchronize_irq().  However, cancel_work_sync() only cancels or
waits for work that is already pending or running when checked, and leaves
the work item enabled on return.  When the amd_sdw_manager platform device
is unbound via sysfs while the parent ACP PCI IRQ remains active, an IRQ
that fired just before amd_disable_sdw_interrupts() can still schedule the
work item after both cancel_work_sync() calls finish:

sound/soc/amd/ps/pci-ps.c:acp63_irq_handler() {
	...
	if (ext_intr_stat & ACP_SDW0_STAT) {
		writel(ACP_SDW0_STAT, adata->acp63_base + ACP_EXTERNAL_INTR_STAT);
		if (adata->sdw) {
			amd_manager =3D dev_get_drvdata(&adata->sdw->pdev[0]->dev);
			if (amd_manager)
				schedule_work(&amd_manager->amd_sdw_irq_thread);
		}
		irq_flag =3D 1;
	}
	...
}

CPU0                                    CPU1
amd_sdw_manager_remove()                acp63_irq_handler()
                                          ext_intr_stat & ACP_SDW0_STAT
                                          amd_manager =3D dev_get_drvdata(.=
..)
  amd_disable_sdw_interrupts()
  cancel_work_sync(...irq_thread)
  cancel_work_sync(...amd_sdw_work)
                                          schedule_work(...irq_thread)
  sdw_bus_master_delete()
  ...
devres_release_all()
  /* frees amd_manager */
                                        amd_sdw_irq_thread()
                                          readl(amd_manager->mmio + ...)
                                          <-- use-after-free

Even with commit "soundwire: amd: use interrupt_enabled flag to guard IRQ
work scheduling" later in the series, acp63_irq_handler() and
acp_irq_handler() still call schedule_work(&amd_manager->amd_sdw_irq_thread)
unconditionally.  Using disable_work_sync() in amd_sdw_manager_remove() (or
synchronizing with the parent IRQ after masking) would prevent the work
items from being queued again during teardown.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117070906.8031=
39-1-Vijendar.Mukunda@amd.com?part=3D12
