Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB90352C4B;
	Wed, 11 Feb 2026 21:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770847115; cv=none; b=aCr3b+MaIWVC4ajRPf8K0jJsMyJ1Op1GHmkticvCRVtGZ43h/z6FnCEvR8p5/q0/IRFvmy7QZ9xZAthUSwa+qxl3Fy8rcQrVSVwCGyhNr4N6nh0gvOtmKB8xkzSnEIo8fslWyciG37pUe3ETpCFgTWdn8wmEWabNGYIEzUEzHvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770847115; c=relaxed/simple;
	bh=s8YcenxFPUZx94ScDyP1UZlME7u8vMHUHbwPEngalQ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GUElyRH6RGwCh0aA4Yx3YnMMwi9QytyILKBr1ugmZ1/Y/DW8dHWqWd+pkrFLPoVGBadZikhkrc8/GZWSwRzCkFRyGmZvpRTJhgwCilumoFUUinTtHeJ2wl5vj8A4+sEX7WJkNuVBJCO4+F9kV7qNKTlxpJztNToR1x2sz2yv3kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=U8nQNQ0r; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=1XGBw0m6; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="U8nQNQ0r";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="1XGBw0m6"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1770846955; bh=lt+/FoChRSnKmlpxWnUayXl
	hKg0gjWR+e8PToDOUu28=; b=U8nQNQ0rnsKXgsZAdi+yLQBm5NjGPnKumBVj+sDLbfx6Nu3OX4
	0+O8DONzDBf8Vb81ELZ6wl+ONPU0G2B9F4NvwWh1Oy2Dh8BrXxVOgrEyyjINhH9lZYSflycCHIr
	kbZ+D/ANMmg0tzOVPzff+dt9Tp2KkYRnyZDZe+QlwpYw6WGDuCTW0INNDjmik821Z1h4020GA9O
	Mps+5s7t/NTc2r7lVpSCqcIhwb87JZP4FfKpSUXpukx/CG++Wufej2mGsBR03uywrwaPZKppJaA
	artAblptWV8yRJrR6FVlb24dTDL7lmD/iYSTX8RaOcRwy939AG1i/uusHzyObvdTa0g==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1770846955; bh=lt+/FoChRSnKmlpxWnUayXl
	hKg0gjWR+e8PToDOUu28=; b=1XGBw0m6ZFIUCjwLu0CRIBqybES8voBO8t0hY/J4pxLNN94eMD
	6nhSTeRo0TJx19jr4l7AJtQ/VeoCNaXnYoAA==;
Message-ID: <f1b67c1e-cfc1-4d23-a24e-4dd342edd2e9@mainlining.org>
Date: Thu, 12 Feb 2026 00:55:54 +0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/10] ASoC: dt-bindings: qcom,sm8250: add compatible for
 sdm660-internal
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Richard Acayan <mailingradian@gmail.com>,
 Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Wesley Cheng <quic_wcheng@quicinc.com>, Johan Hovold <johan@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org
References: <20260211020302.2674-1-mailingradian@gmail.com>
 <20260211020302.2674-2-mailingradian@gmail.com>
 <yxrhmblavwkuhfrfgskujs7tz7cykojnqnl2mfrf365lhdem35@bgqwiaft67b3>
 <20260211-skilled-transparent-moth-fac10f@quoll>
Content-Language: ru-RU, en-US
From: Nickolay Goppen <setotau@mainlining.org>
In-Reply-To: <20260211-skilled-transparent-moth-fac10f@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


11.02.2026 09:51, Krzysztof Kozlowski wrote:
> On Wed, Feb 11, 2026 at 04:11:24AM +0200, Dmitry Baryshkov wrote:
>> On Tue, Feb 10, 2026 at 09:02:53PM -0500, Richard Acayan wrote:
>>> From: Nickolay Goppen <setotau@mainlining.org>
>>>
>>> Add compatibles for sdm660-internal based soundcards.
>> Why is it called "internal"?
> Yeah... I am pretty sure there is no such sound card. You cannot have
> sound card internal to the soc, because you need the external components
> like codecs.

It comes mainly from downstream driver name [1].

Downstream also mentions it as int_codec [2].

There's also an sdm660-external sndcard [3].

[1]: 
https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/LA.UM.8.2.r1-07500-sdm660.0/sound/soc/msm/sdm660-internal.c

[2]: 
https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/LA.UM.8.2.r1-07500-sdm660.0/arch/arm/boot/dts/qcom/msm-audio.dtsi#L835

[3]: 
https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/LA.UM.8.2.r1-07500-sdm660.0/sound/soc/msm/sdm660-external.c 

> Best regards,
> Krzysztof

-- 
Best regards,
Nickolay

