Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D8253AEF3D
	for <linux-sound@vger.kernel.org>; Fri, 20 Mar 2026 12:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774010062; cv=none; b=UYMRH1f3xZxqTwuDw2M+LKPL+M0jHap6AoHm6G/rvZlw3XdR1FgHVRaxsyAHo178j6kCIkeHk7KOmQmS04zfulMsHMDt2d+QYK5vYGNZKrl5Rty4Iw0XOWtJDNkM0wX9RYDckAFxTVvf+u1kcku9JZVLV9+VyQumGoo2TiadAec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774010062; c=relaxed/simple;
	bh=lEocWDistd+a/+7r13EdA2zND6HPENPTQxBSlwMvoQA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uXtEJA/UG6zD+u4K09N4McSnneBdnF+wpfgECX7SicKdJ5r5QWRWqa8dvAYHXYdUNp1LMM00Psi+PR1yTXn/Oln/wu5+YUnmFnewIF/vPhezYd5EIDH18sAYZBM+M7iDgl3dDa86y/ulyvKPovNR2Scpo0SE+P4BrHqD9QwIpbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mLY4G3xb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YAUPe+NM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mLY4G3xb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YAUPe+NM"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62K2XhuI1191276
	for <linux-sound@vger.kernel.org>; Fri, 20 Mar 2026 12:34:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VPR4PG726A+qE/vUZXZhajFmf3xyRoeSJ2nfcoJVvGY=; b=mLY4G3xbvmJkNoxA
	PAueJbXjlseO/EDkSMr6FR1cF+DPc/5Qphkndy8gatV7tsyKHH1MbZPJrIFo/Iq0
	lChnXM1YEyeppUenZR65D/kdfKedA7eh0eCzABjsaP2Bjs+rKM8U5R7lXwB2+M54
	fAixw4bJ89uvyLfi9lG68vspUSaD01Eew0prKQGLT0QrRuxyJAflUhP5SMsLJfly
	EretMRoYn7Kmv2zONKnrYF+SiuV2PAPsgWzu52PdEGpdsKEP4HBG8cDGGAi3YAjQ
	vO/Ko1D8CSu5YfvKTP2FIVJoO+A+xz0BrVNBJbVU6FEm9VjcTIcRmMbbvThopYii
	Hqluig==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d0pvhtcsd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 20 Mar 2026 12:34:18 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5091327215dso80365691cf.1
        for <linux-sound@vger.kernel.org>; Fri, 20 Mar 2026 05:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774010058; x=1774614858; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VPR4PG726A+qE/vUZXZhajFmf3xyRoeSJ2nfcoJVvGY=;
        b=YAUPe+NMmPSjbOTT+cCZSmyS5tcWcQ3hOlTnL5m6M6hcB48lsdnLKc+LUD9l4//iL5
         mf0Apwd/ZukjhSYalJtcfHFP714e81+tE7UOQ3tYn8NogwxAqGuTH1RhdLpNxHUYq84C
         IDsxD2wjW2BOeINK20tux7fkRYb89KhLdtu8+a25XlyXdRPVp3gHrswK5eDD4I3Gbdss
         v10Hea5Khmm3USE+yupBXMQalCnJfTZ2/tWHahIh+a3fE4bb+YRqkVXy6dSRh9UFOXeI
         lpH0qFOwEejTJeBGbmKnJT4+9mwJJ9/pEx6U/pmMlZFwYpIM73Z7QrLqaFA076FiOwU5
         0V9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774010058; x=1774614858;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VPR4PG726A+qE/vUZXZhajFmf3xyRoeSJ2nfcoJVvGY=;
        b=lQKKKjyVdLMBpjDgKmwF+Q8Bre5qX12T4BBK5b6uhoD0/17HqQsqtshjtzxTlZtQab
         1ZWXolbwvcgRbMl21JW6BFg4LDuRrC5LQXjLbDWKTtViFkoF29heN7SKzQT8sJRjZ2mb
         Wbe3TKz+KhwAqHa7wmZ6AeegczuBuYvvfEL+0a/59DdsfyigqpqPFBAiv1ZsdXZShE6l
         XtX7MhvQZvetq7mvwRmwJJlym2xAE9GaX++tbs0vifjVuXMJOWjbRfwnXwxDf1anOshR
         U+GMC1F8heKCRlVKUI31N2r1Cu1zH3bnCA4WRZLaGEu/eFiw6IzfexYVRtiAYC4D41Wd
         h9vw==
