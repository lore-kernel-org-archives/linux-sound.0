Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C3703CB54D
	for <linux-sound@vger.kernel.org>; Fri, 16 Oct 2026 06:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792133287; cv=none; b=NhGShCXnaV3JCl4+TcjIrBykyOdup2DLjTz06DGV7HL9WcGsN3TqrtwymtOUzFT3kRVUqZpOBE+FJJrJEzd9AEtJWJN/hxiVyUToEuvftKV3Cg1VnZ9/vzDfVTkbjDz64BeBKQkjBkV8w8LTvC8tp+9OhBbvcPBVJTc0oSQzeww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792133287; c=relaxed/simple;
	bh=ArpyCUcdXnNRQly4XkQ4s9u69ZZAMn3+U1oycCt3GcU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HLPkojtpBSDWk5RSmmIICnc8mls+O7OmDOHqc58fnBvg9B8qPXVC9+AkKtz1AT/U68TWRJgf0CvUCMh9a2zeoXJuxkUyk5ZDtnPlo28NgBeDrwmcszzeyLPHwCZhwxFYjtz3/buuofETjiQuNrzt4QPSJFM58/H+VnKsep2mN08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aMaUenMM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W3lXHios; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aMaUenMM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W3lXHios"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FNg0Dj1635320
	for <linux-sound@vger.kernel.org>; Fri, 16 Oct 2026 06:47:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Pz0Akbts6DsXYURHmG6DvfbIIYwLAa3UJO6NTzI6f+0=; b=aMaUenMM0yE9Z8GD
	VSilD5dwzySdYN3/WbxhBBK0m8yHCTstbeuzdIElOU7fuLHS63bM4BIXsZrnY7+3
	aohuNchyVOgWW4shZu2qa6BXe6LV0kSem9A5Lc9yswyBmeJ6nOxDa9Shsne6D/JN
	X+iGQNoqKzSTIxGf7xVeI5GoAvSdiGnDlj01PNm3AiNa7P4ajFY2EyQ44xkUOguy
	7rbOL5B1z6aYL0Vd72qrMbwJdlKAyfKxnf7EPLRhkp20fXXEG51g2mEiqQARLbyv
	NYBtWhWZhg6S4388hHAhUeCZlzu/YTHkf/pAI0lMJyv03Uaq4/GHZY/JNToq2zep
	f/lOlg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb8r1199w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 16 Oct 2026 06:47:58 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ab341816f6so6070131a91.1
        for <linux-sound@vger.kernel.org>; Thu, 15 Oct 2026 23:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792133278; x=1792738078; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pz0Akbts6DsXYURHmG6DvfbIIYwLAa3UJO6NTzI6f+0=;
        b=W3lXHiosbgUJh9nEiqBuCdR9tz5iX4WNdv/lQBp/zhytqZeADlTOHFqNZDbYq18Wza
         j+OLoVAITyRzBGUI3Udriv0C2n8SIgzRmdApCc6gC9a3tzgY84YUP7yc9ddSfWfEJRLL
         dnW0TH+nTsUX+HZ05e7+Ze5vRvkqRnXgvWuEuVXljjZ7388uC8I9cu1h7UUrFk438Sgo
         kpNRieHXycEtUclmjbYpnVTmy3aOy5pB3YBrbTyDYD03YEWDJ+fi0aZVpJs4Ov4f6Kfn
         uL1oeOo0kcmG/lNQJIkCuYbIUx3kPmiCu/vaXlIPwYuqCyxlvPEkPZW7RnKjRcz+aY3Y
         UD9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792133278; x=1792738078;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pz0Akbts6DsXYURHmG6DvfbIIYwLAa3UJO6NTzI6f+0=;
        b=QvU7qUSqCKzHgEN9RQvP/YJWexd46K7a5UZQRVwafoG6tSu1REJeDqsIO62TCXnMPA
         xHH4G+Ofb8Fe2PXrRiAqFhgYEbLyYLGC8YWWL5zL6ij7IdLv9AQv2TgA4aHXUP4JPloe
         2x5LnAHF9aJP7OqDWX387rwKcoKxOeVSRSFhqB0oTDXtdvtk82TwMJexinZOTTTKjK45
         AyBl4bc75CfnPq8sUQ4LKvUBL3/PP2nqpTRJu4u3KlpiuKmGaXuNi2OiQUdBPdwun1s2
         WSYJiNinBJK5zA5KZEpSI9LAPMqDro+JaTUa5TRkcon9/0EvvQuN8aSC8QR7lVHT/0f/
         5VvA==
