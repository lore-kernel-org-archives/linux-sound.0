Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 433A03D6F
	for <linux-sound@vger.kernel.org>; Fri,  7 Nov 2025 10:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762510555; cv=none; b=uYHNfMEA+c29KSw1rTPykvR0ILebPW4us76nYlmMMzBJk0qApWkOSXfak2SYxfA8bH73AI6xj6ltTaytYSlB8AXosipO4w3iwwlH5vkkV/NQ141R/62r3b9jQnMnWxxAygW41D8tPF1sZ9bVk3trR6v3tFQ1ruV/OcNS81/ibBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762510555; c=relaxed/simple;
	bh=Anyq/raF18/Z5tmIRwUrDoEZcj/HsfO/X7b39NnL4Ho=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=FTPwuI6LUkWoRkVGohWa6rn5+tHBgIwfkreMN3hYV3eizkq1W8sgndUBlSnHmOgombQeb0Y/2czOasPH2t1VwfwwwFaYnJ/blOlaYuPEYjFEXW0uKa2+IYK2BYF+IdgmPT8KFhNRXtvhMLscfsPEQ53Kpv0az6o9lodGLJFluOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R6S78mIw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=evqrelLx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R6S78mIw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="evqrelLx"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A73qTtg557548
	for <linux-sound@vger.kernel.org>; Fri, 7 Nov 2025 10:15:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Anyq/raF18/Z5tmIRwUrDo
	EZcj/HsfO/X7b39NnL4Ho=; b=R6S78mIwVAWa0C4ff0eH3OTF1cA9onD0rtKfyi
	2IqUCx3sjZRYtABFJnYbQPsF1j6I2VbiTmzEYI5Hc/3Fwm19ozo/yiHYINjxEpDH
	WAlvA4XdCdCpBRMCdxY1b3NjIQXQirA3haaiy9vRyCTL6OY91FNWhbYjhjO+AzSm
	3XNblZJiGgLi/PAHwRClFztqw704E0URqqvU/Zvkv9RqcElvygflmiguNI6DN/p1
	rZY8xBV5XvZxW/B0YN2uNArBQjfm87IJpIrk1MKmU7pnYhPhxlNz4sodcRmWQdax
	E1v/p2sCZLZWlcL2yp0ETn1olqJZ8Q8Au1ngoLKtNpahF5PQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a8yr9tnyc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 07 Nov 2025 10:15:53 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4e88a5e70a7so15105741cf.1
        for <linux-sound@vger.kernel.org>; Fri, 07 Nov 2025 02:15:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762510552; x=1763115352; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:content-language:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Anyq/raF18/Z5tmIRwUrDoEZcj/HsfO/X7b39NnL4Ho=;
        b=evqrelLxMOXsxcLGMNUVJHH6yZMZyhsi893P9DLCgNo2/eksjZ4LcJBK8g7bWYHX+h
         LVfXXt39VTrOJKuFnoHjHgJ/ZAo9sixP/3p5V65z1TllYwnLGgXTikw3Gsh1D3hSOrc6
         ytIcYvkxXLKzWpNxbdn26nZ9Ty0JM+r0pApCvkCjD54RYTy3hwloqwSHjwdYxkjJiJu2
         Ecc4RQjl0FfzsHrKI+ixvfmbmooEBxw9OSfxkPLex5/kSmuVVBwHmCt14qIAjZXiRB8q
         krOuGvLj5OW0MXNcJqyJwi2Jn/W42llHWqBo1SRJeriD7GZmC55wX7jPPfUGUeu/yTkF
         duuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762510552; x=1763115352;
        h=content-transfer-encoding:cc:to:content-language:subject:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Anyq/raF18/Z5tmIRwUrDoEZcj/HsfO/X7b39NnL4Ho=;
        b=Wed5iPGO0+RgTAUFEkgd0Hv0o21iQvbD2UaPto99Djrub8MNwiS4fc60GKfI0tzd8S
         WX5cOCHCugbhrL68sz3LqJXXV1cFORY7esg1FWjaLa9PZ/TobljhNQ33wWhAFEEdmQkQ
         LW4A7zgJLshT3nRzO6KBees+xEqVGpYuHOhpDbiblMmeH3hjJanUodWTVojFCA86ctgh
         BZUAKWQ62QKDZc7Lpazq1SbgiS3FBrppue8ZgOm2vHbG654LMTAA9/SW8uQXNCYBBdv8
         eY4wW28FFMCwo/YL4sQdQDR5vSHDFFvrEmVQwjvIMELjfaN+HYqN1HeaR9qxv1RU2Alf
         w7ew==
X-Gm-Message-State: AOJu0YzI95Yg4gIjxqtfMdGKy3f6Gf2hCigc2uHf/IN4iBcUcxQP4LKN
	JGEVvwKB7SU8hCBjm61zjkKC2+kHlY0X3j5wfWN7KnfKiqQ8eb1OxRgZyWR6DOtN3lMAsNSNdJK
	SAPlrvf//zTcA2dqmwWJwweM+e2F79Tu35loYnf5EeOoUSZ94wTdpiGlfrfBkY44LxSXsXbOvxA
	==
