Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792775887;
	b=ZuR0rzq9//Y7I5rUcdzQLmT4IwCaN7p474zKm7A3kX0tFV6Lzd2MwjnA0e0ELbaUtYld
	 2Cz2ox1sYVQMc//a10QVdZG37zhOlP4VHAbMm7MOktVN4HfBxtgOjb6bQrsl+dnEP7rLs
	 ir8y5vvAGul3Gq57PDZII1lgwf/0JMy0x0lglgmg5E22FB6MUGqNKXbVZxJBrY3DyVwLO
	 1Z2On6JcG+lkSiO9ezpSDyA/HkMJH99SNwFclXe38R2vnXJAO5xoNQWK296n5iXkMP6iO
	 vBl0+gZHMbPbP4+rix5hRyvij62oNxx67dTkW5BFuwBGmGyl7ooB5obdDJFtA73pCtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792775887;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=q/+cvFopqQv28D3/PiFB85LG7/G2XyD0ZehhDNJMlX8=;
	b=oaPIe+WnKRVLUKBAjMYtTYr17NZEpr5N4Z3Kh0CkwoN/Ibt5fRoKXnL6Zoxb1oD9X5KP
	 GT7xXfEIaU67JSsoiigqH1h2FP0fyu9DUh2PKyMLlYtNqh602vfk5OX+HfXNXFo3s2aro
	 3OjsUo+aYOJN5FQxAI3j/LuCSyRNXDwLzoqdDeN3ZpMMHa/ipczHHGnybiW9eZH4jHf78
	 9pBKbBxaP5JHIDERww9FlhMlijuNxhAo1yQ0AcyrCi+KnokwkSLjpK8BcwU50lxAsjE9P
	 SuEpKTJe+S6IR1WrDI+Nu9nuNeSxWTiwYuOWeBVFR/X5DtvItp5YQMNJU00wtPGYnrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Yvstzu/p";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SjqJq5lf;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0EFB60A5BE3
	for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 17:18:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0EFB60A5BE3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Yvstzu/p;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SjqJq5lf
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE5vLb4063351
	for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 17:18:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=q/+cvFopqQv
	28D3/PiFB85LG7/G2XyD0ZehhDNJMlX8=; b=Yvstzu/pqS6uvyJ8PgFi+yd3AqI
	oHEjJwvjti+d+C/OTu9fcHwsIOxBK0U2viS0KmJL0xaXFhovRwCU2w0mTi/J5dN1
	O6sNIDsQAjB2ZX/FxqErUVFgBS2Kr/n7Y4mdzS50Gtk+4iC+hZ+DWXIjX0kGRMKk
	QONX7Mw7yI1vOu7b/QyMRgk5EAnIGI6JPhaYSZJIBvBjLasmLa+XZFKz8j3q81b2
	TgkSvgCwqL3wMT8oS5W2J36CDeYM34nTmPRKJebcdY+RZaMweLLQjhhNfuBVsBFl
	17HxkNFF/+e1qn+rnHu29CUdP1aCX9nsK5uG1h8BMT/dCFD4F/MifQsiKQQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmrcrb0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 17:18:06 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f20addba1so213658485a.1
        for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 10:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792775883; x=1793380683; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q/+cvFopqQv28D3/PiFB85LG7/G2XyD0ZehhDNJMlX8=;
        b=SjqJq5lfTS/Srt505f3ZfyPSqDR7WSW77k2dFjdOup4Vv2ghDfXcSK6eEUjelIEXVL
         urEVd86oJGxqj8TG0fBiAPr4C4JturZ/+wxoul8YEVR5f5VWswFTfLRIELYGVfoGapHs
         FYOesTEprzyl+SVcO1DAnOfpIhrCx4xWjCujfAZPRI+2U+PzHpXKFEV2uQPUIO1+bTkX
         k2izfHjBM8W4lpGxhDfQrhN/Z+FSHz4GjBy/fh3EM7k5r4E++jCR1Qtq3/kg2M1ZzU4O
         GuXObV/L/N4tVsGvtCX42LZRFWMA+CBLmva4cmahJCh86WUhDGb0JoHH1is8XwiPUyXk
         oyUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792775883; x=1793380683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=q/+cvFopqQv28D3/PiFB85LG7/G2XyD0ZehhDNJMlX8=;
        b=BgdvM27OXB6HRzoPOF5CZDAJYt16nJQt3UenS/q5otauZNWzlmZPZuewmyxPoIR+2j
         aCCCnJxmrSlc4Vk6urzMep8mVyO0tAB7jS0+59CSImElkSBz7A1Vg4ktLQLv5vtCA3ht
         s1fCSjL8M3ILZ+Iatf0Lo/oNgHd9kKQs3KYwmtCtb3amXUMyYbkmX9zfd56dIISGQRYC
         46qF5jAWXa6OHMfC2AJwxnT7qvTDSHoY87epnCK3GZCCMxZyt81G9rN4aClM22zrTeF3
         nYN5Upfso2BhRttyJWDBLSYfxxqrJx6hndKNVMwVS9iYkfi4c7MV8/CsR3BbeDP3/Sif
         sZLg==
