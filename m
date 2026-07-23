Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7CC14E3793
	for <linux-sound@vger.kernel.org>; Thu, 23 Jul 2026 13:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784813073; cv=none; b=sGVJd3izlhpHbloVI5N8pDJsT/xfvZrba7+gcrUp5xZzMnTJEhVtmCVX3AM2U3cjUMEYEjob3iLRLcOKrxyjyrHwKOfDqkoZ6Sg4lGMcBwRneL8SiW3DlHd6wz9HTpAisBtzmkYqdIyNrOhxO5bhf+p9FibwfiyWTsYVX/PPKfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784813073; c=relaxed/simple;
	bh=66QXVKRJYLwnx8HswYcjbnxXibKlyOWsqjz//XC307A=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=qOsuaALuf3Y9SATsjMZGQbC0SRpHWjE8aybjO/GM6cQTnUE3IgSWgu+Hgw1r2DPmpr9j9jGFvMZns6YHGTCJcaZ7qloLZgVrBzbD5GkruPZr7EAaGvzyjrhYHYJj+FEp5BABPzchFqGmlZggQ9JvbO/5GMmPWltDjnGnEjW+Cz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lfO574ye; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N4qP2vZm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lfO574ye";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N4qP2vZm"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NCvkFt021066
	for <linux-sound@vger.kernel.org>; Thu, 23 Jul 2026 13:24:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I+tIrIzMEDOG2UJi/AWhvxVqwpvTlllKht4g+vLmRSU=; b=lfO574ye8HK0V0/I
	91GQS2pRjr1E8WoOm5PTlrNZxdSSI0AJqh8oYRUkfFX8pmFVSatSUUWBcfmyZ3on
	Or3yBzJjK2ZJ5K0WOG9+QTXuLxRzvZdwANn/XUu0zbluhwM8V0I78tfJ4wuZWz2I
	Y/2mCqVhvKMCTEZcJz9gep7mhSWPRwdbPKvvq5L3cqjahuO7G55y18JbIS3GQWXB
	YmNAHQS+ARzS17d5mJDFLIImML5GPJA8NV+bozEF04h5fIC2iVJ91s0pLIWxLsBN
	m/ahwT/2lcHjLvDvjCPwMd2pi8wYU4dvkJY/zFzIe2xcZcL2ylmNu88fw6nTpxRA
	vQvOFw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk6c7k7p2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 23 Jul 2026 13:24:23 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52827090cc5so8271171cf.0
        for <linux-sound@vger.kernel.org>; Thu, 23 Jul 2026 06:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784813062; x=1785417862; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=I+tIrIzMEDOG2UJi/AWhvxVqwpvTlllKht4g+vLmRSU=;
        b=N4qP2vZmErJOUsU56KwNBwzIdqSlR4VuIXjgGwqZScYBLtbXP+NkW7/XEt3Yx9XOWt
         ItbdV1wHXmIfojBYaWKGlFZt80cH7Gk6/WnsE0FlnmnTudTsF8/HOVDKM06Y/1OMtEe0
         uuFxz4QXo+MSvFvLBcE/8c1O9oaVPcPk12FicDsn3lhPK+a30o88Ed+0fzp0bF2xI749
         XVsFDwtQSc2Dqc49uRhgImXfwTeclM0VXKBeYsAnI9h307AQTBaUQZBuhbVyH5oJP9Ub
         myLZ+my4vWRvFe+LMBup8G/51ppTSmzeYzYbwp/+IsV+EkIgBu1RhHBJhPjQJgevXkjh
         CizA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784813062; x=1785417862;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I+tIrIzMEDOG2UJi/AWhvxVqwpvTlllKht4g+vLmRSU=;
        b=TvXctlcdfOPAPKSuTTDbnoIkeI+5M6ofdQFbbpB6wdQuXbnt9gWK8zesfmA+OoKTZM
         Rz/lKd7nWkvvzzOdU2mKOZr6QBQ5YC14t+bVGlxtjooXDgXiOOXeFKCLspV3fINaOkvU
         vTsPjI7iL6C/RQHsQsPGJpgk3MKMYWkyggDiRCncOj1Yvqr6HTqC4Fu44rMzXnTlbG54
         PhHiPmBkrlkAL/UNTejTH7qt35nqyPBUA4G3j3g68T14YTap8Gmx4FyiyKVeWynH+9Z+
         nJpKwg7j12+P98M8O5hGkaZ1DceFzB9DyAYAAQ49TKDJ63XoGNoWoZu4BIWWNXfu89qb
         +I2w==
