Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC323BA249
	for <linux-sound@vger.kernel.org>; Wed,  1 Jul 2026 11:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782903870; cv=none; b=V9VX5nNhVl+oWvH4vj3E7ssIMrOwZSUbjxCQ+GgWF3L6eILFehboTbf/bVu9r0ZAcDQQI2O0TSaCUB9AahAEXHDYymx9H0k4NhXsmHjCJY68u0welWIwhbOVYMqPIY7HfU1annqCxUG289jPSuzGi5Cp+VqwcqAHsXUyB3+ritM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782903870; c=relaxed/simple;
	bh=ynoolOr8Ku5+Kb6BXtxvje213kDyohYYZ9HtzIZ3ZwU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IBHUPm+Hu7OCfXMiBOuV9vuoWh+PjRq31Wn8CpP/cpoJ1h1KSQmy0nkKC7dMkLZTNLddf/w9dnRFDZIql8VjfSpcmdClBcSJAcnbRxcfKXy0yZP0DeEfRFbTtbHeMLTKQJvetbWHna6J41jqrcEnk1I+PuDRmJWyAHJ2pijTX5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YwtKCkK+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YA2+BEPs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YwtKCkK+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YA2+BEPs"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A8WUr744289
	for <linux-sound@vger.kernel.org>; Wed, 1 Jul 2026 11:04:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nwYmI+QcmMAGLGhjINaM9pOWEfdjhWDfUcsOLnPEEOA=; b=YwtKCkK+VtN1uI0K
	Ckdoepdh5kEHIOZ5TLSgkVyZTUmuNCh6pbYDWX3R1L4CSVppoG99gTvVov/BbUp3
	z3dzDvHo+jS9vEgjswEq9MbZJG9/Gq+6hUWKPJDw2Z02gkKjjRzTEFxPV0dekttW
	f8F55QaU32lZEO3kTv99VakOuf3hm5MXqX/Lptkb4huGKv1cQQEhOlo3m1JmpKND
	WsztR8mbWJ8teCni5143Mk8vd8x/XqmkRWrpIw3LjSMHX7NRVTrtClLtVTthOkvY
	U3w8UNUUU1z+HZi+KQyxD+CPqmMTIRZbnSbmfHmDzpmNm+4He/ZJ4hv2WUln5Ndz
	sfaQ4w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4x0th4fg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 01 Jul 2026 11:04:27 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c21be5bb4so2585471cf.0
        for <linux-sound@vger.kernel.org>; Wed, 01 Jul 2026 04:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782903867; x=1783508667; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nwYmI+QcmMAGLGhjINaM9pOWEfdjhWDfUcsOLnPEEOA=;
        b=YA2+BEPs0mW8MDpI4mojYmGparubYKEMnhnZsPkGwDqB41K5sKTG1t/oxT8HCZiRu9
         P+RuJLn0sgVZPthcb7dGFI+ULS7JnGkcWMSOQHmnvYzLuaoMDc++Uu36mLQ45OO32ldY
         9Ao45aMpP/BI2+HpuXYt1DeluUOTAfddoBpKHSkGb9U/LhBwAt5rghmXcxUFj0dmRdc2
         meNAQJHiRfGXAaW0bnfz73SgMtuAdeAs9kJ1A0o7+Y7ewIsJM9AsD7+d5N58T8fu9f/b
         ZEwiR5OQUOJB4em9gs7x50WD9wQLprHUz5+7z5opKD2iRu6IyiKD6HVTfsCQy4C6VWJv
         yihg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782903867; x=1783508667;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nwYmI+QcmMAGLGhjINaM9pOWEfdjhWDfUcsOLnPEEOA=;
        b=esuq0GXhkW4JJ3+oRyYrfwL2qGpq1OvsBaiJXX9n9VXXhHqiCO/UP3AIIRLSeomVkU
         zMW2BAkc0owL+RC7uHywUYai6rYUwP85GobPejO69Y6L2JDsAPEh29/vt0v7p7fLQ3Z6
         kZSG7qyxgZoiOOJl22ajPGXRPwslB3ZNk9NK2zJaXuyDyYQMxy7aVnqNcRZssZI3CMrB
         vCh5V6m1XFp4pO9ZGVdbJ+PEV9UT5y+7y75jXreKsUJ2YHGiofWd6kDcVlao6cRtzDj9
         /EZG3MUmWjLLQwN7++9k4rDeFg2SZbwf1A4A8zPoh9Q8STajbful0kHiEcg1YzH6n+EI
         aYUg==
X-Forwarded-Encrypted: i=1; AFNElJ/YW7yi2bugf35KIC2wagBVzVUUOT1AFrvRgpqeu7KeG5aJh89Tt0b35QDRSnnz/4lZ+XiMdKpvAJilLA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwHvQn+WZymsoLtQtSAWRg7XJMX6HsFwZNF4r0oa9BnnNS3iROS
	FPyZRcQnNIW07WlIG5HIA/Nvbu5RJ6NeNtJD4PlkUvqMtnGLqhJBXj085OwEWiWWfoWdPyINNpj
	yEaXOhVDSTN13H6/HrIwVMNy/a3a7MQkawY2ns4jZq2ghkszSQMlK8h8v3eONfErQo8eQTd+yZA
	==
