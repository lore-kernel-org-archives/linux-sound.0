Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 454F0223DE9
	for <linux-sound@vger.kernel.org>; Sat,  6 Jun 2026 23:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780789237; cv=none; b=KbKR+FUNPwYwLf/nfYjkm+xU/b6i37gF79WsnqbcQIViXvaPGFVUiMlfhFzRrihhimhL+3mYGk94Un/b03IzT6i4+VX1TDK4LMwvc+potaT3Osvyqxhv1tiofkVrBDAKeirJKxECZMJQjuUYRxilrCiCu/WGim2BvC3TZoR2fjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780789237; c=relaxed/simple;
	bh=0tSg0qtetG65h43kizYT5Ef15BXihynhKBAYPep/I8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EAPrcSI0LaBW6XIqcw18ACIG7UZ23BYaM+79cSrVsSaNYa0PpintBPRAFy1LMT/v19G1hQEkTdU5eNrdS/KMvzEC5YOkT7814l7eWXdQWn+h1P8j7uDIZRfe/wGXiwIRy/XG5dQeZlTOzLgA5kuOFUP/3NcGm7iHWOCDvONp+0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AMEh7HsG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eMK2IwYm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AMEh7HsG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eMK2IwYm"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 656Jk5FB2360899
	for <linux-sound@vger.kernel.org>; Sat, 6 Jun 2026 23:40:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ytQEAZVz7Da6jMOM9zHAfTS7
	wz3IgU/VofxpTcuRh/0=; b=AMEh7HsGAgeKLmsrVlGxmY4DyYVgqaXUHeDa8f12
	XKJhiq/GdpvsXqkRKB1/daVMA2BqYazj3xYMdguk3H0PzUSmfNWL1rhm+YJNVU6J
	7lpdhh1WHlEfu38MH060/ITIR4pd9yz9vcisAO/7OapWwJNo/Ufwq+ROEBhUfkFW
	VMOlAyaYEOxG5lz7HvEr7yarm8uYJeVtcrR25WCXj0n0CuQgE42MdQzT2zTOkPPb
	8einbOFjpYqPNghqvNC4DDvWfar9FaZVGLKXQ4xG2AstvI/Jkg16GAw3DbroOgvX
	aJFbD8vc0lO+JZk5A2DJt5EO2uB0SrvbDwNQdGU+Fo+wOA==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emcu8t6c0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sat, 06 Jun 2026 23:40:35 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-963d7670e38so3951134241.1
        for <linux-sound@vger.kernel.org>; Sat, 06 Jun 2026 16:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780789234; x=1781394034; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ytQEAZVz7Da6jMOM9zHAfTS7wz3IgU/VofxpTcuRh/0=;
        b=eMK2IwYmPm9Tme/GBXguMiFimvaileQjf2WQx6h5NPGQhUqKNDJG5WGHbF7ojXQekX
         MsV6kxtZuis+yRgmhDbQnf5v+QzOkMpZbx1/aXxIxJfITQT67Qm6uhXZ7xEp+yY09/Gs
         ru2LVIhnedC8/8NEjav8X3C2n7X0DIuPk026Lpijcrz2T8+/ZBUyJFyrdOJtVy8G1vCT
         UelJh8xcnV691SpUrdFDQ4vIaB3SF6Y71fWT29ZRN3f3pxj78t2BPwxnf2w8YlmNBFbs
         eMGeK/qHu0w7NdYDdsz6ho9N4vJDcMTsBtuw26ElcqIyHgaKYJd3yyxx+6KqHfr6q42X
         S2kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780789234; x=1781394034;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ytQEAZVz7Da6jMOM9zHAfTS7wz3IgU/VofxpTcuRh/0=;
        b=GcqJcVcAGaVRU/1Z6ZBoN2s/mt7ddbOhsZ1iKFe3TokZQiKgrfDfM8VtDErfHdNJEc
         1wf0Vx49H+cm3CjRRsgRHJekT9P+28DgnN6oxgmQtu4PQp4UaAreafZDGNHxwkMl3lff
         OPipqFTj4lucbxd9fkMfFp6Su+Kn6JAm1jf9/KxUxndJAgCZFSfSb18nfo5WFGhJEeP0
         VhrO+UOGzFv+vgVKu8uVi+LwHqznOaMPMfEFIx9u/XFjkFWJ5tAo4UhDGLpFywr3VmU7
         b2PdpjK1MAalUSybqDrun14kxcUuwwUaZFTTSQKhMnlhtKpMERrbuWn7QaLE5FbMDXjU
         qnpg==
X-Forwarded-Encrypted: i=1; AFNElJ8T+t3I9aHwLfdFPZyHEoH1FkNLxhV94wt3WDBSxy0a28juoZtaGrkaxz/shIQL2BmTn+ppC7gqlqr93Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxMmgKIZsRjBucOme8vSfYICOBQJFPwokx3SpnLzrVwP/MAiaxU
	ELMvOueWDn9nEpBQG3KA8ac2fSoKIX0OEBud8Eoqs9r/Nmm5/OmIY4m7aHzNerdRsD9EkK7FSpo
	TyJNTIc4tqmiO+/ghagzMsu5BtDieqY4J96vuMRwvigeNIPhGQYP8wKrHEYZGrLbjRQ==
