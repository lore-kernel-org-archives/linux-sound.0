Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F5B4C97
	for <linux-sound@vger.kernel.org>; Wed, 22 Jul 2026 08:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784709149; cv=none; b=lD9dKaGAMJ0/h3UQxQkP/mqXnDM8/JqpCHqx2GOxLN3JFRgbqHQ/P1cQ0s+2c3iD+q0AZNQSYuDu8YsZMuLTwetVXYmTVp2N3fx/w30umY/YYej+RFnd0h3dH40+M0oytYi7ncuaimy959P7fZuihUi6tTHL4g1WEUoGeHVZL9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784709149; c=relaxed/simple;
	bh=MZmp7vUxrjOsUBaR1+c2ZjLz6Q6u/vJumUfWXsRV/2g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XUSgVl6eFKJgyjzxBRu9yNhFeQ1ymTwC5X5nw/pLDrfhiuqYPNUhfW3K3kbxD3DQQvyMaopTK6xqVZ5VgERsGtf4KD7fS2IXQGsmoOTOZ1f9neTOz82P1LNSNvPnlKqb+SDbGYKB0GsP8g39ID8EjERmimmqEK0HUX9mR+3LNxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lKmG7HaY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zc4DVJjx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lKmG7HaY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zc4DVJjx"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M53bdS3767556
	for <linux-sound@vger.kernel.org>; Wed, 22 Jul 2026 08:32:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vTPTZSlyeSFAPb74Rz4exIX3Dyk4ERmoK8qDTw4/JgI=; b=lKmG7HaYKlg5DjF0
	a42BSbAn/JCfGeSlRVH7w/dtbmsE7uSmqeRl5LIJ+b9vfqNQyrJw/9r1FQWAQlX8
	0XPlqAM8z4rSbAn0QynOBMckjIZo217G44vJW9AaW9cGtquL02v/VehCQzKn5RP3
	Vc47jclOGQLQuYBshmVFIkW4Mz0AibsRT75SWHe61xVvBRdvji1knDjZsem3G+pr
	RFC0hMJhbj1ciYlSgmtUEC9Gv6292YjPVhXhJgwpfwUuxd1RRBXN+A9hKTSmkXw0
	cX/A4ugKxxl+X0ku0le62r3kistTc1fSH0C7bMGBXVx6FXB6aWV4Uy2m8dNVxy4Q
	a9y1Ow==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjnu4s4nh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 22 Jul 2026 08:32:27 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1d137a68so335438241cf.3
        for <linux-sound@vger.kernel.org>; Wed, 22 Jul 2026 01:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784709146; x=1785313946; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vTPTZSlyeSFAPb74Rz4exIX3Dyk4ERmoK8qDTw4/JgI=;
        b=Zc4DVJjx5pskbKCbAgOfY72LGTbcAScVmvMIGpBdhjx7aLMB8dKH1ADldFE2PI26MO
         2r355H9gpB/LodiBVHerrJVJk4Q/g8qZsJG/Ff6SvLRM7cr1iqIgA4xRkB6IXGBm5QTA
         zsoP8+rUh9IxHfP4JFnQHMbZOQwHmrhorwm6Nl3W5MKAiHXnKM+2sW5pbbrVS2XSluYm
         gRv5wIMqIcazYQSLw2ocdgvm7gGT1lHnwRcOXvnF3KjksKcn4zM3OR2hmltgCVhOFrqW
         oNZ0NG20HKnG7tPqkALYMNi/HzABmrA3WDw4GFhrZtaaPdUfBYfn0GyKbQ6J9COZC2Aw
         cF6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784709146; x=1785313946;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vTPTZSlyeSFAPb74Rz4exIX3Dyk4ERmoK8qDTw4/JgI=;
        b=evKl7mLl7K//Q6mapVhml/gFFBWUJ3PQQO1DfztceBJbx0qtpFGaIQYh4FaUBEj1wy
         bi4/885sf3t5sWVT5HEbSFyLD4cq1rklndJJh6pCh3a1m9BR1PMGgDyrP7Ss8S15J4bk
         J8sQu34tHuN19w0vw4fsdv5K9xSRWaGHgIXNWfYF09b5c9rVSRxNNFMLKfQ9rW6opzuf
         5FQjoSAg1NzbJtzuZzJf6s4FXmRVUmlQYCYvSF0QtpcZMF4gBLsJCJKO+0Zx7PIKhg1O
         +YF4a/eybOiVYHpq1zVtQQyJqsUVVlxsBEKeiUev2UWfHFS/IZE2vmhU3diOmKmLtM8g
         Br0Q==
X-Forwarded-Encrypted: i=1; AHgh+RrSCbZ5T19o9xem4mrS+Jc7l+FoT/Ecsva7KL/nDN+l+kHwVXSGWqNXaqmdIr6glVZSy4mgOdD9OJsCMw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyGoU7kma7cWB8u/vOsGR64cs6Q0z+ZVVoxaPfSAtpIRPyfRZxv
	mmslKTkRB9CTHhL0MqacCLMQxxCOai8OKtLtQ3zVX24z5+PtF++TutSW8zOmwvlfE0qxk4molCk
	Qd8JPFW/p8qoaN2FARrFKNS1OQajS4GESwFLgjH3HIqboNfBe9Lm/Tnx9cENhiogH3Q==
