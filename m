Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A0251F0995
	for <linux-sound@vger.kernel.org>; Fri, 26 Sep 2025 15:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758899369; cv=none; b=F5m12sBSDQro6X1ljDG5sq++5+qTlf51NW+abtWX+riB8D1bxxf22cJrPvxR9KDgtWZGXUNyPE12tTnNj0sg0yCb9x6Hq45bXlND4g8nO2LaVVm8PU+ewHA6CQOW0IHZNhviB1vK3tXVYI338ia7TPI0GahIHD7vLDZxe3At710=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758899369; c=relaxed/simple;
	bh=2FVv1Hq8CsLTgxv3TXvMbj799Kn3CqKDdgv2Rf9D5Gw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gTW1oGy3oEDw1Z2IAlSicwMf2dVyPWfhPCWcjldkpYCeuHyWUQOFn63ZUsrHt9ALYUUZp1uFJlvxXrF+NmT/aSmAY9Eo7rD51dzDkq9hMmco2eFRmeCzmYjSCLaNbYXO/aEp1ETD+gHTbKBlRfJuj/kAl5g0vP84gTfGarTgVW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WIYhxgFV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WIYhxgFV"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58QEX7Nb007022
	for <linux-sound@vger.kernel.org>; Fri, 26 Sep 2025 15:09:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xml9I4KJWJ+n/mLooOTRb4jr
	nF4kQuIKgjMLbzeFPFg=; b=WIYhxgFVDjPJC/GSKCkdWOuL54sXvXqRiPPI18rq
	X2kNGEj7aIp59ie7UxCbGCNu4uoFiSviFSSZhMP5D2vxEKkUPp/g2Rz8rq2dZ6YC
	Vez2sH4QsvLhmQoz1DD5c5hqqeEGWLZJUc44Q8eJg0WS6HaVUS1a6mU9kHu0GMg+
	Cm3i48ZM4+UcnAwEUMhqR3vr1l9J5WnirS7DndEIg2KTqYZCgI7OGadhvHmpg0yp
	vz5uUv0YUuEW3LditKCHg0dk8lKXuqW9dU69zTFgQFEj2a6s5cQBZEJwkuchnTbG
	/cq7HaKJ+uRxOxSGYX0KQQGOAwfqE2W9+e5KcRhlKjVsqw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0qu9an-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 26 Sep 2025 15:09:21 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b31bea5896so26092161cf.2
        for <linux-sound@vger.kernel.org>; Fri, 26 Sep 2025 08:09:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758899360; x=1759504160;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xml9I4KJWJ+n/mLooOTRb4jrnF4kQuIKgjMLbzeFPFg=;
        b=MKmNzm934ti5XEz7YFErMkgkGYzZJYM2Ch4RlQ8finOseBPpOQt8ZVuiaDUG+R9exF
         hoDt0siQ6Ex8tA8ALAxQksSjz9HTin52YIyxrwAGcu6pWK5RDxGqKkRy0puS4dvvsxlH
         PaUXB/yaT3N0GO1J6AmKhmqXQzS8oKOeAUocfhB8fxGBukL9aJ9OSK3UKCuMBrnzfqs3
         S7iNQRPmSb7q5oGV5c0yIG2AV5tX2UA4EYS2AeGY8cr3XWHqj/1k6MVVR08TE1KWZbvJ
         tm54Jd6p5WPSryFPSvZHKPMwt6b/mGeLmB08gI6nwTe7/fje9cq5SduRx7d18AHkkzAF
         Sbzg==
X-Forwarded-Encrypted: i=1; AJvYcCXJ5Ciw9h19cl2B6zfrr70DBALfNRBv4RkCijcOnsXuWIN73tfNX/DvGTmK/d3rXwD8Cqe+Mh690iuZMg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzDKySsgEEJ9w6cGVw/7mX2D8NdabZESybKKggvrosj8u42Ssfg
	QA9S9lFJk0kNdxNxiC195BLi+ywb23ePW3+CMh8uGRJYYUKlDK1Jh9CnQS7mwb5z6BekxP57oqs
	DMQmCvlXzu8IENW84AAVTBIw6VLUw9Pt8unLxImNIR+zDF8mjcLjkKa+kOGPhE9LP3g==
