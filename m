Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55CF349D5A7
	for <linux-sound@vger.kernel.org>; Mon, 28 Sep 2026 10:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790591582; cv=none; b=h4jf0Cxiz/2MFV7Wwiu2misbLppi3mcksU/K/0xEb6D5Y0ofC8nCvdH0vNnShP6WcwuHOfDqd7Qz8TUiiWhg0U+Akp6Qthj9wVnaQKFQ1wdVSjSQDHwMAx88v8c3Brv6GyDJ+PVAVsMym5wQpmWI1/dphi5dA8JsMSoXPPxgNOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790591582; c=relaxed/simple;
	bh=/n8PEaX48qi3Chjn7sGT49xW6Yl/5t//KhrnSNtbCLI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cXOci/b4+5SMSFOcE4PoTnpoeM3mm1ZF9RVxQ3LqbJvzaUdE2jbnhGb87DZCSvVWGB72yR3ISRiQV1h/MLRhrYq4AZVvJWAiWGwEXSYSTlsya5N1DQEB7DtsqS39c0ACrVF48f94MhxGf0ioTSu6wtv+4Ihi0R9mMwP/4E3Sad0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EfXFyTjl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gsN1vkKo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EfXFyTjl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gsN1vkKo"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S9MKn51446723
	for <linux-sound@vger.kernel.org>; Mon, 28 Sep 2026 10:32:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eCQpSLLTMiXAFnn4dAHDzyMTkPJt2u5Tp0P2rT0gsbY=; b=EfXFyTjllTrqdWVk
	lXGLK1GkkhvU28oH0WprmpNznKtNcgrejoMTrGe2WM8Fe6x+DUe3lZDTSrgwX8IE
	nzBME847OWO4+AEUz2/Me6OlqBIu7t/8k6fSZRffeslCXDEK2w9vrHr02qVbPgyr
	jMcM7znf0344SQmqnW46mRddug4wqiZ9vGfaXGFWeTqx8McIaAxhyKDOMGI6P4D7
	N2AIiLlwQmlHT1y4d9o/FOAc8qz8B4PhZP3dB8LpDbK95NpQ8uTWpm59xCtBD8WH
	mU5hUTHRhgVaOfIEEytllNO6NCyWUoEi8yNHxMj4qs8jmAKcFMDjdOebomYverWs
	9zMVXQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gynfkr92d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 28 Sep 2026 10:32:55 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3a47a81e70bso541929a91.0
        for <linux-sound@vger.kernel.org>; Mon, 28 Sep 2026 03:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790591575; x=1791196375; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eCQpSLLTMiXAFnn4dAHDzyMTkPJt2u5Tp0P2rT0gsbY=;
        b=gsN1vkKolWLFUvOuyTqKgKBCvazzerLeMKqMA/tIVIwZFw/RTbHzuFQsBsu/vm60h1
         9dEqRRzJDosb0wjd/V5gC222L48WHLzUAwNyPUIuB2eiI2QbKCGl71ILSb8tWPFPTsEI
         JBYZczxk7wn5YJqddCwjayCiWKr3j2ft13aYqW+h+QF9uHCg7Tf3mRsu+D98CrZV3XFa
         SPfRhIuSyJDM/K/srtDTBhrUPqUv2NJ4MgMErRil5KZ5oZaxHWS374aahGVOnXul8c9C
         cklnhYNkVafTmXu8ygrImtH0pj4+4zD+KztxniKjrYzLPCVl3gxPt5CiddX4sEnZ3Z1n
         pvOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790591575; x=1791196375;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eCQpSLLTMiXAFnn4dAHDzyMTkPJt2u5Tp0P2rT0gsbY=;
        b=WivTL4AsAGKPQZkpPzzzSaGjhc/cf0rzui47Ec9APEkWLulQYfh+Z3ot7xztYdlGaY
         W2h936uyuakfLWYGw1BmHYoDCtQI8ma2CMuGLeaObUHVcyiUw30EaLbtpUvw5i232Jjf
         wRiZetDHJFXE2zSfNWNFFs2wmMfHIVxmJ/+XM0Bf8zA0b8PpoFciCHmEsCH/2N0iTWzD
         csvnKbrUiB2hgmKRRs9Xn1SlT08hJ0k7ng2dp83A5vktDvFLh03xAMECMjimG3vMQ4oO
         gBHRxhMG9uG4AWlh7CRZMDSPc20T+TkQ5lePG2TplkvFMJ6mCsB3klXWKvhh1rikgAs8
         5MzA==
X-Gm-Message-State: AFq9FYJN+tc8ez6Zn1CqAEXtR5NAvRG5gkY2Uvw3ry8UyA4at7vUxQzG
	hNynSinsuibnkBRJUjKNPmOGuCrcs8wxdacgQD+3V6UJcbmL+pYfkJluRah+HGJSBxnQyO51AbH
	225rctwmrOALGjiaON2FfeJItcIjU8iYt/Pmxylzpt78Cpdt6l8SGB/+W6vrWOZlyvg==
