Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8136C2F84F
	for <linux-sound@vger.kernel.org>; Tue, 10 Mar 2026 00:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773101199; cv=none; b=QpT06ZUV1CuRo0K66JpCpVLU4eqgr/ncUmd3DdNg2TjZxS9DM+S/QF2prOaiIrro9m4F9LM3wcm66wH1WlW0ArWj/xRb0pc2Ks673MX17i0A01WQNAYrZHAq1b8dRFp+I6FH1TcMv2A3btWQxRQjW8yUlbxHhj2VFWEktJRoQu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773101199; c=relaxed/simple;
	bh=tUmt6OxyYKm3dZ2u6t/zmku4MTRZYJky3GUiLcfgz/E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C7wL7qrV/P0R2tsc2rjSFqFtLdMKwQetr8foQKrFucfHL9Q5ToqRWOxStyDZh4A4e1qC6zwmtkpwNUtoCzq7KXP5r4VOPxeUaLIxczqx3PYoA0DXqxlc0OoAcZm5p1ULvsO5KpNCLQdSclkPP4uu5FsycREr+LrbCHO+ONC4tus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RH3i+5Hm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lz7hMBhX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RH3i+5Hm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lz7hMBhX"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HC4Nm2428017
	for <linux-sound@vger.kernel.org>; Tue, 10 Mar 2026 00:06:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Hhzas3m6jtpCWQCVIcrAsr4W
	EI6JkmKF0k2Y62ZMW8M=; b=RH3i+5HmDrcWtIsbYsGLYPAucQJ49p5jSFCP1XK8
	cmD1TTszcORCF20BgNAuXaMv/jJiLRErS8OSN8QmqlCTHyPy1z+QkEdtxohyjYG7
	A2mADZnPK9mA9JpXvpYpZGSIN7dK+BD6vZgH+2IvNkfpcXulgdym5sqCTauzjtkf
	vtuiyUTc65s3tMmjbV0vaKA2UBoopnEDP+Wh4kABNLM7l2sm0CNYv97yvtbjRe+8
	S+oMT8HwInm2qtDIf1ZRhXBmNqquWgIRW4C+P3hXW2N0zjD2euQ9JQXbhB2aEC63
	TEvjc5oqXJ7b/UHtcEB1uZLhcWij+XqY/Bv4WDu7ADTmvA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct1eksdh7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 10 Mar 2026 00:06:37 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd83cfb36cso1292987385a.3
        for <linux-sound@vger.kernel.org>; Mon, 09 Mar 2026 17:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773101197; x=1773705997; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Hhzas3m6jtpCWQCVIcrAsr4WEI6JkmKF0k2Y62ZMW8M=;
        b=Lz7hMBhXTcTAhut+tWMjq23JjIGrRVAj6Rwy/noN8p1xxb7jhb5SwVyDGw9z+3Hp59
         3X3LwkcAUVL9UAizuXmoJKhB3+TKeFFJHOOS9SqpJjVQ0YSOA/XjHtwSHxruxuKthPJL
         AoTDbyQh9UyVfUeUcO8c2tpLMxp8K5vD2uzDYWSyISP4bNZTE30q/N0CD1TRg16Ugc3H
         rYzjTxphR2PiThhK1SXaMD81PXGZQXkN/dGf6tkQh7KO0KExg2nlAEbNzHlKNN+6/BFI
         ++7CdmSnmAeFUYh6OybHOmJaUPaBn03nGQwRBYR6HXKqI1okFEz3VTkVsTSjRJHqv3Zd
         dz8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773101197; x=1773705997;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hhzas3m6jtpCWQCVIcrAsr4WEI6JkmKF0k2Y62ZMW8M=;
        b=D0nRNHWD58LGMQmLRCgddoPRBqIvrKcC9p0yuCDBJ7HRKm23Nme7qZV+hXLAwdR+jX
         zvSYSF9V29VZkuBStiFIutKMdWpFV1hW6ocANwtMpDDqmEapqVT9U2vVXa/Fg980yx4H
         dKee/icwhionl1lVjUyAjk48w7SViyH3lcwdY/VjKpHPTCnsRolYzjV6rX8u/xcB6Jxo
         26X9Rgb6C8LdM6tTWgGHuHH3WhhA9ulVMIoRo1kPocFww2G89pPabRfoER4brQWDazZM
         VRovht/eIiAPU1C8QxtT8loZV7SDDqL8h/1136wUO1cAqZ/d1r0kBoOTQ5TvWVr/f1wq
         o4dg==
