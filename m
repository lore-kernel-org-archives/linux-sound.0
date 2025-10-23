Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE42A134AC
	for <linux-sound@vger.kernel.org>; Thu, 23 Oct 2025 11:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761219799; cv=none; b=MadB9UvrT0A7OTimboIubfBE/8Y3FVZF3/OofdOs0TleW4kmLlmyH+oY7WvEK36T/MwrDK2LXaBKQ+theQtqzuN/u3Wx+/UGfbGqednqnr8kJtjCylBCb1aZuZPbuQePfSdAzsWQLr8iXxdvs46c+YIwZjVIJxW3zvFDe1A7uFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761219799; c=relaxed/simple;
	bh=iOv6HrFN/GyaoxkmibXJeE3HzCloZJr9e+zIqeHbdlg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SgyfZ/CmZ+awSKF7eP5Yi9OJvrJObEXxg0b+klxh10jxNU1GO3r4wV8WymxUkQf107N0MdblVpLPwDYSaWzId/zlsf+D6Xn77doo8tHZG0BZzsYPOlH5BrOhpHE1MaZB0e59gMQrBHNO+izrLVq66m1tlb0AuFLuqRv/Ml6bgZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NasfqWk2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NasfqWk2"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N6hM8u014644
	for <linux-sound@vger.kernel.org>; Thu, 23 Oct 2025 11:43:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=U/OA0PZSj4gKuY85d/FcU28n
	UQY1lg/5GJi4GwVamFc=; b=NasfqWk2ZECADNbBffa76Z/5DHnIlE36d1p3SbdH
	sS7Oe5NMUQSXdQezZOW52Gtugyq+X7iX9mdSy9bhV9WcWwdp/YNtWsHqdnKiq+UF
	AR0JuuoJTBpEXpVObW9gRARYcSYl1TkC+e9ZF8en9DGdJ0Ob/W0Ed9fLeF3nXiUe
	/+Uk60be9CbaEeArKq39/acKaVq1LjpWMTjxUUhJFYqK5V0jxjd5n5B8xK4SlVqB
	YZc48Zj+x4otifWHMUUfuIUYrhRaQs/zAosbj5eVaSd0T5dW8RwUcvjeJN9zs0Hm
	X+urzMIe2t6V7ZqXBf9CmLwYjv5XjnEe9Axt74r6bwsxzA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49xhe0p5r9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 23 Oct 2025 11:43:16 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4e8916e8d4aso34410231cf.2
        for <linux-sound@vger.kernel.org>; Thu, 23 Oct 2025 04:43:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761219796; x=1761824596;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U/OA0PZSj4gKuY85d/FcU28nUQY1lg/5GJi4GwVamFc=;
        b=Fk0pMhbIixqbUcCR/LzB2ywWEAJLD9e3j4zc9uq9ZVaKI+8A+WeyP76CVHQlXsPeP2
         08EwKR96yXO8TbLBBMsg417WpCbQd/MUKZUQ36JZLKBJuYCW6KlnQs/iG7kB75sxexRG
         UdbiZBu5rTg2lQP9L2l52hI1hKXUIGxK1+reUqc8FRzr2QitmkIVjr/2XTBnbBxJJloo
         Zn6oKIiiiMQqaA7FKjYiTFVyuoVOmdb6Zh5HnDJ7aYcRtEUgEVYexUMMi4HGeWBlENTj
         EHL+5NfZlWX8Kxz/YSxQFjM1OWhCzEjQ0reurkL3yW7IMbTshl4ZEoy8R11CniN1gHPB
         dSkg==
X-Forwarded-Encrypted: i=1; AJvYcCUm4fkJTXg5ymX4EiPuNYiNuZSTwuCfpOz7ZVGJ3tUTwj/eIL3v7HPS+17G3Q8ZV5qZIJp7TlKhQq6xKA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxz7EM7VgjQF2iEfpfqiFEx0zyxk+OW7SY8iHHJZh1trlB2e7Ro
	/YIa0tvXIhd+ntkBb1MSIqnWzpo/qstwfIRBRRXop1yUGYHLZWpBodb2gcAujL8TGRXkhcD3mxV
	usra7FBGigPOaq9dNKskddj3755N+aIZx+tFuY/qTYhJJ9t7WeXgRxAJCngoBpJgdWg==
X-Gm-Gg: ASbGnctb3Rg0xigHuQAOxfBDOncJguS7MfPZBsPt+7pqM752Ohu4yqj23+/WQ14fha/
	OTydb37anfs3hXn5ma2QdoKPEEk2H3JljEwHmbjFogzxiLkxcUSLeS1pDZsy2E6HkCoSiYWeeiM
	ydB8+n3PC6BZQ57cirPfx+kzr7DnyjWGLand3LILfnFBfW/TCmB2uIq3Zcx//xEaxQMccBcXTfV
	4bJ1yFPOpdXP9ZKGbs61GcZtp3aRMCl1UQOCDRKoe/ik9PNPYALID/sCxkfew1nxmnYvSfmr/0+
	9NlmLJD/dvrPl//s1+L+zYDQWlpP+JiDIsJc6LEFQbpkiar8OJYJvTAw+gXZqre9c6Br1sb1pB5
	S58V3B46FEsz4wiHClglVmT7Na1GAs8sBIrrfz/vctM0GucuHG/Xx5pItNXiXKFccprAuPodhk8
	Z1MKL9P6eO0c/h
