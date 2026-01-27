Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2E62BEFFE
	for <linux-sound@vger.kernel.org>; Tue, 27 Jan 2026 09:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769505623; cv=none; b=awinDIa8NBygF7FVEsUCC3W5ycg3eRCCwXwKfe0q/SY38mSGoidHMnQ72n27XxxqqCXoGYQqqcEmtubV9yDgRIx5DYb3fsjBAJA1VuhI+z9fM8gA8dKuv9HVaTEzCyvB1AUxHuric6XIzQMWeORinAXJiqUTDkReKw4xNmPWBUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769505623; c=relaxed/simple;
	bh=NRaJIBsOgwkV+eg1RM+W3L4+CnbMHXTkmYHk3spsKPM=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=HODPxkFIZswT/6D8k+4xu23f1Q5eJLwjdfuzLnW2Ig+WMt3rzJYx9Kw4Unqxh9DCfUth0/QdcdJIQ6PxmMLlv/c8tL7RGR58dAo1T6T9iwUH43TDGnZAZeo/JBIRgC8b/TmWsLa2J7AR4QyZ6Ix/0o93RoUX2g4XYRBFNYZs8f0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UXEzkjDm; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UXEzkjDm"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b8871718b00so606938466b.3
        for <linux-sound@vger.kernel.org>; Tue, 27 Jan 2026 01:20:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769505619; x=1770110419; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NRaJIBsOgwkV+eg1RM+W3L4+CnbMHXTkmYHk3spsKPM=;
        b=UXEzkjDm6qwK1BqyIrUwDRCx/k+zmjBTxPxSbmozC/Tklkhc1tiNOBK3lC+UOXQEkR
         TqocH+sDDld736nY/D1Osoz4iNDo6/nayIILqksJKNPefHaVqWKuWgoMI/1CCOONWyNJ
         rFj+6LpEoEx2VpnPzwz1aN4fdYdcp7lhyO4i1dtE86qw8VLbZtPSmRPX9Io6RbGw91IK
         dboawPT3z2Tev8GLTA0g3e1vW+5ZmoG1Uo3gs4VHny+6M3yrjEuTpRWrLZ6rNtuzFRBs
         5J5jufiQ5lLQLOGLhdVX7Z7ykMv4OYWvIJtepSqWGHkng05C1crl3vceAKOWvJDnACRl
         VfLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769505619; x=1770110419;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NRaJIBsOgwkV+eg1RM+W3L4+CnbMHXTkmYHk3spsKPM=;
        b=demmud05l+Eb1B2H7Yo64s0PVT79vc8sjVBHrhBXw9ErSIaJVwUFf8R+OOzarUS/3W
         E18ACgX38uymcTRbwrZMZdiQx3pBW3FF6POspBJJRPbBz0sK3RRMejpHCIWmkBZqaVhW
         RCy3gl1GwxnfSvjEbjDlXdjqxljNQ0rw+6jc7Mx2e7b1Xk6q1lhkjVP/RSl27WufFq7S
         9ypu3r41clv8iwFV+koW2G/ZvCCY/FuGTeVf2UTsHrwyMpIglje30BsDzMNRu/je4ne3
         RmXDGrqe1AxcWi4pE89Aa9XAx8u67dqYR9x11jARjEZqZP1GJWG0ffuZsoTdQio8xJ4a
         oO6w==
X-Forwarded-Encrypted: i=1; AJvYcCWiDgVWuz2ZTOfnmtISCyXmhnaE1Qw4mA2YDVRCecxwQO94ahq9WW74oE1qLE5dkUdvf01elpOIKAifvg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj4HOAtwHBKl4ttPusEMMlsTzqfFHQYQNJU6o4d+zgSKPwJi9S
	05V59i/UrCtKCayBfKDYrqEGzC3RkzZdh+eSorfN3NzYjv77J/a1pZZ8
