Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794776660;
	b=KD9awYIgvM5g5tbo6iYZEktYgp3qBOv295c0YI1TJRF9Jla8TYIJK9uFwxmnmhmh0Orr
	 9jUDp3iV+FeWqbaywA4ly3rdkb7+shWGCXPG5FXQbYI+a3yE9i6Tac212Hw3fUSBCT2HA
	 nEo3VwfPKNciG4HxcNrfEFM3EE3a5HVlBSntP3vwdKpmNnDXeDvDZ/00dtYNMaZ4MgqOp
	 1NIaVXVoll+LrSgGFw6TP2EJi9oeNy9gbwbHR4qkyw/H8/OX7sXqir/Y0oG7O2hQP47Ux
	 UXnw61brfFtp/mOSDEE6mnXlUfyI/2O7/ifObtdap7IM2Us9kmDjK/eCvQHfUaekq3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794776660;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:From:Subject:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=IvJv4G1qdzEGifoDcuLnLQ8T7dGYEN5NE+7M7bvYeec=;
	b=Wj9U6iKAsfo7jDlWtZrY1qkG8AdHniryEKy6JCSC2qBbx5JbW6kDYsykiRtOrEyEVfW1
	 Sf2TE9kgg4jxQx2U1JA/1sWXJOhPw2JzesL3gGdAnCURzDlIysr/6Os3Z7WMxs6sFv3EL
	 Enpz4euqGNqShkjV4PY7uGK940WxyyzOsfxiNtDUtRIdxylUB8w8FmM8Kg+35HPkbcRoI
	 bCtQIWZq5Ft+IyRVbvFo6q0zG79lFUaLmisXM6iV44Zz8XtEJ78TK3DGB6E4lxETYCTs3
	 vJasMBTWqZOnW4VG3XEZXd+ILE6QhOaAhXmbF9i2EqbXvJdpgPdHAY4pXNn5ieDW+hQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C2oDkk2g;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Yl3yEuIl;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45F0B606A329
	for <linux-sound@vger.kernel.org>; Sun, 15 Nov 2026 21:04:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45F0B606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C2oDkk2g;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Yl3yEuIl
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AFIQtaK3150013
	for <linux-sound@vger.kernel.org>; Sun, 15 Nov 2026 21:04:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IvJv4G1qdzEGifoDcuLnLQ8T7dGYEN5NE+7M7bvYeec=; b=C2oDkk2gmKK8PAXn
	8374kca06ubl4FSAvnw0K4XeMdi4I7knBXHSRehGGam8wtB6gxjQxkK2G5TOMvS/
	7Vz7gOb8zxgOHzEPdR69CbJml6LYh4/sA5cyNC798+sIxiGMMySinjNXjS1eZNm8
	vH0of3vSOgl2uV5xciFigFpv8sv4kkAJSK88CRosUE5Bvof56GiMKa5Dj3GvSViS
	qp6ct0TQIksHxAYYU2nbA8M2XRWAXLSRadwbyrZE772JxE+WQRbQXYvsGAamPBm6
	cPK6J3FFfFtpgchb1zqQirUesvTF9eRNUmkKBBFWkR0bL5muKrqotdwniniucpSB
	/GY/ig==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhnx3vv1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sun, 15 Nov 2026 21:04:19 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5ecd2447f4cso845214e0c.2
        for <linux-sound@vger.kernel.org>; Sun, 15 Nov 2026 13:04:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794776658; x=1795381458; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IvJv4G1qdzEGifoDcuLnLQ8T7dGYEN5NE+7M7bvYeec=;
        b=Yl3yEuIlskCdCWo4P2xJuvmNm88HkVnHL4cqGzYf0fGlIeEUIlhfahrFgESVd5JRtU
         DHWIEGWBm+aCjwXA2LQ5J8PfuoQmbNYTGGcRlG8DCEY8EtoYkHzIRUlRvxyUKwLVuplC
         6aKeE1Sg4sOpT5Bevb3aRKcZVAymvdRHLqWLSjoexkD5rFrcQ9GI4J+qcMihNJg3e4fZ
         6ZRYji/H487DJTJwxu7vED3W/BRq7xijyX2XUqN5nWq7rVzXLQTPugKFLlMxX1umdwCk
         dUL4Beu3IUBh3EAqTVoS8EflYtmqQkrfpw/KHYUv6Sr+Ev5Ad7COeaeJFRtTsxvpZgeH
         QUOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794776658; x=1795381458;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IvJv4G1qdzEGifoDcuLnLQ8T7dGYEN5NE+7M7bvYeec=;
        b=gzmpSkLEk3bPP+cq7ICj1cjN/xvsuI+r0LYUIzgdiNXyUI8BrVcmu1u4Qtmbs7fqkq
         3PkLMGtp6tz2SK5VUdBv5dvs+XBDtJvc1OsF7qbloSQFlSBRXgs5tymnHJ41SG5cd0VH
         XzrCzMY8EHrfJU5E5wN7xCFAbQj/08oaCvbuQd0pnziUIx6f/BcfCPdBqmaGVLeOt3vO
         UVCnzIUjssmPTWng6vRIATl/IIElXqZIF7sMDyRxMtbaAycZLfH8DN7m+ozSk3LkYO3D
         J9Qye9B7aSXnjd4Kp4+WaGRObL+vkMUc3lG56kcctme0p5fYv9J48rUgW7ENrP8zhbA4
         d2rQ==
