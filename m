Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA1D123642E
	for <linux-sound@vger.kernel.org>; Fri, 25 Apr 2025 09:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745572082; cv=none; b=GcudtRkXrycs94jg1u3LFnwqvwBY/ck+QPyDvkmDdgL9wn5Ri4F5l8P53/WEUb8Xo4o9wYzliqjU6bHRc8k5xbwOvt+75JCvpouoTvYkFM6BJXFqw2WsnIXOEAVNMeUxyMdssALDAhwTK0UR2IBZCB1WujDkPSGg18lGGT5Kzxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745572082; c=relaxed/simple;
	bh=DsjDnHtiCgBweWj2Z9rRF9NFYYy/5gSoExnp430J+Js=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zxv6PLZJTDa7ApSfkTzaCWs2Sqi7IGJ3aMgl7zW9HLGbAX8wNDm2D3fdXaT9tMZXqjcCy1yjXXEd1P4WNh0OgPzpyB80W5xiiM7mRzolVwjCjtI2VTtcVQktjlohElmoaU1CXcCJZeSCDBYIVfYvJ+GtiBOm6enmIRa0TWrkOX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R37HHpOU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R37HHpOU"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P8T83U023790
	for <linux-sound@vger.kernel.org>; Fri, 25 Apr 2025 09:08:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=E7YGT9JoWm91VFNYG/u4ZzAL
	7c7lgU5OKZbu1IKjJ28=; b=R37HHpOUIk4ozHJYiR/Vf6YEkpL6IJnwmqdF+5D/
	Efzded7xua0q/u+CyTp9Zv6jKWBABfo7lgKiFApdm9UcbKC4jIf1amT0KxH3bbLZ
	FLWfEcCHT3wCUpHOqxSJ7752t7yf0yAv6XvetfRfvEKikA3uUX1Yx5HM8+azt9hW
	YQv78cpdaniUK/Bln8YCUxYmNVgQ0UJOsyyrXtNUb3FO/+vSAjCe90T2z5pPzFea
	mU1OG55KJ7uNj0zotoSiZhxPf0x/2Mj4APd9uY+bzL8UGZlotVbymTdvZ8o4b9Db
	zxKz2YpdNGirhCI/apCdUe3tRMWdP2hG2BDSbijWsWmAPg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh1re4t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 25 Apr 2025 09:07:59 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5b9333642so253839485a.3
        for <linux-sound@vger.kernel.org>; Fri, 25 Apr 2025 02:07:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745572078; x=1746176878;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E7YGT9JoWm91VFNYG/u4ZzAL7c7lgU5OKZbu1IKjJ28=;
        b=f4yUhX8eslHYyDm3kelBoANi/zCTAhJjKi37EjcdMxeyIXGbtRyXwErZWTmnVdZxb8
         QFgZLLW4QDjkG9sTTOisjdW/JFqQ8G01IkfqSnLDVMxRbG/PG+Y6VWZUpi4C37sXyLq4
         Bz2HajGddjEQu4HWCCe+qZs8qZW4APR1cVbnq+HazzNQEvbejPDomtKP0gARdym0OwSc
         7OPZMo7IsF6CFVNOCWzRrFuGEYsu0Z/y16o2D35e/H18jkApZzkY3gnBY1aoe1kyLY2r
         BOUyHOMEBBez/dyNofTVNQ7g/APu/0YHDu/5zYk82v4QTyteAUzW1w5h9yxihrWLkkni
         rpZw==
X-Forwarded-Encrypted: i=1; AJvYcCV/xjJ35M5SNjMI6Fss2SsEAUqjQ68GfEU6JmR4HDVTS3eecrYWeLS7yQTBc1btxQuN0hfLiK2S5pQT9Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4KU4YzNetNRXUXFpW/73lkDWEkV61wkxRHuuhyNN3ZAeD8MGH
	5RPYrTQCdYr3PZ/z9V3ACkSb5L28qHgEDjVDT7Oe89FoI8bobWaRwyYGqEK5ONL+vgYAEu7YeqO
	p3FvftJHDSKJYiKoSvIFYR+O6JlPaBNNlps4d2sKIXO/9eclqSOicbvYbSb6m5Q==
