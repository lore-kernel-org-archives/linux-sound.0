Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A9142D3EE5
	for <linux-sound@vger.kernel.org>; Fri,  3 Oct 2025 17:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759510967; cv=none; b=CNJYDOJsasDrEgNiJR2zrj8gv2r+skKU08m2BVt1MnyViysjJdbTU4SoBTp/v+kkpt0CWfLktinwxfBvXRnTyCwsv7Nx4d18Uz8PedqaPTrhcNKsj8tNGF9SI6I7TGX4iXymQInANLhtsDV54AY233t5FTfleR8sq8R1uOxlZ6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759510967; c=relaxed/simple;
	bh=1zx1udROAwruUJTmdJWQyMyDDuBstgfxLo5u4KwL30I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qqoxyk02zmRCkLmEc8E5hlMxvFq4ET8Z9vZPd6u5Ax8GvOknlX1igmK0sXPl9OrCXGsDvk0KDcNTY6EzSC/lYA3K57ST6gZe6VTcH2YedOLn8lbpK11CjMKd1h3r8wam06vZveIyIEf8GXtTbkb07r22NwGlhIG0Xgh4q4xOPI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PXiVTmgh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PXiVTmgh"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5939W7t7004869
	for <linux-sound@vger.kernel.org>; Fri, 3 Oct 2025 17:02:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KgoxikXo2ZLB4qRYHWwK6Hmk
	lhI2iR3jWmKfpn6+5BU=; b=PXiVTmghXPDtT3Nr2+qSWeiRnA5fgCLitmfqYLGB
	TKSHqsHFcXgEU2MHmUubMUBcFj+LzL8T34iFf3XOUI/5qGr62B1c9rgmdXwD4XH7
	NCj7e36Z7ygyU0XsiH+ECSjkwREAeGzen/NvrEhvPLPbL63JMC0+xD2a6lJKpScp
	WK7JYkgr0pi4V6ts6AZ4yZjaqVFMQyyGgLWsweyaDwg1em/1/KDqC0MFbtoEwyWI
	EHNqctiqXGekQM4enaPq8jEVfWqK8Sv8ueskiKfdWzG5Szh1JJPX0vAyJC70Ym//
	RSKbLOtE8BtuZEAmb8MJkIIARnGql740GNJxvzP2a7gphQ==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49fyrfcy3x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 03 Oct 2025 17:02:44 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-43f49e2c600so614723b6e.2
        for <linux-sound@vger.kernel.org>; Fri, 03 Oct 2025 10:02:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759510963; x=1760115763;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KgoxikXo2ZLB4qRYHWwK6HmklhI2iR3jWmKfpn6+5BU=;
        b=XqBUNSq8hLhy0p75wOXOuw/Go27X7fBxr8mb3SgynSvoLw7RUeS/5GLnucN+gvPXzj
         N79PCNeIKUhpE+gRzoIb5VaiLcEDDVU8Re+4uqZq0VL6foaJIr2wguGcXMK9VzNXtgLW
         K8fDwFrtSgYcbf0rBE9V66Yaoa0ZtBFKBlEFeSoTnvCESEdl7TyVJN9XTyDFqYF4Q2c5
         TMklLfm1N/9kasV8tZFJKY1299NhwrWOBRuoW7STkAz/YE5c0hMEqqnf8DkYS4XnAR9x
         ta1Cg8d9Xi7vhK9/nm8TCH6tOni1fiEpN2fdApFgaMJwLTUooY8FDqs0ddc+J4sDh2Ar
         Ar7w==
X-Forwarded-Encrypted: i=1; AJvYcCWSnt8e2jMSgmqyIqMRpQXi77VZqAZYutcDZs7sjDo2302mxwXcmys9Q1HPQG8GKdKgREV9yPzaekkknQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxRx0pUiwag7uLwoghLNg/impukU8cGVXg930FAv8QoonAdfdqK
	iMOemht8norGleEhQnxmKTbQL63UhezTLg3EFtFIK2RfN45/jEmOHPODqlvaKx1sW9PDvVv9X3Y
	Ps+DBnDN7gAtBO58sHauwRh9+yZcEW8rHIPgX90QXTtbMRM4UCDROVEXLtj/OJlMi6Q==
X-Gm-Gg: ASbGncv7cInJyDq/Hb15Ck0YjE+MbIv7fZp5c45yWSLlENt4K5TFuDTJwgj7XU9tpq/
	MDHtB2WxTMAEGghNxq3V2PlWQ0Hb9cy9PeuDrHZLpOkhds6jyyz0KKpsiJK13h4cyn8Os370wee
	Milg+kAq62+cKr3lRJppnne/l3bAWXScr5K+3aqOBT9MeJCcCdzueUGnBgDBJYnUYDOKuFa+sPx
	di0o7rFYv4XwfWLHOFApK0wei2o9Ie1cWG7HNWFopuYTcTTI+B/htT/UDwpZy/E/+6oXeauZzoH
	NdAb+5TsvjhN5wsiV/VF697y+tojLgCdFrRgfR07107FRYFcw6VViA4b9HUmdqgqLR3oktbxQ57
	MVdBzAE+6dO3zlw774UozET/AxtU8KbDxcz+Hy5fTp6NHbzP0uHsflrzelQ==
