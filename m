Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794068753;
	b=SETRA1UhkxEgx+vE+vudD2KpUE+hzRTJaSgAYnEGwjaK1ZKy7/7qUPLogFUKi3bpF4Jm
	 CH3P+C5OJ4WTe4A71FPSmStIeDisrrGstxc6ZmK+iPl+ROPsmPN43Lbilmxf1b1Nb4dWP
	 JAIIKO6lTi61iFmXcEk3ZAfsqWkLzzyKswIeJ7bFGxzoxDK0+2BAYA87gNmz0f4M4UEJV
	 otm0ZEl92AjSANxtptO4XrJfj0t7NVVKuFxaOH8wSDOKXU7Z/iLzJawHAVY0xE6VbadqW
	 HBHafapnqz2+TBP6Yy4nzYwDHusGcq7xCG9Sm1Ao2+v74A7kTQPsY8yFmGciMYBSJqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794068753;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=6KMLII++fl32NzcSkU62ezgtDx+w05FWcj1RRl47k1g=;
	b=vwQIgkCzZZBapJzj4Lj4duHVHGQKPhuIsgrOHWhp/cdM+j6bKY/BorjAtoH1Wz+CRnrf
	 J0fcu/etz0AJMOke4kZELwAXlj8KGwISGebZ4arYRmMIiq+ShmSJTfhDUySX4eO6Ly8Ho
	 PQwrKTl+/T86b2xF4iRF/0tVqfjPgi2vRBCXck9nO8R5bgg0YD0O9ZT7BbsMjMoW/dJfN
	 L6YZ9gZTmE076hbA3gpABNEpAftfxqDLeyrHfu1je2afD946y0zuMdwd+R8cB+1lCtyZF
	 /qQ5YnuA7zGDBlX4tGa19SxEIE4G5NnF7SvZSpOHNF/3BlK30HD0LB3uvtavvWSf2EA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TUbdpw96;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65493606A326
	for <linux-sound@vger.kernel.org>; Sat,  7 Nov 2026 16:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TUbdpw96
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D2AF1F0089F;
	Sat,  7 Nov 2026 16:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794068752;
	bh=6KMLII++fl32NzcSkU62ezgtDx+w05FWcj1RRl47k1g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TUbdpw96VPzd9FXZlO65q0/talScdvCSqHjBi57b6zsHGn3cl1swODgh3hTeErjNg
	 rz18P0WJImOKHUYkdlETSEsVN0U3xGoXKo+986Hs4PInOlNBmecMMQ7VpUdOpCsmw2
	 YqHIyZTXV7ZkiuBs57H3KacaopIl1dwoMzWL/HcW1wL1N5TWGpWWq/KFCrDnuecIjA
	 11Lxkgktv98UIuI/GQ9hzoq/IrUnMxqINlGdToyO+l0lIwla3U99MAMRuotuYlK8M5
	 2psPImkWzyeVIOeW2HOzSJvFgGCE6DthuTLWYizm0wbzedPfN3+vwUE5uOsegPAsgE
	 ddZi5KygjtE5A==
Message-ID: <sashiko-outbox-203057@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 22/25] soundwire: amd: fix interrupt gate and work
 drain ordering in PM ops
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vijendar Mukunda" <Vijendar.Mukunda@amd.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261107154659.3358223-23-Vijendar.Mukunda@amd.com>
References: <20261107154659.3358223-1-Vijendar.Mukunda@amd.com>
 <20261107154659.3358223-23-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 16:25:51 +0000
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
- [Medium] soundwire: amd: unserialized hard IRQ race with work drain in
  amd_suspend()
- [Low] soundwire: amd: commit message describes prior patch revision in
  PM ops
--

commit f3586b88e19b93c1d283c25b97e67e7d9da93bab
Author: Vijendar Mukunda <Vijendar.Mukunda@amd.com>

