Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B60113290D5
	for <linux-sound@vger.kernel.org>; Tue, 30 Jun 2026 22:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782857411; cv=none; b=d5Oztsll9M4mUSnPoEWge7mLSmAqZb/tJTt9ZsVPnIl0q+z+qEIRplu4pYVgAVauXMj9B5Hg/YIpCPy6bO8rVvuHMLwfkiTIL31WEkvKe9Mom+zcW1glAzbGakgtw05PhxwR94zbWkc+u7pPaNvWTrm/NfNnFhdQx0NM+1iXiz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782857411; c=relaxed/simple;
	bh=lka07Gr3l2JawsdDoDkCfszFn1o8HA7+GaDRSGzKdLY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H70kP9YtfN/zINUmWGU6jY0yZI/KSkZsZh303tt37ii1o70AnRWAI1pZAjAjtl0d+nyUDEvosxhSq1k8Zqczaw6g82jYmKaknP4b1hCG/dhneFVNgrE1xatxNGFpo7lgh9FXJiUyyXRqbJJSsNct8xIcHlQlUQzgUCTYNN7yrdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UVVUyqEg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M1Nf961u; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UVVUyqEg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M1Nf961u"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UJDqoW2838634
	for <linux-sound@vger.kernel.org>; Tue, 30 Jun 2026 22:10:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	71yptdqayaVFzpJtAQzWI+qpR5NfHXrkWbz9ikn7Ryc=; b=UVVUyqEgI3aai44H
	QkYs6h4Sk/6/uPO94ctKOtJjj3n5+wTduu75T3lBINHDzCPeXdCe/LLgdz4BiIIA
	I6FCYJGuW6rbqCzG+PqGMHpMb6xjJcmfkHJt1PYgP/kntODh+X0VaaTTgDbDdP/t
	5mK6QuZEI5QJqRhPc//Uvx2PsEtojBE3Wf5jUoCGbxwxji82ZKuqfAGOBqi/CtJM
	MHsN9S66aTzRxKSc9r6r3jxLGT72P0S66dSuzw/gjfRycE/zeF8d/az8b9/+BxqX
	uSr2XsXere5zlNsaYwMjPVwz06xYAC/u+oMsdfeWvyWqnAZBEcPGno6XGT0scTZD
	4sRW/w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4hbd1g5c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 30 Jun 2026 22:09:59 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e73fc29bfso898585a.1
        for <linux-sound@vger.kernel.org>; Tue, 30 Jun 2026 15:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782857399; x=1783462199; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=71yptdqayaVFzpJtAQzWI+qpR5NfHXrkWbz9ikn7Ryc=;
        b=M1Nf961ujLcLPcy8KqnChld6ivvdaWxZOjydBk/ps6FPakJtWrP9ltZCqPkWJfzPSE
         smwjKLt8U8cPttpkKoe6RVWGgNfNPxcnSFlsZUIKNFE5hNM/36nnc+tbPgKSNDZKP5QV
         kfbvsM/2wS+3ULz2hrkrI3X9bFFDtYrDeWpN9i7nXmp7QjFd29zxngAcDoa3Zt1UvGqQ
         6eEXdYRlJf8sxZCKxLIit5C8fIgBrSNgQOazSR1vlydSS3otFlllnoFxMdHKeKC698lB
         alKIgQwrCmLJQe2xZWTZJGpGX2QE2hxVbmXeFd55fS3nDQqDiAkt4gw/wRDZE0cwRrAq
         cwVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782857399; x=1783462199;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=71yptdqayaVFzpJtAQzWI+qpR5NfHXrkWbz9ikn7Ryc=;
        b=LCbrUhH/QLlRxOmjdniwwkMfsIAgG9v9/YbBx5nOsP+LGhA5O0NAYWWL6o6IJ7bo5t
         vOdrBopNeTaM164G170/dtn3UHXhzFcrtQpHxGpHsMk1+VWfrFDHvzXLV5qu38yqC/6o
         lCe9mgzrmiug3cZYcCzkhd5Lm1WvwDpmaA4OTV/ov3hSQEp0D66cF3Nf8LVRgYBDtkBn
         bWZ0j4AEwaUqouXZqFIUgUbRmDCVVO5lGTMJYj1xkqfq/S9PM0czqm5wxrJtOHmoj02J
         zyLepVS4zvMhBRV+a/zZuHBTsQvQ9uQu+17kpZ5wQfGfj5onBvTkeUd+UQzO07LpYzIq
         zQgw==
X-Forwarded-Encrypted: i=1; AFNElJ8bkC9LbQi1F5JdGr1VXgA1eqzfFHzOA18ca385rOBF69MV8mPYw71ukMbTPtUHeFI3YsEdPBk41Lp3bg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyImUm3VfW1d02r/Rv8Tv7iPMWBXVEIsz6ljYAofaeq6E9wQcRC
	+Mc+VF9Vb4A6ay0N1uvJYtShlHLuest5XHm1N4Ozx1c7kB4jGABt8+xjpB4tPDTXxItXb2iliOx
	wFC4TDfeOL3l/8ssfn9Zwffi4wXho/cA6WPShOduGYU1aINuHLEuY35gMuOi5iQVrAw==
