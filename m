Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A44463195F8
	for <linux-sound@vger.kernel.org>; Tue, 23 Sep 2025 08:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758615792; cv=none; b=JrdqlWzm05v4OPqPyB4WVXfBgu4iZ4N2E4GTIPXfptiCCTDlkUCkFtzabiERUPC+j9FALdz6mztLKOv4N2ko+Vwrs5+39MXqDsSbVqZwnlSaLxKAikUH9oPRvE8b+poLYKQXsgXx2xRoihpY83Cokt3PAUCl9gPDru5RThoNfCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758615792; c=relaxed/simple;
	bh=hZL8cMemp35OvsvtLi/PbzQZ983k0IxZK/KFVRezPOk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uRun5AgxzvI2InMRUrXZhOFDAYbB2ksK8zKEAgMlwz8sJxK6hgUXxLtot7VfdhQca9nq05BCqPd1aRFOmcqke9oKNg47xpI0E4j0eddgh4jMqAkAk6ZnTuINmPigtV8GVJ4m4E1f4d51D+v3C9o+a5TlmQ/NlUlrEuRTSprraMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UATZU/Ep; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UATZU/Ep"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58N8H9vL027288
	for <linux-sound@vger.kernel.org>; Tue, 23 Sep 2025 08:23:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lHIoF9YFlreh6iJ8DpMNf8z2
	sMgb4aI7tWDoMnOWm5U=; b=UATZU/EpeZ1vemuj47fpIcgU1Xz+7dQoj49/0Yff
	K+e1VhS8Vyiw0VcCzfOBFYxjlE31+AIkYEAuL15/vh99u9NhznHxefweDKMsC0lB
	mjqUg0l7t/3FNzk05EdCxHD2dA59sV2N3Q/MZ77LMMGtr6AItWHMPJqj/soTWtMS
	kckFZs9rjlcXMzFgUVIcM9wXJEJMisodD/1aqnvnjYduhEuSapKlEbJmN/KtM8uH
	ozbSeFfjFAA8xyaDPVL44BfuaDhtJVE82cARAhzilQfePQUiCLkyQ87bSaTIyW+x
	jguOPuo/QLtBaAB2R9DqN5meit2XqhCJBZhiJQYJ7Ngk1A==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bajet7gx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 23 Sep 2025 08:23:09 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-79a3c16b2adso54171756d6.3
        for <linux-sound@vger.kernel.org>; Tue, 23 Sep 2025 01:23:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758615788; x=1759220588;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lHIoF9YFlreh6iJ8DpMNf8z2sMgb4aI7tWDoMnOWm5U=;
        b=jsTil6HMSoqOurIQ+FVJLJUBIRqa4aMzdzufMAipaYAuZi3BIGwHtR59MQKirIgNYN
         /Zij60lEupO9Jok5uTmi79Jitlf/l0Ll95HkWM5zQstHJGvxO4s/4ZjZQB/lIyiosVvm
         jEc8GeYQRv3Y57KwKgXvJeJjW1yvyl3vE7rOZpZjRA3hX+Bf0irSfAM0pOrannDL5Y/P
         QbC7n0xcmiMTZdl+g8YA7fSRR3Qc8yIlHyO3whDBJzo8c/7PpqWLAThElQHQH/bwOsvZ
         U+QdEd7+LkpsyyOuCstFP70giVhRR5JXAQfQEhRiDfYNoBNqUe0tb7kjbCKxp/hFh8JG
         65Zw==
X-Forwarded-Encrypted: i=1; AJvYcCVhitOFf7DUC3rXYv48DAH7KBrVu0B/8IScR0BLUZGTthpDRoUAi4sUG0WKO5mXXmg2GVHhQp601AWXYg==@vger.kernel.org
X-Gm-Message-State: AOJu0YztjlRrQ3kP/zBStYIngOzqHMgZ6/30AnHPFiHXuHpcwzDkmUSv
	0BLTqQzMjJ7Z2kJdmNLd/GlnknNnfLyQ+NXVG0yEYQo9o8b4Zd7zIqzeDN+a/B7hsMmZXDXyDaN
	shWVivFx24MaxAdCozm8triHi/rvDwhZFRB3Yz6vwd1eJiRdVtTrTC5jM8UEZOrSiLQ==
X-Gm-Gg: ASbGncswy58hUGAQ0s+k9KAjo9w20a/IVM3ZTrS74TidUoSun5FQlgSTQoWZT3Tg/Q8
	ZF+RzMLn8JEgbNo+bEsrojZ1zX7alIS18Cy3BSaTdO+NV79B6ZDP1LMspLmEdzqtLtAxiWFz0E3
	3UWhUHephwARLxSzJJcPd9SHaWIWUHw9qejBYZW3NASVECTHvwiXaBZPoQ0RCSlTy3Wl/6Pj0Ox
	zfpt2/shi3vpdTeb1R2aKs4ja8VI0/aFcRTJ9wmeFQ+SHQP/eDquR3+4Xpy0eKRpsedu3gu3YM7
	Auyzpj7B2rVNSWCqOE4rkVYbtOoxD/Us+UvA5hct0yP5S20IQymsgqcHYWjRxjgmvVPcXbB5x0T
	0msdPWxIj6jgfqLM7vXro0YbhDWMUQoJI7yp1BdqzbJPZJvdHmSc0
