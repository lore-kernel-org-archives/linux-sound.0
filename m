Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792445902;
	b=JD7c1dMJdi61ZcjPIKOnPKlAtx62TmhebrgWQprYDuPNttSnlfPLJbRl7S7i54AdzR3M
	 f/JQsbT8L4jpnv/4bFL5YliGepPiGvufbsd/SZvyNvyROjZ+NCKdXzIB52SyOQrAFMEm9
	 Jnne/4ly058EYHRv9gbbTmQYSdC9DaStMQiYQx9iyy3bE5Y5rHWxvkQ4Rj4MFD9T+R6p6
	 bEe5u8dql/WuWzyTEFgIqmtsTFYPp1FLIdXOJwuSXxbHsmXxnhp7k5ci2TU1BFbwIrpMD
	 Uct2jeAlE+Ywf0zOMtWzazkXM5iv5a5ECDMQBndsKTwRYojxyY7qG58PGDFFWhGXaRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792445902;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=LIfePWjFQJh8/rC+L/ZgDno64sd5DgcUdBm59T9ASBU=;
	b=wV3fBK/c8NorqgxYDB6wMYLpRUT0uheidxupQ8T6yoO+L7qVrAhwGWVB2HmAr8S1hkzL
	 LyTr8fUp42byX8XoYNMDsDm4WFQMfK0PJhk/FQ3U1A+hS7CerknIgDzgoy9zrCs3ysYWu
	 PEcr+cWfWAHYLY5poSoP1KbjcilMS3bonJg8yFK9XQSiYAOVcbRhYXrlrgJnSRANbSEYJ
	 rl03nqMtpdkqFA15WYcpM0vM4gWMQ9R1T4zYVjPRp+EX5JpvSB5z62fZOs2d0G1HVmIpo
	 YJWFr528fCRbaKpuqXJcFZpZDuI5w6ipXytk2ockUgIVfmw9dNNRoPltYZwlChExqIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=o62xQRKE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jMY9gFz6;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D85D6606A325
	for <linux-sound@vger.kernel.org>; Mon, 19 Oct 2026 21:38:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D85D6606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=o62xQRKE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jMY9gFz6
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JLZxiD2891579
	for <linux-sound@vger.kernel.org>; Mon, 19 Oct 2026 21:38:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LIfePWjFQJh8/rC+L/ZgDno6
	4sd5DgcUdBm59T9ASBU=; b=o62xQRKEwBqTayFhXRc18GP26keaM0344wrBcb+6
	ddzEapubovvQW+XWoS0WwJj0Qiwzwp+gq+AjOG+Ulnjg8KHStHPTHdP5mhGqrhpO
	frJMuNazXWvNSDszNJ5ytyaiZ9gxkzdKetzn/HL3RUMu/rY0rkDjWkukRy41mxPQ
	Qj6ESj0r0mHLDgkkdchLLsU64qeVnRO4WuHinxrGrhmH96fPo8v0HhIMbMlrwoic
	A1faZqSnjp5uLhPyfKVuL7DRx+j3Varn8a3ixfxAFiO9z8oVQ6aWXkSr1HmJpUQ7
	FJTKVfKJYgn4RgjwlHwFvviTTGzOT+zKy/IP4wHEfWd3SA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdr4a0rbw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 19 Oct 2026 21:38:15 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f26dd2165so880160085a.3
        for <linux-sound@vger.kernel.org>; Mon, 19 Oct 2026 14:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792445895; x=1793050695; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LIfePWjFQJh8/rC+L/ZgDno64sd5DgcUdBm59T9ASBU=;
        b=jMY9gFz6oVSBVWCJxAWnJYu2u1iT7MQQsB4R+kvfEg7yhGUc9v3BRRpvafR3MAEAop
         VK13ahZtPJWaKy4D5WrHNJB3RS69rYO8dlGqj0XpUtIGVeIxBAh/zTfCpTWUpHPAnYxC
         qWxPd7zvUsl3UP0rhG58z6Ht3wSaW0Nvl8RywZEzW/cH8SrCWZAxb6mi/kmy/D7v3CKr
         f4czSyDAjxWwDsIaqVt1Y0/457gHa/6VJ3FpiyqfWEplzGB6zddTePshBKyCv5RgccLH
         f4e4OZOF2G3pZmyajmG/AjYzfnAwqn7magnEN7WknayaWE5XjbdlUU7mK1B5Ff2N1kUd
         pFLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792445895; x=1793050695;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LIfePWjFQJh8/rC+L/ZgDno64sd5DgcUdBm59T9ASBU=;
        b=u7xBnREdcvk32CTdXx0twPPkDC++N5dkRcAewzNgdGWo5t4enWwuLh/45dFNBuIzzp
         T4Gmv8k9qMfnjwjMCDA0N7SQhvkl+2jdZwE69k/U4kHY6pycwh+nBe6cqHuIqqLCasQF
         /t+CALjcua+ccLGFxR0hHW8v1M1SNoo+Cz+RKAdRd2USBoxuM6FTQUNvcfoS7Tks6K6y
         eYl3I+XBvjIoMGIAkAzf3bzv/AkYV1sYtysyDbNb26+BAUcSghEHkP7ry1yNWnbhQct8
         obD62Bry1sELJoMlDBfTNxlzvelOsD4/nGawk4Tor4Sr+VqifTc1SPq1OABC0o+5uYG+
         iq9g==