X-Received: by 2002:a05:6808:159f:b0:43d:2004:bf3d with SMTP id 5614622812f47-43fc1830c2cmr1748770b6e.32.1759510963177;
        Fri, 03 Oct 2025 10:02:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGSLjjxQA4p0EfAhPSPlC8pxdM4ZJElDgCUfgufaoYhlOS1ukf+CvDzO3irSmuShAdwAqpqXw==
X-Received: by 2002:a05:6808:159f:b0:43d:2004:bf3d with SMTP id 5614622812f47-43fc1830c2cmr1748700b6e.32.1759510962583;
        Fri, 03 Oct 2025 10:02:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b01124297sm2012104e87.23.2025.10.03.10.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 10:02:41 -0700 (PDT)
Date: Fri, 3 Oct 2025 20:02:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Jianfeng Liu <liujianfeng1994@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        linux-arm-msm@vger.kernel.org, Xilin Wu <sophon@radxa.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        David Airlie <airlied@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org
Subject: Re: [PATCH v2] drm/display: add hw_params callback function to
 drm_connector_hdmi_audio_ops
Message-ID: <bnrpfijh4rljdzroduqncfygysvgblljlhdpvq7ubajlbbwvwd@ohdmpjvpzj33>
References: <20250925040530.20731-1-liujianfeng1994@gmail.com>
 <46q2pje4hginnm2wld6ejyo36hfkmkzydaa4qggx47gd2p4q4z@q6vmomtgqihv>
 <cc1afa21-8a66-4e0c-8fae-d0b07142b11d@kernel.org>
 <rydatk4grelhg6w57wwkqafq5ghccnsuiwvfqvvdv7qum5dg5a@scoc76ni7hue>
 <e69b23de-e9b6-4dfc-af01-7d2726dc23e4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e69b23de-e9b6-4dfc-af01-7d2726dc23e4@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: kI-pWvqEC2a5-pnViVsuTGYumJvpon0d
X-Proofpoint-GUID: kI-pWvqEC2a5-pnViVsuTGYumJvpon0d
X-Authority-Analysis: v=2.4 cv=etzSD4pX c=1 sm=1 tr=0 ts=68e001b4 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=vpI0o0ENzK3Q5gXZhecA:9
 a=CjuIK1q_8ugA:10 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI5MDE3NSBTYWx0ZWRfX/Ss+fIfkCXyf
 3x9O9kYGrCEmaYdihN0lHr933+INBenvTTPN2jriHknAx+2MNscSfqPFW9Pcjtfll2AldCQYq9E
 DILkRWF7tVLAbg9mFaT6Ac6uh8TtrGnvPP0DlQykVlTZ7aRxo96BUr/DX1WIJr/KPpFeUMn1+2u
 b+FbEz+3rIPFAYehu7RwfGyC2Ki6d73OWI9kGxVVhlvvuZhk6Fzq9gXsmGmOAXhJozqumdhxfYq
 Ea3/pXC/jZwe8IdIzuZ8D5+l31wbcx9LZcCvqDm5xsZNB6vV9M5DJFmzOl1cT54Yq5IWWON9fXX
 8s6e/WD6sS6pcw+d5W+VB0OCjIY7yuCYfyBJQ4lSsdzoCzPFeY7rQ6D3J8yv+VR17RkftmTJhaI
 8NmqBVHL+SzwQlL+90A4Ku8W95z+Tg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-03_05,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509290175

