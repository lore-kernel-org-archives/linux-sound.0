Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A183140F74D
	for <linux-sound@vger.kernel.org>; Wed, 22 Jul 2026 10:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784717327; cv=pass; b=pogzzo4V3QC+iVRh4S/M85YPfx/1U3WIMPEezTdFM8dI6IqtfMJiqCRlry4/JVKy/y2RMyNuz4ZBzcOescVtqogG1e4O/MpeaQcQkbxj+/ccAxwVEs4A7xlM1M7ZjtHO/HJNsIz4vJUuXbd9jvnOHtROIIowDOscG/znE4/afyg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784717327; c=relaxed/simple;
	bh=TJdCxPLRucrgpVqb8Q/p90ezgDTTziOz+2tb9QKZq8k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hIX+Xc8jmtmizbIirk03Dsy0aEHVmuUkwJT6HAvgS1vz72lAiLZWbKpeDNsyioacNO5CMoh8UbVNgUekJXPIKkWBfqPpnxIOZ67CePxaYKtlWI4NsWTja3OctI5Gqb9k2q7eql+NdKOb3gmDTHIDbpEqt4sEstNLrmJfhw2SJn4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eYrH2IjR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c6LAl3/l; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eYrH2IjR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c6LAl3/l"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M8xKLt237568
	for <linux-sound@vger.kernel.org>; Wed, 22 Jul 2026 10:48:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=x9weLpInmFviAD3H6syM6zH0
	Gtd5QFWFlEYwRfjMy1o=; b=eYrH2IjRrClTZEc8uQyOWXvoeYbNQoAygCso+l/5
	cNABL4Z/N1JyhErVGDFRCfdTUUfFeu3hwxiHLf2KPV70UJh9HlnCDJEOnG2AQWyQ
	vyZRGnMwCf2MALMuLsMAE+MGnf9cdmqiMnoetZWQ5iRUTGoWW7lS0bRK1AFrCXGs
	94NJ2dinlv8VZuF6wQ5PJyUN2uFrMdqewIMtMZtl3TFjgKOEppCiwo5OQIaXd1/Z
	QMsr8ccJn8kd72utiHts34Vh5PTeLwdct52WZERLCgrHCn25ssh432ooNzL1smJt
	l4tqx5+leDCGxARByr8Fs1wlCl4kWyH+p3AQaDa0UGbRDw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjntn1qp3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 22 Jul 2026 10:48:43 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cc73f47bdcso228639735ad.3
        for <linux-sound@vger.kernel.org>; Wed, 22 Jul 2026 03:48:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784717322; cv=none;
        d=google.com; s=arc-20260327;
        b=fSH5EgkiYwAG+0XMfMxIvFv47sFBHOT4i9NRjS3hbloz42XYWSveYdEYhh3Quj8RNJ
         mlFjff/4MuUXW0QOQeyad2Nk1mPe0b3EqBoj7Y9SESLP6thY6gN3H/pLImNJLvF24RZw
         cxowqR2u0aa5ukB8ZF1hHe/dKYNuACeWbrDFw14e0BNtP0bhu0hBiu8AnUaMaT/Wy0Q2
         lDBDekMWROKJplZfR4ncxwz66Kyr8chMDseYpz2W2P2zCZvwbT3P5svBNe6SQE1O32iA
         +v3DUAS+42lft3NyBqPU3soPjzQEnQ0t26hpMjBTZfnuHWzOY0ijXQB8BNpEaomq2F9C
         TnWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=x9weLpInmFviAD3H6syM6zH0Gtd5QFWFlEYwRfjMy1o=;
        fh=qOm6hHUctGBBkFKhIeH6Ac+9Oh9/Q5OwA5G6I1VofiE=;
        b=cmFCmnkdkBGzYj95AUfQ4UELeyegTaMmsHMZzWfhS43LMOyjdFqP13lQB4U1Z6oqbT
         NYmdr1MMB+P+1vv8zWSZod/IMs/HbUWRrPzcxE77ABThFsCXl6OlDCh24fWmWB1XXLY9
         PHczX0PpCRytRL5X6DU/x+pnIKPeZ00oGhtkhKVMzKaJTSqDyyZVBS6oA1bn88++Afro
         igS/g+RcaEOoFXvnsG3l6Qkp3Di9CsTcws5t8jZTJumaH8wz82c7nHmGXje/fQRqbV95
         kNeJZpqEAvR6oyjwq7sMVomnjqfYR3Aup1hcIf8mZcL0k7Z77CY5QVnB8cQIBWh20gQv
         o5yA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784717322; x=1785322122; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x9weLpInmFviAD3H6syM6zH0Gtd5QFWFlEYwRfjMy1o=;
        b=c6LAl3/lhfmCxgrp3Ec40S44lTOzlxoFn1qirkdxZcpJWvhMt6l1Szykm1xyQTqKs4
         iEVZdMjmqjQ0UkiUUm6vExsiTtNihx0tOaGVWMcgMVxdwFtr/mWYOU3+LliTfOLSwzCX
         39LMFdT74gCFOLeJJXtvVh2V4HDWe3LK7i3oR+aPIo9kTVnAssGBWE6dmZUnoSniD7H6
         wZ59LiSYlEYv60c2Xvj09L+BCXEn+gI9cBFiarauaEyNm7Z7E9/HD3+9bnm2X1Y3u7uv
         KKroI6zTBCrk6DNKtn4h24GFqs44VbluCDbku0cVmjGmVnsxBpx4d5vahtMXMrF345j8
         WEYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784717322; x=1785322122;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=x9weLpInmFviAD3H6syM6zH0Gtd5QFWFlEYwRfjMy1o=;
        b=lEaRCTTn4/8zsC9GAGd5ei37HM1ghTD8kkYKcds+dlhe4h69hJJpmqgLzyEg0lm2Q3
         c4hW1wpznGhA/iySW9Z38dDZG2j2/AHwI1rzMqGnQEg8cxC6bJSrgdwjOLchziZtrGYm
         0GaIdrxA1NGSgHJfbNxGcH4eEj0jifmhVPXD540SZ5EoukYXoD2jT7x0SryAE1mKXOqf
         RCVq/Q7gdKPBkc8W0yXso56Bo+Vz+782FlHE1sG5MNeajFxpZHYaET4EokSVMWWZJKHX
         6Bhy6ieVktBIFuedbSrNsNTzos1RC8P5U9nA2rkxbZ4t0EFN0VOe46ZidbUY6E+xNit4
         2DOQ==
