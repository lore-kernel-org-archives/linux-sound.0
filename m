Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 947E2360ED6
	for <linux-sound@vger.kernel.org>; Tue, 12 May 2026 11:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778586245; cv=none; b=Xyk+K0PGnB6DRw7yhwB0DEXnznK79WskdTMiXgunvxVG5isMHNSURfsIiIZu8Syxalvta9jUzzINwAFo24VUGHnR2hpeaXjFNp0K4qrei2NzWl49IJ9hJDpPZifJ52GU5rv7SZoF+9E5S7M1xttFxueRjXeIrJg8FFu2pd1gj10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778586245; c=relaxed/simple;
	bh=3UD84u46ReNbEROsTVI8rp5vjKydSNtZDqLl5v5ZGTk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=paG9mhCMBejqQfDSZhUaloAKrgXtXO/DbyJhqpAb43owYv4ccCCIGuoZc0bNuRsXuPA7HKFZGYql0EhCvhE6mmJMukyTlmQgJNJPNE78qwkhlFCE9WphIj66sWIharynhlYhHo7Tvm1oNQ82T0faaiN3yD3tDxQr141rjShzyaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=egVwBkRq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RpO0XsTl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="egVwBkRq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RpO0XsTl"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CBclDr075251
	for <linux-sound@vger.kernel.org>; Tue, 12 May 2026 11:44:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KXqX0AgmphHDjjun0t9ZwnaKL20p51pBnMk5v/6dln8=; b=egVwBkRq+vGDJD+F
	K8Ncxrr3jOAI1dv/DTahBBZeJrZs+m0wRBRZA0jNts5P5PeLx3xsHsetJdIaDdM5
	eBoe/Vfg7Jr2S8J5gNXssoZTFmMcZNMFTv6RT205yPFjItiupNicTHpEw+SUtjJj
	jE/GVktkoo/j4fqY5xOCuoknMnu2zwIRnXHZaSWlCTz+Y5xemgACYWb/4+sHg8bq
	a9lwO32mz13IIdIdj4e7WF4/2zJrGQxasJkkFcVVVitJo8t8tglMrlGbhTXl7uOL
	JAZdqtB6wogd1slBe3QDbJJyJtVwNY3MWRqaCpF/evZUDTItDOAIKLrEcb6cPZ2d
	fvF5kQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e43gyg0mj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 12 May 2026 11:44:02 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50fb3403e99so100394011cf.2
        for <linux-sound@vger.kernel.org>; Tue, 12 May 2026 04:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778586242; x=1779191042; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KXqX0AgmphHDjjun0t9ZwnaKL20p51pBnMk5v/6dln8=;
        b=RpO0XsTlRkkxCiW4dgjOV/mcIY9WajeroEwizOQNVuMwzQq2gicUDvcMhJWHFK9hBy
         AtBCeD2M1WeDM4JpRgtZkYtwaGiPxkwqmpvizVa8hpZwYwbV+sF2YFO0FJ2rhHVFydom
         GyKSKKpl9B5k09ujrlJpGNvrCWv73Bgxub4dMsKkeoCPfOZgxpejtYcje5+14HKB0Hsu
         QjzMqKGqASdpAF5p4no76zbSuZMqk3k36yPmqyeJksiQjv3+RwbrcbXZQU293a2dsoWW
         f0IeP80eCTlKMOHlXhs5JOQCoafrPfMR8msqLEewzUuQAVtVKN8BycP3JXiMN90hLomm
         pieg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778586242; x=1779191042;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KXqX0AgmphHDjjun0t9ZwnaKL20p51pBnMk5v/6dln8=;
        b=BTgV5SmDZG7Rzkdfo2uTVYpaYgkwyV/XrluDJyCP427hBMsTzovzAVFvzFywRn1VtS
         1ogQlIlDcD8cJnttWE+oZwOaK2XoJqs+lrgoIzchT6AbwNDyVCflYKJogq2xOQgj8hP+
         8LEvfPtxU9jwH+7uynku6r4cLoLCCpmOZeine6pM9QV5TZhxbVOIORkHzLz3iLgsmEyM
         YET6ae/U1mmUGF1KyPfaFiTNLi3Ku5Y1Tx5ZU50gPQh7HLDbEQLFOb1TbYY3jzauuS20
         r+bL71O1RNyQvBwHZIlvsJO3hvaiyTKtNQFZBFrrMO1pBnmZT1Z5KBjmIFTmMtDvKGaF
         3WIQ==
