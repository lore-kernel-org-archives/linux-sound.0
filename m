Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794212687;
	b=ElgcIA1sPDLGkH1mIGQpjdOD6M71SrKesbJBnuC3L23z//grxzOQbYJlRqKykKdxR2Qr
	 6MDhhDfn/edQXur8o1rvqMtTW0xtvlsxJZYSAfyy/K1/dQOUzIEYd3Flr91p3HZ1Txp88
	 X1OhsWbfBzl5x6T1QKtgrfrlJ+uHp5SET/ouj9RUQKr1JtzhspUPN17grEKGF9mAIhruL
	 4ZZYl5lNy2+f4rW45c/w4EKIwTEmRDpTQNWJiyeQ3HagQgbW3FI1No67gFI3o7RTT4DrM
	 ywOxg5URk4mn5v1vxct1PoTgRgoKm0qS/lTqovEPdc4tP6Md+xVqMcfETeW6FMuF2qQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794212687;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=LLXggI5QK5tYcxastPpVEd5Wzgnwlo56lcs2+CggC+g=;
	b=cMSRl8vZVXZknh8TCf3E63yMkEb1qPegerRtihlH6XyVZAyQUSOTP/BEoQpzBtY359a6
	 FsNVebLW9gUwBL92a0XpMUmu735mFZps5bE1lux2DSH6fWMTqB55TgPbUz2zGV2J2sC4U
	 Gv3IRk6SC1/kLk4qDejCoUJ89QYdjqa9qkP0HjQ2FtriM5TukdpVNBU/E8vmErfpbUFmS
	 cFx2S6UIv/k7yc4J0I4gCODgM4HkO2u3vM5IJ5SXG3Oe5ZNrMXfmN2Uj9MqulZRbxpEs3
	 bREjPDl2kseeYh9JnP4gjVFXcMFZv7wzLetLW6wk2gJ4xIRgT8qYQfMqDpbidEtuI2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Yl0TLYiE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WUB53U6r;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F1C606A323
	for <linux-sound@vger.kernel.org>; Mon,  9 Nov 2026 08:24:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69F1C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Yl0TLYiE;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WUB53U6r
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A96A2Cc3298327
	for <linux-sound@vger.kernel.org>; Mon, 9 Nov 2026 08:24:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LLXggI5QK5tYcxastPpVEd5W
	zgnwlo56lcs2+CggC+g=; b=Yl0TLYiExRgofqtRFITadDV69rrRizSYCR4/HTx7
	nH+QlRhzl2pXe2fZpr6VF3GoRdhjNqCFWmC93zIYtLeweU6ZKTmql4kGB+i09Kpd
	LSuV84EpVsJHefMq+lg0QlRh2btsmTJwkRbHDGG7FoYS9Ld8LgVyZncoo8l7jExo
	lIXXlQhL8rlJl+0Jo7GBw3gVDhTzPeX1VqI9gdRg5hPciTr0qXyf/MSDeA005mrc
	ay6WOGYMkbuvdHc7sqDpvpnuvFHc1dgw7meqh1sYb6j1KNBzpZ00rswKnJMlFGNC
	JiiiA9u7UB0jErNcj7fWBC2lRBvrdFZAHvfrT5skjhy7Sg==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsuagwgkm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 09 Nov 2026 08:24:46 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-139b62317d0so1349845c88.0
        for <linux-sound@vger.kernel.org>; Mon, 09 Nov 2026 00:24:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794212685; x=1794817485; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LLXggI5QK5tYcxastPpVEd5Wzgnwlo56lcs2+CggC+g=;
        b=WUB53U6riY2fVUTTdnQtq62gj64PBZITwRR1OGoPvpranAJ5iovdyQ+SnijwMqL/Vg
         mUn2zv+pqI1KW8j15+7gZRL8tjDx63UEpFMbRQFV+0eSLTQKJwCe0NfEZ28ntTFCfPg3
         9tPZZ8SAiaryxS6bC6hfUyP2DT1Ikr/Etos9qOC/Ueh3dj9RjIRERAgIuzeO0wKLv2jA
         TA6zHOgXvFfdyKYkmpEV3tpLzB4jVEVsGGwiGFmyUaYVf/wMjTCzyrDFGJc1OgygPFAe
         EMId6+bTFZnr5BwKZTu3CHDl8dh7fL5LhnBaNY7JUzN9pCX2c1P1reBlinWnEWH1OU7N
         JtzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794212685; x=1794817485;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LLXggI5QK5tYcxastPpVEd5Wzgnwlo56lcs2+CggC+g=;
        b=AhiQmm2VXkHHz65QoD9VVvJjZaG9yEzfgGuzephlzdcMQKpfXavUwvGoRFJuLm6VVT
         QzE7MOp8BTgbbX6S9D0wYHSlPiz+GyVaIzjZfgHKII6de1UL5ucqsewjn41Q4aZwGiBC
         BoaPwbhEvaTHg96W7Ycyo/dA0MbRQcztHkF9ijlRVwcM8CbZf6sYSXOX73L3f7c/DWw+
         3B9Wy+3OnPcq6WaYToZH2iw3OM/JMg9yTxYHpgH5G+yVUNa7hfHb8GN+d0HDNMZhUOvp
         Mh1rn3nlzh5WjYlgF3pSftUop4au+I+NvJUWf56ntbGDUUZdHmFzSq2+lEqFbiACe9hm
         dVQg==
