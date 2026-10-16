Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C3A440635
	for <linux-sound@vger.kernel.org>; Fri, 16 Oct 2026 09:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792144640; cv=none; b=cLplBNbiYmNJAuHZOniGCGMXUuIuxAFRQTJl8WGxiWO7mFtLud5icyU6Z1wtYDIwk0FJggtj+HDjmwytK0iVLPWZTRdW0GbdC5Yh+s9HKobRjnT3XbnVVnFtRPdPyyJR8Go5qyeYEB/3GNp7RkrZatS8Gp0z9cx3m40oqTGlE8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792144640; c=relaxed/simple;
	bh=SoGz1wR1Wyop2Qvinvrnk3+hvBdaIxCKNnO4HMCC00g=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=TCdJfKQwTWdXBEeolj2FQbTfQ2AihugC0mNMGQOFGdQNpmMpWqCtpiAU08wx6VQZn+6sEVD52VB4GKmeaKZhQlp5Zdp0+1nPLYCHs7qq16j46pdtMLkN+SNLPPFfLIUo50eLQIG/+U+4/EpuoQtKDXCQO7ZGW0bA0xlqvFvIDvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QVdD24u4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e8bqxDMQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QVdD24u4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e8bqxDMQ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G8lW692815463
	for <linux-sound@vger.kernel.org>; Fri, 16 Oct 2026 09:57:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vEZuI1yyPm/8RNp/MlW2xnhdHbaQCPMJNbR/Nh1GbqE=; b=QVdD24u43PumWTel
	YctVLY1o7YRrIGcwJaLWaaWHvTCPzmn5XBlaTC+kEWDuAH6XV/FiOmv/seM8tNDe
	B1Q+FLkykpmmPEGEcOkfyfZoztJt4NviHuj1OYY6w0Kh8NRli6ZAgTuaiDfekdTD
	FJVpXzHokZ0yu5KqUPmKb4SWIfBqOLYmD2tj7xsUXpa8aISTiX3uLXzrVFfMHGaF
	2prxEbQvO0PZ9kHk+4+DYBTduBVuh8T/qeHtafg13xCgHvEnVzbKKR32QuqaHWU7
	2978+hprQFDnDgOVoPC5XS3kvheFbARpp+jRxpkrtjLVYR0kJIzhlMIGWYDVdl3u
	WxWODg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb8r120rb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 16 Oct 2026 09:57:18 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93ea8a9cfe6so114436085a.2
        for <linux-sound@vger.kernel.org>; Fri, 16 Oct 2026 02:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792144638; x=1792749438; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vEZuI1yyPm/8RNp/MlW2xnhdHbaQCPMJNbR/Nh1GbqE=;
        b=e8bqxDMQNq8FYwEDdMI1z56qB+1J0nsuZUZ9/B+uQ15quA8/WanVtk8Mwfrq7mVngj
         j+eu//bmZFwhkolHvQFiU0stGOMhdDBCzBAuHO4H+InS7oUB+a+4cZXx8hLyd3AyOMGb
         J+7blz2kNFSLdsYJP20cksDwYvBZ7ncoDjFcjUce5pxFuHYZvHhR4oFM7NTwkSVT8tcq
         V9NSfvSEqceoICMDAc84j1u/5nA2QJDgVmstpXTuiQH0tVYBq6kTVyGO/GL7lvVpFIYr
         LMPIxem6VK+0vFyOMfUAeVFD5KPvI/AVi4bq+19rnbrNtHEU5A7FRtbUH31jgaYj7lVc
         vPeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792144638; x=1792749438;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vEZuI1yyPm/8RNp/MlW2xnhdHbaQCPMJNbR/Nh1GbqE=;
        b=L9w6LKGKZe9B7aGKaay28bB1cZuWxLt23P5zHggMsgoE2YPhAviP+RRVZKHZpfLiV7
         +44qEah8rxkKRwEKEjhFESLnizvqDwuTWo+qX6wWcU7082CC0+8v6vm6Z2HwQ3ehOeUO
         QyCRXY8A+0eWVGRSVVmz2U07ojPm2Xo+Ubv80Jf6j9wRPJr/7hVmDihJOe9hYoTBnQtf
         TAMH8owSHK2kyxU3MgAUGaMi1cWQC5ciwKH+Re1ahjakccHkBhqdEM7KV2ll+0PZEfS5
         +5nyStnONHZzaVjdi/XmCfdSjYLlrO0nmiaVakuuEwjWhYVgygFU1oJdWk0Rrnp2eMWf
         43tw==
