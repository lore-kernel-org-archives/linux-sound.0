Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795364124;
	b=x0HtPbd48Px1LUBOmvHfKiiORX4YJaRTrVXhwVYgvoOjSc4RVg1tG35cwdfWd2aMzTCm
	 gMv46tnJX7huU/Bhn6OWT1mI21BNNnaCSXHKSh2cnmWSewS6ivMeihsAaoLmNDarTMxE9
	 ZRAHk8Hx/H7E3984GFma5B2h3YiWvOijxYgaorp64+8CQPhgCyG46PLwpAM+rdPeJJxwa
	 8y3QQF4yF78eAUCsPQiXhS94zTKEFbtuZYRGgmEnMDhiCMsUzmaxToI3cGa0nz8lU9T76
	 h1m4XukuhO/f7wcuLJrjNgc6ZgnErPyXu8FyhLyP+BbvkgJRALZ1QUiJHLEr+rADNjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795364124;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=wgX1SDVgjT+JuUO2+RmGmUy8lTeZXxevsdaO3KUTgRQ=;
	b=QGkM0Er1FkntJfLezcFLzVLVMF3sznOFxPpdW7GsVBVb8BkyoWRLulqOqJzQ3xle1syV
	 uQrpBOSHeBCUp5rGJ6CV4J35oM0YhT+WdnyBBti1wPXaJERKppJVrsG7sh0w0aWmBJbyd
	 yg6iHvUgh94LKpDRNOt0/erGzfIitSQnhrxNk71ieSqSAE5YnOnEQeIrXjbfptfFPY+K3
	 L7SIRIQlkEumbtWzfwaI9HXyG6Y9L8Ai1HyBvTAiYh8Fh9XZRJzOcfklrgGeKhMp5cxTK
	 VdHBE7FlJxfVFOXN5KpcpUG2oz97DVQ9k951DhfTDtSEnOgbJXgzNJoNvumZXUinSDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e5FllKDR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Blm1qv8g;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E94606C56B
	for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 16:15:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93E94606C56B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e5FllKDR;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Blm1qv8g
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMFR72v280794
	for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 16:15:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=wgX1SDVgjT+
	JuUO2+RmGmUy8lTeZXxevsdaO3KUTgRQ=; b=e5FllKDRh9NXn6q0XQCwIuN8PWV
	fPdccPI43ldZ5vvSs2zXxfzLttSwLndRyw3JJERT6uBmHVNTKZIofj2lsOruFM0q
	oRd8dj7TtATwpvn7pQwMWzDlufbjKzB+z0lB6Vh7X/kUNZ0RLNhuGazOxVKhdblZ
	ypt/adxxFtKrAe0WlDXO53UacH5Ow5nUnRSV9ZoxPHhPnKLc1pAT3WjgtKxGBi5l
	Qf5+xpVPzNFWO9cKpXjZDOTVqaizUsK46CmxW0LNH91latgSBFPnRF9IpO8PH/CM
	lMNjqh8ql80tLqA4W+3Sb9NOZUhPLZW6cP18JeqGgn/ceEC8qoRh8Ifq+6w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j32a6ktgm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 16:15:22 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-94960bd17b5so447424185a.0
        for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 08:15:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795364122; x=1795968922; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wgX1SDVgjT+JuUO2+RmGmUy8lTeZXxevsdaO3KUTgRQ=;
        b=Blm1qv8gFYAPhTPUUGnqyYb0UaB9xTTs668mtHHON9gl9be+YpvDWn40lQjZLh5fJk
         XcTMD3v7I7VsZZZHaP/l2RM2mKrLrI65CyTwcfQGxOPX0nGk6lzFYOZdd8CzridqdH4T
         I5t1bIU9GsGzE2kTws8hKYuQIfwol9qrLKIn5f/Wn3fkpfbiEk9DITzwK8yWXcGwDMxA
         6YdTtzLHD4/FerRF+u3byUIKx536Fh4+s/0JrbXnK1tUp/hSUwXhRBs80+Bsg7+DX692
         rULKj6p42hBD3dHjQfNr5NYW4dTfVDJKixKWvGijsF7suv2YRlpwRSDc0QvuIz/aBXri
         Nm4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795364122; x=1795968922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wgX1SDVgjT+JuUO2+RmGmUy8lTeZXxevsdaO3KUTgRQ=;
        b=eVx0UvS5/z+TfP4YGz6E9QP+AB57a/O2jBsmvj90H8qLdIx1PXmlQtWNSr9TtJYFtb
         yIAAc+vTMtKiES2oaUWKv+PCg/qdYeM7cEyotHKmdcmcv3pPfR3Ir/EZcNxHpur1ZV+p
         5We6/LoKa94X5tC7Ercs+P444F5HK5SmG3CEKzwq5VDpGU+CbBm35d+v+4+/CERlZg/4
         +VlmN6QGTKBlqO7cyxVSdNtt1WP1EgMGax01j2w/UmZgGRFGwOeCEy+Pg5itnDE94rww
         3D5fNF5TTSHI2afxt6fyiCbeWCIJg76SIr5rRLZqCBz8h2+klixKhGZKuENRhBeKhxIK
         lfPA==
X-Forwarded-Encrypted: i=1; AL+hErFFF/iR1sedXwIUBAAvY4RGr7Y8fek+OzTQkeiLXKo/p3Dch8AIy2E8rU9tmJ5OdjI5uiysdE5b1y9gIg==@vger.kernel.org
X-Gm-Message-State: APuU4Z83OIYRI+6z7kpvDzPVNZb681qPNlTiWDyfbFKFtnNpioPkbzvW
	PS0x5I/0YWOpziYStaMWT8MiQe7jVjilNTp54SEdv3xHNOMnicKAk7AWMXtA2Y3xIO1poSg20MU
	k/rNdhPtRMiCo/YIcwphqmMT+JCoMwuvSGYA0EPLxx09jS9JkYYSJ/AOrjL/CQxNiWA==
