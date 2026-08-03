Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27D77356779
	for <linux-sound@vger.kernel.org>; Mon,  3 Aug 2026 09:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785750006; cv=none; b=OP7oCF+gTGm9AzZ04l4Mmlms5F+o8hGRHFfBeQLnXx6WpUuYGRIOx3REniQluvi4Yu+LsYMXATG8NC5+agoPoZYadKLqd4neSgAPMo/IHXvo293TnD+x0ZcarUvaMWmdpQ+wSda9DqzU5Ix0gwEWXKQlP05d3y/Hif/3ESX+DyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785750006; c=relaxed/simple;
	bh=RRWgcT0TYgbIRmpDLa+Wa3goPdp4+rE0NIOk5n647+M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R5ND9sa92pcEn/nS9NXRCxgwrUrgxgOjorHF+qIjVBX65c+C0hQpOtk5rZVksvAK1FjdXUi3ICrvq3rCTya1XMdcy/cB7Iyv5HWoMyU9kat7c8n3arGOjufCzAozhKQV/O2I1FN1IXzHXbyIkC239I1i+XdyXF6S//i3mCX8ALo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UGEHqhUr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fVHrKMbF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UGEHqhUr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fVHrKMbF"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6737Hp1V3960394
	for <linux-sound@vger.kernel.org>; Mon, 3 Aug 2026 09:40:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d6AUI7o9/3m9Nx0dk1Vjh5FS62SZ3AH1cQ8tSlJIEdA=; b=UGEHqhUrhwPrxWCi
	b3gaLTfW0SuadX3nB0yqEQWpNNGeyc0YK0ErpiJ+1xfrWaAWDcogoF2WbyH/KHkX
	dNo6EiZVXWx8WQUydq7nDGWOfTsf/xdjiA9vEco84M9R3Q6leoDIvTc3vycHWINN
	4g2DYJ5YdKstonGGFu/lb2GYb9lsiYJ0YjlJ07ciP1wsVHknmUMtXWrkE16B5DQu
	wLAcLn18t8ronIxAEr6PNV9UxeGmsMPTGeTYOLnO0nfH0gnnKB487FLRVv96mjDu
	ntv11yqvp7DzjD5u7N5xB3u/itDwdGtMqls3SG7ON7R4p6n/WxQMISjWyPMMdgE4
	JUEtqQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ft9fajh6b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 03 Aug 2026 09:40:04 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cfa55c9430so27864395ad.0
        for <linux-sound@vger.kernel.org>; Mon, 03 Aug 2026 02:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785750004; x=1786354804; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d6AUI7o9/3m9Nx0dk1Vjh5FS62SZ3AH1cQ8tSlJIEdA=;
        b=fVHrKMbF3/PEZFrpoGNYw4FtlKNR2cxQj0ZfRA4Q3mQzZBeJng+7dtPp5M91obgDff
         utaGBMBuanD5UaHF8gurRDPbM71cJ+Yirv385rw7KzKgvjo8v628OPMGR3DwxWBzLkYq
         bvW5AppwvxqRY00h/ChK/CBWiDPB9qt81UXsZmobcom+OsV3cEFN2gmiAIvy+bQsZbeb
         cE2gVdNpFexnYjkJfJ4n3RJYsuNstf05RxTOAbbRdMGoB6iBpH4uizA0NSXul+1K9om+
         ixgve+1RwkeGhsciQVgF4LG25TiJI4YqEisyeUW/OhsdxBxH755Sahm+c1gyXnY8iyRE
         c99Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785750004; x=1786354804;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d6AUI7o9/3m9Nx0dk1Vjh5FS62SZ3AH1cQ8tSlJIEdA=;
        b=SKYvDsqyirLSBbKOWaVgxaJk5vmgdruw0Qr5fEy0uN4eaJyQ5MZNK74x27JRYLoupj
         oAHZzTd8fWsgBnkUKajym2P38D6ju6yFfFJcC0lOsLKa8qUhP9Pvx/WXeNDWw3PBDpSv
         3eiy3fxABpIZDk/LZSai2sg4/h9P1hLl8/pscz4d3y7DThTVuNZe6lYIeN6Q4pkzSoqk
         NzNBNCAkxHg5V9Tyg7CWBEfJafWVRjcPXu7BuE6DGLTiISq7VUULrLELizUMagWgAynx
         2j1eFC+FCPGuQhct6RLxebdhR2kPwfXmHd0yU01RCOTggeLyitrAr3svYZFwiXFzrTFP
         qEKA==
X-Forwarded-Encrypted: i=1; AHgh+Rr691a/YEDiMQ9d2BgCZUaOSAHnCoCZU6UVkAQqLYK2kN1JXSUtR7J+YNeM8PCkU/i4WZQVukHGlNtgbA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwxeHOXFjdofzpHVu+fcPXH24RxDiK8BBh21tyTuOIeSPBYPVGG
	VOcQ0TvSMC5gI9q/KxUd2ZRdj/Vsi3NXU6PGFgPAQQoPAxSzcyweWmLwAvEHFo5v92JKg9LaUG+
	1KleQPn8EiqFfjEk5mPyh5krHx8OLswNq9mZMJNt0PKZHsIbz9SQmzokkkk6GKNURyg==
