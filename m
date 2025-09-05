Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5CF01DC988
	for <linux-sound@vger.kernel.org>; Fri,  5 Sep 2025 16:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757090732; cv=none; b=Xwr9VMIIdUQzQsfXdo7OHBNvYM1sKyWIKsB3FEOehqGyb+6qvmHc+glzot+5tVhQ/SPqYbpI7lPstx79W/hM3cCTaZu8xNPXtXkBGEQdV07puI8EQl/yCqTJvirz2cJA06nn4zrcuSz5v0yXM459raW0wmL2XYX62Q6+pUH/3ZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757090732; c=relaxed/simple;
	bh=4ndmFMUbOTTdZbdHfbff2gdinb3ORcxCtOb4ojVQ+GE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z66MyQDOdA4Hs1wqQ0MxTZPDKwfv88cJ14MpgPJKmXqmxyjIfXJABRtKrREyaRWhyQdRYxuhDWIYDx64MG61b+uZx1LGFim0WhUhw54wM1LRFijGRm/4VAYCzr4rh5XtizKy2XSYjwoqTImjJP1JrwbPa377gqBoxxJ5fgeNsgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PWdAgCuI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PWdAgCuI"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 585FkcMI031741
	for <linux-sound@vger.kernel.org>; Fri, 5 Sep 2025 16:45:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PY3+Jawa4aCuOeTafCiAiCV8
	LrCyuUCU77yZ0e5sHFM=; b=PWdAgCuIQXlQNWNX2cVccUhP+v5vZZ8aI1e4NbWs
	oP3pUbr+rnpZKOf1wRRe4rBcPVtqjdRyTdY6qwLOC7o1zNVXNnUyAJ3yQsGKwFaC
	M6qBhrAyXZUP1NK6qCMuMcbb05fzmI0WhXwGkONqfxIZP5p+hTBYlDqey+xdSAk1
	QjN2cYLHStD3nZKctEcLd9VIwY8u/Nitity2RaV5H9eX6wax4xufOuKzophrCQym
	riLqwHGPCfMkDkcxKVevEvemK/NoBm+HPrrQXfDsaaI0VIJdEPUOy7yq0OT8WMpN
	1H/XdTYC0SGMxUuDM/VB4l1hm6B6Pn9/NI9eeSBNgNG2Iw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urw0bwye-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 05 Sep 2025 16:45:29 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-718c2590e94so65150286d6.1
        for <linux-sound@vger.kernel.org>; Fri, 05 Sep 2025 09:45:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757090729; x=1757695529;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PY3+Jawa4aCuOeTafCiAiCV8LrCyuUCU77yZ0e5sHFM=;
        b=M6/SGz5lKtTgQT/DLATyujUwVtHipsvgu0sxD4+y/g3SHpdmYQen0vklZTjVLJpz1h
         apIztOTIXiFvZJ27Vw4s6EVGT7DlYfmNItbjMZebGI3usVuk/sCR25GrkfMlDzHsYOZb
         n+nonXkCU64UQQion8b+DAdhLq7aueTdkZ2VvttQOjaFsvTwhlqaylt+u3P0tl7p0qSK
         CMdE3fHu4sGB8TXOIohA4cjAcehU2HOcTgdkyh7UKaGFoZOmtmaKWmjJ3o5vHz2sGKn7
         C2VHGGonGvo9m2Wprn6uNxPqGwquR9d6xIdsUQPweWx6fZbgwTmqXeWKLNbP4N0dNauv
         Izxw==
X-Forwarded-Encrypted: i=1; AJvYcCX0ej30Si/n2pJVdWy7H5w0SOPTZoRzqrQmcs2NFyfnlBy/Ztc76NZTjh5+M6w18XNTne2O8YLqhu1R/w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzeXDlRr1Bsi1rT2xvzK/YnwyAtTc8ZCVN2bVfx+3HAbSAEey7n
	tHYvkupF2t8ViI/SQ1+N0SF9v2wfmOWIYlsYAPj8pwanSCZ0iABqx5hKVzRXOfy/ygnsHkrFw+O
	9NfNWuqIR7KIVyELlHMLVogEwivigXJutAmPYdkgxVPDHS1Iu9T+IlMdVwi3K5ppq0Q==
