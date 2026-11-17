Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794913307;
	b=Iz+xQmsZhsO+cRJb7T6PavnvKEFQ1il0y5xllqX3ggASj/KKwJOGAYmwqy51vFjKxmBv
	 o0t+011fDQ6TNP+DsPYL4EPYfMhRzQplxUs0zr4fKKqjEQ8gIu6byIjNK5V0sYokgaDqT
	 xYxoZj1IYa4bPzHUboAn7fZxJ+gsD+BTmY08Z7iy61YpFChy4GUxNx/Y4hXK8+T47fcus
	 +zvcv6+ZuInqtmX/qgNziDXfkLcTqLVM6P5I5vHLmbTV/USBVdRQ9r/2FKKCyOw445H7r
	 iFtCY0X54VEXh6MIXMLvzHBwF9pJ0TtVBH4aVKs25R5KaLXftbf+oryjyKVsbnIJ4jQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794913307;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=yaIk7uMdjTpmz4jKxLGJh5b8yUAGglTN9V8Z/YtcjGo=;
	b=Dy2DuzVdF38AsJ0zdEJycDHIF8miEGvJ6VKwJwLWOUBfp5mWOWr25w+4euGIMI2qre2V
	 EIRW2kTJuF9Ohysr/WC+P0PqFEy3aflL4mMzUwZINvKH0DDEI+NKwwnql9cvOCfP8BGRw
	 mhQeg7xNKdwiziZdUOayzLyzLnh+eGbIgYsG8lhbnS2ap3Eiy584wZHw5jBl9DISyH+Wy
	 nQPbzXD0cGXM8iCn0YqMDUjcscEojTWDM3G1/11McxwTQ2VSA1kkBFWg+sO7n/5EsCfMQ
	 gYjXRL8p2+MGE0ddJ7mcnvNmainfSSBaOAgZSZXACCZnjguqPgID8bOeEDsaxo+L5zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=muo0knjk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ci9ranhs;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6655606A32C
	for <linux-sound@vger.kernel.org>; Tue, 17 Nov 2026 11:01:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6655606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=muo0knjk;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ci9ranhs
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH8NHJe721447
	for <linux-sound@vger.kernel.org>; Tue, 17 Nov 2026 11:01:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yaIk7uMdjTpmz4jKxLGJh5b8yUAGglTN9V8Z/YtcjGo=; b=muo0knjkPJLHmOJ+
	SeIMK/MkrZFvRSOzz9zyW7mOiP7Aeux59PJGrr2af/T8TJNfWp6wS3vQwgJXcXNN
	X5KtFXC2c/g/N9JMosketbN5Gs5gjhboYbfe2ZwTcxnTEMeWPxKecaH9rEQIRgpS
	+SSCs0MMEOwVkjhBAEpcb0sZwt3WlKRZ7b+Ef3kFUB+xNV2JqYiGIYLGeTPFItYT
	aPNQK0Z4C62hgoMi0sWVHbEuCu7SHu2bnaH8bu6+iHjElppP7JY6JFANxsoeqlAu
	q82163jaV1Yzn/+tnx/BpA5f4xhhLW95lGhlXjgxcmQsTjxUq36QVyA2qfzg1KOf
	zF1sFw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0kcc8mfd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 17 Nov 2026 11:01:45 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8a01e2962a1so4808177b3a.2
        for <linux-sound@vger.kernel.org>; Tue, 17 Nov 2026 03:01:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794913304; x=1795518104; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yaIk7uMdjTpmz4jKxLGJh5b8yUAGglTN9V8Z/YtcjGo=;
        b=Ci9ranhs+b0XxSps2j7HeGr1p8VkSfvyGMTC63ssG6lQ5sfQbJX59mBuvrgv0O39TH
         Tv4o1PFWS/N2KFikkfgfp3xE1O+1Y09FWPFiTm6ovLXhQVEJ8EiJMzZSVH72ZHiSo9Wc
         mp+mnwHX7V5vQlQsECsoOeAq0MZjZhnSvybMwT8eMHwf1QBw7XFM314c5z8wNuF1r1zf
         1aC0i1MwQtzSrWlczThNnFK7UYaakuaZCa/vun/JgU3hrckeIABCj/wjL0gLUOpCdKL8
         1ArhEWsPYFuLOY+JgnY6wpfZmI47qFfP8W0kMgLoGcBmcWwd4uW0UpEp6u/s+4cEDaz0
         DMVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794913304; x=1795518104;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yaIk7uMdjTpmz4jKxLGJh5b8yUAGglTN9V8Z/YtcjGo=;
        b=wxlkJJGZNDt0IsPDhS0DN1ufmdj00ehi96CEJ8w7+dfGnO49XPbPMSiBAlRilDI8Jf
         uU6xIHnT21nOoPffaCVLA6mnYAY+ij3LeuQWcakOKKZE+rV+TYPZV/tGS/RVZC1Yp+OL
         oDEsMUmgNK7E1zKAXJeSuE/VwW3VC4CkaN4y9MGFVuZI/+QfOVwFKxxR7z1a8vURjtsM
         /AAiW9ECc8EgwGVrFavSuMz06BlRm19qG9CsjK/ZbTIi+bl7Zsd/+CRkhnvWi1Za0sWt
         4+CAxQ1BP8ybIH+OpZxxsCr/OZZye3xhvITTHIdbL8223DymKJlk/m7RTdxoIYXIdaSg
         cMeg==
