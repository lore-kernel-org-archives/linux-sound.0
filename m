Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B687224B04
	for <linux-sound@vger.kernel.org>; Wed, 29 Apr 2026 03:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777431836; cv=none; b=Wi569RwG4J9yElAqhQ/Fbt4DfvWOWm0BQ6U633DAHWvMCmsDYv1Ve0ornUQHIH8B2Hjopu+9I7N8tGcFmT5YIBLpScbIZmUC/ElIQpi+mQtv9Eg3HXWifGQ9svtfKblgENqlVSTiH3gelR9qYgj+2/1QzEu0Bj0uEhaWmCtT3FE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777431836; c=relaxed/simple;
	bh=w71dxo57Zrri0BmXfwEUcuG0+jv+nEEnhsJ7Ls9Yk0k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MwJO5eKigYfQGsSnkvVJZefvUg1TIB8Tvyw0xOgODo0sWKzA+zJwfPw7/qDv5buSRXzde1vRHecdBFkPAlWEztip564C6O2dj6s6oqDGCKPV0vsSW1btym9mYCRydaS1A50HxFOKleNmBWKu59jqk4C3kHnurMpCEgYgPWuknEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IWLRNdFC; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IWLRNdFC"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2b299b3c739so56128845ad.3
        for <linux-sound@vger.kernel.org>; Tue, 28 Apr 2026 20:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777431834; x=1778036634; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8iaJ/54PXSumlBHm/F5PZT9zPYaknG4mMWl6w5wLw/w=;
        b=IWLRNdFCSyjvX+qgdQS7n9AohEgcDhLtB8ff3jwFE0Njxbs8gnpgSLBga3jcK5h1AH
         NzS34h5sS/bV+tdnzD5aW0E7SQ7homcoOF06923EeT9XVysOzOUvxqGYRaK2woL4M+9m
         y2wDei/+he1VwI++2mLqQBMWlUy4X2FYRXBx6ICurQ58Xdwek4tIUqZ7/6wsUJTCaPrA
         xubVIBuUPMdYYvAFsqWbQTdCOvw1tjg7p8kfuSw9uNlHJ+V3LBqCdl1hvFTp11ksYMxc
         CHTIesWkNEsjMg0X99voU7cY61IiKH1hZd8GzTSg7OxUd3EC2NEJsEl6nfQ3IQu+tJDz
         2M1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777431834; x=1778036634;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8iaJ/54PXSumlBHm/F5PZT9zPYaknG4mMWl6w5wLw/w=;
        b=fctd88oShG6qBFnOg9lvGYN6fXapvj3H72d3BbFCzGN696BZgAqirFvTMJRwkKAl6l
         DYBY/X+yGOq9jKufTdVp8o0MoqyXZcp8olNIp5UxZVRruIcVOcyhSFgJs3ItgBULTIVr
         y+kLSNiUyXNsMLj4+nLXpgqfHEPly4dXaTN5NNhGbsZ1tvQtFOJHPYtE4pixhwGU4Va+
         Ga15aiJpRun08AH0EIPZ3dJDHOsQKOGcMvLXRxRVJF2yf1hid8iVPWsy/zcFq5VwuCO+
         N7rW5mOyRID6HZUS/G45Yc0OONA7DO3SITfN6eZAndUHiHMhDlyW+r0gp/hr2V5VpN51
         DUQw==
X-Forwarded-Encrypted: i=1; AFNElJ+gFBAG0tEL6ItLcKzBJ8EjIO+m2WdsORPKOccOBzraIoXLTM4MsZCXej9qNGQjlkQy/PooyCC8tZ1DuA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzBEC/dYAq3Q7TwJMeW8aRBDCxGBnf/7OdFywktna2Pc2HO6q4Z
	LOtYf94X7o0oZWZ1YPHFrl5d4aAGkd2mhWoc/vlY3zP9ZI3MDqr1Px37
