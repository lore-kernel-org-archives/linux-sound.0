Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794901734;
	b=oa20Z7pTiWxpHXzg2RGSIrypDEiG7pn1aXXTH8tJ0Nzcpcz8WfbRuuM9f+lcDED4QNlg
	 2asUqMxxa+YmxSdnM2GGt+Yp/fV4SN0UgoUOzdEDypfZrvhHyRDCMnxrdI9yNfawMEX+b
	 JO1TuEwTfwSXfFMSn5buSjXIrSQjXZhj6joywpgRimXv3Cc8Rdg1yEHMjt/2SP25RIXey
	 KUsRpnJGa+oSmUDmtfKUWKE5mdWz09kh6+pZArb3LMd/jp5EibyJc9YsYFaR9x9wbqc9r
	 gpduOdrWYqJg8PdfXy6rODiS1lLm/oh+mbJM4KH7OEbHIIx8nRcK2uFePEjICM36sJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794901734;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=FXO/KnGMUHe1lx1XKTfuGNvFYaS7k5EuhcB6VaSsrNU=;
	b=3xAXs8qxz2aSagmTvhZVqT9SdPIao7r6DiXtzMcsoPUlRZ17H1BxaygvZSolBa/WlLBU
	 T3F7P9GAtlZEga5MuB1T6S7fjkHobqRNHkSSMdD2GByJSUHHo89zJNs3V4MbfJeBMp6Ln
	 qPlRrMhVYXNj9Oayh4JJT5LcVgw3zCnbrvU/f0YBezAfHAj05xXsWy/hzhp6w4bx9Qz4U
	 E1vv5jbGr9deDAbrgAI16KDxFtEbnfAfCNVN/NiAGWYo/jOIRISn+XjJRaHBPYncL6TJw
	 zJ6X+mdRjMo5CTxrGi7ykb0diDtiNK+sGKc2yYKNF72FpcnVx0zQ4IPLjwJlolmOVDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dXVW2lhJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4999606A31C
	for <linux-sound@vger.kernel.org>; Tue, 17 Nov 2026 07:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dXVW2lhJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76EC61F000C4;
	Tue, 17 Nov 2026 07:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794901734;
	bh=FXO/KnGMUHe1lx1XKTfuGNvFYaS7k5EuhcB6VaSsrNU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dXVW2lhJMdjYorG6Zl6e3c06qKqpmbjfFVZdywqgZJ4n7yA4cws6+/91p206YrWUJ
	 muPtuEtot7OaXPt4PKrn2CaFLEpfEYnL629qz/cytZucPGFTO4TU8+xQ54hehj8Dh6
	 NdoZI1u+skGJuqqGEgSVQxEW1Li0gfvNBySTGEEzBHJ1E0VBFzKS5JWlCZhfKdUfA5
	 dlnwofkoj+apVVoR0+0b4480mZilVsdC/SY0DxIwipcsEzWu76UGG9g9slTNAux186
	 wOCqIcD0WJnjtN5brHbJSw0bfKXc50xNON/yI30dyYuNyLOv17FksOwEcVilSOpxkj
	 pXqsTJF0izVow==
Message-ID: <sashiko-outbox-218381@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 20/23] soundwire: amd: fix interrupt gate and work
 drain ordering in PM ops
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vijendar Mukunda" <Vijendar.Mukunda@amd.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261117070906.803139-21-Vijendar.Mukunda@amd.com>
References: <20261117070906.803139-1-Vijendar.Mukunda@amd.com>
 <20261117070906.803139-21-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 07:48:54 +0000
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
- [High] soundwire: amd: runtime PM deadlock in amd_suspend_runtime()
  work drain
- [Medium] soundwire: amd: stale status bits and early IRQ enable in
  amd_suspend()
--

commit 9fb00434cce0e9e4cd0523448b2e4bde7b333b08
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
Can calling amd_enable_sdw_interrupts() after amd_sdw_clock_stop() without
clearing ACP_SW_STATE_CHANGE_STATUS_0TO7 and
ACP_SW_STATE_CHANGE_STATUS_8TO11 cause amd_sdw_irq_thread() to process
stale peripheral status bits while the SoundWire clock is stopped?

When a SoundWire interrupt fires just before amd_disable_sdw_interrupts(),
the parent ACP hard IRQ handler clears ACP_EXTERNAL_INTR_STAT and schedules
amd_sdw_irq_thread, but the status registers are only cleared at the end of
amd_sdw_irq_thread():

drivers/soundwire/amd_manager.c:amd_sdw_irq_thread() {
	if (!READ_ONCE(amd_manager->interrupt_enabled))
		return;

	status_change_8to11 =3D readl(amd_manager->mmio + ACP_SW_STATE_CHANGE_STAT=
US_8TO11);
	status_change_0to7 =3D readl(amd_manager->mmio + ACP_SW_STATE_CHANGE_STATU=
S_0TO7);
    ...
}

Because amd_disable_sdw_interrupts() sets interrupt_enabled to false and
cancels amd_sdw_irq_thread without clearing those registers, any pending
status bits (or bits latched during amd_sdw_clock_stop()) remain set in
hardware.  In amd_suspend_runtime(), when a subsequent wake event triggers
amd_sdw_irq_thread(), amd_sdw_process_wake_event() only queues an
asynchronous pm_request_resume() before falling through to read the stale
status_change_8to11 and status_change_0to7 bits and schedule amd_sdw_work
while the link is still down, resulting in MIPI command timeouts
(-ETIMEDOUT).

In addition, the parent ACP IRQ handlers do not check interrupt_enabled
before calling schedule_work(&amd_manager->amd_sdw_irq_thread), so an
in-flight hard IRQ can queue amd_sdw_irq_thread after cancel_work_sync()
returns and run once amd_enable_sdw_interrupts() sets interrupt_enabled
back to true.  Finally, amd_sdw_clock_stop() returns 0 on its error paths,
so if clock stop fails, amd_enable_sdw_interrupts() re-enables state-change
interrupts with the bus clock still running.

[ ... ]

> @@ -1491,18 +1493,24 @@ static int __maybe_unused amd_suspend_runtime(str=
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

[Severity: High]
Can cancel_work_sync(&amd_manager->amd_sdw_work) in amd_suspend_runtime()
deadlock with amd_sdw_update_slave_status_work()?

kworker/0                          kworker/1
rpm_suspend(amd_manager->dev)
  runtime_status =3D RPM_SUSPENDING
  amd_suspend_runtime()
                                   amd_sdw_update_slave_status_work()
                                     sdw_handle_slave_status()
                                       sdw_handle_slave_alerts()
                                         pm_runtime_get_sync(&slave->dev)
                                           rpm_resume(bus->dev, 0)
                                             rpm_resume(amd_manager->dev, 0)
                                               /* waits on RPM_SUSPENDING */
    cancel_work_sync(&amd_sdw_work)  <-- deadlock

In the SoundWire device hierarchy, slave->dev is a child of bus->dev, which
is a child of amd_manager->dev, so both children are in RPM_SUSPENDED when
amd_manager->dev enters rpm_suspend().  If a peripheral alert schedules
amd_sdw_work just before amd_disable_sdw_interrupts() masks interrupts,
sdw_handle_slave_alerts() calls pm_runtime_get_sync(&slave->dev), which
synchronously resumes the parent chain up to amd_manager->dev and sleeps on
amd_manager->dev->power.wait_queue waiting for amd_suspend_runtime() to
finish, while amd_suspend_runtime() waits in cancel_work_sync() for
amd_sdw_work to complete.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117070906.8031=
39-1-Vijendar.Mukunda@amd.com?part=3D20
