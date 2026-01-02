Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0CF82C0F6E
	for <linux-sound@vger.kernel.org>; Fri,  2 Jan 2026 14:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767362802; cv=none; b=P+My0JCXYIlwwURKTTE/PiF3OpUetOlhpBV4E9AsMdopEiaM/jbapbebvyE86mzFSfYcVIMSnpG7d6dHUs4g5e/9cTdsjWYKfZFX7JJIMxgH/o3e3UbjhKqiHUfEdJ4rQRSQFWgfMxa2M6WRxQqso9R+D5cY+A2+gA/U2KQrHl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767362802; c=relaxed/simple;
	bh=s0EtLDdJoB0XvKSbNBwYEd8TThn2e8Es+E7n8fIqgWI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=bDGW9A0xrVKnEhq6Vvzg8cTkVuT7oeUx64+/7cQAdjxGzjgxATjImOAWBE1wshPLZEe3/DeFW1Jg93WXTVWzQ01o3PU73ZgAvU6gYUfBgT7mD4413EXYYN43siCX8onVmQj1ALnKs1Msl3AfDzCq0qCbipwXzqjqDrqXInhYxXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZWHW8rM6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g5rSQQ/X; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZWHW8rM6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g5rSQQ/X"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 602Bnj7k1094766
	for <linux-sound@vger.kernel.org>; Fri, 2 Jan 2026 14:06:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nZYkRssRvlp1Hi9waVhR9vn2qSOLq6FZKXzjLYnaukI=; b=ZWHW8rM6F/THC753
	3z7oUCB01RdWPV+949QLzjsf2De/MBOO8XvSQPGsploMjNmIDhHN1XMWsRud442D
	RD2mEMiWZ5dpg4OE+NYIQYSnVhICK7nqEti/xZekV3zQ+R9O2qW3mjyOwKa5/F3M
	SN9h4t9d2frCiKCdaEHLLAazCHoMpWEV8pe04SrXM5crfBavd/fzAggOf8dl9yex
	lQHLUxG8AzqRD4LYMKxo+UZzORQwolLCMFJJBgPYQK5WKzrigLygoZ9zDb0I+LQd
	keY0z9bEpCm1RVXdvWnIInK6LHZigCJyceHwWza0rTkmp9/njaVSTYAnHqSwf97j
	5q8Tjg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bedg407gh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 02 Jan 2026 14:06:39 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4f77be4f283so1930481cf.2
        for <linux-sound@vger.kernel.org>; Fri, 02 Jan 2026 06:06:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767362799; x=1767967599; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nZYkRssRvlp1Hi9waVhR9vn2qSOLq6FZKXzjLYnaukI=;
        b=g5rSQQ/X8eZLaAn0wOObZX18CrV9C7GAJ9zewPE9ih7eWh1coxCgNxr3DVm1sTp++0
         UsDTgsrgpQA6YZ0uzqm9p9z0xSy9gt3iUYwBjjDuj4GhcGvrYwA5bRm0uOgJjpYV8sxe
         N/tOiNrmwmZUzaBRLk+tVeWUfwHRiPmbTkyHoJa3Jav62jMDtezoaUsfVgeiNmCuGyIH
         WIKC9kG78Y48+4VD7y0+VrQXpBOVmZBZTfn/K6DYH2UkVp/BZNws8xlV7vfQl2/3nnbU
         zZZtFY9bMIz6oo6Fy3WPqCwI+5plAIb4jkXgnBEFoRXchTIa+Uag38dviam5ltoOIydV
         FltQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767362799; x=1767967599;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nZYkRssRvlp1Hi9waVhR9vn2qSOLq6FZKXzjLYnaukI=;
        b=bZAtv6RtM0OvFBOHwdtmQP0j3qT22CytN94uRExhjFKVTEFPfpXnEhE2xRy5lRjmyL
         RJCIlRIaBABsC1xVv/png3H/kqz4FF1539b6nhcLOxMEaWhdL+VifzVKTsDVrZV5Z4nO
         tXe2GtTHtViea0FlQ7v0WgebYv2wpOZL7f6/B0WvR3rTZNu1yQFXgnMI3CU5pA7DMu5o
         VKujKbjPHyys9R42bZEGZPkucQDXfcwyRJqDrZjoYW44c66HVw4A6BMTAGdjjLWvoHgd
         lxR38DLhEuw79RAx0wQ4roHTeOE2997ESAaw2r8n1V7noIyO+1m1heZqAn2Lyz9ijTvn
         cacw==
