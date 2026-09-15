Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEAF043F8DF
	for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 06:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789452313; cv=none; b=aimFJp7x4n1AdMjQWgMLBBJ9rM4S0mnlExh4E1d48AmrRKAZaH/x2jQiALZnJ8de4yNKDbxBLS/12xL0y45UiHrYiRu8HP4KXfErP+C/+StMJsclyislY/jvQPDJKhNfY3MTGWcnAJwLzZ6Vu5PZftVxaW8byEtTepb948KSwe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789452313; c=relaxed/simple;
	bh=lmbl0FDJ8BKHPU7iGiLSRRUOzdLjYSXjkdgoP2gRUcQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CpNICuXEp7YLFSrCrJl5h9a4cqsV5701fkpVTI+4EaClRL/QFjWcbNwY8GfdvYdRrGXOk0SuDhghmwnOXNYP+cTKBJK6lIkzdLCLZg+f0yPvy3p8o1LThhoufuxjVLp3mwTh38F5SJFg/lElCTg8ls3IBrBcXxrWauXakzQwaZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IYAr1IbJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eplEh6IU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IYAr1IbJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eplEh6IU"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F3RarO1758498
	for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 06:05:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+uyBT5Zaxv1RHABZ8zEG0vkgVxe7bFptHBkSRZjYknY=; b=IYAr1IbJLqKGHlp+
	8asmbPHttAf9fAPsgi74UFS+fWXB2zYMG+GRBUm85azZODOx/3pIAfXSSu/i/kB4
	5bwFbvagZrWPOUNgmUNmMOtSw2B3A8xhIMQ5h595xLXb77yE2vHyOUjIVCOCvKL8
	Yh9Oz+g471cIkF59lwAgs5JY5Fd7nV4JAm37hAVdwzirn29fwbNa+0ePm9SfqOq9
	G7NSkTtNk2EEt9l9nuba4rvDRUNDDOb6rM+v9U9c1h08OTLPQkegwsp/wKoqVhOs
	YXbk2bHC1haLukheqGRPl6ExyoQBrMgHSXBLv+lUOau6J3TMBsu0Bj5d29FWLNCr
	Q2ymAQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpx4s8hcx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 06:05:06 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e82060977so116912485a.1
        for <linux-sound@vger.kernel.org>; Mon, 14 Sep 2026 23:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789452305; x=1790057105; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+uyBT5Zaxv1RHABZ8zEG0vkgVxe7bFptHBkSRZjYknY=;
        b=eplEh6IUiJOfFPhYZk5XwfQUM/THdRBPQR+az3SFWSa/DjmaR4p7fFSphfJgZuZckg
         DjDE5sGS+cvmsXI0yHSKpRPuSUNAlRIsJw0SmVK/y5DRgmIwwgFMQh6GROfswDnO9fPG
         Wa41o4/UEYzZ+7lm0nX5zQNliAK/YLB5nl3DTiFXw8FY12oQNn+iY2Y7GyVRkorB+14C
         uEzV7WPluS4KJSq6gjbAbIVruaX2IS/DJLusk9XyE3TlGGQrAJKmSJMxmMQnSL8pBYEi
         NXh9BOZCUFeoFeAy9dcGLb047sdi2qSszxy4FaUeas6I5yyA/l0la5eqmYPjEAMbUtg2
         UEXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789452305; x=1790057105;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+uyBT5Zaxv1RHABZ8zEG0vkgVxe7bFptHBkSRZjYknY=;
        b=ePB/+F0HgVYHUan7BH8654tjVfOjxqJja12/ZjdwK5uai6rh/d/KxfoyrMp3P9WWXm
         wNmihFdq9tkOfDG2ibAzZzfLWX67sAQ94cm3LyJtaekDUmreEWMP/rh4UovxpoM5pF7k
         KVxKHMtZDjIeKs1pnOZ7XV9BAD89HQJNfIJ/kY77sXqZvsCGs5V3LBzIcNopGB45KEqT
         cExQevbctjTkhVhpYDBpmkhmGvzNl2jdmmveOMB+tQfWyYzgq+VHtkcF9AvICLouG8Pm
         qAx5/BlzKHbfB3IdMi9sR55lCbM3QvsUjmeS3+E5m27iAVm8U6NiKjfSOkkbAUwhElN2
         gNVw==
X-Forwarded-Encrypted: i=1; AKwUvBxYzIaxXCDBjx1gTANhjzQbTB5kwoaPKMdfQopjqFUPoS2JxiSogHLEnpcW5VyhX1PBPK4K5fOXrmgzGQ==@vger.kernel.org
X-Gm-Message-State: AFuF++mtKhz9QRgeHsquRqtakJgStje7HBJJzdc5LDT6e77nkuiKTdcm
	qI4C8NH0o2APCIqZcnHFCh50AqqVtDRDQNGBUSwUq4FQMcWN+6JmOrup7UBp2xrOMa1Y7wMlkt1
	8JYXCzNyYxbELjqTQQSfPGzBfCntLzUhMpf4bRDk7ijJVKNDTph/X9jhNy8Gwyg7Hpw==
