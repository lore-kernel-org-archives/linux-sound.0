Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20CFB46D09F
	for <linux-sound@vger.kernel.org>; Fri, 16 Oct 2026 10:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792145096; cv=none; b=dQIIX/j9RSwYYbMbtRs45FUi5bkXAPbEyMv4CYHfkwDKZNgIqVVQvklFqdnpvsujZXqqd3LLlbxwk3mA22sPlYYBNPtM1+g+gYnGr3oYdGPQ2UEztAVp3MLlEGsRg73j23eZiYS60aFHNmti2Gs6yut8AZ9yUSksIlTuBzNzuso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792145096; c=relaxed/simple;
	bh=6nMflZvMJMgWGGh3gas6TvYF4zUj/8fC3ydtDn2h0lY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=nOba+mPIujyT82AitI5fFNrkRnG1xUhU/ESH+DTSLH+/vE3oAdFdcoD67gNp8e/odtvLyPt/Jx6YGzCfwL59BpxaFeZxHw0k8t5M9L2Du8tSLPJX37L2UnFb15+EpTbaRwyx4zDXNuQNhY9+3Qz/URbmpgeYB659REf/1hOCCdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bk1zrW6f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fJayVWHk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bk1zrW6f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fJayVWHk"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G8lI9I1797671
	for <linux-sound@vger.kernel.org>; Fri, 16 Oct 2026 10:04:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lEyGzHWseU0y8G/3h8PBhHtLrahS4TkoKfI5G8pJg7Q=; b=Bk1zrW6fVMQbP9Hu
	+z+7SE7pM5YhieDZ7/xe6aCpAiCt2F+N1iNs0jy6EspynZMRGjr7tmHzZ+JoaRmo
	z+gqkuMjX/SlFguftuhuRYOiS781nXWVB2U+R5wZ69UkzkWEuHO7FY3X1ER6wCKT
	LypqEgEPlV5wi6pWYzluvCCIvOU6NsxlYZE8qNghvqiWyOX5dIofhiIGh9RaWgtf
	15iinKFbh/IGjHBKU5iy+bg8Y0/isrnAohtllIiQriEkWr+tB+GGGqYgskfmXU8A
	pzrc/d9DwZ2uDy93MvjZRiVtPBzT3lyvNd62Hct1juu8vnpJP0Y/sgjdv1C09a4U
	gpuKXg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb8a8a393-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 16 Oct 2026 10:04:51 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5338a4075d3so19775541cf.1
        for <linux-sound@vger.kernel.org>; Fri, 16 Oct 2026 03:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792145091; x=1792749891; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lEyGzHWseU0y8G/3h8PBhHtLrahS4TkoKfI5G8pJg7Q=;
        b=fJayVWHkr2xRlkZrqSm3ft5nL6pfPtj169b3TFLHXzoOP8Gpql/JxoqycDRD0fnwcl
         Bq2+DBptTv4/em916KaG70f1GFw7NDFV3oSSPvPjWs2/6JphFQeGmXzlUJEqsOozc+Os
         /+znLig0qdtfki7HlwTyUMknIWY6MCOM/HF9IPqkKWP+EhHtUSRMVNfhOD+N0yirCpp9
         4j2fcLe9lBlhvj5NUt6+xzY92N8QEKsX3siUT9/R0/+cU3+BEaB68ntO7JJORu5loyLc
         VEKi8tRNsnlHaxngL9HvAYDaW3R+MdaoZRKUudi/H/i3/VGwiEFZCWS6B+8Kew9nlLeF
         Lr8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792145091; x=1792749891;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lEyGzHWseU0y8G/3h8PBhHtLrahS4TkoKfI5G8pJg7Q=;
        b=mWbOo7wc9UM2Xkzp9b90U2fESIndX2bvPZTfJon+vJ6edLqZifdfSYdmwoWDGKHjjr
         YwHFQ5kImLE07kvVYa2Jrk3ZaKpgz6fTciqBF+oc/9219gGp8/q3gcwqFWstGiXfN9hO
         XnwbtCD6P6xT6mzjt64H+samhD4eLl8MrPZ8xwtosNd6JOhit2oPDX+EW7gMVR8064MV
         EjxLj19inkF//vSjKC1Z2HnM4Pfa+uZkGOvDZwbZJf2zUJ5oIuORI/6Bfa+CB5TPnuMw
         mYhBsX0Fj3CuX0ixqAOOnevpi2xEbrEXVacB4AqPSrT/EvO+F8/wY7NVVmKtysizhASa
         jZRQ==
X-Forwarded-Encrypted: i=1; AKwUvBwCVVgR2MgKLKeTuZukqcB4B1Sa1EQI4Fr6jVm5GvUGWrY54CkD+WiD7IlocTqQOnq8O5X8uGiYjwq+zQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJ/lW4Jrg34sAtRFYEtg0ZP9sRttfmKlHBNA6XiQZaKRnPeVMAL
	gxivsqg0iV8k8yk3LYyR9ViuodKrGOtMZkxx+PDtBeo6zMbc7U7PsdmcakYjPP8rcOEHribwMGh
	mRe4xkcwyh33qsUHGGQ192ks95lmEouUytXUgmSTUzM3rZecodvu2kuChebDOCpfTcA==
