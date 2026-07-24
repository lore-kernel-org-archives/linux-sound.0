Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E308142048
	for <linux-sound@vger.kernel.org>; Fri, 24 Jul 2026 16:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784910943; cv=none; b=Kv39i4GrymfJ9hfJgIWmhbmbuTFpoTXx/288budCTHa2sF6zbjCu9wVo3eBr1u3pOfeIzVj1kRZyF8JP2+7+1ypGzBX+gOkij1yGQ1bN2KgH7gl3tWljWhuVFSJJ8ng0cA9W41ucNXxSANtiHewVRJaw6Ke5av77O9nn0RiTYbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784910943; c=relaxed/simple;
	bh=NdDk6TRCJ8iTt8ZTkH656PZ1Zteh18givIIw4CxVNUs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NbS3+jSq7ZqlUTk1qOAuvWD8B3gs+eVUwXyjkgK4T2ShafOoKApChGWlhcbw1V+0lnTf+P56KPNR3OARG4wmRgvfliUg0nuVeMGIjsF7F1+SGJMluzyX9ufE0be1n33TMxFYcUuxqYGyBku6yNDMDveLouS8JJq9Y2jPpVttSuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=coYUcgSk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MeQkCuHr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="coYUcgSk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MeQkCuHr"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OG6qsn3653138
	for <linux-sound@vger.kernel.org>; Fri, 24 Jul 2026 16:35:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RTsl8qB80iEPbbNFk54NH1GiTbMjZD2d77uY8N78fyk=; b=coYUcgSkQ+r9pJVa
	78l2TU3qcZ7fMlpLfsNnLHIxrAhvijlTYXNttu4YdIHAFUT/hcFPUZ44V1eLEI20
	ETy1jF3QO9/lkGJ6k1IMyNN9xH5uPHpYG86tNPTpj4pBcIDhHRGJQmKnRyl3QLK3
	HL+TUgw/GeOsI1ArLNRStKq9XpwP8YOw8pFeUvmLyMixkw/2ExiEyKvJjvZu7TZN
	EWsDYEAf4V7xABU0OvZx8cIEG1pmOhmd5vdPU2SsHdn8y4HCU/lJ+TfsgquWg3l9
	mc3LU8f6cb9hYiM6WbL2OSDeLTIK7hbXwPrMteftNd5q5SQiSsZceszbXbdiIjvH
	zKDXrw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmb9nr3m6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 24 Jul 2026 16:35:39 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c0408254aso32573611cf.0
        for <linux-sound@vger.kernel.org>; Fri, 24 Jul 2026 09:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784910939; x=1785515739; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RTsl8qB80iEPbbNFk54NH1GiTbMjZD2d77uY8N78fyk=;
        b=MeQkCuHrVZJo/mqyIBd64Qt7W5EEcVIx4eqWeZI6XsjgdUW+jkz7hOpYL2mtT7RlCD
         VSaozUgN3yBKJka26k+14rD+qwl4xN8aDxR1j+mOBTlIM/pk9nvux3pCn5rLyXFy/xS9
         q13stWLE5I9DmnqIEWI5tDLGicOCzRoYwQy6tOJB0FznC1OGdyNghecI9o7TiPswyLST
         ovZrl+/oxSh81ufpHHgalgMzkd5LMrL0gPM+yOJ8uKYlwjgZX1KGZmUGq1B2ro+UJG2O
         gfSOfZv5HZbICWnjTex/ZbP15LvOT8YJjZ75zelIYMPY1Hgosx8NOi8XVMI4rA7Q04Up
         3uew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784910939; x=1785515739;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RTsl8qB80iEPbbNFk54NH1GiTbMjZD2d77uY8N78fyk=;
        b=rGTdAYGLxPCN2mj2uvUSsVIVt3eTB7j6f+OEDs5+OoYPjkpd3AALm4Mo49AmIvTfno
         FW85D9vWXof7saWB48Qxkrg5nEWY6xNO4lbBTdGmps65KhzCCYAFpieC3C/WnzkyV1+Z
         o77pYMHYpmqnWWCPrZBYKCgv+BgCd/WkPwI+dp1xZ4f2jS+c5YK2oPkfPHhkscQjqiW8
         4ho+nEqY3nCmuwmvKn+uGer7u68f1lduFazqlniLJXgoXp3mE8rgjxtriNncHjqVYBK2
         LHJLc7a4y539E8zAR8uUwa4rN9/0WWPnxd+FHFO7y4/jgINHEyhOwbxVbIat4LBZreAE
         p6Xw==
X-Forwarded-Encrypted: i=1; AHgh+Rp3RQntmsefwEt2OsA8Ka4d3wLU8HOvFvVFst+uR7RdYD0qVwluuaO/W3HNmUnAQZh0VqpG6d4ByH+2qg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxjGBpcu7buoK9DU/gt2E/RjQxgMymFYnA+Ftp5ap5gp75oj4Fo
	hVrj9Lzpjv+YA/JgdtGWUshVbQ2bcdhoAHaKsG9os51bKAg1Q+YbIoB29IFrVM8yP7H354IoRRk
	ITQzfZ9F9/4QQif+FqIq10LPdnp8kPWuIGBrIPj1Ubn4EpGfrDK0Z9HuwFHyFIh/IIg==
