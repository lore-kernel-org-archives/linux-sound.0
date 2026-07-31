Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A37408607
	for <linux-sound@vger.kernel.org>; Fri, 31 Jul 2026 13:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785504925; cv=none; b=YbgxodTLp5y7fAZ+nvbe6IlprPZh4VpPYWG81YVr30mX6SugXIOZ8KYa0z9CoyxzDvbWa3rYW1OUrD+4nO8HW9903FcdobnOT+lu2RSs82Vj5VRrVpFE63TLxKnmBG8MybvntmiDFkNwB3MfU/FjOpxFrXtOZG/SkFdgAXoIpds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785504925; c=relaxed/simple;
	bh=DcGNqmPNCSat1QJIXjrNiv9RKcb5pMEdkXr6aIPVOow=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l5aFTz/M4EpnIaqkoaZBYs4DD+9Fkluh6t4gWFdJ8WZz+PsL+UWcuFyM8CAmtrYEq58+d86qp/tMItjDxE/nLVgWc00N9X0tYtJSFoGoU5SPC31Rh8I9EqeQOG7W2WzjY9CESmLFqrzTIFy2DkfKIAcp/EQ2L0E9RT878rkoNTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wj919ht1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XhZCvIBz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wj919ht1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XhZCvIBz"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VBeW1F188840
	for <linux-sound@vger.kernel.org>; Fri, 31 Jul 2026 13:35:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pUE7JydRHoj2bR2XQTZhL1X0
	wyHiUYs8hq0ouIE4owk=; b=Wj919ht1vZTBTg26b2P2nHDsmrpA5znkFKVoHoj7
	qSDn0DofSQVHue332EnFH596hBVdT6Xd+qnB4atMwtxaszsawd+D2FkczOF+tvj2
	3OBJM1meGxKqAv5TCMM6jD5KdqUVQpLtap8NglBmUGQPQiL+tessah0ZxIGYmyjr
	gemIQkrMH6j7nYv5wjOkv6uhqsLrBmAf5av0c8Gmqtvj4uoGUhXFclb4/w9hCSkt
	pAp/5J9JFwr3bC9tJp5vNf+IaPTvdSC8QEhdcyUfFdr+6UpCH+S0X28GonMz7ZwD
	5RO+YDauyVSSmFSEm88L5VbuR0PaPDoZteas3yvZrqZfPg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fru1u0efq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 31 Jul 2026 13:35:21 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5283df62d68so9093701cf.0
        for <linux-sound@vger.kernel.org>; Fri, 31 Jul 2026 06:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785504921; x=1786109721; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pUE7JydRHoj2bR2XQTZhL1X0wyHiUYs8hq0ouIE4owk=;
        b=XhZCvIBzBXi27dsKVPKCkBi/eP8fephCLpSnZpAjUMhxre/YqOVTnuSVLsJ0Ugb3lq
         j5mcVzz0l+8HlGh3syG73oCkCvr5lQuBgCwKdDD+EEC+mElB7CaXriy3t90RvJMj8I8N
         QGxLtxGjSQl0Cmqw831BLgNu5evTc2qN6i+6mkTf7KPefkppQL5xTecFHaY+44H8ReOy
         WHf3zEJ92tiQuuYBY6Pa8OSqMos1bNrDpB7ElgW3gjheTuz2lJQZ2ERk1HbC99wwe4Q7
         rP+b050qTt29jgjVFYbYwKq72mDzhu7dg8oV2oepE7TC4fU4n3bRYbIHpzLT95+eHxC9
         c1sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785504921; x=1786109721;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pUE7JydRHoj2bR2XQTZhL1X0wyHiUYs8hq0ouIE4owk=;
        b=TjzwcyemQggIty5/flaji8LGowgvSp49RNaEENP7VYkXmn+m4wKmq9fwo1BQqVg+H0
         3Z7VjQen2DI0pbKEXrH1dNAgyPzvVK3SCllhDlh82w4WQP5HjpGlqFIN8jPCD+LNXo7k
         AHDF4bhBynp/najdFsipfv/pnIv59K+qDA3Z91/occb0khLrr06MVjH58GtLZHVDln2x
         mp9Irj+Vn8Bjf4uOCADfEwitKygBVxKO+zTD9at1QF131yvzaj9tksORBx95CBbzFODK
         MGr7lt5qm1349LGqS3rNz53YdbXZlsU89vHobAXfa07P7F202+N5piUKEePMhi3etr3i
         vrmA==
X-Forwarded-Encrypted: i=1; AHgh+RrEXYywSA0r5MPOek1L23jdRfvmOYnupbGRoMIx6A10MkwCADA21VmddsPrXilwJ7k7dLrh3bbvmQbXbw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzRuNA8glk7AS9vOkRb/lkuTjk7CBUNxNrX6GfkAEaQ3OhFiHvb
	KDmG3rbOavOozPsWQzga+VJO/a9gR8Sk0cPyZhuq78HNXfHI+jcpxgD4KK5esdbEKUikAIwuA3I
	9V/HJqSaElaMPT57a7NQ3VEkRkXLpI9TM6zK2As7pagufi6c73L9EiF0v/JAN4i3RTA==
