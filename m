Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794484264;
	b=GEZpbbKa7HSkbEthxGVNMJ2fEOleoXHGHKk7PdCG6QqT/ibGw7aBurosOGbJDxTYmgJp
	 HBgMDsssWM2smj5sWWCbjMNyxBRzC/Ba5TKc5JePhVNJFsHe+w+ZNAdCLybDeSj8Xscr9
	 1UhlKCd3r+8wOsYhrRtROhDs1dOUoL9JWdMiwIyLrB0x1rHY92n5orYox7KC9gwGD7RWP
	 msoG2Rf6jHsfoXyKHhx1wvxcpCvmd/tvnvi0+apOpUx+Fqi5pXVB5de/cd6FEZ8qy9JdN
	 5y7CcbBESONuxBRwGum+V2fLU5XLstPphS/Jdog459nyC/9XpOwWyXWVwOnkquPSU2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794484264;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=HJV05ozMgQQR5oMBTD4lVubnc5m+oMLMSDiH05BrgJo=;
	b=NqZrz5svc3WmbgNgsXoBoc2rsadfnJHDfe4HYX580X54yxsxk8QGhHXo6myHQ9j87im7
	 kM37SkzW0YxYxU8gt5sdK4XUiZZc9NSt7dXyvmfsRQsg77DpATy62ucej3+cgVeDFannA
	 AIxtiv8Lid2xBE3AqGZ+M155PpYfyU2FSFADz/2sKvjys4B6mBrLbD77y7gnUFrwC4Ky1
	 FMTNr8wbloLw35MBSLv0/G4blnKCy2OKDg+YKLtNCykouGpyCFHMEXnzSM+rpqCVRQGUU
	 W35CdFsVvDM5kJtsYORquB3AkWXSDm+Q1dtuStZyuCjRsOuyNKarwB2Ox3fyblKCRgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OlaWAyPQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fepBsLRR;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8973606A321
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 11:51:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8973606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OlaWAyPQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fepBsLRR
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACBJsrj442006
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 11:51:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HJV05ozMgQQR5oMBTD4lVubnc5m+oMLMSDiH05BrgJo=; b=OlaWAyPQmxzF+Xys
	250SgtYy6aMFRtP5j1LHgvALDWsPYKUVXeW20Qr+su0AhQvDnkFNb+5slp9+HPjV
	aVrwn4BetA5ZLFO0jg8l2leJ6FyKquLHIu3ILvkkmMk7bhENPP5KYcfndOJJQgsm
	Jmbz91+3uGQSGQhNAVUfUWenSrL4aGD5r9NGcYTiUMdudWCGLXuu10VNODdQEYRA
	gmhJ62R6/qj5T8oQgn539euq181GrKrw8rHtu5fxN7iuPM7vg/tVQJLSutLvCTz8
	1VWNuh/HcATHzYugn30N7xGzkcmHG+Oqk2aoIlSVcscFNE/YFHDyDkZud1qeqc8Y
	3dnBhg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw7nc19u2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 11:51:03 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e9501034c4so63864455ad.0
        for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 03:51:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794484262; x=1795089062; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HJV05ozMgQQR5oMBTD4lVubnc5m+oMLMSDiH05BrgJo=;
        b=fepBsLRRniJHdsT45aPOuXmbekNHk8qsvgvpZevKY5rpsMdw1kISwUlpHBkv84LPFF
         2a8FUMrAVNPF3ggvQu9UfgAfu+ZQb2cA1T3bosK7TiImUip9gQPgYm1l/bCO41VPI0fy
         lBurt/KIkUPyuiaN+syhejGu6h5pFlpZPjVTsFpthQUf97Y+U4Aq4SqpEPUUOJuU3PhV
         S94Nxmn7RCkTEOdXAJK6FB8FbN8wIzUR04aS4JRhafchAFdVE6iyN0enuPCnjJGCbuLo
         fBZd+7yxoQMO7ARzfwBxPJwdfDJgNqkaANzf+vf+o+qGifh/8pNH5jUAzyvfvEvhGEYl
         hm5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794484262; x=1795089062;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HJV05ozMgQQR5oMBTD4lVubnc5m+oMLMSDiH05BrgJo=;
        b=sgFA8d0v0HgRARcy1W+g62dbj2ST8tsNDGxrAIOD/XOIh8sga+Q6vthqSqqgniIEUE
         QxaTzluknXb4UKpkBpxDkkJCHgowQRHpx0lUNZ3Ov4mVuwoPZrU/PLAlqQKvUFsWaEq0
         iILITHsV4BOKIrRPXFVGU0+BPjbufYjTwk9bUm6LWVtAH1MUAKQM7cvek/ZDFjkucgLb
         TvuPHygG4Za41c49fEtF+OpS05CWwhRUhadhObfWyWvejifK5sjkiPSRKleu5C0KAynM
         y1Kj0NZNrvg+31wJNY77ys8aTl/Q0Yh4UNeKg6Kj8x54RbOVAGY0z931x5ow8yynHb+m
         L7dw==
X-Gm-Message-State: APuU4Z+2IVbDyFqPyRBY7+Amuwnue0RlzZnGQ6mpNgA7AinjDSUCRe25
	2tBk8bpy82INhATq1z7Ku8skBorzR3ktvLBiWe7gO0e3/pjTGJhRUSBuVmERd4m++XOFh3jw2Ey
	ZQF7QWxkHPB3shkniRmQHJ9X5TxYKI2PDTVhiAGyH7B0nX/c0Br2h9oL2/ZXhzjbr+w==