X-Gm-Gg: ASbGncuIGVQyjIkAGysGCn1eUnSaddIAJzVY7AHzhNxyTcFublEtHEYwm7w+qkd45un
	qfqXcs4dleYS0NL7eygRYpf//aHkNMOUMoE6xlClN3ke3wqc/z+bTIp6CbzYaesBy+u9fO/Fr1J
	ecJOIOgC1l9CkFvV9ECl8gcYbk4EcuZspwiW9E/uPXhTRmwzvtrXzWW44x9bqRzp4GtcosrI7lo
	tPVAJGt21frSjJEHTlLmz8FLtfOz/uEVd+mgFiQ6Zh/41H/RhCGBfNFqyOR89AtChyp2H7q0GL8
	yvk3ttSPWejgfzyG9VYli4fRgcH2bH+edPADXlayTVLqKrU85EpYf7yvG+9nqhxBtgb3qM7nEEN
	7tNmdjSPIZvD0hyQcaZ9hFqxYlZz0q8QSi2R/iSqOT5j7SWb8tO2d
X-Received: by 2002:a05:6214:dad:b0:728:c849:6dee with SMTP id 6a1803df08f44-72bbdfc9005mr43148826d6.5.1757090728822;
        Fri, 05 Sep 2025 09:45:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZtIjm7lssml3KCe/y4SRR3EJkskoy992JWsv0TItb9NXhJIJLjjguyWB09LWjXMqF3P/SNw==
X-Received: by 2002:a05:6214:dad:b0:728:c849:6dee with SMTP id 6a1803df08f44-72bbdfc9005mr43147466d6.5.1757090726359;
        Fri, 05 Sep 2025 09:45:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608ab5c174sm1911595e87.11.2025.09.05.09.45.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 09:45:25 -0700 (PDT)
Date: Fri, 5 Sep 2025 19:45:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, tiwai@suse.com, vkoul@kernel.org,
        srini@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, neil.armstrong@linaro.org,
        krzysztof.kozlowski@linaro.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH v3 12/12] ASoC: codecs: wcd937x: get regmap directly
Message-ID: <wml7b2iv66lyoozc2jypuf5xhkg6me4cdxac2chtrpmjubfago@qqvxiymn47sr>
References: <20250905154430.12268-1-srinivas.kandagatla@oss.qualcomm.com>
 <20250905154430.12268-13-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250905154430.12268-13-srinivas.kandagatla@oss.qualcomm.com>
X-Proofpoint-GUID: 04sH2AGikh3HKgYaNLgMdl5n6qkE0rVt
X-Proofpoint-ORIG-GUID: 04sH2AGikh3HKgYaNLgMdl5n6qkE0rVt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNyBTYWx0ZWRfX6BAVZ1GNo0Lg
 iIOyoI1LzqczdCa0kderoymLuM8G4UNlApDivN7BCkQjIeRhB/vzfB/9tjj//PvP8BE9Qn+WqKC
 zS7H1py6kW4fbQwju4bVBfDg0oI0HRA0oYhHiednjJbJHsPacfA3DSIJagE0iCKV7Vsz58tVKyV
 u/ZsvT80pya2sLVBMQzT9r+ve1kHNbIK2AVrHfwsHMwA3gjoH6Qdl7wIgXNxkrBiO24gKuPFoIF
 MQjAZnxn3C7/iOUxCDLFTrsVD/XiFLUOUPsXgy3qy6WMCqm0wmzvmLlkwiynqebeZ10IZSMK8TK
 SBm3Syp18FI38MOZAAKc2oxCLsXvfEsQFh/j7oiC4Ns3CqISdeoJbYDwynEbNYRDlWRGaWTbYUX
 fshqleqX
X-Authority-Analysis: v=2.4 cv=NrDRc9dJ c=1 sm=1 tr=0 ts=68bb13a9 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=azzZ5_6gx0kgBHoxRwcA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_05,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300027

On Fri, Sep 05, 2025 at 04:44:30PM +0100, Srinivas Kandagatla wrote:
> Remove usage of dev_get_regmap, as this its more efficient to directly
> reference the pointer.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  sound/soc/codecs/wcd937x.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
