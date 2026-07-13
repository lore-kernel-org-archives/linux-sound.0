Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06ADF3812F4
	for <linux-sound@vger.kernel.org>; Mon, 13 Jul 2026 07:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783927733; cv=none; b=m3zs71r5p3cG1galY75s+5DwwnS1boEAi6TBV1p8C6DIqmtGRuDXNQpziozNObKszO1uP6bhefxqgtfaKH+0n+UKuTvsJ8phVBQeqFYCDTjx9AimrSN0BLxQf80oCR6GXXVI24wdPrMMAk8701UBVp4AY6DqS3SupRR68t9ICdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783927733; c=relaxed/simple;
	bh=rGDsrjx6/tEefZaGByxTg7MZGD+3gZaunHci4Ij2f20=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dE/mFFb8i8+DXYLOcj8syBWtaNLLiNqpDNZSFjf5Jh8/WySKXt29MHrheb6uxjA1jKqtuMGs60o+yaiyx6ByORp+SyLuz1KV5arLOl5weJUdF/spP+iEtUdLO6XAnuWv0jvDdCeVmpaOJHaL7Zyw76ZhNqFcvjg95cOnA1NO7cY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k3BCZdCm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CyhWVq44; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k3BCZdCm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CyhWVq44"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6NjOi732111
	for <linux-sound@vger.kernel.org>; Mon, 13 Jul 2026 07:28:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rOCzC1B5qGhA0DDlrlvVv19f/QDxmZmVqlO5kCPP8do=; b=k3BCZdCmCzGgeTAI
	bEUoMtrGCwWJGfuUqy946ZPHK/PmRpxmbJsjcpySR+SyFYCGRiXBBdoRZP/q5FzA
	yEiL+ecuNVCDOHmtY+mS9QnL77qT3C1ycou5tPUPhmw8wp9/tYDQK9FHJculwhh1
	TWu3Hzw1QER5CDwBrGlv8IHs4vGBUGliOCmzLmqlY2CfttsYg7Nu6cyf59X0IvTw
	dLI8M5Q/Xp3ijTwEWGhrCGVo6/IKJdqWmT85/wUluOgCnbYvia+hkwL8rBtgOgUH
	DmARoohC3Hut6PYyyVM2GGYAbYIkQVlpJ6Si6gvXRP3vjIkXhf9mwQnXyaFSpwiv
	QTPIpw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcjn39cwx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 13 Jul 2026 07:28:49 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8ee2847cbd4so39647596d6.3
        for <linux-sound@vger.kernel.org>; Mon, 13 Jul 2026 00:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783927728; x=1784532528; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rOCzC1B5qGhA0DDlrlvVv19f/QDxmZmVqlO5kCPP8do=;
        b=CyhWVq44BfHtuvEFjHLqzDCNPjJoKCXAF4K/oroApBKdLo71/lyOT3XFjbm5yqRMNJ
         f/LQQcA1xg9DPKKMRXf8/NZK0smQcToV7cHcVFbkg1FPvGcT1agWCmi6JolHwpHIruSk
         Z+ThML2NZRqPWVJVQXViU/CRuqyYHAC+OtTJSk8VztZjPOR4bekIbdHDnzb4Y8us25ig
         VC/+1vYCpMgVm4s85lIeZEwAp3mP8DSnVm2yqiBqFpoHO2x26c4XrqK6Nx2WHrKhP5X5
         lPz1w3XmZxyLIYtHdAwOVBIvlidrww/UNGnLociaJoRBG9XNFHayhe/Z96g1CHV3P7jY
         N6vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783927728; x=1784532528;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rOCzC1B5qGhA0DDlrlvVv19f/QDxmZmVqlO5kCPP8do=;
        b=OBaneubHfghrZ/kjVMVYVRgYsv65yCwQUPxarTYq8gYm/Qcade/Mw9G9zMStTxl1lJ
         fvOaPDcxzCYiFP4y2Qn3Ul8oJ7Y+mXH00uM6edecxRBcuXhE6JB/RnrToTkPV5WKGYBR
         OGJRvm3xevJyjniBltf2vvjhSkgLGYW++iEBnlgFvTbhOHcZLiQjNNi8Iu5pFL5Ojhes
         6Ge0Y5ju1akoK11i0xOkGvWy3wAb1FNXhq/VRg/e0H//kY+xuKXU++BEDpJ1wnQTnPIq
         ftSKLnDkRle24IK0vXgv6LwWgUPNed6LTJNAL/fCCYi/OU2aQp8Ix4Pgv31roye+8peq
         S7Lw==
X-Forwarded-Encrypted: i=1; AHgh+RqwS2cD+Eyui0D0Xpc1udi89pb//ck0AQ0neONVNIRrS3D4brvgCBZ4t4iHMkX77XJRM3EadxeaCmb91Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwI/i/J3Flv/zKYeHUcHJ7dILoIm+ni4Z44QM7TH2rWaqi4xyc5
	Aymmmvo4SrhFavMYHL+X/BA5KS8xoUkbx4J8Z/hC89vzIjyZknoJAtDhlKv/xyxx8CKEkPH1bpa
	xrpPTzZyDCiDsZMpxxxsWhW6w9xItBGdJf0chwoN8jm52e7HPf3TO3GyDpwxVOpdAgg==
