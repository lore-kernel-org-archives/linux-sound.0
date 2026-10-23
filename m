Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792775912;
	b=OXx97sCMwYD2VB/ig+bKWorKtNt2ELzr/vnjyKdh8sepIlznW0QygDkssrvOJsat/k0T
	 V1gEMjnbciTLrOjO0+nXcXzTChHz4SBMOpLfe7IjNndYFK+7MlWXoNqvIFRjpY6gLhZFf
	 PRi8ENJ9vY7GxAbAz9gd5oUSQatrd92nM4BcFqAYznxHXRkTUgZG4L+CLRO4SRzJSU9cA
	 kJTOwaLoMaujx++wBvnL8aeAyVl6NojZFmiK+auFLut9mxvnngnXoTArZj0NNcc9/fjMX
	 ADADLRX2A5tsKNeRfK9Kwu2lROaqb4M6ZHGw/ZPry+0UblqQNemCAeOCTECBjgXh1xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792775912;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=J7MeUmGzDc31SgdSuHsk12T5/Bjqex2jk8PVtUzDBw8=;
	b=ZeYfA9lPvoL6QrqX0LYCifsI+yrVxwarFWzDCL8CJqJBGRvBb/FfyBFv3evmwEVGzssL
	 i65/NDJd/MmRLGg2GvyRkkuciHoCHoVjcUaoXsjLk/iQrOulZAOHtNQYZA68vJVI3zPyz
	 kdAu/zWWDqNsLIF/DfA7ClnWIACWHL8Y5D5I06MVRP9t9orw3qTIhy1Bf0s550wACzmbY
	 p8eaHcfTLiU5WzG2M0YnR04Jd9rXsrYEm2P19qM2YGkj6mZlKwJaAA266M7nGR1V/7Y3X
	 ICUo7EDtA3SB09WBW2D4Zz5gAGj0SSeUVg5kYvhm6o3fXpiZzy6NxkhMtHAX1Rd7yCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="h/lk/pa1";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EE8Ac3mH;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB9BB606DC73
	for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 17:18:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB9BB606DC73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h/lk/pa1;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EE8Ac3mH
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NG6CCN2215802
	for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 17:18:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=J7MeUmGzDc3
	1SgdSuHsk12T5/Bjqex2jk8PVtUzDBw8=; b=h/lk/pa10xaS0W9NPAlVXuIeZy4
	nsospPMSTOXpvfI3Jws8BB8UyU7LWi03hBshcp6IGyida/0d+NaErNFwDga4ZaoI
	mzRR6EC8hGj1TMTCnBuQ0q36x8PqNH8v4KLhQsiHVcK8dDIs1CYNNtB+mlFetMNA
	X+NkLlH1DLqn7VaJ3jhogzi8m6vS2KUwoyBz9LQIOJtdt/zGQ5UmRfVzy0LAQn4T
	4O+WRUqBgUvfLgYWdM6OHSrU8maY1gLgaYNoKECXdMnMIhG4ovPCZiqX4UxqZPE5
	9BlLqSUmo5k10ToscXZiOwOgbe338CNpTysrtbZGC2v2I5vubGFiNMj79UQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgatc8965-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 17:18:25 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f1e62510cso277435885a.1
        for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 10:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792775905; x=1793380705; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J7MeUmGzDc31SgdSuHsk12T5/Bjqex2jk8PVtUzDBw8=;
        b=EE8Ac3mHJr6uB1KYgk3L6WOhoXv0tq43n9ZdmqxU0UOCUohgqclzj1dpO6+Bl1rRsu
         wIotEGBHcgvLQZJ2lzQfPpDb6E9RW4QhZtNS/xuL+uowd4Sk06a6p0yV50pjHmw6vhgV
         ySucElvQFFA2m7x1djfyMk69mxMY+5Z9Uv/2U35RV7w+VtyGUcOPc3pLaI0wHb/fmWYF
         xahTK08O0jRcos0eTsd7Z1JVOujslR3zKeWGQW16LRNaoj8EEAmdAKrrRYBQA3s1gpFU
         su+4FCiK4VlMOTRbJE4zZXC3kPbWY3HpOWVKB1je4SyFQv6qGZsU84A25kA3QxjuELn7
         8ZWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792775905; x=1793380705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=J7MeUmGzDc31SgdSuHsk12T5/Bjqex2jk8PVtUzDBw8=;
        b=1MhuIJbN7ATs7gjPgRS4YA0UtAodCRcWkkb8ImXlsiD3dCS35gac5gPmCZ+jEGV7Gu
         aFO8VAf4WsZNT/x9MstsRtX/sIViG+NC/OHkc8JeV8KUoZWdY+aNTwBicadsQiAEwOdF
         Wv6WSlPGtngV+uxaYpTO1Ty4GdnKANzBQbzyp3JVU8tboSL7lfatQfWLYnCaj7tP3mMq
         yG8W3YSVc/U8PV1HCqE2ANM7SP4fL8C5aAVwWBSJ+PUQ0mRkDiTXQVT9kSMMpnkKNwr0
         bDDk2cz7iKYRHt2zT+Ih7tNX1OVLIsXHPP8G5Ypocwzfd261RbD5CEpu4z9TgBxm4eZ/
         TFZA==
