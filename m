Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C7F3DE430
	for <linux-sound@vger.kernel.org>; Tue,  2 Jun 2026 13:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780405295; cv=none; b=KN2UJGsTbbEDMTtn+oRkHmF98AdqVEqFofTR9ss/iu7D+Gy91hce8nMP3P3LS/yOEeJvB3SkJXQXly+Q08azKvAvT8k84LcUIlMzs2as4pBkak3jlPmb4dL4UpC+sLWPotOGOklmMlwMcydwJPFs2uC4A7RwTv2rP+l+eFpEbEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780405295; c=relaxed/simple;
	bh=lbVtvvvgBBs48KFDtZXqEIV8LbfZg308ZvVz26/6Eq4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WbNCqLbgDNHKt79+zRfUviyoKTw6aRolXXk7hPltvUlIZ0kQijdWCN40a6zB6DOzVjnaFGmX6H+/HQEBGlY0yaYr/7U9vJ1gn9vknYGnvxBXAlvQtSExzqYncQmVYIqXKR/H+M73zQrYsYjTR5PrUDCaG9RTn9w5Hez7kFRsMos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e+ZXlnZE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i14dbo67; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e+ZXlnZE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i14dbo67"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6529UeJH3355773
	for <linux-sound@vger.kernel.org>; Tue, 2 Jun 2026 13:01:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vaZKnmJ+/6YVnHKIJqf9z4v6
	CXPf8LxE9YwKtDn2GLg=; b=e+ZXlnZET/Eu3Aja8xuGdm9/Ii7Ha/I+znYgUTg4
	Wu7EpXD3qMbshAsU9opIB5rX5KE3UjsxGXS3JVUNaa5PXYEQEtMvoyFW6I5zYo+2
	2cqawsEYzctz/q6JSpy/iBy96Xus57+inn8htoBMKd0jmccR01VRsNiii3u0GTRW
	jgajb9wQ9PmCkwGQx3oPDuUNA8bBBFmqByUV4+bCi81QgwSU7XqL1Es+T1v6JNMN
	ddPRw0yyfsEWxvsOEINLIAlmWTMcmRx97GNi4vttCKdyVaOS90wdRLs3463q6EiG
	ho174v1G33WxF5Jejg9/+zH4ERhqR8Vbj1jLIGm1tCB27w==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehvkx8njw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 02 Jun 2026 13:01:33 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7e6c8a160c4so3613116a34.1
        for <linux-sound@vger.kernel.org>; Tue, 02 Jun 2026 06:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780405292; x=1781010092; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vaZKnmJ+/6YVnHKIJqf9z4v6CXPf8LxE9YwKtDn2GLg=;
        b=i14dbo67RCbhMgS8oAd/PL+nMsnRgkv4rFODKSRQScLPcMILc0R/H5paNVnBrlkvx0
         r5bSNTikEt59KubfTTVIM70l0oUe7OGcFI7klS5I6/zYtZTphAQjg9h+cRoV0KUI6SU3
         krjNmJe49XJPIl5Ade/lEAxxHyUkPNb00Di4h7CCTcGaNrbrE35v1/t8sjiezuMLgWhK
         QTI62rIquIJShWCfb0uD/Fqp62dFfcObHB99ZheTTF7hmS0BOWoXeSR5uYayyU/lsgDD
         YVljWn2bJKhWtJJs5g9ptc4UghfW9Tmb9NeyBy3ej0+tWwiQXl8L02LoCVm1bVZGEAV2
         ii2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780405292; x=1781010092;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vaZKnmJ+/6YVnHKIJqf9z4v6CXPf8LxE9YwKtDn2GLg=;
        b=mkHXUHAOBh7Xy+RXBfwD2sLsM8kl80JZ9V0Ekc5wEXJUF3TSBApckiTcd76xu6Xa3/
         LCohSN2l5kJhW4jfS3voPPaeY/oDjA+XeDCank8f/X5XRA+0p1HkG/PfUNNjyIYM8q7P
         Mo2/zhR4GgOzGcmsI8gStEMepjwbKP/CLIxWGw/cm3UtGxOKAw65qPqVpSBon4aTsHL3
         a3E1OfU3876nRKB+h2OKpSpv++vh0G2Rn+D3LJwKHaMinqH75ICc5I4Mnz9Lth2pVLyA
         8zv+b7klToH0U4GPDfSGEWlyl7r3Xr2jWNlAnAbQjns/aHrgBdPLsPwUUgheHoK2Yo5M
         Zg7w==
