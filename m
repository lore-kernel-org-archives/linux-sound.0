Received: from mail.lysator.liu.se (mail.lysator.liu.se [130.236.254.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34E1942122A;
	Thu, 13 Aug 2026 10:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.236.254.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786618316; cv=none; b=bSwzaXQR7ul7gPfYP1SYqX7AzF1V2yFe1dp8Too04w4sujYBSJWMG9/NjMzMYDKyRlGM2Hn7Mw22Mjctahicij9Kg9WV9gVrXeiwdp2PhL9xz3jDZexAXfh6r5XQk91brfX9YAsnczG7U5Mua6qwrSRvR4nLszmvitJrDQrGV30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786618316; c=relaxed/simple;
	bh=MyN9MOvLB07kHpymyOv9/j6c6+80TubNdwxk62xWo4M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IE0VyYZn451nTcTea3Dz5l2GajMOYu4VwbBwF6SMlANmLOl6T9DUtKPwkZIqWfeCkH1EErdsHcJYRXm3cAVncNV61OShqSENV/AYqp+vQnlzOiIc/k1AmPgNQUmhoZDFkA4AiNU+Z/xdvwLG5iTQH3i7EV99QGeYOAdMTQT01O8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lysator.liu.se; spf=pass smtp.mailfrom=lysator.liu.se; dkim=pass (2048-bit key) header.d=lysator.liu.se header.i=@lysator.liu.se header.b=LXX4TvE6; dkim=pass (2048-bit key) header.d=lysator.liu.se header.i=@lysator.liu.se header.b=r7Zkgq5o; dkim=pass (2048-bit key) header.d=lysator.liu.se header.i=@lysator.liu.se header.b=Lf2CXDQ2; arc=none smtp.client-ip=130.236.254.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lysator.liu.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lysator.liu.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lysator.liu.se header.i=@lysator.liu.se header.b="LXX4TvE6";
	dkim=pass (2048-bit key) header.d=lysator.liu.se header.i=@lysator.liu.se header.b="r7Zkgq5o";
	dkim=pass (2048-bit key) header.d=lysator.liu.se header.i=@lysator.liu.se header.b="Lf2CXDQ2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lysator.liu.se;
	s=2026; t=1786618297;
	bh=MyN9MOvLB07kHpymyOv9/j6c6+80TubNdwxk62xWo4M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LXX4TvE6d85qB1rL5gPKQjXD6NQLTZaq971k9QVWrMfwh3A7ymD7rFjwUfqULajlb
	 SFuCZz7i6idZdgaTAv5JRgloycL2/u48HXZyhRSzrCak9PFmzecxN93zxt9WPYENbi
	 zL8CKcz0QFTvhWYVAMRiaUmHKymKZlUruGvNFzbpOKRLtdYu8EVN5HSrx3UraaGkH/
	 L0evMYGqL8Nc6X3WdrNFLVRX73gtwwb0EGFGdmua8p5++tAdtZTE9VWAWFV3yTfatB
	 R0HeQxK96EiAmLzdy1olHTZ4XUaKumWmVQEtTAyB6S+XSI80tHtOzh8kLkGr3ar2Yc
	 /1l4qZ9eCjk3g==
Received: from mail.lysator.liu.se (localhost [127.0.0.1])
	by mail.lysator.liu.se (Postfix) with ESMTP id 14173BE30;
	Thu, 13 Aug 2026 12:51:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lysator.liu.se;
	s=2026; t=1786618296;
	bh=MyN9MOvLB07kHpymyOv9/j6c6+80TubNdwxk62xWo4M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=r7Zkgq5oDGMsru8cXhPANgVIl9bZlDzwYfcojWY2QTZacDv2RV1CZ1KLwx/E1DZCG
	 1tfXg1b8I1P/xVolOdjIhzikV357bcyVnGKfRrFje3/hAVUbIATg2hb8vogHJLZnqr
	 g5TAYS0mxJl3ifiv9zB1cOl77Gby59bwT7tNjtPiiz+FtcVFyI1emBW3Q6YheHBuUS
	 Lo1Z2gAipKVzG55vhHQ4B6agm2nYUCKYs+yXfWl+b95LA9oJddbtlfPU3Ix2jz96fB
	 sBsI4vSKJd78NIF4mdPdLNjrIiBMSBSalTYdFVVpoO5X14/asG7n2hW7qoStP55EC6
	 gntXCtEDZG/+A==
Received: by mail.lysator.liu.se (Postfix, from userid 1004)
	id DC62DBDC1; Thu, 13 Aug 2026 12:51:36 +0200 (CEST)
X-Spam-Level: 
X-Spam-Score: -1.1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lysator.liu.se;
	s=2026; t=1786618292;
	bh=MyN9MOvLB07kHpymyOv9/j6c6+80TubNdwxk62xWo4M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Lf2CXDQ2iEixgkWeT9Pdzd1elvV3bisDc+RNbePxRKIkTyMnx6oEG6sAypJnK3d+N
	 ROdUkHcWQW9bNjM99SZogACZcp6DWPNpJ1tnpvaAPjTYnF2hJQCQhPGEWnCKOy8e2j
	 oNCJ7bRf620xg+/osgkHriIafKV3rU0IQ8mpz2bjOT/Kcd7tCXelF6/H+qBrL/ERQJ
	 Iqe/mKED2buTPijwH3niJgQsx7CNzqOJUXSfFja93yzIpdryMw1h/3OGJ8PhqWpWeC
	 T7zD9EIKtIzlkyo0I3cV3pZbzJmG2H0azOF1YXN+VbyX1J7QEPLOoiBbACekXYaqmt
	 KyVaLINl2Bkyg==
Received: from [192.168.2.172] (81-225-28-11-no2391.tbcn.telia.com [81.225.28.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by mail.lysator.liu.se (Postfix) with ESMTPSA id 0C6DCBDBA;
	Thu, 13 Aug 2026 12:51:32 +0200 (CEST)
Message-ID: <d473d13e-bb5d-4d9b-b647-25a0b1b35364@lysator.liu.se>
Date: Thu, 13 Aug 2026 12:51:31 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: dt-bindings: tse850: Convert to DT schema
To: Bhargav Joshi <j.bhargav.u@gmail.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Andrei Simion <andrei.simion@microchip.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, goledhruva@gmail.com, m-chawdhry@ti.com,
 daniel.baluta@gmail.com, simona.toaca@nxp.com
References: <20260813-ti-axtensia-v1-1-768a1089fd5f@gmail.com>
Content-Language: en-US, sv-SE
From: Peter Rosin <peda@lysator.liu.se>
In-Reply-To: <20260813-ti-axtensia-v1-1-768a1089fd5f@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP

On 2026-08-13 01:33, Bhargav Joshi wrote:
> Convert Axentia TSE-850 audio complex from text to DT schema. No
> funcational changes.
> 
> Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
> ---
>  .../bindings/sound/axentia,tse850-pcm5142.txt      |  92 ------------------
>  .../bindings/sound/axentia,tse850-pcm5142.yaml     | 104 +++++++++++++++++++++
>  2 files changed, 104 insertions(+), 92 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/axentia,tse850-pcm5142.txt b/Documentation/devicetree/bindings/sound/axentia,tse850-pcm5142.txt
> deleted file mode 100644
> index b6cc5f6f78c2..000000000000
> --- a/Documentation/devicetree/bindings/sound/axentia,tse850-pcm5142.txt
> +++ /dev/null
> @@ -1,92 +0,0 @@
> -Devicetree bindings for the Axentia TSE-850 audio complex
> -
> -Required properties:
> -  - compatible: "axentia,tse850-pcm5142"
> -  - axentia,cpu-dai: The phandle of the cpu dai.
> -  - axentia,audio-codec: The phandle of the PCM5142 codec.
> -  - axentia,add-gpios: gpio specifier that controls the mixer.
> -  - axentia,loop1-gpios: gpio specifier that controls loop relays on channel 1.
> -  - axentia,loop2-gpios: gpio specifier that controls loop relays on channel 2.
> -  - axentia,ana-supply: Regulator that supplies the output amplifier. Must
> -    support voltages in the 2V - 20V range, in 1V steps.
> -
> -The schematics explaining the gpios are as follows:
> -
> -               loop1 relays
> -   IN1 +---o  +------------+  o---+ OUT1
> -            \                /
> -             +              +
> -             |   /          |
> -             +--o  +--.     |
> -             |  add   |     |
> -             |        V     |
> -             |      .---.   |
> -   DAC +----------->|Sum|---+
> -             |      '---'   |
> -             |              |
> -             +              +
> -
> -   IN2 +---o--+------------+--o---+ OUT2
> -               loop2 relays
> -
> -The 'loop1' gpio pin controls two relays, which are either in loop position,
> -meaning that input and output are directly connected, or they are in mixer
> -position, meaning that the signal is passed through the 'Sum' mixer. Similarly
> -for 'loop2'.
> -
> -In the above, the 'loop1' relays are inactive, thus feeding IN1 to the mixer
> -(if 'add' is active) and feeding the mixer output to OUT1. The 'loop2' relays
> -are active, short-cutting the TSE-850 from channel 2. IN1, IN2, OUT1 and OUT2
> -are TSE-850 connectors and DAC is the PCB name of the (filtered) output from
> -the PCM5142 codec.
> -
> -Example:
> -
> -	&ssc0 {
> -		#sound-dai-cells = <0>;
> -
> -	};
> -
> -	&i2c {
> -		codec: pcm5142@4c {
> -			compatible = "ti,pcm5142";
> -
> -			reg = <0x4c>;
> -
> -			AVDD-supply = <&reg_3v3>;
> -			DVDD-supply = <&reg_3v3>;
> -			CPVDD-supply = <&reg_3v3>;
> -
> -			clocks = <&sck>;
> -
> -			pll-in = <3>;
> -			pll-out = <6>;
> -		};
> -	};
> -
> -	ana: ana-reg {
> -		compatible = "pwm-regulator";
> -
> -		regulator-name = "ANA";
> -
> -		pwms = <&pwm0 2 1000 PWM_POLARITY_INVERTED>;
> -		pwm-dutycycle-unit = <1000>;
> -		pwm-dutycycle-range = <100 1000>;
> -
> -		regulator-min-microvolt = <2000000>;
> -		regulator-max-microvolt = <20000000>;
> -		regulator-ramp-delay = <1000>;
> -	};
> -
> -	sound {
> -		compatible = "axentia,tse850-pcm5142";
> -
> -		axentia,cpu-dai = <&ssc0>;
> -		axentia,audio-codec = <&codec>;
> -
> -		axentia,add-gpios = <&pioA 8 GPIO_ACTIVE_LOW>;
> -		axentia,loop1-gpios = <&pioA 10 GPIO_ACTIVE_LOW>;
> -		axentia,loop2-gpios = <&pioA 11 GPIO_ACTIVE_LOW>;
> -
> -		axentia,ana-supply = <&ana>;
> -	};
> diff --git a/Documentation/devicetree/bindings/sound/axentia,tse850-pcm5142.yaml b/Documentation/devicetree/bindings/sound/axentia,tse850-pcm5142.yaml
> new file mode 100644
> index 000000000000..0ab4b697d28e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/axentia,tse850-pcm5142.yaml
> @@ -0,0 +1,104 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)

Where did BSD-2-Clause come from?

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/axentia,tse850-pcm5142.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Axentia TSE-850 audio complex
> +
> +maintainers:
> +  - Peter Rosin <peda@axentia.se>

Bzzzt, this is no longer the case. This binding is orphaned (as is its
corresponding driver).

Cheers,
Peter

