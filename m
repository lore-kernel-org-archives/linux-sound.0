Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794246313;
	b=qjrIrK6XWG97JjcBwf0cyCUDO/plkjRPq7v2a5yYiZnph5/o/rq1nURiWdiQuUdvLMBp
	 KeSxkyaz/GDlnrWKjtORIfsYpqSUa42pFwuxTb2Qinym6vMWuPiDHC0gsfLi7LNleZZfv
	 KvXBpLk33piuK10xrETMzJ8bWqGrk63208Dxho8gMGsYe4ad8Z1XOtSf1NSDn0AN+Wr31
	 dbZ0j3Y0f/eavtkD0A4HAFU6AGluyckZ6o2lAwWn5vm1AvMO2mlBAFtVplH6kbPJJTXMp
	 /XKDQU8EmkDQl9UVoJvghWj+zCZqx5WkHEJycJ93AJYCAdz8xytVyhOFI8VCxbRqDlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794246313;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=6vvE7QyxiuL42dgKeX2zXg1rJT/sobi01Ue74cH+aFM=;
	b=rp9rdO+FNdB+WeLWzN4SL++C8BS5PF4d5QzPj5kEZbqGLb+h+lWis3+/hnPE/cOGAOhC
	 CyUJQPPYoTrDwMvJO9Fq3siiCyurQfbe/b9RJQRw+/t54tDhtnIQFD/M+4VDZtVQSsXPD
	 mS3GJOUCgBR60R05y+Y4gbFLKunQUrDMN6m7FiVCcXzDg8yecJxmDtDEa4sdJe0DzWX+a
	 FnDe9fQjY1ZunFWS2GUTaWwTXgIydXa9o1xF/Q42qJMnkFpRBU4l/wy9DUF8Fl584l1C5
	 R/z2sTDLDd3ZnzBO4DOkbFtS0OXGInafryOR67z+nWGsYmfl6ECjqEaSct3MaYUCNdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cakJKd+W;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47AB3606A33B
	for <linux-sound@vger.kernel.org>; Mon,  9 Nov 2026 17:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cakJKd+W
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B949F1F0089F;
	Mon,  9 Nov 2026 17:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794246312;
	bh=6vvE7QyxiuL42dgKeX2zXg1rJT/sobi01Ue74cH+aFM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cakJKd+W1kewCLRDeIjbtABI5zUbIYhnkwiQQmouOZ9klkXQu9X1ldqsAcGu6xKLb
	 SWbWiauD1F2oQpWfRmWjEhZOjMeLA7qeB7wz8DLhK4w36toEA3oRsXil0xIYwF+u5S
	 8l1FTTP82ARvDgBjA552SaAr8tJ2FsxL1NVQAD1nqKh7c4ECdCNtFG2TMr6hz49gJR
	 4aUnPFKN390qaf+NyWyyZRfLQr8VnSwgwzPJvsimBCbNOfZIlmV6ve7OFtDFYOkGcr
	 voOIb5sU6Ue/7g4uPduf8mNecyl0Yk3rUAqckDxEAiRSB7WCm3LLf4kuLS3KJ0SS4J
	 020e8zhLtEWRA==
Message-ID: <sashiko-outbox-205332@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] ASoC: rt5665: cancel jack detect work on removal to
 avoid use-after-free
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hyunjung Ko" <hj351016@gmail.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261109172144.1851173-1-hj351016@gmail.com>
References: <20261109172144.1851173-1-hj351016@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 17:45:12 +0000
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
- [High] ASoC: rt5665: infinite hang in rt5665_i2c_shutdown() canceling
  jack_detect_work
- [High] ASoC: rt5665: uncanceled calibrate_work in
  rt5665_i2c_shutdown() causes UAF
- [Medium] ASoC: rt5665: unconditional disable_irq() in
  rt5665_i2c_shutdown() on IRQ error
- [Low] ASoC: rt5665: inaccurate handler name and queuing site in commit
  message
--

commit 753d54cd6a5c4d1a6c0962dfc60f96a690d96477
Author: Hyunjung Ko <hj351016@gmail.com>

ASoC: rt5665: cancel jack detect work on removal to avoid use-after-free

