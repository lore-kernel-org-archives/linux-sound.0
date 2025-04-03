Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A672512D4
	for <linux-sound@vger.kernel.org>; Thu,  3 Apr 2025 16:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743697342; cv=none; b=mq+mg+F0l32dEa8LkeTz1XcXCX9UGyLPrMA0ddNmbUQEqPv72n2YEQfzhG7sM8Y67nVez94VF3PzZrkXtv27NMap4O4da5SKAuulQ6S+JhbxbJdv44CFFJrzO70ZfPBL7HWP/FtJiMvGCnsFTZTa/kKUCwVAm9Ho3giYFqF3ZN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743697342; c=relaxed/simple;
	bh=Idn2TfVzRRLn92uPIS/0vao33NCByC0CnVRf/UX/0js=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DkutpqSMnqkADQ0cxbgF6xksAI+JrdfTbp9EBBXY+dhTZEx5yjKw6Oqm8N4eFcazwGXab0WdiiJpPjFNx3Twu9MFkAJgy+B6LJylzo3w3UJLIwTOEebB4notCYbhDu6tZIxZCM73ZZTDij4aQgmqzxF/WrL38jB75fs5lhBGZY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kbiyfj7F; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kbiyfj7F"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 533FV7Gf029904
	for <linux-sound@vger.kernel.org>; Thu, 3 Apr 2025 16:22:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=a4ZiUBpEMErH6vhZC0bvf+Nx
	MJ405qBza7xtHCdCF6A=; b=kbiyfj7FxcvZVRDu1TkF4gr23XPokr0wJ7bZDwRo
	65aaP7zPnU1u3Rkz+5UIaO9Z6SZ6ykx57aLPUsVLnCwsHhvrv5KXrzIrU3OnPOQM
	0mYC+EU8QdzRzzIz1A1J7oeW095AOoZMwAIlXSy9GoYjpVwHD0IKy/QIAwdvw9CD
	7NBNKOhWAXaAmn4RkYUkCDraDMYgVO/11KTXwTahZpg6PZmCqhUuss3nbaaf/4tf
	R9z/tBPZlNAldAX66qHMicJqGQ8jEdMKmc8oAmLqwvOL/wsrIpMmC/9Q8YTpYhHl
	I5tix2QCTG4xdw1se3t4xfgPI8THLTDEOJRldVd7YbMppw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45s36a48nf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 03 Apr 2025 16:22:19 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c54767e507so174593785a.1
        for <linux-sound@vger.kernel.org>; Thu, 03 Apr 2025 09:22:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743697338; x=1744302138;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a4ZiUBpEMErH6vhZC0bvf+NxMJ405qBza7xtHCdCF6A=;
        b=FJxtBdkY9VkPm7+aK6QA4ZPNoiTJQThEYYo2EPEiOCV8afK98nra4xt3qDylqxUPfy
         RDDkNRrGgn0yzEAVZl2/wReopv7BJowJXo/yZgO2PtcZRrP6gmYvZDhMQzyNxi5wfPEY
         dtihf/AnZG9ddlVubhLdJ0htvZTl80EiiThJ4fbyBAcOE+Rb++hDN+O9VaqwgtMmNfGQ
         4ILIrDkI4c4vXbNU6H2ZSlMRK9HM8M39FFVRru36kUt50a9k3hNu3g5WHClv86SLhdeH
         9KZYV8RIxSL2C1tlKCoyT/YzIG7dAaVjXhFDD5X+MZLwrZwD3Rn+NRDv03JpQuMlQHI4
         jpBw==
X-Forwarded-Encrypted: i=1; AJvYcCUPfIhHiV8uVJUPvvxEkL0mXkH/hYn8UVCUHZHqhndou41q2FQ4nThV2QqX2+8dHpZw8KgnnJtBbg+u5A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxsGv9mXeuO6+bITZ0oO7U9GqCHF0C8A08YnfSy84V/KLTimhLN
	r77+uWnIIVO7rBvZTshotzrZNhJJsBa8eHoIQi8gVGtxkOvDYmc03kIklkgAYxPmSoGqqA8czot
	ElK/WxctNDeTjV7OGQ8ohrTCNLTsgnKsraZ/hChnj+Y+K4HwPfgV2hKFt5jYwit5ngWWrlQ==
