Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE7A53B8135
	for <linux-sound@vger.kernel.org>; Tue, 22 Sep 2026 03:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790047795; cv=none; b=JDOHxkrNJiZSKJaj7t7PixsR2PLJv4HBDXBaeSeJN0hkEAIVmL0jio5pGCNbZaD3IPLVUFqvzNzEbHxMqLQsAgsxFK1e+VIN2h0syY+guYZvSDT39+qFS9dvg6UJ5Lii6Z8tlmqx0rFZy0fTSCKnnDZBmuuvGRtVse+k+aMw2ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790047795; c=relaxed/simple;
	bh=IXR9wGNx7CzokaRE34xfRHOOYI4ya6dNRV42KZaq90g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l9CtaRu3R7+uWTN2Dl0X1fw1gjif03NIywc/OrbEy/gzJ4DtHts2XsrwteMSsxo4Cl+FhtspwLmVjMXG67o89sfPdY07cqzgVRS79YoIaK3Hkwawp7VHQqLUvpBTbAlVmskwdDkPx7jic/8W9tl6i9A33AJViW1PwNvGLocwPlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VHrkjbwJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DdGj69xr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VHrkjbwJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DdGj69xr"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M00EgM2673797
	for <linux-sound@vger.kernel.org>; Tue, 22 Sep 2026 03:29:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qZJWFTWzFMs7KDBz2CdtOMeCpgViM/RneB5GO+CAeiI=; b=VHrkjbwJ8pRjGR9F
	SZ4gY+9s6guu85svjYcm0Sm9500Ltu2p4af7Yy0/FM77L4lDGunxrS7jp4b+2OkR
	sMgzXf8UtFZiUq8WN0T0kGR3ggJ2liS+VVVp1fqQhHjeqvdbtLXaQjvIQlBEwA7+
	IZLNIboyF5NSejbSuBd+NXoeAs0Cd+8m/Fsl9zL+B1Ud7PpHK1gAf8Pt25M/4jwT
	m8/bf8fPO9E+jzuBWVDOXui+AoniQu8G/H4SrqhFtDE3FLGhZ956bl4WWatrP/j4
	HWiM5LRRB2g6uP1WMkJiHI8qQbXtHkUFtgBLUOphVIO0u2k41sX4SJXxh8r7RurJ
	NLAg2Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu8w7a0hk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 22 Sep 2026 03:29:51 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39e3f521346so4199046a91.0
        for <linux-sound@vger.kernel.org>; Mon, 21 Sep 2026 20:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790047791; x=1790652591; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qZJWFTWzFMs7KDBz2CdtOMeCpgViM/RneB5GO+CAeiI=;
        b=DdGj69xrdxtilFMFN2C5xOGoWi0o335tuCXGXAA6C2osiwOh3WQ86JEXDGc7O6X+FK
         i5It13ErxX6o+HfaR78RgbZ9FTJMfelL+95jVKEgSOfWVMdM0/1x0GQd72GKpd57d7xB
         H6t7Vqy/LNO0bxAbQW7eONTSZCwtQessu5so1lZYERlD7jqZ2GKp4M3Zdfn/fxVEVaUB
         P5QGKc+XCuBdDF6AnY5ufYv2wC2u0r0DZ/nDBtP8K9k7mwN48K4eoe2zY3Gb6TNGlqtV
         2Gsq1mqSlse/6RGBMIXtFiXy48IRHN+Crk/PvesJ4KP4Lw1WKCLBzqYfQXvEh2V1nXiW
         uTRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790047791; x=1790652591;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qZJWFTWzFMs7KDBz2CdtOMeCpgViM/RneB5GO+CAeiI=;
        b=B/WFhV3Vrt4TLkr1qYk1BhC1MlaWZRbAFaKKaLXQRN+odLFuHeSpE59d5tzkvyG9ni
         ardcKJCOA1x6PrrHoTXT+rf2pI66VrS3z9vAOx7UOlwFMqrYp3Vl2a/l5uDxuurh/38P
         GSppV9qFRDuhY9qr8mU2BQ5yyrm/IjLPvsVgXNnHvKbKtRJfdGyzvKvprY2GBcxwN2ar
         eePZTQZvfhKj6Ft5xT5ybUrGHW573vHDI5Xrf4qHzrx0Hc/Ms5S8HnNJ6B5nPSJXMJb+
         7dTsnSbQ9u4sRdsPY6CDhXFw+EFRUTsHMrsusBjKT+AfRHhL4bpgteGPsODfgK7lixjU
         0HDg==
X-Forwarded-Encrypted: i=1; AKwUvBzfakGFEtVI3e6+FQrlmVGfFcJC66urymQzZnX3Sm0n2+G17dmiJmKs0GlXsXDAUo6GlupZ01YasjM3tw==@vger.kernel.org
X-Gm-Message-State: AFuF++lLypyvNPlo3LdKQhUobsAJ4IUhsOzaraC0Nmr+FbmktrxkZ6+j
	j4F2DgyaClMp1KAGH5aVCOd4g5GWCnBp7TDoFC+Qm6jgKrGtKpYaJvLbjff7ddQQpZYpmttjeKY
	hNun6agsv19B8zY3pmy/H+iWN1OSSmJ+g2vPQpdb8OgmiFirQitvz7L8dXDjxGQtszkFeJffbyw
	==
