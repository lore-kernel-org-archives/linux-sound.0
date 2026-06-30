Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9472F3CB8FB
	for <linux-sound@vger.kernel.org>; Tue, 30 Jun 2026 11:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782819474; cv=none; b=ZB9vq3m2PKTSR2wxXh+B1J9zwL2kIYNiKI9PFJN+nTbYpW6bATnzMQQObc6fsFLoHPhSdraCWcX8DjEDlsYK9T+hBoJgeeWDczKBh2OIMYrU34UVyk+xvvEdTG/XaG7McuVFiSc2S55e0KCleXKPvXLEDrXlIIn9LmOCnJ/sIUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782819474; c=relaxed/simple;
	bh=OKGjc8evu6WM2M0aJPIG4/RO+8j2OSSLHHk7Qjexh4c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gX8AtuS4DBZnfp52w+ZH8g6bgQoDFPMlW33/jc3yu9ONES4Vh6Tb1GSPcknqvU0j9ITSIsJnmv5VDQRXd20iaR9L0kw8PGKbmLxJ/wxIPvrUKG9lgZQVQ4pdrfMdZsyH3DcQrLEfn4ulLgWApQlLagxr3X2V0QFD/txsa4UiMrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WhEGOjzC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WLbyOUcW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WhEGOjzC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WLbyOUcW"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9mxU11605154
	for <linux-sound@vger.kernel.org>; Tue, 30 Jun 2026 11:37:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ey0sj4w86zYCDfrgPE3RBr/Qcb1sUI5QXivW3R/r9f4=; b=WhEGOjzCXvtcXV/w
	IgQOJjPeTqkzQPi8/c5B8wBXpqb1Q0QJcXWwglPAlin0qKEaTaPjddan50eOftsu
	OaMbZV9rA+B7ikWoAkC8l4Q1BS8h3bhx3LKixFk7i2RyHjtLyMuQ9odmjPs56R0D
	mPNHumnrEFpTV7S7bJ3diur9t35vjaE/B4TVkne0GSwFriWLfeazU2ADWDQb1wVq
	uU6OB52oXpOLWBxuCYyPRWGvJpUWNMo/lcrtIzsyYt70M8+P5agjR+UIHLSA8C1e
	XZ7hxyfFHzXrlHHj0OB0/sRPTj9xP7sa7B7/BrK7vOxoptGrR67X3jRchhK+Numb
	Qoe5Mg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f43vfjejt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 30 Jun 2026 11:37:52 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e57e56ce9so21215485a.3
        for <linux-sound@vger.kernel.org>; Tue, 30 Jun 2026 04:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782819472; x=1783424272; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ey0sj4w86zYCDfrgPE3RBr/Qcb1sUI5QXivW3R/r9f4=;
        b=WLbyOUcWmBYfaLqLvQTVWKgAcjORcqHVRzc0XDWB/ehODsIvyyFjmhxPL7l2rNa+sA
         l0BzWqrdCkHWlbsNTfbJ1jaFY6m7JVuLcwH5pCkNQsW9NFXQvlW5cCV/7uDzJUVl5eor
         /qHy9FddDZYSaKGDAGJoTH6JlKS73q4gWXxAoDeTW/0nlPIIVPvS7UZMGn+P7MK07JB+
         dKVU0JAJMbWVUfuDL+vwzCF6FIaxfw5x27PeZRJR1QRsjUUR7OMzHYt6BdB3xC/qrrrZ
         brsrbs7J+n01NN/sZQcvy+3AgmLPgnTR1o/yLVuxrKbB5cmN1nigYSBK3Q0WSEQb5AXx
         7qXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782819472; x=1783424272;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ey0sj4w86zYCDfrgPE3RBr/Qcb1sUI5QXivW3R/r9f4=;
        b=Bex18btFW40ridkyh8u5pfyk0giE+MHidVZQRXb7S8M1PNQNeB86l8K2C2ir0UNQha
         OOj2dho9xL/eu4y1xMFISy7De3+6TohGOcChQZqxn5+OF0cHWgA+N2ytgM/wVQRBaJiZ
         VgHsMW5eN4K6TI8EgBMS8pbJ40AmOrkEX6TV3WbAAG9OZqY8K7Q6gXqskLoFAouNZVFm
         haAitpf3vgqywLZXfGFsnvREYAPqUDod3xXmuwOROPoinjyWdraQa03bA0gi43YUitBw
         jWLQ8PgsQZCf40EeRK7+AitpOlrYEfW9qEvJ7Zk8DHXte2VDViU5b9jBVCyR+F1Jv2ga
         pcYw==
X-Gm-Message-State: AOJu0YyqPnhKB1BVdHyK7UcrWwa0NqLdkCkWCilPCZ1HlHHmoxnjfAs9
	4ClG7b/+1BpAkPUGgPn+rKjXkJZmQb1HQhaB0pgns6sro62TWEdPRtOyChYNjKqigbc7FjN1XuC
	DjP3EjT7LNjekKQ3F9SLRQw9bQbCRUBVjyW0NDhH6xP5JyU1CW+78vDaM2NDZQsBV0g==
