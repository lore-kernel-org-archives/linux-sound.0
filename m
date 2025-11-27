Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08D4626F29F
	for <linux-sound@vger.kernel.org>; Thu, 27 Nov 2025 10:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764238493; cv=none; b=Y426p8NlfTWp213A1c8fbj1GT7CePyuQhwJcKdJSIXYB3VIalw1O9OKNXghfgDt453n+yIZRRo3RtYush51IPQReJ343Vb49mvp71R+erzM0ezAZvnWRIwD20568gFT9ZpdKZSftLz9IPN/KLfgTm1pep191QNxHEEoEQNF40P4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764238493; c=relaxed/simple;
	bh=F6hhyKjSAm3aFoC/1gHPhQCO4/SHeeB1TdS6gddI4Lg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=HTPBJ9dGkXF6CZPGeI1qTTrdyLl94IOCamYszcbY8pfFJHPqDjY6wXasvfheS0JsS6yaQzJ0E3Gs1ZyDwmZ7lkS5I8jz6FJXH2jWy9HGIRyJQ8MP2GokDpnrdvOpTZxcal63ggGhArFzo6gm68Bpig05zFa87ylOqeX+giPSv0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bQWSQEWE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xd4d7XQP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bQWSQEWE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xd4d7XQP"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ARA3jFc643155
	for <linux-sound@vger.kernel.org>; Thu, 27 Nov 2025 10:14:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n1YCVstjNtyccGxs1SVtep+hh78Wp2wH+3eogy83tcE=; b=bQWSQEWE7uz0Qm5r
	/6vCD6ugGvAp5FL6N/P+4biHwaI/HOzmkBpQMeHn/nEYDy9wsn99+p51cVE4SkBq
	RODXzh/xquqS5/42sQGLJE8gLgegORpWRl38NybNSMUmLm+B7thz8eD9IwyZZrCC
	rgVMP9K+s5nYXBUgdITxNn2JcZ0ilMB3Yi/DGXMCoUDZBnCM1dmxxQvDNtwN02EI
	sg9cGmopjbBUfTyH8RLIah59dbE0hBHBGdtXC7lJODTLenC7Pxg8ExlsXotMIWAl
	thGDTID91ndqfPzuK8fiJC6Lwvhc0ICFfIxLZcwgm/k3Td/Kn/JhdJkT/0WySXCg
	O4z1cA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apmja814e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 27 Nov 2025 10:14:50 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee04f4c632so10519481cf.3
        for <linux-sound@vger.kernel.org>; Thu, 27 Nov 2025 02:14:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764238490; x=1764843290; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=n1YCVstjNtyccGxs1SVtep+hh78Wp2wH+3eogy83tcE=;
        b=Xd4d7XQPpkbSwObHVFr5MqRaYTcYwsOgkIFQmiFXjiLflDLCkDT9t2TkaFnyZSoY6v
         hIEYmASoplcuTqKuXEW8u6o4DGaWXh4AWqvVaGojNcUtP5C1P39wDbO8TZFWc1F/4WCb
         kkBco2sq4UMXd6R+hpn3TWsAUEU0gY8d/nCx/HskdiOetOTQ8GyxgOEc3zbchhqZcnWB
         oRn3xK4NRxEd01SX3hOzWy7EO2C1DLOrENZTiH1yeWAYkevVDGIUmJQNy6pZgAhC7DE+
         irzBRuBFlNRiBY/IWnq5AAu1kR4z0nJKVrThgtfQUfZapZfM808JzRSMaYpX4mebeXSG
         3ygA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764238490; x=1764843290;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n1YCVstjNtyccGxs1SVtep+hh78Wp2wH+3eogy83tcE=;
        b=q91outMWx5zze4J1bxGX71cDJt1W1ACkjbwXZgeA8Jwz37Ba0SHjIgQ3wlhpNG0cAW
         VoHWvufPca1OPREE9ovYSCFBucn2GxrkzY1DaOxcKrHPAC4PYh5X/w42QJNz1Baayzy/
         dljCeaa+kNTJ/elvaBFhuAaaO8pk1DxyglZR5fsmjTpTgTqsctOuoCNQUebMlrodwak4
         xZHr8EAfPCR1yDWXXrYty5nm58/nrrGrq8iFqwLhfmn0mwoR8zTO6Cv2Q1mwRvMhlG7D
         lOaAEmGWAVtFdimaVVLl6hPXXjTK/t3Dn8ER1wicNn3IUDgGpE7F4h2EzJrjUn1PXe83
         mdLw==
