Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792775880;
	b=INCQ+vSjnHfSowQi5mpjFZfxD3LuXmKDV08Sjo77LrdnY7T76/rHwZpeNbGIJdtLWMMH
	 cwpOD4xUOquvMwtxmqgjacmdiU71o5sVwG+4Cf6+coPAXPoZLGrmjp5nf+yr08Lt8xyB4
	 Ds3J0+6pzbjG891W5/Ae+UudIZ9WwBqr533HQGJKj8pe3/Sc0nv6HAdGGwlD8ca19pH65
	 WWKzfAvcmm0fYqYVMGUjUtmyTzSubA2wKK/MmZeqVHAjDJM5jvnJG8IQYw/1FcJtAvMX7
	 kGy8cvE7GLWiXX6VeGp/Cbq0G8ymn6itP+7+W+XxKIqsWrci2k5QAHo0TZNbS7Lgmtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792775880;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=SfsF2sbiRp1415Zg5QD61mmr6NxukLeOnr8JRBKFqbs=;
	b=CPQcDJ2Gm3x3/SxC9f9Q52AfzaKZVd/fYSDcWPNPqoh3hrQZ5hdvtFhsxbT13vfcSjfo
	 Ea5DPQeNdwJNMeWyrXfRC2NNOa9cnyzP7LZpikz4+Qfh+P254d40ByM9X0MG1d6cIJrFw
	 IPZAmdmEpoVRAyTbEkA0H62AXjrEEDyeaUt53OUStTh8RXKivMXt8t5DALvBR+s3dgYHw
	 5oxcObkuHwn4CdE3rYdaARsytvWlLJ343ookUWUf7k7wBMCsM04ZPeuO2hdF0TdCfpoCC
	 2Vb+ZNt8Ek1Itl7dSvB1rjmcHiDnHyC1K8+tcdqQmAKnQyr6Zqw4JqNVorJYsAzDurQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="lcyB+k/j";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Io50dZuV;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2827860A382D
	for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 17:18:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2827860A382D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lcyB+k/j;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Io50dZuV
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE5vvA4063370
	for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 17:17:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=SfsF2sbiRp1
	415Zg5QD61mmr6NxukLeOnr8JRBKFqbs=; b=lcyB+k/jbGPPFkXQEw4U3rZdqX9
	6D28PZ5ni2ouJQMh6PMWt+WIYYGK2cz66UmMcfNtJzzHJIixmCLViHLXF0ftywIQ
	JQW2OVCB4YoAuF5g+h70rCuSiy12Z38WbodyPwQpZ3nAokwK3YqKsTeA0UIuBHi1
	c+bh3xfhOfALFpItF/TPnlnZoWI7gsjSP8bVwYGD1Fn11IdkEPq6C115ztoFzinL
	2eARUCZa+nXCxpIYpIaolQObWp5l2QkNCe5wT6mEs6AdAH0l8sTCKor9E+IXbI7k
	2ViOwdVa8MDMLftpJxni82DWVCM43NwAVOVFjZrg6OSjIPMifs2V3nOwNgQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmrcran-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 17:17:59 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93e92aad34aso223585185a.0
        for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 10:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792775878; x=1793380678; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SfsF2sbiRp1415Zg5QD61mmr6NxukLeOnr8JRBKFqbs=;
        b=Io50dZuVKCfETgSoQTI14ZtbNYlxzdVo3UTLMLhYv4jwWyyA8rONJcOvXdz/QGbN6X
         56SxbgEGDw/F0u2i2pTTSn+iwVrQ0l4fvxsWsqktieGUSsj05QwX+kWgdyenbqPcPM8r
         nIAVXcrvhGujizn9Q7ybyLWI4wNzWdRdh5BwvgKZWpap0CcyfWruisAd7jzqjtJcfYOW
         aWp0M1ZuWqcIwkJTzjvJnRVfPgPVyZLFdDxehURZpo3Y/KazhbIRWAO84I4j34MRL7O9
         B9mB/YQhCs3voMpmdtM0y5xbt5X4tx4G4tDVAUKDq4WNuaD1warPjovnZGL61H0KQxKA
         SzQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792775878; x=1793380678;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SfsF2sbiRp1415Zg5QD61mmr6NxukLeOnr8JRBKFqbs=;
        b=wrNbXvHrwyg/M/guU5320kSOm7kmSRQxI5yfjzLQCxI0StoM3q8JeU46vB5coQUDLH
         NPq81dJytq2rLOb1sgJ8t9Pl/XLROH/JnEzUAn9p4OT0rbRJn5GmbvQC2ARtk4C0cl3i
         lyQRfYuIUiI311g+jhzYo9SeKMUyL5iaQ57OmzfLiSkxWoQm7XigbCZ/nviJ73j/dn0M
         Hzp6VcrsVpjMvFUUEuCH/cDg0IfNU+u3O9tRM3Se47GgQrvRXs0la7hat+JNf9Tznoq3
         yW4yyK0aAI7tHe6amFgwMRojVZ1hg9H0GGqDyTwRDHhskrrhCoYctTd5+svkEvqwcTxp
         PyzA==
