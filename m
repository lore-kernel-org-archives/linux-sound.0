Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F014839A812
	for <linux-sound@vger.kernel.org>; Mon,  3 Aug 2026 19:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785784200; cv=none; b=VUBGYL+GUSr1gsIx0Rpygd3HfHFzinEmvoOEmejo4KvwLibD8YN2e2CgDAizR/tdaszwEbXx2GTPcjF+Dy6x7wv3LQMEFO+eiyBJYddyxEW6fceuLMpf1B+91Dfvrk7WkENfKAxDpBCubKtDB8pZtFXa3Pe5go3jbtVyQFnVYpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785784200; c=relaxed/simple;
	bh=u4yS1FtcolfZ5CLoUwNp/JMGjydMlgJSZRytbG128q0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sGJ8brEC+tR9ulEcLYrjE2cWlA1QfyIjpazffUvPXA9oJqIv9NCvk6AErivtSGxGilV1PBeaJSLmIN/05Jmxq0QOUYVDG26fEW+MbVmgehfWHOsE9oV1Uo4njO3mMm/lDz+tQYfeTMH75iLiVc7gErH7y5Oht0OpFuDNOM0O650=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YLx9dUhG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FxxESk7G; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YLx9dUhG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FxxESk7G"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673Gw1X92394049
	for <linux-sound@vger.kernel.org>; Mon, 3 Aug 2026 19:09:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EJaotQue3zZSCz2sMY9io1yH
	vbDdBkt/2tYCT7ERQ88=; b=YLx9dUhGEoQiKMSThBB8QdJagm+mOflc7XPv2Kgl
	psDxFMikEPXysGAZ9BPxWJz4aJ72s5CDwPHhcokkFThmLt6Y+4kFJET5tEQa2TC8
	VJ1VkSd2qdRC3VBIB39TwDu4yEmSvodPtybg8QHNrmClq8kao4R8MVCBoBiBycuV
	06FzSHMHGRnldwIdU88qgwoj92/6KvURir94MTCpEC+WEPQuDk2HuXEfGmVWY2GC
	FuBVmVd5nDXSA59ekYjnK9bdGj27mm63K7nTvHCH59jgRrnqxcGDddko2rvD4zzT
	dK95K/l67VaI6k7AfwSpXHPSbnaL52eRKngebPiSv6BVFw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftwhds2sr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 03 Aug 2026 19:09:57 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c12e43b98so39885351cf.1
        for <linux-sound@vger.kernel.org>; Mon, 03 Aug 2026 12:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785784197; x=1786388997; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EJaotQue3zZSCz2sMY9io1yHvbDdBkt/2tYCT7ERQ88=;
        b=FxxESk7GuXJ52VqiXwwz87z9LWPshr9K2HxsV3DT5M2dl7rPjCVsZ+39s/OtPmQam9
         fp0pS/ATIyjquRyJMQVqoY5cn1H7/0AK8Qa0HF/zMeVRqWgxV382zGacV6pSu+JtI8a7
         k2iTjOqyRNADDn5GI7JqzZkcuNjV84aP/zAK4lnSIiUhR2RR5FQAqrW7xeUHXW1oZmT9
         xKBW7oDMRoPZdJk6w7SLJubnzoSmr8jXHi8TLErYR/JJxzyTfmZC8F7f1gUt5JqSNVEV
         iJeEA/sod/mR8nPyNkG0PbVWPOPcKn1+T1smnaNvySKIh7PDI+pi8mj+eeGrHpY4HLrX
         Ovmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785784197; x=1786388997;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EJaotQue3zZSCz2sMY9io1yHvbDdBkt/2tYCT7ERQ88=;
        b=nATOpbnzJySeGJHHf9VWQ+SfR+usQFz5pO8ywqa08eUFFI57eGSl2DQndUY+IfcKMG
         GX2r1Mj7HP24zZ1fSlS8kd2EHeXA0wnJoeOO7o4bAQuX8muKKQw5DhZDrGfcUI9m8Vte
         ulkikbh6J/Vc2iFIyz33La0DPNA+QDa5E2aJvpf4ZhtnRThMiAmH0lype9Rtj74QcSOs
         YpBVtFz5EM58iSCVcwZr1dPlq4SCoUV2gtI0Tp6puKIWJHJKxy6zmbFJloaYdTUzY97g
         eCTjY9gdaAfPhoyRM6JBU7MUmPXmODHcjZkrqUDUY7GkSxqhrrQf2FjEPPwQTrdTktI5
         KuwA==
X-Forwarded-Encrypted: i=1; AHgh+RoJMY5n7OCzBAnuNJxlwcoNKlBFLKtomc+ytCJNdoXQe7rGejBB0nFa4hwSoFfUKJDNyOdfP+EHwIPi/A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzlGrv3ixKyE0L9f82DkW9j/kK3ikCDCNyiowuKb8v70E7ve7Ad
	vw/hI6SFchbQ3wmlvvS0ysV+UDIUpDV6USvYOjoxgduRbA5AMLQ6yv0EVJV/JuN7J3ikPbNT5oV
	ZGAX7tVzb7XEXr8eIod2vXefNPAI10XUH2DUFlME6q2fO5ExiV4JlDMbQ1gXX3rXuoQ==
