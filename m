Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE6B33783A3
	for <linux-sound@vger.kernel.org>; Tue, 24 Feb 2026 10:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771928186; cv=none; b=AJZtn0wJXmiuSGiPSTnsM/1kPtw0E6Udsmzo0pZXF3NMvob1rm2guN3BCeKWLXfjkdzA8kVCBqpUiRHu+AkzPxVnu2O9TqMt5GJMxSwmlJvaZN24hP98bgSluPnKxOiRnC/N46pePQCCPVy0bzITLbwFX5+Ba/VyUIqRpAd+0lE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771928186; c=relaxed/simple;
	bh=tXSUvXCwunQ23EDzKHiUTSeV6Lu2PRx2BSlcE39rkkQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GaYJVK8Y4BoSTr+WnjN7z2X8xOuQCL6oWoUdgSJnEWEH0WFR4WVwRg1s7WDWQuvqS+anriTFlcDSqHUriHWky90o+SLjih55YbICwD6TKMKOvBNWlZvmLrK2Qh52Xu/cV2ywcaJhkNwuFfzLeMf33E9Jg2hAoToaXRO5uYv34es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k55crp6B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bekabLQZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k55crp6B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bekabLQZ"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61OAFVhq3884577
	for <linux-sound@vger.kernel.org>; Tue, 24 Feb 2026 10:16:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SSFe2tWFC3c+9T/6vQ7AhbqX1hOj5PYF7zeMFWf212E=; b=k55crp6BYValQdOv
	gDW7zOqVuoB3RfmpldUW0H79OrK9FIkE2bEfqfgaTqE6EaBNM8fdNTymQ3Xa0Qzw
	EOyFTsJAulgmDqF4Cn4d21JEB8imiLRUdnYqW7BXtIoc+MJu3NqFJKSNeRR2vo/o
	59HZWKnoS7oM0InEhV7YWiQpnjgWdQIHWILurUY12wX3W1FxHKnB8iiqmjSyqUmB
	5Z/qsQTvftbkcDjinK7n3gsQ39tuhUWnz70pitScnPA6/LrXk/nq63+k+g3y74ag
	lhJ+++Pb8pB+OjXobtgUGQ/IiqPZkSFSIYEw/ws7oFctB6pK4313rbt5WREXgtAv
	x/TSSA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgte8ts6b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 24 Feb 2026 10:16:23 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c70cb31bcdso572575485a.1
        for <linux-sound@vger.kernel.org>; Tue, 24 Feb 2026 02:16:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771928183; x=1772532983; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SSFe2tWFC3c+9T/6vQ7AhbqX1hOj5PYF7zeMFWf212E=;
        b=bekabLQZWtPPLLnOTJVI/6/G8HKVtuaCQZiWgLL/WGBTa7dcFwtJepPhzy20cIuB80
         dodEroEuK/n1eMiHm7u+9e9zZk/y4tdGwsdWlqWHFfk6xCTaLBh9sOya0ZcDbPYIG2Bx
         svgo0TxRSysJLch2gMsCQz0neGcwzrLNH1x56xPbSy+fvz6unXYWM12oEkSXQN5gpXmU
         Te/2WC6+XGW9PVtWsSdCqa6E9OayA4qhKFPSVY0ia/Veb/tJTZPM0HP8GQDMxkOIagYp
         JpHV20gD0+eiVzymQnrcLNmddy5raA6MFP+emUFH2vfGCmmhgNtFWu8LdPWMRXlnq6tI
         wp7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771928183; x=1772532983;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SSFe2tWFC3c+9T/6vQ7AhbqX1hOj5PYF7zeMFWf212E=;
        b=JgjAszylS0pPc1WNTEhJ5U1cIf9ywMhPS4ccVtBNDtCVgcl/xWkOnbvpTryfA4aExH
         RHCIA8f/erK7+SBUi+6JDm0nr6UpDNlQitgkoUhZM0xbl6nR4e/cwqhZZI98xE+rA6c0
         RZBAZNC0rakqRPzDnBNc4jHCtpnUe1FzlFstgbOU0/wMZchFj56wkXJrnTaw7VAxRBGZ
         wbak0NU5CBJWVt73gOGIZg7pBywKT2ZhE6/D1a7Wd9f/xggds06GZ9KL8lls6YraFSl7
         W1h/fwPB32As7f+bHrGJy/2uTNIzKzfy07PUuHljVhjaOWFaskmUdW+TMIzeedQCSq5V
         ls1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVQTWABD+v1pfoXDRuSngoHSE4h+9qbtmsmpQBT4g9s2gtlfWvZMBY9Hifg6ub+wG0hBzGHBBZ1ChwfhQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwUHvfgHajK0xVVIMjBgvZ7FprQm+2+JuG8JkMmJjK2OqCog9fX
	Cc2ich4M+Ekjf5YiXu+8djEnvMsZefRl9CvRZn9bf8Jtg2JZgXp9SsN4wqrd66A0AHD3W4DA8db
	HChAaX1k5PvwfwloYhyvq3nUNN0JfgW6fXD7lZyZwiiXv/6sNo/SpVbn3D2giPnN0Pg==
