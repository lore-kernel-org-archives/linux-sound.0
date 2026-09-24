Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 146F03F86FB
	for <linux-sound@vger.kernel.org>; Thu, 24 Sep 2026 05:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790228650; cv=none; b=pZQsMCJcPwrRrl4IBwyVJ2uxXdQDtkc0YWzJdp6WR8n/wGkE5qiwg1/6N8vZkUqdlLhAv27un4zhQqdzxzPHhNOO+nO7JiOKrGgCkVWfgwhMl2xYYPVEc132aJw/QnqubhmoL7wSZohnsXa6bocwskpjk0NsjaJc6vYZb2P3ZFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790228650; c=relaxed/simple;
	bh=/5nGC3DI2uQnuEckbcMT4n7vOg6tU5KZ48BGgutQ0kU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oChB439r1nLfbb9RexHKjvWyblZNC1gegtzVqQw6YvO+BCz9hozpYwuScMOVoeSqEwfh9sEh76dtDM83XjzdgseSV5NZmZe2Dub34e4lgrjV3HcPKSJn3O+yFvZk10XpFf/ZwF10tx/f1yZBPpfepTAc9kky9AOvds++c+DiaBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ChCZ5MRN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HiLu7d+K; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ChCZ5MRN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HiLu7d+K"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O5e3YT567392
	for <linux-sound@vger.kernel.org>; Thu, 24 Sep 2026 05:44:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u42SO957172KIHAPRFEnb8SUe8Sdylu7eyZ5jZhTkfY=; b=ChCZ5MRN2vWsXFuq
	FTsDXspcO1dAVpf/yqBdVW1LksWBZ6qdWMd8pcAzsc/Zh7EDQ9rr2yp+2fxuiMsf
	WCSzA9nwh+IvFKv1ESgP4LvLxyCpqrE8J6rpbnqtrpfJd5Eaku4uhXVTSn/Us0Ow
	acpEJaoZBZuEIzu+wMsuRurzkG5v6LjCK9IWk6kglvmYuVAZP4YafWAp0motoQNG
	MIa8B3mDSpP25csg23xmM/+sqsMiZcInZWxDi8+vIALPGh2zTMEwTEJwjDUIiNc/
	uhFZIv25qGKPcns5Mhwoy41sqeE57GMqSUsuLwpHGRILrDg6s/86WJYu1vg+8WXk
	wH9fjg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvvgh8947-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 24 Sep 2026 05:44:07 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-32b8c2b30c4so2692750eec.1
        for <linux-sound@vger.kernel.org>; Wed, 23 Sep 2026 22:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790228646; x=1790833446; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u42SO957172KIHAPRFEnb8SUe8Sdylu7eyZ5jZhTkfY=;
        b=HiLu7d+KpHC/eCAZWNe6n5iwJVZSeP6hnIjUCf8CoTDFhy+wXv7ISsMa04mzFKoa6y
         K5ag/NyTpeNbRjwcb1BGSjDiLl4+TZ4m0LX6YzmFJFAIeULEeZvksPTpUSwC6ndQhPvw
         /xdJD/XKrmt/Rb7Pjt/UWY55LfSXsI789QrYmK977+E9EbkRotD7jiyuJG2JHCVUxK1h
         9vm0WCIr/9nt0ZSYqxkGi/PetQVLFx1cMJoRjdnHe+Zx0+RTAi+Zd8iiDLKOuBbKsCOQ
         VuAuGGvhSwDgtq8lx9jBuHy9KrA9zzV1Xnm66YZ/wJXr2dX0ItVt5bJHe2LBwYvflBQV
         KmIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790228646; x=1790833446;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u42SO957172KIHAPRFEnb8SUe8Sdylu7eyZ5jZhTkfY=;
        b=GomXkTViFKP9H+nfAuuZNSfJ+OA0t7GrJz48K7nASn/GxkdYnKAUVMlrZY0nDbIpmO
         dMSumiXs00Q8pnVlcLJdok1vTtj44+Gl9JssCabOH1jj/UBUW9kOAmXv5ZMkVze9LKeB
         kd8HzGW9mDKJxlB8nMKBVrZPSLcvr+1LOq9NaZy+7KaGeHkmIFp52QbfZhFhdBx6l49m
         S+lWqxrns1HaMUNJp/+GtJb2iqd4XVP4ZZPHMiA26RJ5EG23vHEV+3AwCIXOtlKy0IsT
         s8BDNpEn18z9z9w5wwwE2P669OBi0vQDZiw6TaMZXcv0eKFlsLzRVYqucwy5G5QC6If8
         6bkw==
X-Gm-Message-State: AFuF++mCIaCkm44YpwOnsKowg1El6kafbbLq/Nw29Oe6W6AzLCVpmG1Q
	Mp2F+RClaha7GV/0nAUhQH7z2yvC9XiVSwl/tc2Nr0hELtnphHqKliTSDuj2XP/Knc1o/keE8rX
	PJPkpoPaSnPpyrz6Kol1my81uuaLedrBmzzemLMmAgcm5x5ynV0G3pE/CN905QPoIlA==