X-Gm-Gg: AfdE7ckr10Zl7766x9hHIC5aqK3m+z9EFZnSkn+ZUcMr39PDcJfj+XMGEbONqlxePyJ
	uT+aoPGDrtwEkrYowMnWBYUTVeGHPjqw8PasiklsxTOGrK2ctLXSq0gIrVDaK/07USe2aAC9lfl
	EMnhP7xTGVMKmlK9K3ZR3lYBoQ4QT7SXbObNs97XjaBmQxBQwTqbCbcyTdMEF9Mo0TIogdmKzyl
	hp2E12eMKt77lsCnaGtaqxmmIS5kfa7cNlvSEHOvboKhCnKX7rtJ1m37nZJ0t6Q8tFoaUxSfZ1R
	kP3Gwx1ygq1mg0h6URJxdC16Zf49cGqqglyfyzO0s6t71PVvjFPZSZBdQemwe7gJjGqjm2ay03b
	urLpreLQx/B5T/KnVYtRQN7YuxbWy2ExjyYuyseJ0UUB8r2Q/JfBGKn7oa0Zosg==
X-Received: by 2002:a05:620a:468c:b0:92b:6805:918a with SMTP id af79cd13be357-92e6d926a2cmr434252285a.66.1782857398122;
        Tue, 30 Jun 2026 15:09:58 -0700 (PDT)
X-Received: by 2002:a05:620a:468c:b0:92b:6805:918a with SMTP id af79cd13be357-92e6d926a2cmr434238085a.66.1782857396955;
        Tue, 30 Jun 2026 15:09:56 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47563d195b3sm11865243f8f.8.2026.06.30.15.09.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 15:09:56 -0700 (PDT)
Message-ID: <caa30078-9dd0-4f07-a206-2dcbd2ba09a1@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 00:09:54 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/13] gpiolib: remove linux/gpio.h
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
 <20260629132633.1300009-14-arnd@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260629132633.1300009-14-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDIxNiBTYWx0ZWRfX03Ac51EwFFED
 2JFdu8YbwiTFKul8CJR6skB6HXHkYf12TQMiTfbHcwKia6oA3Ob5izyBtkzkb1KGWR/iCMYgWyA
 TaECJVXI6YE3WgGwbKcxAvzOHdXz+0k=
X-Authority-Analysis: v=2.4 cv=MpJiLWae c=1 sm=1 tr=0 ts=6a443eb8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: BTR9AhroXOWA0S7L9TRDV-3DmIsU5XAc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDIxNiBTYWx0ZWRfXwCbk3swtqTQP
 gbn34OGALqd3CqDd/ug0LxWpe80KdqsVF3FCoifYcTRhzLLNVq0rFSukn/CUZRKH/JL3xlncyk3
 hzWcpreYoAVTnPNr10CgW9YD814FwD/yht6SQWzEb5HV4/EC732mh/X1jM61ac+LtqLcBz5ik9u
 uJfi89rB7+QlMP39j3CuPGw7lN3JKozco577smodhXn3Sv+ZFGLn0Swumly5jnKYpI9CO0BhQMY
 G1tgiygqcskCzuMMei6bXAJvNMSDLNvfqEece+GZi5pJSngYr8ZPgu5mMHMemVQHlZLD4uG7mCo
 NtNRpDBQhv9Cj5s9sgSxiP3cTO7oza6oDZ3mIcxCi3PjlA8Rb6GvDxnp1AYs3RcmqqpFuKbYM3f
 5FOce/jbyoou8FIoFhjUKxY1QX0Fbyxqrwqm0nIfWSQcNMBdViIhr8qyttqgtvw41eXLtPnhceD
 Ohkt1/8vkgLMjlT7A6Q==
X-Proofpoint-GUID: BTR9AhroXOWA0S7L9TRDV-3DmIsU5XAc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_05,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1011 impostorscore=0
 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606300216

On 29/6/26 15:26, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> After all other drivers have converted to linux/gpio/consumer.h
> or linux/gpio/legacy.h, remove the final leftover bits here.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   MAINTAINERS                   |  1 -
>   drivers/gpio/TODO             |  4 +---
>   drivers/gpio/gpiolib-cdev.c   |  2 +-
>   drivers/gpio/gpiolib-legacy.c |  3 +--
>   drivers/gpio/gpiolib.c        |  2 +-
>   include/linux/gpio.h          | 22 ----------------------
>   6 files changed, 4 insertions(+), 30 deletions(-)
>   delete mode 100644 include/linux/gpio.h

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
