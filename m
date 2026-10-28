Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793191682;
	b=3q/Yn1OJyjx/iN95UNzGAQ4jblDAS7RKB5O7V3pSPjaUNpiq6+eAo1J17tHKB5wDsrnG
	 zG0soiGh7Oo8GHOuEf9TTpoRYCNodR4uNtN6nGd0KNaZMnXdN2X5Y0GkNnaYrfK4bKJ5x
	 s2q4ITTzViA7qftG2KefXMjjbGDNbzq/Ed5fiAXTbeFBRYQ01xI8Mh3Jfi686mfcoAe6V
	 /75qViaRjnvYfAvq44cSqugQhNSCFLG8M+rN743arN9+2MR5lfhEZyos5+gYppvRFbxfh
	 AatBTkvGknvfoPfR36+Li5K5u7ieNSHySvD1iQ16vHGKcZ7wjlKw0Kw0Tv+3zbmuEyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793191682;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=x02mqaq+jckkniOXgK+HidnLK52gK4oRF7bevLY2k3Q=;
	b=USsQpZjPjZcayhV6EHD0GzZpAWFgN4Q13eKyYjrE1LuXVpiwe+PU1p5RKMPOewgDraBi
	 KXvBciUYSXwvcyl89+0oK4aS/ZqpZEz4zKYmlD0J71MekzrlCYrUhJa2lZVOPsuPgMRHs
	 /L4HGWQUWa2zx1ok79fdJO5KWpcXntZzVYI1o7+pEFl+/Rbme1HFMouonEdUBPTnAe5En
	 6VxkCP91dkD8P/XeFbLkfGt4bSlEqKqnjQYD2loxQgZ2pDWnCSophILGA9gKpKdn/DGc7
	 YmuWFFvsHJDoYY4UOM8RFEApChqmbPXckq6y9EtI2YJk9XR5FrErPAp+02mfZ5mGSbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="U/dAt4b1";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XdMEZhGs;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C77F9606A31E
	for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 12:48:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C77F9606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U/dAt4b1;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XdMEZhGs
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBeDSV1539095
	for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 12:48:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x02mqaq+jckkniOXgK+HidnLK52gK4oRF7bevLY2k3Q=; b=U/dAt4b1vCKJz4R2
	1Mlby663Hp00rQgi2nW3Y9jB6nBqLctbracDmSB6Xj4ySTHPYv0k+qeR3hhr0Sqs
	2UJkHfm2bHLBJWrY93IMake8ERgHb4KtnN101wVPbwczAOrvCkOHVtnUVTOp1JJ6
	hQ597in0/dNY9pA7VN82PcIFWTRvyeryckbFi+kIGgRvhmYOVuJ9mjuuPs1VUZ/x
	MmPd5zRT5uVpdzqsrgBCRgTIGlvVqnwmJPDEPYarIZ39p0UKr92ey1mqHNvc58W8
	X8sq49s6pxhvWvsj6qOVtmE8TvsyFOzI4l8C8ZENejDGYtgp+glLfzjkqng1kSh6
	Hb9uOQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkdf7rxj7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 12:48:00 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1a71dd190b0so2614931c88.1
        for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 05:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793191680; x=1793796480; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x02mqaq+jckkniOXgK+HidnLK52gK4oRF7bevLY2k3Q=;
        b=XdMEZhGsC08xa/HoM5cUlqv0b/EBViQYSs5FZlc5IhPFfYqC2xHwgTxh1gnh3fdRDn
         mKBEQs8RSmItWMxwaxKCCOWOQPojsbEfs9xTEmYcWZYYW6ZO2MKj8hN7w4HuufZ/NLhH
         h9r0HFAh+b2O1zOHtV2g/RsMG43/bpY8Y1xsJxaUK3u0yskLUBjiz1kj8GwdjaDWKzML
         Vr0acyj+EwqsykOB05JEzMQID83kM6TtpnE7p29Fo/4Vl8yOHnC23Ca/fFL9wQMXuLz/
         VopE7X/yeR/1MFUsjgzhDXfyo5R2Ce3Q0nLr+tL4QLDr0zeBms6vrA7lD04RqGyOluge
         2HKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793191680; x=1793796480;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x02mqaq+jckkniOXgK+HidnLK52gK4oRF7bevLY2k3Q=;
        b=c7yjTXLuMDp9bkjpqRMBs5T1QYDywG2Wppkzv5se0x7HpxbrNIKxX1vDVf1sliqPJb
         lYRoBjXSgxUrgWyMxeyZmPJSTfICL9Cdw230QReRH8604v/HXB2q4yJAMkoOYR3QW2Wr
         l+nvtQM0iSf6YotDYtxC5qsp2nHNbxbAciqdIkefhmmctJnadYGbH+LoIOkBcTneQBvZ
         t5Lds8Xk/i1Qc5c0DOcqlXmyEbyWwYPG/KsTqLEDmSh/pv7IfbXdI9N1aZgn/XJagOlc
         afSjov9JwMUWDKrDWrNwZuCMx67peb3W7yfJSP4gq2pxxquaKF5gR2uuYqJdEV5lAxGI
         UHrA==