On Fri, Oct 03, 2025 at 05:35:16PM +0100, Srinivas Kandagatla wrote:
> 
> 
> On 9/26/25 4:09 PM, Dmitry Baryshkov wrote:
> > On Fri, Sep 26, 2025 at 11:30:26AM +0100, Srinivas Kandagatla wrote:
> >>
> >>
> >> On 9/25/25 5:28 AM, Dmitry Baryshkov wrote:
> >>> On Thu, Sep 25, 2025 at 12:05:09PM +0800, Jianfeng Liu wrote:
> >>>> After reusing drm_hdmi_audio_* helpers and drm_bridge_connector
> >>>> integration in drm/msm/dp, we have dropped msm_dp_audio_hw_params and
> >>>> use msm_dp_audio_prepare instead. While userspace is still calling
> >>>> hw_params to do audio initialization, and we get the following errors:
> >>>>
> >>>> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
> >>>> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
> >>>> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
> >>>> hdmi-audio-codec hdmi-audio-codec.0.auto: hdmi_codec_hw_params() started
> >>>> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
> >>>> qcom-apm gprsvc:service:2:1: Error (1) Processing 0x01001002 cmd
> >>>> qcom-apm gprsvc:service:2:1: DSP returned error[1001002] 1
> >>>> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: Failed to start APM port 104
> >>>> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: ASoC error (-22): at snd_soc_dai_prepare() on DISPLAY_PORT_RX_0
> >>>> MultiMedia2 Playback: ASoC error (-22): at dpcm_run_update_startup() on MultiMedia2 Playback
> >>>
> >>> And a call to hdmi_codec_prepare() comes only at this place.
> >>>
> >>> Srini, Mark, when selecting to only implement .prepare for codec ops I
> >>> was following the commit 2fef64eec23a ("ASoC: hdmi-codec: Add a prepare
> >>> hook"), which documents that IEC958 status bit is set after
> >>> .hw_params(), so it's only visible during .prepare(). Is it okay to
> >>> implement both callbacks? Or should the audioreach DAI driver be fixed
> >>> somehow instead (I suppose it assumes that the port is available after
> >>> .hw_params(), not sure if that assumption is correct)?
> >>>
> >>>>
> >>>> msm_dp_audio_prepare is not called because hdmi-codec driver only checks
> >>>> and runs hw_params before q6apm_lpass_dai_prepare(). This commit will
> >>>> add hw_params callback same as drm_connector_hdmi_audio_prepare, so that
> >>>> hdmi-codec driver can work with userspace alsa.
> >>>>
> >>>> Tested with Radxa Dragon Q6A.
> >>>>
> >>>> Fixes: 98a8920e7b07 ("drm/msm/dp: reuse generic HDMI codec implementation")
> >>>> Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>
> >>>
> >>> The patch LGTM, but I would wait for response from audio maintainers.
> >>>
> >>
> >> The ordering matters in this case as we need clocks and audio
> >> configuration on DP codec side to be setup before we start configuring
> >> the dsp pipeline. Looks like that DSP is trying to setup DP endpoint
> >> even before it is ready.
> >>
> >> q6apm prepare loads the dsp pipeline and starts configuring the
> >> endpoints, if the DP endpoint is not ready dsp would throw an error.
> >>
> >> We might be able to pull in some dsp logs to confirm this, but I dont
> >> have a setup that I can reproduce this issue.
> > 
> > What would be your recommendation to proceed? Is it okay for the DAI
> > driver to depend on the .hw_params enabling the clock? Also I see that
> > the error regarding the clocks comes from .prepare callback too. What is
> > the order of .prepare callbacks()? Can we influence it?
> 
> prepare follows hw-params, and prepare can be called multiple times
> 
> When you mean order of prepare callbacks, you mean w.r.t codec and dsp
> backend dia link drivers ?

Yes. Here we got a dependency from the cpu dai to be prepare()'d after
the DP driver performs some actions, which were a part of hw_params()
callback but were moved to be executed during prepare() callback.

This leads me to two sets of questions:
- In which order are those callbacks executed? Can we make the ASoC
  enforce some order of DAI's prepare() callbacks?

- More improtantly, isn't it a sympthom of DP driver (incorrectly)
  performing too much in the .hw_params() / .prepare() callback? Should
  we move some of the setup to the .audio_startup() instead? What is the
  expected split between those callbacks?

> 
> TBH, Am not sure, I did not find anything that was obvious from the code.
> 
> 
> 
> --srini
> 
> 
> 
> > 
> >>
> >>
> >> --srini
> >>>> ---
> >>>>
> >>>> Changes in v2:
> >>>> - Link to v1: https://lore.kernel.org/linux-arm-msm/20250924085804.34183-1-liujianfeng1994@gmail.com/
> >>>> - Use more detailed trace log in commit message.
> >>>> - Drop the empty line between Fixex and SoB.
> >>>>
> >>>>  drivers/gpu/drm/display/drm_hdmi_audio_helper.c | 1 +
> >>>>  1 file changed, 1 insertion(+)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/display/drm_hdmi_audio_helper.c b/drivers/gpu/drm/display/drm_hdmi_audio_helper.c
> >>>> index 7d78b02c1446..6ca1c7ad0632 100644
> >>>> --- a/drivers/gpu/drm/display/drm_hdmi_audio_helper.c
> >>>> +++ b/drivers/gpu/drm/display/drm_hdmi_audio_helper.c
> >>>> @@ -130,6 +130,7 @@ EXPORT_SYMBOL(drm_connector_hdmi_audio_plugged_notify);
> >>>>  
> >>>>  static const struct hdmi_codec_ops drm_connector_hdmi_audio_ops = {
> >>>>  	.audio_startup = drm_connector_hdmi_audio_startup,
> >>>> +	.hw_params = drm_connector_hdmi_audio_prepare,
> >>>>  	.prepare = drm_connector_hdmi_audio_prepare,
> >>>>  	.audio_shutdown = drm_connector_hdmi_audio_shutdown,
> >>>>  	.mute_stream = drm_connector_hdmi_audio_mute_stream,
> >>>> -- 
> >>>> 2.43.0
> >>>>
> >>>
> >>
> > 
> 

-- 
With best wishes
Dmitry
