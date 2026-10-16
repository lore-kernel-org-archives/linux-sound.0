Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE4D943498E
	for <linux-sound@vger.kernel.org>; Fri, 16 Oct 2026 08:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792138477; cv=none; b=Mf1DLdDu2S11utynCbbrnU2q+1/X/k2qYFWQEyxjVwoB0t4D9tPEDHrYGeMmqFbl/rizl9jRB5syPzR6x8w4eL/UZp3bbZPSQL83sqFH3gRsbDbY/lwxJiXY16uGzdsXJHK7D0UE6ZxRgTAlSIjk8VVgW/RIZxEWd2+hcXN3erU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792138477; c=relaxed/simple;
	bh=ewweEl0ILmlFEynfdw37i+tzRtA4GALlKRycg76XvTw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z/0uqaZMlWTxV8FZ+89puEN7CBEwVRe68ILkeO4uFCElKJtrA9OyBtMz5AOtsxKMLKYuK4bW8MMPB04xNx1Lo1E9OMMNJ57voVHmEbHiu/YnwxHYtWbX6TvId+5mCkPsN20MtKTi/cTaGWHbt2MiAWkXfVTg7xuft4jmrn/+7Rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eX4LkD9Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kEx6you0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eX4LkD9Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kEx6you0"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G6IGQa4126415
	for <linux-sound@vger.kernel.org>; Fri, 16 Oct 2026 08:14:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rUpPh65ghh2SzJa+5Dba6n2zsetNR6ZekjY3hSaL+Kw=; b=eX4LkD9QphhegX3G
	fJSC8i9CtvbMoISkCJqJj4tLN83yck3czz7esLSkPR/JWEMMHZkGzJigNb4qDoqF
	uOx79DkjoiaCpRxgvkHYJfoN3sBekrGG+NF76SBzOnx9xrn1uVPW5qaxoJiLBFM9
	pRjhVIWxE0hCPaBIrrONitdxgY2G6TC1zYyKY2b2yuLl+rhUYuJaK3uabdmWn6ko
	U/TRGHysUeKbImfIiYzJjR0Db+wOTlAu75tiBLSJnx9mKhJb5Q1pUIPkWopvZiEQ
	wUskhBdZHFf2DNKOWElvGkYf96aDAF5+NXwODb5LY1Y2Un/J1cQBifjOC1L1WaXO
	NME7eQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb19m3fbc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 16 Oct 2026 08:14:35 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35a4d2e39acso7030018eec.1
        for <linux-sound@vger.kernel.org>; Fri, 16 Oct 2026 01:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792138474; x=1792743274; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rUpPh65ghh2SzJa+5Dba6n2zsetNR6ZekjY3hSaL+Kw=;
        b=kEx6you0GSNfuMzahDdi8RhnoNxyyWfxzq7yHyXVs2dSZrxbxrAzTCnimK/kmvx6sq
         btjNJrs+4hbPECdhzZrQYjbHMga/jwrocxsV4H462lrjikFmk6ZlkZO2QLmQbYFyqP30
         odXjRGEytl9YVfsHjfJxRVBf8Lh06X/BrgeisysELHNp/AO44rekuQItCD7wM5xvAW3m
         qR3kVvBP0dU+EHTdUldaZqh8ljiQnaA7yidDBlwNsLC2JeHmDYwQp6c8pcp3GMaVar1U
         qsRcoYCTEzynFdO+h9uRUbiz8oPjSHEx+2YZJlZDKvk7od9qjLL2I9jYV9BJ4XzscM8V
         fDXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792138474; x=1792743274;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rUpPh65ghh2SzJa+5Dba6n2zsetNR6ZekjY3hSaL+Kw=;
        b=OVd3odahGSa+wvY6jcXLwZ8XpNmzY4NgarmQc1BXjARqBTTEf4o3CN3ks3AmnSmO9B
         nOLfPUBlJfn6tSPeJ6KcJB3ZqhVpv45kRan2G0Hk1VJ9kqRPonZUpdKL/TreBZKbkH5q
         PU7wYowBmbEMq5PvMvgLrHbf9Vo1iry+sRy/PsLo8dWP9Dsw5+Oc5K+Nw6cPjuIBQI7R
         RJFOD/y6nBAr+H+Ii9cZJhR4bQW7l111gTE9VBXy2H4+AirmpNBLnSpcGKQkno3YhSZm
         +CE1yKu/a8h9MkGV4Oyhntqk+77ek8GTpU1YyIJfuC4doWX5gRt4PDtHHhT6Y5DCNcaq
         xUsA==
X-Forwarded-Encrypted: i=1; AKwUvBwpBtUywZ88P6Ok0vwP+AnkWr2lVTHf2PYc4kI1+b1Noy0PERYEPyjBJXsQ7r93+1PVQRbPDHweRmFneA==@vger.kernel.org
X-Gm-Message-State: AFq9FYIbYhi0m16EAc2m0FQalh8ZqqPK/Nc/+Yn7aE1BxFP6F84Q0FOf
	pLjUP7vOfuBx6eKcr8ukzWw3jXg5Yx4gOdiPNIHR9zPXYiL64EhCMwf2nVc4cXEbWSC8l/HfIql
	jhyIuIhJxv+tiIpOo+xCygXlRT94aJgOhgbBjL44J7RwRpdNx6sPt6XFDq5XaoTz9wg==
