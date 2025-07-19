Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32D9B235079
	for <linux-sound@vger.kernel.org>; Sat, 19 Jul 2025 08:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752914333; cv=none; b=qBmENo6H46HNICNZoBB4tJN6gCWksoDybHIJd1OPGjofhUlSstVFRFSD5L1c+noF5kdm288HddcrH7lzcA4WI6hDoYD4LBjHgmnrXmPMWBlfsjKZ4Np48wikza6VKrFGQ4oBZf9M12a2F71Fznj+85x7nLQ5PbkVJzn3v3YdAjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752914333; c=relaxed/simple;
	bh=Ur4VPWnq3uw4FdWmt/9pK+hBwvb6OqyunFEN7NVZwmo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NkMz/2l6sPIZ0s7VcAnkCRf14NvY3yVP9hQaTP5E+RbRD9oafsOcB/dIY3ih4Mnv8KebmKTRrm64/UXgJFPpIiIfk5gI3MmeyLvYsH/w00Stygijn3TRt7TqvyKNka8E4X0uc+KfrXl443iJ7VFbsWxkqrUtYcqQ7MfyqcSA8lQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iYluWSHX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iYluWSHX"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56J4nCaf004666
	for <linux-sound@vger.kernel.org>; Sat, 19 Jul 2025 08:38:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=glsksHZF4qm47GLf5Dr0eBBk
	p9qudOP0OhFzI5tDeNg=; b=iYluWSHXdy60NCiKDZwACKpvFtNJB7W1ALMHW34Q
	KWZL1uZi2Xvln8LjANXoqFM14m4qzLWEtgZqHWl4mOiPL9B8PVnVEvV8J+QMHJoP
	sadZ44Zo8vACLx3zQt52G9RB3H+1VIa3/1n55zFrEoo4kWQuMGoeCNm72HD/RUKg
	Faod/Mi9FJcnp1VS3D2wTDtmmScXmZWwwbOwC8Ryk+3Z1tnJHcBE0BU3sCCpl9WS
	kCJMjeCa3CWM+H6bInMXhNGdCNualDhnbp/suXLC9OgdHTGFCDUXV0ysQP/KPIAj
	E3IQWdDFZU8E2hsOEDUyAVJaXAqte5NIgwn2248M8yIrow==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4804n9r9jc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sat, 19 Jul 2025 08:38:50 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6fb3654112fso42919016d6.3
        for <linux-sound@vger.kernel.org>; Sat, 19 Jul 2025 01:38:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752914329; x=1753519129;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=glsksHZF4qm47GLf5Dr0eBBkp9qudOP0OhFzI5tDeNg=;
        b=Po0sXWKRn07NMpCBhjYE+SvxdXmThwiKD06Y3V+8B0PF4qd7IAkFoVjion9u+HbXwG
         TMjq00TTUP8+uIpE+EhpKL7AVqeNVS7LtDeKvavgRorHCd4U/LVYU5GWCTQEVLMbQcLo
         3bog0ZyaNHZOvrMXr5XUsNbnH1jwZrgCYR6cK1KxCg3CaS8ZclOd1/99cwpjHiTJ32XC
         oujUiIK7ZOydmfjeaorPOjaRt+qVaTvBa15dnUrElnVFr86lcWPFOHickO58Rw1hT6lp
         8ao617SwXydUYPmG04VOaRQNP76Hy++M4RQbdfy3YNv1knbvvl7vxpyYywQwPn91ujan
         zegA==
X-Forwarded-Encrypted: i=1; AJvYcCWpA8oUoK9e7lBG/1O6f3oN2J2LReDw+VCHh8bgAQMpnlpAZ8vf+HCjwesvvOS/npyGY9mTrXpJpL86KQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3I9ZkrtziHSzOWK8X43r+YTyQXLag+ZXCzIR1VdIYA3lNNSFD
	HqG+QmACqQKfnDdHYo7c+A+E3mbcT73+fZtO1+bdeNmiSUEwcVtu+EQCEl3uVebAxaPWF5Jh1IX
	+3W/UywaSqZeqxV2AOfhDP3ktFm12RfOzpQk1f5IPIn8nVQP/KzPtYtbvpJ35UYxxEw==
