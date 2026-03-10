Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3BA42AB7
	for <linux-sound@vger.kernel.org>; Tue, 10 Mar 2026 00:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773101120; cv=none; b=NfgIY2b+MuOUyoP8TR6XR4HnS+bpLijst8ddaUbEGBDyDcFUZHhThWrSODr/eHgjMmwPXwkXOcQesUnUIGPOO1mDxoARH01x7dx0otDkRECm0+mvoxo2LaG9mfhGIVIiaMfywF9LqePMjBZFXnjaCXhZSiZf48c7lATyRo3Sldw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773101120; c=relaxed/simple;
	bh=paV0mySP+9zV+Seo8jQCZrnwwyWiH+HvD8a4nb7UkmQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uqj8L8dqORsSiAMhl/+z1HqoJ2A8bOB4gLoqkJ0JV4k0efkggx/E/rRdx8s9CDc4PVwZ0wdKQ7BnT/co+KKcQ8/goZu23XO1v8lqR7CkXVFFBq+JhOsuKE66/x3v0DpQsIpLJYU+wAYIfA01A/jVhSUEYIE/cDtIRPoSsLasHXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vr9LnGwX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IEKyPCga; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vr9LnGwX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IEKyPCga"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HBmQO859614
	for <linux-sound@vger.kernel.org>; Tue, 10 Mar 2026 00:05:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eq3YR8SJMJVvMJ+9JHxKSwsU
	I6gefV1Keb8jWt7Lh3M=; b=Vr9LnGwXIh56NKbRnXZ9oGqugFUK4IhcHRzvq3a5
	Un6ZQ8s8T1noY+p3OJ7nIlI/pFkfv3cYoEM4U7/xltLCa4Z/F2sl289yNUEOLOBa
	Z3BMufsHHwruxHaeqjTrfm6GUyvtFJbg8+zVVlRX1F67+pZN2/f57ytt82EYhETZ
	OewgGpdBKuqvpKxd0OIc6KSPJV+25un2J5yp3XmPiFYJMQ+y92q1SsXDbwt6Jmi2
	8hHVAJIACjd7Y1J5B9g55NXaSqTp8r6jKNbRIKYDA86kvmEp8GZBpLP2wJWX4hO2
	SEac3DT7Y/5jRBWsKq2SbbWyH2StPJI5fzOoVYyq7M6BDA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csyhbsss4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 10 Mar 2026 00:05:17 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd91c0262fso418207485a.1
        for <linux-sound@vger.kernel.org>; Mon, 09 Mar 2026 17:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773101117; x=1773705917; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eq3YR8SJMJVvMJ+9JHxKSwsUI6gefV1Keb8jWt7Lh3M=;
        b=IEKyPCgahhLNOYwIRYrp6obtaYlFz9T3SDLUehQJBGltxV095bNZzBrpP/jVL5ZTAS
         jgmt5F9xIt/VIYW57QEpxQvcdLV8iDPxWvgVcR6+oAmzQufz2o6MNlitWqPSrntIwwRH
         M2uKN4sUgSRb500FzpOkCuWpTMAf1WklX82PUux7xfWB99V6MvBXCMdOG4O72O+FI45h
         YcDp89HL7I1prjUa3YcDol83vDUJZWv/WmiaQWYKCyc4SNbhMlQ7xSF383vcZCBIa8E1
         SX6bCEKXgfEug8R/wcIawJAHb95wBG04DGpkJYHN0ICvpe7muCVgn55tZUYbSKy0fXt+
         NvCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773101117; x=1773705917;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eq3YR8SJMJVvMJ+9JHxKSwsUI6gefV1Keb8jWt7Lh3M=;
        b=UJh6J5R12oeCv1DAXEi5lS1yWN7a9mj2rB6Oc6RHmk4hjafZQK0xx6YN8qZC1ypKpN
         bN7XKDo8dKSskS0rvVPP+/OL42AMTnoUwNPlhWqvzHiTy3YcEg4DAurWXPRDKX4izftW
         pSJ0MSmuO5dIzBDQwJlGiDFvewfdPPS5XKNr6WpS0CqRN8AhLjVrSDT5mhKuAZS7yy1o
         DD7PGVwW/pNfD1GfBE95zV8lGM1eUsJ4Fl/gaiv7QOOKTyqHQ2TcLOWfo9F9jBD/UIsL
         EtnSYZXJVZyaFXdFAdmlz/YTPk7wQcPhAkGQdHen3fZB1yc2J0Fd1L2LueRW65zgrsEu
         6TDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWunW/dTGN4wib4cbYJY3RW+YjbWIoOmhVIysK3xHxyC+JKdDyXUVJ2aH5rFVpaiO4sQ2vYewHrrtR11g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzSSOxK7SgvWLkrDQ1yOkoFCz9K/tAnZAiwXloFIKToboA1hLHK
	kTTKEzZ/C4Eut51QS0RkrtyZITyFrGG7FN4v9WG4CTzfonykHzBD0PVIYl80lKQqBPVuLBw02vo
	Scur3BO60zxrHDfR5bo3n5kjOCUcSc7bLXtTnKqVb+MjkwvQzBeZDNdMiYKAv6dLbaQ==
