Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADAAA4B66F9
	for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 16:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789491439; cv=none; b=HXJhpnxar5wOIyKBO85yV9YmbzUDVTxTpcUJaRnBJHv5qq8fQ98PBEqWWNE41aqpejk2I4+/aXgnNi/BS5Zgh1tx8wREoCTvRpv6apzuubA6AX+r69b8PUVC9kK7tOjm2mrL22N4R/ccxe39vXfmFzbvEUBkGx1PqGd5usRntLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789491439; c=relaxed/simple;
	bh=/FBOEcDQA091aAhbqoTJr44HTdfwyetl/ojJwn6bogI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jCpwUff5titZ8VZfvGGle/I6M6bf6cpu9lWL1ytOklsMSeA5D4dqEby/p3kFZbb5fS1toR2PJib1canNyU0wj1LHIdDwPolOiOzVQo2Xdi6xKjEmCPyLlQ71VJs3KgxJ4pv2tjpGqOjjvCM31tPjr/xUzzuRBe2Pvk5kvXhbSWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RT/AzVGv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PaFsRKXT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RT/AzVGv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PaFsRKXT"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FFAgox3567072
	for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 16:57:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=8Lm+uA5NKEI
	6jw1avVSpizSsQr8c+IrE83JBco1rBMo=; b=RT/AzVGvExfRCLvD5LkfYIpedAb
	4jlBnkocelYc2Znmdcnc2OwlDZNIszdUAoc2kqFp4Xr40xY46tTaUAyYjCbQVaL9
	263fBWi8kXoFo/uHzORxi3PTHiELaULDtCxRRxFT8vHVlWHTQxcLlPb0XnCmglUm
	deoAA73XHjstEVF0akic1CRHC3L8JYVYiJBDHu0MRwtEcbb9NpPulDG7HnOC2m2+
	uvA80WqkWxSZePqRpS/PyvfS5dm1FAhxiRFMEu7keiRzRt3KVJR6Sno48z8Gij7U
	8isDMSX4WdixG9t7hQ/0URV+a3JFE9QfIUc5ToOw+0YQTAusxw34rJl6R1A==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpxydb4uj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 16:57:15 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-97e9909eeeaso844677241.3
        for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 09:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789491435; x=1790096235; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8Lm+uA5NKEI6jw1avVSpizSsQr8c+IrE83JBco1rBMo=;
        b=PaFsRKXTVQWmo8buwxCl29L3YFVjghKmcYRQIGF0/yYz/z7Y6L52zsFylHfgs3ANDN
         j8XijWskPp9BXGr8dYjeYuZMNrfxX5KcDGlX92HPKmam5z1CHoxIgTfvLkZ2g88ZCOxA
         8I+KegLKgeRHdq/83dcGw3RZn90idpcmcW8O8gNOAyWHaObsxUzsLxTQopw2BbgnnUmf
         brGcFGAlHzGo/GCLsEF7LW1Edbxjf/lp926GlzKmM90NBG8IyTXvVn2yZvyI5iz/2Uqh
         CZTy5c1rHKiOulb6sr1HSGuijyWO9ND+k/zETDDa3r6vVmj3sbAzUZwe2uUcnqg7B9Nj
         0IKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789491435; x=1790096235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8Lm+uA5NKEI6jw1avVSpizSsQr8c+IrE83JBco1rBMo=;
        b=phye82gTJSNjgnlllH/WKd0Ca9VThcBZ0np9tdjwoGM7iseETx4ZesncJmjxMwdNDA
         wcfEU8gQy1065m0Fl4Ggvcz81iRvnz7wmvMMTbdr0nIqJHOt7T5hLqBuNxdGT0d+ChRJ
         dazCxjYtl7H7Ltwnc+lBP7nV9BsTK1u9qMD45zXuMNYDXaBSkNrxqOgLXlN9+e5Qzfi7
         QD3hhHXY3jgD3tcX1OZ2FKhe1QqmyUwTx8+UYFiVf3jaXLUl8LHRdNeUmZDc2/fD7Nks
         V9W+GtNofFyOGaq61+moPDu0vwG9VMBAN2b0AVutdhzjLW1/2bx4MtbLYMuWeXx9S0lM
         lvTg==
X-Forwarded-Encrypted: i=1; AKwUvBw1D6v7+z6fDvkPpnrGViAGr4P3gVO6cnamyEwSqFdo9rEugA76GoUDKf5PFVkc+pT6eT8fc2Fi7+v0tA==@vger.kernel.org
X-Gm-Message-State: AFuF++k0hAmfIVZVe/G5XWhd+YtOgc4e1TEevoa9eyR4QuY7rGUhmYcz
	bQY3Q+rAnBuyE8TfEHxQUpjctM6KOQRB5K4hwdA1pI+AVHyO8dG3glsKZPreZ2Ufd8YMKtq7Rud
	sTf7GsscU9meDqxbTdjKW6EZ3zmNkve/XUXQN6ktmPaGf5CV5pYvDq1pKDiQzixqYKw==
