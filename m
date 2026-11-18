Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795000917;
	b=J9+UlMwoJqgC0pVVjf+yFTjqgQZk4gKKZ40L89sRoT4JX5hldgv+3CQaXmaIsSIYdC1B
	 WRfbeuoTjH+rGqlh6v8GzghCg2b3xfLLc1NJy+HGQXTuN1jMgBIjD4UnfTTGhox6lJu0u
	 WiTwQ9s3o9QnuW0iDWYiMt53I1zdLeWRsvxX8U1jonWYa2BAwQNbeTkmTOoeDe//nnxLQ
	 zDQaNbQuW4h+paEnx2zLSSr5IKnXsXCgbtb7lCAulnDrseNhpZP22yrtNLg7LMCurwKjl
	 MnfQJnHSq53OpOVbqihDhVhrTorlerdM4N1ACuyeylDLGBUmOwnWGt5tn+KQ1Gcnn1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795000917;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=AGa4dA5eER42OKKoehw1Y+xhtcn2BICkUwDwZIZp42U=;
	b=Kp4fFILvD046lvcY52Dl+RuuiJPZSoiVB/aWqRc6w4ZG2uc62X0U+AIqbw7bS57kQn+5
	 SDB+NXwYeTvFB6gG1cgKSLBN413bgWXEY1XkS7I/4/ekVxNYr8TJ5r1oBU6md4KW4rXcT
	 tUM+PnAGtD4tYQtL7FUhRE+RXQmVFMFdJx7fBF2bdJrwSn0v43YK3ySlq4mRWt/nIeMY6
	 1NXwCzojziCiiV+Rc8aiVOZfMqfygKENlOcY5FZe72WCMtWvFGawekfQv884I/2yH+lEU
	 hbfKZlJWlmZKFp+LXeLkWZDA4aRvzmxDdAp3ILMqHiLAJaDtXKDaLhTIrRzvAGI0lLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="HYb3/Jz4";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFDBC606A31C
	for <linux-sound@vger.kernel.org>; Wed, 18 Nov 2026 11:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HYb3/Jz4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51DF41F000C4;
	Wed, 18 Nov 2026 11:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795000917;
	bh=AGa4dA5eER42OKKoehw1Y+xhtcn2BICkUwDwZIZp42U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HYb3/Jz4Xswg+GNGJsMHcOvP7NkXAwJGOFYavNJBWmFmuJXsTatx5d3cGn9hXru//
	 mk4hgmu8arkHs5LfnhbngXgkFm1m/RgsK/T90+V5mqyEpOWHCP9orIsxuTcTDNLZlB
	 gQdzEtqcnwnMPTueTzgJ988VNprY54JIXcpYL0GlKs6VPuLFJ9WCPM9N6LwLiqi0lo
	 QPP0ZWcr0idNHSEIN7Z3Nj9r3zvvTeGYCa7F/ohz2/EMGPzsAVUPmdCNnzaRoR5XoV
	 35vgkyUyIbTsLC+2uo5Z8FKexuibfcYMM0LRl5CXM6lLNp0MwjpujZWkf6Us0vvsoQ
	 XJFuyPaMxhm5Q==
Message-ID: <sashiko-outbox-220819@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 20/23] soundwire: amd: fix interrupt gate and work
 drain ordering in PM ops
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vijendar Mukunda" <Vijendar.Mukunda@amd.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261118104353.331556-21-Vijendar.Mukunda@amd.com>
References: <20261118104353.331556-1-Vijendar.Mukunda@amd.com>
 <20261118104353.331556-21-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 11:21:56 +0000
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
- [High] soundwire: amd: runtime PM deadlock in amd_suspend_runtime()
  work drain
- [Medium] soundwire: amd: stale status bits and early IRQ enable in
  amd_suspend()
- [Medium] soundwire: amd: draining amd_sdw_work re-unmasks IRQs in
  POWER_OFF_MODE
--

commit 51e6c84ae75bcfe935e29acd598ea807a66790ac
Author: Vijendar Mukunda <Vijendar.Mukunda@amd.com>

