Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A528D52F271
	for <linux-sound@vger.kernel.org>; Thu, 15 Oct 2026 14:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792073644; cv=none; b=HIveERG189Dk9pswaAsoYlNVzx3qE1lb2ytLL5zSt7NSmyUy92j1kwLYSYXMIA5GOiJZd8n5gUKgQN0y4+U+SvJZCxiHKJy4ERlvVdiVbWb4Jku3GfACxX0wiRkoIZEZbltHQqGq4w85rqNcIpMj5GaNjh9U14Hmgqs390IA6As=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792073644; c=relaxed/simple;
	bh=GvoTZER1l4Zd2vB2uFIZBlq92s3/uzySsYs0js4SWZ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pmUEB8y0vsTnh7UPIbImgthV6sdM2RP8PSLG37W5pvEsSqJcospogtOHgE4HEiLvBzshNMZ9uqYuqPNBUcGUu5M8G/OTrkTHBBIgbzLTcZtxXx0ebjXptu4Mcds46xtktnyck/2qtsoh7nOhK46WOnn/kVVJqJQewbkNalTdAQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jQhAQMDP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RBxSzIPO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jQhAQMDP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RBxSzIPO"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jTYN2809312
	for <linux-sound@vger.kernel.org>; Thu, 15 Oct 2026 14:14:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YCejaq5TguSpjsNlo6mtc06Dw7iUiiBR5d6oZHI/vU4=; b=jQhAQMDPnIc9U232
	M8hZ+xRzGueVgsRIsWFb1V1JblW7GCesUJvW//+79dXi6L3Wi6XkVS28kFUbqj5Z
	vm81SwXU7zdNdk/uSr0ZEjowkoAOaKPDykMKWMgfCm3TNCoFCB0SWh3yr4XMpQ+C
	Oivy3Sk/R9KjJA5uYm+1pGh8dEPkMmPfO53+6Xr4ZGI/rTpwzXlqK/2P8+S9IlMT
	bm9pVMF1DmC0huN7f7N7yT9IvLXs+2eTQmPK2ceiYHFYHtnMC2NkrzjDMoMNuBEO
	Kyx9zF4kQL58MrrZYDjk0ea04IcSvini0mdPnNhXwFKK2bHu2rNCXVZCAbNHCKG6
	gtAHxA==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4han54tywg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 15 Oct 2026 14:14:01 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6f538c3453fso5563eaf.1
        for <linux-sound@vger.kernel.org>; Thu, 15 Oct 2026 07:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792073641; x=1792678441; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YCejaq5TguSpjsNlo6mtc06Dw7iUiiBR5d6oZHI/vU4=;
        b=RBxSzIPO7NpzskvDAYrvZ9aQv2orKQHPseKwjoe3VsmJaEh+cyc6ROMpHiKcyn7uGY
         C5nwoUsojZkBNmoKQtiOhY+1OhO3cnhprfBLm1j9z+cHzzzT7Tf5w0g3DQlcAGL7P/ob
         zKPLAV3BhZkz1bQ6vwhXvX3X3fkurc2yVhxrvBeraMWUXFV1PIgHghf6HCgKwxivNnWR
         W1bM3LHpvuAH3KNyZkOLvBkWFxVWcGpqTpl6rLbU7aPjIBGoGfmZHchZhfFhlAOQIMUk
         CT9gdbicTW9q0xtBGkWx3phCdvylvvie0gpDLp9WqZblueM7Evq9HcqOpTOErvc61LDU
         +ARw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792073641; x=1792678441;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YCejaq5TguSpjsNlo6mtc06Dw7iUiiBR5d6oZHI/vU4=;
        b=tkJ4X5f3I9WT792F6gHzU3BAGQLLgcOSPInUI0c64s1kDrUqOMZ5Q9gI9lUoAegyTc
         yz1nqXwL1HXBfTUnM8zT9Y7eB4g1tNktst7r+mLFfN0rlgEyXFfevwTYSE2DLOmSy0gJ
         fBhsYFyhs2mlIon+sF2tlL8hgBsoGuK0KS+vvnEsrX2Dtp5AiKEIpeIWB5jXEwC6K1I4
         NWzm7GC7gnCB7i0dxZn3xX/z80ruXhZBzeJPjajQirpkQdkPjp/PrJrkaxDip/rQZRBD
         8UgUs2JZzPzxHSEIr/BBYJmcX2TiI7cLDiZK4c2lg+RO31fphDF2K1uQekQYGkT2xlQd
         WCsA==
