Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E79E30C61F
	for <linux-sound@vger.kernel.org>; Thu,  6 Nov 2025 10:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762423234; cv=none; b=ljhg+5CY7KLhAZOamvzdS13N/fntyYigZkhnoO6EYMY5qbSEmeeK4g5T64mA9Lpx7jQp4Mmp1fULc0QGYMYfUbM4jYZHh6F8+ryj71Az+ryXbqPXB8Le2p2famsMjf3XDfDmtGdQOEwIR0VP8ZoYyrloY4shwRDAHKV3bsQeON8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762423234; c=relaxed/simple;
	bh=wF5SPjX6L9XXVGJFNxEpnsrq3oXW6/HgW/D2cEkYYMY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PYsXf63v1cRFtbn9G/R48IH9fP5BnXvZZ49lu/EROsUaHbWeouQrjEs3KeUJ0vVgBO5MObONGRemnh08KcMp2Nc5iCoyRZw5p1cdlO5tBODpC9Z/8X2xAu9jYe86UBDMKZcw4E/tywFJixoqelNM+FAL/+k4hg53gDEe1DnFCuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ifP91DDZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aNf4coyy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ifP91DDZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aNf4coyy"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A66ANqj1738544
	for <linux-sound@vger.kernel.org>; Thu, 6 Nov 2025 10:00:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KJ8tFZD23D6pv8VDozl2uS2hfghTxj2rEDZoN/LKKwM=; b=ifP91DDZy6iM3Abk
	cP0JBiKwjDD2eeI4W27adRrP4wcrrtSWDVjITYS5lezn4GN4DkgPbkZVpXlr269Y
	8Pj1a5P66FtMEo9NTHHIGTCUcsA/ZRh5K8FIjSxUn73dnQGQob8PBeRYuDgYQCyt
	5BqyNMWbkL2T/rMT3f1hyrkNY9andSN2wyf0E9gyHwZ3eTmQzMLOfcRAsdM7k39P
	aAGzvKmhxTKcaxjUWJr7IymAdvF/v9viCNyVTvQ9Nl0nmBishHhotMF61nLZYa7R
	bczqwXrHwYisCfFVKAHWW3aHCjnfDl5DAbQxNpli6tCuwagTU6NQnxXsM9xJN360
	dpsjGw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a8an3tn8e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 06 Nov 2025 10:00:32 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b21f4ce5a6so2122585a.3
        for <linux-sound@vger.kernel.org>; Thu, 06 Nov 2025 02:00:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762423231; x=1763028031; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KJ8tFZD23D6pv8VDozl2uS2hfghTxj2rEDZoN/LKKwM=;
        b=aNf4coyyOHtwbdUmh7WvdkeOW+CwphHarwJLmZbgom/+xKC6g5kV1Tg9uSfT4Kn1y9
         Ex4qP2TMeTPrJfPWiHIewoGo3PfTf7kRBtryn+bS7+PaevKxjffVVD2JiTHMSYRaoWaG
         flnGovewhAY3lul5nQs43TWZiQaYtI+rNVGJA+QZ6aRAHjhFSIjXF4sLgL5H07eJuMUb
         dHi/6Ont9RhWEVJ5r68qXMxJoB32TQMkB4CMDNv+FT1FJQhfLkCLF63fgxamKHKolfhT
         w1KuKu3RPp5CqPU12XFYj7kY5pqXCVtGdsVHExHTuK5kSHcL498Asqs9eQ6/y/uk5Gmx
         wxLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762423231; x=1763028031;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KJ8tFZD23D6pv8VDozl2uS2hfghTxj2rEDZoN/LKKwM=;
        b=iFXSLqxM2tuPPqAwWgUWspXXCGda89BU8jaG++AvRIts/Ppm/RHU497R31cCdKTYsA
         VIDs220US4y5LdsFsAFIgxDAtId+VaEj5Y54u9yrm4N9tw5pw5gaHR2IoPFHoUEH6FD4
         B3juEt88MUnEIh/jVNTqi8dlTwaeS5e0GiOIQqoOtPb6TQlUFkxUX5BByiDclbaHpozJ
         gg9SyqhsLpNbJ26jQgGU4Gra1SOc8++fLsRn1JsLVOUQhepc2oioeOK8DcHbv6ZswoDU
         8s5Vdm7HTWwTk9qkz8erpU7hgWXiwjk7gu8o9agsc/tlEkRVealoPCshCu0B2Dyd2GNy
         Lcdw==