X-Gm-Gg: AYBFou3Ny+M/Zge2Sr2O5V39MPENFcdbf8VUy5/EVcZqZw7yUBGZDfKck/CI/yi6Rgv
	FGsRPkKNPY0bzEUzek2zsQmhDT493tqZFCrVq9iznKAxgYQWUK6eGjLfPi9zbbNF0ldtnPd0pH2
	OU949iuGSK1a5Mg+/crPkH/kXxLT+I60smTi26bGROyuLsjvXpnX3nxBADq8KfhDyC7+Bw7gDJR
	ERiVzTc89Ga83+zq5/fkJmbbN23DpruE4l3QixWKbLOF3SULG5wbtMCHrstst5hwjlO9F2FsV56
	iGaB7/YSpNqAFSluy3Ia2jXd9p/2cz7tQ+8AZumj+Xiq64YBGj+pgjOipw6IJwYTQGK9gXC3yfG
	Z3D37wvMCy7JDuShQf0imT/eCuUWFVI7Ci9BvpGVk7eJFx4ZMHm4Ab2RB3NidRvJT8NpfD9jWSO
	l7MXk0A8E=
X-Received: by 2002:a17:902:ec84:b0:2ed:130f:869d with SMTP id d9443c01a7336-2edd7acd66bmr55971745ad.43.1794484262453;
        Thu, 12 Nov 2026 03:51:02 -0800 (PST)
X-Received: by 2002:a17:902:ec84:b0:2ed:130f:869d with SMTP id d9443c01a7336-2edd7acd66bmr55971575ad.43.1794484261955;
        Thu, 12 Nov 2026 03:51:01 -0800 (PST)
Received: from [192.168.0.111] ([124.123.194.0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6a415d3sm33309415ad.9.2026.11.12.03.50.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 03:51:01 -0800 (PST)
Message-ID: <6b02b6d1-1bed-4304-b11a-bf2bd3e8f852@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 17:20:55 +0530
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
Subject: Re: [PATCH v6 v6 9/9] ASoC: qcom: lpass: Add support for LPASS codec
 v4.0
To: Srinivas Kandagatla <srini@kernel.org>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261106-add_shikra_support-v6-0-2cda302237cc@oss.qualcomm.com>
 <20261106-add_shikra_support-v6-9-2cda302237cc@oss.qualcomm.com>
 <85fdd5f0-a729-40db-918d-f1367459e4f3@kernel.org>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <85fdd5f0-a729-40db-918d-f1367459e4f3@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: -LuqSYMsgBrkoKiYVcjyceOQ1wkxnGc2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA0NyBTYWx0ZWRfXxDL/gwRc7I3U
 E15GyXvZ/A0VZIqqKR4oOKy6OM/mU7/J7bKqpCeUh/I1y6IScnhr2m4T/4eaxDRUAho+0gAMjOg
 caSJQvyxfu9hsYa/kTtILoYgntZjrZI=
X-Proofpoint-GUID: -LuqSYMsgBrkoKiYVcjyceOQ1wkxnGc2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA0NyBTYWx0ZWRfX4p8kAMoKAzos
 DEWNXhQxjFVfu4afjgljIr37RNovqy0nNeuPwB6AM6e60q4SY7WyzYdXCgvKVo3wFZfCXKocqBM
 a3zTnuxOE2LhbuEfXHVZyD+6cIBTc5HGZjGMA/s2Rw2jZMolHuS/Rt6OvghRx2VX9CTrvXrN3eX
 S3VEmbo8xaTx+CGm1Rh/UQh4R33GSk5IDsA1B0Ff5+flJSWvuQbhPHR20984a4rGl5PeL+rsQfa
 2Okzed8yWIAbpD/OGteTY9oQstlWzPjtRw+K/BzOGvU9JASihToPdwC0emZgJw3Nvs7JBaBS8BA
 8DaFNYws3s/rcHrFbRhfRB/keBuZPMFsH+F1JfX07/VNbUY0YlBqwBW1xeiyOfa9MNveshkpfxM
 LcJ8qUlYLAUCesyHbWlpiIaTUjD2nZal0WgpqAEFI6dO/MhJq9gYGr9+KnlZPW7TimeAvC1jYhM
 t9FDGNpc/+/q1yeg58w==
X-Authority-Analysis: v=2.4 cv=A8b5rKWG c=1 sm=1 tr=0 ts=6af5a827 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=H4FFYLkF8j2uoF0yKy44mg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=1p-7M3_SpvjJ0s4hP8UA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120047


On 11/9/2026 8:32 PM, Srinivas Kandagatla wrote:
>
> On 11/6/26 12:33 PM, Mohammad Rafi Shaik wrote:
>> version = LPASS_CODEC_VERSION_4_1; break; @@ -2175,6 +2178,7 @@ static
>> const struct of_device_id va_macro_dt_match[] = { { .compatible =
>> "qcom,sm8250-lpass-va-macro", .data = &sm8250_va_data }, { .compatible =
>> "qcom,sm8450-lpass-va-macro", .data = &sm8450_va_data }, { .compatible =
>> "qcom,sm8550-lpass-va-macro", .data = &sm8550_va_data }, + { .compatible
>> = "qcom,hawi-lpass-va-macro", .data = &sm8550_va_data }, { .compatible =
> Why do you need this change if hawi is compatible with sm8550?

Thanks Srini for the comments. Although Hawi can reuse the SM8550 VA match data, its DT clock interface differs (|lpr| instead of|macro|, plus|heartbeatpulse|).
Hence, Hawi uses a standalone compatible and needs this match entry.

Thanks,
Prasad


>
> --srini
>> "qcom,sc8280xp-lpass-va-macro", .data = &sm8450_va_data }, { .compatible
>> = "qcom,shikra-lpass-va-macro", .data = &shikra_va_data }, {}
>> -- 
