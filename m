Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE2045C714
	for <linux-sound@vger.kernel.org>; Fri, 31 Jul 2026 16:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785515196; cv=none; b=jjWeYv16ynTTY7IlyYFi1EddE+6FbdAMLShx4kt+tZTlsG4z9SQEcu6XrpCztDig21uaND+tj22rA8tu2lWaRSCktMxQfO084v4cKES242Fr8ymHErskj5HfhXRqroMvcuQ4cr6F7Sk8Ht25/oxFOYIIf8Ge/9F6s2L5EjZb8tE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785515196; c=relaxed/simple;
	bh=KP7BgwAkIlRHJZuj8RiZpKnFmdNMlN/boL92Xkk3NNk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IYkBRzJdwayIND+rZYfmjXTpwDR9exCJq8z+BgkEoFgI9AQKw2obyhX8NYrxY1l+NQCdlVLMxFiAdZh+s/Co1RuTPu/n7mjKEd/hrlv4sG0nBh+7pSsr8uD/hUhLwOyC9o/ab0mHQTQfobxgBHW4uLxmLr94vKKwf1aFvGYKoR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d+QsJ6NG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cXjDt+Ug; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d+QsJ6NG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cXjDt+Ug"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VFOF4l107588
	for <linux-sound@vger.kernel.org>; Fri, 31 Jul 2026 16:26:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=cWwtUDJ9pXA
	8+7sKQ/snQmdMPTxApD9GTI/8fu4jJO0=; b=d+QsJ6NG/NY8NJnKGVZ4Xrlq2td
	F7FkQX1cmwj2z87TpPj2O7nKAPvqOvok40xW6EXTeKKxIZoiDSVsWRFa8si+sMm9
	mcJfdS4qe1Ig9qSoSNIWbId71R0LtJg/pIIFSjZR21dGe5yMAcc/I37Khwr0YXMo
	tmbNE1C46GDhIWk7N//PCnwHSZXINwEFo9L9DFjhQYKOppw5rEfdu2MT17eG3ll7
	qfVuimbClSrETbf3HURP8SPBn8BueKYpK5AsEz8J8eK4s+Ncf/lj/drHnSxPer+r
	0u4Py7dLs1OlXh66BtCUItTF3pi3YbLdUFhVvKCiFtRPAaU2D5G0unSgJWg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fru2u174q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 31 Jul 2026 16:26:33 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5283fa0656dso25518601cf.1
        for <linux-sound@vger.kernel.org>; Fri, 31 Jul 2026 09:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785515192; x=1786119992; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cWwtUDJ9pXA8+7sKQ/snQmdMPTxApD9GTI/8fu4jJO0=;
        b=cXjDt+UgbDv2HQoXHsPQ3tXCTUo7Oc+oNyYVCuh6NcAmn7x8uzsuJlmAniiHmL+Ngq
         pQCB5ZETs9TAjuYtHGelhpYybPJKiiUAGWsgFedsyJuurobc/0p+hywWWo2dlVQM5Bnw
         bHuyjT656520i4Q71Z/x46a3Kwuf3oOj9eMqRj3LX1Z4FLQyaLa2qENkudezrYS3arJJ
         TZjYRRYTBsEBBhbblZNT2OIWMNqhrnS+HlollmPP25s/jEB0f5tXnjBRUmWQoVbR7ukT
         EEAA6b3QSmkP2Rr+E1EbUMnjbjfB6kOjsV+55E6jp28tgTrx4IBnnwFuaBuUHxKdpmEj
         ISTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785515192; x=1786119992;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cWwtUDJ9pXA8+7sKQ/snQmdMPTxApD9GTI/8fu4jJO0=;
        b=gPzUEDkkBnGWjnxLAikhV1mwIaL+fMGe96JyA0weGjCzKCr8qNcHAnJZaAu7lqVdwA
         Q6UtdTubTyR+065DM/5+xLdfP4HErXIZ4MxJ3yFcEk/ChbjeDHLDRMja2EcWGNY1g2sa
         akCApuWs2AN0pWSrtE2QW2sFGkm8WSc1sXkrlWm3zGYzOXUJlEyEMdDaquFMiw6gJQnE
         urjWgN654niI1z1T5E7svsR3cl/n8ewApujljuO7aoATgWB70Bfvgbo+S6vwqOarqP3Y
         +UTLRbaausRL9PzuRkrAAvTxgJbW90UFS8IyNFapozQx8Zv72MjMYMSOQJlVhuO9lkVx
         2EMQ==
X-Forwarded-Encrypted: i=1; AHgh+RpR/vfWft1bIhnWUvfIziacQiKehETt0skPq5LhQDt2wryjYTf/E1lTAQzek8IC3S7/sYNGXmpWnCsOJw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwCRrITQmccoEwNJwkqsnjMo4aYJPO9uxZHPpT1dMGu7RLKLVGj
	DTOomnQVW7g/FkOoHlAK7SoIFukAWz778O19rtGAc1YN1W/HmV0oQZG7yOIaqeA8Ti702HRlnOf
	MeMqV82MIvKFVIJbUvbzqxQd9gBgWgz6WN9LquJrV+toBFGdbUBm3ceNeNWU+83QUVA==
