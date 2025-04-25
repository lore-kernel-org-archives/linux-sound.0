Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA5B41BD9CE
	for <linux-sound@vger.kernel.org>; Fri, 25 Apr 2025 19:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745607773; cv=none; b=Qt2vMnFYECGrZMjqCVL84NpKi54n3/OCSD7j14brickZE/oS8HvR3H/vqsB8993eGi8mFYbTKhOoAALYMKc4IPKYDg6VeNr8mKApoNoAbF5r+2QnXnJGSYtNI/MZQ/Q2/uApA/s7eXKtzDams1snkqUzuAIrJ7W02UWliJogi34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745607773; c=relaxed/simple;
	bh=pYCkWUjNE3NuFqcQEgnTKGicdGzX1if1k7WgCb8+6Sk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qta/f5q9npi/rzKyn98ZyZzZZmsKAqz3dkXEcaxU/X24PSRl+KWW6lblS2HPH2mC5Gosm4oTKJV/+/BMIKnle1FpsvOWpol3v5G0gugXjVdkfk6YXDqg9IUAQ9v7NV2y3A3ocKSq3gp/3udLnn3nMxRlxi7LKEbZ+Vh6ydhzNIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A0MPwPKf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A0MPwPKf"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJwRR011536
	for <linux-sound@vger.kernel.org>; Fri, 25 Apr 2025 19:02:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nkUUiT3ss6IH9EIAP3uPnI28
	FMp0pQeC3xvyjBzjGrE=; b=A0MPwPKfawqBaD6ROdG6oY3SGx5ZePkWdkE3TOJ+
	6va1AZ8QH/ZtqM+hQXghYzF4Z2Q7sPaxEehgHwvpulGN7AIwHQxsWLnEoXxB+MP6
	FZ4Ia3W9hKe61mUxgbWFGA0Cr5+3QPlZcZmuufEMf0VOE0Du5iPpA95QKmBDJxLG
	w9RYOeck4ixQuldhuL7Q0oxM/giaE423/PyFxK64LL7axYrSZbC9H3QG1NzBtcnF
	pd0yNRAcPMNjvLqf2xCMDjkzelIzveOqxqcuy8sHet3xIyUvO9tADWbOSf0ZI0hu
	XefuWasLyULaY8k5IPIWA1SdXqbHe18ajF9rdRjOfvcjcA==
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3sys1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 25 Apr 2025 19:02:50 +0000 (GMT)
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3d91a0d3e15so28293285ab.2
        for <linux-sound@vger.kernel.org>; Fri, 25 Apr 2025 12:02:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745607769; x=1746212569;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nkUUiT3ss6IH9EIAP3uPnI28FMp0pQeC3xvyjBzjGrE=;
        b=ABGKoURBuxhQD4/j24hHoZ5+PyilPLDkWunBZSWZBTPCDwtB9eXgS22jksHHqY/gAv
         fJyBl8D0c/lJkkEw30p0dKJXAR33qbhzN7dKF/wYjpSdL6MZgt5SrxK8lXkpxRs1QvGu
         nQlq40bnb4DnjtuyQ8RSY7HdveVufebAujXeqqx+s80+EwblFwGM3Rj1bIAB1ICQbvQJ
         7q1nhB4FNMmpxPW2ZL4OQkLW+2mk6KjeC+6VscT7OXSOTElwntSLlEfXBx7fuYRscklx
         nndZIZRSGGYODgLvakTAwLF+SpeUbSSKzrzj/mbQ6kXxYQwRb7vvIO6ukgo4wFI1wUj3
         k+Uw==
X-Forwarded-Encrypted: i=1; AJvYcCVAsO27zG+13Jtp+f8TrMHoBIT+3K7tMyybcR5B+SNLJdWj9vbdGD6nIUGqcGqQuXdw+KpeesIxxJuwLA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9/gIHigoVNJRyyDGJuFNjiB+/mcnrHZ/3nNL0gbVmSal2Fjnk
	pMGnE8pgFu58AejHFtbrpFhZ/rrlTQBXmP0OMh6xc2CGC8LrmMjB3P0I3n+5r9pZ0OHQIBCF2Lm
	4jb3y2olCjGGH3yCxyAEtEAmqu04nN8MjeKsXUgKSlafYU/NaiM3to5mvbKKulA==
