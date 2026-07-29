Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECFEA47DF8E;
	Wed, 29 Jul 2026 12:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785328225; cv=none; b=q0K/q9tYjM6JHsmnj7+oLW22spLltdw8ClETN2SEn/UA9x2aQBW5ZfAhhXRjOcGVhDufr05rOV55I87QgS8qkF3ToKf+ZZQclOSFk2+zhKttjVSnEYJ2gfYNHbXMDb8t5s1hd7jpkOixrBGbklPN+mcoOAEOfzLIdga4QSzEofc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785328225; c=relaxed/simple;
	bh=BKpJdyHIbaNklNi7LP68WaowNm54qQnwAd9muME9aOw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q6n/bZk7ORIz0h6N0Uu+gQbg+aSVm6AITSEkcO/UV8E0hxWAavu6hGYTnEkd9Azlj6aAsiS6VqGq/Q90c6gED6iU0qoKxo3DxAME6R5q6ZDb7yf5AMw70oqV8FQPtjIdy+6+jVya5/EdGJm99BJwhfij1xe2NoVIEyy/i1OLsbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IzCm6Mgg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IzCm6Mgg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 091561F000E9;
	Wed, 29 Jul 2026 12:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785328216;
	bh=c39gpDaipRq8GcdtmLLwaEV5JUvgZWUF8ZljIEE+fjc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=IzCm6MggWANh3e4bwrTh1MiJjh2H9arRBbjgLLuDcL/Mq+sg/KFP+nnrHFEuKdiaR
	 /2j8fHjyxeJgiIwOuA7KUWUmaw2WUKSJ877RlSNMYrmFVIo71DlI78QN18RlWBGrUh
	 GgSCMvBAxW/wW+MwdqlW5ahL4+DPo6/L8wX8THSigqrPqwocNzbXCmoHOuYZ+KCSnK
	 ggRa+42Whp1hURmBPlnAbOvREoh5sofdGKxNerHMyYtCxIUxQ8jfQrhKaIngdqkpJ7
	 wq5R4LCC27cg7nboC9uyfIEn78HwldYC2YeE9Z0nXneCSnZsvuC+KKEAyZmmK2OE4p
	 99H9i0Y3S+wLw==
Message-ID: <3c484a68-5db8-464f-992a-6c7584841a10@kernel.org>
Date: Wed, 29 Jul 2026 14:30:07 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 7/8] dt-bindings: sound: qcom: add Tambora WCD9378
 SDCA codec
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Maciej Strozek <mstrozek@opensource.cirrus.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Srinivas Kandagatla <srini@kernel.org>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org
References: <20260722234221.884765-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260722234221.884765-8-srinivas.kandagatla@oss.qualcomm.com>
 <219d44e2-28ed-4c54-bd00-66e687a0ba48@kernel.org>
 <d0891f90-b69b-4b27-ad58-94c342ad9a6a@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <d0891f90-b69b-4b27-ad58-94c342ad9a6a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29/07/2026 14:17, Srinivas Kandagatla wrote:
> On 7/29/26 12:40 PM, Krzysztof Kozlowski wrote:
>> On 23/07/2026 01:42, Srinivas Kandagatla wrote:
>>> Describe the WCD9378 SDCA peripheral node (compatible sdw20217011000)
>>> driven by the wcd9378-sdca codec driver for headphone playback, headset
>>> mic capture and jack detection via the SimpleJack SDCA function type.
>>>
>>> WCD9378 codec can be wired up in 2 different modes.
>>> "mobile mode" on phone/tablet SoCs is enumerated as tx and rx device,
>>> each of which has dedicated control and data lines.
>>> "compute mode" on compute platforms such as Glymur is enumerated as
>>> single standard MIPI SDCA class device.
>>>
>>> Both modes share same Device ID, compatible; qcom,compute-mode selects
>>> which driver path is taken.  Supplies, reset GPIO and mic-bias voltages
>>> live on the SoundWire slave node in compute mode and are forbidden in
>>> mobile mode (owned by the top-level codec parent there).
>>>
>>> Assisted-by: Claude:claude-opus-4-7
>>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>>> ---
>>>  .../bindings/sound/qcom,wcd9378-sdw.yaml      | 200 ++++++++++++++++++
>>>  1 file changed, 200 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yaml
>>> new file mode 100644
>>> index 000000000000..2ed4ad92958e
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yaml
>>> @@ -0,0 +1,200 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/sound/qcom,wcd9378-sdw.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Qualcomm SoundWire Slave devices on WCD9378
>>> +
>>> +maintainers:
>>> +  - Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>
>>> +  - Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>>> +
>>> +description: |
>>> +  The Qualcomm WCD9378 codec presents its SoundWire slave devices with
>>> +  class ID sdw20217011000 in both operating modes:
>>> +
>>> +    * mobile mode -- two slave instances sit on separate SoundWire
>>> +      masters carrying data only.  A separate top-level codec node
>>> +      owns the codec's supplies, mic-bias voltages and reset GPIO.
>>> +
>>> +    * SDCA / compute mode -- one aggregated slave sits on a multi-lane
>>> +      master and carries both control and data.  There is no separate
>>> +      top-level codec node, so the SoundWire slave node itself owns
>>> +      supplies, reset GPIO and mic-bias voltage configuration.  It is
>>> +      marked with qcom,compute-mode.
>>> +
>>> +  Codec drivers that match sdw20217011000 use qcom,compute-mode to
>>> +  decide which mode to serve; the presence or absence of this property
>>> +  also gates whether the supply and mic-bias properties on this node
>>> +  are required or forbidden.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: sdw20217011000
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  qcom,compute-mode:
>>> +    description: |
>>> +      Marks this SoundWire slave as the single aggregated slave that
>>> +      implements the codec in SDCA / compute mode.  Only present when
>>> +      the codec has no separate top-level codec parent; in that case
>>> +      this slave node also owns the codec's supplies, reset GPIO and
>>> +      mic-bias voltage configuration.  Absent in mobile mode.
>>
>> I doubt there is really "compute" or "mobile" mode, so you just wrote to
>> match use case, but that does not match hardware.
>>
> This is hardware fuse setting, its not just usecase based but it changes
> complete wcd9378 hardware topology, in mobile mode we have 2 soundwire
> devices representing tx and rx side of wcd9378 however in compute mode
> it only has one soundwire device dealing with both tx and rx. compute
> mode is sdca class compliant device.
> 
> 
>> I think there should be no separate top-level codec parent in the first
>> place, thus this property is not needed. You always list here all resources.
> There is no top level aggregated device when the codec is fused in
> compute mode.

There should not be a top-level in either case. This was always Linux
driver limitation.

Best regards,
Krzysztof