X-Forwarded-Encrypted: i=1; AL+hErFT0wYbu6tSl7+nSLVDNM/46RWjXaNu+q5JbKYmbhjg+LYGMh9QHEP+vDQ4oFtKKStwcdj86Apmb/OQsw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9Yd8tyQMLdWW3T96DRHnlHiUHZzH3xl7sq8H+GgMg+Xosk/kFW
	KBUbMSJQVdwC/Fg438wgeYT4b3CE08E2S3n72BxUNcSOwjOV7ykGVLu4otm55jDFYr5U7v5X7fr
	qkmWY8/rV5jVoeNmGCEOqXiLxKTklnJFaX2u4yd29TBo3cbTGr34yjSKAtC818QHEjQ==
X-Gm-Gg: AYBFou2x6YMJL+avOSRyGf+3wMb+3Dm0EODKV36RaLMvf4ZBLzqgWKvwtGg/HoDN5e8
	iKMWTM69ZIAcq3WZh7Fx3MMdjqmwmqqQR3Q7llvwfIpDx7gkaJfnvlEqViKYfPXGF+gcYHIitXV
	V+iey2VocTfo+vDCqqOhkr62+DDJc11CADUBD5JtRPEO8rdE9FmVlv9e3rDEaaofU6PjkKA51mV
	3QFMrTxII8pbNKk+fhv1FKodqpmwFUQGVk4LYufdaYJxu/JNvx/UdJ1Ve27hStPy3NBYVrpTeLv
	hLhMrxWvKKM8qZlTDpkJlrqNqd95/sAf3830TeJw9C/EoPXHS+F2AWxl4VpZbH+lCeR4tZHkarN
	KLY+qLp6u8Vh/Hv2ZSHXFfYxhDR+gPZ5L0Y0ogEHK7CPoYXpQ+Y25CJuXymo56l1bPJ7xrcZ06C
	otUdNWi62E8kQfcw==
X-Received: by 2002:a05:701b:4302:b0:17e:ee5f:6715 with SMTP id a92af1059eb24-1b39fef0409mr5658253c88.27.1794212684974;
        Mon, 09 Nov 2026 00:24:44 -0800 (PST)
X-Received: by 2002:a05:701b:4302:b0:17e:ee5f:6715 with SMTP id a92af1059eb24-1b39fef0409mr5658223c88.27.1794212684403;
        Mon, 09 Nov 2026 00:24:44 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3771fa200sm10803939c88.22.2026.11.09.00.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 00:24:43 -0800 (PST)
Date: Mon, 9 Nov 2026 16:24:37 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Srinivas Kandagatla <srini@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Shenghao Ding <shenghao-ding@ti.com>,
        Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>,
        Sen Wang <sen@ti.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: codec: pcm1681: Acquire sck when bound to a card
Message-ID: <avGDRUwyEBk2qQaM@QCOM-aGQu4IUr3Y>
References: <20261021031228.2074402-1-shengchao.guo@oss.qualcomm.com>
 <179390052368.3073895.16132231139898724200.b4-review@b4>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179390052368.3073895.16132231139898724200.b4-review@b4>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAzMyBTYWx0ZWRfX6C5PlY1Txckl
 72wk6vMYy4fFvNcjIcaF7mXnf+fh1wn4SyEGTChFos2pQux7AGLCLsOMOxz0lyuAKRWDT0ylwVR
 MdJg5N6cqVJpzJo6CS1vxI/L56HgXKRWwAnyo10dWYTXuIS77uOoUagXMol+hNSPSoWQW7EE+al
 O/Kx1tcukY4URPAa0hZwcsClG8509NTYFeuaNkQdIgmWZ83QmkMOnKsP+Ozu846vdVyh7yHgESM
 Jfcs1TRnR5epj0d0PFzEk91y2q8Ha81/5ShJ/M3KRZ1mGnc7MgPlgX863WD2bOV70601OVeSFJK
 t+RrETY5BKXP9YJwFTdhAgqucgwNpTyDHG3Zj3h/cpHJ7HPqDF+tWeWgB4zLDQifr2EDCNctY2Z
 TH+2Dd+FHVdkndhtNayxUW14Xr9+vuA0dbHsT3AMZEVIsesx79cEYOomNNmQ2p60135nWrnLQMA
 JGkYXao0xQ7Fe1wNIeg==