X-Forwarded-Encrypted: i=1; AFNElJ8u07qyVFUn/e6znl0dS1MDw8LK8hqWFWlt6G6SuPhpK63DueVXpQHwX8oCR1IKHyowbE8CSTmt7oAipw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzlthq1Fste4pP6lePAw1W/CUvRfPpXcBCNsU31a1nx9AaAvFcr
	dffJlfL9jLaFKLl4nc7FSFkSREXqJn5RpsIIZWpyzNZwfQYe4zDD21m0+Uc1dYkSLKOBC2x86d2
	BA+wiqAzS+9bfA3iWIYAtiAMznAO3hPC4CGyMAijttaBb0bGfgktQ4E0ue4tl7IilxA==
X-Gm-Gg: Acq92OFWJSbvGXJoxLkXf1+0SoV4xs4iAWxYT6VboQ+CnJRwYDibRqsaqyZpBVV3MpR
	KFOU2mwvNoy264/InLZItOec2fn78/6u8d7jTN9gYUiRjpKFdXAuTxzHALmfXOLLlgf3/tKbK93
	xXwMCEAyU55ZeZTktpTCf3u/PHGStabBAbEbG1ue0tmHX1OEE8Ltrbo35fzW75ck+M/MkpJtxLx
	xEZN+0qzW07fGlCN+ZBkoqS2MG2zEzip5SijXButCMkF+zL0dfmZSh33kfDyi76auEl2pq//6tK
	L1Y+IUZe0eNbd6zqG/WYuOx4aLNmtK3XHJQcsxItPgjbrBxBcLHUZoHbUE2M2ygc2S5kHfFghXd
	7hUIU8RbseZO4mYGYOHum7PvGI4yJjxM1bbRJz15qwvmUzeV2fr2olxc4PA6m2av4GIB9tAp9Hj
	iqUfuSvXCENgchMdF9AQydsRm40cuMbZ38eE/CLqbgMUHC5g==
X-Received: by 2002:a05:6830:310c:b0:7e1:f7e9:327e with SMTP id 46e09a7af769-7e6a1e99c53mr10989328a34.22.1780405290661;
        Tue, 02 Jun 2026 06:01:30 -0700 (PDT)
X-Received: by 2002:a05:6830:310c:b0:7e1:f7e9:327e with SMTP id 46e09a7af769-7e6a1e99c53mr10989198a34.22.1780405289544;
        Tue, 02 Jun 2026 06:01:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa5c8735cesm2646349e87.19.2026.06.02.06.01.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 06:01:28 -0700 (PDT)
Date: Tue, 2 Jun 2026 16:01:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Baojun Xu <baojun.xu@ti.com>
Cc: jwboyer@kernel.org, shenghao-ding@ti.com, linux-firmware@kernel.org,
        13916275206@139.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] linux-firmware: Add RCA firmware files for tas257x
 projects
Message-ID: <qxtzexchvsmvdftntbd6tfw4ydp5qqdox3isuqlscp36uk7guo@lmp3z6riwffj>
References: <20260602091800.6237-1-baojun.xu@ti.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602091800.6237-1-baojun.xu@ti.com>
X-Proofpoint-ORIG-GUID: L_iZRAFRUgLRzGC9R1MeEGt-PtUHQU8y
X-Authority-Analysis: v=2.4 cv=GYknWwXL c=1 sm=1 tr=0 ts=6a1ed42d cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=p0WdMEafAAAA:8
 a=BecvUixRm46hVBx8RukA:9 a=CjuIK1q_8ugA:10 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-GUID: L_iZRAFRUgLRzGC9R1MeEGt-PtUHQU8y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDEyNCBTYWx0ZWRfX1psRhjxF4Ulq
 y1AmhqMGLP/n93x8ZVHFBC3PvNJZQiaox1UDzHdIgYRnuNQuY+KFdnohmQw+FE3lsU3K7Qd74NQ
 bw9SfoDFeX9aTEWAn4YmhbyIriZOWhcmDwL8V/lot0qANlKfPTzhW7IfYtU9UeuALO0t6Ob/7X/
 ikwo5mMSkVO6BYuRX+93jCwbAQodJ2EMwPvl2RKe9ZX4h3X9jbQJ+N/Z/sjy4JUf2j1iDxvchWC
 alTn177jGvYSB5a0YmQgRM8QTAAgeN2LqUsfL3LFBl7TRV4gIjjqBmwCJo6+Ex5RuTiu7nhT8Y1
 TtfSrmJS7uo9pmo8vEgVdeufeOxAUkfiRMsnk9ddlEHDCEd+slqyusGqjgi6h42djefXlpFJcm0
 KIFR6jVcjluz2ACn6TwKho+x8SKdrWRVTRUQsdkw9zncXbcClIoO2LThmB4+D4pmnaGt1tiG2EI
 /84T8WYWeSAlnucOeMg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-02_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606020124

On Tue, Jun 02, 2026 at 05:18:00PM +0800, Baojun Xu wrote:
> Add tas257x directory and RCA binaries to ti audio folder

Thanks, merged and pushed out

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1074

-- 
With best wishes
Dmitry
