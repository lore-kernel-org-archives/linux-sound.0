Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587264ADD80
	for <linux-sound@vger.kernel.org>; Tue, 14 Jul 2026 16:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784046176; cv=none; b=d+7i0q/vBOSmRAGsxuoHag3UEngoT5T0T+PGJCl3MwcwNQLneCkgqK+h/GgDdgt7tzI/zaoDOQXboSbruqOZU88zG/HDlXPDSOHZf6rkVXWyMpjs+hBMyJVn8skXQyY/po322GgvoaC9Cl9oA3mHyqNgYjvYkLSREH/3M6LE+AM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784046176; c=relaxed/simple;
	bh=orJEvHBeXvNZ7hZR15f/uGaIEoW0Eezb+ckb2meJw3k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ED8E6vLRqtisTo7xFfuceaVKlsc6JlHw4n6wHfF07xIiv4qhurTo7e9vE94Z4cK9p0AVFyAzKht4INwU0Cdpd5YHLrhyCKwzAaQXIQrjnuNbgqAAGOnJBzFfEOYzJUZaHlZhLdTs5dHwu/xWubsEIs1YUyPcAJFyElAbAnba8cE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jus4AScL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RvMfUGrI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jus4AScL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RvMfUGrI"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EG7EWl879786
	for <linux-sound@vger.kernel.org>; Tue, 14 Jul 2026 16:22:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A4og9nh2/RMYqtFHRu4SpcNmhnMb8Uyr2PR8ftMNBpY=; b=Jus4AScL6EhMELjV
	YPz07fe3KE9LbkVmXYfP6DQpWJsRHWUV84rqLzMiYemEF2cXVI89YgpJUQeGagsz
	UrZNPiXUR0CKkwM0hIpn42kx4aTFHBPeJ2njIq0P/p0OPPyDdfTI1hHiIIr1Vq/Z
	0jDc4DkaHr4tE4Ot1A66UoBHLdHjasklhRrrAgHCjIipdcQ0BkWLJPSwduQzDevY
	MGk44+hYikzjtBclcYNemvXMu1GeAo8WdbODgmXZmcXhS0oK28GyPFKHm5ou8cGV
	06bQrxPKAHsFBIi9LFy+5DZ4nCYA6MVDcoiEr6WiH7SFQGnnS+HEVRnQSDKtryS8
	Q/ADwA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdnp0gw2n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 14 Jul 2026 16:22:54 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c0d6a2f4cso69559431cf.3
        for <linux-sound@vger.kernel.org>; Tue, 14 Jul 2026 09:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784046173; x=1784650973; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A4og9nh2/RMYqtFHRu4SpcNmhnMb8Uyr2PR8ftMNBpY=;
        b=RvMfUGrIAQOynfgQ3gbq3XnMoBCtLm+gJ7OSPy9w9bEQARxT4bOUUnHoJOIPQymD9h
         EKfyH+hbV27twwY9OaNlBfZRQmUA/2Lm4oHwt0nkNenMKTILCTwfwFob3r6QymfR9U+X
         uk9kRA1VLCwc9wxLytPakqlcFL6nmNUIrPFBI8Dkti4s5GJE+mE0mXRcvhF/OiIbg/xF
         HeKsDzxNt4ZQ/Fxk3gnWJPOK3PT/kKnJbhDn7CzCAIeEvDadu2cbTDpS+IzGENdHN1e1
         XX1+7tUZRpshpLGz3acaDojxo/xD3IUUdV2Nr5wJJgF57pUxmoQdDISibkwjkK3gVt4a
         OAxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784046173; x=1784650973;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A4og9nh2/RMYqtFHRu4SpcNmhnMb8Uyr2PR8ftMNBpY=;
        b=Ai0FEnQXOI2K+kwSDExOySrqjhpBodgLTTlwBJIc7NDuGemNqdNBEbvqq+0ETpqIZm
         fjzIEW3stC8zwNzLxHlbMaz4/ZpAxaSaTCMefM59frwzHM78WKq3QKdSjgNw9+34RAKe
         k4aISb1zMsyV2rEQjleGbBRX1aHXZseN0n1pEOtApcq/wXYvVrjttHLlwZo5wp4srh4K
         f9nO5nEyDH91gzTtQitRJ20iPG0lCJKkogZzhKE7gh8tt/ZAXf1p+ECSHkjphP9CT8dM
         IsWlzwQLIlcjvnfJAtAS2WacAVMH294zKpw7SeWeg7/bE4BppL+W+INHbaDD5Lg0kRjK
         Qsvw==