X-Forwarded-Encrypted: i=1; AHgh+Ros7CW9mx/R11M8mBaSr5Hj9K+uIhSJ1S3CcSpMpHhFjK4rLoujBEtJvlij5cmaaFMJYMIqzsmqQ7f+eQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+d67G32LQnS3bHFANKqd5A/9t+VX5ELVN3APCrTEFe64GEpXG
	C10w5TiuoeFAbR1SmBgLA2aTiOpf8lotGU2hvte9S6WMbpmMNp+Si0MA/Hr4DjsgOLwnzGLRpQe
	cx+81210zQqQiP6RYV+ZiR93EKadqKaOPwkkHhOw8hKa1FlhE3om1VlVT2yJGN6Y5KQ==
X-Gm-Gg: AR+sD12PXdVF4gPaCYsC617Em9BGjPzhIEhAyMchb+dhoJI9QFOlEanKR7eRFZq2wSk
	WkoyLXP2vQBIMNhyCx892wnDn9CrbQ5Oh6LV1KDM+DkBXlVG1m6j9lmuQrY6o7znRvtdTNGnuNB
	DDrB59OtSad8aeqK3jKa8M+11apdpjuAVINTkUE/BSOlRLYohoY3XxW/7MBoIy2Jel2EN2Wr3jx
	1NjCHN0q8LpAk86/Ez0zJmkot23RmKp/hL5xtP0xBXuOiBXpcpCjIpfcUivil0K1kyFKgknthpI
	7m2j6uozLwzX8Yz2EmEQPs65J2p6pgdWQZSJzZXyNYzz5WuVc7d38Z8n4ckvtxuVpn+ejikNoyK
	/fGurLq2LIjN567jEKUFRCbxFPCc=
X-Received: by 2002:a05:622a:2307:b0:51c:1f35:4638 with SMTP id d75a77b69052e-5283edcea5dmr23958201cf.21.1784813062244;
        Thu, 23 Jul 2026 06:24:22 -0700 (PDT)
X-Received: by 2002:a05:622a:2307:b0:51c:1f35:4638 with SMTP id d75a77b69052e-5283edcea5dmr23957551cf.21.1784813061675;
        Thu, 23 Jul 2026 06:24:21 -0700 (PDT)
Received: from [192.168.68.114] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-c1c32c90b42sm237982866b.38.2026.07.23.06.24.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 06:24:20 -0700 (PDT)
Message-ID: <87452472-0ca6-4ed5-a891-3a688598b5b3@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 14:24:19 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: Re: [RFC PATCH 0/8] ASoC: SDCA: enable on DT platforms and add
 Qualcomm WCD9378 (Tambora) codec
To: Charles Keepax <ckeepax@opensource.cirrus.com>
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
 <amHqO5pMFmKRNYTT@opensource.cirrus.com>
Content-Language: en-US
In-Reply-To: <amHqO5pMFmKRNYTT@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ZCiV_Y-0AREl_HUs7uA_m2WwmExOY3sP
X-Proofpoint-ORIG-GUID: ZCiV_Y-0AREl_HUs7uA_m2WwmExOY3sP
X-Authority-Analysis: v=2.4 cv=baZbluPB c=1 sm=1 tr=0 ts=6a621607 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=u_zJV4-JodRfILz-2DsA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEzMiBTYWx0ZWRfXw35GmIcBY38h
 v0rmw9K5YaFin+abvKEfdSip2WR98k+fx+QbkihWBhiWkybS1ruZQ6EYZD3HkRVWYg+LDC+KBmL
 aKjAsK/xiKV2chLhG1bY+h6Ip0WxXds=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEzMiBTYWx0ZWRfXzPuE2DsPD6Zi
 rXmfQK0ycoFveUxv53A2VKE5ocLuJUrAoUBbkiidoWXwKCM2HrJ130JjPB6nQjTZLanl9Bw0+eL
 hsa7/BdMXaQ6a4gAj36I1tc9I/qX8xLDmRg9nMAOOgvGNT1dx/di6qQvbvkarnwqfX6cc9u/YW/
 rAo94JUI1d8LLsd6PBi71Kkuz4r1jel32E/kgKAY2RKAEpeB01PW2FxC1LTnH7NB7BxTj6N6M0l
 gJ1xx4mpbTsLpOI4sjS2iHINLsGjTQU10GrPCuslUJwxiDd74hyd1glmio2bZgoaW+SHUceaokA
 FeMTyoxPBTNBYKbwY31WMy5prhSLLaM35eXOoLu5oB0H/E6FJQ2G2OxVsBi0I9ZSrwF+XbBs9bB
 nJDsV/fDigPyFklJvIpgx2glPfbFWEJ4zjwQ36YKEsancr9RPd/EYm3PjHTyultMOBbU0G0JVrS
 MXPux0ghieim0oi5rUw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_04,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230132