X-Gm-Gg: ASbGncv3OSpQwNRfJvTHfy2qVesrZj3n66r3i+RjxG4ZqnrX9CRpy5xepErxPNEqC/O
	pAi9yKBzsQ1/TqTfN71mpKTzhuidhHh+4q2hInzDjWLF2P5XKay3xmHfamRFQkSo8zYf5S7jOcS
	PBUkvSB0jx0YUrcWPOSbRb6aKkKtdwUfVHty+7b5+T4GnQzMwlExfPPHfgpK0nIE+cPRYvHGMQ4
	iXnvG06WXOum6dJZGSTtdk5KuCSCcpL6gMc5hJo8EEMfJe3b9NrUIl7OdJR5a9u9vydTXSNxXQN
	j6RbsLdl1MXToTBDTux+12vQX2P24v0CXntwTt1io2Sc90ML+dekwjhN6sasiLGU0DcILVKv4Jn
	p5g1dmJ60N8vDgLQ6YWD6qVNWp5ydw4xRCjeXlC4AC2QgsZNz1Cla
X-Received: by 2002:a05:6214:5090:b0:704:8f24:f03d with SMTP id 6a1803df08f44-704f4825428mr238949966d6.16.1752914328904;
        Sat, 19 Jul 2025 01:38:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQsvNQe0y0XkePnP7jlgYK0y9weg7ronQqAfB9AOD0zuVM4AIPd7Z2x/hqwuEfSMzAV+Y4bQ==
X-Received: by 2002:a05:6214:5090:b0:704:8f24:f03d with SMTP id 6a1803df08f44-704f4825428mr238949776d6.16.1752914328437;
        Sat, 19 Jul 2025 01:38:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-330a911b775sm5216151fa.45.2025.07.19.01.38.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Jul 2025 01:38:47 -0700 (PDT)
Date: Sat, 19 Jul 2025 11:38:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        kernel@oss.qualcomm.com,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v6 7/9] arm64: dts: qcom: qcs6490-rb3gen2: Add sound card
Message-ID: <iuojvg73siqfxq4ejv4g7o562k7i766bbpg36sxsljq7z7tqrs@ueqfdknfp5zw>
References: <20250715180050.3920019-1-quic_pkumpatl@quicinc.com>
 <20250715180050.3920019-8-quic_pkumpatl@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250715180050.3920019-8-quic_pkumpatl@quicinc.com>
X-Proofpoint-GUID: JPvflgmnmScjigbyw6up4rQcvff7UwkF
X-Proofpoint-ORIG-GUID: JPvflgmnmScjigbyw6up4rQcvff7UwkF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE5MDA4NCBTYWx0ZWRfX1WkiB9KhCI3a
 dLEXNpuAoRX0Tm4PEuc23o+8C+Ei3V7lkEdj+qRQGtoyFhKtpM9mpsp7d3Ck8gJLRDLIRKbBLk4
 DXxl8JOv/j3b/Lh7+2ONsc4i8BfwUMDVZu4aOAacJE1ICGcqt3tcPijBtX4xqQTwWQylSR/yXNR
 zLZS2BSv81b2KIZnSGpJgCotGZypN4d2/N4OS7zx34Tmp3pE4yjuP+Cjlh+hdTrYfOBpkHW04aQ
 62aFN+xtTY6jRcMwAsIcmoxpHSEQsWfiaQyihLP8jtv+FaTd6OvUJus0iulCw4qJetv9z4phTcS
 KGz+RgGK9hy0xH2ZfwSlPaGyHxyPsys0G4da1ol5plQqTI22/9+k7ZRwl2U2irqFqMUJCbfL4SD
 ct0DNH20EjlM7p1g8DVFZEjldsHg0tj5nfkm/sWzRp4iABsKZdm1jsuzPjd3f9XZDzeXzRNX
X-Authority-Analysis: v=2.4 cv=DoFW+H/+ c=1 sm=1 tr=0 ts=687b599a cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=rRvH8sadIMNe52h8dg0A:9
 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-19_01,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 mlxscore=0 mlxlogscore=999
 bulkscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507190084

On Tue, Jul 15, 2025 at 11:30:48PM +0530, Prasad Kumpatla wrote:
> From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> 
> Add the sound card node with tested playback over WSA8835 speakers
> and digital on-board mics.
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 45 ++++++++++++++++++++
>  1 file changed, 45 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> index 82aa69d715d9..4ec3501eecdc 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> @@ -1048,6 +1048,51 @@ &sdhc_2 {
>  	status = "okay";
>  };
>  
> +&sound {
> +	compatible = "qcom,qcs6490-rb3gen2-sndcard";
> +	model = "qcs6490-rb3gen2-snd-card";

This model name doesn't seem to match established practice. Please use
'QCS6490-RB3Gen2'.

> +

-- 
With best wishes
Dmitry
