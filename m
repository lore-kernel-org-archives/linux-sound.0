Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25BBA30F95E
	for <linux-sound@vger.kernel.org>; Mon, 16 Feb 2026 13:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771250253; cv=none; b=oYfZa10XWqBfAHlHU2b/V7UxdRnUEKlmIBM2gPB2vG/rOg5m7kg2AGoeeDkKcezFyC/iJ7fav1LmqVyb0buLKDjM4tLliC4rrIR7q6rSeugYRjjDwV+u5MOmKS+KCsx71iPnJxn5FHy4VSww0Zq2DK+wMQSI7Njdly9DrFoWOYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771250253; c=relaxed/simple;
	bh=egi0uDkw6MG+glwNePYnB+SNvuHEajDza2jPy+y0ccg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q0eVTC9iPEnmfOXnOWE7MO1SokWFEEsLN45rOxaqApGLPmAiCd3xfo4qrz/uOmg4u5X6GADRtcS19RrF0gRdPb3HfIlHqfuVdjOXxcbEG49XuuweyWS5XH1+QBEveKU/0yptwsyhlC4RTGT1KdEpBZeX6RFfcY6xeZyGqrIefCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NzRB+jN/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MhgRI902; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NzRB+jN/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MhgRI902"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61GArfKY2732830
	for <linux-sound@vger.kernel.org>; Mon, 16 Feb 2026 13:57:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cCkrZtY6hQvMdL46XWacBkUg
	M+AID+bF+UdrFpXbxMg=; b=NzRB+jN/Znh5sz4kiyG83yneyobsm9dqWFCpRT7j
	5/F88FofvlgxTQd42JwL9VK3dt2lNUB6kl6sB9Z1VQzpRNlsB/+PHyS6jJWbKig/
	cAWCVVF1i3WBPorLYce03CUhQd/jjRwuA6OF41NgXQmesi1j3vA+GbPuQwQ7HmMP
	CORrVc9BPV3/XVWrCAta4cbuR1FJREbWYS6snE/w92nKX6TV2274k08/+RoL21qu
	x2DYlFImxIdw/5uWjveZkdrOUo5ms+kDNQ8xUG9BVOqHoWfPgMYSyYtVDwLtPs22
	zpR51Ax38jJS9CA+OfyRFWY5RWd4qfXQQBR+wKvjFB2jIg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cahtcmmdu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 16 Feb 2026 13:57:30 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb5359e9d3so1412033985a.2
        for <linux-sound@vger.kernel.org>; Mon, 16 Feb 2026 05:57:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771250249; x=1771855049; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cCkrZtY6hQvMdL46XWacBkUgM+AID+bF+UdrFpXbxMg=;
        b=MhgRI902lNG3zb1LmPwAXABXFa1EBsmJ21SnoUScdiEiaDVgGrXeu9AZjddF+qtbPu
         mukEuZVqh4Xo4wuSa1r5XalmAQUve6PscvddhuZxLR7Nhbr3Kw3oOqgAQ4EDUP9KU0Hz
         +wtzQcHfahYVBXGa0994aJpBZnc7y3GavppGANOV57wbvN3rX/Bcrkf2HmzD7h7SdxOT
         nVVATSTSn1A57aD/0EEaN7lS0TwLUYf9OeaSNKgeMVbASZd0IzZNmARwXsaa0ZlVG7Bo
         ezQz1f7jIvPh7FFWfmv+HqAvnKOyagTYmsxltWcKolxRjGxMGRpHWCfc+Oc2EtFQVjsV
         QLbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771250249; x=1771855049;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cCkrZtY6hQvMdL46XWacBkUgM+AID+bF+UdrFpXbxMg=;
        b=NAfCVBQvlMDar7qeXicKCW23e7BmAcqBDb2T0RdR/lVv8U2jf8NshcGVd6yU60XYNn
         iS6kmw/Ya6rfd2KLv9AY+ylFuqgIWQ4NRFoWbpBmQolycoI1kH7YACyzFrCmDcyg+jzG
         dpDu93QTVw5nBhUI2hwRhIJWlYeyA728/rJm8DNsYl50RTcFAMTLmI7UQO/c9EtfcMB4
         YGoPj/D6FcbXTFNROVtn4httT5R/c4IGnIQp03JFOa+PAcwMslibPszuf9KhDWE6uA6l
         S7Lgl+btE4krFpziYvmNMouz82uMncMk7VcvnUASFCSNwqD9oNxn5EMTGvxwmij08mb0
         9ksA==
