Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 940BB2C1590
	for <linux-sound@vger.kernel.org>; Fri,  3 Oct 2025 16:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759509324; cv=none; b=t3cPPye8JBQ7FYjFYTnyPEwvUp4EP3qPlnfaUCoSjLNAd64f7UWyaA7NjzO0vBGghDhvP6gqZlnSepQJN18aokyuFWvIQww3EYj0jOuGVqge7xO5wciSeL5X4v9FW2crhEGdQM1Q/xR8WEW734rLoFpb3rwmOvZpWHn5YnfoL+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759509324; c=relaxed/simple;
	bh=W19mN3nWxvQRspPbP3F90kQcStjcNYfIZFu0akZMraU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DFQufYDDfA81x0/RnLHkra47cvAk/GZ7YSeEQ5wnuwv5rBGEECgaT/QEmNV9iNpZQd8119OYOdqxnNOVbV3zEY/yYAlBI9zUu4V+/lkzAEyoUpk6ptHmG1e7q8SQKUmvQmymhmzTtlcyf4zZ5/qxUx0RY2nJ3fVtHV+m7qugXbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DAYwIsBv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DAYwIsBv"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 593AX69L017638
	for <linux-sound@vger.kernel.org>; Fri, 3 Oct 2025 16:35:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BN+cZQE2ZHFMS/s2TQ1gBGDyzcU+J84X5eJjxhN4d/M=; b=DAYwIsBvKmf08Anr
	mMaZuN4CqYoRkXU8A/rRhgyQj/rgO8zVT5TEYrPKI4BrhVGyys9l/lAo8anED9xU
	JSX5P4CtMqR6/htjwRqPFxaUGs1HqRSjAbLhH+2QM9u8rx/tuWxO0CzXD6hqYckX
	VwKkwSuLBU9dHeN/EwwpOq/q2lo54zmwczfgwsNN2UnWr7TiOcajcRjcV+TSLh56
	kGaIOBRxXNtc6QguvQ10+TywfWqLSFNSZ4BBFuylO9JNj06LAen4MBjDmA4qk5ht
	6sypZnEtxE+scBWdjdfAoQG1fQVONxLxd4h+eY0fZ7BhgBNYlslV724pAXEYardb
	ErpOTA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49fyrfcvrt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 03 Oct 2025 16:35:19 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4e0fcbf8eb0so59940921cf.1
        for <linux-sound@vger.kernel.org>; Fri, 03 Oct 2025 09:35:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759509319; x=1760114119;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BN+cZQE2ZHFMS/s2TQ1gBGDyzcU+J84X5eJjxhN4d/M=;
        b=ByQkUbWNqPls6WRNkqlJFM5Ua+WgyiGNJyxxvokP3leyCyZnpM3k+FlrSSYnkki3nN
         hE6kyJSIm5GxuNR3ErhkOBz4Rsujwo37xLUYNXMYFO/VEc5bkbqvfGpyDqElLnME81wX
         6Y9nn8Yhc9upOgcWcoXOMA8HROrX2TbH7ddjqIVW6bbIT+5aWXJPEdeaM8IlXzUllqyt
         CgMpjLzTK/fGnGZG4AYPtsJRYHAABi1CsFYxmWYjcscuWARKJWF9zVdWoCLgq9lGv09S
         Fz65c1iFrZCNc7DAfvDsGp3qwmZDhEgg1KRtU+S6w1GWIfg2h53hkgejRYrecFVUImbZ
         JDPw==
X-Forwarded-Encrypted: i=1; AJvYcCUrayTlR3mNr5qb5aKSFPq39i0yMhBjg8Rk9N90CSz6v9jV3RLQjwLnBlLy2ZxtZUSaGOJpYG4gp3PsYw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxGCBcYQ40REYShPJftZspZ1xt0uZgHpIujbrgRMbFgrAWDLDu7
	asywrppKBShxLZZieIczLR96hkNC+29isu9LxLZ+zQrFlUxiqWWsOBjgkNAr07owUNum13NPwha
	cCz7ws8OiLdBtdxA0Cr0hFd7N2nLGXm26JIvfs9zSPNsEzQqIJ1L2Bjf0AOnyCZgJ0w==
