Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86EB932BF54
	for <linux-sound@vger.kernel.org>; Wed, 22 Oct 2025 16:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761150538; cv=none; b=CqchB5Z7xqAavgpLabkuhuPR0ygrsQ9c2GXQF+1f8x3f9wPRzoQ5thhaBK6eWTxnEKsI9T8omh7LAHs8DlqU7QYlTXzkr7PUJmpHQzQkZ/15oUcpPuxZRgrdtKnOiUhBv1D4XtFITDFZr56kfYTM/RccAFzHHo3EvOT492F0q+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761150538; c=relaxed/simple;
	bh=gnYSeDQF9A0l9V1yfEhZWeQeVljEZJwDS8hyZnA8a8c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sTrzxId39iJP4Pd/VJV2LRlhtr4Hc5t8DYfi04qQ8iPbwT/iXpMUQfOkxJkPzuotVPoEK3MuNvsWI8oM+/g8eUBgC1h9zAGTrVgBGqaH2eWi41W0j7M4sfiVUrJBDAcgplQT/1nngam7xzbITLCZcGoiFPD40HjdC1ppqSm8M1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ExFBEa56; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ExFBEa56"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59MF47Fe011570
	for <linux-sound@vger.kernel.org>; Wed, 22 Oct 2025 16:28:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q1jLNGTOlSGGQO46A4daF1PWlbiRuH+dyUe66KEnmxI=; b=ExFBEa56mge8uk+V
	+CJLI+jZIHwDXJrL+phLYqFdD79kE0LukmSVvDbNE4Di0BuB2LLTfoyheCDkEbNp
	7QqkPThxhvxm3HVc5hP6FG5w7CZWjj8r4muWYgoXLJS1o9cVVctogpmDqf5Vr5I3
	zsMzmG3MZGUmOflouet+PO5yAmtdLw+adUF11CeLOKEVocMD2X5SazR3NIlR+lBn
	9k4vnpFEfqmAVpVCFNezpHvzmMYNiNgjDRhFivu+dRBVIeVDrCi9Nki7R/I/68C+
	p2w8QyYeoRfGtYh52NRFzHtr6LSYsIXFo0GLa+Jvr58ctAGhnMnozDc4ZWHbuUg9
	GdvNgQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49xhe0k6vv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 22 Oct 2025 16:28:55 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4d6c3d10716so2163181cf.2
        for <linux-sound@vger.kernel.org>; Wed, 22 Oct 2025 09:28:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761150534; x=1761755334;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q1jLNGTOlSGGQO46A4daF1PWlbiRuH+dyUe66KEnmxI=;
        b=he7JUyXtGj7b/Emf96Fnqc1Nj3+Ikjy2eH3ST6/+QyL7D6GsU6QtqoI+ZCiZL6482B
         iN20NqD8TMkoMQl18W48xry3BOucUFhhaaSAFYFwwFf7rmiwn0noNLB5CSrFKA13YSvL
         nUAZiF1XLPhwB1Ga9sjTrFKlJ2qiDT/vn2hVXHH7uTJcSs9BtGwrfr0YZ5T6fOZpJlbl
         Psbvh9XcUx7JRMza/CReUbmXnEPWafd5T+Gpi8uYO5ldoWejHqdiTGxxq3o834gHDux0
         00ceWv1kpfvBuaaUdQu1NfxjvMJwy1bLXsKHQFLv6JliT4g6P/Ve4IMnXOwAAxEY8Py3
         pApg==
X-Gm-Message-State: AOJu0YwtE/owdYB3pEdNdBd2N7dcwAXZgoNL73TvbsNxtCvZjm8j4JMU
	trjolK9XzHp4TaOt/z9W46Y944dLamoU8Bk4SC0PwJ9IOyZuc3vrV+KOAtY6JOAc6CZEdbxZYtz
	G04hsdevCPMzNFvy3v5I8eidyfUCI53CCSxY0LK4ZiP7nhIIlLYGWVFMoohYQoHA4eQ==
