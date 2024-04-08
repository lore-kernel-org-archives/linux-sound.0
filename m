Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F7438DE0
	for <linux-sound@vger.kernel.org>; Mon,  8 Apr 2024 07:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712562942; cv=none; b=WWp2xLmHiCQE4+7V+QTDYjyBJR8nhifAfjnOUegD3koqydvKvL518KIAtlp/EiSkkg+1SR5Q+W6hszzKNWMotXnyjzznXvcYalFVRQfSqxfP0dUXhJHg5Jk3hkPmcTFkyX8a2CuhkLpFH7mPbvjr0yHcwN4qo5r1vM2bTPe0Y4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712562942; c=relaxed/simple;
	bh=bOYdvGgOXEu+B9DwkxPE7PclZR6s+7HiNzNdrJ6GbiI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=osAVPWbc58hdG4oKYP4tW3Le60koRCDh7+ZG5BE98WyLeQBn495wiVf42nW+HgC0VRkPK5Kqftj5cm9Yuzf4ZRcgtIJ4qhdigdv66cgTqkjsTfYhS51775ZFbsfTvfkwQNmfGf/TAzqsVwAsLruwJqhM+np0BuX77Vn2JMIVtoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NHD0i1Hj; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NHD0i1Hj"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-516d47ce662so4351528e87.1
        for <linux-sound@vger.kernel.org>; Mon, 08 Apr 2024 00:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712562938; x=1713167738; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uGVKRsfzElZhuiOUBPoS8tlbXX9PErhVKCskk8TAVI8=;
        b=NHD0i1HjAqfzSxx+Cffi4ifQ+LENbObBmSOUoFrBrZi1hx3zSd31E6eBXvuL4n8n0L
         IlpazIBtzYj2iYV12uE6BjT9lZT3ueMW9t5DehtVjlq4l+vMbCR13X9NzBVYib17Pvqa
         Ea7U+pYWAhy4fXH9OqVj98xzZYq3YdIIbXR1MQ5rH82sBeod375VMJnldu49IC1ZO4kl
         /qaTZ2ltwCFCZ62tuxVFZrQSyPuGHxyZ4i5eZmTUOzX5nihWRLA7X7oW+P2jG8bxVxLQ
         FIsRD6UsyjxFtueTjYcDsNy3/XjaaWKcUItohrwFnxfXyAffXM6njDM1GWsuqTY9gJuC
         u+eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712562938; x=1713167738;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uGVKRsfzElZhuiOUBPoS8tlbXX9PErhVKCskk8TAVI8=;
        b=IFqNSxPTmp0YFAHNlWBVVw5Mo6brYLfnYmH014wooc3yCfSJCXvyoa3kMSq2jq/EwC
         LMT0ijC3cqjsJ/M+9S4dNr/N2DshZuVjeomSTh0sXr44G9dyyTDAFFL5teQJ9Oku2/5x
         Vyptn3IFRJsQI/oOkqCRrKXJYnCWfoqcUaEFkRWLZHHHopm4E2aJB3Echz290fK8sfti
         1xxgQa9pgCJ8mU3l+eRkE1yVLtZc3Iukp/h+EwgySRWX4B+M+B0pYNwYF7yFm/LisUcj
         YCtHEfxfpJMdsa9TyTPNs+r3MV62sOhWtoCBpICKb4KyEk6YrsURUESzB5yLKWV2VYxT
         fnrg==
X-Forwarded-Encrypted: i=1; AJvYcCUWWJq+6LV1qM6mjymrAEOyW8hE/1Je+jqarGBmCVM0zfKcZSj/RVPIsan9TvJSSj9h281TIe1vCDBRqAoE1BMszuC2exHLlb49mMk=
X-Gm-Message-State: AOJu0YyYzg16K0gWIgPxF9m5alZxNIZ0ab61j8QNzNy1uualMpc+J9sT
	tutTS7xkFmz5NrgSgK4q3vQa+gxJOqlC7W/AyUuFzuOTWGy7dMHRQPbW4fbRVUU=