X-Gm-Gg: AYBFou0Zum7HpuMpcstBSBYQ2vd0H7SDD3rmWY3BvdQ+xamOQtZ+XbFLkDCgIKcSGrk
	9pdb6qtwyGiSGciJYJqpWLSAZVOarxpOnHkmtIucXrVVJPKrqNslCGXcveH9sJYsxgKJHMR+QWt
	qCYvObk0IZ3fFc+WMUiS/954bqbnYkFqR7p0d4/6/MNkEQqZxlvvV/I5Zh7qvtjFN6uKaRNh74N
	6IWRMk509XJ2HNWc+YU65GKlyEa0yI0BIuyDfourZMP/q8ZJHMrqv56rFGTK0fJ8+gK0JavkLLK
	viqOQGr3b0cbllcAVIR7L1fgQQGGAih2eGleMalo8GMzCDOHPza5nrWizuew9j1GCAErxWosEzA
	L9pe5oFrYXPj9ZxAyvB+9Pvwq2Yib
X-Received: by 2002:a05:620a:7018:b0:93a:3257:34b with SMTP id af79cd13be357-93a346fa956mr323526285a.29.1789452305621;
        Mon, 14 Sep 2026 23:05:05 -0700 (PDT)
X-Received: by 2002:a05:620a:7018:b0:93a:3257:34b with SMTP id af79cd13be357-93a346fa956mr323522485a.29.1789452305151;
        Mon, 14 Sep 2026 23:05:05 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb3602eesm30648123f8f.34.2026.09.14.23.05.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 23:05:04 -0700 (PDT)
Message-ID: <18eff59e-e9ec-4c44-8d2f-f689bd5f1832@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 08:05:00 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ASoC: dt-bindings: Use consistent indentation in the
 example
To: Mark Brown <broonie@kernel.org>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
        =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        =?UTF-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Binbin Zhou <zhoubinbin@loongson.cn>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Khanh Le <khanh.le.xr@renesas.com>,
        Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>,
        patches@opensource.cirrus.com,
        David Rau <David.Rau.opensource@dm.renesas.com>,
        Shawn Guo <shawnguo@kernel.org>, Shengjiu Wang <shengjiu.wang@nxp.com>,
        Oleksij Rempel <o.rempel@pengutronix.de>,
        Yingkun Meng <mengyingkun@loongson.cn>,
        Trevor Wu <trevor.wu@mediatek.com>,
        Julien Massot <jmassot@collabora.com>,
        Jiaxin Yu <jiaxin.yu@mediatek.com>,
        Shane Chien <shane.chien@mediatek.com>,
        Daniel Beer <daniel.beer@igorinstitute.com>,
        Sebastian Reichel <sre@kernel.org>, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        asahi@lists.linux.dev, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <20260914093657.61218-2-krzysztof.kozlowski@oss.qualcomm.com>
 <aqg6VUKriyVANv6u@sirena.org.uk>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <aqg6VUKriyVANv6u@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDA4NSBTYWx0ZWRfX2L31lkMso4Mv
 D5+8kmAFnQp4+1w2JjGsI1kH7iBgP/qRGfwQpwaNVPoks+326HerOkrCsEgN0y1/lCqr+aOrK22
 pF0dOoHaLtQVSl2bWpnzNtQhBcbxYEc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDA4NSBTYWx0ZWRfX+2PGgrqMlqiP
 YCNBugEfETqh6w7YPFMMEH9KA8dIdyCZTZoml0PXJgB354y0c5oeoSjZ5IEtJm3qex9LhblksUm
 uqTDuqf7kZzWFWkoPanJ1+HD+XLI3x9AuiV7xrkokmGy2qAEpU5xWn/vKuqe2l+12wvPaqbxYSU
 rlPmsaNNRpXcQitP0YltLQfS+hrkCsxJkHCozWULFXXENgZxG22tQXBVzUK51bFKPDHDc/HTYb2
 0iUKmwmGX46BhBjmYRNkAqIqrf3qkiim/vLu9rFo+roHAHe4BJuI2cAD5iUZXjKIovioHa3YCl+
 091FaGKS7/q2eKl/YFdxxA6ZJTLxMfXKNouIrOx0S3yyG6028e8zK6dDNxtKF58lNEOu3ccw4e2
 yYMIoW/9OmskbAEqAkzsz4BZzAp7WXfAKl3lkFvuGFqNquhMCqXEOrmgnRf8mgwEW7f9ah8NoUT
 6TX6xgVAr0orJG1SKBQ==
X-Authority-Analysis: v=2.4 cv=HsDjiETS c=1 sm=1 tr=0 ts=6aa8e012 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=chZs0_0Ys9iI7aL1xjgA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: C_nXgzIz-wRVaLkDQhs9zW5qoZxd4HJx
X-Proofpoint-ORIG-GUID: C_nXgzIz-wRVaLkDQhs9zW5qoZxd4HJx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_01,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150085

On 14/09/2026 20:17, Mark Brown wrote:
> On Mon, Sep 14, 2026 at 11:36:58AM +0200, Krzysztof Kozlowski wrote:
>> Correct indentation in the examples to consistent 2- or 4-spaces
>> indentation to fix dt-check-style warnings ("example 0
>> [indent-consistent] indent mismatch ...").  Preferred is 4-spaces, but
>> re-indenting entire example just for that is too much churn.
>>
>> While changing the lines, correct also node name to be generic in
>> cirrus,cs35l45.yaml, cirrus,cs42l42.yaml and dialog,da7219.yaml.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> Can you rebase this against current for-7.4 please?

Sure

Best regards,
Krzysztof
