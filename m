Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795364105;
	b=Ox2fSSPhR+07hreCS1M4WqGYI7+BykmPO4XRQpLE/uQLc7R5gbv9SOwXRK0jrhOp6G2O
	 OCJ9HQ9VlUAswZr+Ee0rlLIgGPlrk7ZKCB1B5wQXmt9PhqCg2D/ebLsg/SyQ7SwJwB1Cm
	 KEOG8Rd+JAFUUV8F78Ko1JPLLV2JwZp60ZQWZX4b521kXLKOPmg17j1kxQ8s4kN8fxGD0
	 cL9Cfm+xyqRjMhQq9yVWJoKCEI27x591/Y8ztAgIBU09Np/JS8n7bJpkNZDMrwaK8OiPB
	 TSOWneWYsmqGATX6AfKhuJ8TyCX9Zd+37WHHiR47aincDHowU/CVrfQgiTDs5y7vZ9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795364105;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=LNvBP6gZDP/q+H/JUPc6WwtfV2r/pDb45V46M987ptY=;
	b=OCEXJgwOZppLX1kgXJAQY/Dx/oEPVmrxtUaa0ReyP3sFox50IR8Fqipr1h3dZ6N7oT7A
	 +8YLK4SueecxPbMJitFSAR2wPwsg9Chv9Oe2cgdLK5MjpwBfSQupXqAAgdOW/qy0o1NV4
	 krOizSCu+FhO/JUerRpAj3OHaFh0j7UxrEQe0+kJx1XjlDvXE/+pbjVEE2WGJD9BxYhjO
	 pNaEpmGXyOYM1e93OV6MqW0n5BKhm3nc17NvaE6cbjLzyUSb+XifxkeS3M60SsW4cQacd
	 ifShht91VgMhRnImiUrFh7AkAsjuKKB6gwBYeT0ILGh71kL/smDt6PHISk9woQrzJrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OfMlJFkR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VRiAHPCm;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9740E606A6AB
	for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 16:15:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9740E606A6AB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OfMlJFkR;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VRiAHPCm
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMFRRAl1250054
	for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 16:15:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=LNvBP6gZDP/
	q+H/JUPc6WwtfV2r/pDb45V46M987ptY=; b=OfMlJFkRoP+8+n/IgP95ooERg/J
	2HpfIrWwaFRBa6Ddaiz9XfOxmzEU8CMc6iBwLF7P7aVwP3SeByiiNNY1an233QbY
	UaDIsQ5+dllISnUucOfeGiuwKTaFXq2tKCsj8kYkUCOMzYOzk5iOzppz3MFkYHF+
	Ik6/8trOx/CMvKoqxeU2Vvl++23RIGTuMGBf75G2waJOaCFxFa5WfrhKj/IfnjUm
	pmK+Nq3ZyYQrjzMOaMlEcjZl5m2iCYQ3YsZXCwMnXMwLNHX4eeYqZ2KYaliOsAfo
	cmmMrxMawjqMOb3kBYcoRd9yx9i5nm+8Qk1BoKIDrNrsfdbFpQaSuPriq5g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j32w03ruj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 16:15:03 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f3969a2a7so404356485a.2
        for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 08:15:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795364103; x=1795968903; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LNvBP6gZDP/q+H/JUPc6WwtfV2r/pDb45V46M987ptY=;
        b=VRiAHPCmKHr9NLmXgnhF/3YRuSASuDxuO7INP0oKIZsORmpFVEUtxXKhqORSwiu/M1
         yAWqSm6DtdIWxgWxBZsXFRgxPvuOSk7zByidxaSQxGLfDlPXi+UmHwHSvfc1jGbBwt4q
         Ai33/5nV5Q6M9WrvWPIAXku98+eWhSHsoHMTs7w/IpPTUrLt5zigfu0cWmct4M37Zms6
         dwSZbO6JXWRQexKgGtCv3fuRYbM4vJAbnZbR+AuR/5cowzXUX7bRtHL8XTMRkBJPW3GX
         YmDV48nMz+eZcY2K+Tcedk1TNlCzr7pMVpjLLRo1vzdrYq6pFTYH0kEBWwoIStEKUion
         bDeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795364103; x=1795968903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LNvBP6gZDP/q+H/JUPc6WwtfV2r/pDb45V46M987ptY=;
        b=XQpqj5Eib9OS+HOKtUslri0vo7TU1MXio8RbkWz8Ld7rXbDlgRulOxcQBBoFMKsfzo
         s5ed5ainIMbptmYbum4xqfGKgIpSuSYoMMWGjtS4WXSdjpPgZREcjMweOIymzXLZwqw6
         LQEFjPkXh1Ek0alyKIBWwtLJCRm2J2v5kKS7BavPdfHBZPMiuDjvcLdoZZr4ZLAp/NDN
         4DSbBtiZYmDuiLn09eXrxbiDCGSqxd5Oam6yME6dKbTQQH3L+9ymEbGD03glky5abA7q
         LBW9OHSNbZGqkqRVV9BwK4XqKNjaepoqKQNYmm9S1+Mnz9e8n/v3Ig0WIURcSmZeus7q
         Hb1A==
