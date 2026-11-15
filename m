Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794776624;
	b=dE3vjqgQJtx/k2D/hx684xEJge+RVxG7s0G7U7CoKH6S0r/NVenon48bt4KhqKxMI0Lx
	 x+U/WxwwvUhKxBY6YyGZVxNOiM13Nxdemb8xdQ2SpygxOXfHLrnG17xSKV0hBQajkjhvD
	 u7MM6Z5QdmGhxTMv8yfSj0FXdGS02ESpkYlLECFn9b90IAhK5xL+Hu2Zg8HZYZW2ftgIu
	 isnZI369ju60SMkxIFBSPImN/hobghGgO1H82F8f0lyhNcFppdlr0GeztQBwELU7ob3ww
	 gjLG8rfIXcwQkVzREPF2XRw/hiXWIKNirRZNAtiOKP+9akFFseWaU/r2NUvLrYUCsAw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794776624;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=JeZW25rG3PtAzFodSzRAtiRusay7Hp/q+l2Vzy5PdOM=;
	b=dSu7xEETPd8kiHheZdi7Z2hleDO1pCLrINeLGbaR7x1/MzQaY16jhpsFQVDaO+yJ3be+
	 s3KmwOWfdsnRbJEWbgtfIY9OsUxPJ/X9O2nlEXSpDZdBeEHX/iuxWw/tM9nwHN2eXvVdn
	 SZTTnkiqWEwllS7gHWv4lCdYU/B2a5QFXtUIzn5J8yoUrUNB3vmRvU/6xRCU6i6Oxhx/i
	 g4VeHweGn1Yc8Ravn5ti/jt1MJ90ZdZfnRbmR2EfJsnfZXkv+CAMARIjsQpmKOe989ivY
	 i/aPiSCL/Q+dNyoLMv+i/VkMtdG/nKYmhpbvMtmgBK/GpI3sFz6IKyhW5+wHYsA2y3A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=Ngk2DVgv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.42
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A21606A323
	for <linux-sound@vger.kernel.org>; Sun, 15 Nov 2026 21:03:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4A21606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=Ngk2DVgv
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-679a2b5fe87so2745613d50.3
        for <linux-sound@vger.kernel.org>; Sun, 15 Nov 2026 13:03:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794776623; cv=none;
        d=google.com; s=arc-20260327;
        b=aMKklhxsraYpwkPyifjwBXGMiyanN2RJxcq9MUAR7dN9rqAdqyaGutsdHXxFPYU0QJ
         AiW3+GgXOW2yODRXmkA2utkGjqQCc80UQeAafClAE03utEyMkUs5eR+RZbG8MBqz7Owk
         QMiS0i9TJIu3h0g95Pt1FtHRYGSvP6yMgsz9x+/rB3LMaikKIs6/6xaMM/Cu+9S2uPwC
         ViHwd4NTLNwQhQIWiyqn5I2s2e41spt1s8NZ6Yk8ITvchtBrJ5uXBsPswmJhaFDOj24x
         5GReUGx5vgOzRpZ/GN7Q47TMAMGxbfblFnVdom1QdAD8OBHZNsnmN087jkf7T10QaGlu
         xiPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JeZW25rG3PtAzFodSzRAtiRusay7Hp/q+l2Vzy5PdOM=;
        fh=N5+DubUTUQLzNJ8jvXtJSzB4FkB3DRWEV9a9f94/GZc=;
        b=VRR9eHSsKkBVRFoXGI8jNLDcPWdqo3UJAY3xhyWSzjRPsxJ/YMpFQrVXwwtIBIAQg5
         65DbCC3ym+cXi/TMZcvle0cWwM4EYttzAOnmjbWObzXj78AZNqK2hsZWJU5d50ZZLj+2
         ByuARcTMbpNe86Csi04jC9BfXqT8vkF3bFpSKrBhI7eXARixTi+UQs1GbFFqmevZ69/8
         g8dXEBm2A8QcDn7CafR7XMgr9qYwQOLUbepNeAgUbVz1I3yU1UiGrjE+PNGLDy6AEe1r
         JGsRRXmLCrKFWTZXZv+VAgplO4iDvnkgGEvMoJJQeKl/wgIQpxuFN3XGN4FajbTnJRnQ
         WSeQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794776623; x=1795381423; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JeZW25rG3PtAzFodSzRAtiRusay7Hp/q+l2Vzy5PdOM=;
        b=Ngk2DVgv3r28OnfOZXzmGqPF9KIldZV4siYG2jnY/eLZA0Q+HpDh3boP93A6PrRNM5
         YXgDavVLkjCRWFSMTn67aArDtygf4xnZWCxAyChn3AGBrUOTNT1Ekq5Qvz8RI8ahGili
         uQcvSDz7PYWGlY4pHvXQhl5hhSzGPpisrAjiSyYbXIEt7QMlt1KVAuPbhmZN6ke/I1Uk
         yzh7X6lzGwWLI0eIB7KgpFK4h4Y3JOt7MQrUiNMwQOQmLnApkCi0OA6cMgPx8rawEyZJ
         iMCbrdjBwyERqd26SjQ8ml6K+OcBQJjIQUN7Gw+1j8fcHoCb1o4wTmqDv+t/gkdi/Afj
         T4rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794776623; x=1795381423;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JeZW25rG3PtAzFodSzRAtiRusay7Hp/q+l2Vzy5PdOM=;
        b=2hCh4tHAFhrq2kmBxY8EPNF+Hg8TaMwRpnD8ascpA3gKgR7XxZpAFW8ZDkikkrA5wn
         MrdUKpI2idE5aP/whZ/lIGIghxB5Datn9nzhCR768tD2mzWIf49hQ+qfLxzio5MKClrj
         l3nKNfb+2tBPU5Pmo75+EZIQNFPeHeiJTZH0RTwHXBdpGUaAaODuB42JQG2KBgC+1Yj8
         fxLM/0/GX4TOMl2FXSgFPpsvyheombiVTWQBW2QmNdthP5u5Bepu99RwKzkr/7DqmdZD
         nhC3ujSJDcBU3bUWtXChZ+Ml4QInl+Q3HimUk8LP93VJomXlD/sUOz2F63v8m69w0XKd
         69aA==
