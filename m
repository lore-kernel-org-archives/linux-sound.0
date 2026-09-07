Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D604C6F1B
	for <linux-sound@vger.kernel.org>; Mon,  7 Sep 2026 13:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788787001; cv=none; b=KHBF/jCHd4WG7dnc3fHb3Er6Du0cs7mcRX3lI8cmcrtEs86ejO3axjYYfe7gvdhu+QruDp8Lx5OjIfaJt1EmkjAQF7mGuN/NApDQjjT6yTcjFL5aNP7mZlNuiFEkqos+oR+if0l4jm4TYd4LsI8Q//pYroQ3EjLPmEdZVO+cXK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788787001; c=relaxed/simple;
	bh=G2v8Z4In0XdRAS7INMiDLN8saFBbHThX8C3LzAr0q6c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Eu2R6E6r1QdaMBJawA7iMTEjZT5TV9kESMNl0WKiLi0WNTPPNPImkwGKee73Xq9CczfZuipvq8J6diUCWi9m548OOQBH3V2P6pfQKERQ0OqpvZCaR9FDzLZ1jzPLApnDijvEwJuWUKkb7CALpmzXeXVGcXK2900BPY6hKqobTuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qi+be6Fj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DNslYb1+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qi+be6Fj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DNslYb1+"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687AnR14217662
	for <linux-sound@vger.kernel.org>; Mon, 7 Sep 2026 13:16:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i/JbXDPZNdiTi4gFT/05j7G8PAlG6bXM/OV5ZMst29U=; b=Qi+be6FjJUIG70fb
	i8n9PVOwpcdyzyQHqqPWVv3O9greCJcXmPMxIdfG+ksR8LHCmjZj36HM08ylYBW5
	lF1r43md/0MPRSyDeGKFRhJkeipurAGK2bLrEN/GU8wuQKdbW3brEyw7vPlpav5l
	4Gc5XHZc+8Wfd1uEali5tnAN/AnUyYbrWryvjCYETJhcPFQ8ujjR+ugccGO++lpW
	3+W/QNI4xmegDrTlsvrAZqgw2ScLoYCDz+7hnYaaMKMZQfHuhV9UqKCGml81tMsb
	GoBHOFNBFgZli0l2buLvHCXUh2D9C3bZRLYqTKds6JJPHZupKRo4K1wqXoAfq6zF
	NkK2dQ==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghtdqgxw1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 07 Sep 2026 13:16:35 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-97ca6578487so2739364241.3
        for <linux-sound@vger.kernel.org>; Mon, 07 Sep 2026 06:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788786995; x=1789391795; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i/JbXDPZNdiTi4gFT/05j7G8PAlG6bXM/OV5ZMst29U=;
        b=DNslYb1+j03QCL+J0b7ynV9Edh93gYkITo3U75EMzqDyDIqkOs759oQK3i/F+7dht3
         QwCd5FqClUvopjkoIIfTw8ocndVG3E0kMjHjo7PdGKzi65x9RFvvLgw0s8mY/kcul7j4
         HpWji1Z8F+97yy1LWFal2ruU8LDMmVIJQQA8NL1oODNEChpNZxJ/M8WC0P61DpGDy23j
         bRAGuFB20Y5EmMcbjnPKt/mOjMdrhpVGtzZidoK6OHw30yE8Bdy2urxWOKyPw0wyout9
         IJp1S2uwwCtlhawaY+ENmHxsWahFOJA2a7keaY9/e9wSTaLwSmgLjqQODrG21gbsgIBx
         xyBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788786995; x=1789391795;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i/JbXDPZNdiTi4gFT/05j7G8PAlG6bXM/OV5ZMst29U=;
        b=F0g3AYXD9Smz/LmEKopEOOsny7zAKFdtUmycqlAIzqVC+t95ZJGAEHspXqWOiXGQtG
         IWia+OtHINe3AZZCT8ae0TmIEMIu+OPN4lDaYZsIdLhhRnKCqLGml1LdARx+uEXXHuqZ
         QdpBJTRRbRaqOCwuFYIar3yIZNTtE0foX6DwGXl4FMLmL0KfGBLDhvsNBi/vyz+Mnl6E
         U4a45s+kTR5NMj/gG9gQPc+bKx5Ogt75dHUFr4po7grp897sUN61pUZEVIdx37mMv9Jw
         MtfIPjQkA8Y0yz/X0oGQR0X90OyJ9oEpI/60Rlrfy+ffMUqWXbA0gB3RANwleBViQDBg
         sLrg==
X-Forwarded-Encrypted: i=1; AKwUvBwp+jdtjRXlOBlgp2Tkf2fvmXCS41ZCdQ6GQSJU75Ag68GltYpUJXHWI5BjCQzLtpDnoOIfjPj5oFrGnA==@vger.kernel.org
X-Gm-Message-State: AFuF++k71nzH13Lh9Aho1Ler9JkdhSWT2qfB8kCPvY6XEvPx1ee4zJYN
	gMirANquPLeUDnTD0+Yky76dPYOeuQdEgxRWf4/VkHJYfWHXhH9gdkmnTm2o9KmBGoMN7hbL475
	989dOx+E3e9mYUsMDMChuII+oFt1FmHmaLjKd7odCCubOCDYnBdsUekXPdJBsjpvIuw==
