Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07D7D36BCD6
	for <linux-sound@vger.kernel.org>; Wed, 17 Dec 2025 10:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765966779; cv=none; b=sCqKmnrnncDsQOrtlj5TuSUPwb7h5IPGbHgpU3ymJSMkbrjSPJf9YUhMYtkwHAUyLIeVV0JnElzMMwXjurs8EwUtcBRr1JAeWO3WkX2KcaNzBMwB8qSY097pmuMUNgZe0WfKSf7AJ+DBlm9ARCY47BCX6v8KNHqggBEkTox0jS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765966779; c=relaxed/simple;
	bh=H2HUEdByelPd3DGstmAvY3EnGJYF61WOJiosxlTLWYU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TT00HrUAsh8Aa1zHI3uZzjq0VM0jqVwJXOpTUYZLpIpgy/bqFSOJWdycL9Hmw+4JHIMo0LJG9Q9fYQwqqFSWsV81Y/LjJPWXMpEhP9dMoUBfMz0/Rh/S3OeV2aY/bt8uaH/MQGigxZW9ZWnqrD1dKE1TAt9rT0AVkMo0E4ngois=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mGvzl5Pe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ODNYZgZL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mGvzl5Pe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ODNYZgZL"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHAJMTC1564912
	for <linux-sound@vger.kernel.org>; Wed, 17 Dec 2025 10:19:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dCJOsubFh2Ey6aMXlYEvjCZIV8RNFY+9SFMKoPpsEXk=; b=mGvzl5Pe70ngBgop
	p5iW6vAB74OWSRrPIYe8Y5ZAjuTpfSX0MJSxPALl0AqsRHg0OFNUqjeEU/fKNpTb
	3oCXPpNdlqm8IT0f7AHFtGKB2FM/ToxHC7D85wO5Z4i7XCTGAtI+G0P8a2Ii6dXb
	iQfL6yp5EXppT7sj/O1lXEk9hSaSZcSSBMAKfvp9RzjhYLoEnLg6s+r5QZj92YpU
	XdXLWXsDOK6If6Y3AZH5vC2enqt6I9vtbEllkeU5UuoACCabE3aSP8xl4xIxn09v
	8crFxtJur1y0gQevoEAtw3xKOmqQ3dlA3fHrjSSilHabARH2F1P52VqRLj40SN0B
	OsWtfg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3myj17et-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 17 Dec 2025 10:19:37 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4edaa289e0dso21482531cf.3
        for <linux-sound@vger.kernel.org>; Wed, 17 Dec 2025 02:19:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765966776; x=1766571576; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dCJOsubFh2Ey6aMXlYEvjCZIV8RNFY+9SFMKoPpsEXk=;
        b=ODNYZgZLYOqQa+osk6q6+WdiYU8bAjNJYV8cRUImhDBE+KnC4FrK9jILSfA5ZwwNl+
         QU8Xsxn3fG0RyzkiKIWtSmmfgCYCc0YkI+QiF+o+y8R1Qq2GjRDBtyNx0wXmLXO5iUgQ
         kgQsl5Jqve2UmdaQ8z7VNXfZoC/EtbiJSLySg9wIv8NPOa9cW+Kez75LTHU4Hq3o5XJn
         obntNSnJqHVcOg+MDT9zxwXMuBIj10oHRww3LXMwHbW2Y75q/yxv55c1GzcfA+lneXLi
         XTc+WmGaFDlcrlLbh1Bp3SWcnp7uFNyQH2MFic2S11n7vSBd/MXcEdmM5lbLLMr/8aGl
         8fZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765966776; x=1766571576;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dCJOsubFh2Ey6aMXlYEvjCZIV8RNFY+9SFMKoPpsEXk=;
        b=l72yK8FjNDBHfTFJ508vc82AKnsjHxQxOjiW6KPBYiAdwDLzaqD5xL8jxkXD6Wu9Z+
         N+qlLA9bhCWPyYdGOl4Z5NYGWQBONOqMtZeWG1aG0vDxRQE6To/W1vRYaeBFdQT8GoSA
         TFfXqagdhcM+4K8vZCZjfsPPut5H05r4LgICEZ5o59PnqbnwexP5j1oVZZtWNaBPTlee
         Dr6goCZm5qWcdYiU0gelz4kPlQAGQ3+Lb9vE+TBzWOuXn/1xJzOqRRF6YpZ3oTOY7uxi
         Wfr9Gnzix7l+ds7HDKsH9RnM22XXgnQCn06vqx3XBhWUsv/BvqrWOyLgXeTCOOb1ysYO
         SazA==
X-Forwarded-Encrypted: i=1; AJvYcCVSMhIkwG36e3OhOCdhbO7FFl00vi6urXAu6VDHcHWaciwGy0nSvjVKikbJ2zDEsdTUbk7/Y6C4ij5baw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwC6N6ITOBa1siSJb/xDdvW1OLKlwVE+2n3JxFcd31iMjPML9NE
	ekw4LmMkWE+o33VP3R4okpmtDwcEkVvL0ZJi0E67KTbumhplwK1TC3D9WJ4ExuUWayWrrXOTlg8
	Iq8i6y6+Olgsmh0/nfoWWfSVkhsVBce/ESw/Mj67nNb+m2cp4ffNUYMDr6DZF5xT4lw==
