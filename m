Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9218C3612F6
	for <linux-sound@vger.kernel.org>; Fri, 17 Apr 2026 04:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776399111; cv=pass; b=NAgHU8HMPD4C7amJIOKv+FZ0v3Tiw1QoFcQgQkI3j7kF6cVYTWSpI+dj79nQ+Y8OELHlO6Eji0IQwkwIGf+gYETzDET8dpG7pgrIsqRhCfIBdSnFhTEdr1CGojCZQkdPFxpt3sKC87p6CRAguAuT9cu4YOrpzBxaGmNf+28cz98=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776399111; c=relaxed/simple;
	bh=+2ab5IrqPbFXNNIQ8XJUFEH8BXNrH+M+B3Q0jwDK8y0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VS9J8hDoDNa45SHH/klYQqW3IiZJrPpBErHYmGm122wye4n83IgJYoFfChVEG/rTH+qZD/gAbhoxSczeHYNniWAfs+uuXhapc/3/+alyMNe6JluXwNtrEBFI9MvsKXSzfYTqTQ7zWHoBLU864kT875UV5gyztMKs/Pbha8POB+o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nH8rnOod; arc=pass smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nH8rnOod"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-8a3342d301aso2491826d6.2
        for <linux-sound@vger.kernel.org>; Thu, 16 Apr 2026 21:11:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776399108; cv=none;
        d=google.com; s=arc-20240605;
        b=dNL8rtsI1hpdFha1oeqf4TtaB26QjH309zM4n0Z2gyH3yh8CUpcc3YG+NBvau2IsSp
         N7lkDZ6OrGJg9SHikvlP67wuX/Z3qoHGoOIQmSjxHzTq7ExEFYxnpPxuuDQ5v/U9QiiV
         Jjgel4cT9COrFNXpDoO3ueIvNwIYu2fXIxMo/MBFdkyr63y2raeiapsEcIDt9TiLfBYT
         gS6ITjZYEACBnC1WyxEs044C00pDWgamakd4AqXE8L+Vr0IAOzvLvqL3jnEA7wMBuCWJ
         75gVVLOvQ0ZCo+KPrQxSE2cvZu1dWBNl8Hhw33xF8llQrTvD5I+51vY5DSCEg8gW161h
         FN+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aNWr/yLeqoiJfJkarHcqgujpjoQyDiWBvxAIr+NZ/fg=;
        fh=ZShzsLwDlJgSqbIuEY99KZXCRBL3VMiFmN/8KsV4aYc=;
        b=DPip8gAOpmmGaeqdMMoEl90CluYjF37TgAqPiHyq+1GioThBc7m6lWdZlcPHChnD/f
         FDPoLjNQwzElDL4qJf2a4jXqxJSGlFLpllc5wiFdH/lHWlhNjIieXo+M2ZiaOngow1kl
         YhjwzjcBqHwcHMLLvUbHyhqQxieEQN/mYCnmX2rkpKIjqIRT9JQeNHtIuMMVl3Lq+MPr
         4dkGMNCirggnyHo7u3MDvprW0O2dfV5NjzBuOrOgq00O11676qS/cj1uFrqtXI8MaFI6
         oRBnaMhIqoVgf1Vc82CCyT4RaPb6+Ygk3N7HG0DRKhT0nRseMFvpF0x7SmKe8txunLgx
         v9fw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776399108; x=1777003908; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aNWr/yLeqoiJfJkarHcqgujpjoQyDiWBvxAIr+NZ/fg=;
        b=nH8rnOodupDm7ykYjQuKn2AGFzEAuwnRouqcJyordQKDaP1N3tXdd8yFQYufSZHKWH
         F7dxRH2FpUP7kC2oxIJUNjkAT4Lv99H7zNuxbwsoB6+1Sai6UCLcBYHrsGYosJ25vTy5
         aI5QKcOpy+m5rf3f2CAU6SPF805a0TvVOhwitwCPjyFbfXuEmWFcBul8SogB5taWs32I
         MwIabDAcdXKyHDaFgq+Fsarz+5sX4WYqd33sV/Wr+w0fUxaLL9YjrMcMYYvuGlhjR4q0
         Y0Z4eB2FtNLs6UHF79XFeHcFweqH34qtLA2FhlUKhC5Ji/D2slgphNH2JQAey/kLPOQm
         ODkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776399108; x=1777003908;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aNWr/yLeqoiJfJkarHcqgujpjoQyDiWBvxAIr+NZ/fg=;
        b=ogvodVh8C0Ee/gDVc+gqX2RHzYwFHTasSd9meis8Otk1aQ/XFxmiGnzGpYU2l9hsvV
         HHOElog9sYDZuCgXgfE2mus3fElkTMWbzQqulYn/cDDFeNqDkQ2gOsG4uXkWX42yy0BP
         XQrXesRkrQyAGvecBHvyy/Ft4BTXd5GMkQJEMC3Zo2ePk/LOOIsKn82cpF1u38xY5zks
         2ZmLCc0SG1HKAHjVBf0IsIBqcbb8DuND+8QCidp+GuWHETQJieN4DzudE1Z4ScrDtkVb
         Df9uRNIwfwJUWJIYlMPV8as4Ayw5gzI57chT+5UTdz0y47l1tCz6t9gxMwnG9IYwu5xF
         /Nqw==
X-Forwarded-Encrypted: i=1; AFNElJ/tm9hCrZW5X7CH+dfzuEpTRsDsRaSJ+4dNlwzQN9p1MHJ6bPqlms9Rgr5DvxOTe7ZuDeTpZ/SqHFUvnQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVzNtoQLz2MEjT2AQuc/4gpmAHCm4bFNFv/bG8TOKZzuPRt563
	v1DEXM7SRH+LvmSjkK5K/hPIK2nKwS6fzoP/7TL7dmG2vXs7s+9nkYzK/tOp2wXKYJKQxIT/+zH
	uARfOevJ6grEnjLlXe0cu63USfzhzgEM=