X-Gm-Gg: ATEYQzwnS5UHjhwuoN0tCYfwndhF/l1DBAWADRGE3CMsFrC6fEfkTmJX5VlUYHKqjfw
	b0KfgAagfYq23dNPsPkxxF3+sytlk4mH2GcZQbHIf5S7+PHhGXqeh6v9YA38okjrWjDOI8berJ2
	nDUr9UMmrtxCAfPJGw/SIDbtAD099/+jymDnLfOQJDpjxpBsj2icpxgp3IPPmhhVV/0z7iOwiaj
	dirvPVZ//nVBoifvx12sMYFpc7lvMoqtzSfyhSkbEeykQviXDEYhV4xuodlxyQd2/GgTezSrXwQ
	FpqbuBxm0y3A9spSoJxrQ33JuV9pxqkYgNlxuXQ7FN5IMaZXqmIr/B6aP0VN+RsZiuyiIFXkA8W
	2xwNcktgPpCUutcYKTBb/+Omt4Uv9TqdxgAc93fIJOTmBpPUX81TTbREOnPDoTuqAf6EcCjsHAc
	WeteUljE6ho77XIt3jxx/X9lqfoe1JUJiGuo0=
X-Received: by 2002:a05:620a:1901:b0:8ca:2e36:18b0 with SMTP id af79cd13be357-8cd6d4d5b1cmr1601782485a.39.1773101116990;
        Mon, 09 Mar 2026 17:05:16 -0700 (PDT)
X-Received: by 2002:a05:620a:1901:b0:8ca:2e36:18b0 with SMTP id af79cd13be357-8cd6d4d5b1cmr1601779485a.39.1773101116549;
        Mon, 09 Mar 2026 17:05:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13d01cf6fsm2324914e87.11.2026.03.09.17.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 17:05:15 -0700 (PDT)
Date: Tue, 10 Mar 2026 02:05:12 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: konradybcio@kernel.org, andersson@kernel.org, linux-kernel@vger.kernel.org,
        Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Kees Cook <kees@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-sound@vger.kernel.org
Subject: Re: [PATCH v1 3/8] net: drivers: wireless: ath: Use the unified QMI
 service ID instead of defining it locally
Message-ID: <6mm6z62o6xlso7mxyelx5zho5iowh5zfa4tlbfsexrb6vohzjl@citw4jcjsgsn>
References: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
 <20260309230346.3584252-4-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309230346.3584252-4-daniel.lezcano@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Rcmdyltv c=1 sm=1 tr=0 ts=69af603d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=n3fwWfvLsPu2TWPVUDwA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDIxMSBTYWx0ZWRfX6hNWzrhmjmWV
 RsgU+wmUq1fIFZs53EzKBwg4RQ0K6439k23l5hvAsxRb+N+/Gd/txEpTUHMuAxfQQkpHFwIOsaX
 8OcW0X09hYy82+FEnVLq4OEphhwaFBpiTlhxQFoJ4UBGdOnONUCN4cp6/taf+NT6VQb2U+18hyh
 5X7FoX0LvVOXdg0N9aDdlF97xzWNswTOBmfyUkhlds0fqkr/jBQja9oME2SJmxLP2zYgmPDKBwY
 4ec5avOBH5+43NC5W0V0/gKspfdhDOunBiLgqCrfvhyUy9d06Abft4BqfXRg8yKwfQFAREsAvCV
 S4YALODPf2UoMThHLBI0MbLULxEylHpxRSaEXgDKMR+oovhG6/ih3LLbPgRpVd4pP3DWP+QeE6y
 1BKGd0ZzRscHt/xksgjEjzO01iQimJJ/MWqqJlfaVVcTShHo/sOGyB7dLfCbqHP+kMOp64XgZDZ
 DC4BT/fsZLz7fjIffcA==
X-Proofpoint-GUID: Gj1KrUAn48WeyTHv76UVRuWmko02mH3y
X-Proofpoint-ORIG-GUID: Gj1KrUAn48WeyTHv76UVRuWmko02mH3y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_06,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090211

On Tue, Mar 10, 2026 at 12:03:32AM +0100, Daniel Lezcano wrote:
> Instead of defining a local macro with a custom name for the QMI
> service identifier, use the one provided in qmi.h and remove the
> locally defined macro.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath10k/qmi.c          | 2 +-
>  drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.h | 1 -
>  drivers/net/wireless/ath/ath11k/qmi.c          | 2 +-
>  drivers/net/wireless/ath/ath11k/qmi.h          | 1 -
>  drivers/net/wireless/ath/ath12k/qmi.c          | 2 +-
>  drivers/net/wireless/ath/ath12k/qmi.h          | 1 -
>  6 files changed, 3 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
