Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794482612;
	b=fcvFaYnEWcTbqH+47Y9xVjxeiwjRTOS7RIVIcJ3Uu7VFjsPKldCsB2UByU4PZsby1n6z
	 F6MUJrNIKz7Cze9HDyRVIwQqmV0UZ69cJ2uFe+PHbYVcfvcbwox7bZ+6x0S2vv2kMOti5
	 jSp+kKNEyyfai59MQa+iVrHIBQe/WDQoBSbow87wx71sqG4DFmcTZR1n50fN5Wvc1BtzI
	 nb5lKKZ5GFfavb1XooFN0JcxqnV3ugrNEgs4wh8KqQ0I7zB4T5VIX52cMCCv7aUsCwmYe
	 0AoDdJY8QjKnvXGQxBR4pxid84tshid7J66/MtFRwBPNT5lzIVA+/+Me6mp8VSYKXpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794482612;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=NQo3Ibhp1vObEI9iKXCI1wu9f30gJAbNuBSPI+hy/kE=;
	b=vRNg4rWPKUmnCa9XHdXi0BLrA0wxHguVN6VPhRRPuFcSdr0K9xD9St/bVJll5NtLmQpl
	 fxRw93kWJ2H4XBWUpcIeXRnKc3sRBhO7P901RBGmjizw7Nyi0d/0UoUnEbqXpApsfixA9
	 7QPtP8aKuYqUTDg64uVcF2ibTS1ml5slrg9cRFJnyoaULXeI9nK6iKvfCa7PzsA5h8pKn
	 /+w62uFIiTxS1EYgVPrwcarQA2rFmjrbMdR2iCl87F0vyhn1Xvs2uQVR6MC164ej99JUo
	 QfwKyYoXbfBrvXJ06hre4oQ+WRXN/4Z6IEy4Qr3GIY3jAjz8LKB52ZL+jk1JiTGUhtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AERK47aj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF9F606B58E
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 11:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AERK47aj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CFAD1F00A05;
	Thu, 12 Nov 2026 11:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794482612;
	bh=NQo3Ibhp1vObEI9iKXCI1wu9f30gJAbNuBSPI+hy/kE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AERK47ajTK64wncechu5dwV77t3e33J326IMgLmRTLRjT9W/11bkObmbi5GvhlvXr
	 fqO88e/G+vO0kOggbNjmWSLthsoQd3Bmzx+GoUnQC6O8FsXQXmpqCoQq8INtJd4hdd
	 hyC2cFd6UTdjWiyrqgTpbHK2O27uHK2yi54qgB/04ZvbQSIcVrWTZqJ9mreCR2IMcz
	 q4I9z+7lDkjh1cBTFjPlbbfzGIU5Pr8HCRyCJNnMx5v3YAhWDcfZkOpfhwV465mXP7
	 aRIMqmEpBNNlKbIEsp9UKyLZllHau6kLzft6JkoP4wlSzC9BDB0dez7hRJwD9g3Pu6
	 lMqIxtdmgWscQ==
Message-ID: <sashiko-outbox-211009@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] soundwire: qcom: force runtime suspend across system
 sleep
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gopi Chandra Sekhar Reddy Kanala" <gopi.kanala@oss.qualcomm.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261112-qcom-swr-system-sleep-v1-1-a61a83f6475d@oss.qualcomm.com>
References: <20261112-qcom-swr-system-sleep-v1-1-a61a83f6475d@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 11:23:31 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential
issues to consider:
- [High] soundwire: qcom: bus reset on force resume skips slave and
  stream re-init
- [Medium] soundwire: qcom: pm_runtime_force_suspend() leaves wake_irq
  active with RPM off
- [Low] soundwire: qcom: missing pm_ptr() and modern PM macros on
  swrm_dev_pm_ops
- [Low] soundwire: qcom: missing Fixes: trailer for commit 74e79da9fd46
It also noticed 1 related pre-existing issue this patch does not
introduce:
- [High] soundwire: qcom: clock underflow and missing PM cleanup in
  qcom_swrm_remove() [1]
--

commit 2c857f79ae3cadb1038a8f3f2f64e481a9560e45
Author: Gopi Chandra Sekhar Reddy Kanala <gopi.kanala@oss.qualcomm.com>

> soundwire: qcom: force runtime suspend across system sleep
>
> The controller only implements runtime PM callbacks and relies on
> runtime suspend to stop the bus clock, gate hclk and arm the wake IRQ.
> That is not enough across system suspend: from the prepare phase until
> the complete phase the PM core holds a runtime PM usage count on every
> device, so a controller that is runtime active at that point stays
> active until the system resumes. This happens when suspend is entered
> within the 3 second autosuspend delay after bus activity, or when a
> peripheral driver resumes its device from its own system suspend
> callback, as the SDCA class function driver does to quiesce its
> interrupts.
>
> The bus clock then keeps running and hclk stays enabled for the whole
> suspend. On Qualcomm platforms the LPASS clock votes behind it are held
> as well, which keeps CX and DDR from collapsing in s2idle.
>
> Use pm_runtime_force_suspend() and pm_runtime_force_resume() as the
> system sleep callbacks, so the runtime suspend path always runs at
> system suspend and is undone on resume. Peripherals are children of the
> bus, so they are suspended before the controller and resumed after it.
>
> Signed-off-by: Gopi Chandra Sekhar Reddy Kanala <gopi.kanala@oss.qualcomm=
.com>

