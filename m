Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794912860;
	b=E5P3ibRg1sqglLKMW9l/WuZQNQlUi+BjmFDSApJeSeC1n/qEO14ce2CTrgfIpYestktq
	 FkQpDFvHP8wlFMSlrR1HxE9KzdPdCbHnhjvMd0QdrOVTmF7q+tAWIy169Rb1wrgZRu0y0
	 E4rIi2dDRGMXLNOF9cN8Gr/exWbhyPBT1S5KNZbv6l4FtCK/8LFVU1nBF7XYdJz6MD1B+
	 BR7c7CT09ss/w0wqFLuHU+IUC42/01S7NXR3gD0orCnQpMg5BcwqNdHyeBTb2i5HBTiGe
	 TYDrHOo7iIku6BdOD0XZG/GnYTqOOFdXcBYZhMH7KmC01npqpgnITD7UBLqF8IKyg+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794912860;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:From:Subject:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=PTs88JOJil1zv+VWb8/Lu7bcOjPi5qntSr6+ZYlo3es=;
	b=i6DuiyGK4R+AmiwLG27HX13+KQO+tKnMS6PdnrYnNVbZKnILyhywZo6L80EtkrTujA1F
	 yubCd13qWKQnlMjxk9yqmR51eR26Nk8EoCkYHDgguhSFJJNCXjex10omg1ap6xHVWVrHh
	 7pR+8YFGnVZXgRpLEJWow+pIOYaZKS0GPqP6hwAu5uFHXuCECjygZh8djAJgT15glh2Ba
	 Hkt8Ke45LO2/FsRDzcdhR8+mIw1kjyg5+pDiB/pXerithoUpTJAyzhueHreLb8zL7qYzG
	 iIsuWOki2bTV9YP7GgczaQgBZTu064oFkvnEhryIuf8T7o6iSXirCA5Y7P2j4sZniFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kCahjSi6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iHGYNylm;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7637606A323
	for <linux-sound@vger.kernel.org>; Tue, 17 Nov 2026 10:54:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7637606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kCahjSi6;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iHGYNylm
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH6f6Un2998730
	for <linux-sound@vger.kernel.org>; Tue, 17 Nov 2026 10:54:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PTs88JOJil1zv+VWb8/Lu7bcOjPi5qntSr6+ZYlo3es=; b=kCahjSi6w02VUeNV
	5fcTXcwuAtp0kRlw9hStmd82TepvvMihOQWopWZe4Yhip9S3uZZiyFcxAo6IkEBk
	fvC1poqVj6NAmBYa5lwd7HPY5PjXywXXNhV5EGPUmupVT0gsA1Lh8rPmKdg588F8
	tymi9nR5vlAIVvdZ7XEU4Hfk8WA1v8p4dil/l2jugCa5UqgvakcCUOlujTWog3Pk
	q++E1XI2W1ev4/CyNIUtJql/NYF2qpUKdYjAYfTBH4g7ffeqqM14RIrmX4rGmf1O
	ZTGqFmmD2MQKJXQ2zA9OgjIu9tV5NgH/Tm1MtDYWSUm3mYHTiT8MI0K86Mg7MqJG
	aml3Qg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0hve113c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 17 Nov 2026 10:54:18 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f559420f3so479268085a.0
        for <linux-sound@vger.kernel.org>; Tue, 17 Nov 2026 02:54:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794912858; x=1795517658; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PTs88JOJil1zv+VWb8/Lu7bcOjPi5qntSr6+ZYlo3es=;
        b=iHGYNylmyrcucxp3n+uY47EX5auxsi4rEZ5Ed1YecEDylDyIbKqk7EeAt3gi0vJ2yF
         9r7NivToy+k1/c+2/u/yWXKPeOoHqW62SW+qB4MdV8j+jaMrH/uE/K+kH+pGY/m8WwIO
         TGtTZYTQXT4H6cIqPlepjKguoW1fDrkcQY/OXB0UvOaGnstBfINzcKmb4OTCb0iuUbJr
         NXqJqDcKQGR8eo3F8uUnXexwGCFiPS0s96tmJ86fEkFKqqyN6lcP/PMZsUxknbvfJzu8
         Qps9TMkITz7ofCqxdMwXEWFEXRGQ0bbLKS5/zku+0rB/ZpL162b8Ph/XOFoOewIVcjdP
         JhtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794912858; x=1795517658;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PTs88JOJil1zv+VWb8/Lu7bcOjPi5qntSr6+ZYlo3es=;
        b=R2cX/r3LEugZOzn2M64/g7Hy7BnNdEm+lgaR/ngbqBkdVECZf2KU7MA7VC7xIxFTPg
         DY1rYpRfCMQ2phhr+YqovR5tuOvPm4aFkjioRvGhaagPGVrmIgjDpFLfPWXy6++lGnvR
         Gaz7cpIJWx/C5rFWBcittIRv1Wwup9T+Rp34SvRdND/vbDgLD6WSOsq3phtYF0U/qSa1
         K1cJwldTAjgBLSPwyJwF2hPeWzQ7/4cZjGNuGZ/A1cIJ5ilDiw3jjGA3LAhapyuL3ZdL
         Ia+gP0WDknWHu9Ns/UpChXF55AOiGAxAVoj0tzqFKF6/fZd92GQV15lP6u02BjqcPke4
         tHRA==
