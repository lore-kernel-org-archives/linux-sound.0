Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95F1C17C211
	for <linux-sound@vger.kernel.org>; Tue, 21 Oct 2025 13:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761051836; cv=none; b=dM8xVq9njmBPAu3a54MYlMnqf6M3anGkcNURos7rNj8IuNyrx0sfBD5zAQRKEnRUTvmWQtbDuT5+aLe9ZaWmWeFmZy6Ah3pV1ZxaLoWoR++ziQ250NFfeCESEzAkGNqgLjdub8zshNalnuKTQaLnQ4bP+FOKxlU1Eeu1Wt+9/do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761051836; c=relaxed/simple;
	bh=FDyI0ELaP+8G6K2J87c4ou8IZSaFgqHpQeJVkW91Fp0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iJbpImrN+Khg3F+IEuKCh42V1X8BVSMXxS2KL9lLViIQdn/LO5l9nKStBZhmK4KPeXkBCrcvibB5eAPVhriMcFPtDnIEJIeQw8O2OM7BhUU8vptzbrA7u8ALrxX+IyD+V4e5pSkDBFOrCV/o/sQtEZ2OaCR4gQc7JVaHB5miliA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m7fzZPoX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m7fzZPoX"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59L8QZYw018580
	for <linux-sound@vger.kernel.org>; Tue, 21 Oct 2025 13:03:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EDrIqOlDWabTc3vmLbQ0DUei
	ZyiWzCtrffXjD0fQBds=; b=m7fzZPoXJUiRKy7jLR+DFiwS7U+89rFly7j6qaNC
	lb4tBdMK5NlFYgFtlni3rijyRfYScjrcTHuhM6Gb3nWZSFqVXW6cTWd0wbrFOY6B
	gfd/38XNwiIWfiIExxLgt3R8GI0tYsK2mimtozWw4L73c4M+lihPKOdxY6N2Jk5/
	OxNKaav5mGAexhkyjyz7tq2WLubclB134renYtfBKuFY6a3OoohZiArLkG4xiHWI
	dT5jQRyUgulhx8keK2ItyrJaT2T1cmY0Mx8hTAMmpMh5AGSW/7lBHWug5v9r+ct6
	ZUnEB3XKH+Kqg025nkhBvyIoOg6PQXa6keu1zuzhvIjnbg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v469gngw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 21 Oct 2025 13:03:53 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-932ee98bb3dso907813241.3
        for <linux-sound@vger.kernel.org>; Tue, 21 Oct 2025 06:03:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761051832; x=1761656632;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EDrIqOlDWabTc3vmLbQ0DUeiZyiWzCtrffXjD0fQBds=;
        b=WRD5HcF5LfumZIOQUg7fnAKJACFBaKM6+fY/BorDf0DsnYnQH/Dg5Nhf9ybPLKUb00
         qg5pZoi/A+tZti8zIMwjcwlfVrxudnkr1DEeYJ2L+zFinwqlxuMSIIkx8BBuGa3pM4wH
         wCE4EYLMEjUQNy8XrwMrX+rpcDBtqi8c7qXz6zsylriupbNm5ipEb5weJBY4gr4rqJzs
         gUPRblv2IeABmKZynPJsKEItVSvyoHyZzHjoabpaVBuOvX/X5S1d0ZlNByfYL4kxwIyH
         6gwz+Lpd0cL6a86VBj19wwIJtuxD0HO2JGYdg732421HT3+zvG2xB56docPlnC+cKiQW
         UsDw==
X-Forwarded-Encrypted: i=1; AJvYcCW7pngaqXaIfU6imzC4/QPmvqXfZdTY7kWOIKTPUpTN5hzACwOM0KQTo/PugNLMSSel1OJlt9LPlIrhjQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwsaO0oFY1bkrOGTrZhExU3V8911d/EKOzYIEGByt5saT8venqF
	SkO54GNQGTfZGLF+tirbBcst7J7SkX5SrQLKkgt+fo+ecJ5r/GCgZFT9L5ilpczNIxDA4uIXo1D
	FYvA2YmU7dARmpVauuw6cplihA/MsbxW/upsii3DabtzU2Wcna59pEgIdHcjTbixa4A==
X-Gm-Gg: ASbGncvVr18Av+b/2VttV9Wt9ZEYPro8zo2drWLwR3qjV6wIr6jy6LgxwpTEutm6iHL
	/mBSmYge9ZwfqMWaOGdR3dcQ0YsTBiu1X6xFXexHutG+swcHWZ73BoS6xRUJTCpN9GWFZG6X3OJ
	oAj5Z2PIBU2iLSBE88CxrM2i8bmh5ArFaVi9DL0vUj0JDJBeKyurxTeW8v6cN7T8mogC8mcNpHY
	VMB/xoh/ONYOHvjbZeQfYA8hUNFPCo8Jz1IdinMVMas9vh4A0Qe3cfCHCgOlWMzP3oqhJFHDIJo
	gTuLWxSkBMP2hxhHVRyptdct8hOWOj83rQN6EsJ79ct3+c5cbk6ix011dVAEO0uSUc42nqoyO0e
	SF3cVfCky8M5LMDMXSzedzQc2m8VhkzUe9Ywv2OJVaLPeNJFNhNCz7yK9HlBRHIChl0E3vSufrO
	VytCWK7Dv7yBA=