X-Gm-Gg: AYBFou0bPSca9B7RqE0ty+Hniq8JDVubk7E0yP0JmdR4Md+fB6yQAtQXLn0npqYBaEj
	kyl2hDUTcVPtNBXpOfPlRxe7CkapUCj2C8R+BBiUyVxzDw91br14UwdIS55Cery4+J5SQBykJ0+
	rhSzV0jix0d699VUCHBgySElqg/MPKglm4LUVArANRIVujxlVvy+R7NVb7dT8RAp+GfY/9N4Wfv
	+QUaL9HD6nc9v9CJulC6P9sYCQ+SB31bEXY7nCP1Y5mozdZZnVUyZq2rLx+228IUPW657QxNhxq
	5vR+Rg3OEJAFKLvO3ZdugVv5KfYOub20mGZl3HrUb4dGdBaiUgxBTUJEslYHZj6S8YV9msz7f0M
	dCSZlkEcIOa7famF61/bowCkB9uVGMqvBspM=
X-Received: by 2002:a05:7300:6cac:b0:339:7b3b:236d with SMTP id 5a478bee46e88-3537dfc8fd8mr41404498eec.15.1792138474361;
        Fri, 16 Oct 2026 01:14:34 -0700 (PDT)
X-Received: by 2002:a05:7300:6cac:b0:339:7b3b:236d with SMTP id 5a478bee46e88-3537dfc8fd8mr41404461eec.15.1792138473880;
        Fri, 16 Oct 2026 01:14:33 -0700 (PDT)
Received: from [192.168.0.106] ([124.123.197.75])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607ee0e5e6sm4528052eec.1.2026.10.16.01.14.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 01:14:33 -0700 (PDT)
Message-ID: <9a12fc9c-e766-45d3-a6f8-eb6ff3332434@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 13:44:26 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/9] ASoC: dt-bindings: qcom: Add Hawi LPASS macro
 codecs
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261014-add_shikra_support_v5-v5-0-fb9f0667e613@oss.qualcomm.com>
 <20261014-add_shikra_support_v5-v5-6-fb9f0667e613@oss.qualcomm.com>
 <20261015-grumpy-salmon-of-holiness-b6e9f4@quoll>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <20261015-grumpy-salmon-of-holiness-b6e9f4@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aLdlOr9m c=1 sm=1 tr=0 ts=6ad1dceb cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Z7qWu28e8E/v29kk1A4VTw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=qLKQgrqcCyXtwMQRFB0A:9 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: LaCpIfPRGNQ4mEXAfoOFJKKQzZLo3DNr
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzMiBTYWx0ZWRfX/SUxgLw4VMab
 /WTxFlxs6JvAzyjw5WvRdfAZOSp0rrf/9E4o+4VB0XmHxytVMSPNI7OlotWrYO6O9v9qm/tgMBw
 QXwDlvfNUiad8k6RueJSjtHe+u7THGo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzMiBTYWx0ZWRfX7jD9qMEVzQdG
 q9ySkosnZng4tXuMGynsG2a62Ukb05cKSPJgf3PIYQPPCaBokMYI8c0F+BzwHaxlg6GFOZGUsAK
 wc6U2HzeETH5tNSeh7dKk5DrwlWxYf9uu0lVAVs5Sp3n+JDRLL/CFnnWNUiVCqUe6CnRjpYIk93
 S/uxVbk7kUzqAaMzQq8+cPjDlKS3PUU0rgMIm7JiLPlMnqojCoxvZS9W2l8YSJocELeJ4QZB+uF
 ehwYc2JMMONwmxK8JjV6pOncNd4e2IUyf1+u9ZyElnl/zDeLWPLZf6BXI52X3xi+t61MlGEQbwV
 xCU+89fjp/Giq3qSGW1JGqFGU/I7toqxSNRFLnwG696rgcn7gtm/a1Xw3Rh622pOjTl8AKvEUhS
 oj61tTpjiFrKw6iPkOsb77xEf5qjjlgfuZ3KYs/I/0AkK9Ojx51peLqhNkAVAxfzu2r2iIBOpGm
 dsN4r7k+ZM0S6r/NmfQ==
X-Proofpoint-GUID: LaCpIfPRGNQ4mEXAfoOFJKKQzZLo3DNr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160032


On 10/15/2026 3:08 PM, Krzysztof Kozlowski wrote:
> Are you sure you are not using source clock names?

On Hawi this RX input is sourced from the LPR vote (LPASS_HW_LPR_VOTE)
instead of the MACRO vote used on sm8550:

     clocks = <&q6prmcc LPASS_CLK_ID_RX_CORE_TX_MCLK ...>,
              <&q6prmcc*LPASS_HW_LPR_VOTE* ...>,
              <&q6prmcc LPASS_HW_DCODEC_VOTE ...>,
              <&lpass_vamacro>;
     clock-names = "mclk",*"lpr"*, "dcodec", "fsgen";

"lpr" is the same style of name as the existing "macro"/"dcodec" entries,
not a parent/source name. An sm8550 fallback can't be used here because it
pins input #2 to "macro", which no longer matches the LPR source on Hawi;
the other three inputs are unchanged, so RX gets its own clock-names.

Thanks,
Prasad

