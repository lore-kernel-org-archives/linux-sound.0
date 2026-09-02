Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B0F481253
	for <linux-sound@vger.kernel.org>; Wed,  2 Sep 2026 12:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788351970; cv=none; b=CNpBKAM3aMpHOPeTqtj+CY9zviD7WIwVtliUDlI3CebzOLfG6o/Ntj0lrUtOiY1tkJlxVdIiGEA1yDLx/EPs76uChx++tQZX8ypO0rlW55VmPb+AIF8OEMtU8v3VX2AMdYAj+m/0G4fgUT/j5hn7MPZjPtMXBAHssr9aZWW+KCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788351970; c=relaxed/simple;
	bh=wb0vLYYjrxI4Ji7bl3tZXz9vZg4lkyGywEOrKLgapag=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Po8F51WYC1GXHKBgvv9mSjVliPgbinRq6klN3kcng6XWy249IURR0OQEABzXs3RlDYte2iy64EtyaWNF4nfobHKSD8ETOk/RbEm2qwUH5iB0U+P2LUnVA4M5Nv22WX5OIk9LL/98jPsxpg3DYexW2i+1sb+6Ff6I6Zr9MJD794U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=igcl313N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OovEwBKp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="igcl313N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OovEwBKp"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6829MwIW4141454
	for <linux-sound@vger.kernel.org>; Wed, 2 Sep 2026 12:26:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UGyThIiBGfLnwyz/LCdNG/BQbe3qARBZkyuI34SEcyw=; b=igcl313NJiQKztO6
	nuuMj9yNZV0NpvtpwDu24+o9C2sd2oWMJQhaJNHheLGpgYSylithQwDJu8PWNlPX
	/YxTgR0Vz9nSucanFhyG0PYiuauk6uD6y2CHeRAjlerNXZYR795X+949ibTHLbmP
	OtPg2plSRFp6yDEXb6yUNPI+ar/Jzsg9Auw6GnhGVfqqRpHht3h17FykkvtSsAlm
	2mL+g2liiXRTb4ECnEgG6zDFiYtSo9VXvzDd4ytJoDaNU/1OJfPp/RzwS/Q4SLds
	/aEQID+x8bqpwbd/tJp/SVIUcKBGBv2tiEOHsh/xv3QVSP+ie7QByfrbB7DrQCz7
	jguYsA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge39cktfw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 02 Sep 2026 12:26:07 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9308eafb465so282192985a.2
        for <linux-sound@vger.kernel.org>; Wed, 02 Sep 2026 05:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788351966; x=1788956766; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UGyThIiBGfLnwyz/LCdNG/BQbe3qARBZkyuI34SEcyw=;
        b=OovEwBKpEbHOH4+pZquUlClwC0CKyyEJ9cjTTiq5bn3f9VKLJbZSkC8MyULZm/Xy2m
         kF+rvqsvWonxlVtyxc7tvpyn/IiF39Mh/SwykIyxlRnSsN4b9dF8mQeqd5n89coYhivH
         WRbmN8c1d287Z/eoeBcxH7f5j75v36LmTnXwYZHKqkkc5S/xI0VuLTZYqfYbN1kKn2Sv
         uAUVGLlFu9NHKM2dN7zq1PHmKduc4CUjBncuyiYT2O7CbCNnnRzIen0yWNyIQ6Y5GjB/
         2YdaZH41HZLrj+7Bf50MsOM9axEHkzzm5YJ1ClBtvZzCQgodPOAz+Ae9pC1oP3V2++wW
         lEhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788351966; x=1788956766;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UGyThIiBGfLnwyz/LCdNG/BQbe3qARBZkyuI34SEcyw=;
        b=Qqu1uU+Au2PgtNRaUPBU1yC3qIA1ULoLWmtv3elEiVzj5BjgUlpyusuQZda0UDvY3Z
         A+GScsq5zGB1dFpwIcxgL/rvLS7ptvqNPyFwSCvpg5jM28W3w9Thw+sTjCpti2Jijf1R
         T+PpiIi+SyQ2Vd1JDDdvXl6PgNYFNzrOsbtvx1EMkmyQQ8g/ByEOdR2Am5i6FQ5zmSh6
         ibimsxnxkleKG+l2OVAXNP0ybfLuQyKyu6QnIU9saZZpjzvTPAeNdLqJ0plHRMI+s6qy
         X7wwCLGoA87NNn4AyvKkDRgxT2aD4ZgPTZrltXBnilL58owGBUXPiGKFCIL9++1Ccv8W
         sSpw==
X-Forwarded-Encrypted: i=1; AKwUvByVE/cJgi00KcCgPuMuQY4BA04IK1pK2fFIdf/AGrrpQJ6ayxvNz6KbcZP5O0rJxbCa7tYdMq2gX/AqmQ==@vger.kernel.org
X-Gm-Message-State: AFuF++lAEN6SuWd31y5FPVTAa6jAVpigOWugEZnjbTbl3lRlLupFZDmN
	y6hrUpZ4HwovMtS5T7sC3920CyAjTTDz8b8ch/1FGpeHWCJcxe4bKM0+vmPmGdr31IrHoW6V4ta
	g07lgma6uTg9X9KrJ1OndynmoBktQk16ZuYm6cu7bWfyN/WmCTNJT+2g2Jux7GFVWGUPx0Z2vfg
	==
