Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A24813112A5
	for <linux-sound@vger.kernel.org>; Sat, 20 Dec 2025 18:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766257104; cv=none; b=szXcJQg92kjoNvUrtANby3K9OmiypgzrbXX5xAWrgXi5ztjcZLD/MoCIbMGbL1VRMr8B+5oX0TqxGxoPKWqdhSIqkGib9NNgLjCmBqk+fbdYQIzLQm0+H9Qn7MSxUIUL3io0AaB+fZRKYAhGhy5S3a7lE6g1dVbdUbwNVXNtQ+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766257104; c=relaxed/simple;
	bh=VimJvaVqV0OpZkRn7JBEzHNUNExfFab1UXxkgrUmSw0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SjiHgfR4VxuizucK9rFoakdPZvQHQxn8C/JPODuvV1mcqCMlfsqFbkokgEJNoC9j3xw41yI35s1/fPs0vIp0qamv7qqlDO2dvmDEm0JFnLEf9EKEocMgNJ/apyxYVCMAa7aRgTWj6He1Fi2DfJS/Qd6YP57rLHaU0BcJO5BJO78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SWWnc0F2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fmgVrfH+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SWWnc0F2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fmgVrfH+"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BKBOoTT3762478
	for <linux-sound@vger.kernel.org>; Sat, 20 Dec 2025 18:58:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yPSPJr528GYZqS/w8DWqqkwY
	ATTphriuR4ox+wQELJo=; b=SWWnc0F2A52KFAf3pF6AijvSmI2ZwacTQHFDvJdm
	UfKBPvsD8kvz4zno+nNdPYji1XhhQ+zlRg+GB4LTUOh0v7uT83CAP6nPJNrt+BGJ
	jjlwsmSvzizyuNJkDy4NVV1LWpZUzaqmed6l+oUk3QowgwXPFrM5wcEa+HA2MEp/
	O/48ZtPSLQW3yvTKecqnSOQ6ufxePIoI+FzKa1GnBbW4oMKPQU8da9uh7kgyxdoy
	xzRO+T1kpLX3LaMCDEN9Styk1uk0psiej6dGlJiKpH4v05HFZjc1rr93JpQT1pE7
	Kzpf4vYW3E4sAhCvENE5rMKCzSXR+FwFPBQTIetvE1tE7Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mrt956m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sat, 20 Dec 2025 18:58:20 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ed74e6c468so38850611cf.3
        for <linux-sound@vger.kernel.org>; Sat, 20 Dec 2025 10:58:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766257100; x=1766861900; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yPSPJr528GYZqS/w8DWqqkwYATTphriuR4ox+wQELJo=;
        b=fmgVrfH+zxmddfvvLJM5GB+HzBxvJdLMwShDvzjQrWZeRHsk+YP8UjIOQPgnvf+nf7
         kl5nUJKqv+DGB3eDYb9c4XldWVH5htV5/zzL1gE/HHW98iakIOfn4V7ovbRE77eAK5No
         CyDrZk4mbP6Xszu5eB8lrJ+wGYbIysovNZVvcUiC2elvKxpt0x6bF/OE4ifMsLq6tTTn
         cqky0cEfnowMCmhpWSnEzTbf6bQrRgks0Al808j7y+CGVBVrtfB8Bq5zUTyjVK/SbrIY
         coN9P0PdwH3PJI7SgIa1mhqlt6/zRPChpJI4dZZxYpumKGMUuJ3GFp4Mn5G2DGHgEamn
         jfvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766257100; x=1766861900;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yPSPJr528GYZqS/w8DWqqkwYATTphriuR4ox+wQELJo=;
        b=pU8kGfAd0PTQ7WqxNtQR7i+iZbYibUGcoW5UKA85cQeXyjL3ejUzAtg9AZGYxBIWlQ
         mone1+oyKxNS+r5zCvgLF9fJAjzV1bbXmdpNMoxtDYLFQCaGUtuGwGXF9glJ1GESHaAf
         2ruivPT6LeHQamCuX6QZjh2ez7oMZb4Qwy1XeLFn21/xao5FlzBCXjDBWzLlW6u7wwqL
         w4OyJkiX45PlV77IcJBKpGWket29Skrv1r6Zn2fBpZhTiC/cKzoJSh8mPBcvTJ6kv7vz
         LOAvy70AXXyvW9tp5Ai9J9NLajzQ0osEWBm8TdAAhwdlxar80wDcDe9YKn+PYglHshp4
         xwdA==
X-Forwarded-Encrypted: i=1; AJvYcCUxu33MaW0yS+crs6aLk2BCA4/0dPT4KuvZNCR0Oajk03STluX6BMbXkMHrPHw51AL6JNzPHzInfUICig==@vger.kernel.org
X-Gm-Message-State: AOJu0YyVYCgv1OaKIDXErl4dQMPs474SnuGk+Des3TE3rBD6OxWfqdQJ
	IQahRiy9IBntaiWsKYe8vgREWmZLw6G/VRUKTTDLz2hC7+oDB5mqpSJGN5bhSsB37cu3ZOjhtQM
	jYtSbhD+Y7o1YqZW4tktEswP+0ChwW6LSKJqrDZefHbxKev6GYT3ZgmWIrAlFSfGL2Q==
