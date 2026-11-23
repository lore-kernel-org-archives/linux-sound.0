Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795455188;
	b=DWrcOsHZO2jh4gPN9CNiCFkhTGf1BrKiOJwEAHAj21cEdVaRTGov6kQyETREtgi2R5/G
	 Mej4eNncBQ2kHidU1kOk3RR8FUhclLW281uuGS+n1GorD57BG/wAte0W16Tt+vxPuk8ie
	 f1IcIvgvz0dc7C8/Lcka9T/+/H6GjydCvcl4RV6GQ778RgMx5TFT7RhqyqqYYexC6Qekz
	 59luft6Oag9OjDqLE8qUTDScl6F9bApRKrSdgtOjlJsVbOiScbbRTAygPeUECCHhrrHn3
	 uZfaSlJrSRCWkrKW7J5kRjs405alBEiJv2ubd1xnLaEWTl+eXlQ9NbNXNynERMOi3rQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795455188;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=pV1/SXtZqJ8UvvmdnWpwv5zopezmz2eHfvY1+u4XOiY=;
	b=AWd2jgLmydOSXdM9CLDb0nfj9votGVHLxRsiwCdgCPZyi05x3nouQbp7V1g2/HI32Nz/
	 16RPg4Y+ihvTAb97TgIvlZQvusugbzikDbpRKWJEk+AsIulTMDiXQjwOupxcjDDX3hX9m
	 PodE6Ij5s5WPafliJG/jlZMaV1SkK2PmdcKkHijzrXriE2GAPAbuZPj/esxLGOKxti/9+
	 RRlXKqzqhQF+RiD0cpHLVs+mpwKZQRMo3hlbFVXVsTaVNdaPEHV1XbBBgW5yhkIAlewl1
	 2CGhPEaEnnuMMUxiExi23YH15cz4WmZpaobVs5k8mrSUhnS1LUnu6BUr+HFTI8Xz4JA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jI4jUrE3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF3E606A32C
	for <linux-sound@vger.kernel.org>; Mon, 23 Nov 2026 17:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jI4jUrE3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91DC71F000C0;
	Mon, 23 Nov 2026 17:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795455187;
	bh=pV1/SXtZqJ8UvvmdnWpwv5zopezmz2eHfvY1+u4XOiY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jI4jUrE3bkBq4HcuItan7wFRS925YGsQ5utj6Lgf0EoWt9RyBY3K1fLuYEkT6J6zL
	 67zw6B3VPQCZdh8jfV5gzNASt9Wx7prOFyYLnwDqBnC6W6aod9zl15ufZzUpg34f10
	 VRG5Rto0X5hE2twtSZH8BBQwt3aAihWGz+NQGQCupoXhl3fzJek0nr54ZVKbK/2PLt
	 6+0nLwhMDI4iCSsL9lM2mqf291toB/SKyeATWhi4VfuS20VeZHfrUzHcvQ04JKSRI3
	 NW/IwhvDVtJLGUMCzX2dXutzKKzWYb7Y1icfAgPzz6oXa5jFzYYlqH6GKj7wYVguj0
	 ZheAqJH5ltYkg==
Message-ID: <sashiko-outbox-229764@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 24/24] soundwire: bus: use pm_runtime_get_if_active()
 in sdw_handle_slave_alerts()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vijendar Mukunda" <Vijendar.Mukunda@amd.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261123170520.1380924-25-Vijendar.Mukunda@amd.com>
References: <20261123170520.1380924-1-Vijendar.Mukunda@amd.com>
 <20261123170520.1380924-25-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 17:33:07 +0000
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
- [High] soundwire: bus: sdw_handle_slave_alerts() drops alerts when
  slave is suspended
- [High] soundwire: bus: sdw_handle_slave_alerts() races with slave
  runtime PM callbacks
- [Low] soundwire: bus: inaccurate Fixes trailer in commit message
--

commit 30482e5286dcebe16b970ebf3c3846bd0b707da1
Author: Vijendar Mukunda <Vijendar.Mukunda@amd.com>

