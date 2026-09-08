Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B9C75947E4
	for <linux-sound@vger.kernel.org>; Tue,  8 Sep 2026 17:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788888426; cv=none; b=LD1zo5zrZF1GoRZ7TkxoyBecPu5evgl9x/WOfJszNDfsJed10FefgPowPf5LGdPCU+YUNPb5kGnvEtmpPnW1APmXDVooey4vfRmkqDYQTQ5S2w4cMKtVMpt7bsekwCXo1Drjnj5CFcvgCiFZb//pntPeN1S4X0+yHUI8iWDverU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788888426; c=relaxed/simple;
	bh=7EuFd8qw+NXi6D8T/yq0hMg8LIndzUrKVacIig9ZqHk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KjYwjoU1AMYzYV1WSw0zUTvZoo7g3vOn5tAg45neOEG/tsqPakjxT4DgGgmBmRFTAcIcHfk03KStx1UxyocIv8m4I+RUb+W6Co8I3ttuIszSuS0QkqOnj9HMof8tzT5a7UD8a+GGpMulk97JCT9v8ESuvvi1iR4QgKJg35vZNpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VAVS/Zp2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KnpP38aC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VAVS/Zp2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KnpP38aC"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688Fdf6N360379
	for <linux-sound@vger.kernel.org>; Tue, 8 Sep 2026 17:27:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	amMF2MvJ98Lc+hlX80B9g6sPIEnWibvTt2OsLDuR2vk=; b=VAVS/Zp2G8+Ynn+Q
	FL77+oMmFU5gJXbrUc1zxBhnxoyi9qMj9fQNzs/h2bgsfBW2SGJrcUMsXchXzu0Y
	XqpUek/2xaFqvRM7bxgsIBuE5YHPSm0Q6taN77YnbCtxuXov/AWUFdNiJ3UTvaaD
	MoGnFRPkL5cIH/kZRMjgF0d8gqI6YVZvaW315GxLRPfWLa99pb6vklhf0s5biJTs
	GWvdtEuJKOnj6vMNvWV/umnMBxCNI/c1UZdqY3swDroHPvbs1BMjhgoN1ltKlDOj
	5TiK3JwkzPczaENb8N3o8Mf2CtBoBEngvMtrWOjo4E9G/HrqRgKcXjMirx72rnSq
	3U6m0A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjb0pbbck-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 08 Sep 2026 17:27:04 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-398dc3d8f0fso5877648a91.0
        for <linux-sound@vger.kernel.org>; Tue, 08 Sep 2026 10:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788888423; x=1789493223; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=amMF2MvJ98Lc+hlX80B9g6sPIEnWibvTt2OsLDuR2vk=;
        b=KnpP38aC6/AdSyMq9gsRZYGSgg4j42Wp1R+ipTJIevnMvq5+mtMhFeHdixt89uQ2FH
         PqtVyZLjUzPhHvvpCrZxO8P7Dum38Auylu9u5WgT2XwBQsRylPX7AWqN8Wd4tM+dbhuO
         uGgQXfxgFmIRvxREB/NCkHxpmWuvXy1DlE5tiBWR4bj0yo7TyulEFRmxk+ylN+ahnCy0
         LgAbvWxXSHAMa/RjSy/fR+/vt+0M93L7iwEf6y0yJP9Fqku7jCleVdU/wbJukIWjMuyf
         elBE7So3m2FHN41MnJcCElu2HmVLyTJOKauS57yzn7/cTyxGPALMzP7me70SnsPUlP3x
         T6ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788888423; x=1789493223;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=amMF2MvJ98Lc+hlX80B9g6sPIEnWibvTt2OsLDuR2vk=;
        b=YFvD4uhBcfV8JvaGSJjNHWZUcmRGEfJOPgFc8HKM6WeSJBu4UGRWk9T88zTdDNg2Mg
         1Gf61rW4Rpxu73sKz01aztTzrRUyaCetIl5LnnWjOqqZXxl4u2SnzlYe+/+ldKbn106V
         D8dT4dthZVQnlAxr5isk7xDDUkLDNMe/s7JyGSWgBgdLX0qVZ+RtAUJgOaSSPzycDHd4
         DWyM3BMBz+6sRwguWhK8ScrF9Ei1j3NDVBcVFUXTa/2nKRd+S/D+F/gJP0Amd6AZCavf
         oPgMXW5pk0y08KrJcn+yT/JfM0v6deZeRxUg16LHOt8tLHRcI4PyjhBDpvqiJLw2Ef+A
         2PyQ==