X-Gm-Gg: Acq92OEyGy3Po32c5SpQqYQAI5jVumVTL0J6l18tqFMeiMAV/B2rAk4rt4cOSUa+/bs
	nT6DhGQdGTv3Dzpn8ozrbnsaSOzHMdnNzE52rd9l4EGFB0erG6yC6JKiW3RkuuOREUAdmwjLDss
	qmjHFVHmboOn5jZk5huWvFTx9Y3XSB/kRAJKmgcXSTuCcPSUquiIC6HwiIIVjLx22/CPpzou893
	CEmZNPimEpt8hprsdLoxWeHgrsGboMxwEcuKHpRY43Ti4kJBSmMwufMwTHShvCeKme/Ukg5VlYU
	56gj8eDv6CcM5CbhOLHc6a2pB3ynu6fTtoZHg5OHAU70Rs7sl1F/4GImuKzm2q4ob8LmjZb2ozV
	qCFAR2ypPWOgsZZq6k3HpTVqkWuLQd68zznV9LJiZ+fW1sMzWCoCVMFiHb/RK1/ljt9sa30pABE
	BjQ/FqcJDeRQQSa6oZSj0o8KNGSuaAYx4mVjhBUUqmLWgxfw==
X-Received: by 2002:a67:eb47:0:b0:6cc:8a90:9f88 with SMTP id ada2fe7eead31-70037cb32b6mr2469824137.16.1780789234351;
        Sat, 06 Jun 2026 16:40:34 -0700 (PDT)
X-Received: by 2002:a67:eb47:0:b0:6cc:8a90:9f88 with SMTP id ada2fe7eead31-70037cb32b6mr2469816137.16.1780789233950;
        Sat, 06 Jun 2026 16:40:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b98fddasm2695147e87.64.2026.06.06.16.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 16:40:31 -0700 (PDT)
Date: Sun, 7 Jun 2026 02:40:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Daniel Drake <drake@endlessm.com>,
        Katsuhiro Suzuki <katsuhiro@katsuster.net>,
        Matteo Martelli <matteomartelli3@gmail.com>,
        Binbin Zhou <zhoubinbin@loongson.cn>,
        Srinivas Kandagatla <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com,
        rosh@debian.org
Subject: Re: [PATCH 2/5] ASoC: dt-bindings: qcom,sm8250: Add QCS6490 RubikPi3
 sound card
Message-ID: <6svyrusik3lljjvoo7c27b6agr6ipivjxzeyyo6z5va2qaiatg@g4l3vcrns6hj>
References: <20260607-rubikpi-next-20260605-v1-0-7f334e16fea6@thundersoft.com>
 <20260607-rubikpi-next-20260605-v1-2-7f334e16fea6@thundersoft.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260607-rubikpi-next-20260605-v1-2-7f334e16fea6@thundersoft.com>
X-Proofpoint-ORIG-GUID: jw3wWvr92rPvVH0bo09-0Yeegr5N7CgB
X-Authority-Analysis: v=2.4 cv=deGwG3Xe c=1 sm=1 tr=0 ts=6a24aff3 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=Wdb1h0LgAAAA:8
 a=rWzc97tzM5M_N3PrT8UA:9 a=CjuIK1q_8ugA:10 a=1WsBpfsz9X-RYQiigVTh:22
 a=j5gyrzqu0rbr1vhfHjzO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA2MDI0MyBTYWx0ZWRfX04fOW+rSoAOg
 bUwu+szWrnEMFaMf9p396LqOCYGgL41H/hJEWT6RgaMUOq+K7p2jTLFK4uYrbEbjmUZR+MGzxsb
 c7Ac0aqR0cQCw6xF9+gaFNJc1+6kPFIQVUwOwGVFsPh+0jp+lBQvT+w1MUwEkH6/jABbqD5SkQN
 D6Cszlf5brmUS865GCLs5vWW89EpHBMS/jjDF1/8B63hQMCDiXiKPWJRbt8K7xW+KSBi9A5UIad
 S1e4uWNAnDpm1T425n0hWG43hUIUZa3oJdLEX8n3KrZkt3/vHQkbg0mbMGaaAVdoOmFkkMJfMM2
 3Ykb6IxwZZ6KFVvGn+IMiE3odi/m24uau8f2JArawF+/rwIvjn7/TarxsrFF/LbaTyT0xAS8gVu
 G62OhONQEAtrL3nBZQC0NUNCn9C7ASYHWzt2nes9O9qZq6FghDWTsFjZKfhDWMlxO20QojFBWS2
 zV618gZWj/WMhJ2rSPw==
X-Proofpoint-GUID: jw3wWvr92rPvVH0bo09-0Yeegr5N7CgB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-06_05,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 phishscore=0 impostorscore=0 priorityscore=1501
 bulkscore=0 adultscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606060243

On Sun, Jun 07, 2026 at 02:58:18AM +0800, Hongyang Zhao wrote:
> Add the thundercomm,qcs6490-rubikpi3-sndcard compatible for the QCS6490
> Thundercomm RubikPi3 sound card.
> 
> Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
> ---
>  Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> index 15f38622b98b..d95e072fab25 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> @@ -48,6 +48,7 @@ properties:
>            - qcom,sm8250-sndcard
>            - qcom,sm8450-sndcard
>            - qcom,x1e80100-sndcard
> +          - thundercomm,qcs6490-rubikpi3-sndcard

Would it be better to follow the newer pattern and define one compat for
all Kodiak platforms? Or would it be possible to use any other QCM6490 /
QCS6490 card as a compat fallback?

>  
>    audio-routing:
>      $ref: /schemas/types.yaml#/definitions/non-unique-string-array
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry
