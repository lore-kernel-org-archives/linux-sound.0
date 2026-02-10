Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 726C7342538
	for <linux-sound@vger.kernel.org>; Tue, 10 Feb 2026 09:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770717260; cv=none; b=onTc9ikNm35D+JMUUAuLs1IbWZZPAE4iNIOlPWG2iX6dtls3CcoiIX7AGqMngLi3qb19bJE2arqL8swFb4dvtvsXcSxjqVlZiC4LCLAqWN/tn5XD1Y3Uu05S6iWGcG+xiTx3b4Vlz0O3PRUb0JhVSH7sdRtglNW9yjQyRUlm6JI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770717260; c=relaxed/simple;
	bh=/vQN4TZ4B/amQD8I5grqcSy8egyqx/RMbDQ2qWEiskw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=sReHsQdcM7w1tYHNDH5yxaKtqlk0j0F3+/cJ9qDYdkJWTjky2Lqsb+Hq4xNDpFJOHosLaWoofVIgosi6zxH8nviT8iHNZAoILgwYbXfWhMulrhF7CnMoK7l7C30cgPPxWh9NSj2cdotUOIzttrR7ZfdfuusRAOYvzg7cYQYHMV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=sh26Rq50; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="sh26Rq50"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 43E0A4E40BB4;
	Tue, 10 Feb 2026 09:54:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0877A606BD;
	Tue, 10 Feb 2026 09:54:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B9975119D10B8;
	Tue, 10 Feb 2026 10:54:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770717250; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=xiRrYJ72zQo1WMZ9lVj3XZTV0dKHYq/gmc5+HrpHpm8=;
	b=sh26Rq50pKO+hha3iylHdSe9ifBNiwrXtydKZ0jYK1V4jUREnbZoVLnl5pjvCqXKadU6Yw
	OFHVH0UNkPJcGDbg2lcsrYmJnnU1jXsf9jPFu8XmKZ30omHJ05jfTAa7epIkHzSCP1p7hq
	qLqYjeQ+1jtj35e/IB585nBYhHvbr4m1zgD2bkk8q8wwHr0d76DoLgtmiWWjxk0UZVuew5
	ziioJ8kH1/FTcIg9y9aWTpy7C+P144MWiVh/Tz4vP80hf9iSHgtXTw8JN4ZOkLPdT3VhMH
	yG7HIvhQgu7zni/fAtyYLmGRX4GsBjn6htrF1RZtT82PrL0ZvW7g0xu6RVDTzQ==
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Feb 2026 10:54:04 +0100
Message-Id: <DGB6VK7LC8N7.322SYGWZXPL5W@bootlin.com>
Cc: "Nicolas Frattaroli" <frattaroli.nicolas@gmail.com>, "Liam Girdwood"
 <lgirdwood@gmail.com>, "Mark Brown" <broonie@kernel.org>, "Jaroslav Kysela"
 <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>, "Heiko Stuebner"
 <heiko@sntech.de>, <linux-rockchip@lists.infradead.org>,
 <linux-sound@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <kernel@collabora.com>, <alexandre.belloni@bootlin.com>,
 <thomas.petazzoni@bootlin.com>
To: "Detlev Casanova" <detlev.casanova@collabora.com>,
 <linux-kernel@vger.kernel.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: [REGRESSION] Re: [PATCH v1] ASoC: rockchip: i2s_tdm: Re-add the
 set_sysclk callback
X-Mailer: aerc 0.20.1
References: <20250117163102.65807-1-detlev.casanova@collabora.com>
In-Reply-To: <20250117163102.65807-1-detlev.casanova@collabora.com>
X-Last-TLS-Session-Version: TLSv1.3

Hello Detlev,

On Fri Jan 17, 2025 at 5:31 PM CET, Detlev Casanova wrote:
> In commit
> 9e2ab4b18ebd ("ASoC: rockchip: i2s-tdm: Fix inaccurate sampling rates"),
> the set_sysclk callback was removed as considered unused as the mclk rate
> can be set in the hw_params callback.
> The difference between hw_params and set_sysclk is that the former is
> called with the audio sampling rate set in the params (e.g.: 48000 Hz)
> while the latter is called with a clock rate already computed with
>   sampling_rate * mclk-fs (e.g.: 48000 * 256)
>
> For HDMI audio using the Rockchip I2S TDM driver, the mclk-fs value must
> be set to 128 instead of the default 256, and that value is set in the
> device tree at the machine driver level (like a simple-audio-card
> compatible node).
> Therefore, the i2s_tdm driver has no idea that another mclk-fs value can
> be configured and simply computes the mclk rate in the hw_params callback
> with DEFAULT_MCLK_FS * params_rate(params), which is wrong for HDMI
> audio.
>
> Re-add the set_sysclk callback so that the mclk rate is computed by the
> machine driver which has the correct mclk-fs value set in its device tree
> node.

I'm afraid I just found this commit breaks audio capture on the RK3308.

Using 'arecord -Vmono -d 2 -c 8 -f S16_LE -r 96000 /dev/null' I get:

  rockchip-i2s-tdm ff320000.i2s: ASoC error (-22): at snd_soc_dai_hw_params=
() on ff320000.i2s
   ff320000.i2s-rk3308-hifi: ASoC error (-22): at __soc_pcm_hw_params() on =
ff320000.i2s-rk3308-hifi

Tested on:

 * Radxa Rock Pi S
 * Upstream kernel
 * arm64 defconfig

Tested kernel versions:

 * v6.12 works
 * 5323186e2e8d (this commit) fails
 * 5323186e2e8d^ works
 * 21cfbeae7d7c (same patch on stable/linux-6.12.y) fails
 * 21cfbeae7d7c^ works
 * v6.19 fails
 * v6.19 + 'git revert 5323186e2e8d' works

I don't have more information at the moment.

> Fixes: 9e2ab4b18ebd ("ASoC: rockchip: i2s-tdm: Fix inaccurate sampling ra=
tes")

I'm the author of commit 9e2ab4b18ebd mentioned in the 'Fixes:' tag, so it
would have been good to Cc me. I would have had the option of testing your
patch and this regression could have been solved before getting in
mainline. I think b4 does it automatically (and perhaps get_maintainers
with appropriate flags).

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
