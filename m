Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B17F332621;
	Fri, 17 Jul 2026 09:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784278839; cv=none; b=dV7mSCT8WROd2hjVtnReeF4MCA9Nbi3M5aJEYwSLB82+ragxNlypo6GZX0XDvS8+Z7Gh3HavUkDuRMkrIJh7I1dK5WNUrpRbV0DOPn8bGTN4xuarAqPoh78lMbf+MILbke+oxy2kTn3yWe1vMSkVgFISkMd+gArsUdBkBrPfiCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784278839; c=relaxed/simple;
	bh=GqjgZLWJqTzmWIfJ5GwXdDYPIGnoXvZyG09dvJHTZ1E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n/NUMr+VwlE41pkgGqEtNFbX9kx0NMjl9/RgS8xPX5NwbsLCqjNkTMmqoRpMIeThMYVaTtkRSXhUPBgrk+mVzt2mfPFJRc16J9bjpOscP2CZVSJ0lB1eCG9X10rgeTatT/ySJxP0PtmxqzVAxqu2zMLMoYBhQzbI2GNyPyjYd/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b85LfvAO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b85LfvAO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E9FC1F000E9;
	Fri, 17 Jul 2026 09:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784278834;
	bh=iFm4cxvRaJYlbGT94XL0tWog7kZGwd4Kba+4eMUzxzw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=b85LfvAOZYoPP6e1uXSEyhqBqP2IMf0gqopu1vmXKYvgf2VaRATeVgCEzqB2/YZa0
	 GzlW+Uk+XfyTV+zNLQH2gJUuw64okr9F9mz95o0hQuPlSTxpvtYwiP8mRQCFJFfkh7
	 zTlaP8YuyNc7mfnrZB9bBPiE7TD0P+tAHG8Muhyhb6Fdom7q1S6mmqgCDFQxAvUDEp
	 t359pgPi3h3NCfK510mfW/IBhRx08hpIMwxEPnGFgQXBLZPMvckuGrrrex+FUPXPR7
	 Tbhn5U4XjktLOiILRHX+S7txWq5cJkVzJtx3Va3KYrHYJnVjuNOp5Isr6GwDnbAlBL
	 mfwXgXaPYQfvw==
Message-ID: <e28077e2-dec3-4e75-9aac-fecea3f260cd@kernel.org>
Date: Fri, 17 Jul 2026 11:00:25 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] ASoC: dt-bindings: qcom,lpass-va-csr: Add
 HeartBeat pulse clock
To: sarath.ganapathiraju@oss.qualcomm.com,
 Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 prasad.kumpatla@oss.qualcomm.com,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260717-master-v2-0-ae200627ad62@oss.qualcomm.com>
 <20260717-master-v2-1-ae200627ad62@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <20260717-master-v2-1-ae200627ad62@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/07/2026 21:51, Sarath Ganapathiraju via B4 Relay wrote:
> From: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
> 
> Add Qualcomm LPASS VA CSR rate generator node that exposes
> the lpass_heartbeat_pulse clock on hawi.
> 
> The HeartBeat Pulse (also known as RateGen Pulse) synchronizes the
> start of the DMAs and Codec Interfaces for the audio usecase
> and can serve as a periodic wakeup source for the DSP.
> 
> Signed-off-by: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
> ---
>  .../bindings/sound/qcom,lpass-va-csr.yaml          | 52 ++++++++++++++++++++++
>  1 file changed, 52 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-va-csr.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-va-csr.yaml
> new file mode 100644
> index 0000000000..131debb04f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/qcom,lpass-va-csr.yaml
> @@ -0,0 +1,52 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/qcom,lpass-va-csr.yaml#

I do not understand why a clock controller is part of sound. This makes
little sense and desription does not help me.

> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm LPASS VA CSR heartbeat pulse clock provider
> +
> +maintainers:
> +  - Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> +  - Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
> +
> +description:
> +  The LPASS VA CSR block contains the rate generator hardware which
> +  produces the heartbeatpulse consumed by the Bolero codec macros
> +  (rx, tx, wsa, va). It is modelled as a clock provider
> +  so consumers can reference it by name in their clocks list.

Drop last syntax, explain the hardware, not duplicate schema as text.

> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,hawi-lpass-va-csr
> +
> +  reg:
> +    maxItems: 1
> +    description: Must cover the full VA CSR block (base 0x7EE0000, size 0xE000).

Drop description, redundant. Why would not device MMIO address range
cover full block?

> +
> +  "#clock-cells":
> +    const: 0
> +    description:
> +      Single clock output "lpass_heartbeat_pulse". Consumers reference
> +      it by clock-name "heartbeatpulse" in their clocks list.

Drop description. Not even accurate. Consumers reference it however they
wish and it is not any business of the provider.

From where did you take such style?

> +
> +required:
> +  - compatible
> +  - reg
> +  - "#clock-cells"
> +
> +unevaluatedProperties: false

And this...

> +
> +examples:
> +  - |
> +    soc {
> +      #address-cells = <2>;
> +      #size-cells = <2>;
> +
> +      va-csr@7ee0000 {

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
If you cannot find a name matching your device, please check in kernel
sources for similar cases or you can grow the spec (via pull request to
DT spec repo).

> +        compatible = "qcom,hawi-lpass-va-csr";
> +        reg = <0x0 0x07ee0000 0x0 0xe000>;
> +        #clock-cells = <0>;
> +      };
> +    };
> 


Best regards,
Krzysztof