X-Gm-Gg: AR+sD12mIa5y8kO1lyJZ7o65jJUKf8/IRDCWR9IOUr4K8ecQpr4dennl19AsYn46Pbh
	uPAxlxbuHGRHPceZvi/FcU5w3D7D47p18xXnOs7qjpXH1T9z9AXS+jqwMcTsI0yIiBqf279/2AB
	YBdMVPGep2kVRGTgIeG7DcBkSp99vLy+9zR4PO2924BiqkHT/22t4urp/Zow6iuQ0nCmlGelh8f
	+0dHdXfdtJrVCiH0WsbJE3NYmomv0Pwvr6qvvrDwXjyxbQd7S5lRrnn77GuD6l/C3oELhrGqfqW
	Oiqnhcy5pY8flZoks9GD+h6GQOEN65iF+ulhtj+8/n8JgNojkTu45YgVAESlgOOQlfazm6CpN8T
	4zhBr1PSXKRUt+CKQ6GurD/LulJn4hBh2AyaVD88juCDAzfWTZBSCEVHu3tVZW4Wk/uw5p00uuL
	F7+9BIYvjFHb7ctg==
X-Received: by 2002:a05:622a:588c:b0:51c:164b:b240 with SMTP id d75a77b69052e-52b5676019fmr227457371cf.4.1785784196947;
        Mon, 03 Aug 2026 12:09:56 -0700 (PDT)
X-Received: by 2002:a05:622a:588c:b0:51c:164b:b240 with SMTP id d75a77b69052e-52b5676019fmr227456911cf.4.1785784196546;
        Mon, 03 Aug 2026 12:09:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2e23c55c3sm2276099e87.4.2026.08.03.12.09.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 12:09:55 -0700 (PDT)
Date: Mon, 3 Aug 2026 22:09:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Baojun Xu <baojun.xu@ti.com>
Cc: jwboyer@kernel.org, shenghao-ding@ti.com, linux-firmware@kernel.org,
        13916275206@139.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, robinchen@ti.com
Subject: Re: [PATCH v1] linux-firmware: Add firmware for new project
Message-ID: <54temeihhpr47mdmbiiyymfq6z3i4h6zyvfr6a24576rcdjh7w@kn34w2gx744o>
References: <20260801023143.1295-1-baojun.xu@ti.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260801023143.1295-1-baojun.xu@ti.com>
X-Authority-Analysis: v=2.4 cv=Zf4t8MVA c=1 sm=1 tr=0 ts=6a70e785 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=p0WdMEafAAAA:8
 a=sozttTNsAAAA:8 a=5lSAVLIjjQ4NXhZDnAcA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: ov36K3i_RX8MH_s26d_Q2rAbWA8QtmIK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDE2OSBTYWx0ZWRfX5As9LVUkTWNm
 LnpcgVidhVTCgrYxk3lG7idD9bN8la4EjrbotCcoGrUmvlJNF8QmRcsmfMdn9Gt1wIq/biMnn+f
 Iu9e5Ool0MaOQ8S7IaqzDRiw4G6Dg/y/uZsdiYxoRuUJL4/KHmIPZ6k++KllxTfEUGXMuzX6jG+
 Kjbe+YksDfBN3surLk7f1fm/sNLwyL7NeIy7B6j4puSBtFgcZuSiPPhXubCeRxpouXdQoC9awP9
 cSJCEplLFIou/JJapz9Sf6a6p6CFqMGrUeVDKg+yHTzl9dtR9UIz7moWahzWPF9nQrb5B1QgEHh
 LA6Bjy6CTpiNDmuz6K9ZFqbvaz9dj8S+FfVvPyldZdWBO/WGQ6ci7hgHt/NNF35TsxiboIVmMk+
 31eNjubA4wiTtF0oDH4LKrTMBUKs1Tv5DssfPlT4xOkwQ2hWPnDEIA9cIWrbVllYNlo0tjc1t5A
 Y9YB5uWlp9sFky3WlZg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDE2OSBTYWx0ZWRfXziu8KzLLtued
 AzIf/pWiOkdXiA2G/kxGptXRVJPf3+DlKJnXAIWhGI1ofDPCtfr2S0HA7MO4Mv0Xbaoeo5ORk/A
 G6arTP1/rwNn/r2xL1QbKTdM0GHvC20=
X-Proofpoint-GUID: ov36K3i_RX8MH_s26d_Q2rAbWA8QtmIK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-03_04,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 suspectscore=0 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030169

On Sat, Aug 01, 2026 at 10:31:43AM +0800, Baojun Xu wrote:
> Add firmware binary files for new HP project (Messi).
> 
> Signed-off-by: Baojun Xu <baojun.xu@ti.com>
> ---
>  WHENCE                           |   2 ++
>  ti/audio/tas2781/TAS2XXX8F7E.bin | Bin 0 -> 19364 bytes
>  2 files changed, 2 insertions(+)
>  create mode 100644 ti/audio/tas2781/TAS2XXX8F7E.bin

Thanks, merged and pushed out:

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1160


-- 
With best wishes
Dmitry