X-Forwarded-Encrypted: i=1; AKwUvBzX8GNj28bDhmgTiYT1u4PxS6YVeGC8gqi401mrtp/qvnsHvNb+imXPLZVcc7SMtmJxpma6U2dsjFbddQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYIJanMVWHSQ/tXRb2Fou/TgkxJe2xpmn+J5fY6pU2trKBAxl0VL
	n1Mhj5VQwLSgxctvL+35LOjeWOGCEbcQvqiBMI1VcQEwQZ5n70RI7dGh/LNrKxEBJYqjAxGIlEn
	uSsddhsddFOPLP/1X6iTYc+N35OaoU3Mg0pmzdSxHjCurJunSShr35ru1i45N1dDsIQ==
X-Gm-Gg: AYBFou2Oq813mRYCU1fMzwlW1cL7sumQzJs97xYdmf8x6QKgUA+VXzpt6JWV3pIfCN0
	61XIRA34mzryfPXeOm+99EX+7/iQ9LhvQD4c2o0xqZ7FJqvgjQSfaObCjXvPatHiDKgyYj/gkbG
	sfLr1srGJBoFBYxqdaveWtWe13PhCWCbNMTnCdz0PToRQXKpHlbEXhwBNt7saNqIPK9ozynyU7a
	JXIQ9eFYFYW95y0+Nk6VNs9g/1qWcP6jdGlh/MIP1CEmgxg/+d4ZgvS7nKmPgfjz8OIP71+LbLR
	JZf1T329AIh6NcAI5l+2xh+4PEdgqF2CtdyFqQQQauZc/mU+NTfJxi+BhPjgyP24fk7tiZx20Hg
	fvUizN87/LFfelLwRpdrMlbNNU7w=
X-Received: by 2002:a17:90b:4d0f:b0:3ac:97e3:73a3 with SMTP id 98e67ed59e1d1-3ac97e3ca4bmr4148850a91.6.1792133278237;
        Thu, 15 Oct 2026 23:47:58 -0700 (PDT)
X-Received: by 2002:a17:90b:4d0f:b0:3ac:97e3:73a3 with SMTP id 98e67ed59e1d1-3ac97e3ca4bmr4148830a91.6.1792133277770;
        Thu, 15 Oct 2026 23:47:57 -0700 (PDT)
Received: from [10.218.18.193] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc487e509sm2669257a91.9.2026.10.15.23.47.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 23:47:57 -0700 (PDT)
Message-ID: <b907dea8-d2eb-4237-b316-6d96c81a5b33@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 12:17:50 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/4] ASoC: dt-bindings: qcom,pm4125-codec: Add the MBHC
 jack properties
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ajay.nandam@oss.qualcomm.com, ajay.nandam@oss.qualcomm.com
References: <20261015-pm4125_mbhc_support-v1-0-8bc1212db6f7@oss.qualcomm.com>
 <20261015-pm4125_mbhc_support-v1-1-8bc1212db6f7@oss.qualcomm.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20261015-pm4125_mbhc_support-v1-1-8bc1212db6f7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: kMZ3vAOM5prOwzwIK8-KEcT-_u_vriMz
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAyNiBTYWx0ZWRfXy33Ng2+v4uPJ
 U5TgWZJV00uYJ+FeJI7mOTzw3dxZ1ZUFSud5aDuVUYyRU2kG+XeGIxpIFb9cQldB/SBlNIhq+XS
 EA5Ho3eqRkmTR9MSAhzh1D+zUJ3VI0Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAyNiBTYWx0ZWRfX1IcWv9yf7v12
 xHrOdVPyyQqXYCHzd+E+L7dr6Ma0uQRYGoL7JDUifyRmatOgDDE88SMO1BKB+TSW2iv6vwPuh+N
 BEYgib0SLuWRv41NpShDFUhNIG9vFqKMVrkVGRp6OEdKdB3fyghYkGvJln33GUeyHmSB0k/Si+L
 WRQ3jXYFOyYrhyCHx5kP880+gbz4nK+hofZZvydq5SE0R7088ndqPbK6QEroMXWlVsNpZiE6xL8
 7r6froYSP4bLO3vKhm/IlxN4D5nSf/bIKPALlDwRdVYWDK2zYFHQrv8yDI2yr2r3A8DSKpXt/Be
 rl+9Mkgsbubs2Td7fLVZw1Z6JhuHg3EsJRtq0PWAm9mf+rEcCHB7QqMNB+dJOJObEB0liFFwf7/
 UDtJFkgehbSM6wceVBDzp3PWNalr9MEGJ8yWDDiCvRUKiLT99Bq0fB0IvaPk2C9EiVXJ23FTl2S
 XgP512Q/oFI+tMh+GoQ==