X-Gm-Gg: AR+sD12HP6Qi/l6nbdXctdzB3c2GDZOS+gddVq3P8itx99ixM6OKNdL74Va77GD1u+E
	1o2cyn1e7WoNu4/hVcqlUFSPKu4aDb7ctggYitMN7/wHtLSSsZE4IaRNegwhDo3xjnzmot3J1ll
	JLkyd7Bd++T6kQTdYvzJx501SS/PnibwpadcLJy6l9skyITuICHtoc9U7L3KPadqtFbWrCQ2bMh
	XwlSaP+0Pe+N5LTiO9BmQvRJYVphLF1l0HLwdHjhuccvo3alQMwLybNw7fvz8fbSRChRpQ2hDB+
	+yW1thSiEfDYaSDp/pLQBwLZgYWNBIOHvpwhGgOoU97d4m1nkwoHwespKJols1PSE6JUeu/+vpx
	J28QIAea3JZWHle4gBZ1K3SVT/9uH2Uv/8w==
X-Received: by 2002:a17:903:390c:b0:2ca:ce92:6e44 with SMTP id d9443c01a7336-2d05218984fmr89075855ad.8.1785750003652;
        Mon, 03 Aug 2026 02:40:03 -0700 (PDT)
X-Received: by 2002:a17:903:390c:b0:2ca:ce92:6e44 with SMTP id d9443c01a7336-2d05218984fmr89075775ad.8.1785750003264;
        Mon, 03 Aug 2026 02:40:03 -0700 (PDT)
Received: from [10.219.49.187] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04b15d27asm34889545ad.78.2026.08.03.02.39.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2026 02:40:02 -0700 (PDT)
Message-ID: <21e896fb-43e6-4681-a00f-9a2b666030ca@oss.qualcomm.com>
Date: Mon, 3 Aug 2026 15:09:58 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/7] ASoC: qcom: add AudioReach TDM backend support
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260712134110.3306763-1-prasad.kumpatla@oss.qualcomm.com>
 <275c15b9-8a46-4e55-aff4-9e0aeb01b730@sirena.org.uk>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <275c15b9-8a46-4e55-aff4-9e0aeb01b730@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=PZPPQChd c=1 sm=1 tr=0 ts=6a7061f4 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=XciJB2WwQe-gzLjzgcsA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: euEVcCwn_unmpDLPWKBQY0z1yEEKKA-W
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA4NSBTYWx0ZWRfX1meJTxxDV9ZX
 2wlUWWYm8CzhUtU7CCwdzZRNXIOwPLNE/fwGKzKmUM3QmbYbIqNGaKA5jX2Zvdk+PyrzNwCp/1Y
 fIlPpdbfkdJg0NDRLGKqzx5m/bFW/+8=
X-Proofpoint-ORIG-GUID: euEVcCwn_unmpDLPWKBQY0z1yEEKKA-W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA4NSBTYWx0ZWRfX8TkXO7WiZU93
 weeqJ4Dxrvs9r1OlibQVCidvv1K04597Ml0LYMNdYmYU0xKRJue+3Ft94s/k3QvcytVfCWL54wi
 ZE/G0i00ebQAyMayBn6TppOTMy089eYyfS3nb26ZdwUtUd38kPBOg21hj2tcxn30hFPzh6dIhh+
 UgWLQAf+8UwX07FkmCTXOANoA/2UcjLu74yO37J5/yGmd/uKfXjpeNyKaBnoxIbn7ABIr6enEgZ
 5JzOukImcyqPM/s1oyc9ZQygvAUaGlGVfBqT4Oz8iwgdF5Ev1ejwi4OBDtAD1H/w9B9Er8pQJYH
 42esKBS0e2WDX9VUtR++QRF8s+Xgq9zT+9lXwzIZLq1CnYiU5cAZvOS+25uTnNdiVv9UGgPrLUC
 aedujKVgK1HAPIoK1q4nE+9GcR3UAtlRCFzaYsrnGJizFQ2aZp7HnPZaCK7rdV8pY293O6FqEMo
 Xw/Irn8HpNWgTEMyqgQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030085


On 8/1/2026 5:35 AM, Mark Brown wrote:
> On Sun, Jul 12, 2026 at 07:11:03PM +0530, Prasad Kumpatla wrote:
>> Add AudioReach support for LPASS Audio IF based TDM backends and wire it
>> up for the sc8280xp machine driver.
>> This series depends on:
>> 	- https://lore.kernel.org/all/20260711125740.3083236-1-mohammad.rafi.shaik@oss.qualcomm.com/
> Please resend this once there are enough dependencies in to allow it to
> be applied.
>
> Please include human readable descriptions of things like commits and
> issues being discussed in e-mail in your mails, this makes them much
> easier for humans to read especially when they have no internet access.
> I do frequently catch up on my mail on flights or while otherwise
> travelling so this is even more pressing for me than just being about
> making things a bit easier to read.
Hi Mark,

Thank you for the feedback.

The dependencies have now been addressed, and I have already
sent the v5 series with the required prerequisite changes included.

Thanks,
Prasad
