Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793011373;
	b=Eb2vARSBtYes9PZs2J0MNItmIjw3HOjnJn7CaF+rlAdBfbKH+kddkIXxz8P2enxTe+d0
	 Y1Y13qI3X/B5I5DszKeQ286xQr9Xz8vFNUiPF7ewTztZy/VbZ8v7wYxbH42v5Qu/O7qNa
	 H/EQ1Qq2FdE6jJX+ypjIN6PQDoVngwlQhqDLg07l+n4uyJIU8ECba0xttkpLJstzjPNR7
	 TMSFu9bUTwwd/9OH2hN7Td+3PqfMAsY0NWrnjy+eCedOOUiWVXeb468WFCfuUJtgihlQ1
	 PX+1KEGWlpHrjHxDqC4bPgbuanVv64U0kJe70C/c14rHKeSmC5AyBR3wEgiy0snb7OA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793011373;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=wpMUoLgaHdAkDxe8R5ke7k+AqteWf/p95GsuJXqE67Y=;
	b=xy8Xf/scb/t0BlnUn7NkzFuiuCQXY++WgP+6DcNkL4LHE6D+ftO3QtzflY99JkY0V0J/
	 GGugUEeWtz4tROHNGheXs4czcCJEwPOTUuWtLkojXsAlJFDzZE9urRDNVpVki+DjL/d1m
	 CTvTopK3lAsmcrOiMBEyPoxK5O7/6G1SDWEqKgicIjT+M1pMRNeE1NIm/1K9duBlyX7Yz
	 zEi5S5ycC5PPLb9HQ8NJL3dGuWQogWDNMx26HfXwn7DC+dPuLLjoWFCxcPMZz/feImfpH
	 0nMTYPxSr/qkBw6X7u1cp4RX0+MSDebcqOMLemLBMU/uWb6WvRclN4KXH4YLskNLLOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ezBzOSX7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A50606A324
	for <linux-sound@vger.kernel.org>; Mon, 26 Oct 2026 10:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ezBzOSX7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D07A1F01829;
	Mon, 26 Oct 2026 10:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793011372;
	bh=wpMUoLgaHdAkDxe8R5ke7k+AqteWf/p95GsuJXqE67Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ezBzOSX7pMpSC9D8akPYnFzP4yYX/hNoEDAXzDjH/bglqM/fo+VKGfHKoWPvFUy+X
	 v3UQyNFkJKNExjiTues+losSF28JL+Gf8dLS4V2S2oRbj7ECpi25AwlSK5uvN47569
	 NZ9phAFKJDU8AlFeG8xyMvJBKHDPepCImad20GKxBW+03kTgN0APwkBttixarUPSEy
	 VT8mI4CF1Mow8ysMUbEQTnftXndZmxrFbNkxTz+qx+Yk7zQBx7epezlugsILeTgK46
	 LMu3YQuEFWVzlKSb8gNKRQ2i6BZrVWBAJd5df6U2829iiLnC/PhzP5ke0bwYUoiPGJ
	 gnBlhMWI+Lh8w==
Message-ID: <sashiko-outbox-184996@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 12/13] soundwire: amd: fix IRQ thread dropping
 STATUS_0TO7 on simultaneous wake
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vijendar Mukunda" <Vijendar.Mukunda@amd.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261026044507.2310694-13-Vijendar.Mukunda@amd.com>
References: <20261026044507.2310694-1-Vijendar.Mukunda@amd.com>
 <20261026044507.2310694-13-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 26 Oct 2026 10:42:52 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] soundwire: amd: race with runtime resume in amd_sdw_irq_thread() o=
n wake
--

commit 926ef4f8a65a29a6e1b8f7dfc94a0c8f49817776
Author: Vijendar Mukunda <Vijendar.Mukunda@amd.com>

soundwire: amd: fix IRQ thread dropping STATUS_0TO7 on simultaneous wake

This commit removes the early return in amd_sdw_irq_thread() when
handling a SoundWire wake interrupt and masks AMD_SDW_WAKE_STAT_MASK out
of status_change_8to11 so that simultaneous peripheral status changes are
processed instead of dropped.

> diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_mana=
ger.c
> index d7289b840513b..16dd17f7a343a 100644
> --- a/drivers/soundwire/amd_manager.c
> +++ b/drivers/soundwire/amd_manager.c
> @@ -1019,8 +1019,11 @@ static void amd_sdw_irq_thread(struct work_struct =
*work)
> =20
>  	dev_dbg(amd_manager->dev, "[SDW%d] SDW INT: 0to7=3D0x%x, 8to11=3D0x%x\n=
",
>  		amd_manager->instance, status_change_0to7, status_change_8to11);
> -	if (status_change_8to11 & AMD_SDW_WAKE_STAT_MASK)
> -		return amd_sdw_process_wake_event(amd_manager);
> +
> +	if (status_change_8to11 & AMD_SDW_WAKE_STAT_MASK) {
> +		amd_sdw_process_wake_event(amd_manager);
> +		status_change_8to11 &=3D ~AMD_SDW_WAKE_STAT_MASK;
> +	}
> =20
>  	if (status_change_8to11 & AMD_SDW_PREQ_INTR_STAT) {
>  		amd_sdw_read_and_process_ping_status(amd_manager);

[Severity: High]
Can removing the early return here cause peripheral status processing to
race with runtime resume or execute while the bus clock is still stopped
when waking from runtime suspend?

In drivers/soundwire/amd_manager.c, amd_sdw_process_wake_event() only
queues an asynchronous resume via pm_request_resume():

static void amd_sdw_process_wake_event(struct amd_sdw_manager *amd_manager)
{
	dev_dbg(amd_manager->dev, "SoundWire Wake event reported\n");
	pm_request_resume(amd_manager->dev);
	writel(0x00, amd_manager->acp_mmio + ACP_SW_WAKE_EN(amd_manager->instance)=
);
	writel(0x00, amd_manager->mmio + ACP_SW_STATE_CHANGE_STATUS_8TO11);
}

When amd_sdw_irq_thread() runs with AMD_SDW_WAKE_STAT_MASK and peripheral
status bits set in status_change_0to7 or status_change_8to11 while
amd_manager->dev is runtime suspended or resuming, pm_request_resume()
returns immediately without waiting for amd_resume_runtime() to finish on
pm_wq.

Execution then falls through in amd_sdw_irq_thread() to either call
amd_sdw_read_and_process_ping_status() or call
amd_sdw_update_slave_status() and schedule amd_manager->amd_sdw_work
(amd_sdw_update_slave_status_work()), and then clears
ACP_SW_STATE_CHANGE_STATUS_8TO11 and ACP_SW_STATE_CHANGE_STATUS_0TO7:

	if (status_change_8to11 & AMD_SDW_PREQ_INTR_STAT) {
		amd_sdw_read_and_process_ping_status(amd_manager);
	} else {
		/* Check for the updated status on peripheral device */
		amd_sdw_update_slave_status(status_change_0to7, status_change_8to11, amd_=
manager);
	}
	if (status_change_8to11 || status_change_0to7)
		schedule_work(&amd_manager->amd_sdw_work);
	writel(0x00, amd_manager->mmio + ACP_SW_STATE_CHANGE_STATUS_8TO11);
	writel(0x00, amd_manager->mmio + ACP_SW_STATE_CHANGE_STATUS_0TO7);

Neither amd_sdw_read_and_process_ping_status() nor
amd_sdw_update_slave_status_work() synchronizes with runtime PM on
amd_manager->dev before accessing the bus or interrupt masks:

static void amd_sdw_update_slave_status_work(struct work_struct *work)
{
	...
	if (amd_manager->status[0] =3D=3D SDW_SLAVE_ATTACHED) {
		writel(0, amd_manager->mmio + ACP_SW_STATE_CHANGE_STATUS_MASK_0TO7);
		writel(0, amd_manager->mmio + ACP_SW_STATE_CHANGE_STATUS_MASK_8TO11);
	}

update_status:
	sdw_handle_slave_status(&amd_manager->bus, amd_manager->status);

In AMD_SDW_CLK_STOP_MODE, amd_suspend_runtime() stops the clock and keeps
interrupts enabled while clk_stopped is true, and amd_resume_runtime()
restarts the clock in amd_sdw_clock_stop_exit() before completing
sdw_bus_exit_clk_stop() and the D0 transition. In AMD_SDW_POWER_OFF_MODE,
amd_resume_runtime() resets slave status and reinitializes the manager
and interrupt masks.

Could amd_sdw_read_and_process_ping_status() or
amd_sdw_update_slave_status_work() issue immediate commands via
amd_sdw_send_cmd_get_resp() while the clock is still stopped (timing out
after the status registers have already been cleared) or race
concurrently with amd_resume_runtime()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261026044507.2310=
694-1-Vijendar.Mukunda@amd.com?part=3D12
