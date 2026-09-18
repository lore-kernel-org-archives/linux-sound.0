Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5A7037FF68
	for <linux-sound@vger.kernel.org>; Fri, 18 Sep 2026 13:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789739043; cv=none; b=ch02bYudrZHbY07n8jwgnrX4vdeuAnNyZEagDT/N+rswxL8olQA5RFQGO8xhcpkyR0bcWIcNLhPIvu1QX3b6zjNAWRqI3/eyP9WdpVgLnzL4cB2dIFViE/teXUxIYNCPzhclFg1DB2h0pY/lMNqGRF5l5HfZ3gxFHx0kdH09C0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789739043; c=relaxed/simple;
	bh=C6rDwUvjmjOqpt4wZEMxf6encxALlNrtz7gB4Dm+IQw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oJeDvAFIBm6ZV2/yQqQ/5Q6uZG9rcaTOgCHCb8lNZrxU5FD/KCAE0nBfumGkNrAAYiNJzOPJ2/UBdJXp1WR2YBobqzoz1hbk4MyIFzouGylvR3Zr22jbjlhnM+p9OIMbhy53qyEf7Rd8tCYG4hhb2bDe9f0+fv/R9xeHZUkiZjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H+ZaDLda; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VS/iRASm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H+ZaDLda";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VS/iRASm"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68IDObqO745872
	for <linux-sound@vger.kernel.org>; Fri, 18 Sep 2026 13:43:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R40LNzW/2/QtfddysHfgigjJCHidHFz25WJIuDBATmo=; b=H+ZaDLdayhTXvZUW
	MbSqPzkTlUSGS5ywuvjjmtIyDAYrOhehSGdtDSVY7EYK1JKK7QlLB4wZGw4ssoii
	OLLnKp5RaZqyVt+2qyVDJTyXTY+sSY7T2cG5vVQOiaxMdfP6NZpWHkcR1YTKgDJa
	VzSYh5sj4fG9O2Xzv1CwGHZ/PQULh6sHcBGckNEj4Tu+OK+nfhxE/hRIGD6jLCeG
	h5RNQeAhqXMphzwKdCsZk/Rh1MOU49n7l+a1LWGwnbQC+Qq9gXfJ9yuLckTX1+H0
	7QI7bOKgP/xR47cNPzWZD9Jmd47owVyqAI7+naRxM197qTphehlmh95zk6pPlw1r
	qYqi1g==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gs23914r0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 18 Sep 2026 13:43:59 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc1a439db36so696852a12.2
        for <linux-sound@vger.kernel.org>; Fri, 18 Sep 2026 06:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789739038; x=1790343838; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R40LNzW/2/QtfddysHfgigjJCHidHFz25WJIuDBATmo=;
        b=VS/iRASmulVKUmoJ5qn1KubNS2IhcTDWxo/NTHd6vp/ZkpA89HVvxWgTCYmJnIt0q7
         q04cR5iE8Bpd5RygMT614jjxSERfvMwjU4FJ6LBwbJpXike9RG0QPwNTosZG6kCVhg8g
         g+MHVxdTR5fXmvn3oRhod4C9IVD+2oPlOAXTo5HIzvq5E05UYBI1FJ6yMOPrjKHjNsJj
         MklD6THbOwRbZ33ye1IDAqPh6N9wAzOG35BDnj+P9xn9VeQ7yJ5HGryIyz8dgl0AJWBQ
         0KhXy8VmS0LO2RLJ3Uw7i0EJIA1ReMaG2wck3ag25sbgY7aOpHJlt/Y+Y/3So+GVXaWz
         rJNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789739038; x=1790343838;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R40LNzW/2/QtfddysHfgigjJCHidHFz25WJIuDBATmo=;
        b=BIACaIt3zSMt2jaFOy4Yb0smN2XpA9X/ttKyaS1GeQmBlYaZlc0g/L9Ol/bU7OKlbC
         VNtjh5rfkEsAZvhvsTjCjyvzjCcJYZRDvaqArv6vMxBtc5G5A4SsiM0Khdbbc1SUmI/9
         u0q1oCLTXf9lFiDPag79aF3nlHHx/tz+CSXLmehKqiqH8AwFrX6+34nL/ChBBCqQi5j9
         xlieUs4Ni5Qt8/aLaGn/iTITIS5MFzvx+kBdv3APzrILPTTZy4b2JNIPNHcQ9WMB1loW
         ryCndjqOegupLxyI7A6Ypi+svg0P9vR3xFafZicKvASbSlmUkSDAqpQZK6KYgoVa7QlM
         mABw==