X-Forwarded-Encrypted: i=1; AL+hErGCwBBz13O/40+bMgx3+QF7Iau+pLBtuxaZiDjBom/+z0EYzKNY3MsOj2hNY+1dGiEo/XshUxktBqA4Qg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8pqc6w8Zezlcq9Ey27Vld0z+Yfu3w5ZnCA7eHQTfgcAf7RS9sW
	Ri7sMBSqqBvGGlS3mgWZKt5/ox+UjWnvsXtTrCoaEpyz7OCQ8/EZPgwdACxM1JORN7yNtDoRuZI
	nSMNSFC+1bA/JW4j4flf4vs6Sx0kt4dBQLKnyIagnAIZU2x2VvaU08b/b0HloOzuCZA==
X-Gm-Gg: AYBFou2SNUND8dQaIGiLVqi6IfdT+1L1iaz55wAgXD24K09+tllE3Dle3brEC0ULHWF
	3t0QSYQC1aW2iCaQzwAnD6dl9Y0fxN83joK3vwMzZPQ7+Y66DEf08sMZu9wtHA4DvdkSPVOsCBp
	URSZSrCqZ9AJVf08H/UK7KpdnT2NEFx5ofh74Ui9p0iw7L74JDOBSPAyx1XYJaCuU6JIK799VZ3
	kcrOE14a6sdBeRFVt+VBDucKDUhTbfwOcpRAb7NswJaUdFL7gdmEz2bnRZbXfSbQr6E+XBxTQbn
	IDN0ryyeS5OvPl7EP+68noxlU4iYM+vVMhnHqdPi8tKb1t/KansaEJ2v1o13SqebcaS3oEyf5BY
	In087kC9IOk0Bb9YleuRTFgA+cI/6RQlE8iniDuhNLeY3kgmYmskAGkNe3WjvTjHy4PSfKCkU
X-Received: by 2002:a05:6a00:3773:b0:89e:8915:24a2 with SMTP id d2e1a72fcca58-8c42858750fmr1991714b3a.29.1794913304398;
        Tue, 17 Nov 2026 03:01:44 -0800 (PST)
X-Received: by 2002:a05:6a00:3773:b0:89e:8915:24a2 with SMTP id d2e1a72fcca58-8c42858750fmr1991679b3a.29.1794913303862;
        Tue, 17 Nov 2026 03:01:43 -0800 (PST)
Received: from [10.219.2.72] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed263b648sm4805369b3a.46.2026.11.17.03.01.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 03:01:43 -0800 (PST)
Message-ID: <2e247391-ab5b-477b-933e-0e396e0920d2@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 16:31:37 +0530
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
Subject: Re: [PATCH v1 1/3] arm64: dts: qcom: talos-lyra-evk: enable audio
 support
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261117104303.435294-1-karthik.s@oss.qualcomm.com>
 <20261117104303.435294-2-karthik.s@oss.qualcomm.com>
 <2e7767be-ed88-41fc-962b-7c4bd728e856@kernel.org>
Content-Language: en-US
From: Karthik S <karthik.s@oss.qualcomm.com>
In-Reply-To: <2e7767be-ed88-41fc-962b-7c4bd728e856@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA0MyBTYWx0ZWRfXxi4fNnuRfyk5
 vS+npYfVRJ0M7Bbi2dn6c/cSV5Cqw1VS8sSaGSvl2sv4iTFWUCau4cwTOPiGrFMStlszFIJpDLZ
 oCrh7v6+fQaHaUfF/44SKPrAeVE/eto=
X-Proofpoint-ORIG-GUID: d-HplOdNtSIHZiWtm_NAb0LSQxnsMLpY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA0MyBTYWx0ZWRfXzQI+jnWCAgVe
 urtQiYtUjw29xZPIFSrYa/stlBDX6b/uC2BYTpbhXSjftuRudcrSkhjMkw0bdCWBlnPQV0/Bu5t
 xcVZh+/853GJo+DTsRSL7SNSe4s9wYpw0p4vojMYr9rbczq5/OroteaVYyu27l6nX4Q/6V1SwgH
 urb2adBn8Stlc+zMIVMdUBjE2Dh7/FxHdAH9L4leXfvZh1ja7lxGTh3VLJJQ46WU4J4UakVh4et
 mVmgAp/vjiRkABXzrywTPV+kv/du0jbPeGyzIBilelkyIZmL7dWPCUKUclxT+WkICi1jU6NsgAs
 O3TrLs+5eQitu5y+4FiS0/1JUQKKfD8HyGaohqSm3aljazNbi4wy0InpqO1r3d4xg7x1morNrHk
 14WYBZB98PFcmnp/hoH0o+hHdKsG4Ksmjv2ApFS4z3W8W7MuLmKRpH0e4qLwJYda7+gFqKcCNQk
 dCP9Ebv1pO5/vgQIvlQ==
X-Proofpoint-GUID: d-HplOdNtSIHZiWtm_NAb0LSQxnsMLpY
X-Authority-Analysis: v=2.4 cv=ZP1CCn7b c=1 sm=1 tr=0 ts=6afc3419 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=HA4giugNgv4V6a54TBAA:9 a=QEXdDO2ut3YA:10 a=QYH75iMubAgA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 spamscore=0 bulkscore=0
 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170043



On 11/17/2026 4:20 PM, Krzysztof Kozlowski wrote:
> What is happening here?

hi krszyztof,

git send-email seems to have picked the wrong patchsets, i will resend 
V1, sorry for the confusion

Thanks and regards,
karthik