X-Forwarded-Encrypted: i=1; AL+hErED7Jv+sniUxN0Y2Bn03Kmjm1iRUfm+HKOEDgnT8GSknAhoxdMsag3bYqBnU9anGGbqWEwNPn3ZA7STCw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9RlWKJftCjaxL700VSAKHlZeW/GdcTLhNtJr037okFlPsVnEfw
	BLqRlbJZf/5mHjGMiS4lkc6ilTEW/nhdIxKiK8POuZ/k5PZl5V/AvlC2BelexaB1eP6kFaqDi4c
	kI+xrnop6XbeodUqK5PGr+6wNCVF5aE/K+LQc2ckjxd2KPOFsASqIABGeQglvcwnBNg==
X-Gm-Gg: AZFdTZd2v/7HOOBbfxo+CjzVexECSQnxB8hFE4hm5Xt+noo6ZU6Kxu+jSrOpP/H8hgp
	BzsUPF469maXiBU1+qo3vzGhGk6B1Yw/pjr2S9mVxfna7Kg784ngG2yvdWvqdXkjTa+SS2rKRkI
	2IgCE/X4g7zHig7lzJ7ns4zzA/mXhBqXMLx5wAPTGZhNdkDTV8LQ3jao5LSCwJLrpm8CNBJwY/x
	llumdfxk1U4f563ZL9H3MinlpeL/oRnUV+OxOC2vsMsrWI2k35R5IZvz6+4m72kRS8Yp6+lT3mR
	ouVKcFyF8b2bZBKKrP8hjNsPXKrOHm9JoicbxPoTEFoPtLiHjdrtcbbdOwAiUY3MJtl1+Bld6Dl
	eAcAIwpWiJylwNLv4uO0D7R83RgNs0rG6ZxZ3RQIxEx7JcxGOvv6FowB6vlmg9sJs
X-Received: by 2002:a05:620a:7087:b0:93f:633b:ee1f with SMTP id af79cd13be357-949ba9c6b95mr1649009985a.28.1795364102661;
        Sun, 22 Nov 2026 08:15:02 -0800 (PST)
X-Received: by 2002:a05:620a:7087:b0:93f:633b:ee1f with SMTP id af79cd13be357-949ba9c6b95mr1649005285a.28.1795364102165;
        Sun, 22 Nov 2026 08:15:02 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849e598sm239042665e9.8.2026.11.22.08.15.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 08:15:01 -0800 (PST)
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
Subject: [PATCH v2 08/24] ASoC: codecs: wsa884x: register the die temperature as a thermal zone
Date: Sun, 22 Nov 2026 16:14:21 +0000
Message-ID: <20261122161437.5994-9-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfX996y3DjyKKxv
 /bRYxjmYOrEFFKGjuSJQT6fcn75kHsqm8xaBzqxfmaBQmbnDaqhrlNt14HZHhwvgvskF7d13Rfw
 1RaGOwYF1xZ7pNyMq6y7aa9IWVM/ucjAi3TfZPeUoHzCxjX6RRLQ0vlRqgGkaG/9qdg3VkECpO+
 Pn1xiuIP4rQRpoXlgLk+8XJ+H7q37th7sO/MxbxHNGsZ6MNDwf6jS4whhJVPhzSgcPdn/cXje52
 wqRB9+jQ0tJ/8GyP6Alp9/me4tYpp7A3KEp9BYSJphwC3PPol2pzM15HkgDYQPXqMlrxj6ab11S
 Nj9Xir5IBsAoyIHtad+KfjFkB/ZxpFiniLXGcKLsJJ5Y+g5YH14CGg64IPEcvbYD/rm3uFETQcP
 g1AlJq01NC1m8v0YfRRDcooge1S3TEUp2/822+9qHrrut3tgS2bMwCE0dUOLt/rrB/Pcs7Ek0BB
 qwdez+B37IbRytIae1A==
X-Proofpoint-ORIG-GUID: zltH1M2i15kcJNzA2ZNQU-EXDBxQE_D9
X-Proofpoint-GUID: zltH1M2i15kcJNzA2ZNQU-EXDBxQE_D9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfXw7bATYZwq2jD
 GDQXey9jvVopV3vyzsnH944lmfxor4yTqyTqWdk1Wn4R1i8gt3RNGJIoMdMbouhqKFTyz/9Yrbf
 4xMYgutVcZKDSPfYhlrioAYwW1v9F90=