X-Gm-Gg: ASbGnculw4WTfVb6TjKAXibhHQPPNBgvi3UjBveN0S6WXx/IRvbH2jti+lvv9VxLYGB
	MJ3mzcS2YOepyAgw9b1yVLMBDrRErKITf6Z2lTJOkkplEYfRE60RvSk7qZV5ta2mjr/RtOo6k3p
	41MPqzcTTnqD7rEXJpYRHJ6EDMHrjyCMfOBNRKwLSLWXiIpMinpxo3/f9QnT/9NQ/SPUrRTd2lu
	ApPdylc7ju4dJ2pTBmM3w7TcIdcEJxKKUe2Eg7Q+D+1Shd5rqdexewAoKIBcx+N39++q/Vc7DpW
	qzZ1oNy2pSFigwflNggUg7x9RNpg87iK2oq5BO2/15hd+rIRqpsr0HUibJAZ/wvDyrlthVDJC0H
	37Ms=
X-Received: by 2002:a05:620a:2801:b0:7c5:5003:81b0 with SMTP id af79cd13be357-7c6865ea99fmr3047300885a.23.1743697338566;
        Thu, 03 Apr 2025 09:22:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEkLhLG71dtjwxNTqmaM0NknH0c5V9tBLqCnHK8weksJGXsW38VvS3W8gt0C9UKJrHhUHuRrQ==
X-Received: by 2002:a05:620a:2801:b0:7c5:5003:81b0 with SMTP id af79cd13be357-7c6865ea99fmr3047297085a.23.1743697338145;
        Thu, 03 Apr 2025 09:22:18 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f031bcd9asm2659021fa.71.2025.04.03.09.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 09:22:17 -0700 (PDT)
Date: Thu, 3 Apr 2025 19:22:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: srinivas.kandagatla@linaro.org
Cc: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        pierre-louis.bossart@linux.dev, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, Manikantan R <quic_manrav@quicinc.com>
Subject: Re: [PATCH v4 2/2] ASoC: codecs:lpass-wsa-macro: Fix logic of
 enabling vi channels
Message-ID: <ypt3vurwlmyxkmba7lrmgcmpeszx2afbqp5hwrdwcliwcf23ik@jvg45kffehxx>
References: <20250403160209.21613-1-srinivas.kandagatla@linaro.org>
 <20250403160209.21613-3-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250403160209.21613-3-srinivas.kandagatla@linaro.org>
X-Authority-Analysis: v=2.4 cv=W6M4VQWk c=1 sm=1 tr=0 ts=67eeb5bb cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=uZvtCs0-YMtpQNQJbqIA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: n3Bg9OdNGo6kpsgeHtVhIk7VFKNAl1Qg
X-Proofpoint-GUID: n3Bg9OdNGo6kpsgeHtVhIk7VFKNAl1Qg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-03_07,2025-04-03_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 adultscore=0 mlxlogscore=555 mlxscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 phishscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504030081

On Thu, Apr 03, 2025 at 05:02:09PM +0100, srinivas.kandagatla@linaro.org wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> 
> Existing code only configures one of WSA_MACRO_TX0 or WSA_MACRO_TX1
> paths eventhough we enable both of them. Fix this bug by adding proper
> checks and rearranging some of the common code to able to allow setting
> both TX0 and TX1 paths
> 
> Without this patch only one channel gets enabled in VI path instead of 2
> channels. End result would be 1 channel recording instead of 2.
> 
> Fixes: 2c4066e5d428 ("ASoC: codecs: lpass-wsa-macro: add dapm widgets and route")
> Cc: stable@vger.kernel.org
> Co-developed-by: Manikantan R <quic_manrav@quicinc.com>
> Signed-off-by: Manikantan R <quic_manrav@quicinc.com>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  sound/soc/codecs/lpass-wsa-macro.c | 108 +++++++++++++++++------------
>  1 file changed, 63 insertions(+), 45 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
-- 
With best wishes
Dmitry
