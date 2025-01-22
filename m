Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC7F1C3F30
	for <linux-sound@vger.kernel.org>; Wed, 22 Jan 2025 23:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737587733; cv=none; b=g41LZiiDz1Bfm2giCmcaVzlbYIPPwcAuXKRAzR31LrAchV08Q5RBUFInVwfZj/qHrwH7iAfYMMxYRyFVCoxVTN0XSFDfjMrVECq/evhXEOSRLIw7EOlhQgjIPUQIfbuf7IPYKgEGvsxzhWQILJrrXRNMtdpGmNAe94BqFqfqFNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737587733; c=relaxed/simple;
	bh=OqkWHYYOqwB6cIlZJcu2x4iv60UpBgOMo9Ov+O4co4U=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Do65ln+AwA0+MRZs6ZW6Ws400exCWJjbhIMA7dhYdkhV+poBXpWPVn7ygf8DXki1PYw6+k0IlSoe6c8+2uettwETXSJ1rxw/4XznuR1MhY6Nu97QPtRYkHDBVxoA2aKcoQ6Q4mXr5oq40N7NcVtF5HVoM6iiRI6CD6yPdI+yB4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YDOLwjLw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YDOLwjLw"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50MFqZnr024224;
	Wed, 22 Jan 2025 23:15:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OqkWHYYOqwB6cIlZJcu2x4iv60UpBgOMo9Ov+O4co4U=; b=YDOLwjLw/9UR1FcR
	D2CZ+3G0qmGd063b+eeuugPh85dqS4ZWZzsR7soOEmlJfWUybBBgprEGX7499Tmf
	ADiPrG6wC1dovHmdWDlQhnP1PVwPto50YTz609Jj9XTzyr0P3CqpXuP31BOtHR4p
	WAQYL0CpLgSvjN9xa90WdKACZYF0Ii+VVHSXXyDeE5G/rHNVxfncAH1DHxC6fp15
	twvzfGEWCH7rivwiPQR8lfkFDIyfeEAkKThIkR+zkoGh3ojWXU48IKzVtnwvu1bk
	A8cvYOENDHSv7ZzpoaXQeAQCCiM3NDOMwrYYygbwkQXh5Mnaih3oY+zF9vVqGSpw
	uKdlew==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44b3pyrw82-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jan 2025 23:15:15 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50MNFE15029246
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jan 2025 23:15:14 GMT
Received: from [10.81.24.74] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 22 Jan
 2025 15:15:14 -0800
Message-ID: <1eee8433-d2d0-4801-81e0-35d59a5c7d1d@quicinc.com>
Date: Wed, 22 Jan 2025 15:15:13 -0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/11] ASoC: Intel: avs: Add pcm3168a machine board
To: Cezary Rojewski <cezary.rojewski@intel.com>, <broonie@kernel.org>
CC: <tiwai@suse.com>, <perex@perex.cz>, <amadeuszx.slawinski@linux.intel.com>,
        <shenghao-ding@ti.com>, <kevin-lu@ti.com>, <baojun.xu@ti.com>,
        <linux-sound@vger.kernel.org>
References: <20250122175426.1369059-1-cezary.rojewski@intel.com>
 <20250122175426.1369059-5-cezary.rojewski@intel.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <20250122175426.1369059-5-cezary.rojewski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: wo5q2IOS_VzoLqO7JN2wPKOSjoEirIin
X-Proofpoint-ORIG-GUID: wo5q2IOS_VzoLqO7JN2wPKOSjoEirIin
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-22_10,2025-01-22_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 impostorscore=0 malwarescore=0 clxscore=1011 priorityscore=1501 mlxscore=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 phishscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501220168

On 1/22/25 09:54, Cezary Rojewski wrote:
...

> +module_platform_driver(avs_pcm3168a_driver);
> +
> +MODULE_AUTHOR("Cezary Rojewski <cezary.rojewski@intel.com>");
> +MODULE_LICENSE("GPL");

Since commit 1fffe7a34c89 ("script: modpost: emit a warning when the
description is missing"), a module without a MODULE_DESCRIPTION() will
result in a warning with make W=1. Please add a MODULE_DESCRIPTION()
to avoid this warning.

/jeff