X-Forwarded-Encrypted: i=1; AKwUvBzEPGDPcPxrBgfgDed2phb2jxLpIorA1wvqtmMEm/Dbmt+u3CyJNDTCs05bIVcO6aQgs/IjKj/GWXmEiA==@vger.kernel.org
X-Gm-Message-State: AFq9FYLJZdfwwtOwLs5mIlKXsd4lcKJFy0b2vJumMrMiNkxVZIuPqjxc
	Qcz0TGaQXKP1yFX7RzT+j5mBfYO02gwzLBSCZCJ+p5c9dnG8yLqNBf1o0FKUqGjDIZV5vzVrN2o
	HV2/pFx8p0zeQXkviqafNPrvh+xWMZRuxzXiP4PBecVFuaxToe9DgiQd8HlYJ449LVg==
X-Gm-Gg: AYBFou09BnqkBTbiOP5J4PdbPE3Ez4PlsJ8bAVBTCetcGZW1oY5dS7hbftG7shFN3IY
	kalKQ3MqQg7obtJAmhVpwfRxq6KZq2Ab9XtFnLvysn+JGxPB6ER4ifJcJstMsiwfHTNNPR+zN7u
	99Y4Qbi1y4n6ZX9pV10jmzpUdC1rS4SWFLXnPCym0p+GjNjpWOVmYquIAqBy1MC7idem/tpFEeH
	dZErLW0B4rggMn9IUPw2CfnBCb6CExqSo7vHMQAMZPKz2J4KYG5sxEjTDyUdVk7ialYXgq8UrPh
	WUIXRR73mVk4JdfuvHT/Cxad0DXkTizBrA0y1lvqMrOIz0v15oGMt7+nMOtmwl9LEdBzmT4NS2b
	C3hwYiaAzZBuds92qMyj/nkqlw/KZZz2q394bxz4zTz7YSnvXTuzpu9VU6o/RWKH0SpmGvawTm0
	DxVOy24fhWcyRs
X-Received: by 2002:a05:620a:27d5:b0:93e:c6fc:7f50 with SMTP id af79cd13be357-93f29ba04bdmr1478803685a.5.1792445895069;
        Mon, 19 Oct 2026 14:38:15 -0700 (PDT)
X-Received: by 2002:a05:620a:27d5:b0:93e:c6fc:7f50 with SMTP id af79cd13be357-93f29ba04bdmr1478800485a.5.1792445894600;
        Mon, 19 Oct 2026 14:38:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be4a533900sm2290916e87.50.2026.10.19.14.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 14:38:12 -0700 (PDT)
Date: Tue, 20 Oct 2026 00:38:11 +0300
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
Subject: Re: [PATCH v2 08/11] arm64: dts: qcom: sdm670-google: enable adsp
Message-ID: <5bs72nbd44ppib66n2amljtayro2ghnpek2xvdbioz5k265nbk@if7gqck2u6fa>
References: <20261003175659.23536-1-mailingradian@gmail.com>
 <20261003175659.23536-9-mailingradian@gmail.com>
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
In-Reply-To: <20261003175659.23536-9-mailingradian@gmail.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA4NiBTYWx0ZWRfXxx2NbdgQpe0H
 hGJwQp2B/5QUj3YnFvzBoYi3KgyvUBsHgoGXab6AdxE8JJP8QZuhkYBS+UDsSN2aBnR0ZLBD/AW
 BG9gxTHEOohPAfY/uLnHsIC8yQ/mI8Q=
X-Authority-Analysis: v=2.4 cv=Zt54uN7G c=1 sm=1 tr=0 ts=6ad68dc7 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=1DDleCVHwAjOA7h17fsA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 6S2lkZ4DKCqHjU4jKpUQbbYXGn4rt9P8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA4NiBTYWx0ZWRfXw3ywnZE/FC4k
 M0Boc5mDJzQbIAZnM7J9Z33pQrlxmsxVqy5dEGkZTlen2F4RlT1cmFPcCDnwf/oxJ5hcs2YU9O0
 leUl1iDATHz0m/KfvuCkKGpdDN8VMwmOcxdlbWtNTdU3l9Quj8DFnun0tVXtYYY7YR96POvb5se
 g8/YDG31Yd9f/8hYEpybbMSxtWTcxsDRKnCmcqXLV3NBCI1amvu4ZRMSVCG6b1TlgEOaBYwxPef
 5iwvW29kTopl2M2gNle/wO2f17id2A0mVG/0FBBA1Z0zrmbH41XrAU5rCjiCgInNFPtxZCOBQx4
 OvvQLqpLBIQFMSDjcUC/Up5lzTIn2C5T8L23DQDrEKVEkFsJ0F6ylyGm4w0kMQbe7vXiSK95vHg
 FrYRxCaw4hrJdCeDrgsk/kWdPj9nGEZHPz84AuO+bcADyevZnpAfFJpQvcdJ+visdFdhnNifUrP
 +EnPoMPcPbi3XtDCHDA==
X-Proofpoint-GUID: 6S2lkZ4DKCqHjU4jKpUQbbYXGn4rt9P8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_06,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190086

On Sat, Oct 03, 2026 at 01:56:56PM -0400, Richard Acayan wrote:
> Enable the ADSP on the Pixel 3a in anticipation of audio support.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