X-Forwarded-Encrypted: i=1; AJvYcCXz2Hv7+r2NKLGI9+pdmp5Z1oJ7PLT9YHTFj7FCuiPsMMTokiJPZiOxX447wSvS13A1Qg/3mDJ0PiDMsA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzR9mQKnpAy+tKvcBlzBa9gxR21YsL0Hf2y4qRTrAalW9UcpsnX
	qAwjAkWxOA5D/vPcP0T2Rmt+GpiJXz7cW+fGZx0D/D+ZeAxSDWZSypfzQVEU8J6CZ6Tkum/diM6
	rG+8tHwRsEl9l6tbRf0/2JtJGPzFo8Ki5BwWEKFbsBITIb8Sgg1/XHHhF0D/N7Zs8SQ==
X-Gm-Gg: ATEYQzw93fY94a4eEh2gjJprmIOuWp8+9kZFHtAuaOx4M2pc8Y8dofnUxU7Mg4ZZ51i
	gUb90y37Phm84LNXQoeGhzA7KwGBk4Mlu2aHdQEwBsWdH7exbxCDqNtJ/vw/OqkZmp5g9QafFCR
	dI7yuxJUG63wnJX4qR0MWJrOufcxbjuO8yclDkC3cpTHT57Ah2U1p2Q7rPOPMF6i0Qm6jaV4+aO
	DCPY/MTcIZHt4tv7g7vWq/au9F+FgEJ8fnnVnHTHR425S+cilWaz5IJCaWvBgSDJmZEOai4INlK
	013j42gktpQWrn7EDpQ+fonycgEVM4IfOWOVx2+nbPqMU4pljLxo9gJY3Y5vwtX+yqTc4u/IfoV
	VPmVENfCmQQwZb3fiGit1wDVHEj7vPF3EpuGVNqp0viGuvtbM
X-Received: by 2002:a05:622a:354:b0:509:1dc8:e9e5 with SMTP id d75a77b69052e-50b375252d6mr37859621cf.34.1774010057597;
        Fri, 20 Mar 2026 05:34:17 -0700 (PDT)
X-Received: by 2002:a05:622a:354:b0:509:1dc8:e9e5 with SMTP id d75a77b69052e-50b375252d6mr37859371cf.34.1774010057200;
        Fri, 20 Mar 2026 05:34:17 -0700 (PDT)
Received: from [192.168.68.114] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-43b644ae619sm6863826f8f.5.2026.03.20.05.34.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Mar 2026 05:34:15 -0700 (PDT)
Message-ID: <94641371-ad9e-40f3-bf5e-c97e38891eca@oss.qualcomm.com>
Date: Fri, 20 Mar 2026 12:34:14 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/13] ASoC: qcom: q6dsp: Add Senary MI2S audio
 interface support
To: Val Packett <val@packett.cool>, broonie@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mailingradian@gmail.com
References: <20260309065137.949053-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260309065137.949053-9-srinivas.kandagatla@oss.qualcomm.com>
 <a7058f7d-b9c9-4f4b-87af-7775a2e756dd@packett.cool>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <a7058f7d-b9c9-4f4b-87af-7775a2e756dd@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=F95at6hN c=1 sm=1 tr=0 ts=69bd3eca cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=R13D1CNnDosyH6-BdusA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: xJgwxcUjK9aSBZ_w060l-uSqeSMM_niB
