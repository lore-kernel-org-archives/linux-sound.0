Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794068494;
	b=gqD/RmYF+AoYYXxf5YJYRmfENBfpQDwd+1YID6xairCJjpwRF/s5SSrBOLvoPc0dRHdC
	 IUsn5greG+CGBVIyyClzGJHUZRKEoHrpeap+0UrcB1jK/K6M//k2biMrqpqBLZV3K9wuI
	 8/gK95gTr5iKrrzpiNgrYrM/ICRYRg2Rh1fOm4uBWYE9QI+bCXLvUU7TKMh+KIm9yE257
	 7Agy4rUmZpXy4ukIMrh2OTAQv6gfBvCrYbGq1JKMYLwIUPHDqK+ItbSyHNuZhBa3wSJc7
	 AjHZoISExTyE3UOelHD60eMJv9aAN1hYJ70So0HHH+He5gH3IO4UeAHGn61/V79Bqmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794068494;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=k3GxXT71ZGSFAJsrmxKK7Cpi8F2NbQW6h2OBFhado+0=;
	b=Odi4ereutCGZG8aAlXZ2kEedNjg2305rWv5h4Gj7aPm5sgjkwbRtljfVZqlCS2PNZ3R7
	 7pEwguywolrnW3s/hrk6VVcapKDSZZdkHFMj9at70UocE7g6lXU0ZvmrT2FKk+M2hFdXc
	 bMRLMmEec+IoDPaMgUdZ7NkKvitMImTXGw0LGMdkWSRCH38bmjrksrFGeqtWISanBaNFf
	 qoinTMM6sm1o8nf1nXN4PyvtwZa41Y+flu35RzRH8iJVHnkNreddrTzDXbzj1ZXnxqaiu
	 TBbJu1WnqVidQoEUyb9rbEo0F/n1RKRZ+O+33e3ykt2C2sGpqEdvP1BhHpc9fNjfvIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L3x5ghgO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C83B5606A326
	for <linux-sound@vger.kernel.org>; Sat,  7 Nov 2026 16:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L3x5ghgO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C3EE1F0089F;
	Sat,  7 Nov 2026 16:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794068493;
	bh=k3GxXT71ZGSFAJsrmxKK7Cpi8F2NbQW6h2OBFhado+0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=L3x5ghgOLCrxd3nGijs+dctvbFxuxYkEmNk0DeKv2GoxPLn5qcJxT/6+E5Ebr1Axx
	 qUOKr5iCZ4CUHiWA5c2YFmxAufkTbt3Tfonb7H/hcL/GqFpnJ3I/0dGnPjLc1EC0Qm
	 cUvST3s59wgaxLkGOc6Cg++qCdfiQNoLklCeKYzm5rfsZF6XPT44BuWEUlK7AaKny+
	 3e6qZqwLAlMyq28tR3XZiEiCdro+MO5tN7QPhNVseWJDm5PEvGaVJ6Q7tlspHlFRNv
	 jTbujiB0WpKRhi7MPTGoDwWLjO+YgcdWc0HdWXH4GHHDAze3+UH0GbIyXuEmffCzg6
	 4nx7wL5T2+p/Q==
Message-ID: <sashiko-outbox-203052@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 17/25] soundwire: amd: use interrupt_enabled flag to
 guard IRQ work scheduling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vijendar Mukunda" <Vijendar.Mukunda@amd.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261107154659.3358223-18-Vijendar.Mukunda@amd.com>
References: <20261107154659.3358223-1-Vijendar.Mukunda@amd.com>
 <20261107154659.3358223-18-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 16:21:32 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [Medium] soundwire: amd: lost IRQ in amd_enable_sdw_interrupts() due
  to late flag
- [Medium] soundwire: amd: unguarded IRQ work queueing in
  amd_disable_sdw_interrupts()
- [Medium] soundwire: amd: race re-enabling IRQ masks in
  amd_disable_sdw_interrupts()
--