X-Forwarded-Encrypted: i=1; AJvYcCUo6WWOGUcEnSgU4yEjl334PBWomVXefmuNfnE8gdur3DIvq4mfqzqfxHXZai3tuP9H7RhjkCR58yZ6sQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz17cRYOEd+sOY7zH48SiLXEePtZ7dfOkljyn4jbYfA/I8JDKu/
	fmNPpDVyCZTIDZV7NzZM0xIDIxyZL5m9eDCxGoIUu0Kc8B5aY3elgI8iz/cUdcJXbknNpSThWz3
	2zBl38HYG+D/jOTpPpU1FQzC1HPjfPzjXgMtQO6Fk/XxK9ZLSuuEDIWPZ4aixYdqAcg==
X-Gm-Gg: ASbGnctndx8vPiF0is9YwJX9Tc0IUewk198isRx+ADWu4TzHZVFYp76yfuFndFu/n16
	FK4XRO61X4sLFCv8D8bQvlqt1iW6WSL06/CmChuxnMxn2+F8rQxfLx41cMM5DIHvSR1wsD+KzmY
	UrdLZe3XjJsFbyNNbhgsDZPN7CdtoIl/0WSBoVjA5jXJHPiDdJhqDW8Be+lYHm97dVkM/3rcK01
	OqdaLClSzteU4usgG1r/lfz5lZYluHAGnkPMNzj2T0kQd6q0JtCHS880M8azA19b/dmY8Msb34B
	D181vbpAEVbIzXD6jMp2PahGADBWZFd1AKR5+lJTf0W6ccL6MEWvscfMAS9ZwQsumVEhKKhv7QO
	j45a56PmdlE7ipeON61hiUqkDiNqZ9jexb1kx
X-Received: by 2002:ac8:59c4:0:b0:4e8:b2df:fe1f with SMTP id d75a77b69052e-4ee58aae1ccmr327951791cf.28.1764238490264;
        Thu, 27 Nov 2025 02:14:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEFbYd1IhpyPVDKBbkMXxtpM9OB0oaI8HKPCXrpueEOSmdHGVGj0Bp/uoE9BrC5w+6T44fjEA==
X-Received: by 2002:ac8:59c4:0:b0:4e8:b2df:fe1f with SMTP id d75a77b69052e-4ee58aae1ccmr327951421cf.28.1764238489706;
        Thu, 27 Nov 2025 02:14:49 -0800 (PST)
Received: from [192.168.68.121] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-42e1ca1a6fesm3019675f8f.20.2025.11.27.02.14.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 02:14:49 -0800 (PST)
Message-ID: <fafe5de2-f682-4769-bb1f-166858808746@oss.qualcomm.com>
Date: Thu, 27 Nov 2025 10:14:47 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: Re: [PATCH 1/6] ASoC: codecs: wsa884x: remove mute_unmute_on_trigger
To: Jonathan Marek <jonathan@marek.ca>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        "open list:QCOM AUDIO (ASoC) DRIVERS" <linux-sound@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20251124064850.15419-1-jonathan@marek.ca>
 <20251124064850.15419-2-jonathan@marek.ca>
 <2758401b-e9b5-4f10-bb01-0a1fe4e09430@oss.qualcomm.com>
 <5f15fc5b-375a-1e75-b32d-0d543fa1014d@marek.ca>
Content-Language: en-US
In-Reply-To: <5f15fc5b-375a-1e75-b32d-0d543fa1014d@marek.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI3MDA3NCBTYWx0ZWRfXxsBUqOTgZr1r
 /Acae7bM3M5J4SKudioofrk9f84cTTOkxK4Fjsyg6Bayc+KcPvz8ejltAiRZEeek5rg1TkuFBYE
 3qzDAfwDVYjs/1REsS63UsQuxT4n9bNBd8vRJMSjV+jwgTDA+NwKFNOqKsuqXES8il9B1YRR873
 SipRmi85H4sM04P7QDRNi6PFClXXV8BIbggoGS2f+u2sjwK+9usXCwqfK88r/why0/0krVxDswp
 6SEt2N9SNT/DKA5M7cIh21Vsvyh6/YF12ftflRFmZvnvGCUWY3jk7FMIPS5AD5gpGr65G06dohH
 ePnDb99jraRR6bZ4EWUR3ujYoLVCZQQ+olDJyzu7J6T1WjjWRxxAy7V3Y1/7XybXEScvkiCbkFY
 SFs7UJtgtNKoMh9gvyOFai3C80tVJg==
