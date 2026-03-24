Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43CC035A939
	for <linux-sound@vger.kernel.org>; Tue, 24 Mar 2026 10:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774348317; cv=none; b=CqjMcE4uJJTsTFswxavatPqg+OSXa+dbxn0PBNpCRlkcBA6iJqywJ9FL0VN0uVn+kYmIzncClApWbgUeLohgg4WJwNVf/Mj4KKtlsmfE8yl9JepqsQgyeaJHTjlTrMujDWewzMtqK3/M98Jq34rkWxaiuQ46Eqziza6xovyiIHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774348317; c=relaxed/simple;
	bh=q5MNvdyGof+PjgbQGTJDKus9MlV95ZIEerPWexkQdGc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gUuZg+Efk+/Gep981B3BNgYNQ8thG41CE656Qya4fgFTt7ZLPTTTt0oyNlsvkyZGCB8MbQyXbNJU+vSFYPalhwqYgh6IVSJn9/9NPsRqf2EfK1+NxeCsXl0gOlH/EO7faY+tyv4bUCFOJ9cOd5UJEaj8ufm2p83CYsZLh3nUCe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MZPyxOOU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jwo+HL6S; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MZPyxOOU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jwo+HL6S"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O8xp5C2323405
	for <linux-sound@vger.kernel.org>; Tue, 24 Mar 2026 10:31:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SiWFOK9mWzHDxiJjk5j95Lv1zx07DFZIAdgSugZSXis=; b=MZPyxOOUn8hOM0B1
	JByls7/LCUOotk6160wVYQ/t8SRnSyqylXAFR6UBxA5BKfgNeIAeSsOmdbzLRWXa
	hYAbofdkPOCUSOWhaF1e2i5XBYAjRbVJsSYNB8daw4cAvH7ZbqI3Xbi6GtQMuqQU
	lS48akay303qBvhDRUJ7f4diPispBLiecP7QZrhODOA9C0Hep/SARkIufSaquaAS
	AkuCPRG0TkpzziahH9qkv+7Su8D0omiO5qKnKtF7h0U4sJrlRw3shtBbgQIWI/Ka
	jHZppmmB42wFo3BZiSf/VLfSEGj6kfEd2UcDM+yy+rMHDuiVmOUii3rpOtWQnHCe
	GijCmQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3qkerccy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 24 Mar 2026 10:31:52 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cfc4ba4de0so332401285a.3
        for <linux-sound@vger.kernel.org>; Tue, 24 Mar 2026 03:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774348312; x=1774953112; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SiWFOK9mWzHDxiJjk5j95Lv1zx07DFZIAdgSugZSXis=;
        b=Jwo+HL6SEihxLOwKC+O9x1SPEiWNjR9zRS9ew3vewNEWDNqNu9spuZek2P0XuVbJQX
         puCT7aLLhvJdbDhjZ7YLuv9tURa/biQJQ+VhEqELk4GNAU7XP0vaYw+s4HDFLL7YMmct
         Dq7FIZ1U7PQI3gEsq3NfviuRIH/BwYIufZr/WDYCrFlNqVEv/EI+VPWVPd/CzRvMWCiu
         8HRmsnOK810hSPdsQDn6cAE1bFe3BSuBVsiz72kvb0ixl8spJiMR/AJP2ysQDK/EBp0V
         iUDFOqCM4kiRDNIbuHCJNiCga8AcBB+cq+FwCdEIYZo1ayzTfNAlaF7OnQe4ms0rSGsJ
         ZCNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774348312; x=1774953112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SiWFOK9mWzHDxiJjk5j95Lv1zx07DFZIAdgSugZSXis=;
        b=SX5FB2SrZ8CyV/UWCK3COEYzX3a+BCn3fk7MOKtV2/yonRl42N034YGS3CmTSoQKNs
         0+hWr3GdWmfYKsOZTdzHqyM9jq4Cwu/ppHQKmFJQElCyDubX5ujdUUQ2kqONfEi/W/Dz
         MflonA276mzQ268b/aYtMDLjfnkiIZYw2wTLM1lfK20+tIvM778m/PLtOE41OFYmQlbg
         +RgK9e4LvZfc3huseqlsAj8CFpOZZaeJWaETKyC/q73h2IUcDCGOVSX31AIgSuy4jI/u
         MXrGpbnYI1NvgvT3iJiJ4x1tU9A+pw/Ih0CY+cVHxN1evKClSQND7yeJXAPic0HyzZ0a
         MuUQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+YWAebYGmNIvv4KZNAXMcFb9d4AnB6m1EGN0EZels98I8+y/hPdpLj2EpAzsvEfADo13o3glNdKAtYg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwbtfAH1riuaAMSqte0EKkSILywoIwqNt1JceXhJsc+xOq3YFTK
	e9Eo8ABgGDTU5Yu1Ic0wxovrswYiTeO1acWtuKvBNpFBgT4VklHGObQZTBbtWWZC3w0m36XC8fe
	8YAQzFZwXS5v7IwzyKdrobFuJFW4/vNV2oC+gYlkE5IFID8KAfSi5lIIwQtdGouEn7A==