X-Forwarded-Encrypted: i=1; AKwUvBxuCvLbJLF2MfUTywUCVyR4TkA1CaRcjZnrD6cc6Z6qhqsf7+hSBVY+Vb9qnFt46/9Hk4v5w1UXUrPJ0A==@vger.kernel.org
X-Gm-Message-State: AFuF++n4M2LVq80RShPuQJr9yS6xKkB2wfD3enp38zE7QnbaVEsrzBQ4
	shKQdEbbx8ontUBGrfsclh6zVqXsfapjvIxa/7Vt5+FVyvAv08X4XGnB4gpw40FiPRdcRdJRv1c
	ixlsSw01t6x/CHAWAmI8C0fQ3Jn7bElucK2ng9U83QcgkyTblVlQQ8Ryfnnnkbq9JDg==
X-Gm-Gg: AYBFou1OE+6vmT49R4OuM/ucaJC4m1bKRRwpF4fMn/ZZgjgbeLAN9BLbmTOr6kWABDV
	oeZwLu0lxSs1044mRSUHrqYqerR1+IQSZSIfze3FYduwUZgP/7Rx1JH/KAgb6iBKXqTo4hj6SzU
	fb/iodkE1u/6Ij5tR7kdidYVBoLWupYfSGSKtMyPcd1v1MzL8z6Vlzjt2WDU/j+xxUckaDPXy7Q
	NN3ypOI5cxFzB1MbZ2BN1jB94mMyHZGmrlymkxMpB34aPGrjdcJHanOFYAPLjtmk/09E9AJx8Cr
	9hY5WZtx033OUyGaMJCfnJF8aktCExz/YTpX15AHW1IfKXtGuecjPjFVaS2cY9wDUCGZEouwcKh
	yMwwx5nElqCA0sEMOnC/PwrU7usioNWDHip1fIQ==
X-Received: by 2002:a05:6300:2204:b0:3dd:85aa:d268 with SMTP id adf61e73a8af0-3dd8c57c3camr6733550637.32.1789739038318;
        Fri, 18 Sep 2026 06:43:58 -0700 (PDT)
X-Received: by 2002:a05:6300:2204:b0:3dd:85aa:d268 with SMTP id adf61e73a8af0-3dd8c57c3camr6733501637.32.1789739037909;
        Fri, 18 Sep 2026 06:43:57 -0700 (PDT)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc5c4eae6fbsm1010698a12.6.2026.09.18.06.43.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 06:43:57 -0700 (PDT)
Message-ID: <ba6bcf41-779f-4ad2-96f8-6fcb97ed7253@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 19:13:50 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 01/10] ASoC: dt-bindings: qcom,shikra-qaif-cpu: Add
 binding
To: Harendra Gautam <harendra.gautam@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>
References: <20260911-b4-qaif-shikra-audio-v6-0-e9addb358201@oss.qualcomm.com>
 <20260911-b4-qaif-shikra-audio-v6-1-e9addb358201@oss.qualcomm.com>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <20260911-b4-qaif-shikra-audio-v6-1-e9addb358201@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE5NCBTYWx0ZWRfX9XarEhheFUIZ
 CFrJdevHWL8d2Ls+1Jmc5cjuT32Z4g+12WfMd36WULX2ISZRLdKN2JZT18r59y6t7TsXQCPJ+ag
 4IdVV1c/3+xfKbJm8TSXoCDScq3BuBQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE5NCBTYWx0ZWRfX8oR2PnIqMTiq
 gNzaGYoTQkNpU3wz2/i2TghVta6KTYOFuovP4mosfKuMb5uGfVv1uURxrAJnRNFd3lE0NrJCiDu
 RpkdT0J4ebynHnrWXoAZtAhTIm/ICju/q4SQgsJTMzRzw63wyGnXrLp+3ot5ElWK+nnOCoXhPxr
 8aTXy5bu1GiXaaifrHveSrzWogtbRiQtC9O6j91bdjD07guPk1FXoJsp6XNiIecTbZmetNvxT2y
 Lfzph7FudtGiGhD9TtMcLZTGo+ntsG0v2lzcg4+UoKYzbSmcC8A3nUn30t1Zjs98abNBu4XmlU2
 lZtafmwVU6xsgxGhr7zQBPGkhFBfyPBC2mbZoyRlDdN+D7W87LO69IGUjo0tlACliq8d/MoUWit
 f2wHVBeMpRS4vydOC0FJ0rpaTmAvnXPrRGD43BRwrTkgsxQsvLz/qaOJehABC7gaW2JtHcBUKkq
 0Sbye4CG0/cWxrsCnGw==