X-Forwarded-Encrypted: i=1; AKwUvBwg13ue5GgWD9/XBTfREZAJwNQVaonQabVHpPuUQCrZBiBXFMn0NX5XLpm4Subl7uC+rGZPSbNxf+0LBw==@vger.kernel.org
X-Gm-Message-State: AFq9FYKqwoOoXzUn0E1KDfYQcAHMSbjcn7sA5OgHzfi+YDW64+HSIcAl
	P2EUecEZcTlqkIPqCPJTBvYlB2C4ZRmaf6HLJn01jBj+C5+657527XA4+6otHvS04n1fkUog2By
	MqTvMDsV0FJhsVG9pOQBOIdFy9o7pqmF3k5eyYDoh2N/5T15bW8iWImAZvM9RkjY5yQ==
X-Gm-Gg: AYBFou34fuik0pyS4o7z+qJdlBx9okTH6Na4OBRi8umZzUxULG81OihVFPf5wkS2P4O
	jc2xIdmGldwtT0w9/wdpYCPIe/VBje5qQp9x/wdxH3y7ZyHCp4y2aAggCUlo8HZYh8BCyBwhKE2
	bSLDpDtNX6LuhBXZas3G5a+DyNmAIFip72Esk4pbWuNeFAMxhTFsr0zm537YXmbsUVW5by6Rw38
	Dbxbg9ofcQOJL3ErwWGa83Ud5xRbJYJfbklepLKF14FKiMlvsGR5GMllubo/QDpn8qJrbPSttYo
	lCCq3Gw+vEsT7BnYwquBgiG52I7eI5TJISLuvn4y0/hoTBq7updZD1f7gFbM4bo44I2pLH8osHk
	NlzIm5m8SQ8WGPV0fcHEymA==
X-Received: by 2002:a05:620a:6506:b0:93e:508b:7800 with SMTP id af79cd13be357-93ebcd29970mr3687800285a.0.1792144637718;
        Fri, 16 Oct 2026 02:57:17 -0700 (PDT)
X-Received: by 2002:a05:620a:6506:b0:93e:508b:7800 with SMTP id af79cd13be357-93ebcd29970mr3687797785a.0.1792144637202;
        Fri, 16 Oct 2026 02:57:17 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4090dcf98fsm54523466b.13.2026.10.16.02.57.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 02:57:16 -0700 (PDT)
Message-ID: <2ee02f35-3dc8-4448-aa30-331932a40629@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 11:57:13 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/11] arm64: dts: qcom: sdm670-google: enable adsp
To: Richard Acayan <mailingradian@gmail.com>,
        Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-sound@vger.kernel.org
References: <20261003175659.23536-1-mailingradian@gmail.com>
 <20261003175659.23536-9-mailingradian@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261003175659.23536-9-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: tHlc3h9LOzEr2wbZj85ytY9F8Hi_L7Gp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzOSBTYWx0ZWRfXzZZ8oJ9kAiMt
 Adv7VNIs7+U/bi8JRSqXLN5Z5+aejuVyzkRpZ8aOY8KHXm8TztZl8aMFUSqGDz/K1l3wT9Fik7r
 OJNfprvXnZmLVsxGFu1lGTinzTf8cQ8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzOSBTYWx0ZWRfXzaViUHfEmUJ5
 SHmQ6dV3l7vOhxmjC43vve45tpMa3jeZZJ6EFtAxPh3CbuLZ9ruX+rgUYwP+jRfez37aM1tiicI
 0UFLoQwbk/TWYWt/2NRIYgTPl0egybLqXlgdH3SzFNmoDSV2b39MUBkQ2e564nGhJZ1DoFGzlvC
 1bYqF6zO3XiUaVyu5Jz3N82JjYFOzLatzKtvJWJMfh1CR61k9PdttALXcmGW8slj+ZF2eaQw0Oj
 vz87hlFiTDgQRjvyNgod4apcjpjk7Dvrh8Jt7Mc3cwZe0sXBnF4PKLyV13nJrgIY2TSrTZ9MFNq
 ZcnO6ig2bqQqkEccuDtchKZNEVSG3fKU7JPnhzHwiJ5B7zjDXixWLhpmlbusH63v2seQJ2hzAel
 fGA8Co1FTop/ET5bcHmLWS0rFuL7X0lE52h/SWaoWog43oSHCH+q7FfSFIQYj1qLeRyNbaV428B
 AqVFdaTrm1wmBkwHksA==
X-Proofpoint-GUID: tHlc3h9LOzEr2wbZj85ytY9F8Hi_L7Gp
X-Authority-Analysis: v=2.4 cv=L/CI0OT8 c=1 sm=1 tr=0 ts=6ad1f4fe cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=1DDleCVHwAjOA7h17fsA:9 a=QEXdDO2ut3YA:10
 a=Ql4v02ufxVEA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160039

On 10/3/26 7:56 PM, Richard Acayan wrote:
> Enable the ADSP on the Pixel 3a in anticipation of audio support.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