X-Forwarded-Encrypted: i=1; AHgh+RoAfp/ul/BdjGcS/UgSVZhLYTgmiK6rjEOtmxAvT5pRM+Uiu6PSCHewaKOxqEdYKXE2soq7e5WMRGQFzA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzhX7OhHiJUIopnyhUejFvF6HyxL3EEHHTqQYRo4mKRtijs6Yec
	/gVpVEUa1KDV2Kw+rCwv3LrzhnA8Rijf5fSkbyOXsxm9XeMN8EcgkzOrb2vo8EUP9fIDnrCgRt5
	jhS55YBQuP1ES79hgPZjWuxXv83a0QrtfN1tMVt9v0BlsZ/knkqXmpugP2BSvoCFoUA==
X-Gm-Gg: AfdE7ckH6PFSOCkFZ3czCbAbCC2J/zJRyQGqWP+LbExmjE80b59GSQAcTycvANtVRe1
	wnF5XYvZ0u4OCk7Ct0tznFr3PFvb4+XssbyO3zsIyVM24F6L86cCW1Dx1rZjprcGRVoeNgeURVV
	NDkre6LhK9kALPHl9VWjzLlWCzVXhfAM/K++Qx7n28afGlWFEemjdRzKdidchJGsdARmaxtTXl8
	awHSsW6bcFIH4Nto38vGuKnxkW24NJgjTUsA9EGVEa02aORxBlezj5jAVdopyYeRqObQFos4stp
	RnX8kyf/cnp5apOjDTfvCl85fIy+fJInv/URNxpHGa+Jd0VoJvYQfD6lEchge1NBdoHNZ3ef7pd
	fZYC4dEz4kpDAB+NcRbWcqoZUofAzxEmvM7riNw==
X-Received: by 2002:a05:622a:4d97:b0:516:d781:589a with SMTP id d75a77b69052e-51cbf0c467fmr136395741cf.22.1784046173462;
        Tue, 14 Jul 2026 09:22:53 -0700 (PDT)
X-Received: by 2002:a05:622a:4d97:b0:516:d781:589a with SMTP id d75a77b69052e-51cbf0c467fmr136395341cf.22.1784046172973;
        Tue, 14 Jul 2026 09:22:52 -0700 (PDT)
Received: from [192.168.68.109] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4950a32b9f3sm98136555e9.13.2026.07.14.09.22.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 09:22:52 -0700 (PDT)
Message-ID: <b099f316-0e30-40f6-8e6d-5717d96fce5c@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 17:22:51 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] ASoC: qcom: q6apm-lpass-dais: start the graph at
 prepare
To: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
        Srinivas Kandagatla <srini@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Val Packett <val@packett.cool>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jianfeng Liu <liujianfeng1994@gmail.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260705033830.305907-1-jorijnvdgraaf@catcrafts.net>
 <dee62f9f-1df3-4f57-a072-12b0b4b8a1a3@sirena.org.uk>
 <20260708215539.150590-1-jorijnvdgraaf@catcrafts.net>
 <137a9c85-67ab-434b-880b-d9d4efa5bccf@kernel.org>
 <20260710143214.142017-1-jorijnvdgraaf@catcrafts.net>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260710143214.142017-1-jorijnvdgraaf@catcrafts.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDE2OSBTYWx0ZWRfXywBaTxtjmpXA
 arzzBTkOF27oBV7TRKYwLy/pX9pfOyvXyJDhw+WLBRvo8/82l8NEz4Ai84prLXW/U7W59Zl/J2S
 yIUDrsr8j3k4GIeerIYPlcNU/eH3vNs=
