Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A9641459F6
	for <linux-sound@vger.kernel.org>; Sun, 19 Oct 2025 04:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760846908; cv=none; b=B/Em0vLIdY3v/9uAPipIlU1qGm3u5FJjXPBmZ9QqIcdQ3vGCz3UCRAY3xkBV5qAyLxDIW3zRqBCmvRWCice0dV514te2+dwI+5SYNlodfKJ7ML3enctOexBUfWBkEEpQX161aetfvDwO7R8WKUO1th8IHbz7vdPZ02KdOHO+EtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760846908; c=relaxed/simple;
	bh=PYQScSZOYoE1QyTJBk6buoc5qNLZZCr+32xrpVAzVuU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e9F089hdlXcLl02X03+TtDmqtOJcqi58Xk0mZNTqWnvbDKjUvBr/vUQEgkj/+BkTPX8ts17YSZ7GGoYQvuPtz2uWfslTmcQYKcq0M7HzrJPnBg08nxyAmAzqrOpfmcuhpKaisoZdRDmwX4JsR0FRnEP7csvLDK+luexwKckmBfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XVWZ7fwi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XVWZ7fwi"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59J1plcv030126
	for <linux-sound@vger.kernel.org>; Sun, 19 Oct 2025 04:08:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eXtIl7gx2a3Jyse1CDj/YUds
	dckxFLnn5liYk/3DXnQ=; b=XVWZ7fwiNdHgJNJA672XFIDVSSDeXZsLaXAdgl4M
	zCHJrfEgm8LrYeUW330MrzQwl9M+tTIK3iP62ylNyAiih2Q8lqrICU4NGQ0aNEZg
	fBg6VzLx8Mjr4xJqnvKna3Xz6mzOsoOCHKk0X4fQPC6G72sl+X4EBIpQoVVNAfAb
	d/OBzlHz9JiGXXKeual49iQZnFnMbx67EolgQ9kq4XtHma93DecF8XByHabxEe93
	a0qldw06+YOTeTvz3yy4vNO1FcMnAyhBKSUHdwIZWLLBQK8PCVkheivK4BEwrgIK
	J1CBZsKbH8olCx74m0LWXdCJrubXyL2gKFb/Sz20PRpw2g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v343sr90-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sun, 19 Oct 2025 04:08:26 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-88ea6169a96so354488185a.2
        for <linux-sound@vger.kernel.org>; Sat, 18 Oct 2025 21:08:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760846905; x=1761451705;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eXtIl7gx2a3Jyse1CDj/YUdsdckxFLnn5liYk/3DXnQ=;
        b=Lc5mZChVFcLZwqhHmhFX9TGtdWR+sVNAS30XsD55zi7SCpmLTkeGr+ifTofhQjLIhk
         Q9kIuOKGqMpUcYyu1+Chq+VTTrNGD++IlHrJ0GbNT23ObT6YzLMbWz4yEZqmUO7VGpWe
         ZqM3yZpwXZj1Z9ucLE7pJAZtivUxPG2AOWNhuMTNnkOGDrOlDTqhGk7sv6YOFLmu/rF3
         1bVQKX23KxFqqi9WCJ1b82mjR7IlrRnXgzWezfsjFOWFZUSw/rghnZZ5n4uUPOaQ/Xiz
         3wf99hYha4349vEJRgn24vAiIJya2qOM9/DzgapSnnf4s/CKG0y8Hr7RWQ6gW3uYr4Pu
         xO+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUU/xigcumNj69ZtVpEkEaBRKzV19wk6PIafseXtj0MjvWhssjw4ovXPoUKoJHfIRiHzEVRCA3wdzZuvg==@vger.kernel.org
X-Gm-Message-State: AOJu0YySpTgMT0+96D3vLNXMiCikpSuqKI3oTNO4UsppXyNZIQbNIsBx
	sr0CZv50H/8XRBkLy99xet4vNPh7uF4sXDH0HOmY0zjKlxZS4Rplit1IbW0iag7EGOGWLbI+arn
	m8bEY2E/ui2NWXdnJZ010Ypar+52AqyoWvZF3g95n+9pKjnHnLJ98GL9j0zhPn6qVcA==