X-Gm-Gg: AeBDievKI4OT8z46pz0mmDJ4ugU2pfEPXo2h5Fhl8PkiYXEXj046Er2Io6xEqvCzbfD
	WQGdhnXh0x7qG2L2X9OWtLuCWdNfApjvX6SVNoKI8QzsEyvlI6RVqjBxFGy3luu4wKqp9685hsY
	5jYDje2wBH7Dr/dJHNd4K+cf7aoJOCuXvzOeNM0yvuwYZfn/yS0yBZhbcLyaJfd2twdy44r0HS2
	F1+td26M/VAU3eIDKBXB/ketynarF34Gc+kLwllHpwW1MpBFiMUsPcSc414wP6TBbbFoW+mDlKC
	g3uKQj2pacorOHul1chzILkmi1SbVpEj8ad69LTbeWMTuTePdOi4rBFD9wXPGWSP6cf5Q1wjAX4
	Rn4bjrVPek6LZ8l/U7ojDUTVF/Lvfnd1eNcwZjDPIdRtooC7C5GCfPLD18fnTe/MAcDgHbre2ey
	XOrB66hzo3Zq/tjUpc2I+/Wlm3FkMCEBmrhTzsW+e0dP+bhidFIbMJO8442R85ZtnfIuIw
X-Received: by 2002:a17:903:2b0d:b0:2b0:5ec1:97c1 with SMTP id d9443c01a7336-2b97c3d6b08mr55442745ad.7.1777431833794;
        Tue, 28 Apr 2026 20:03:53 -0700 (PDT)
Received: from [172.20.10.2] (42-79-67-210.emome-ip.hinet.net. [42.79.67.210])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b98893f132sm5877035ad.49.2026.04.28.20.03.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 20:03:53 -0700 (PDT)
Message-ID: <909885cd-286e-3fbe-9e06-26334c1bb96e@gmail.com>
Date: Wed, 29 Apr 2026 11:03:48 +0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: nuvoton,nau8360: Add bindings for
 NAU83G60
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>, Neo Chang <YLCHANG2@nuvoton.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 robh@kernel.org, krzk+dt@kernel.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, alsa-devel@alsa-project.org, kchsu0@nuvoton.com,
 sjlin0@nuvoton.com
References: <20260424033953.280520-1-YLCHANG2@nuvoton.com>
 <20260424033953.280520-2-YLCHANG2@nuvoton.com>
 <20260425-independent-puzzling-pigeon-a3fd84@quoll>