X-Forwarded-Encrypted: i=1; AKwUvBw713TOj9PP03gV3M7QzT7WdWwQA4jqn4A7Lqnkt+Oq4efUVH40eqEd7Vsjgpf9Yta3Wc2ClYqKy4GKkw==@vger.kernel.org
X-Gm-Message-State: AFq9FYK5iBKZkLJBoa+oOeyR3Wm4+zpmDpuczooblhUke4QclT5/mAAe
	OGD0IrCqDlnBvPOaFMukHr+skLZcPOSJBChVAzpu91tdsg0Y7CP6zF7KHpmRARkOUver49V4cX6
	jub/8i5lRt2MHu/mduF2CsrCdQ3SkkmXkknBD9H8Kbf904SbwPBuNLzYROrwVMh+f6Q==
X-Gm-Gg: AYBFou2ghlcvfCUilDVLvdKRMyvMasARyc4lT44os29F7+/9GbfsGF4+Ui6t+pzMt81
	CHIJ3hb9OkdFE6IEH19OEHLPPO9o3VP3RUOMrWsUB4cTFym/pE2DfXNI7plzIfsBLRICOO+G/o1
	iI2Z2v9gjhCdAOgaFFPTRSYL7qVlDvp5Y+w7/q0rINFG2DKIVkk610MfVI6trkwh+8wqX8CcCWF
	ECzgR1MgyTbXnyybAnFqDsvNjxzWG5juEzmY157BrYo9LJcvxrcC6Ht4gGLsU1EWB3EJZnimCDB
	/lt9rD0EDtZm0sFsPWXa55eU9LMmTqsKN8gNmicxlXHL3DSbN9idqTNeTVPE41hxt2JTOuTiL4j
	ES3UmnTv/FJKH
X-Received: by 2002:a05:620a:1a28:b0:93e:96e0:25a5 with SMTP id af79cd13be357-93f6f7caf5emr537787085a.41.1792775905069;
        Fri, 23 Oct 2026 10:18:25 -0700 (PDT)
X-Received: by 2002:a05:620a:1a28:b0:93e:96e0:25a5 with SMTP id af79cd13be357-93f6f7caf5emr537781485a.41.1792775904509;
        Fri, 23 Oct 2026 10:18:24 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d41e0fesm937475f8f.46.2026.10.23.10.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:18:23 -0700 (PDT)
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
Subject: [RFC PATCH 21/23] ASoC: qcom: x1e80100: register WSA speaker thermal zones for speaker protection
Date: Fri, 23 Oct 2026 18:14:31 +0100
Message-ID: <20261023171433.820092-22-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX6G0IAWFspD6V
 1sGv7Mcnu+kCwMRnxJ6eXTNt9tBaIpqP8oTZh4C2edC9McwZHRhzq9e0tCM8AUiJA6LY0jD7lPo
 ZW5VXxnY2Fqw2jEVwqmimw14kzRMChO0XN5SH3yWvrqOYLgXpjwi9L07S2Ykp0QE6OVBhQwfT5l
 ZYqExmODZ5N5QjHLcUEccLcHC5X/daT4wGBnjwLAXi7KFPtCIlzyat8nLcHAO6CC8BaqROT0xlo
 iNBYoDGBUOYjI5ZFtom/c6pqVjfZFnmv/iXSAmUSMAbfVGuF4S9nJ2WVneeqkLZBcIMnqL/y/oJ
 L5DTmkroS2SB8xf/UwCwKOeVojcoJ6YYndWbhdjE/O9ZXe/YRB+zfhvTohxTe+XPh5ZhziBx/B7
 9JJS6d3vhVOuG+ZDi6L3msAsFmlHfCkQgHGQzkYk4ShN3TVK83wPr36ZgXyoMpbWrcEXAathqUG
 /fzUgKpC18hkL0LpdmA==
