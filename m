Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793366177;
	b=sDREn2ZLFO9jbNqkHvTSiS6KcEFCYZIYe4gkODkNFJbdgqlURjy9fATwILo+yjDPT6Nn
	 YulwMTRxA9W795uj23KjsbT+bmTiB+pTxGPa0j1IyQqjoVX2RsfU0ckB4orKg3lkqEATy
	 3hZ2QRSwOGKGot/MJIyw8xwRKZN8oaS6PlJr/H/LFRqiuckQpCE251LXWT8zQV07AHSG0
	 HgmWap9ZOBG1JoMCRjw9oXQoQBrkAg655tJsSRe5nHcSvnTqFXOoafkpY6pbCv20W3Ls3
	 mqhTZ8CR4Jhv4quaSEXtOE1z2/NQz8jTA7jLiDKTo53W4DTOVDCxTGVrnx1XyRwebTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793366177;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=zi7x7r/Rr84d1VYjhHxc3pKjvtXyYxZpT/INbzl2RNM=;
	b=YFdvW2xgEEG7T5rptsyfn1uWC0Y5CF2p3JIXgMUChgbTbO0Xriqu1Z0CsmujNfemGnNh
	 BaUEc6k7YH9u4edQfUwPSMD/9NY/BpVGztZuzKuFjvreqCTR/GpjcKWI2ZO0tL5ocryf2
	 Mc3jf9JioD9Q4l3mYIGGZj/cpCpcvfZtfKF87ed/H7MWnJBuq0H9Ab9RXtKW8ENtOQnyj
	 XxXdLb3TCQtZYuwdQEWb5bBzc7GRfqr/EEpWOV63eaKL01abodf0LvoScUZZN6iVSr99q
	 kBkZlJ3AZZNDNxF5Z9BgWImeEAdx9mnib9mXdrN4epToGTCIkC7eO6HffCvarnF+RMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Hz3zukuB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA806606A31A
	for <linux-sound@vger.kernel.org>; Fri, 30 Oct 2026 13:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Hz3zukuB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B1F61F000C1;
	Fri, 30 Oct 2026 13:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793366176;
	bh=zi7x7r/Rr84d1VYjhHxc3pKjvtXyYxZpT/INbzl2RNM=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=Hz3zukuBkOgL5oSDufkT+c4jmtOcPtwcVtkZ1LR6+0Jzq0h1YNbb3C6U8rJECqycR
	 hbqnOxBo+r8NVjtUjUGAJHD6AV4NE0gJzPC4PPudCXJJ9UUyxnYFw2BxBfnaJ+yOws
	 DrZyIbyJOU9gA6LJi+sU6iZ9Q8fjMBjF1WIdozBOXzOEhCmQ5e4mOTe/tsVTz8tZQy
	 CLdNf4qZyXEIFCsEBIQuwCi9sf/CpnBJJP+AUeHdDZwzu6hxqUtbgnOR4+eYbLy7oj
	 tV6GdcyFe+rEvq7jMHLDGLG0P/Dv5XL7/AaOoBtjYazEw+x9dRD25gZ8G6MuQBYY4Y
	 gJqQHAWhlBX9A==
Message-ID: <sashiko-outbox-191053@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 19/21] soundwire: amd: Cancel pending work before
 suspending manager
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lee Jones" <lee@kernel.org>, linux-sound@vger.kernel.org
In-Reply-To: <20261030104840.3361217-20-lee@kernel.org>
References: <20261030104840.3361217-1-lee@kernel.org>
 <20261030104840.3361217-20-lee@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 13:16:15 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] soundwire: amd: stale clk_stopped flag in amd_sdw_irq_thread() aft=
er power-off
- [High] soundwire: amd: runtime PM deadlock in amd_sdw_quiesce_work()
- [Medium] soundwire: amd: wake IRQ unmasked then cancelled in amd_suspend_=
runtime()
--

commit ec00457d1c5224b384fcee6f0242d7bebb6b2292
Author: Lee Jones <lee@kernel.org>

soundwire: amd: Cancel pending work before suspending manager

This commit masks manager interrupts, synchronizes the parent PCI IRQ, and
cancels both amd_sdw_irq_thread and amd_sdw_work before stopping the SoundW=
ire
bus clock during suspend and manager deinitialization. It also avoids non-w=
ake
register accesses in amd_sdw_irq_thread() while the clock is stopped.

> diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_mana=
ger.c
> index f39f4f04db7e9..ba8e6d42c467f 100644
> --- a/drivers/soundwire/amd_manager.c
> +++ b/drivers/soundwire/amd_manager.c
> @@ -148,9 +148,24 @@ static void amd_disable_sdw_interrupts(struct amd_sd=
w_manager *amd_manager)
>  	writel(0x00, amd_manager->mmio + ACP_SW_ERROR_INTR_MASK);
>  }
> =20
> +static void amd_sdw_quiesce_work(struct amd_sdw_manager *amd_manager)
> +{
> +	struct device *parent =3D amd_manager->dev->parent;
> +
> +	disable_work_sync(&amd_manager->amd_sdw_work);

[Severity: High]
Can calling disable_work_sync(&amd_manager->amd_sdw_work) from
amd_suspend_runtime() cause a runtime PM deadlock if a peripheral alert is
being processed concurrently?

In the SoundWire device hierarchy (amd_manager->dev -> bus->dev ->
slave->dev), neither amd_manager->dev nor bus->dev sets power.ignore_childr=
en.
When all child slave->dev devices are runtime-suspended, the manager remains
active until its autosuspend delay expires.

When rpm_suspend() runs on amd_manager->dev, its runtime status is set to
RPM_SUSPENDING before invoking:

  amd_suspend_runtime()
    -> amd_sdw_quiesce_work()
      -> disable_work_sync(&amd_manager->amd_sdw_work)

If an alert interrupt scheduled amd_sdw_work just prior to this, the worker
executes:

  amd_sdw_update_slave_status_work()
    -> sdw_handle_slave_status()
      -> sdw_handle_slave_alerts()
        -> pm_runtime_get_sync(&slave->dev)

Because slave->dev and bus->dev are RPM_SUSPENDED, rpm_resume(&slave->dev,
RPM_GET_PUT) synchronously resumes the parent chain up to
rpm_resume(amd_manager->dev, 0), which sees RPM_SUSPENDING and waits in
TASK_UNINTERRUPTIBLE on amd_manager->dev->power.wait_queue for
amd_suspend_runtime() to complete, while amd_suspend_runtime() is waiting in
disable_work_sync() for amd_sdw_update_slave_status_work() to finish.

> +	writel(0, amd_manager->mmio + ACP_SW_STATE_CHANGE_STATUS_MASK_0TO7);
> +	writel(0, amd_manager->mmio + ACP_SW_STATE_CHANGE_STATUS_MASK_8TO11);
> +	writel(0, amd_manager->mmio + ACP_SW_ERROR_INTR_MASK);
> +	if (parent && dev_is_pci(parent))
> +		synchronize_irq(to_pci_dev(parent)->irq);
> +	cancel_work_sync(&amd_manager->amd_sdw_irq_thread);
> +	enable_work(&amd_manager->amd_sdw_work);
> +}
> +
>  static int amd_deinit_sdw_manager(struct amd_sdw_manager *amd_manager)
>  {
>  	amd_disable_sdw_interrupts(amd_manager);
> +	amd_sdw_quiesce_work(amd_manager);
>  	return amd_disable_sdw_manager(amd_manager);
>  }
> =20
> @@ -1049,6 +1064,14 @@ static void amd_sdw_irq_thread(struct work_struct =
*work)
>  	u32 status_change_8to11;
>  	u32 status_change_0to7;
> =20
> +	if (amd_manager->clk_stopped) {
> +		status_change_8to11 =3D readl(amd_manager->mmio +
> +					    ACP_SW_STATE_CHANGE_STATUS_8TO11);
> +		if (status_change_8to11 & AMD_SDW_WAKE_STAT_MASK)
> +			amd_sdw_process_wake_event(amd_manager);
> +		return;
> +	}

[Severity: High]
Does this early return drop all non-wake interrupts after resuming from
AMD_SDW_POWER_OFF_MODE when the parent ACP controller has been reset?

During amd_suspend() or amd_suspend_runtime() in AMD_SDW_POWER_OFF_MODE,
amd_sdw_clock_stop() sets amd_manager->clk_stopped =3D true and
amd_deinit_sdw_manager() clears ACP_SW_EN. When the parent ACP PCI device
subsequently suspends and resumes, check_acp_sdw_enable_status() observes
ACP_SW0_EN and ACP_SW1_EN cleared and performs a full ACP soft reset and po=
wer
cycle, which resets ACP_SW_CLK_RESUME_CTRL to 0.