From: YLCHANG2 <neo.chang70@gmail.com>
In-Reply-To: <20260425-independent-puzzling-pigeon-a3fd84@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 4/25/26 18:13, Krzysztof Kozlowski wrote:
> On Fri, Apr 24, 2026 at 11:39:52AM +0800, Neo Chang wrote:
>> Add device tree bindings documentation for the Nuvoton NAU83G60
>> audio amplifier.
>>
>> Signed-off-by: Neo Chang <YLCHANG2@nuvoton.com>
> A nit, subject: drop second/last, redundant "bindings for". The
> "dt-bindings" prefix is already stating that these are bindings.
> See also:
> https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetree/bindings/submitting-patches.rst#L18
Got it. I will fix the commit subject in v2.
>
>> ---
>>   .../bindings/sound/nuvoton,nau8360.yaml       | 115 ++++++++++++++++++
>>   1 file changed, 115 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/sound/nuvoton,nau8360.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/sound/nuvoton,nau8360.yaml b/Documentation/devicetree/bindings/sound/nuvoton,nau8360.yaml
>> new file mode 100644
>> index 000000000000..29b10155c4f9
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/sound/nuvoton,nau8360.yaml
>> @@ -0,0 +1,115 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/sound/nuvoton,nau8360.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Nuvoton NAU83G60 Stereo Class-D Amplifier with DSP
>> +
>> +description: |
>> +  Stereo Class-D Amplifier with DSP and I/V-sense driver.
> If "driver" as in "Linux driver" then please drop the word.
Got it. I will drop the word 'driver' in v2.
>
>> +  This device supports I2C.
>> +
>> +maintainers:
>> +  - Neo Chang <YLCHANG2@nuvoton.com>
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - nuvoton,nau8360
>> +
>> +  reg:
>> +    maxItems: 1
>> +    description: |
>> +      The I2C address of the device. The address is determined by the external
>> +      hardware configuration of GPIO1 and GPIO2 pins:
>> +       - 0x1a (GPIO2=Low, GPIO1=Low)
>> +       - 0x1b (GPIO2=Low, GPIO1=High)
>> +       - 0x4a (GPIO2=High, GPIO1=Low)
>> +       - 0x4b (GPIO2=High, GPIO1=High)
>> +
>> +  "#sound-dai-cells":
>> +    const: 0
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  clock-names:
>> +    const: mclk
>> +
>> +  nuvoton,dsp-bypass:
>> +    type: boolean
>> +    description: |
> Do not need '|' unless you need to preserve formatting.
Got it. I will drop the '|' in v2."
>
>> +      Forcibly disable/bypass DSP path.
> Why would that be hard-coded for given board?
Our intention was to use this property only to set the initial DSP 
enable/disable state during probe,
while still exposing an ALSA kcontrol so userspace can change it 
dynamically later.
>
>> +
>> +  nuvoton,low-latency:
>> +    type: boolean
>> +    description: |
>> +      Enable low latency mode.
>> +      Please note the feature helps sensing performance
>> +      but worsens power consumption.
> I could imagine that low-latency needed for certain use-cases, like
> realtime audio, thus not really board-level DT configuration, but
> runtime.
I will drop these properties from the v2 DT bindings.
>
>> +
>> +  nuvoton,anc-enable:
>> +    type: boolean
>> +    description: |
>> +      Enable ANC (Active Noise Cancellation) feature.
> This as well.
I will drop these properties from the v2 DT bindings and expose them as 
ALSA kcontrols instead.
>
>> +      NAU83G60 provides configurable low latency ANC path to Advanced DSP through TDM-RX.
>> +      To reduce latency, the ANC path only supports 48 kHz sample rates.
>> +
>> +  nuvoton,aec-enable:
>> +    type: boolean
>> +    description: |
>> +      Enable AEC (Acoustic Echo Cancellation) feature.
> As well.
I will drop these properties from the v2 DT bindings and expose them as 
ALSA kcontrols instead.
>
>> +      NAU83G60 provides Advanced DSP processed audio data as AEC reference through TDM-TX.
>> +      The AEC path only supports 48 kHz sample rates.
>> +
>> +  nuvoton,pbtl-enable:
>> +    type: boolean
>> +    description: |
>> +      NAU83G60 supports PBTL mode for mono output.
>> +
>> +  nuvoton,vbat-microvolt:
>> +    minimum: 8000000 # 8V
>> +    maximum: 24000000 # 24V
>> +    description: |
>> +      VBAT supply voltage in microvolts.
> This device does not have any supply, so how could you set its voltage?
> Plus, regulator bindings define it, not per-device propeties. Drop the property.
>
> Also, add missing supply.
Sorry, I misunderstood the standard regulator framework.
I will drop the nuvoton,vbat-microvolt custom property in v2.
Instead, I will add the standard vbat-supply property to the binding.
>
>> +      This is the analog power supply, provided by an external power source
>> +      or battery, and must be between 8V and 24V.
>> +
>> +  nuvoton,tdm-channel-length:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    enum: [16, 24, 32]
>> +    description: |
>> +      Assign TDM channel length.
>> +      The length must be 16, 24, or 32.
>> +
>> +  nuvoton,dsp-fw-names:
>> +    $ref: /schemas/types.yaml#/definitions/string-array
>> +    minItems: 2
>> +    maxItems: 2
>> +    description: |
>> +      Assign firmware filenames for left and right DSP cores.
> Please use standard properties. This is the second one you re-implement.
> If there is one single thing which upstream kernel hates is the
> reimplementation of standard things by each vendor.
>
> firmware-name:
> (and see other examples how to write it - items: with descriptions)
Got it. I will use the standard firmware-name and dai-tdm-slot-width 
property instead and drop the vendor-specific one.
>
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +
>> +allOf:
>> +  - $ref: dai-common.yaml#
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    i2c {
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        codec@1a {
>> +            #sound-dai-cells = <0>;
>> +            compatible = "nuvoton,nau8360";
>> +            reg = <0x1a>;
>> +            nuvoton,dsp-bypass;
>> +            nuvoton,vbat-microvolt = <12000000>;
> Add the rest of properties o make this complete.
Got it. I will complete the rest in v2
>
> Best regards,
> Krzysztof
>
