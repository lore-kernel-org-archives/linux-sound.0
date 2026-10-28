Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793192245;
	b=G8WXNJH+TAyc9zvxCwQocHoqpeLOMB7q0cT274COi3GED8h76V4J6RwVAjUmLCc/PVDx
	 t+WGClKfASzHHhTAFhhc+uusXTdFej4qDhjrjHl1zSC6HCu+0Xd03/VhD3BQGw96pLi6H
	 qx1DB8KGgCiKFwS3EAbpZlG408sn2xjd5iWl+9Q60+oI353weesAJ4L2G7h4vIroelpXh
	 VpjlvvY1a7XyIVUPS3CNaemnM5Unc270ss1NFpI3ESXgJPbuO2MYy+IeyVTp/siCV86gk
	 K9wDh8TYn/ZKJkVmg54kkoJ1EEjDVqAGlIBHRsvP8G96Vi9cC0RJf4PYchdsiBDWcqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793192245;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=NgkQsGJ7F0ZEbrdBMJdtiIj1xr4L3acMDrweUpa/DcA=;
	b=nOzNMyflqpeDWhv1fXvYhUfbkg+U90bKZiwkFjBNamNaNLMrGBDVryR5yvTRUgftZYhV
	 HgmVYEwerIjTg7jqkcV1sBn5C19woIBFkPMuwkRuT0hlNPzRLrst00jZ5QJIXaOf3954e
	 pG+rD2KdlaoGzMcV6nDyfm3hguq8jk7AAS4JRbJ+lAJ4ZKcU1Ks2aOxwtThnly47jyxmi
	 ymhw4zGCZCMwdO8nOSVSJiVOb89evBBJS6LTkzc8y/T4mcVg4YC+5yU7YIH3NBGkYoH3b
	 j1UJ2K8Ttfg/7EkB0TJAc4Tfz9iFDeB1KyVlL1BVkUgKF23MURRJ4Y8zyyTNj7oNNNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ErqdaxSX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=G4Jnug7Q;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E33FF606A31D
	for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 12:57:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E33FF606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ErqdaxSX;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=G4Jnug7Q
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBe5hr1053347
	for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 12:57:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NgkQsGJ7F0ZEbrdBMJdtiIj1xr4L3acMDrweUpa/DcA=; b=ErqdaxSXIYUEb5j3
	LNq2HhQf4/3lRGxpLyRRTCBCzJNmltvBveEPBMKLuqEOtoShGjjDE94UCNMRpIhb
	HPnFmuocikNEpyrINUfycILX5SuO5W7PUEl3pm+exYGLZ/7opCOPdehDf26OYBh5
	/ncX14bV6YEVsToe/dqaAR462SqsJRp123nFCZYWXv3Mo3hDNXyY7/N8dcxEow87
	bk/57PvSI7xF2QGzUK96vGJyU5frbvGLBSw+K56/eiKZaYd0637CJfV4aqFUDHwd
	Mqe6n2Q+K6DwMYNQ6E7XRFoZMy2bgNDSi5DPevoxGgeDEEsLvvo7cqc52lKl7JxV
	Mcg4fw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkbhw9fes-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 12:57:24 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36a190c53a3so1099769eec.0
        for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 05:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793192244; x=1793797044; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NgkQsGJ7F0ZEbrdBMJdtiIj1xr4L3acMDrweUpa/DcA=;
        b=G4Jnug7QkxdTnIAqONxnqkbCBus/Ux+tZgayoou5AQWJCbe6EDEUw80BfHCJzS8VR1
         Mi+xJNzdLCTzFvZmQIy0yPV6TvSd1uPg9XU918SoD0iu8Y45/2ZHwKeAbX5bZrnF0Guw
         hrZhwn6VUpXtyLlgu+UVY61rGOPy2mXUxYoQ7nyO12HNs3J39j1QNaqWSkJ88LgrfTMs
         42HToJ95/ZngnSY7eRXt5DgSritQeCmtLnDnLlGUaqWdkr8pNy4zPi6gRSiIPx3utiIM
         cPMPwf+DLNfDffTPWvR1EOciezJD8jgoDSu6VbEZnQd0ZgsIhVVaY7q+gXcdc2MHpcx8
         1l/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793192244; x=1793797044;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NgkQsGJ7F0ZEbrdBMJdtiIj1xr4L3acMDrweUpa/DcA=;
        b=Ql3Y8rKc+ew2scnfWOfKieK3RcMR2eH/Za6L/O6PDfDOMhTzfai9HXNZDsChZKl68S
         2cILZuDsGUOwRRclmSVWKbVWnNlNJ8MMzmPSL0xhnU5rNLYqpCa/lHgmzGptsPTvIkIP
         kMNkS0CsTKZKsKkhFPhMNTy1AUxRCHddZOS4YkgULLnSQpplkVaqIj+9hVzq8tMMt6pX
         Xptjw1kgK1mhvlR7ubH2RQj7cKIlthWcKUO12UeXu+425yqKfiM1OYEJa0qKaN8zFJOh
         xtWJQHNVw3Wk22ywy0OyYX8Qls8uYbkvvyV4OjSWymVS78EdiQh1b9K+GibtezHLgE5F
         H4nQ==
