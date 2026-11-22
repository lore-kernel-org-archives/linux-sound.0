Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795364109;
	b=G4P31ZcwzpMOoR77apJ9crY/mt5pxuur6eDEjkgvr7nHeW62ayE21Bm7uWpMDQTrYKU0
	 zmOHA6RSHeKtUxWW1eUb0bNnExmIvqf7dZumsuqp2ovxYWH9U1GhObE9VShiAflQGY7ks
	 oWenFow3jDTt7RPbvYpd3N9II9kd8kzOT4Iuvuuctp8sOloNarVX5PSUTzmCEk3/VEgi8
	 ylJvS9EJj/GXrkyTDSAwWRtFgswaDUfhpmR4o3q+wATJQAohMECng6qYBbcsJyi2c8Hai
	 uaM8hUv7BHjTNBRjcYgGZ0i10ta5HVqX3p+DGM2RjMjSKqr9F8qqfgnNw6cs+bMDrWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795364109;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=s7yG2kXY4Jn+xRpX2TDgFE/suD9qmFnNufz4gf4AHV8=;
	b=oHOy1eUHf6BoXcRUvYk9yPtMeLrxReoGD0GI2skt8DjVz+UirjDzpL48xXTjyvf6xZKz
	 UHcx3NtFVYDp8QWGJjgKllO0asES0K10WIUPqziauObkr1hMXeQ95C9HqPDTH5UCb2GVH
	 MuKwnRPZnRhOttCbducwmRun1b/hW1IzWHM38GClbJJG/3EE6eRDGnz7BU4XtqqR3R3L/
	 xQSLq9rdSzZaBWs/2ZnAdTtjMPldHo+EeiJGp9dRX3WN6d4C39qc2jmWhH4GJSGqOzvu9
	 /xKE0VRGt6JiOAhYJkFzi8Q0hdUWJiT3d5+dxR5u4R/C4CM3asbyRToKOtN46kFrbsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Xi9h5i9b;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LLDu41YZ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B3960A5BC1
	for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 16:15:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5B3960A5BC1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Xi9h5i9b;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LLDu41YZ
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMFQIdh3495085
	for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 16:15:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=s7yG2kXY4Jn
	+xRpX2TDgFE/suD9qmFnNufz4gf4AHV8=; b=Xi9h5i9bgGoE4JL5X8INRZkm2m8
	RnEGRn3wCA8EYxnsv6G26qZ4nHkFtowVLEEyeJqOHYMjyIB6AECNbsyVrldAshwJ
	3dRjCnmSGFQzENLynWfWK85ZpzWUNYzMeZSLVPWGBvd9N3fteopX7+sW0Uu6oNXG
	St/T3tX302/jQIA1Ij59xF9tUEXiuDDlD+E7e5JtTCvVvnV/2+OYKBSYjj+LfMth
	7YtyZISbGmhxMqkWqSJTsovTPutdD3sNOqjy8py14gvXoFAZN/u4qFob5OsESlHO
	bE6S57ruJAT3faqtq93hX7IWhBydWEQLOwXRm/OWaE0s1no+jgZYaK7R5rQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j32mgbtvu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 16:15:07 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-946038e22f5so549116185a.0
        for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 08:15:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795364107; x=1795968907; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s7yG2kXY4Jn+xRpX2TDgFE/suD9qmFnNufz4gf4AHV8=;
        b=LLDu41YZ5P7YFZzHnNeGbdTg4ztt8cJ7KSa8Qz3RCbSEQq9pb0ap///GcKmGnn02FP
         ej/je7EaUOuEe4AXS2Y/0hIuqSkVjaJuJ0k1KSm26zfgMCNQH9BzgHTZsNXhywHLXABP
         DLfU2D2+lvMXLhpXn05wt8i721rUVdZTN5OGHh650GpF/fABJ8tneObrJJChxtneZkuA
         VyxziWipfeFjBvww1Qquacg9n+aRnb89fUP3/oZm3gTcVUykMmlv2C3eQMAdOVJJzCVt
         ralzTEGc7/z1GbF4pA9UdPedhZZBLbUAvMP+BvYTMTTKejIKu5JRIaaJiRg66afmdhyv
         Utiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795364107; x=1795968907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s7yG2kXY4Jn+xRpX2TDgFE/suD9qmFnNufz4gf4AHV8=;
        b=qA/UnNfc6TrVVcSRsdKcfnw+8CeH8ZwOqWLVT5mEpA8F8XICMPAxtHcNMkvMzKw7MQ
         dpykMjnjM6UKUE/4FiMKGZpKityvHC2bQGeHy5RVfoPsRmhmwY0SNIud6PZkchaZhUW0
         x4rfeYiEepIdmjYeZCyGXNQNwWYymxzXV+59Ts7KL4cYW/UA4RLGDbG/2FEXzc6IRiWX
         2IHfbBEcNsA2SYcrlS6JGSjTpD/O0BqT03EPQ7hnhoCJ4a/rfXf98expsia/evrw6i94
         +MpUMdxOpPDDfcUw1QQhJUWb0H4R08fb9jT8+qSElNJk4E/uhO0AKYqgEs3aB8bDukGJ
         oQWA==
