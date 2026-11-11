Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794403696;
	b=bD+IdK2vGMftZ6Yioc9ZPf6aNUd3Lyg95n21bTBuK0EBDZV4r1JGY6MaaAtYdCCOTvRR
	 fV08Z4NKVjJu9+ZjMo9tc2H/zC2wlnA5CT4xtKLs/j+f3oFw0AaoEbdsUfuq3B7g2eWxG
	 VLyashWyd1B43FPWl7ugNXE9+VAmO8y0ZSJWUDwFLkUyEp3hsG7dyB9XM8RdkizTi+NJ7
	 uPQtUfJw5SgANwMB6vMGWdZv5ltXWcbmqlwZ/YjeuTtLH5yJaQB2efrDqqZiQVpaKVbGS
	 o+kxW1tFA8a4ZkaPAijO0bLZBwOxMP7d5ccmzm+5N8/S4d62lAXb1fV2fSAYkpMlJcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794403696;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=D8tiVvDZECe3f0eKJKeC5Qfbzxcy8k/h5VkY0prNfso=;
	b=tMBiFYeifLN3QFr7/uYb+D2DHUcDygUQYkcUTwRmH3ZTb0E91t9IS7bryyN1frsIG9aZ
	 4SfhD42BHnKS91dpQr7G7ZLCP4kMkRdlysvjz/LisbF/For3wuK7+SclpOxgCgpEpSrzr
	 VC+7dtrf0/kMFCdTwCUX7Ahgkn2RwVcVZcMQsj1cnhBz4BHfIsiuKRISP+ub6WGlilNYK
	 ta3lFUHuMDdBqQhJ3BdFdjyrpaXkQpR048iM4GAnR464VmGYLLEMZ7l8NvmQJiQQF78sw
	 GAQPlCSgmwGfE39wnAR65HGvSB2ZKl+HjiBhXSv9fOE47uEy6ojeABjFfRygtVAYUXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cA1nNL6B;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="AReZ/EYK";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1468606A32A
	for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 13:28:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1468606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cA1nNL6B;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AReZ/EYK
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABCYvS91359098
	for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 13:28:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=D8tiVvDZECe3f0eKJKeC5Qfb
	zxcy8k/h5VkY0prNfso=; b=cA1nNL6BQlNjeEQ+n8jZZ5Gc/RZbeheDna8SfpuD
	2Q/U0dVRQ5f8ipS0A6O7B1e4vXrO5gXRimO/BHETxq5TXkB6Y2LyJchGOcQcRg4/
	8/1s7TEA3R12HQ83LshibgQHYs0BTyi1oWKgYgvSi8vUuF+T3A2R+GDwt4Fc7eGq
	YNxhAvRKSzsZKuhzsd040ReluQ+jSjsnwc1SN+4q0CqeorpNIr0MBT0wmyCRzHE3
	HNYvqzfb1GaXpeBuo8Mrme1XWbCwZK4/sRYtf+8/II2UDEekd78zmPaEAFOuAv7e
	xalaa+VE2aPalUnORiTbC1rjFfDBJ0esXnn/b14+SZTx7Q==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvk7pse7g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 13:28:14 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1b3b5b49cabso2854100c88.0
        for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 05:28:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794403694; x=1795008494; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=D8tiVvDZECe3f0eKJKeC5Qfbzxcy8k/h5VkY0prNfso=;
        b=AReZ/EYKRJ49uZ3iSJImf63HRUs/AnlYniXLTTWBe/c2Kq51F+cZ3LXdQ/XmrmZnu/
         cAe2E0J++IlHs/xwSeGu4+sRmGE60/LwLUL+l/x9H9GgeF4YHbN44oocMnBCi4xu6DGd
         vbS2sPvj+3uFUQFSSf8+yShwiUnsDl1mnBmkfOn61aarxemgsgYGQJXYYg0VTrfH98eY
         xRol9kkzLtSdYMxKcVsqusK/kkHAZCUtDynCJuRQzdi+/+9u1F468KLs6BgCWG1mzR4A
         nIetysNqvlZTrv/hmqpiiWr8rR6G6bTs3rxQik5JrnmDmyAUhtplHgS+axbr1sGiSnRv
         HyJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794403694; x=1795008494;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D8tiVvDZECe3f0eKJKeC5Qfbzxcy8k/h5VkY0prNfso=;
        b=BWL6AeeajBUPGCoa2jn0UYfabMwcHCMiv/kZiwqMqpD/vJUGjRYPCsVp1pnkhHkM9n
         kFFnhAMdE9zxf24/avDkcbqsNpbl7zD/K7+a1fbtCZ4u78vPKou2LqP4zgFHOOKBaKcY
         w7lhPbLMI7hXZHweQJR8MoP2m3lArcNNCYvYllWfANkBOyG9mw3w1CmuUY5oRFn/lcfS
         dYTH0jPeNULculDQC/v/5iwv5z/OtZ5+RyZFYMOF+6wkX3lEE6m3yEoK0aEfcEZZ25W+
         WE7Sv2wl1stwSB+UPFw7IBfRh+/Ju4YsggoNQ4KZhqiiuZ2hJnBJDRpXFN/9HDQEgzPS
         /ffw==