X-Google-Smtp-Source: AGHT+IG5fj7ZFdIyyAiLxezuDJ3duVyM4elViQE59ai+tbpBGEttaDRgy40oJg3eCLOBiZ24ZzBUmg==
X-Received: by 2002:ac2:489b:0:b0:516:a6b2:f9eb with SMTP id x27-20020ac2489b000000b00516a6b2f9ebmr5761546lfc.69.1712562938010;
        Mon, 08 Apr 2024 00:55:38 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id z16-20020a17090665d000b00a4e9cb0b620sm4109828ejn.158.2024.04.08.00.55.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Apr 2024 00:55:37 -0700 (PDT)
Message-ID: <01734d96-bed2-4f7e-bbba-7068f14c822b@linaro.org>
Date: Mon, 8 Apr 2024 09:55:35 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ASoC: dt-bindings: imx-audio-spdif: convert to YAML
To: Shengjiu Wang <shengjiu.wang@nxp.com>, lgirdwood@gmail.com,
 broonie@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, shengjiu.wang@gmail.com, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <1712561233-27250-1-git-send-email-shengjiu.wang@nxp.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <1712561233-27250-1-git-send-email-shengjiu.wang@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08/04/2024 09:27, Shengjiu Wang wrote:
> Convert the imx-audio-spdif binding to YAML.
> 
> When testing dtbs_check, found below compatible strings
> are not listed in document:
> 
> fsl,imx-sabreauto-spdif
> fsl,imx6sx-sdb-spdif
> 
> So add them in yaml file to pass the test.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
> changes in v2:
> - change file name to imx-spdif.yaml

How does your compatible look like? fsl,imx-audio-spdif, so use that.

> - remove |
> - add anyof for spdif-in and spdif-out requirement
> - change example name to sound
> 

> diff --git a/Documentation/devicetree/bindings/sound/imx-spdif.yaml b/Documentation/devicetree/bindings/sound/imx-spdif.yaml
> new file mode 100644
> index 000000000000..beb214b51a50
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/imx-spdif.yaml
> @@ -0,0 +1,70 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/imx-spdif.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale i.MX audio complex with S/PDIF transceiver
> +
> +maintainers:
> +  - Shengjiu Wang <shengjiu.wang@nxp.com>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - fsl,imx-audio-spdif> +          - enum:
> +              - fsl,imx-sabreauto-spdif
> +              - fsl,imx6sx-sdb-spdif

This does not make much sense. You have mixed fallback with specific
compatible. I suggest you to fix your DTS and submit proper bindings.

> +      - enum:
> +          - fsl,imx-audio-spdif
> +
> +  model:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description: User specified audio sound card name
> +
> +  spdif-controller:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: The phandle of the i.MX S/PDIF controller
> +
> +  spdif-out:
> +    type: boolean
> +    description:
> +      If present, the transmitting function of S/PDIF will be enabled,
> +      indicating there's a physical S/PDIF out connector or jack on the
> +      board or it's connecting to some other IP block, such as an HDMI
> +      encoder or display-controller.
> +
> +  spdif-in:
> +    type: boolean
> +    description:
> +      If present, the receiving function of S/PDIF will be enabled,
> +      indicating there is a physical S/PDIF in connector/jack on the board.
> +
> +required:
> +  - compatible
> +  - model
> +  - spdif-controller
> +
> +anyOf:
> +  - required:
> +      - spdif-in
> +  - required:
> +      - spdif-out
> +  - required:
> +      - spdif-out
> +      - spdif-in

Do you need the last required block?

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    sound {

That's a random change...

Instead of sending two patches per day, please carefully address the
feedback.

> +        compatible = "fsl,imx-audio-spdif";
> +        model = "imx-spdif";
> +        spdif-controller = <&spdif>;
> +        spdif-out;
> +        spdif-in;
> +    };

Best regards,
Krzysztof

