Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B7993D8103;
	Wed, 26 Aug 2026 10:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787738514; cv=none; b=BpkifBG5spS7LYbuQ1z5Eow1V/hOzJ1eKQvfcCHM7WmApEIypu1lU735DHEazIf2L74Kq5nQQAPjk0wg4TnWyddH2G7QeH7c7f19sHWdcwgT0q+UxhoXuxgZrjwMA8N8HqfN03Zpc0WBM7nj7tyaV5mHOkvWYdrxArdorbTg6B8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787738514; c=relaxed/simple;
	bh=YR6MskzxjgqfRTUiV6Gj70WdytoaPLBU9dfv2xvB3Cg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bx/Ma2erQOJMu9j9reyKk4dFTI5iw3eYVZyl9aBDD8A+UQaqdnfYe5HuZysw+dFwC0n1O+fjyaFQXNC8pzy2zueqRN8oHEA+ovrBUMFwDn5sWHvzwldkskiS6tN6L1gCe0fayEZt3P0KYKbXHvDMjrMP2axILBatXiyk0UAqOwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WtuhIlOd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WtuhIlOd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76EA41F00A3F;
	Wed, 26 Aug 2026 10:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787738512;
	bh=5ZZMWMHHASb2W63/qpvlrKSJ5yWZUa+XpnSBn0uVQ9M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=WtuhIlOdtkvnPnju92QShbhFoJv8dBQLTWYhYuVMGB9UrHxcIu75QfF4y1//HNZ61
	 i6idehWjCli7o7Xbw6T7arDAuOW2TSn+ZlZsjp+BFek/e+yLMA5gJNfoORQIJV7CSk
	 Le79CYcpCd2jNTXOx6KT/TkQRL1EMNwsZR5ui+pW614bfpoWHwrBYWRADsrEGxfT6O
	 hy77QOMArmGpS83codX7svmxGamskSWdLftShKH7CS7ZW3RUB7zkIvXOoBrs0waMH1
	 pRYJnyaRXRyl6yRePC3+SjJYeJ+msCxAaqVdW2ye1k1A/qwHJkEBHIkuFBA5C/TntC
	 w5cTFd5E4+MIA==
Message-ID: <137d4a06-4542-488d-91e2-d338ffb9d47d@kernel.org>
Date: Wed, 26 Aug 2026 11:01:47 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/9] ASoC: dt-bindings: qcom,qaif-cpu: Add binding
To: Harendra Gautam <harendra.gautam@oss.qualcomm.com>,
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
 Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
 Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>
References: <20260824063627.3595610-1-harendra.gautam@oss.qualcomm.com>
 <20260824063627.3595610-2-harendra.gautam@oss.qualcomm.com>
 <bf6e42b4-ff21-4b6c-a7d5-024e5b9a7da4@oss.qualcomm.com>
 <CAC-tS8CaVN8YgkUHJVvLcU1xWB3V5dOgS07CHVOBUnPtMjNxTg@mail.gmail.com>
 <08b6fd88-84b3-4b3f-a8c5-dd6bfd39403f@oss.qualcomm.com>
 <CAC-tS8CtA+wRuucDskRXSc=AHgNdbuq+khj85pFmCG8dGS3Njw@mail.gmail.com>
Content-Language: en-US
From: Srinivas Kandagatla <srini@kernel.org>
In-Reply-To: <CAC-tS8CtA+wRuucDskRXSc=AHgNdbuq+khj85pFmCG8dGS3Njw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 8/26/26 10:55 AM, Harendra Gautam wrote:
> On Wed, Aug 26, 2026 at 3:13 PM Srinivas Kandagatla
> <srinivas.kandagatla@oss.qualcomm.com> wrote:
>>
>>
>>
>> On 8/26/26 10:39 AM, Harendra Gautam wrote:
>>>>> + * CIF (Codec Interface) VA TX DAI IDs -- capture from voice activity codec.
>>>>> + * WRDMA channels collect audio from the VA codec and write it to memory.
>>>>> + */
>>>>> +#define QAIF_CDC_DMA_VA_TX0  246
>>>>> +#define QAIF_CDC_DMA_VA_TX1  247
>>>>> +#define QAIF_CDC_DMA_VA_TX2  248
>>>>> +#define QAIF_CDC_DMA_VA_TX3  249
>>>>> +#define QAIF_CDC_DMA_VA_TX4  250
>>>>> +#define QAIF_CDC_DMA_VA_TX5  251
>>>>> +#define QAIF_CDC_DMA_VA_TX6  252
>>>>> +#define QAIF_CDC_DMA_VA_TX7  253
>>>>> +#define QAIF_CDC_DMA_VA_TX8  254
>>>>> +#define QAIF_CDC_DMA_VA_TX9  255
>>>>> +
>>>> These DAI IDs exceed the LPASS_MAX_PORT limit, which will cause sound
>>>> card registration to fail.
>>>>
>>>> Check sound/soc/qcom/common.c, as the current indices (246-255) are
>>>> beyond the supported LPASS port range.
>>>>
>>>> Best Regards,
>>>> Rafi.
>>> Thanks for pointing this out. We can either add the range check for
>>> min/max QAIF DAI IDs in qcom/common.c or introduce a common helper in
>>> qcom/common.h to validate the supported DAI IDs across Qualcomm
>>> platforms.
>>
>> You should add these ids to
>> include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h instead to avoid
>> conflicts with common code.
>>
>> --srini
> Thanks for the suggestion. qcom,q6dsp-lpass-ports.h is specific to Q6
> DSP/AFE virtual port IDs. Since QAIF is a direct MMIO driver with no
> Q6 DSP involvement, would adding QAIF IDs there not be misleading?

These are IDs that will be reused across both dsp and non-dsp solution.
So it makes more sense to keep it in one single place to allow the
hardware description (DT) unchanged across different software solutions.


> would it be better to update the range check in common.c/common.h to
> accommodate both LPASS and QAIF DAI ID ranges instead?
No, that does not make sense because these numbering might conflicting
with other ports in future.

--srini


THat
> -Harendra
>>> -Harendra
>>

