Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A684D9F7C
	for <linux-sound@vger.kernel.org>; Fri, 25 Sep 2026 16:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790352686; cv=none; b=bi0kwxbAcgRxPKPiG0TzMLMIP8JGqh2uZq3bwd5FElC1BGPZebevFlshfdU7NV+tg+ULqujUXQUS704oBdx8LMIwWfWA4Nv6vIC6F67Ug2hSzgpO/nrPpUbf9NWl+6kC1D8KJfo/uXWzYIWJk4bKQqLAb8mtQP3OzZsAWFDzu0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790352686; c=relaxed/simple;
	bh=G9H0l/9GcdmR/zboqsNljlRUO6vzAGldsUNCNab+DQA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iaZ3aDHQmm6dV8PWgXNGNyGY66oAM+CM+9356ITvDgiFWi+ZcQfHR9rYNA/sChMDD9XPIAGfnwlEhueqGdyjcSY6ovYrbNIKLVFgRtb0VTVia3YRR+kJ3gwfFmI7iVfmItBp6GpRNNAulK5quM1MO3YRwbllFMLqwa356dmWUP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CjgQyWJZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OCzpYQ9X; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CjgQyWJZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OCzpYQ9X"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PG0IvS2643862
	for <linux-sound@vger.kernel.org>; Fri, 25 Sep 2026 16:11:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=3m2Yt9sBEoz
	4flbIPWiHWkI5fD50vxuGXy+TfwNl4nQ=; b=CjgQyWJZcbUwqx0FcvF8wv5P4GF
	DWtCsJeipuqGfPa/ZO1tz2QhCU1YX/IiSGbue/6dOe8slbju/1JUIT0fH5zSl6TD
	Ky8KH/eA4o9/bg6splWkRJ9RGmkR/VoEp9h/pPNqa9cjOcUgkZApIlhZsS0srofI
	Egxl+s277InZB0ensIe23y53nvdGDRf7YPJX9VmCXO3PanwNlgPaw9jySwHoo+9P
	PSowz3R3EtEeQIaMbhm/N9xRcBAyY/U67W5cOnSovn1Dca+TDr3vYdy2oZOp/tJU
	2pYZ745MzXzHSspESLval4NKfmSJaydwHTutxR6f4rqNyfDgiNBa/Wmo47A==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwufk07qw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 25 Sep 2026 16:11:23 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-78580a6b2fbso282483137.3
        for <linux-sound@vger.kernel.org>; Fri, 25 Sep 2026 09:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790352683; x=1790957483; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3m2Yt9sBEoz4flbIPWiHWkI5fD50vxuGXy+TfwNl4nQ=;
        b=OCzpYQ9X+UPhWrq9Weyp3B5e/TKbLCmbHj1F3cJzAv4y3/JzWYS/IYHKRJW5DO/QGa
         CXFJWRmU7fPkzB0B/q5t4m5ixED9BlpkfZ19TyXHftcH796j8Hc7qt9lfYWKDnotQxuz
         MdnAiHl13kD3mEnVsUDpVE9T7gqzi0Gyvzw4sSrUnfSmGhZp+fM7IRwWYrNql1LvWQu4
         fqTwdcEw+2HxvFEt42OfXGJ8UP7oQvARPXv1RC0fm66nqMKO/8cmdpaGqdBpQGoZohAZ
         GWjskzmoS66EL4TEoiiD/I8zukZB4Yd6f7i2iX14ylpHV3iSt7wW020a4tNXlzPmHo3W
         R/1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790352683; x=1790957483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3m2Yt9sBEoz4flbIPWiHWkI5fD50vxuGXy+TfwNl4nQ=;
        b=G8ANWYS2mT5DoeaD3xGJTaKverlXULdP31ChxS4FMlNGZFLqTfov3TxMTUIMsiMF1u
         dmVu05VJZrfOC8Wl/X8a8UWp5aI8dCSShS/JIhGthEqpxxxaA7qj3HjepArX6jJPD1Nj
         1+0wO6/ThvzCHpyNm/bgqb9knQBDSxu45rX7SLtDbKSNs2PCPyLgOULXPr0dLPNDOHLL
         OV7IWPZYP9F3aiOUH/y7FVTZNy6z2OS6pFeT/Qyb7MYQtelHB4HNhIKKDpZDt9o0D6mO
         IjHh897qgy98g12pdmykoQ7eZ8jQ6icAq6Pn86AqFiASCNNuy7NCCktQWrhDJDp39L2y
         PcYw==
X-Forwarded-Encrypted: i=1; AKwUvByhJs7pXep32OYymL3EJ4bLkljvvI1n9I5aiUSOjnjj9ggT+yGHVUn5jiEteDIljQgIHsXBE3+7NpIQTQ==@vger.kernel.org
X-Gm-Message-State: AFuF++kLNBLXcaUVfe0wTlBkVKjh/j9eFkHMjBk1jLIKqbF85nMnokhw
	G1Ah7y+NyQysVS1WghFjExxcnIkargkWMQs1PEKIMQ3PDwsMxbsCvk9avpKg6oqkHMjTma0nnxB
	pfuMhuMMElEKI2J5tEF1Jn+k4hO84seBJaPGdS3TWJixuoLEr1VKNzIgP+aGmfQcvEw==