X-Proofpoint-GUID: 4idxnB-5KoN2bFfbZ5wfwJPkohYkwAmR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDE2OSBTYWx0ZWRfX3DjlWEwuLbAt
 iwkVD2wltOiLT97U7DOBn5x1CQ7K/DoOHhDPnRXBQtmpogT+91QNYD9msOT66GIzHFWpX+9HUNt
 8loY1iPISjDLFrVpAVyZuLa5rBtslqrIJ6H4QBj8DSN0DnlhYmwla3/pDB6C66VfBc53D04FN1c
 YkW4Uxm8f2wOFPE0/XLClWL0vRPgTEy22mbeOsAB/dVv4kZGyOb/uEGvZfjHMG/LOjeQIboVB+W
 zM4/FJx60lBFCdEQhqPd3SuxUKxEHgvAGrTRNYJSlF/O6kEPUPuprlXQJ1THubW+kZbqmah0NyM
 K+p4atOpi0DG7wqIq2IXDPl5HGqcquGvvilrtBxX0vBznD5Vg0OpJsx/0EMhHjFGWK05G3YJd5T
 r7lnE6y4P+mqjmC+vHs+NEUeFgoMj58SlwPZawd/8mVixQmS6cGSGVORUmqAgGcJgOV86VZCbSP
 l314yc2wSRAq5zisZNQ==
X-Authority-Analysis: v=2.4 cv=FtM1OWrq c=1 sm=1 tr=0 ts=6a56625e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=dKMprGr_ybx22OnWk7YA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: 4idxnB-5KoN2bFfbZ5wfwJPkohYkwAmR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_04,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140169



On 7/10/26 3:32 PM, Jorijn van der Graaf wrote:
> On Wed, Jul 08, 2026 at 11:13:18PM +0100, Srinivas Kandagatla wrote:
>> I guess you are referring to the IBIT clk that dsp provides, not the mclk.
>>
>> Could you not enable this from the machine driver?
> 
> Yes - SEN_MI2S_IBIT, provided by the DSP, not the mclk. And enabling
> it from the machine driver is what I tested with the series you
> point at below:
> 
> On Wed, Jul 08, 2026 at 11:18:50PM +0100, Srinivas Kandagatla wrote:
>>> So for v2 I would keep the two behaviours apart per interface type:
>> This is not going to scale, please try to enable the required clocks
>> from machine driver. Pl take a look at this series
>>
>> https://lore.kernel.org/linux-sound/20260706132009.1496321-1-mohammad.rafi.shaik@oss.qualcomm.com/
> 
> I tested that series (v3) before sending my previous mail -
> the report was buried in a long mail though, so here is the setup
> and result again in a bit more detail. I carried the series onto
> the tree my board runs, described SEN_MI2S_IBIT as the "bclk" of a
> dai@147 subnode per the new binding, and set mi2s_bclk_enable in
> the board data, so the machine driver votes the clock at hw_params.
> The vote itself succeeds - the DSP acks it and clk_summary shows
> the clock prepared and enabled at 1536000 during the stream - but
> the amplifiers' synchronous power-up check at prepare still reports
> "no clocks", and with the graph started at prepare the same codec
> powers up with no bit-clock vote at all. So on this board the bit
> clock only reaches the codec once the graph is started; the PRM
> vote alone does not drive it.
> 
> The question that decides where the fix belongs: is the DSP expected
> to drive IBIT on the pads from the PRM clock request alone, with the
> endpoint's graph not (yet) started?
> 

IBIT clocks should start clocking once we vote for it using prm.
Do you see any errors while enabling this clock?

This week, I will try to pull some wires out and check that on my
hardware too.

--srini
> - If yes, milos firmware behaves differently here and I am happy to
>   debug - any pointer on what to check would help.
> - If no, the machine-driver clock route cannot cover a codec that
>   needs the bit clock during the DAPM power-up sequence, on any
>   AudioReach platform, and some form of start-before-power-up is
>   still needed for such links.