X-Gm-Gg: AeBDieua6IEdnrp4kaJ/GH/Ij7bp0Mko0QwKOO8Xb44T59tYJbG5ntoIrvzXlCrBKpp
	LuP4T/Sxxl3rXIoNQFdw1feNQsS+Kxp6JFebpbH/5M6ly5gkwDCCK+UZslXGcoPFqP6ftFQh9qM
	iFrEzvtdikcJ/1sSb2Ij5+adpnTuABGdrg4WfZNF1yScAL9+QIsqBxuInmnb1SDEqy+xMVggQJQ
	ethfVgestUDNaSEQGr2MtN0UjHzwcwT54O3N32dqwNa/td71wQNV5CbpbEPzSnFi/JxSPWg9yBI
	A+F9ODwWzl56+adZ4//jtCPP9Hn5b1sehNvdida7WplOYOsL61rN/pJutTpj0/C0uu8J2j1GznM
	jcGGmo8s4dVZNEccCflCI18Sw0AodY6Oinm1y
X-Received: by 2002:a05:6214:5b87:b0:8ac:ab13:8f15 with SMTP id
 6a1803df08f44-8b027ff994cmr24935216d6.7.1776399108576; Thu, 16 Apr 2026
 21:11:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260416152329.6016-1-chaitanya.msabnis@gmail.com>
In-Reply-To: <20260416152329.6016-1-chaitanya.msabnis@gmail.com>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Thu, 16 Apr 2026 21:11:36 -0700
X-Gm-Features: AQROBzDilUU0qSd7ImlmaZmVdXmndkGf1PbYURtmqbEVARS0JSZHu4ZqyEUBOoI
Message-ID: <CAMo8Bf+jD1QiLOgOcu3OOnfHyG9XCdyi6CTTQ+uSREz7yy0Hrg@mail.gmail.com>
Subject: Re: [PATCH] ASoC: dt-bindings: cdns: Convert xtfpga I2S to dt-schema
To: Chaitanya Sabnis <chaitanya.msabnis@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 16, 2026 at 8:25=E2=80=AFAM Chaitanya Sabnis
<chaitanya.msabnis@gmail.com> wrote:
>
> Convert the Cadence XTensa FPGA I2S controller plain-text binding
> documentation to standard dt-schema (YAML).
>
> The hardware requires exactly one memory region, one interrupt line,
> and one phandle to the master clock. Verified these constraints against
> the driver source in sound/soc/xtensa/xtfpga-i2s.c.
>
> Signed-off-by: Chaitanya Sabnis <chaitanya.msabnis@gmail.com>
> ---
>  .../bindings/sound/cdns,xtfpga-i2s.txt        | 18 -------
>  .../bindings/sound/cdns,xtfpga-i2s.yaml       | 48 +++++++++++++++++++
>  2 files changed, 48 insertions(+), 18 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/cdns,xtfpga-i=
2s.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/cdns,xtfpga-i=
2s.yaml
>
> diff --git a/Documentation/devicetree/bindings/sound/cdns,xtfpga-i2s.txt =
b/Documentation/devicetree/bindings/sound/cdns,xtfpga-i2s.txt
> deleted file mode 100644
> index 860fc0da39c0..000000000000
> --- a/Documentation/devicetree/bindings/sound/cdns,xtfpga-i2s.txt
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -Bindings for I2S controller built into xtfpga Xtensa bitstreams.
> -
> -Required properties:
> -- compatible: shall be "cdns,xtfpga-i2s".
> -- reg: memory region (address and length) with device registers.
> -- interrupts: interrupt for the device.
> -- clocks: phandle to the clk used as master clock. I2S bus clock
> -  is derived from it.
> -
> -Examples:
> -
> -       i2s0: xtfpga-i2s@d080000 {
> -               #sound-dai-cells =3D <0>;
> -               compatible =3D "cdns,xtfpga-i2s";
> -               reg =3D <0x0d080000 0x40>;
> -               interrupts =3D <2 1>;
> -               clocks =3D <&cdce706 4>;
> -       };
> diff --git a/Documentation/devicetree/bindings/sound/cdns,xtfpga-i2s.yaml=
 b/Documentation/devicetree/bindings/sound/cdns,xtfpga-i2s.yaml
> new file mode 100644
> index 000000000000..9a4a9db3c159
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/cdns,xtfpga-i2s.yaml
> @@ -0,0 +1,48 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/cdns,xtfpga-i2s.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Cadence XTensa FPGA I2S Controller

When put like this it looks like an official name, but it's not and it miss=
es an
important bit: 'xtfpga' is a group name for very specific FPGAs bitstreams
generated for xtensa cores, spelling it as XTensa FPGA makes it less
obvious what it is. I'd suggest keeping the original description.

For other changes:
Reviewed-by: Max Filippov <jcmvbkbc@gmail.com>

> +
> +maintainers:
> +  - Max Filippov <jcmvbkbc@gmail.com>
> +
> +allOf:
> +  - $ref: dai-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: cdns,xtfpga-i2s
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +    description: phandle to the clk used as master clock. I2S bus clock =
is derived from it.
> +
> +  "#sound-dai-cells":
> +    const: 0
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    i2s@d080000 {
> +        compatible =3D "cdns,xtfpga-i2s";
> +        reg =3D <0x0d080000 0x40>;
> +        interrupts =3D <2 1>;
> +        clocks =3D <&cdce706 4>;
> +        #sound-dai-cells =3D <0>;
> +    };
> --
> 2.43.0
>


--=20
Thanks.
-- Max
