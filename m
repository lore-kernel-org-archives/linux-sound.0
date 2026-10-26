Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793010426;
	b=pgbeigWFDICLQaSa6xIfzKinryKLt8xu7Zp79pTgxhxnzwKhCH8HnrE21AtBYddd0Fbx
	 Ct8dS0P6DbUk6Hmi6T3dq8dghrfBXWG5WYtXhqcSpO6a9gA7Zbe0OeIkk17inTn6GIdoU
	 jfNJRnABnizwly1ZoirgA7wzeukoKYhLIhpu1i4CaBidy9IPSaltY8O9tLgKChAr/K1PV
	 VgDBmIRMteccuJocEKnnb7+lNAEtnjq1wzHCKrESDtrTON9YWKbrSgBfAE5TVyF/UtgID
	 I6jtuOYnb2GWFLMW75Hdoph2g/Z2uEN4M1H8rbydNUd9wGb2o3liNQBUP9IOJqShMXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793010426;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=39EjD23tAJWcAPWsL3L07GhV1rZwJz7ck+tXcefCsR0=;
	b=5EA7lTM5BYN+cxZYcjcFLBFUATwp199Q/kC7lWUlCZnCDlYIoe7cEoIX8ikBNnWcTtdo
	 5dABGhHiu3/Jcz4a+b91qiBhhatLQiI0qmdDJh+3DSFfiLPuBoJtdSEpxysNu+tsuwVl6
	 Ctfmu6uG3L39DVqI2ceLBuytrYN7JzpcGgfz5CEUODpdz6dQgTM3mLrdSHXzGE1oFv6EQ
	 XqLiG44bjCUfUivCnOHxbZxsrQTG6QiMT4D0qWJuBDAwBhlFXJQKNdq19mEFluRZIphr9
	 Li2UGKl2No2Ll5BLciABRFkKjAAMEABo3OvnVkCioO8qbQYWiHi9brSzV28aKKHIVkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WtaUybQc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C150B606A31D
	for <linux-sound@vger.kernel.org>; Mon, 26 Oct 2026 10:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WtaUybQc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B9871F01825;
	Mon, 26 Oct 2026 10:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793010425;
	bh=39EjD23tAJWcAPWsL3L07GhV1rZwJz7ck+tXcefCsR0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WtaUybQcK0qWm/9Bljt/Asc2LR/UOndHvIgoPK4bOFA6Y7sBnuyY4QVTwvcXjqVJc
	 jTBrVsWSy3ZeV1zMJZIEx0KOVkp1G1zpnIpX45gP7DFBQ5PDe4PIlA/+wxTHF8JIn1
	 5j4pcX6Hs2Kf+5QOIcma7nO/VUCqJ28JzlR16In+uhgJ3EIU8/y1XoTRMUxzQYOm2X
	 9HOk6HyfOghxOVm6yeYLfb74rlaui1BPm7XXSOSNP/vqWV1eR5D91nwYUvbTiGijE1
	 qjWopVgT16T7r6QDIsxPLZhp5x+X4MjeYpgxPUQNdHdBYw2zNebsnjH3Gtlxv6WGVC
	 QHGVssaHEloqQ==
Message-ID: <sashiko-outbox-184937@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 11/13] soundwire: amd: fix interrupt gate and work
 drain ordering in PM ops
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vijendar Mukunda" <Vijendar.Mukunda@amd.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261026044507.2310694-12-Vijendar.Mukunda@amd.com>
References: <20261026044507.2310694-1-Vijendar.Mukunda@amd.com>
 <20261026044507.2310694-12-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 26 Oct 2026 10:27:04 +0000
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
- [High] soundwire: amd: amd_enable_sdw_interrupts() in suspend fires stale=
 status IRQs
- [Medium] soundwire: amd: missing IRQ sync before work drain in amd_suspen=
d()
--

commit ecf45f9e24e7a7e6c5e9ff39ceefacd5dd89af26
Author: Vijendar Mukunda <Vijendar.Mukunda@amd.com>

soundwire: amd: fix interrupt gate and work drain ordering in PM ops

This commit updates amd_suspend() and amd_suspend_runtime() to disable
SoundWire interrupts and cancel amd_sdw_irq_thread before draining
amd_sdw_work and stopping the bus clock. In the AMD_SDW_CLK_STOP_MODE path,
it also re-enables SoundWire interrupts and configures wake enablement after
stopping the clock.

> diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_mana=
ger.c
> index a685bd7da52b1..d7289b840513b 100644
> --- a/drivers/soundwire/amd_manager.c
> +++ b/drivers/soundwire/amd_manager.c
> @@ -1318,15 +1318,20 @@ static int __maybe_unused amd_suspend(struct devi=
ce *dev)
>  	}
> =20
>  	if (amd_manager->power_mode_mask & AMD_SDW_CLK_STOP_MODE) {
> +		amd_disable_sdw_interrupts(amd_manager);
> +		cancel_work_sync(&amd_manager->amd_sdw_irq_thread);
>  		cancel_work_sync(&amd_manager->amd_sdw_work);

[Severity: Medium]
Can an in-flight hard IRQ handler on another CPU still schedule
amd_sdw_irq_thread after cancel_work_sync() returns here (and in the
corresponding AMD_SDW_POWER_OFF_MODE and amd_suspend_runtime() paths)?

In sound/soc/amd/ps/pci-ps.c:acp63_irq_handler() (as well as
acp_irq_handler() and acp7x_irq_handler() in sound/soc/sof/amd/acp.c), the
hard IRQ handler reads ACP_EXTERNAL_INTR_STAT and schedules
amd_sdw_irq_thread without holding acp_sdw_lock:

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

If the hard IRQ handler on CPU 1 has already read ACP_EXTERNAL_INTR_STAT
before CPU 0 masks ACP_EXTERNAL_INTR_CNTL in amd_disable_sdw_interrupts(),
CPU 0 can complete both cancel_work_sync() calls before CPU 1 invokes
schedule_work(&amd_manager->amd_sdw_irq_thread).

Because amd_disable_sdw_interrupts() only clears the mask registers and does
not clear ACP_SW_STATE_CHANGE_STATUS_0TO7 or
ACP_SW_STATE_CHANGE_STATUS_8TO11, the newly scheduled amd_sdw_irq_thread()
will see the non-zero status registers and schedule amd_sdw_work concurrent=
ly
with amd_sdw_clock_stop() and amd_disable_sdw_manager(). In addition, since
the post-clock-stop amd_disable_sdw_interrupts() call is removed from the
AMD_SDW_POWER_OFF_MODE path, a racing amd_sdw_update_slave_status_work() wi=
th
status[0] =3D=3D SDW_SLAVE_ATTACHED would also write AMD_SDW_IRQ_MASK_0TO7 =
and
AMD_SDW_IRQ_MASK_8TO11 back to the mask registers.

Should the driver synchronize with the parent ACP IRQ or clear the status
registers after synchronizing before draining the work items?

> -		amd_sdw_wake_enable(amd_manager, false);
>  		ret =3D amd_sdw_host_wake_enable_by_rev(amd_manager, false);
>  		if (ret)
>  			return ret;
>  		ret =3D amd_sdw_clock_stop(amd_manager);
>  		if (ret)
>  			return ret;
> +		amd_enable_sdw_interrupts(amd_manager);
> +		amd_sdw_wake_enable(amd_manager, false);

[Severity: High]
Could calling amd_enable_sdw_interrupts() right after amd_sdw_clock_stop()
here and in amd_suspend_runtime() re-trigger slave status interrupts while
the SoundWire bus clock is stopped?

When a SoundWire interrupt fires just before amd_disable_sdw_interrupts(),
the hard IRQ handler clears ACP_EXTERNAL_INTR_STAT and queues
amd_sdw_irq_thread, leaving ACP_SW_STATE_CHANGE_STATUS_0TO7 and
ACP_SW_STATE_CHANGE_STATUS_8TO11 non-zero until amd_sdw_irq_thread() runs to
completion:

drivers/soundwire/amd_manager.c:amd_sdw_irq_thread() {
	...
	status_change_8to11 =3D readl(amd_manager->mmio + ACP_SW_STATE_CHANGE_STAT=
US_8TO11);
	status_change_0to7 =3D readl(amd_manager->mmio + ACP_SW_STATE_CHANGE_STATU=
S_0TO7);
	if (!status_change_0to7 && !status_change_8to11)
		return;
	...
	if (status_change_8to11 || status_change_0to7)
		schedule_work(&amd_manager->amd_sdw_work);
	writel(0x00, amd_manager->mmio + ACP_SW_STATE_CHANGE_STATUS_8TO11);
	writel(0x00, amd_manager->mmio + ACP_SW_STATE_CHANGE_STATUS_0TO7);
}

If cancel_work_sync(&amd_manager->amd_sdw_irq_thread) cancels that pending
work item before it executes, or if any slave status bits latch during
sdw_bus_prep_clk_stop() and sdw_bus_clk_stop() while the masks are zeroed,
ACP_SW_STATE_CHANGE_STATUS_0TO7 and ACP_SW_STATE_CHANGE_STATUS_8TO11 remain
non-zero after amd_sdw_clock_stop() sets clk_stopped =3D true.

Calling amd_enable_sdw_interrupts() at that point unmasks
ACP_EXTERNAL_INTR_CNTL, AMD_SDW_IRQ_MASK_0TO7, and AMD_SDW_IRQ_MASK_8TO11:

drivers/soundwire/amd_manager.c:amd_enable_sdw_interrupts() {
	...
	writel(AMD_SDW_IRQ_MASK_0TO7, amd_manager->mmio +
		       ACP_SW_STATE_CHANGE_STATUS_MASK_0TO7);
	writel(AMD_SDW_IRQ_MASK_8TO11, amd_manager->mmio +
		       ACP_SW_STATE_CHANGE_STATUS_MASK_8TO11);
	writel(AMD_SDW_IRQ_ERROR_MASK, amd_manager->mmio + ACP_SW_ERROR_INTR_MASK);
}

Wouldn't unmasking those registers with stale bits still set in
ACP_SW_STATE_CHANGE_STATUS_0TO7 and ACP_SW_STATE_CHANGE_STATUS_8TO11
immediately fire an interrupt and schedule amd_sdw_irq_thread() and
amd_sdw_work while the link clock is stopped, causing MIPI command timeouts
in amd_sdw_update_slave_status_work()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261026044507.2310=
694-1-Vijendar.Mukunda@amd.com?part=3D11
