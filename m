Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793105990;
	b=QjBPoCXhb1+0PAJ2MqDQusIq7eHxYrRrbMRSHmanoX4Jh6s3h2cYG70rGWkgoXP2VUqC
	 M9SeMLd/OZNzqqOb2adarFC3Zeps1O2IKPEeMqDAZ6p5AwT70wn66Ng21ZU5USc0xk1x/
	 izVefG2l62++a8ii+cyIhXlPilCSUMLC6TDuqR02WWeZMcHiYuCZcK3bkE8PhrPPGcU8m
	 sTJqrqRAceQDMXSSE9V/GRBZkTRE+2e1qqwZWndda8JvTww6rE/LMxZTAPxxi2dSgBIPe
	 3FA/j0PrFmMUfc6l4vACNAGZpm3X3KHmHDrftCM4bgRziHMwZEUpFnTzXDx1/Oc9vVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793105990;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qNVNz3OBbK+duGqriAAIawFlLoB+G+Oeet6IJhveSPE=;
	b=G6iQiWJxYPKYLZu1CmSBRz+SPEwc4hcwR/v61VBbVgK0/pxMAvYsjWtBxuiUMlsULeRF
	 4npfWqvveQYVoOPkmZGySI8Lr8Or14WIkV8HBuWxTfAXAbsaZSzmATsrx3B2MnC6za4fD
	 qd+fUQ23l7H/nvYfdHtzD1AlRD+whyYuPt+URTDHwIiopjwm91c1DlhLNmxlJUZkM9r91
	 oeCPAzNYJX6a3HFSi5hhKRIsB3x3pIOw/Z4WcLhsTuxyS3aAmSzWtdSobf6Mi1rvS1lt7
	 Vf/fbawBWVrQwWQ/c2KGc9Co7tOQT3NzclxErYYZElcAoqWTvlOiVv+O4hu1anAHopw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ui885gUj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KA02GGmJ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84ACE606A326
	for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 12:59:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84ACE606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ui885gUj;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KA02GGmJ
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAdw4O1061087
	for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 12:59:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qNVNz3OBbK+duGqriAAIawFlLoB+G+Oeet6IJhveSPE=; b=Ui885gUj+bWI4Obz
	FzAbcwkFkUI6t9drRFkPFpZhgb3h2gcH5tCHP5wAncNb/E55O1IIueNEfnU+RqY5
	K/czRHq3hsydzTPh8LI6KCwWPNYhQAwOWjWOFue3hltVc8UN6110CMEcfAsm1vxJ
	hY8LF/kMUp+2V8MY3yXEJNidNEAsO683FzEg2G2hrYNVsen/xMUDD6SDNI11Keaa
	63IAqGQ67MvOmi3fllOI6fmkR5OsLGPnOygZIVkQxerI+k34gyS7Qau1FwSbvPPf
	+CTXjErNZ3fUWI9fUEh7IFMdeh+yMT3UcVqdFVVDbEGkXPDKEAqp/TNmjotZWhpV
	eagBrw==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjp2t9kts-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 12:59:49 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-82169fb66c3so11017842a34.2
        for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 05:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793105989; x=1793710789; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qNVNz3OBbK+duGqriAAIawFlLoB+G+Oeet6IJhveSPE=;
        b=KA02GGmJFiToXYtilHil9yyy9MCX6g3bEB8kUhtF98SJ+41Z9kwJFdFSmrRbB7cn5c
         0I2O2mFu8Aat7iTiGa05Xke/iVzyVXEr8yCzyWNM9oJZeKf/gSiNGYcc+N67UIT7p1mh
         kmfeHf/KqCtJO9rup2jktjra5JHjJac4AGbVCpTQ4AcfTeAreL3KOJ8xZCLFa5S7y+Qv
         +p59c/bppCV+p2vt95Vb9uAAfGnCppJWzoDUwyRpsiMCyd2q/ImLOOjrDqSeuKKpCieK
         ZHX1MH9pSXkNX8/RdaNLvIoBB74Kmhf+7RIPjtAOqFaw1tw1UpqPx8S7zTPOLaaHQg2W
         ZQcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793105989; x=1793710789;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qNVNz3OBbK+duGqriAAIawFlLoB+G+Oeet6IJhveSPE=;
        b=JSkEl0t/G88ILlNfpO3vBRqxaae6YKaaZwrY2YYC4jYhhun0N5s3tnDopDcPLmL2ou
         vcwyg9xN1WWfhqOXCuoGSVLPqnrMgKFKaGzAMh2lpmsObukDY7jdNO112m2ejc+jjJCz
         b9ElOt3V9PjKvVZ2BpP3BDrD/c22ayplDTNMZvyq+Frz+Tvz4ekGtQrxLgshCeYNj+4Y
         7NPGA+J9/wyodG17sqNiQ22PxSBXcPSL79JeNhYj3BbWLo+ppKJul7ux4Yrna6NqA47C
         7yjPIZyZmxuxSlgJzEH5IOSsuZQdgULW3PMn5vNfBskcxdPEYU96R1p+9dk+VgEwM8e2
         IidQ==
