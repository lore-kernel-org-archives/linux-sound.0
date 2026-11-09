Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794246076;
	b=nJdzuOxm/j0pzJUEOOBIjKhgQX4XwO7clc6QAWXzUdphXHakcfpK9NTu2qKVTbUwfSdY
	 iej/6nCG/g7R2DGHHBAojL0ZzXhL9F7xe2futpTFRm6CX54SF20ykn9n34+2zxfZBOFsM
	 ZmGe7j9ki+i/dOpNFlbouGm4cp++S2t/vaGL/rwXhiSF4QzoOCpi+t6NHK6s5jadIsPMC
	 7/S0Qk68vUH0ebqEAWicczrYZHVDJeRmyGUV6cpUoACHyDikdhW41ivRyVFx9GY+yWaLN
	 ygtVcRhFqgBRohO4ZxBJTlcK4HKcEHkHGAkW1FzqR9rjU5fMwWDHwrZsPvOXwv+VOMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794246076;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=CBOD6F0mEpUC8d8puNPmIl9IMVagpllCAVe7ONrbh54=;
	b=JLPg1klXED++FZp93UM5cT4oqa5AQ/idl71keuG58R76Qj97lRSqOrrLo2kMHeKNZKtq
	 uInD/cfyGW0Ee6VGeGRaXY8V2HEIbf5xti3uBCH+BG1LKi7NzcbqfS2Yq8NkKu4GgaZae
	 kXpGc3UuUEnPE+TwNAmXRifRJc/2LA1X6qkUv+a9h5hFTY1aW3kgygt0HacpYYBFd9LMd
	 cofgZhL8WEZavo3+6fFk5CDJD8H+mCxIiknlAPdgqxs5h2GDi3Ije7w1cRtaxihA/sogp
	 2cGn4DpkZYYJpE6VRsrSpYXyVDLVrMDFUNAWeYZwy22hHU17dcwrA/VxJVSSF3AJHeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OORozhic;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28138606A31C
	for <linux-sound@vger.kernel.org>; Mon,  9 Nov 2026 17:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OORozhic
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DF3F1F0089F;
	Mon,  9 Nov 2026 17:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794246075;
	bh=CBOD6F0mEpUC8d8puNPmIl9IMVagpllCAVe7ONrbh54=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OORozhicY6/e2KYvBO76U7yX7vUVlE0Gm7cPGTe/umrxEKzEnyRtySGS3lmUoTRr4
	 FAOSzU9AuzQwSpnR/ug/fxdpjWok8ZeWZfRq4ImP2ZnRGX/ItTockBloadk2JsxAW+
	 ebJdi3/FSu8xeCq6BiIBgTnYw5VMfGj7g5RSUbLSXbVOr1GPyto2ZajLN5kwTufU6F
	 jzYwQ1fvkPDGyAm1aFrp3oSCuhLvv0TkNOsanTGnuVOxSykN+FwwqS/nfyJZy/EhdF
	 iQeld0amRBrUkHTG/oFjwDHKBJ1hAnA1iYkng4sMfEyC1+P2n1VCsniOVTBNeZADa/
	 y/46GoKW5V3zg==
Message-ID: <sashiko-outbox-205322@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] ASoC: rt5668: cancel jack detect work on removal to
 avoid use-after-free
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hyunjung Ko" <hj351016@gmail.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261109172134.1850973-1-hj351016@gmail.com>
References: <20261109172134.1850973-1-hj351016@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 17:41:15 +0000
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
- [Medium] ASoC: rt5668: unbalanced disable_irq() in
  rt5668_i2c_shutdown()
--

commit 7ffec355074a97397bd6323b0aff3802254c40bf
Author: Hyunjung Ko <hj351016@gmail.com>

ASoC: rt5668: cancel jack detect work on removal to avoid use-after-free

This commit disables the jack IRQ and cancels the jack detection delayed
works in rt5668_i2c_shutdown(), and hooks that path into a new i2c
.remove callback.

> diff --git a/sound/soc/codecs/rt5668.c b/sound/soc/codecs/rt5668.c
> index 29d70802a046a..c56bbe3fc7bea 100644
> --- a/sound/soc/codecs/rt5668.c
> +++ b/sound/soc/codecs/rt5668.c
> @@ -2584,9 +2584,19 @@ static void rt5668_i2c_shutdown(struct i2c_client =
*client)
>  {
>  	struct rt5668_priv *rt5668 =3D i2c_get_clientdata(client);
> =20
> +	if (client->irq)
> +		disable_irq(client->irq);
> +	cancel_delayed_work_sync(&rt5668->jack_detect_work);
> +	cancel_delayed_work_sync(&rt5668->jd_check_work);
> +
>  	rt5668_reset(rt5668->regmap);
>  }
> =20
> +static void rt5668_i2c_remove(struct i2c_client *client)
> +{
> +	rt5668_i2c_shutdown(client);
> +}

[Severity: Medium]
Does calling disable_irq(client->irq) unconditionally here conflict with
965bad6195d0 ("ASoC: rt5668: cancel delayed works on component removal")?

That commit updated the component remove callback rt5668_remove() to track
IRQ ownership and state via rt5668->irq_acquired and rt5668->irq_disabled,
cancel both delayed works, and reset the codec:

sound/soc/codecs/rt5668.c:rt5668_remove() {
	struct rt5668_priv *rt5668 =3D snd_soc_component_get_drvdata(component);
	struct i2c_client *i2c =3D to_i2c_client(component->dev);

	if (rt5668->irq_acquired) {
		disable_irq(i2c->irq);
		rt5668->irq_disabled =3D true;
	}

	cancel_delayed_work_sync(&rt5668->jack_detect_work);
	cancel_delayed_work_sync(&rt5668->jd_check_work);

	rt5668_reset(rt5668->regmap);
}

During i2c driver unbind, rt5668_i2c_remove() runs before devres
unregisters the component, so it resets the chip while the sound card is
still bound and then rt5668_remove() runs and calls disable_irq() and
rt5668_reset() a second time. In addition, rt5668_i2c_probe() continues if
devm_request_threaded_irq() fails, leaving client->irq non-zero with
rt5668->irq_acquired false, so unbind or shutdown disables an IRQ line the
driver never acquired.

The commit message also says that the component .remove callback only
resets the chip and neither disables the IRQ nor cancels the delayed work,
which is no longer true after 965bad6195d0 ("ASoC: rt5668: cancel delayed
works on component removal").

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109172134.1850=
973-1-hj351016@gmail.com?part=3D1
