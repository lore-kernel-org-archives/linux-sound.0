Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C48922E889C
	for <linux-sound@vger.kernel.org>; Sat,  7 Feb 2026 09:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770456048; cv=none; b=a66L/LkZ1hKlJhU6Ukfr1Q3HmDyMDLMQzqV/ComDMc0ESxK1ssHpeREUopXkBzl3o4s1lLGWFIHfHEuJtfrF0eXrxjOvILRSqN/hkoauke+RFjNkjONxc0zMvcremkGa+dmne3qMwjnEzQU1aviYgU2RaX0tSePJeK6tZvWyq8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770456048; c=relaxed/simple;
	bh=UVczy6s5g6EbpIDcuo/42yJiPGRmRjKtRgx5PR/v/7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mpx1Ud+yQaI97zXSq7rMLG49ByuMOuEZ4zL4KvAscenfkNJA8Rf9Rt6uFIfPQjcholjc13zzI9xV6VeqNVo90vjgnMSOs/wqgx4MJSzD6vr5xEhrGrljSKguMO+sP1PoKH+1pjCTB0OvW0x+MamwLDj5KExrd+2RY1qa5/1JgTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EaDjW/p3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OOkBCEdI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EaDjW/p3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OOkBCEdI"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6174d3581050861
	for <linux-sound@vger.kernel.org>; Sat, 7 Feb 2026 09:20:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/ffbcEd5MLHaa4otROJRqku3
	h2lNiUFKLWZu0Ot47HY=; b=EaDjW/p3eYjprvgdQldpsVEvUAZIGASIaf/vd01j
	0g9IcRI/nFqdlYPCJSOitRUtGDgU5EKuQ9VrxQEviL3wmBUYhYmhULz7j8kxAS5b
	l6vhAcfuI9dsY7qHZR2iFbG4cAPoeGKlcCk2sfoM9h/VDWVmfGWvn7s+b8tiMJDF
	XTCeze8ctPa7IpsaWyvQK2SJ37ea5Hwlway6XsM+u2M4J+HShk63ALh7KHGO7yeH
	7UZ1HcXh6aOzlN17dYT3fSj5O0OIqLV6e8rwFMkySIRWCW0nPsuovj3YzCOfOPSS
	cmHWjMQ4rymwTVjhDOSm2a5z7M8j3ToJY8vcPuPPU/qTtw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c5xj18d4a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sat, 07 Feb 2026 09:20:46 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c6a5bc8c43so909888385a.2
        for <linux-sound@vger.kernel.org>; Sat, 07 Feb 2026 01:20:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770456046; x=1771060846; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/ffbcEd5MLHaa4otROJRqku3h2lNiUFKLWZu0Ot47HY=;
        b=OOkBCEdIE7AvV8ysbY3CaX0a4ksd/S44RiS/6lTpz03FAE5T8gNgv8+5hxXKnB5AcA
         IkgjGldKP3+wlstLfJ8DbBkHk8CWn4lMZ2b+DwE7dEIVn9vr33CdAVUjMOMMWUmQzFXY
         pg6+aSpiPWsvi/j+FH5piUE+BzLpYjlrbbcyuJcJv4RQyUJ99qLeQyf9SjVhrQHa03u2
         abIUr4kfz8HZuPPdBA0sejBZ2V4ZThkURnUx1UVl72CXiBQwZub7dAqgkc6cduXWCNy8
         J2/8G9MlJf23c3FBP3ivmN8Izg4jstxxwzIzMn8snpjiYH0FFRirSDcgfPEMJXJFBopF
         kzAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770456046; x=1771060846;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/ffbcEd5MLHaa4otROJRqku3h2lNiUFKLWZu0Ot47HY=;
        b=Ea3qopCMe4sE6Hcm/VrTezlikIv9PYToUkKqdv+/R4Zgz875jvvSPZMeuLjIlkleYx
         gMBtjuxI9Nw9z9CYIqBiZLmTKiuAEHSVANQEaBwQLXBKkYj7+RqDUlT0Ao3pg4xfGz0u
         q5CXGE4PfIX9MP0CIGQ1mFfE+HqE6TmgSDI9Tu4tPy1j/IvvxMZHBIVvb/fCorbJp4GH
         la0bWuAqtHkqN/PohHh9EA0INHcHI7vVw4caKDb0FGGRhuX/fa7gyCmGjVcxVwWLzdF+
         rL0D4fkUtEU33RCYwnEWHRMQnRyZRUNKbmA2M2HD/gOYtJz4GOoJt95cTkvUcaTYwzdm
         pUpA==
X-Forwarded-Encrypted: i=1; AJvYcCVNOUGQ4eOLwCIlWNUqHlbodphslPuIqSDpinN+UYpXPgn4Q/nPHYFnhBJXzRderUEJiv6ms1DAEJe7DA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0YA50s9Wmv41IsEt3kVlthw3TiYhSpUxku5hsZMt1HJgVlZkY
	TydO1nIJSBhdlcJ6jJ+f9INrwvwaijkpsOBKM9awhhosNc28Ad5casfcDAARK09749CiOuRdIPt
	wsMYcilRGdnjfo2x+deVNPtraD+s//Pg+65HgDcJKIR2KySa6JJHy8xhgBIZPO770Vw==