X-Forwarded-Encrypted: i=1; AL+hErEsmFsGmS5Okoda51RfNkNn54XDtpynspqL5Q30932JH4Hoi1a1I7X0Vy6jKdO4c7/zn+ZG44n/JOw/Bg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8ViejkC6+lCcYfF5+4/jd4exSlQ62gGj2/uJZMBSwyXaUMvmjf
	dvAueAU0KWXv/UXJUe6kwjrenyh9VLknuIyP6aDRA/uVFICXrgqOyTfeTsbnnxR4l/xgYrHCMgA
	18w1M6Te5I8wGXiYrZIWN0oghOPIzysTwHtDHeczsuXIR1iJWv0X2cEtfBrrJ1NtMow==
X-Gm-Gg: AYBFou0dd7WZMm9D3OfDGHpbrJoKzGmeS6XZyGeXesysix0Gx7bGvZNPLwxtVp2wSZE
	fHYDx/GmRxULSFxbNtYS1U3rRJPpLp+el8xD/tWFNlCZA/zuLY3AZqCfZHjkS+TIvns2UrvbEtE
	yQGdOetVDBk8h6arStZOQJlU1xxc0H2aS2u/n2FfdHrSFZ3jlJT55mzCchZ9AMsNYApqD2HAYcp
	aeV3YVCSg5XS4xTRdBp3opsd9TK/fA/+XrLnDloWCVLeDPdrZlzL17a9szCVdac9oPldk1oSpcX
	/lwnwNogMwh+OGwsRFaT7WGmzswW8eOCm+q5Ghfn22art8H4CqzjeRN4LQ26LQ84O/uwWAy/LYq
	33L6D9ycujJTQfwl1JyM/YN8kcH3Ao7IM+808migG7OBt2Qai7f/ezzDxSLUWTI7JBkjB
X-Received: by 2002:a05:620a:1a09:b0:93d:23b3:5088 with SMTP id af79cd13be357-9494bb88e1emr2137094385a.16.1794912857672;
        Tue, 17 Nov 2026 02:54:17 -0800 (PST)
X-Received: by 2002:a05:620a:1a09:b0:93d:23b3:5088 with SMTP id af79cd13be357-9494bb88e1emr2137092385a.16.1794912857208;
        Tue, 17 Nov 2026 02:54:17 -0800 (PST)
Received: from [172.20.97.137] ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783f8220sm58576545e9.5.2026.11.17.02.54.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 02:54:16 -0800 (PST)
Message-ID: <d5ece1f3-b70b-4c70-aa52-cd0d00253ea5@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 11:54:15 +0100
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
From: johannes.goede@oss.qualcomm.com
Subject: Re: ASoC: rt5677: Do not apply Yoga Book ACPI GPIO mappings to Samus
To: Ted Vera <tedvera@gmail.com>, linux-sound@vger.kernel.org,
        Yauhen Kharuzhy <jekhor@gmail.com>
Cc: regressions@lists.linux.dev, oder_chiou@realtek.com, lgirdwood@gmail.com,
        broonie@kernel.org
References: <CAFd_G9guhtVwE1aaFOXE3Ab43BAcwP3RBT=R_SdZ2KDfXB=LeQ@mail.gmail.com>
Content-Language: en-US, nl
In-Reply-To: <CAFd_G9guhtVwE1aaFOXE3Ab43BAcwP3RBT=R_SdZ2KDfXB=LeQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA0MyBTYWx0ZWRfX+BL6H7+CGwzg
 xvYbTUjwyiJPzbOYN7bvSNNP8dyEvBeyeToOL+zKZyN/STc1qVoSQ+KiJrO5msc7lBKe6hEB7m2
 jhterULk+hiZx5o28c6EUF6fTwiJMkk=