X-Gm-Gg: AR+sD13SPGyZZCO5BdA1zWA4FpPdVQLfSlMQAdogvNnBhg5TshZPzMaNwYMsMfzRECr
	xU2il3oxiVe5zKSJkFfv02EXyPaO4fbeXtD8T45cJZk7M8AiBlrjS+5FZGeMwm7b5rjO/98rIi7
	GAhyaCOziItyPJfdJyqRXGWePM1rzrygTCfrs93yNE6WkrXD+956ykL5//cfrAuM+eBIpjKmAcg
	7OCX+rdBbbXAw++/KiUw+4SZrdUDsof01OHIa18/DTFptwICGiE8hqm5FGsXC9ZBW9S2jx9xbSf
	HI2gP8ltMOt9toWH9tkRptGD3tjpWMF4ZoxBOwNyxfU4vWWg7C2YIzSgH/Q8s5lUu/ytQHNa9iX
	fQ1hXLg/gwaRD+RJipwU81QVP2kvCGUCwQ/wyXkvUkDlkY6+0goP929rctKwvtNHxw3lbh3umxU
	GEoqVIjWYeLpJ7OQ==
X-Received: by 2002:a05:622a:1b07:b0:51c:6e:ef23 with SMTP id d75a77b69052e-52b5680e85amr1128931cf.32.1785504920247;
        Fri, 31 Jul 2026 06:35:20 -0700 (PDT)
X-Received: by 2002:a05:622a:1b07:b0:51c:6e:ef23 with SMTP id d75a77b69052e-52b5680e85amr1127411cf.32.1785504919360;
        Fri, 31 Jul 2026 06:35:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2e23cb4f1sm312343e87.18.2026.07.31.06.35.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 06:35:17 -0700 (PDT)
Date: Fri, 31 Jul 2026 16:35:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: sashiko-reviews@lists.linux.dev,
        Kumar Anurag <kumar.singh@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
        linux-sound@vger.kernel.org
Subject: Re: [PATCH v1] drm/msm/dp: return 0 from audio_prepare when cable is
 disconnected
Message-ID: <fv2gtrgxx6emfdhnw5xowmhouvig6fl6g3ewqbdiw6rrwpfvk5@pdze7uawd5df>
References: <20260616151252.3599089-2-kumar.singh@oss.qualcomm.com>
 <20260616152536.D81FB1F000E9@smtp.kernel.org>
 <5ixuxbgngzobl5c5fsyahdsouohwuykoat7s4hy6sczrye7vwf@rj7nmn7x3c56>
 <b5c0de1f-75e3-443e-9e29-a70fbdbf4441@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b5c0de1f-75e3-443e-9e29-a70fbdbf4441@kernel.org>
X-Authority-Analysis: v=2.4 cv=H5vrBeYi c=1 sm=1 tr=0 ts=6a6ca499 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=eoBTR9oA_HawxltPn1EA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDEwMyBTYWx0ZWRfX3f8fCtSQwxJC
 yKMsBOvEoC+QG3+6mZaBbCCg2mSK+a6lWYDVqu+LKAGjHVYNuoP8pacoYiqkFV2kndjFkFW4P84
 OyrpsJ5g5No83B1iMQO/R4Wee6SZAi3X0Wtdvp7cTPBmUlRs/RlayJjhtQaGRuV2ZJc5I1E0aZq
 qzThMRhSskgzPWqEdZ8JoPxV04PYw9EbASgl6udr8fdktsAnS5vZ6/H0bbwNrm1GiSPPnwXyRf3
 HsxhGTG3Q799oxFHQNfXjNkPoi/pLn3kmjywipA5LyHXhkD8RJspvWWG1JsBzBgk9LAKeEchnc6
 6O+rioertUWN4wEWiWVq0MHEANYwioR1VrFRCIkMKALZnEP3x/j0EGaaBw2qALqw30M2PYWAtWs
 YSGuZIXoIrJkcg4GQ+WfcIr54xlAqjTIdrp8f3EkKvbtl1dLBpeaMZ5k3Vr156XFsp+JO75jC/j
 OLrLo2nTwMxcYOQuq/w==
X-Proofpoint-GUID: nfc8HFxW9i-3ag0o5BjaplFCoIWEQohF
X-Proofpoint-ORIG-GUID: nfc8HFxW9i-3ag0o5BjaplFCoIWEQohF
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDEwMyBTYWx0ZWRfX6eFk9bMdWGS9
 uVtwPLD9lnYbJFRzSBjJCJ6cSvbI7x4iSHJgKgzehUZPbIU1OnA/zTl0tWuGT23sOe0uu2JgNwT
 pjvzLRM4lJKOawWRiyH6/MhgV9+UONs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0
 adultscore=0 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310103

