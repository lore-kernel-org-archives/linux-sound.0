Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0628C511198
	for <linux-sound@vger.kernel.org>; Tue, 29 Sep 2026 10:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790678758; cv=none; b=naGv9lBJxBtoNlozkNO7/qQiTcvM7XkRUo6S4qPkTR54ww5h6Es51vi2pKPNqTdCObOmXzOCR9nn6Drw0U1o9P53JN34cYwHRpgdp1WJH1HfSqR5ZeAl+qPyu0FulXJFc5KM+9fVzlsRQsJObRR6haIycDG0WgevF4PEKqmsCPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790678758; c=relaxed/simple;
	bh=7oAh9n2HNriIc8pQ7EX6gC2TpA2I2Y5UzF+0ybwLhUU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CvavzjheFxwlfCshGiftSwsJ42SNuHXFwtmtoaBdPryQ4FGaSsNYXVw3Z6c2fZqJENyz1pPMzzPed4hOmPYL77fio523PsGXHSo1NTLr5HZRYI+ztpWLrt9beVOVVQYhG3C6+uUwPYbLJAlEHVmf101wVK9EQhCZgSNJXNBntXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XFM+X9HH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V7nIToJr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XFM+X9HH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V7nIToJr"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TAjBJp3011329
	for <linux-sound@vger.kernel.org>; Tue, 29 Sep 2026 10:45:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Th1EoeF+t6Rzml88WR4hQCtOyjoGJpY9HaMHi7et1Bg=; b=XFM+X9HHocuN0I2p
	1BascmweDqw5tOUGaSpmElzjbVtSOBxUiiZMS4RkG3j6bXjtQV5sNiO+Oe/1QTFe
	bA+6iL1pI4I6Uqq9RRZx86HEmyLl2M1QZH925wxjyDEIaKZA4TQhZVe4jmydresj
	prJH7sX4y1x+pyJVa27jskfgAJFWoTQ6M7kzFli1kjsrxtBlCntks54r4+mdeZBm
	OXR4jJyKu23pmg2BRC4pmVQ5wBVKEzgaIoutyRMOdH8NEc712uveYpFwjwahqMZ4
	3Jak2AVkIKyFtYfKxXZXGauuR3dSW7iKjubunClTZyoaokIPPUsaznBcYMStZbYS
	4vTwsg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h02mna8kq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 29 Sep 2026 10:45:41 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38ecc48b3c2so9040511a91.1
        for <linux-sound@vger.kernel.org>; Tue, 29 Sep 2026 03:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790678741; x=1791283541; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Th1EoeF+t6Rzml88WR4hQCtOyjoGJpY9HaMHi7et1Bg=;
        b=V7nIToJrNdbF49NgdusCVmShH50LT9NFLf8kyioi5bjRieX4WWLj9TIHsiGrbiirCs
         6STD8fU7sy4AB0yQ07cX/t0K5tHU6Y++LXPIs+YF3Oj7uj5yM15WpR096E6C+rl4dN9r
         +HFrTJuUwOtZbhkN6TjIxHxKekgf4iKOns1LSMYdCZ6hX3yAzNwvEEiDs0TfPuvaKO2V
         u7C0oXOiuYndEV+/eeksM9G37MYzjg4sATaLxLEEMPbDwaQviyPNpl20jI/xgaIO4Olc
         z9xXiDCZ+ZaqefDVhdqImBMghv0FyaqIpHGZ7h6uhqzvkkVh+7D0U1WZc/STwtZetxoZ
         ZXXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790678741; x=1791283541;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Th1EoeF+t6Rzml88WR4hQCtOyjoGJpY9HaMHi7et1Bg=;
        b=yDwF3zR9AfmK73ygH/pQSbq01WNl5CbkSOscZGEIyqr5EuhY7ISF+pryxhQ+3YniFX
         ZWo7RLngwWDLPLwol6LV4WCrCO86rb7xw4WWiKTtnwbx1upL3gfh5aG20P9N+Vw+akGv
         HMooDG63phpBsUxdNP03KEwqUFA+3i/pixfpMiODJEXmxPNcvenZ64s5PEsI26/4VBZ6
         1hmOsr6oYmB5jClywJDEwz4UmfrA/sZD5SSklvg1aojjvAb+Q+AQ4IgbrpVh/vdWIj7U
         Vcx+rBQ8hYb3CBthJ2X5bgbYwBtE5Di6Hv/881bUt2CdKBp7VH58khd7YpGTwZY06pDu
         lTOA==
X-Forwarded-Encrypted: i=1; AKwUvBwEvScxF1tABTmOrkVTc/kKHCqyzVKMzjxPcgue+VSAcf5beXVmGcncICB+u6d7gOA5+PxdsX/NYnzA0Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYKnQnenK1VLE7797J8ZghsHjPCaIuKEeTJ4prjKldn1kw7H72Wb
	s/bpwrvBO9IP3yx9Mo7qAPHYMLZc0ji6hTAetv2H2yaeTJsNWVqRc37pfxWvHaukh8D/cfQuKcy
	S8el9quMShzEkbDBxhQxSbi9q31W9aOxz12/YKXvPr+a3YN1l8CMn6N5foJIcwO6mOA==