X-Forwarded-Encrypted: i=1; AJvYcCWcbRYhGH5LGy3oROy5qKJOO5dtNRmdxxjgLBtMpsM+mj6bmCXU3FwobJXQyzmb3i5QW0EqxeEcpg4/YA==@vger.kernel.org
X-Gm-Message-State: AOJu0YypilF3cXP93iq9eoVwYfzYcsz3ZBRgcuHbofx8nEhojXlZeT2v
	PEzxFAooygLZCimtOC9D4pSOTLcDwgZ6DU97hJiZZtyWRPXJflFqEwBrS7XKJWS+3szWiQx9QuX
	DnJ1M/cvAUV4Me0tomLQ8WvU/Pwc4Z6veF1wgWPYQFubj6VEU4xwMxyxkYetPReJltA==
X-Gm-Gg: AZuq6aIp6vvIa5Ts1bp1gFrvUmBMqrHo+M5mFn9lBmB89tfJiyL2AMRujg24s4W+wuE
	YRgVODOtx/GKdKsodHxm7iFasUeY3XiHjBdHKrvUHvYEE1Qm7HJVKN1lJnqJNFAGd8xi4WTR7S2
	7/Unn64L36si1hgHjmHPy1Fs/3Vwbcjy8iDivL5+8cGaLGARnQ3SOhaKeW3fxKT0K7WB29h84hA
	JzK4hHX0Twn7f556j7acZK/AwnCSvkm8CL1QPsrehpItNdvb6dRWIECtaT1Lh53c9viqW3tjvp5
	TCpZzKDdMpqPNRLByu9Lw4JwtY0z1PMTSoX+GobgbDDD6oVUZen8EKXD/0SQkRbo+vYcW/yQ3mO
	vv1xC9NKFY2YHa2fexXBrgBhzWELblRYYjFJAbSjzKa7L3e9KiwgXU7b4mft6zw7InzFk0westQ
	+mkKTfG6aBkqb8sO5h8VxAreabX2VzvX52UU0=
X-Received: by 2002:a05:620a:4486:b0:8c6:abc5:f169 with SMTP id af79cd13be357-8cb42479b59mr1248158685a.73.1771250249161;
        Mon, 16 Feb 2026 05:57:29 -0800 (PST)
X-Received: by 2002:a05:620a:4486:b0:8c6:abc5:f169 with SMTP id af79cd13be357-8cb42479b59mr1248155585a.73.1771250248687;
        Mon, 16 Feb 2026 05:57:28 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e5f5a4f8dsm3257023e87.49.2026.02.16.05.57.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 05:57:28 -0800 (PST)
Date: Mon, 16 Feb 2026 15:57:26 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Richard Acayan <mailingradian@gmail.com>,
        Nickolay Goppen <setotau@mainlining.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Johan Hovold <johan@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 01/10] ASoC: dt-bindings: qcom,sm8250: add compatible for
 sdm660-internal