X-Forwarded-Encrypted: i=1; AFNElJ8M/tdUGexg5/7YMgUZShbielbvoFqojxuOyJVhosT3nzuSxJRruERYI1kumGsHL70BGH35/c8K2gaL0A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxkvk67LvIKgozxD++W+aj072uc1odGuMv8Tics9ZmmDeK4lUTn
	BC07C/5Bpid6TH1pVSuCHBN9XgHZByBxZbCkUPveNMbVEBj5ibrtHoUruEkLWmWRCvdXHXG9Cd/
	zSoWVfsC1awbjcMM/IoKieEpJ8AAT2mgQ5TotwMRbJi9Nu+8e8hrs2WR4gAPbvFWsNw==
X-Gm-Gg: Acq92OFvlyJ/ivB/4isTYmRGHapVCN7t5wlv9RESpJ9sCmIDfk+oL/QLBsEh/Fgua55
	2Mev/aa8nd3xxfFctrz98mXm56fypH5lH9T8BKx9kBuSpeiybURxn4l0efyFPZUrhllHZMdAihX
	epoCmzzZEn5XfhZChyglI6GmnHJLhKj1T2njUHx2B0mnlfcfhkLGYZ3cwNt6jW1wZ/XAStGhiX4
	0ruljd7CtBswDPrFoma/E6h4lFzZ39tQuHM0IsIklcdjJgG4LJHWB4+Mv+ns881QggjSgkOr1vI
	9g0Db4p3eqfLeCPstgdJcMYtbuY1MoAUtKta2uGuOrL/WCkCHkWfg2Xd6FcWVpkz4maPosqwquU
	Y2nAoE65uhuM/I+O88o2vk36T0BNLbZMhT5bNFdFvIy9K75SB
X-Received: by 2002:ac8:7c44:0:b0:50d:a26e:1e95 with SMTP id d75a77b69052e-514d2237efemr36799711cf.47.1778586241785;
        Tue, 12 May 2026 04:44:01 -0700 (PDT)
X-Received: by 2002:ac8:7c44:0:b0:50d:a26e:1e95 with SMTP id d75a77b69052e-514d2237efemr36799311cf.47.1778586241337;
        Tue, 12 May 2026 04:44:01 -0700 (PDT)
Received: from [192.168.68.112] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48e9052c9fesm85887155e9.1.2026.05.12.04.44.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 04:44:00 -0700 (PDT)
Message-ID: <0c6c8db9-b54f-4df0-ae1f-306b7feb6d67@oss.qualcomm.com>
Date: Tue, 12 May 2026 11:43:59 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 13/13] ASoC: qcom: q6apm: Add support for early buffer
 mapping on DSP
To: Jens Glathe <jens.glathe@oldschoolsolutions.biz>, broonie@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, srini@kernel.org, val@packett.cool,
        mailingradian@gmail.com
