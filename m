Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 265473E7151
	for <linux-sound@vger.kernel.org>; Tue,  9 Jun 2026 08:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780993038; cv=none; b=CI3SqRmRtY9rmDeUzLtzquHVpLrqNqCK7cWYHmGAKQ/VS1qr8GA1HICqku5XCR1bCDe9qJ1HJN1zJ6S7kcd6pTCx9BCjTi/dpU+wzdvtnc9+wDZSVvGlFZFdvqqCLzpOhb6iPVqNyh8fqa+FyG4A42ZbhH2kpB8y8whdHgHrG/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780993038; c=relaxed/simple;
	bh=TV40QddrINlpCUTTEiKswMyWUvfxvxSh3PSqLXs8umc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YMi/Xz6rWlwO2dEc4wqWkU+YJuQ7TG8wMRElNUrDCBbmRXYQMwp13JG+Lncb+WZ+UHUp11SAirYUDEWWHN6pOpytHn+ksFaZqMKHPoytVKfYf8MEwOUoEhYeSRAeqGnFwIOoDkO/cCTY/Iq8tnTzr23lVTFZqxI9ILbGkO63D1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fJmc94Iy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Eeh5VbQt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fJmc94Iy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Eeh5VbQt"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6597rfJY1568412
	for <linux-sound@vger.kernel.org>; Tue, 9 Jun 2026 08:17:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sxB2n01woV4QsbmdmcZOd7bbnfMgTW49Ubqboyavgc8=; b=fJmc94Iy3At4AoV/
	Z47ZM/mtQUlkKGRXsoFB6dhYp6T1Z1vPiPJwKq8+grs6Opk9Z6jNPuCmWEx8F5wY
	Gfip3d/qRnJMiUoPYtZT9RNzI6wMLxGSc3Pn1+/jH1g54+FOaZiyUKslW+HGvD0Z
	zF+4aruZzs5114jrAb22smC58B9/XW7Zy6jGsW+3IMv3+BXpCadbf3EMXcWoU4Gs
	69DWwXC+CjYjmLFu36Qn4ztGVoh7Qshfm3gvYbSXDRH1vwVq6ns8ezIFqT6ockT5
	ZJR1VdEQFwt8bI/D5lhpSqS0mhq4g9u6nkw+Qxno+ZNizgu6N3L4t/+UvfzUrMT6
	lJ59gQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enxx45t32-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 09 Jun 2026 08:17:16 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-517647fbff1so17727621cf.2
        for <linux-sound@vger.kernel.org>; Tue, 09 Jun 2026 01:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780993035; x=1781597835; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sxB2n01woV4QsbmdmcZOd7bbnfMgTW49Ubqboyavgc8=;
        b=Eeh5VbQtCOTwSDO8YDMcCqitzVAu3uscZHY+CitwyNsGkR+TeSYwHiAJfvh2Y7IojI
         y7xdFgrU3Y/Si4L+O5/zMArS8Tq/XqAtV7ydrFPHIl5xIFVD/SlFp1R/8FKAW3ifvXqg
         +NVcwrS+iaVnHJLzQ+BU2XAV7wljbNg9cJVwia+Wu6ihgu7vHx35QWaR9sVkUXFYoZb4
         bInqgo0tT8a5bZpuObrJ2vaqBpeJdKGEBvvEUnDlz1ckxseWjflDDuKBZ9Qm9OQE9fAP
         sNYoKGvIZmHu6ER/1AH7wSeLo7vugWpUnavXsR0/zrwU0JFh07LPG4n1QzwhZlrBFUmu
         lUvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780993035; x=1781597835;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sxB2n01woV4QsbmdmcZOd7bbnfMgTW49Ubqboyavgc8=;
        b=Erck7gMZVJwn0UcHi/1JFqKy1TSxOqjp/YESkZiMmEMJGqfN+cO3ARZ5JVLS+U9f9e
         iGdlQJiJCqrQdn9S9iggOcLgj3PPwqkE/P1OWkmIQ+hJKyR1+7du/SqEDMIeehe5oRHI
         WfTDMMeIw9EEcyfljbfb/x3LhXeeIFjHlcdP+D3OCofXeJKdJ4A41ONID3WWKytjvcLm
         1lFvmYX5kpyQCYf9Zm8yWx5WGuSFNZHOTSrHnc5inT56cm6CbJh2y8oVPsu2x1TCruxT
         FWN3Bh/IDgiLg0JCv05xd0GsyTOC1aOowfh9ZRg0HoASzsOfZijtYqfqyMKe/OowxBxF
         vCPQ==