X-Gm-Gg: AR+sD12A3mGk/yWfvgBOvag2v/HdDxkSqt/khZOOyHzKxHxc9rbvcKMV9S/y0MSYooZ
	RVv4JATdV2a4nl+nF2kwGiJFEFAR/pCED0dnGwqdSiXQrbivAsFDQnwF2w9Jl8IZkQ+4b/PDe35
	ORWaCDAyfPbI1J0ZrmaCjN3EyxF3fzTqG7w3yJfTQvJlS6LLdyvPCh/lC1/uYhap+01mmeKpozb
	rO4dAnHvDKfPOVLxxc3ixBuvve1ZunzFgnSvVYhxlK7dK6TOpNVGfrV/S9vcMDux+8T1N7/Hd31
	ZnmsExkUNmL3WGtNDQyAd6Z4ShaIaPDAX96uG8MA7rb18TgapyTQy3xXz1FDcHO9KqjGnI6gYxO
	YnU8zhcQQrsbMvAao2SSmNylFGhY=
X-Received: by 2002:a05:620a:4888:b0:92c:103d:63dd with SMTP id af79cd13be357-93960fd4678mr473482785a.39.1788351966471;
        Wed, 02 Sep 2026 05:26:06 -0700 (PDT)
X-Received: by 2002:a05:620a:4888:b0:92c:103d:63dd with SMTP id af79cd13be357-93960fd4678mr473471385a.39.1788351965792;
        Wed, 02 Sep 2026 05:26:05 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-484492cdbfbsm6170014f8f.33.2026.09.02.05.26.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 05:26:04 -0700 (PDT)
Message-ID: <3bf36ae1-d771-4ccc-b306-9cd19f626462@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 13:26:03 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 8/8] ASoC: codecs: add Qualcomm Tambora (WCD9378) SDCA
 codec
To: Charles Keepax <ckeepax@opensource.cirrus.com>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, patches@opensource.cirrus.com,
        linux-kernel@vger.kernel.org
References: <20260722234221.884765-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260722234221.884765-9-srinivas.kandagatla@oss.qualcomm.com>
 <anNfCj2e5kPZhaK0@opensource.cirrus.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <anNfCj2e5kPZhaK0@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=T968ifKQ c=1 sm=1 tr=0 ts=6a9815df cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=yAM9Myk8PYjSjg-1BfkA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 4tGZpAmhNM2FOgzPzqzoSrKs7y6L3xvO
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDExMCBTYWx0ZWRfX+cmccZrn7mJN
 89m7P1/zaBqE/mrhf56zgZbsjJHybz+10HOpGxqrZO540Aew6AJ5+GKF0MOttTsm5KWhhi8rXvW
 4iv7DafBPVACcS607LdS00+HA5qW6dU=
X-Proofpoint-GUID: 4tGZpAmhNM2FOgzPzqzoSrKs7y6L3xvO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDExMCBTYWx0ZWRfX3qXuATLC5t7s
 Eu7VSpGN6dNpddIDSn63JQ+BxuED9s4WyKCpeYTGDYb3iKRteINsxSre1afJsfKvnWqitYREglH
 ANci63uwJm3CMFst4nuK4M25FtuzhBJHw+nB62HgHW1lMzWPAjHLYIQT+fRS00xD6zQITxKzbT9
 4TWBURjFOFlW1kw8KNec6ZX4DXAYK3qwK3WaxTHH7IvoxbmUwtfxuDl6HaptBcDnWGj7mCJjM4z
 6YqzTmjutqgoJ5gXyGU/wgdRy4zTjNmTtbv8BT8/VciFDdXi5qC9i16pnpL71mDOQnfURe1d0dF
 f5rCU9ocjtnUGtmFnkybNTB+gI5UV8do9wbWRdFZNZPbnACH+XRoMubtS/IAHBIwPQ84YXf8Qv7
 8wX4mOTg2XTR6UTtWmSrIXuqayld1L1drrwFIW3BVhwzy7AT8eWTZhCsj95yvCCYS7IToZllXR6
 CrLl9ItKaxMydUIdmHQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_02,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020110