X-Received: by 2002:a05:622a:5d0:b0:4e8:97b3:abfb with SMTP id d75a77b69052e-4e89d35d2f9mr291370391cf.55.1761219795535;
        Thu, 23 Oct 2025 04:43:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFXyOFCl7kcBIEN/wDP5UVI6A64TolHRUI28nTCF4yEdOZomT5Qgfo9kDVTDA2p9pMBrG3vEQ==
X-Received: by 2002:a05:622a:5d0:b0:4e8:97b3:abfb with SMTP id d75a77b69052e-4e89d35d2f9mr291370091cf.55.1761219795026;
        Thu, 23 Oct 2025 04:43:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-378d67dc640sm4062841fa.40.2025.10.23.04.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 04:43:14 -0700 (PDT)
Date: Thu, 23 Oct 2025 14:43:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
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
Message-ID: <jymgfmn5pje4qaslyaivzfm4m7ho774pid3uenj6yfrlrdk3ss@2nqojclepgsu>
References: <20250925040530.20731-1-liujianfeng1994@gmail.com>
 <46q2pje4hginnm2wld6ejyo36hfkmkzydaa4qggx47gd2p4q4z@q6vmomtgqihv>
 <cc1afa21-8a66-4e0c-8fae-d0b07142b11d@kernel.org>
 <rydatk4grelhg6w57wwkqafq5ghccnsuiwvfqvvdv7qum5dg5a@scoc76ni7hue>
 <e69b23de-e9b6-4dfc-af01-7d2726dc23e4@oss.qualcomm.com>
 <bnrpfijh4rljdzroduqncfygysvgblljlhdpvq7ubajlbbwvwd@ohdmpjvpzj33>
 <f9c922f5-52af-45bb-a4ca-7ca80c0c3534@kernel.org>
 <7fwfxr7zqsaudselhru3jtjc2f7pdjvlaj2b464vgdlqcrljek@asci6y3ghq63>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7fwfxr7zqsaudselhru3jtjc2f7pdjvlaj2b464vgdlqcrljek@asci6y3ghq63>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIxMDE2NyBTYWx0ZWRfX4yf36X667f65
 JfgDmYMhSCLw5K9hCWm7Ab0JiFzCDx4i9dHwjxTaT/xJ7vGa4MbYn7LTNVwl8S4iL1n58cTcodm
 X6QIpoQOlQyKqCZIhbExmPtEdMn8SwajRXCIYAeE8IUppXws+Imn8cc+AN/75GlpeZQYn/doh35
 +QiN4P3HcdTRXaYN9zhaItV9Al17P3balVOO6UVZSaOX5TmGjPEufMLaZYTtrU9Nkc+HkexCDKc
 n1Jpwc7i5pQF4DZkREIjJm1rjpXnDVxTk/6ErhTZ79CF3OynJ3jyRP/vyb0TWEShnovvUQEK9Vu
 QVyWOanSFU6I0dYGcyOXZsbN2ObJL7CczUcvopmsJPGRU1Cep29zM8iW+XyzesewT1B1vmPHJbI
 NCHlnLT+fldzXBxergINp2yquA1c7w==
X-Proofpoint-ORIG-GUID: QGoGn3iQ0cnraMNfZgyJRdgdQ0zEiJTL
X-Authority-Analysis: v=2.4 cv=WYUBqkhX c=1 sm=1 tr=0 ts=68fa14d4 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8
 a=HstBAKh7-VjeVNBl2p8A:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: QGoGn3iQ0cnraMNfZgyJRdgdQ0zEiJTL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510210167