X-Gm-Gg: ASbGnctvv6I5jippPVIR3bfNimybn3jwQjM86L51XImRBYqxRWt9sWDADZFReDLLaJ+
	JUpmZiFdrnby+adynKb4GLq21mazkWoMHk0c6N/1trYOPYIZQlQQgLzN+lX0/hesxel6VaVZOxF
	DXaght+Ofaxv7NpwFbiHQKuEVWMvrIFsihwqq8v8UXrVO6U3P2ayMPgFWq4Ld5fZMUWW0bAVnBz
	nFX92LkkNSSujJceOwPQbUNCbXp98Tg2W72u9tCWxFBkQvTK53v14tdNmpuWY//5I/ON05RagrM
	rAI6vg0jX3058jZLJgYJKHmT8pQAMezta4f/ri2A8m7oMvHAANAffQ1NiLVERlWimQ4aw4DFXwI
	=
X-Received: by 2002:a05:6e02:238a:b0:3d5:dec0:7c03 with SMTP id e9e14a558f8ab-3d93b479e3cmr39269335ab.12.1745607769330;
        Fri, 25 Apr 2025 12:02:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHhuXvdR/qmg7RMT82loQhMhHkY1RAz50Xasf3Q8QcQs/adSctEEm2ILPuO8VBKeb6d+RFAAw==
X-Received: by 2002:a05:6e02:238a:b0:3d5:dec0:7c03 with SMTP id e9e14a558f8ab-3d93b479e3cmr39268695ab.12.1745607768937;
        Fri, 25 Apr 2025 12:02:48 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317d206b703sm8497861fa.114.2025.04.25.12.02.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 12:02:48 -0700 (PDT)
Date: Fri, 25 Apr 2025 22:02:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH 4/6] ASoC: qcom: sm8250: Add Fairphone 4 soundcard
 compatible
Message-ID: <rhfklvynn27x2lwyygk5rpjwvx7p6bhbkmc5jehuy54ilhnzbz@wuhcndngavbp>
References: <20250425-fp4-usb-audio-offload-v1-0-f90f571636e4@fairphone.com>
 <20250425-fp4-usb-audio-offload-v1-4-f90f571636e4@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425-fp4-usb-audio-offload-v1-4-f90f571636e4@fairphone.com>
X-Proofpoint-ORIG-GUID: fEHNHO_FXSOaWZbU6o8S-C-hu9nAioAu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEzNSBTYWx0ZWRfX7Ntlg9k1sEkp pHagavf80gTM+rY1xTMflSqo8iq0eGzg15EJiesLn2nUg3clYH1yrV8BE4s0RY5CfwIrjVeb1Nx 2K15BTk5i6euxNkywdQjlEQlM3+C29P7LwdUyYm1mmZitBv8x6hppULYpLVUj9LVcDjFJrWhjyz
 q76xkf6l/iKhF7VY1LMHOp+Y6jaDs5T97cubNQ/wxYtrAIBoHNNcPslLl0dpcv+TPGKt+E/DO2W FmZNomJExyWBjQh+A+YP74YB4eDuxm7cVB1eKXZW1Jh52bbHcbeYqN8D489BiA2YTQEMedKeujh qbbTq2l27CcRPLoPZ9vgDykvnggGgZNT5mUgnuYXWnqA5JY90DzqaIGG/L/V801gc0YAybTI4hQ
 bl7VkjWd9k6ZB45TTIUR90ax/SaAyXIgUUEM9dAesMg+ZPKKE4v3hdkpFHbhCHQK5fFDi7wj
X-Authority-Analysis: v=2.4 cv=ELgG00ZC c=1 sm=1 tr=0 ts=680bdc5a cx=c_pps a=i7ujPs/ZFudY1OxzqguLDw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=GtLuwp1ogO1-ZJmtaBoA:9 a=CjuIK1q_8ugA:10
 a=Ti5FldxQo0BAkOmdeC3H:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: fEHNHO_FXSOaWZbU6o8S-C-hu9nAioAu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 phishscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 mlxlogscore=853 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250135

On Fri, Apr 25, 2025 at 12:44:54PM +0200, Luca Weiss wrote:
> Add a compatible for the SM7225-based Fairphone 4 which can use this
> machine driver.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  sound/soc/qcom/sm8250.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