X-Gm-Gg: AYBFou3Bjsnp5QYaLrEWN6GJReCNeH1EfRFIm5d5WpVTcVmBP8Fd4tGE5457lLJDgGL
	75V1Vvh8X904T4oCNg5klnyeiep6GhYIaL49TqWrj84hEUuDSovN/r9HZUb6NRoD4voQtnBxQaB
	SNU5z+eX/h64GKUAX3fpg/B/GZI4nOwGb4qY6stKB1XuqaCOBNxsTaeSWJfGc9gmk7bJ2UACJgf
	x075xiC/fl65HyXr4FFtmEhfM69ytCMSp5WmZl0jbkIhja8CNXxJlJHrYpHCqvceqAxzxchLfWM
	EtZ1Xjs8xW6Rs038muTRRMBFsNcZnWjWlOOWhqikldTGcFOqVuS4U+uiIvZgKjHZPKNJpJ6/8X0
	MK/L46T/eDI7s0tiJNvshS6wnVJU=
X-Received: by 2002:a17:90b:1c84:b0:39e:6a81:5a94 with SMTP id 98e67ed59e1d1-3a098e39a55mr10149681a91.40.1790591574643;
        Mon, 28 Sep 2026 03:32:54 -0700 (PDT)
X-Received: by 2002:a17:90b:1c84:b0:39e:6a81:5a94 with SMTP id 98e67ed59e1d1-3a098e39a55mr10149657a91.40.1790591574215;
        Mon, 28 Sep 2026 03:32:54 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b8efaeb3sm19885131a91.2.2026.09.28.03.32.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 03:32:53 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 16:02:23 +0530
Subject: [PATCH 5/5] ASoC: codecs: lpass-macro: drop PM_CLK dependency
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-xo-sd-runtimepm-v1-final-v1-5-e3ebade3aeb7@oss.qualcomm.com>
References: <20260928-xo-sd-runtimepm-v1-final-v1-0-e3ebade3aeb7@oss.qualcomm.com>
In-Reply-To: <20260928-xo-sd-runtimepm-v1-final-v1-0-e3ebade3aeb7@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA0MSBTYWx0ZWRfX+759hOMXC9bu
 GXnJd5TOwkB6gSiapig6FNAtHKjZ/rKuvg0T8P4JjfBuoQAh5eTeQMlqxoX4k3c+xq1v3ELKJf1
 JTtRz+4iegJj0w2e5unVtsZ1LOzCm283Spcf8h8rNc/mVubDbtqBpeuKifmI3nxmyebk2YK0CSs
 n8q4vEFpw4joRYEbLaX7nZRfToHJWM6hKti2ZTshAFXhxbry/OQM6w/MPIM5X1HFs5XrVvH5Ah0
 sifTK5nKj1wr/6+JCOaQtscFYRTuLplMcfsO0DPo70wSBloMLgbZEzq9aHYctkXuRZm1iYBVdI5
 0mWXzrjMfTMePCi6il9oMaqy/Z9UxiXJfx/w8Jc/ls7YVKbnStZO3w/ufbk828mJrhxURfXNExD
 Kzy8hX8mpFx7tOGcdX8XIB11vuoNpv5TENGeWmOGqbDeYnA5j3a9c47LsQLBOGdlzhWd2MLiNeF
 iJtKi+xTywCJlvduenQ==
X-Authority-Analysis: v=2.4 cv=e6aT2qp/ c=1 sm=1 tr=0 ts=6aba4257 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=zh57ubo7BFyU4uL2KnkA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: jdoAO8feRMGiCqeXrbRRV8uRvTT8QsYd
X-Proofpoint-ORIG-GUID: jdoAO8feRMGiCqeXrbRRV8uRvTT8QsYd
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA0MSBTYWx0ZWRfXxUtSZ012JSqq
 Q2IysRcyeI5+61UsIKM+ppmZkOZnzNtoxianqaHAwKMUEClVmp4actPcG6iKMp6MlMAfhOw6w65
 15HuGsg5FSLD3qf97gtm0H1ZuVaiPuM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280041

The LPASS macro drivers no longer use the PM clock framework after moving
clock prepare/enable and disable/unprepare handling into their runtime PM
callbacks.

Drop the PM_CLK dependency from the RX, TX, VA and WSA macro Kconfig
symbols.

Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 sound/soc/codecs/Kconfig | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 3cce95528dbf..1fbb077b63f3 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -2961,28 +2961,24 @@ config SND_SOC_LPASS_MACRO_COMMON
 
 config SND_SOC_LPASS_WSA_MACRO
 	depends on COMMON_CLK
-	depends on PM_CLK
 	select REGMAP_MMIO
 	select SND_SOC_LPASS_MACRO_COMMON
 	tristate "Qualcomm WSA Macro in LPASS(Low Power Audio SubSystem)"
 
 config SND_SOC_LPASS_VA_MACRO
 	depends on COMMON_CLK
-	depends on PM_CLK
 	select REGMAP_MMIO
 	select SND_SOC_LPASS_MACRO_COMMON
 	tristate "Qualcomm VA Macro in LPASS(Low Power Audio SubSystem)"
 
 config SND_SOC_LPASS_RX_MACRO
 	depends on COMMON_CLK
-	depends on PM_CLK
 	select REGMAP_MMIO
 	select SND_SOC_LPASS_MACRO_COMMON
 	tristate "Qualcomm RX Macro in LPASS(Low Power Audio SubSystem)"
 
 config SND_SOC_LPASS_TX_MACRO
 	depends on COMMON_CLK
-	depends on PM_CLK
 	select REGMAP_MMIO
 	select SND_SOC_LPASS_MACRO_COMMON
 	tristate "Qualcomm TX Macro in LPASS(Low Power Audio SubSystem)"

-- 
2.34.1

