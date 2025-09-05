Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D2E21ADCB
	for <linux-sound@vger.kernel.org>; Fri,  5 Sep 2025 16:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757090638; cv=none; b=VPMSLERyguuCPCeQowfm28ckWwgkwfohYJL/5U6Uz8Wr1fiLQiVIyENfJFCCIVQzrK5BLCAZuT/bgRWkI+h9WHsZHNLROixpjlH0cKzYcqar/zgDzWI5IAiUUvYy0DfhQujkYXLDXX5ZDnKJ4ayUJlWRnBg9CbD+8SmgW9/a9R4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757090638; c=relaxed/simple;
	bh=Jwq5Cmuwq0xKoPb8D5Y+WDIT0WgPSbIA0dAerV9mjcM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AXTH+VEp5Et8g0777HcImSd4dCiNISthGNKT4mWA+t9IIb6sl2OmWoSM8ud23A1lENgO2EJX5Q1ADMehFavJDEbwX9HHnfFKh9EeZkqrlb0/Do+Zbtccn2ouAkqkcw/COBNWCrMcDtN7ic6pEbHAafhhYpFJN8+OMOhdID8Gn78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C50OPR7J; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C50OPR7J"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 585GVIME031176
	for <linux-sound@vger.kernel.org>; Fri, 5 Sep 2025 16:43:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=suqflfzPR+pi7AQ5LgBM/gjS
	VWHsISZIF8XCQ8+m1Fo=; b=C50OPR7JbK6QmAO/hk0Gi2t9QdrxrrPXlfZljFgS
	zhxnNYCwJxIFnuO4x/Xg+EOca5PyZRjxrBXHwTh9KZUwhomSL7JOB5eAsQX3S/5Y
	uNvBg/ikrOuO0YayepymIyM5vZNnnr6cEoA8xkb4Rxly2fm5u6T7V3C0a6+vMVN6
	J0l1ud37ZTFqFX5Npdo4mjvC8OQPcB31dsnQRs3AF+1GIge6Ty6pzWM4L/95y4Gd
	MvmBTqiRa/6HGpyROCYFbHMzUPMkGGtlPfvv4WqoFmHfAjaR78wHAZuMtV8efEZr
	TXbPU+VbJjPMynxbyMm1lTcky0JsZasFs4we8Fs2SNkwCQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4903ev01g8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 05 Sep 2025 16:43:55 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-7296c012f86so37964036d6.3
        for <linux-sound@vger.kernel.org>; Fri, 05 Sep 2025 09:43:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757090634; x=1757695434;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=suqflfzPR+pi7AQ5LgBM/gjSVWHsISZIF8XCQ8+m1Fo=;
        b=tOVU1MMLMdH2//Zc48wJGIR5+gS5gtahQdZqqpPbcbSIrB2wUWvgteTdu0bhQj9OOk
         EC78I+EWn+tRBPpSp382c0aqTQ+aUxU2qsPNB8xHJ1qJBROK9TMRu36q0lQaFOtNkwvC
         5Wg4Eg9p06IIQYQ7wQhMGcoHYUP1Htj5Ew2sC33+Z1z8yR6tNQ+2h76ctYl00NYUFCMc
         E+9kMoJD3ATp2AHcr27H6tGLpb5nPze6s7pxkqYmJB5btuUmjy3XElYlEQutafifA9m6
         z8cCK99OBhermsVasZe2TArJFgp/ZvbwsThq49kwzndtZjzBh++7XfzTuiygkwemuCAV
         qLeQ==
X-Forwarded-Encrypted: i=1; AJvYcCURgeBvbo8vYVmSyUEhhYJnjpa6HLKnQdJavxqZDtfbW+vzIfR8CzIMkCVfKku8EtmgM6PUGd640MOTOg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyLCCLpC3v/CjNG21xBgA/fbsCE0QlwYcrJvm7gzvB9oN8vwOBX
	nRDKoNvRo1hFvN1B2OzVJslbhADbdy/QV7pUE7HBDjW77E3wak1CDo+kV+St09rV30Feb9dEpRr
	9e5+l4iw9I9Kr6qzaKBYqNRRzrFqtXA0Y5jh8+56f4FZsdRhz+wtucB1r1jUMX1L98Q==
