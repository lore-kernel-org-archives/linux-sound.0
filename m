Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC8730F803
	for <linux-sound@vger.kernel.org>; Wed, 15 Jul 2026 10:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784110018; cv=none; b=CVyvJmvF+t+43Cz559Ev7eTDm1fWyUSBhTV9mZMcfUy/U6G71bqfijh3PICCr8mDTOU1TBopJFxxAIBshF2hyZxFy8MYjKv0mXW0WS++b/iMbhKyWmBTHPnu/w3an/6mSj97i/EyQOtlFY1DxO6+ZvqAo3Z32y1N3tGtOEwGFi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784110018; c=relaxed/simple;
	bh=Z5xLZqUFy+nfVFbwz53H+l3ATJIjWnq/bVWkCzWe2pM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DJGfSelDFmSiSxTNeOT9VuGS6L6FORfvND16V5AcUaS3aMVBi7u8QcyQJz1EQqJOjh35A1iKhelhwqrgy7uBv2UZ3jNVe/9M8zY8OP/Y2VsW9XtAUXDHTrAyi8NQFjghop1qtKPC5JHzQHnWroSykEJJxXG/22sWZac4zBGPc4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hY5OrL08; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GOShVOV6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hY5OrL08";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GOShVOV6"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F9RB943143703
	for <linux-sound@vger.kernel.org>; Wed, 15 Jul 2026 10:06:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tu9xnBEZVIchVJKkF19/QBESyjHnh5Atdab75SDY6T8=; b=hY5OrL08ZVwbyx7L
	O3YSNNolYHre+Yq78hm8AFoRXL82BSQqBGr2eaXXMpZdN7ejWn7Xq/JfgJmgF16m
	DCxksA1LYS4WkYRq2EuXlk2d0ah2RnIjfAgMZkO6hg0n70nCz5z65oeSxr1cruvp
	dtY6d0lX6eOyJswR6HolD1uwshrb2vjrjX6zdKifyvD8HYbkbOjDipMpbUxGcCMk
	taZA+o3L94YdZezdW9PqdhuE/mRS9jBSpchufkGgpgJ2pY1NFI9ugdB2ZMHZNyEv
	I2MzDiNV9uc5+kNNmLXVE6ZF9cHIqxUL5lAdD3Fp2dLGJT1FoTICa0hi69hIx1i5
	aEg4ZA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe7ka84xf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 15 Jul 2026 10:06:56 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51caa0b48ccso9354351cf.0
        for <linux-sound@vger.kernel.org>; Wed, 15 Jul 2026 03:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784110015; x=1784714815; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tu9xnBEZVIchVJKkF19/QBESyjHnh5Atdab75SDY6T8=;
        b=GOShVOV6MEbkEcDACrB03RYsZLPc+7Kbh9zhSuqdOwbvjLBiXQfxh9DVitx5aGO/9t
         J//elQYhxEHi5gc4vxePfEBQ68Tb8PXscpGUlVucwEf9LV+zDtIZ4qcKB45atkxugFtW
         qJvSjfQ46D0dJkLBVkpba74YUnDU0OPjxu4wPTN69cZS0uhbQlk8EfG6ZARGGoac905Q
         1Oj3H7YADO5PVvVHfvXYVlSpQjBqWrx8NEgSaHEH7uPrYfbCYr/qUOs6sajtskb8Qx/H
         81GJaexltaCyZvy3L9+9tXb+XtDiUaidyjSsYy1Q/bZwM7i90buGXWR/DwSpj3lR3CNW
         Ca4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784110015; x=1784714815;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tu9xnBEZVIchVJKkF19/QBESyjHnh5Atdab75SDY6T8=;
        b=EcLu7UGPMywWFfrHIZUNJCXHUlALv4XKL21BowBlDMxLKCyhNy+4tVAJBHwI5Kvrh/
         H1QB4r/OeShKZHJtspT93Hpp6d6vjvUiDxDK7/S24eGBpVD34OTyTidwC1FtTjzI3Ero
         gMK5nv5SyKnURS7nSShXjBM4EQwKq/YHDRIxn5P5fBJ0bqj+fj0sKRIf2dGvLudhJFTq
         IrwQ7VW/ILkKLVs3ZnqVRrYpb/JYAaZ0mopdn/jcX/l2KveGAMbIdvMtg4izFuqc9DBR
         /WTTuFU4hD9KI7iDEk2Z6J83xaW2IDXQV0oY5+wj2kJmRo25hGeY1DKzB2l1vtxjm6wk
         c0Aw==