X-Gm-Gg: ASbGncseiym2LP/A45wyMD1Rx7e57ZqOqOrmkhfLo3rqAxuCdd49k8Tl/tNHevYIVfd
	lt9yiVl5WpmEwCx8rN6pfDGxrw1/JZx+JfVZwD7gBR3j/RmjL6ielGEZPmr6HcnCWvYxlk2BbZh
	p0z4xEWVa04kHgZ7RsNFvAjl6dtHMO7gHCo6iRMVTNZaD/bq971vJlMPFBEzAGl1GmnH+90Y0Sj
	D2LdDnYTtTwu0Ewyoj/2rmlViZtSvELCkkJY8Qp7fGaGyGiVdU9RxmT2HwXBfBeKnyMOmGEtm/t
	pBuT0meMSHrPD63xwASUm3gLOG0wFPzDGDlasNqPlFiGy1FdegBrjOMUr+oxC+zJnf7on/Cw
X-Received: by 2002:ac8:57c3:0:b0:4d3:ee51:7819 with SMTP id d75a77b69052e-4e576b405aemr52572751cf.76.1759509318830;
        Fri, 03 Oct 2025 09:35:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH5X64Ute70habcixAOvg2eexQGJ08nl+IYTPWnk0+F/5qtQEOhct1LHk+KKy0StXX4wfKJvQ==
X-Received: by 2002:ac8:57c3:0:b0:4d3:ee51:7819 with SMTP id d75a77b69052e-4e576b405aemr52572371cf.76.1759509318346;
        Fri, 03 Oct 2025 09:35:18 -0700 (PDT)
Received: from [192.168.68.121] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-46e5b633afdsm81561215e9.2.2025.10.03.09.35.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Oct 2025 09:35:17 -0700 (PDT)
Message-ID: <e69b23de-e9b6-4dfc-af01-7d2726dc23e4@oss.qualcomm.com>
Date: Fri, 3 Oct 2025 17:35:16 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/display: add hw_params callback function to
 drm_connector_hdmi_audio_ops
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
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
References: <20250925040530.20731-1-liujianfeng1994@gmail.com>
 <46q2pje4hginnm2wld6ejyo36hfkmkzydaa4qggx47gd2p4q4z@q6vmomtgqihv>
 <cc1afa21-8a66-4e0c-8fae-d0b07142b11d@kernel.org>
 <rydatk4grelhg6w57wwkqafq5ghccnsuiwvfqvvdv7qum5dg5a@scoc76ni7hue>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <rydatk4grelhg6w57wwkqafq5ghccnsuiwvfqvvdv7qum5dg5a@scoc76ni7hue>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: mZlu-t5NMCGWa0aoW8wfTtaPwYyuaZv2
X-Proofpoint-GUID: mZlu-t5NMCGWa0aoW8wfTtaPwYyuaZv2
X-Authority-Analysis: v=2.4 cv=etzSD4pX c=1 sm=1 tr=0 ts=68dffb47 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=98231OFmOk8s024PzkQA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI5MDE3NSBTYWx0ZWRfX/aVJndzyEp0J
 f3iV8YlbQ4U/36vfnXPy/MaePpA4jioUQDUYxBQvCQH6OjeZkQKyQuRCnsiqeDTzgZto5EkY/1K
 1gDdjwgaJFvQOxizED24lMz0ecoBAIsYaWIPwGrPlGpQt1rtDP2tyQtZuC4u5p66hOqJKsCt/Y4
 LRr9YLwMKQkONKFT1+qYlEEA92zvfx8xqT6706xYsubn6k/dD8VdGEe5QP80XypfzmAluaqJ6Zb
 0j/wyDca5LrAxRFBSKKnfN7obyOBaaAIfQyjgMQ86/oVmYDTpgAsTyQEnIYUS/xmpnR37Smj1Tm
 43uL3yeCRBwkyLOpgjsgz/SEBuXW01SeGlj5XjKXxpqRY3j+IrIK6lbj6lrIW2uVb0zH4RmDPkF
 vXzMT+xL1qgGL78t25MQVpbDHA3P6A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-03_05,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509290175