X-Proofpoint-ORIG-GUID: xJgwxcUjK9aSBZ_w060l-uSqeSMM_niB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIwMDA5OSBTYWx0ZWRfX3cM7vwEEJAdD
 KMXAk1Vm21sTPnp8CZGaKkOBK6Mc72lqZXTLJ32txspZPlB0coyU7u9IZ1gCN1iDeXQbvRiNhKc
 zgdAhrl+3VAiGpt6lk8qejv0TpEMWHxDm/Xrm4AQshtWNXIUcXXY8S+NRJlsSGrQ+gQXPDvoKbB
 litJ+b7WbiExjZ1SEdUF+8DkbKi0+FCwiwqpcR57Of5i1Ug6unSYOAIj8kkAsEHtjF9zjEZf3CK
 3dxlyDhkP/gDfInF+X7TwDV+uUg0Hy6oXaxDMiIYsSdf9u8duTv7W85GDfWh0WmrSzvvUsdHK1S
 u+qX4XBGco/PfklviCFW9mQGU/Nw2NqOrQqnLukQq4DH3ofVUTT1w63SafaDQyJqwjLh9VBXuwj
 3LxIzNRSzjy+tZey1nBqVjhN+Sz/G+FSyEmHRz5Vbo1SJjXntvBiPFKc0K6AQOJ27L8skT4z0kT
 fRFMV8NBwHE3/Q/gsqw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-20_02,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603200099

On 3/19/26 5:17 AM, Val Packett wrote:
> Hi,
> 
> On 3/9/26 3:51 AM, Srinivas Kandagatla wrote:
>> From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>>
>> Introduces support for the Senary MI2S audio interface in the Qualcomm
>> q6dsp. Add new AFE port IDs for Senary MI2S RX and TX and include the
>> necessary mappings in the port configuration  to allow audio routing
>> over the Senary MI2S interface.
>>
>> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> ---
>>   sound/soc/qcom/qdsp6/q6afe-dai.c         |  6 +++++
>>   sound/soc/qcom/qdsp6/q6afe.c             |  6 +++++
>>   sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c | 29 ++++++++++++++++++++++++
>>   3 files changed, 41 insertions(+)
>> [..]
>> diff --git a/sound/soc/qcom/qdsp6/q6afe.c b/sound/soc/qcom/qdsp6/q6afe.c
>> index 43d877322bae..7bd40e32f758 100644
>> --- a/sound/soc/qcom/qdsp6/q6afe.c
>> +++ b/sound/soc/qcom/qdsp6/q6afe.c
>> [..]
> 
> 
> One chunk is missing for this file, adding it to the big switch in
> q6afe_port_get_from_id:

Thanks Val, I will fold this into this patch.

--srini
> 
> diff --git a/sound/soc/qcom/qdsp6/q6afe.c b/sound/soc/qcom/qdsp6/q6afe.c
> index 7bd40e32f7..40237267fd 100644
> --- a/sound/soc/qcom/qdsp6/q6afe.c
> +++ b/sound/soc/qcom/qdsp6/q6afe.c
> @@ -1783,6 +1783,8 @@
>      case AFE_PORT_ID_QUATERNARY_MI2S_TX:
>      case AFE_PORT_ID_QUINARY_MI2S_RX:
>      case AFE_PORT_ID_QUINARY_MI2S_TX:
> +    case AFE_PORT_ID_SENARY_MI2S_RX:
> +    case AFE_PORT_ID_SENARY_MI2S_TX:
>          cfg_type = AFE_PARAM_ID_I2S_CONFIG;
>          break;
>      case AFE_PORT_ID_PRIMARY_TDM_RX ... AFE_PORT_ID_QUINARY_TDM_TX_7:
> 
> 
> With that + adding senary to q6routing and to SoC specific sndcard,
> 
> Tested-by: Val Packett <val@packett.cool> # sm7325-motorola-dubai
> 
> (WIP device, patches coming Soon™)
> 
> 
> Thanks,
> ~val
> 