X-Authority-Analysis: v=2.4 cv=KbvfcAYD c=1 sm=1 tr=0 ts=6928249a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=RAbU-raeAAAA:8 a=2_aVCQaLeZF_kDhAQLoA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=JiizpSU_mAIq9zsZDqn2:22
X-Proofpoint-ORIG-GUID: 3ypUNCJ7nhc8a-JuDOm2EFqy3MpmJZi3
X-Proofpoint-GUID: 3ypUNCJ7nhc8a-JuDOm2EFqy3MpmJZi3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511270074



On 11/24/25 2:55 PM, Jonathan Marek wrote:
> On 11/24/25 9:08 AM, Srinivas Kandagatla wrote:
>>
Sorry for the delay, I have been trying to test these patches,

>>
>> On 11/24/25 6:45 AM, Jonathan Marek wrote:
>>> trigger is atomic (non-schedulable), and soundwire register writes
>>> are not
>>> safe to run in an atomic context. (bus is locked with a mutex, and qcom
>>> driver's callback can also sleep if the FIFO is full).
>>>
>> Thanks Jonathan for the patch,
>>
>> We have nonatomic=1 flag set for all the Qualcomm sound cards, Did you
>> hit any schedule while atomic bug?
>>
> 
> Right, I missed that. I'm using a different driver which does not set
> nonatomic. But this driver to not need nonatomic -


Interesting, I guess this is not an upstream driver. The change and log
itself does not make any sense on upstream. pl correct me otherwise.

> mute_unmute_on_trigger is a hack, if there is a timing requirement -
> then it needs to be explicit, the different timing with this flag is not
> reliable).
> 
>>
>>
>> In-fact this change has helped suppress most of the click and pop noises
>> on laptops, specially with wsa codecs as they accumulate static if the
>> ports are kept open without sending any data.
>>
> 
> 28b0b18d5346 is important to fix the click and pop noises. But the
> useful part is the rest of the commit, not the mute_unmute_on_trigger
> flag. As long as the mute_stream() happens while the soundwire stream is
> enabled (between sdw_enable_stream and sdw_disable_stream), there should
> be no pop click.
> 
> AFAIK the pop/click is because of PDM: zeros (soundwire stream off)
> represent the minimum (negative maximum) amplitude, and the soundwire
> stream needs to be enabled to output a zero amplitude (alternating ones/
> zeros). Turning on the amp while the soundwire stream is not enabled
> will cause jumps between the minimum and zero amplitude.
That is true, The issue that enable stream happens at machine driver
prepare and disable happens in hw_params_free.
We have window of opportunity for click and pop between the mute and
enable and in reverse direction.

Am not sure this patch is improving or fixing anything on this side.

Also I noticed during testing on T14s one of the speakers (left) went
into mute, not sure if this is something which is an existing issue but
reverting the patch made it work again.. Need more testing and debugging
to understand what could be going wrong.

I do acknowledge there is still some cases of pop-n-clicks which needs
fixing.


--srini

> 
>> --srini
>>
>>
>>> The important part of fixing the click/pop issue was removing the PA_EN
>>> writes from the dapm events, AFAICT this flag doesn't help anyway.
>>>
>>> Fixes: 28b0b18d5346 ("ASoC: codec: wsa884x: make use of new
>>> mute_unmute_on_trigger flag")
>>> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
>>> ---
>>>   sound/soc/codecs/wsa884x.c | 1 -
>>>   1 file changed, 1 deletion(-)
>>>
>>> diff --git a/sound/soc/codecs/wsa884x.c b/sound/soc/codecs/wsa884x.c
>>> index 2484d4b8e2d94..0218dfc13bc77 100644
>>> --- a/sound/soc/codecs/wsa884x.c
>>> +++ b/sound/soc/codecs/wsa884x.c
>>> @@ -1840,7 +1840,6 @@ static const struct snd_soc_dai_ops
>>> wsa884x_dai_ops = {
>>>       .hw_free = wsa884x_hw_free,
>>>       .mute_stream = wsa884x_mute_stream,
>>>       .set_stream = wsa884x_set_stream,
>>> -    .mute_unmute_on_trigger = true,
>>>   };
>>>     static struct snd_soc_dai_driver wsa884x_dais[] = {
>>

