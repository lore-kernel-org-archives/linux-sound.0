Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74BE69461
	for <linux-sound@vger.kernel.org>; Sun, 30 Mar 2025 16:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743352609; cv=none; b=FzmFUArn8Pt8D8xh+6Oib4jCrIV556uFWQZSYAyDRFamsSIyQSKnwsO3d/wfz4k/2rRl/iInSAaov1PCLejCG+5W+iS+T2eJWy/LjcPfxtDwjdQkaB5SgfpEyS6iFbk0XaGNan3J3y8O2CD+P7JuYAPEnxkHdCjtA3Iv2Auw8Fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743352609; c=relaxed/simple;
	bh=QWR6EaDQI1AguCT0SWh5ztNU28dnd6/6IjNKf/tPDeA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iHZU/6l0j98cYSzRUkoYBOiq0q8mX3LCre3w2OWfh6dULq4z9sCmuxTV0EvopJwwJetka928/BZkJG0eJ0qgO8PSqMIhCKF97ox0agekx72+Ytpa5drrqxAY+mY/pYyNcCxbabD6BVe0y8CtbzgLcDFqsoGCmXZtUZ9FitK5sZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fa8xr9xf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fa8xr9xf"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52UDeYWe010356
	for <linux-sound@vger.kernel.org>; Sun, 30 Mar 2025 16:36:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=J9IbJLHzN5Gek81KZ8rQbP94
	oxIGmfBdFVQn3sF3atY=; b=fa8xr9xf4VRxYcMRudOdck7gw+gOU0yTkctt0jYk
	OoKRdloSvJnZg+yq5y5IUKAblD3jQ0BqZm2JAalm3ZIfqfNvddLM25E701Duy0w+
	2gjk7tJpsyPhYxk4qjEIGj6rCS9VJRuLWHEGTytT8qZISGtZAVHGy2XK9KABRCic
	55h4i30u9QRfle6nLc17EvVFxUKCScpHrUAZFkFv9NIyPkiCk1a4gdDduqGBEFOd
	wCAV+oI4jfGR08C9gVFaOQRqEekXCvLuqBCPkf5rxHdKMoMpFKdTaZDNl1CIyWcd
	ISwEWHB2d7ZGUdTlXv9oc77DYnUAoMWiAQ6K075isyx14g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45pa1ntdm7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sun, 30 Mar 2025 16:36:46 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c09f73873fso572278385a.1
        for <linux-sound@vger.kernel.org>; Sun, 30 Mar 2025 09:36:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743352592; x=1743957392;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J9IbJLHzN5Gek81KZ8rQbP94oxIGmfBdFVQn3sF3atY=;
        b=AI0xi8hrXpCM/1laYr+lQ9xNb8wX6/E3X2CPuKrRFfWvTT3Umq+aQCVi9MAZfA6VvU
         AuUlEK781TlMVTgX2W26GZEwk3Jra2fDEVW1b/iGGYfzh23ULjJkgPP5VAJNOrdPiFWy
         0UUsRJTe0m/zp9lLecX8pl1P6owAePar6vN5k9nu45vsybMU1Z0l879xHYwk+1/iCP1R
         fFY4rSx/4/u542cbwFEyhNLd2oSGuXe80ksW3CEa/E0grJRZGVsze51TWCZL7VEz9qMt
         NKGsKCV9qczv1tTLlBAiTo+NKuVQkmO7vlA4LroJZ6ahGAas7r7DCFGyRnsEqogsYPD1
         4mfA==
X-Forwarded-Encrypted: i=1; AJvYcCXjhM2kAT5t0ANzkIhOl5XtPayOdv5KJEtY9U1aqGGOi8A6lYqeOMWiWCnHxRoVla5FHUvhIJZkeUjwKw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwiVkdaPTGl6tY7Wqu+1I042jAPgvvPocKvaD2BsSc3INzmR1A9
	oahqWYWOi6Rwbtnw65JtIGH7/IWfFTeO0mjLbt+L/h1mYqxZrhLcpmAQOHFhvvU7VeCQDEKAThT
	AOGHqV8GHWZxaNqKcYefoBX9/8f0u5lxzuRIGiX24n4zQwd2oIv8HN6eX1ti9Mw==
