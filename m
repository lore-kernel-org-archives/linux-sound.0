Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795853345;
	b=NQZnXLegMmjUlIqQBbW/esOLkOUQard4Bcx032N5gKr7sNAlEh8kE6GIG2jTUohtNae0
	 sjP1WqxhRi/wrrpXXVdkJNrixL8IMkAPH8WsxZj7ixhh/WhlqVia6rqUucJD6GwOTq0pK
	 U29ZINp7DlSADq9sY2yO/FdlT3U1p6swIDjkId44aEmUFN/4f9pnTMMQcJsaiyqW3hxNu
	 WlCxc8U/CDxO/aHne0sA2ooW7EHSZFhzppFdPlQxgznv1rYoUgsW3+L9AYNUt0FpsQZp7
	 4EZXlK07jxpCn2F3xncR/qOPAYUn35B0rqp3lwxya68MBYDd/AJiG2apgcRCkpu/wrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795853345;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=yu5nMs4crTTi2JKNDCCmS3jHztDneaW9AniqNFxRb3M=;
	b=YLxy+oo3Tmtl/6M+YauHQ0lDgcM6O1o2Nr9hh716TRccRF9J2AgXxcQdFMBK5y/8T7SP
	 hyZUYfJu+joWuJEJM4rkHrCVR7KtnimyDcrk8lWzcb8oeSoS9hQ+k6X1JmRsJUAmPf/oU
	 qHCxXUsiwmH8WgAsLoOlsBoIMu4HjjvZzPDoifdK9JHcO7r6+z3Hg+Co5WfBcQiEPbuvq
	 8L218OON9MixDzk/ERmfbG/e7vz/zkrPqSmLhndoZsqv4dqooPjZBotuPN7x90+6yh1d6
	 oABgzHdhgn92TNrb9+FHOOvAwPGD9tBZzY3t/FcCScJSlPf9G4PPMk01wn2BGWdjzUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E6mEdy2C;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D27C4606A31C
	for <linux-sound@vger.kernel.org>; Sat, 28 Nov 2026 08:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E6mEdy2C
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C1F31F00893;
	Sat, 28 Nov 2026 08:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795853345;
	bh=yu5nMs4crTTi2JKNDCCmS3jHztDneaW9AniqNFxRb3M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=E6mEdy2CsyqsclpWHQaHPz18I5sIEg96AiNsISowRTUMoyMPVG7yUXDspd00653VM
	 fSPiVfrTtYRdTBnwJGZUoF4o3rqgifzwfb/2GJAe3gBviVkTzkM7zpEV8Fu2BXtmkC
	 7RjQCVJGAnGAqrmBBbqjUvwDunYEvA8BKMqBykOUTCifppuB41TBfBCn5RIAsAgi0V
	 p0OzWgaZYSw1CQhBWd+B7SLey9g7yf86O4xYbZyAVLDzECOV3SCKhhs7PPQ/hZ70FI
	 yQE8rdoFOu3opQ0pk+408L2aVQjASo23MOEm+lUUgE1AcxEQyAxXGwKRUNz0FZwP6v
	 /hKvhRKxMl8EQ==
Message-ID: <sashiko-outbox-238531@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] soundwire: qcom: re-arm the controller interrupt after
 gating the clock
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gopi Chandra Sekhar Reddy Kanala" <gopi.kanala@oss.qualcomm.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261128-sdw-qcom-irq-v1-1-d053ac530faa@oss.qualcomm.com>
References: <20261128-sdw-qcom-irq-v1-1-d053ac530faa@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 28 Nov 2026 08:09:04 +0000
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
- [High] soundwire: qcom: pending CLK_STOP_FINISHED_V2 replay in
  swrm_runtime_suspend()
--

commit 650a30f5b562334bca4f136e5ca1ea065589e930
Author: Gopi Chandra Sekhar Reddy Kanala <gopi.kanala@oss.qualcomm.com>

