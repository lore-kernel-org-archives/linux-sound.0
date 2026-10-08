Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B937548640B
	for <linux-sound@vger.kernel.org>; Thu,  8 Oct 2026 09:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791452085; cv=none; b=fVuyu37gr+UoPNJQST27IRET2aKtwxyBJZvmVCVVgsxTbG56A0qWE8DGcM8V76JO34O0Qu2lJFJBkDierNjbM5iD2GOTsyMl78wuosRYe1roEr2GurC0MKjxr9S/9020skMikaqN2PiUd6Q+1v0mYYBJSRBiFtboAHn+qgeYmmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791452085; c=relaxed/simple;
	bh=qDTPagCMKXfXSQoAQtHPcRyFuFiVXChd3KWcBOa3Mv4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mWBrqpPIe+Pu+X3qBLb0BYv6WF6wJlRk/YuMmpRULGv/bVWZnTFfXK/in4+0IcWegf/EhV9endzGDzA2kyKICAl5SwnPc+rqq7orsGJwpdirjTEkK6dNuRa2O/iDZR8LtHi9SP0kB8Qpw5NikUiEqeCqcY7QDcEqTid3+rugON8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ewtkd9Vv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GF49fWzk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ewtkd9Vv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GF49fWzk"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987KZBX1170059
	for <linux-sound@vger.kernel.org>; Thu, 8 Oct 2026 09:34:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NHzdCrzB5CwJNMDm2rJXhCb7qWjOLhdrunIo0lH9wqU=; b=ewtkd9Vv03MTGYw1
	yJqi99u4KX64v67wjKlDurhKecn+nlTJlKHFcpY5y9zKLUqGTl4KIP4IuYJhZvbQ
	Z+SSJ8secrzcFE5ePquEgmOE6RI1mYGzT8Ajq4yfHkXl9nK6/BWEdzgVQGzQllYY
	QY6pUoLYeiM2d2kIsho1zEJuFiRBDNNYfHSXgy3XfjVJFZnfv96iBGEZ+upHW9XH
	jS2TzYBehdQzEg38TBKCKBieMi8kOLnuNCpYll2XysIdx7+0L2PD5d2U6oEkUiWC
	YPftL/TO3NGVF9qkSSZpuzxQRrBwtiUR3d5uZr0lyTfwXDkf1JCEJeCvinFWQPvL
	giRHng==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe3a60n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 08 Oct 2026 09:34:41 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d9057fab9eso62350915ad.1
        for <linux-sound@vger.kernel.org>; Thu, 08 Oct 2026 02:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791452081; x=1792056881; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NHzdCrzB5CwJNMDm2rJXhCb7qWjOLhdrunIo0lH9wqU=;
        b=GF49fWzkVOfWOxt80CQeCe60UVV78GoBjHdoZFQPoj+pk3FgL8ICTSxMCvCa0HAXLl
         uTkAlAaHmQ+akMqPordZav3hlatIbZZMxkjteKq+b5gknbVK2pPxzIAW8sM/MU6RGZBJ
         Nf59xIbLFriVR8uzEXnDhGVa9VOGVe/0gGbXbw4Wa+/2/QK+jhPvd4i11cdCJxNLybJZ
         O8KH+J+DHD5U/RUTcyurvR0oSB0J/JiKp1FxTmQRGcTdkiOWC/kPJKAZfDQ60e62OsjC
         c6+ZUkImYuLaJs6JUm/76GXDBHCGewadozrW+PvFOgfw5CKavZDVthbuYjI++NfqVe7x
         XcLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791452081; x=1792056881;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NHzdCrzB5CwJNMDm2rJXhCb7qWjOLhdrunIo0lH9wqU=;
        b=2Owi49/Xs+OLdGi7rdL0ygyCCV2BayZvsd/OdIm0Vl/EccIIS22B25/FMOhSLuKD7b
         nuDLEwXKHky5JYf2P1owSaZbSrVHqVZTghEGjXj4teyV1sGodQU47J0Qf4V+MMi0V07x
         XnPfBX6IA2U2ypaGzgSN8VYlGxoaXqROTNKG/Bah+QVpOZdkU+XAp4/ncA29IsnSU/Dc
         uovqTfuVxP7R5MI3PVNLehctkdLPdvsouh0oJ0j4qRnGfhb1zEH6w+pogKiJarTnRK7T
         OUvsAvBeyBjq7JFZNo3DAIOvoXzt3/3TdC9qGu5yyssBmHBA1DUvqwle2OyHPhcKW+gv
         MofQ==
X-Forwarded-Encrypted: i=1; AKwUvBxcTPwUIE1jvuspVTdrwp226GSYwRROJwW56FKEASy2b0q2xKWGiCDhLIZi1libRYpqlfMMjf8laQCsOA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJZn5p9sN2fQQTcBzuoy7oVOUwntclc1EFD2n8Ral6oZnXgC4Kn
	gPulp96KRjGxtUV9CCIr3x7GByqBA8iWroaMp+stTT6SQ81TnQmrN7C6Zp5tij7n7T9719XFI7s
	OCgskOvBRxknPE692A/BwR4sH+2HOwgRPJJlm1R4+VVkQA8C9UfeM+lxoME6Ddx/RXw==
X-Gm-Gg: AYBFou3bUjvDXA0ACCZVA2G33aIQDTeEfdsT6GtrTeN6W3gRpheU2y547A5L3LruVvM
	hhQ5Bir+uWVugD1IQTwQTrmBsRnA6i+DPOoVQt6d2ILq69riQjRHlx6TVYUPMV9p2wO5OAyFLVK
	/+ltcxuMz9A7GwOnSrxl4+u//VL2F+pMS/vE537la08CFoq3XmI7kG0S2a4pE7oGkdBN3EnuM3l
	VDdx6/LIvWczltwFtm6VJAynusSaB9upx1MpCqCPJv+L/UCkNgD4aNnfHehz2BnjdWxvaW+ZL1h
	atIXuAqEomQ3Eu5pawedJl24EBFr18DwI6tylWoRiTFEG0ob4f94pKKrwb+hCa/gYhSiKrHogwT
	PiGWBRk3EUpea6rf4wDL6hbb8zo0=
