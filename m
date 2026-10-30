Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793381178;
	b=l0UCbV7VZ12cePfseVdldLMlk7zWyKKpl+aaPGcNWOfMPNINNXzQtRmxv9FTNBIMACvB
	 RPj8ewPsMzw3VfERjLtMPdquea74RWzd7hdL90/NQw2sOVdWoF4L70SjZl3jOZhNJCxGi
	 9NRWfzsAwor/IoV1Z7/zF67l1PoDzvFbd3hnN2rPhuhQvsIPaZMqQl7bc4Fwkmwf5q7LS
	 q8f5FnFsc5TSrKcOsgmP+mXMq0qiitpFGjnrk8SqtaLiFDHG13r1jMVSqJSXYOFtiHjnS
	 qZD8JRjVnkySWESmT1c5/MUGfTfP36I7NeTNRpDQqslnOg/PWOT92lD0KMNWBIr0OKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793381178;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=/qjlfAKNL942uNb4vxxW6pe2oUcvqwNINQDScoAJFzg=;
	b=x2iN6b8wBewcV2G2aK/tQCY7LDyIj/Qq5KBz+MYK7+1Qony3Y5RPlRvvDOV+Ptdg7upB
	 VM3puNLDEZcGvDa2Cd3IqZ57O2knS7fK1XL1DhJ18RL3YxErhOsvCaP7QIGjlrR0sTqmJ
	 nhbtHu8ieSYiiWgKGvsK2wcecf/XsAI22trrdo6JHdtZnTKY9D5nIoqDoVkZbqXNBAfxp
	 AkKFeW66LN5W94LjdzD3us94wqG169gVTEYR44o7jY+lRyDqVDJPXVz8Cm5I90m8xBxoy
	 xfRZJX0moYq9qrbrc8VM22Pni5tVwGoN436joIXgN787NcsnZMQkULuCpyEUedMWtHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MLz0XOq5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C317606A31A
	for <linux-sound@vger.kernel.org>; Fri, 30 Oct 2026 17:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MLz0XOq5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFD681F000C1;
	Fri, 30 Oct 2026 17:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793381178;
	bh=/qjlfAKNL942uNb4vxxW6pe2oUcvqwNINQDScoAJFzg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MLz0XOq5iD0qC5IpVtaX8cXftHjWJRIBnHjcRcikePvx6ducuwYqSfkCC0wjFcr1+
	 yQXYYzIqC9u8pula2io117rH3vLTb4nFGdR/I4yrvuwNBVsWQdMED/V4DhXiJ01PT+
	 SH+IfHwz3cXtdyIGLOC7IZguN3QRxV/+yEyssWnpYAEZgDYYNcVs6QhQX2wgJ6yqB+
	 GLIjbywzdn6oFSv5VkiaNEK20ByFhShURnYn6yT3oVyoAKaMoIcwQhjsyfU77Uz44i
	 Yi0z5mfyW0KCMjGpLEfFOyGrQAGyHToDkkOr6oKcEwm9OmtNifVazHO9Z84mzP7gQL
	 ZDpxk1NkPNFvg==
Message-ID: <sashiko-outbox-191337@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 1/2] ALSA: hda: cs35l41: Add common wait_for_boot api
 and reset_and_boot api
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefan Binding" <sbinding@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261030171045.469944-2-sbinding@opensource.cirrus.com>
References: <20261030171045.469944-1-sbinding@opensource.cirrus.com>
 <20261030171045.469944-2-sbinding@opensource.cirrus.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 17:26:17 +0000
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
- [Medium] ASoC: cs35l41: false timeout in cs35l41_wait_boot_done() polling=
 loop
--

commit 1eb324e95aeb4455ca413ace17b7aba52e402175
Author: Stefan Binding <sbinding@opensource.cirrus.com>

ALSA: hda: cs35l41: Add common wait_for_boot api and reset_and_boot api

This commit introduces common cs35l41_wait_boot_done() and
cs35l41_reset_and_boot() helpers in cs35l41-lib.c and updates the HDA
CS35L41 driver to use them during probe and system resume. The new helpers
ignore transient regmap_read() failures while the chip is booting and retry
the software reset write if it initially fails.

> diff --git a/sound/soc/codecs/cs35l41-lib.c b/sound/soc/codecs/cs35l41-li=
b.c
> index b0fa80705be7d..973713626ebd4 100644
> --- a/sound/soc/codecs/cs35l41-lib.c
> +++ b/sound/soc/codecs/cs35l41-lib.c
[ ... ]
> @@ -1586,6 +1588,71 @@ int cs35l41_exit_hibernate(struct device *dev, str=
uct regmap *regmap)
>  }
>  EXPORT_SYMBOL_GPL(cs35l41_exit_hibernate);
> =20
> +int cs35l41_wait_boot_done(struct device *dev, struct regmap *regmap)
> +{
> +	ktime_t timeout;
> +	unsigned int val =3D 0;
> +	int ret =3D 0;
> +
> +	/*
> +	 * The chip could NAK a read request while it is booting so ignore
> +	 * errors from regmap_read.
> +	 */
> +	timeout =3D ktime_add_us(ktime_get(), CS35L41_GLOBAL_BOOT_DONE_TIMEOUT_=
US);
> +	regmap_read(regmap, CS35L41_IRQ1_STATUS4, &val);
> +	while (!(val & CS35L41_OTP_BOOT_DONE) && !ktime_after(ktime_get(), time=
out)) {
> +		usleep_range(CS35L41_GLOBAL_BOOT_DONE_SLEEP_US / 2,
> +			     CS35L41_GLOBAL_BOOT_DONE_SLEEP_US);
> +		regmap_read(regmap, CS35L41_IRQ1_STATUS4, &val);
> +	}
> +
> +	if (!(val & CS35L41_OTP_BOOT_DONE)) {
> +		dev_err(dev, "Timeout waiting for OTP_BOOT_DONE\n");
> +		return -ETIMEDOUT;
> +	}

[Severity: Medium]
Could this polling loop in cs35l41_wait_boot_done() return a false
-ETIMEDOUT if the task is preempted or delayed across the timeout deadline?

When cs35l41_hda_probe() or cs35l41_system_resume() calls
cs35l41_reset_and_boot() -> cs35l41_wait_boot_done(), if a regmap_read() of
CS35L41_IRQ1_STATUS4 occurs while the chip is still booting (either
returning a value without CS35L41_OTP_BOOT_DONE set or failing with a bus
NAK and leaving val at 0), and the thread is then preempted during
usleep_range() or delayed on the I2C/SPI controller lock until after
timeout expires, the loop condition !ktime_after(ktime_get(), timeout)
evaluates to false before another register read is performed. Even if the
hardware finished booting well before the deadline, val still holds the
stale pre-preemption value and cs35l41_wait_boot_done() fails with
-ETIMEDOUT.

Would it be better to use read_poll_timeout() from include/linux/iopoll.h
(similar to cs35l56_wait_for_firmware_boot() in
sound/soc/codecs/cs35l56-shared.c), which samples the timeout before
performing the read and guarantees one final read after the deadline expires
while still ignoring regmap_read() errors?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261030171045.4699=
44-1-sbinding@opensource.cirrus.com?part=3D1
