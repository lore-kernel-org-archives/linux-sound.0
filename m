Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795455170;
	b=MAiFyhMcLQ2LcTfWE73S9OqpyPt8JjFLjaIy1Vx37TH2Y/0w1ggHqUFERu0SaTijInIe
	 j0N4MIPEPe49+yhWAZjSUGKqljSUJaJqs45JYiJCaCr2a+sTemwDGfBC/vanU8MwrWUtK
	 /MgnB4i4Dg6dsAaUt+FT/YnkDIp5UtIt7J4XiY4mW/7ao7rqOxSK8QKSUv9aW/eXz0hle
	 qn3+ZACGzd5xrRBGP1eV4g8ZyJ5yRsOtUlmLnrzVSHnLQD8LcIJg40Uocx4h608P/q4qG
	 grvE0jC7D1JxxMgSsO4FitLzWxuT0x/G2JETQ2r9lyYMQPzpznEqT0iHWn+P8RtC7Hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795455170;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=uUMdXYiobc0sZQAmwb7KIKVTQc4FrSyRGws3mfWr1kY=;
	b=qOaxL4FQlBcN/bynlWroTFhAJ8ButykeBsfhfx5SzWgieQOrVhwkaTKWeDthm/pH/k38
	 91OuFaQb5xGSYGEc4U8tblIq5Wdblj2+BsYdcR41/NsALM6jBjf0U60P7nis/vmdHxpmu
	 Oy9e8GdZpGLep5r/E8m4gil1JLbToF/jY2WAxLWkK4P7VWl17P6oChTqnwXeg0Ox7IzRx
	 o6W99z5tdk9WA+gaXL4V+bacAbjDfcOGsesYZnGBx3FBOOywIsUBiH2HU4HgXpFA/Abf3
	 pU96jTuxbmoAlA4K3KEKstQMhpzKdOGG2XqLisc/ZxLtFj25E9tNV6EwskJUqs2q9AA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="EobWHG/c";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2468E606A31A
	for <linux-sound@vger.kernel.org>; Mon, 23 Nov 2026 17:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EobWHG/c
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22D641F000C0;
	Mon, 23 Nov 2026 17:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795455169;
	bh=uUMdXYiobc0sZQAmwb7KIKVTQc4FrSyRGws3mfWr1kY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EobWHG/cO3PonBoTI1qpPTCC18STkEc/enpw8njvod9MlDqDZSheQFAMmjLTIrMda
	 CkHYjHZn3UZ0moI7C9Vk3G8/nRCgKc65hQOF3lq6vATZYIgQ/4uDfj8/1/U9SgZWq8
	 NvmCiWSN0agF5li7NbaTwkwojPdsX+vrNVn2BsHAAEbe6ApMnxO9TxloFqeLom+OZY
	 NDbCc88rC3jZSS4AjLdJp8eTunqMBant0FO7w1HEg7A+NQ+krEUv+ZRIIAW7fHtcHJ
	 q6/6Ix7e64j1cFxsMdqBwpPdtuHDsYj1UwzR0m+W9o8dB8OdNDlMW7cJwxIPdAR9Cz
	 pvXszYWouq2aA==
Message-ID: <sashiko-outbox-229759@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 20/24] soundwire: amd: fix interrupt gate and work
 drain ordering in PM ops
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vijendar Mukunda" <Vijendar.Mukunda@amd.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261123170520.1380924-21-Vijendar.Mukunda@amd.com>
References: <20261123170520.1380924-1-Vijendar.Mukunda@amd.com>
 <20261123170520.1380924-21-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 17:32:48 +0000
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
- [Medium] soundwire: amd: draining amd_sdw_work re-unmasks IRQs in
  POWER_OFF_MODE
--

commit eb9a0322b337ad61ced64ca897101c35c70d2a33
Author: Vijendar Mukunda <Vijendar.Mukunda@amd.com>

soundwire: amd: fix interrupt gate and work drain ordering in PM ops

This commit disables SoundWire interrupts and drains amd_sdw_irq_thread
and amd_sdw_work before stopping the clock in amd_suspend() and
amd_suspend_runtime().

> diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_mana=
ger.c
> index 54f337e22b03a..862ca8cf575b5 100644
> --- a/drivers/soundwire/amd_manager.c
> +++ b/drivers/soundwire/amd_manager.c
> @@ -1449,17 +1449,20 @@ static int __maybe_unused amd_suspend(struct devi=
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
>  	} else if (amd_manager->power_mode_mask & AMD_SDW_POWER_OFF_MODE) {
> +		amd_disable_sdw_interrupts(amd_manager);
> +		cancel_work_sync(&amd_manager->amd_sdw_irq_thread);
>  		cancel_work_sync(&amd_manager->amd_sdw_work);
> -		amd_sdw_wake_enable(amd_manager, false);
>  		ret =3D amd_sdw_host_wake_enable_by_rev(amd_manager, false);
>  		if (ret)
>  			return ret;
> @@ -1470,7 +1473,6 @@ static int __maybe_unused amd_suspend(struct device=
 *dev)
>  		ret =3D amd_sdw_clock_stop(amd_manager);
>  		if (ret)
>  			return ret;
> -		amd_disable_sdw_interrupts(amd_manager);
>  		ret =3D amd_disable_sdw_manager(amd_manager);
>  		if (ret)
>  			return ret;
> @@ -1510,18 +1512,24 @@ static int __maybe_unused amd_suspend_runtime(str=
uct device *dev)
>  		return 0;
>  	}
>  	if (amd_manager->power_mode_mask & AMD_SDW_CLK_STOP_MODE) {
> -		amd_sdw_wake_enable(amd_manager, true);
> +		amd_disable_sdw_interrupts(amd_manager);
> +		cancel_work_sync(&amd_manager->amd_sdw_irq_thread);
> +		cancel_work_sync(&amd_manager->amd_sdw_work);
>  		ret =3D amd_sdw_host_wake_enable_by_rev(amd_manager, true);
>  		if (ret)
>  			return ret;
>  		ret =3D amd_sdw_clock_stop(amd_manager);
>  		if (ret)
>  			return ret;
> +		amd_enable_sdw_interrupts(amd_manager);
> +		amd_sdw_wake_enable(amd_manager, true);
>  	} else if (amd_manager->power_mode_mask & AMD_SDW_POWER_OFF_MODE) {
> +		amd_disable_sdw_interrupts(amd_manager);
> +		cancel_work_sync(&amd_manager->amd_sdw_irq_thread);
> +		cancel_work_sync(&amd_manager->amd_sdw_work);
>  		ret =3D amd_sdw_clock_stop(amd_manager);
>  		if (ret)
>  			return ret;
> -		amd_disable_sdw_interrupts(amd_manager);
>  		ret =3D amd_disable_sdw_manager(amd_manager);
>  		if (ret)
>  			return ret;

[Severity: Medium]
Can moving amd_disable_sdw_interrupts() before cancel_work_sync() in
AMD_SDW_POWER_OFF_MODE leave ACP_SW_STATE_CHANGE_STATUS_MASK_0TO7 and
ACP_SW_STATE_CHANGE_STATUS_MASK_8TO11 unmasked after amd_sdw_work drains?

CPU0                                kworker
amd_suspend_runtime()               amd_sdw_update_slave_status_work()
  amd_disable_sdw_interrupts()
    writel(0, ..._MASK_0TO7)
    writel(0, ..._MASK_8TO11)
  cancel_work_sync(&amd_sdw_work)
                                      if (status[0] =3D=3D SDW_SLAVE_ATTACH=
ED)
                                        writel(AMD_SDW_IRQ_MASK_0TO7, ...)
                                        writel(AMD_SDW_IRQ_MASK_8TO11, ...)
  ...
  amd_sdw_wake_enable(..., true)
    /* RMW preserves 0x000c7777 */
  /* ACP63: re-enables ACP_EXTERNAL_INTR_CNTL */
                                    <-- state-change IRQs unmasked in D3

As noted in amd_disable_sdw_interrupts(), an in-flight
amd_sdw_update_slave_status_work() on the SDW_SLAVE_ATTACHED path rewrites
both status mask registers before cancel_work_sync(&amd_manager->amd_sdw_wo=
rk)
returns.  The comment in amd_disable_sdw_interrupts() assumes this is safe
because ACP_EXTERNAL_INTR_CNTL remains closed, and in AMD_SDW_CLK_STOP_MODE
amd_enable_sdw_interrupts() overwrites the masks anyway.

In AMD_SDW_POWER_OFF_MODE, however, removing the post-clock-stop
amd_disable_sdw_interrupts() call means nothing re-zeroes the mask
registers after amd_sdw_work finishes.  In amd_suspend_runtime(),
amd_sdw_wake_enable() then does a read-modify-write on
ACP_SW_STATE_CHANGE_STATUS_MASK_8TO11 that preserves AMD_SDW_IRQ_MASK_8TO11
alongside AMD_SDW_WAKE_INTR_MASK, and on ACP63_PCI_REV_ID with
wake_en_mask set, the driver sets interrupt_enabled =3D true and re-opens
ACP_EXTERNAL_INTR_CNTL while all peripheral state-change and PREQ masks
are still enabled with the manager powered off.

Zeroing ACP_SW_STATE_CHANGE_STATUS_MASK_0TO7 and
ACP_SW_STATE_CHANGE_STATUS_MASK_8TO11 again after
cancel_work_sync(&amd_manager->amd_sdw_work) in the POWER_OFF_MODE paths
would ensure only the wake interrupt is unmasked.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123170520.1380=
924-1-Vijendar.Mukunda@amd.com?part=3D20