X-Gm-Gg: AYBFou31f7d4NQu3+bpmSynF1CdLX7qELewOXlLdbl+bv31QYF9LzfBPArjyiovezwh
	t2BPqrFgmu5VkAnRFCLi6j/TeNAcEg8LsDshY8H8v3OHwXWu9v5FwOTcHkgPD5ineKaQnajuYtZ
	4l/i6rY7a5li/22lVdmnns0v+M7CEU6xZCXcoAXVa8DR8tbNhbho2VSoZtVd6PRCPeIclfFcd6a
	M+fNQ6PcjproOjpqHa2rJPKt4J79cM+uyXxmyMXSiY0l2vZG8KMyjkW1v8PdRvzuR31JULkizLv
	+AkDpIfvdoFISqxrnqsnhnfvR+Djl9P3YpaBwITsTMON8K6/pjGVIDSwCEwqwmTY+N1BC7LW3A5
	nlTk51HNDdAiC
X-Received: by 2002:a67:f0d5:0:b0:7b3:32ff:78b5 with SMTP id ada2fe7eead31-7b3330ed9c1mr243313137.1.1790352682698;
        Fri, 25 Sep 2026 09:11:22 -0700 (PDT)
X-Received: by 2002:a67:f0d5:0:b0:7b3:32ff:78b5 with SMTP id ada2fe7eead31-7b3330ed9c1mr243298137.1.1790352682100;
        Fri, 25 Sep 2026 09:11:22 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff06b4d45sm73019505e9.7.2026.09.25.09.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 09:11:21 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v5 1/7] ASoC: SDCA: allow building without ACPI
Date: Fri, 25 Sep 2026 17:10:42 +0100
Message-ID: <20260925161049.758913-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260925161049.758913-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260925161049.758913-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: kYF_urCo3BQfnJfJTXf1Id_HexrmjvDr
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA2NCBTYWx0ZWRfX51j9jvatH7iT
 diS8IQVtXoGD9UrE8zYtLXdbkXekWY2s4h3WmRoPzGBwxm/2iZUWBmJ8Z54TClPAI1paPtGYWvr
 Wcg5+hUw4N/2XCyCn2Oa9U3hEqCDKho=
X-Proofpoint-ORIG-GUID: kYF_urCo3BQfnJfJTXf1Id_HexrmjvDr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA2NCBTYWx0ZWRfX0DtwVJT5QBm/
 2yuThbBlOR6Ji0EiP4Lv8gort87KVXtqM5X7kHetEprxGqRPQwSSsd1TzXlT+eZDEYKkgTeMTzT
 7JAsFAvyYJN/ICr1Rz4jfU8vQahlduxtYolB+j60kAftq5ScvN8yo7UTuHEo7VpjPfHj3rJu7O7
 gHUFnHFdJt46QFesZTyZ4s6EOsikbdNucfCvYiHWbFU0tUHtZde5uczLgDg67ie1acwNcHCi/9D
 SLporbk7vPDcVZEGxW4aUk6ljT3Ss2xQGigMnYlkhq1w1NNhvAVtgl1p/p9r1c3wqEO1FeVxEty
 BduY0tQcrAb6dxKLi6/pcpUpPuDSWr9rihsorMXN0zVs8BFwosILursD+fQ+c8SEwYriy7A+Qfi
 Wl9qAv2jcT90aSTa7jov1TWx9HKtzkPTMl8GnEMcCOb9kLfcF7FufZc+Uypz68V5MVLmC6/HAb+
 CIfcxDNj7ji6pBD9hrg==
X-Authority-Analysis: v=2.4 cv=B+wsQ+tM c=1 sm=1 tr=0 ts=6ab69d2b cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=QBLm4htSTobWmsIIepQA:9 a=O8hF6Hzn-FEA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 spamscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250064

The SDCA class driver is useful on non-ACPI platforms where the
topology is supplied statically via sdca_class_ops.populate_function.

Drop 'depends on ACPI' from SND_SOC_SDCA and guard the ACPI-specific
enumeration helpers (sdca_lookup_functions, sdca_lookup_swft,
sdca_lookup_interface_revision) in sdca_device.c and sdca_functions.c
with IS_ENABLED(CONFIG_ACPI), providing empty stubs when ACPI is off.

The fwnode-based DisCo parser (sdca_parse_function() and its helpers
in sdca_functions.c) stays compiled unconditionally: it uses only
fwnode_* APIs and can in principle be reached from any firmware
backend that supplies a matching device tree.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 include/sound/sdca.h            | 23 ++++++++++++++++++-----
 sound/soc/sdca/Kconfig          |  6 ++++--
 sound/soc/sdca/sdca_device.c    |  4 ++++
 sound/soc/sdca/sdca_functions.c |  2 ++
 4 files changed, 28 insertions(+), 7 deletions(-)