X-Forwarded-Encrypted: i=1; AJvYcCUf6CG90l2WACC+dWWMoHpXRbZxiZHe9kdiYmSCs1ONyge8j0g4ZJrJplZAH7mqGzq9nY+H1FE/+emowQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyleCkB1AjN/4zz3PtlJCNB+XRdz1jEgfJQdXT1ZCZOZ418WExf
	y3QqmkzWIqISoxA2wr6ATB/S3ASxZYcZflH0YB/Yz4lUODukuGA7Rbj9dk5T74BAYPeENFyAeeQ
	GxOndNz8ASZbXJ53FiqOOFUSi/Nh6uLn+Fuo75zot/zHpv30N+6AYnNkUSoQzSdxXYw==
X-Gm-Gg: AY/fxX6LSzkyXTJaGrcjCt3sZuudwOK6yoOgDxuRzdcGA7MK0Bt+PNEOdDdltCn0BRp
	G6lFvUNhLSupiMmwFYZMVn8GRyLVXbwKRYv82a3toC/DUwJMpeT+DuAxMBP+K3nuM4lNTaKkCHC
	eZ4tGIj+KfVhmygiXwkKJxLengwg82dhYGPYNsO4811iJ0EM1Z8mKEOhmsc9rjdqUcV2bDbbiKA
	SnIFRzeo9JAo0VKOG3rZuIFxwoo+Ly9aDUNWU257NuzA9sqwNCluN98J9sPeY6k4Vq6GSk078Se
	sW4ckUGxn2c33czerBk998pM9fjww6iu5j6oBjn9BeRubus+P4oMgbz1beC+dt9CR0w2M/nk16c
	G/pCrw1Shjrs4uolEza1lmsn6JEY8gteXUN1vGJTDI2ZfSESoYArYw9yw4nBN9JA51A==
X-Received: by 2002:ac8:5744:0:b0:4ed:b7f0:c76e with SMTP id d75a77b69052e-4f4abdcbf88mr471824571cf.8.1767362798907;
        Fri, 02 Jan 2026 06:06:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG4rbbpmrmWgZk4BejVdpWV4cXUUDQHsGCTJBvERinSatHOpJb9xq2zgV+7kCcF1bpIVWapuw==
X-Received: by 2002:ac8:5744:0:b0:4ed:b7f0:c76e with SMTP id d75a77b69052e-4f4abdcbf88mr471824041cf.8.1767362798335;
        Fri, 02 Jan 2026 06:06:38 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f0ecb9sm4505942766b.56.2026.01.02.06.06.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Jan 2026 06:06:37 -0800 (PST)
Message-ID: <cd42a176-5731-4a22-b5b9-567898e2f138@oss.qualcomm.com>
Date: Fri, 2 Jan 2026 15:06:36 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] slimbus: qcom-ngd: Simplify with scoped for each OF child
 loop
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260102124808.64219-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260102124808.64219-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: rYzPMQJfxX-KIJ77J0rVF-TsoZs1WEwC
X-Authority-Analysis: v=2.4 cv=IssTsb/g c=1 sm=1 tr=0 ts=6957d0ef cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=9ra_KJl88v3tURVkoeQA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: rYzPMQJfxX-KIJ77J0rVF-TsoZs1WEwC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDEyNiBTYWx0ZWRfX9PZ/cP4kW8fQ
 ugfPrFHdPu9KuH13493g6tjYN3R7EMthTEHGVNYbpX80QmuCUPfjXMcoROPz6Orsm4Hxx7UMS9h
 z58La2ioPAtgBkjvtsg+A1Wg2Uw4V6ymqnopU3m0i6iplAA6FO+DbAhHat1sg0hZIvDEmYShq3O
 SleW7mhielDwvG+mvNgzLJ2aWY/PALknCtREeifwJdKjOXu1DSkuG3FghNoFx94BIFQ1MorBnsw
 VNvpKB18FL9oSYS1fGqKVNpynBULXopIngcigEv1EfoyQwnk6YtCr8xzt6ycOaRHvjpw80Yq15o
 7mhCQd2XJDqTmkTP9pgu/CTVyiVQFXiua80PJSdvgdZiQzP1gYdkgYeEOscMb/stEfmlpKgtD0J
 pBNtY3D4BXRLoBQoe6U9qsgrsmocAgk/4hCdxKOw6O9oDiZSNa73JDkLVITUUKIbewo0Ka66Z2x
 LINDUMwOxkGtKrY4sDg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-02_02,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601020126

On 1/2/26 1:48 PM, Krzysztof Kozlowski wrote:
> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
