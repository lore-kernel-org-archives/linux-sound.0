Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A1E393DE1
	for <linux-sound@vger.kernel.org>; Fri, 22 Aug 2025 11:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755861683; cv=none; b=JE2RqbAjjY0ArNx6DNbPntIFrJH0IPubYHJYPq9IgzZTMHst7cD9dUBWBasd1KDzBfoIyphf3VbkZawevZwG/DGyddFZsK75Pq01fGNOFUR6XfVsfTecDqnOVJ/dEcIjHQ2GBWl/utfyvPt5zjO3WcpzaG23MH/6P2IxFXOxqm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755861683; c=relaxed/simple;
	bh=Ke5Bs1RSqo7dH0bQML7IfzQo5RoAdNMuGyO5ShXHmUg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pJQ1iJeh4ypEsT9Trguho25Azwj/buqE2XqZ9zPmQ4Vfo/bcTqB6F2i2vfKefeNJTTVBTjhj9TNkKBghZiM8vCALMU6dYL5Mp2Pe85CqRMilSzF0qhXnkmuDi++zuJluaXpDr4FdfXt4CoH2mCuKgkGcHYXoJjdMC3PhIHhzoYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KPqao8lk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KPqao8lk"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57M8UTnn005824
	for <linux-sound@vger.kernel.org>; Fri, 22 Aug 2025 11:21:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QOLeiRcyikkOXdelLFPCIu6K
	rPpr4gBP2+IVs5G5Gec=; b=KPqao8lkZItBexfa14dNxgB1nx8C0I7M8940NUOI
	xmTgTtKmyKHuInP/o4U00r4fSy6L+CNc8mXB8JqugryJDYw05opO2wyaFGtUd+i6
	I4pMwbe0wZGke//Q3YINvVxaRMGdo59WkTL4owOv2oI3xrSZIxgRO/hdVhtR/tZS
	IQojynUvjvBuE7vnxJJNAqskomWqSVoIeqgy4oUEXNpT+Vwr1eug1Xw+jKaZ6WL7
	x98qQkx6KSxOJ/F6NJuN5Sdbdv+ofa/OAtQI+LnwTxKib97cd9m03dser6ak2e8M
	InR/tlYGyqtg9PtxmP/gHccm3JiiDPEEV+yhSuL5lAOixw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52drwu3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 22 Aug 2025 11:21:20 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b134a9a179so20284971cf.1
        for <linux-sound@vger.kernel.org>; Fri, 22 Aug 2025 04:21:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755861680; x=1756466480;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QOLeiRcyikkOXdelLFPCIu6KrPpr4gBP2+IVs5G5Gec=;
        b=QbOy88qnlnY6Vqrpnygh4bwQ+so35SuGpUCYEN4i2f/oKZ5Fib2eCrIB3sShxnzLa5
         uLybG82/YA6Tfl9uZuVD1nc15/2bRjth/VjIa05YYE4VtHkuurKEorT9Gms/tdfEZ7d1
         02hh0vsmmyAKPc1aGfJyrbtu4dgU+HZgFMrtSldbkJ5ejFHxfqnr9lq/hkuNtbrjWhEs
         VQIkc9oQ5C415gPSHlpZBWceOKqoCtOOaNmgqrVPPQ44WHdbkoab4lBaxnINURJO9bFZ
         mPhkoxRNxL7hhd6kqwfo3hjpI6rW7hsy5xnCV4O+k9BBP9s4YIITh9bKjQo/1NAEKd4n
         wI4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWDIpJFXTO2AUI3E4E14TG+ZC4iGffUf1tSvDyAxu9fBP2D3HqCJD7gDz3P8P1l6f6gkTmirlb4J4d7lg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxsaWriBeop1N1d1CTfSyZo6YV+i4XHh9jVfP1hNnnVDMzOB3Ad
	KY2jTIy369MRlZXA9xlrAUcwPVfXWOHq7y+V3cYgD/MbA2he20IqJbu+nl0Jl+sx+N940z9Nj8E
	/wfiR3t9Pf8e5zLwT0J6w82t/uiXKp6zb3ETuzJ0vjbgvybkZaD8phMjD7SpKNKUGkQ==