X-Forwarded-Encrypted: i=1; AHgh+RqvN9b6D8hQIa4wYYqQm+KDGC8P5bBpEYRu73NogtpKdf3snBtNTLGQxMo9NYdKdTE+DohSDVlvJG7VNQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyA/xaCN4CWHxaJYBGHpHmmv25gmsAaUkCuV1SVIDXbSzlZWgI+
	2rf3Haya2JFstyTpW2Em3UVdA7zpYvruDxF3kUCzg/tI8ogbBKQNptYgWwRQ0jz+Bu+COwiz1Er
	Sf073OYJ4hzIHXr5qcQKnilaIFspHunNLAz+vByd6om6TA53ZtfKHketB9ff7X29zdCRUgM8t+e
	5lsM9pwoWa5Z9HXQkgcncBrq3jMSPkPOal1gmY988O
X-Gm-Gg: AR+sD11E17aje9A8OowpKIvOBIN6qY0nXKOaH3V4ifeXS7WiR7gt2a4SZ/Jvd4X08k+
	idcHmCs/dvsxoa/aY5jN+Nosmp3fxo5ksaSQm3lYe52CB3mq4WEvW2dN53uHBVnrJWOYT9b/Pp6
	2FHqojvFZ9IINvtH6jw/2KokNzezHAeOu8tC8dpJhvMu2fUwlmRq+jjSNhB6TaxK8VNJa7qa8=
X-Received: by 2002:a17:902:e80e:b0:2cc:9179:32e with SMTP id d9443c01a7336-2cf3481bc46mr240434205ad.10.1784717322121;
        Wed, 22 Jul 2026 03:48:42 -0700 (PDT)
X-Received: by 2002:a17:902:e80e:b0:2cc:9179:32e with SMTP id
 d9443c01a7336-2cf3481bc46mr240433755ad.10.1784717321579; Wed, 22 Jul 2026
 03:48:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260721-drop-sound-storm-v1-0-23ae4a689ffe@oss.qualcomm.com>
 <20260721-drop-sound-storm-v1-1-23ae4a689ffe@oss.qualcomm.com>
 <85f2799d-fadf-478d-9f3f-fb8ff91ba84d@oss.qualcomm.com> <6a609d87.87c5160c.1accad.0f33@mx.google.com>