X-Gm-Gg: AfdE7ckqc5DlPZnnV7mlUDtAuKqV6YJ+iPO16MC04yM7cgso0h96V+dNQGUH34LvmHt
	oFWWORbBQySC9C21fiVsEuK3V5k58oiQpN0ohP7BJl/vM2KCjPBdKAZwv8ICzhj0YkidPwJwHBH
	lZnlThwlKBdFRqTLVPr3dIsn4H9vGqmEYnBzDkhi6Y94dUC4oXkKQF4u+hTcY2yLj+F7Gi1RwSY
	tLuxiBD90c3505TiD83/ZjAgAhlhGyeKE903BUjrDKoWZGw/yo/me7/xqSFZ2qiCK0PGnhSS8kE
	kiJLyK1KiKeolJ9+KajAlV7gsxJ3ou+WXPtMIM5B1Hd9HT5PAd4YW8keniUh2NER0JcJeC1JFyj
	RrBfhfzHEqm+x9KGZRSt3G+IBKa8MawQZSxE=
X-Received: by 2002:a05:622a:13c8:b0:517:8999:6c50 with SMTP id d75a77b69052e-51c26b25b59mr9946261cf.8.1782903867204;
        Wed, 01 Jul 2026 04:04:27 -0700 (PDT)
X-Received: by 2002:a05:622a:13c8:b0:517:8999:6c50 with SMTP id d75a77b69052e-51c26b25b59mr9945821cf.8.1782903866842;
        Wed, 01 Jul 2026 04:04:26 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12a5eed4bfsm59364566b.0.2026.07.01.04.04.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 04:04:25 -0700 (PDT)
Message-ID: <c1a5a8ac-9e09-406b-bde7-bca74af6bc2f@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 13:04:23 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/11] dt-bindings: sound: qcom,qaif-cpu: Add binding
To: Harendra Gautam <harendra.gautam@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260701105757.2779738-1-harendra.gautam@oss.qualcomm.com>
 <20260701105757.2779738-2-harendra.gautam@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260701105757.2779738-2-harendra.gautam@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: xfCEXtnnYJLUe69OpAvtjGnIhLE35yEc
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDExNiBTYWx0ZWRfX/ocNoZfTSiaH
 Hn4GnW/zGsqaT88AgkT8Irx3RjZUeKXynUBmEAyX8h9+7hHBd+cp0d0IU3ycSh5xPWA1GGJfOeh
 Co+owqZAZGqmWWOIGH2wHYy1PDbKV78=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDExNiBTYWx0ZWRfX1rc/oSEcj/bA
 +ybM3HKtMwHyRXuW5Jo2v4SYW0WmO1Ole/WyVMpb29MVH8eMmnc3ZDV+pv0AaTwnA0tGhtU9Qj/
 PZivldo/ioT7cjxx2dqECJdqECxkoXuAh4daw3417A35/ENmQZJWTAz92pF6iUo7yRBy66mXT5w
 IYnMmrJARt6y/4bUiRr/cApvVhojGEQeF/EMUQuKKQ6i4vDhzfniA0SoJm9i1GQzShFhUkH4kPS
 JKp/3SV9TH+uKlMrrAQWRSSbYu/2T3ZuHku1mEVIVDatANtcZE5hUpYcwAtNeKJLCeANvAXisve
 65HYQZF3nQjE54HuJtefWPdgApdrvusGra/1zoJEQKq50mZMpFhf9w+M73rDNbULsy2lrBZy+b7
 uOSDyAdW+MvSZLMFExvoG1cr96c9F3v87LMyqZZrHYPniurFe0vhckD59Xb70wS4f6v+W7FDHYr
 Fm9LGfh+tJ0i7jhTxVQ==
X-Authority-Analysis: v=2.4 cv=T5+8ifKQ c=1 sm=1 tr=0 ts=6a44f43b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ijDTMADtph2p8D2MxOEA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: xfCEXtnnYJLUe69OpAvtjGnIhLE35yEc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010116

On 7/1/26 12:57 PM, Harendra Gautam wrote:
> Add a dt-bindings header for the Qualcomm Audio Interface (QAIF) controller
> DAI IDs. This provides shared constants for devicetree sound-dai references
> and QAIF aif-interface reg values instead of using raw numeric IDs.
> 
> Add a Devicetree binding for the Qualcomm Audio Interface (QAIF) CPU DAI
> controller used on the Shikra audio platform.
> 
> QAIF moves PCM data between system memory and external serial audio
> interfaces through the AIF path, and between memory and the internal Bolero
> digital codec through the CIF path. The controller needs a binding so
> platform Devicetree files can describe its MMIO region, DMA IOMMU stream,
> clocks, interrupt, DAI cells and per-interface AIF configuration.
> 
> Describe the single register region, one EE interrupt, the required GCC
> LPASS and audio core clocks, the DMA IOMMU mapping, and 'aif-interface@N'
> child nodes used for static PCM, TDM or MI2S configuration.
> 
> Depends-on: [PATCH 0/4] clk: qcom: Add Audio Core clock controller
>   support on Qualcomm Shikra SoC
>   https://lore.kernel.org/linux-clk/20260605-shikra-audiocorecc-v1-0-7ee6b5f2d928@oss.qualcomm.com/

This should most definitely not be part of the commit message (which
lands in git history..)

Konrad