X-Forwarded-Encrypted: i=1; AL+hErG75mU9g58V8i7qa26p7kpEymNqYiw0TAhYWrTzsjZEo07r4euhJ20X94Da8Nluw0b6vKkSVpYi7brlIQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/hNIOXNs4xXnKMND3DHcFDFhemzVbqKwZ3Sv9ICoHLFUbBsXxG
	GC/kMwflEHO9xjOm8c2fV6wQcVgD92qnSfA0itDHZIh+nOm6GoCgxHu8MDAa2QupKQWnNs2QlAy
	ga55Opwq6i5klluzB4nsJLTq2Sx4qVLEDz4xO0om++TN9xghy9TDf6qNXMcGi3s44zQ==
X-Gm-Gg: AZFdTZdnkWqnrDlPmTBgT0GJCvdFf7yk8qy1S1Ieff5RsLFzbv89o+lhKOLMiQTk6Jl
	T/pkWtBVROvp95b9PQEmd36TABtRBzcJf/9PRJKjVFqkX7ZKUyFkU8mRZSflE6/hspK37eXo66/
	uyPLFC+2EL/5CiEjz9U3VxAZ3zGDAa9VDrFEufHXvu9QFE5lC2okFeFAQ4HZnGWCxI1Af6wFmw/
	/avdO8F7oE3HCfIqP9NfZAFdIVMUsq9Ty3oUwpJeVssIl4O8eFesmgS60uXtHeeWiqYvjOIM7yJ
	ReWI8gMPoq54qiYj+Rii5p2GS807wHsQcEiQlIXstZ22ApScxO/kiZG5RbfeF78pAnhZdwt1/82
	EKgqotp/CBjkZqm666FbACmXoA86P3sHsEEWFvQufzd+2cyuBY7zfMjiOIMBWTtLI
X-Received: by 2002:a05:620a:1a28:b0:949:8639:ee6f with SMTP id af79cd13be357-949bab25ee0mr1581395085a.46.1795364107013;
        Sun, 22 Nov 2026 08:15:07 -0800 (PST)
X-Received: by 2002:a05:620a:1a28:b0:949:8639:ee6f with SMTP id af79cd13be357-949bab25ee0mr1581389385a.46.1795364106613;
        Sun, 22 Nov 2026 08:15:06 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849e598sm239042665e9.8.2026.11.22.08.15.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 08:15:05 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 11/24] ASoC: qcom: q6apm-dai: add S32_LE format support