X-Gm-Gg: AZuq6aJRT0Ogzi8QyxY68txLH6FGxag/6IhHpjzFceWoAx8LuDQefbmhVD5CfW7T3N8
	rRdM5sqrSALmtiXPWee2ZYiea2nNM7N3q0hwcp15JYxVzkSUnBjfMY8MecG2f5a2han1e3PFM3n
	ikXrzqqFDV9hWt5a2eUZsxG/rWmjwg7iaMXDJY2PPMWLSAxMwIvi4EClrxoEEBRuFegrjK/ixhC
	zSwhAYZwRaPx47ifSRORs8dPy8jWwIeLwuik83Io9cKvaKJzLkLZClQOxWz4dJOdxrMJOhdqB8l
	4aGIJqioa9snb10r87MwoHdBiyvqLW7LUIWWxLNAGVWtWz329w/QSA+NlxYMZzCm0hkLWJNWgSc
	RAp8RtwCJT9MRYaW73u3gPttC0B3GUuyN5iC4Hzeh0/o6Ee69uR654bp+JFaZ2RT5Ev+GEyVVLH
	LA+EEPySQQDLXC9Vkfa/c14Ns=
X-Received: by 2002:a05:620a:4706:b0:8c0:cbd8:20b0 with SMTP id af79cd13be357-8caee76cae8mr645824085a.34.1770456046063;
        Sat, 07 Feb 2026 01:20:46 -0800 (PST)
X-Received: by 2002:a05:620a:4706:b0:8c0:cbd8:20b0 with SMTP id af79cd13be357-8caee76cae8mr645822685a.34.1770456045659;
        Sat, 07 Feb 2026 01:20:45 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e44cff6a5sm1206176e87.34.2026.02.07.01.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 01:20:43 -0800 (PST)
Date: Sat, 7 Feb 2026 11:20:40 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, robh@kernel.org,
        krzk+dt@kernel.org, cnor+dt@kernel.org, srini@kernel.org,
        perex@perex.cz, tiwai@suse.com, alexey.klimov@linaro.org,
        mohammad.rafi.shaik@oss.qualcomm.com, quic_wcheng@quicinc.com,
        johan@kernel.org, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 08/10] ASoC: qcom: q6apm-lpass-dai: move graph start to
 trigger
Message-ID: <aqdmav22lml3tlh7wzu5fwjyavl7wu2lbgkwjvyt67fqsldwxd@soixble4klnr>
References: <20260205171411.34908-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260205171411.34908-9-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260205171411.34908-9-srinivas.kandagatla@oss.qualcomm.com>
X-Proofpoint-GUID: WkGV1gah0wlOAeTISezXbTkFql_EmXTy
X-Proofpoint-ORIG-GUID: WkGV1gah0wlOAeTISezXbTkFql_EmXTy
X-Authority-Analysis: v=2.4 cv=F/tat6hN c=1 sm=1 tr=0 ts=698703ee cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=D19gQVrFAAAA:8
 a=EUspDBNiAAAA:8 a=DhTH6sICubyBQwtV0QAA:9 a=CjuIK1q_8ugA:10 a=ZXulRonScM0A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=W4TVW4IDbPiebHqcZpNg:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA3MDA3MyBTYWx0ZWRfXwhIAmNBxhOFA
 ZLb40iDII3h3NrTq2X2sf0009Y6cPBeUpDTzD3aPxdL9LJB6t5Jobe1VUiYHUTa8m1C94A33nhd
 SzKzlqiN9P0Qgoe3Oax+g411ExBw1hwHRm11XtLpL2eBDbfj8vGBQTZrrK9cl/hlp4xyVspde3s
 GSXS0rAJnP9LHd3MEISO02ulFR07z5nuIlXR7Wmp2AwzPcSaIOjIdx2rGAfF+o60lfD0kshIYIv
 gU+GnHua4LXKy83XrI0H5o+Qn9AQ4l9tp00JfWRlx+FYovo0nYoC/SSRtlPo5T1vN6M6bmblZ5n
 xaZsYhKNAFc3K1gZNq9S7uo0bmeOxjgIOowJjrhzif5elzRhmmiodnhC+S70eYLsDD9Xcmcqvug
 3GmWAPeLGf4FGahPGmC4966q0UXPzNJCeGdtzBSbLdXaZ9Wwo3NCBQXU3uwcR7nAyDf7V4w5IVU
 C1oatxg4IMUBjc7BmuA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-06_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 suspectscore=0 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602070073

On Thu, Feb 05, 2026 at 12:14:09PM -0500, Srinivas Kandagatla wrote:
> Start the graph at trigger callback. Staring the graph at prepare does
> not make sense as there is no data transfer at this point.
> Moving this to trigger will also helps fix some of the issues seen with
> pipewire and display port. This should also fix some of the Qualcomm DP codec
> issues discussed at https://lkml.org/lkml/2025/5/29/102

There is exactly one issue discussed there. Is it now fixed or not? If
it is, then you need a proper Fixes, Reported-by, Closes, etc. If it is
not, please drop it from the commit message.

> 
> CC: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  sound/soc/qcom/qdsp6/q6apm-lpass-dais.c | 39 +++++++++++++++++--------
>  1 file changed, 27 insertions(+), 12 deletions(-)
> 

-- 
With best wishes
Dmitry