commit c646d5fedeac998edd11296e03517aec14fbed88
Author: Vijendar Mukunda <Vijendar.Mukunda@amd.com>

soundwire: amd: use interrupt_enabled flag to guard IRQ work scheduling

This commit adds an interrupt_enabled boolean flag to struct
amd_sdw_manager to guard scheduling of amd_sdw_work when interrupts are
being disabled.

> diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_mana=
ger.c
> index 01aa051cf63fa..108553b0f32e8 100644
> --- a/drivers/soundwire/amd_manager.c
> +++ b/drivers/soundwire/amd_manager.c
> @@ -129,12 +129,22 @@ static void amd_enable_sdw_interrupts(struct amd_sd=
w_manager *amd_manager)
>  	writel(AMD_SDW_IRQ_MASK_8TO11, amd_manager->mmio +
>  		       ACP_SW_STATE_CHANGE_STATUS_MASK_8TO11);
>  	writel(AMD_SDW_IRQ_ERROR_MASK, amd_manager->mmio + ACP_SW_ERROR_INTR_MA=
SK);
> +	amd_manager->interrupt_enabled =3D true;
>  }

[Severity: Medium]
Can setting amd_manager->interrupt_enabled after unmasking the hardware
registers drop an initial peripheral status-change interrupt?

amd_init_sdw_manager() has already enabled the bus before
amd_enable_sdw_interrupts() runs, so a peripheral state-change interrupt
can fire as soon as the mask registers are written:

CPU0                                     CPU1 (kworker)
amd_enable_sdw_interrupts()
  amd_updatel(..., ACP_EXTERNAL_INTR_CNTL, ...)
  writel(..., ACP_SW_STATE_CHANGE_STATUS_MASK_0TO7)
  <IRQ fires, schedules amd_sdw_irq_thread>
                                         amd_sdw_irq_thread()
                                           status_change_0to7 =3D readl(...)
                                           amd_sdw_update_slave_status(...)
                                           if (... && amd_manager->interrup=
t_enabled)
                                             /* false: skips amd_sdw_work */
                                           writel(0x00, ..._STATUS_0TO7)
                                             <-- event lost
  amd_manager->interrupt_enabled =3D true

Because amd_sdw_irq_thread() skips schedule_work(&amd_manager->amd_sdw_work)
when interrupt_enabled is false but still clears
ACP_SW_STATE_CHANGE_STATUS_8TO11 and ACP_SW_STATE_CHANGE_STATUS_0TO7 to
0x00, the peripheral attachment or alert is permanently lost.  Setting
amd_manager->interrupt_enabled =3D true before unmasking the hardware
registers avoids this race.

