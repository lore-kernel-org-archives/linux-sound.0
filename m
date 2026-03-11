Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558E631A061
	for <linux-sound@vger.kernel.org>; Wed, 11 Mar 2026 01:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773192886; cv=none; b=aOjRjts5zkpks5AvuaBXBhB4HqyFq+XIvvAOxDnIRACiLF5gg7rMU8upD+9VEXMabqjRmUuDHrOTPTNnnwE1Z9b5M0P4ARmFoW4fSnkPy7tkKylIk3CjJaUky8wJAgOje97LVd/4NKhX+xI57j1dvQP2n53rRdOULQktFx/UBSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773192886; c=relaxed/simple;
	bh=BvYgs0qZ6toKJFKhPFtvfzO/PJ5KPWmnR6gRI3OQ6KQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NXUNLY9RvWER+g+zXwL6ImkTkU6IBga9Z45eFfTNiAQGTW3AtTIRNvkaD2QGOiUlSu6h91qV14Bw9oZLPdJEhcl5EA0QXjr9msY1551FkabcDszwSyZu/XXct78MlRMgJBdISw5RSSt0W3GOKwuZeQQeR+0as6/qrobwy0ZmpXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cwZa+JlA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wi8T2pez; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cwZa+JlA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wi8T2pez"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62AHd2Gn2179907
	for <linux-sound@vger.kernel.org>; Wed, 11 Mar 2026 01:34:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fr+mKmHEmOU1zJtYrSEfTHIp
	QHWCN5N9LBxVDEc9HXU=; b=cwZa+JlAo44RvCZwO+hCer051J1+NGL8II2Ezhrw
	EmN4voWzCEgZdQgq6oPJZK6gmdi0nqwySTo/g+9d/kAGxwwzUmRaNn8KFr6qRpsq
	bdXRdMDqWpdtUA/PLqGJjgXUmUo+2NXNBMGCwc0LT5Ec+wN/V+zMc8uWf8iJL7Bs
	5zyiJpS+3L/O043tRZqsxEorfHfWc+c7Uvkpv6r9bqtk8E8KU+Jvu7NKWiHgke1Z
	h17Z47397tEtu4jo3i+I1taGNyB4VVSXnDcidJohcif+DgDeYqS7JGQE+dh6pv56
	VOT/FCFGXt/wIVeFV1ZDeAJjd5yF2G+GMb01IBw4XcqI2g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctqvsschy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 11 Mar 2026 01:34:44 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd7f6ac239so1995530585a.2
        for <linux-sound@vger.kernel.org>; Tue, 10 Mar 2026 18:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773192883; x=1773797683; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fr+mKmHEmOU1zJtYrSEfTHIpQHWCN5N9LBxVDEc9HXU=;
        b=Wi8T2pezj4JJlk3Daptz59DpEaK0Rl77XCdSyKGGFYjPDw8fEcK7SGJ2O4u1dVwmD8
         Uu79YiTh0PzmQR9imbVZT09+dX46bb0cirbAuVB8gqh2gmcjqU5LP/E8yjKn0QtzxNNh
         cDgYbMS8pq0iSr2BznVfLxpZNnToa29VQk/U+EEZm5bkMYC4WEki27YD0MtPOyPLhdAu
         IEB/1cbiC9vlX3NRqrLPX0RFAOrQ08DbBU0mNMA5txWvrb17Q49cvXzDiQRglHEZR4Cr
         mGBtoVEdLnO6A8lr3p78SkE6z9oPShzAv7MsZflhIZrtosKvYgG4XbHmo2KTmnKWiMuO
         WGfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773192883; x=1773797683;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fr+mKmHEmOU1zJtYrSEfTHIpQHWCN5N9LBxVDEc9HXU=;
        b=Ezq3AkbPPyWJkDx7jzdcvt3y0cDsAN0aGS/hGjnKcdzoyrtW/eDIxbUg0Tmp7uJDIY
         DImMbgo71JFGJEMiovWMhv0Bm9s7lyQamnB/1vnl9xOfRbiwdu55dqAxSPoPsknD5CDA
         dWh+MUHC5Xzh3SIenf4PHLxiOO14KuTA7KNkHakI+EOomWgIk50l8D0PrbOaYT9zshET
         3+70DkAXYV4/8aX99KMNYar4j41WAwMUyvSXAK82X2bqFSDpZ1b9cP325pNRIcMiMxqH
         FL0MYNn8qgn2hNGXDBsw006hWLs8wXSymULTBR/xhhRIQWwXoGpBu/szM9KRKjCjcb1v
         cspQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpWS+B1FgkEdboEL4AFro/3SAts2uWPCGLeydzeB0Dv89eU+PDV73wlSh1c/jL1eJ+DFaADGdVqcbkZA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyuEVmzK2TqZ8XC/CwVTH3klA7pG256qaqawkoVHJX/Sy3DgnMB
	imzz/TwGf9bto2DRWQxG/fyh/aHxiPcSWXd/72z/CimJ9wN+CIjOyGbD6u91TXCyiQ8Se5yyib+
	ZOLMujhastZIs4rtVwwA1B4KTJuxiA7DriVK4uvoN/mXY4XkuAbfOa1CgX11tvqcieg==
