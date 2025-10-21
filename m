Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71531246762
	for <linux-sound@vger.kernel.org>; Tue, 21 Oct 2025 09:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761038777; cv=none; b=JB+tYhVnb8IAPN+KDdHGJQ0Lus/DHsMPWGoVPeNsgwzo2gZeNhK2vqyqBTahE/Q4tS7qfgmcWo0KTRcVafEc0b4/0uAhFEMOuHRZrK5UeC6JWhh7XXYhmFN74iyA14N3DZ6tlfHtwTqoqtvFrw8KB7bZkzUsxILibBZTWmWtRXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761038777; c=relaxed/simple;
	bh=2f6PNo8akMHM0ow78qncOsfP9ik2SgrATiXZ5mfN5Ow=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SfJeees+b4tDOxjzOUMfd+/JlekOSeGvFOK7A9LlJ7niUwILpdFBFypfQpYI57FHIGv2qE0G9SPFkCKQxqDa6sVIjU29Bvyz/LkeXf3AcAHHx93jaJXpy0yONMrQs/yoiXFvANpnLnCxIt+XebAO+CoyDfCwItFwqigYFTykiEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XXetdccY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XXetdccY"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59L8EpOK031255
	for <linux-sound@vger.kernel.org>; Tue, 21 Oct 2025 09:26:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cQ5S6LYVVpRZCjWQzqjDh+0QXNJqqNKilZF5XszBUgY=; b=XXetdccYjTQFAUBU
	pI/Ng3rBDxgZWVvyJ5/MzH8r1GnX1690GOAPRzS2De+Hz61YzXqNWURS9VjYQ07/
	C4wU2nUM2jNr3T3tAbtIgkvYOZ8gcJl48rJ6gFFkeNXkMyFfzRKSIfX73dCvq6ki
	YDZRvpcQAqihMqAqsR8SgBU5LpHTuc47wv6G8JDD/NTBzEn2mp0sFfg+lqrxTEM+
	i9jGUDnLZRh3I0DsUr8so+cVrpzN8kD8dwCoditdTRROy2Ml4wmZOt7FbF6Tjca9
	+Wll/ulhk+Xt+JtM0D9+6lsKzyctt7k1E11yY7OGXKRsJfbRcOoO20K/o1JbPNSG
	yFiSgg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v42k822a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 21 Oct 2025 09:26:14 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-890cb81b3dfso202058885a.3
        for <linux-sound@vger.kernel.org>; Tue, 21 Oct 2025 02:26:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761038773; x=1761643573;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cQ5S6LYVVpRZCjWQzqjDh+0QXNJqqNKilZF5XszBUgY=;
        b=P28FrLZfwhsjmSZQYkAPcHL+589Gu43hl13YU8WgQ3Hfgk8SMKABQvwkppgGakq1/R
         sNW5jpVovEoS0vN/W1G5w9QiizsSFtcNC0G2e/3pO6KDsOf+h+slO5MH7XJdxsOfCzDH
         +JxYX+9mOwq/kkgnZStlQX23tAM76KSFamlCm7+B82JQgHUNUelrn1ozN4ImrqgnyjE+
         kgz48YaSMee02BU7dpIG0ED2e3SnnOOydLz0LhOR/qJ4fX9FqfVilQWj+MfDHOVYagXA
         knDe2ZLe4fbvoscYskM75Cn1WNIIktX9bVpPW1LHm/J/sBC06Z3srEo7eXhMb6NA5KNC
         L29g==
X-Forwarded-Encrypted: i=1; AJvYcCXzZ3wn4pqwvLxE1xwrad69haWeUru5KPegDgaGhIqCmabM8lCmFXReBo/AEle9WXKS6LoIaasiA3vtcQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNqtE0YRrJVwgmSpnnQjDXfInT5+s6qOU7BPulZ7qMH2/mubqL
	5Zy2PRtwf7tx0nNIE0kxk4vsL7bsxq16GcC1Sh613ujSMlmMuxec9uB5Xaauui6WOHsd169nYgw
	IJEq8lmdg8y+xNIoNACOGrT/YLD8G9MYW/xQOxLBt+jmMS5HevpoT1gBxJoG76hHAhTUEYVI6vw
	==
X-Gm-Gg: ASbGncuWvAhocxAEgVWkEeP9judMKHc7uRAxPH9l5XfTUIqAMKZ48ZJZUZv9gNZhQis
	Fmn6pdiMMSvlVn1vzEgKIY95CW4cOaRM0RInZE4i0RgWCM/I9DKB+RtfoE9A7suIIe5v6+dgCgO
	0qR9j/VYU38FxmADK0b3coe65J3tKsqiwIEQAnzppjlr2iQhlIeEmpJ9lrBSLQV+c2IkdQizW6E
	bgLWWdOI1XI5D2G4Jlkul6WL05e5tHsS4RoGkXR+IlWjuR93BLO9OBE9o88eB3EzsaSFkZjV+mE
	Uaf/6v90Cy2R+ppGBHJOU/WLpV0xM4dbZoe2H1OJ0Kqvu2B7kk+z9nylO6hXXbrg8V89pC3115A
	V/zTB/Xgsa2W5kRabvf86KNZuiQyN9omfgwLYnK80+DHY8L2nLNKbg1DT
X-Received: by 2002:a05:620a:471e:b0:891:c59a:a9c0 with SMTP id af79cd13be357-896e1ddc72fmr204397185a.5.1761038773189;
        Tue, 21 Oct 2025 02:26:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEERhuwHy7Nh2HueImJqZRTj9hw0JMYU3iQfmrba1U60nisbmo+Q9582QrJk2M4uByUxCrjRQ==
