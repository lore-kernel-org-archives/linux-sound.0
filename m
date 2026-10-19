Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792445865;
	b=mnrQ/YWNZeiQ84BRYUWq1cX2a1k86KrSJUTWDutEDfkTT52RMEcL7n85Aa0Ehsa6CTNG
	 vEnlREL50ApjgaLqqbqj27br9J5ls8jcbvpJnzDZdtcp4X7p4CUilRoT0zfSwynoM6G0V
	 RjBoZ0zMeHIQM0Xrq70Tzk30h3xH/nVnwgq/f/p53uJ5kQkhG3Opbl9vhitt1T0DpIkXd
	 Eg64l/YTpLhjxCS7Bf9uCrQwUZKKHgP7nV2bpPmWjJIdsX5s6LgQUrEZrLyZUpkhUdedg
	 hKxSLTU2bGMq2+ahW18qwgs3dN1CyVUfU9vzcd72N72bx3EjRvA8LOICPxfVfNSsbwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792445865;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=YR7IFYT5RaUwifn6Orf77wIJhbjy7lkSMcEb8T4uCjY=;
	b=RTKvWtQrQ5JsEPKyMsvtZKbYSKSGsQO4xoMEABWH6LbCqCdo/A9wotJowo0bZxk60DwT
	 MUGJlCTwPBiXJJph3TQMruX3XgmB+EzX2YMQAMm3VUxEoj2jXfHet721RX0usXYKqVJDK
	 fI2Yor+EjoMoASzh/sygunKpCSoOhc5k8Mo9akM/dbuMnmxaWH7LYy+g4/05OZPG2q2BH
	 OXkVPixrwvK6lp5LU2PM1AIf4QAhToTf0xnCGTB5Pi8bJcbC8TkVz72o7veSKoDJk4lKY
	 mLjsujV22wDIiXwQTZqFnqkvF7xhJqlTGL8e2jggommJabdS9vkie+GOSkuR2xUJuFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="pJcK/qha";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="j5MrQ/qE";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A557606A31B
	for <linux-sound@vger.kernel.org>; Mon, 19 Oct 2026 21:37:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A557606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pJcK/qha;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j5MrQ/qE
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JLZRUd3070803
	for <linux-sound@vger.kernel.org>; Mon, 19 Oct 2026 21:37:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YR7IFYT5RaUwifn6Orf77wIJ
	hbjy7lkSMcEb8T4uCjY=; b=pJcK/qhaee0RFV176+sf3IOhC1NqK60aNyrNHoxC
	vzkKauCsVoayYvpo2I8yLrSGFSFMPLd8xF0HNKyCBKC+bjqjqEN0DXLY5kg9XJ69
	ZJ9NsVHSbPcwzDRHAR97KUZithqxr7blLJs0EOxMfyitMXdS13I6kHzBGSCfqp+0
	HEgtv9MAJTpNXCsH7BDLnCzFZT8QyeUE1b+Wk45qHzAiDtIzVAcy3iCSu1xHNbsr
	zzrec/i2nffdZmRon4JdBk45/jHh9yIk5FLueo0qoVgwkyw3pYGY4WDx5av+GujZ
	+Y2X6DKFjg0WORhymslJXv9m5LYIOxTAMjcO4RP0GkHafw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdr3p0skx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 19 Oct 2026 21:37:43 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f33438950so652172185a.1
        for <linux-sound@vger.kernel.org>; Mon, 19 Oct 2026 14:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792445863; x=1793050663; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YR7IFYT5RaUwifn6Orf77wIJhbjy7lkSMcEb8T4uCjY=;
        b=j5MrQ/qEij0K+79ExcdkQxLwYvojFKdtmSI5WOfWps1nhVQxnYZHrKKf8ngBkt9C0X
         jtTklS7vOAlI+bpKYj4dXhtiGHg5PQUW4yoolT64NsU59/ni6IBeHh29ougID5I7Bo6h
         KlcomfGBhszCYL6ZBGgvJo9fAcqni/GDUZ86HRLL9QAPLpg8IRhhYgMbalNdh/gD4xFN
         IINQgSr4mF+uAHKAuedXdGzRDjNCg5avOyiVJye0l2woeSttUnyiJGKyS9GDM5Jb/pK/
         7kA0oCHbQOYi5uw301JI9voAWQdZNs7WaSuDyMqqAINzUUyJIyYThWQuo5CMJPLxERUI
         Tc5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792445863; x=1793050663;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YR7IFYT5RaUwifn6Orf77wIJhbjy7lkSMcEb8T4uCjY=;
        b=ejUR58AVjnRLpXJPlBiLwPbXw+AMjPlXY/Xr4pK42e6OzewLMiJ/fXSuRRKSD28W2I
         Z0My0qyx4otfn7hmFzUK4Liv3uqyTxZBcGza9kRgcwni3+wQ4rudMRxY2i0vtsQMeiaQ
         Kji+K8mfJw0zDdGbSq1I8ZG9cLeKIi2E/zD2hY+kAhbVvJqV6DNhjntqCyZ7w/jFfguI
         D/90Aq1X12mUcgiR+FXd6at3kiraqOIL1Zsd1s1ILSMx3N5cmlI0pv1/r1I+HFJo1sGf
         6uQsDMmXuqPp2XXVTqQphiezPvx3/KnacQSxMDoOEvhfkZ3SjHnksDl0aycpwAi7Qo24
         /e6w==
