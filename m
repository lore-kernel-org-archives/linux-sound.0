Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7490A38F248
	for <linux-sound@vger.kernel.org>; Thu, 14 May 2026 10:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778756120; cv=none; b=JL2YoDQHzEIC4bZU/e58wFm75wxIE3pmTtMdxbCwas1aNiQM3ZerrKrfwnulkIjA03ZcbETy1WZ0uprA+YBMqvuopfP2JApOhxsSjG4L3vbitOziOU9YPJz+bGDtjm2HFdvjPDzzI7j7yfh1A6hf3Vk3FFZjUlVpfC2Tcbyh868=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778756120; c=relaxed/simple;
	bh=kMx/J9r7WnLfGWxPaoBGcSxdF3FD+RiowqHAxhNB8XY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oWPMX4Ea8UGzrDhz7iY6jpw/yh3S+nu91TuK5B3B23kVfRStbUA6V0qvGZypd2M4o/jhBPnK5vP0wB+xQznBhcFGY19uPZ3Ush/cYiNHkOY0X9YrFn9ZeEczg8kfSO3FpV0WNu+uTzGkGEFJxn7u60yp6api5/H9pPyGncSAc44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aA9HlGX0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j7ZIIk1+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aA9HlGX0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j7ZIIk1+"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64E9k9rQ1990821
	for <linux-sound@vger.kernel.org>; Thu, 14 May 2026 10:55:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/VaAgEDcKuwipa1EtcRKH0tyrwq9hyUOCh/ncQOk15A=; b=aA9HlGX0+x/vmO1M
	0/bwdFXvoVQkh1AdtGj8ArfJH2/Dd/695f4ekzQflgxe9psVIm9mAQDs9z0JRA/j
	iYqnO/3QjTtsnpPducprCpG+PJytux3dhPyYsi6FDNEqKtnSAinksDy/TNEOH0/U
	zCmycVRdy64DbXNf1pBJf0eZjhfYQVoagalF4IvP3Cf6tiHMs76ifgRecuE3hnJL
	HIIbKK62Rl6hv9KMIsYF0hfmyTGSMgcUu4B4Ed97FwOF1wyNxZhanUq6Selsu5Le
	N/VwXjn5C+haGU8sCQuwVOW22/B1ekaZ09rWSvjbq639Wfbh4LqL069wsJ4Z9CM1
	nmJYGA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e513gaaw4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 14 May 2026 10:55:18 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51494d74d4bso138511481cf.1
        for <linux-sound@vger.kernel.org>; Thu, 14 May 2026 03:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778756117; x=1779360917; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/VaAgEDcKuwipa1EtcRKH0tyrwq9hyUOCh/ncQOk15A=;
        b=j7ZIIk1+7whHq/49ZBPW5rR5UXqqzYLqRRSA/o8VBmqFeLSImt73Se+xmdP2JFHFx6
         Vxn3EPXqindPcOHLZgQDcTlVc0wDJoDSXhws7iPSRvgH+LO2AIfzKmnnPI6BAf18DFJZ
         A8hVSDmqmjG1IC/fcJ8qxmfiZraj7rNXxdcHSptMiVSn0vujZhonj5FDhHBwF9ULgDpz
         L8azYwri2A6DtY6/ycoVGeBMxzGqQ7QfRMTgDmPoDOdfhjPruDuHKx8ria6Xc68EAcyD
         n5dAwEo+pDSbjUxBd6+IpHPOSj+NpDs4iwYm04WCc4KfYzJQzBtkKvjkqf/1ebZi6NE4
         yDQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778756117; x=1779360917;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/VaAgEDcKuwipa1EtcRKH0tyrwq9hyUOCh/ncQOk15A=;
        b=rNYMbuavce6lRnNz64PekkdVnKXCpMKqlQozoI+s0qMJBpN9adETRfj2ghdrvsl07l
         z7XvH+BXotFCVLIBhnzg/BETQyBGOKrSvJtuXSNLOo4RjqyBuyonmMTcchGtaiVR6IIm
         L2A7laBcxbzFf3Uc1sdjD8xwVY1x+GyQgmfIyun1R7fGg+rj1YkMSWBOKJbEpCvdD0k5
         L+pPVoRHaRVB4JI5qBfg/yVj3tTQBu+Za5wkacgJaYLVmvGEDuZRw0SZHVcuGysKe946
         Oz7TWAga240lraJIDkTM+qJXqPZCdBQ6vC8j0nu1KTb9AtNxxSHA/F3qpv8Omk0OoK7c
         gCnQ==