X-Received: by 2002:a17:903:3504:b0:2e1:35f0:6822 with SMTP id d9443c01a7336-2e5ffa150bemr49850785ad.2.1791452080599;
        Thu, 08 Oct 2026 02:34:40 -0700 (PDT)
X-Received: by 2002:a17:903:3504:b0:2e1:35f0:6822 with SMTP id d9443c01a7336-2e5ffa150bemr49850655ad.2.1791452080181;
        Thu, 08 Oct 2026 02:34:40 -0700 (PDT)
Received: from [10.218.18.193] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e604a46604sm22029495ad.72.2026.10.08.02.34.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 02:34:39 -0700 (PDT)
Message-ID: <041edb78-acc2-4832-8500-28db58db1529@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 15:04:30 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/21] arm64: dts: apple: t8103-j313: Add
 speaker/headset jack nodes
To: James Calligeros <jcalligeros99@gmail.com>
Cc: David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        =?UTF-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
        Neal Gompa <neal@gompa.dev>, asahi@lists.linux.dev,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
References: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
 <20261004-macaudio-v2-11-7b47ed6335a8@gmail.com>
 <31d91f44-3f16-4a4c-916c-f4d8107d371e@oss.qualcomm.com>
 <CAHgNfTy-h8m-XBBzW6jSNBz0dVe=vXL6nJ3VOqgMjCbsK_t6gA@mail.gmail.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <CAHgNfTy-h8m-XBBzW6jSNBz0dVe=vXL6nJ3VOqgMjCbsK_t6gA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: g9nXr3UZ9F10SHBKg6t896H31IUQsPux
X-Authority-Analysis: v=2.4 cv=QOz91QLL c=1 sm=1 tr=0 ts=6ac763b1 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=k_whtCd4PG3F-9RvoSsA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAzNyBTYWx0ZWRfX67dKbPdeUeva
 mrLSNJL9vDPM7Y9N/a440zsOCJgU4eGjejWapSi2u4dJKxf3Y3z/fvuxYSEsOb8DgbgggAyT5/o
 liwzt3YQk1N9t1ylSFm6OM0AHesztcE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAzNyBTYWx0ZWRfX6aebvsW/+EQI
 rlpx8R1Al+mJNYv28foAagF8TSdRVi7ypMJn/E8WoFOts98egXJ63t5E4198wF8NmVnRf+Z+z/O
 qjszMdCEf4IICFboM7x8B25sMuG+NaPKcKcjnbxJecAqdgEHQ25UF3XDDymH30mAjLMeafQSK/X
 uCt3uVrjuAgNhS5NtKppdiq6NKA5OAmpffRGoKo+qo5DuZaPTigsjG0k8wqR+0+rvNkZn+f9dQ0
 iw2B50Xf0h2C+je7LSaFCoXQ9LgpIs479YqMTumihr/fZgIaHL0BrXm3VTGBSkiKW13hAxDaY19
 oqMgfNMtk6OcZ6FUKt9mGCjEjx7vBfAUXb2oKWzzw4EYSvZi6tLt0XV5hnf/eYHJuW9yW6evVcA
 7uazHBCsfgQN8DWO5PVRE8e9V+CCiWlGiKDZaauqQbhZqHty6NSuk8Ca8Bwi6HEW2e83k5JNhGn
 vrpNYbwSpxcwkyFQDEw==
X-Proofpoint-ORIG-GUID: g9nXr3UZ9F10SHBKg6t896H31IUQsPux
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080037



On 10/8/2026 2:16 PM, James Calligeros wrote:
> On Thu, Oct 8, 2026 at 4:33 AM Ajay Kumar Nandam
> <ajay.nandam@oss.qualcomm.com> wrote:
>>
>>
>>
>> On 10/4/2026 11:33 AM, James Calligeros wrote:
>>> +&i2c3 {
>>> +     status = "okay";
>>> +
>>> +     speaker_right: codec@34 {
>>> +             compatible = "ti,tas5770l";
>>> +             reg = <0x34>;
>>> +             interrupts-extended = <&pinctrl_ap 182 IRQ_TYPE_LEVEL_LOW>;
>>> +             shutdown-gpios = <&pinctrl_ap 181 GPIO_ACTIVE_HIGH>;
>>> +             #sound-dai-cells = <0>;
>>
>> Both speaker codec nodes reference the same shutdown GPIO. Is that
>> intentional for this board?
>>
>> The TAS2770 driver requests 'shutdown-gpios' per codec instance, and
>> GPIO requests are exclusive by default. So I would expect only one codec
>> instance to own this line, while the other appears to fall back to the
>> register-only path after the GPIO request fails.
>>
>> If GPIO181 is a shared physical shutdown line for both amps, how is the
>> power/reset ordering expected to work across probe, suspend, and resume
>> when only one of the two codec driver instances controls that line?
> 
> We use the new(ish) shared GPIO proxy stuff[1] and it all Just Works.
> 
> [1] https://lore.kernel.org/asahi/20260831-apple-shared-gpio-v1-0-e855b12e18ce@gmail.com/

Thanks for pointing that out. I missed the shared GPIO proxy dependency
when looking at the DTS nodes.

That addresses my concern about the shared shutdown line.

Thanks
Ajay Kumar Nandam

