Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794246188;
	b=ntrY0+3Wo3wXTB5UKJdI+xYa1j186IGTvk+dpCGdad4nGw+JhKBg0gB6QFviYSuqh7n4
	 rVE23NSCaK0iQQRXfjn2r9MrD+KX4appzm0FPDh3iIijt157yvqOxIl3aqLvkEHbq+vcI
	 f1nX6X6R0FWUoGAzmAW7I9V0/n9hUDQULbR31XIJP3mzB1D4Qfk0dda1gMppFoyRt24rY
	 viBayCL4N/lnjLTTxg0uZVzR7nG+Xi6N12sBHcRkGjSLqV5q34Jj3aVBGQM4Jl3qNy6Ym
	 BMr88guQf28/4uQY7g60jsDIzCH8wqcSFo3tSEsf2kynC7ruD82CCIWKE50D4NgC1dQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794246188;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=0fG/fD+VY+5R9q02A3IlXAR7dA4kKhT6IxXob2BmP2Y=;
	b=jrz3omAH0Rw/F1SjdSOHj3oucmap/UR5ERnhMp9ZAG+46DUnOxZcw4LDpRrwNyhYRS/3
	 73uCt2gnrhMaGjKXAy3Zk+U+EN74e3XC42TdCRBC3TYvXkX1UDn7hsoaIIDEaIkG7ctdI
	 M/Q9wdmASHNJWhrEG2x0SD37kbCOE2+rHDc79q3RKN6DYTxYsvWpFIoy6574+rZLGXdfw
	 s0mzDlCU+zcR+8NcbrEn7A3aL92m56NCZsyBFj1740SFUtd4eB+mADJsrFT368QtwZ55+
	 sOn+UYciMwhFS4/I55rctG04eUYCKiZJBV+SddTcKdmz9gSS8ocVC2O7SjvUC4R0ZvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AMMPFBUG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0C8C606A32A
	for <linux-sound@vger.kernel.org>; Mon,  9 Nov 2026 17:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AMMPFBUG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 493731F008A6;
	Mon,  9 Nov 2026 17:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794246187;
	bh=0fG/fD+VY+5R9q02A3IlXAR7dA4kKhT6IxXob2BmP2Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AMMPFBUGq5r/CJl6JveL6+j2bY0YC3Sl55X37goFV+1a8S6nG3GL9Gsb29/KRT9UB
	 LSinDj2qRT+UP2tERNrkeqHSF6bROkVeh78i4E8gzXq0JmHIj1J54ecULBW5Iv6T84
	 Ptp+JfE6UG5+dgmxPldagXoTSZlbqd7pFTsg9sfVfsJe3cLpdhb5ACKaWvzI06Wenq
	 UGXkrvUgOBiiKqpeiyWrYebWCrYqXYXbNV/qbqk9Pzx4Am6+/ZDzG13cPLYKpeelVP
	 eqBmtymWSNvyWp+StYxwmkJwXHZYNcQkVnEMLWCQXbwnVX8/xUYoLQqumYEa20PKhh
	 Vpg3Ml3rXrUWQ==
Message-ID: <sashiko-outbox-205326@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] ASoC: rt5659: cancel jack detect work on removal to
 avoid use-after-free
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hyunjung Ko" <hj351016@gmail.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261109172155.1851386-1-hj351016@gmail.com>
References: <20261109172155.1851386-1-hj351016@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 17:43:06 +0000
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
- [Medium] ASoC: rt5659: unguarded cancel_delayed_work_sync() in
  rt5659_i2c_shutdown()
- [Medium] ASoC: rt5659: unguarded disable_irq() in
  rt5659_i2c_shutdown()
--

commit cfae689e1e0a124463e941d5a4ef73f9a8712aac
Author: Hyunjung Ko <hj351016@gmail.com>

ASoC: rt5659: cancel jack detect work on removal to avoid use-after-free

This commit disables the client IRQ and cancels jack_detect_work in
rt5659_i2c_shutdown(), and wires rt5659_i2c_shutdown() into a new i2c
.remove callback.

> diff --git a/sound/soc/codecs/rt5659.c b/sound/soc/codecs/rt5659.c
> index 68f7d5673e190..721c742c0efda 100644
> --- a/sound/soc/codecs/rt5659.c
> +++ b/sound/soc/codecs/rt5659.c
> @@ -4337,9 +4337,18 @@ static void rt5659_i2c_shutdown(struct i2c_client =
*client)
>  {
>  	struct rt5659_priv *rt5659 =3D i2c_get_clientdata(client);
> =20
> +	if (client->irq)
> +		disable_irq(client->irq);

[Severity: Medium]
Can this cause an unbalanced double disable_irq() on client->irq, or
disable an IRQ that this driver never acquired?

The component remove callback rt5659_remove(), added in ca3efbaa8aeb
("ASoC: rt5659: cancel jack_detect_work on component removal"), already
disables the IRQ:

sound/soc/codecs/rt5659.c:rt5659_remove() {
	...
	if (rt5659->irq_acquired) {
		disable_irq(i2c->irq);
		rt5659->irq_disabled =3D true;
	}
	...
}

When unbinding an i2c device that is bound to a sound card,
rt5659_i2c_remove() -> rt5659_i2c_shutdown() calls disable_irq(), and
devres teardown of devm_snd_soc_register_component() then invokes
rt5659_remove(), calling disable_irq() a second time.  Conversely, if the
card was already unbound before i2c unbind or system shutdown,
rt5659_remove() has already set irq_disabled =3D true and
rt5659_i2c_shutdown() disables client->irq again.

In addition, devm_request_threaded_irq() failure in rt5659_i2c_probe() is
non-fatal, leaving client->irq non-zero while rt5659->irq_acquired is
false, so checking client->irq alone disables a line the driver does not
own.

> +	cancel_delayed_work_sync(&rt5659->jack_detect_work);

[Severity: Medium]
Can this call cancel_delayed_work_sync() on an uninitialized
rt5659->jack_detect_work?

In rt5659_i2c_probe(), INIT_DELAYED_WORK(&rt5659->jack_detect_work, ...)
and rt5659->jack_detect_work_inited =3D true only run when pdata.jd_src is
RT5659_JD3 or RT5659_JD_HDA_HEADER.  When pdata.jd_src is RT5659_JD_NULL
(for example when the optional realtek,jd-src property is omitted),
jack_detect_work is never initialized and unbinding or shutting down the
device triggers WARN_ON(!work->func) in __flush_work().

Guarding this call with if (rt5659->jack_detect_work_inited), as
rt5659_remove() does, avoids canceling uninitialized work.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109172155.1851=
386-1-hj351016@gmail.com?part=3D1