Date: Sun, 22 Nov 2026 16:14:24 +0000
Message-ID: <20261122161437.5994-12-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfX2jkoPcRqE2+w
 Mrfj7clJaEAjjGTE67UNY9Iqho0jJIZcpwkbnX590yL10FoE3Ir5kvumBKM3EYq2lHw4I2WyJQj
 KQJzMj/q0K2x14RLy2w1yGAecZDsi3ZinskqBAp4gdEKUL2Wr0l/pCmpadx5YEUfp/2xwfW7L4G
 xb5Un609VlmFIYs1av8C+XqF9yFhi/vh2xOVBDj4+Rv88kVkXEIpDXGH+NYM2mgCrx4LsZgLU12
 vXK6jSlHwW0I2ETdxIMpCP8bE07KyI/tzuDTDoIMKdfAXDecUs2INX3AnAg7tdVftGXIvRpyPOF
 zQnenL9DgmGUEjuHDIkDege2OUwjYRtlfD5BreR414gUcnMc/LEv86PkWwUlZPTl78rqxse1XJH
 lCR2zTH0CiPN/6nfk4RvcjP4O+fjpCYvAw25RR3MCpwDbLncOxtH/3imgba5z+Kn2lRVHxmoWhE
 UVI8HRFA3o3XARpcmQQ==
X-Authority-Analysis: v=2.4 cv=OM+yTiaB c=1 sm=1 tr=0 ts=6b03150b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=0GeEMZVGUYcv1euD6hYA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfX2kPqxtT+RCW5
 S8ljzrnHua1W5tadaZXOz8uktO5hiM3iiyXWVy99GISUnA1jQF9mySxmL47dv1Fzwm1BZ9fX8fC
 QlR5StWlalogfAWmlRi/KdnrRoYM4C4=
X-Proofpoint-GUID: XRJ0CoKtFZeGywu86_scsnlSFngKUPwJ
X-Proofpoint-ORIG-GUID: XRJ0CoKtFZeGywu86_scsnlSFngKUPwJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_03,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611220064

From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>

The speaker protection VI capture carries one 32-bit V/I word per
speaker. Add S32_LE to the q6apm-dai formats so it is not converted.

Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm-dai.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index afa4bb095e09..4a86e7dd48e8 100644
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -202,7 +202,8 @@ static const struct snd_pcm_hardware q6apm_dai_hardware_capture = {
 				 SNDRV_PCM_INFO_PAUSE | SNDRV_PCM_INFO_RESUME |
 				 SNDRV_PCM_INFO_NO_REWINDS | SNDRV_PCM_INFO_SYNC_APPLPTR |
 				 SNDRV_PCM_INFO_BATCH),
-	.formats =              (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE),
+	.formats =              (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE |
+				 SNDRV_PCM_FMTBIT_S32_LE),
 	.rates =                SNDRV_PCM_RATE_8000_48000,
 	.rate_min =             8000,
 	.rate_max =             48000,
@@ -222,7 +223,8 @@ static const struct snd_pcm_hardware q6apm_dai_hardware_playback = {
 				 SNDRV_PCM_INFO_PAUSE | SNDRV_PCM_INFO_RESUME |
 				 SNDRV_PCM_INFO_NO_REWINDS | SNDRV_PCM_INFO_SYNC_APPLPTR |
 				 SNDRV_PCM_INFO_BATCH),
-	.formats =              (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE),
+	.formats =              (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE |
+				 SNDRV_PCM_FMTBIT_S32_LE),
 	.rates =                SNDRV_PCM_RATE_8000_192000,
 	.rate_min =             8000,
 	.rate_max =             192000,
@@ -643,6 +645,9 @@ static int q6apm_dai_hw_params(struct snd_soc_component *component,
 	case SNDRV_PCM_FORMAT_S24_LE:
 		prtd->bits_per_sample = 24;
 		break;
+	case SNDRV_PCM_FORMAT_S32_LE:
+		prtd->bits_per_sample = 32;
+		break;
 	default:
 		return -EINVAL;
 	}
-- 
2.53.0