X-Forwarded-Encrypted: i=1; AKwUvBynY9ICWuwVjwN7IPrZnyJhrfdvI5ywoSV3tpU71+mwST+UWHp5zufGl6wRfVLlRU0030xGucEY+NBgmg==@vger.kernel.org
X-Gm-Message-State: AFq9FYLRLnOE67DBi9GPJvZJvvJfgGqm8h7P22P+t1wfhCK26C/H9Pw0
	xw0c6PsUqdRgj2XAjtHtwljOkstc6IeSJKUAmWF7gAuIgaCA/lJOupsiTe45Q0/v4VKy7yPfOvQ
	+MppJmsRwLK3tnyVaPcGFwIPRyArsceQTRghtdbQJ+3NIGgtglzrN97BD2iX2BcXo4A==
X-Gm-Gg: AYBFou2y/yxgbM0knFMW256tc35NqlCCqRvg6ULs/GXidRmpuV2aBwaqRjfLL/WGs6L
	aYVo+M4vIj6eeG144uJF31GiHFDZ/hVokD8Rmt4Ojj5HOdai923kjjgIIdmpUsHzQQx7tKUSyte
	aga+NW7jfh4x/GSA//97TtUdsQ2TEXsAE/uvrCkyIixZFyEgvwKcP+PPCyY24IJ0Re6zoLqCLOA
	1XM15U5pMG7jBuGJLVUDqZpQ5Wo9Zyj3bs0MZ9LeovVDpUVz5jycTuzZocUt0NrYA9ivYMxHYQL
	DNirP1MoTwfmca5LVCqAVK8sfwtSi6m5kdneh2HZpjoICZMN413cvhqZP5tk+eHmSpmcvdzxyeh
	Z4QMX6eRX5CQHkqsA7w6m67pM9FdUcjEqLcHQYuHDzP377UV0v72syiZ+MgQQ/EJ5wxprs8h6ds
	GFcuNPnF9NXIAj
X-Received: by 2002:a05:620a:468f:b0:93f:242c:f4e3 with SMTP id af79cd13be357-93f29d2cea2mr1487454285a.32.1792445862622;
        Mon, 19 Oct 2026 14:37:42 -0700 (PDT)
X-Received: by 2002:a05:620a:468f:b0:93f:242c:f4e3 with SMTP id af79cd13be357-93f29d2cea2mr1487447385a.32.1792445861844;
        Mon, 19 Oct 2026 14:37:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be4a63cd1esm2232451e87.72.2026.10.19.14.37.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 14:37:39 -0700 (PDT)