X-Gm-Gg: AZuq6aJd1MWUE7TUKzxXaBW+rA7tuZ9HtZA+C9NiQLHhrbXACl51KryCBRCcK+OWSdQ
	7XsPylKEKwmanuQnZcEOZG9QWbhWf5C6qc/eqUsECd+us5ugsLW2C8aVRmsnA9fnu2O0kMUIxqp
	3cAvVG5+GOmTzz9sureKpxOZe6zFHgrgYKdZH/kxd/nmcpFXTbnPv1HPcKrXM2dZUa8kORAHE7p
	4XmmhcB+U337x3fQ+evbvOYWHujoL1950MaGeQ12eoYWiELF/nmBi5Oi83KH0twIINWidpebTs4
	4z4wyTFHnQeelKRU1iFgZjGM7RrcA8GgeWANmAxDuZCJJavrV3mMkiaheGLgkZamDsGb91r+7yv
	ccIV7VgVASeQirAAy8qx1p/hETLJOOdzdMz6by9+ldGmLjIn1GmWFmUVUvUrejnnmPGwGFV3FEE
	BQBk4=
X-Received: by 2002:a05:620a:400e:b0:8b2:e346:de7b with SMTP id af79cd13be357-8cb8ca198ecmr1054713585a.1.1771928183048;
        Tue, 24 Feb 2026 02:16:23 -0800 (PST)
X-Received: by 2002:a05:620a:400e:b0:8b2:e346:de7b with SMTP id af79cd13be357-8cb8ca198ecmr1054710785a.1.1771928182446;
        Tue, 24 Feb 2026 02:16:22 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9084c84c37sm405006366b.23.2026.02.24.02.16.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Feb 2026 02:16:21 -0800 (PST)
Message-ID: <3b4dfe95-9043-4682-8fee-7588fa1fde37@oss.qualcomm.com>
Date: Tue, 24 Feb 2026 11:16:18 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/14] ASoC: qcom: q6apm: Add support for early buffer
 mapping on DSP
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        srini@kernel.org
References: <20260223180740.444311-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260223180740.444311-15-srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260223180740.444311-15-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: iTw_W0KyaxyTj8cB4Mg2G-UBvQBwaByt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDA4NCBTYWx0ZWRfX0pGV4PuRg2QI
 IZ1XlfwwQO1/fhrJ62rwR4fR2nOWQSvSzy7+o9btK7kzqtWxafn1jNBq7wFLKuM/zyeJwtgS72U
 vHo9kCtSG+t5mMS+VnrPZ6Oo/xmp012kKie+/ays5gsSzWldBjbOmXXFv/xpnL6SIR5ANKial74
 udRzxdksgnrceM5ZkFyJTSxMXAiHDRrd/xDn+s4Ui36TWxmKMY1ucZaJpIzFZ8YDi5Ss/zyadL0
 xAb+ISckxpbONw5O0m67RfiOfl8jO5PJs++vR0csMG/nbLExxz+swfyUvfoU8/X3mcBevkblIfR
 JMKOt4YpZP65/heceF/UyopyaRkBjPvds2OztLv89QV9mYSRiw24qBqh+QgdHU3rb9GVcZpiBjg
 +taLVdEbvAPNWmgIadm2zx/66EiHrrZEJx01Dl3LpSwVYv14CSL6/cxWtMK1Nc4k4AxbrJ5VcqU
 /1n9zJFcDRpVyiMxNYg==
X-Proofpoint-GUID: iTw_W0KyaxyTj8cB4Mg2G-UBvQBwaByt
X-Authority-Analysis: v=2.4 cv=WqQm8Nfv c=1 sm=1 tr=0 ts=699d7a77 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=TT9Tk4Jx3cP5QYn9PwMA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_01,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1011 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240084

On 2/23/26 7:07 PM, Srinivas Kandagatla wrote:
> Buffers are allocated on pcm_new and mapped in the dsp on every prepare call,
> which is inefficient and unnecessary.
> 
> Add new functions q6apm_[un]map_memory_fixed_region to map it on
> to dsp only once after allocation.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---

[...]

> -int q6apm_map_memory_regions(struct q6apm_graph *graph, unsigned int dir, phys_addr_t phys,
> -			     size_t period_sz, unsigned int periods)
> +int q6apm_set_memory_map_handle(struct q6apm_graph *graph, unsigned int dir)
> +{
> +	if (dir == SNDRV_PCM_STREAM_PLAYBACK)
> +		graph->rx_data.mem_map_handle = graph->info->mem_map_handle;
> +	else
> +		graph->tx_data.mem_map_handle = graph->info->mem_map_handle;
> +
> +	return 0;
> +}

This doesn't return a useful value today, will it ever?

[...]


> +		case APM_CMD_SHARED_MEM_UNMAP_REGIONS:
> +			apm->result.opcode = hdr->opcode;
> +			apm->result.status = 0;
> +			rsp = data->payload;
> +
> +			info = idr_find(&apm->graph_info_idr, hdr->token);
> +			if (info)
> +				info->mem_map_handle = 0;
> +			else
> +				dev_err(dev, "Error (%d) Processing 0x%08x cmd\n", result->status,
> +					result->opcode);
> +
> +			dev_err(dev, "Memory Map region %x\n", rsp->mem_map_handle);

Looks like a debug leftover (also in the below 'case')

Konrad