This commit disables the client IRQ and cancels jack_detect_work and
jd_check_work in rt5665_i2c_shutdown(), and wires up an I2C .remove callback
that invokes rt5665_i2c_shutdown().

> rt5665_jack_detect_work() runs from the delayed work jack_detect_work,
> which is queued from the jack IRQ handler and from the jack-detect setup,
> and the jd_check_work polls button state; both dereference the driver
> data via container_of().

[Severity: Low]
In sound/soc/codecs/rt5665.c, the handler for jack_detect_work is named
rt5665_jack_detect_handler(), and it is only queued from rt5665_irq();
rt5665_set_jack_detect() only configures registers and stores hs_jack.

> diff --git a/sound/soc/codecs/rt5665.c b/sound/soc/codecs/rt5665.c
> index 62b21092e352b..bce2fc8c9bc6b 100644
> --- a/sound/soc/codecs/rt5665.c
> +++ b/sound/soc/codecs/rt5665.c
> @@ -4837,9 +4837,19 @@ static void rt5665_i2c_shutdown(struct i2c_client =
*client)
>  {
>  	struct rt5665_priv *rt5665 =3D i2c_get_clientdata(client);
> =20
> +	if (client->irq)
> +		disable_irq(client->irq);

[Severity: Medium]
Can this disable an IRQ that the driver never acquired?

In rt5665_i2c_probe(), a failure in devm_request_threaded_irq() only logs an
error and lets probe succeed with client->irq still set:

sound/soc/codecs/rt5665.c:rt5665_i2c_probe() {
	if (i2c->irq) {
		ret =3D devm_request_threaded_irq(&i2c->dev, i2c->irq, NULL,
			rt5665_irq, IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING
			| IRQF_ONESHOT, "rt5665", rt5665);
		if (ret)
			dev_err(&i2c->dev, "Failed to request IRQ: %d\n", ret);

	}
}

If that request fails, rt5665_i2c_shutdown() will still call
disable_irq(client->irq) on remove or shutdown, leaving the IRQ disable dep=
th
unbalanced.

> +	cancel_delayed_work_sync(&rt5665->jack_detect_work);

[Severity: High]
Will cancel_delayed_work_sync(&rt5665->jack_detect_work) hang forever if the
device is unbound or shut down before the sound card is instantiated or
calibrated?

rt5665_i2c_probe() requests the IRQ before registering the component, and
rt5665_jack_detect_handler() spins inside the work callback waiting for the
component, card instantiation, and calibration:

sound/soc/codecs/rt5665.c:rt5665_jack_detect_handler() {
	while (!rt5665->component) {
		pr_debug("%s codec =3D null\n", __func__);
		usleep_range(10000, 15000);
	}

	while (!snd_soc_card_is_instantiated(rt5665->component->card)) {
		pr_debug("%s\n", __func__);
		usleep_range(10000, 15000);
	}

	while (!rt5665->calibration_done) {
		pr_debug("%s calibration not ready\n", __func__);
		usleep_range(10000, 15000);
	}
}

If an interrupt schedules jack_detect_work while any of those conditions is
false and the device is then unbound or shut down, cancel_delayed_work_sync=
()
waits indefinitely for a loop that will never make progress.  The sibling
drivers fixed this by rescheduling the delayed work instead of looping insi=
de
the handler; see 4c33de0673ce ("ASoC: rt5682: do not block workqueue if card
is unbound") and a6d78661dc90 ("ASoC: rt5668: do not block workqueue if card
is unbound").

> +	cancel_delayed_work_sync(&rt5665->jd_check_work);

[Severity: High]
Does rt5665->calibrate_work also need to be canceled here?

Unlike rt5682, rt5665_probe() schedules rt5665->calibrate_work with a 100 ms
delay, and rt5665_calibrate_handler() -> rt5665_calibrate() sleeps across
polling loops while accessing rt5665, rt5665->component, and rt5665->regmap.
If the I2C device is unbound while calibrate_work is pending or running,
devres frees rt5665_priv and the work handler accesses freed memory.  Note
that rt5665_calibrate_handler() also has an unbounded while
(!snd_soc_card_is_instantiated(rt5665->component->card)) loop that would bl=
ock
cancel_delayed_work_sync() if not converted to reschedule.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109172144.1851=
173-1-hj351016@gmail.com?part=3D1
