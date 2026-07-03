Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A792F12DA
	for <linux-sound@vger.kernel.org>; Fri,  3 Jul 2026 03:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783048920; cv=none; b=DPxf9qkjAcTOrJc90ZLxeKhPPnzO+6SGZjC5mp+adoTzRgx5vlDLaMp2mB59Aq4B/F+SoLcgr3YWuhamPR9BGSWWuo3JKp1j2oGpeqj9Gj8ZEJln/JcgreNavtOq3GZ3bakcaYANB9+r+eS6eEGevvtcCF9mKxfDSKAfW5N1A8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783048920; c=relaxed/simple;
	bh=W1AVsX43qvUOKE59T/ObWlrtbrXrPJZCWiEaPeSDmIE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hGu4Jg/UvlsbgDFzLbsXcJcMhlE6a310ip9F7z5sWH2S0JPhy5ljjlB9ZFXFY5SRFUwA8LGz/DCsryMzSZZWwby6LXDmg3TMvSZLzhbqGP/sGfghkua32uZwujIYYIVtzGj9mB1bvmzvIr48Z2vBKw3KHVGqHeeBd6yoT8jBDU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VmK9tduy; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VmK9tduy"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2c7c61b5292so1274095ad.0
        for <linux-sound@vger.kernel.org>; Thu, 02 Jul 2026 20:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783048917; x=1783653717; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UQK9xIpBvupQsHfdWBTAzhnaT8sAOZBQ0zZR3EU2+EQ=;
        b=VmK9tduyjQePkiQagrW7e7cUnDhCGAQDCnaS40xXrFnErWISVl/8k0OGdKn/QZUG1y
         IQt6fCnEAfOKaPXvLpLbBrY8Z70d0F0GPpUx5rX9PhnOopL0cB072X0TFGBl+lQjPp9q
         ML8odp4IFOBics1yWzIXhZJBQQeVe7FB9oiMuQ9ZYQHApk3G3hEenYUC7IX9jZGtmM27
         Dd1vfh7dL+i3RKtRgByZOaSRHCDnDqOOJlQGzNY9jOVSC+cPG6bV04yd4wz0jz6f/kn7
         w6/Vf8tuV6Ja/Ib/vwfH49pFcyrc7w4aWN4JMGQbsrtE1Z3eRqKlAM/zgZV6tZbFzWUl
         krqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783048917; x=1783653717;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UQK9xIpBvupQsHfdWBTAzhnaT8sAOZBQ0zZR3EU2+EQ=;
        b=WvBpI3rtNmsOa/XBhTPfsxASS7FBMnBO/hwK7jjReGaHyTHFwENheDZq1RVpqjXosW
         Dkmub+87pKPHUSWE1pqFhSLxYYjDLC/doYrKbkC5c2omrCMcCN+3oUfi+jIatWDKMhzo
         SlZhqpsuPylwmrVs/YVL/5rnLhWco6MHyw+I7W8ZTXtrIKG/8OcthpWROtBvNMn0sXT3
         6R4uhkHJq+Ee/dRxzThuHLT38Hw/gubmmxsNaIFLNJ2ks59QzCbP0v/2v6uBQebe+U04
         unp8icQgjgWlheSEw25uwLl0st8U1OLIpbY2ZNXXpHSZ8/7tXXKDpqSAs1am/PA/DSmf
         vNXw==
X-Forwarded-Encrypted: i=1; AHgh+RoIWisGg8UbJVW2FCN9zNgE5Gbj/qvgUFfB51YRGewy/HQE5L61tGHoFGSykpAjATpIGFakGu+X0j9aMQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxD2N67T+ZGvcPlvgKcZwPFNjTxR+bqo76dICIWpC92jpWNB3eM
	+bWcCHiybF1nmzQmAyZBRe3I4Qm4tK99Q/BKattmPO83NhkzPy1JZ+Zo
X-Gm-Gg: AfdE7clTD+DwmHu9Gc3Cw7HzpieW/cNA4LANj1WgIe3DzjSwevfW0hK6thFmpEiQrSA
	WO34BWlCegw/CzNfbHO8xoJgV/4b0d1SpsFZDFVPmgiAYmn4HVA5lNpuo5DWrpDn3lwjBAyShmT
	aUwDBmEDxOVgX7vSGNAnVvbCzPL/Y7ob5nheTx24ySOWlVclCEr4Sly1qOg6RnK+90vo76nrjrN
	2Urp+MG3XLRJxUKT4sBTkVWq596fgZvoN8hxNyyXTocX37b3QbOmqz3+niHxhMsX6cSHc7W/Egt
	Ijqg2SYX45UwTP/uPdEkwrtO6aYw3NkEISRt4iBQbTxDenzLx4p931aloaxUf2bqe61mhfW++qM
	5N3EYAHxbV4n5mMC3nmkES9Qa7IaTwhfAjsDK6tdwb1PHBm+NaZSh77oIHFEHHW5uAGi9sFt+RZ
	9FcNCSv9mDD3fyfynCSfF1acCghU+qmv1/LbHaRXLjFn/CXGO7vA==
X-Received: by 2002:a17:903:4587:b0:2ca:d91d:d3a7 with SMTP id d9443c01a7336-2cad91dd58amr5101685ad.10.1783048916866;
        Thu, 02 Jul 2026 20:21:56 -0700 (PDT)
Received: from [172.20.10.3] (114-137-82-69.emome-ip.hinet.net. [114.137.82.69])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad7129996sm2255035ad.21.2026.07.02.20.21.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 20:21:56 -0700 (PDT)
Message-ID: <36760b24-8620-897b-e52b-5be52aef3fd8@gmail.com>
Date: Fri, 3 Jul 2026 11:19:40 +0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v5 1/2] ASoC: dt-bindings: nuvoton,nau8360: Add NAU83G60
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>, Neo Chang <YLCHANG2@nuvoton.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, robh@kernel.org,
 krzk+dt@kernel.org, linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, kchsu0@nuvoton.com, sjlin0@nuvoton.com
References: <20260630021510.821919-1-YLCHANG2@nuvoton.com>
 <20260630021510.821919-2-YLCHANG2@nuvoton.com>
 <20260630-amusing-striped-urchin-d49c93@quoll>
From: YLCHANG2 <neo.chang70@gmail.com>
In-Reply-To: <20260630-amusing-striped-urchin-d49c93@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/30/26 14:40, Krzysztof Kozlowski wrote:
> On Tue, Jun 30, 2026 at 10:15:09AM +0800, Neo Chang wrote:
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  clock-names:
>> +    const: mclk
>> +
>> +  firmware-name:
>> +    items:
>> +      - description: |
> Drop |
Got it. Will fix in v6.
>
>> +          Left DSP core firmware.
>> +          In PBTL mode, the Left firmware is ignored and only the Right is applied.
>> +      - description: Right DSP core firmware.
>> +
>> +  nuvoton,pbtl-enable:
>> +    type: boolean
>> +    description: NAU83G60 supports PBTL mode for mono output.
>> +
>> +  nuvoton,dac-cur-enable:
>> +    type: boolean
>> +    description: |
> Drop |
>
> There is no formartting to preserve and I did not ask to introduce it
> here. I commented in completely different place.
>
> With these two fixed:
Got it. Will fix in v6.
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>
> Best regards,
> Krzysztof
>