On 9/26/25 4:09 PM, Dmitry Baryshkov wrote:
> On Fri, Sep 26, 2025 at 11:30:26AM +0100, Srinivas Kandagatla wrote:
>>
>>
>> On 9/25/25 5:28 AM, Dmitry Baryshkov wrote:
>>> On Thu, Sep 25, 2025 at 12:05:09PM +0800, Jianfeng Liu wrote:
>>>> After reusing drm_hdmi_audio_* helpers and drm_bridge_connector
>>>> integration in drm/msm/dp, we have dropped msm_dp_audio_hw_params and
>>>> use msm_dp_audio_prepare instead. While userspace is still calling
>>>> hw_params to do audio initialization, and we get the following errors:
>>>>
>>>> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
>>>> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
>>>> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
>>>> hdmi-audio-codec hdmi-audio-codec.0.auto: hdmi_codec_hw_params() started
>>>> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
>>>> qcom-apm gprsvc:service:2:1: Error (1) Processing 0x01001002 cmd
>>>> qcom-apm gprsvc:service:2:1: DSP returned error[1001002] 1
>>>> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: Failed to start APM port 104
>>>> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: ASoC error (-22): at snd_soc_dai_prepare() on DISPLAY_PORT_RX_0
>>>> MultiMedia2 Playback: ASoC error (-22): at dpcm_run_update_startup() on MultiMedia2 Playback
>>>
>>> And a call to hdmi_codec_prepare() comes only at this place.
>>>
>>> Srini, Mark, when selecting to only implement .prepare for codec ops I
>>> was following the commit 2fef64eec23a ("ASoC: hdmi-codec: Add a prepare
>>> hook"), which documents that IEC958 status bit is set after
>>> .hw_params(), so it's only visible during .prepare(). Is it okay to
>>> implement both callbacks? Or should the audioreach DAI driver be fixed
>>> somehow instead (I suppose it assumes that the port is available after
>>> .hw_params(), not sure if that assumption is correct)?
>>>
>>>>
>>>> msm_dp_audio_prepare is not called because hdmi-codec driver only checks
>>>> and runs hw_params before q6apm_lpass_dai_prepare(). This commit will
>>>> add hw_params callback same as drm_connector_hdmi_audio_prepare, so that
>>>> hdmi-codec driver can work with userspace alsa.
>>>>
>>>> Tested with Radxa Dragon Q6A.
>>>>
>>>> Fixes: 98a8920e7b07 ("drm/msm/dp: reuse generic HDMI codec implementation")
>>>> Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>
>>>
>>> The patch LGTM, but I would wait for response from audio maintainers.
>>>
>>
>> The ordering matters in this case as we need clocks and audio
>> configuration on DP codec side to be setup before we start configuring
>> the dsp pipeline. Looks like that DSP is trying to setup DP endpoint
>> even before it is ready.
>>
>> q6apm prepare loads the dsp pipeline and starts configuring the
>> endpoints, if the DP endpoint is not ready dsp would throw an error.
>>
>> We might be able to pull in some dsp logs to confirm this, but I dont
>> have a setup that I can reproduce this issue.
> 
> What would be your recommendation to proceed? Is it okay for the DAI
> driver to depend on the .hw_params enabling the clock? Also I see that
> the error regarding the clocks comes from .prepare callback too. What is
> the order of .prepare callbacks()? Can we influence it?

prepare follows hw-params, and prepare can be called multiple times

When you mean order of prepare callbacks, you mean w.r.t codec and dsp
backend dia link drivers ?

TBH, Am not sure, I did not find anything that was obvious from the code.



--srini



> 
>>
>>
>> --srini
>>>> ---
>>>>
>>>> Changes in v2:
>>>> - Link to v1: https://lore.kernel.org/linux-arm-msm/20250924085804.34183-1-liujianfeng1994@gmail.com/
>>>> - Use more detailed trace log in commit message.
>>>> - Drop the empty line between Fixex and SoB.
>>>>
>>>>  drivers/gpu/drm/display/drm_hdmi_audio_helper.c | 1 +
>>>>  1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/display/drm_hdmi_audio_helper.c b/drivers/gpu/drm/display/drm_hdmi_audio_helper.c
>>>> index 7d78b02c1446..6ca1c7ad0632 100644
>>>> --- a/drivers/gpu/drm/display/drm_hdmi_audio_helper.c
>>>> +++ b/drivers/gpu/drm/display/drm_hdmi_audio_helper.c
>>>> @@ -130,6 +130,7 @@ EXPORT_SYMBOL(drm_connector_hdmi_audio_plugged_notify);
>>>>  
>>>>  static const struct hdmi_codec_ops drm_connector_hdmi_audio_ops = {
>>>>  	.audio_startup = drm_connector_hdmi_audio_startup,
>>>> +	.hw_params = drm_connector_hdmi_audio_prepare,
>>>>  	.prepare = drm_connector_hdmi_audio_prepare,
>>>>  	.audio_shutdown = drm_connector_hdmi_audio_shutdown,
>>>>  	.mute_stream = drm_connector_hdmi_audio_mute_stream,
>>>> -- 
>>>> 2.43.0
>>>>
>>>
>>
> 

