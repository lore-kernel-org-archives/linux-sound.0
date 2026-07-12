Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D7B1917FB
	for <linux-sound@vger.kernel.org>; Sun, 12 Jul 2026 10:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783851426; cv=none; b=M4C98KPW1AZRvCVfwnKQ7U7xzcMyxxfYFLyz9ruXkbxaNnkMTEIxH2aEt3NrADfvB0fMf0OTpaMzyzRcCBvK8hk/DcoP7s8V8sNk8TnYp7hDSlSGLVcUIJEsBTuYpGIkLHx7nLT4bM1oenkAl6tSdSQg/pCro3WDRD1wYhCxl7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783851426; c=relaxed/simple;
	bh=8/nAhx0U9lPfJ/3UZCa7116qc8bk6+9oalXt7noDLe8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VFGppFRk5lj3nV2iP4EgQvKFpQ+y8kR0eCRiZ2gdBkdAu9ts2TCzbdibyVjG3Bxvylhf2bD3XuLZPH4Geu5mFfurhjO1QGdlGkC9gYhE5TTRDRJ+zrOaBv2eEbQnoKp/6Zz3Ic4fid0jSVFeavARpspH4/VUzIqWo84t7EFir9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TcdywV/v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jOTkR+Gu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TcdywV/v";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jOTkR+Gu"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66C9UVYm2068013
	for <linux-sound@vger.kernel.org>; Sun, 12 Jul 2026 10:17:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kTvxjps4eROawjZBgxnV201Y
	dE2QzA2QQ1k2r2UcRA4=; b=TcdywV/vnEEIA006FwxTQ6S1QW+0Esa9QDL8jdxA
	y2ypJsBk27z4Km/8mR1fUI8TWQAPIEt/04kdeg+x8D1b2+PPzxNGHq7rZ9wm2JtD
	T5RrVyACmTP6PVmukRT4mgmJo7KFf737RO7GwYWhCJVyRjYXnc3aM6TW2Sg3Nlgu
	zQHnI9b5krQqAoMXbiCI2FFo9XyWTjUGaYQd1znq46B802odlXPnkVV75D6WrYLh
	XlfeDeBTWaQFuGwlTmeBKEMgGaAp+N+mWPQlhD9iptSzUSlImHP8gKejVC5t1n+T
	z1xZMvpbfeihXI+1eyomiM0wsDZK5tf0ziGWLOZSzNXqkA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbf482ew0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sun, 12 Jul 2026 10:17:04 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-73850dfc198so764587137.2
        for <linux-sound@vger.kernel.org>; Sun, 12 Jul 2026 03:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783851423; x=1784456223; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kTvxjps4eROawjZBgxnV201YdE2QzA2QQ1k2r2UcRA4=;
        b=jOTkR+GuUoiSwbNT5AZEkJmGjlF15QfKtLFZdaz49yIl1XE8JKB2HAe4/av1rbMEeB
         /nePF3b/ymansWwr6+PlOcZqU2yMYYfW69IXCgk2LbtDID+uHsEr8TEv+rmKS91gI06W
         PmaSb374xcSao67qc1PGx2JMIiJxhl8adWFg4i/Dazubx1o4NDyuodXEFQpm9kccp0jT
         WRenGvZPjIM4z5AxpoTpztmDI3reWOIYXvGqWOtBfXniIG1jdZDBHSfDjA/HwrRAltyT
         3HtbgztYOfPme9prC4xHVnucdAFrfqjTMj1NZk3uJnDSHgx4czXW1d4tk/HVp2m3Te/d
         PMOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783851423; x=1784456223;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kTvxjps4eROawjZBgxnV201YdE2QzA2QQ1k2r2UcRA4=;
        b=tZQavDPs5ItZjWUHpBZvzPuiybIdPfMGbiRJi+4lQ3n3mS/svdlVYSGavdtRyjbbTy
         W1kfJFMDpGYtOsZApgoZ/18wS2i2z1W0zBiaVu6+N4EsAbL+udAwX75H7tXi1dUTdqTF
         WMppPOacArfMN2gNd+19SuBnKXof8RaJesyIy5c/J8zt6M2/0eV43+8P1zKHPeVqUuBN
         nboD5eW31ehWk2zG//WuKPDEMNFs96Z1m+uAXTERq+1GNn/LrsImeREJvnAPN95ZZ75L
         Arb5+cqsrEd1u/g46FKQl6opH5PytBrLN8nZSEkk8K2o2bkuFMaAF/90MAUiQ/yR6+uT
         QJRQ==