X-Forwarded-Encrypted: i=1; AFNElJ9WheO6BVymyWqxzLbKl/i10opIUhu428quKz/Dv7LMYvL3omTl9mVKpdi3QG9PvJSwLMFBAoHQxRsg0Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw294VKAgVs6FwY6ZVkxRHPoJmpeD+QADimKONVIoUo5E3Uad4T
	878M5RIEubhZ8/AmqKS7dBRDsCrizxa72yUhiBbDJaUh8UAUjUNmY/aUO0Yw1HP+32cLtfIhjC7
	ACxCFaFptoyevPF2Ut3fQqQkJCW8AP1Zhv66FIgfbZqmN3JoQcL5DjXzHFrn51xD53w==
X-Gm-Gg: Acq92OEEfjZLczN/qhqfSnuY6LGTMQLnL/ECqHswLrVaBbJmUW/YMWhmZIr3PVxSUmf
	pDdk4WCO2wJkqApZtv1hgb7hbpyAWHdDlqbotY6NqzGjCJqmyLCxeMS1BV1s9+odDpqfg0DmhO9
	kkMd5VD3yLYKLAjzV3pPNEMxIkxenOcK7KBXQxoAOyPfWMb4WuxEpRB6eBi7a5BEkDZySKxYeew
	xfVTrlj4aKSlfHaZ59TuW37kLM6isfnP/5u1IYcb8htEaOmGSoJcP8w/Fu7gYCKn9noKhehu9R6
	BoJw+JCl/3Bh5dgmg9xva+JKorfVlMMRVlITqYAFsmGGKm+pKvY/kQX8EFRh7YDtf45+jfuIm3Y
	w4RpanCawaQbgYOggg8a6z7+Ds8qLcmBcihFMWuG0aQWNsII/hWLVGzco
X-Received: by 2002:a05:620a:2985:b0:915:776d:52e4 with SMTP id af79cd13be357-915a9e04fdbmr1851615185a.8.1780993035545;
        Tue, 09 Jun 2026 01:17:15 -0700 (PDT)
X-Received: by 2002:a05:620a:2985:b0:915:776d:52e4 with SMTP id af79cd13be357-915a9e04fdbmr1851614185a.8.1780993035106;
        Tue, 09 Jun 2026 01:17:15 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e65b55d81sm8262784a12.27.2026.06.09.01.17.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 01:17:13 -0700 (PDT)
Message-ID: <adc18723-a194-4e0b-81ff-6c90ec9bda9c@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 10:17:10 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/2] soundwire: qcom: add support for EE-aware register
 layout
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Rao Mandadapu <quic_srivasam@quicinc.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
References: <20260608175345.3118060-1-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260608175345.3118060-1-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=cverVV4i c=1 sm=1 tr=0 ts=6a27cc0c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=tO9HO6G7pjVgjP-kga8A:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: PiyGdcDzob_PhaPconc-xXWTxujNR6GS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA3NyBTYWx0ZWRfX8rYoc2dDkGBX
 HxH2TAzo8XTlCIXXp6caqLOpm93lujWnKaCIW/kLGgqbxMhwhQFeox1e8ONo34Oxovnlm628CAN
 JamWyWyIoR5MdiWsb0A75R/hNxMrSZSJTeG4gOXFuZPTQuLEIkkleGes52ayCLZymSISV/1mp3x
 Wm4Z3mm/IM3irlg0q0az42LT81MucR4LgiYk7ppored1o0idIbgQDcD+d5sU5+jgdS0x6gRJvnd
 Nr5yxbXxcJY3XJP14AkSz3tHgQdh5qpTgLRGvWoYgad1Lk//8Zos3PJ6um7bHkNwUm1Sk4X340E
 GK4s894L4satYzM6szawKRS9qGCZzsFAZkT7fclpBDOY8K/2pOc/UT/yEwtukXjggiiR9+D6Y7r
 w+4E36jnbwbE+QWm/W1kzlVPUI3jHA==
X-Proofpoint-GUID: PiyGdcDzob_PhaPconc-xXWTxujNR6GS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 phishscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2605210000 definitions=main-2606090077

On 6/8/26 7:53 PM, Mohammad Rafi Shaik wrote:
> This series adds support for execution environment (EE) aware register
> layouts in the Qualcomm SoundWire master controller driver.
> 
> On SoundWire v2.0+ hardware, some controllers bank the interrupt, FIFO, and
> status registers in EE-specific windows separated by a stride of 0x1000.
> Typically, the driver assumes EE1, but platforms like Shikra have the
> controller routed on EE0.

Do these EEs have any names associated with them, that would help
explain why the change is needed?

Konrad
