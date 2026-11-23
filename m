Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795454836;
	b=0VhB6fjV5CZa0SJhRMr5HOY5PGAKkObe9ubrk+ZsNhH8ehe37nw9YiSjiwvi/kjpL2aX
	 2obP4opw4tmYRq65BYUEYX5HrrXf+9pX/pE+0pmmlUBLI76qDsj/Vfm5Uc0ltrtmexxVt
	 iWCPWkTpKgNHIuUAdST2R2y4MrT2Q38cZepgecNfY4K5arBZZLAA4Vp514qVXktdutzw2
	 6dK2CtejDTwmTx+oYfptbXbfjgsjlCZ/sxUtSs07+6o2T6oZQQSHpLMUUamc+jiooCMpM
	 1nEvmWouIpEa8ZbFwWSfjK6P2w8MMy8lBZlerMf4N9SZuC4w5jQWDDF0KWd6gMsQKQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795454836;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=A4Q4tMrcXUJbeWRhvb4s2YCLtE9sZ9S+n9E2tFD96WE=;
	b=rBlrjHR4XUHBXe7O9W3+Q0ruFgdg1w3heHnQcHdG8b8IY7+bygUxAModx9cA2eGW4yQr
	 KPQjSg93OS1PVPwvt5d5qHqGgp1wqAU7xrXwULLdRBDdBTWbBhybcBz/+jY6Vu/6WQyFp
	 6UlPjYu5hxX5F861XpWIpOa0ucHRt0yNi48h3iw/n/V+dgY0TWpvijk0YUw4Ca7kiO91A
	 iwnO44mV4cfHTC9c37jfrduzEOVk4fpCRoscTaXxyPqx5n3FjaQmKTVClWOnQ1JmJgVZE
	 0rQR2v/vtfAWicY2Z6IsqEBzI68l2m4nlobaQV+hVWYnda29dIChNsk7PTbM8gMP+XA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Tt4auPmH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD076606A32E
	for <linux-sound@vger.kernel.org>; Mon, 23 Nov 2026 17:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Tt4auPmH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E3CC1F000EE;
	Mon, 23 Nov 2026 17:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795454836;
	bh=A4Q4tMrcXUJbeWRhvb4s2YCLtE9sZ9S+n9E2tFD96WE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Tt4auPmHMxg4nE8FxQbbSovAFgrt0twSzcQFD14IEVIjNcPGztYqqQNhJ2ixTi6ru
	 ecUYGNA3fW+n5VUIi8lVgntoy3lL28eulujoKpDwSFtq5LanWM/SPNwvRzyYbCsFHj
	 UtUjKQuzlh1gybmXt3bqvaTvleXggylSkOD3taP8ACzup1f04GNbjwtFq5AJ0cQ/7b
	 p0gZVlX/gO7xmaSvX+TffE5gRObEmt0+fUi0G3JDasDSg/TpiPi0C4q3EktUHb/F9t
	 Y42DeXnSl4uO2uyTfUhLlE8+JU0NRFIw2SQMJ5YuSYkyq5M8hLFhJrUEq2pJbT/xsL
	 wRVAU4f6e2e0g==
Message-ID: <sashiko-outbox-229743@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 12/24] soundwire: amd: fix work drain ordering in
 remove path
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vijendar Mukunda" <Vijendar.Mukunda@amd.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261123170520.1380924-13-Vijendar.Mukunda@amd.com>
References: <20261123170520.1380924-1-Vijendar.Mukunda@amd.com>
 <20261123170520.1380924-13-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 17:27:15 +0000
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

commit a1b902c580b9ecf41d510f5e3161a9e0ef33c879
Author: Vijendar Mukunda <Vijendar.Mukunda@amd.com>

soundwire: amd: fix work drain ordering in remove path

This commit updates amd_sdw_manager_remove() to disable SoundWire
interrupts before cancelling amd_sdw_irq_thread and amd_sdw_work.

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

[Severity: Medium]
Can an in-flight parent ACP hard IRQ handler queue amd_sdw_irq_thread
after cancel_work_sync() returns, causing a use-after-free of
amd_manager?

The commit message notes that synchronize_irq() is skipped because
cancel_work_sync() will drain work queued by an IRQ handler already in
flight.  However, cancel_work_sync() only drains work that is already
pending or running at the moment it checks, and leaves the work item
enabled on return.  If the platform device is unbound while the parent
ACP PCI IRQ is active, an IRQ asserted just before
amd_disable_sdw_interrupts() masks ACP_EXTERNAL_INTR_CNTL can race with
removal:

CPU0                                  CPU1 (<hardirq>)
amd_sdw_manager_remove()              acp63_irq_handler()
                                        readl(... + ACP_EXTERNAL_INTR_STAT)
                                        amd_manager =3D dev_get_drvdata(...)
  amd_disable_sdw_interrupts()
  cancel_work_sync(&...->amd_sdw_irq_thread)
  cancel_work_sync(&...->amd_sdw_work)
                                        schedule_work(&...->amd_sdw_irq_thr=
ead)
device_unbind_cleanup()
  devres_release_all()
                                      amd_sdw_irq_thread()
                                        amd_manager->... <-- use-after-free

Even with the interrupt_enabled check added in the later commit
"soundwire: amd: guard IRQ work with interrupt_enabled and clear STATUS",
amd_sdw_irq_thread() still reads amd_manager->interrupt_enabled after
devres_release_all() has freed amd_manager.

Using disable_work_sync() instead of cancel_work_sync() (or synchronizing
with the parent IRQ after masking interrupts) would prevent new enqueues
after draining finishes.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123170520.1380=
924-1-Vijendar.Mukunda@amd.com?part=3D12