X-Received: by 2002:a05:620a:471e:b0:891:c59a:a9c0 with SMTP id af79cd13be357-896e1ddc72fmr204395685a.5.1761038772716;
        Tue, 21 Oct 2025 02:26:12 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65ebb499dasm1038843066b.73.2025.10.21.02.26.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 02:26:12 -0700 (PDT)
Message-ID: <7abcb827-4a7f-4855-811a-4212b8357333@oss.qualcomm.com>
Date: Tue, 21 Oct 2025 11:26:10 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/9] ASoC: qcom: q6asm: handle the responses after closing
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Alexey Klimov <alexey.klimov@linaro.org>, broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org,
        linux-sound@vger.kernel.org, m.facchin@arduino.cc,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20251015131740.340258-1-srinivas.kandagatla@oss.qualcomm.com>
 <20251015131740.340258-6-srinivas.kandagatla@oss.qualcomm.com>
 <DDN83LOTCUIP.5O05FBN02AZB@linaro.org>
 <7c0dad34-cb4c-4912-9406-2e559b91142a@oss.qualcomm.com>
 <60a48dfb-e266-425d-8cfb-574c637f5e9d@oss.qualcomm.com>
 <97afc64d-b384-4edb-9665-a5d654c19771@oss.qualcomm.com>
 <168c9cee-5f5b-4c45-82bd-45c911da4dd4@oss.qualcomm.com>
 <f8b85e89-c546-4bcf-bc95-d109d453bfb1@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <f8b85e89-c546-4bcf-bc95-d109d453bfb1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: CzOiLAqwrIu_SDIjioJ-KBTaRT0YjwuQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAzMSBTYWx0ZWRfX25eegaWZ10EB
 V584k+Gu23rQ5UobRKUmq6Smb7cpOfOzOz4U8Q58oKInDclrcGsgWDeg5A+rrCdIUC8en9X+CWN
 G1zKZbh2fHx4TmcrHKWQh1muj8RXcp5yEnrFKbQEkQRncJYwrp8vxVjpP+ZP/8au2uaxFiYetke
 R0CPey2/mn/nG9tYqEpw9fem/1styhGGdb0+XcQE/S17ulbUIWxpNznGbuepybV7lgQQ0XSDzvg
 3QKr75qP2cLXuD0nVyFylR35pa0bvBDpN9YwKKpExLIfiARZawZMfdBrtRobJsaND+ohTJO6fDO
 ao5fAHcdKHDM18/w9i0B79JRoOQ10x/9dpH1Z0ZEXW5RcpmWJdih4hfXs3uoF4+PQQgncn2295l
 u4KFRWzwft1Cc11wpfroWWWL4I/Ogg==
X-Authority-Analysis: v=2.4 cv=QYNrf8bv c=1 sm=1 tr=0 ts=68f751b6 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=OtXjWRe8G1RkqavMlDUA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: CzOiLAqwrIu_SDIjioJ-KBTaRT0YjwuQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_07,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180031

On 10/21/25 11:21 AM, Srinivas Kandagatla wrote:
> 
> 
> On 10/21/25 10:12 AM, Konrad Dybcio wrote:
>> On 10/20/25 4:42 PM, Srinivas Kandagatla wrote:
>>> On 10/20/25 3:39 PM, Konrad Dybcio wrote:
>>>> On 10/20/25 4:37 PM, Srinivas Kandagatla wrote:
>>>>> On 10/20/25 3:35 PM, Alexey Klimov wrote:
>>>>>> On Wed Oct 15, 2025 at 2:17 PM BST, Srinivas Kandagatla wrote:
>>>>>>> For record path, multiple read requests are queued to dsp in advance.
>>>>>>> However when data stream is closed, the pending read requests are rejected
>>>>>>> by the dsp and a response is sent to the driver, this case is not handled
>>>>>>> in the driver resulting in errors like below
>>>>>>>
>>>>>>> q6asm-dai ab00000.remoteproc:glink-edge:apr:service@7:dais: command[0x10dac] not expecting rsp
>>>>>>> q6asm-dai ab00000.remoteproc:glink-edge:apr:service@7:dais: command[0x10dac] not expecting rsp
>>>>>>> q6asm-dai ab00000.remoteproc:glink-edge:apr:service@7:dais: command[0x10dac] not expecting rsp
>>>>>>>
>>>>>>> This is same for both write and eos.
>>>>>>>
>>>>>>> Fix this by allowing ASM_DATA_CMD_READ_V2, ASM_DATA_CMD_EOS and
>>>>>>> ASM_DATA_CMD_WRITE_V2 as expected response.
>>>>>>>
>>>>>>> Reported-by: Martino Facchin <m.facchin@arduino.cc>
>>>>>>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>>>>>>
>>>>>> I was also reporting this error months ago.
>>>>>> Thanks for fixing this.
>>>>>>
>>>>>> FWIW there is also DSP timeout error on Audioreach-based platforms.
>>>>> there should be only one for SPF get state command.
>>>>>
>>>>> qcom-apm gprsvc:service:2:1: CMD timeout for [1001021] opcode
>>>>>
>>>>> This is expected as we are checking for DSP readiness and it will
>>>>> timeout if the dsp is not ready.
>>>>
>>>> Can we make the UX better by adding "bool timeout_expected" in the
>>>> path that we "want" it to fail?
>>> its not that we want it to fail, its just that we might fail, if we send
>>> the command too early.
>>
>> I came up with this to potentially work around it, but it seems a little
>> heavy-handed to avoid a single line in dmesg..
>>
> Yes it is. simple thing to do is wait for few ms before requesting for
> SPF ready status, that should do that trick.

Sounds good!

Konrad