> soundwire: amd: fix interrupt gate and work drain ordering in PM ops
>=20
> The CLK_STOP_MODE branches in amd_suspend() and amd_suspend_runtime()
> did not close the ACP_EXTERNAL_INTR_CNTL delivery gate before draining
> amd_sdw_irq_thread and amd_sdw_work. An ISR already running when the
> drains completed could re-queue work after cancel_work_sync() returned,
> racing amd_sdw_clock_stop().
>=20
> In both CLK_STOP_MODE paths, amd_sdw_wake_enable() was also called
> before amd_enable_sdw_interrupts(). Since amd_enable_sdw_interrupts()
> writes the interrupt mask unconditionally, it clobbered the wake bit
> set by amd_sdw_wake_enable().
>=20
> For both amd_suspend() and amd_suspend_runtime():
>  - CLK_STOP_MODE: add amd_disable_sdw_interrupts() and
>    cancel_work_sync(irq_thread) before the work drain; reopen the gate
>    with amd_enable_sdw_interrupts() after clock stop, then call
>    amd_sdw_wake_enable() so the wake bit is not clobbered.
>  - POWER_OFF_MODE: add amd_disable_sdw_interrupts() and
>    cancel_work_sync(irq_thread) before the work drain; remove the
>    redundant post-clock-stop amd_disable_sdw_interrupts() call.
>=20
> Fixes: 86a4371b7697 ("soundwire: amd: fix for handling slave alerts after=
 link is down")
> Reported-by: Lee Jones <lee@kernel.org>
> Closes: https://sashiko.dev/#/bug/linux-3b774ace-00cf-41e6-82eb-85cd43f5e=
1d6
> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>

[Severity: Low]
Does the commit message describe an intermediate revision of this series
rather than the parent commit?

In the parent commit, amd_suspend_runtime() did not drain
amd_sdw_irq_thread or amd_sdw_work at all (this patch adds both
cancel_work_sync() calls there), and neither CLK_STOP_MODE path called
amd_enable_sdw_interrupts() before this patch.

> diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_mana=
ger.c
> index 2b38b9bf97f50..4e151f7350c96 100644
> --- a/drivers/soundwire/amd_manager.c
> +++ b/drivers/soundwire/amd_manager.c
> @@ -1437,15 +1437,20 @@ static int __maybe_unused amd_suspend(struct devi=
ce *dev)
>  	}
> =20
>  	if (amd_manager->power_mode_mask & AMD_SDW_CLK_STOP_MODE) {
> +		amd_disable_sdw_interrupts(amd_manager);
> +		cancel_work_sync(&amd_manager->amd_sdw_irq_thread);
>  		cancel_work_sync(&amd_manager->amd_sdw_work);
> -		amd_sdw_wake_enable(amd_manager, false);
>  		ret =3D amd_sdw_host_wake_enable_by_rev(amd_manager, false);
>  		if (ret)
>  			return ret;
>  		ret =3D amd_sdw_clock_stop(amd_manager);
>  		if (ret)
>  			return ret;
> +		amd_enable_sdw_interrupts(amd_manager);
> +		amd_sdw_wake_enable(amd_manager, false);

[Severity: Medium]
Can an in-flight parent ACP hard IRQ handler still queue
amd_sdw_irq_thread after cancel_work_sync() returns in amd_suspend() and
amd_suspend_runtime()?

None of the parent ACP hard IRQ handlers (such as acp63_irq_handler() in
sound/soc/amd/ps/pci-ps.c) check amd_manager->interrupt_enabled or acquire
acp_sdw_lock before calling schedule_work(&amd_manager->amd_sdw_irq_thread):

sound/soc/amd/ps/pci-ps.c:acp63_irq_handler() {
    ...
	ext_intr_stat =3D readl(adata->acp63_base + ACP_EXTERNAL_INTR_STAT);
	if (ext_intr_stat & ACP_SDW0_STAT) {
		writel(ACP_SDW0_STAT, adata->acp63_base + ACP_EXTERNAL_INTR_STAT);
		amd_manager =3D dev_get_drvdata(&adata->sdw->pdev[0]->dev);
		if (amd_manager)
			schedule_work(&amd_manager->amd_sdw_irq_thread);
    ...
}

If the hard IRQ fires just before amd_disable_sdw_interrupts() masks
ACP_EXTERNAL_INTR_CNTL, the two contexts can interleave as follows:

CPU0                                  CPU1 (<hardirq>)
amd_suspend()
                                      acp63_irq_handler()
                                        readl(... + ACP_EXTERNAL_INTR_STAT)
  amd_disable_sdw_interrupts()
    interrupt_enabled =3D false
    amd_updatel(ACP_EXTERNAL_INTR_CNTL, ...)
  cancel_work_sync(&amd_sdw_irq_thread)
  cancel_work_sync(&amd_sdw_work)
  amd_sdw_clock_stop()
  amd_enable_sdw_interrupts()
    interrupt_enabled =3D true
                                        schedule_work(&amd_sdw_irq_thread)
                                      amd_sdw_irq_thread()
                                        schedule_work(&amd_sdw_work)
                                          <-- runs while clock is stopped

Even in AMD_SDW_POWER_OFF_MODE where interrupt_enabled remains false,
amd_sdw_irq_thread() still reads SoundWire MMIO registers and calls
amd_sdw_read_and_process_ping_status() without checking interrupt_enabled,
racing with amd_sdw_clock_stop(), amd_disable_sdw_manager(), and D3 entry.
In AMD_SDW_CLK_STOP_MODE, calling amd_enable_sdw_interrupts() right after
amd_sdw_clock_stop() also sets interrupt_enabled back to true while the
clock is stopped, allowing a late amd_sdw_irq_thread() to schedule
amd_sdw_work and trigger MIPI command timeouts (-ETIMEDOUT).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261107154659.3358=
223-1-Vijendar.Mukunda@amd.com?part=3D22