X-Forwarded-Encrypted: i=1; AFNElJ+7pq1Nl2AECu/JjnI0g6oQMo+zCw/PEztTeSsSstWP8jfczwaiomagrBOPlrOYM0dTBpYsF/bz1np/6A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6N7/+lOdxBK2zbJHpEyYMXRYas8cRoXZV99RrEUp7RrSA5pv+
	dqojKYvfiiddxZ0YuQymYNqPYGO81Iw8yZhAWo/mY/PsM7X5Xr4F7spTLPz3DfVi17Z3nFJrsQ0
	j9C/jGTExfjGvLCuvJS+3YQhnIrt/d4VXwNL/MgdyJ3OzLmCys69/2AcNrlqgIN1iLQ==
X-Gm-Gg: Acq92OHAoZnq7IZAKGtBBe95Br5KBOOVUnl+g8cCJg/AgtZn962EMn1PFtm1rhvUf1X
	yGBSUzBLaELo2ZlhShyyzE0nwaq925f8i0TamZykEbh+dSkBtYYjbJOBbJ1tSKrglik0FhmJyUd
	oo1vgB7g0nw/fLnNKRGp7KIAou9vmieW7+D3VcO80YDOJWMJJkTIWzQSpr7xAQrvJf8ytYhXLjS
	92j88rHHQ9VHFmsFoofRmQdJNVjHFWkzyC8wfug1Xbl1BeBwKVI72DYhZrZ78ne/Z+nZ7mN2aeb
	/ZmzxICQ8eoFvjEzwQOQcapmW6oGQ2ItvzDKWOzr6e4ooUPvFPsgOa9rP/bNeDkbwSOHWEPF5If
	YHUPtNNOac7x2u1CPkbvgbthnEqdTyHJnRt+Xg7NRg6QXKQKn
X-Received: by 2002:ac8:1089:0:b0:516:4781:39e7 with SMTP id d75a77b69052e-51647813c38mr14418691cf.21.1778756117402;
        Thu, 14 May 2026 03:55:17 -0700 (PDT)
X-Received: by 2002:ac8:1089:0:b0:516:4781:39e7 with SMTP id d75a77b69052e-51647813c38mr14418271cf.21.1778756116899;
        Thu, 14 May 2026 03:55:16 -0700 (PDT)
Received: from [192.168.68.112] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-45da0a178adsm6433563f8f.18.2026.05.14.03.55.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2026 03:55:16 -0700 (PDT)
Message-ID: <c6be57b9-ce26-4e96-b029-b18798904e2f@oss.qualcomm.com>
Date: Thu, 14 May 2026 10:55:15 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: qcom: q6apm-dai: Allocate an extra page for PCM
 buffers
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: broonie@kernel.org, jens.glathe@oldschoolsolutions.biz,
        linux-sound@vger.kernel.org, lgirdwood@gmail.com, perex@perex.cz,
        tiwai@suse.com, johan@kernel.org, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        val@packett.cool, mailingradian@gmail.com, Stable@vger.kernel.org