X-Forwarded-Encrypted: i=1; AKwUvByugec8RRlZe0uKyWYdbZPQUVYNx74Umug36uwdnlDrQuHwEWgN8QWqx1iCwWV98G686UbhKfC3iR5ibw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJxs+eeQ2QvJbz3ZFjEzl2APWwgRuA99HEoZ04cPUvpwFhvjxiW
	sYTQZa8on8cC8dAQzsK688ed+LzGUH3RkXzAADNgDEi330ogiIeT+nyc4zweN3piMofiLYesN1f
	vpiq8oot2z4/8FnIxepOGcJdeJIRbc34a/yVDXV3SvxVlU1TA0kIE0cEIsfosIYBm9A==
X-Gm-Gg: AYBFou1rkd4vBb2IZo0QT7BiZl+cgj3dpnycbyfXetRH3J/yvn0IqWlzI0fUdqNhS3B
	7rPzzTmyw0uSPSfBRZR9cgNTgSoe7jNA//fhYtbQvpSmFxhWBTxdXZaLmsPCOZJ+wt4pO2AZjPt
	tQbuKWl7P8E18lZZcYKCl5tFZ1ICCnt+JYvQHiAyxjFP4fppj69ouHh888XPX4/cOuYGT1WYVfE
	3vu/rvYIZIUlMN/f0s4c/vzxJQi/odxtdbeUSIkv5Sa/VGOTQr4j3EdNDdgTrrZE/jWKVGs+/pO
	aXzttvqKzqIf29OG26UQtojKX38RlnvbvRmy1dcmEQlLXB73zDWm5PyDsRedAlgSFBKvXImXjb1
	Qn/PqTYdioxCN
X-Received: by 2002:a05:620a:4725:b0:93c:c1e8:6504 with SMTP id af79cd13be357-93f6f7dc78emr554391285a.23.1792775883218;
        Fri, 23 Oct 2026 10:18:03 -0700 (PDT)
X-Received: by 2002:a05:620a:4725:b0:93c:c1e8:6504 with SMTP id af79cd13be357-93f6f7dc78emr554386285a.23.1792775882595;
        Fri, 23 Oct 2026 10:18:02 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d41e0fesm937475f8f.46.2026.10.23.10.18.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:18:01 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [RFC PATCH 09/23] ASoC: qcom: q6apm-dai: add S32_LE format support
Date: Fri, 23 Oct 2026 18:14:19 +0100
Message-ID: <20261023171433.820092-10-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-GUID: uYDE_G7VkMsKG-m-Qxy2hUPnfG1OsxQn
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfXwTTOhzY8MR8w
 EpCf8H2NgyyM0VzVfc2e1EzYlDQFCnQAZ2PSxHqSzn+J6XS1dvkURQoUlV4ExyBWT/91DS/D31T
 +LmuCfyr1suNVTWzbwq0Uha0PAvmzmU=
X-Authority-Analysis: v=2.4 cv=VNZIDNPX c=1 sm=1 tr=0 ts=6adb96ce cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=0GeEMZVGUYcv1euD6hYA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX7WCaBEFt8fx2
 T9dQn3DMAmXmfErMo6X0hd7uaWT4a9QP+g3kcGXdXzBdZ59wySm4elG3WW4fTIW9tfdnMXVPV9z
 zCiRTSaSsx7G5Fq15/CY+g0lqmFKQ2c6DNqxhLtzO29tdIE+O5pFLVsKqOrLOksa+gorzN0/eBf
 38C+WdVuk+3VZ4isEMO6+QGDfY5iMYMpYHL8ruurvi7qY1OTGODYQWT05Qw+guwwMinwPoskLAS
 JN4m7Yj24AsNu8kf5/mrP873YYN/pwPDVQYUHvv6MIqyq00tzURjU359yPK9oB8k5JYrQhPLHVM
 jysb4Ty1Qy+ysggo0iT41kfaQn4jjGlOAFD9Ztffbxg8ZnS0HDsXrV1K0Iw1qRJDO/v9+bWwMOi
 ea7h1KbhFVuth2O0j2YU5CTAzEsRdvEi2/xbeMKJh0tIw29HIfkycucBTlaulFKeljjQTjeYwKm
 N2YnRdUYOgrDp93k88A==
X-Proofpoint-ORIG-GUID: uYDE_G7VkMsKG-m-Qxy2hUPnfG1OsxQn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230067

From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>

The speaker protection VI capture carries one 32-bit V/I word per
speaker. Add S32_LE to the q6apm-dai formats so it is not converted.

Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm-dai.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index 58beaf906b9f..9002acf0e0cd 100644
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
@@ -641,6 +643,9 @@ static int q6apm_dai_hw_params(struct snd_soc_component *component,
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
2.47.3