X-Gm-Gg: ASbGncu/RY2swnGFt2/gLcKPhqXV5MRMbcdRRmKcv9EguAt7IQhSgOav8caGcVqrTVq
	rZqkjihQH2ebSsqo9p1/V315muqs9WQwhqd94sGk6fNajk8Tlx8Bdr6f0nZotFw0at6LH0h+QEY
	hBbdUDhrj5/XHukjpZ3YcIHo+CYaS0/jSfKXDeA04g5FuCIlnHNIqtiw6C2ce0/yL6+TcLDdTzH
	fYAu5wZLE55ZUBM6haOAObiZz+VKoywSfaU5PHVRZBo5fij69DfBBa/PhrsedF9ua+PT3B7wlGn
	fQIUhn8/dVRXszLEp+Ws8Hr4qK2w0eZVkXHbqA+LjYP3lVkbQVLQ0kfMsDEt+FfCJfMY2V4a9qg
	zZe2DiO+GHsqIiJXPapgWm5F+B9EXlRNFn11+Tb6z4RugCH+X62GC692Y
X-Received: by 2002:ac8:5f92:0:b0:4e0:b24a:6577 with SMTP id d75a77b69052e-4ea116854c9mr63132081cf.2.1761150534425;
        Wed, 22 Oct 2025 09:28:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH4oJ9oXYk26oTyLnsc4HCl+yoXOudlAJ18eVcGWTDYAU+63VcV76YKqc3oyp7E8vwvDJPtcQ==
X-Received: by 2002:ac8:5f92:0:b0:4e0:b24a:6577 with SMTP id d75a77b69052e-4ea116854c9mr63131831cf.2.1761150533950;
        Wed, 22 Oct 2025 09:28:53 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63c4945f1ffsm12526984a12.31.2025.10.22.09.28.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 09:28:53 -0700 (PDT)
Message-ID: <4d69e9ba-caa4-49bc-a66a-d085edfead4a@oss.qualcomm.com>
Date: Wed, 22 Oct 2025 18:28:49 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 3/3] arm64: dts: qcom: x1e80100-dell-xps13-9345: Add
 Left/Right Speakers and Tweeter
To: Abel Vesa <abel.vesa@linaro.org>, Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
References: <20251021-dell-xps13-9345-enable-audio-v1-0-6f3f6bbd977b@linaro.org>
 <20251021-dell-xps13-9345-enable-audio-v1-3-6f3f6bbd977b@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251021-dell-xps13-9345-enable-audio-v1-3-6f3f6bbd977b@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIxMDE2NyBTYWx0ZWRfX8HpOUJiWtVy9
 7zIjXYOzEuAxeZI6VHA1XX8vQ/x0QwuMqEeffIlCl5jkvfuTnSqBIZWpR4P5fpQhPnKVEATbr1f
 ozX3m7IDAvuAjozv8/HGnoSzzKUTxI9K+06VuMMV1Rqhe/sMme3sjvaiOZnuXIg+lqjJivxBbVq
 Bk1HSb1VsdhEitxAVHOKrBNhCypQvV5i4hOl+uM7KyfIU6KHaC4jb5YKjGduafSqWhRCZFc11WO
 XRBFqHiCITRICzwTkOBMF/hEnzD1mXgeJcRdtGkRnEZValAKGkoyBiRpNVEtbnqSBnaERFaHuCH
 c53uIZKXEJIUDrCqizhQ7QVrOo+peMP2Ha5/MWfig6QNTauCaVyLLeg5vRpN8Fh7Fv6KOsQAHL8
 C7M6jdluSZ+EV24UWChplfFcP/lOVQ==
X-Proofpoint-ORIG-GUID: M0eRdzF3-qD3bO1mzIYu6O2s5Kd0YZcg
X-Authority-Analysis: v=2.4 cv=WYUBqkhX c=1 sm=1 tr=0 ts=68f90647 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=bOTh6ypEQCZma0slNj4A:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: M0eRdzF3-qD3bO1mzIYu6O2s5Kd0YZcg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_07,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510210167

On 10/21/25 3:50 PM, Abel Vesa wrote:
> From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> 
> Enable left and right speakers/tweeters on the X1E80100 Dell XPS13 9345.
> 
> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---

[...]

> +&lpass_tlmm {
> +	spkr_01_sd_n_active: spkr-01-sd-n-active-state {
> +		pins = "gpio12";
> +		function = "gpio";
> +		drive-strength = <16>;
> +		bias-disable;
> +		output-low;
> +	};
> +
> +	spkr_23_sd_n_active: spkr-23-sd-n-active-state {
> +		pins = "gpio13";
> +		function = "gpio";
> +		drive-strength = <16>;
> +		bias-disable;
> +		output-low;

Drop output-low in both definitions

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