X-Gm-Gg: AR+sD12mJKJqjn+zGva4o0d+6r3du+PaoseEsl210AwWN4YHXgOCxgxjNVuqLeQKRxW
	nOH+PxSyZimJG9zMCBOppje9sQU9tMRvWmiegMC1P14iPO4o4nXSbGdc/tVIJdMnj/dOZT0J8sj
	n+Llxu5S22s9iHQWZqUQkTUygdFdhoCo4y+4p3KuxOnX3v08gBROdTHBoEJvV4PPDI6AHa1tLJI
	sbYF/GvHEpP8Prz6GWOc2kcWIBDRHVrsr/STQ4rA8Ro7uA640+K1KkFbnFvgWUJ3jctUvneLfvd
	TnKW76IiHOFBELJ3b3is0YrARijUGtmWHQzpn8X5qoKIpr9xyULWVDlHlEn540ZbfzLubAIiHlY
	cBwauelJquIPCvTSwbSAJyW+7ZGM=
X-Received: by 2002:a05:622a:2512:b0:51c:7b11:419f with SMTP id d75a77b69052e-5213f46e75bmr210124791cf.76.1784709146502;
        Wed, 22 Jul 2026 01:32:26 -0700 (PDT)
X-Received: by 2002:a05:622a:2512:b0:51c:7b11:419f with SMTP id d75a77b69052e-5213f46e75bmr210124621cf.76.1784709146044;
        Wed, 22 Jul 2026 01:32:26 -0700 (PDT)
Received: from [192.168.68.114] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47f85b9a5a2sm4310415f8f.7.2026.07.22.01.32.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 01:32:24 -0700 (PDT)
Message-ID: <92187e4c-3a54-44bf-8d3e-ef7e23e7c71c@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 09:32:23 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] ASoC: qcom: remove the ipq806x Storm audio machine
 driver and binding
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Christian Marangi <ansuelsmth@gmail.com>
References: <20260721-drop-sound-storm-v1-0-23ae4a689ffe@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260721-drop-sound-storm-v1-0-23ae4a689ffe@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: AshZx0xbvd0yFu4SStNeIjYakPePXbY7
X-Authority-Analysis: v=2.4 cv=KLhqylFo c=1 sm=1 tr=0 ts=6a60801b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=jkUNJ2-YqXqEMmPuORgA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA3OCBTYWx0ZWRfX8Cil13DhvaP3
 QI+QrW19MuqMM02waosFZVhhtRWw9+NAGkWynO0u02S0giEQIcxtsykXPmTLXPeS8S98NIYcQyi
 37bzJbfeN70mFC/pvXiWg1bHSzSXVLZts3EBOcsOt0V1DAWw+7GqaDfmBKWobwZW+vTwo4fVjgx
 oicjC36BOxdUIk58WaPXVe1i580Tihkmd/dPrHI0K9unbTXX5/4MbebWOzaWjVEfTyqPTxa0/8q
 jYRg+C0dh5EfR8CCxghZi2JYSnEA5F2+hKEwmVWIP568EC81oz5cWqCBIkIvjJVJPAo5loG0vs5
 wwWeyGPxWnloOTGniZcv5Kkzvux1zvJE9pbfhtQ37Y8QlQI0gXy7xo4UpHg2FCG+Zs0I/BMb5Kq
 Tpnw1YPB/zsabEUxbxblwl7PrAf41h1uTDHjQr2TWHlqo7iHdk4TCI4CO3ZUTHB6FEb7c+Ns0QR
 IX06PDt1FX32c7kmySQ==
X-Proofpoint-ORIG-GUID: AshZx0xbvd0yFu4SStNeIjYakPePXbY7
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA3OCBTYWx0ZWRfX68N1Z3Io2W5s
 roWx9BNhM0ErYkqb1r0+AOYLDuvHgqflbdDY5uIdDyX8jOGMssGWpDwkcQ7F4Qr2iiJjkIhCTrg
 wcKytSeutzowh4XwCffIwH6Kepz6v6M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_02,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220078



On 7/21/26 7:12 PM, Dmitry Baryshkov wrote:
> The Storm machine driver targets Google's IPQ806x-based Storm reference
> board, wiring a MAX98357A DAC to the LPASS I2S bus. The board has never
> had an upstream device tree, has no active users and has seen no
> functional changes in years. Keeping the driver and its binding around
> only adds maintenance burden for code that nobody exercises.
> 
> Drop the machine driver along with its Kconfig and Makefile entries, and
> remove the now-orphaned google,storm-audio device tree binding.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> Dmitry Baryshkov (2):
>       ASoC: qcom: remove ipq806x Storm machine driver
>       dt-bindings: sound: remove google,storm-audio binding


thanks for the cleanup Dmitry.

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>


--srini

> 
>  Documentation/devicetree/bindings/sound/storm.txt |  23 ----
>  sound/soc/qcom/Kconfig                            |   9 --
>  sound/soc/qcom/Makefile                           |   2 -
>  sound/soc/qcom/storm.c                            | 142 ----------------------
>  4 files changed, 176 deletions(-)
> ---
> base-commit: b9810cd75b9fb56a3425d391cba3f608502bd474
> change-id: 20260721-drop-sound-storm-7226df1bc850
> 
> Best regards,
> --  
> With best wishes
> Dmitry
> 