X-Gm-Gg: AZuq6aKf7hBAm5yAkO1hGqseM8iFHnbrb3Prfu09bFHg/rryvywt9KaalzjWFom768o
	e2tuDckqBiBH8Z3ceIcsJXWXYzlrhbZBBEytDidWLOE5nnkZKCNnffMuFx1WuF0tm+pZDVyS96D
	SGCMUGnp3KfsFo8kj9XaZXKg1+iiRpdQ/bl7z7ZKKrN7H/AXx/8EjTV1QnIRU8ujf+1JmWROI2c
	KJDJRZcax8YFms3Ut/xLoHv4K+RCcIiqaixOzsxNxrjeXHBxfhD7Jp9Kc9Kzpx9JuojFZAFXKDz
	SrUD9rXd4iwQFtBq6CTJuDtCWj1poUgf+NhH9JAs9Bf2obSkL9zVFyALtVnNv22l4iBtfBwn1V8
	3/y3QabP1UuVVD6EU/LDf/+hyL1KmuxTFVL7AJkjh+vFQwakVPO7B4gFGSsFSxXyn6Zf+aYHbKH
	oHk0w8qUUBsaiCtolwOU7ril2qKtUmPFci0uyQGCOpYuikFrP4a/MWf8vKPvCrrkOx
X-Received: by 2002:a17:907:7287:b0:b88:5b35:914b with SMTP id a640c23a62f3a-b8dab3d056bmr95912366b.59.1769505619057;
        Tue, 27 Jan 2026 01:20:19 -0800 (PST)
Received: from smtpclient.apple (89-66-237-154.dynamic.play.pl. [89.66.237.154])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b885b700d43sm776257066b.41.2026.01.27.01.20.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Jan 2026 01:20:18 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.4\))
Subject: Re: [PATCH v6 0/5] Add support for S4 audio
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
In-Reply-To: <20260126-audio_drvier-v6-0-99e350855bc2@amlogic.com>
Date: Tue, 27 Jan 2026 10:20:03 +0100
Cc: Jerome Brunet <jbrunet@baylibre.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org,
 jian.xu@amlogic.com,
 shuai.li@amlogic.com,
 zhe.wang@amlogic.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <35CAE0E9-4C3F-4B41-BA1A-19761671F392@gmail.com>
References: <20260126-audio_drvier-v6-0-99e350855bc2@amlogic.com>
To: jiebing.chen@amlogic.com
X-Mailer: Apple Mail (2.3826.700.81.1.4)



> Wiadomo=C5=9B=C4=87 napisana przez Jiebing Chen via B4 Relay =
<devnull+jiebing.chen.amlogic.com@kernel.org> w dniu 26 sty 2026, o =
godz. 07:01:
>=20
> This series completes the end-to-end audio support
> for S4 SoC from hardware bindings to driver implementation
> and system integration.
>=20
> 1 Device Tree Bindings Updates=20
> Added audio power domain and S4 audio clock support for S4 SoC.
> Added S4 audio tocodec binding support.
>=20
> 2 Driver Implementation
> Implemented S4 tocodec driver for G12A architecture.
> Added S4 audio clock support in AXG audio clock=20
>=20
> 3 Device Tree Integration
> Add Amlogic S4 audio subsystem support in arm64 DTS.
>=20
> Signed-off-by: jiebing chen <jiebing.chen@amlogic.com>
> ---
> Changes in v6:
> - Fix the problem of string for =
Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml
> - Remove clock pad register, and it will be submitted as an =
independent patch.
> - Redescribe sound/soc/meson/g12a-toacodec.c
> - Link to v5: =
https://lore.kernel.org/r/20250710-audio_drvier-v5-0-d4155f1e7464@amlogic.=
com
>=20

Jiebing,

FYI

I applied this series over 6.18.7 and tested on s905w2 device.

With audio routing like this:

amixer cset numid=3D40,iface=3DMIXER,name=3D'FRDDR_A SINK 1 SEL' 0
amixer cset numid=3D73,iface=3DMIXER,name=3D'TDMOUT_A SRC SEL' 0
amixer cset numid=3D37,iface=3DMIXER,name=3D'FRDDR_A SRC 1 EN Switch' 1
amixer cset numid=3D61,iface=3DMIXER,name=3D'TOACODEC SRC' 0
amixer cset numid=3D1,iface=3DMIXER,name=3D'TOACODEC Lane Select' 0
amixer cset numid=3D62,iface=3DMIXER,name=3D'TOACODEC OUT EN Switch' 1
amixer cset numid=3D17,iface=3DMIXER,name=3D'ACODEC Playback Volume' 251 =
251

i'm getting working audio on analog headset.

Great work!