X-Gm-Gg: ASbGnctqZuZ9b1Jx24M8CxLhoYvHr198TSXV2N/hpi4dB6Ssrbb0eILVJfwOAhvrtKz
	QdTnuupvtDxQG8+8LmJVsIAxdXwWAdTMBGfVH4vUP24YoM+FsjH7TJ8fJpg+nH9RjEaoi5v751D
	WJa8pzDgmktfnedpUB+1CKgBYjQspLicqwyp1BjmSYzkI6ecOs0379NPL+7XaQQelEp1Bdbrr4e
	IUs19ZUpVFvWRKvufUjQYlWllb/4CpID/cBfoo7y6BlaDYSiRcDj5FehVeW+6C7TxSmpxBOGqx6
	9rudhTHgPdgFdEdkBxFjZ0XVNoDEqPvn2sJTXm5oNFexAgIJyD4yXCBgYYV1Ni970XBRIR1fWSf
	SST5uennOcNZfRup4Tc0t7lDoJ9trZCcrceHmeM1+AnnuV+cUizJ2
X-Received: by 2002:ac8:57c6:0:b0:4d8:f0e4:f92d with SMTP id d75a77b69052e-4da48a96e98mr117642871cf.34.1758899359127;
        Fri, 26 Sep 2025 08:09:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGVNL1+kS1q2UptTniV/FQ9TTOA5N9MQS67FNYuK7ugL+YJ4ZWes7rk96zqrRI0rqdGs4Uteg==
X-Received: by 2002:ac8:57c6:0:b0:4d8:f0e4:f92d with SMTP id d75a77b69052e-4da48a96e98mr117641741cf.34.1758899358147;
        Fri, 26 Sep 2025 08:09:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58316d14010sm1877513e87.124.2025.09.26.08.09.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 08:09:17 -0700 (PDT)
Date: Fri, 26 Sep 2025 18:09:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Jianfeng Liu <liujianfeng1994@gmail.com>,
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
Message-ID: <rydatk4grelhg6w57wwkqafq5ghccnsuiwvfqvvdv7qum5dg5a@scoc76ni7hue>
References: <20250925040530.20731-1-liujianfeng1994@gmail.com>
 <46q2pje4hginnm2wld6ejyo36hfkmkzydaa4qggx47gd2p4q4z@q6vmomtgqihv>
 <cc1afa21-8a66-4e0c-8fae-d0b07142b11d@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cc1afa21-8a66-4e0c-8fae-d0b07142b11d@kernel.org>
X-Proofpoint-GUID: a0_oJQ8IvO4DQusZiGOqye9QABRRZFpi
X-Proofpoint-ORIG-GUID: a0_oJQ8IvO4DQusZiGOqye9QABRRZFpi
X-Authority-Analysis: v=2.4 cv=api/yCZV c=1 sm=1 tr=0 ts=68d6aca1 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=Hfy8LQLwNBXcVyXodC8A:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX9sYJJUt5UIh1
 RLoW0WqcDb3ZOVsJqupgGl2JPvMextzuoGBShsJfmEMIXsOotJZ4angVgqjola07apVmvL7WpQt
 apzAnEOWOyMTuJkZce2Ne/c1JUHKHfzlMK4orEROQC48dMIotSl7N3Q9nbt6KV+ZfZmwkMRun51
 Odi6XsS8/bUJavBSgAWKbXfq9fzNCFZid3mI4d/KzMd5fC0Hcd+BPt+SyUt4FTRqJ6/Mp+U/Nr+
 DjBuoqskEoT56tHWatf43+/Kg2kc+k8+XBxr5lOvEG8iFxgYuo/67857COLltW39JR2VqEpLfu3
 UVjXiyKIZPXO5EUFjUOGu3NQmKelW7l1DGEI6mikoo9e6iyuJNu1GckMg8rOJaIlOyn0NTHFg9W
 tgcCzcEStOHgXtQPWYtZjmknNHg+Qg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_05,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171

