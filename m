Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB3814266B5
	for <linux-sound@vger.kernel.org>; Tue, 10 Mar 2026 09:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773136636; cv=none; b=fCf1v3va5byw88yOIeZ1ZrvZFnQ+ke/LA5uQxWLrMbBWCVv30Uloz6OzpiKTjMH9Tzs+3QaF/ZIrfSy2hdGsfzjuyyMuOQguwNhQaAWUwf1RVW1NoTl7yPzPnwmh4BWdd0iTPRqPV1iBWT/jQEbJZH+iELFU3UD20pFiTACt1Sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773136636; c=relaxed/simple;
	bh=CbrtszZqY4+hGNS2oDyG5DABGwPuACbTE4Q/fV3gqfo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JFikob95yNemT/PhIAEelM0dcbMK22TjTn02oBxFEO+4ki6eJLDike7NyxbqV10JRddKyxgwt2Upr5QP4/itrrLhFes8gfZXAOuI0Y9tDZrnLiGINmjjmU0HQ2T8WHGNACWXVroo+ljsuQ80M/elM1wCp7jLbuAV4nBHYl3ukHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bM29PPBA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ArEKpWJy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bM29PPBA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ArEKpWJy"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A7wb5j3124736
	for <linux-sound@vger.kernel.org>; Tue, 10 Mar 2026 09:57:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6oJ8QQt604h4CfSsQepU3v+GHYIoK3WGwrJxaSWp0RU=; b=bM29PPBAOfK0D3uO
	ml3hIfgefl30u0LjMXnpy4nUYL85G/cEds2e5/kBbiqC9ctGt0Rg9xewFlv+bowf
	xpYjgzSj4Dy9TPBlCmBXYexZkzHfOvRwjBz2rV8i+Mt4PStfAt7DZC/nAmt9Nw15
	/IGuGCecOGf3hN8IV17tfwr8mgJTSUIyftSW31id2pZu+r6nMd6ce/24ppxrZZqs
	r5rxs9J+VWOU3l0Jo8Yb7aWIKqF9nwiw5pdXy6MM24RTUDYRr+jGa2UskUuovWFO
	AA0dky8LS14sXa2uBNrJhVIdFUgWK3jNdtKlMooKWWw3+2tx11hsreyrcc0kXql3
	/YvAFA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctfcj0f37-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 10 Mar 2026 09:57:14 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89a04e9d4faso46165676d6.1
        for <linux-sound@vger.kernel.org>; Tue, 10 Mar 2026 02:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773136634; x=1773741434; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6oJ8QQt604h4CfSsQepU3v+GHYIoK3WGwrJxaSWp0RU=;
        b=ArEKpWJyFDPARN2QSllZaqbY9HWAmwd/3Cg3SnODpsC72CEut8/KCY73tsNcL+csxu
         kDsjVGVXEMGWs2GqAHPmtLwiMdcy9bRCfw+SG7OLJT9/GPYyjNdot9WtqOL1RfhvV7SD
         WYoxZw91Lg68k6XRWkriBQYdVKwOz9FnSeBP0EHq/46dZDEpS4EGJrAhm1ZYEpPR62w7
         kXd086gX+qftHKlI8zZB9w43vZlQLTbcGQK8jAD7ENr+Tf9ZgE3oU8FW6kFfcxljubcr
         Z3Ua7ttZH78jZlZ+KC/OtTL/TcLUPx3YzFasX8sqhBFhsNDMjQ6LgA8iNTc1iTx+q9qy
         FTAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773136634; x=1773741434;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6oJ8QQt604h4CfSsQepU3v+GHYIoK3WGwrJxaSWp0RU=;
        b=q2amleIUYGYJiJdvgIu6mUp8n1Xh1ARHwsfNvE9LGnaoJgmchRVn/HKiBURXLH3Pt7
         OmwjishssItl1X08GldTPnfrtPWbIZh87YGlH9haCBb3DuEatrxDAeoKIYmXGJFOR5rT
         FkRfUsDEOzejqBuGdn9KEk66nknV4wLPFHvS4QqQEegtzKw0cjXlfP4SCG2NR7TX6f2k
         Z6N+OETIAn2R7Nv9E/dZrwc53J7uNhoUCnuExYTnAoP1m0aYtiCmSbpRLpFDQbD5eLan
         7B1CmOovOinnb0KtSc1/i6XpDyBtvMI8vymmnzWdtaLdlsjrmXzMCQToecf8KfajC/3m
         Hp3A==
X-Forwarded-Encrypted: i=1; AJvYcCXhZ2Dc4shTsDqAtWcwXT0MLvzS9W46XC8KoB9tYE3JoPQP+H0X3nup90GIi2n6j/6XSI0hrNmGBNT2mw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyrjEHYuARjhJKb2sLVaUQ4ID8PO3qK3fLrLK8FaAqnKy6Eys4F
	oj7svVXOr+x8URlW+EQvUWhulKPovA8Dc+sl8FXo7tQAWcyqvu7m97fuWKh/6VkaUdiq5CE0yYr
	uhdlbsbQfZQBJDAnsDDVoSwAyhB212vA/QLbrIXmkGpFleNJJj6pwgT84u3roQknrOw==