X-Forwarded-Encrypted: i=1; AL+hErHB7EDm7yrDjaDwJU8+Uf6/qG2gfB3eG9qP3SSRQlvdB3QyOj1L5LnHZGQIGvQpZIHbMUeE6Mr5ZA/9sQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z//ioOO/Sj184v8L6/c9hcjmpovwhuK3NsK+8wfwV7QRA7sMDRv
	KzWe8cSOk1Fyg0Rlyg4Jhtuvnt6LarVGzI5fwJq/Z7d5EN8uFgqGXrFFuyIFaVnohO69M91mEfW
	1Nw8wmS5ini/wTkqhX+4oI+6AijS58Y9ePi7YHCiihq8Xb9AZCl5SRiWwg5gez9ttJA==
X-Gm-Gg: AYBFou2uCVhNjyZT1kC+adS1wM878q5lCFHRdSSVmn1490X2zPDlOfbERkV23ypE7jS
	tz4YP757pU36Vx32jjaB+W2Zy6eLAWOVUJSr3UIvGvg1WZV72EC53OEBPtkKHu67Vr5tksIJDiY
	iV0uk6tGldgYMs4+osxHabbcufggOgFWJ6+cFvHNdvjRu+MGN+QpTBoFQvzKI7Exq/xVR2cWWrv
	OhYseWCGSiHltyzUQPLQ1kv93+QtBV5y8apdCCFiIvr1BhokKOP7TOnkyVGHjpM+4IU8xwku04+
	b585BnFMtDnPd13WsCunjobpBZNMgGsgIxfumoaqphj6ChMmb3WQ56fFT05Ncy9rOa+aNCSIv97
	6wRUK4eEhn6iz/h1TTQnBYrBWU3vCDR43qCkUYP5dG79ZgQM+ao+8pDn6WTzl4yTDqAZsYzerq4
	mzcz829yiN4qoZSRA=
X-Received: by 2002:a05:7023:a47:10b0:1b3:b67e:9fcf with SMTP id a92af1059eb24-1b3c03108bcmr2262518c88.17.1794403694207;
        Wed, 11 Nov 2026 05:28:14 -0800 (PST)
X-Received: by 2002:a05:7023:a47:10b0:1b3:b67e:9fcf with SMTP id a92af1059eb24-1b3c03108bcmr2262488c88.17.1794403693529;
        Wed, 11 Nov 2026 05:28:13 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2fc09sm33075620c88.10.2026.11.11.05.28.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 05:28:13 -0800 (PST)
Date: Wed, 11 Nov 2026 21:28:06 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Srinivas Kandagatla <srini@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Shenghao Ding <shenghao-ding@ti.com>,
        Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>,
        Sen Wang <sen@ti.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: codec: pcm1681: Acquire sck when bound to a card