On Sun, Oct 05, 2025 at 06:29:20PM +0300, Dmitry Baryshkov wrote:
> On Sat, Oct 04, 2025 at 02:16:08PM +0100, Srinivas Kandagatla wrote:
> > 
> > 
> > On 10/3/25 6:02 PM, Dmitry Baryshkov wrote:
> > > On Fri, Oct 03, 2025 at 05:35:16PM +0100, Srinivas Kandagatla wrote:
> > >>
> > >>
> > >> On 9/26/25 4:09 PM, Dmitry Baryshkov wrote:
> > >>> On Fri, Sep 26, 2025 at 11:30:26AM +0100, Srinivas Kandagatla wrote:
> > >>>>
> > >>>>
> > >>>> On 9/25/25 5:28 AM, Dmitry Baryshkov wrote:
> > >>>>> On Thu, Sep 25, 2025 at 12:05:09PM +0800, Jianfeng Liu wrote:
> > >>>>>> After reusing drm_hdmi_audio_* helpers and drm_bridge_connector
> > >>>>>> integration in drm/msm/dp, we have dropped msm_dp_audio_hw_params and
> > >>>>>> use msm_dp_audio_prepare instead. While userspace is still calling
> > >>>>>> hw_params to do audio initialization, and we get the following errors:
> > >>>>>>
> > >>>>>> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
> > >>>>>> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
> > >>>>>> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
> > >>>>>> hdmi-audio-codec hdmi-audio-codec.0.auto: hdmi_codec_hw_params() started
> > >>>>>> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
> > >>>>>> qcom-apm gprsvc:service:2:1: Error (1) Processing 0x01001002 cmd
> > >>>>>> qcom-apm gprsvc:service:2:1: DSP returned error[1001002] 1
> > >>>>>> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: Failed to start APM port 104
> > >>>>>> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: ASoC error (-22): at snd_soc_dai_prepare() on DISPLAY_PORT_RX_0
> > >>>>>> MultiMedia2 Playback: ASoC error (-22): at dpcm_run_update_startup() on MultiMedia2 Playback
> > >>>>>
> > >>>>> And a call to hdmi_codec_prepare() comes only at this place.
> > >>>>>
> > >>>>> Srini, Mark, when selecting to only implement .prepare for codec ops I
> > >>>>> was following the commit 2fef64eec23a ("ASoC: hdmi-codec: Add a prepare
> > >>>>> hook"), which documents that IEC958 status bit is set after
> > >>>>> .hw_params(), so it's only visible during .prepare(). Is it okay to
> > >>>>> implement both callbacks? Or should the audioreach DAI driver be fixed
> > >>>>> somehow instead (I suppose it assumes that the port is available after
> > >>>>> .hw_params(), not sure if that assumption is correct)?
> > >>>>>
> > >>>>>>
> > >>>>>> msm_dp_audio_prepare is not called because hdmi-codec driver only checks
> > >>>>>> and runs hw_params before q6apm_lpass_dai_prepare(). This commit will
> > >>>>>> add hw_params callback same as drm_connector_hdmi_audio_prepare, so that
> > >>>>>> hdmi-codec driver can work with userspace alsa.
> > >>>>>>
> > >>>>>> Tested with Radxa Dragon Q6A.
> > >>>>>>
> > >>>>>> Fixes: 98a8920e7b07 ("drm/msm/dp: reuse generic HDMI codec implementation")
> > >>>>>> Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>
> > >>>>>
> > >>>>> The patch LGTM, but I would wait for response from audio maintainers.
> > >>>>>
> > >>>>
> > >>>> The ordering matters in this case as we need clocks and audio
> > >>>> configuration on DP codec side to be setup before we start configuring
> > >>>> the dsp pipeline. Looks like that DSP is trying to setup DP endpoint
> > >>>> even before it is ready.
> > >>>>
> > >>>> q6apm prepare loads the dsp pipeline and starts configuring the
> > >>>> endpoints, if the DP endpoint is not ready dsp would throw an error.
> > >>>>
> > >>>> We might be able to pull in some dsp logs to confirm this, but I dont
> > >>>> have a setup that I can reproduce this issue.
> > >>>
> > >>> What would be your recommendation to proceed? Is it okay for the DAI
> > >>> driver to depend on the .hw_params enabling the clock? Also I see that
> > >>> the error regarding the clocks comes from .prepare callback too. What is
> > >>> the order of .prepare callbacks()? Can we influence it?
> > >>
> > >> prepare follows hw-params, and prepare can be called multiple times
> > >>
> > >> When you mean order of prepare callbacks, you mean w.r.t codec and dsp
> > >> backend dia link drivers ?
> > > 
> > > Yes. Here we got a dependency from the cpu dai to be prepare()'d after
> > > the DP driver performs some actions, which were a part of hw_params()
> > > callback but were moved to be executed during prepare() callback.
> > > 
> > > This leads me to two sets of questions:
> > > - In which order are those callbacks executed? Can we make the ASoC
> > >   enforce some order of DAI's prepare() callbacks?
> > > 
> > > - More improtantly, isn't it a sympthom of DP driver (incorrectly)
> > >   performing too much in the .hw_params() / .prepare() callback? Should
> > >   we move some of the setup to the .audio_startup() instead? What is the
> > >   expected split between those callbacks?
> > 
> > I have not looked at full dp sequences but, if prepare is the only place
> > when it enables the required clocks for audio block, then it is a
> > problem, we should do it early so that DSP can enable the required
> > configuration in prepare.
> 
> As I wrote, previously it was done as a part of hw_params, which is
> also not optimal as hdmi-codec clearly defines both callbacks as
> optional, requiring only one of them. Do you know, what is actually
> required on the DP side for the DSP to be able to preapre()?

Srinivas, did you have a chance to look at this? Or the .hw_prepare
ordering? I really don't want to land this fix only to face the same
issue because on some of the platforms .hw_prepare() callbacks will be
called in a different order.

> 
> > 
> > Its also doable to move out the clock related settings from  prepare to
> > startup which should work aswell.
> > 
> 
> -- 
> With best wishes
> Dmitry

-- 
With best wishes
Dmitry