X-Proofpoint-GUID: ad4e1_YwoXxrlm7MsXlliLRPtBxuczy_
X-Proofpoint-ORIG-GUID: ad4e1_YwoXxrlm7MsXlliLRPtBxuczy_
X-Authority-Analysis: v=2.4 cv=dqhOmFg4 c=1 sm=1 tr=0 ts=6afc325a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=dsTg57I5qmWE0NA2W7kA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA0MyBTYWx0ZWRfX3mdbVXR+Rw89
 qMZ2YX3VML42vHV9FmEQUSV2rs14kVygAaJLSt6gDLrKnC8auWVCB3O4Mg0NBURHInoug0xVZqb
 FkCCOAzwQKvuA2/AAPMgAeWwq02QP05/5fOr1ugzWTKb9P/VSkqWYsYR9HOYtUU39zuKUGzE6Fy
 cVGg8ovpiexGL9gMbWz9IC7iOAKbETOKI6v70tU63Q2r0kNIr8n/xELQUVnqPKxqWvMajemAmZ+
 g9Ylwyz2euRxAQBYEHwvB8CE1QdKA6VZ8V9zzd1Vg7iLiky1xRSGGJ4MwGqZlnq3M49ZBqLOf/O
 ICEP96Tiz+UYHHE/3nda+FyJ1nxaKkRpi71q+9xNo+hDljswggZ3hl90i7nSLSJs1RF9b+/2w8e
 5l7swRwG57v8CuL0F4Cc94DX4a7rWB8enryvlpgfNJBaYmyoCzNe4Josk12u6yQ2ENklyDtFHhJ
 /Dl8QYgCUizpyZzdCTA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015 phishscore=0
 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170043

Hi,

Note adding Yauhen the author of the troublesome commit to the To: list
(why was this not done in the first place ?).


On 16-Nov-26 22:24, Ted Vera wrote:
> Summary:
> On a Google Pixel 2 LS Chromebook (Samus, EVT2) running Fedora 45
> kernel 7.3.3-300.fc45.x86_64, the RT5677 codec repeatedly fails probe
> with Failed to request POW_LDO2: -517 (-EPROBE_DEFER). The codec
> appears in devices_deferred, no RT5677 ALSA card is registered, and
> only HDMI audio is available.
> 
> The driver’s ACPI GPIO mapping added by commit 0cc00de3dd5b maps GPIO
> resource indexes 0 and 1 to reset and pow-ldo2 for every ACPI RT5677
> device. Samus’s DSDT uses those resources for codec GPIOs (jack detect
> and mic-present), not Yoga Book-style external reset and power GPIOs.
> The driver requests the mapped GPIOs before registering the codec’s
> GPIO chip, which appears to cause the deferred-probe loop.
> 
> Test and result:
> I built a temporary module against the matching Fedora kernel source
> that skips devm_acpi_dev_add_driver_gpios() on DMI board Samus. With
> that module, the RT5677 device bound successfully, the bdw-rt5677 ALSA
> card appeared, and laptop-speaker audio worked. Secure Boot remained
> enabled. This strongly supports the ACPI GPIO mapping as the cause.
> 
> Suggested fix: Restrict the mapping to devices whose ACPI GPIO
> resource layout matches the Yoga Book, rather than applying it to
> every RT5677 ACPI device.

Only adding the GPIO mappings (devm_acpi_dev_add_driver_gpios()) on
a DMI match of the yogabook sounds good to me.

DMI strings can be taken from:

drivers/platform/x86/x86-android-tablets/dmi.c

Note there are both a X90F/L models which ship with Android and
use a different BIOS, as well as X91F/L models which ship with
Windows (same hw, different BIOS).

Yauhen, I guess the ACPI mappings where for the Windows X91 model,
since on Android I expect the GPIO's to be hardcoded in the driver?

So the devm_acpi_dev_add_driver_gpios() should be only done
if there is a DMI match for the X91F/L models, re-using
the DMI match strings from:

drivers/platform/x86/x86-android-tablets/dmi.c

Regards,

Hans