Message-ID: <avRtZrCCdc12QBb_@QCOM-aGQu4IUr3Y>
References: <20261021031228.2074402-1-shengchao.guo@oss.qualcomm.com>
 <179390052368.3073895.16132231139898724200.b4-review@b4>
 <avGDRUwyEBk2qQaM@QCOM-aGQu4IUr3Y>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <avGDRUwyEBk2qQaM@QCOM-aGQu4IUr3Y>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1MyBTYWx0ZWRfX47czLGmzTUse
 LxhTX0o0gQT9cneuK8qVJELQR50jqRy+n8I5zGP8mqAfVfn+uZ4E9G2Efc80oFgSfIbaP0mmsGS
 1Nz6R7fhjA3Jrp1dJ9Hv6WmQyaFeqEA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1MyBTYWx0ZWRfX9TuxUfgqnXl2
 nATuC+J7etn0aDuKZIKqAh63DSIev8hKaJUYg/57TSSH75oGAjcmzDgnzenA2Xskr9KaFoGqOvb
 afeeOL0xuCf7vi2oT92i/eEAPoYzO/dFaTi19jxCtV6wH/eu3P8NPIgLJOSJECDsMh00VZTJH8z
 5j8S7d0DBbHFJTNwSzqRhOTIxZCCAf1IfevQqETIn9sU+s8ocwdtSiLbTyhckyymwkyiiTrseK5
 I9+NKOnEK+ALRPMOo2dYr68zIQSY8x+RwvF8k8Jj0lSHnN8TNbM3vuUnJ5BBVXEzohgQQvBMvIM
 AGE1BQR6HVYA2Zfad2hR300qsrh9zCqL9QlSZ/0ZOYxiS855GXbqvGijR6YL2S/Pg2r18NoFlsx
 NpyXd8HWrUUT3v5MNGZ5A/GwN8RiBo2PEICipfDzBNh01E9xVapSQeZn9c+b/moJFrtXVmBW1mT
 Im6VJnMv6JrBqtVqfPA==
X-Proofpoint-GUID: GBkZQf4F7phVDWQoFhv_zECpwxvyF0XC
X-Proofpoint-ORIG-GUID: GBkZQf4F7phVDWQoFhv_zECpwxvyF0XC
X-Authority-Analysis: v=2.4 cv=BpcIUoX5 c=1 sm=1 tr=0 ts=6af46d6e cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=mtvGxJwcMCaXl6bCzmMA:9 a=CjuIK1q_8ugA:10 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110053

On Mon, Nov 09, 2026 at 04:24:37PM +0800, Shawn Guo wrote:
> + Srini
> 
> On Thu, Nov 05, 2026 at 05:42:03PM +0000, Mark Brown wrote:
> > > The sck clock is taken once at i2c probe and held for the lifetime of
> > > the device. On Qualcomm boards it is an LPASS clock exported by the
> > > q6prm clock controller, which lives on the DSP and is unregistered and
> > > registered anew whenever the ADSP is stopped and restarted. fw_devlink
> > > cannot tie pcm1681 to that provider, since the provider node only gets
> > > a device once the DSP is up, so it falls back to the remoteproc device,
> > > which stays bound across a DSP restart. pcm1681 is therefore never
> > > unbound and keeps a clk handle to the dead provider.
> > 
> > This seems like something that ought to be dealt with on the Qualcomm
> > or fw_devlink side TBH, registering the clocks and returning -EBUSY on
> > attempts to use them would be less disruptive to other components in the
> > system.  I don't understand what fw_devlink would be doing with
> > reparenting clocks...
> 
> Thanks for the review, Mark! I agree this belongs in the Qualcomm clock
> provider, not in pcm1681, so I'll drop this patch.
> 
> Sorry, my wording about fw_devlink was misleading. No clock gets
> reparented. My point was only that pcm1681 is never unbound when the DSP
> restarts. The q6prm clock-controller device only exists while the DSP is
> up. So fw_devlink links pcm1681 to the remoteproc device instead, which
> stays bound across the restart.
> 
> Today the clocks can't stay registered across a DSP restart. When the DSP
> stops, the GPR bus unregisters the q6prm device and its clock-controller
> child, and that unregisters the clocks. The clk core then switches them
> to clk_nodrv_ops, which return -ENXIO. That's where the "Failed to enable
> sck: -6" in my report comes from. The consumer's struct clk handle can't
> be reconnected after that.
> 
> So I'd like to change q6prm along the lines you suggested:
> 
> - Keep the clocks registered, on a device that is not removed when
>   the DSP stops.
> - While the DSP is down, make prepare/enable return -EBUSY.
> - When the DSP comes back, re-send the requests for clocks that are still
>   enabled, at their last set rate. This also fixes the rate being reset
>   to the 19.2 MHz default.
> 
> The part I'm unsure about is which device should own the clocks:
> 
> a) A platform device that q6prm creates on its first probe and keeps
>    until the module is unloaded. This needs no DT change.
> 
> b) The ADSP remoteproc device, which already survives restarts.
>    It's cleaner, but probably needs a binding change, since the clock
>    controller node is a child of qcom,q6prm today.
> 
> Srini, Mark, do you prefer a), b), or something else?

I'm happy to report that we can go for b) without DT binding changes.

Shawn