X-Gm-Message-State: AFuF++lACo59+J5LXyShXptJvi75tU5ERGoTWM5HDnDWa63aoZydSK5v
	Pp2rPqWNRZd1QP4cIwpS1+oP5I0tY9tF8dtDHIRL5O+4s8u4LIXNS4n0aVJhzPTP0E6SCUQIc3s
	8snv3TMk2130ajo3M5GwzOStcrnDGJe7ZiAz7Nvw2rFQ0QVl3Cr1ImAtp/ZKCuw9S8Q==
X-Gm-Gg: AYBFou3f70WySRqc9n/OGYhIkgGwX1rpSjiJo0zue+ZSlmI1GebUSul1MYeXnm9yn9O
	At/XGBhmlqzfTW5KBFaAnZXmJ7i4Q9kos1Xb5LYhh5q9akPGgaDmKif5YR2XaSu3IE7tKSgFRCC
	zpVZbFz0tSob0xdcPIHtOPMzKYfPNiuZtgZJIB39M5vNZoOe5nEUu/XfSpAzz7ckIIA1iGL4J3e
	fMLkIWnIApYeAFqg8YzzXeWwYjQk8fcjyoQzXmm7dd3Z7/RoaMvwrQ8Npmh6VDI/QgvJUCInCey
	x1vZSTO9SgPB+4mkrPuAEEW3pzzNfmhkfTY54cGkTy6x3cz81SiXOP49b61Ppu1fzS8ul4IhXZR
	3QXmq4jeXeZQz8LTCZUiQEEhnwQocfw==
X-Received: by 2002:a17:90a:ec84:b0:36b:b903:994 with SMTP id 98e67ed59e1d1-39b07f44dbdmr41175737a91.4.1788888423321;
        Tue, 08 Sep 2026 10:27:03 -0700 (PDT)
X-Received: by 2002:a17:90a:ec84:b0:36b:b903:994 with SMTP id 98e67ed59e1d1-39b07f44dbdmr41175692a91.4.1788888422812;
        Tue, 08 Sep 2026 10:27:02 -0700 (PDT)
Received: from [192.168.1.6] ([223.184.127.216])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14324356931sm57765170c88.4.2026.09.08.10.26.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 10:27:02 -0700 (PDT)
Message-ID: <5ac58cd1-2ef7-4ce9-bf97-dc120ddb9f20@oss.qualcomm.com>
Date: Tue, 8 Sep 2026 22:56:56 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: sound: qcom,q6apm-dai: add stage-2
 (SCM/VMID) access model
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260826-a2a-shikra-vmid-v5-v2-0-c3dc62354eee@oss.qualcomm.com>
 <20260826-a2a-shikra-vmid-v5-v2-1-c3dc62354eee@oss.qualcomm.com>
 <006617c6-e3b0-4a3b-85e5-6b5af8f11879@kernel.org>
 <51413da4-eed6-4251-b2eb-5d2ad8cb36ec@oss.qualcomm.com>
 <c97d0871-0c89-4590-9ad3-4d3859d0522a@kernel.org>
 <23d6166f-50f7-4d23-a700-ab738c1e872f@kernel.org>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <23d6166f-50f7-4d23-a700-ab738c1e872f@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 9fhCMzgSEfO1uduy-0ON6q2xEs5Fk_mg
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE4OSBTYWx0ZWRfX3a7djQrttphz
 qvnRVfu1FeUJSD1AC5rR3UI8BUDptPgfT6BWU+gYPaoZWbI2BckrM++Wmo9t54UOeTP7pzyoVdA
 CA7ezdwj9chr8ppYTfekIuUDfKvWkXo=
