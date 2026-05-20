Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B81BE54768
	for <linux-sound@vger.kernel.org>; Wed, 20 May 2026 15:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779291304; cv=none; b=IPT6IDv97k4Fys9oYKvHkoxtYfykim8eNpyFbD6xaeUqKbJUZRUyohE4udFS7DydhQ/ufcl2JuYMajo2KahV14aEpLJgv4PpF2ND49x+GBmBEy8XrCLM3gWCqogMSKDlAg4KK5OH3I2xQ2YkLpk50jvDAVO+/m3jFuyFIeLdFJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779291304; c=relaxed/simple;
	bh=b5qlDDFpSrfSjOTAvNMEr1TsJMujgF9A90a//XhxiRU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ELNT6aAcFe+wdmTwxLvbubsWjD0iKvD2CQJmu+sRohG1cwWHGotTQqL94FtFrxUqL+BWVU3r006DMYSP0LQWJ1nkLFe47s98K53umqR6SXOFa9U4UEYECW3YFRtzVn1P3IAy9NULsZByMtbQHiOQ+c50atKs2jkcwAUbINak7GY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d2sGmmer; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cksjydML; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d2sGmmer";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cksjydML"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K9ls8d267212
	for <linux-sound@vger.kernel.org>; Wed, 20 May 2026 15:35:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aCb65PPgVcRobY0yH5IOaSFWaUsgF41FkRsrX3Cll+M=; b=d2sGmmerqvMmdFQh
	BICjFbRpkZtg8XA1a0GfQ/DqoV24Fe2dZyAiEeR/7ZZRJCXRwDpQbt6kdwFMcWWy
	YJQZaRSMc1PIMCPZEPlmPgOXtd4WR9+yPj8Z/pJ6WWVat3y4/YAeUWnVHITP57H0
	xJS7hqDkruXeJ0rFNTh5QtjmfRCuqF2YCFQ9Q0jd/NfPxVhegGlo3/2vYqpoJLg7
	ll2CLT7biH7kqzzv4/zeNdIZCpFNWGONgCIAks9fnvO5H6ERW/iClGzcmN4nWeic
	inZRKXYKxWk5IYhwuuc07eDLuwd8zL8iKkVNfs1D0ORVGzWFfEwjEBE5CowVMQhh
	DpbPFw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9amxsaa9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 20 May 2026 15:35:02 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6313385ca1bso3039265137.1
        for <linux-sound@vger.kernel.org>; Wed, 20 May 2026 08:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779291302; x=1779896102; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aCb65PPgVcRobY0yH5IOaSFWaUsgF41FkRsrX3Cll+M=;
        b=cksjydML5HvcrJZv6v39arel2b/9GEOFuH0kvMa3tyAEUXkfTQOMW8JMyQP6VUu2X5
         7Cf7jovvTI4izOq3ur+yeN7Vy52r7Lpb0CM2FExGn7sa967G6L+y1KQ+CMEGvdvNeMko
         pQDpIqbZ3QJTmgHw1IrSMQJ+y9YL6P41tXr9eHeQfpoPp7kM+ooixni/F0z3HmXKv4rI
         2eXAKIpX7/+m4I1vXKNcwy9SESoIVRiaBtAV0f1tgBgwdjAfms7tpNg0fxdsPO3XLzPM
         Ny/Q2B2rRc8hLHQCarI23nmYtSfZwHetvi76c4BYMPdTwzBVTBccuqpMptxvfrMveOna
         QfRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779291302; x=1779896102;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aCb65PPgVcRobY0yH5IOaSFWaUsgF41FkRsrX3Cll+M=;
        b=VHOLRYDZuHCSkBbqshEhyaY0og+kqBv561nO02UGd6onbYiRpjEpmAgfc3AXZ62gUq
         HjAEE3sxudo2Mq4nhmfzIdqzqpd7bZVDwjPd17jzGBqG19p0lOX35tmhT5C3VxTGQw4w
         I0V93+eOeKz/QQGzOSJVlOJ+QcpFsc+jhVPP8S9UBAykxa7TRKsE35XXt35x/JJobDCe
         wFjXZT1uPTvwc+2PzjwpHxSdhIgS8wqEnmnU1bgw37mcmaY39HGn9Z2aaDPjn1Qfpe6E
         t72Ioo4UAAvYAMvxwgIV2pt0Rl+a04v4M1gP5LowIiR+zi4mzVd3CtHBLaGtbvlc4gQt
         0kXg==
X-Forwarded-Encrypted: i=1; AFNElJ84MhMNXjNrcvX2K5k30BlXFM8cdWp32yNmwdKPtdKsKC+fthkclFsq6gVVgSjtd6rVsmY/RnEJ/RD/og==@vger.kernel.org
X-Gm-Message-State: AOJu0YxoxhfLgW5eokotAFh8oLeAQn86awFTSQ3izmcbhpzpF2gkUXYA
	8whfXCUpZmSwsavsOPJmzqXKyXIxcYoXNplTPNkM1Dhc3kowYDnhGB1mzEa0TTQXq/Nvpzhlts4
	m2mAGwEVP3eDd3HwHs7WNT6Gi/1DvUXFicpozOKTys13Oe36krDdn3pJUwf5Q63euS1HKGw+1rw
	==