In-Reply-To: <6a609d87.87c5160c.1accad.0f33@mx.google.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 13:48:30 +0300
X-Gm-Features: AUfX_mxJVnMuPbQyqLMRl1YwpMnVztpdNpQ2DTiLQfHenm24uUU50tozkQFP1cw
Message-ID: <CAO9ioeUw4QgW47xmC58dGc1_j2UPFjDM+dDRF-bggpBPFA32YQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] ASoC: qcom: remove ipq806x Storm machine driver
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=AJsSZ1gA c=1 sm=1 tr=0 ts=6a60a00b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=s11Qgp4bjunoGJnHrnoA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: Y6-mB0QR0OAQys2DyR-58kNM-P-iWudP
X-Proofpoint-ORIG-GUID: Y6-mB0QR0OAQys2DyR-58kNM-P-iWudP
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEwNCBTYWx0ZWRfX1Yd1N6GoiR4E
 yYYaEJqOlR8A3sHxvQjiWXi6TJDfMgUEIDLe4PS1/REj2uE/Ks3pOkHWMNORZi/b4JoINE99+e3
 3rjmvPRfzEz9YoITc1IWpUHGKgwI4NQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEwNCBTYWx0ZWRfX3HiExRtXyGpD
 3pcxvmcn7KXoW8rYowuiTEho9qb4HEDAceU4OsN1ew3Y01WGmeWP5NoQpe57dzyI472YA12bK7I
 jt3bkMdwxY3B7mgMC96cyiQodBVq8vN/vzq+Vb7GPofS1hQtM1Pn3hbknGfh1bh3rdKvLSviill
 qlMp02/ace/lbhyqUlSsK1eUDSahNvz/Y803nGmakABd2lG9BfnGx+A+2hgYqhYLqArziO3XJq7
 +28mAPMHSNe7sAQQb9rXogKO6KZxUoSRU+roA44IsFWSd22ING+4zTpvFn5B94nytZ5Q3e44YMX
 +pOCwVOvlZf3OJMl9yuS79AyMLkWKCaLczKTqzjMg/Ylp8xYrUIRRH/T5P/V7VXrAG1a2DxNLLp
 zKaxpafe3igPZFlv5FObNBG5+h5c40ZHvK0QMHAPdoEnngkSzlZLRr3LSTpEjJM3p8WV2kA1AO4
 TcUaJbYGCkdO51Cp1Ow==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220104

On Wed, 22 Jul 2026 at 13:38, Christian Marangi <ansuelsmth@gmail.com> wrote:
>
> On Wed, Jul 22, 2026 at 10:00:34AM +0200, Konrad Dybcio wrote:
> > On 7/21/26 8:12 PM, Dmitry Baryshkov wrote:
> > > The Storm board machine driver targets Google's IPQ806x-based Storm
> > > reference board (a MAX98357A DAC wired to the LPASS I2S bus). This board
> > > has no upstream device tree, no active users and has seen no functional
> > > changes in years, so the driver is dead weight.
> > >
> > > Remove the driver together with its Kconfig entry and Makefile rule.
> > >
> > > Assisted-by: Claude:claude-opus-4-8
> >
> > Using AI to `git rm` is definitely tokenmaxxing!
> >
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > ---
> >
> > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >
>
> Honestly I'm pretty angry about the latest changes on ipq806x. First the
> dtsi just because there weren't device (it's ok and understandable) now we
> are starting to remove driver...
>
> There are godzillion situation where there is a driver but absolutely no
> dtsi. Lets remove the dwmac driver, usb phy, pcie and everything else at
> this point and treat this soc like it's a 80-90 code...
>
> I will post dtsi with actual device for the SoC but really I'm not
> following all this hurry in cleaning code for device that still gets used
> and actually some company even produced new one (even if it's EOL)

We have no way to check that the device is being used other than the
DTSI present in the kernel, being updated from time to time with
non-trivial changes.

For the patchset in question, do you (or the community) actually use
OnHub? If so, please consider upstreaming DT files (and also updating
schema FWIW).
If not, the files will eventually go away. Just having unused drivers
_adds_ a burden. I stumbled upon the driver while reviewing a patch
changing the driver (for the sake of changing the ASoC API).

And FWIW the series doesn't touch the IPQ806x LPASS driver (which has
a DT counterpart).

-- 
With best wishes
Dmitry
