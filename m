Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 203F231F997
	for <linux-sound@vger.kernel.org>; Tue, 30 Jun 2026 22:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782857302; cv=none; b=HWBRnU/JYyeme2GNFtMYeRx5UWNaBbJelt1wIa7AKg5UCQ5l7NOKT4YbwzStS5/DAePaWsyMHWuIYC21Mp6YDY5xrRx1KP/nWf6UZMUe87+k3VthFIjrJDGEwODz/rFI6h68rFWKB/PffHOqhFIoBOWeOpuri0I/1NBA9MxPD6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782857302; c=relaxed/simple;
	bh=XWXB5lkBc/phatIESF5YzvRqacHTijEtNRuYnvo2MIA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uQSTJ+C+PVgGTtmwlNlyZ+znVYv5QqFy0kITbSrZrLp+yqTiBe81YHEgAPLtQ9++XHUAO7KLbAabmnyoWk3e15uLwv+2Ld04um6+4qj+fFXtHcl4+TTU+fIo0KeKWK7VCt2ti5knpMMuFAKHSjj1iEhPn7dDuije+mU2v/GVz4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cCTN+vD4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M5IwW6Ik; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cCTN+vD4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M5IwW6Ik"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UJE7c72948857
	for <linux-sound@vger.kernel.org>; Tue, 30 Jun 2026 22:08:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BcCIhz6+fnrglONp8q+fp9mef6PmcObbxRhKXStO7Qc=; b=cCTN+vD4HZwmI8lY
	ejqu7lzDeKTXwqFAMS/sTRNpvdMoMiAxUyoiJA4eFhpTgRLfRvMGXkbNO/sLcOq/
	Kr+o5qtLY8bZPydk48LmdD/QYhha9Mb3Zu6Jg+jFbz2OOi1lt4JlAnzouxfKRufJ
	1vGYuxgbkXfYsDebztJs91VxnfPK2OfyBaisU1JmguWpqdxoLPcaXic72syA9QUH
	lQgzTeaDRLIA5CkABN64XzCZrZhXKelOBhJ4L0wGngzhGDLoUE7KBunhksmwlV73
	6OwRuUZRp541lZkHdVRtlTvsEu9R7y1qiVobl6Ek9AO7twcGrKJzrgt8SbClgnEU
	dlxizg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4h0ask3c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 30 Jun 2026 22:08:18 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e5e38fbc5so459445485a.2
        for <linux-sound@vger.kernel.org>; Tue, 30 Jun 2026 15:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782857298; x=1783462098; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BcCIhz6+fnrglONp8q+fp9mef6PmcObbxRhKXStO7Qc=;
        b=M5IwW6IkHK0iiF66T0HlZSqYBxXV2G7M0IeKaGSbbe73F0yJIaWzFqHevIJO8uzIpb
         NJpZ5komiQgwZ5mg1Vn89GRH2bf9vc3fLtCX/yZzK0wZgX5F0ellNrWmqv9ZzNnIQxK2
         SebMjQrysqRIXgyl/cta8uiRcj7xmyCOqMJTMei9OtRlUg+Bo7kqd9TQ0ePHWoUgrR1s
         RSwP+bXBvQp8qpFWg57bFTZfYrj3FRHPWVaRSHNO46r1gP+HHFGe7nhiTjazcsh+NwrB
         gSvXCfwZirBHtsae2T5Y4kaenRQArPYJ7Aq32plSwlH1AyYSdRp27EPcvPiicehTslAI
         W94A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782857298; x=1783462098;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BcCIhz6+fnrglONp8q+fp9mef6PmcObbxRhKXStO7Qc=;
        b=XFc6GGE7m1e1DpPDoFqi53pLtitaALuPeEp5Hx05mhtiLC70LemeYgD5lwRBDrK5f+
         s4ClaGTzhrYQOymYk421R7QFW7WkIXEY2B7NFa5z1ucW3IxZQnhTcyznmrlRE8/lJusz
         a1sczFtI4ZTTFDZQH1/5M8eacOcQsnGFhYqWyW61iEMpMANpRvol8pAu0Qe/6KnX2VvV
         x0zYtVskAXKib/DilqA70vMMRy5AlIqC/jtmrDXs66eTCXJno/qxsChtXWpGszz6FKD8
         h3DRN5DaUmY+DPxdVHYqi1D+O/OVUYguna6B1dbDZVrM2gaOUbr+XUmJAa/Qs+MyzJQj
         W7kA==
X-Forwarded-Encrypted: i=1; AFNElJ+yXmNQ6aUvbGKk1Zkz9zK1e5Dbuu0ZhPBU4pLaaB5sZ7iVK3QadTu2Azr7MMeMp0MqgzSkkFGfzoUQLA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxvpVH9SY+50eWhmlmcHHjFwmvDH3AlYRsL77ofneaIOoCYiGWx
	QGje7mahcmS5fnkJo4D7umJJhY80fX3IsRZjK/gaKobbnNFRN0iOoLPjqnU/NHnxgeZQRswsDU9
	r5SJET6c29++BdGL3ttDLTiqXAKXiBQu/wlch3HXsuvehtO+G2GdmK/ykzm+AchO51w==