soundwire: amd: fix interrupt gate and work drain ordering in PM ops

This commit reorders interrupt masking, workqueue draining, and wake
configuration across the CLK_STOP_MODE and POWER_OFF_MODE paths in
amd_suspend() and amd_suspend_runtime().

> diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_mana=
ger.c
> index 57238c81997a2..220abf73cb25e 100644
> --- a/drivers/soundwire/amd_manager.c
> +++ b/drivers/soundwire/amd_manager.c
> @@ -1430,17 +1430,20 @@ static int __maybe_unused amd_suspend(struct devi=
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

[Severity: Medium]
Can disabling and draining interrupts without clearing
ACP_SW_STATE_CHANGE_STATUS_0TO7 and ACP_SW_STATE_CHANGE_STATUS_8TO11, and
then calling amd_enable_sdw_interrupts() while the bus is clock-stopped,
cause stale pre-suspend status bits to be processed while the link is down?

When a SoundWire interrupt fires just before amd_disable_sdw_interrupts(),
the ACP hard IRQ handler clears ACP_EXTERNAL_INTR_STAT and queues
amd_sdw_irq_thread, leaving the status bits latched in
ACP_SW_STATE_CHANGE_STATUS_0TO7 and ACP_SW_STATE_CHANGE_STATUS_8TO11.
amd_disable_sdw_interrupts() sets interrupt_enabled to false without
clearing those status registers, so an in-flight or cancelled
amd_sdw_irq_thread() exits early without clearing them either:

drivers/soundwire/amd_manager.c:amd_sdw_irq_thread() {
	if (!READ_ONCE(amd_manager->interrupt_enabled))
		return;

	status_change_8to11 =3D readl(amd_manager->mmio + ACP_SW_STATE_CHANGE_STAT=
US_8TO11);
	status_change_0to7 =3D readl(amd_manager->mmio + ACP_SW_STATE_CHANGE_STATU=
S_0TO7);
	...
}

In both amd_suspend() and amd_suspend_runtime() under
AMD_SDW_CLK_STOP_MODE, amd_enable_sdw_interrupts() is called immediately
after amd_sdw_clock_stop() (and in AMD_SDW_POWER_OFF_MODE on ACP63,
amd_suspend_runtime() sets interrupt_enabled back to true).  When a wake
interrupt later runs amd_sdw_irq_thread() during runtime suspend,
amd_sdw_process_wake_event() only queues an asynchronous
pm_request_resume(amd_manager->dev) before amd_sdw_irq_thread() falls
through, reads the stale status bits, and runs
amd_sdw_read_and_process_ping_status() and schedule_work(&amd_sdw_work)
while the clock is still stopped, resulting in MIPI command timeouts.

In addition, amd_sdw_clock_stop() returns 0 on all failure paths while
leaving the SoundWire clock running, so if clock stop fails,
amd_enable_sdw_interrupts() re-enables state-change interrupts on an active
bus as the device enters D3.

>  	} else if (amd_manager->power_mode_mask & AMD_SDW_POWER_OFF_MODE) {
> +		amd_disable_sdw_interrupts(amd_manager);
> +		cancel_work_sync(&amd_manager->amd_sdw_irq_thread);
>  		cancel_work_sync(&amd_manager->amd_sdw_work);
> -		amd_sdw_wake_enable(amd_manager, false);
>  		ret =3D amd_sdw_host_wake_enable_by_rev(amd_manager, false);
>  		if (ret)
>  			return ret;
> @@ -1451,7 +1454,6 @@ static int __maybe_unused amd_suspend(struct device=
 *dev)
>  		ret =3D amd_sdw_clock_stop(amd_manager);
>  		if (ret)
>  			return ret;
> -		amd_disable_sdw_interrupts(amd_manager);
>  		ret =3D amd_disable_sdw_manager(amd_manager);
>  		if (ret)
>  			return ret;

[Severity: Medium]
In AMD_SDW_POWER_OFF_MODE (both here and in amd_suspend_runtime()), can an
in-flight amd_sdw_update_slave_status_work() re-unmask
ACP_SW_STATE_CHANGE_STATUS_MASK_0TO7 and
ACP_SW_STATE_CHANGE_STATUS_MASK_8TO11 after amd_disable_sdw_interrupts()
zeroes them?

CPU0                                  CPU1
amd_suspend_runtime()                 amd_sdw_update_slave_status_work()
  amd_disable_sdw_interrupts()
    writel(0, ..._MASK_0TO7)
    writel(0, ..._MASK_8TO11)
  cancel_work_sync(&amd_sdw_work)
                                        sdw_handle_slave_status()
                                        if (status[0] =3D=3D SDW_SLAVE_ATTA=
CHED)
                                          writel(AMD_SDW_IRQ_MASK_0TO7, ...)
                                          writel(AMD_SDW_IRQ_MASK_8TO11, ..=
.)
                                          <-- masks left enabled

Because the post-clock-stop amd_disable_sdw_interrupts() call was removed,
those mask registers stay set to AMD_SDW_IRQ_MASK_0TO7 and
AMD_SDW_IRQ_MASK_8TO11 after cancel_work_sync(&amd_manager->amd_sdw_work)
returns.  In amd_suspend_runtime(), amd_sdw_wake_enable(amd_manager, true)
then performs a read-modify-write on ACP_SW_STATE_CHANGE_STATUS_MASK_8TO11,
and on ACP63 with wake_en_mask set, interrupt_enabled and
ACP_EXTERNAL_INTR_CNTL are re-enabled with all state-change and PREQ masks
active while the manager is disabled.

> @@ -1491,18 +1493,24 @@ static int __maybe_unused amd_suspend_runtime(str=
uct device *dev)
>  		return 0;
>  	}
>  	if (amd_manager->power_mode_mask & AMD_SDW_CLK_STOP_MODE) {
> -		amd_sdw_wake_enable(amd_manager, true);
> +		amd_disable_sdw_interrupts(amd_manager);
> +		cancel_work_sync(&amd_manager->amd_sdw_irq_thread);
> +		cancel_work_sync(&amd_manager->amd_sdw_work);

[Severity: High]
Can calling cancel_work_sync(&amd_manager->amd_sdw_work) inside
amd_suspend_runtime() deadlock with amd_sdw_update_slave_status_work()?

CPU0                                  CPU1
rpm_suspend(amd_manager->dev)         amd_sdw_update_slave_status_work()
  runtime_status =3D RPM_SUSPENDING
  amd_suspend_runtime()
    cancel_work_sync(&amd_sdw_work)
                                        sdw_handle_slave_status()
                                          sdw_handle_slave_alerts()
                                            pm_runtime_get_sync(&slave->dev)
                                              rpm_resume(&slave->dev, ...)
                                                rpm_resume(bus->dev, 0)
                                                  rpm_resume(amd_manager->d=
ev, 0)
                                                    waits on runtime_status

 *** DEADLOCK ***

Each peripheral slave->dev is a child of bus->dev, which is a child of
amd_manager->dev, and both children are in RPM_SUSPENDED when
amd_manager->dev enters rpm_suspend().  If a peripheral alert schedules
amd_sdw_work before interrupts are disabled and
amd_sdw_update_slave_status_work() starts executing before
cancel_work_sync(&amd_manager->amd_sdw_work) cancels it,
pm_runtime_get_sync(&slave->dev) propagates a synchronous rpm_resume() up
to amd_manager->dev.  Because amd_manager->dev is in RPM_SUSPENDING,
rpm_resume() sleeps on amd_manager->dev->power.wait_queue waiting for
amd_suspend_runtime() to finish, while amd_suspend_runtime() is blocked in
cancel_work_sync(&amd_manager->amd_sdw_work) in both AMD_SDW_CLK_STOP_MODE
and AMD_SDW_POWER_OFF_MODE.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118104353.3315=
56-1-Vijendar.Mukunda@amd.com?part=3D20
