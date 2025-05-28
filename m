Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A437521CA13
	for <linux-sound@vger.kernel.org>; Wed, 28 May 2025 19:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748460221; cv=none; b=bFceZF90tNescUjPrJ9D+/k7/QwNo80KWdU5JtkERrixx4r0kfbQTeffMAyoxC5pEKOqTIEHsjrNI0s6KP+kqiFnHfr2ppHOk2MpUzLGkYhsN9SWD8DFtn7In7+mfRs+4ut4ZiXJ0l08Ich0HX6bSmYk16JuMi4CSUZPkOaj/gE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748460221; c=relaxed/simple;
	bh=YtbJtZ9j42kmjKldmJQf5mvGbou/uTiDwtCn4zRVBzk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SIe9WYNZVns7ORxcFH9e9R+hB+auWSSdN9cPvla/KYdQu5O+UReW3v7oWdafW0vMzzDdHB1YCxBTP7wxGYf5AErq6/X3xEC0g2QoZmd51SbpoldLdtC9ZT2BioWQu2BAUKuADIYZXjNJHNqnirA13mfOx40v7XTmAxFczfjHoN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lhTYe1pv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lhTYe1pv"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54SH5is8003397
	for <linux-sound@vger.kernel.org>; Wed, 28 May 2025 19:23:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tGIelMzb7anlOtz8UeqEqZt+
	4i8vYbVYnWcSqbgsCCE=; b=lhTYe1pvmICNCmLlgitNFi8n7jkEBn42BKSOuozy
	gH5q8YtAam5lLMoB0oEU/11m93Iptsqgb59u7tPaTCkLI7YllyONTGKVsOkzZhkQ
	dM6Ort9SaBW6z6lxQFCTxpFlKOsRe+swVpMccrmKVQN/YGJuZF0Yi5YLFbmPVud8
	/MEJ4S+ATaR8SZb11UXlyAfHGjjO5gX6ym06MU2YCs8j3DSXVVkgwFMGhsLpZCvc
	pWEHhYU691ynpJkDlOwmP9lF4XrDDwvMQwLVk8cj07ycyp/CRvsjzQpZ9XqumCL9
	TrhK3XMbNaJzzXu8jw1ljUbSNO73KRJdwCUEesepO1jnww==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46wavkw5mc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 28 May 2025 19:23:38 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6fac4b26c69so2250356d6.3
        for <linux-sound@vger.kernel.org>; Wed, 28 May 2025 12:23:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748460217; x=1749065017;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tGIelMzb7anlOtz8UeqEqZt+4i8vYbVYnWcSqbgsCCE=;
        b=MxkEN4dw1PXGDWxjbTkxvL/bmoSRPSLAHY94acHlAA/egrzsRrl4XbewpV1SNwBkzH
         lsJkIEfemRSS5CRJSPi+y7PAH4T7GXGWBS0eIvv1aiu+nbTw9ajU4qSvkaQH+jtb7u+Q
         Sx4A8yx+JqS9QqQ+g4HmsVPBztC7+tzYdxn6Nq+EGvTbFVSIQ1D8i8aDSFC1iUVDBNxF
         M8q8lfR91ykSl0HeQnbHO/ArVFzsFR8Nfc4s77A3kwQalzFi+Qvrg/YPg/3hOiKmpB2w
         N0+dHzLVrMWCE6S7xxuZGPMHEGRM8S4I0JRYQ4wfgagfpD7my0YgzZ4uDCLgZSvcmmz0
         jrGA==
X-Forwarded-Encrypted: i=1; AJvYcCWyGV7MjzdHk7HKZYsl9e4x2XbBIMLZY5EG6rnczG6LAXAbtFPdxRm61GhS7cwIJSvDoMhn+sxKUicH5w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzoSTF0czi3PtQwlOaUcJhE5Tun8o1IBSBIXBCp+Z61a3i6WgGC
	Z7qd/z8nHu0YZfohsamli6Oaq6+raAAraXHm1ECyujPB5EParAMsy/lWm+Q1Lic+mjQcykXgsTG
	tpooP1njNzlGHA3B0Q4rW3q+Eab2NyiQpckl5YLV4VB2ql3j99sJ3MXkNCDe1jHP+gw==
X-Gm-Gg: ASbGncujgSJAmpe6CW+ACe8qpKgpciQIjXIv/ITR7r1+7c2X1f96qPIUoKqPmafWYzX
	p8zQvs8ssMh+xmwTNd0aRLBURssjFELq/WpRxX9gCPsfs+2N0XGXT10dKN1cCco1C8hOcC0rsEJ
	qR1U6AAsgpGc/XLVGs3kQYNQEhT/ZVgizHlgd3vNlsLk8wbnfOh4igg8kCOL/Z7qKcCn3rlvEd9
	NZD/BKXRk3WhId/h1++c6CZXIwxcLU4AwsOYHbR1pH+c/AE+WYYQ+WcP4mEFYqF1VXpbL/qr1Ji
	0A1Cos9BvNujiFuT7vmb1sskBsF1TW728DNbxSGv/Sdg8ntvukg4LqJJRhG+FsLj8p8PCZ2wwqA
	=
X-Received: by 2002:a05:6214:234e:b0:6f8:b4aa:2a4f with SMTP id 6a1803df08f44-6fa9d00777amr236028026d6.11.1748460217317;
        Wed, 28 May 2025 12:23:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMPfAIcdcaS91SNuuMoIA5lDePhcYw7vO3zvie75YA1Cd8oqTW+ZaMVMUi8YvVPpHABq/2ng==
