Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBE073F86E0
	for <linux-sound@vger.kernel.org>; Tue, 14 Jul 2026 08:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784018009; cv=none; b=Po8rg6QJgqv81i6wtzTIdivM+JgKjHMaTvy0ptqifuyhv0/6k+C1JC8MmzF/RwZrHPxIStUXeJETpx2+E7gaps2KkLEVYVDWBF+IfyZARRy/n3BXL2r3inXBHy6KRMaZBnF45DbqL7fu716PZvL8iMxTu0otdeSOekEbbPfoROs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784018009; c=relaxed/simple;
	bh=h7/87QKXD/fbJfpAhjv8FHvRLmrxNr5rG4NhU+XedPM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hu/2AVpicP8eKlxB72hlnlW2wvEaTRZLzS1MT344Shg/A1DtqDzlKt28PHhlgCnexEGrnJBjZpzlpHAruXhmry4tMUM8iuI60Q1GkS8F/Q8jYAcLVOXO8HMdgtVskQMYKCkSQIhKJC+ifZkBmehLVCdmxYpnhaRUKxpatbuGCI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CcYr6G0Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xt9OcHB9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CcYr6G0Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xt9OcHB9"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E6SLRi3912628
	for <linux-sound@vger.kernel.org>; Tue, 14 Jul 2026 08:33:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qf5HpFHipPuzqMdwymBhE6vQiUD3/G9Ju7yaYuAtlzk=; b=CcYr6G0YoO+C5YFF
	hmZ4O2erC9bI9fEUs4EzXYdW+svtpIgYUIaJ+QemCDNQVaUwA2itV09F2juYI/PB
	HuJqh3KrXV+DQaJR3PNlC9W/e7N/PpevMznb1gY4MIkxSF8x1vE5kGxcm+n4Y3MT
	NJMJoLzKT6NCWhpxVoz0s47/wuMrhY7ZLzF5OGuPrut2GK72Ho/zIOIGXerK/Cvy
	bw6rf+iTIwLr89BWhcdh2MaHV5kstLSuYW0Tyi7qGqiRGhbN+g9dtGjhL9oX6ZHu
	Sk/mTojj3s87VlEZputg7bhRcdwHZgxuaw4RblHLjRbKraGgAssXE99qkohzkKxM
	p9jKmA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdeu4gs2y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 14 Jul 2026 08:33:18 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e695a3b28so69535985a.1
        for <linux-sound@vger.kernel.org>; Tue, 14 Jul 2026 01:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784017998; x=1784622798; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qf5HpFHipPuzqMdwymBhE6vQiUD3/G9Ju7yaYuAtlzk=;
        b=Xt9OcHB90JrlOFvfURLHBBF9+MjoMWWOzlSzeIsblo2MzVqjb5i4eDzgD8TZkiFQd4
         qb2aiPc+ZioGZ6p1tKvjOQ67h68D7jqa0GSblxCnfyeCCj9rXoaSZmUWyjrRi0qyTRCa
         n1p0o8WKSU1pOBEdpbidp59Da1RHm6xtNu7VfBEqbmi97uHt50eJ3t/IxYlgvjzwS+WK
         xDucrthHL8x2tQjR+p/INCdWhKqBDVCTUDuIf4frHatZyDKxa9gpfVn+FJC4mVVZ1RQ5
         JiUkfjfQpsUxyESCLD8OHqjmQTpVdH+cZCOCHGHPNikZ7CF594LGe7VuJzPaQF7mlGFE
         WHYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784017998; x=1784622798;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qf5HpFHipPuzqMdwymBhE6vQiUD3/G9Ju7yaYuAtlzk=;
        b=UD23ZKh41AnTfWq22mdJ5xDaiI6rCFhcRD2TN69V05T2xhQJePdSr6TKnciXkt7Rw7
         iwzBqD5RtK2SfTDNLN4h6+lOEIHfbjTESoJx7XK+W+nqdVQyn3elwlH3BQfvTVgrJ/ps
         YNRirTDFAWb0c2t5aGeV7XH5/z6k4NbTE/4wdAPsSdicJdgppQc6YPtkbfXfZ+cyfRJo
         tjR0HyciqtO9Kk/T/12SjXRKuJemHfru121YNpjPvINL8rAGADaEvGx8IAGPpZ1vZf4u
         6sjs9aRTllqOLiLLPlClXcXCiobv4rJvdHNToHy3POhERZ0+fsn933o7mHWX5Ztcbg+7
         kZUw==