X-Gm-Gg: AfdE7ckCwiT2TXEO9YVWr7fe9zONbvJHSMHqKAKSFbOmb5QKVoWwF3pEyebR4bg6T19
	RV6fmqVgJ0zq/FoQMg+7Wu1GtK5U70c3UjNtA1W69IIFK1erGBgxqXNF7GydCGmF2FoxpPPebdD
	BMdSgfMC/OrK1pkuPDMQlXBDdURYhlg8OGiz545oE5R+hY73DboHlWi/62qxjjcYZiOv4cncAg1
	PTEA96JwZDVRu5zeHjayLV5ZCGc57XLjW4B/TNDlanYrKvQCU1+rL5yg945826qKJm5UVHeNVdG
	+swEACM1Pd5Z9Ovp2PSZK/Sf98nDecybONMekDSIxIzWQCOz1JXMQbgLK8YdiKIVNkKp3aEmkE0
	JHLIbkExkndl5FLNKcEApr/ozADvRIva0OLFAjw==
X-Received: by 2002:a05:622a:1207:b0:51b:fdbc:86ce with SMTP id d75a77b69052e-51cbf1fb365mr80402031cf.52.1783927728151;
        Mon, 13 Jul 2026 00:28:48 -0700 (PDT)
X-Received: by 2002:a05:622a:1207:b0:51b:fdbc:86ce with SMTP id d75a77b69052e-51cbf1fb365mr80401841cf.52.1783927727629;
        Mon, 13 Jul 2026 00:28:47 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-69a19d79906sm15112119a12.14.2026.07.13.00.28.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 00:28:45 -0700 (PDT)
Message-ID: <f484f295-f454-4a19-bd3a-cd0db5d5f970@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 08:28:44 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] ASoC: codecs: wcd9378: add TX/capture codec driver
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
        Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260706192229.144137-1-jorijnvdgraaf@catcrafts.net>
 <20260706192229.144137-4-jorijnvdgraaf@catcrafts.net>
 <d643de20-50db-4f5c-a803-f1737da253fe@linux.dev>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <d643de20-50db-4f5c-a803-f1737da253fe@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA3NiBTYWx0ZWRfX6ruw7O0DSllQ
 7a1Sl2kHMRNyLI0z0Ek3QiD+i49S6HRUP3KML8S0RA2S0YcSA2RjgWHKRs8C4M73EKcIfot5jAU
 KXZCrmwuXR8kl2wQsMVg6/z0kv4WmFicCMdUKCF/L6AumHW1YUR2bTrnUQQV2XpQTjG3j3iRFGk
 U8PJuZDvEV7FTEmPNCzTQAC+ZehTGc5OWxTUmILH8w8G8IH+ob3QJp64kKyI4zS1n1gZ6rmULUt
 /pPIsTiXf1c6ovheEqAgbYlAw6K/TMJmD5xR84MK7ICTozsR6L8A28bfe6csp8q5Nq0GfF9eqba
 efLybXxkaD3OW85jAGDdwVtUJeo0WjOU0Y6vi9exhyEHjCaJr+ODSKEG33ir3jxSLMrpBu8HAsB
 0G4IW2UvdlNTkZKSpZr2COixxCeWOgFo1Z3xM5i71jqjre8dZbnOgakBmLvb3kA+bWh8/snSBXC
 CD08aG3vijn5oh3tPsQ==
X-Proofpoint-ORIG-GUID: FB1tUaZbFm1S3q1CruRTOhQWoVbgKNBu
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA3NiBTYWx0ZWRfX5tG5PqG8I7oy
 XMvdYTwYIh9z6XARRZdcy31CopVCOTNTLrUTnf/sXx6qStpeCVytMOUZARwit91fx3SJjdZmcMa
 04t6wWUsSg8uRMN+u+EimgnkGXdIn68=
X-Proofpoint-GUID: FB1tUaZbFm1S3q1CruRTOhQWoVbgKNBu
X-Authority-Analysis: v=2.4 cv=aaJRWxot c=1 sm=1 tr=0 ts=6a5493b1 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=et_PxPiEQ3Igji31-sgA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130076


On 7/7/26 12:42 PM, Pierre-Louis Bossart wrote:
>> + *
>> + * Qualcomm WCD9378 audio codec driver.
>> + *
>> + * The WCD9378 pairs a WCD937x-compatible analog core with SDCA-style
> SDCA-style or SDCA-compliant?

This codec is SDCA compliant and used on X2 Elite Windows laptops.

This Codec can be configured in two modes, Mobile and Compute, and this
configuration is fused out.

The codec IP is the same in both modes; what changes is how the
host-side SoundWire master setup.

The codec itself has two modes of working.
1. mobile mode
	in this mode the codec is enumerated as two slaves(tx and rx) on two
different soundwire masters (tx and rx), like any other wcd codecs.

2. compute mode
	In this mode, where the codec is enumerated as single slave on primary
soundwire master. Two Soundwire controllers(primary and dependent i.e tx
and rx) are aggregated and they act as one logical SoundWire bus with
four data lanes. The primary alone runs the SCP control channel,
enumerates the slave, drives the bus clock, the secondary follows. The
secondary drives some of the data lanes. There is a hardware sync
between these two. This is a new configuration on Qualcomm Soundwire
controllers called multi-master.


From Codec pov, its exactly same IP, I have now SDCA drivers working for
both playback and capture, so Am hoping that we could use the same SDCA
driver for both of these modes. I still have to give it a try on a
mobile platform to verify this.

Am hoping to send a version of this driver sometime this week.

--srini


> 
>> + * function blocks (SmartMIC0/1/2, SmartJACK, SmartAMP) whose built-in
>> + * sequencers perform the analog power-up/down autonomously: capture is
>> + * started by programming the ADC usage mode (ITxx_USAGE), requesting
>> + * power state 0 on the function's PDE, and letting the sequencer ramp
>> + * the micbias selected through SMx_MB_SEL.
>> + *
>> + * TX/capture paths only for now; RX (earpiece/headphone), MBHC and the
>> + * SmartAMP function are not implemented.
>> + */