X-Gm-Gg: ATEYQzy/nPzquySB7WEuQbLc4MUQD/fqiQt6KbSPB+HIiRGxfVoURT5jdkCTnIfBzog
	dzFm2eXAJ5oru6LH4e+5Ng4NuZdaE64EZWUBMkbvzzaV3lZ9sx/4rKFVJCJr1srXWKUk2fq8jOI
	/zND36os3QcXUz0jC1VT5fr3HU0UcQXwkhnTqWY2DiQMihpijHseX9bj2vzvXvDSMJwOejc9TDH
	pwH2zuwTURzwCPMVorviYdFdK+2aGYvD+ff+9/vXc5B37gh1h3BA3wl9qbIJbFJVjsbNUg23Dc0
	NnRFkZ8KXk6AO/Jvb8oRcIGc8jooUvjb6xLbCJj52KVOlRJYObbwauTeq4LUT8FBM94/2oUfy39
	rBuO2QgV09KkQKv3i0O5M9spBTdqRL20m12ZxO7Ab/asE8jvgQeG0UqeNa6MHFByC/9SjrSZmbL
	QqvSg=
X-Received: by 2002:a05:620a:1d04:b0:8cf:db7b:6229 with SMTP id af79cd13be357-8cfdb7b688bmr982849385a.7.1774348312413;
        Tue, 24 Mar 2026 03:31:52 -0700 (PDT)
X-Received: by 2002:a05:620a:1d04:b0:8cf:db7b:6229 with SMTP id af79cd13be357-8cfdb7b688bmr982846585a.7.1774348311724;
        Tue, 24 Mar 2026 03:31:51 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6694b45de66sm3175912a12.31.2026.03.24.03.31.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 03:31:50 -0700 (PDT)
Message-ID: <f3661dba-2619-47d7-b118-6c483ba204e6@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 11:31:46 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: codecs: wcd934x: fix typo in dt parsing
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        broonie@kernel.org
Cc: srini@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        dmitry.baryshkov@oss.qualcomm.com, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        david@ixit.cz, Stable@vger.kernel.org,
        Joel Selvaraj <foss@joelselvaraj.com>
References: <20260323231748.2217967-1-srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260323231748.2217967-1-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: meisk3xjKkr7-aKu7T7Ilau34jxDQ9Id
X-Proofpoint-ORIG-GUID: meisk3xjKkr7-aKu7T7Ilau34jxDQ9Id
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDA4NCBTYWx0ZWRfX6qUyp/K7PS4I
 v3R48UVGHy0znfW0WtLYhRnOgZQkv2ozRn5C+LjveGslmw2Qf7D+H/xHY3bAEUQTfVCOMzm52yn
 7bKfxoU5clqybLKpr4pv5jx/NYIBpsdaEulHy6Y8nmg6Y5IxCGHdCLq027/QYj39q0O+eDMJgUq
 U0GW8+BdmPUrRPzbLP6VNhrH84W6cjFFkNCTjtzgY/Y1ubKir4z0FKSYrWW9RUkPjbscSO0eYVQ
 iJkVZFFETVB4nC9IkGTWGPg3MaRxbovWd0C/5zFEBnM7zJOAyU4WdhCYcR+iIV0DNUUKHuI45Va
 JR7q/RMTzZN0FAFVvr+fbssJamefPTXuPARHNWd2OUK7ptItjCB0/IiEM/Eo3uje1ybAiSfyVOw
 xbWwSSTguhVyegAEPwI154Zmv+hq65nW2inLNZGUV6huJ4N+nFxz9Wt9WNTIsH88HIXIS/uYj2Y
 57vgwBosG70A2ZCGvBg==
X-Authority-Analysis: v=2.4 cv=Veb6/Vp9 c=1 sm=1 tr=0 ts=69c26818 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=WFa1dZBpAAAA:8 a=EUspDBNiAAAA:8 a=viGe0TOZ8WVkida-i-oA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=MZguhEFr_PtxzKXayD1K:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_02,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240084

On 3/24/26 12:17 AM, Srinivas Kandagatla wrote:
> Looks like we ended up with a typo during device tree data parsing
> as part of 4f16b6351bbff ("ASoC: codecs: wcd: add common helper for wcd
> codecs") patch.
>  This will result in not parsing the device tree data and results in
> zero mic bias values.
> 
> Fix this by calling wcd_dt_parse_micbias_info instead of
> wcd_dt_parse_mbhc_data.
> 
> Fixes: 4f16b6351bbff ("ASoC: codecs: wcd: add common helper for wcd codecs")
> Cc: <Stable@vger.kernel.org>
> Reported-by: Joel Selvaraj <foss@joelselvaraj.com>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