X-Gm-Gg: AY/fxX7P10iXyiIzaaXQ8XUQWL6WEO5AOjiFb816j6hxTbjQ66cDihDxo+CpI74bwNx
	2KvjdhQiCCxWjuJ7r9qfvs8egTAqQUFkGQ2feuurPY6ak16jMGHt9dEzavc0aCOtRYKwuJB+zV/
	lJ9aBxZMzaRutrN/vYydds/bGtD9f1nkbgsj2APMWSnVD6Ftq0kXkZaJ64aBsrzB+ocdxSrGVGT
	28ueeM4+lUj2v2ew0yh4jpEyi6B+cc8BDfw1GUmN9l+VZkiBM6EEjUs1Gk32HyboMB7dTDADyAD
	wqGd7XPRBYEckVQaLvWXEHynHCcp2E4aNB4I1lSdDUYn4d2NI7y+VI1FZkLqVuES0Cuw9noXxy6
	6S8rdwEkhTFEFXx4TV5XO2RdLoyP5PgHyic0d+BsSH2zCZZMNCceUKdrveqcBv5KjUg==
X-Received: by 2002:a05:622a:610:b0:4ec:f9c2:c200 with SMTP id d75a77b69052e-4f1d0655504mr185869111cf.11.1765966776186;
        Wed, 17 Dec 2025 02:19:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEytVbtSpVSo48ryKH+7IV6CssJie3BvYk1HDT9tqApjXflZtE74dSCo7/caeEOy1Qtb3mPoQ==
X-Received: by 2002:a05:622a:610:b0:4ec:f9c2:c200 with SMTP id d75a77b69052e-4f1d0655504mr185868721cf.11.1765966774969;
        Wed, 17 Dec 2025 02:19:34 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b3f4ea67esm2065361a12.7.2025.12.17.02.19.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Dec 2025 02:19:34 -0800 (PST)
Message-ID: <b7ae5cac-5eef-4a3c-a1a8-01b1d1b796cb@oss.qualcomm.com>
Date: Wed, 17 Dec 2025 11:19:32 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] ASoC: qcom: audioreach: Add support for VI Sense
 module
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
References: <20251217094602.55117-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20251217094602.55117-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251217094602.55117-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDA4MiBTYWx0ZWRfX9Ai3t7WWx7hC
 zTRF7qqOCQnA7MUlvzSIf55PcIKNnHt93cCU9ByoAeWMd8UkfzUmX8Uq9rAzFR/AS4Kx8QiDFK3
 8elMDSEpfeCRq1ayUge+CvbhjKaI8+QkvH/OqfKMFtYvQ6Z84WUdG9buMFmLqIJ6Fz/5VRgzokQ
 KYlkVaiuN/v+9dbZK5baDsnw7OC5qeEbonnms6I4jmliJPL/vZhwLTiJjrxUyTR83DZj714GHr1
 CTbXN4AlSrrZl/e8lg0WH5hQa9m/FMhrYbuB6LkHd42bbOMqtDeO41bO/I4XUyeJoqAVaeohgAU
 W8K/ajHLe4ot8e7FMUV1hYXa0pnseSS5CAJGZD/4dgosXp5fWtQtunpWvuvAeVJ9vtBIqAeuXwB
 IXXekWcUojiDx77TOUyBjtEb8XWthQ==
X-Proofpoint-ORIG-GUID: 4WvM9xQ5h4Y-fbsq4ePhvdvjV4fy_Llr
X-Authority-Analysis: v=2.4 cv=CtOys34D c=1 sm=1 tr=0 ts=694283b9 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=mAryq9t2eioX0dlTFTQA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 4WvM9xQ5h4Y-fbsq4ePhvdvjV4fy_Llr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512170082

On 12/17/25 10:46 AM, Krzysztof Kozlowski wrote:
> VI Sense module in ADSP is responsible for feedback loop for measuring
> current and voltage of amplifiers, necessary for proper calibration of
> Speaker Protection algorightms.  Implement parsing
> MODULE_ID_SPEAKER_PROTECTION_VI from Audioreach topology and sending it
> as command to the ADSP.
> 
> Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---

[...]

> +	cm_cfg->cfg.num_channels = num_channels * 2;
> +	for (i = 0; i < num_channels; i++) {
> +		/*
> +		 * Map speakers into Vsense and then Isense of each channel.
> +		 * E.g. for PCM_CHANNEL_FL and PCM_CHANNEL_FR to:
> +		 * [1, 2, 3, 4]
> +		 */
> +		cm_cfg->cfg.channel_mapping[2 * i] = (mcfg->channel_map[i] - 1) * 2 + 1;
> +		cm_cfg->cfg.channel_mapping[2 * i + 1] = (mcfg->channel_map[i] - 1) * 2 + 2;

Fly-by review, I don't really know - can't (channel_map[i] - 1) underflow?

Konrad
