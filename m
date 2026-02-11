Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B7F253F05
	for <linux-sound@vger.kernel.org>; Wed, 11 Feb 2026 15:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770824898; cv=none; b=HBSYcp8bP+J58KT5xW83Ef58nZS9ZiqpHy1cAeXjsYWpuWgpgi0gVU6km3onm2BU98PeN3s3vgP0jyfI246mp5uGzgJXg65h7DiM0ucATcShCsY0LMCE8Z/QCH5Ewzucm825zf8rOWJzn/M1S9re6vU5qES23K0a/rrEvGy8Tak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770824898; c=relaxed/simple;
	bh=VBRIyNi8N+iHonVf3Yf37cRzgOZh5aKiZE9pdBVeAqg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tuHOCH6LtyzjKzyzugxfIaGumpNItOqJgmRVKi4rKDD2FRs6xVwR4V4t4MKodRgat5Nb/y8B1nKzGIRcBsSETTO29sHGZ+eUWKr6SAwC51IyczTJaWLbUA0gQfjB6AbaXGJ74yYbwnLMXdIDYlyAlRL8pEpAWmLMQdXKU9nPRL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=czgM1u8Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WURM3hJs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="czgM1u8Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WURM3hJs"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61BA9G6c4127437
	for <linux-sound@vger.kernel.org>; Wed, 11 Feb 2026 15:48:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3h+65nGr1zrxcuS9iSxavdhI
	M1kGZX11XmzGiEmECxw=; b=czgM1u8YsaaAv78xDzDhIMExxRKK2rReLpmCnnsW
	0IZ88tzqPfYeIFIUwqYg014cS8ov7I0FBT3qYbl4QeMLVcLyidkY8Qyb82X4ZjeX
	PJUGUJle0k/TmfJWq9vkv2oWGQm668EzWuz4CTM7K8gsRUJbpNTXLUItLSqQE+u1
	YzPkcCEk8c1Tn8QgUyIQH6ZkOPMU0DkcQ5IP9soWTqilCDBOf66iUs0C39EkvY8I
	YGCUZOZc9UZ+VqkufszRLXEvqMc5z7ZuO/lDfWoTQ5op9NlrGBOdzv3wZ8k8U18x
	uCtsrjFlWb5jZDlOLGvWDTgI/2ajfbEN8C0tb96ai0/dhg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c8gvm2d8g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 11 Feb 2026 15:48:16 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c6a291e7faso2533246785a.3
        for <linux-sound@vger.kernel.org>; Wed, 11 Feb 2026 07:48:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770824896; x=1771429696; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3h+65nGr1zrxcuS9iSxavdhIM1kGZX11XmzGiEmECxw=;
        b=WURM3hJsv2tt79miaOgjWS5DxyAy+HTzJIURzRN9B/NAeUd6CiqSR7epx2iRsq8+64
         W7E21KSBq60YDeJQMU1PRyRIOYLOGrdkSTca41qZT9369eVJJ8v5B0oZK4VO9Sz2xT3e
         yG6hFUng17ehVHZg7+Jj8vdCJPUEoPZ11u4dv/FNyD6gbgAgThOLXMVzRnb+jyA+R3/x
         +z9EJR7opy19ZLTJLPdyVhw9zmkHWxMdvZjQTWDgfVfHbHEPQKWWFUgOgjCBQQ4bqAJR
         5JVIo8ev71Q4C++j0vy7emiQMbMEG6Od0b6K8G1xzO0tqC6Csub4SU1JAnc2AHd88AhS
         2ysw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770824896; x=1771429696;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3h+65nGr1zrxcuS9iSxavdhIM1kGZX11XmzGiEmECxw=;
        b=T2+lZPrL6j0wV7uBrgP5+aOk64TCdxxihtZ/rOMOBxVZS6FY97iRvq+jWA4HoTI+Ll
         UtVvNPyoK0kS2Czz02j7mOsqOKz85v4NdI98aFQZ7VqEZKy6LO2Adxj7Bow7mtG/DNHs
         Mx2J1pFX8Job4tL4Aq//u7hKFTq+ZHf+l7trlPBU/NEgSsBgYLErDIKUk+5xp/ez5uve
         /OHY0b4sY68PD+GTfwKpNeqZUR63q7yE4BtSJO27liAJ8/hoZEnkVWkxEqtlsWTEumFk
         S4D3H1X1Y06kM3sC2uUugDVyyW8kvVaBt+4U+k519tlZ0r6wMmRkED0YZyBJZicOl4G2
         Biqw==
X-Forwarded-Encrypted: i=1; AJvYcCWaECwjV+vcoWEoFLqTtge1bieHuyvxxz22rsoNZiB/MTG15ug/0phi2PTVn5WCYdPfFhvItKthjQkp/Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+0XLRRFBHLTUKc75eVSj7/EmD4t/+LfBxuUmYkJ83Kh1/Qzcb
	wSxBKqNVWj3NNPh5XOneeejX7SANOh6NgI9zrZk0G1scKProAOEA2vV4k90tJLLy2TT0eETxU4C
	FXjggPNTdwqWaP9oDx+R/hbxgCV5nqf2+NrsfYGPDTeC0ES8Uo0uaZLImq/8Ym3UPNA==