X-Gm-Gg: ASbGncsmqVPwClH2B7qSZ3cPQL1sZvEq3TK2BfgcRhKB0P5A9BvBZhdiKI8iWyVCrKk
	iikMeeWoHgTyr/tzAiTtnkYvYE+uwhbWzcwnkNuW6Io7lo8O90a1h65dNm1YkkxyXXKa5N+1s6o
	37fF3yiVsvaghtbeaj5uIV0Hfqp/0X0bEXt29+HpIoBRGhVbvZ2tzrqGndfc2gGVcIctXRt4rS5
	TP8QJzrZvSkqs72/qna5leBJgBKeMWNCoZd/N1O/xUEaef5I8/Uei1UaS3IUuf0NJtsLx5tX0A0
	RMwb/PXqS21pPcQsUvAiT5mXxPhv6lXqlpACb4PudiKlPglj/uujzAisNjYCn/l/Cq+9iEA20Wt
	KS7ucrO17qgUqB2E56nKWgmoRB/SxZNAVWfNacy+8+etSS0tPR2MU
X-Received: by 2002:ac8:7dc3:0:b0:4ab:5277:a5ab with SMTP id d75a77b69052e-4b2aaa3fa77mr27327281cf.6.1755861679733;
        Fri, 22 Aug 2025 04:21:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFwEaOak01WwTjnUuienCHYk4SGhkFGQMG/CUgI7oUtTAemM/5tdVtKFnwof/wGNbh824CEIA==
X-Received: by 2002:ac8:7dc3:0:b0:4ab:5277:a5ab with SMTP id d75a77b69052e-4b2aaa3fa77mr27326951cf.6.1755861679234;
        Fri, 22 Aug 2025 04:21:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef351806sm3431010e87.13.2025.08.22.04.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 04:21:18 -0700 (PDT)
Date: Fri, 22 Aug 2025 14:21:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: broonie@kernel.org, perex@perex.cz, tiwai@suse.com, srini@kernel.org,
        lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        krzysztof.kozlowski@linaro.org, neil.armstrong@linaro.org
Subject: Re: [PATCH v2 3/8] ASoC: codecs: wcd-common: move WCD_SDW_CH to
 common
Message-ID: <4jklfoinsr7ldw5gn66kmfh4vwl7hqrhvnodakirsd5vx4uzqe@axhf5e7ei5g2>
References: <20250822104927.2621866-1-srinivas.kandagatla@oss.qualcomm.com>
 <20250822104927.2621866-4-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250822104927.2621866-4-srinivas.kandagatla@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX3m/sXyNM/muj
 X6qq/tb54xlRKua/szQ6ZxyXSv6/86OjID37Ryc+WUu2qypbRBOl0uiz9B/YDaxrkSw5Ocf6pyf
 7edd20C1AUnRfPuJJmJ389yWXwx11Whfu97KKEEQlMyg4/tkSWInzwpXErT4YvOhoEhm3sl1zb1
 YomPvFwLo6BUGzRKbgruflM+SaBPoAab2bjlBjyIxU4QNdhQHD4LAHN+gtIhvCjnwnH8PoQjPJZ
 wxSHnpdBvCdNdvrE5rYsM8902NPxe66FjxGxzHnCd0/H25IZlp1+SNQ1SvfLkTGNrZMFojPLvLp
 k6j7fAsYhzrMksioLMDl2VWLvztF30lkmBNu8PHmjHJQdykUPjVvXbYXOOvsQyB0HhKhbm/eGRu
 5pkBRzj0ksdSg9BqAqo0vlP4p+ufVg==
X-Proofpoint-ORIG-GUID: 27-4b9DXnRjh1YcUxXrzWDhkNnNPLqY0
X-Proofpoint-GUID: 27-4b9DXnRjh1YcUxXrzWDhkNnNPLqY0
X-Authority-Analysis: v=2.4 cv=SoXJKPO0 c=1 sm=1 tr=0 ts=68a852b0 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=g_yewJXOhfjxRz4zaJMA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_04,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

On Fri, Aug 22, 2025 at 11:49:22AM +0100, Srinivas Kandagatla wrote:
> sdw_ch_info and WCD_SDW_CH macro is duplicated across wcd937x, wcd938x,
> wcd939x soundwire codec drivers. Move this to wcd common driver to
> remove this code duplication.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  sound/soc/codecs/wcd-common.h  | 11 +++++++++++
>  sound/soc/codecs/wcd937x-sdw.c |  4 ++--
>  sound/soc/codecs/wcd937x.h     | 16 ++--------------
>  sound/soc/codecs/wcd938x-sdw.c |  4 ++--
>  sound/soc/codecs/wcd938x.c     |  2 +-
>  sound/soc/codecs/wcd938x.h     | 13 +------------
>  sound/soc/codecs/wcd939x-sdw.c |  4 ++--
>  sound/soc/codecs/wcd939x.c     |  2 +-
>  sound/soc/codecs/wcd939x.h     | 13 +------------
>  9 files changed, 23 insertions(+), 46 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