X-Gm-Gg: ATEYQzwk4ezhLZYvs1X9G9rxQQm3eBzE9L2Pj/X5FkI/ZaHM5EQukAq+8Zmyd83SH12
	+uBrAVEM6q8s4oGEBGMkXha1BNyv8YMMcf14Xm+Lowx6WI5fvDMzvAp73D5KCtlRgqel97Rn0NI
	qkPIu/MlxUOZqt9Hsas4Z3a9lhzRwljh69WIlL+Zpd5KVbCojkPmAd2JD13kwSjbSI7mOmTPCfC
	t2WKgj0z5WNStRKGVue2BS9U/ictLeuFe05i7K06/98LpxgJjpfbiTs0DfCot5UlA73IAxcK2HG
	GZcperZquXdhiQi73Qs6J6j27ud/8TLpAHFfZ11s/6NFZJbzv92eBmJOQJN+rxIvhvTG0GGyRK6
	Nty5TZT58iwqyuUQuBAjQZFoCvvs09nwf64f08VAov4P0ns4n/YP2Zx+9pUDL3wBCzNExla4bjn
	2pM2c=
X-Received: by 2002:a05:6214:4e1b:b0:89a:49ba:b58a with SMTP id 6a1803df08f44-89a49bab894mr82170256d6.6.1773136633822;
        Tue, 10 Mar 2026 02:57:13 -0700 (PDT)
X-Received: by 2002:a05:6214:4e1b:b0:89a:49ba:b58a with SMTP id 6a1803df08f44-89a49bab894mr82169946d6.6.1773136633432;
        Tue, 10 Mar 2026 02:57:13 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b942ef483f3sm447860466b.9.2026.03.10.02.57.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 02:57:11 -0700 (PDT)
Message-ID: <7d036c96-e257-460c-a91b-deee0b9c348b@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 10:57:07 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/8] soc: qcom: qmi: Enumerate the service IDs of QMI
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>, konradybcio@kernel.org,
        andersson@kernel.org
Cc: linux-kernel@vger.kernel.org, Alex Elder <elder@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
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
References: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
 <20260309230346.3584252-2-daniel.lezcano@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260309230346.3584252-2-daniel.lezcano@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=H7fWAuYi c=1 sm=1 tr=0 ts=69afeafa cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=7MBKnE05AAAA:20 a=EUspDBNiAAAA:8 a=Lti85_ANQs6YWTYAGLkA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: BNCD_QZEi_YQoyqT_AsjbOl1iAxe8pvB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA4NCBTYWx0ZWRfX2EEaWDBj/H1z
 urF6OKZXPfxrOrrZZV4/ZQ3h2cajnTYPhrygDs8BmT6k5uPArqvKk/rCL1LPT6K7zFM/ucI46IT
 uLmA8mk36kODF51eE72IHk2Q+VynpBc7DKELpsN49F7mmqr0+K0XJ/GgzHWDqcvoYPh8ByeuXYM
 yGY/XW9XVhKRR+Dt2EJ5tQnCjP+o0UkfD0jELLe4WMXJB3ufqNo91RjiT3Rhmz/NBAm0La0MyX6
 wY3ScO9s025RfXNon1Us1dUpaE0BsuUdnOSv3N2B71SLHblmR+HiXRRsxygAuUatsz9abMomyWH
 Of33ko1DYGUXVcTeudgmjfNVF4dCFQ9tr3x77byhEa6JWi00SHgjYQpDC3f2D0bJtBRAnd86l79
 ieNsml6Py3caiA+n4f6H4NTZino+M5ZcjWS2mrLxVquDi12AbG1RpCrXHOKqTwzkdY4O+9MiiQQ
 /Io136uiPaboPuuXNag==
X-Proofpoint-ORIG-GUID: BNCD_QZEi_YQoyqT_AsjbOl1iAxe8pvB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100084

On 3/10/26 12:03 AM, Daniel Lezcano wrote:
> The QMI framework proposes a set of services which are defined by an
> integer identifier. The different QMI client lookup for the services
> via this identifier. Moreover, the function qmi_add_lookup() and
> qmi_add_server() must match the service ID but the code in different
> places set the same value but with a different macro name. These
> macros are spreaded across the different subsystems implementing the
> protocols associated with a service. It would make more sense to
> define them in the QMI header for the sake of consistency and clarity.
> 
> This change use an unified naming for the services and enumerate the
> ones implemented in the Linux kernel. More services can come later and
> put the service ID in this same header.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> ---
>  include/linux/soc/qcom/qmi.h | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/include/linux/soc/qcom/qmi.h b/include/linux/soc/qcom/qmi.h
> index 291cdc7ef49c..b8d07f2c07e7 100644
> --- a/include/linux/soc/qcom/qmi.h
> +++ b/include/linux/soc/qcom/qmi.h
> @@ -92,6 +92,18 @@ struct qmi_elem_info {
>  #define QMI_ERR_INCOMPATIBLE_STATE_V01		90
>  #define QMI_ERR_NOT_SUPPORTED_V01		94
>  
> +/*
> + * Enumerate the IDs of the QMI services

In case that's useful:

https://github.com/linux-msm/qrtr/blob/master/src/lookup.c#L23

Konrad
