Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795489750;
	b=VJ3PDfP9NNazjD+MBccrlTQbS5lWU0Uj0V63bl7/hdlmWcL+TaI4kI6XLoNqfTzxmCho
	 Wv2u55T4IA7AC6xiKT8/R1N2ghsnsa2r/bfmUUzGZJNbZXk/VVcAt3zxT3nGJWA+XolKe
	 XH8MHlRhVWXW71wsd2wwfRGTwGJIoYpc5NPBXdLmpvAGD0RXza4wyYLRmstwYw9RR89eB
	 yw3oL9SKT9l/oiDANJDylvw7ku2Kr5yd9V0FoCm3oKWGp6mA3I6RLXK7xbZNGJ/rYx077
	 ypKdI/ZceUbW8IuuhOPNCKnkyBqanU6RmdpeqhjEKpbwQnd3z2rri2PHe/HKPwMODFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795489750;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=+56wAzOOpxRbLQ4uSkwL+HRX2t4M0YVv2Wtx1TIXdJU=;
	b=krSjPgwDbmWYWmfDuw7D4QA7IbHBC0FVhNoCSmCxGcxkxMwyiDbXrCCAIfmpEKNoY8ii
	 Ad8NtHxXDO237VtXV6nFrO7In0xwVHxgdwybx2RkJdLTXSmxvdD+k5U0dDsc1m/K6hPrU
	 J+i8ExTd9jcc8FJSpX1Ye1+fmkR+mq/EoQBxqJD8vUIf3pM+3ARbJLsw4kA2PhF7IIuHn
	 hOqp0658XhW0YMaI55FjLZnPbLB+9hE0UOMseLImKFizucBSzMDKoZ9UJSRQoKT3oXP8F
	 0Pa9HKMjeaudncPH1c+hkmrfn5a7w881aqPcBKxkaFQDYC3NuEpuyZFi3ni1E2pQ/qA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fucOacm3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95738606A31E;
	Tue, 24 Nov 2026 03:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fucOacm3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEF751F000C6;
	Tue, 24 Nov 2026 03:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795489750;
	bh=+56wAzOOpxRbLQ4uSkwL+HRX2t4M0YVv2Wtx1TIXdJU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fucOacm3GYB1+/Hn/VBTYTSF3FGUoo9u3m7lYEVDLrTk4QFeoy+uudc3ugXsOOjjc
	 /MJNvVmEN1aNW+kOzOeWnfaPgwTxL4rns9R80MZr/qnWPeLnbTkoixp/fV58EeuwFg
	 il1hnlpLc3GMOz3MSHqOmZdZVn6E+syN7c2dJ+tLB09IcMkI1kKkXHwtdlRNgQ2oxT
	 5jyY+cP9fLvcpLON5zo2VuOTw9jY3Bxm61jpG5U1H1aQi9BP1FgCUsujGXY+o3sBIN
	 vxSnstyDI3ZjEfT/z4Mvzx/SxGNW4F9gHL341GDlAj/YowAKmg02gRP0mI51Bf+uO0
	 fzVOLGdE/2wpQ==
Message-ID: <sashiko-outbox-230441@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/9] media: v4l2-ctrls: add the DV RX audio type
 control
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hermes Wu" <Hermes.wu@ite.com.tw>
Cc: devicetree@vger.kernel.org, linux-sound@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261124-upstream-it6625-alsa-i2s-v2-2-a154685f6989@ite.com.tw>
References: <20261124-upstream-it6625-alsa-i2s-v2-0-a154685f6989@ite.com.tw>
 <20261124-upstream-it6625-alsa-i2s-v2-2-a154685f6989@ite.com.tw>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 03:09:09 +0000
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
- [High] media: v4l2-ctrls: missing Signed-off-by trailer in commit
  message
--

commit fb359067feb3d2fad1ab958d4474696294bed179
Author: Hermes Wu <Hermes.wu@ite.com.tw>

> media: v4l2-ctrls: add the DV RX audio type control
>
> An HDMI or DisplayPort receiver can pass on linear PCM, compressed audio
> in IEC 61937 format, high bit rate (HBR) compressed audio, or one bit
> (DSD) audio. Userspace capturing that audio needs to know which kind it
> is, for example to decide whether the samples can be played as PCM or
> must be passed through to a decoder.
>
> Add a standard read-only menu control, V4L2_CID_DV_RX_AUDIO_TYPE, to the
> DV control class with these four values. It describes how the audio is
> carried, not the codec: the codec of compressed audio is identified by
> the IEC 61937 data.

[Severity: High]
This commit message is missing a Signed-off-by: trailer from the author.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124-upstream-i=
t6625-alsa-i2s-v2-0-a154685f6989@ite.com.tw?part=3D2
