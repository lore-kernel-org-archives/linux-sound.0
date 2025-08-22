Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B03D2F49FF
	for <linux-sound@vger.kernel.org>; Fri, 22 Aug 2025 11:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755862094; cv=none; b=W8NiElztHNudHnRVElX/v7ZucPKFRps3Z5gkAZ/69LGTr893GPIUU17cPcHGPRfKnH6CxLBkIRmbEK6T4zEAWWw3id4H1dj7/3lqk3sInBNeb0QmRu4EHxAuLnlPr52ojPaxuyfRudxaASYbba0FMTO0sykrC7p34T5YBjWXUO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755862094; c=relaxed/simple;
	bh=+z1J6cCjTp4cVVZFfPJQaGcyBnTv1CpWlH8yDx6pxfg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cx/Zx5rZxdvVIc5rjfXbTZr1sYj76HK5nXorYZpnpwmefQruRHCfsRbhIKaHCMTz5Kt54PigRpIxjE/9ieW8HwOGbP6u3IVY1iBRNxKgXc3YvFWs9F2sNxsbpQ9CSxz/9i9Fk8HVlUXm2ZEJaysluEpwvD6AkVQCldGZzlgQEB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L2eJNvS0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L2eJNvS0"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57M8Ub3c006819
	for <linux-sound@vger.kernel.org>; Fri, 22 Aug 2025 11:28:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HQz9YlcrsVzVP4cHdjwrgDoS
	WKhu5gMFDTaj+Iok/ns=; b=L2eJNvS0zWsr7Q1hBIQQoXynFZf0P6WCQv4SNOS7
	BWWrgCtjA/3wxq/M816xosxDI4D0lMXphZ0J0HM+zZiTgoPIDML1Vbr2jfoPnNnU
	rZiHWfKzKIRZ7IQnmVNSTLWAxcRboXvmTQuFGH1dtRT5aHzBK7mjb8XmpBCafvhg
	p3+9aJqRBJvZvHDCEg5zwBdrk05TuY+2ATiB9vsfajakJj0Quv422whZsMjenXzD
	+tTlkJvkI/v/nwMnA4Vwod3Tuk2xEZEPq9rMNEq3quYWuM1tVY/dG1LfrBU5xxuZ
	FcawWBLMWfgmyIzTeQiW2cK8z7nASWRt3xBvvCOoSg/ZoA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52910wq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 22 Aug 2025 11:28:12 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-70a9f55eb56so41747866d6.2
        for <linux-sound@vger.kernel.org>; Fri, 22 Aug 2025 04:28:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755862091; x=1756466891;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HQz9YlcrsVzVP4cHdjwrgDoSWKhu5gMFDTaj+Iok/ns=;
        b=QIC0RPMTR5LlB6YkRwhTF1OqgknNdCv2EY8F4eBKvj0j2lS0+JBZWJFGLMCVO6j7JR
         dGCdn+JFNptAoBViLLHQ0Sqbg07U7bBCvLYDwxdRF6JFg767sZ6zhffrlwaC6oOv5UZ2
         E6IzvVr7nUmEGxJ7BuX1l9MlJTbH4NkVID5/++pvB/IvFL26atNoRokcoxrbeGsJvYiV
         RPrd+m4VUWF7SjzP/wKdQbqShn0w1L1+86C7JCsJVbrxAfVr0qYd7d47FGb9uqQ7kba8
         JsJLr5Jd65iNjN1Kl/i0W8kJi7cCXgWYjX+ueqaXFUQATtDGilUyyI9YIsAK9Tep2J+T
         +9pA==
X-Forwarded-Encrypted: i=1; AJvYcCVRRhQPFfU7NwMbiCT5pBIhAzi3fgR2t7otnkkulA6snD2L1Dc/J+ysAdb6S/0QNuTWpJpJ8hDjDxihaA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwFbW8S49q2yl+qapVk13Bw32uFKpbU2oqYem0jf1yVlkNebaXB
	SGHNhUyF7o03PHy1BaBFBzRqKhFzRd5Y8Y0oubkJofzGlo1kVmOwrDWuKnERSeMSsSMVDkLvRar
	v8wdHg2XMGB3kckzjAmYJI3v3Mg9hR2dyFrniQ5Rv/dz0CMmoLQKMK9k4hzmD2LmwkA==