X-Forwarded-Encrypted: i=1; AHgh+RrJbe9jWUHrn8dNoMUHAj4YwgCZCEinDB5nCQsoHnRnCrqZ7+U6x8dDgufhtDYTUsOjupWlxet1tJfZrQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwpWro1yLmqrXCafzmqIsO4+b1h3hr0XDnnZVyM+Eh6txLAvARp
	XTtqRwsSd6h/iWo38GU9VF/d8ncmGMAc1Nt2RUyItTCKo4nWpLHIk+HJgT8qd3RW4//qkrKx6NJ
	wTGSm5+Y6B5FEoxZ4JrTA+tOggXHCodmA/I6yamCjO9UyjdQSzYCYZpXqY10lT24KPg==
X-Gm-Gg: AfdE7cklqcmo1wOC1qUHWtx/aSlzCNdyKUQWvj4E3X2Qzk6Rn2KjB4xftGOJJVbpU7z
	W72bQlxd8UgOriYXIo/c1AhPLyOhG/IAawJdVKgkaPNl/SXNMOgu1rtzqo5mRagm6SJZg//n1Z0
	6xJT9SzyFZkyUUbqXjBN3OEJ2OfDYvAa7FqvKeBYWnm2HE0O9KrdR1EcTlIfTkAMa06ocf9atg6
	/lomfZTEgV/ExTVA0DhH5vmohV+s+iKAYCbkNLV/SsQ/Yaey3PztRGo4e6HJMDTR2Pbo2IUSmxs
	Nvjf0o3MTP+SMJ2zZSpZkX9Ug5X0roY/e8IaVx/UcfS4fRaAfdAOm9Kzg1Lz9/dgo7oQsujvORT
	dM1F+jxyIA/jjRGKs6G4zkKJsIzF0TN0GBuzHQg4bKn9FknEH+GyvgOyNEJRrNx4A0UftkYSHne
	hMmM+1EtB4ghyHIjuIA7KFn5dK
X-Received: by 2002:a05:6122:218f:b0:5bd:faa8:74e1 with SMTP id 71dfb90a1353d-5bfbf4da3bcmr2919332e0c.13.1783851423183;
        Sun, 12 Jul 2026 03:17:03 -0700 (PDT)
X-Received: by 2002:a05:6122:218f:b0:5bd:faa8:74e1 with SMTP id 71dfb90a1353d-5bfbf4da3bcmr2919310e0c.13.1783851422514;
        Sun, 12 Jul 2026 03:17:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c84b97553sm22237151fa.33.2026.07.12.03.16.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 03:17:00 -0700 (PDT)
Date: Sun, 12 Jul 2026 13:16:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev,
        Kumar Anurag <kumar.singh@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>
Cc: dri-devel@lists.freedesktop.org, Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
        linux-sound@vger.kernel.org
Subject: Re: [PATCH v1] drm/msm/dp: return 0 from audio_prepare when cable is
 disconnected
Message-ID: <5ixuxbgngzobl5c5fsyahdsouohwuykoat7s4hy6sczrye7vwf@rj7nmn7x3c56>
References: <20260616151252.3599089-2-kumar.singh@oss.qualcomm.com>
 <20260616152536.D81FB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260616152536.D81FB1F000E9@smtp.kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEyMDEwNiBTYWx0ZWRfX7G0qKc5D655b
 AxIyYd2fitJelIOfzxtUVtJoCJMu2JlUHMCirlx6UoOjdaV7TCWAx6ohq7DAArhktXUglFwZDjw
 xXVX13vah34yD8zRbw3ETfBBlzGF8c0=