X-Forwarded-Encrypted: i=1; AKwUvBwSph15w5r7ZzjSYv+3NiOSjpd6LXjI54NI00MYZuDr2ndgcjaJHQWvgPFsflyRhPyy/pwc3IPyaHF1Bw==@vger.kernel.org
X-Gm-Message-State: AFq9FYKkGnyy1BLFkZxwT6KBbSWH4lTQAJgr0fY4bqBGUsoYQ61MVcPt
	v1OaptcDLwBg3HyH1BbbqXK3/F2Cw+CcqxBr/PhVUYGhjKHrZosW6I0CaCqul3rh6Hm2t9OyvJk
	sjc7YmwKms2Awm4mYYo6iGqsBwQiZdcAgyZW5XnMf5lMTz6fFkL/V16UNQWO/ZpDQ6g==
X-Gm-Gg: AYBFou3Jqz3CmG8IF+PqLqb7rlaXOs2wPGpO0sIYkK+hMS0+5fpOAtVDpQmMCz/ZEEj
	XfYrP0UdXzMVFY8mxA90bztaLLj1BCXSmNB7PUu7DUI3FgTEnxGL64DqnksMzZ5rkTlF3JJZK9B
	SFkKUoqmgfIFrw8G/L4LKzxIIMFqjjzCyO2ptasyjkkDzfiJbokkvr7jNtMky6QRry0GgT/F8ot
	7ilvzydBUH30gzSPcUS0qXJpSBuEsO+9JwbZUj4WFVzLTLGFxM0LJ/IVz/oETZCJpf2+vZwbh7K
	IF3k9bUp0ZImzp0PAdOiZ6F7hCcTl6DNTF4rcrFJlZnEly1r8TjAhauBpYOWEiFHBTrcx5EBodz
	9SwY1MXVRsAHLq6w5M2QKkRHFZv6DYbYx3p4=
X-Received: by 2002:a05:6820:200b:b0:6e1:d8af:6e85 with SMTP id 006d021491bc7-7010e6e74d0mr91907eaf.24.1792073641004;
        Thu, 15 Oct 2026 07:14:01 -0700 (PDT)
X-Received: by 2002:a05:6820:200b:b0:6e1:d8af:6e85 with SMTP id 006d021491bc7-7010e6e74d0mr91882eaf.24.1792073640553;
        Thu, 15 Oct 2026 07:14:00 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6f47500ae30sm11366719eaf.1.2026.10.15.07.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 07:13:59 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 19:43:10 +0530