X-Received: by 2002:a05:6214:234e:b0:6f8:b4aa:2a4f with SMTP id 6a1803df08f44-6fa9d00777amr236027826d6.11.1748460216971;
        Wed, 28 May 2025 12:23:36 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32a79eb95e5sm3635891fa.30.2025.05.28.12.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 12:23:35 -0700 (PDT)
Date: Wed, 28 May 2025 22:23:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ai Chao <aichao@kylinos.cn>
Cc: Johannes Berg <johannes@sipsolutions.net>, perex <perex@perex.cz>,
        tiwai <tiwai@suse.com>,
        "kuninori.morimoto.gx" <kuninori.morimoto.gx@renesas.com>,
        lgirdwood <lgirdwood@gmail.com>, broonie <broonie@kernel.org>,
        jbrunet <jbrunet@baylibre.com>,
        "neil.armstrong" <neil.armstrong@linaro.org>,
        khilman <khilman@baylibre.com>,
        "martin.blumenstingl" <martin.blumenstingl@googlemail.com>,
        "shengjiu.wang" <shengjiu.wang@gmail.com>,
        "Xiubo.Lee" <Xiubo.Lee@gmail.com>, festevam <festevam@gmail.com>,
        nicoleotsuka <nicoleotsuka@gmail.com>, shawnguo <shawnguo@kernel.org>,
        "s.hauer" <s.hauer@pengutronix.de>,
        "srinivas.kandagatla" <srinivas.kandagatla@linaro.org>,
        linux-sound <linux-sound@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        linux-renesas-soc <linux-renesas-soc@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-amlogic <linux-amlogic@lists.infradead.org>,
        imx <imx@lists.linux.dev>, kernel <kernel@pengutronix.de>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH v2 2/6] ASoC: aoa: Use helper function
 for_each_child_of_node_scoped()
Message-ID: <mpj5pvugs6gz3rhjtntshvbwbtmi463zg6jc4tatmvh5uuljhe@44kbv4di2b3s>
References: <2aq0nyvyf7t-2aq4hsc7kp6@nsmail7.0.0--kylin--1>
 <7e708dcc98c6f0f615b1b87d190464cfe78be668.camel@sipsolutions.net>
 <eb1ddeb3-06b6-4ac5-b20a-06b92c7f1363@kylinos.cn>
 <23aadbd78d3585c900c579c26f360011cf1ca830.camel@sipsolutions.net>
 <9ec008a8-b569-4ad1-9206-fe241fb1712d@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9ec008a8-b569-4ad1-9206-fe241fb1712d@kylinos.cn>
X-Proofpoint-GUID: AJ9Z4CscrfTzu__FISBIe2KUzKdm596J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDE2OSBTYWx0ZWRfX5Rp+zmmkQy6o
 4PPiyKD0cp0nhRc0O+AIAOAnEoWyxbIuvwlDbbHMq+xqVYAQt/eCl5eaW7B/0+VRIJP2ksv8UKw
 jpeHJdYyP4X8WsylTazyJ276F+ZD6pEFm4OeKm41c/EVVve8OS1TFoL7vUZa1OJA+Vpy8TsUdWK
 ClwLANxJ+ZPgVSOyhUcZgQnw4W9sUh0uxrNoOrK87Cj59V5cSwoqCV/fBByPKBGk1F/EgEScOO4
 Icfk2m7VG+zN5K4LXuBu6Qg86btFifBn1qQejsxvn98FzwKQvIQ0CInXufHmUYI6JGHjpxqxJlo
 k0JfZX3r4fe3cyfPnr+Zx+mu7hO2Dz57ATrUURax/ctEBluQ9Ne0XiF4YF7VWd19YGgs+jGaO9B
 H35ZHHGoBhpGJwfnAbhNq9l/P4NFm8eLc724w1UB9l7hm4KlLFNRIHdS6dxf1+vcUZcH5Xew
X-Authority-Analysis: v=2.4 cv=fMk53Yae c=1 sm=1 tr=0 ts=683762ba cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=3idkMoHJoOCuPmDIWoEA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: AJ9Z4CscrfTzu__FISBIe2KUzKdm596J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_10,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 phishscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=417 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505280169

On Mon, May 26, 2025 at 04:20:37PM +0800, Ai Chao wrote:
> 
> Hi Johannes:
> > > Hi Johannes:
> > > 
> > > > > "simplifies the code" is no need to callof_node_put() .
> > > > Fair. Except that's not what you _actually_ changed here. Like I said,
> > > > either it's buggy before or after.
> > > > 
> > > In the function i2sbus_probe, it not return a struct device_node, so , I
> > > think function for_each_child_of_node_scoped is better than
> > > for_each_child_of_node.
> > You still haven't explained why it's even correct.
> > 
> > johannes
> 
> The for_each_child_of_node() function is used to iterate over all child
> nodes of a device tree node.
> During each iteration, it retrieves a pointer to the child node via
> of_get_next_child() and automatically increments the node's reference count
> (of_node_get()).

This is not complete story, you missed the second part of it.

> Each call to of_get_next_child() increases the reference count (refcount) of
> the returned child node, ensuring that the node is not freed while in use.
> for_each_child_of_node() increments the child node's reference count in each
> iteration but does not decrement it automatically.
> If of_node_put() is not called manually, the reference count will never
> reach zero, resulting in a memory leak of the node.
> 
> Best regards,
> Ai Chao

-- 
With best wishes
Dmitry