X-Gm-Gg: ASbGncvVg87r9igiEM/inGuibXO8627DHwHHMLgkkYsPMpohC+CbWuPCRkL/HMssyUB
	K+WHAkPT4c7beQYm4gd2AslZtX9Md0WKxVPBSS9FPlAk+6irBFakyZbzkwgVBhjmVzcFPNgJafk
	kzA+fz7GIBN6MEbB4xewiAMaXQpX52n+dIFra+Ph+Osar2w9kuedL7NhsQLOgwYNagDJL6DvqBR
	EHP8vOIA2WCF9YnbEoA4hvs4Fafr9HpC0GXrdtc2m9tHdzfde3hE6BopFVqvJaAQnEgZMz8fwDc
	Du/j55HMONUSXDlvLW04pR8DH2+tYSsXvsPzEKn3TupA8Sv6cX5xvlChLv8fMBO9Co9FdaGByJ3
	xO3E=
X-Received: by 2002:a05:620a:4108:b0:7c5:48b8:b4ac with SMTP id af79cd13be357-7c69072f371mr927035785a.34.1743352591850;
        Sun, 30 Mar 2025 09:36:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFEdV5tc6GnhjMZwo8TLqjXFz1vGzqWB4XFi2jQnVxmtoNtcZMKKrRG70w3Gh77iotOX99M3Q==
X-Received: by 2002:a05:620a:4108:b0:7c5:48b8:b4ac with SMTP id af79cd13be357-7c69072f371mr927032985a.34.1743352591505;
        Sun, 30 Mar 2025 09:36:31 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b0957fc65sm921069e87.118.2025.03.30.09.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Mar 2025 09:36:29 -0700 (PDT)
Date: Sun, 30 Mar 2025 19:36:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: dri-devel@lists.freedesktop.org, linux-sound@vger.kernel.org,
        mperttunen@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
        lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz,
        tiwai@suse.com, dmitry.baryshkov@linaro.org, mripard@kernel.org
Subject: Re: [PATCH v2] ASoC: hdmi-codec: wire up the .prepare callback also
 for SPDIF DAI ops
Message-ID: <h6izcncnqyiyv7nvyvauzjftjvzyhhev6y7wbmdqjyonrdw5ho@4yclxkbukgcs>
References: <20250329191433.873237-1-martin.blumenstingl@googlemail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250329191433.873237-1-martin.blumenstingl@googlemail.com>
X-Proofpoint-ORIG-GUID: nXu5M7GyHbYf6aJwcqx3JXCejlq6P8GJ
X-Proofpoint-GUID: nXu5M7GyHbYf6aJwcqx3JXCejlq6P8GJ
X-Authority-Analysis: v=2.4 cv=MPlgmNZl c=1 sm=1 tr=0 ts=67e9731e cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=KKAkSRfTAAAA:8 a=mK_AVkanAAAA:8 a=rfKdTcLzpojuHggjPigA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22 a=3gWm3jAn84ENXaBijsEo:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-30_08,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 phishscore=0 spamscore=0 clxscore=1015
 bulkscore=0 mlxlogscore=999 impostorscore=0 mlxscore=0 adultscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503300115

On Sat, Mar 29, 2025 at 08:14:33PM +0100, Martin Blumenstingl wrote:
> Commit 2fef64eec23a ("ASoC: hdmi-codec: Add a prepare hook") added a
> prepare implementation. Back then the new callback was only integrated
> with hdmi_codec_i2s_dai_ops (which is used by the I2S input code-path).
> It was not added to hdmi_codec_spdif_dai_ops (which is used by the SPDIF
> input code-path).
> 
> With commit baf616647fe6 ("drm/connector: implement generic HDMI audio
> helpers") the DRM subsystem has gained a helper framework which can be
> used by HDMI controller drivers. HDMI controller drivers are often
> tightly coupled with the hdmi-codec because of the so-called HDMI audio
> infoframe (which is often managed by the display controller).
> 
> To allow the new DRM HDMI audio framework to work with the hdmi-codec
> driver for SPDIF inputs we also need to hook up the prepare callback to
> hdmi_codec_spdif_dai_ops. Just hooking into the hw_params callback would
> not be enough as hw_params (is called too early and) doesn't have access
> to the HDMI audio infoframe contents.
> 
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
> Changes since v1 at [0]:
> - re-sending since there was no feedback
> 
> 
> The following three upstream drivers can use the hdmi-codec with SPDIF
> inputs:
> - drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
> - drivers/gpu/drm/rockchip/cdn-dp-core.c
> - drivers/gpu/drm/tegra/hdmi.c
> 
> It would be great if any of the maintainers of these platforms (Cc'ed)
> could confirm that this patch doesn't break anything.
> 
> Mark, Dmitry: who of you would take this patch (Mark via the ASoC
> tree or Dmitry via drm-misc)?

There is no reason for it to go through drm-misc, we picked up only
several API changes in order to ease merging of the patchset. This patch
should go normally via Mark's tree.


-- 
With best wishes
Dmitry
