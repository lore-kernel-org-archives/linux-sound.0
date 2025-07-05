Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4BAE21A444
	for <linux-sound@vger.kernel.org>; Sat,  5 Jul 2025 12:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751717767; cv=none; b=UwBUB1YiYn9LjfQrXfgMvtMYl6Ajdh/hhTLxBs/ahNhkMmWsq88F38Xr84mPKYup/vSyK2oaXTZ8i3I9ACIc0tH8oPE482voLWfsGsw5lUNFyZM5wvJS4RmY6768rrgewrcnEkhZoeMDugbF92rULb1M7JTyyUQ62ow76aZmlzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751717767; c=relaxed/simple;
	bh=zXA7z4CAURglQcD0sdU5FjGHsRA0zPjWC2fjluyU4oU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FPWBpgydR4Kf8gTXA5SbOb0RMK7kndjUCK5SAnw/oI5PIwgCIMsV2UbW6rdQ16Anl3PDinjqOdTpy8ISF2YBVVyoRqPK2bssBBnM0qGp4HFcKkdK3VcmXI9nbmz5xDDF2oBwxb+99HNCl40E8+ELoFsXCCPKXUHasOsAhvWM3aA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y/qvHEkE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y/qvHEkE"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 565AH20T008810
	for <linux-sound@vger.kernel.org>; Sat, 5 Jul 2025 12:16:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DZskBg0KwT3zvs6x4xilopTA
	Ma1fKs/iNW6MtQwSdNc=; b=Y/qvHEkEDLVML7NMTl2jmdQOldxFH9AeSWShJCOz
	Q6pEFpd5uq/w4pnZkdY8LlxEeIbjrgbrWVCUW+tAx3WQX8iKx7Yh76FcZe7xzzrM
	j/gEe4vR0MUU76LYOU8yeD1Ci3VcRh9FAnwM8r5DYkSP4GMYLszVtMVawg+0w7r/
	QBw2yoSSYieLCkI1pX2/o/j3/CBgRSbHpibURUv5I9IMgHV1nsoO6pV84FnF2qt1
	9QdO2Cj91mE00ub0JZVitVtDcoN/VHQcZmJ2IzzpNDAIxSMAOnEhrDsoHxkOh131
	O8qfIHglvtGXDIDhjUot3NONrEGYFKBxs4T9Ti6CcSzUcg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pu0vryp0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sat, 05 Jul 2025 12:16:04 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d0981315c8so119162585a.0
        for <linux-sound@vger.kernel.org>; Sat, 05 Jul 2025 05:16:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751717763; x=1752322563;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DZskBg0KwT3zvs6x4xilopTAMa1fKs/iNW6MtQwSdNc=;
        b=Kdp6ZBLOVSPb3VxDMlrK8G4jSqql/58ExbXtdbQJsj2FwDT4M9cOW4kzI8Y2A+tGoq
         QEDoZ3zXnUVSMFeBpzyKaBY0O/40E+j7vFaL7ih6MLEVSGp96P2yF6JgSIY1BJo5nrab
         EU6fRNmD6wzj9DDqQUvSIeRT8LeUdEF4C7bDrtH4vTHNgLBHdN2444+sfTXOmXFNB20n
         rycKTxINp7ckMouqnrbpPzkY3WrkIjsUKpJrumISSoCI8bLgIEbn56J9wqTrtwGsoGVM
         qmh8rs4I3rhXrvWhsKGYC0tNmF32h0+Y4cXOKFqQNgN8WGOWI9hahAfIPD/kWLyUrBxE
         3Riw==
X-Forwarded-Encrypted: i=1; AJvYcCXKdmbyHmcDhmoXhhKmP/0FMyKhI7/ZKn5rweuKsLtzAUHYa3gh6Zu/OdvG3DwdPHkbLmkIWBShYqxEeA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyFLhEvSzvc70khYvBDq68Zseia23RAdrhW4DIiqxFfNqOpxLEK
	lJwWCxSS0BPtYTpE4jRpavSQW0yqhLsU5fo9zvU7m1L/XS9LAzv/GVe4K9u9aBlxCBKswXqz9/H
	mWHL1pQ4tZjnW8yWiIyzWIOwmukkjiNtF4/7pdnvp/dHDbkgWBmFTxqxRWXdd6aSWjQ==
X-Gm-Gg: ASbGncv8+vXUwaOPH5R1mFa+Z3eprKGUe2ZrbJwXdxWWMiNaYhwZGcFY3uSvM6LN2Qi
	Fuh55ZBEkJqQmVcDy3GyFgJbE5xFquB3hUhWYvamOl5M/QUZqsEiLI7NRooDHKKBLu3YHZDSEob
	6YKlM2hMjKSAz/feJu8dRHFhNbbO24jd1ym6ZAYsr0QX7J/5RC+QIzMapC6bysculpwAt4CsUlX
	zfSwTweV9KxH9oBr4oiUCzBnCt28AEQKqHwSJUiDFKrCxJz2IwI5Rk7UWc6KzmrfL5IAvS9yPdr
	lpO3VLFnfSPRL7969oQxfYS9juNLE27GRKavIciLnhGh9yVfE9tM5AN+EO1rm7VNjwhcjw6JlT6
	ks4LguJSg73DxrcQYinNCOZgvzo2bkxhwWV4=
X-Received: by 2002:a05:620a:1b9c:b0:7d3:8ffa:f1bc with SMTP id af79cd13be357-7d5df194ad6mr647606685a.58.1751717763479;
        Sat, 05 Jul 2025 05:16:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+gQQa0CaeGQsNRfGbtyGeCjeRcczJX70+ST7EoZUozdS8AfTgykjfKP0uSxr/FF8U1oHnzw==