X-Gm-Gg: AfdE7cmGv3s4xY5UcFwO1cO+uimJGUCU31nv3JHMB8LLaBMAsngGUN+vc74uuhXGwEn
	UAg2CYQM6dBwl0rWRp9TBVqoSe0MwN/Yv1ipbJKxQbWhwrXlQmR6hRCqSwJdGjfYOcX1kJlvlph
	69wA9hmBeFl9mUHjXtDWEidpXa62J6HPHXwKO8GcC025TPk9I+CEsI/mA2nH3BbdxvcG0l1gJ8T
	FUSCwAMmvRMtKdZEYMf9UkCE2KpUrwyY+9EAy8VO4QZFGsI2UYnspXcTNKZh7xOz2CUS9jBGJmi
	exLSvFGi3m5zMUJja2Cjd1Ij60FrGDmec38BAaIswP2475CNpNyrO5xTWAyTZ33od1Q+SUUMdYA
	ULDuAHfRxCfj3+DpoMdDdoDgW2d7F2Q8hMZg=
X-Received: by 2002:a05:622a:11d4:b0:51b:f40b:2fa2 with SMTP id d75a77b69052e-51c105fd0f5mr32201381cf.1.1782819471791;
        Tue, 30 Jun 2026 04:37:51 -0700 (PDT)
X-Received: by 2002:a05:622a:11d4:b0:51b:f40b:2fa2 with SMTP id d75a77b69052e-51c105fd0f5mr32201051cf.1.1782819471326;
        Tue, 30 Jun 2026 04:37:51 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288f47394sm108948566b.43.2026.06.30.04.37.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 04:37:50 -0700 (PDT)
Message-ID: <ecfdafa9-cd81-4f97-bd0b-59ee6dfed112@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 13:37:48 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/3] ASoC: codecs: lpass-wsa-macro: Switch to PM clock
 framework for runtime PM
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260629-xo-sd-codec-v7-b4-v7-0-fb37ce457c42@oss.qualcomm.com>
 <20260629-xo-sd-codec-v7-b4-v7-1-fb37ce457c42@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260629-xo-sd-codec-v7-b4-v7-1-fb37ce457c42@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 0zN08P-ZX9_8DWa2rQm7zxi-IhFwqfXx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDEwNyBTYWx0ZWRfXwEw/Hyd0B1c0
 qS+gSp+UzqXoVCjljDfWOkK2FSX+DoswfoqXdjcu/bfbXXvgFdTsXlrjIQnXxjCytkxj8LoKALC
 LYb7yz1h93Ddy1SzwxMRAM00Sy7LKZBhJvnyQGFF7jShlUPXqK0oclJ+gaB8hFZuER5sPikRI4Z
 Fe/ODBEQlc9x0nLejV750siQxoqwdjMZE6BXP9QCLwGrCxS4oo5K3vdzL9uz9AjqiTEZjyYerml
 q7o0UTOV1QN0G6UQpcOUd+Y176JntsbNWSs5nxiMC9mcAshcBG1Iqs123ZVIvZ6E2o30MqSZtvQ
 zw4uVIKwlkfgTPaoAn7fUrJG+phKQ2SiV/DlZkqTSTetVyW/Z6UuY76PikODHVEO1TFgrGI3FIV
 nDBeOv1Ebot/BWQ8ctOrpy2mRFL8h3S2lP6attTnQpdrs2mnk8oP+mfubVfBAryrEiWGJYkROjj
 ky/Okgo7cuHMLP3Wumg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDEwNyBTYWx0ZWRfX1GOclRrvRsGs
 zt2jtSmqnnRxRO9/vRylDhndaImTrjN/sea37lmnatv8xxhzbxkfRmO67YNgHBcp1530oHSnFaX
 B1j9p3g2Xu552YN7npcDJPiuPlJaLx4=
X-Proofpoint-GUID: 0zN08P-ZX9_8DWa2rQm7zxi-IhFwqfXx
X-Authority-Analysis: v=2.4 cv=PcXPQChd c=1 sm=1 tr=0 ts=6a43aa90 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=t2ZNzEmchGV416yE2bcA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606300107

On 6/29/26 12:05 PM, Ajay Kumar Nandam wrote:
> Convert the LPASS WSA macro codec driver to runtime PM clock management by
> using the PM clock framework.
> 
> Replace manual macro/dcodec/mclk/npl/fsgen clock toggling with PM clock
> helpers and runtime PM callbacks. Keep the SWR gate runtime PM reference
> from SWR clock enable until disable so autosuspend does not gate clocks
> while SWR is still prepared.
> 
> Set autosuspend delay to 100 ms so PM-clock-managed votes are dropped soon
> after idle while still avoiding suspend/resume churn on short gaps.
> 
> Add a PM_CLK dependency to SND_SOC_LPASS_WSA_MACRO since this patch
> introduces PM clock APIs.
> 
> Tighten error unwind by checking pm_runtime_put_sync_suspend() in probe and
> by restoring regcache state if pm_clk_resume()/regcache_sync() fails.
> 
> Suggested-by: Mark Brown <broonie@kernel.org>
> Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
> ---

I think this is good now

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