X-Forwarded-Encrypted: i=1; AL+hErGAgTczXb6i488TmiF/Tmmc4CshLl98ZRxtpLQhglBZa3S4cJnAUsNbyw0yLBIjEP4Cx3uTv/fnQrDjsw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+WQyiwgo28Us8SI4N+NRP1XpJY5bygRpb1SENWu0rt/GYPXwdU
	XKmNCMSO2uXNAqqJmAQm12agmarOWYQnRS9vucwC1I9hpOYRZ1kI1RBcF2R3MKl+L7Y/lipWMOX
	AofbMBYKD7B8bELW9fDbdoW5cK2/e690=
X-Gm-Gg: AYBFou1ChbfWmqUofVwc28dEuryO5ebzijdNs/2sAZ3KAQAHExuJ/6DCGJZLKbYIGA9
	peOuy8Wf3QTAu44F+dPnDZx2K2nxLsHyufXrPh5t3+UfticYtwkM8Ux/aUpYtWjLxtfuiWM5hlm
	Z3kZpACGcIrrVUP93MMp0RPm3zr22SJ3nyrvvsnbSjJnM9pvEOJvz5zIrCvKQHa0E6vMKNLrvcW
	Qzm/RAVM3IvinX1UUlf2cuxa6kOtRgQYQG9VdF9KpnlyEhALJU6sCMsuTkQKQWaOYHV+c8PAsW+
	KO2v6PU7YU1rHKW7RyjB3+A/NoLC2RHid4/IQn4MnyRvi3jPOuPebsi/0byijUhznp13/e2647/
	ux/y7/W3iLFa2s6BAtTilldYCnlNK8kc8HDSdhVwetInPKBhnMeRZMeR7ulQlWUPa5imWMMc=
X-Received: by 2002:a05:690e:134b:b0:67d:a747:37cb with SMTP id
 956f58d0204a3-67da7473984mr1788570d50.80.1794776622877; Sun, 15 Nov 2026
 13:03:42 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261018-audin-v5-0-4b8cc13a1b22@baylibre.com> <20261018-audin-v5-1-4b8cc13a1b22@baylibre.com>