X-Authority-Analysis: v=2.4 cv=OsJ/DS/t c=1 sm=1 tr=0 ts=6a5369a0 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=8zdHjTvXFIs7SsKF2MMA:9 a=CjuIK1q_8ugA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEyMDEwNiBTYWx0ZWRfX05QNSeYduyw0
 9D8rOGSn1mwi0v/kwBQhYWNa+mn+YtF895yVfpwnbrH/IVFF9LCzQNJsRkI1/ufNbjpLNK9pzF2
 8Y8bss3XwEHITr2lE6632XY/AE7nIhekZQuJtCJ9BPuCQCrD3FCg9lpcLDBKyMqvyP7YvAx64Kp
 1B4YR1iA+tg3tyeOe1BcH4V78TIBNgZE4mjDR5luCr6vAtUNY8ywvy993m7JqY2IMABwZdbCkdH
 ANSkcqhxsL/WpXlDUVrTZtEJ17xHuo3hOmUX3KtVnegsm+r3o1+o8Xh2mE66+jtto84Ybvr8iUN
 4YQjejGLCEwDZJdP2HWOdOptYhiQ/x/wKnj6d3APGb4Plf4h1Pj8LLZKAnV7wZbuAVDm/1dJX9J
 TrAqFIAVbztEhRL9uvFTUBuqMGP6pfTqSYKWRFeZKerrBZ0OVoRekVFLFqQRyiwjnvErOIOCHrZ
 8NaEIsuLBVHxSylSgxA==
X-Proofpoint-GUID: fcjy4pk5NOPdBq1LzreDiQbxnSc6t-Tm
X-Proofpoint-ORIG-GUID: fcjy4pk5NOPdBq1LzreDiQbxnSc6t-Tm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-12_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607120106

On Tue, Jun 16, 2026 at 03:25:36PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> 
> New issues:
> - [High] Returning success (0) from `msm_dp_audio_prepare` when the display is disconnected causes silent audio failures upon hotplug and NoC errors due to unclocked DSP hardware access.
> 
> Pre-existing issues:
> - [High] Race condition between `msm_dp_audio_prepare` and `msm_dp_display_disable` causes unclocked MMIO accesses.
> --
> 
> commit bfb65364e66313dc1385a42e09172f44a1e1fbd1
> Author: Kumar Anurag <kumar.singh@oss.qualcomm.com>
> 
> drm/msm/dp: return 0 from audio_prepare when cable is disconnected
> 
> PipeWire treats a non-zero return from prepare as fatal, marking the
> DP audio device as a dummy sink when the cable is unplugged.
> 
> > The active_stream_cnt guard already prevents any unclocked hardware access,
> > so return success instead of -EINVAL when the link is not active.
> 
> [Severity: High]
> Is this commit message accurate for the upstream tree? There doesn't appear
> to be an active_stream_cnt guard in the mainline driver. Without this guard,
> will the DSP push data to powered-off, unclocked DP hardware and cause NoC
> errors?

$ git describe
v7.2-rc2-4669-gb9810cd75b9f
$ git grep active_stream_cnt
$

Which tree has this commit message been based on?

> 
> > diff --git a/drivers/gpu/drm/msm/dp/dp_audio.c b/drivers/gpu/drm/msm/dp/dp_audio.c
> > index 41018e82efa10..df222943ae57f 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_audio.c
> > +++ b/drivers/gpu/drm/msm/dp/dp_audio.c
> > @@ -284,10 +284,8 @@ int msm_dp_audio_prepare(struct drm_bridge *bridge,
> >  	 * such cases check for connection status and bail out if not
> >  	 * connected.
> >  	 */
> > -	if (!msm_dp_display->power_on) {
> > -		rc = -EINVAL;
> > +	if (!msm_dp_display->power_on)
> >  		goto end;
> 
> [Severity: High]
> Does returning 0 here trick the ALSA/ASoC framework into marking the stream
> as successfully prepared?
> 
> If the stream is marked RUNNING, ALSA won't re-invoke prepare() when the
> display is later connected. Could this regression result in silent playback
> because the DP hardware is never actually configured?
> 
> [Severity: High]
> This is a pre-existing issue, but does this lockless check of power_on
> race with msm_dp_display_disable()?
> 
> If msm_dp_display_disable() runs concurrently (e.g., from a hotplug interrupt)
> immediately after this check but before audio_enabled is set to true, it will
> skip waiting and disable the DP link and clocks.
> 
> When msm_dp_audio_prepare() resumes, it will call msm_dp_audio_setup_sdp() and
> attempt MMIO operations on unclocked DP audio registers. Could this lead to a
> synchronous external abort?

I'd agree with Sashiko here. Do we guard against the unlocked access? Or
how do we ensure that the stream will be prepared later?

I think this needs to be fixed on the other side of the pipe. Do we need
to define a special prepare error code, which means "working, but not
available now" and make PulseAudio / PipeWire handle those errors
specially? How is it solved for other platforms? I don't think that
msm/dp is unique here.

Mark, would you have any particular recommendations?

-- 
With best wishes
Dmitry
