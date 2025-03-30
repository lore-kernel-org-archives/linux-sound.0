Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3781C84D4
	for <linux-sound@vger.kernel.org>; Sun, 30 Mar 2025 19:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743362804; cv=none; b=e/ipN2jsvkpdw21IP6oXZ3fET6f98LTqIjQ5LnQZGXbdQG9j0grtzyQCcwfsgap8vgbwCn8l1PUmuY2iNSWMtqtnc0o+bubAJVEzqUcHnG2PMKErf1fbkCasFT0Jy1ebGQ1n/A+KWiI2F1gErG5gjt/+c2AlEsRU5Ih4sH81Wu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743362804; c=relaxed/simple;
	bh=QQjWPiOzm4rZs44Nz9sCrKcrc/xE+dRevyZXJgsSyOc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HgiWDB6wtrCjBrw2HQUIPXPyhTmmddH5QXnAHOiuw0NxhhnEifry/b8P/aUKvVzpKnaCdZiAGL4wtI3nnqYRICWvKuaAfOOA5x8QVx21K/IparkezNbbiGbfvKhBQB/5cFpQK9e+bl3va4FJQtyElx7w73aAYag+N9Aaa6blas4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ki1PSypQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ki1PSypQ"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52UJOEFM019201
	for <linux-sound@vger.kernel.org>; Sun, 30 Mar 2025 19:26:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pAHgTy/CACDJNBcxbiqcZgMo
	cw/wyMoGwl1/5JsSoqg=; b=ki1PSypQdYxX22g6f4x0HgB9VJNCi0zLqJxdUL97
	SacGa2FmMl1rO4yXCwd3SsJpWoDgDlR+UB0le2RVqZ7PliEKDVeun5MqqH34kTnc
	3wjlqOi5TGUGFHWL5QaBOZC6NVTn8YnSz0n0q2/FYCMAVfX3SwR1J9xQDm+Yqxc2
	10V9ZNi5ACoB1N1sdbQjyhRQgH05XfPm77nRg9JDEl9aTVt9MmPfvi7slyVTqsvB
	fO0at1J7RajacBB4xNqwP7HEcL+vgaffLzOwdMcPnOisB/s5G+MYNzdVwxPgKhXc
	rFANVRK3vLdKKY2prnv2rsZEWucFTnGyU5Nf5Bq3nvUsWA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p9892p00-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sun, 30 Mar 2025 19:26:40 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5d608e703so701543785a.3
        for <linux-sound@vger.kernel.org>; Sun, 30 Mar 2025 12:26:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743362800; x=1743967600;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pAHgTy/CACDJNBcxbiqcZgMocw/wyMoGwl1/5JsSoqg=;
        b=GuM17PY4mQz7qzbrgOwe20t/d9lECvdnFFbdziQ/sZQqMHsWRBxeCzDRkrkq04HmXn
         ZfpeSN7rxwnamVdlT233kDGymqtKeOmoqOtkK63PXQCju9HRwJc5bv2KCGf1UBCn/LOB
         2ap8Aq4FHiZR2tLP3KoLqSWlw7slUFIuQX+4plRJg+usS+2e/lEQPeVxIZNPKg0RhYZc
         7WXRcv0JRGpMFg0PwTAWSA8a7A002nds4lGaxuaJKyv4g8G4H98Bi/5mXU726fHsCtHf
         9D0MIoBX/X66nttFk8gW5MxjDMxE3Yh2/VwoDIqo/UtkUoST3TRbJ3lunXpiydQ27v4o
         CjNA==
X-Forwarded-Encrypted: i=1; AJvYcCX6zp8sFb8KEScaSdpVaLBdc0r6RsR3SHAsgO2A17pgy1CK6zrvTJpjU8YEH7qWKByOd9q0tu6sgfANYA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+8Yo5SRdMdR2ygQY1zFz7DXinJESKiPtvZS9eZjPdd/FMF000
	X74SqT9BGzixMGhJQs/oWMAYkuVORgAt54rDNw/Jyry3VaI+fZAKFWcDejuAmAOmUeYEv1F43lk
	dPzKO7xPPU0xooJ6iPugoFw6chTXgFpbNK9xat3+i9kjkyWwqiMQus5QaNz8Uig==
X-Gm-Gg: ASbGncu//3OoG4kxfSHwU7s2DcVcPOAtQQm1lP8bysdLko1ZvPt3mrtjlXN7WDMH/5c
	ZfOD6n3cQt5uilG05ZjwXxFQJzWe7Gz3IHzDZOl/s1jrSVdCaTRjnh5tphkGvet5ugwjfS3qaOO
	mfo+F8CRK0K2K4P7COfJUfQeUcqxkQa/c15xqtUWBzgYm10/oXfO7QU7VrRxKNpDIbcdGMUkBkD
	wUQb1NP2uX8N71YOfyvRt4ORS9r76sGLFDG4UGPdeyUiPpWcV9hgyzwGCkzgrkyHSBUPQSd9RY6
	078bTebb+SNnaZS3E4LSsk+XxwPeonbLTw9+KfFeGDyUQOdtKr2AYeDJOrS/JSCZWpgIRAWTEBw
	ESLE=
X-Received: by 2002:a05:620a:1aa1:b0:7c5:5fa0:4617 with SMTP id af79cd13be357-7c69087cc6cmr977665785a.40.1743362799742;
        Sun, 30 Mar 2025 12:26:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHuzwPAeNbLcInRyGKSU3ltKyTKZ5JZ5WGJJjb7Pq+vWyVd70VYxdrssavMwtCrSJhB7YhpgA==
X-Received: by 2002:a05:620a:1aa1:b0:7c5:5fa0:4617 with SMTP id af79cd13be357-7c69087cc6cmr977663785a.40.1743362799399;
        Sun, 30 Mar 2025 12:26:39 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b0959f429sm949528e87.212.2025.03.30.12.26.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Mar 2025 12:26:37 -0700 (PDT)
Date: Sun, 30 Mar 2025 22:26:34 +0300
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
Message-ID: <yyxqg6odzlac2434kmzvjccguf6cehhotat2m6r4at7o2ldiuh@rl7y2vv4hetj>
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
X-Authority-Analysis: v=2.4 cv=fIk53Yae c=1 sm=1 tr=0 ts=67e99af0 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=KKAkSRfTAAAA:8 a=mK_AVkanAAAA:8 a=EUspDBNiAAAA:8 a=rfKdTcLzpojuHggjPigA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22 a=3gWm3jAn84ENXaBijsEo:22
X-Proofpoint-GUID: _AaGUwJ3kGKhvgzJ2cCnipdivKaJRCW2
X-Proofpoint-ORIG-GUID: _AaGUwJ3kGKhvgzJ2cCnipdivKaJRCW2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-30_09,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 mlxscore=0 adultscore=0 phishscore=0 suspectscore=0
 mlxlogscore=769 clxscore=1015 lowpriorityscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503300137

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


Almost forgot:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