On Fri, Sep 26, 2025 at 11:30:26AM +0100, Srinivas Kandagatla wrote:
> 
> 
> On 9/25/25 5:28 AM, Dmitry Baryshkov wrote:
> > On Thu, Sep 25, 2025 at 12:05:09PM +0800, Jianfeng Liu wrote:
> >> After reusing drm_hdmi_audio_* helpers and drm_bridge_connector
> >> integration in drm/msm/dp, we have dropped msm_dp_audio_hw_params and
> >> use msm_dp_audio_prepare instead. While userspace is still calling
> >> hw_params to do audio initialization, and we get the following errors:
> >>
> >> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
> >> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
> >> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
> >> hdmi-audio-codec hdmi-audio-codec.0.auto: hdmi_codec_hw_params() started
> >> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
> >> qcom-apm gprsvc:service:2:1: Error (1) Processing 0x01001002 cmd
> >> qcom-apm gprsvc:service:2:1: DSP returned error[1001002] 1
> >> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: Failed to start APM port 104
> >> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: ASoC error (-22): at snd_soc_dai_prepare() on DISPLAY_PORT_RX_0
> >> MultiMedia2 Playback: ASoC error (-22): at dpcm_run_update_startup() on MultiMedia2 Playback
> > 
> > And a call to hdmi_codec_prepare() comes only at this place.
> > 
> > Srini, Mark, when selecting to only implement .prepare for codec ops I
> > was following the commit 2fef64eec23a ("ASoC: hdmi-codec: Add a prepare
> > hook"), which documents that IEC958 status bit is set after
> > .hw_params(), so it's only visible during .prepare(). Is it okay to
> > implement both callbacks? Or should the audioreach DAI driver be fixed
> > somehow instead (I suppose it assumes that the port is available after
> > .hw_params(), not sure if that assumption is correct)?
> > 
> >>
> >> msm_dp_audio_prepare is not called because hdmi-codec driver only checks
> >> and runs hw_params before q6apm_lpass_dai_prepare(). This commit will
> >> add hw_params callback same as drm_connector_hdmi_audio_prepare, so that
> >> hdmi-codec driver can work with userspace alsa.
> >>
> >> Tested with Radxa Dragon Q6A.
> >>
> >> Fixes: 98a8920e7b07 ("drm/msm/dp: reuse generic HDMI codec implementation")
> >> Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>
> > 
> > The patch LGTM, but I would wait for response from audio maintainers.
> > 
> 
> The ordering matters in this case as we need clocks and audio
> configuration on DP codec side to be setup before we start configuring
> the dsp pipeline. Looks like that DSP is trying to setup DP endpoint
> even before it is ready.
> 
> q6apm prepare loads the dsp pipeline and starts configuring the
> endpoints, if the DP endpoint is not ready dsp would throw an error.
> 
> We might be able to pull in some dsp logs to confirm this, but I dont
> have a setup that I can reproduce this issue.

What would be your recommendation to proceed? Is it okay for the DAI
driver to depend on the .hw_params enabling the clock? Also I see that
the error regarding the clocks comes from .prepare callback too. What is
the order of .prepare callbacks()? Can we influence it?

> 
> 
> --srini
> >> ---
> >>
> >> Changes in v2:
> >> - Link to v1: https://lore.kernel.org/linux-arm-msm/20250924085804.34183-1-liujianfeng1994@gmail.com/
> >> - Use more detailed trace log in commit message.
> >> - Drop the empty line between Fixex and SoB.
> >>
> >>  drivers/gpu/drm/display/drm_hdmi_audio_helper.c | 1 +
> >>  1 file changed, 1 insertion(+)
> >>
> >> diff --git a/drivers/gpu/drm/display/drm_hdmi_audio_helper.c b/drivers/gpu/drm/display/drm_hdmi_audio_helper.c
> >> index 7d78b02c1446..6ca1c7ad0632 100644
> >> --- a/drivers/gpu/drm/display/drm_hdmi_audio_helper.c
> >> +++ b/drivers/gpu/drm/display/drm_hdmi_audio_helper.c
> >> @@ -130,6 +130,7 @@ EXPORT_SYMBOL(drm_connector_hdmi_audio_plugged_notify);
> >>  
> >>  static const struct hdmi_codec_ops drm_connector_hdmi_audio_ops = {
> >>  	.audio_startup = drm_connector_hdmi_audio_startup,
> >> +	.hw_params = drm_connector_hdmi_audio_prepare,
> >>  	.prepare = drm_connector_hdmi_audio_prepare,
> >>  	.audio_shutdown = drm_connector_hdmi_audio_shutdown,
> >>  	.mute_stream = drm_connector_hdmi_audio_mute_stream,
> >> -- 
> >> 2.43.0
> >>
> > 
> 

-- 
With best wishes
Dmitry