X-Received: by 2002:a05:6214:2a88:b0:786:8f81:42f with SMTP id 6a1803df08f44-7e71133eaabmr18299766d6.39.1758615788309;
        Tue, 23 Sep 2025 01:23:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFTqf6gCEvg93UnurQ8vVB2x/PoLj6l4bFsWeAr6cog3AY0TdhZBUmDyx4Na73stVCrlcsG3A==
X-Received: by 2002:a05:6214:2a88:b0:786:8f81:42f with SMTP id 6a1803df08f44-7e71133eaabmr18299596d6.39.1758615787733;
        Tue, 23 Sep 2025 01:23:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-57b3528c49dsm2473961e87.134.2025.09.23.01.23.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 01:23:07 -0700 (PDT)
Date: Tue, 23 Sep 2025 11:23:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ma Ke <make24@iscas.ac.cn>
Cc: srini@kernel.org, lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz,
        tiwai@suse.com, pierre-louis.bossart@linux.dev,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, akpm@linux-foundation.org,
        stable@vger.kernel.org
Subject: Re: [PATCH v4] ASoC: wcd934x: fix error handling in
 wcd934x_codec_parse_data()
Message-ID: <a5o4iivd7ph4h7hb5mhfwgijob3celkn5l5dci635a7owzga6t@pjmf37gcmai6>
References: <20250923065212.26660-1-make24@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250923065212.26660-1-make24@iscas.ac.cn>
X-Proofpoint-GUID: miPAYk0kHPLxuVfIYT28aiGtEWHJ1X3g
X-Authority-Analysis: v=2.4 cv=fY2ty1QF c=1 sm=1 tr=0 ts=68d258ed cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=TWLRxeszWchEVqlQ-2MA:9
 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDE2OCBTYWx0ZWRfX5qm16ndmZCjW
 5VTo0qiPT5BK8iARrv3aVrAQsndoDOATZA7j0t4imhUApKGP7WEob29vp73BM/ydipC+qFNPHYO
 Ptkyo7DKdYMBov8ozB3cGdU9zFHrTxd7Q8y8kRajYlGZ3d1eY6CMhJZRDTm4JSEniVOljdA4/P7
 i+fgvBgO2CRvnOEkrc/HEWkSPJIKf0Ti+uA8YaK6TktT44cH9AFf5SijCtCvbUZkSU1TfTn+z+u
 w89Jd12j4kwH7mzBvNDzviHH7T8O1uggVGJJz5IMZEF7kXaD82zv03u8OIH2iUhY8lS6Z1lvlPT
 ty9zuESCbrunI9xxJBu2dxIryefJJC0RiXaNnDSm3bWK6w1TWknBWj4BsRZTaZHeV0ftlBG+7Dz
 /0vv9kBs
X-Proofpoint-ORIG-GUID: miPAYk0kHPLxuVfIYT28aiGtEWHJ1X3g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-23_01,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0
 phishscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220168

On Tue, Sep 23, 2025 at 02:52:12PM +0800, Ma Ke wrote:
> wcd934x_codec_parse_data() contains a device reference count leak in
> of_slim_get_device() where device_find_child() increases the reference
> count of the device but this reference is not properly decreased in
> the success path. Add put_device() in wcd934x_codec_parse_data() and
> add devm_add_action_or_reset() in the probe function, which ensures
> that the reference count of the device is correctly managed.
> 
> Memory leak in regmap_init_slimbus() as the allocated regmap is not
> released when the device is removed. Using devm_regmap_init_slimbus()
> instead of regmap_init_slimbus() to ensure automatic regmap cleanup on
> device removal.
> 
> Calling path: of_slim_get_device() -> of_find_slim_device() ->
> device_find_child(). As comment of device_find_child() says, 'NOTE:
> you will need to drop the reference with put_device() after use.'.
> 
> Found by code review.
> 
> Cc: stable@vger.kernel.org
> Fixes: a61f3b4f476e ("ASoC: wcd934x: add support to wcd9340/wcd9341 codec")
> Signed-off-by: Ma Ke <make24@iscas.ac.cn>
> ---
> Changes in v4:
> - removed the redundant NULL check as put_device() can handle the NULL dev;
> Changes in v3:
> - added a wrapper function due to the warning report from kernel test robot;
> Changes in v2:
> - modified the handling in the success path and fixed the memory leak for regmap as suggestions.
> ---
>  sound/soc/codecs/wcd934x.c | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