X-Gm-Gg: AYBFou2IAkldhVf/EPZyyMIbF2m/FjMly64070cvcmJAemLzN9PTSrK6QqSshAq1Ymp
	tvwI2eyhRE0OXJQZlDSIrPQ3ll7StvmKJt8umnJDXboJeMUjAkeu8L6j8OColoQtxAkJVlNks8E
	NcB0Q9qm+z5Wmy1Q1iKP4VnZHZ9dqnk8pWGrtztxRKgtMs7uwZCmuu0xE7GrzuwXcBl9e7Wv0EU
	TVDP9em662LwGDBPdgm3HQBEa1cW70nHgg3W7TBd0jCbkFA40T/yUoFh7MDvVpKnZ1tNBydjnRk
	6l+Yl/IjVniWgT2BDVcnQuXcwXb1gLt6Qg07loUHbXOjcGhHHnpuqT51VQne8S43Ni0LxPLffTi
	rqZBH36DWsaKgDU/QyT6Guw==
X-Received: by 2002:a05:620a:ac16:b0:93f:1a1a:2974 with SMTP id af79cd13be357-93f1a1a2a48mr254587385a.6.1792145090863;
        Fri, 16 Oct 2026 03:04:50 -0700 (PDT)
X-Received: by 2002:a05:620a:ac16:b0:93f:1a1a:2974 with SMTP id af79cd13be357-93f1a1a2a48mr254581485a.6.1792145090280;
        Fri, 16 Oct 2026 03:04:50 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1334e0sm719078a12.5.2026.10.16.03.04.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 03:04:49 -0700 (PDT)
Message-ID: <204766c1-cb83-4636-b779-fa01bbd17764@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 12:04:45 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/11] arm64: dts: qcom: pm660l: add analog audio codec
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
 <20261003175659.23536-10-mailingradian@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261003175659.23536-10-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA0MCBTYWx0ZWRfX7eRDBaiYfO+N
 8LM9wR8il9QXR5zCnDzh59vojcJmwFHel6fgjKWzEm9npNdPsMCSABAtLLqhf0pAkaY0Xg2lTcI
 sEfjK1iIJVQ6D7jQ14HbaJ7UPLJENwA=
X-Proofpoint-ORIG-GUID: mRR-MPEWjq6L8-n93XA6_W3EJQKprA5K
X-Authority-Analysis: v=2.4 cv=GJadgeNK c=1 sm=1 tr=0 ts=6ad1f6c3 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=pGLkceISAAAA:8 a=J1RzbaDzFta3Bh0DJUsA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA0MCBTYWx0ZWRfXzPkqx+01RTr2
 Dsd6z5Aw7cI1qFTfzRof8heE5mXrXx+0wWKLsMDCpLe8YLNrcER71EghIzpoG0phDG0XJk33frT
 Or8aTc4GdXV8fFMo3FGr8FdCWJv8Us0/AEdZTwVxGfoWtknjTPCw31I3lPUDEML51+n7covZI0b
 QtWKjPigL75Asv7SAj9cuAL4ctKhbZXmOB/KbmAJxSzi466BX0EsujDW4PqGyRGCYsuLt9girpr
 ePGXnogfI1m0QxKTVu8U2MHODD6L46L9FP75blDA59HWhI0mGi3QbkEfnF2TWOrg+/WncBqfYiI
 BB/TRh2MVSc6+/jGgLfBoA9e41HNwLz5titV3mGX4DWHPkWb8yjF3g4KN86XI8fgPsdWdmZjH3T
 WP1SFx+VqbHyLQAumElHPY+oUdn35VVV3FzkHsHGxmV1ABOyKNax6zyIxzwhagAqh1G5Bm8CQNS
 kKHTq4tZAhZ+pAmKMZg==
X-Proofpoint-GUID: mRR-MPEWjq6L8-n93XA6_W3EJQKprA5K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160040

On 10/3/26 7:56 PM, Richard Acayan wrote:
> The PM660L analog audio codec (PMIC revision 4) controls the headphone
> jack, and optionally the earpiece and speaker, at the vendor's decision.
> Add the analog audio codec.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/pm660l.dtsi | 40 ++++++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pm660l.dtsi b/arch/arm64/boot/dts/qcom/pm660l.dtsi
> index 3f8b9eafe164..5b406b83043c 100644
> --- a/arch/arm64/boot/dts/qcom/pm660l.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pm660l.dtsi
> @@ -87,6 +87,46 @@ pm660l_wled: leds@d800 {
>  			status = "disabled";
>  		};
>  
> +		pm660l_codec: audio-codec@f000 {
> +			compatible = "qcom,pm660l-wcd-analog-codec",
> +				     "qcom,pm8953-wcd-analog-codec";
> +			reg = <0xf000>;
> +			interrupts = <0x3 0xf0 0x0 IRQ_TYPE_NONE>,
> +				     <0x3 0xf0 0x1 IRQ_TYPE_NONE>,

I think all of them should be EDGE_BOTH

[...]

> +			qcom,hphl-jack-type-normally-open;
> +			qcom,gnd-jack-type-normally-open;
> +			qcom,micbias2-ext-cap;

And this is probably board-specific

Konrad