X-Gm-Message-State: AOJu0Yw+DfwvwzeYVTuBJm54n5Td3f97k9c3oM2D7WRfpkSCI5bGJhOw
	RUYNP8zfDDc/A4Mv3xUNPFIikgrlicLWicbL9N2UUHrygHAqFUp5b1x1geMaHI7JcTbK93Qdu6F
	H+xbK3eScJBposWoCmr0I3J96NX3Ud7QD6oxz1hAsqFrlLyis2ytImmjkfWEOT3XuiQ==
X-Gm-Gg: ASbGncvEFEQ99BbP0hBUzTs71Crtkt+jdj7srpUTGP4fzDEez+9zgpkhsPL35QfWLmS
	A24SGeVx4cLy4rCue34PaHa+dfdvW1hvU0K775pmmSn8T9AhHPJL4PGpm+FXlCQU0SCXW8EpfTr
	njVaCe5C5f2gyvdbKaY4M0nQjVTWa+T/qfpqU1JEPKYPcRjuZfUdOVvpMH7hUWHNdjzaK4PPKeo
	R2cFNSrtyN1jNA4zQXOn7sgpPu8hE+YEpiXrq0Xw7bW4Qx0gMJUwM9mUufpjDVspu1uyJyEpfyW
	r5UGg6GcGlvtOGhaZmDN4lYJWnnfkObq1xH8AoRsMhOpG9GkAWhBJXblVrsJ4t816AIZpnbddez
	2L80CCqrTLL9kcxHh9NyvgS7Nv2fH+XqBDylhLmGJ3x8FkCmAi+XyKbmu
X-Received: by 2002:a05:620a:4693:b0:8a6:1a5d:7aeb with SMTP id af79cd13be357-8b23748b481mr153974085a.9.1762423231560;
        Thu, 06 Nov 2025 02:00:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF4uHm6Ex0yCpTYXqQ/1sUu8JUANR193GdIulgFOc0pBc4KTLDo406B3DhFtvNvYfqaZzJcLw==
X-Received: by 2002:a05:620a:4693:b0:8a6:1a5d:7aeb with SMTP id af79cd13be357-8b23748b481mr153969985a.9.1762423230911;
        Thu, 06 Nov 2025 02:00:30 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6411f713a68sm1456023a12.2.2025.11.06.02.00.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Nov 2025 02:00:30 -0800 (PST)
Message-ID: <04ef8cb6-8d0e-434b-adee-b7e32a6e0b8c@oss.qualcomm.com>
Date: Thu, 6 Nov 2025 11:00:28 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: codecs: va-macro: fix resource leak in probe error
 path
To: Haotian Zhang <vulab@iscas.ac.cn>, srinivas.kandagatla@linaro.org,
        lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz,
        tiwai@suse.com
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251106075055.555-1-vulab@iscas.ac.cn>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251106075055.555-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=W981lBWk c=1 sm=1 tr=0 ts=690c71c0 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=_CcdfDJzPmikts8YXegA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: MqRhBohq0idwWd3hBM0q1eLbajHxWPx-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA2MDA3OCBTYWx0ZWRfX5xPPZNLscLT8
 5ZjP+XYWlbEnqmWEJHn1r9CxbnnyywKiBy4jJQE+0velkCTXnHcOfTLMUFVaKU8LaHu7pADcto2
 QdC+Hcy+ZCQ12gyn/msCP75HkQ6ZDsY6moAWJe5rfohhXLBboTWqCL0sTAbr542A7C5kWdCq52X
 LRZr2knxqSd41kT/86sMf6shMce1Jst13VVJ9fWYPjEisTpQm997tYTdviXOqaizS6XETYY+qSS
 XkpaOTN3WOJJQsBxooSzKjyF+Od4oJYfwA7aPjOmxzz0j4rN6IOrcCMKRV9PjP5l74P4XEldsZy
 kmeMWTLxPlz4lnHjt3iZG8KvO9vu9wqhRisgsUKujgWRzMtHGr6a33+jyfmWqKtH/+T82/w4dE3
 GQ8m48neW2BLvft+qQxjmdSkZyewog==
X-Proofpoint-ORIG-GUID: MqRhBohq0idwWd3hBM0q1eLbajHxWPx-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-06_02,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 spamscore=0 impostorscore=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511060078

On 11/6/25 8:50 AM, Haotian Zhang wrote:
> In the commit referenced by the Fixes tag, clk_hw_get_clk()
> was added in va_macro_probe() to get the fsgen clock,
> but forgot to add the corresponding clk_put() in va_macro_remove().
> This leads to a clock reference leak when the driver is unloaded.
> 
> Add clk_put() call in va_macro_remove() to properly release the clock
> reference obtained in probe.
> 
> Fixes: 30097967e056 ("ASoC: codecs: va-macro: use fsgen as clock")
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
> ---

You can switch the clk_hw_get_clk to devm_clk_hw_get_clk() instead

Konrad