X-Gm-Gg: AfdE7ck1Pga/OhMhfwEI136dhTtrrx9HXpIDBaJnvYjSeiebuw5HYEIh1dw9yHeovMy
	qATMAv0zHpSGctsAk1cqWAYuzHVAR1VNv2RCMF3IkvfIwGbcPELNDpIObT9LB6YbSSvWzv6lVVV
	D1O962H5vqDcG8+KAwx+ybENUYIgddO59rwf+ifMFhY88BwNz0/4RhqjOm6pnR49sAsSjZHluGh
	CE1B4biSJ0k2lYvM0H9VxboPypguEtZ4zuOtmyK3Nwo69asEb0JQ9g6uLGlRWSfMvEsN1qKifZM
	lpUSQlNAbBNTYfTvhs5MzH3BgZz+HTt0ES3biuXAqIOxJ4rGeSTSztBkOrtCnSSxjqg5ruu9zZa
	qwnTUljgQ1HDi8SDSkmid81ljAns2ZxXUg0zL7KJQu4+QzKKi+OFjJTqoO3q0IA==
X-Received: by 2002:a05:620a:25d3:b0:92e:5c56:727a with SMTP id af79cd13be357-92e627fa3f0mr909679985a.60.1782857297834;
        Tue, 30 Jun 2026 15:08:17 -0700 (PDT)
X-Received: by 2002:a05:620a:25d3:b0:92e:5c56:727a with SMTP id af79cd13be357-92e627fa3f0mr909671285a.60.1782857297248;
        Tue, 30 Jun 2026 15:08:17 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4756636cf26sm9903482f8f.19.2026.06.30.15.08.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 15:08:16 -0700 (PDT)
Message-ID: <9c94a0b6-a2e6-4d3e-872d-b1d3954a4071@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 00:08:14 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/13] mips: replace linux/gpio.h inclusions
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>, linux-gpio@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Bartosz Golaszewski <brgl@kernel.org>,
        Andrew Lunn <andrew@lunn.ch>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Frank Li <Frank.Li@nxp.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Hauke Mehrtens <hauke@hauke-m.de>,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <zajec5@gmail.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Linus Walleij <linusw@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Dominik Brodowski <linux@dominikbrodowski.net>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, patches@opensource.cirrus.com,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linux-sh@vger.kernel.org, linux-input@vger.kernel.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-sunxi@lists.linux.dev, linux-phy@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-sound@vger.kernel.org
References: <20260629132633.1300009-1-arnd@kernel.org>
 <20260629132633.1300009-4-arnd@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260629132633.1300009-4-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OuF/DS/t c=1 sm=1 tr=0 ts=6a443e52 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: WdScfP0NKZ6tPWqwTVYD1fhSuKguhhv3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDIxNiBTYWx0ZWRfX3r0wGkQLGC42
 5VOv+R5+s9ay2+ltE88LlrtrjZShaL/haPJqJIMKByNlZ+F/HAhHfN9NbM7nSSxe1IjEkK7rtrO
 35RmytE8L2f+lHb8fgBOOk2jv1x7EAs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDIxNiBTYWx0ZWRfX2enk1OVzHKcW
 lWeNH9AzUZMU15aW8X21ps8vxP7g76tdrNbrfk3KJVbGh2qwl64ZeGtns6l47GXGI+Q5fcRogpF
 mOuvwjsTfT9i2TNQEVax75bsyxZLA0UCgUK3JqcDjxM5iu/lotXL4bPaR10HWBLfzmig71xRC2z
 rWw/2ukd2EhRW7G4r4xOj57ZdF9axWMopdYD0PDTZipHuF7VZDIZFr9QNncloVp/obTJHN6NrFE
 SoJhI1ncuh0zw2S8Jj3eNNQQVk/XJEl6dbiY9ZC7l+/WVkIFIWlyuYGAZvO0G3WfAGHO6QrRW/n
 6nGpJDX95i2IvGfXdJUIQU6rXEaetSPt5U8YE4NcCmBYVgen6quG13qgurMdpqh0xZjA1B7acZN
 nhkrw7isetfQCDIxHPAxASYFS7WDjKrR9D9J3trUpQ1gfHK6/jcYlPLqBCaDjTfwla97AtGlLEn
 FSqALRntZgITp5OzdIA==
X-Proofpoint-GUID: WdScfP0NKZ6tPWqwTVYD1fhSuKguhhv3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_05,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 clxscore=1011 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300216

On 29/6/26 15:26, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> linux/gpio.h should no longer be used, convert these instead to
> either linux/gpio/consumer.h or linux/gpio/legacy.h as needed.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   arch/mips/alchemy/board-xxs1500.c                   | 2 +-
>   arch/mips/alchemy/devboards/db1000.c                | 2 +-
>   arch/mips/alchemy/devboards/db1200.c                | 2 +-
>   arch/mips/alchemy/devboards/db1550.c                | 2 +-
>   arch/mips/bcm47xx/workarounds.c                     | 2 +-
>   arch/mips/bcm63xx/boards/board_bcm963xx.c           | 1 +
>   arch/mips/include/asm/mach-bcm63xx/board_bcm963xx.h | 2 +-
>   arch/mips/txx9/rbtx4927/setup.c                     | 2 +-
>   8 files changed, 8 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
