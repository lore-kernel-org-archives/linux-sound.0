Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8026A253F0D
	for <linux-sound@vger.kernel.org>; Fri, 18 Apr 2025 23:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745019620; cv=none; b=GUAdzYFOvS/7izK7Q0kQO9WJG3wBajGO1U2pgtm0R1F1cNHZQbmL5QW7eQwk4KVOtBxX8c+W/feg0XDDod2u/Mjqiuj/IBJ0YFNBadIi9/GYVoksu7h7/k/dur3/VCekWkOLp6LcRFdAOTPt5Nn3SsMxvFjFQzPRI7HL+Z2LuCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745019620; c=relaxed/simple;
	bh=EuDY1IpPR1LcKu27fqwYJuFiqjEqc68Epq/PRA/md3g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U4BrNqk3V9wW4BQBlSvWfEx1yL2VxJETn0ow8p8qArtu1ch0dFhc7NuciSNB7QqsIwaGOibwMabfkixmLI+YLx3J+WdU8FUYJCMa0SEivBH+54qmGBN+7DehTME2rqUEDQ9Qf4QGJETRuWfiSF8tTqLJp+wrJ53JXH/gLKleIPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R8sCLnCk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R8sCLnCk"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53IMP2Ml011217
	for <linux-sound@vger.kernel.org>; Fri, 18 Apr 2025 23:40:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lm6rnQ0Vk4Y1vVeAc7d7uyLp
	55ebBlbOTcShD4fBUPo=; b=R8sCLnCkhQrZcGRr7Slvj81KwFNn5EHOJoUlC6yd
	r1fTQCqEeK7KeAbx+jGqVBcp3ISVJ6CmpVnrhTubg+ViPbytNtFLt4RF79CtMX38
	1lF6EQv9dp8k57Z+hXK8LkMdn1rCswzdwkB1goqG7+AtDCU8NxKWNVAuBQOMIRVY
	iaYyYUKSg3tlrxfvU4G3ZtKPlJdfb86G3DjMiAsjXH5Q7pxLmkAONHdtc5mYkEvm
	A9BES1iUaAc1lKVgO5kA586GiGGmZUDvJxdte9m/vwdE5430ub6yGl5oYrlEAGrv
	XHTEtVInF4mHy522VkF4h7MM8l/G0gj96D6IX+e1V2S6tw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yf4vu95v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 18 Apr 2025 23:40:18 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6f2b50a75d8so30068706d6.0
        for <linux-sound@vger.kernel.org>; Fri, 18 Apr 2025 16:40:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745019617; x=1745624417;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lm6rnQ0Vk4Y1vVeAc7d7uyLp55ebBlbOTcShD4fBUPo=;
        b=eKH2aoPQfIoYPN3J40k+7gT4Xb6EYg48NTsoP8zx2Vbj6096ZMu+u08aCa1wpEoCCG
         t7VxaeHJQqBcYnpUlhn2uzUy6H2kzu/ae96TUSSxDF7UKDmHRIcWu4BTI03Odzt7Ug4t
         fxtcGeMor65STMicqz5eSS/In+AYiqIofTQf1W6VL8kdS8EkK5C5JQvMapTLauUUazCG
         de10lnapqCp5qZGIy4xvI6R7Mf80kkduQw9jVriNv+K/iawOCl9gyThbFX/tzHxoTy4r
         ohyIYJYQ6/yMdj284F3l9Lx8SVPa6KdjK6sfEXhfpFI3479FM9m9hcdAwKY/3c5wayTM
         xAgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjZYJvc4bWiL8YtE9RK5p4gQmHeMxhgkSgPD5ZgWmAsGq/Pkryz7mhUxOMWprhIH6avjlXr1cAv73WfA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwD8RUKYXOjzc64jdUsqmyYxYuHIfI0XkugXdPUi3wok6fMBG6p
	i6oJq8Yk7O1l09YY7pb/CvRzvuDoOTojBDGBATjFCIcgoG+CHNlq1abosI1SOMZPTOkA0rL7HdJ
	CcMx4ntmPLet3Tq++vq+kebcl4NAdAfX/BVq8bxouVO+PVkhuvnFqjsIAfVt96A==
X-Gm-Gg: ASbGncssslwJgt9qLBImRsr3/zFkfZofNurOGPBCa2TIvkDDXpz0q1X9BGaNuZEUx/w
	qPNPZdrns8ewey5MvK6qT5abtlXyrC6ZRFzHwrgDcl3FtxdHJclh12os9WPIgyerczqKIvT5uK6
	saU6A2efz1911oF/ppqvDtwX/HZ5X9509Y2lj1unsIvkuugzj+fBNB9u569yh8A03It3zf3SgD4
	g+zqFVDQxz/wWbLpXKJuuYpoRJmylqQy3tj/tTz8RapYwv8crDUe8K2h59ZKntsHNsZ8HB9ZiBA
	6ox6TdteCsv+l0wANqmc7G9FrkI67hC2ERpLR0fpwD24jutyry4onRGJhcO6sB85vfkwV5YkqrA
	=
X-Received: by 2002:a05:6214:21ef:b0:6e4:3ddc:5d33 with SMTP id 6a1803df08f44-6f2c453833cmr70675846d6.13.1745019617303;
        Fri, 18 Apr 2025 16:40:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEptrizXDpGIInsxXlsRaw2C67eYnfSjGJd5jrhvlihf9BInUzyR1taScSxhCfM1bAd3UKK7A==
X-Received: by 2002:a05:6214:21ef:b0:6e4:3ddc:5d33 with SMTP id 6a1803df08f44-6f2c453833cmr70675676d6.13.1745019616973;
        Fri, 18 Apr 2025 16:40:16 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3109075e3d8sm3500411fa.15.2025.04.18.16.40.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 16:40:16 -0700 (PDT)
Date: Sat, 19 Apr 2025 02:40:14 +0300
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
Subject: Re: [PATCH v2 4/5] ASoC: qcom: sm8250: Add Fairphone 5 soundcard
 compatible
Message-ID: <thq45vas3rbbwvnwijlhn3bbi4e3wbdoixybwoyactm5yqkwnh@qgpxuj5xytr4>
References: <20250418-fp5-dp-sound-v2-0-05d65f084b05@fairphone.com>
 <20250418-fp5-dp-sound-v2-4-05d65f084b05@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250418-fp5-dp-sound-v2-4-05d65f084b05@fairphone.com>
X-Proofpoint-ORIG-GUID: hVF26ALMRck8dnaJPBYBUuUVW8oTL7sb
X-Authority-Analysis: v=2.4 cv=IZ6HWXqa c=1 sm=1 tr=0 ts=6802e2e2 cx=c_pps a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=UbG2kAVU3ctyu_xrxRgA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: hVF26ALMRck8dnaJPBYBUuUVW8oTL7sb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-18_09,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0 adultscore=0
 mlxlogscore=864 mlxscore=0 bulkscore=0 impostorscore=0 suspectscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504180180

On Fri, Apr 18, 2025 at 03:13:45PM +0200, Luca Weiss wrote:
> Add a compatible for the QCM6490-based Fairphone 5 which can use this
> machine driver.
> 
> As a note, QCM6490 RB3 board is using audioreach architecture while
> Fairphone 5 uses pre-audioreach.
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
