Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792481961;
	b=f+qVnqJToGbZN6MsyAEKIsdIJvDPqaiGk68mEfzdnbReFfXDutdtSZRCvAnNIIhNz4xX
	 +eugeiqh+Mk3uxNn1HLOj4lsPCsI4UD2YB7h9TJ34/dzA1V/v6BmnAaoIX/er1iC+LsZh
	 jJDRdYY14W9A9G261I4j8FGXK7QXZckKHLpthj+z18bZNHojMJRT0UAyFk50F8Nldvkaf
	 Ae/SsqV6ujc6fDasMU3bRbLME5KbuQxWbr5V8JGFdQNWxWLsYDQNhnpgVEc3UoCEW24oq
	 6CWWL3wrw74Jscbv2RsOi3tOW8b5FAALcFV35DxaZN4zlSqXfHjoahyWNyo2oibfGMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792481961;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ilWLIrnHPQIkq8Nqks0gzeKHylePZhRJIyxsg1r+je8=;
	b=DlmVp0XODGwPMlMW0nQLDPICSXnMaL+Heqe5kQHlpXQrd1PgqsSf7iuldh+/8lmfCJQi
	 dgzFpdmHeDdJzzTS1d40j73h/n3dWF/sHaBjoScQgLMTW/raA6DlhnToFOU0g7bcVyYEK
	 0bR75qWIwUFzHtW6R0RsvUzs/OEFeIHX+/4HAsqE1kbnTzKocNVR7b9xIlTBQwf4RQXrt
	 7jbT9pHqVm/DHHk3kZPTJ9TH5LAmwHeBXFedGdaacIF18QYtMhH+0TsDHRJTe0+0QtF8u
	 SjCHqdG58hMFHGUwF5bjMKqg1vjdn81ztT3OhYYPCT5egwAf6XAYjn8jU9BcWUfV5vQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CG7+TFoB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DYwnFF9U;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E0260A2628
	for <linux-sound@vger.kernel.org>; Tue, 20 Oct 2026 07:39:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01E0260A2628
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CG7+TFoB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DYwnFF9U
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0tAdQ1211018
	for <linux-sound@vger.kernel.org>; Tue, 20 Oct 2026 07:39:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ilWLIrnHPQI
	kq8Nqks0gzeKHylePZhRJIyxsg1r+je8=; b=CG7+TFoB9NDdACM7U59ZGSYOThr
	NbCVcej71CkIT7xY6hEFtxo1+MvQjEFYmtqC6OR9S1N+eQ44j7MyNQ6dLae0leVq
	68RMe9vJhaq/KQNyfxyS2SmCsT1+Gqp1XrEDZnL9nA1bNpamg82gglaFNe4WTGum
	WfIIK43Kg6qXHGCV8nuUDpugFeYyJ633VYU83m0eL99ZteNniPGiTbvlt4qD/RJb
	YyWaH/NDXm0fA9uP1U3bPPBplRStYnqOI+Sl82M6XWbo9OmFwyTpgpUE5Hn+e96k
	69HzH/UUkqTZk8KkvQXTXcNG3rwrxr+Xkf350dP2AESz/5YdEJ6x6P1MlaQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5p1e31-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 20 Oct 2026 07:39:20 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-936aa34873bso577724585a.3
        for <linux-sound@vger.kernel.org>; Tue, 20 Oct 2026 00:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792481959; x=1793086759; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ilWLIrnHPQIkq8Nqks0gzeKHylePZhRJIyxsg1r+je8=;
        b=DYwnFF9URT09jmDi4LO4a4GNiROIIanjjifeu89ClaM/zQ1DN3eQeZ6g5vERv96xO0
         cergXPO28/Ykh06k6Gwg3RxF+kJgsJDfGwK3ATqdf7YRKvmgoumUOtRWz1lNlOP70UpX
         fpnk1NzJo6QTZzDjK1xXhXScBA+nNcKyB+6/INfzkLHJQvDtfqKZt4ly3LOwROyMC8aB
         oJ6eHGuBN8yzTVO0zf06LUDrYi1u3WfHrUuJcu87E8rFsoFz+nqIdO3GCGMeDLSwadiT
         baCtvzCjAyfW2TBtVsdA4LoNvXZ8U5pY8ht4tW0VjM5tYp9TeeOe4RWKsfXJmqiFviEL
         Z9EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792481959; x=1793086759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ilWLIrnHPQIkq8Nqks0gzeKHylePZhRJIyxsg1r+je8=;
        b=u1oUWuCsD1mNQvqGCR5J99HFbnxrQx3VCQgrMMXN95M5vqRgLneXtn/Ff6BFWYrL0z
         l1cUzmv83ke5ujqCAmeaHtIgHKN5CDbwbTT2cfyj4NFdg3LOy4TrPlLo2W8ImM5Xy80E
         5RIxnfzV3MaxNab0Ff2IDJL2FyilbTigZLGYUOYZdpH3KrxgmZEJia7h7sHAB1ofrsj2
         Bjg2mVlWkYMJMx9xavk9/vBZASlES5cG6M88nsx7h01ejVbK35YMVQzaWbJjcYSEmH63
         VsuY+4rb9X+iguqrupBsXxDaiprXTmxz6dhjS0osMqQbbUDBKV9xStIqcP+elXuX2z1Q
         qcIA==