X-Gm-Gg: AYBFou3GF0FqRJhD997nXfh2/QJlwUuI3rmS+ZBDSbJL8NEnLG8N5rPInk5wE/Nzu9s
	xWEQZXizbzjVxgQd/c8t5PQKz9tY4nxeGvulZy8W/SLQ70c2HHHFcNGrx6uqL/oU6+34zj45CLn
	IyUiwBZOETg1dw/IxQcU7RvNFe1wyHO/FDkYDXCGhH2+xZWuSXYMNN34Qbhh/P7PSb7KZif4mME
	m4ZeRIfTnNRr+8KJE6CutnZXKh2k6TN0tFi34oxpy0qfWbENaGiCFMj1KzeUNkg6GRcG47IrcXe
	1460VG9T7qDRRDC+o8pMuabMWaGETb9FOWiQD4inrq5cYVmNptWffPw/dKETCNYpImBx0PuCyA7
	0rFRypcfeYNs7xxvM9irW1FXVq+6+
X-Received: by 2002:a05:693c:88d0:10b0:33f:155c:e8f9 with SMTP id 5a478bee46e88-34004a899e7mr1045205eec.14.1790228646553;
        Wed, 23 Sep 2026 22:44:06 -0700 (PDT)
X-Received: by 2002:a05:693c:88d0:10b0:33f:155c:e8f9 with SMTP id 5a478bee46e88-34004a899e7mr1045181eec.14.1790228645831;
        Wed, 23 Sep 2026 22:44:05 -0700 (PDT)
Received: from [192.168.1.25] ([122.183.173.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e9625825asm10513616eec.13.2026.09.23.22.43.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 22:44:05 -0700 (PDT)
Message-ID: <b2d93cb3-2a07-42c3-a030-5d8ca951d3dd@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 11:13:53 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/8] ASoC: qcom: lpass-macro-common: Add missing v2.9
 version string
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
References: <20260922-add_shikra_support-v1-0-6c6cb6444caf@oss.qualcomm.com>
 <20260922-add_shikra_support-v1-2-6c6cb6444caf@oss.qualcomm.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20260922-add_shikra_support-v1-2-6c6cb6444caf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KYhHIgYD c=1 sm=1 tr=0 ts=6ab4b8a7 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=uk8ae9/F1LYL5lfeGCaUoA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=kbTR4NEJu8J_kXnuzwQA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: DGfJ4UBZJNTA2wxS-J5wjvJSmAiompUM
X-Proofpoint-ORIG-GUID: DGfJ4UBZJNTA2wxS-J5wjvJSmAiompUM
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAyNCBTYWx0ZWRfXx64pk5cLIzU8
 1mYPBRMiASUOzw994hS6GFvYMHfdz+2xdtC7nibVMgKz4DlTVwFWMUoz5OI+YXXlp9Fq9zMABPJ
 TanmPbp8haJi9C2q5fQE5cVIR8dIKD4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAyNCBTYWx0ZWRfXwUN1lOKmXdJ7
 J8qOhbGbZ39g7LZhOqlSBwc26JGMc9WW4KR8xuWr8VesfdSWkV1piZrB+7e3b3ZLOElcUF9W+Zo
 t2pfjz1Do68YkuD5zZc6H80qfdTGowgOKmQSAppfUwbfdUeiNnxkat4x4xSQ3XRgLScM/Fo4sd3
 C5MdZeBF+kET2l41GZdI5tu0wr7tJ1Q63ep0MI5kHoaY7qvck+OBkfi2iHM/cESv0vFZ+wIS+ZU
 1LKSQ/dJ6ZxhA6SIr0z9MODZzyYxXCUlk4RtMVkAeDRSbPN8mtUFaKqdV8lpV/bbuhrq8ichH3R
 k/zzFLxmoVGIhV2IUt2wnaD2LRkiaR1gvboRfBs4KE2/uJN22gcSO4d+CxweIKEJGhVPVNbxah4
 LNHo2/YTDLTH5EsynGOhatlvwSEnAa1V5yX39X8J5VTTL3kpUzBzMhGH2M+iZ9o0DMDw7kCPL/z
 +pQJQBxXCQV4v9mK2/g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240024



On 9/22/2026 3:12 PM, Mohammad Rafi Shaik wrote:
> LPASS_CODEC_VERSION_2_9 is detected by lpass-va-macro.c and consumed by
> lpass-wsa-macro.c, but lpass_macro_get_codec_version_string() never
> learned about it, so the probe log reports "LPASS Codec Version NA" on
> those parts.
> 
> Add the missing case.
> 
> Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---

LGTM

Reviewed-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>