X-Gm-Gg: AR+sD12vVSNa8A8Ks+xDw1a8PTQxwbU85lt3DlNkPBhOx6FSV+x/TS8QbHOobWh1oU0
	Fw6PXK6qpxnQn5NyG2p0jW12PjGNRilGTXyIILXmH3nj7JLGkB69ueD/MyrN3UwhaV1RT9nT+xf
	mR4eSOSazTdBIFBt50k2WFQ1/FXwogTNib3Dr1oRQJ3cPohUzspmJ62GKXj2MLGVCsBdsvI960j
	shHObjUXfyuVXEZ22CyTOV8t9TAFAkoMhhO5eyo6+h2oJB3llH90eSb00EBHfTAL/rVdwZiq5en
	dnWByyFYzjvxWvKpTjItg0UmBqAB9oqTlcia7h0AKmX1Epi8Edm+3AhvEWYpENYJgNUKOVC1oGO
	ey0aqfJlkLuAyAA==
X-Received: by 2002:ac8:5850:0:b0:516:d83d:b28 with SMTP id d75a77b69052e-52b4c5ac831mr14473641cf.17.1785515192100;
        Fri, 31 Jul 2026 09:26:32 -0700 (PDT)
X-Received: by 2002:ac8:5850:0:b0:516:d83d:b28 with SMTP id d75a77b69052e-52b4c5ac831mr14473211cf.17.1785515191615;
        Fri, 31 Jul 2026 09:26:31 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41d1a58sm7084050f8f.7.2026.07.31.09.26.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 09:26:29 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: srini@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        hongyang.zhao@thundersoft.com, neil.armstrong@linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 1/4] ASoC: qcom: sc8280xp: tolerate -ENOTSUPP from codec set_sysclk
Date: Fri, 31 Jul 2026 17:26:23 +0100
Message-ID: <20260731162626.1588561-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260731162626.1588561-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260731162626.1588561-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: fNX4RVb1hLcdgLE8TQuOXqm0L9_MLDyH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDEyNCBTYWx0ZWRfXxf4ieUFor06A
 MPlbqP2CoCL4czZ8yEff9mQlw6jDxCs8ODEiaHi4sZ3YrZQgfxmTqTVfsL0YTYCiRPGeEhe9xS/
 pJqJfijwjowu1DSlc2v0tN5W6PYzyqdM7xolBRRF3EL5BfRuIyadjElnCR2Mx5vQeciaedo7+Ol
 +ihrXO5D2tNLza11uSb/tlKZB4TkE+uU66T1k6jChWzrCnxH93xccZS+t7QNOBNkEqlqFZZ16p0
 rwtx9/pz+jqihQ13tyAy26FpfrcCkQvctQh/k1XgTnF6DJpbckJlLhNXAcF5d+HxxZTZM+qaK11
 Z4fIFJdf2kR9l+hcpZU/m2x4DbGPinqGT3q3ZfQE3Bdt/tK8eAiWqlHHomxRo1/KAjV4S0MhTUP
 Kaw96h6rvbA/FoNPfwtB8ewGb74Riptqt0sDKmuk+2DB3kdMxE6OWQh+NH9N++SLv1Ic5gNguFr
 0HHNxela9k68zrwUj4Q==
X-Proofpoint-GUID: fNX4RVb1hLcdgLE8TQuOXqm0L9_MLDyH
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDEyNCBTYWx0ZWRfX/Qhxb08toE4Z
 WVenPDWdnypTFwFn0KSkY73yQ9KcYUfVLMFbhrGgV9vlV8nx02EZNjHXJ7r5W3WjaFdPitc8cLl
 5ZP+eYWkXv3wW1QIPAMZTxw0xd+g3Bs=
X-Authority-Analysis: v=2.4 cv=b+uCJNGx c=1 sm=1 tr=0 ts=6a6cccb9 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=OIS-06W-AobEqumY0CQA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_05,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310124

Not all codecs implement the set_sysclk operation. When the board
enables codec_sysclk_set, snd_soc_dai_set_sysclk() on the codec DAI
can return -ENOTSUPP, which currently aborts hw_params and breaks
playback/capture on such boards even though the missing clock setup
is harmless.

Ignore -ENOTSUPP for the codec set_sysclk call.

Fixes: 766f3f79c312 ("ASoC: qcom: sc8280xp: enhance machine driver for board-specific config")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/sc8280xp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index a9304784d41e..ce2b0633688c 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -202,7 +202,7 @@ static int sc8280xp_snd_hw_params(struct snd_pcm_substream *substream,
 			ret = snd_soc_dai_set_sysclk(codec_dai,
 						     0, mclk_freq,
 						     SND_SOC_CLOCK_IN);
-			if (ret)
+			if (ret && ret != -ENOTSUPP)
 				return ret;
 		}
 		break;
-- 
2.53.0