When amd_resume_runtime() then runs the AMD_SDW_POWER_OFF_MODE path in
drivers/soundwire/amd_manager.c:

		val =3D readl(amd_manager->mmio + ACP_SW_CLK_RESUME_CTRL);
		if (val) {
			val |=3D AMD_SDW_CLK_RESUME_REQ;
			writel(val, amd_manager->mmio + ACP_SW_CLK_RESUME_CTRL);
			ret =3D readl_poll_timeout(amd_manager->mmio + ACP_SW_CLK_RESUME_CTRL, v=
al,
						 (val & AMD_SDW_CLK_RESUME_DONE), ACP_DELAY_US,
						 AMD_SDW_TIMEOUT);
			if (val & AMD_SDW_CLK_RESUME_DONE) {
				writel(0, amd_manager->mmio + ACP_SW_CLK_RESUME_CTRL);
				amd_manager->clk_stopped =3D false;
			}
		}

Because val is 0 after the ACP reset, amd_manager->clk_stopped is never res=
et
to false even after amd_sdw_clk_init_ctrl(), amd_init_sdw_manager(),
amd_enable_sdw_interrupts(), and amd_enable_sdw_manager() reinitialize and
restart the bus.

With this new check in amd_sdw_irq_thread(), wouldn't every subsequent
interrupt return early without reading ACP_SW_STATE_CHANGE_STATUS_0TO7,
processing peripheral attachment or ping status, scheduling amd_sdw_work, or
clearing ACP_SW_STATE_CHANGE_STATUS_8TO11 and
ACP_SW_STATE_CHANGE_STATUS_0TO7?

[ ... ]

> @@ -1391,25 +1414,29 @@ static int __maybe_unused amd_suspend_runtime(str=
uct device *dev)
>  		return 0;
>  	}
>  	if (amd_manager->power_mode_mask & AMD_SDW_CLK_STOP_MODE) {
> -		amd_sdw_wake_enable(amd_manager, true);
>  		if (amd_manager->acp_rev >=3D ACP70_PCI_REV_ID) {
>  			ret =3D amd_sdw_host_wake_enable(amd_manager, true);
>  			if (ret)
>  				return ret;
>  		}
> +		amd_sdw_quiesce_work(amd_manager);
>  		ret =3D amd_sdw_clock_stop(amd_manager);
>  		if (ret)
>  			return ret;
> +		if (amd_manager->clk_stopped)
> +			amd_sdw_wake_enable(amd_manager, true);
>  	} else if (amd_manager->power_mode_mask & AMD_SDW_POWER_OFF_MODE) {
> -		amd_sdw_wake_enable(amd_manager, true);
>  		if (amd_manager->acp_rev >=3D ACP70_PCI_REV_ID) {
>  			ret =3D amd_sdw_host_wake_enable(amd_manager, true);
>  			if (ret)
>  				return ret;
>  		}
> +		amd_sdw_quiesce_work(amd_manager);
>  		ret =3D amd_sdw_clock_stop(amd_manager);
>  		if (ret)
>  			return ret;
> +		if (amd_manager->clk_stopped)
> +			amd_sdw_wake_enable(amd_manager, true);
>  		ret =3D amd_deinit_sdw_manager(amd_manager);

[Severity: Medium]
In the AMD_SDW_POWER_OFF_MODE branch of amd_suspend_runtime(),
amd_sdw_wake_enable(amd_manager, true) unmasks AMD_SDW_WAKE_INTR_MASK in
ACP_SW_STATE_CHANGE_STATUS_MASK_8TO11 while ACP_EXTERNAL_INTR_CNTL still has
the manager interrupt enabled.

Immediately after that, amd_deinit_sdw_manager() is called:

  amd_deinit_sdw_manager()
    -> amd_disable_sdw_interrupts()
    -> amd_sdw_quiesce_work()
      -> cancel_work_sync(&amd_manager->amd_sdw_irq_thread)

amd_disable_sdw_interrupts() zeroes ACP_SW_STATE_CHANGE_STATUS_MASK_8TO11 a=
nd
clears the manager interrupt bit in ACP_EXTERNAL_INTR_CNTL, and
amd_sdw_quiesce_work() cancels amd_sdw_irq_thread.

If a wake interrupt fires in the window between amd_sdw_wake_enable() and
amd_disable_sdw_interrupts(), the top-half IRQ handler acknowledges the
interrupt in ACP_EXTERNAL_INTR_STAT and schedules amd_sdw_irq_thread, which=
 is
then cancelled by amd_deinit_sdw_manager() before amd_sdw_process_wake_even=
t()
can call pm_request_resume(). Why unmask AMD_SDW_WAKE_INTR_MASK here if
amd_deinit_sdw_manager() immediately masks it and cancels the work?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261030104840.3361=
217-1-lee@kernel.org?part=3D19