X-Gm-Gg: ASbGncukVVVL9FX2ZVy88Rv01D/rfvlS9rhyPxvCn0i6ku7NZnBaJb/7XG+MAZIfOo3
	Ief/W0du3cJ9mLhW26SWXSiBFEXkF8iQgsba5nlk57t33dQlPTTAf8Idmr37KlPuWOwUjy62c0l
	6LMTIP/u9+rnx+vCaevI4OB4aHymrsofN4vuuo24SFfpYouSSgig0EJLDvvzIOuzYsjNwad46Io
	hAvn2zaOCNVILYJleLLG6y93hdCBWRRX7roNQCy2wSpyKgzcdoS28fYAJ8PPD2cIHFAY2b85SKe
	uFvcZ0VM0P8o0rW34ueKNtokSWQh03MiWXS98213x1P0AnfBjt98ygT0z3JE7YyuHIL0TZ/KO+6
	eWasEynJetlJSXLaZYHYw1nx1QyjDdCLZx6EfHgeiXft278gxKvOs
X-Received: by 2002:a05:6214:d07:b0:70d:731c:c81c with SMTP id 6a1803df08f44-70d971edc63mr31908176d6.55.1755862091074;
        Fri, 22 Aug 2025 04:28:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQfRAzVUKYrkQDCJSAkHkG3B6Hn9CCgM8N73vWZyOY+0UMPseinW2ZJn20zITdxr8y3MuBqA==
X-Received: by 2002:a05:6214:d07:b0:70d:731c:c81c with SMTP id 6a1803df08f44-70d971edc63mr31907706d6.55.1755862090515;
        Fri, 22 Aug 2025 04:28:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3340a4742acsm36642481fa.28.2025.08.22.04.28.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 04:28:09 -0700 (PDT)
Date: Fri, 22 Aug 2025 14:28:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: broonie@kernel.org, perex@perex.cz, tiwai@suse.com, srini@kernel.org,
        lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        krzysztof.kozlowski@linaro.org, neil.armstrong@linaro.org
Subject: Re: [PATCH v2 4/8] ASoC: codecs: wcd-common: move component ops to
 common
Message-ID: <mmheu5fctvd47gmwilievo27suijuok7zr46qz5acti7vsrpaf@osdoa5ouaqwn>
References: <20250822104927.2621866-1-srinivas.kandagatla@oss.qualcomm.com>
 <20250822104927.2621866-5-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250822104927.2621866-5-srinivas.kandagatla@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=fpOFpF4f c=1 sm=1 tr=0 ts=68a8544c cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=DUU7LNq4FxFGKB8gttsA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: hA5eUhnKRiaO_5IJkPVDCyx-PRfMuU0M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX02HO2R56ngaO
 +5N8iVOESXcB1P72G7icaj30ssKPei4I03+OP1hlG+blZ8TAFBvK2z+Nu8lFVwiH8AIX+Rkms8k
 n+xaeUvE9VcPOmHFsziUIoZVPJZ/5V2dSyye8ZxVNXX2PiUUo0pforX+XUYoxVkiMp0pk/E110P
 s7FQmdRFymOdzOJ4MATTYuUp5hc2ARbcbSoXYedEopMGFN5SXVwcoabO8873n0YMhwZGws44mXP
 84FIsdKmAStq5/3ZMJX6waxPoG4XIb+04K7QE9iy+vD/JVgtCej5hxz79Gk49t+DAjY2Oa57R0o
 EsDjyPf1wPTi9W/7vgczdZ2lEDS72R1G9WfG97n9J+/qJrrPC2RobbA+5iUPKvJPvmfGyLWswU9
 sQ0q12yo8wtAzragS2Yx4drKEx/ACQ==
X-Proofpoint-ORIG-GUID: hA5eUhnKRiaO_5IJkPVDCyx-PRfMuU0M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_04,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0
 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

On Fri, Aug 22, 2025 at 11:49:23AM +0100, Srinivas Kandagatla wrote:
> component_ops for wcd97x, wcd938x, wcd939x soundwire codecs are exactly
> identlical, move them to common driver to remove this duplicate code.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  sound/soc/codecs/wcd-common.c  | 27 +++++++++++++++++++++++++++
>  sound/soc/codecs/wcd-common.h  |  1 +
>  sound/soc/codecs/wcd937x-sdw.c | 29 ++---------------------------
>  sound/soc/codecs/wcd938x-sdw.c | 20 ++------------------
>  sound/soc/codecs/wcd939x-sdw.c | 29 ++---------------------------
>  5 files changed, 34 insertions(+), 72 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