X-Gm-Gg: AR+sD13MC5M6SsDFA7E+PWqWDt+9pphS/ETpzz4hDRj0g9xl+zP7CZyrWJlmGDAjs26
	L6ejvA3iMLFD3Aj9edyk/bO7XKEhvt0IUrCFKqwLcdrd1PQek4rypLjmIbPeA0AsiYVNGZ5wSbG
	mrOXOZaDZ3UQ14+aXcTw6m8c5X15kYFsTkHbCO7onR15LSS1W8W3coN1swoQpGgN4D0ZofThGXk
	fwoYFWHNvpK/Qb6QYbJ4rk2Ne1rNENfCFIDOzuvD2BXUVsRyXSHavKUFzs3q0QdURbbW2I+dSoN
	5b6N7qFNflxxVGS/Ql9tZA+X4KUv45qbYHZPMFA0HmXhPOwQh8dP7/PtiEhfBCClKNPYHm5SQXb
	V1GkSNECR8urCJhPVA7cKVya24eE=
X-Received: by 2002:ac8:7f0d:0:b0:528:2709:5fc with SMTP id d75a77b69052e-52960640cd7mr15441331cf.35.1784910938765;
        Fri, 24 Jul 2026 09:35:38 -0700 (PDT)
X-Received: by 2002:ac8:7f0d:0:b0:528:2709:5fc with SMTP id d75a77b69052e-52960640cd7mr15440761cf.35.1784910938312;
        Fri, 24 Jul 2026 09:35:38 -0700 (PDT)
Received: from [192.168.68.114] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-c1c32eb7066sm364205366b.42.2026.07.24.09.35.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 09:35:37 -0700 (PDT)
Message-ID: <e37d8a26-0e06-4e9a-98b1-9fef43745b25@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 17:35:36 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/8] ASoC: SDCA: hw_params: program upstream Input
 Terminals for OT DAI
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, patches@opensource.cirrus.com,
        linux-kernel@vger.kernel.org
References: <20260722234221.884765-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260722234221.884765-2-srinivas.kandagatla@oss.qualcomm.com>
 <amNlSu3mcwKOmqvf@opensource.cirrus.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <amNlSu3mcwKOmqvf@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XeS5Co55 c=1 sm=1 tr=0 ts=6a63945b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=mVrgL4efUa3KVtcFUKoA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: onLUZj87M5-TAZ9kakWpJB1PhpH8iw86
X-Proofpoint-ORIG-GUID: onLUZj87M5-TAZ9kakWpJB1PhpH8iw86
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDE0OCBTYWx0ZWRfXzpncCWJl6xIP
 CbOL+I77f7aoQRYTNa/ynPN2DWuge/b7kSUsllVLlFDyKndwSsCMfbSN67XsF3Pele5NzeexIEj
 HGyNSZzkCpaYW78y/K0doGGU+HsZ2E8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDE0OCBTYWx0ZWRfX7hP5kc4LWsIW
 W6VtxO6QPQ6HHPYpCn3U6pf4IRC8IkK95E1O1MpGaEHeuR4esfg44L74V8Rs1I3KWqtbj3c931E
 6wOvWEs+QG1o9Z9ZTTweik7xgUvlk8LtYvAe/Bn5lTPJIqxA7zkD0pjpmHG3vQpfOFpSWLfyM9+
 LiDZDMOsx/l1vc8caQS84rnUBEXcypzRiisXaKI99hbwqMOXMfUyfA4QEuShMVdsRhAocZRC+aI
 3gHVvqEUaNMtMq7S0mM19zPJuk6U8vr4lEovr1dHOGff3pFgMw5o3ye8P9ZnXq5aXZ0yWH+Gl0j
 eZJErN83rHWDWsZnw+IcZrgaw0jlY8BovwbifDuCMLvgl2NJALdB9715VF7niKnjmltOG6oJdtU
 eQ9QiWkZAtksiJNoGjdo6lvttxZ5cA2G9WZ69sCxumiMiZkM3SmHra1eULxi9TPnens7zzCTWq/
 o97F0at2opNWN2QNLxA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240148

On 7/24/26 2:14 PM, Charles Keepax wrote:
> On Thu, Jul 23, 2026 at 12:42:11AM +0100, Srinivas Kandagatla wrote:
>> For a capture stream the DAI is the Output Terminal so
>> sdca_asoc_hw_params() only programs the OT itself: cluster, clock
>> and Usage.  The upstream Input Terminals that actually source the
>> audio never get their Usage, ClusterIndex or clock programmed, so
>> the power domain comes up but no samples are produced.
>>
>> Walk the source graph from the OT and program every Input Terminal
>> reachable through it.
> 
> What was the thinking with respect to the units in the middle?

As per $6.3.2.1 and 6.3.2.2
FUs does not modify the cluster, its transparent to cluster, Output Pin
uses same cluster as input pin

--srini
> It's not clear to me things are quite as simple as we can copy the
> cluster from the output terminal to the input terminal. Various
> entities in the middle could change the cluster, such as CRUs,
> MPFUs, UDMPUs. Also possibly SUs to consider too, since they
> may change which ITs are actually connected at that point in time,
> although potentially an argument to be made that programming the
> unconnected ones would have no ill effects I guess.
> 
> Any thoughts as well on the propogation of the clock and usage.
> Its a little less clear to me from the spec that they are even
> intended to propogate in this fashion, although it does seem
> fairly logical to me.
> 
> Thanks,
> Charles