X-Gm-Gg: ATEYQzxWdwv6Wu+gwhatD/UDUgE7YlNMCCuIhhM0OhOSrNBZ4eP+LCfDxibqk5gw0JI
	tUMEqqHMaQGBVgQzTzvm5E/3ErrYCUpHxtLP8V9LzxAYqlLLOa0+lb+gTnSlWoZrr88MHQxfJQP
	ugkgl/Kzpc+JtBvR+i1XL2JHdNhNEO/DBgb6Hul/rq0mbXAZs6zGtzhJTIua/KFAycJGZVw+nw/
	3mQR5XKmjxmKa7XcQgPWBsWaaNmApHJW0NnUczv3y9uMozi2dtAFwuJRknay4NuFpD+3CpCP7y5
	3bbSMgFqSOQ+75ePz4x7rRwbXOfd8z4K2pipA/sQQtn+ggSXtqMwOEMTScj/iumas5hx5YOIVsZ
	o3GABqrptnRV6by83cuMTqkwcmUNfw7p+FoxvB6FNyV/PwsHRGlVP8xChh55IWW2u/GGHDyuiqi
	528GM5SQXsUmWWR8ufjrU2dMsk9I4fDNn22oQ=
X-Received: by 2002:a05:620a:31a5:b0:8cd:9a1d:4f1 with SMTP id af79cd13be357-8cda1a89e84mr129679885a.80.1773192883496;
        Tue, 10 Mar 2026 18:34:43 -0700 (PDT)
X-Received: by 2002:a05:620a:31a5:b0:8cd:9a1d:4f1 with SMTP id af79cd13be357-8cda1a89e84mr129678085a.80.1773192883105;
        Tue, 10 Mar 2026 18:34:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a15635829esm131270e87.66.2026.03.10.18.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 18:34:42 -0700 (PDT)
Date: Wed, 11 Mar 2026 03:34:40 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vinod Koul <vkoul@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 6/7] slimbus: qcom-ngd-ctrl: Balance pm_runtime
 enablement for NGD
Message-ID: <fusum3ildpm2epfipamzlttb7oyopua6bt2rl2kfh6jjtl52oc@mcy5rcbpim7i>
References: <20260309-slim-ngd-dev-v1-0-5843e3ed62a3@oss.qualcomm.com>
 <20260309-slim-ngd-dev-v1-6-5843e3ed62a3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309-slim-ngd-dev-v1-6-5843e3ed62a3@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDAxMSBTYWx0ZWRfX0AA2uk7Z6C7V
 f/SQ7SlEc2bjeyjflJtYD+XivgDK58zIffIJbzqcs8EJJwDX0mAxZTIZd1GKHtuhs1rcKVVzk0D
 K9c765ZEWAzd3Qr11O/l8hUVMjzFQRTnIgCYAK89pXg6cgMjT5OhT0CT5cVIA74z/u8xvS+Xqau
 WTtcoWf4dblJoLUNzSb1nOExVoD7gK9VQf50Q3Y4rdbyNI7KE3JzfJYYIKO0LQHmAJyWQsPbQ1L
 KEKTFmlOq1t5nlIgBDxTfQDRQnQ0RZXByUzYjL46OS71zdXZ3MAUn0O0Tq7zqijDjxizQziwrr4
 Uy9ycmqpbwWq+fyBNareVl4CmSdacUoSOSjrOLprhpR5XZmsKgLGFWZup1aYjEbEfY70qoDgEV7
 WG86ATM6I2ntGALGjvgl2uatGuxuSjbO8iH+T3hVItmjJOkt3eGowEeJ74QpgV1MGwZMfKUW2hP
 8I8YHZigXmKNwfdcD/w==
X-Proofpoint-ORIG-GUID: 0qFWK2hdROMsfX5ulSZRRv46lW4tv0hN
X-Authority-Analysis: v=2.4 cv=Lo2fC3dc c=1 sm=1 tr=0 ts=69b0c6b4 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=kUWDpvuyKQ_uwZtR66oA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 0qFWK2hdROMsfX5ulSZRRv46lW4tv0hN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110011

On Mon, Mar 09, 2026 at 11:09:07PM -0500, Bjorn Andersson wrote:
> The pm_runtime_enable() and pm_runtime_use_autosuspend() calls are
> supposed to be balanced on exit, add these calls.

Use devm_pm_runtime_enable()?

> 
> Fixes: 917809e2280b ("slimbus: ngd: Add qcom SLIMBus NGD driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---
>  drivers/slimbus/qcom-ngd-ctrl.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 

-- 
With best wishes
Dmitry