X-Forwarded-Encrypted: i=1; AKwUvBy3DF1dw+n9jrHKKiy0YD/MvmFNTEe8AvWlKfKogHdAk/l9RDtydHRWoU9XIFCjOoDNfoZEI9ZGo1bk0w==@vger.kernel.org
X-Gm-Message-State: AFq9FYL6jmfQTmQLgPceBnrImNXZ5EbYvGtdrbc4d8d2ZLMFzlPpAzOL
	0xhPwJpJlXGdKZkuarNfz/ETOgBnJLA/tbqUdWa1y3L8IOzj5DyIDCOplZzCSovKBmkBHTYcNNf
	QFuHAIe2NMNh1DOwif8vaRvycmQF42eYmfGqw5yQjvQU94f4elqXM+2j7htDlzW4Xcw==
X-Gm-Gg: AYBFou2/lwqvczV7AO/74BfMXA/AS2zXHV/KcNiAW9Y5bOGnGTAIxDN+Le9ggOPgcxV
	FJlYeQYdXqC74sHde04QjGkQeyZ1n+0XsP9HJMclSTUvIxK2VcCieAd9vwYYaf+PIPKVT5vCn/6
	7rlnvouDby8INFtUPEsUDWsmTumu6Z3jKZ7E1x9KEfhmTER3yiejH7a4UrlCdqMNvrUZBPlY1Fr
	qEdwbq2KLPHABDtdgVoQIkqRvu00VoLo+opOh+3NIZFzina/8G+8f7WX1yTrI0ps7NJnrTXsHCn
	IACzAGXlJVCL28HQkYB94mQTPYL754t4WMb7It22KXEPizCmWeu02RN03/fzXdZ1kQNDAEyKv2y
	gzaxNb770XUBx
X-Received: by 2002:a05:620a:7106:b0:93e:722b:1f79 with SMTP id af79cd13be357-93f29d75a16mr1687329385a.53.1792481958411;
        Tue, 20 Oct 2026 00:39:18 -0700 (PDT)
X-Received: by 2002:a05:620a:7106:b0:93e:722b:1f79 with SMTP id af79cd13be357-93f29d75a16mr1687326985a.53.1792481957979;
        Tue, 20 Oct 2026 00:39:17 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d8208e0sm4566271f8f.36.2026.10.20.00.39.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 00:39:17 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Vinod Koul <vkoul@kernel.org>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
        Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Sanyog Kale <sanyog.r.kale@intel.com>, Takashi Iwai <tiwai@suse.com>,
        patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 6/6] ASoC: SDCA: class_function: mark PDM data-port terminals
Date: Tue, 20 Oct 2026 08:38:56 +0100
Message-ID: <20261020073856.1177749-7-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261020073856.1177749-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261020073856.1177749-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: D0l5dqJ4Ewlw2MIaSdna9c5p0azEnxC0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzMCBTYWx0ZWRfX/Rns1uGXuCqK
 fIopxi4eZdo9SEiM9ktcLHdeLAtIERb6E5oXQhD8dnJt83T9uguSZoMoGGOXVw2o3TgzJN4+jDj
 Eb+Mi4AVI6XZYui1XyedlPCQI/O9M0o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzMCBTYWx0ZWRfX1fMDDusTE2tP
 Slfy16l8bciW9ZL0Gixv4lpbq59g1elrHlAosw+Aqrj1r1k+gijS6Oq9F0MwlGj8/mMV0QpSA4m
 iz6njbsarG/g74BsJAgETOI7/L2RBqtVUfXJ0GvSxm17B0ki2MrdJ6Evevu8cJ3DxKq9BHEDq9I
 fkY1CxL0eeIHgA0UpUeUuY6/tx7yrHsJ6HxS9EQh/FIwJUV4x3Ess+suQr1IxLivxd8K1fRtk2a
 fCB2iaCSK7L7CZQ8+xrERhQ1ri8akf8vOzCof+g3fvdExHm+cKX5rGVN3uEH2dJty7VnAJ6YfFO
 Q1K2S+XOFuTrAelXACI9O3CcGTaGhSQJfl0lXbnHYfLm0rhr0Nl2/+KEWxLAFi93J7eluXwJ9/J
 FH8MgYoXU+5s92UIwXdFvldUd8tOeQXhduBuZOIiZ6OHqe726uXcMLEXr0TS7IZ5Ar6UxiIFgYO
 UxTJSj4WAyOFSUHsMhA==
X-Proofpoint-GUID: D0l5dqJ4Ewlw2MIaSdna9c5p0azEnxC0
X-Authority-Analysis: v=2.4 cv=crUOAF4i c=1 sm=1 tr=0 ts=6ad71aa8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=0o_WhHQcJ6e7tPDH-2wA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 bulkscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200030

snd_sdw_params_to_config() leaves sconfig.type at SDW_STREAM_PCM,
which is wrong when the DAI is routed to a PDM data-port terminal.

Set sconfig.type to SDW_STREAM_PDM for PDM terminals so the SoundWire
core sees the right type and does not enforce bps match against the
PCM-container-width value stamped by the helper.

Assisted-by: LLM
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/sdca/sdca_class_function.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/sdca/sdca_class_function.c b/sound/soc/sdca/sdca_class_function.c
index 13b70f0f0dbf..41f6f0eb8563 100644
--- a/sound/soc/sdca/sdca_class_function.c
+++ b/sound/soc/sdca/sdca_class_function.c
@@ -142,6 +142,9 @@ static int class_function_sdw_add_peripheral(struct snd_pcm_substream *substream
 
 	snd_sdw_params_to_config(substream, params, &sconfig, &pconfig);
 
+	if (sdca_asoc_dai_is_pdm(drv->function, dai))
+		sconfig.type = SDW_STREAM_PDM;
+
 	/*
 	 * FIXME: As also noted in sdca_asoc_get_port(), currently only
 	 * a single unshared port is supported for each DAI.
-- 
2.53.0