X-Gm-Message-State: AOJu0YzYsfVDKqFtBuI6KwrmHxqossbXl/BkfDAKDA4LSvuxiyO+Ch2q
	D/ApbtScvRveU0ekQGp1PZZNMaBhO27zXNxQO/Xp24UUrYZ46cie8u1tBcka7/FK0N89ECoRfXs
	ysu1XnM5XJaJqVTxV014Mrbz156a/u2NATpfwAteP5vBKIP8v+8amfTmIekhsg0rEtg==
X-Gm-Gg: AfdE7cmnu0fbT8PdaGHWBgPG6ah4jRhTg9PBZHK0jtlYJnCUl7ghtfy7HQOlMFoXKte
	0uX/GlkDresYka0fXor17hVFT7T2RWmX8FWPmArK3kh4pmw2620qoMhNGh7SK4Q9bKYLozMKLvG
	HZAogyONgqSaAc6ID9mI/qtgq2qo4ouqQwjt/UkQQWS93pB16ScSuFx4jrQ4xrGB7ZKDbRoYs6q
	DJPMvkiQ5WvKtEACtkbAbTYQJwpxuB6kiQwt2f7L6LNYF4XheRo32YDhszt3DEwEqRIdhHStZFe
	BfNr85E7d7XGp8p3F7UIVWLvQ8XotmJwaljAh01aShTfXxxWQjC1mVLhKsnFTHZH2WUZ3G2b5In
	aGPgMc2nzVXxEK2+HoT+O1aZVHIQv8QewrMaZKg==
X-Received: by 2002:a05:622a:588:b0:516:d83d:b28 with SMTP id d75a77b69052e-51caa08a385mr165942031cf.17.1784017997825;
        Tue, 14 Jul 2026 01:33:17 -0700 (PDT)
X-Received: by 2002:a05:622a:588:b0:516:d83d:b28 with SMTP id d75a77b69052e-51caa08a385mr165941831cf.17.1784017997425;
        Tue, 14 Jul 2026 01:33:17 -0700 (PDT)
Received: from [192.168.68.109] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-c15e6286a5csm736326066b.11.2026.07.14.01.33.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 01:33:16 -0700 (PDT)
Message-ID: <ac5e64b9-21e9-4a88-a14c-2aadc8eda73a@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 09:33:15 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/7] ASoC: dt-bindings: qcom,q6dsp-lpass-ports: add
 Audio IF clocks
To: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260712134110.3306763-1-prasad.kumpatla@oss.qualcomm.com>
 <20260712134110.3306763-4-prasad.kumpatla@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260712134110.3306763-4-prasad.kumpatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: QuaH_3RHN1z3vgv1n4GaV5h94O-yeb-q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA4OSBTYWx0ZWRfXyU9q5z/6KQJ0
 irwtgr0hNNxjKdWvII/mTm9jtHJno9hWqzHUs64fL8M9Al/M9JqIbaNMDae+TTZ/l7x63wSx5jg
 e+860SRNdswHF3aFDRXZXqLLaInjN1WKmAL/KNDIm9A85KP/pRCI2/CaUfFlJLVGVxu67xFuDrY
 Y1A4NYMm6pb9xEz7bYssgqfZS46UUzC9hwSeDezPElGR6rvLuTBcZ0SF1o4skSJO3TPSbxjbPtr
 7572PibRhW4+Q58x6yy3riCWZaxsmISLr5K3oouFge+YtEd57mF6AE/aMhOFWW3VZc2XGo8m0dp
 keItBgVfOL6LcpTyCS9sGlr6LGCbvta+F2+9SJOLQ5l3ulr+dSjAbX7z2okhyydonzPlFe/FXkp
 EXTWQdH+AWYVXdKXXTF70e0Y/5V8YWm7TayCzasjENp4sInn+vW/dZoMuruiUOXreQAk2g/D83W
 14eYmPRYcqZ50IvAJCQ==