Date: Tue, 20 Oct 2026 00:37:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Richard Acayan <mailingradian@gmail.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
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
Subject: Re: [PATCH v2 07/11] arm64: dts: qcom: sdm670: add adsp
Message-ID: <ya7xujl563xnvdwznmr64j24q6vao5rqdbjac7tx2azbzoezon@b7677fmbytj3>
References: <20261003175659.23536-1-mailingradian@gmail.com>
 <20261003175659.23536-8-mailingradian@gmail.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261003175659.23536-8-mailingradian@gmail.com>
X-Proofpoint-ORIG-GUID: _4am_omGG44aFWujKwz4HsRp7CtcUTAt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA4NiBTYWx0ZWRfXzYfwX1RQgRyU
 U+PAzqz9rSwl1PEQSa0kjeTyWytEbzuTWJVk4CDz1nbPo96TcwRpX74B4+tLvGrabtKTKKKSbMr
 FAFUOaCK1eiNYV8H66OoWrvZtEFGveAj9riMKmDvM9Fk96LYP3V9wC0W/+7R1xFWLezTpzbJ3Jo
 dMjn51slSTxagjm04b84wcP+KMBtxaSAcZqlZQTzB0q9v2LS3JHPGKJqzsgqecrRTPtj/oVg7iB
 BmxAnjcjPAFKI1xpQcLFUGkxOvf0M3zEbuV2a9KORjp0c7QvJ/r+bN54Z8/5Pz1wTjy2QV0k5sY
 l3UQELI0G98C42SejWYa/8bsWgPnYK/AtkRwRvx/LDPyJQwnkYb3+byU/bBRZfeN/B/6+TiObnp
 7U94XGo+TLN1xESqwx1ckO14s5lrQ+MO+5oOQLGyDWl6AkkXetUWqKW+2KxQ6bV49Ha/XwAhTrz
 Sm7uL3CGsWnx7E0OqQg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA4NiBTYWx0ZWRfX/TbkWIRPcKyi
 5hAGl+pc7KOm4tbMesQhS8NpEoAB8KRTP9mL+/2+SBfWcLvlETXC6eZmIrSPR8s4/CQ2iH8kKNI
 gPcuAx7Q5W1vsdBMuQCo+2vpogbFSQo=
X-Authority-Analysis: v=2.4 cv=HLxWhYtv c=1 sm=1 tr=0 ts=6ad68da7 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=pGLkceISAAAA:8
 a=7JjGCdC6NS0evCYxf5kA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: _4am_omGG44aFWujKwz4HsRp7CtcUTAt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_06,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190086

On Sat, Oct 03, 2026 at 01:56:55PM -0400, Richard Acayan wrote:
> The Audio DSP (Digital Signal Processor) is responsible for audio and
> sensors on SDM670. Add this, along with the SMP2P nodes used to
> communicate with it.
> 
> The sleep state is included to prevent the following crash:
> 
>     qcom_q6v5_pas remoteproc-adsp: fatal error received: err_qdi.c:450:EF:sensor_process:1:sar.cc:27:chre_utils fatal
> 
> Otherwise, it is unused.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/sdm670.dtsi | 168 +++++++++++++++++++++++++++
>  1 file changed, 168 insertions(+)
> 
> @@ -2301,6 +2349,126 @@ cpufreq_hw: cpufreq@17d43000 {
>  			#freq-domain-cells = <1>;
>  		};
>  
> +		adsp_pas: remoteproc@62400000 {
> +			compatible = "qcom,sdm670-adsp-pas";

Looking at your DT schema... Can we use "qcom,sdm845-adsp-pas" as a
fallback here? Then you can drop a driver part.

> +			reg = <0 0x62400000 0 0x4040>;

0x0 instead of plain 0, please.


-- 
With best wishes
Dmitry