X-Gm-Gg: AYBFou1b1C7Xdi08+C8JB1S5qoU4VddV3iPUu5L/THepFNb6F9haFKoptA2e/3tML5c
	baYAXGkUHA8B4VCdMH4DFVAQ013/kUN0rAfIJZWxk6NZ8+6ejmDGzrWHToMWdGPtWr8Cb9N1+kF
	EPBycntXD/8VHfKNZDUduSda/jApPt/XUrdrxtT+UmKrDPdLQPCqq+PzQKi+x+Ycw92OfwefaTu
	CCWchIiH2+lGoy8Z4YKnaQskeUkt/tGmBFAG/BR+nRDtDreKLcGnHEeX2MVW/P9nHHq0VC9NiF3
	CNzqg3QZfEEZ4/i3LaF1zH4kyBqthjFcm454xOv5Eow3jNK81Z4EKEACCSq/R3yR92RQhEBVMh+
	nsP1NhntylNttFuFlBMKtsDdbZNDmvkP2aqs=
X-Received: by 2002:a17:90b:5408:b0:39e:6a80:dd9c with SMTP id 98e67ed59e1d1-39e6a810c1fmr12613889a91.35.1790047790707;
        Mon, 21 Sep 2026 20:29:50 -0700 (PDT)
X-Received: by 2002:a17:90b:5408:b0:39e:6a80:dd9c with SMTP id 98e67ed59e1d1-39e6a810c1fmr12613866a91.35.1790047790232;
        Mon, 21 Sep 2026 20:29:50 -0700 (PDT)
Received: from [192.168.0.106] ([49.205.116.211])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f29dc903sm1198945c88.3.2026.09.21.20.29.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 20:29:49 -0700 (PDT)
Message-ID: <2e4ab098-e656-48e9-a4de-b67eb44b9941@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 08:59:43 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] ASoC: qcom: Add QAIF AIF MI2S and TDM DAI support
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Harendra Gautam <harendra.gautam@oss.qualcomm.com>
References: <20260918-qaif_dai_id_support-v1-0-ed863c0e5e45@oss.qualcomm.com>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <20260918-qaif_dai_id_support-v1-0-ed863c0e5e45@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: bYyExNHl9W4jgxTf6lExJcSERjUGFt2Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDA0NyBTYWx0ZWRfX+n4tKvTT6YJf
 bEHPINehMSuR7RiAx+u9hBt9zVRzuAoB8ZRQ3fDL0wF84lNCfYJqCnk55QJ+9+/4NvaibSG01s2
 OkdLRXMTkEKyR9BCdpRe3Z7qK+VUOVRDnihPUbOlHZH23EofRRaK9s/Zm6vfgPkdY5deldoDckE
 7S0+IYN/RjycTy+TiiOS9WuuS0kFH6hNFpHEQvQZB8mDwo+fnk6gcBp2jWOVDTii+gUWpbJD9vQ
 kKOC/hEC6FqmtBklyRs4W6Pt6uEq+fE6vNsF0JnBCvuUMN2JsJVoj3TNVZXkm+PIzokrWRb9dH/
 +dcZ/CLHk0JT45XNC1rr29AAKQLBWWL7FFr6a5pQx2cNKMGEbahXmA9z6sPjJOURsbNFpJWZ1y+
 BXCP6rRGkL7sQ1aIrTChESod9yMY1KHaq4sIhaOhlb35peMKxoUTNssymx4FBJKhv6atuHxkdQ8
 1lRRcX2BYdTPYuc7B8g==
X-Proofpoint-ORIG-GUID: bYyExNHl9W4jgxTf6lExJcSERjUGFt2Q
X-Authority-Analysis: v=2.4 cv=Vqi2kO2n c=1 sm=1 tr=0 ts=6ab1f62f cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=2ngnHYY/h7Qxskz9zhV0NA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=PKOAMDuyrTqzGgetilwA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDA0NyBTYWx0ZWRfX+Kz9LWC4y/L/
 h7DDPfYXS5EW+V0WWl4Vg05gLn5d29jlwzXtWClLDi+mERLOMFZovzpvGp02Tefb3nKq6VZXtqg
 CcEqjBwQZeTO3AML0mmtSWSi/FBoX2U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220047


On 9/18/2026 7:01 PM, Mohammad Rafi Shaik wrote:
> Add support for Qualcomm Audio Interface (QAIF) AIF MI2S and TDM DAI
> id's across the Qualcomm audio stack.
>
> The new DAI IDs are required for platforms such as Shikra, Hawi, and Nord,
> where QAIF audio interfaces are used to connect external audio devices.
>
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

Thanks for the Patch, Rafi.
Tested on Hawi and Maili WSA885x speaker amp setups with the new AIF DAI 
IDs. Working as expected.

LGTM,

Reviewed-by: Prasad Kumpatla<prasad.kumpatla@oss.qualcomm.com>
Tested-by: Prasad Kumpatla<prasad.kumpatla@oss.qualcomm.com>

Thanks,
Prasad

>
>
