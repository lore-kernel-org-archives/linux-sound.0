Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795512453;
	b=CvUeW374vob6CSsIPH6oDzB9Ftru5T10NEFndl8yHcqzY8gGx/KM2UxD3gJ3TV4kMU4B
	 dCe1dQTOnb4oKlUN7g1yH7+ucU0jl0PRG1Hf4Gwx1IkdDsw/rn/Z4lL3Zv5pTIvf8z80d
	 ErcGEMe91rSC+ghulZTtSgT4/K/RzjvfMUoeA/g2tCwHlyzhLpcdettkTqjAyIUWtr1xt
	 vwyK7jZMscXLUfsET1n7tYVJUX3r+2kZHLW3X5S9aE3i9BaQy8BIvyxTeDWFrLjtlvuU1
	 LQILvvQ59nOoR/bgQN+c4HIk3+t9NmVvEZcIzEBj0hKB3s/Vg+U7g1oK1csxEZWEKtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795512453;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=zYaDTtkHWGagRY8wVPTX8n3MjZaGNdkDCzdUeGZk8V8=;
	b=JBCwhiAkW+DeBw8nTWpLZrUpWdhsnNhg7Eer2T+omq82K8Fy43romtgzaZq5OlEUwxvz
	 g+2qjyKavYjbuku9IbcPg+Um9D1hIpbos/6iMuQgWAd1CV5Jb5dkuOsMqvEDLcKl+3yZy
	 TJbGXVQeQnDZatPgehq3KiPhlpdG4dTtbGFWVRvWGcHDYdTmEV6lIUOq5D1ekd+o2UkOx
	 IX+eDa1H8KJIbpcvu6dI29xAz66RR3HOHYrJ/OozhowN2wXzL2Omky0hmiv+m4xYowx73
	 5vWjCDLwZdM4seBm2cuwpVuOg4da5V8F0Ts+mG+LAvaxWSg/b+qL0aWHUKYg1MVeMqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TsMfGY01;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C0C606A31E
	for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 09:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TsMfGY01
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06D2E1F000C6;
	Tue, 24 Nov 2026 09:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795512453;
	bh=zYaDTtkHWGagRY8wVPTX8n3MjZaGNdkDCzdUeGZk8V8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TsMfGY011tENu6YNGXQhVNXk2SPF/fGSOI0gaVdUqZXxPWPbbsyxDTx36v2i+WBSn
	 LT37ltbtylAPCv1EpwjC4ORMsYKcIUKQkuDyEUKQgJRLLNATgu6hOu+MGFHwSv7JHJ
	 PWpm3MinOHFljCVnltJRVy/IZ4uzKc9DNRh/YteRDUwHVMn8fq/la8apqXGu144mhW
	 H2cUo7VFkN5fQuwZvgYGCFD/KDzJAqIk5w3GfaSGOf0b1mED+MUq8P6isnfsaWW543
	 a24m8Q+KCzKDncRnLBH2BBq0WLJzKsjjBPsX48OOIlUNsPzVR1f3eLw1eaJkruAXcy
	 eUYFmfEDbxASA==
Message-ID: <sashiko-outbox-230836@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 24/24] soundwire: bus: use pm_runtime_get_if_active()
 in sdw_handle_slave_alerts()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vijendar Mukunda" <Vijendar.Mukunda@amd.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261124085033.682755-25-Vijendar.Mukunda@amd.com>
References: <20261124085033.682755-1-Vijendar.Mukunda@amd.com>
 <20261124085033.682755-25-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 09:27:31 +0000
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
- [High] soundwire: bus: sdw_handle_slave_alerts() drops alerts during
  manager resume
- [Medium] soundwire: bus: unserviced alert in sdw_handle_slave_alerts()
  on suspend race
--

commit ce0ecb1363ee793ca8d8a1d1cf6efec9d612e28a
Author: Vijendar Mukunda <Vijendar.Mukunda@amd.com>

soundwire: bus: use pm_runtime_get_if_active() in sdw_handle_slave_alerts()

This commit uses pm_runtime_get_if_active() on the parent manager device in
sdw_handle_slave_alerts() before calling pm_runtime_resume_and_get() on the
slave device to avoid a runtime PM deadlock with the manager's
runtime_suspend callback.

> diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
> index aeaae5a57c89d..0f8d634779270 100644
> --- a/drivers/soundwire/bus.c
> +++ b/drivers/soundwire/bus.c
> @@ -1667,15 +1667,52 @@ static int sdw_handle_slave_alerts(struct sdw_sla=
ve *slave)
>  	u8 buf, buf2[2];
>  	bool parity_check;
>  	bool parity_quirk;
> +	bool have_pm_ref =3D false;
> +	bool have_mgr_ref =3D false;
> +	struct device *mgr_dev =3D slave->bus->dev->parent;
> =20
>  	sdw_modify_slave_status(slave, SDW_SLAVE_ALERT);
> =20
> -	ret =3D pm_runtime_get_sync(&slave->dev);
> +	ret =3D pm_runtime_get_if_active(mgr_dev);
> +	if (ret =3D=3D 0) {
> +		/*
> +		 * Manager is not RPM_ACTIVE; slave is already RPM_SUSPENDED
> +		 * by PM ordering. Return early to avoid I/O on inaccessible
> +		 * hardware and to prevent a deadlock: if the manager is in
> +		 * RPM_SUSPENDING, its runtime_suspend callback may be blocked
> +		 * in cancel_work_sync() waiting for this work, while this work
> +		 * would block in pm_runtime_resume_and_get() waiting for the
> +		 * manager to complete its suspend.
> +		 *
> +		 * When the SoundWire link enters clock-stop mode, the MIPI
> +		 * SoundWire spec guarantees the peripheral re-asserts the
> +		 * alert after clock resume, so the interrupt is deferred
> +		 * rather than dropped. When the link fully powers off
> +		 * (e.g. D3 or equivalent), the peripheral loses power and
> +		 * its alert state does not survive; the early return is
> +		 * harmless.
> +		 */
> +		dev_dbg(&slave->dev, "Alert deferred: manager not active\n");
> +		return 0;
> +	}

[Severity: High]
Can this early return drop peripheral alerts when mgr_dev is in
RPM_RESUMING?

pm_runtime_get_if_active(mgr_dev) returns 0 whenever
mgr_dev->power.runtime_status !=3D RPM_ACTIVE, including when mgr_dev is in
RPM_RESUMING.  All in-tree manager drivers restart the SoundWire clock and
enable peripheral interrupts inside their runtime_resume callbacks while
mgr_dev is still in RPM_RESUMING (for example,
intel_start_bus_after_clock_stop() restarts the clock, calls
sdw_cdns_enable_interrupt(), and then sleeps in
sdw_cdns_check_self_clearing_bits()).

CPU0                                    CPU1 (kworker)
rpm_resume(mgr_dev)
  mgr_dev->power.runtime_status =3D RPM_RESUMING
  intel_resume_runtime()
    intel_start_bus_after_clock_stop()
      sdw_cdns_clock_restart()
      sdw_cdns_enable_interrupt()
      <peripheral alert IRQ>
                                        cdns_update_slave_status_work()
                                          clear CDNS_MCP_SLAVE_INTSTAT0/1
                                          sdw_handle_slave_status()
                                            sdw_handle_slave_alerts()
                                              pm_runtime_get_if_active(...)
                                              return 0  <-- alert not clear=
ed
      sdw_cdns_check_self_clearing_bits()
  mgr_dev->power.runtime_status =3D RPM_ACTIVE

Similarly, in amd_sdw_irq_thread(), a wake event and a peripheral status
change arriving together queue an asynchronous pm_request_resume(mgr_dev),
schedule amd_sdw_work, and clear ACP_SW_STATE_CHANGE_STATUS_0TO7/8TO11 while
mgr_dev is still RPM_SUSPENDED or RPM_RESUMING.

Because the manager status-change interrupt registers have already been
cleared and the clock is running, returning without clearing SDW_SCP_INT1
leaves the peripheral continuously reporting SDW_SLAVE_ALERT in PING frames
with no new ATTACHED-to-ALERT edge to re-trigger the manager interrupt once
mgr_dev reaches RPM_ACTIVE.

[Severity: Medium]
When mgr_dev is in RPM_SUSPENDING and sdw_handle_slave_alerts() returns 0
here to avoid the cancel_work_sync() deadlock, what will resume the manager
to service the deferred alert?

Without calling pm_request_resume(mgr_dev) (or pm_request_resume(&slave->de=
v))
before returning, mgr_dev->power.deferred_resume remains false in
rpm_suspend().  Once cancel_work_sync() finishes, the manager stops the
SoundWire clock and enters RPM_SUSPENDED.  A peripheral can only re-assert
its alert in PING frames after the clock resumes, so if nothing triggers a
runtime resume (for example, on a non-wake-capable peripheral), the manager
stays suspended and the alert goes unserviced; in AMD_SDW_POWER_OFF_MODE or
SDW_INTEL_CLK_STOP_BUS_RESET, only the manager controller powers down while
external codec peripherals remain powered, and the later bus reset on
manager resume clears the peripheral's SCP interrupt state.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124085033.6827=
55-1-Vijendar.Mukunda@amd.com?part=3D24