Subject: [PATCH v1 2/4] ASoC: codecs: pm4125: Fix MBHC button threshold
 programming
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-pm4125_mbhc_support-v1-2-8bc1212db6f7@oss.qualcomm.com>
References: <20261015-pm4125_mbhc_support-v1-0-8bc1212db6f7@oss.qualcomm.com>
In-Reply-To: <20261015-pm4125_mbhc_support-v1-0-8bc1212db6f7@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792073622; l=1480;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=GvoTZER1l4Zd2vB2uFIZBlq92s3/uzySsYs0js4SWZ4=;
 b=SuwLyy31Tf4fhGFsknvrz5rr5JXNsmK/T6njdP3TaN5oZd7+GYaZz82n+A2sih9Xk43S7RJjx
 EEh4lSHhH58BfhxRVaOhVdb5KeS18ZgbphBvqrltWtyl5qaXVQcIE1/
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Authority-Analysis: v=2.4 cv=RYQFmFtv c=1 sm=1 tr=0 ts=6ad0dfa9 cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=d5X6TG9WFUAVuZc9_kYA:9 a=QEXdDO2ut3YA:10
 a=k4UEASGLJojhI9HsvVT1:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1NiBTYWx0ZWRfX3YBWEb1gUL72
 YYJ56ZsEYNRiUBc1V5MvUBGfvw/76TzbfCOEDXBgg8oom5BRYHyUHNMQkcG2H2o2va/PPHJ0NTk
 SZkaJ2ngCvZ9GifS7XIiwhXq1QdHm7b4yC+3OvHBUz9T8R/00K5jUexfeEPstCGvE0GLsk/7E04
 OzuM5bqBkhY3I7GdmyRUCU/GLe+8MIJKCD9YrHaF+Pz5GmNUsrwL5GvBhGIqtZMNxBnVtgsikFe
 TMZKxmfcmP6P+IFMHd4P9LoB1Q3fYMfQUrai0yauIW6ERpzgSzKXtcBG+LOQlDpSwswybnqiAqy
 5AcjTR6m/kTaEBkHTCTX4kHWIT8lKyjNJD0ZmKwXcORObIKgroSqwN/UXEIGCgb4235QKZ9UsEb
 l+gpWNX5GNyYAzFTLiQA4w27SZ0BWCsfo/V7s+gj37xFk0AWm5Aotdt+6W1vYR3hZKK5srPqb0q
 8cyVCKIftdKI1gu3Wgw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1NiBTYWx0ZWRfX0a4s40DPbQnp
 p12MTvajw7G9h+zQ4cJjuDdtzFLJbHY0PNkHQSjabItnYF/hAubfNzjbw86heTuKFMy8edKt8yH
 LxVuQ5UdQhVRNuOS/UEFPUpaeki4Smo=
X-Proofpoint-GUID: BLUQKQKwgLyGcSFVqHGPSWeEm7czc6iN
X-Proofpoint-ORIG-GUID: BLUQKQKwgLyGcSFVqHGPSWeEm7czc6iN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150056

pm4125_mbhc_program_btn_thr() pre-shifts the computed threshold by two
bits before handing it to snd_soc_component_write_field(). That helper
already shifts the value by the number of trailing zeroes of the mask,
so with PM4125_ANA_MBHC_BTN0_THRESHOLD_MASK being GENMASK(7, 2) the
value gets shifted twice.

The two most significant bits of the threshold are shifted out past the
mask and the remaining bits land four times too high, so every button
voltage is programmed wrong and button presses on a headset are either
missed or reported as the wrong button.

Pass the unshifted value and let the helper place it in the field.

Fixes: 8ad529484937 ("ASoC: codecs: add new pm4125 audio codec driver")
Assisted-by: Claude Opus 5
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/codecs/pm4125.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/pm4125.c b/sound/soc/codecs/pm4125.c
index 674a2fbc4..923318c78 100644
--- a/sound/soc/codecs/pm4125.c
+++ b/sound/soc/codecs/pm4125.c
@@ -981,7 +981,7 @@ static void pm4125_mbhc_program_btn_thr(struct snd_soc_component *component,
 	for (i = 0; i < num_btn; i++) {
 		vth = ((btn_high[i] * 2) / 25) & 0x3F;
 		snd_soc_component_write_field(component, PM4125_ANA_MBHC_BTN0_ZDET_VREF1 + i,
-					      PM4125_ANA_MBHC_BTN0_THRESHOLD_MASK, vth << 2);
+					      PM4125_ANA_MBHC_BTN0_THRESHOLD_MASK, vth);
 	}
 }
 

-- 
2.34.1

