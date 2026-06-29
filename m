Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892AD2E739D
	for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 05:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782711043; cv=none; b=DtprJx8XhpYW5DaN87HXZjhcWLeyo6F6Yu3/mTtj2EtVV73gk8g8jvZB/n7mYKA9ENFSlypsUIw0ZFy278h+1iaodWkxHH2dGboJXg3yQyq1RcVUEwXBkuXHOuAVHDMb5ml8ljtjA2rJgV+V48NLzzxXHlZ8qugryVZftkcGfUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782711043; c=relaxed/simple;
	bh=BTcamW8GZ/hEv32U2vrDgn88rzWxa9uG7P/MYxGEJOk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h5AeW1T0q6kJ8OdflqYuk8JnnoKRHbBU1vBPcU6SUpSF3fPISSMqSEGrWBesktcMnuf/NoCTRQQMC/xovS0H3Wcu7mzl6cg6J36X2FLLgjROmZXSO/PvBvTfnpUV/4GOhYEA0aAXG3BkLyYVSRh3RAEQ50I27l/LB7c6iVkwSzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WcAw7rjB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ADqX+CLm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WcAw7rjB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ADqX+CLm"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T4NO231766940
	for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 05:30:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0iYaZQiVwCPWspFjX5KeDzhs18wLFh8Mq7dB7wCjTXs=; b=WcAw7rjBzEAhOcrk
	tHuMPqSApmwqRNWRuxLpQkzhOaqq7fAq2x1bLM3scJD+t1zfm53DCzSzrdq5VzWs
	IoSxs9C7mXZx0hjLYOb7OAf3eLTTOtoW31w9DOzm3hHrqjJ6eNfOMrFz+1qrVU2L
	9kwg4wc0SgJAiDBC66Ue88gQJs0a1k9uPw21NH9/BODXwOp3vWBz3oQMTCmDECXP
	6qhcDOJhxVEsJEbHDY0xEr2OAQVrIrsHE9lkTSSW5yy+7dcrlTrkJuuLH+4i++TH
	ZdXTnxs2ZLTuUclffiV0WYlRbuj9hl4TKnX7KoYVlAwfxDKgGftXMntZpEMDkQrj
	vBc+cw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f270a4pn9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 05:30:40 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-845df469a26so2136907b3a.3
        for <linux-sound@vger.kernel.org>; Sun, 28 Jun 2026 22:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782711040; x=1783315840; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0iYaZQiVwCPWspFjX5KeDzhs18wLFh8Mq7dB7wCjTXs=;
        b=ADqX+CLmIsqt2lge+Zf/NgXEioh4LGeOEuqugGYRF1cpjzuI2y4Hi7EwIPt4HvLcNs
         YbTCg0rNZVJbf159ja4Cu1Q9LkHvAJ11HQBZ9AYGTj0ocH0lxxlANNqSWc3xqVS3LtFX
         IZPYc/wRXDc3CcygBat2K2qxNMKg+RcWGFMOxwPh1irjOUqEVLzM4Mk0VTErHAqd5fjr
         DkRM5F3NvPipeoViEpuj9glKqEYKaf1UyF4Cvmg3eGcAj04FNspn4cW1Tq2uIHeEfB4U
         OPnSh3rfaeGqYplD8q207Km69TfsYCLf/dYYzWzX7GrfsizrrCU0p4AcHb4HI8YPuL4B
         QKBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782711040; x=1783315840;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0iYaZQiVwCPWspFjX5KeDzhs18wLFh8Mq7dB7wCjTXs=;
        b=fNpK19Aaxfg5fwZFNsM1fziOvG40BETvUh68aJpKZEndMR0CuOVlHFXU1ou+VVsBNd
         38mVNlH5qIjq70jaLFtHRprn8R8RpieiWfIxljwK1Ty0XHz5o7CmD1ia2YtjMc8eRczO
         HynAaVJoCx/TihmLiIHxmH2miaCpr0ki/MBWOk600ZSiN1rPDvkCI+Xy0ZQwOvesXtOU
         dGbamKaOuQ8vOVsTmkXpvZl56mVwaHo68pIJ77hqwQoM+br5qyuhpmppT1JCey6p+vXo
         dZWrjOjrItmXoEF7qA+nZYjK+VinXz4PIOUJvXtKwxTUNJdtUGKQA2yeFNV3UdJ7LloO
         2Hzg==
X-Gm-Message-State: AOJu0YzBMRYd6Lc1xEUwi3+p9AKjzHauTAY0e+6Yf72aqhXc5ckiJKrA
	Qllk5Tdhe4/vLm+Pbm96GBHfAYlSbd35nu0DE7wO6EawwKCg4OxGzdbhcnrPd+egUECSBAB6+1J
	AEdYPC23NlQmGTjeXrs8ylg//Sj4uuc2EGmPCk+3l5HbNuyO3+5qVqCNbm+eD60QkFQ==