X-Received: by 2002:a05:6122:1346:b0:54c:3fe6:6281 with SMTP id 71dfb90a1353d-5564ee23106mr5038767e0c.6.1761051832341;
        Tue, 21 Oct 2025 06:03:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEhkuO0rTjc/ZeeWLixgVS1Ew/7JMs0TEHaib+DIHO5ztf4dvMOXWkt92zh6Povn11NoZSU3w==
X-Received: by 2002:a05:6122:1346:b0:54c:3fe6:6281 with SMTP id 71dfb90a1353d-5564ee23106mr5038728e0c.6.1761051831810;
        Tue, 21 Oct 2025 06:03:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-377a950cb2bsm29151841fa.27.2025.10.21.06.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 06:03:50 -0700 (PDT)
Date: Tue, 21 Oct 2025 16:03:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: qcm2290: add LPASS LPI pin
 controller
Message-ID: <56vmqgrjy3je7omzirxnfxtuocebbj356iaew5thgkagi35464@hh34y7efssow>
References: <20251007-rb1_hdmi_audio-v2-0-821b6a705e4c@linaro.org>
 <20251007-rb1_hdmi_audio-v2-3-821b6a705e4c@linaro.org>
 <b6223af9-2d9e-4ccd-b297-79f63167242b@oss.qualcomm.com>
 <DDEN5NSLDIHD.C1IELQW0VOG3@linaro.org>
 <zmi5grjg2znxddqzfsdsr35ad5olj3xgwwt6hvkiaynxzm5z33@gsgrdguj563n>
 <DDO0LYS7UTEW.3A9WGTAA5DKVO@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DDO0LYS7UTEW.3A9WGTAA5DKVO@linaro.org>
X-Proofpoint-ORIG-GUID: z1b-uNc_8Lid_3gYhoVpoKaIEZpRRrR-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAzMiBTYWx0ZWRfX+NTOTrzkmSun
 nRgXiQkNwTBcbn6YyWOA+rfQEe/AIS9kjhSvLyVXMbNsSwE8hCnLcgejPOeFshEdPkklT+UxDNq
 S3p2iVt6BjfHWhLVYkM0I12U0TD5YVCPAoXgod+X9l/yvdE3C5dgGOu03ax8EWA+tA2RFVT/BMU
 g4HBhpg02vhehbb010PlzBeAgjnIq1wXUS3ztBqJL4JJNNypNpA9e9hdZI59GK/91CNqSJoU+Pd
 xYiFGQgbH3Mw7oM0dkAanuRZ2rpE4UY9OAgfyazeYCumWFh1MFd2aAV0aO7lVMPbv9n1WWo4Rqf
 rSyHYgtz9Wg3Db9d29fbzqXZ2MDHyf2exCsaezj/uZ1IuO1/tZfJCWJbWIM/ZXk8Jh6Rw6FrkQO
 d+39fMo2lBvr/26fq5VQq0f+5jCyxg==
X-Authority-Analysis: v=2.4 cv=U8qfzOru c=1 sm=1 tr=0 ts=68f784b9 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=SizNog2SKWkDgIwviPAA:9 a=CjuIK1q_8ugA:10 a=o1xkdb1NAhiiM49bd1HK:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: z1b-uNc_8Lid_3gYhoVpoKaIEZpRRrR-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-21_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 spamscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180032

On Tue, Oct 21, 2025 at 01:56:09PM +0100, Alexey Klimov wrote:
> On Fri Oct 17, 2025 at 11:42 PM BST, Bjorn Andersson wrote:
> > On Fri, Oct 10, 2025 at 01:29:38PM +0100, Alexey Klimov wrote:
> >> On Tue Oct 7, 2025 at 1:39 PM BST, Konrad Dybcio wrote:
> >> > On 10/7/25 4:03 AM, Alexey Klimov wrote:
> >> >> Add the Low Power Audio SubSystem Low Power Island (LPASS LPI) pin
> >> >> controller device node required for audio subsystem on Qualcomm
> >> >> QRB2210 RB1. QRB2210 is based on qcm2290 which is based on sm6115.
> >> >> 
> >> >> While at this, also add description of lpi_i2s2 pins (active state)
> >> >> required for audio playback via HDMI/I2S.
> >> >> 
> >> >> Cc: Srinivas Kandagatla <srini@kernel.org>
> >> >> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> >> >> ---
> >> >
> >> > [...]
> >> >
> >> >> +			lpi_i2s2_active: lpi-i2s2-active-state {
> >> >> +				data-pins {
> >> >> +					pins = "gpio12";
> >> >> +					function = "i2s2_data";
> >> >> +					bias-disable;
> >> >> +					drive-strength = <8>;
> >> >> +					output-high;
> >> >
> >> > I.. doubt output-high is what you want?
> >> 
> >> Why? Or is it because of some in-kernel gpiod?
> >> 
> >
> > What does "output-high" mean for a non-gpio function?
> 
> This is not efficient. It will be more useful to go straight to
> the point.

It is efficient. It makes everybody think about it (and ask the same
question in future) instead of just depending on maintainers words.

> This description of pins was taken from Qualcomm downstream code
> and the similar patch was applied (see provided URL in the prev email).

And we all know that downstream can be buggy, incomplete, etc.

> Back to your question -- does it matter here if it is gpio or non-gpio
> function?

It does. The I2S data pin is supposed to be toggled in some way by a
certain IP core. What would it mean if we program output-high? Will the
pin still be toggled (by the function) or stay pulled up (because of the
output being programmed)?

-- 
With best wishes
Dmitry
