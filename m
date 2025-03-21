Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E78171F4181
	for <linux-sound@vger.kernel.org>; Fri, 21 Mar 2025 13:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742563014; cv=none; b=WM1mI4x31AxGhsD5uGShOoUd8qQzm8T5AyUoUTtzk49jqVnQz+cXhZD994dtvV1kk/6yUeED+DgM4NBhjL0fn+7BXqH8JHvMpyQ67m5DfgxmsPB9YxbOvlUIaeA+xdytSf3+JBWEkEqpii/lf0QbE38ynpFO4LaMBqNe1ruFS4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742563014; c=relaxed/simple;
	bh=5v0eCXSJKnOzt1bK7YTndfKX6eAKPgqOyM0NGeGssOE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NUnTXNBSewbaJgrAUoDUG3xekjf/lBwhKFx06Dce8EcvQheSN0qRx2zvB8Thwqrx8i2T5E6ooUXga5ROU1hXDBnohbWzzwSZJvCzu6dmxuKR7ryJ3V4RgXycwuIsl5a4pWzCIPL5z265jVFr+wUCfACAdEU4SaWAoVXwPj/9Ygc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CbU3lTRs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CbU3lTRs"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52LAT9rT003011
	for <linux-sound@vger.kernel.org>; Fri, 21 Mar 2025 13:16:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rKDADviDBRmij4wqF3bNF8yg
	rPd+aXcSkF8NWGkccV8=; b=CbU3lTRsUR+71/EMi+TdzS6oaA2BNI0uOMCfeHmb
	3aionmkhue1FdweCXCzRZ2LNrmaPclCaL8r4OJszkaQTW6NDiGNfgkgUrTVybKNE
	ZgCA4eDgmTeKfOBk7DDpw3JHBWc2auF5yU+/wMrGm9B4oI6nvq4jbGTojTKBu5Ny
	lsjuLn44esjbrcBJnmrtgZmUIoPE6X5z2QL22JkN5U71qEG8HOyXjlCn2RvmuFdE
	ErZ2BkF9gnHumRby7WS1Gkizi3LvifoW5xge1GDoZMmGLGmIY3hr48SsPm1Pm2Wz
	7qd9YXuem7LacPPzJRz349PQ6s/6SitXU8KRnZoFgLTj1w==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45h4p10trw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 21 Mar 2025 13:16:51 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3011c150130so3110431a91.2
        for <linux-sound@vger.kernel.org>; Fri, 21 Mar 2025 06:16:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742563010; x=1743167810;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rKDADviDBRmij4wqF3bNF8ygrPd+aXcSkF8NWGkccV8=;
        b=o5B7wkcjOgUkAxbU5q1plTxvX2R8qYZPJ2FnBwugq9Q9dhDoTS04UiNUzsXpZXP4+j
         Dt6dfQl+sRndVgc7rR/CUgU7jKWbQZaiPb47D8PTizIVNyF3EcriRiV9igFBRMniYHNS
         +ZeOUDoVlJZAqJ+7LySOZnwgKLsTl9n8a/VzrzvB28NlSe/3hoYhdDVyTnpqgcePJLIf
         shLf2cW/QY+UEEMehs+61FyjPFRdl/PYkFYDba3qzM2jaWTLGZlfmHNkXdTflOTHRQrn
         iTqkkKETqhXvV9EPKDYljUDl2WODiaYp7ThA1/f0vywKReNASPp14UP4wx5OiH6UiysU
         tA7w==
X-Forwarded-Encrypted: i=1; AJvYcCXNPzE3yLuCWeIe/l9npaPxo/nE2kwhnifJs1Mr0o6EWnd9NlXbW2WCmtaGDWRjynceJ/cUcy6f4MDpNQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3a4T+cJ4XYp0lW9URDgBGCZnS9q3MTbaFfEHEJzIA9iFswW/3
	43h4a4dicouAaF34W8H56hWy/JgcXOnDoImhHelZH3XB9qOrIroY/vwKvtZc7b55uLxTqWhSKMp
	7YK6puc5q6jo2K+3NQlrBtVpktaXkELDf6pvf7YdXg7/zBR/xk8CakfT3uFSnklHMWvLDViMUVc
	uq+6hQm3Cn45WXHZmCQQisFRS0yGfe6Dl4YHa5
X-Gm-Gg: ASbGncuJjIq9R1BYxfi/3v3FZ1oUUmpvZe0H3uzvpnVak0nrMo3UUDxGeiSNTQ2pJFm
	U8doW0UwpnFFxMG1+Z8OxMDOHxgdIhlSRElXz+wOnBORJTJH8XvtbNv049+Kl3+oVdoO6ZzHoyc
	SYlPpKPAGreoaCE3PWNBnGYwOxrGLD