X-Forwarded-Encrypted: i=1; AL+hErFRUlnjKeKRygm3/1ULuTRMR6klD4zvVqWKg1g/Vr5fq0oQEW9QfY+Yqpf+zOc6YLwEMDj70dVF1t3Kgg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8whYYLvMg8mDGz2PDRSzWIiZx1miD6FoYCi+t6avLzw6KWixft
	S4GSli6UouzAea1fqHpz3nc5CPrZaWFKg32Kt9zj++ik8o/L6TJcjcl/3qatnH+mQvkFKba+/8I
	qS1MWO4KQDM1ZIlwMVDdcVR7hCeuFjFGgxSRRkbwppSmdz+rDnwpZXQ9nEVm6lPSBNg==
X-Gm-Gg: AYBFou2lTBGoAH+38kclaNe10LS1XYO1WsDxPC5HjM5+ZTNKV9mcyCp9PbTGoLfTQyB
	AN6pV9ujFTgjDo/RiZuiFjZelekptGeABNE0Mc2YyAnLu5AjqzEUQJjN9BLj5lsh0QKyaE/IUJc
	ptCIcXH+4NlgZUxVgk/1fNYIwrJLSw5uys3pN8YRVfF6W4fMLMtQMeiDydXnhtrTQ5XawYq2iLS
	aOKRaOdvRE2Kd9Pb6ZEX1/JR+14+5iS1WtemfqCCxzaEi8JKt3GK6+IcshRczGhz9JPV6FFHdH7
	MBCc+ko3C+JtVB/PgKBjdFLfY2n9T/3DgRVIAjK/Vb+N3W2Z6KbzzXIfH1JAaz3JwN7SWs2b2M+
	MY3HA8s1ekSrKeDsidthn+4E67AT6tu0jMVB0p25Bj4n4m6AEpUMN/kOm+mmF7uZ84i9CuZ5PVc
	Qj
X-Received: by 2002:a05:6102:508d:b0:7c0:1d48:b2a2 with SMTP id ada2fe7eead31-7d64d8e0df8mr2587400137.31.1794776658382;
        Sun, 15 Nov 2026 13:04:18 -0800 (PST)
X-Received: by 2002:a05:6102:508d:b0:7c0:1d48:b2a2 with SMTP id ada2fe7eead31-7d64d8e0df8mr2587390137.31.1794776657877;
        Sun, 15 Nov 2026 13:04:17 -0800 (PST)