X-Authority-Analysis: v=2.4 cv=S+dMU4sP c=1 sm=1 tr=0 ts=6b031507 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=51jdShTR6rvD-JhUMxgA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_03,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220064

Speaker protection pairs each speaker's calibrated resistance with the
amplifier die temperature (T0) at the time, but an in-kernel user has
no way to read that temperature.

Register a tripless thermal zone over the existing temperature read,
named "wsa-<bus id>-<unique id>" so a user holding the codec's device
can find it with thermal_zone_get_zone_by_name(). Until the codec is
initialised, and while the PA is on with nothing cached yet, return
-EAGAIN to hwmon and no valid temperature to the thermal zone, instead
of a plausible looking zero. -EAGAIN would make the thermal core re-read
the zone every 250 ms and keep the codec awake.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/codecs/wsa884x.c | 70 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 69 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wsa884x.c b/sound/soc/codecs/wsa884x.c
index 91aa004d7137..e56c848cbfce 100644
--- a/sound/soc/codecs/wsa884x.c
+++ b/sound/soc/codecs/wsa884x.c
@@ -23,6 +23,7 @@
 #include <linux/soundwire/sdw_type.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
+#include <linux/thermal.h>
 #include <sound/soc-dapm.h>
 #include <sound/soc.h>
 #include <sound/tlv.h>
@@ -1935,8 +1936,10 @@ static int wsa884x_get_temp(struct wsa884x_priv *wsa884x, long *temp)
 	if (wsa884x->pa_on) {
 		/*
 		 * Reading temperature is possible only when Power Amplifier is
-		 * off. Report last cached data.
+		 * off. Report last cached data if we have one, -EAGAIN otherwise.
 		 */
+		if (!wsa884x->temperature)
+			return -EAGAIN;
 		*temp = wsa884x->temperature * 1000;
 		return 0;
 	}
@@ -2058,6 +2061,42 @@ static const struct hwmon_chip_info wsa884x_hwmon_chip_info = {
 	.info	= wsa884x_hwmon_info,
 };
 
+static int wsa884x_tz_get_temp(struct thermal_zone_device *tz, int *temp_mdeg)
+{
+	struct wsa884x_priv *wsa884x = thermal_zone_device_priv(tz);
+	long mdeg;
+	int ret;
+
+	/*
+	 * OTP trims read back as zero until the codec is initialised. Report
+	 * no reading rather than -EAGAIN, which makes the core poll the zone.
+	 */
+	if (!wsa884x->hw_init) {
+		*temp_mdeg = THERMAL_TEMP_INVALID;
+		return 0;
+	}
+
+	ret = wsa884x_get_temp(wsa884x, &mdeg);
+	if (ret == -EAGAIN) {
+		*temp_mdeg = THERMAL_TEMP_INVALID;
+		return 0;
+	}
+	if (ret)
+		return ret;
+
+	*temp_mdeg = (int)mdeg;
+	return 0;
+}
+
+static const struct thermal_zone_device_ops wsa884x_tz_ops = {
+	.get_temp = wsa884x_tz_get_temp,
+};
+
+static void wsa884x_tz_unregister(void *data)
+{
+	thermal_zone_device_unregister(data);
+}
+
 static void wsa884x_reset_powerdown(void *data)
 {
 	struct wsa884x_priv *wsa884x = data;
@@ -2194,6 +2233,35 @@ static int wsa884x_probe(struct sdw_slave *pdev,
 	if (ret)
 		return ret;
 
+	if (IS_REACHABLE(CONFIG_THERMAL)) {
+		char tz_name[THERMAL_NAME_LENGTH];
+		struct thermal_zone_device *tz;
+
+		/*
+		 * Register after runtime PM is enabled, as the zone is read
+		 * right away. dev_name() is too long for a zone name.
+		 */
+		scnprintf(tz_name, sizeof(tz_name), "wsa-%d-%u",
+			  pdev->bus->id, pdev->id.unique_id);
+		tz = thermal_tripless_zone_device_register(tz_name,
+							   wsa884x,
+							   &wsa884x_tz_ops,
+							   NULL);
+		if (IS_ERR(tz)) {
+			dev_warn(dev,
+				 "thermal zone '%s' registration failed (%ld); SP T0 kcontrol will read 0 for this codec\n",
+				 tz_name, PTR_ERR(tz));
+		} else {
+			ret = devm_add_action_or_reset(dev,
+						       wsa884x_tz_unregister,
+						       tz);
+			if (ret)
+				return ret;
+
+			thermal_zone_device_enable(tz);
+		}
+	}
+
 	return devm_snd_soc_register_component(dev,
 					       &wsa884x_component_drv,
 					       wsa884x_dais,
-- 
2.53.0