X-Received: by 2002:a17:90b:2ed0:b0:2ff:5e4e:864 with SMTP id 98e67ed59e1d1-3030ff108a6mr5526829a91.25.1742563009895;
        Fri, 21 Mar 2025 06:16:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGr2mutO+YUR5/PARS6/TKZO8Ev2O8vO6eT7KZPndPdr3Py5PTyw8qRv2gkQufsIZf3sd6sgOq3hu/uvvAaFgw=
X-Received: by 2002:a17:90b:2ed0:b0:2ff:5e4e:864 with SMTP id
 98e67ed59e1d1-3030ff108a6mr5526785a91.25.1742563009246; Fri, 21 Mar 2025
 06:16:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250320115633.4248-1-srinivas.kandagatla@linaro.org>
 <20250320115633.4248-5-srinivas.kandagatla@linaro.org> <rdvsnxuc6by6sci56sh7thzpxo5cqi7q24fnmc7hi5yrfszwrg@kqjpiilko3xo>
 <b1aed195-b2e6-4f48-ba10-3049d74085a9@linaro.org>
In-Reply-To: <b1aed195-b2e6-4f48-ba10-3049d74085a9@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 21 Mar 2025 15:16:36 +0200
X-Gm-Features: AQ5f1JpCRwMtkjJDn9oo-cBhrY2GuyMxCFMeKp_-hQaIAlV_kqtTNCxsu0Mojn4
Message-ID: <CAO9ioeWLRfzUOwjnFsi_yztdJo2Q25bhvjddh6D3naV_K5eShA@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] ASoC: codecs: wcd938x: add mux control support for
 hp audio mux
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: peda@axentia.se, broonie@kernel.org, andersson@kernel.org,
        krzk+dt@kernel.org, ivprusov@salutedevices.com,
        luca.ceresoli@bootlin.com, zhoubinbin@loongson.cn,
        paulha@opensource.cirrus.com, lgirdwood@gmail.com, robh@kernel.org,
        conor+dt@kernel.org, konradybcio@kernel.org, perex@perex.cz,
        tiwai@suse.com, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, johan+linaro@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: T5mEqpTrUBXU-NXaB0EOpj0RDcisakO_
X-Proofpoint-ORIG-GUID: T5mEqpTrUBXU-NXaB0EOpj0RDcisakO_
X-Authority-Analysis: v=2.4 cv=NZjm13D4 c=1 sm=1 tr=0 ts=67dd66c3 cx=c_pps a=RP+M6JBNLl+fLTcSJhASfg==:117 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=KKAkSRfTAAAA:8 a=2awXsTXn6f5pcYlzz10A:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-21_05,2025-03-20_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=821
 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503210098

On Fri, 21 Mar 2025 at 14:35, Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> wrote:
>
>
>
> On 20/03/2025 14:03, Dmitry Baryshkov wrote:
> > On Thu, Mar 20, 2025 at 11:56:32AM +0000, srinivas.kandagatla@linaro.org wrote:
> >> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> >>
> >> On some platforms to minimise pop and click during switching between
> >> CTIA and OMTP headset an additional HiFi mux is used. Most common
> >> case is that this switch is switched on by default, but on some
> >> platforms this needs a regulator enable.
> >>
> >> move to using mux control to enable both regulator and handle gpios,
> >> deprecate the usage of gpio.
> >>
> >> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> >> ---
> >>   sound/soc/codecs/Kconfig   |  2 ++
> >>   sound/soc/codecs/wcd938x.c | 38 ++++++++++++++++++++++++++++++--------
> >>   2 files changed, 32 insertions(+), 8 deletions(-)
> >>
> >> diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
> >> index ee35f3aa5521..b04076282c8b 100644
> >> --- a/sound/soc/codecs/Kconfig
> >> +++ b/sound/soc/codecs/Kconfig
> >> @@ -2226,6 +2226,8 @@ config SND_SOC_WCD938X
> >>      tristate
> >>      depends on SOUNDWIRE || !SOUNDWIRE
> >>      select SND_SOC_WCD_CLASSH
> >> +    select MULTIPLEXER
> >> +    imply MUX_GPIO
> >
> > Why? This is true for a particular platform, isn't it?
>
> We want to move the codec to use gpio mux instead of using gpios directly
>
> So this become codec specific, rather than platform.

Not quite. "select MULTIPLEXER" is correct and is not questionable.
I'm asking about the MUX_GPIO. The codec itself has nothing to do with
the board using _GPIO_ to switch 4-pin modes. It is a board-level
decision. A board can use an I2C-controlled MUX instead. I'd say, that
at least you should describe rationale for this `imply` clause in the
commit message.

-- 
With best wishes
Dmitry