X-Forwarded-Encrypted: i=1; AKwUvBzid5hUIkVT9CxJUid7f7dPqGg3FHuSqeXaMMI8UZv3vn8VbNtvhoYEZAGxOPqCx8ngNdhQBKggUHp71Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYKk+m5J0NmI6Iz/OTURiF40n0i0sXryh6RhAxQXF1VTvR9p5dpK
	2Y+1LjCawxm2z/fNgFskQiqFpDdNUyzkqI8YeDxbuWbCgRQglWPTMM2HKdBGeXjKgztd+3/5ZYe
	gz0VMBHKgLI8e/vR3wEHiQQYOeNDIaPIiJkucbjkKWj7k/zPUt5cp39kPDX0Q9d7/fQ==
X-Gm-Gg: AYBFou2ZuLt0nL+v8j01Y0PkPrm59YZ2+Dxlm+8vIoZZlDEe+QuIAAKdPUwPvjgyNCI
	AerWnOZgY89FJBsC3c3C+ibIM033BFzSY/cQ9lrfonC0yQqkOpC6DtuWMGOS7sWlc1yir8XGeWX
	/aSM7Mql09McbbvQSGjJK7mLkvVHcWsz4Xjj4DvZNKUgOTEkxWVtuyxq7Z0p9O1LL1X3EJXSe4W
	IZ59eQC/SmlIqDdPJ2dOFKJEDdVraWrq9n+gvVzWmwBBkFyvTRTl2F/oAFXBiLAtsMYZCBR91T2
	4gPVnwMQ9sl2NMA7X0YlSZpEZNOBGk4lFuso/T8I/wjzDVytVYz+8YL11LPvuoupGwP4svLry/Z
	z0GQEyhBobAve
X-Received: by 2002:a05:620a:269d:b0:93f:1ff5:8908 with SMTP id af79cd13be357-93f6f7e72f6mr519956985a.41.1792775878286;
        Fri, 23 Oct 2026 10:17:58 -0700 (PDT)
X-Received: by 2002:a05:620a:269d:b0:93f:1ff5:8908 with SMTP id af79cd13be357-93f6f7e72f6mr519952785a.41.1792775877752;
        Fri, 23 Oct 2026 10:17:57 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d41e0fesm937475f8f.46.2026.10.23.10.17.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:17:56 -0700 (PDT)
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
Subject: [RFC PATCH 06/23] ASoC: codecs: wsa884x: register the die temperature as a thermal zone
Date: Fri, 23 Oct 2026 18:14:16 +0100
Message-ID: <20261023171433.820092-7-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-GUID: pUruRJIUO2UsVMI6TZbeOctw7FG-tq5S
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX7DsM3Zgp1JBZ
 VJKTRdwJbmK+zSUuybgrj7JxgqJRNbKC1HubV5qrmhqiYSmFcfCI+haUtsGIJqIEIee6HriD/lY
 JU5+Nbb5bKMYxKTuskk/etk6gGIB2ZM=
X-Authority-Analysis: v=2.4 cv=VNZIDNPX c=1 sm=1 tr=0 ts=6adb96c7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=51jdShTR6rvD-JhUMxgA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX5LkZQaiC+88m
 pQd8phVxtoSZoStumtK0u4a1zPtRusTB0GnoJLwJwhHSeLl5CvvVV1QPN+WBY7IKKO4oiZ+33KT
 U81mQDa4OVFw5ej50KoHRtZpQKQTJcMLd6z7WwTtTFCWNlox1ZYmnpuvMPFrIgX30OTmM1kD7M5
 RT9pUtMbFEOaI5jUZOOLgbF3U9WDA38lzk4kXyPXqqNGfKE9S4aTKk32Av4MYnfHdDO+vPFSLdQ
 vZ0EVThjQ6yhJ8gXVhK1iaSXrk0Ej+HmRf0pDeYTHN7t9Z7B984Vuy6q0z8pU/gCMPXifQ7RgH5
 6499LhJ2ljuTACxACauXwo7WmlCy0ny6XDyJIyLEVDaMPwNBcd+kiwHA/hsy9kOOMHbaJvfH/3Q
 eWGrpF5oCWCggje9808xH79K2O0IO74iTg0LzLKKJpl7Ee3usuWbb2MzEq/+l2nvbJeHtVX9yV0
 lADT4TV7Shfk0xDGKvQ==
X-Proofpoint-ORIG-GUID: pUruRJIUO2UsVMI6TZbeOctw7FG-tq5S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230067

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
index fbb9c5773aa5..ecc6983bb54e 100644
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
@@ -1928,8 +1929,10 @@ static int wsa884x_get_temp(struct wsa884x_priv *wsa884x, long *temp)
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
@@ -2051,6 +2054,42 @@ static const struct hwmon_chip_info wsa884x_hwmon_chip_info = {
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
@@ -2187,6 +2226,35 @@ static int wsa884x_probe(struct sdw_slave *pdev,
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
2.47.3

