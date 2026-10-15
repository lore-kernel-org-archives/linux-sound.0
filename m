Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B47E49F104
	for <linux-sound@vger.kernel.org>; Thu, 15 Oct 2026 11:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792062524; cv=none; b=S1pNe+vbsLwhr4RXDF+gViUKatHxdmHc9pzAw7Z4zzlRdYiH2uoSI2gazsu3KwdcebEdXg8LRxOSGsS6rxW6ncEHtwoK2cBUe5UAouM6jkJ+5/G3+TKx76qR2P8rMcE6EGuMbkyYjbEJEhuRITDKZmWmPpnsLIJoQrSOR8iLVUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792062524; c=relaxed/simple;
	bh=f2ckxXyZQKuh9nsM9vxf6wcauADxi7RuciAXr8hyfjo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hBA5duZBijv6R6eT/WsrgfBvWYN6qCcahHbFQgEdGJUfqplhbQW1VUI2u+wilKJpuXwrNVhTDvEPTXm+i2yyzdDZP6ok7wD0E2fcoPXfHZrvbLIGVgxy7AD1Q1lz1GI/eNOkVmFpfnxDTLBD0PU160QQjznj0LT3GJ4G4PPA8fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Spy10IAY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zjih7Kc/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Spy10IAY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zjih7Kc/"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FAPdIQ4100196
	for <linux-sound@vger.kernel.org>; Thu, 15 Oct 2026 11:08:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WbgCTSTRt/wLTSirkAGLIvHi0DrCG2dHr20NOaz/VH4=; b=Spy10IAYbSeks5Us
	4lnnfmwbiPTw91h/+TO/EPi+I/PJCJAe5BG1dWIM6cnA/hyu8smJ+NN0zg96kj5o
	nbzb5n38ExrM4lkZ6660jMFaZpJKpekrtOD0BWCXiI3wRDLFslXwRppTdMG0MLK9
	u0p4KuKC+5cuVigijTsXVITYrvPXPr8YHWeSmdU98AZXorsjFGR0VaioSfVjl/jf
	UNX3FNNlp1IaQ4ZchQDV64a0VbPqA+MFuVzQ6+ZnSdtSXxyTRQh1sn2aTiKckAhY
	aPsdILygwprRMkeN6yXUvm0jIlUWsTpX8V7odNv1A5f8/RroIxYfCjgrRKB2z/sg
	l8HXzg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haw2r856s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 15 Oct 2026 11:08:42 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93ea8a9cfe6so90021785a.2
        for <linux-sound@vger.kernel.org>; Thu, 15 Oct 2026 04:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792062521; x=1792667321; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WbgCTSTRt/wLTSirkAGLIvHi0DrCG2dHr20NOaz/VH4=;
        b=Zjih7Kc/yhyExhteplf60q3kKdmHpS3WmrS9vwuv81i/hxk2CNYmOgexGh5aR2cKVX
         apM+Ki53ZJ+qq6uQDjeTNuT6GEFN0f90NT1dEmaWDOkSrLSAheOuf0L+ptXj9T4ysXri
         +oCpZ1Z7+OvkfxiRheyY9lw7SJOo51Oqb4ZRf3gwArBtQU/LT9tEVgoAcmG1IuUC0Az6
         MiGDcrzLp3JjGhB5OpzxFCUqGC5do0VNLzeBZBVi8NluiaAOyf1W1pGEzwtk/dzoo10A
         wIv6fBrqVnd0l4xT1rqI6J2hj6bFelQrpbYEBQwS3ncrH6idSwW4+uRQcmOL0NYzDoOP
         +udw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792062521; x=1792667321;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WbgCTSTRt/wLTSirkAGLIvHi0DrCG2dHr20NOaz/VH4=;
        b=uWNjBGdZJ5G4eHBqseJ3ABFSrp4YSQGenLsxWX5uTz8jNhnAUab5CgcvpyGKAeefZj
         RRG73f7Vp+gow1/soIHAfKRa0g4dedasmgVkrAveFQr+YqMljFw9b2G5Z4pMsG8hvj9H
         Yz6xp6d+WexRddTCw0eSvY1XmsU8MBQ7ZAOaL/pOvjGwtMRRbLL1+O0wqkazmw2SRI/m
         PlEZibowp/sQACYBrAO0x2E+j4IapivtcSjBzbJjJQbORpM/wBWTgl0i29QvQAKYs73i
         x83OSxcn4sg1AWxL0YW6XcH8lw/nDv8yAdRUkIUm+Zo+0c5Os1oIz88A4CL+Zf+dw0hj
         MwfQ==
X-Forwarded-Encrypted: i=1; AKwUvBxbVGtLupyDLI+a7bzWoTYabd4A335d4VZ54lZs+qoEmxkSB+7p7ToyiE1h7Oaj5Qhr4eMn69GQInuzOA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJENWUiQQB5tnVPeHQL+DHAz/3RUJKX6EK7DR0BW+2I4zRr+iEp
	iNJ79U5RCGPhboU9cXKdOIoY0htUK6hUdCPhcoNXoy4NJ0j+KRJcSUZU7Y9CvFbHUM+3l1Z0uaR
	KfqADpjmuGR0xtRCHLskpr4UvTj3C1/VTzKUiaBP54h2hLcLma37PxA2+DOyCtUYzRA==