X-Gm-Gg: AYBFou0K8cmS+5EAsj09+vfWS5uClZQX3TpFSvFiAbLs/tUP56JS9AFlrd3DQtLrRHZ
	XlYMTKJ+kK1Stf37H3kNoaTwZ+WAtvcFDZWHPIrDZxUV2hj+GcNUBX6sNRWLkL2cBYp5oTU30X0
	r6gxgJK5v6fDSG0Ge5ybZ3KdEt/3hw8O7NQgM7ttlAEbXw7x3EaPeEFQLlsLCRr3ZPsOVRI1UdX
	Wg40R2Jvq9DhyumXCZVVmpMK/x5TOY6eQfdyeffsF+7zxXfKGaCRGDwQb+xqQiQn48X9XUFadoL
	bITxOI0GAHBkLlxHEU1bLOUBBpVs/lGxhWlknTV6+hzN/tqLTT7X7Qw1IkxZk+u3lRbNh5Fyafn
	q0QCbb/OOqIl0bw==
X-Received: by 2002:a05:6102:50ab:b0:784:b9ec:910b with SMTP id ada2fe7eead31-79b5caf1b6dmr9011823137.12.1789491434613;
        Tue, 15 Sep 2026 09:57:14 -0700 (PDT)
X-Received: by 2002:a05:6102:50ab:b0:784:b9ec:910b with SMTP id ada2fe7eead31-79b5caf1b6dmr9011719137.12.1789491434035;
        Tue, 15 Sep 2026 09:57:14 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83d9057dsm4361335e9.3.2026.09.15.09.57.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 09:57:13 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, patches@opensource.cirrus.com,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 1/8] ASoC: SDCA: allow building without ACPI
Date: Tue, 15 Sep 2026 17:56:43 +0100
Message-ID: <20260915165652.914893-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260915165652.914893-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260915165652.914893-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDI0NyBTYWx0ZWRfX6jNbvuBFPCGd
 5+3SmzKxzVlGPTpBisUO5Cj1V7DFMTM0HQEW9Dbg4GgRgvO0E5Xp28Ix1h07xme4P0iIyz+i3OV
 /n40ROBpFacy4Ei8cC48NWtEONLDsck=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDI0NyBTYWx0ZWRfX4/EMq4gber9q
 /hT5yAifIJ01mz5+vaJwEi46k+Ysm4Rs5PucUSa3VJk6nm5tn/PtkfhAv5MHyilGia0BJoxlDK1
 eGQmy3DfcpPNRPUmzQ7BTxQPBip2niRTeX6rr6pTTpmVYNPkQhZdB+IDI2c2MPnNtxrZLbdx2Mt
 CkqxeqYNWSNxAKOnjgu6703Gtj28METzCStBs59SQPP4av/qjLttfSINA5mY4C3n3j0ZRhFfwn6
 LyODHkKSXj9UYghFiy5Xw5jFWf7BEyC+h/yFLP/frfUW93zCcYiEOP2utwFpkAw4NKcBoi0nC4g
 NQVq89eQj7Wg4gPo/zhUruko+qwjutRVbMspA/lgYFz5jzpqjAIPPRywtkeIejj0Ugf0hMTz1lL
 ChIES4Loo9ec6FHWapFzXmmCBhtXrr3Agc1O1UFd1EzBm/jdAH6/EvNaTYCun3BOCFg+Sna/u3w
 aYsnHH52OX/VaOo6mmg==
X-Proofpoint-ORIG-GUID: EEt3ec9M_WYZbpkr-bUjenSMwVMkID0Y
X-Authority-Analysis: v=2.4 cv=LYepeTfi c=1 sm=1 tr=0 ts=6aa978eb cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=QBLm4htSTobWmsIIepQA:9 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-GUID: EEt3ec9M_WYZbpkr-bUjenSMwVMkID0Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_04,2026-09-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 adultscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150247

The SDCA class driver is useful on non-ACPI platforms where the
topology is supplied statically via sdca_class_ops.populate_function.

Drop 'depends on ACPI' from SND_SOC_SDCA and guard the
ACPI-parsing implementations in sdca_device.c and sdca_functions.c
with IS_ENABLED(CONFIG_ACPI), providing empty stubs when ACPI is off.

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
index 4c0dcb9ff3b9..72c02943c49e 100644
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
+	  Class for Audio (SDCA). The ACPI/DisCo topology parser is
+	  only built when CONFIG_ACPI is enabled; on non-ACPI platforms
+	  (e.g. ARM/DT) codec drivers supply the SDCA function data
+	  via sdca_class_ops.populate_function.
 
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
index b55e3ad8ea34..6eb0e1059dbd 100644
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