X-Forwarded-Encrypted: i=1; AKwUvBwT1XczWtuBkIZ9dpYMgW1zqCyKDKsV6Kh09ghdRiO7r4iICDlOzFyglZRmq+u0MuDOQjo5DFmlkfAW/w==@vger.kernel.org
X-Gm-Message-State: AFq9FYLpy8CfcD+INCmJ+ZOWTmg43yVlG5Ndd7oEx+9wBQGc8T/qoNFC
	pwexYiKjpHSPEyeB9DmiVEvludX1s1n0f1s9V1jFRVs7enc/cOgdLwbL5ajkaIOjyJhVRgz34Gh
	WwLdxikzj6f3Di2LVCVuHrtwNXZy3RCeTNf7mUDgBMrg5xJ54ruqqb/vKEAxkS9V7cA==
X-Gm-Gg: AYBFou2cCqkywHFYGZjam+7HIhtKnkJVOjLrmjpveSI0xME4zxVQ8LQmt5+dFThfDco
	BXMSJKeFwOL6GTL8XQUAmjJRrevYX5t3khfA1aK0mGDs+TNDIs2MYlOKsyhBiX+tLYILSWKd1Kg
	5rq3BiB+nTTZ3732fc3UYNnS9/p1zaStgG4hgYkVLHfn+v04eEm1jO567aAhJZSWQ5X9dJE+IOR
	odKDbBPmctk3fYX8F4ylhM+K42Xy5PbTypbMksllrbatteRIZoSe714giJgpZ7Dyw2JV6afxklS
	Qf56iJNA3nQ8o/spEUU53VxhJ6N06II/KZhoLrt03pv4x9IYzlBHdAVqnncUHJfoqYYF13VYhQW
	QBE70+w+RkTbZdY0AnsvQ6OqLKEmOo7FoZVopUvSFc2Gzh/rLEKeeL0FvnCL9gZCxoN8NvL+JYG
	LP9BzQIcYB
X-Received: by 2002:a05:693c:6382:10b0:361:2a55:b94e with SMTP id 5a478bee46e88-36a24ef79d3mr1805701eec.15.1793192243425;
        Wed, 28 Oct 2026 05:57:23 -0700 (PDT)
X-Received: by 2002:a05:693c:6382:10b0:361:2a55:b94e with SMTP id 5a478bee46e88-36a24ef79d3mr1805670eec.15.1793192242839;
        Wed, 28 Oct 2026 05:57:22 -0700 (PDT)
Received: from [192.168.0.104] ([124.123.197.72])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a23908449sm6625610eec.11.2026.10.28.05.57.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 05:57:22 -0700 (PDT)
Message-ID: <aab38b8f-9e13-4c77-91b5-d3e12c0c5ce8@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 18:27:15 +0530
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] ASoC: qcom: sc8280xp: Add shikra-cqs-evk
 compatible support
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260910-shikra-machine-v2-v2-0-9bf6bad589d8@oss.qualcomm.com>
 <20260910-shikra-machine-v2-v2-4-9bf6bad589d8@oss.qualcomm.com>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <20260910-shikra-machine-v2-v2-4-9bf6bad589d8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: wqK01Z_116TM8YmtfO7rVgQy87gVAd9J
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1MSBTYWx0ZWRfX//o03L5rG4zb
 xgPJ+84xAPnZTIujlSjYcvqBpXsbeteC8c+WV9OD3QxeBEaXZIgDj1cQaC9ul17HBpKAwGEj2VA
 QsGLxbb3jPrmkg6cnSJLuHjcP7CPqqQ=
X-Authority-Analysis: v=2.4 cv=V+joQuni c=1 sm=1 tr=0 ts=6ae1f134 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ud/Gc3SFmwde3Mv7YyqU3w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=ct-79n1Jcior63b1T_kA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: wqK01Z_116TM8YmtfO7rVgQy87gVAd9J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1MSBTYWx0ZWRfXxaxO05bEUOOY
 m11OhRCS1ytf0+dNRNO+Em5Azwogq2eAz6342IIB9zNdtmabTwZiY/1aQNB7YmChFF2MLAdSTas
 7KS5yiFpHQ8kHaJSbLxWZzd0zohjvU9CGZzzH//BjTSiIc+sQNBM0Y8s9KWx85CIGw72xjjgWvB
 Ylx1miKM+gTPL0Hbu0ell0NTo+t9YuukM6D47de9fPI6RVmi8EliUiKxunIz2382ykqAsX+5E3J
 q5JNH6KonWdsdujphvNsWyV/WqJMDDWGYZrfk8TiQaZswR31jUjmzZNzqqJ9bE6qch4p0To2nmE
 VN/UJsfHK3EiHiN0yFGS1mqqSXLcFZSxTxRa54uYoi3iyKzI/LLL7pK0OGR8bg+YZn58r58AWa9
 qIFRQ9iu064JuOXjK1JXjwLcCVOgeYNWzaJe0FkgvElj6saBN23kk/+AXRGP0QlL1+M2huCthSa
 9KRpJkYTfpNlj2ptWrQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 clxscore=1015 bulkscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280051


On 9/10/2026 8:32 PM, Ajay Kumar Nandam wrote:
> Add machine driver support for the Qualcomm Shikra CQS EVK board.
> The Shikra CQS platform uses an I2S-based audio path with WSA885x
> amplifiers and PM4125/Rouleur codec components with modem-DSP based
> audio processing.
>
> Co-developed-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
> ---
>   sound/soc/qcom/sc8280xp.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
>
LGTM.

Reviewed-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>

Thanks,
Prasad