X-Proofpoint-ORIG-GUID: A8hvm0kQcgxL9knsO0uobHiLh4s05kA1
X-Authority-Analysis: v=2.4 cv=I7zw19gg c=1 sm=1 tr=0 ts=6aad401f cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=cBTdkrXCvdqGFug1r-QA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: A8hvm0kQcgxL9knsO0uobHiLh4s05kA1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180194



On 9/11/2026 2:47 PM, Harendra Gautam wrote:
> Add the Devicetree binding for the Qualcomm Audio Interface (QAIF) CPU DAI
> controller used on the Shikra audio platform, together with a dt-bindings
> header for QAIF DAI and AIF interface IDs.
> index 3a99703dbc4a..f08c20c84c60 100644
> --- a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
> +++ b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h

Please drop this DAI ID change from this series.

I have posted a separate series for these DAI ID additions since they 
are required by other Qualcomm platforms as well.

https://lore.kernel.org/all/20260918-qaif_dai_id_support-v1-0-ed863c0e5e45@oss.qualcomm.com/

Keeping them separate avoids blocking those board enablements and allows 
this series to remain focused on the Shikra-specific changes.

Best Regards,
Rafi.

> @@ -156,6 +156,58 @@
>   #define LPI_MI2S_TX_5		150
>   #define LPI_MI2S_RX_6		151
>   #define LPI_MI2S_TX_6		152
> +#define AIF_MI2S_RX_0		153
> +#define AIF_MI2S_RX_1		154
> +#define AIF_MI2S_RX_2		155
> +#define AIF_MI2S_RX_3		156
> +#define AIF_MI2S_RX_4		157
> +#define AIF_MI2S_RX_5		158
> +#define AIF_MI2S_RX_6		159
> +#define AIF_MI2S_RX_7		160
> +#define AIF_MI2S_RX_8		161
> +#define AIF_MI2S_RX_9		162
> +#define AIF_MI2S_RX_10		163
> +#define AIF_MI2S_RX_11		164
> +#define AIF_MI2S_RX_12		165
> +#define AIF_MI2S_TX_0		166
> +#define AIF_MI2S_TX_1		167
> +#define AIF_MI2S_TX_2		168
> +#define AIF_MI2S_TX_3		169
> +#define AIF_MI2S_TX_4		170
> +#define AIF_MI2S_TX_5		171
> +#define AIF_MI2S_TX_6		172
> +#define AIF_MI2S_TX_7		173
> +#define AIF_MI2S_TX_8		174
> +#define AIF_MI2S_TX_9		175
> +#define AIF_MI2S_TX_10		176
> +#define AIF_MI2S_TX_11		177
> +#define AIF_MI2S_TX_12		178
> +#define AIF_TDM_RX_0		179
> +#define AIF_TDM_RX_1		180
> +#define AIF_TDM_RX_2		181
> +#define AIF_TDM_RX_3		182
> +#define AIF_TDM_RX_4		183
> +#define AIF_TDM_RX_5		184
> +#define AIF_TDM_RX_6		185
> +#define AIF_TDM_RX_7		186
> +#define AIF_TDM_RX_8		187
> +#define AIF_TDM_RX_9		188
> +#define AIF_TDM_RX_10		189
> +#define AIF_TDM_RX_11		190
> +#define AIF_TDM_RX_12		191
> +#define AIF_TDM_TX_0		192
> +#define AIF_TDM_TX_1		193
> +#define AIF_TDM_TX_2		194
> +#define AIF_TDM_TX_3		195
> +#define AIF_TDM_TX_4		196
> +#define AIF_TDM_TX_5		197
> +#define AIF_TDM_TX_6		198
> +#define AIF_TDM_TX_7		199
> +#define AIF_TDM_TX_8		200
> +#define AIF_TDM_TX_9		201
> +#define AIF_TDM_TX_10		202
> +#define AIF_TDM_TX_11		203
> +#define AIF_TDM_TX_12		204
>   
>   #define LPASS_CLK_ID_PRI_MI2S_IBIT	1
>   #define LPASS_CLK_ID_PRI_MI2S_EBIT	2
> 

