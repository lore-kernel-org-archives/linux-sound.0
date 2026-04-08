Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD57C35FF58
	for <linux-sound@vger.kernel.org>; Wed,  8 Apr 2026 09:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775639083; cv=none; b=pW3l8nWFqtWnPbKgj5/9Yu56ibtwHBq/XMirvMYe1NfbzGKySrVkPndxvQLQo0uvZ+MaOSCaEQYcF1v28TiDE6jmyM+shSBseGMAebRPcWJKZ248zaKCEM/GEtbmGnLBk6hboSmt/zACzyszHOitE2vg8vbH8njF7zF41Y7fz3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775639083; c=relaxed/simple;
	bh=M6u+xr6VE/DbpW4Iixg2PfsnGpetn7BGbGNPST430WU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EdqHCQO0zIeNXQkl3Hj/bE47SJUmqOkey9Y7+JEaXCO9vVBM0INXgjUJFb7bcVDw/wBEtUsvjXCVWwdhmpXKXVIYdPIqTfO/5ecqxy2r0Rf3T57htG3/IVmXY8Nq1+T9PCzFL3JbWQACn/8aaSShfi11ItSUhwuJAbJylEbMuIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VDi6uJYu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kX+0hl7o; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VDi6uJYu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kX+0hl7o"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63858xLN3362745
	for <linux-sound@vger.kernel.org>; Wed, 8 Apr 2026 09:04:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CL/X7uzXiaevgQvCOvX0lKJHBduMg+ZaTPP1JggjxpI=; b=VDi6uJYu+DG03dui
	taZIb3G9mMKZCRSYTv4Z1Xac+Z8DkU9lCFmaD6WAeVlkfZdAel0wWSpET+siuavh
	01NBbXG0Z4bkHcBd6GK7zRTKQ8Sf7sdznVb8xmr1pT5gsoE1JKb6u8DDAT3/ndCO
	cigShLlwElpJQdTNnoe4eXlrnrpIDRsN3ekG6WMHc/2xTPzZjHxbM44VxObFm+SX
	w27YGbGSgnqO0j73bsCnTDBsCWD5Rn5dW/HzUWqw+zwTtHWfd50HsX6ebh+XbG+J
	gKYqrki1zGrxLIb5vfvFZzzBUGEg4i3ybLr6JFI4YQQ1hH8KErftGa0Dr3EGDHSP
	yECZKQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dd7tkjfrh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 08 Apr 2026 09:04:40 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d87632952so10409581cf.2
        for <linux-sound@vger.kernel.org>; Wed, 08 Apr 2026 02:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775639080; x=1776243880; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CL/X7uzXiaevgQvCOvX0lKJHBduMg+ZaTPP1JggjxpI=;
        b=kX+0hl7oDqXnGVmwXPPdw/gzUP4y6PsbxfSgXYGmJe5b2eMJPmsEanjob5IZp33ZAn
         n8kZSGQTJpU8zJU2qdKfd6l089H72YYVMj95/A0s0CnSwULEuqMcOrkXWvZx7yLD3doj
         fLi+7AUGAaaycyCslSvPSv/XeKjT3aabLjiv9tQ6/FHVc6knnpgiy/0HSxUblDcjxHJ2
         /D+Vx9JJTqlXaHFgAAE7YWDLFW9DLbB8jVNn3RWl6zP9vz11PEAN/e4JlNosuLcgBQQk
         X1phKyxzqfpMta7Le718vd9Dfz7Hdbnf2CjpkE21EoRSWi26COcLVmOCpwU3tTHgauct
         qXbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775639080; x=1776243880;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CL/X7uzXiaevgQvCOvX0lKJHBduMg+ZaTPP1JggjxpI=;
        b=P9CUnC55MC0gCZthhKrJ7TyopGoExQL5pMg92YJ1J7Et3ALPmgZXAQLpUGxcXKtWGp
         ridMqUIdIVE0/8AUtwou9dSiJIUi1b69akbwDsRcz5AaMVkTlUmGo69PdWMWBy686aGZ
         j/jEjyb/JtDqt+jTjmBHBLnJaqaGi87WbhH00AV6yOregln7RGXgsvSMsNtzvUjeX+Al
         RVtGqiHp38iq8UR+bMQBAPZHMnTfEl0Tje5d52SeL7EqMzeOyAwYe48XhjRWyEnJXYGw
         YD1w7pesGSUJvDvwQ66RmmPe7qxO2RZDbtpPip187dz6mQPLdU7Y8iBheE3kzyW+64+v
         Ah0w==
