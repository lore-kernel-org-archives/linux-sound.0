Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794604781;
	b=y82Mm0DJ3WTDH//8o+GRQaiyW9oG9KQtHpnE6ZNODxsIZjg2uFoSV/Bv282CJHgIqgBd
	 5CB+cKLk7kW7QSCI+MemxfHRvsVUo41xyzN+S09FXcvFPCZc/rRaoodjiXAqqM8M93C4z
	 Q5VhG7ZOirqRyhFQkH1k7QdLu99YCN5hesBhJc/1Zj41hMK0tyjCCYBqqDtUdT31tz6f+
	 qpmtysdj5ZlQvip1uw0ei6Vv/SkIaS0Z/Yjr9/P3epRkJG6ZHKqaY/deGyAUtHWruEBNK
	 NOMHecMGouFwIRUamAPE6+PvwDx5DOIJrm1vN8o95UGk9Yjtw2s32fPTgAjYax/y/AQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794604781;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=1q9/87dCkNcrWUcKcRnVrZsMfPY6KNxh8jRH/nD0exA=;
	b=ch9gdwrowyU0050GatVlx8/yZOZIM4aQMOW8+TefSFv7blgzX4fLkC6Eoc32E4a85Xxh
	 fImVOZ/fK5o07FCljREkQrTnM6fbWhroXIkqXl/H6KT6QeYuWlI55pZ/qtleNCzC8hCTh
	 +qewrFPI9WsLcGs7HO6fzJ2MO6l7s2vbLIPOInfonSd939bU6Nj9j7BZmc9KX+dnkexnE
	 1MV5bjAVM+nDzdr6ol7kjgZrH0qJZeOH7nnnBIMeiGQ76fCeHnuiRSffwnym0SK3bTzi8
	 0bR3XDDzp6iUxKbnstK/m1Ni/JS5aADKiGEc8/7l2ldPR9d3jo71KwG3aq7lv+qRwpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AkK1Xl+P;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24282606A327;
	Fri, 13 Nov 2026 21:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AkK1Xl+P
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2CC61F000C4;
	Fri, 13 Nov 2026 21:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794604781;
	bh=1q9/87dCkNcrWUcKcRnVrZsMfPY6KNxh8jRH/nD0exA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AkK1Xl+PspJT7uZoUP+KjFATstQ4ZvIffd5bBlaD789JVhHCg5vBJb5FwUj5saG1B
	 F/D/ibS1HZdYWzmDKXcNZ/emoJhNhWJn9ighFonD+eiwjaOLnKkFngzWYSKNQuw6Vh
	 iPX5BQkSbtjjK9/PqOH5ZM4kfrJyqziuN8ql2xcFOTDBNlbSBLXEY38uSv5MQ9Skpz
	 2GPV09toi2Lhce5g2fVLJyIkwnPQMpGihoGx8JZ3LP8oM7EHYvn5ewUgucINETcU1K
	 OL4ZwBtOE7JVCoe8jGFHbt2cXS7X/oSlHu27tPrLEfbzNIZp7h6lm/NaQr9q8kHk1D
	 lm/2UUco/xOKg==
Message-ID: <sashiko-outbox-213708@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/4] soundwire: qcom: check clk_prepare_enable()
 return values
Reply-To: sashiko-reviews@lists.linux.dev
To: "Daniel Carter" <yass27106@gmail.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <cc928d726ea34f5cb37fa140ca791e58@gmail.com>
References: <9032798812284dd2842cbf003c75cc0b@gmail.com>
 <cc928d726ea34f5cb37fa140ca791e58@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 21:19:40 +0000
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
- [Medium] soundwire: qcom: enable_irq() in swrm_runtime_resume() causes
  wake IRQ storm
- [Low] soundwire: qcom: missing Fixes trailers for clk_prepare_enable()
  check
- [Low] soundwire: qcom: qcom_swrm_irq_handler() returns IRQ_HANDLED on
  clk error
--