Received: from [172.22.9.204] ([217.110.90.56])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb65ce005bsm156345935e9.14.2026.11.15.13.04.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 13:04:17 -0800 (PST)
Message-ID: <31e8d411-0861-40cd-81f2-6d48ac99f95f@oss.qualcomm.com>
Date: Sun, 15 Nov 2026 21:04:16 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: Re: [RFC PATCH 01/23] ASoC: soc-core: allow default ch_maps on links
 with more than 8 DAIs
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261023171433.820092-2-srinivas.kandagatla@oss.qualcomm.com>
 <179476416981.140154.14343442697827559163.b4-review@b4>
Content-Language: en-US
In-Reply-To: <179476416981.140154.14343442697827559163.b4-review@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE1MDA4MyBTYWx0ZWRfX3pktszuHv4yC
 SGSKXfmp89xsKwUvLRBVwr/mbZw8LopLzGRrxOAzWDplpKygdHbcu50Sy2uj/qYgIo8KZPbRVhP
 tM8RP47hb+2xoYwxBCtnY8slN9nk8/zBzcxniSNUDVpLLamsRmzoPgFqLmpHEa5gZyNdOOnjxKG
 CUm4GOpTwggnp3a1J81tl80+ZqBzcIo3qXsdPcZxvLudH8E8N8UKk7emHBo1IIisRxuELZ9YM72
 sE2ecGh6vFU8BG5qzciss8nUbURrHgD1gdJSQ4wlmr5j97ijKmA3t9icQdOxuFacGVX6gQYsTbP
 suX8TuFL83kIhsWH82sUWilWeoU99DJ7gxim42vjqTsZjz+67/wQv/mEP6UuhpgTV3O1n6wqzAV
 7SlNdbF/rgaD3+Y3jBkRqFaKiFC6PW8950T1+55xRcGS62OBU6C6Uc0qFwJLK4u9eiHemJgs0j8
 Y/AuWSrSWu/+IgWHEWQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE1MDA4MyBTYWx0ZWRfX+CJ51uEg1eBn
 rQE34Qth1lIpslKoC5aYwPTx3W9XKBrxL5uZYDMxpFO+87pwfaXZi/fZ6TtBYWiQLxm0cjsZk2g
 AOxvG1g6JYayqeB/huie7R5p4pPgfDI=
X-Proofpoint-ORIG-GUID: ZS5E7do20nfAbYRfdA5C_TPSMoHpTR-_
X-Proofpoint-GUID: ZS5E7do20nfAbYRfdA5C_TPSMoHpTR-_
X-Authority-Analysis: v=2.4 cv=Jr5kP84C c=1 sm=1 tr=0 ts=6afa1e53 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=hzUeyGCwRGS7WCfWEAyTKw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=3AhHibbqxz6MnhjUMnIA:9 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-15_06,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611150083

On 11/15/26 5:36 PM, Mark Brown wrote:
>> snd_soc_compensate_channel_connection_map() builds the default channel
>> map from static 8-entry arrays and fails the card for links with more
>> DAIs. A speaker protection link carrying both the amplifier and the V/I
>> sense codec DAIs of four speakers has about sixteen.
>>
>> Keep the static arrays for links that fit, and allocate a per-link map
>> with the same 1:1, 1:N or N:1 layout for those that do not.
> 
>> @@ -915,20 +915,40 @@ static int snd_soc_compensate_channel_connection_map(struct snd_soc_card *card,
> 
>> +	if (dai_link->num_cpus   <= MAX_DEFAULT_CH_MAP_SIZE &&
>> +	    dai_link->num_codecs <= MAX_DEFAULT_CH_MAP_SIZE) {
> 
>> +	} else {
>> +		int num_maps = max(dai_link->num_cpus, dai_link->num_codecs);
>> +		ch_maps = devm_kcalloc(card->dev, num_maps, sizeof(*ch_maps),
> 
> This is a dynamic allocation bound to the card's device but it ends up
> in the dai link which might be stored as static data in the machine
> driver and get reused on a rebind.

I missed that, am thinking of moving away from static entires and make
everything dyamic and add  devm_action should set the ch_maps to NULL
which will make sure snd_soc_compensate_channel_connection_map gets
reallocated on rebind. This also makes it more consistent with the way
machine drivers allocate ch_maps too.

--srini


> 

