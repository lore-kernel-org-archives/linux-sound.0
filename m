Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com [209.85.167.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF1A242D6B
	for <linux-sound@vger.kernel.org>; Tue, 10 Feb 2026 06:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770705881; cv=none; b=Q97W9BIzJjAI9jvjKqGhRRGGVEU4ScANti1oEZEfd1Y3/cVXyx57T3+5zfw1+vCSdknBfFaXb7duFFWAvDRud6zVIQUkKr5A9HDjCzleofLRMUNYzgTF5LlOjM4wdJFEYKglKZnRbuWur3fYFHZIhxy2kQKXuoHbHaFEEQ96aqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770705881; c=relaxed/simple;
	bh=35j7QCKr7CjNoYrKsWuIp3cK/z8O6HH27ymSrJiQpvs=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=sKmXM5iRon7SWIEkiEuEuezwBvveB75C/UomyFyf5Fwv+O8XHAhvU0ZQhm0++EGqAsxR5mNK6mk6D/377lDYVwOudops7oz+XrlaaE+Y472rB1UjSQfrCcaEGUVAaHVVXl/tJQ2bU23zr9vls7tnLTGpZ0I0iaKukEX30pyY6oM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dcaEjEJd; arc=none smtp.client-ip=209.85.167.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dcaEjEJd"
Received: by mail-lf1-f65.google.com with SMTP id 2adb3069b0e04-59dd7bfeb8aso6289377e87.0
        for <linux-sound@vger.kernel.org>; Mon, 09 Feb 2026 22:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770705878; x=1771310678; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6UuS3rFdbmBg/Ac9hnd/FWadZClcyql0U6id5zi3Xzc=;
        b=dcaEjEJdsQnIrBKng79trU4WctXy/dKRu5f//YKsyfiquQRrHERgZdfhBoWJ+hXRep
         JnH5B6QLtbfSfPuqxoGcg1EH/02cmqo1tLl4wNhzwfnLph6o55kwxT39Wmd2n16Esrbs
         PrBuY3+gT86JvRDfeZ8m19xLj/pkFZujwU0b2YbrfLy9p4RJSR2SwCGlqp2lk/UFFusb
         f8O3sy4xtSwBn1zreqkjdDwjeebF3UBr/Iv6Z7Yz0O+Wy9NcAdUQdoHcfe7H4b0eb1gk
         dJcZJbBYUrT4+6kZXDBFUE9O8qhgsgMOCL1wcD1v3zrhhBTjxvD51abvB/IyA7OUaGZp
         uUHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770705878; x=1771310678;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6UuS3rFdbmBg/Ac9hnd/FWadZClcyql0U6id5zi3Xzc=;
        b=YIhk8TGomsTOZdGdJE95gcJHIzoErirNZ5OvfWeQi+9fVJ6hF168RGzRXGwHUSjeXd
         0OOAdh4dbtWNZbRe0+6u+IEasEBtv1oNyCwxj9rzBu33maUyX0NMWO3dKZgEnMHdCMal
         GPT1WVcfK9amhGhrJ3dCM62v8IkUtdWE4CjFioWR4sJa6+8uaneSvvTDuVYogsiZcuJv
         58kxus4xauoIQT07rVbzqWeDpqmtpUcgW+RwT/Pb3k5LE743KXvzwCxgKpISvIQmpfos
         4yT8RpWCYe21+mLvbr1mWL8Vp/5HZwaBVwIWldbjOOrNWVBg4B6iOy2cwGi1bKYm0iSk
         ZQlQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtafqzTxFfnQgXN6iDOp58+ZVUO55ypfFIfXfctzGgFqiM0qMhn0FeHDEyAUO5Rj9sebQsKibrw3iMGA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzFnUwxOy9Fsbf4v2fchslhEp+r+Fu+VX0QFKY+YO01EuGZyaiH
	2JiD5hjoB/I3EHxD1wRFf80UQ7fvsoIrb9/rGZ4p3cK8b3Qs6LO8zgP2zTMUbW8L
X-Gm-Gg: AZuq6aLlECnfcfjHyPd41KTWIbLQsZDpwX2MvX4j/HchGShCLyFfIqv2VDuvYqhA0yJ
	io0Tsq8xMm/EwXM5sMGk5XU0TWkn1n2MAIaITM3W1vQ0GxjjU3br0+b88hH6W6wz+en/qcwNnEK
	VCI6nu5p0CECOiNAiilnTQ2LQwBqK39gUiQnRAyDHlv1Fj7LQQCi5Os2rFlW49S/alXe4TPoKp3
	/8REhNnaBJGBV7vpdvR1luHtlONTix1HJM4NgJ4v7K+7PA2vnSEsjOzhdMOtRv/Vp4/ZoWEBJGS
	7xUhxNwQxE08mbib8Om6ndDC3laoE4dXDeQoEjA9RHByrv2xKxWtA8BZ6Dv1iVPbPER+GOBH3TY
	HJ6BuKn/Qxo60ZY2tZ0CB4ywPHEny40Uz0jw2X7S5wRW2tCunrx633ArBJoU/hhVXGazTR2u1WU
	nRaiQ8Jj7Jrj5Re7h7LLihFyZbPbJb5H4=
X-Received: by 2002:a05:6512:b16:b0:59e:387f:bf97 with SMTP id 2adb3069b0e04-59e55b9e424mr258253e87.21.1770700139219;
        Mon, 09 Feb 2026 21:08:59 -0800 (PST)
Received: from ehlo.thunderbird.net ([178.137.233.16])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e44cf6f67sm3033446e87.13.2026.02.09.21.08.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Feb 2026 21:08:58 -0800 (PST)
Date: Tue, 10 Feb 2026 07:08:58 +0200
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>
CC: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 =?ISO-8859-1?Q?Jonas_Schw=F6bel?= <jonasschwoebel@yahoo.de>,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_1/5=5D_ASoC=3A_dt-bindings=3A_n?=
 =?US-ASCII?Q?vidia=2Ctegra-audio=3A_document_CPCAP_CODEC?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20260210024619.GA2374304-robh@kernel.org>
References: <20260206173423.145954-1-clamor95@gmail.com> <20260206173423.145954-2-clamor95@gmail.com> <20260210024619.GA2374304-robh@kernel.org>
Message-ID: <35B721E4-F950-4425-AFF8-D6DBF54F513F@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



10 =D0=BB=D1=8E=D1=82=D0=BE=D0=B3=D0=BE 2026=E2=80=AF=D1=80=2E 04:46:19 GM=
T+02:00, Rob Herring <robh@kernel=2Eorg> =D0=BF=D0=B8=D1=88=D0=B5:
>On Fri, Feb 06, 2026 at 07:34:18PM +0200, Svyatoslav Ryhel wrote:
>> Add dt-binding for CPCAP CODEC=2E
>>=20
>> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail=2Ecom>
>> ---
>>  =2E=2E=2E/sound/nvidia,tegra-audio-cpcap=2Eyaml       | 90 +++++++++++=
++++++++
>>  1 file changed, 90 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegr=
a-audio-cpcap=2Eyaml
>>=20
>> diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio=
-cpcap=2Eyaml b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-=
cpcap=2Eyaml
>> new file mode 100644
>> index 000000000000=2E=2E5335fa56fb3c
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-cpcap=
=2Eyaml
>> @@ -0,0 +1,90 @@
>> +# SPDX-License-Identifier: (GPL-2=2E0-only OR BSD-2-Clause)
>> +%YAML 1=2E2
>> +---
>> +$id: http://devicetree=2Eorg/schemas/sound/nvidia,tegra-audio-cpcap=2E=
yaml#
>> +$schema: http://devicetree=2Eorg/meta-schemas/core=2Eyaml#
>> +
>> +title: NVIDIA Tegra audio complex with CPCAP CODEC
>> +
>> +maintainers:
>> +  - Svyatoslav Ryhel <clamor95@gmail=2Ecom>
>> +
>> +allOf:
>> +  - $ref: nvidia,tegra-audio-common=2Eyaml#
>> +
>> +properties:
>> +  compatible:
>> +    items:
>> +      - pattern: '^[a-z0-9]+,tegra-audio-cpcap(-[a-z0-9]+)+$'
>
>Expecting a lot of devices and differences? I would assume all known h/w=
=20
>is well known and any differences are known by now=2E Perhaps even just=
=20
>the fallback is sufficient?
>

From=203 to 5, maybe more=2E Hard to trach different variations=2E Having no=
 full schematic does not help either=2E

>> +      - const: nvidia,tegra-audio-cpcap
>> +
>
>> +  - |
>> +    #include <dt-bindings/clock/tegra20-car=2Eh>
>> +    #include <dt-bindings/soc/tegra-pmc=2Eh>
>> +    sound {
>> +        compatible =3D "motorola,tegra-audio-cpcap-mot",
>
>Why do we need motorola twice?
>

"Motorola" is the vendor, "mot" is the board name=2E Same name you have re=
cently seen in the CPCAP schema patches I have sent=2E

>> +                     "nvidia,tegra-audio-cpcap";
>> +        nvidia,model =3D "Motorola Atrix 4G (MB860) CPCAP";
>> +
>> +        nvidia,audio-routing =3D
>> +                "Headphones", "HSR",
>> +                "Headphones", "HSL",
>> +                "Int Spk", "SPKR",
>> +                "Int Spk", "SPKL",
>> +                "Earpiece", "EP",
>> +                "HSMIC", "Mic Jack",
>> +                "MICR", "Internal Mic 1",
>> +                "MICL", "Internal Mic 2";
>> +
>> +        nvidia,i2s-controller =3D <&tegra_i2s1>;
>> +        nvidia,audio-codec =3D <&cpcap_audio>;
>> +
>> +        clocks =3D <&tegra_car TEGRA20_CLK_PLL_A>,
>> +                 <&tegra_car TEGRA20_CLK_PLL_A_OUT0>,
>> +                 <&tegra_car TEGRA20_CLK_CDEV1>;
>> +        clock-names =3D "pll_a", "pll_a_out0", "mclk";
>> +    };
>> --=20
>> 2=2E51=2E0
>>=20
