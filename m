Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B77B3A872C
	for <linux-sound@vger.kernel.org>; Wed,  4 Mar 2026 11:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772622651; cv=none; b=GEoOhbhuy0yqt/e9A6hELwAjBstDgUzsqhcFIKDBNSt5whnkL4kelnYHvkmUpM8r2OjZ3x5RDvRKqLjgsKN8OByf26rnWS9vpVXVALwz2ldrKE4DRKBVUjVL0IrNAeJV5Ytut6ZAAJ2ueYZza7KshL8rBPoyjDN6q/CXL4q4zLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772622651; c=relaxed/simple;
	bh=8q4I0+K3Qd+pKpBHKEg0QmrqNR8wj9CrheJKZvAvxoQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B3ZYO0Oy5qOYqwCthG/CmdYLuV9j/QbE5dRURpV0boYY4WgrkRCeEHvqZ5i9kFTka7gt+nAnH4VxpUil5SOYWgHJyP/wLYR8Xe+YQX9Jb2twRfnC/fN1DZKQNz1PmHYivh8ccP/0XvBS30B7PytlpCLxLcSC/86wfIX7xZT3hdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PWDaLL3h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZrV67rsL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PWDaLL3h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZrV67rsL"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6245ST4s3110382
	for <linux-sound@vger.kernel.org>; Wed, 4 Mar 2026 11:10:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MCCLwpZefcWyGX97YnB9vElnqX71UTAgAeEXx3DfaRQ=; b=PWDaLL3hXJ8B+B3K
	9BbHZWwPBW6Z86Zthjxd3PjGFDOXiE0Zf2cwHaRhIJ++rZpYaZwOcNUEkzsBPUl9
	BosBeVr4+RZa0QEMEbcFuWlnEF9dImhBz86+8iws1Zg2fMoaaoWC/QBL5PsKzMzE
	x/9ECkbkya3GvPuIFGj0pRVyRBnrpqFbRq0eEfk48E/hHtwe9eo+x/xK9Q8nWVas
	UJJvNGbTkBycDYOpxWMGlPKNGWqj26mBwTnTh9svxquaLyfYRaHT2UB+aj7TPnRN
	dBCiThI8kdAMDMSVOqFV2LcmBZqnL/eUrBqzVs46h3Y6yLdsAz3QQK2o8kxAOMfe
	qKHv9g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cp5h2awjj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 04 Mar 2026 11:10:49 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c711251ac5so4177586185a.1
        for <linux-sound@vger.kernel.org>; Wed, 04 Mar 2026 03:10:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772622648; x=1773227448; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MCCLwpZefcWyGX97YnB9vElnqX71UTAgAeEXx3DfaRQ=;
        b=ZrV67rsLlsPYb1KROEKB26zUT2RXppjaV89Qjp1Y8DOO9OK/nN2seoiG1A7VcfHtuU
         bDOEWzFfU6km/4kEQOp9fzdLuwPY1ZAX5PWDfzGaKQYiiJH+R4HQpPYDfpyRP0rnCLoG
         HTwseTJRq4zUncnYxnWGecPCkasCidMBHCa63g/EZ9d27NbEaYHpFhjlJAyeYBuaGjVL
         IWoLwlCstCXWILryow+acBjHKgICjF1PB1lYFNAFEjbvjW2mlktzdQn3kvzgG66ln6lH
         vgTOxXZKeVu1l3MfB9xC4EoVIb44uIkDq1ssgfaxAVJCAVtIDeB2o+64ppPzWUuUVS6/
         0J0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772622648; x=1773227448;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MCCLwpZefcWyGX97YnB9vElnqX71UTAgAeEXx3DfaRQ=;
        b=EeEHx+NQjvel/8K7v/eBCgaKfDVSP2E17PporjtuY0vuBH8MH/nHZlVa0MnSQFmlPW
         1dAGSSOvuQk3/kCnaQ/GL35CKYggcTIp8hRAPiTjy4RWFtTAaZs6jhKHKUWa7nC6gh11
         Z7YxQh/8RqBSKL4cepbuTTo7hsCF6I/s75fBEWMkAQkf8EhxlwhOcTOkFElx54WJuPn2
         JMODM1EcacTT2O9WmkJCgM9sdaV/8R1rsbtwB8QBWoeCFq7zm8sadFQHQLZoxkJPdvkD
         oLQIR4luIQDBmtM0BfPu+IxrMHLqJ5kR1o75mySa7m/SM/ZvjHdG4tx49ULeqWjCN7Wy
         XRJA==
X-Forwarded-Encrypted: i=1; AJvYcCWGtoB4VimvQ6PYOMUxjZvyxinW1ycmwe+NY//aJPXEeGQFf0acR82Zty2UmWh9t/V9N5x+rg58cZ4Zvw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxdNFm42si65iUhjIGqYDKZRC3J0mg91qeLdER/vbAWV+uIl3Zz
	hMXX8FjBzi5dp7QI40FCThjMGpiWOUwNTMPs77EdT7vQNrYclPafzVsJV+SOl2wXOMVqCVQPTpT
	0WNs0MioH8NXr+86UsWU9O5N6vOjP7t2phMTrsteTLwNguCl006gnUjdnQsrLp6ZVcw==
X-Gm-Gg: ATEYQzxRbRzy45Mfe7J8r1wu8GmWYge3fEKQx9QZf0kkP5AzPSWDZac3Se1wBNms0rH
	8br2UF4Qo2URKkRNrkz2NRCAx3BdCZysCeKN+2O42ZtOOmWDD5h26OZ/nT7/am8SYjyzyUGB7aw
	6bPKf4Q+LrhQ0gTwx6XybBnPhcCLOiICXslm24C7amcSvXyCRkFU+xziuldfgkq5xfmHt5NSR/9
	za8xj/Fz/ikjxicmrvnylAUXGbD3SswBg62zUiCMDEkaLC11inD97utxpWFUISfbZQKmV0iLleo
	XafLMtaQ05levBGPx8RydJ1uPu9baJhXOQWE83zmfiVoL8XklJghDKFD+NssKWQMTObbcHwywE+
	B3GgSacmGzRLWMc/zVAaTheqFt/Ad9THr4SwC3z4X87jbXlga
X-Received: by 2002:a05:620a:1a08:b0:8c7:6f8:ae4c with SMTP id af79cd13be357-8cd5af774f7mr178536585a.43.1772622648408;
        Wed, 04 Mar 2026 03:10:48 -0800 (PST)
X-Received: by 2002:a05:620a:1a08:b0:8c7:6f8:ae4c with SMTP id af79cd13be357-8cd5af774f7mr178532685a.43.1772622647870;
        Wed, 04 Mar 2026 03:10:47 -0800 (PST)
Received: from [192.168.68.114] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-b935aee56c2sm744482466b.65.2026.03.04.03.10.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 03:10:47 -0800 (PST)
Message-ID: <47123dd6-d17f-4d82-b8a1-e04a50e73a27@oss.qualcomm.com>
Date: Wed, 4 Mar 2026 11:10:46 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/14] ASoC: qcom: q6apm: Add support for early buffer
 mapping on DSP
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, broonie@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        srini@kernel.org
References: <20260223180740.444311-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260223180740.444311-15-srinivas.kandagatla@oss.qualcomm.com>
 <3b4dfe95-9043-4682-8fee-7588fa1fde37@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <3b4dfe95-9043-4682-8fee-7588fa1fde37@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=JqL8bc4C c=1 sm=1 tr=0 ts=69a81339 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=29lxGkwPwxXT-BnxCXIA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 1iEW0_iEaumPEMYRxEhWxxxttIEJ2OxD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA4NyBTYWx0ZWRfX3OKbJDpyo9qM
 SAhrh19iNZrq9LYIGwkwlW7tooUBHN9OQuBkms9qbUe2nXShkv3nofc8fcD3uAxCLwCHlHQ6IzX
 /PknoK1VkwYKKKVXCZpVO0DZ3zxAFZDSv4mhPVWvP9MjWRaSwPhofFVXBJLGtIEsL38mvjN+FEB
 q1XL0lQKDamoMT9ft3oQ/312qH1eYAbMBxvuxyz3VdwWdIe6JQh6+f79CNMx8PQ43kKO0PDfee2
 1BIIEyTFKPkiYw9Q4Hm7ineSS1MvzrRv/tCIHNvwWpa68UYO1hVqtGmsVH5W+3FQoHiRCDytitd
 yO6bN569TxOzuahn4DDRyqrp0Vkn2F3OUMSPJCuWcX4cAXm8bAjdKCmdpo7sTw7fRxC8KYKvQH9
 1LOouHcZxBofesUDQSLfJHu6fey2JUEUZssO863lZ8KTsAgjHWaI3T2GGTSRTcSd0EW4yj7zeli
 GpbR1OurB+KlcQOSJkQ==
X-Proofpoint-GUID: 1iEW0_iEaumPEMYRxEhWxxxttIEJ2OxD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603040087

On 2/24/26 10:16 AM, Konrad Dybcio wrote:
> On 2/23/26 7:07 PM, Srinivas Kandagatla wrote:
>> Buffers are allocated on pcm_new and mapped in the dsp on every prepare call,
>> which is inefficient and unnecessary.
>>
>> Add new functions q6apm_[un]map_memory_fixed_region to map it on
>> to dsp only once after allocation.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> -int q6apm_map_memory_regions(struct q6apm_graph *graph, unsigned int dir, phys_addr_t phys,
>> -			     size_t period_sz, unsigned int periods)
>> +int q6apm_set_memory_map_handle(struct q6apm_graph *graph, unsigned int dir)
>> +{
>> +	if (dir == SNDRV_PCM_STREAM_PLAYBACK)
>> +		graph->rx_data.mem_map_handle = graph->info->mem_map_handle;
>> +	else
>> +		graph->tx_data.mem_map_handle = graph->info->mem_map_handle;
>> +
>> +	return 0;
>> +}
> 
> This doesn't return a useful value today, will it ever?
return type should be  void.
> 
> [...]
> 
> 
>> +		case APM_CMD_SHARED_MEM_UNMAP_REGIONS:
>> +			apm->result.opcode = hdr->opcode;
>> +			apm->result.status = 0;
>> +			rsp = data->payload;
>> +
>> +			info = idr_find(&apm->graph_info_idr, hdr->token);
>> +			if (info)
>> +				info->mem_map_handle = 0;
>> +			else
>> +				dev_err(dev, "Error (%d) Processing 0x%08x cmd\n", result->status,
>> +					result->opcode);
>> +
>> +			dev_err(dev, "Memory Map region %x\n", rsp->mem_map_handle);
> 
> Looks like a debug leftover (also in the below 'case')

Right, will fix that in next spin.

--srini
> 
> Konrad