X-Gm-Gg: ASbGncvFADApc95ZxF+TYRBwixKFkGmEOB2MEdP49ObyK8jOxQWDNv2IO9MwkedlNfh
	9ayZfK8foIS3oXWrNBTwXjmb5VvO92rB+lm//EYDN7unik/sfO+TyMhRqInM6S8/S2r8awgR2Bl
	QHYIfKkdQtQrYMmnRUk/+v5Fegt8dVKbeMVn+CuNkcEBYEoIUEiyAFEuTyHdJgjdvlbDjcgmHVA
	hCj2/6nM8dm9+shYpVbh+BI7zFPX1BSZnBqeZbz169gDFaZO0BMbuLbdcpmUHXT4x5xqj2Mfbu0
	Gdgk0+ruUKuOxrroziAQsLSmeoNen/VI9J455cbjBubIsFt3Rgd48UrVtCVSouqyVBvKs4KMCeJ
	sgiNN1ppkTGasaN3sy5msIwEOKw==
X-Received: by 2002:a05:622a:254:b0:4e8:916f:9716 with SMTP id d75a77b69052e-4ed99820988mr11215011cf.36.1762510552358;
        Fri, 07 Nov 2025 02:15:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHafiudsuRZWxYGaeINBS0P8B9LbBBeVGf3jzVF6gn63s52bJBsprEWshk659I2xJipbevSkQ==
X-Received: by 2002:a05:622a:254:b0:4e8:916f:9716 with SMTP id d75a77b69052e-4ed99820988mr11214841cf.36.1762510551931;
        Fri, 07 Nov 2025 02:15:51 -0800 (PST)
Received: from [192.168.68.121] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4776bd08834sm39413235e9.15.2025.11.07.02.15.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Nov 2025 02:15:51 -0800 (PST)
Message-ID: <76b8ca1d-040b-472e-9804-5c0c0100b5b5@oss.qualcomm.com>
Date: Fri, 7 Nov 2025 10:15:50 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: DP/HDMI Jack and Pipewire
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound <linux-sound@vger.kernel.org>, wtaymans@redhat.com,
        arun@asymptotic.io, Jaroslav Kysela <perex@perex.cz>,
        lkml <linux-kernel@vger.kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=DrpbOW/+ c=1 sm=1 tr=0 ts=690dc6d9 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=e5mUnYsNAAAA:8 a=wNNw3XZq_sXo5zqJiy0A:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: XGTxu_MYgSLFSzVXHStksJqbVloAjydl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDA4MiBTYWx0ZWRfXx0Dru1uss+wS
 lSmhVg1kZczmFLp3DgrVX6vFiky+cJVWWDMnUAjT4EDf2nb6DYM4NXqDm5Fd403t8sG6z/uByKP
 z6lDKBv3RmhXBk+BN2p4LAH1oTL+9YagpuNvlX9pA+yKSLrZEB9TYjfB7g50/k/89Adeemy2mSv
 heAEOgVu0YEeHgBozkENC/oNziPsKfkTIxNCMym5oNx9ajsQ8WfQ1cWebdU1B/uvpo8VcGUPmbg
 iHslddrgQUFPrgvB88M87TpTrKfvPvR8CIWMqQdSfdfhmoadL9YJfUUo41oaPaN0QathkjQx5Ud
 5cqMzfDeXcBSqf1GbnPKQxnXg0FQVOSHZCT2Rhes7Cq4VQzzyrGo5hBN8MQg6N4bVcmZBzuHcOF
 fcCKyhf1QnN2VaxZFbM1w8tiN+Laag==
X-Proofpoint-GUID: XGTxu_MYgSLFSzVXHStksJqbVloAjydl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_02,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511070082

Hi Everyone,

On Qualcomm platforms we have an issue enabling Display port on a full
Distro setup with pipewire and wireplumber in place.

The issue is that Display port Audio IP on Qualcomm SoC is powered off
if there is no Display connected. It make sense to keep it in this low
power mode when there is no use. And the DP IP is not expecting any data
in this state and any attempt to configure or send data would result in
error from DSP.

However, we create PCM devices and jacks for all audio sinks and
sources, including DisplayPort DAI links. When PipeWire starts up
without any awareness of jack state it probes all available PCM devices,
including the DisplayPort ones. Since no display is connected, the
prepare callback for DP fails, leading PipeWire to mark the sound card
as unusable. Consequently, it abandons entire sound card, including
other valid audio sinks. I have also started discussing this issue with
pipewire [1]


What is the expected pcm device behavior when DP jack is not connected?

Two possibilities:

1. Consume the data even when the Display is not connected. I see that
in Intel case it sinks the data somewhere and gives the user an
experience that the data is getting consumed.

2. Throw an error to user if they attempt to configure or send the data
to this disconnected pcm.


Also what userspace ABI to for such usecase?

This is blocking end-to-end DP audio enablement on Qualcomm SoCs.

Not sure if this is right approach or will work but somehow we back the
pcm devices with disconnected jack state to use dummy pcm ops instead of
actual pcm ops?
This should at least keep the pipewire happy. Is this the right approach?


[1]: https://gitlab.freedesktop.org/pipewire/pipewire/-/issues/4938

Thanks,
Srini