In-Reply-To: <20261018-audin-v5-1-4b8cc13a1b22@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 15 Nov 2026 22:03:32 +0100
X-Gm-Features: AclHuK8RZRddO7WOnvwxzgFddHhyLeT9NtqQThzXqpKNCFZiOf6pqJWI8MgY6vE
Message-ID: <CAFBinCC+-N8LvoXZwMhoxjOzXgoYUfDKCcvmD7Uuph5=hTSg7g@mail.gmail.com>
Subject: Re: [PATCH v5 1/7] ASoC: dt-bindings: add amlogic,gxbb-audin
To: Valerio Setti <vsetti@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Valerio,

On Sun, Oct 18, 2026 at 12:18=E2=80=AFPM Valerio Setti <vsetti@baylibre.com=
> wrote:
>
> AUDIN provides I2S audio input support to the Meson GXBB and GXL SoCs.
>
> The AUDIN block on GXL is identical to the GXBB one, so "amlogic,gxl-audi=
n"
> uses "amlogic,gxbb-audin" as fallback; the SoC-specific compatible is
> added so that differences can be handled later if any are found.
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Valerio Setti <vsetti@baylibre.com>
> ---
>  .../bindings/sound/amlogic,gxbb-audin.yaml         | 69 ++++++++++++++++=
++++++
>  1 file changed, 69 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/sound/amlogic,gxbb-audin.y=
aml b/Documentation/devicetree/bindings/sound/amlogic,gxbb-audin.yaml
> new file mode 100644
> index 000000000000..4df4796623ed
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/amlogic,gxbb-audin.yaml
> @@ -0,0 +1,69 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/amlogic,gxbb-audin.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Amlogic GXBB AUDIN audio input controller
> +
> +maintainers:
> +  - Valerio Setti <vsetti@baylibre.com>
> +
> +description:
> +  AUDIN is the audio input block of the Amlogic GXBB/GXL SoCs. It suppor=
ts
> +  various input formatters (I2S, SPDIF, PCM, HDMI) feeding three FIFOs t=
hat
> +  transfer captured samples to memory. The sound-dai cell selects the FI=
FO.
> +
> +allOf:
> +  - $ref: dai-common.yaml#
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: amlogic,gxbb-audin
> +      - items:
> +          - const: amlogic,gxl-audin
> +          - const: amlogic,gxbb-audin
From what I can tell it's even amlogic,meson8-audin compatible.
Although I didn't have the time to test in on hardware yet.

[...]
> +    audio-controller@a000 {
> +      compatible =3D "amlogic,gxbb-audin";
> +      reg =3D <0xa000 0x148>;
I believe the audin registers are 0x300 wide.
Both, GXL datasheet [0] page 43 and GXM datasheet [1] page 48 claim
that the register area is 0x100 wide.
The last documented register with AUDIN_ prefix is AUDIN_FIFO2_PIO_RDH
=3D 0xb8. The datasheet [0] (page 395) lists register numbers divided by
4, so to get the actual address in the memory map we need to multiply
it by 4, which gives 0x2e0.
The 32-bit SoC vendor kernel [2] has a header that states: #define
AUDIN_ADDR_END 0x28bf (same as in datasheet, we need to multiply this
by 4).

I'm bringing this up because dt-bindings are supposed to be complete.
So even if the driver doesn't use a resource yet we're supposed to
still describe it.
I don't see any additional resources that we'd need to describe and
#sound-dai-cells allows adding the additional SPDIF input later.
From what I saw in the registers there's also the possibility to send
the input signal to AUDIN but I couldn't find any additional resources
we'd need to describe in the dt-bindings for this.



[0] https://dl.khadas.com/products/vim1/datasheet/s905x-datasheet-v0.3.pdf
[1] https://dl.khadas.com/products/vim2/datasheet/s912-datasheet.pdf
[2] https://github.com/endlessm/linux-meson/blob/d6e13c220931110fe676ede6da=
69fc61a7cb04b6/arch/arm/mach-meson8/include/mach/register.h#L2274
