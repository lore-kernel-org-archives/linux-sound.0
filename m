Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795511938;
	b=IMYGOzMQ2HENMDV6QHzp+0v2OG2FqPSF3dw1ddA8Z3Rc7pQI0ld4oZJQlvC3IZKCg7nv
	 d13Ds+LlB0g9GoKrpuH8sD40F3Ss1GHlhf1+Hi9PzTBV38g9/jNortVmMmiI5SLeOgGsT
	 sdPxQlU7X1KqZhgXZpcnqOeUisipWoaNRB37fHJOiEONkjFJuOcxGTCY6jq+sjOZp9uvm
	 fxtPifoQrRXKoMyQUrf9GcVlvjL0PkDc6Ij1YFLIFxKterSpZ57Rb6dygAigHKTXnxAlr
	 LqwHuuS/zuYIFdGIz2yKRapkqYkMcoLp0rQsgmH3SEDdqF4D2gA4Ii/Fdc/uFyhAeyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795511938;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=UIWS9+gwagOMcHu/UOFkzQ8nSvFuta/ArGhk8tieBbQ=;
	b=ChIdK6KTGFt6Kmteq6qArwRR85dbuz2Kwv67hyerWLHJEk7oNowjxe5IIfH4AQxmapgS
	 N1SMtAACQlU9N1qpaQb1Qe31LzTt3JTCwnkTFW7LqAfYB4UBIutLZ3K9TbcsrNzzvRoo3
	 nINw9L3Z83JM1mH8I2LgUrYRYtqqipH4Uy6E7Q2JMAQ/BM16/8wkoZplvFRUdDW/EpabU
	 RO2kWBy8lYGTzUx8DHWT6bXOBr/69ksU/EV2zHX29WdaD7dJOxrF1oSCcWRX3SdP+b3GJ
	 SqZ1t6giWr9c0mgQ4az8Jc9QyNCH8xAcmZWn6bdQFjhvtxSenPOPhazHS3Y2eHdXNKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X9c+BPNf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B2D606A6A7
	for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 09:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X9c+BPNf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 830991F000C4;
	Tue, 24 Nov 2026 09:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795511937;
	bh=UIWS9+gwagOMcHu/UOFkzQ8nSvFuta/ArGhk8tieBbQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=X9c+BPNfg+ORT5uhYNekbGxTwDoSQqdQNiD6WbiCQ6QoPIK9kd3bO/e5W1cBFAahi
	 zgoM6YmoKWXGod3V1vbcmfCXgajmUvxda10oOCoILHDEyBORVhlQfY7QgHzFQGS2zu
	 Q0w6K1LgVjQBsfWg/om5HUu4SV4uPH7b0QBYrYPqBx8tyfCG+3PWXAFZ1t17Zk01lU
	 bNx9tVvZkWPmRuvFuoC+c4L6RIkH3MDDWJhBE3VNvjOf7TjP790rX028fqlOGIiPkm
	 TUl2pZG7YvUo0Dczpgz14ocs28xBosit3PIenoqihvUIY4ePUEprRmi26f45yPlbSX
	 pd5t1WyAPmJEA==
Message-ID: <sashiko-outbox-230818@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 15/24] soundwire: amd: guard IRQ work with
 interrupt_enabled and clear STATUS
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vijendar Mukunda" <Vijendar.Mukunda@amd.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261124085033.682755-16-Vijendar.Mukunda@amd.com>
References: <20261124085033.682755-1-Vijendar.Mukunda@amd.com>
 <20261124085033.682755-16-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 09:18:57 +0000
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
- [Medium] soundwire: amd: race re-enabling IRQ masks in
  amd_disable_sdw_interrupts()
--

commit 4a620e80f932c593cc068162973ef08fa381e1c4
Author: Vijendar Mukunda <Vijendar.Mukunda@amd.com>

soundwire: amd: guard IRQ work with interrupt_enabled and clear STATUS

This commit adds an interrupt_enabled flag to struct amd_sdw_manager to
prevent queued IRQ work from executing while interrupts are being disabled,
and clears stale status registers before enabling interrupts or re-arming
ACP6.3 wake delivery.

> diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_mana=
ger.c
> index f3e9614b9ac82..9f6b3366abbed 100644
> --- a/drivers/soundwire/amd_manager.c
> +++ b/drivers/soundwire/amd_manager.c
[ ... ]
> @@ -135,6 +138,26 @@ static void amd_disable_sdw_interrupts(struct amd_sd=
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
> +	 *
> +	 * ACP_EXTERNAL_INTR_CNTL is the top-level gate: clearing it here
> +	 * stops interrupt delivery to the CPU. An in-flight
> +	 * amd_sdw_update_slave_status_work() on the SDW_SLAVE_ATTACHED path
> +	 * may re-write ACP_SW_STATE_CHANGE_STATUS_MASK_0TO7 and _MASK_8TO11
> +	 * after this function returns, but that work never touches
> +	 * ACP_EXTERNAL_INTR_CNTL, so the gate remains closed and no interrupt
> +	 * can reach the CPU.
> +	 */
> +	WRITE_ONCE(amd_manager->interrupt_enabled, false);
> +
>  	mutex_lock(amd_manager->acp_sdw_lock);
>  	irq_mask =3D sdw_manager_reg_mask_array[amd_manager->instance];
>  	amd_updatel(amd_manager->acp_mmio, ACP_EXTERNAL_INTR_CNTL(amd_manager->=
instance),
[ ... ]
> @@ -1481,6 +1516,9 @@ static int __maybe_unused amd_suspend_runtime(struc=
t device *dev)
>  				return ret;
>  		} else if ((amd_manager->acp_rev =3D=3D ACP63_PCI_REV_ID) &&
>  			   amd_manager->wake_en_mask) {
> +			writel(0x00, amd_manager->mmio + ACP_SW_STATE_CHANGE_STATUS_8TO11);
> +			writel(0x00, amd_manager->mmio + ACP_SW_STATE_CHANGE_STATUS_0TO7);
> +			WRITE_ONCE(amd_manager->interrupt_enabled, true);
>  			mutex_lock(amd_manager->acp_sdw_lock);
>  			val =3D sdw_manager_reg_mask_array[amd_manager->instance];
>  			amd_updatel(amd_manager->acp_mmio,

[Severity: Medium]
Can an in-flight amd_sdw_update_slave_status_work() re-enable
ACP_SW_STATE_CHANGE_STATUS_MASK_0TO7 and _MASK_8TO11 right before
amd_suspend_runtime() re-opens ACP_EXTERNAL_INTR_CNTL for ACP6.3 wake?

The comment in amd_disable_sdw_interrupts() notes that an in-flight
amd_sdw_update_slave_status_work() on the SDW_SLAVE_ATTACHED path may
overwrite ACP_SW_STATE_CHANGE_STATUS_MASK_0TO7 and _MASK_8TO11 after
amd_disable_sdw_interrupts() clears them, and relies on
ACP_EXTERNAL_INTR_CNTL staying closed.  However, in AMD_SDW_POWER_OFF_MODE
on ACP6.3 with wake_en_mask set, amd_suspend_runtime() then preserves
those mask bits and re-opens the top-level gate:

CPU0                                  kworker
amd_suspend_runtime()
  ...
  amd_deinit_sdw_manager()
    amd_disable_sdw_interrupts()
      interrupt_enabled =3D false
      ACP_EXTERNAL_INTR_CNTL &=3D ~mask
      MASK_0TO7 =3D 0
      MASK_8TO11 =3D 0
                                      amd_sdw_update_slave_status_work()
                                        MASK_0TO7 =3D AMD_SDW_IRQ_MASK_0TO7
                                        MASK_8TO11 =3D AMD_SDW_IRQ_MASK_8TO=
11
  amd_sdw_wake_enable(..., true)
    MASK_8TO11 |=3D AMD_SDW_WAKE_INTR_MASK
  interrupt_enabled =3D true
  ACP_EXTERNAL_INTR_CNTL |=3D mask  <-- non-wake IRQs unmasked while suspen=
ded

Because amd_sdw_wake_enable() performs a read-modify-write on
ACP_SW_STATE_CHANGE_STATUS_MASK_8TO11, the non-wake state-change and PREQ
interrupt masks written by the worker remain enabled once
amd_suspend_runtime() sets interrupt_enabled back to true and re-enables
ACP_EXTERNAL_INTR_CNTL, allowing amd_sdw_irq_thread() to process non-wake
interrupts while the manager is disabled and clock-stopped.

Checking READ_ONCE(amd_manager->interrupt_enabled) in
amd_sdw_update_slave_status_work() before unmasking, or draining
amd_sdw_work before clearing the mask registers in
amd_disable_sdw_interrupts(), would avoid this race.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124085033.6827=
55-1-Vijendar.Mukunda@amd.com?part=3D15