On Fri, Jul 17, 2026 at 08:26:18AM +0100, Srinivas Kandagatla wrote:
> On 7/12/26 11:16 AM, Dmitry Baryshkov wrote:
> > On Tue, Jun 16, 2026 at 03:25:36PM +0000, sashiko-bot@kernel.org wrote:
> >> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> >>
> >> New issues:
> >> - [High] Returning success (0) from `msm_dp_audio_prepare` when the display is disconnected causes silent audio failures upon hotplug and NoC errors due to unclocked DSP hardware access.
> >>
> >> Pre-existing issues:
> >> - [High] Race condition between `msm_dp_audio_prepare` and `msm_dp_display_disable` causes unclocked MMIO accesses.
> >> --
> >>
> >> commit bfb65364e66313dc1385a42e09172f44a1e1fbd1
> >> Author: Kumar Anurag <kumar.singh@oss.qualcomm.com>
> >>
> >> drm/msm/dp: return 0 from audio_prepare when cable is disconnected
> >>
> >> PipeWire treats a non-zero return from prepare as fatal, marking the
> >> DP audio device as a dummy sink when the cable is unplugged.
> >>
> >>> The active_stream_cnt guard already prevents any unclocked hardware access,
> >>> so return success instead of -EINVAL when the link is not active.
> >>
> >> [Severity: High]
> >> Is this commit message accurate for the upstream tree? There doesn't appear
> >> to be an active_stream_cnt guard in the mainline driver. Without this guard,
> >> will the DSP push data to powered-off, unclocked DP hardware and cause NoC
> >> errors?
> > 
> > $ git describe
> > v7.2-rc2-4669-gb9810cd75b9f
> > $ git grep active_stream_cnt
> > $
> > 
> > Which tree has this commit message been based on?
> > 
> >>
> >>> diff --git a/drivers/gpu/drm/msm/dp/dp_audio.c b/drivers/gpu/drm/msm/dp/dp_audio.c
> >>> index 41018e82efa10..df222943ae57f 100644
> >>> --- a/drivers/gpu/drm/msm/dp/dp_audio.c
> >>> +++ b/drivers/gpu/drm/msm/dp/dp_audio.c
> >>> @@ -284,10 +284,8 @@ int msm_dp_audio_prepare(struct drm_bridge *bridge,
> >>>  	 * such cases check for connection status and bail out if not
> >>>  	 * connected.
> >>>  	 */
> >>> -	if (!msm_dp_display->power_on) {
> >>> -		rc = -EINVAL;
> >>> +	if (!msm_dp_display->power_on)
> >>>  		goto end;
> >>
> >> [Severity: High]
> >> Does returning 0 here trick the ALSA/ASoC framework into marking the stream
> >> as successfully prepared?
> >>
> >> If the stream is marked RUNNING, ALSA won't re-invoke prepare() when the
> >> display is later connected. Could this regression result in silent playback
> >> because the DP hardware is never actually configured?
> >>
> >> [Severity: High]
> >> This is a pre-existing issue, but does this lockless check of power_on
> >> race with msm_dp_display_disable()?
> >>
> >> If msm_dp_display_disable() runs concurrently (e.g., from a hotplug interrupt)
> >> immediately after this check but before audio_enabled is set to true, it will
> >> skip waiting and disable the DP link and clocks.
> >>
> >> When msm_dp_audio_prepare() resumes, it will call msm_dp_audio_setup_sdp() and
> >> attempt MMIO operations on unclocked DP audio registers. Could this lead to a
> >> synchronous external abort?
> > 
> > I'd agree with Sashiko here. Do we guard against the unlocked access? Or
> > how do we ensure that the stream will be prepared later?
> > 
> > I think this needs to be fixed on the other side of the pipe. Do we need
> > to define a special prepare error code, which means "working, but not
> > available now" and make PulseAudio / PipeWire handle those errors
> > specially? How is it solved for other platforms? I don't think that
> > msm/dp is unique here.
> 
> AFAIU,There is no special error code for prepare to flag that cable is
> not connected, the standard way is to read Jack events. Wireplumber is
> is one which deals with Jack event, even before getting to there
> pipewire will fail to probe the devices on the card if prepare fails.
> 
> Once we are at Wireplumber level we are good, and stream will never sent
> to the sinks which are in disconnected state (via Jack).
> 
> This has been a known issue for very long time, most of the codecs like
> 
> Its also interesting to note that same Qualcomm SoC drivers deal with
> this situation by returning zero, so why dp has to be different?
> 
> drivers/gpu/drm/msm/hdmi/hdmi_audio.c
> 
> Other drivers that do not care about plug state in prepare are.
> sound/x86/intel_hdmi_audio.c
> drivers/gpu/drm/mediatek/mtk_hdmi.c
> sound/hda/codecs/hdmi/hdmi.c
> drivers/gpu/drm/xlnx/zynqmp_dp_audio.c
> 
> 
> I think there is enough evidence how this is handled in the codec
> drivers, we should consider this patch.

Let's discuss this at the LPC or some other F2F where we can get other
parties. I'd like to sort out the issue. Or maybe next year's pipewire
workshop.

For now:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> # same behaviour

-- 
With best wishes
Dmitry