X-Gm-Gg: AZuq6aJ3be+ttYCbpUeKjiv/e1UGFUxns3x3FBw+dStSta884+zipplaCp8Go2aBLzv
	xcCYEGlmjMj9tLQd80dI/x7NmfaUMPRd+Y2jqstBYcbIPjP8SZir3kfKCYIx/3gubTugewswfpy
	tF4sriP95nW/853OcOZP5I2wL/FSCiLJM9a6+ecgmFdDw9Dejc8P4/L0HSkp5h2LTSgvQBsy/qD
	4B8aGZHw+jAmLk//OgX+8Ihv7T0pTCf9CjXwToucopyzYW1KqMbQOf4OM4hSzZ+9U+6ZAo4ayEI
	WjNAq9sGqkgU0UGUFfzWl/q7Jeu0VjmdQcsxrEAfRQzYUGfjWddJ7cJyBLMXrNPq1iO0fDqm++L
	wX1B5l6PgCRD8T5vnVp6NQFFGaZ5mYOf51HQvmeynT6qUnp3ZySLvjBS/oCBMo3+vfmsZH/9kLm
	F00eS68mjwEJCahoXKmBeGtisnJlriSR72hlU=
X-Received: by 2002:a05:620a:7014:b0:8bb:26db:e22f with SMTP id af79cd13be357-8cb27fb7c79mr389199385a.30.1770824895796;
        Wed, 11 Feb 2026 07:48:15 -0800 (PST)
X-Received: by 2002:a05:620a:7014:b0:8bb:26db:e22f with SMTP id af79cd13be357-8cb27fb7c79mr389195685a.30.1770824895266;
        Wed, 11 Feb 2026 07:48:15 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e5f51edcdsm405137e87.0.2026.02.11.07.48.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 07:48:14 -0800 (PST)
Date: Wed, 11 Feb 2026 17:48:12 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Bhushan Shah <bhushan.shah@machinesoul.in>,
        Bharadwaj Raju <bharadwaj.raju@machinesoul.in>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: qcom: sm8250: Add quinary MI2S support
Message-ID: <aqjyq5rjovomjod3gmlwh7s3wmlmezom2ucg7j3dlvji35ern4@i55nyr2dxcd7>
References: <20260211-snd-sm8250-quinary-mi2s-v1-1-f62e49d85af8@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260211-snd-sm8250-quinary-mi2s-v1-1-f62e49d85af8@fairphone.com>
X-Authority-Analysis: v=2.4 cv=ctiWUl4i c=1 sm=1 tr=0 ts=698ca4c0 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=6H0WHjuAAAAA:8
 a=EUspDBNiAAAA:8 a=a9vZSWQi3jmT61OOzWYA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjExMDEyMiBTYWx0ZWRfX1/2tXZmwZq3p
 KET6cvDCBaqmjFy7a/uGibUnZXsNPP6lkJzeC0UmkHQ88p2ghpwK0svoAEm8it4OB6tACUXLRQQ
 mAZyofnD674AP1vMOrJdz5S2rpZ8Po6aaU4BLBOEgpMRJ5JXXr3qQ8e28QgupAgrh6aY6vyqllo
 uG3Mu2IC8j+01igS4T0Y2K87LBqZ5d9ZfdlQB300DZjCoW/6SSLiLUSXgPxYmCx+UPwJKRuk9el
 r9hC04ecREOREcUy4uyNA21vtON0gsNs5jXNmv+KQx/d+7yWQmWB0mzpVAlxkZLGhwtZ5YaAFkp
 KCCe7Rm0+PNia1YyFIs+5VrXlhsLJiETGgwZQ+d1e1Vr0YG6MJI9GM2sSGoVqb5CZ9h9IjWVdJV
 P4yE+S269jrPocV5e/sDfTBPbf0yLxVtK5ibFlyIcPi3LCbKPGyjy0CupBmWfqOPzVOn25mZLlg
 aPhfDV2aEds/fW/7Ceg==
X-Proofpoint-GUID: 5viO1MD6ePmF-Kuv_nuvXhcZ7-DIvjf2
X-Proofpoint-ORIG-GUID: 5viO1MD6ePmF-Kuv_nuvXhcZ7-DIvjf2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-11_02,2026-02-11_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 malwarescore=0 phishscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602110122

On Wed, Feb 11, 2026 at 12:30:10PM +0100, Luca Weiss wrote:
> Add support for the QUINARY_MI2S_RX which is used on some devices to
> send audio data to speaker amplifiers.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  sound/soc/qcom/sm8250.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