X-Proofpoint-ORIG-GUID: kyZvAcv2olDUSQDrdPN4R1Fg9ov6cVVm
X-Proofpoint-GUID: kyZvAcv2olDUSQDrdPN4R1Fg9ov6cVVm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAzMyBTYWx0ZWRfX/PhSTM1RawSC
 UF42t7zVMD01ElGBut7m5WchYYToulhfxr9RLWN24S9dsrciCHEeLzickYsKkdOHZDEhsQUJ0s1
 nETRt5v075yPoQMc/3Qvr8m0B7+4SYk=
X-Authority-Analysis: v=2.4 cv=V8LoQuni c=1 sm=1 tr=0 ts=6af1834e cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=Hnavqaomymq-nAvSwTcA:9 a=CjuIK1q_8ugA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090033

+ Srini

On Thu, Nov 05, 2026 at 05:42:03PM +0000, Mark Brown wrote:
> > The sck clock is taken once at i2c probe and held for the lifetime of
> > the device. On Qualcomm boards it is an LPASS clock exported by the
> > q6prm clock controller, which lives on the DSP and is unregistered and
> > registered anew whenever the ADSP is stopped and restarted. fw_devlink
> > cannot tie pcm1681 to that provider, since the provider node only gets
> > a device once the DSP is up, so it falls back to the remoteproc device,
> > which stays bound across a DSP restart. pcm1681 is therefore never
> > unbound and keeps a clk handle to the dead provider.
> 
> This seems like something that ought to be dealt with on the Qualcomm
> or fw_devlink side TBH, registering the clocks and returning -EBUSY on
> attempts to use them would be less disruptive to other components in the
> system.  I don't understand what fw_devlink would be doing with
> reparenting clocks...

Thanks for the review, Mark! I agree this belongs in the Qualcomm clock
provider, not in pcm1681, so I'll drop this patch.

Sorry, my wording about fw_devlink was misleading. No clock gets
reparented. My point was only that pcm1681 is never unbound when the DSP
restarts. The q6prm clock-controller device only exists while the DSP is
up. So fw_devlink links pcm1681 to the remoteproc device instead, which
stays bound across the restart.

Today the clocks can't stay registered across a DSP restart. When the DSP
stops, the GPR bus unregisters the q6prm device and its clock-controller
child, and that unregisters the clocks. The clk core then switches them
to clk_nodrv_ops, which return -ENXIO. That's where the "Failed to enable
sck: -6" in my report comes from. The consumer's struct clk handle can't
be reconnected after that.

So I'd like to change q6prm along the lines you suggested:

- Keep the clocks registered, on a device that is not removed when
  the DSP stops.
- While the DSP is down, make prepare/enable return -EBUSY.
- When the DSP comes back, re-send the requests for clocks that are still
  enabled, at their last set rate. This also fixes the rate being reset
  to the 19.2 MHz default.

The part I'm unsure about is which device should own the clocks:

a) A platform device that q6prm creates on its first probe and keeps
   until the module is unloaded. This needs no DT change.

b) The ADSP remoteproc device, which already survives restarts.
   It's cleaner, but probably needs a binding change, since the clock
   controller node is a child of qcom,q6prm today.

Srini, Mark, do you prefer a), b), or something else?

Shawn

> 
> > +static int pcm1681_component_probe(struct snd_soc_component *component)
> > +{
> > +	struct pcm1681_private *priv = snd_soc_component_get_drvdata(component);
> > +	struct device *dev = component->dev;
> > +	int ret;
> > +
> > +	priv->sck = clk_get_optional(dev, "sck");
> > +	if (IS_ERR(priv->sck)) {
> > +		ret = PTR_ERR(priv->sck);
> > +		priv->sck = NULL;
> > +		return dev_err_probe(dev, ret, "Failed to get sck\n");
> > +	}
> 
> This is the oppositie of the standard advice for drivers, and we don't
> deal well with probe deferral from component probes - in particular,
> nothing will trigger a rebind of the card if we don't probe a new
> component and that's not going to happen if the CODEC already bound and
> isn't waiting for the clock.
> 
> Also dev_err_probe() will only DTRT from device model probe.
> 
> -- 
> Mark Brown <broonie@kernel.org>