Thanks Charles, for the feedback.
On 7/23/26 11:17 AM, Charles Keepax wrote:
> On Thu, Jul 23, 2026 at 12:42:10AM +0100, Srinivas Kandagatla wrote:
>> At Linux Plumbers 2025 in the Devicetree MC I raised the "SDCA and the
>> classic ACPI-DT problem" [1]: MIPI SDCA is built around ACPI/DisCo
>> firmware descriptors, and the in-tree ASoC SDCA framework
>> (sound/soc/sdca/) enumerates functions, entities, controls and PDEs by
>> walking those tables. On ARM64 DT platforms there is no DisCo, so the
>> framework is unreachable and sdca codecs will not be able to use the
>> generic sdca drivers and duplicating.
>>
>> The direction from that discussion was to let DT platforms reuse the
>> same class/function auxiliary driver plumbing and have codec drivers
>> supply the small amount of static function/entity metadata that DisCo
>> would otherwise carry, plus hooks for device-specific bring-up.  This
>> series is a first cut at that, with the Qualcomm WCD9378 ("Tambora")
>> SDCA codec on the Glymur CRD as the first consumer. Static table that in
>> part of this codec is generated from acpi tables.
> 
> Fascinating, a shame I missed the discussion. Main question
> I have is what was the reasoning behind using static tables
> rather than just putting the data in device tree? All the core
> code uses the generic firmware parsing function so should be
> perfectly capable of parsing the data out of device tree. The
> only bit that is missing is really the sdca_lookup_functions
> bit you ifdef out, but updating that to also support DT should
> be pretty simple.
Two reasons

1. This is laptop platform primarily works on windows with proper acpi
tables, These tables are directly derived for ACPI asl tables in
windows. Ideally I want to use it the way it is supposed to work.

2. replicating full Disco specs in DT is going to be challenge, Because
DT describes hardware but not necessarily at a level of register init
tables or to an extent where class drivers need it.

> 
> Looking through your presentation (thanks for linking that),
> am I to guess this was mostly a device tree people didn't like
> the stuff SDCA contains problem? I do see that some of the SDCA
> stuff isn't an exact match for how Linux has traditionally liked
> to handle DT but also really not sure I see any benefit to DT
> and ACPI support being different.

I think there is fine line on what can go into DT, some of the hardware
init tables are big No No i guess, Power and other ACPI things are not
something DT does.

I will let DT maintainers comment on this.

> 
> I guess there is also a slightly risk the standard committee
> eventually get round to device tree and adds support differently,
> but an existing large user would be an excellent steer on them.
> 
I think whole Disco has not considered DT at all.


>>  * 1: hw_params fix for OT DAI upstream Input Terminals (found while
>>    bringing up Tambora capture).
> 
> Thanks that is indeed something that needs some work.
> 
>>  * 2: allow sound/soc/sdca/ to build without ACPI.
>>  * 3: turn sdca_class into an exported library and introduce
>>    struct sdca_class_hw_ops with hw_init + get_function_data, so a
>>    codec driver registers its own sdw_driver, supplies static function
>>    descriptors when there is no DisCo node, and owns regulators/reset
>>    at probe time.  The built-in class_sdw_driver stays for
>>    pure-generic parts (hw_ops = NULL).
> 
> Yeah, we have not really implemented any XU type stuff yet. Some
> discussion about whether we want to proceed with adding custom
> callbacks into the class driver or just call the core functions
> from the end driver. The later was really the original intention
> although I do grant that there has ended up being slightly more
> boiler plate in the class driver than would have been ideal.

XU should be opaque to class drivers.

> 
>>  * 4: pde_pre_pmu / pde_post_pmu hooks in hw_ops so vendor drivers
>>    can stage/commit register writes around PDE PS0 transitions.
>>  * 5: of_xlate_dai_name that resolves sound-dai cells by entity index
>>    rather than positional DAI order.
>>  * 6: register SDCA_FUNCTION_TYPE_SIMPLE_JACK in the class function
>>    driver.
> 
> We can probably just merge the simple jack support as is. I will
> have a look.
> 
> Going to likely take me a few days to work my way through things,
> but please bear with me. Great to see the SDCA stuff getting some
> proper usage outside of us :-)

Thanks for the positive note.

Plan is to get all the Qualcomm SDCA codecs to use existing sdca drivers
than writing duplicate code.

We do have couple of more SDCA drivers, the one I could include in next
version is a Simple Amp driver which has pretty much in similar lines
WCD9378 codec, everything leveraged from generic drivers.


--srini
> 
> Thanks,
> Charles