X-Received: by 2002:a05:620a:1b9c:b0:7d3:8ffa:f1bc with SMTP id af79cd13be357-7d5df194ad6mr647602985a.58.1751717762891;
        Sat, 05 Jul 2025 05:16:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556384c8c42sm570788e87.237.2025.07.05.05.16.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 05:16:01 -0700 (PDT)
Date: Sat, 5 Jul 2025 15:16:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        kernel@oss.qualcomm.com, Mohammad Rafi Shaik <quic_mohs@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 1/8] arm64: dts: qcom: qcs6490-audioreach: Add gpr node
Message-ID: <amnwwaoais7hpaoqb5zkkj6cd7aliufmeuwkhdrkyfc53ej6ut@yggpe53i2cvk>
References: <20250527111227.2318021-1-quic_pkumpatl@quicinc.com>
 <20250527111227.2318021-2-quic_pkumpatl@quicinc.com>
 <q6rbvbvejugioon6l23nmmzeue7l4bgtlaf44o3a4krj3lytjp@p3y6opl7vs25>
 <74793074-19ee-48f3-b502-8d970b9f50af@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <74793074-19ee-48f3-b502-8d970b9f50af@quicinc.com>
X-Proofpoint-ORIG-GUID: FyuXVLrM-j0i9GJ9qxJkQ3TOQGuzTzR2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDA3OSBTYWx0ZWRfXzxKETisOyX9Z
 I2pZQYU5qiI9Fp23cAL3YZjzTBsESV1qdt0Fg7xomUJnITrmjNo1qsaNyu9Tps1JQkJnF135iXs
 zwE0MWZNStdPtK73YzN+5dHujzzBQCqE0u5IpWXJGb8hfbz4uiNkJ/V4BToPrHWODkpqbGKqFu1
 vGz2M4Qk+o91yKDIgHUOSKp5+bbrt/oeme5aWTKBT614T0943YsyasAKdKpTYr7bDkFp+6BTeqv
 5fE//RnQstYX7mVSFVBzoSDUCBHnJKrCWl1qd3CAT23AaYRCzlcKbsPs2a1VPV8B69dGoYd5MIv
 0ls+Mb955OkxBNTBnknzjdIZ54mdI6G2D0Htv43n/zT7Zg7btMT15Hbjra7irG8Fz8GRATvmvzW
 nnkK3MtLdFMXj8I6Hl9VEi7nEo+Hi/mZ7w8DV7QxbLdxw8ZA4/YgE9drzt5Nz2dYY8Gh+y8M
X-Authority-Analysis: v=2.4 cv=Rd2QC0tv c=1 sm=1 tr=0 ts=68691784 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=NmWXvj1GLdLyyGW07i8A:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: FyuXVLrM-j0i9GJ9qxJkQ3TOQGuzTzR2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 mlxscore=0 malwarescore=0 lowpriorityscore=0
 mlxlogscore=999 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507050079

On Wed, Jun 25, 2025 at 12:20:39PM +0530, Prasad Kumpatla wrote:
> 
> 
> On 6/18/2025 2:15 AM, Bjorn Andersson wrote:
> > On Tue, May 27, 2025 at 04:42:20PM +0530, Prasad Kumpatla wrote:
> > > From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> > > 
> > > Add GPR(Generic Pack router) node along with
> > > APM(Audio Process Manager) and PRM(Proxy resource
> > > Manager) audio services.
> > > 
> > 
> > This should talk about the choice of adding a new "-audioreach.dtsi"
> > file, and should cover why it wouldn't make more sense to add the
> > opposite of this change in sc7180-trogdor.dtsi.
> 
> Ack
> 
> > 
> > > Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> > > Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> > > Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> > > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > > ---
> > >   .../boot/dts/qcom/qcs6490-audioreach.dtsi     | 53 +++++++++++++++++++
> > >   arch/arm64/boot/dts/qcom/sc7280.dtsi          |  2 +-
> > >   2 files changed, 54 insertions(+), 1 deletion(-)
> > >   create mode 100644 arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
> > > 
> > > diff --git a/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi b/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
> > > new file mode 100644
> > > index 000000000000..29d4a6a2db26
> > > --- /dev/null
> > > +++ b/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
> > > @@ -0,0 +1,53 @@
> > > +// SPDX-License-Identifier: GPL-2.0-only
> > 
> > We can be more permissive than that, please use BSD-3-Clause.
> 
> Ack
> 
> > 
> > > +/*
> > > + * qcs6490 device tree source for Audioreach Solution.
> > > + * This file will handle the common audio device tree nodes.
> > 
> > "Common audio device tree nodes", but not those audio device tree nodes
> > that are already specified in sc7180.dtsi...
> 
> Ack
> 
> > 
> > > + *
> > > + * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
> > > + */
> > > +
> > > +#include <dt-bindings/clock/qcom,lpass-sc7280.h>
> > > +#include <dt-bindings/soc/qcom,gpr.h>
> > > +#include <dt-bindings/sound/qcom,q6afe.h>
> > > +#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
> > > +
> > > +&remoteproc_adsp_glink {
> > > +	/delete-node/ apr;
> > > +
> > > +	gpr {
> > 
> > Glink only consider available (status = "okay") nodes, so if there's a
> > even spread across AudioReach and not, we could even move this to
> > sc7180.dtsi and mark both status = "disabled", and have the appropriate
> > one enabled for each board.
> 
> I am trying to add apr and gpr both the nodes under glink-edge, but yaml not
> allowing to add both the nodes.
> 
> Facing yaml errors, it's accepting apr (or) gpr only one subnode.

It should be fine to add both nodes as disabled and select corresponding
nodes only when it is actually implemented by the platform.

> 
> Please find the error logs for reference.
> 
-- 
With best wishes
Dmitry