Message-ID: <nt7rqp577vxb7qoqxbaqldv4n2erfg6gpkycfqi7hqkdwirncb@squrvhxi2tlz>
References: <20260211020302.2674-1-mailingradian@gmail.com>
 <20260211020302.2674-2-mailingradian@gmail.com>
 <yxrhmblavwkuhfrfgskujs7tz7cykojnqnl2mfrf365lhdem35@bgqwiaft67b3>
 <20260211-skilled-transparent-moth-fac10f@quoll>
 <f1b67c1e-cfc1-4d23-a24e-4dd342edd2e9@mainlining.org>
 <f27ec5bb-1562-4bcc-9178-4ff4d4fe00d8@oss.qualcomm.com>
 <aY_uQZxuwt8rDf6n@rdacayan>
 <ddb41df1-2d60-481b-999e-cc480a6900f3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ddb41df1-2d60-481b-999e-cc480a6900f3@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDExOSBTYWx0ZWRfX7Ac1GeEAEPxz
 hIefvkUKWD3hbapZuCCiHCoL+QFQpxWOQjR4DlD9lxneRX62c7Xai08NFi2fwXZdPKoqedFDFXZ
 /RsixSN/Cxnn5Va7FFXovGChR1pLopgVKpP9eTUjMD0zw5bZfvR8w9DIE++Ov77B7UoYP5Wh/YM
 J7a0tsUsISACt4t1dCc7fkhd2eAX76eI4SI4+RRDbkZpdJy5Hdj+VYc8ZEloNAJJWeIit46b4oi
 PrpeuphMK8rhMlQRHLWSdleobgR5zaCzLJns9ZxDBk/NvUveF1Wfmu0armATNz5GX+3utULYFfb
 1WamhXmNQD2jucd8RkB6ez2y9gRmA6olWAzJqVWvIEy7DPSb8UceNGTPg0O37l0SCSIleYTA5/g
 aitL4gKhNoSuSo5Ff1HbllPnAQI6C01IKqJA8nzgYKEtnj0i6/3rtkULfMq80dQQierUlFLYjK8
 bPiud0ZkMcrFcpOXPQw==
X-Proofpoint-ORIG-GUID: 3ZhhmWkv_27J_FHCFgf8RuLT1Xu28WMX
X-Authority-Analysis: v=2.4 cv=DJOCIiNb c=1 sm=1 tr=0 ts=6993224a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=OuZLqq7tAAAA:8
 a=0c9jgaLhmclDbT0NVeYA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-GUID: 3ZhhmWkv_27J_FHCFgf8RuLT1Xu28WMX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_04,2026-02-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602160119

On Mon, Feb 16, 2026 at 11:53:49AM +0100, Konrad Dybcio wrote:
> On 2/14/26 4:38 AM, Richard Acayan wrote:
> > On Thu, Feb 12, 2026 at 10:34:27AM +0100, Konrad Dybcio wrote:
> >> On 2/11/26 10:55 PM, Nickolay Goppen wrote:
> >>>
> >>> 11.02.2026 09:51, Krzysztof Kozlowski wrote:
> >>>> On Wed, Feb 11, 2026 at 04:11:24AM +0200, Dmitry Baryshkov wrote:
> >>>>> On Tue, Feb 10, 2026 at 09:02:53PM -0500, Richard Acayan wrote:
> >>>>>> From: Nickolay Goppen <setotau@mainlining.org>
> >>>>>>
> >>>>>> Add compatibles for sdm660-internal based soundcards.
> >>>>> Why is it called "internal"?
> >>>> Yeah... I am pretty sure there is no such sound card. You cannot have
> >>>> sound card internal to the soc, because you need the external components
> >>>> like codecs.
> >>>
> >>> It comes mainly from downstream driver name [1].
> >>>
> >>> Downstream also mentions it as int_codec [2].
> >>>
> >>> There's also an sdm660-external sndcard [3].
> >>
> >> It seems like "external" means "coupled with WCD934x+WSA881x" and "internal"
> >> means "coupled with (digital cdc on SoC and analog on PMIC)-over-intI2S plus
> >> optionally WSA881x".
> > 
> > Interesting you left out WCD9335 (codename tasha), is it never used in
> > production on SDM660?
> 
> I don't know.

msm-4.4 lists WCD8335 in sdm660-audio.dtsi. I'd assume that's the
standard codec. On the development kits side, IFC6560 uses PM660L, while
Open-Q 660 uSOM uses WCD9335.

> 
> I think both were used with MSM8998, so I wouldn't rule that out being the
> case for 660 too
> 
> Konrad

-- 
With best wishes
Dmitry