X-Proofpoint-GUID: kMZ3vAOM5prOwzwIK8-KEcT-_u_vriMz
X-Authority-Analysis: v=2.4 cv=L/CI0OT8 c=1 sm=1 tr=0 ts=6ad1c89f cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=xz_OTyItpRnlL1KGmssA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160026



On 10/15/2026 7:43 PM, Mohammad Rafi Shaik wrote:
> The binding already describes qcom,mbhc-buttons-vthreshold-microvolt,
> but not the rest of the data the MBHC block needs to detect a 3.5mm
> jack, even though wcd_dt_parse_mbhc_data() reads all of it from the
> codec node and the schema has unevaluatedProperties set to false. A
> board that describes its jack is therefore rejected by the schema.
> 
> Document the remaining four properties, matching the descriptions used
> for the same properties in qcom,wcd93xx-common.yaml:
> 
>   - qcom,hphl-jack-type-normally-closed and
>     qcom,ground-jack-type-normally-closed describe the board's jack
>     switches. The MBHC logic has to know the idle state of the HPHL and
>     ground switches to tell an insertion from a removal.
>   - qcom,mbhc-headset-vthreshold-microvolt and
>     qcom,mbhc-headphone-vthreshold-microvolt are the ADC thresholds that
>     separate a headset from a headphone and a headphone from a floating
>     jack. They are board specific because they depend on the jack
>     wiring and on the microphone bias voltage they are measured against.
> 
> All four stay optional, as they are for the wcd93xx codecs: the driver
> derives the thresholds from the microphone bias voltage when they are
> absent and assumes normally open switches, so existing device trees
> keep working unchanged.
> 
> Assisted-by: Claude Opus 5
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---
>   .../devicetree/bindings/sound/qcom,pm4125-codec.yaml   | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,pm4125-codec.yaml b/Documentation/devicetree/bindings/sound/qcom,pm4125-codec.yaml
> index 6e2f103be..54e5b7607 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,pm4125-codec.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,pm4125-codec.yaml
> @@ -64,6 +64,24 @@ properties:
>       minimum: 1800000
>       maximum: 2850000
>   
> +  qcom,hphl-jack-type-normally-closed:
> +    description: Indicates that HPHL jack switch type is normally closed
> +    type: boolean
> +
> +  qcom,ground-jack-type-normally-closed:
> +    description: Indicates that Headset Ground switch type is normally closed
> +    type: boolean
> +
> +  qcom,mbhc-headset-vthreshold-microvolt:
> +    description: Voltage threshold value for headset detection
> +    minimum: 0
> +    maximum: 2850000
> +
> +  qcom,mbhc-headphone-vthreshold-microvolt:
> +    description: Voltage threshold value for headphone detection
> +    minimum: 0
> +    maximum: 2850000
> +
>     qcom,mbhc-buttons-vthreshold-microvolt:
>       description:
>         Array of 8 Voltage threshold values corresponding to headset

The binding documents 8 button thresholds, but looking at the PM4125
register definitions I only see threshold registers for BTN0 through 
BTN4. The following registers are MICB2_RAMP, MBHC_CTL_1 and MBHC_CTL_2.

Am I missing how thresholds for buttons 5-7 are programmed here, or 
should PM4125 only expose 5 button thresholds?

Thanks & Regards
Ajay kumar Nandam

> 