X-Gm-Gg: AYBFou3NRRF1/HprcZQ79oVsxxCUaxah7rgk/bqPKb8BwlEwq/IcUsvid8v7Em5UTXP
	qTWsYHNmKsgHGzSk+x/b+Rd0gOyzon5hfxfISGEbBNQuDac6B4LcMiwaRSLG7ZI9qyN286zg+Sa
	CKmbs5Bnszj77GJbnGaOPTCzqaOfR6E/NgBk5c+Nud2tJlVe30zpk3YeyyY4tmS+7YJgkKyj3z5
	OBIw7YuId0QZLn0eM0UcngyFAij4JCu2JZc0ypz6GvUh04NaIvQv7xb9aOw/bJyeZaLfLVwEEg0
	Z/MLpUGL/oIoA61oLmd7yzitz+Cr+27I+eRK4yiMdRG0T2tSEGqezaLWPvV3C0nOFSOSVXBfnFc
	m/MUndi2VTd7JRyISM0t0lwgwNiCcrWNTymjezQ==
X-Received: by 2002:a17:90b:5107:b0:3a4:af1b:46cc with SMTP id 98e67ed59e1d1-3a4af1b5358mr412413a91.21.1790678741231;
        Tue, 29 Sep 2026 03:45:41 -0700 (PDT)
X-Received: by 2002:a17:90b:5107:b0:3a4:af1b:46cc with SMTP id 98e67ed59e1d1-3a4af1b5358mr412400a91.21.1790678740782;
        Tue, 29 Sep 2026 03:45:40 -0700 (PDT)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a498057a62sm4907530a91.13.2026.09.29.03.45.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 03:45:40 -0700 (PDT)
Message-ID: <16a6c858-1b75-45b5-bd84-3779deb0cd68@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 16:15:34 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/8] arm64: dts: qcom: shikra: Add QAIF CPU node for
 audio
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Harendra Gautam <harendra.gautam@oss.qualcomm.com>
References: <20260917-shikra_audio_dts-v3-0-9a49e1ca6370@oss.qualcomm.com>
 <20260917-shikra_audio_dts-v3-2-9a49e1ca6370@oss.qualcomm.com>
 <tfjdo4awnnqxnfashsg7rngszkqhcbz3aurpc2zz4nw7vhbykr@knl35b4p2ruc>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <tfjdo4awnnqxnfashsg7rngszkqhcbz3aurpc2zz4nw7vhbykr@knl35b4p2ruc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=X9fHu2Te c=1 sm=1 tr=0 ts=6abb96d5 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=uVyU-rc3LnrGhSSI6FMA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: oZ_poDtd1tm_koS1ULfdY6ZIe3sZz3n4
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA0MiBTYWx0ZWRfX1XodqW1DL0nt
 5x8oBF2P7JOIdCrg6w03hObER9AEqXF5V9M6aPln1WYyryQXQAaJB/b1yjC0zy8A+u8sVcXVp5t
 UdfKad9AioAYNbu7eYPZiuUmKFdYxDA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA0MiBTYWx0ZWRfXyTs6IMAckBt1
 ZkDEaAjNwROgDMlEHmx17o0XrPmnoCVjgUYQvsj0LEnhi2gNPwmbFDN3QPBvcTlHVfT9oqvtkYc
 RZxU1s+ia9K1uwW/x03AWI3h/HfVhvP020HZZPOghlaCbS4K4nFDYEQg5R0yYADu8LsFXLwFTmB
 jMq9S0AQqskoIOlsbmlwJmtgdipxjfpZJcRPqM5uVLsjIFIA7SsUoK+MmO8Fr73g2OzgaGHJgiS
 MKaD0Spv25n1FCHc9W/IxDOQZMWHTaamApNPU3qp6+9P8f1WnWyLDEg/tvpwAFKFJv8xvkMikol
 /tP8fDrevdi7JE6eq6zrBSURVhmRpRo2Lnfx6MZfzF74K8evgpQ/CPWSx+TgG/kGeYaQVaA0j8R
 E5mfsfGT0A+nJcWZ8EYVfbVRFcuYK7t7BRoFka0smuHJ2AqToiOcY58MutNnG7WboAdx+51JGMX
 f1NdBIdzIAkz+XXuARA==
X-Proofpoint-ORIG-GUID: oZ_poDtd1tm_koS1ULfdY6ZIe3sZz3n4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0
 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290042



On 9/17/2026 9:05 PM, Abel Vesa wrote:
> On 26-09-17 10:07:31, Mohammad Rafi Shaik wrote:
>> Add the QAIF CPU endpoint in shikra.dtsi so board files can connect LPASS
>> front-end links to backend codecs.
>>
>> Describe the MMIO region, interrupt, IOMMU mapping and required clocks for
>> the QAIF block. Keep the node disabled at SoC level; board dts files enable
>> and consume it in subsequent patches.
> 
> Don't mention subsequent patches here, please.
> 
> That is not a good enough argument to disable it at SoC level.

Ack, will fix in next revision.

Best regards,
Raf.
> 