References: <20260402081118.348071-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260402081118.348071-14-srinivas.kandagatla@oss.qualcomm.com>
 <7f10abbd-fb78-4c3a-ab90-7ca78239891a@oldschoolsolutions.biz>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <7f10abbd-fb78-4c3a-ab90-7ca78239891a@oldschoolsolutions.biz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=fMAJG5ae c=1 sm=1 tr=0 ts=6a031282 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=uTuHR2d3_KI6eGJ4HmgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: HgLMpCnUu3OlWxv0AkQwDD3EvzS88eTD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEyMCBTYWx0ZWRfX/q9oCbPcnVUA
 yzY1JsKn7WG3c5XHgI0uuXjlu+M28DOdBlXd5osiNN70B6nOj8gIuQC1+6UwsezxUanpiypJ+TR
 +3vOQxzE43wtuhYaVekLNWb4k5f20p52iu2Ht66+47OBkSbGp7H6zpe7yefehtJgzF3kyIMStbF
 j61L+Sna1yYIue2e0yHWmOvmxHA5LvWHQV0JJt5bbSs5tdNP8s5HPkv/7CzVha6BsX2vShDZnJ+
 Hu3wGRJiirmiWGRLem3GcsMSeFWEkb383vcI2eEndl2XxF3sXa9K/uy3wW/T1u22FkTL6/Ghu2b
 K0es/dj4OhCB+fhIrjHfsRaiA3flGDagvTy4iQUxK8d1dx41xWdr1dtpiO7UKMEB/kGo3xg32uS
 CqLqt2eqgJtKCpHjob/0hVm12PTt1ZaZy/dWabt1vI6XOtk4HlFyB6ds7jQP88iyALHJ99oyvsE
 CjRCQNajI/bxxPG+0Gg==
X-Proofpoint-GUID: HgLMpCnUu3OlWxv0AkQwDD3EvzS88eTD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605120120

On 5/12/26 5:09 AM, Jens Glathe wrote:
> On 02.04.26 10:11, Srinivas Kandagatla wrote:
>> Buffers are allocated on pcm_new and mapped in the dsp on every
>> prepare call, which is inefficient and unnecessary.
>>
>> Add new functions q6apm_[un]map_memory_fixed_region to map it on
>> to dsp only once after allocation.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> ---
>>   sound/soc/qcom/qdsp6/audioreach.c |  60 ------------
>>   sound/soc/qcom/qdsp6/audioreach.h |   5 +-
>>   sound/soc/qcom/qdsp6/q6apm-dai.c  | 107 ++++++++++++++++++---
>>   sound/soc/qcom/qdsp6/q6apm.c      | 151 +++++++++++++++++++-----------
>>   sound/soc/qcom/qdsp6/q6apm.h      |  14 +--
>>   5 files changed, 202 insertions(+), 135 deletions(-)
> 
> Hi there,
> 
> I had to revert this patch from the series to get back working sound on
> sc8280xp (Blackrock) on 7.1. And hitting the right patch was pure luck,
> tbh, since I integrated the series on 6.19 and couldn't apply the last 2
> cleanly. But figured these are cleanup/refactoring and left them out.
> 
> The errors I'm getting on Blackrock are these:
> 
> Mai 11 21:26:32 volterra kernel: q6apm-dai 3000000.remoteproc:glink-
> edge:gpr:service@1:dais: Audio Start: Buffer Allocation failed rc = -22
> Mai 11 21:26:32 volterra kernel: q6apm-dai 3000000.remoteproc:glink-
> edge:gpr:service@1:dais: ASoC error (-22): at
> snd_soc_pcm_component_new() on 3000000.remoteproc:glink-
> edge:gpr:service@1:dais
Could you please test this change on your setup and let me know if it
helps? If so, I’ll send out a proper fix.
This is a workaround for a known issue, I will add more details in the
patch that I will send once we know if it fixes the issue.

------------------------>cut<----------------------------

diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c
b/sound/soc/qcom/qdsp6/q6apm-dai.c
index ede19fdea6e9..8a1a3d8a3398 100644
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -497,7 +497,7 @@ static int q6apm_dai_pcm_new(struct
snd_soc_component *component, struct snd_soc
 {
        struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
        struct snd_pcm *pcm = rtd->pcm;
-       int size = BUFFER_BYTES_MAX;
+       int size = BUFFER_BYTES_MAX + 4096;
        int graph_id, ret;
        struct snd_pcm_substream *substream;
------------------------>cut<----------------------------


--srini


> 
> Since I'm way out of my depth here, I won't cite from the Great
> Hallucinator's analysis. Only reporting that this refactoring breaks
> sound on sc8280xp.
> 
> with best regards
> 
> Jens
> 

