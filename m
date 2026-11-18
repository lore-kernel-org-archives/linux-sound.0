Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795000606;
	b=meajgTSAnFWo7eclRyQ/FB3Ll0zqSa9jUbOIv7fOf27k9sj+EUAQ49iFBkFFLUrIrDMq
	 Qm5CnS8bxAimyJJpt1s45QiR7Mmsk3f1kAdu2X/vZViJXiMYrEhmDktFI6/K2mZt3HljO
	 FhmjvzmzqdPIZB0L4xe3BYTuzqS8pb7UeD7jTrsbxPej3oR3xAKkW4a62/mQ922HNk4nm
	 kqH03uXM9g3kxtBWb5fEBxMxZ+2UrINfnv1oaKpT+95jYwKFDxz6G30TgdNE0xQF28W3Z
	 D2y7Les/NSFRer7ma+JrZCwDHzdEbI/sX0QwC8oVNjpWUCdXdqGE5xuY68jXRl1ZUXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795000606;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=zIoP+n8CbU/AHSgFOUX3txcNMNaTK2obgU4G3l39iEg=;
	b=DgMn6AsJFgBvqp3L8FMxIk67V9dbx6gwahY9RcwVypo1wdW68c9nSX/V3GAVSg+dhutC
	 6s56sWH2Y1UCrp6i8/c9n3h0R33oBrM2EBM5qeTVLTxKPfeOfDvWnjQdl7D+37KENZrTy
	 0RUpLZu101lByhd5OcU7pKp6Ix9yOWKsbF6l/Yk/NWIYvPofUM3QY86Y2nfceNFeUovir
	 bucZKCe3D4jDvcMQIPi2czVUrOvMfk2LwArbiJKAW8B7qTjGLCl/C9IzQfwHEX1fDzx1k
	 bxXHD/fkfbaYPrQqFjwqUOOHOdHpqKlqNco6OnrpcAFsnQjuVXg5Rfv4SLxMF9ImiHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HtpQq64v;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B5F606A320
	for <linux-sound@vger.kernel.org>; Wed, 18 Nov 2026 11:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HtpQq64v
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 581411F000C4;
	Wed, 18 Nov 2026 11:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795000605;
	bh=zIoP+n8CbU/AHSgFOUX3txcNMNaTK2obgU4G3l39iEg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HtpQq64vN3OiZZQzgD0G6s9kaxPqUHI/dKXMXKSDwm5aBJQB1BNaZ+2JjWrfHj1FM
	 /66Boy+NHkbhUKm9FqS+8utZfZzoHyA71Oso/8zIM4DMaX/2KN77emggnGcntmUOub
	 CzCkNAxIywV9CdIIUKhdrY01jd1IIjkPtlRM7YKmKvpqBA2rw1ptuJhGjcb7NFcKQ0
	 LuswWLbjv+kyunyvadQbfY2awRPD1A8gT5vQxRaOZaO+PktM2M23s7meWPzkg7A1vT
	 PeKHDHoj+pzHd5KhohVK4OLX64YXEFF27XgvyTWV7o7bMhYYp/4OMpLs6DEzrQvuCs
	 0VlMLfeDTjQCw==
Message-ID: <sashiko-outbox-220814@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 15/23] soundwire: amd: use interrupt_enabled flag to
 guard IRQ work scheduling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vijendar Mukunda" <Vijendar.Mukunda@amd.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261118104353.331556-16-Vijendar.Mukunda@amd.com>
References: <20261118104353.331556-1-Vijendar.Mukunda@amd.com>
 <20261118104353.331556-16-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 11:16:44 +0000
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
- [Medium] soundwire: amd: uncleared status registers on
  amd_sdw_irq_thread() early return
- [Medium] soundwire: amd: race re-enabling IRQ masks in
  amd_disable_sdw_interrupts()
--

commit 269c03a96e80686f35053a07e902e710a24e59b0
Author: Vijendar Mukunda <Vijendar.Mukunda@amd.com>

soundwire: amd: use interrupt_enabled flag to guard IRQ work scheduling

This commit adds an interrupt_enabled flag to struct amd_sdw_manager to
prevent queued amd_sdw_irq_thread() work from running after interrupt
disabling begins, and restores the flag when re-arming wake interrupts on
ACP6.3 during runtime suspend.

> diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_mana=
ger.c
> index f3e9614b9ac82..5536a4fd137aa 100644
> --- a/drivers/soundwire/amd_manager.c
> +++ b/drivers/soundwire/amd_manager.c
[ ... ]
> @@ -135,6 +136,18 @@ static void amd_disable_sdw_interrupts(struct amd_sd=
w_manager *amd_manager)
>  {
>  	u32 irq_mask;
> =20
> +	/*
> +	 * Clear the flag before updating hardware masks. Work items already
> +	 * queued but not yet started will see the flag false at entry and
> +	 * return early; work items already running will complete their current
> +	 * invocation. Callers that need to ensure no instance of
> +	 * amd_sdw_irq_thread() is executing on return must follow this call
> +	 * with cancel_work_sync(&amd_manager->amd_sdw_irq_thread). Once the
> +	 * mask registers are written, the ACP hardware will not assert any new
> +	 * SDW interrupt.
> +	 */
> +	WRITE_ONCE(amd_manager->interrupt_enabled, false);
> +
>  	mutex_lock(amd_manager->acp_sdw_lock);
>  	irq_mask =3D sdw_manager_reg_mask_array[amd_manager->instance];
>  	amd_updatel(amd_manager->acp_mmio, ACP_EXTERNAL_INTR_CNTL(amd_manager->=
instance),

[Severity: Medium]
Can an in-flight amd_sdw_update_slave_status_work() overwrite the zeroed
ACP_SW_STATE_CHANGE_STATUS_MASK_0TO7 and
ACP_SW_STATE_CHANGE_STATUS_MASK_8TO11 registers after
amd_disable_sdw_interrupts() returns?

CPU0                                  CPU1 (kworker)
amd_suspend_runtime()
  ...
  amd_disable_sdw_interrupts()
    WRITE_ONCE(interrupt_enabled,
               false)
    writel(0, ..._MASK_0TO7)
    writel(0, ..._MASK_8TO11)
                                      amd_sdw_update_slave_status_work()
                                        sdw_handle_slave_status()
                                        writel(AMD_SDW_IRQ_MASK_0TO7,
                                               ..._MASK_0TO7)
                                        writel(AMD_SDW_IRQ_MASK_8TO11,
                                               ..._MASK_8TO11)
  amd_sdw_wake_enable(..., true)
  WRITE_ONCE(interrupt_enabled, true)
  amd_updatel(...,
              ACP_EXTERNAL_INTR_CNTL,
              val, val)  <-- non-wake state-change IRQs left unmasked

Unlike sdw_cdns_enable_interrupt(), amd_disable_sdw_interrupts() zeroes
the mask registers before callers drain amd_manager->amd_sdw_work with
cancel_work_sync() (including after commit "soundwire: amd: fix interrupt
gate and work drain ordering in PM ops"), and
amd_sdw_update_slave_status_work() restores AMD_SDW_IRQ_MASK_0TO7 and
AMD_SDW_IRQ_MASK_8TO11 without checking interrupt_enabled:

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

In AMD_SDW_POWER_OFF_MODE runtime suspend, amd_sdw_wake_enable() then
performs a read-modify-write on ACP_SW_STATE_CHANGE_STATUS_MASK_8TO11
that preserves those re-enabled mask bits, and on ACP6.3 with
wake_en_mask set, amd_suspend_runtime() sets interrupt_enabled back to
true and re-opens ACP_EXTERNAL_INTR_CNTL, leaving non-wake state-change
interrupts unmasked and deliverable while the manager is suspended.

> @@ -1111,6 +1124,9 @@ static void amd_sdw_irq_thread(struct work_struct *=
work)
>  	u32 status_change_8to11;
>  	u32 status_change_0to7;
> =20
> +	if (!READ_ONCE(amd_manager->interrupt_enabled))
> +		return;
> +
>  	status_change_8to11 =3D readl(amd_manager->mmio + ACP_SW_STATE_CHANGE_S=
TATUS_8TO11);
>  	status_change_0to7 =3D readl(amd_manager->mmio + ACP_SW_STATE_CHANGE_ST=
ATUS_0TO7);
>  	if (!status_change_0to7 && !status_change_8to11)

[Severity: Medium]
Does returning early here leave ACP_SW_STATE_CHANGE_STATUS_8TO11 and
ACP_SW_STATE_CHANGE_STATUS_0TO7 latched in hardware across runtime
suspend?

When a SoundWire interrupt fires shortly before
amd_disable_sdw_interrupts(), the hardirq handler clears
ACP_EXTERNAL_INTR_STAT and queues amd_sdw_irq_thread, leaving the status
bits latched in ACP_SW_STATE_CHANGE_STATUS_8TO11 and
ACP_SW_STATE_CHANGE_STATUS_0TO7 until the end of amd_sdw_irq_thread().
Because neither amd_disable_sdw_interrupts() nor this early return clears
those status registers (even after commit "soundwire: amd: fix interrupt
gate and work drain ordering in PM ops" drains the workqueues), the
pre-suspend status bits remain set when amd_suspend_runtime() restores
interrupt_enabled to true on ACP6.3 in AMD_SDW_POWER_OFF_MODE.

When a wake interrupt later arrives, amd_sdw_irq_thread() reads the stale
PREQ or state-change bits alongside AMD_SDW_WAKE_STAT_MASK, calls
asynchronous pm_request_resume() in amd_sdw_process_wake_event(), clears
only AMD_SDW_WAKE_STAT_MASK, and falls through to
amd_sdw_read_and_process_ping_status() or amd_sdw_update_slave_status()
and schedule_work(&amd_manager->amd_sdw_work) while the manager is still
disabled and clock-stopped.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118104353.3315=
56-1-Vijendar.Mukunda@amd.com?part=3D15
