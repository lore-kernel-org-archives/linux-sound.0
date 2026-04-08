Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF8B3612F3
	for <linux-sound@vger.kernel.org>; Wed,  8 Apr 2026 08:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775638404; cv=none; b=FotAkLiUR41PMsXazx1EO9533IafgirE69tBRFCOhHkVaYnZDTaZ21/zpzZJtxL3hoitunPrjUqyAeOyL6nw0t4oCwppnygDKuIwePQno8TGMjf5qhxNxEBbWbIfdZDTYaH/UYSSvNOCzSo2Qu8FeeUUnNkIirIo0FbwyvU3X8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775638404; c=relaxed/simple;
	bh=V8rXhEyN76cQYM9BF6KVpbO+9KEPhf/L+9trOmefMsE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HiPhFhluqdq/fZh0RqbbvkF+emVAF4Rs2VlGtOenk96Xul2GkNdeGlr/sb3Jlczpne+SYGbEjnGdYA4TT0IHW6BAhLRKmdpVoRWrYUQM/Wt2/jc/eigvghnbGO4bu1NnZevdAe5Bp/uS2q3c81c+8W4rohTClnrTElsUTbfMEOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JTo4y3qh; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JTo4y3qh"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c76c60c7502so273325a12.0
        for <linux-sound@vger.kernel.org>; Wed, 08 Apr 2026 01:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775638401; x=1776243201; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q0O2gUMwG94qjNO3Rau2fy1EWrjPL+RirtTuaeXZuXI=;
        b=JTo4y3qh56UkI+tIiA7JbQM8+SuU2aC7cADl4jjcka4hjicmxjLyCcahKXN0tV2dPu
         De0sCcUuIULY20I4DEOTZnXmOZQMPHmjUdivTDyjGfWvpFRAxKCbFQLkQfW1USGLypP2
         /u9Vjq7CpJAkZCRubOCqxnlhra92VHbzCOZ5dP+R5/qb+uwxdaLkfvbpLBRvKvyLOLWP
         WE8k1qSYYYpo0MewzGrE/11ve8JE/hy3pwOR5i6MOl96ydVpXWnAS7lmkQ1immV1vZoS
         SeNxvFXTub9OpOB6/FIoB5efEl3lbaGS5SqeXMcygXdqRW77PD2qS3ABArTMY6TtnknJ
         RAdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775638401; x=1776243201;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q0O2gUMwG94qjNO3Rau2fy1EWrjPL+RirtTuaeXZuXI=;
        b=N2pXaiRAbGkASQ6gHXnBJJbZ27q3R8LQIfno5Ajm5pVc1FP5op+YHXFqm9Hn2FqCaS
         J6IOFoINTCu/CGKWFa2UJwtutt+uG5zmilTcfZvP2iwK+scDqS4PbYtGEr09grfYMn16
         zesejWT5/MZbqpTDk/oMQVNUKEI2wKwR8Jg08j3eqjVQ9frXyUGf3rflzk6OGOeRsD3T
         M12bQgotFKXN7s9eD5pGaJgDFpaSa04s3TddCKGiriOdl0Llqz/PpxofS9tpNJFxh7uX
         9kgKRvt313j8AmEhnPw+VFONho5wkMUMLxMhByAW+b0W/hVEDu8ytJl4/8upc//7nTDR
         VsYw==
X-Forwarded-Encrypted: i=1; AJvYcCX011H9uYGof1sFLZ3cdsKXOyLESdBdaC7hQ2Ng2vAbFkzZTQasPCHOlyxBb3DH6xUw2/hLfqYhHuSaVg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx34Mm3zad7BJaLKbqfxpliePBjrbg+3jx47cxAXogzLpbvxlif
	2HnzttNO9jhQONUD3j9TFSJeJqyJmVCm9lbmkzl8RJN0AmLSx3K5zUIz
X-Gm-Gg: AeBDies4Lxzy0ynNYjXCcB4xiCzFUwRLSVzawpId5ctfkFIYHKzrVMl+mR8F+ZAPhnE
	5IeMpLYdH7gG9cZJKJUgtKC8Ch+IADgFFc5ccm4DaqYrADJDVf2KLCoR6E2UdBKkCZLk225/rmB
	kFjQRrR/d3uN+qG43Ex8+zhOruBTNh1/z+PLWt861toFgLAVepaTQMxp1m2pQiOOJ7HTmyIqgsO
	lxXFx3E2Ce1i+ty4hVeTnO82m9Ddica/04TuqF2N1Y7oz8FLUKgMHA0PiFifxpqhu82lIChx2Fg
	KyBiSs747NFBacH9aG7A8pBNIVMQ/mzCrTyuPM/94n5ExeQV/2+Vqkll72GwqCsw613TN5Qfk5o
	oqTfAsMYEEPXvIm7yf1xKK6JvRI0nFemsPAEj601SYyY/nbvrcaol1Lt09n77FZ5O3pZR/bqWzU
	/AwWlhJrOtXzADaKSOFVc8b3QK1WcoB4G1GC2ebKINkX3w1Clc4qD5cDv1zwaI
X-Received: by 2002:a05:6a20:12cb:b0:39c:212c:9088 with SMTP id adf61e73a8af0-39f170ded85mr3378151637.20.1775638401563;
        Wed, 08 Apr 2026 01:53:21 -0700 (PDT)
Received: from [172.20.10.2] (42-77-205-177.emome-ip.hinet.net. [42.77.205.177])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76c65995a9sm17556167a12.27.2026.04.08.01.53.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 01:53:20 -0700 (PDT)
Message-ID: <1d0863b2-64f4-9f2f-94a3-3d730e9638f2@gmail.com>
Date: Wed, 8 Apr 2026 16:51:04 +0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] ASoC: nau8325: Add software reset during probe
Content-Language: en-US
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Neo Chang <YLCHANG2@nuvoton.com>
Cc: perex@perex.cz, tiwai@suse.com, krzysztof.kozlowski@oss.qualcomm.com,
 dan.carpenter@linaro.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, kchsu0@nuvoton.com, broonie@kernel.org,
 lgirdwood@gmail.com, linux-sound@vger.kernel.org
References: <20260408052639.187149-1-YLCHANG2@nuvoton.com>
 <08462a39-61e2-4125-957e-9454751b011e@intel.com>
From: YLCHANG2 <neo.chang70@gmail.com>
In-Reply-To: <08462a39-61e2-4125-957e-9454751b011e@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 4/8/26 16:07, Cezary Rojewski wrote:
> On 2026-04-08 7:26 AM, Neo Chang wrote:
>> Currently, the driver only performs a hardware reset during the I2C 
>> probe
>> sequence. To ensure all internal states of the codec are properly 
>> cleared
>> without affecting the configuration registers, a software reset is also
>> required.
>>
>> According to the hardware specification, writing to the Software Reset
>> register (R01) twice will reset all internal states safely.
>>
>> This patch adds the nau8325_software_reset() function, executes it right
>> after the hardware reset in the probe function, and marks the R01 
>> register
>> as writeable in the regmap configuration.
>
> The first two paragraphs explain the situation, I'd say the third is 
> redundant. Not a reason for a resend though, only something to consider.
>
> Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>

Thank you for the review and the advice on the commit message.

I will keep it in mind for the next time.

