Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12BF7314D05;
	Thu, 30 Jul 2026 07:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785395396; cv=none; b=T0/dcra4ihZmAXl2DJ3cGOIiravLJOpbcoIQzGUxwHszAE7GhstGIfEqBSOPCdtwYeDmFdVQtCjp1fMinv3uSEaDDhbAc4zWLvjqPRn7yjw/8TUSQXQmCvcMFLIvlSG9OhZRowbgxSw2fgMrJ0/8d0i7T5SviIF+2XS9T0jZW6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785395396; c=relaxed/simple;
	bh=DwHii/TCjfACQ2hcLKmC/pMUgoDRvVj1IsepB7dsXeo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MZKe0w5tnUHQXkaZ6w0J9I1HOmcfHWF0Ef47UpmzhaqVu/GfLeeufjps07bZ5yGbqu8B1VLWIN0053poV1BkG05zGqE/l/VE7+j3L5tjhbdd0hNHB01DHHPv4BIn0wVx2GrkDuKDilwq5FuI1fdqea+l4O7RMuvgvaXQTvVr9y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L6coiKBZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L6coiKBZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 536151F000E9;
	Thu, 30 Jul 2026 07:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785395392;
	bh=TdBa5gJdt4RW3EXFtB3u3DLjwb7jjzjVJg81cZzqSys=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=L6coiKBZWnXLbige9UdRTTDRZROT7jhlJUktTVbJkepB7UHeM+8BkEVCjYrvgAlRu
	 beORMfif4At+e9eZlQGQMWzjSQDPlpDiPvpzyXwFUvc5LA6PU9MW0crtoYdx14xBap
	 1WZSwt7avxG7Sm9C5nx5H9P7BNIBdxdBdH1Qh5EgkqhFUxEKHfaR+kvfRSHcjOWcIs
	 liJw7PFKczt2rk6M60T2PrkqBj+SOA0D8cp982SSgdVtqSk5cRDsA/tUkx3Oj7CRRB
	 OhK1SD/SSiXQaiBtw3+CCoO8cudUUoUW2FWVgENleaK9xB/nsKSM9NxA4lGWVqLvwy
	 0/wkNFOfj8Dag==
Date: Thu, 30 Jul 2026 09:09:48 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>
Cc: Mark Brown <broonie@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Julian Braha <julianbraha@gmail.com>, 
	Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Luca Weiss <luca.weiss@fairphone.com>, Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>, 
	Ravi Hothi <ravi.hothi@oss.qualcomm.com>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] ASoC: dt-bindings: add the Qualcomm WCD9378 audio
 codec
Message-ID: <20260730-impartial-angelic-harrier-ab9192@quoll>
References: <20260729000649.263426-1-jorijnvdgraaf@catcrafts.net>
 <20260729000649.263426-2-jorijnvdgraaf@catcrafts.net>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260729000649.263426-2-jorijnvdgraaf@catcrafts.net>