X-Forwarded-Encrypted: i=1; AJvYcCWOw0VKrWvtiwtmnZNCKOMwX1H2K0Zyl9O/b74oLtoM2fB70yygs3P78i7AE8kOJMe3ta/sRiW2utMUHg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxdbb5vEOcSfWAdl2jIn935Mz2m+PW3IH5zxTcyjj8Uc45XWbhI
	Ie93sXKmWVii/MzbWaEHhR4yn57QsVHKetNcTFeIBMf6ZOrgpVCDPT1tqlVaXsEj3T4ZPTKih8U
	iU1dpTIeZjYp5fPjaaWGMGdih1dM1K+6DS9jZ94UkIVvb8Xz+YvTryf7N1X72SWgU/A==
X-Gm-Gg: ATEYQzyuE441iVrur8fe4+9sbCRo3UxtFWuNNOxTe85dZbWYPuC+njyFtT74JZgboFy
	HYHQagyjZw5wMvkSPjYN+68BNvDDSqHA4oLDkNUljuxRIVbWkL8hIsoeA+yL5EOKyvKO+XNmP/M
	8rsqqeIKCBgixs7Z76Rg0L/agfXOqO1BVhNH1RASii8nUjNWfjQxmS1q/oBGw+h8ZUvG7I94YM6
	vl/nSduIuBpR8AaFz6rx6nM8JA2xhwDzxkr7cnIBy4vw028NreBVct+kXwVRDiy0q2d7T1Ci2Ku
	VENOt59+b2EqykfwsfWWWIEGtjQadUNkD2XEVDpaF81gp1iq5X66zct07w4hF3KZrWg7fY0adGI
	xh8qVi9C6GPu1ZSrRHKRzQlMV1qEvREgEySLfC/T1BQRV2DJt+U6yyaYByoHIJDUjiLU6Mh3bPU
	Z8Gb0opzD55zy1GwnBOjhl3LwOF6Vz6do3+t0=
X-Received: by 2002:a05:620a:25cb:b0:8c5:2f36:660f with SMTP id af79cd13be357-8cd6d4afe58mr1491597585a.78.1773101196853;
        Mon, 09 Mar 2026 17:06:36 -0700 (PDT)
X-Received: by 2002:a05:620a:25cb:b0:8c5:2f36:660f with SMTP id af79cd13be357-8cd6d4afe58mr1491592585a.78.1773101196256;
        Mon, 09 Mar 2026 17:06:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13d08d269sm2464700e87.84.2026.03.09.17.06.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 17:06:34 -0700 (PDT)
Date: Tue, 10 Mar 2026 02:06:33 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: konradybcio@kernel.org, andersson@kernel.org, linux-kernel@vger.kernel.org,
        Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Kees Cook <kees@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-sound@vger.kernel.org
Subject: Re: [PATCH v1 5/8] slimbus: qcom-ngd-ctrl: Use the unified QMI
 service ID instead of defining it locally
Message-ID: <6dvg5nev7sbqyfhmzgw3oln7hb4b4jlw2yhrskrcibdscoziox@hir4jpjcrzey>
References: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
 <20260309230346.3584252-6-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309230346.3584252-6-daniel.lezcano@oss.qualcomm.com>
X-Proofpoint-GUID: v4mQZ3grC4aMp4kKwUjCPIhmUW3creIW
X-Proofpoint-ORIG-GUID: v4mQZ3grC4aMp4kKwUjCPIhmUW3creIW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDIxMSBTYWx0ZWRfX+5/HxsmpMnYo
 /gaIwxtov6W7m+dwuApEywGtfmwUgfMfWBHaepE6p0v9v99VPD2uiLJ4ZflRv4GPpuryNx13d/l
 SZxsUSwsmbJ3EdIf5g0tw7o4EKtm5Eui2abIDML1rxMb0kaC+HZbG7ZTm79R6g5M92Syzv2Q8XJ
 jyQWlYALCTJWJbuOlYp0Ccp2xpt6tObdGnXqIOpqyLN5hHVwGPprBOrv86f8arTxlQRn8VCrPQ+
 wtVlv3kA79x2+LCwF6FHGh276Ys7qVF3jG2bDyo5vNPZfTa3uXVrxYtI58E2p0NV7VYR9S8lkAw
 CkMnALsizS3mLlB7CJNvKJpkWogOeY7usDTuZLV/Yjjvfa5B4NHyrCZAcJIgE0wnGv6YhPezwGQ
 euYWaPXggjvHWQRwBthMlqJuP/SizZwWp8c6hiQM9uc7aFMjKdgQkodhIF3e0bZs4ieMiHlffXi
 F10nZ0YHLCCKoQg3/IA==
X-Authority-Analysis: v=2.4 cv=eIEeTXp1 c=1 sm=1 tr=0 ts=69af608d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=ho3SWJPnPTLIVTUpvTwA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_06,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090211

On Tue, Mar 10, 2026 at 12:03:34AM +0100, Daniel Lezcano wrote:
> Instead of defining a local macro with a custom name for the QMI
> service identifier, use the one provided in qmi.h and remove the
> locally defined macro.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> ---
>  drivers/slimbus/qcom-ngd-ctrl.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