On 8/5/26 5:04 PM, Charles Keepax wrote:
> On Thu, Jul 23, 2026 at 12:42:18AM +0100, Srinivas Kandagatla wrote:
>> Add support for the Qualcomm Tambora (WCD9378) headset codec in SDCA
>> mode over SoundWire.
>>
>> WCD9378 ("Tambora") is a low-power stereo audio codec used across
>> Qualcomm mobile and compute platforms.  It integrates a headphone
>> amplifier, mono earpiece output, three analogue microphone inputs
>> with independent programmable mic-bias supplies, jack and button
>> detection, and SoundWire dataports for both playback and capture.
>>
>> Assisted-by: Claude:claude-opus-4-7
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> ---
>> +	if (entity_id == WCD9378_PDE34_ENTITY_ID) {
>> +		unsigned int mic_bias = SDW_SDCA_CTL(function_id,
>> +						     WCD9378_IT33_ENTITY_ID,
>> +						     WCD9378_IT33_MICBIAS_SEL, 0);
>> +
>> +		regcache_drop_region(regmap, mic_bias, mic_bias);
>> +		ret = regmap_write(regmap, mic_bias, ctrl_it33_micbias_vals[0]);
>> +		if (ret)
>> +			dev_err(&slave->dev, "IT33 MIC_BIAS: %d\n", ret);
>> +	} else if (entity_id == WCD9378_PDE47_ENTITY_ID) {
>> +		/* Announce commit-group count for the FU42 writes in pde_post_pmu. */
>> +		ret = regmap_write(core->dev_regmap,
>> +				   WCD9378_ENT0_COMMIT_GROUP_COUNT_ADDR,
>> +				   WCD9378_ENT0_COMMIT_GROUP_COUNT_TWO);
>> +		if (ret)
>> +			dev_err(&slave->dev, "Commit_Group_Count: %d\n", ret);
>> +
>> +		/* Let the master's WR FIFO drain before PDE47_REQ_PS=0. */
>> +		usleep_range(2000, 2500);
> 
> Feels a bit odd using these callbacks for commit groups, really
> that is a thing that should be implemented more generically. That
> is a pretty serious task, so I can probably look past this as
> vendor specific thing for now. I guess my only points would be
> can you live without the commit groups and just use the current
> values? And if not, are you prepared that there is a good chance
> this gets missed when someone does implement commit groups and
> this breaks.
> 
Mos of this is gone now in v2.

>> +	/*
>> +	 * Unmute FU42 CH1/CH2 and stage 0 dB volume via the _CN (NEXT) alias
>> +	 * so all four staged writes activate together on the SCP_COMMIT
>> +	 * below.  Writes go to the vendor slave regmap because FU42
>> +	 * addresses are outside the SDCA class regmap's routing.
>> +	 */
>> +	ret = regmap_write(core->dev_regmap, WCD9378_FU42_MUTE_CH1_ADDR,
>> +			   WCD9378_FU42_MUTE_UNMUTE);
>> +	if (ret)
>> +		dev_err(&slave->dev, "FU42 MUTE_CH1: %d\n", ret);
>> +
>> +	ret = regmap_write(core->dev_regmap, WCD9378_FU42_MUTE_CH2_ADDR,
>> +			   WCD9378_FU42_MUTE_UNMUTE);
>> +	if (ret)
>> +		dev_err(&slave->dev, "FU42 MUTE_CH2: %d\n", ret);
>> +
>> +	ret = regmap_write(core->dev_regmap, WCD9378_FU42_CH_VOL_CH1_MSB_ADDR,
>> +			   WCD9378_FU42_CH_VOL_UNITY_BYTE);
>> +	if (ret)
>> +		dev_err(&slave->dev, "FU42 CH1_MSB: %d\n", ret);
>> +	ret = regmap_write(core->dev_regmap, WCD9378_FU42_CH_VOL_CH1_LSB_ADDR,
>> +			   WCD9378_FU42_CH_VOL_UNITY_BYTE);
>> +	if (ret)
>> +		dev_err(&slave->dev, "FU42 CH1_LSB: %d\n", ret);
>> +	ret = regmap_write(core->dev_regmap, WCD9378_FU42_CH_VOL_CH2_MSB_ADDR,
>> +			   WCD9378_FU42_CH_VOL_UNITY_BYTE);
>> +	if (ret)
>> +		dev_err(&slave->dev, "FU42 CH2_MSB: %d\n", ret);
>> +	ret = regmap_write(core->dev_regmap, WCD9378_FU42_CH_VOL_CH2_LSB_ADDR,
>> +			   WCD9378_FU42_CH_VOL_UNITY_BYTE);
>> +	if (ret)
>> +		dev_err(&slave->dev, "FU42 CH2_LSB: %d\n", ret);
> 
> These should all really be part of the function regmap they are
> function controls. Also would mean you have the MBQ so you don't
> need to do two writes per register. I assume, with the commit
> group stuff, these are writing the next value rather than the
> current? But nothing here updates the functions regmap for the
> new values, is it ok that those two get out of sync? Or do we
> not define these controls at the function level?

These are now part of the core in v2 which exposes them as proper mixer
controls.

These work fine as long as we apply the mixers after the PDE transition.
Which is not what user is expecting.

This behavior is because the codec seems to reset some registers to
default when we transition from PS3->PS0 state, volume, mute and micbias
are going back to default values, leaving the stream in mute.

I can try to re-apply them in the codec callback hook, but in general
how should we handle this in sdca core?


--srini


> 
> Thanks,
> Charles