On Wed, Jul 29, 2026 at 02:06:48AM +0200, Jorijn van der Graaf wrote:
> The Qualcomm WCD9378 is a standalone audio codec IC found on SM7635
> boards such as the Fairphone 6. Like the WCD937x/938x/939x codecs it
> presents RX and TX SoundWire slave devices controlled by a common
> parent node, so the parent binding references qcom,wcd93xx-common.yaml.
> The WCD9378 has three ADCs and three mic bias supplies and thus no
> qcom,micbias4-microvolt, which the common schema required: move that
> requirement into the current users, keeping their status quo, and
> reject the property here.
> 
> The slave devices enumerate with manufacturer ID 0x0217 and part ID
> 0x0110, hence the sdw20217011000 compatible. Compute platforms wire
> the same chip as a single aggregated slave in SDCA mode, which owns
> the codec resources itself and has no parent node. The slave binding
> covers both presentations: qcom,compute-mode marks the aggregated
> slave and gates the properties for the resources it owns,
> qcom,control-device marks the slave owning the control register space
> (the TX slave in mobile mode), and qcom,port-mapping carries the port
> map of either kind of slave.
> 
> The -codec suffix in the parent compatible follows the existing
> qcom,wcd93xx/pm4125 family compatibles and matches the compatible
> shipped by production devicetrees for this chip.
> 
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>
> ---
> v2:
> - squashed v1's separate qcom,wcd93xx-common patch into this one, as
>   Krzysztof asked; no changes to that part.
> - one slave binding for both chip presentations, as agreed in the
>   review of Srinivas's SDCA class series (link in the cover letter);
>   Srinivas added as binding maintainer. The aggregated SDCA-mode slave
>   is marked qcom,compute-mode, which gates the properties for the
>   resources it owns (supplies, reset GPIO, mic-bias voltages,
>   #sound-dai-cells).
> - the split qcom,{tx,rx}-port-mapping properties are replaced by a
>   single qcom,port-mapping; with one name for both slaves, the new
>   qcom,control-device flag marks the slave that owns the control
>   register space. The mapping stays optional and loses the per-item
>   enum, following qcom,wcd938x-sdw.yaml.
> - qcom,{tx,rx}-channel-mapping dropped, answering Srinivas's v1
>   question: the slave-side map is fixed in the driver and no board
>   needs to remap the master side; they can return with a board that
>   does.
> - the codec binding's example drops the two slave-node examples
>   duplicated from qcom,wcd9378-sdw.yaml, as Rob asked.
> - qcom,port-mapping length pinned per mode (5 mobile / 8 SDCA)
>   through the existing if/then block.
> 
>  .../bindings/sound/qcom,wcd9378-codec.yaml    |  54 ++++++
>  .../bindings/sound/qcom,wcd9378-sdw.yaml      | 182 ++++++++++++++++++
>  .../bindings/sound/qcom,wcd937x.yaml          |   1 +
>  .../bindings/sound/qcom,wcd938x.yaml          |   1 +
>  .../bindings/sound/qcom,wcd939x.yaml          |   1 +
>  .../bindings/sound/qcom,wcd93xx-common.yaml   |   1 -
>  6 files changed, 239 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd9378-codec.yaml
>  create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd9378-codec.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd9378-codec.yaml
> new file mode 100644
> index 000000000000..0b9d3394f77e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/qcom,wcd9378-codec.yaml
> @@ -0,0 +1,54 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/qcom,wcd9378-codec.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm WCD9378 Audio Codec
> +
> +maintainers:
> +  - Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>
> +
> +description:
> +  The Qualcomm WCD9378 is a standalone Hi-Fi audio codec IC with three
> +  ADCs, three mic bias supplies, headphone/earpiece/line outputs and
> +  MBHC. This node describes the mobile presentation, where the codec
> +  appears as two SoundWire slaves on separate masters and this node owns
> +  the resources they share; the control registers live in the SDCA control
> +  address space reached through the TX slave. In SDCA mode the codec is a
> +  single aggregated slave with no node of its own, see
> +  qcom,wcd9378-sdw.yaml.
> +
> +allOf:
> +  - $ref: dai-common.yaml#
> +  - $ref: qcom,wcd93xx-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: qcom,wcd9378-codec
> +
> +  qcom,micbias4-microvolt: false
> +
> +required:
> +  - compatible
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    audio-codec {
> +        compatible = "qcom,wcd9378-codec";
> +        reset-gpios = <&tlmm 162 GPIO_ACTIVE_LOW>;
> +        vdd-buck-supply = <&vreg_l8b>;
> +        vdd-rxtx-supply = <&vreg_l7b>;
> +        vdd-io-supply = <&vreg_l7b>;
> +        vdd-mic-bias-supply = <&vreg_bob>;
> +        qcom,micbias1-microvolt = <1800000>;
> +        qcom,micbias2-microvolt = <1800000>;
> +        qcom,micbias3-microvolt = <1800000>;
> +        qcom,rx-device = <&wcd9378_rx>;
> +        qcom,tx-device = <&wcd9378_tx>;
> +        #sound-dai-cells = <1>;
> +    };

As pointed out by RFC from Srini, this binding/node is not correct. It
is a fake node to solve (real) power sequencing issues, but Srini's SDCA
patchset points that this should be part of TX.

Bindings should be complete. It is fine to have them incomplete of
missing features and extend later, but it is not fine to have them with
incorrect and incompatible solution.

Therefore this needs to be sorted out for both patchset - this and SDCA
version of WCD9378 codec.

Best regards,
Krzysztof