X-Authority-Analysis: v=2.4 cv=HL3z0Itv c=1 sm=1 tr=0 ts=6aa04568 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=66SLN7faITJN3pPvMqR9OA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=jJ3HrK66ljBcDBb3hHsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: 9fhCMzgSEfO1uduy-0ON6q2xEs5Fk_mg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE4OSBTYWx0ZWRfX57HgH67vmo9A
 tC7eaCFg2XsdT6HIlg+bTTjF2GrneflhlbD1G83czTDmLgi2BZ5W15eYXwwmcPAw4vGpsu46y7i
 pbQOtIAk1EYfRZkcAnXSoP8E1hAj5ZuZ78A31vJExSsJYhcvb9T/XGAmKQQMgbwqhoOJLwx6hDb
 Eptnu0VovzI1HRUvEjt0LlJL66D5YFCY+FDwhqU+hmwDlv4IxfWwlzB2eZMg8OHfHZdjtn6/tWL
 Vb9G5+4WWk49+Ie6jWSX2efXFfXVjl7HbFfKKuRYBtiSHTlf4n5rRkhIw020ruG2fi3MLLLXHVQ
 1IZ8CZIAEsYM80oGwWb8hoq86mkCTRa2lwzDnjMu+pDJoO7cVnDjNJGlt3QqJXYdGt39Kucvdv3
 wiq8eRtjyR5QGhXYDt+0zzaEviREmzwP/B1HinNAXvKI0XjTGRq6Hr5RSe7UALGL9P7pw+4GBZd
 VlLetACFGyDO7vRqopA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609080189

>>>>>    
>>>>>    properties:
>>>>>      compatible:
>>>>> @@ -20,9 +28,42 @@ properties:
>>>>>        minItems: 1
>>>>>        maxItems: 2
>>>>
>>>> As I said last time, different hardware, different programming
>>>> interface, different features, so a different compatible.
>>>
>>>
>>> The APM DAI block is the same packet format.  The driver uses a single
>>> of_device_id entry with no match data; there is no code path dispatched
>>> by the compatible string.
>>>
>>> The iommu vs VMID distinction is a property of the memory topology,
>>> not the DAI hardware, and is already described by the mutually exclusive
>>> iommus / qcom,vmids properties.  The DSP identity (ADSP vs mDSP) is
>>> carried by the GPR node's qcom,domain property and read at the send
>>> layer — the DAI node itself does not need to know which DSP it talks to.
>>
>> I am still trying to grasp it. You have a device "APM" and it accesses
>> PCM buffers or other memory in some way needing IOMMU for that.
>>
>> Now you add something which you call EXACTLY the same device, no
>> difference at all, same "APM", but this time this device operates
>> completely different, because it does not use IOMMU, but talks with
>> firmware via SCM.
>>
>> Well, I really do not see how is this still exactly the same or even
>> compatible device.
>>
>> The way device accesses its data is part of the programming model and
>> different programming models have different compatibles.
> 
> 
> Additionally, as explained to me in off-list channel, the qcom,vmids is
> not a hardware property at all (because hardware is the same), thus does
> not look suitable for DT.
>

I understand the concern. The qcom,vmids property describes which 
Virtual machines the SoC firmware has configured to own the memory space 
on a given board. similar to how iommus describes which SMMU the device 
is wired to.

There is existing precedent for this in the tree:

- fastrpc (Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml) 
uses qcom,vmids to describe remote processor VMIDs. The driver reads 
them from DT and calls qcom_scm_assign_mem(). The compatible stays 
generic (qcom,fastrpc).

- rmtfs-mem 
(Documentation/devicetree/bindings/reserved-memory/qcom,rmtfs-mem.yaml) 
uses qcom,vmid the same way with a single generic compatible 
(qcom,rmtfs-mem).

We are following the same pattern here. Happy to discuss further if you 
see a difference between these cases and ours.

Thanks & Regards
Ajay Kumar Nandam
> Best regards,
> Krzysztof