diff --git a/include/sound/sdca.h b/include/sound/sdca.h
index 2bdf4e333e04..db2672b3aae2 100644
--- a/include/sound/sdca.h
+++ b/include/sound/sdca.h
@@ -60,20 +60,16 @@ enum sdca_quirk {
 	SDCA_QUIRKS_SKIP_FUNC_TYPE_PATCHING,
 };
 
-#if IS_ENABLED(CONFIG_ACPI) && IS_ENABLED(CONFIG_SND_SOC_SDCA)
+#if IS_ENABLED(CONFIG_SND_SOC_SDCA)
 
-void sdca_lookup_functions(struct sdw_slave *slave);
 void sdca_lookup_swft(struct sdw_slave *slave);
-void sdca_lookup_interface_revision(struct sdw_slave *slave);
 bool sdca_device_quirk_match(struct sdw_slave *slave, enum sdca_quirk quirk);
 int sdca_dev_register_functions(struct sdw_slave *slave);
 void sdca_dev_unregister_functions(struct sdw_slave *slave);
 
 #else
 
-static inline void sdca_lookup_functions(struct sdw_slave *slave) {}
 static inline void sdca_lookup_swft(struct sdw_slave *slave) {}
-static inline void sdca_lookup_interface_revision(struct sdw_slave *slave) {}
 static inline bool sdca_device_quirk_match(struct sdw_slave *slave, enum sdca_quirk quirk)
 {
 	return false;
@@ -88,4 +84,21 @@ static inline void sdca_dev_unregister_functions(struct sdw_slave *slave) {}
 
 #endif
 
+/*
+ * Called from the SoundWire bus during peripheral enumeration; gated on
+ * ACPI to avoid a soundwire_bus <-> snd_soc_sdca module cycle on DT builds
+ * (where the bodies are stubs anyway).
+ */
+#if IS_ENABLED(CONFIG_ACPI) && IS_ENABLED(CONFIG_SND_SOC_SDCA)
+
+void sdca_lookup_functions(struct sdw_slave *slave);
+void sdca_lookup_interface_revision(struct sdw_slave *slave);
+
+#else
+
+static inline void sdca_lookup_functions(struct sdw_slave *slave) {}
+static inline void sdca_lookup_interface_revision(struct sdw_slave *slave) {}
+
+#endif
+
 #endif
diff --git a/sound/soc/sdca/Kconfig b/sound/soc/sdca/Kconfig
index 4c0dcb9ff3b9..c371323cc36e 100644
--- a/sound/soc/sdca/Kconfig
+++ b/sound/soc/sdca/Kconfig
@@ -3,11 +3,13 @@ menu "SoundWire (SDCA)"
 
 config SND_SOC_SDCA
 	tristate "SDCA core support"
-	depends on ACPI
 	select AUXILIARY_BUS
 	help
 	  This option enables support for the MIPI SoundWire Device
-	  Class for Audio (SDCA).
+	  Class for Audio (SDCA).  The ACPI-specific enumeration
+	  helpers are only built when CONFIG_ACPI is enabled; on
+	  non-ACPI platforms the SDCA function data is supplied
+	  statically by the codec driver.
 
 config SND_SOC_SDCA_HID
 	bool "SDCA HID support"
diff --git a/sound/soc/sdca/sdca_device.c b/sound/soc/sdca/sdca_device.c
index 4bcd8d1fdff8..3f302bfa5457 100644
--- a/sound/soc/sdca/sdca_device.c
+++ b/sound/soc/sdca/sdca_device.c
@@ -15,6 +15,7 @@
 #include <sound/sdca.h>
 #include <sound/sdca_function.h>
 
+#if IS_ENABLED(CONFIG_ACPI)
 void sdca_lookup_interface_revision(struct sdw_slave *slave)
 {
 	struct fwnode_handle *fwnode = slave->dev.fwnode;
@@ -45,6 +46,9 @@ void sdca_lookup_swft(struct sdw_slave *slave)
 		devm_add_action_or_reset(&slave->dev, devm_acpi_table_put,
 					 slave->sdca_data.swft);
 }
+#else
+void sdca_lookup_swft(struct sdw_slave *slave) { }
+#endif
 EXPORT_SYMBOL_NS(sdca_lookup_swft, "SND_SOC_SDCA");
 
 static bool sdca_device_quirk_rt712_vb(struct sdw_slave *slave)
diff --git a/sound/soc/sdca/sdca_functions.c b/sound/soc/sdca/sdca_functions.c
index f39008ac0e7d..1eb6418e132d 100644
--- a/sound/soc/sdca/sdca_functions.c
+++ b/sound/soc/sdca/sdca_functions.c
@@ -25,6 +25,7 @@
  */
 #define SDCA_PROPERTY_LENGTH 64
 
+#if IS_ENABLED(CONFIG_ACPI)
 static int patch_sdca_function_type(u32 interface_revision, u32 *function_type)
 {
 	/*
@@ -201,6 +202,7 @@ void sdca_lookup_functions(struct sdw_slave *slave)
 	acpi_dev_for_each_child(adev, find_sdca_function, &slave->sdca_data);
 }
 EXPORT_SYMBOL_NS(sdca_lookup_functions, "SND_SOC_SDCA");
+#endif
 
 struct raw_init_write {
 	__le32 addr;
-- 
2.53.0