>  static void amd_disable_sdw_interrupts(struct amd_sdw_manager *amd_manag=
er)
>  {
>  	u32 irq_mask;
> =20
> +	/*
> +	 * Clear the flag before updating hardware masks so that any IRQ
> +	 * that fires during the mask-register writes sees the flag as false
> +	 * and does not queue new work. Once the mask registers are written,
> +	 * the ACP hardware will not assert any new SDW interrupt, so no
> +	 * synchronize_irq() is required after this function returns.
> +	 */
> +	amd_manager->interrupt_enabled =3D false;
> +
>  	mutex_lock(amd_manager->acp_sdw_lock);
>  	irq_mask =3D sdw_manager_reg_mask_array[amd_manager->instance];
>  	amd_updatel(amd_manager->acp_mmio, ACP_EXTERNAL_INTR_CNTL(amd_manager->=
instance),

[Severity: Medium]
Does clearing amd_manager->interrupt_enabled and zeroing the mask
registers before cancel_work_sync(&amd_manager->amd_sdw_work) allow
amd_sdw_update_slave_status_work() to re-enable the status masks?

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

CPU0                                     CPU1 (kworker)
                                         amd_sdw_update_slave_status_work()
                                           sdw_handle_slave_status(...)
amd_disable_sdw_interrupts()
  amd_manager->interrupt_enabled =3D false
  writel(0x00, ..._STATUS_MASK_0TO7)
  writel(0x00, ..._STATUS_MASK_8TO11)
                                           writel(AMD_SDW_IRQ_MASK_0TO7, ..=
.)
                                           writel(AMD_SDW_IRQ_MASK_8TO11, .=
..)
                                             <-- masks re-enabled
cancel_work_sync(&amd_manager->amd_sdw_work)

During runtime suspend in AMD_SDW_POWER_OFF_MODE, amd_sdw_wake_enable()
then performs a read-modify-write on ACP_SW_STATE_CHANGE_STATUS_MASK_8TO11
while ACP_EXTERNAL_INTR_CNTL is re-enabled for wake on ACP 6.3, leaving
non-wake state-change interrupts unmasked during suspend.

> @@ -1143,7 +1153,7 @@ static void amd_sdw_irq_thread(struct work_struct *=
work)
>  		/* Check for the updated status on peripheral device */
>  		amd_sdw_update_slave_status(status_change_0to7, status_change_8to11, a=
md_manager);
>  	}
> -	if (status_change_8to11 || status_change_0to7)
> +	if ((status_change_8to11 || status_change_0to7) && amd_manager->interru=
pt_enabled)
>  		schedule_work(&amd_manager->amd_sdw_work);
>  	writel(0x00, amd_manager->mmio + ACP_SW_STATE_CHANGE_STATUS_8TO11);
>  	writel(0x00, amd_manager->mmio + ACP_SW_STATE_CHANGE_STATUS_0TO7);

[Severity: Medium]
Does guarding only schedule_work(&amd_manager->amd_sdw_work) inside
amd_sdw_irq_thread() still leave amd_sdw_irq_thread itself unguarded
against an in-flight hard IRQ handler?

amd_sdw_irq_thread() is a work_struct callback rather than a threaded IRQ
handler.  The actual hard IRQ handlers (such as acp63_irq_handler() in
sound/soc/amd/ps/pci-ps.c and acp_irq_handler() in
sound/soc/sof/amd/acp.c) schedule amd_sdw_irq_thread without checking
amd_manager->interrupt_enabled:

sound/soc/amd/ps/pci-ps.c:acp63_irq_handler() {
    ...
	if (ext_intr_stat & ACP_SDW0_STAT) {
		writel(ACP_SDW0_STAT, adata->acp63_base + ACP_EXTERNAL_INTR_STAT);
		amd_manager =3D dev_get_drvdata(&adata->sdw->pdev[0]->dev);
		if (amd_manager)
			schedule_work(&amd_manager->amd_sdw_irq_thread);
    ...
}

Without synchronize_irq() or a check before schedule_work() in the hard
IRQ handler, an IRQ that fires just before ACP_EXTERNAL_INTR_CNTL is
masked can queue amd_sdw_irq_thread after cancel_work_sync() returns:

CPU0                                     CPU1 (<hardirq>)
                                         acp63_irq_handler()
                                           ext_intr_stat & ACP_SDW0_STAT
amd_sdw_manager_remove()
  amd_disable_sdw_interrupts()
    amd_manager->interrupt_enabled =3D false
    amd_updatel(..., ACP_EXTERNAL_INTR_CNTL, ...)
  cancel_work_sync(&amd_manager->amd_sdw_irq_thread)
  cancel_work_sync(&amd_manager->amd_sdw_work)
                                           schedule_work(&...->amd_sdw_irq_=
thread)
  /* devm frees amd_manager */
                                         amd_sdw_irq_thread()
                                           readl(amd_manager->mmio + ...)
                                             <-- use-after-free

Even when amd_sdw_irq_thread() runs with interrupt_enabled =3D=3D false bef=
ore
cancel_work_sync(), it still reads and writes MMIO registers and calls
amd_sdw_read_and_process_ping_status() before reaching the
interrupt_enabled check.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261107154659.3358=
223-1-Vijendar.Mukunda@amd.com?part=3D17