[Severity: Low]
This fixes the missing system sleep PM handling from when runtime PM support
was added.  Should it include:

  Fixes: 74e79da9fd46 ("soundwire: qcom: add runtime pm support")

> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index a4cb62897192e..6884ddbe69b32 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -1902,6 +1902,7 @@ static int __maybe_unused swrm_runtime_suspend(stru=
ct device *dev)
>  }
> =20
>  static const struct dev_pm_ops swrm_dev_pm_ops =3D {
> +	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resu=
me)
>  	SET_RUNTIME_PM_OPS(swrm_runtime_suspend, swrm_runtime_resume, NULL)
>  };
> =20

[Severity: High]
Does forcing swrm_runtime_suspend() and swrm_runtime_resume() across system
sleep skip slave and stream re-initialization when
ctrl->clock_stop_not_supported is true?

SoundWire slave drivers such as wsa881x only define runtime PM callbacks.
When system suspend is entered within the autosuspend window, the PM core
holds a runtime PM reference on the slaves, so they remain active and
slave->status stays SDW_SLAVE_ATTACHED.  On resume, swrm_runtime_resume()
resets the controller and bus without calling sdw_clear_slave_status()
first:

drivers/soundwire/qcom.c:swrm_runtime_resume() {
	if (ctrl->clock_stop_not_supported) {
		reinit_completion(&ctrl->enumeration);
		ctrl->reg_write(ctrl, SWRM_COMP_SW_RESET, 0x01);
		...
		qcom_swrm_init(ctrl);
		...
		qcom_swrm_get_device_status(ctrl);
		sdw_handle_slave_status(&ctrl->bus, ctrl->status);
	}
}

Because slave->status is still SDW_SLAVE_ATTACHED when the slave
re-enumerates, sdw_handle_slave_status() breaks out early without calling
sdw_initialize_slave() or notifying the codec that it was reset.  If a PCM
stream was suspended while open, SWRM_COMP_SW_RESET also wipes the port
registers while *stream_prepared in qcom_snd_sdw_prepare() remains true,
breaking playback after resume.

[Severity: Medium]
Can qcom_swrm_wake_irq_handler() leave ctrl->wake_irq disabled without
resuming the controller if an in-band wake fires while runtime PM is
disabled by pm_runtime_force_suspend()?

pm_runtime_force_suspend() disables runtime PM on ctrl->dev in dpm_suspend()
before swrm_runtime_suspend() enables ctrl->wake_irq, and device IRQs stay
enabled until dpm_suspend_noirq() and are re-enabled in dpm_resume_noirq()
before pm_runtime_force_resume() runs.  If a peripheral asserts the
level-high wake line during those windows, qcom_swrm_wake_irq_handler() gets
-EACCES from pm_runtime_get_sync(ctrl->dev), treats it as success, and calls
disable_irq_nosync(ctrl->wake_irq):

drivers/soundwire/qcom.c:qcom_swrm_wake_irq_handler() {
	ret =3D pm_runtime_get_sync(ctrl->dev);
	if (ret < 0 && ret !=3D -EACCES) {
		...
		return ret;
	}

	if (ctrl->wake_irq > 0) {
		if (!irqd_irq_disabled(irq_get_irq_data(ctrl->wake_irq)))
			disable_irq_nosync(ctrl->wake_irq);
	}
}

When dev->power.needs_force_resume is not set (for example when ctrl->dev or
its child master device was already runtime-suspended before system sleep),
pm_runtime_force_resume() does not call swrm_runtime_resume(), leaving the
controller runtime-suspended with the wake unserviced and ctrl->wake_irq
disabled.

[Severity: Low]
This isn't a bug, but could swrm_dev_pm_ops use DEFINE_RUNTIME_DEV_PM_OPS()
(or SYSTEM_SLEEP_PM_OPS() and RUNTIME_PM_OPS()) together with
pm_ptr(&swrm_dev_pm_ops) on qcom_swrm_driver instead of the deprecated
SET_*_PM_OPS() macros and __maybe_unused annotations?

[Severity: High]
This problem wasn't introduced by this patch, but can qcom_swrm_remove()
underflow ctrl->hclk [1] when the device is unbound while
runtime-suspended?

swrm_runtime_suspend() calls clk_disable_unprepare(ctrl->hclk), and
qcom_swrm_remove() unconditionally calls clk_disable_unprepare(ctrl->hclk)
again without waking the device or calling pm_runtime_disable():

drivers/soundwire/qcom.c:qcom_swrm_remove() {
	struct qcom_swrm_ctrl *ctrl =3D dev_get_drvdata(&pdev->dev);

	sdw_bus_master_delete(&ctrl->bus);
	clk_disable_unprepare(ctrl->hclk);
}

Unbinding while runtime-suspended triggers a clock enable_count underflow
warning and leaves runtime PM enabled on the device.

[1] https://sashiko.dev/#/bug/linux-e26e04cd-3dec-4a3d-94e6-f45403c4bb57

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112-qcom-swr-s=
ystem-sleep-v1-1-a61a83f6475d@oss.qualcomm.com?part=3D1
