Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com [95.215.58.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFCCA332917
	for <linux-sound@vger.kernel.org>; Fri, 24 Apr 2026 19:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777057694; cv=none; b=td0Psbt7Fd4fTlyEYupLjU+eXoDbR6uZT80KEermTzHb03vdVmYXD1LLSxqFAsHR7JMe+SpmMfTHM3vP7aOtK4KKDmGROvve9mMMzLjLFBzympHEmI805Cd/3ojXQq5l57N0ZysdLycBM3wnHEmhhgqW+2akLHJvwzH8CUmj1OY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777057694; c=relaxed/simple;
	bh=8A6x/gwvigokDWQHjH1XTTPUpJb98Mhg/r0z4VARm4Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jGnccckELBeeo1Dkwxr/Tm1nHBg6xJK7If4HXHpvwDYVIBUkZSnRyjNeF1LKFAwpAzd+w8vaMDBAupxVI1GCce0qShjBwAhCg0PGyXQc112Xn98tIjQ9Oh7KOab95XLsp1T5N+wZuildC5kihDC9N4d+NBYlfr1oGWDIm3hx9W0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=nnt1cmrY; arc=none smtp.client-ip=95.215.58.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="nnt1cmrY"
Message-ID: <c3b833d8-2e8a-4418-9043-6cd04d9901e1@packett.cool>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1777057689;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/Q7AY28qlHBjgzfWhhXsEAsuWHcEKhugX23O64AEQqA=;
	b=nnt1cmrYKgqViG1liVRq6/0f4EejzGYfXen3cebO9qtTfbXXcCQm7vSo3J/ezkwa1y1Huj
	yuEhv5AQt9otPdCsyU5Si1H+ksvzqUjbHms01qDdVFCGwSYpnMkJQ5N8epX1tab+xAO4/G
	vz0B/vHMxyRIHTeAxHIvhXQD/5e2r3gy/cVkFvTUbSqwfMeUKqL4bIgfYr1vFyVfTWGLb1
	FOwQHBlzAxLRyq4Pho8rDP6u2W1W42Yf6R5Op7z9JzR/sM2fZLT3XWXfKQTxjk4rJ1uNZz
	tXuapn2aXf9bId8MCU6aT1JfKrUHgu0GpKyNf/R0irr3cfRjvi4KIR+j5BMtXg==
Date: Fri, 24 Apr 2026 16:07:56 -0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 12/12] arm64: dts: qcom: qcs6490-radxa-dragon-q6a: add
 LPASS CPU audio variant
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Xilin Wu <sophon@radxa.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Judy Hsiao <judyhsiao@chromium.org>,
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-sound@vger.kernel.org
References: <20260407-dragon-q6a-feat-fixes-v1-0-14aca49dde3d@radxa.com>
 <20260407-dragon-q6a-feat-fixes-v1-12-14aca49dde3d@radxa.com>
 <29a7dd01-7513-4fe5-8546-d57757b3b2d0@oss.qualcomm.com>
 <88B7BBB9133FBAD1+ccb025ea-4999-4701-bb18-c57a42cabe2f@radxa.com>
 <2f830f17-4bc5-4ebd-a66b-8068a14a871a@oss.qualcomm.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Val Packett <val@packett.cool>
In-Reply-To: <2f830f17-4bc5-4ebd-a66b-8068a14a871a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


On 4/24/26 9:28 AM, Konrad Dybcio wrote:
> On 4/8/26 11:47 AM, Xilin Wu wrote:
>> On 4/8/2026 5:06 PM, Konrad Dybcio wrote:
>>> On 4/7/26 5:20 PM, Xilin Wu wrote:
>>>> Add a qcs6490-radxa-dragon-q6a-lpass-cpu.dts variant for debugging and
>>>> bring-up of the host-controlled LPASS audio path on the Radxa Dragon
>>>> Q6A.
>>>>
>>>> This variant enables the LPASS blocks and codec macros needed by the
>>>> lpass-cpu driver, wires WCD9380 playback/capture and DisplayPort audio
>>>> to the LPASS CDC DMA and DP interfaces, and disables remoteproc_adsp so
>>>> that the audio hardware is owned directly by Linux.
>>>>
>>>> This DTB is an optional configuration for systems booted with the kernel
>>>> running at EL2, where direct CPU access to the LPASS hardware is
>>>> available. It is useful for users who need low-latency and fully
>>>> controllable audio.
>>> I believe on Chrome platforms it was done this way because at some point
>>> it was determined that they would specifically like not to use the DSP.
>>>
>>> I think this is more of a hack than anything else.. but at the end of the
>>> commit message you mention low latency - is the impact actually measurable?
>>>
>> Some of our users also specifically prefer not to use the DSP [1] :)
>>
>> Based on their testing, the AudioReach/ADSP path imposes a minimum scheduling interval of 10 ms, which is much higher than the 0.67 ms they can get on a Raspberry Pi 5 with direct I2S/DMA.
> We passed on this feedback.
>
>> Since the lpass-cpu setup works properly, I would not consider this a hack.
> Well yeah it works, but I was really hoping it would be made
> unnecessary and available for removal sooner or later..
>
> But since there's a genuine usecase, perhaps not.

lpass-cpu is also great from a "I don't want my pure libre operating 
system to touch dirty proprietary binary blobs" perspective, but you can 
definitely argue that that's not a genuine use case :)

~val