> soundwire: bus: use pm_runtime_get_if_active() in sdw_handle_slave_alerts=
()
>=20
> sdw_handle_slave_alerts() calls pm_runtime_get_sync(&slave->dev) which,
> when slave->dev is not in RPM_ACTIVE, calls rpm_resume() on the slave.
> rpm_resume() propagates synchronously up the parent chain: slave->dev ->
> bus->dev -> manager->dev. If manager->dev is in RPM_SUSPENDING at that
> point, rpm_resume() blocks on dev->power.wait_queue waiting for the
> suspend to complete.
>=20
> This creates a deadlock: the manager's runtime_suspend callback
> (e.g. amd_suspend_runtime() or intel_suspend_runtime()) is blocked in
> cancel_work_sync() waiting for the alert work to finish, while the alert
> work is blocked in pm_runtime_get_sync() waiting for the manager's
> runtime_suspend to complete.
>=20
> Fix this by replacing pm_runtime_get_sync() with
> pm_runtime_get_if_active(), which increments the usage counter and
> returns 1 only if slave->dev is already in RPM_ACTIVE, and returns 0
> immediately without calling rpm_resume() otherwise.
>=20
> Children suspend before parents, so when the parent manager is in
> RPM_SUSPENDING the slave is already RPM_SUSPENDED. The early return is
> therefore conditioned on pm_runtime_status_suspended() so that only a
> genuinely suspended slave triggers the deferral path:
>=20
> - When the SoundWire link enters clock-stop mode, the MIPI SoundWire
>   spec guarantees the peripheral re-asserts the alert after clock
>   resume, so the interrupt is deferred rather than dropped.
> - When the link fully powers off (e.g. D3 or equivalent), the
>   peripheral loses power and its alert state does not survive; the
>   early return is harmless.
>=20
> When ret =3D=3D 0 but the slave is not suspended (RPM_RESUMING or
> RPM_SUSPENDING), the parent manager must be active so there is no
> deadlock risk and the hardware is accessible. These cases fall through
> to read and clear interrupt registers without a PM reference.
>=20
> When ret =3D=3D 0, the usage counter was not incremented, so the early
> return must bypass the io_err: label (which calls
> pm_runtime_put_autosuspend()) to avoid a reference count underflow.
>=20
> pm_runtime_get_if_active() returns -EINVAL when PM is disabled on the
> device (disable_depth > 0, e.g. during sdw_delete_slave() teardown) or
> when CONFIG_PM=3Dn. In both cases the old pm_runtime_get_sync() path
> returned -EACCES, which the original guard exempted so alert handling
> could proceed without a PM reference. Preserve this behaviour: when
> ret < 0, fall through to read and clear hardware interrupt registers
> without a reference. Introduce have_pm_ref to guard the
> pm_runtime_put_autosuspend() call at io_err: so it is only reached when
> a reference was actually taken.
>=20
> Fixes: e9537962519e ("soundwire: bus: Fix unbalanced pm_runtime_put() cau=
sing usage count underflow")
> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>

[Severity: Low]
Commit e9537962519e ("soundwire: bus: Fix unbalanced pm_runtime_put()
causing usage count underflow") only changed pm_runtime_resume_and_get()
back to pm_runtime_get_sync() to fix an error-path underflow.  Synchronous
runtime resume in sdw_handle_slave_alerts() was introduced by commit
aa79293517b3 ("soundwire: bus: fix io error when processing alert event"),
so should the Fixes tag reference that commit instead?

> diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
> index aeaae5a57c89d..b53fa93a7cd59 100644
> --- a/drivers/soundwire/bus.c
> +++ b/drivers/soundwire/bus.c
> @@ -1667,15 +1667,44 @@ static int sdw_handle_slave_alerts(struct sdw_sla=
ve *slave)
>  	u8 buf, buf2[2];
>  	bool parity_check;
>  	bool parity_quirk;
> +	bool have_pm_ref =3D false;
> =20
>  	sdw_modify_slave_status(slave, SDW_SLAVE_ALERT);
> =20
> -	ret =3D pm_runtime_get_sync(&slave->dev);
> -	if (ret < 0 && ret !=3D -EACCES) {
> -		dev_err(&slave->dev, "Failed to resume device: %d\n", ret);
> -		pm_runtime_put_noidle(&slave->dev);
> -		return ret;
> +	ret =3D pm_runtime_get_if_active(&slave->dev);
> +	if (ret =3D=3D 0 && pm_runtime_status_suspended(&slave->dev)) {
> +		/*
> +		 * Slave device is genuinely suspended. Return early to avoid
> +		 * I/O on an inaccessible device and to prevent a deadlock:
> +		 * children suspend before parents, so a suspended slave
> +		 * implies the parent manager may be in RPM_SUSPENDING, where
> +		 * its runtime_suspend callback blocks in cancel_work_sync().
> +		 * Calling pm_runtime_get_sync() here would propagate up to
> +		 * the manager and deadlock.
> +		 *
> +		 * When the SoundWire link enters clock-stop mode, the MIPI
> +		 * SoundWire spec guarantees the peripheral re-asserts the
> +		 * alert after clock resume, so the interrupt is deferred
> +		 * rather than dropped. When the link fully powers off
> +		 * (e.g. D3 or equivalent), the peripheral loses power and
> +		 * its alert state does not survive; the early return is
> +		 * harmless.
> +		 */
> +		dev_dbg(&slave->dev, "Alert deferred: slave suspended\n");
> +		return 0;
>  	}

[Severity: High]
Does returning early whenever slave->dev is RPM_SUSPENDED drop peripheral
alerts while the manager is active or after waking from Clock Stop Mode 0?

SoundWire codec drivers enable runtime PM autosuspend on slave->dev, so a
peripheral is routinely in RPM_SUSPENDED while the manager is still
RPM_ACTIVE (for example during the manager's autosuspend delay, when
another peripheral on the link is active, or when clock stop is disabled).
Likewise, on wake from Clock Stop Mode 0, manager wake handlers such as
amd_sdw_process_wake_event() and intel_link_process_wakeen_event() only
call pm_request_resume() on the manager device; because peripherals remain
SDW_SLAVE_ATTACHED across Clock Stop Mode 0 without re-enumeration,
sdw_handle_slave_status() never calls pm_request_resume(&slave->dev).

With pm_runtime_get_sync(&slave->dev) removed here, nothing resumes
slave->dev and SDW_SCP_INT1 is never cleared.  The peripheral stays stuck
in SDW_SLAVE_ALERT without notifying the codec driver, and on Qualcomm
controllers qcom_swrm_irq_handler() will loop indefinitely because
SWRM_INTERRUPT_STATUS_SLAVE_PEND_IRQ remains asserted.

> +	/*
> +	 * ret =3D=3D 0 but slave not suspended (RPM_RESUMING or RPM_SUSPENDING=
):
> +	 * hardware is accessible and no deadlock risk applies since the parent
> +	 * manager must be active for the slave to be resuming. Proceed
> +	 * without a PM reference to read and clear interrupt registers.
> +	 * ret < 0 (-EINVAL): PM is disabled (disable_depth > 0 or CONFIG_PM=3D=
n);
> +	 * proceed without a reference, consistent with the previous
> +	 * -EACCES exemption. Skip PM release inside io_err: since no reference
> +	 * was taken.
> +	 */
> +	if (ret > 0)
> +		have_pm_ref =3D true;

[Severity: High]
When ret =3D=3D 0 and slave->dev is in RPM_SUSPENDING or RPM_RESUMING, can
falling through without waiting for the transition or holding a PM
reference race with the slave driver's runtime PM callbacks and still
deadlock?

CPU0 (alert work)                 CPU1 (PM workqueue)
sdw_handle_slave_alerts()
                                  rpm_suspend(&slave->dev)
                                    /* status =3D=3D RPM_SUSPENDING */
  pm_runtime_get_if_active() -> 0
  pm_runtime_status_suspended() -> false
                                    rt711_sdca_dev_suspend()
                                      cancel_delayed_work_sync(...)
                                      regcache_cache_only(..., true)
                                    /* slave->dev -> RPM_SUSPENDED */
                                  rpm_suspend(manager->dev)
                                    /* manager->dev -> RPM_SUSPENDING */
                                    amd_suspend_runtime()
                                      cancel_work_sync(&amd_sdw_work)
  handle_nested_irq(slave->irq)
    regmap_irq_thread()
      pm_runtime_get_sync(&slave->dev)  <-- deadlocks on manager->dev

Besides the deadlock when a domain IRQ handler with runtime_pm enabled
(such as sdca_irq_chip or cs42l43_irq_chip via regmap_irq_thread()) runs
after slave->dev finishes suspending, drv->ops->interrupt_callback() and
handle_nested_irq() now run concurrently with .runtime_suspend and
.runtime_resume while the codec's regmap is in cache-only mode, failing
register accesses while sdw_handle_slave_alerts() clears SDW_SCP_INT1 and
drops the interrupt.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123170520.1380=
924-1-Vijendar.Mukunda@amd.com?part=3D24