X-Gm-Gg: AYBFou3+EQiLC5cWMuiDdr1cTodwa6Hj2faXl/lr1GRFASQKnRD7lninaVFIkuc/NEB
	jEl52qGpE9+WdjS/DONPYW+p8GfrCf8q/eU3ulWEo1mGI/3pdaK6eEfFLs3Oz6+JZa3v5s7+EyX
	RjQ5VlLCIlkzLVv3D6MhRge59eyHP4hcukmIk6SBxcsPLZKOwxLiz0MR3Zhof5hu2TKMxb+sFfA
	2GeTAbBGarWiLGxGlz9pYImrmMJtfPB6Zm3ph+ZZ3Mb4QdZdRAcydlU4fdqJelMddlAOqVoHn3i
	jAitZ2pbFvMPvHVWyRWlI9JSXbrz2ePaYa2multjjnOT/bdgJZB9K3zda54x1O7FLv44EpFmUwv
	FZEQLK2nBU2lCSjWHCJhq5Q==
X-Received: by 2002:a05:620a:6498:b0:93e:e111:2771 with SMTP id af79cd13be357-93ee1112d0cmr2254357285a.2.1792062521378;
        Thu, 15 Oct 2026 04:08:41 -0700 (PDT)
X-Received: by 2002:a05:620a:6498:b0:93e:e111:2771 with SMTP id af79cd13be357-93ee1112d0cmr2254351785a.2.1792062520818;
        Thu, 15 Oct 2026 04:08:40 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b20388545csm2280628a12.22.2026.10.15.04.08.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 04:08:39 -0700 (PDT)
Message-ID: <b1570552-958b-4cce-977d-f04e03fdb4bd@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 13:08:36 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 7/7] arm64: dts: qcom: sdm845-google: Add WCD9340 codec
 and microphone capture
To: david@ixit.cz, Srinivas Kandagatla <srini@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        David Rhodes <drhodes@opensource.cirrus.com>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260925-pixel3-audio-v5-0-7ffb32c980bf@ixit.cz>
 <20260925-pixel3-audio-v5-7-7ffb32c980bf@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260925-pixel3-audio-v5-7-7ffb32c980bf@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0NCBTYWx0ZWRfX8moyZdQxr5j3
 krkqmvICvaNLRxrNOQlIpFA3W37GSgZoealZAvICYX6g0NFpYcHZlggxuQ9znvWgbrkPt4i0vhW
 eqturwhCZz5/SmKpf34VGHBrD3QAAM0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0NCBTYWx0ZWRfX4xOIDZRHbKeI
 0UTuaYfBB4MbNTJ8pne/KjP7SmwUmGeaVKIhMX3Q+XxJ73iYH3IO7AgmG5WztYfNrz8TwEtAX2R
 kitSocsxHJCS5s6XK1nsYQFCba5iZ5x3bfAu0mr7UDD9GbamdM2bQZ/o+RgmjbKF7JjP82sgWXn
 xY1kF9+bjg3Qfv0nHukmidSoIMgJvK9ncBQj9mLGbTn9f9ib3jVbBa9MU1t9tV+Sqi1FFQzZ1Ke
 8V8uCMUKvwxClUVni5aFiEDeQJWlAeF8lDoVB0bnECGPTPre7MqVfVaPVHyVl9v7Da7Z4bDMOCn
 HRWZhEBvRH1Fze/glF+wl2xBeCPekUgOyfdbZm0OcbLsGUD7PslJj+VxvUxITr10CnNlmvMNZre
 F34avY54TvkMk8eBb/HxZjAq5qkaXsr8Ibu3X25Z+GC/Di8OqAbyFG/BuqWAGO/CeO8+myDBvzQ
 0zBByzjcXW6t0dKqgKA==
X-Authority-Analysis: v=2.4 cv=BNMmP1QG c=1 sm=1 tr=0 ts=6ad0b43a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=hkRLp1vvXMYqBSLCnVoA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: ezvFtYdpiwXOaMUYcPhuGGkBcY__cYXO
X-Proofpoint-ORIG-GUID: ezvFtYdpiwXOaMUYcPhuGGkBcY__cYXO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150044

On 9/25/26 5:28 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> The Pixel 3 sound card so far only drove the two CS35L36 speaker
> amplifiers. Wire in the WCD9340 codec , add a SLIMbus capture link
> for it and route the three digital microphones

[...]

> +&swm {
> +	/*
> +	 * Nothing hangs off the codec's SoundWire bus on this board: the
> +	 * speakers are CS35L36 amplifiers on QUAT_TDM. With an empty bus the
> +	 * controller reports port mismatches and frame-generator timeouts on
> +	 * every boot.
> +	 */
> +	status = "disabled";
>  };

Does our driver need fixes?

Konrad