commit 5c5235a561fc40c30680eee11304261327eab6cc
Author: Daniel Carter <yass27106@gmail.com>

> soundwire: qcom: check clk_prepare_enable() return values
>
> clk_prepare_enable() can fail; unchecked, the driver proceeds to
> touch registers with the interface clock off, which aborts on arm64.
> Check the return value in the interrupt handler, in probe and in the
> runtime resume path, re-enabling the wake IRQ on the resume error
> path.
>
> Signed-off-by: Daniel Carter <yass27106@gmail.com>

[Severity: Low]
Since this fixes unchecked clk_prepare_enable() calls introduced in two
earlier commits, should this include Fixes: tags?

  Fixes: 02efb49aa805 ("soundwire: qcom: add support for SoundWire controll=
er")
  Fixes: 74e79da9fd46 ("soundwire: qcom: add runtime pm support")

> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index 0bdeb076a2e0e..ec510809766bb 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -799,7 +799,9 @@ static irqreturn_t qcom_swrm_irq_handler(int irq, voi=
d *dev_id)
>  	u32 i;
>  	int devnum;
>  	int ret =3D IRQ_HANDLED;
> -	clk_prepare_enable(ctrl->hclk);
> +
> +	if (clk_prepare_enable(ctrl->hclk))
> +		return IRQ_HANDLED;

[Severity: Low]
Should this return IRQ_NONE instead of IRQ_HANDLED when
clk_prepare_enable() fails?  The interrupt status is neither read nor
cleared, and returning IRQ_HANDLED causes irq_thread_fn() to mark the
interrupt as handled, preventing the genirq spurious interrupt detector
from disabling a stuck line.

[ ... ]

> @@ -1821,7 +1827,14 @@ static int __maybe_unused swrm_runtime_resume(stru=
ct device *dev)
>  			disable_irq_nosync(ctrl->wake_irq);
>  	}
> =20
> -	clk_prepare_enable(ctrl->hclk);
> +	ret =3D clk_prepare_enable(ctrl->hclk);
> +	if (ret) {
> +		if (ctrl->wake_irq > 0) {
> +			if (irqd_irq_disabled(irq_get_irq_data(ctrl->wake_irq)))
> +				enable_irq(ctrl->wake_irq);
> +		}
> +		return ret;
> +	}

[Severity: Medium]
Can calling enable_irq(ctrl->wake_irq) here cause a level-high wake IRQ
storm when swrm_runtime_resume() is invoked from
qcom_swrm_wake_irq_handler()?

ctrl->wake_irq is registered with IRQF_TRIGGER_HIGH | IRQF_ONESHOT.  During
an in-band wakeup, the slave holds the line high until the bus exits clock
stop, and qcom_swrm_wake_irq_handler() synchronously runs
swrm_runtime_resume() via pm_runtime_get_sync():

drivers/soundwire/qcom.c:qcom_swrm_wake_irq_handler() {
	ret =3D pm_runtime_get_sync(ctrl->dev);
	if (ret < 0 && ret !=3D -EACCES) {
		dev_err_ratelimited(ctrl->dev,
				    "pm_runtime_get_sync failed in %s, ret %d\n",
				    __func__, ret);
		pm_runtime_put_noidle(ctrl->dev);
		return ret;
	}

	if (ctrl->wake_irq > 0) {
		if (!irqd_irq_disabled(irq_get_irq_data(ctrl->wake_irq)))
			disable_irq_nosync(ctrl->wake_irq);
	}
    ...
}

When clk_prepare_enable() fails, enable_irq() unmasks ctrl->wake_irq at the
irqchip (even while the oneshot threaded handler is running), and
qcom_swrm_wake_irq_handler() returns early before its own
disable_irq_nosync(ctrl->wake_irq).  Because the bus never resumed to clear
the wakeup condition, the slave continues driving the level-high line and
ctrl->wake_irq immediately re-fires in a loop.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/1ce6d7664e48413d9a5=
a8b11a986f746@gmail.com?part=3D4