X-Forwarded-Encrypted: i=1; AJvYcCXXPYhA6V0W2steK98WYqD3+Soo+YJT1HC54ujAn9aGtubBpAKpAXCzDGzbA4BMV620iHwTqaflcG4tig==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9eS4O80GvdN2RWdGJEuuiGiKRpvRJsmk8wi+gBftU4nngNexz
	iUZjCmOARz/21JQ8Mpizar0ilszVmQkQjSBLyfJjJhidBRB9BqMwAabEbhhu64Yucnc1Cro5E5y
	A5riigXEBycnZwS/fVkKrHrRReIVhucJzQVE4ZbJ+/EJs30/fqKTdOjc9qMEugcbaCA==
X-Gm-Gg: AeBDiesSDEd3qBnlwIpeeRn3CIuEYUctmpmsMsZBuSW0tzYqWT8mfmuc1KttwNpl+xV
	Vp8P2km3Ye7aEoDsxkZ7miv/FvfxtTm2KTytmN+gBTHucEAL0tTAdFy9dPJ/IrXumm8+WS66cJO
	Yxj8ADU09ldB3AWUE1qVPzjUWqj86q8kzEJtwkq+4ivMubPLQU29viEzCK9cclFirwuRa8kqFIf
	piYiPNayS7QIypuUTSz960ubhMeiR6ZXeksoULPHdtKmuGE+0Fh0/fdb7yUWB7nrD8Ml+W+pnFB
	IuP2RHuipkySM3e77U25e2wN9ywz3wZDW3+/DE8jAuL7S5dZiTaMX9uDM51lo1PSD5SmKraOPtI
	BJXr4OStqv6ddcR/7EI/oVH1BQk7M7lfQlEHUQder7LJ7kHlnLWY7IIGNhmf1/dwZwRTiEDqosy
	bLE3A=
X-Received: by 2002:a05:622a:480c:b0:509:15aa:cf03 with SMTP id d75a77b69052e-50d62c49d79mr217663931cf.4.1775639080028;
        Wed, 08 Apr 2026 02:04:40 -0700 (PDT)
X-Received: by 2002:a05:622a:480c:b0:509:15aa:cf03 with SMTP id d75a77b69052e-50d62c49d79mr217663631cf.4.1775639079628;
        Wed, 08 Apr 2026 02:04:39 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66e033a787fsm4910134a12.14.2026.04.08.02.04.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 02:04:38 -0700 (PDT)
Message-ID: <b788def6-a227-4807-ad3c-46515e83575e@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 11:04:35 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/12] arm64: dts: qcom: kodiak: Mark secondary USB
 controller as wakeup source
To: Xilin Wu <sophon@radxa.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Judy Hsiao <judyhsiao@chromium.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
        Stephen Chen <stephen@radxa.com>
References: <20260407-dragon-q6a-feat-fixes-v1-0-14aca49dde3d@radxa.com>
 <20260407-dragon-q6a-feat-fixes-v1-8-14aca49dde3d@radxa.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260407-dragon-q6a-feat-fixes-v1-8-14aca49dde3d@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=drPrzVg4 c=1 sm=1 tr=0 ts=69d61a29 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=ksxQWNrZAAAA:8 a=EUspDBNiAAAA:8 a=TkYFqX6U-2Zjo2NPXsUA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-ORIG-GUID: 6J5yWZXJPXpJIZvLscrjxlX4eC3rGjEh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDA4MSBTYWx0ZWRfX/R8iPam4R9Pc
 tfQsovURMo+YWrrUCnzURq1V3mvszGTLc5LG7MJ8SyBxiaHxZNXMXXm3ZJnYHQ/cKx9d1720uCD
 tBw2HH++muaZMMt4aSpRpnkeCJ5sOpvQvzQZ6m/FOPt3oW8UoZ5BY5v/HW8K261696Shc91ChmF
 CiKpgUO7rITsdTAvZZIXlNyGr2bAtrGPP5bXadV8Z9i3A+5TWbH5d9Yom8KPz/Lgn5KbqPRZaTU
 sTYv8sgZkoo0osbvT9WXjlRTkmghSMjMPW6U49/4UBfTkHMl6hFvDkwIq3UVHEfSH7y9BboW5U1
 vAY5q7oAC4fJO9kslM2lWDZFko7OaB6t5YzvISvmMVjB3rkDSKjqHHBwdBhq7TAiDJm9uKdxfCo
 RTdhjWeTPHp7WW0Okhoy8TS8Sd1iEP7AT0KQLfnsVM2tU2fqyBNsYDqNrQvN2TrDxpAJZfzZ2Dc
 6mzTfVs5MJWxRIqiH5Q==
X-Proofpoint-GUID: 6J5yWZXJPXpJIZvLscrjxlX4eC3rGjEh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_03,2026-04-07_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604080081

On 4/7/26 5:20 PM, Xilin Wu wrote:
> From: Stephen Chen <stephen@radxa.com>
> 
> Mark the secondary USB controller (usb_2) as a wakeup source so that it
> can be used to wake the system from suspend.
> 
> Signed-off-by: Stephen Chen <stephen@radxa.com>
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