X-Gm-Message-State: AOJu0YxZ6EYgTmheX/PHbMMX8woO6Cqn/ulI8ynzoIgTHDzSMsvaE1BJ
	kqCT0488ucThyMIy1WHBRHv7GwmbJVoPbN9hnphQ7LzMChMcHfOkeCLCFK8j8a9Dpg4mHFyibab
	6auk6cNhYDb3GgQ/Lv3AQe+iXGRMaWb+T4bum/u24EJdqWipNB/+hWEdYIAZw4BZ2uA==
X-Gm-Gg: AfdE7ckDE4qDQxoChegcAujWo3pamjv8C8couPX2aijjNqB04Fl/CGZNU/szW4TabMg
	RfxdbKOSdRIxFCahPkQ3rSDLOBcd90CkCdV7E3L111cF9bmDWSWokmRoSJSdmzUXfsA6vZ/j3w1
	IOCISwylZmW1C4SDKidFyQ0xtCcWyhpEQca3SnOa4zPZIJDPC+vYruXfju/L/vF+1RWa3loQC0v
	tnzr6Qkb7ocZv6j5BBxjZpD8F7aO8jRaG2Tx1S+MH3gac1Tq2X4YwSsxa9Q2ufGWdlLfdjiiY4l
	zlrrY4Ig2Jf83y5xo1mrkOYBOJXS7lSVtDwuoiQFOc8kGpbmAm+pxKkE15uD/SlVXWosVonECmB
	yYppYn0oKS3q7QSFWL0UPkUQ0B5m4Q43ufig=
X-Received: by 2002:ac8:5883:0:b0:51b:fe41:4764 with SMTP id d75a77b69052e-51cbf217c25mr134538861cf.7.1784110015204;
        Wed, 15 Jul 2026 03:06:55 -0700 (PDT)
X-Received: by 2002:ac8:5883:0:b0:51b:fe41:4764 with SMTP id d75a77b69052e-51cbf217c25mr134538501cf.7.1784110014601;
        Wed, 15 Jul 2026 03:06:54 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15d4bffdbesm1081919566b.45.2026.07.15.03.06.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 03:06:53 -0700 (PDT)
Message-ID: <c13890ae-5a1e-4f35-8713-91eb41654d0c@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 12:06:51 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ASoC: codecs: lpass-wsa-macro: check clk_set_rate()
 return value
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260715-xo-sd-codec-wsa-va-clk-set-rate-v1-0-f0c713ff0b4e@oss.qualcomm.com>
 <20260715-xo-sd-codec-wsa-va-clk-set-rate-v1-1-f0c713ff0b4e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260715-xo-sd-codec-wsa-va-clk-set-rate-v1-1-f0c713ff0b4e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TMF1jVla c=1 sm=1 tr=0 ts=6a575bc0 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=YT72Ugdk_NjNlKIGY0EA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: gz_itj0avebBF93rpNFEk2k88LmyEEGz
X-Proofpoint-ORIG-GUID: gz_itj0avebBF93rpNFEk2k88LmyEEGz
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDA5OCBTYWx0ZWRfXzXhbRlhdW6lx
 1NLmT2XmYI01YLydITz1uUrH+kTGsMJ4QqtrpAFxJX6ByMe0g8vymb3O++PD2fR0PORrwW2QqPF
 n3ZfWNCgqXL3P3hyMzFZ+5gmN9XQ7BY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDA5OCBTYWx0ZWRfXyLzkOoP+iTaH
 9IQhsdYzYyxVwZO4MddP2AFib1I70koOvkv6WL6Jr0mNjQ9JkXrPA5yV2TOIRJ7qvvchNXYhILd
 5iji4Ieo97Sqdy6sVKVGttcvEtPRCdhpYUhY4I7HvfWS8NCoAwL9EOty5H0Mf69VvekKKz3XYjS
 duOPFYkpnY5PA2HcJ6+JJaRS9uj3U+M9FHaW5kdCQunQVP1CsrYddfHBDgGfRyybj/3YuYvavhO
 0M/sQkifKnfRAQTJq4BEtZ6avS7ICRZ+fWdkIkg2hEN6wKnxYo/2msmpzK6zQsKWWdgEdjxkolL
 iXV+WIlhUXUyKaQiyWf3Xksbt/Ln9GopcepAow51ornXnk4giTKEGiXxg1KyNl/uoc99f+6vdtd
 /2Qh0OsCijG3Mzr6PgIK3KGASak/IjfoB/0mLeM3Zl5E6dfPWdx6QQJnPVUsPxt0j4qUY7719pE
 olkjzlMbEcfS86ckWGA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150098

On 7/15/26 10:29 AM, Ajay Kumar Nandam wrote:
> clk_set_rate() returns 0 on success or a negative errno on failure but
> the WSA macro probe function was ignoring it. Check the return value and
> bail out of probe on failure.
> 
> Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
> ---

Please resubmit with the commit message amended and carry my:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