X-Gm-Gg: AY/fxX7mY3xTl8q9MIyUZ8tzmoZt1WK4I6nmScE58nXJ+jCuXpF/jxrFWPxdHz0W5w0
	cTSTjsmJLfF6b+IcWIGVSWPSVt9m4yK4Ah93FXjJBOhP9Z2rCASXGjzftdd/W9u71d+/lJIcdeb
	E1ImUb4Z8D/YaYkU0seQ+vhfcgGM772o8OTwXMTd+bKIE0SsJXxxAWJDW8g+cjqd7tBN64xrolH
	/EZxEfZC/Px0EE3yL3iP1WSVv1FYATBNRLuYkPsWkQz6EctfDYFnNTWC1W3y4UHbBCnusVBQvKF
	5i8/8Jf2LPtqX1tRCJglWUG7enTymicdKJ1zPH8OYOJVMellFq6tjb6QZ1UR85oazeOXF6a7iyA
	uX0GViPTeXeqZp54ADHQ+9NVb5cGjA+HnYgTNwSH6Dju84efpW7oBQyLJmIIth4FFZsEUTwNVaZ
	GqOeTALjlGSDzW02Dtg6omO2c=
X-Received: by 2002:a05:622a:259b:b0:4ed:e595:bc85 with SMTP id d75a77b69052e-4f4abd621b7mr115510151cf.46.1766257099724;
        Sat, 20 Dec 2025 10:58:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG71tkmZOaEXRVDTFkxQxTteoL/5u6WPcPmvcI5BdbEGhUXZpVrRz4Ui56FFiPshPAmtjf9xw==
X-Received: by 2002:a05:622a:259b:b0:4ed:e595:bc85 with SMTP id d75a77b69052e-4f4abd621b7mr115509871cf.46.1766257099183;
        Sat, 20 Dec 2025 10:58:19 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3812267a438sm13985661fa.41.2025.12.20.10.58.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Dec 2025 10:58:18 -0800 (PST)
Date: Sat, 20 Dec 2025 20:58:16 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Johan Hovold <johan@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ma Ke <make24@iscas.ac.cn>
Subject: Re: [PATCH] ASoC: codecs: pm4125: clean up bind() device reference
 handling
Message-ID: <o2ow7tizpgueqhulpubdjftasn7u5iugdkvdwnawbiewsaihyw@n4escb7hcnzx>
References: <20251219142412.19043-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251219142412.19043-1-johan@kernel.org>
X-Proofpoint-ORIG-GUID: QE9rZTbeuz7NVG3NT-Io_kxD9sqtYiB2
X-Proofpoint-GUID: QE9rZTbeuz7NVG3NT-Io_kxD9sqtYiB2
X-Authority-Analysis: v=2.4 cv=CeEFJbrl c=1 sm=1 tr=0 ts=6946f1cc cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=qZ3YKT8rVdHzq0eVhogA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIwMDE2NyBTYWx0ZWRfX2Ggjh2paYimM
 e5so+ykz18cS39YnkvYaKYHqjtEZWZAm1fWeP6rs7CFTiRys89JQ/Ev5coK0ge69rc9P0HvGvUV
 6+9UCrZHixEj95fi07xhud7J3bqDYCVAK/bhKPYBfj+V4yC2Igc80xY/g25qxKeTntM+5gJl4k2
 8DwDPZ7E+AHYkBY8U2/piz4n1yURuffGzkvzdWHVa57Z7S/3g/xRp0yE/1jOvrOzQceZmeNJ7Tp
 yazXZNqog5Tz4YoRwPR0L/jaVxlzdZpxbwJuaRy2g0qFnEiOrqEBTt2k2lLyufMOIH49EGjKaLl
 vIZOeZwT677ItWtoKDCefDZG66BuByKlNT+xAHqPbnvhfpRshm9HFidjXBITIrlkvssOImLlScJ
 raO6318BpSU7PxdMjUZCENBZxyGq7CLd+W/K4dFG4YdY2ln4glq+1rVVL+E/WyK0OuX/OxSKBKs
 2mZeVpudbpG9VXXMx6w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-20_04,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512200167

On Fri, Dec 19, 2025 at 03:24:12PM +0100, Johan Hovold wrote:
> A recent change fixed a couple of device leaks on component bind failure
> and on unbind but did so in a confusing way by adding misleading
> initialisations at bind() and bogus NULL checks at unbind().
> 
> Cc: Ma Ke <make24@iscas.ac.cn>
> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---
>  sound/soc/codecs/pm4125.c | 11 ++---------
>  1 file changed, 2 insertions(+), 9 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