X-Gm-Gg: ASbGnctWGlw1V2T+8RPAJqslsibChpL69TN0mQwFd6Ii4vHNSITIYCdk5wnExqi9uUg
	1vA06EbR1zGpgsMbHZL21o8mG+xFDwWG2RZy+0r5ST6ETH0zWjvau/4DdIj4Blt0VcJtOMjNa+s
	MA2X7ftOBHqWEcbGPBbBMEzKGSwAGPnWCu+94NRowAHVe16nE3seKtGUKAzfxK9IKnzRmdMJEaC
	mv51F/GZ9124hrMTI+82iLS2iRJOGDh7b/gAbDtMTHRiBlrt0R1Dsdm7hP9WTjWRcUpRSFQxtq0
	/emSTkt4kvxfk7YqfyxzoMvrjUKr70XBE6j6YlZYjnq7a3cl76LHPQca/7ZC38dZQWsPrqY8OhW
	op89/Hm7HHgQy9kbnIzT4Imbn6J+FFg8GMiDUqfl+6c7I+kae0pTfLhmPRS8hgyz4396oV+z0d3
	933OIwvdtTjPs=
X-Received: by 2002:a05:622a:1793:b0:4e8:b4c8:3fe2 with SMTP id d75a77b69052e-4e8b4c8412fmr34739611cf.11.1760846905210;
        Sat, 18 Oct 2025 21:08:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEwjpMQMP09kJ0jfxgHAqYveaQLqrlnJM2EpETyDsZGjRJiaYgkp4Ad4myb57SXe9M/dpx8/Q==
X-Received: by 2002:a05:622a:1793:b0:4e8:b4c8:3fe2 with SMTP id d75a77b69052e-4e8b4c8412fmr34739361cf.11.1760846904593;
        Sat, 18 Oct 2025 21:08:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-591def16b31sm1225608e87.60.2025.10.18.21.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Oct 2025 21:08:23 -0700 (PDT)
Date: Sun, 19 Oct 2025 07:08:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] ASoC: codecs: va-macro: Clean up on error path in
 probe()
Message-ID: <oghgx6bzhcd3uoju2exzijoe7titw5kuhyk5g6hx7rdcgjsvmv@fvsefyhkeaui>
References: <aPMyw_ryay9LA5SW@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aPMyw_ryay9LA5SW@stanley.mountain>
X-Proofpoint-GUID: Yqu7gqhXUmxh5JvWdUthJJsma6EPmluj
X-Proofpoint-ORIG-GUID: Yqu7gqhXUmxh5JvWdUthJJsma6EPmluj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMyBTYWx0ZWRfX5CHAebSKrtn1
 USUfTCEEbSquVBupgDvzk388G/qnh9NP3uROpjdBdQUzuA3Dxvgmo+F4oYnrryZLZcRzhAbUX6R
 k3l0ZrlI/PlhNUYXOkUJdKwjn43xwNZHFymgk4a0rqElQSH//1gLzlq4gxd5QdaxMuaUwJtMCU4
 quB0xN7F0B2x9ITXEpvx1RSh5iQQrgVCY01RSzSArhzRMXQiKNX9Z2coB2zuBbfPxMBAPIL6rrF
 9FiOW5KU2HDv/PqEf9KJJhwKQ6fbrLCvw9p5XMxkiGhpfumMqlwDDzvdz7Y+uK0Dl8y7REEkoSc
 FJ/CXOPuPBUI574KPB6fMRF+T6DswFUFnF7vFsLdWq+SZetBaIP0b9n9GDOduEKn2whO0Rp9kuX
 CpmvGzE4DznqSXn9UlRfLjrgcmSiIw==
X-Authority-Analysis: v=2.4 cv=E/vAZKdl c=1 sm=1 tr=0 ts=68f4643a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=ebUXpRROGgZ4PK-tThsA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-19_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180023

On Sat, Oct 18, 2025 at 09:25:07AM +0300, Dan Carpenter wrote:
> Do some clean up before returning the error code.
> 
> Fixes: 281c97376cfc ("ASoC: codecs: va-macro: Rework version checking")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  sound/soc/codecs/lpass-va-macro.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