X-Gm-Message-State: AFq9FYJoOeAf6eHB8GuxWxWbaTjoGpbNCMJGu2J5WRg26NHHwWl4T3i8
	gMcI+A2Wqgtk5d7aGP7tXIJG2upxMeiBYbhZ0h9E+74eH8ZCBUNWKjPsf5KPu96/hKgEY4UPhtk
	BYALW7O8J2rOJo5J1/kACUGMed9i3H4t3N0n3cFGKVSXxkxGI7YJgcJ0Hfitdi+ensAev/B6mMg
	==
X-Gm-Gg: AYBFou0h31Z2ZhPdrSZ9r/dCeTdCxabVbwUosw3/B/SI93tyK11nr2Uk/2aoP7g1goZ
	7x/We4bKCBAz+dO+K7VGWxJvxW9lU8iaFLl/ffKer0PJrjYWJl3fdRrF2sqGRePzTIFMq9sjviX
	xbOIr/IzEnxA3xzayX5ott+eLGXqorUourfTkafIViOkCwz4uM6r/29zjhE6YWSEOlu6ytPTsor
	aRlFn28sMTJgCVmyA9lLpbgVyze/xk+QCow9cCv4XAZsOKMxWfE8P6Z8P+TJf6Xto+z7ek7dE0A
	xsgMKb98lOHhsqbVxnMr+KbEDTm/k88u8fbUVd4BUXuUdgrBOAKgSzZFxzzcxYEG+a1lbg7+2EC
	+IPAt33oH5nygK4Js+skEgQ==
X-Received: by 2002:a05:6830:2b23:b0:844:5d0e:5152 with SMTP id 46e09a7af769-850feeb8707mr8480127a34.18.1793105989184;
        Tue, 27 Oct 2026 05:59:49 -0700 (PDT)
X-Received: by 2002:a05:6830:2b23:b0:844:5d0e:5152 with SMTP id 46e09a7af769-850feeb8707mr8480109a34.18.1793105988781;
        Tue, 27 Oct 2026 05:59:48 -0700 (PDT)
Received: from [10.219.3.4] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-850fc005bd7sm11174684a34.24.2026.10.27.05.59.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 05:59:48 -0700 (PDT)
Message-ID: <7d9112d2-c588-4c37-b6f8-dfa1afa21ed6@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 18:29:41 +0530
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/5] ASoC: qcom: sc8280xp: Conditionally set S16_LE
 format in hw_params fixup
To: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261022094313.1074873-1-karthik.s@oss.qualcomm.com>
 <20261022094313.1074873-5-karthik.s@oss.qualcomm.com>
 <7dc5131f-4cc5-4c97-8da4-28910a312239@oss.qualcomm.com>
Content-Language: en-US
From: Karthik S <karthik.s@oss.qualcomm.com>
In-Reply-To: <7dc5131f-4cc5-4c97-8da4-28910a312239@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AJjzCM5L c=1 sm=1 tr=0 ts=6ae0a045 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EIM5vv4Rke_6-YXqskwA:9 a=lqcHg5cX4UMA:10
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=z2U-W3hJrleVIN9YIjzO:22
 a=eYe2g0i6gJ5uXG_o6N4q:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: MDjSd8qfg7GcqthKOmOIL-YY5lSYncm2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA1MSBTYWx0ZWRfXxWDCcycLOHjk
 XCnCqjH5SFPAeuonjnRye7D6+BhqCYHSOHq71mMUeKGxBkJ4gUe97pQMqpBpT1xl1YXAKwvrhlH
 FoPFJ5zO1w5cRu/CStMC7KuQ1lG2dso=
X-Proofpoint-ORIG-GUID: MDjSd8qfg7GcqthKOmOIL-YY5lSYncm2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA1MSBTYWx0ZWRfX9KHP6kOPbnHV
 RTypXBcPS+NWUaFTf5qpnYmQkDCmStvJIoHl9weKlkGYfReZw3HQdeLcP67SMg49f2LMKzAIcTE
 oWX/ZEhb7tTu7SwyEVZKcQF7aAF8/LPYI6Vz6cXuRd6FtIENK/t2dlcR21QfKNJ4DSv6B4evd4C
 jXvdO1k9SlrfmnDDm5tbsfJFg1h4I3rhrYLJun2fg/UBlu5sNiLrr09szm17Hc79HXQVFEaf6bQ
 ADLgDtN7SHSt512SsMm6EEVdiO4XS7XwoVT6r9Fx5Y7ubgT2SX8HOiMiUZ8+Bj+KI/gUKojf5lh
 wGJ7ecSUqNJV3+GZ/HFsAf0lEAj5mKxrLrZ5zMr9Bz/g1CIEu4nG3Mc7Erxrkc/ToKpSfdSVOZo
 49X5dGmDehld/R8GOgvfTsDihX5JeUl+qfCXqitaECeuExWBV3gFYkwK5gnZelEhi1e8zzRdiAB
 Zchvv2zYw2kAzqLPtZw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 malwarescore=0 spamscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270051



On 10/27/2026 1:59 PM, Prasad Kumpatla wrote:
> S16_LE was originally added here for compressed playback ( https:// 
> lore.kernel.org/r/20250911154340.2798304-1-alexey.klimov@linaro.org ).
> Could you confirm that compressed playback is unaffected by skipping 
> this constraint for the MI2S and DisplayPort backends ?

yes, this change is made after suggestion and discussion with 
srini@kernel.org