X-Gm-Gg: ASbGncs34sjpabvmOPWRSI9euPccL9QkaJDuUvvsp/cVdrk4526vlVuaghvtFHO59px
	2QHOOsExK+jXH2sRnorK4uSbMvAwvC89a9Hp2582vFSn+N+YdxeCGrWpSYVrM3wifOOgsadzWm5
	kr/Xz76rUuejcZKy1TOD5UgP1FtOBZ5HwBr28Gtqe12OL2zjh9jaxs7BzwpQyaGAPZ77EFwmp+p
	na3cdgI/7B3/H6xUfNvOmfyTiMDsdBRr9226Hn5M5hUyITaJuNGMCVyxg2vLlx6kHS5qEWUoN5J
	AJaHhQK/okpWTKksPyWhboeZ45RmJ9a+nRGau95ZzqmG8d6cSy71ibCtyUkwplKns7DxGGzU7QM
	=
X-Received: by 2002:a05:620a:1b99:b0:7c5:a463:397b with SMTP id af79cd13be357-7c9606e0b7dmr246312285a.20.1745572078692;
        Fri, 25 Apr 2025 02:07:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFHpqKgmY/joCABcKakjj51b/bf9LSO5bp8KVEFf7NSYBd5yr5G0Dj8JO9ClMIekjeU5G8jvg==
X-Received: by 2002:a05:620a:1b99:b0:7c5:a463:397b with SMTP id af79cd13be357-7c9606e0b7dmr246308285a.20.1745572078331;
        Fri, 25 Apr 2025 02:07:58 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7ccb83dasm520591e87.249.2025.04.25.02.07.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 02:07:57 -0700 (PDT)
Date: Fri, 25 Apr 2025 12:07:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Banajit Goswami <bgoswami@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/5] ASoC: qcom: sm8250: add DisplayPort Jack support
Message-ID: <cgog34zs3e43n23mkt35swvu2ibuoaav4ccrhjoizg6b4kgc63@36blexv25aud>
References: <20250425-fp5-dp-sound-v3-0-7cb45180091b@fairphone.com>
 <20250425-fp5-dp-sound-v3-3-7cb45180091b@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425-fp5-dp-sound-v3-3-7cb45180091b@fairphone.com>
X-Proofpoint-GUID: GnlA1IEKsDOrdsa5LzInHCsN9XCvXxNt
X-Proofpoint-ORIG-GUID: GnlA1IEKsDOrdsa5LzInHCsN9XCvXxNt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDA2NiBTYWx0ZWRfX8LrlpZ9mZbQu N8gMQQrCRHzGx6tiyEbTBCMTwhH+fwABrWOrAmjRv9MsG252DvBGBVzdtaEGG++Q/Mc5PJlJRXk KoFHtU9+Zkmx/m5ahpRVx7HXi3ES7nNjZfbr15gkQjfOvjRifr2ZngGI3LL3apfFEuqFCEupecO
 fA4rdjxUaL5t+wFyhScXifG6ZfdxN6Ur6rMVN4fmDZ9scDuAXxCNvhED12//ioCZgPue9763/xx YJ63qUriYlMKSvAmhE+R1NfB5Ovq8arnfhT4dSUy36+h9n2Y+mLnUZgY815JZgGuQqlzH8B+aAh cItEJXiC5wHQbc/H3fKBrTiGOB50SNG6ErsHt1iQpEM7ab0qNwQlGYfxhBVE5id8vvIC7YNpE9i
 J9e7IQjRNDX08jtPKE4+BpvpIdDAIZLKyAAuC/N1OIF/JSsGJUdj4rDQfwjeRHqhHc7XOhU+
X-Authority-Analysis: v=2.4 cv=ZpjtK87G c=1 sm=1 tr=0 ts=680b50ef cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=EBsx7UlYEkoSbB8InyQA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 mlxlogscore=875 spamscore=0 impostorscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250066

On Fri, Apr 25, 2025 at 10:07:27AM +0200, Luca Weiss wrote:
> Add support for DisplayPort Jack events, so that user space can
> configure the audio routing correctly.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  sound/soc/qcom/sm8250.c | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