X-Gm-Gg: AfdE7cn8gcPqsc22f02JpbNKXcVZkh8mO3TLhxMpHdScftO+wcyz3qh+cgLWswdRoMe
	NROfQSIlad66sQoUBVEPkP21q8Wfbgrkdq0wahev4H7ChdKoE+JhIjTMTKca+paCXkIYfgj1GV0
	NJCQeCxjRmT6xA+NpNnEukF0QkaDgAs6Usmd8xhmWcewMqEPLJ6ZclTTEVOExcR2kMTpSHGU2P9
	gLpgeKgao+b2tutNEzMMZMi5hlhOzXC0CXSms7zzcBW5NkMJu72XB8k2VeshbxzpcTiFdVsL4dS
	++6/qdtO/pM+eyCCsTgrFecKnFYrIq05NWzYVVBxS5ZGfLx9fMbcx8skwmJEwV9QZ7SlKyQ9Zce
	QK8Kt19/2zqHTduCgIpjiIjcnUU0Ow0L2MaPWU55nJRfWDJswqg==
X-Received: by 2002:a05:6a00:988:b0:845:4d71:8d15 with SMTP id d2e1a72fcca58-845b3b88d14mr16313668b3a.37.1782711040399;
        Sun, 28 Jun 2026 22:30:40 -0700 (PDT)
X-Received: by 2002:a05:6a00:988:b0:845:4d71:8d15 with SMTP id d2e1a72fcca58-845b3b88d14mr16313645b3a.37.1782711040031;
        Sun, 28 Jun 2026 22:30:40 -0700 (PDT)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847864a5775sm1017254b3a.48.2026.06.28.22.30.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jun 2026 22:30:39 -0700 (PDT)
Message-ID: <03f6c057-2d67-4292-84ab-566565ee4a20@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 11:00:34 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 6/8] arm64: dts: qcom: shikra-cqs-evk: Enable sound
 card support
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Pratyush Meduri <mpratyus@qti.qualcomm.com>
References: <20260616201315.2565115-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260616201315.2565115-7-mohammad.rafi.shaik@oss.qualcomm.com>
 <f92e8c9a-1f70-4f94-874b-c247f47c5af5@kernel.org>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <f92e8c9a-1f70-4f94-874b-c247f47c5af5@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA0NCBTYWx0ZWRfX2IpfTL6zzVB/
 q3LstIe7rc+5vhH23jsCtFMe6/orK2YE0CH+f4xlvVKSS9D1JuXrMmAtESuwP+oKgAsGVwfpbUl
 gys1MXxA9y5bHsksdQn1sQx3uBI7ShU0DepBBpPWBTjTqMhzdWdU8wzWtzNG7e2QkVM8zHuM3go
 qCTzKDjBaQVo3uo1n+Nf1YC9gjeNPDdBTKe3216hD6r4z4b9idYP2MoBDYiXNL5p0RsLZ2niY8V
 NZdbseCV7cBcm/6ImghMRgLju/GOs+4+0I1ahM+fvip60W0jKVg5FnzTm2VKFQ3q+8xIk77PZqt
 y1MvUzMnJrASz2W8OecS2nTZ5+NvvRNvMPm07sIlz1jJgDyo3bUplAPQnBiYU8qaBuLJX1c1YIW
 fmo50tvkAGrpYG4hfXx+uQ2ANpuVhGDdvwKDEuHQAWaluhorq5yDCAz3Fp1+3B1qbq8axupRqQt
 HWI1rJloJom4c5ncp5g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA0NCBTYWx0ZWRfXwq9DEFOP7CLz
 my9s7fSmmyXp6i0SXFBNQsp5SJ0N2JtCpS2DPdgyVJBi/bdOrl+PVVWK6XapemJ/4xqsHSUMbvH
 LPbflU2kQR1ooUP+w0xS1v3YohYXuT0=
X-Proofpoint-GUID: U8a5Hzlrc8BaY5FDD8pR17V3v4AlU7wf
X-Proofpoint-ORIG-GUID: U8a5Hzlrc8BaY5FDD8pR17V3v4AlU7wf
X-Authority-Analysis: v=2.4 cv=Fe4HAp+6 c=1 sm=1 tr=0 ts=6a420300 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VUSdPHTc8rOmLbK7xEcA:9 a=QEXdDO2ut3YA:10 a=QYH75iMubAgA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290044



On 6/22/2026 7:17 PM, Krzysztof Kozlowski wrote:
> On 16/06/2026 22:13, Mohammad Rafi Shaik wrote:
>>   
>> +&i2c3 {
>> +	status = "okay";
>> +
>> +	wsa885x_i2c: speaker@c {
>> +		compatible = "qcom,wsa885x-i2c";
> 
> NAK.
> 
> There is no such compatible. And there will never be.
> 

Sorry about this. I will wait until the compatible gets proper approval 
and is aligned in the driver patchset before posting an update.

Thanks & Regards,
Rafi.

> Best regards,
> Krzysztof