X-Proofpoint-GUID: 4jJFxWm7vinVKW8as7zOWoUWHoM-Oozk
X-Authority-Analysis: v=2.4 cv=Scxi5fRu c=1 sm=1 tr=0 ts=6adb96e1 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=CEpVYLg39VmosHVYFFMA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 4jJFxWm7vinVKW8as7zOWoUWHoM-Oozk
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX2fAU4xC3DxTl
 wVCKQya9L9IJlOkGpXcRFBviGlnBMacxEPewnMXdmVKGMMShtVag+ZZju5YWYHySWWqE31HzAkT
 q54WW3lkgNfyW5b6PghmeY3oSBIXcFQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230067

Look up the thermal zone of each WSA884x VI DAI on the WSA Playback
link, in DT order, and register them with
audioreach_sp_register_speaker_map() for the "Speaker Protection T0"
control. A missing zone is logged and leaves its slot reading 0. The
map is cleared when the link is torn down.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/x1e80100.c | 54 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/sound/soc/qcom/x1e80100.c b/sound/soc/qcom/x1e80100.c
index 23a28c60bfb7..8cf7dad37c7f 100644
--- a/sound/soc/qcom/x1e80100.c
+++ b/sound/soc/qcom/x1e80100.c
@@ -5,6 +5,7 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/soundwire/sdw.h>
+#include <linux/thermal.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
 #include <sound/jack.h>
@@ -12,6 +13,7 @@
 #include <sound/soc-dapm.h>
 
 #include "common.h"
+#include "qdsp6/audioreach.h"
 #include "qdsp6/q6afe.h"
 #include "qdsp6/q6dsp-common.h"
 #include "sdw.h"
@@ -24,6 +26,55 @@ struct x1e80100_snd_data {
 	bool jack_setup;
 };
 
+/*
+ * Register the thermal zones of the link's wsa884x VI DAIs, in DT order,
+ * which is the VI channel order.
+ */
+static void x1e80100_register_sp_speakers(struct snd_soc_pcm_runtime *rtd)
+{
+	struct thermal_zone_device *tzs[MAX_SP_VI_SPEAKERS];
+	struct snd_soc_dai *codec_dai;
+	unsigned int num = 0;
+	int i;
+
+	for_each_rtd_codec_dais(rtd, i, codec_dai) {
+		struct snd_soc_component *component = codec_dai->component;
+		struct thermal_zone_device *tz;
+		struct sdw_slave *slave;
+		char tz_name[THERMAL_NAME_LENGTH];
+
+		if (strcmp(codec_dai->name, "VI"))
+			continue;
+		if (!component || !component->dev)
+			continue;
+		if (num >= ARRAY_SIZE(tzs))
+			break;
+
+		/* The name wsa884x registers its thermal zone under */
+		slave = dev_to_sdw_dev(component->dev);
+		scnprintf(tz_name, sizeof(tz_name), "wsa-%d-%u",
+			  slave->bus->id, slave->id.unique_id);
+		tz = thermal_zone_get_zone_by_name(tz_name);
+		if (IS_ERR(tz)) {
+			dev_warn(rtd->dev,
+				 "no thermal zone '%s' for %s (%ld); SP T0 kcontrol will read 0 for this slot\n",
+				 tz_name, dev_name(component->dev),
+				 PTR_ERR(tz));
+			tz = NULL;
+		}
+		tzs[num++] = tz;
+	}
+
+	/* Also drops the zones of a previous bind when none are found */
+	audioreach_sp_register_speaker_map(tzs, num);
+}
+
+static void x1e80100_snd_exit(struct snd_soc_pcm_runtime *rtd)
+{
+	if (snd_soc_rtd_to_cpu(rtd, 0)->id == WSA_CODEC_DMA_RX_0)
+		audioreach_sp_register_speaker_map(NULL, 0);
+}
+
 static int x1e80100_snd_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct x1e80100_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
@@ -34,6 +85,8 @@ static int x1e80100_snd_init(struct snd_soc_pcm_runtime *rtd)
 
 	switch (cpu_dai->id) {
 	case WSA_CODEC_DMA_RX_0:
+		x1e80100_register_sp_speakers(rtd);
+		fallthrough;
 	case WSA_CODEC_DMA_RX_1:
 		/*
 		 * Set limit of -3 dB on Digital Volume and 0 dB on PA Volume
@@ -192,6 +245,7 @@ static void x1e80100_add_be_ops(struct snd_soc_card *card)
 	for_each_card_prelinks(card, i, link) {
 		if (link->no_pcm == 1) {
 			link->init = x1e80100_snd_init;
+			link->exit = x1e80100_snd_exit;
 			link->be_hw_params_fixup = x1e80100_be_hw_params_fixup;
 			link->ops = &x1e80100_be_ops;
 		}
-- 
2.47.3