soundwire: qcom: re-arm the controller interrupt after gating the clock

This commit re-enables the SoundWire controller IRQ at the end of
swrm_runtime_suspend() after gating hclk and removes the corresponding
enable_irq() from swrm_runtime_resume() so that peripheral alerts can
wake the controller while the clock is stopped.

> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index a4cb62897192e..05ef7bb2c5f7f 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
[ ... ]
> @@ -1893,6 +1892,8 @@ static int __maybe_unused swrm_runtime_suspend(stru=
ct device *dev)
> =20
>  	usleep_range(300, 305);
> =20
> +	enable_irq(ctrl->irq);
> +
>  	if (ctrl->wake_irq > 0) {
>  		if (irqd_irq_disabled(irq_get_irq_data(ctrl->wake_irq)))
>  			enable_irq(ctrl->wake_irq);

[Severity: High]
Can calling enable_irq(ctrl->irq) here replay a pending
SWRM_INTERRUPT_STATUS_CLK_STOP_FINISHED_V2 interrupt and pulse ctrl->hclk
while the bus is in Clock Stop Mode 0?

swrm_runtime_suspend() only masks SWRM_INTERRUPT_STATUS_MASTER_CLASH_DET
in SWRM_REG_INTERRUPT_CPU_EN, leaving
SWRM_INTERRUPT_STATUS_CLK_STOP_FINISHED_V2 enabled, and ctrl->irq is
requested with IRQF_TRIGGER_RISING.  When sdw_bus_clk_stop() broadcasts
ClockStopNow, SWRM_INTERRUPT_STATUS_SPECIAL_CMD_ID_FINISHED wakes
qcom_swrm_irq_handler() and completes ctrl->broadcast, while
CLK_STOP_FINISHED_V2 can assert at the frame boundary after
disable_irq(ctrl->irq) and before clk_disable_unprepare(ctrl->hclk)
finishes gating the clock:

CPU0                              CPU1
swrm_runtime_suspend()            qcom_swrm_irq_handler()
  sdw_bus_clk_stop()
                                    complete(&ctrl->broadcast)
                                    ...
  disable_irq(ctrl->irq)
                                  <hardirq: CLK_STOP_FINISHED_V2>
                                    handle_fasteoi_irq()
                                      /* sets IRQS_PENDING, masks line */
  clk_disable_unprepare(ctrl->hclk)
  usleep_range(300, 305)
  enable_irq(ctrl->irq)
    check_irq_resend()
                                  qcom_swrm_irq_handler()
                                    clk_prepare_enable(ctrl->hclk)
                                    /* CLK_STOP_FINISHED_V2 is a no-op */
                                    clk_disable_unprepare(ctrl->hclk)
                                      <-- pulses bus clock while stopped

Because SWRM_INTERRUPT_STATUS_CLK_STOP_FINISHED_V2 is a no-op in
qcom_swrm_irq_handler() and does not resume the controller, the replayed
handler toggles ctrl->hclk on and off without a clock-stop exit or entry
sequence.  On platforms such as x1e80100 and glymur where hclk is the
SoundWire bus clock itself, pulsing the clock while peripherals are in
clock stop corrupts peripheral state and causes subsequent clock-stop
exit failures (bus clash, parity errors, AUTO_ENUM_FAILED).

Masking SWRM_INTERRUPT_STATUS_CLK_STOP_FINISHED_V2 alongside
SWRM_INTERRUPT_STATUS_MASTER_CLASH_DET in SWRM_REG_INTERRUPT_CPU_EN
before issuing sdw_bus_clk_stop() (or leaving only SLAVE_PEND_IRQ
enabled during clock stop) would prevent CLK_STOP_FINISHED_V2 from being
latched while ctrl->irq is disabled.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261128-sdw-qcom-i=
rq-v1-1-d053ac530faa@oss.qualcomm.com?part=3D1