X-Gm-Gg: ASbGncvXulKWppkPuzN4RDtOP3LVxgvqKOmWvHx+Qe/dlfg5iiS6AWQxpzi6XmujEQZ
	WnFe3DaV5Q8hZrZAxj6lULKHVS/YWDrQIyOhRFTZPkO7o7ic9KA6VtELE1fCR5sk9k6WR4trfIR
	IqQxDbJ23mxYbVD2RoRPElQ+ArANgQEWxO1QSIOkcZNEjj9OKwSAnI0DUO3QkwO+iS+jfVWjffd
	vnZA+miMp3p8/5zlM9PRG7BE0GYpOTUXI5Q9tfcfzDLAZM+KHYTKb9Eh3KsaUQXu5JSWwK+9PUe
	fFujdyApuUIiXwWLw3iS3yuhEsrTt2cctsbil/8vHnhgBtYdDclprlKel5D2kdef5WrdknB7scA
	/syrlXxDhDI4sLZS5yyoxw+XNmFPXylH3iQoAKMAVh0Z1awHlC6gu
X-Received: by 2002:ad4:5745:0:b0:734:8eac:353e with SMTP id 6a1803df08f44-7348eac384cmr17846626d6.36.1757090634177;
        Fri, 05 Sep 2025 09:43:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEhHOlrH9tvNA1dTB5GEq9RQjj64EL1qdRc5r/I2S1MBiKCWxrLuvxLGgufouv9wUmgFBGc7A==
X-Received: by 2002:ad4:5745:0:b0:734:8eac:353e with SMTP id 6a1803df08f44-7348eac384cmr17846066d6.36.1757090633478;
        Fri, 05 Sep 2025 09:43:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608ace8068sm1807051e87.79.2025.09.05.09.43.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 09:43:52 -0700 (PDT)
Date: Fri, 5 Sep 2025 19:43:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, tiwai@suse.com, vkoul@kernel.org,
        srini@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, neil.armstrong@linaro.org,
        krzysztof.kozlowski@linaro.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH v3 09/12] ASoC: codecs: wcd939x: get regmap directly
Message-ID: <qly2mvnlrmsoy3jds25i532etwcnljewic3zcc5dbm36nolzlp@macsnqtd3hqw>
References: <20250905154430.12268-1-srinivas.kandagatla@oss.qualcomm.com>
 <20250905154430.12268-10-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250905154430.12268-10-srinivas.kandagatla@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA1MDE2MiBTYWx0ZWRfX9e+sjHR6+Cmj
 xl+KobWp32OOCg3rLcf4qPZW6jlDV8gqJ2l4uXDoa0t5geKvCsJ7hImyAO46aFuXJq7E9LMmRQG
 eB2bXw3nL9pBhtzFoL6MK415UpwfS18LmhywPEG2HH4L6B6w6fJmybcVZ13XgxzGyGcmwnNDWz5
 3xiJLkjo5QrNkwJiIHmqptGvL0azE1YSAFNzRrLsPz+pDSkWxPUwm3YqrWOi0dyZL/pPaKAQF1g
 9Mx89gLjc8D9bCvp3HYoOIhDWLQt95FZuKxro6i3YooYort4y/1W1piVrN2WIwwuRAFVBVJuO9a
 SYW8cxzz6u3dDMgIvJ0Tyg3TwppRIscEMm+4F0HDwjbrrpIvB9FVYQjQh8rTBaTIEghtxLi5Tw0
 0G+dfSTn
X-Proofpoint-GUID: BgEHrhKFFe-OT-IU8JU9BXTByFZGO-_H
X-Proofpoint-ORIG-GUID: BgEHrhKFFe-OT-IU8JU9BXTByFZGO-_H
X-Authority-Analysis: v=2.4 cv=drbbC0g4 c=1 sm=1 tr=0 ts=68bb134b cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=4rFx_9ibI0NpJ5H6q0gA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_05,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 suspectscore=0 spamscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509050162

On Fri, Sep 05, 2025 at 04:44:27PM +0100, Srinivas Kandagatla wrote:
> for some reason we ended up with a boiler plate for dev_get_regmap in
> wcd939x codec and started exporting a symbol for this. Remove this
> redundant wrapper and direclty get regmap.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  sound/soc/codecs/wcd939x-sdw.c | 9 ---------
>  sound/soc/codecs/wcd939x.c     | 6 +++---
>  sound/soc/codecs/wcd939x.h     | 6 ------
>  3 files changed, 3 insertions(+), 18 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

> 

-- 
With best wishes
Dmitry