X-Forwarded-Encrypted: i=1; AKwUvBwRcX6BgxQ6nhWMSJhpnhRpts6UTKW2AMn2QDeSbNg9wpwJKTWgjx3Zliv8q5A5lmTxnV6u/6ivIJYSrw==@vger.kernel.org
X-Gm-Message-State: AFq9FYK+K0zfBSuW1cDNhIwrDMD6n6uw3/fML8Hzdev/h746mOoFxrNe
	6+02rmfoJnVk4uL6OLSX25L/ieMF6HUe4l4AMNSgDFaXFaO8+YNc3UDmmX7kJAF7h3q4UBdeERD
	wG8ZMAQFqrQKQsLKRjaCPixThiZZh1lmYo2V00VPQ9/ghNCk9mAExS3ZUDs/jXaGWWw==
X-Gm-Gg: AYBFou0Y98r7HoacG0Xm0dl/O/UZsMvT0tDVjATd5PdL+BDwc1rCT4SnU6yaMn7Wx0N
	a3zt+hsclkE/wauju2CZAN55SOS0b3dpfsv5wrH8HeQWa2Dvd3n7B9T3+PDLcQv1ze5GGQNnyH5
	J7CcQYHZ58mX7G1yNLgeEj0TjRUJ018k2ZMZ8Ibr+vyrzjZSt6qc36rInZW4arkBR+PvyXM1RTq
	GDQ24tr1/ZVefja4Wzmf3A6CAvfOWNuFXT09cr6FAUWMbHxadYrVAyMgu4INPUeQBGb3/ligdvm
	cdteJRI99g1si2HQpuCENIlx9jJYIZGOYwHfK60SLmQSGMyUdLgDsmbYTEAPKJ/r6QTj+g8yZJM
	Q3jFC9z8RiGvf8wQ8olXtVHnpT3wRHtczCd+RScLPUyC3l5Ik64mRa/uJnIURjXzu9YiL/1QVJw
	PLXU0KT664
X-Received: by 2002:a05:7022:4a:b0:199:107c:25fe with SMTP id a92af1059eb24-1a6ce2fec32mr3873295c88.31.1793191679535;
        Wed, 28 Oct 2026 05:47:59 -0700 (PDT)
X-Received: by 2002:a05:7022:4a:b0:199:107c:25fe with SMTP id a92af1059eb24-1a6ce2fec32mr3873241c88.31.1793191678889;
        Wed, 28 Oct 2026 05:47:58 -0700 (PDT)
Received: from [192.168.0.104] ([124.123.197.72])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a76037e2b5sm8546468c88.21.2026.10.28.05.47.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 05:47:58 -0700 (PDT)
Message-ID: <fa7ddad3-81e8-4c0e-a5a7-74434746bd88@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 18:17:52 +0530
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
Subject: Re: [PATCH v2 3/5] ASoC: qcom: sc8280xp: Add shikra-cqm-evk
 compatible support
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260910-shikra-machine-v2-v2-0-9bf6bad589d8@oss.qualcomm.com>
 <20260910-shikra-machine-v2-v2-3-9bf6bad589d8@oss.qualcomm.com>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <20260910-shikra-machine-v2-v2-3-9bf6bad589d8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=M4bYuCws c=1 sm=1 tr=0 ts=6ae1ef00 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ud/Gc3SFmwde3Mv7YyqU3w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=lZdmFDQy_dSNCzDU9jwA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: bnTnANRDreeB709NB_uh03im_HekX_7V
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1MCBTYWx0ZWRfX223mtS5vEmP5
 AZBotB+esBmlVJ4v9R3kakpI1OmRbI+/PF0W/PScy+HWqeUvO1qrmYSpjM+hYRV4f5Pio4Efq0i
 AW3IJpG3osbRsZrcr/GtP7zGhGVoj10=
X-Proofpoint-ORIG-GUID: bnTnANRDreeB709NB_uh03im_HekX_7V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1MCBTYWx0ZWRfX7BpvmxGqxE5D
 LuAVS0XBZNbVyAtWdCH+Y4K0NGWSUq6b3hxAdtwxTDbV9Twb3Ry0bMiuQ5pr5jnGf03fCfx7HZX
 ZYhE8H/gQxm+lOz09uiIBbEkFAQ09V6qxnQcYAbcl4Yo3E5AcbbAaiSUpbFdVtlYbkXZFv7X/Qr
 Ymcj52uFNy6YUUQtHha2KM2QcU6AT0Q7lbfVLLIKnjc58HsbzjH6YAp29OK4CsOQjSAl/88Bpak
 L3lfNqv3S6qotWbl3E+OanKPxI4Yp+bcFCr/vmTzSaUpVbJevIThhJNBnUm1N297bo/cuEgROuU
 H7MMR7BU+eOmcN1L4iKKyHo2v/MVXX1rueLipBxkc3xOohNn0rBbULoWIqloB2dMAJ21bP0L6Wl
 AtslU72eCsdlvW3U/2LNSsQJGkEB8QYG2ZfF4XTcTDpdU3oaDVagV0gz8Nm38Abok7AUaC3nxxh
 u8pT5P3HsSYHjLUVqcg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 malwarescore=0
 bulkscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280050


On 9/10/2026 8:32 PM, Ajay Kumar Nandam wrote:
> Add machine driver support for the Qualcomm Shikra CQM EVK board.
> The Shikra CQM platform uses an I2S-based audio path with WSA885x
> amplifiers and PM4125/Rouleur codec components.
>
> The CQM variant uses DSP_A framing on its QAIF CPU DAI, configured
> via the cpu_dai_fmt field introduced in the preceding patch.
>
> Co-developed-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
> ---


LGTM,

Reviewed-by: Prasad Kumpatla<prasad.kumpatla@oss.qualcomm.com> Thanks,
Prasad