X-Gm-Gg: AYBFou0pO/DrsVMHiDjHuk6uqLki3WTCuuBgc4W2DRqSN9lrXXqRxvryO6I4nhlLgz/
	mcJ99q69C8S0bCQor6Zv620m/Xoapqa4gmvc5oiy7amYNkuGm1C0XZUIglVOjOgDKMADq5CcMeO
	PaMuWS/Jd4s5jVFlPPvANDvIBIMojf7xQBpt/nw/ePrh4Ifnm6+PdKtuGPQeNbg8vH9ykYQt8C0
	UJRgrqvjlS5lg5RhQJztXk00azuz+NJfdhjGos916LiebdPCHPVoSvpEttGvgrGX3T6bKl++gBE
	Pl+A3ybWMWNnCdeSDSSAAADYIbXniQf+7/O9DKZsDwk1H1+GqPwHjW4XHSAqubthe4SapKgHRQg
	MbtsEPngCcELKMmz9U5zVJ7WAmO0=
X-Received: by 2002:a05:6102:560c:b0:786:aae:aefc with SMTP id ada2fe7eead31-78a4aa9d9dcmr9477038137.13.1788786995122;
        Mon, 07 Sep 2026 06:16:35 -0700 (PDT)
X-Received: by 2002:a05:6102:560c:b0:786:aae:aefc with SMTP id ada2fe7eead31-78a4aa9d9dcmr9477009137.13.1788786994613;
        Mon, 07 Sep 2026 06:16:34 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-c28e9eb4d38sm176729966b.41.2026.09.07.06.16.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 06:16:33 -0700 (PDT)
Message-ID: <abaa945c-9af7-43fd-9f2f-ba20eec2a9bc@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 14:16:32 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/11] ASoC: SDCA: make find_sdca_control_reset()
 return void
To: Charles Keepax <ckeepax@opensource.cirrus.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Takashi Iwai <tiwai@suse.com>,
        Faiz Nabi Kuchay <fkuchay@oss.qualcomm.com>,
        Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
        patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260907083727.733705-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260907083727.733705-9-srinivas.kandagatla@oss.qualcomm.com>
 <289d5485-44fa-4d74-8f69-7adc1507ac9e@linux.dev>
 <ap62OoErmU6lU+9l@opensource.cirrus.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <ap62OoErmU6lU+9l@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDE0NiBTYWx0ZWRfXyP82g27uzwLg
 s0sQc4Fa9TmTvFJNxkg8sOd493bfhoqbZFB5dS5RYyDf0LRWY7O2TRy06rBJ0Qv8bk1V8c2Pw2P
 0Q0esjM3Ar/VWVX9G3W0wSvsJl9OI9DvE/pnNU90fcFB9+i0Yzad5gqPeOLoPZWIp3z8VSluFeI
 HNyJlOVS/h9p+N9BVrS+BiJNMGHGoewIgKkWXm6kqZ9Ox0D8b/IBnvPxsmWTlkHzfJwzSpiJzHJ
 zZJEMxmPRY0xFM47TmESJ0eFOEbFfhq4c3A/7HgC7/vDC959jgiwhbcv1uW/eVMvoPYfTZoU3nG
 AkQuqCpWR24PKDf0rwghNiU1O/H2wF3ZpuaplMLiVLSImi3F/7Tpvur+/XRrvcTsHCkQZl9/ugj
 YWkb7xF2Yw+HIwwgscMPChm5XAJsfnQYBYDvgggy8ID0Cdy6JKrkIdAy0okWlxHLF0l9f+C3E3N
 Wq42Tp/zf6rWIzHRkiQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDE0NiBTYWx0ZWRfX+gj2U01dJ/Xz
 jD6cH//jwe3P0Dl5WUAxND37RWweEHdEOfW3wnCAYFwtQ8ttmBqMEtG4Sphfvu0tMGr87CjGQ24
 ODBmSkqU75H8TgWMcZFsxKsbI3xpiXE=
X-Proofpoint-ORIG-GUID: TQ2JJDSMc_U566MAPt25M5TMB8vn8guq
X-Authority-Analysis: v=2.4 cv=U6aiy+ru c=1 sm=1 tr=0 ts=6a9eb933 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=w1d2syhTAAAA:8 a=zomqoF8P1_g83G_DeI8A:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: TQ2JJDSMc_U566MAPt25M5TMB8vn8guq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070146

On 9/7/26 2:03 PM, Charles Keepax wrote:
> On Mon, Sep 07, 2026 at 01:32:30PM +0200, Pierre-Louis Bossart wrote:
>> On 9/7/26 10:37, Srinivas Kandagatla wrote:
>>> find_sdca_control_reset() only ever returns 0 -- it just sets
>>> control->has_reset / control->reset for the framework-known
>>> (entity type, control selector) mappings.  The int return + caller
>>> error check in find_sdca_entity_control() are dead code.
>>>
>>> Convert to void and drop the check.  No functional change.
>>>
>>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>>
>> That looks also unrelated to DT stuff, not sure it belongs here as patch
>> 08/11
>>
>> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
> 
> Agree lets pull these two patches out and submit seperately as we
> can merge them both happily today.
>

Thanks Charles, Sure let me send them out separately.

> Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

--srini
> 
> Thanks,
> Charles