X-Proofpoint-GUID: QuaH_3RHN1z3vgv1n4GaV5h94O-yeb-q
X-Authority-Analysis: v=2.4 cv=cN3QdFeN c=1 sm=1 tr=0 ts=6a55f44e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=S0i2IUftuXgoZizot94A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA4OSBTYWx0ZWRfXzQryoH/vF5tA
 Bz1/Jmm13Hborz4KPH0VSvqZ0IhrQtr74EL3C/V1H8wajS5gHP+Xb5Q+EnpAEyWdiZho5mWTgjb
 uR+MIfvatNaLiGRS1cQ6gUl4Xma0gYY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140089



On 7/12/26 2:41 PM, Prasad Kumpatla wrote:
> Add the LPASS Audio IF clock IDs used by newer backend interfaces.
> 
> Platforms using Audio IF module backends request the interface bit
> clocks through q6prm. Add the Audio IF IBIT and EBIT IDs to the binding
> header so these clocks can be referenced from device trees.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
> ---

lgtm,
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

--srini
>  .../sound/qcom,q6dsp-lpass-ports.h            | 29 +++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
> index 45850f2d4..a3aea029c 100644
> --- a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
> +++ b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
> @@ -233,6 +233,35 @@
>  /* Clock ID for RX CORE MCLK2 2X  MCLK */
>  #define LPASS_CLK_ID_RX_CORE_MCLK2_2X_MCLK	70
>  
> +#define LPASS_CLK_ID_INTF0_IBIT		71
> +#define LPASS_CLK_ID_INTF0_EBIT		72
> +#define LPASS_CLK_ID_INTF1_IBIT		73
> +#define LPASS_CLK_ID_INTF1_EBIT		74
> +#define LPASS_CLK_ID_INTF2_IBIT		75
> +#define LPASS_CLK_ID_INTF2_EBIT		76
> +#define LPASS_CLK_ID_INTF3_IBIT		77
> +#define LPASS_CLK_ID_INTF3_EBIT		78
> +#define LPASS_CLK_ID_INTF4_IBIT		79
> +#define LPASS_CLK_ID_INTF4_EBIT		80
> +#define LPASS_CLK_ID_INTF5_IBIT		81
> +#define LPASS_CLK_ID_INTF5_EBIT		82
> +#define LPASS_CLK_ID_INTF6_IBIT		83
> +#define LPASS_CLK_ID_INTF6_EBIT		84
> +#define LPASS_CLK_ID_INTF7_IBIT		85
> +#define LPASS_CLK_ID_INTF7_EBIT		86
> +#define LPASS_CLK_ID_INTF8_IBIT		87
> +#define LPASS_CLK_ID_INTF8_EBIT		88
> +#define LPASS_CLK_ID_INTF9_IBIT		89
> +#define LPASS_CLK_ID_INTF9_EBIT		90
> +#define LPASS_CLK_ID_INTF10_IBIT	91
> +#define LPASS_CLK_ID_INTF10_EBIT	92
> +#define LPASS_CLK_ID_INTF11_IBIT	93
> +#define LPASS_CLK_ID_INTF11_EBIT	94
> +#define LPASS_CLK_ID_INTF12_IBIT	95
> +#define LPASS_CLK_ID_INTF12_EBIT	96
> +#define LPASS_CLK_ID_VA_INTF0_IBIT	97
> +#define LPASS_CLK_ID_VA_INTF0_EBIT	98
> +
>  #define LPASS_HW_AVTIMER_VOTE		101
>  #define LPASS_HW_MACRO_VOTE		102
>  #define LPASS_HW_DCODEC_VOTE		103