References: <20260514090607.2435484-1-srinivas.kandagatla@oss.qualcomm.com>
 <2pe7rk7jhc36osc6i4rxeyw342mvza2m7i4ztsmm6pjgwtlemc@k4gkw5b4jg7g>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <2pe7rk7jhc36osc6i4rxeyw342mvza2m7i4ztsmm6pjgwtlemc@k4gkw5b4jg7g>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDEwOCBTYWx0ZWRfX5lMYBgvoBK43
 qrWjcBJHuZqLogNowHVzVED1wBont5NvHbHsn/wKxOYHPPrAnCvH7ZgzYW2n5j8biGx8hov5Wpb
 8gieBFXSGv1HksCP6p8xwBd4voGr5zCPCpJC69ujOcXRnH5GUWNrIm7UaLA+YsKc3ZajwW/i7hH
 Tmf3bJfh2l0+VglsBBQkMclgq2dtdkAVrJGOGfiADlZI41rrKkN1gAjWXGOrDvXLv4i+nRIHC8d
 YQ9D83+o0iaf7UfgXz0L4DoBSS4oHgz3RTErOU14o6LYrRV+E7fLnr0WcSNdiHNR1oNaS+iGiKg
 gD9w6f6BK3K6oEzzKNMoM+X7sOyMp3ecKRj23y36E1ZWxTzx46PPQM5VyIvWpVX31Dc167PenvS
 jzKS1mbBE7EYRBnnRLm6qPnDNyG6H4DjNk2NDPuxUh6/NvAaJv1RhxyMmi389/KoYzNsbdE0FCw
 QEBngvwobcxuZsqfL+A==
X-Proofpoint-ORIG-GUID: cccewWeGpPLv_iicyPX3OwCymxhhpMIy
X-Authority-Analysis: v=2.4 cv=Iba3n2qa c=1 sm=1 tr=0 ts=6a05aa16 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=gxl3bz0cAAAA:8 a=EUspDBNiAAAA:8 a=_21zWEb1aClpJhlDeeEA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-GUID: cccewWeGpPLv_iicyPX3OwCymxhhpMIy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0
 adultscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140108

On 5/14/26 9:22 AM, Dmitry Baryshkov wrote:
> On Thu, May 14, 2026 at 09:06:07AM +0000, Srinivas Kandagatla wrote:
>> Some Old DSP firmware versions use 32-bit address arithmetic and size for
>> validating the PCM buffer address range. If a buffer is allocated near
>> the top of the 32-bit address space, arithmetic calculations involving
>> the end address can overflow and fail checks.
> 
> Should we limit the workaround to those platforms only?
I would love to do that, but I have no idea which platforms or firmware
versions have this bug.


--srini
> 
>>
>> Work around this by increasing the preallocated PCM buffer size by one
>> page. The DSP is still passed the usable buffer size, excluding the extra
>> page, which prevents the firmware from seeing an end address that crosses
>> the 32-bit boundary.
>>
>> This was not hit before because PCM buffer allocation and DSP-side
>> mapping happened at different points, and the size mapped on the DSP was
>> usually nperiods * period_size. Therefore the mapped size was unlikely to
>> match the full preallocated buffer size exactly, although the issue was
>> still possible. With early buffer mapping on the DSP, the full
>> preallocated buffer is mapped during PCM creation, making the failure
>> reproducible at boot.
>>
>> Fixes: 8ea6e25c8536 ("ASoC: qcom: q6apm: Add support for early buffer mapping on DSP")
>> Cc: Stable@vger.kernel.org
>> Reported-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
>> Closes: https://lore.kernel.org/all/7f10abbd-fb78-4c3a-ab90-7ca78239891a@oldschoolsolutions.biz/
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> ---
>>  sound/soc/qcom/qdsp6/q6apm-dai.c | 7 ++++++-
>>  1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
>> index ede19fdea6e9..3a1be41df096 100644
>> --- a/sound/soc/qcom/qdsp6/q6apm-dai.c
>> +++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
>> @@ -497,7 +497,12 @@ static int q6apm_dai_pcm_new(struct snd_soc_component *component, struct snd_soc
>>  {
>>  	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
>>  	struct snd_pcm *pcm = rtd->pcm;
>> -	int size = BUFFER_BYTES_MAX;
>> +	/*
>> +	 * Allocate one extra page as a workaround for a DSP bug where 32-bit
>> +	 * address arithmetic can overflow when the buffer is placed near the
>> +	 * end of the addressable range.
>> +	 */
>> +	int size = BUFFER_BYTES_MAX + PAGE_SIZE;
>>  	int graph_id, ret;
>>  	struct snd_pcm_substream *substream;
>>  
>> -- 
>> 2.47.3
>>
> 