X-Gm-Gg: AZFdTZffAG9qcH/qlraS814ERfjqg7HC37x98hAUsM0U2IAGdrJkt8FDZwJ2Qz5y72E
	hjX8kXzRopkEasK02Hegih4lpO3QyqWrCBwP8N24wV6C6YebO/t7JhtdTjmrnPspjO+e+gjUSzM
	VVZrqaiF8Qs1F+FLxxcep1b84pXirKU/GpLgAuOc5C2ZLCQpDmTImOJqGshsdv2EwoIO+tflUu1
	bLjhxIuJf2DJyAVBFa3mn8INPa7fjocCYdY7rhvOdkpmyGNN5T20HYYUZrc0m3itdQ8gyowF3bJ
	9iagbYaybWh2zpvjkuYWVgAA/Ei0QX+koaIQgK7vwd5uI76Gyh+MkxaibgTqzF+Mc7WyLJwPEyo
	mmfAm1GwCxy6Gq3XVMM0T6s4gkAkzYyJAwlRYZhqZHjRDPS11BzTaZHkdS8+uG53h
X-Received: by 2002:a05:620a:4004:b0:949:7920:9d06 with SMTP id af79cd13be357-949bab0e640mr1530295885a.68.1795364121784;
        Sun, 22 Nov 2026 08:15:21 -0800 (PST)
X-Received: by 2002:a05:620a:4004:b0:949:7920:9d06 with SMTP id af79cd13be357-949bab0e640mr1530291085a.68.1795364121358;
        Sun, 22 Nov 2026 08:15:21 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849e598sm239042665e9.8.2026.11.22.08.15.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 08:15:20 -0800 (PST)
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
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 21/24] ASoC: qcom: x1e80100: register WSA speaker thermal zones for speaker protection
Date: Sun, 22 Nov 2026 16:14:34 +0000
Message-ID: <20261122161437.5994-22-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-GUID: OV3UWezSDYeRgbcbMll-Nw3UAKDsLAsp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfXyx2zaLrq7/bM
 gkqO9t+cGEymxAnH4cOsYhP2F0ROAAEzpbwERteegw6WnIkelUoYTvhYXjGj6xxxELjfUSPkH2W
 /Qq37/WOw/arNVYYZqfblcdsRbuMSfg=
X-Proofpoint-ORIG-GUID: OV3UWezSDYeRgbcbMll-Nw3UAKDsLAsp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfXxbg2en7TrOSn
 LLuWSh84RjzeQMtZ+I+jm9L95f7BtI9K0IYYxYEmfVjM5YOuV1dTqq9QNNr3NDl6V8c4VPc7Vos
 c0U26CLtjciAlxJesu7FZQDJghjNcC0P1QkZQ96bIkZ1L5TjfjB2JQtm6e/UB/3COG4ClVmtF1M
 ltmV6qZW1w3xejAmYTttRRGF8LWl14dQ9Ib/yUe5jDqmtmAbSSau5yGw9f4lpYhApJ7P37qHkLN
 P78lZcmVJidsP/wx74hUYx5yCII7Nmd86V4IGRwVAGFAYDmzAWfGXaEKoOA6ubNjgcqcEjNHJz7
 cjkf7dN5ENtt19AH5737Ao1Kr85bDb9UDSysra9s9uD6QPBGVIFC8M3FMDVRaLTXcIOndbDTPF5
 tEhVC4HmuOfFBoB+8Uja66QWqZ3O6ImTkTyS3OP9L07Bkr4rAd/P1G9aArMfhGepmZFlv3JVgCK
 zzzZFq6fEXgX5zNOS/Q==
X-Authority-Analysis: v=2.4 cv=UbHE26SN c=1 sm=1 tr=0 ts=6b03151a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=OvuEwESikzyZ2nAUfTIA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_03,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 malwarescore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220064

Look up the thermal zone of each WSA884x VI DAI on the WSA Playback
link, in DT order, and register them with
audioreach_sp_register_speaker_map() for the "Speaker Protection T0"
control. A missing zone is logged and leaves its slot reading 0. The
map is cleared when the link is torn down.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/x1e80100.c | 50 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/sound/soc/qcom/x1e80100.c b/sound/soc/qcom/x1e80100.c
index 3262fa39ceb9..9401d4702432 100644
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
@@ -24,6 +26,49 @@ struct x1e80100_snd_data {
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
 static int x1e80100_snd_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct x1e80100_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
@@ -34,6 +79,8 @@ static int x1e80100_snd_init(struct snd_soc_pcm_runtime *rtd)
 
 	switch (cpu_dai->id) {
 	case WSA_CODEC_DMA_RX_0:
+		x1e80100_register_sp_speakers(rtd);
+		fallthrough;
 	case WSA_CODEC_DMA_RX_1:
 		/*
 		 * Set limit of -3 dB on Digital Volume and 0 dB on PA Volume
@@ -82,6 +129,9 @@ static void x1e80100_snd_exit(struct snd_soc_pcm_runtime *rtd)
 		break;
 	}
 
+	if (cpu_dai->id == WSA_CODEC_DMA_RX_0)
+		audioreach_sp_register_speaker_map(NULL, 0);
+
 	qcom_snd_headset_jack_cleanup(rtd);
 	data->jack_setup = false;
 }
-- 
2.53.0

