Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795489868;
	b=qMqGGUxlZJ6HLLCeW51Qj9E8UdF2oGhGjZK8GMn7OUFGLi1pgJYT9HqhEH8hbE2X0wxH
	 W5QnY9tT7wUxzNFzB81Qr15amiHmx9ng8GFM6cP3r9kRXVDDXOd3VeM/OAm2lvXx3+RSK
	 brhggj8Df3lwvx5Ij+LOcqgfhL8HLV9qiqasi0XNeV8BUWdy6q7L8QTNCgSYIbRA3YBk5
	 GbbcZuUaZZ++IniJOLtliXCh4ovvWSb9rV7b/K1rpUyxwD8Ir1X0img6KkHm34Djd8dnM
	 4XpGJBnl0ujzbin1Nv9QbL+yTTkUlUbEpkAm+zdjjp+zo2EpRj9nbUq9ZOwrcDWdYsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795489868;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=mZuAcRgRt+hNOgg9G5wOA0pzO3DVKKjBWrJWAUqpZCs=;
	b=LSa9SYI4zrQEJedFeCz+9hvrP0QqLdIjYatZZYiy6us81PpRiRhOphStsetpFOfmh5yM
	 VoRKGEU8irqhZ6aTsK28QWNwm8DPGW0Etwmb4S4dYwOVqr0r2fL8pmlFN85dI5LaIKpaP
	 F/smsvClk9EhLu4ziOLDYz3T6/J70i8OGzV8q+rxmWdC3cFXXr7ABLHE9B44MXy2JLsMl
	 3wMVFC3PyNnoUK2S79nZfQ/yFlsFvqDDtXy3PrpBn15exy1eGI63rAVZaB4qN97zFUxVm
	 +kOL8E9GrCHbrqCeybD9JRFZd3gxN+jyKzNZE6T1Lmho11tR0LCAxX+XWfptDSe/miw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cFNYjn6n;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 987AD606A31E;
	Tue, 24 Nov 2026 03:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cFNYjn6n
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86C421F000C4;
	Tue, 24 Nov 2026 03:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795489867;
	bh=mZuAcRgRt+hNOgg9G5wOA0pzO3DVKKjBWrJWAUqpZCs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cFNYjn6nFdg6ha7hU7E6ly+Nyh9LqUNvj2gvCFtURNk6vTLAstopfmpML3nSOu0WY
	 qAtyA7ty6D3f56pDzGDFmL8B8Ct/TCQxW9ASbz6rNuwZZHrGg2AFf1O8fSmm7CsgDd
	 WqO8NGz2u3VFeqhkOrJdGEekEVjKocxo8rIZ3ds+OeYRMw+RLu5KgH7MXddImK+YSb
	 k5eWLIv1v9vuaUWaAB4OsDS2ageEjkTZWzps/qF4VzGY7PIyzdpLYFGbW7q2G6SXMR
	 MsPYLX1BjROaV5bDRro5nRgW1n6kAZ/tfvTow+3nOdBmCoS+F6CZz6Wjx/oR3o0G3H
	 q1OTTdJywRGhQ==
Message-ID: <sashiko-outbox-230443@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 7/9] media: i2c: it6625: capture compressed and HBR
 audio, not just LPCM
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hermes Wu" <Hermes.wu@ite.com.tw>
Cc: devicetree@vger.kernel.org, linux-sound@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261124-upstream-it6625-alsa-i2s-v2-7-a154685f6989@ite.com.tw>
References: <20261124-upstream-it6625-alsa-i2s-v2-0-a154685f6989@ite.com.tw>
 <20261124-upstream-it6625-alsa-i2s-v2-7-a154685f6989@ite.com.tw>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 03:11:07 +0000
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
- [Medium] media: i2c: it6625: raw AUD_TYPE reported in
  it6625_audio_update_ctrls()
--

commit 2ad342a8f95e2e510b1b156099c86836ba734db4
Author: Hermes Wu <Hermes.wu@ite.com.tw>

media: i2c: it6625: capture compressed and HBR audio, not just LPCM

This commit extends the IT6625/IT6626 I2S capture DAI to support compressed
IEC 61937 and HBR audio streams and exposes the stream coding type through
the V4L2_CID_DV_RX_AUDIO_TYPE control.

> diff --git a/drivers/media/i2c/it6625.c b/drivers/media/i2c/it6625.c
> index 4a6ab00f04013..72ca1d4ecdc93 100644
> --- a/drivers/media/i2c/it6625.c
> +++ b/drivers/media/i2c/it6625.c
[ ... ]
> @@ -1086,6 +1101,9 @@ static int it6625_audio_update_ctrls(struct it6625 =
*it6625)
>  	if (!ret)
>  		ret =3D __v4l2_ctrl_s_ctrl(it6625->ctrl_audio_present,
>  					 info.present);
> +	if (!ret)
> +		ret =3D __v4l2_ctrl_s_ctrl(it6625->ctrl_audio_type,
> +					 it6625_audio_type_to_v4l2[info.stream.type]);

[Severity: Medium]
Should it6625_audio_update_ctrls() also check the sampling rate before
reporting V4L2_DV_RX_AUDIO_TYPE_HBR?

As noted in it6625_audio_xport(), the bridge firmware reports AUD_TYPE_HBR
for ordinary compressed streams such as 48 kHz DTS.  Mapping
info.stream.type directly through it6625_audio_type_to_v4l2[] reports
V4L2_DV_RX_AUDIO_TYPE_HBR instead of V4L2_DV_RX_AUDIO_TYPE_IEC61937 for
those non-HBR streams.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124-upstream-i=
t6625-alsa-i2s-v2-0-a154685f6989@ite.com.tw?part=3D7