X-Gm-Gg: Acq92OE6Dk5NHiAMlQkWGra07h4Ir8h0/kWg+nBiR/mWPHcUw3OGQ8YsqcOI7k6l/0C
	scl3B0yekNMEoDhL0HhGcn/2v4z/Fw/IgE7p5IGqe4LiirfoGvXT8DysBApSoBOG686rAmgVQI4
	Ax/nzuDgvGcuBeLH8Q2nphsVhPV0HWQObb8Nu6wAORFslxcOQZfgrsuhHBvCCxYvsIHpzr0OTao
	+VW/zyjW9PfZMP9XjrNgy8TA9zAP1ceaRJHfB+uwfxRoQNQDzf2k8VgeBHcewNdkNXFFDiKoKG9
	/JlCZzw1r4/sgB5MXIwIHY9Etz/VDidDVEr61EsnjyPeQ/lueUsAsuUOM1fQU0mCHyh1WMBPIZ+
	VRlgDVukNymRBe2NvG8K5fSZFzQfZ0Ip9NtPosVPb2WMGJbJZ0PDX3o+G7Ss=
X-Received: by 2002:a05:6102:598d:b0:633:2389:3a84 with SMTP id ada2fe7eead31-63a3fc964a2mr11421064137.24.1779291301934;
        Wed, 20 May 2026 08:35:01 -0700 (PDT)
X-Received: by 2002:a05:6102:598d:b0:633:2389:3a84 with SMTP id ada2fe7eead31-63a3fc964a2mr11421006137.24.1779291301435;
        Wed, 20 May 2026 08:35:01 -0700 (PDT)
Received: from [192.168.68.112] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48fe5cab818sm421761775e9.14.2026.05.20.08.35.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 08:35:00 -0700 (PDT)
Message-ID: <81b15533-3258-48a8-8d5a-0dcec7027254@oss.qualcomm.com>
Date: Wed, 20 May 2026 15:34:59 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ASoC: mt8173-max98090: use standard callback to set
 jack
To: Mark Brown <broonie@kernel.org>
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
        sharq0406@gmail.com, kuninori.morimoto.gx@renesas.com,
        ckeepax@opensource.cirrus.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
References: <20260520132930.54333-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260520132930.54333-3-srinivas.kandagatla@oss.qualcomm.com>
 <5990fbb1-286f-482d-b02a-d0637494f435@sirena.org.uk>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <5990fbb1-286f-482d-b02a-d0637494f435@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Jmd6IMovM_GiDx3KOSf_cdz0-DPNNzNa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE1MCBTYWx0ZWRfX2FQFPqJDWxsI
 d/cwArNCnbdbfpig7VIiNbUlkOHrHo02kM52+DMKvaINO5RFpB+LU+5awn/VnQMgp77ae4FLADM
 H8iag6pjxqzGDsoLpVhdjB65cj41dv/WYZKU/V/hQbXF5h/MAwWqo861mNp0RD5mKg8Fv/49yp2
 KDF9ESSYTLHGikdObgZtIHaYgmIC5ed1KuBSTyRUfemJpww2JartsyB5Qg8IZSusVoxebe/LstT
 5+5MMHCr5GNGesTGuAKr1NzkEB92vhT/AYNYpx57vIssInKyVmAuRMAhYsm2JRSM9cBVRV/KFJv
 3TBgqaxDCjX0/AWyJJG4rGhPPCTFpkkL3bjfFiK+PwjN2zTSvCb/ClP3kiix1/OAQ+uHZqVqjWU
 pnvGFbao37coD2Ao5VsI7C7LLuD+gFAlxl10RCT9QWfZz+/EouTx1ZrwyAqgVyiFq3fnv/YyHmq
 Bm4AU60ODbpnBtRSbhQ==
X-Authority-Analysis: v=2.4 cv=TO11jVla c=1 sm=1 tr=0 ts=6a0dd4a6 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=Zl4mUG8r6ouv1iOMoRsA:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: Jmd6IMovM_GiDx3KOSf_cdz0-DPNNzNa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200150

On 5/20/26 1:42 PM, Mark Brown wrote:
> On Wed, May 20, 2026 at 01:29:30PM +0000, Srinivas Kandagatla wrote:
>> use snd_soc_component_set_jack() instead of custom callback to
>> max98090 codec.
> 
> This needs to be squashed into the first commit, otherwise the first
> commit will cause a build break.
I had them in opposite order in my local setup, which is why it did not
break the build for me, I can send out a squashed version.

--Srini

