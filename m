Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E8644063E
	for <linux-sound@vger.kernel.org>; Mon,  7 Sep 2026 08:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788770317; cv=none; b=L4YfkKw60fNaMj3KRsocsi7BUS8wefC9F6lS3EjdN2YDeXiMZEJ8X9HskPArQY0owZFwLz+Huw+C0nWJi2PB+SxfWvDXbMKeaqxw7cgq6oSHzjJ4/msH3a7X9EH9ff8PKoKkbOBy4bQnz5EDuO/y5NByPOqd3pSXOVZo1gd297g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788770317; c=relaxed/simple;
	bh=ziCjRvS8TtdVYiLj4p88US3Q9YZrXTSiDrYmN2e6/A4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eSZ/BnSUNHvnHHEa71v6Q2JuLUP3WtKNJ/ogfO8VFZ/0JU0tGhIZLO0KoC1q8JqOS+oNjxVBuTjirWgzKfEzJDq4XuePCBW4ZC0mXnkk9ADKH25x/9aV/q07ydJlvVhFdbRYdPZEbgza9gdCnxA6MMiJBYe6tkFedz9nSE5v1aE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hgyNXKab; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aSPtn955; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hgyNXKab";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aSPtn955"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68777Jge4161125
	for <linux-sound@vger.kernel.org>; Mon, 7 Sep 2026 08:38:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=uwZCEZhplYW
	S8qCNm5tYopBzZBRREgKD5gOszws1oY8=; b=hgyNXKabhOsexxnpyh9VBGqls9b
	mkalo4AxGOHwci/hU22eYviw6r92j8s2T1qBwoiZby2jqYTXLO1St4tbBrdFhNPz
	CB/lF0Mxp+b4yjhIeGg8+j1+f1zBmA0SJsz04VKqoOZoZnlTcNzg3LFQpxBDLPLw
	r1D1zmj5YytJDn7DsObjZNmsuizm72CBdYEM5EulnkLUTXkVtHMjrvXB+rS4BDO2
	pH4p1hht+SNYSiqSG141Hn8orm4djkjRZ0nv7gYRmenDTYWIoNY9L/mtAp0qvOK3
	vMJ+KyTNirswGRUKq/oT9Z6Vvd/mBo9RzZ6Bnb/LiZi8zi20vYh+mOZ3wPg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghfwjhrww-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 07 Sep 2026 08:38:34 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-934963b2bc0so635996785a.3
        for <linux-sound@vger.kernel.org>; Mon, 07 Sep 2026 01:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788770313; x=1789375113; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uwZCEZhplYWS8qCNm5tYopBzZBRREgKD5gOszws1oY8=;
        b=aSPtn955hTKweTtABSGiJ03jHldfLc8AOk3kNVqCWiqVmWKZ8MB3PEp2rgVTJ+ZmUm
         kIasvXVy45CLxqjGyn2E3GOCR0DAc7zLnsNVWSDo13qXn/DUPZhsOlbwq/Icdqjwwb9G
         VPMoslWbHzr5eO1ZXsHVhz+X3YWA/u6juGSCOTcFdQ/SXut7jFx7XiyFbRAQjrsahz0x
         VdzABb7ADjkoWaUEN7MWcdfTkKgkV4pCXERdD7ZBC+vWDZ28KfefnTNW5OvGlXx7EJJa
         SP689kffu9Apaw/RI+7AFbGhhwzX8ECeFNa9Cemk+2fAVWfg0qBPRWqRGjkUEx/mqCXW
         RojA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788770313; x=1789375113;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uwZCEZhplYWS8qCNm5tYopBzZBRREgKD5gOszws1oY8=;
        b=tJbYab4BGAR2olNA+uqn/0ZXjknniZjP33Nu/mVIdxMDkw+YEkoQtsSdEMlSvvX2qd
         2bty5PuueX9RocQd/yUQEu5FZvaloaSwBQ1Snhj3D31NHvzkYTHC0LqyFhpJhpRwFiPl
         dHNp0u7OAC/COkQr0J5iovoc4HPBzAbcq35jkrcReFQCOxr+7KVIdPrzrg1vK/lj9dU7
         PTz7uI9jMfUNBIzBsLbyxAWW8SEUfwOYPv+22DUavi5QFmwoTUVH3zub4jgq7lf4KI2X
         YVbR/gG3Jv25AwN24RCsv49WT9oTNjLWoAFzScN03kn3UbGzY3XpSPStqeZMY3tSLisj
         cjZQ==
X-Forwarded-Encrypted: i=1; AKwUvByt9ZZBI5zmqSszPmp2BXDCw0LN/PA8M/faMJhEnBfTFLd53N89njpGP8NjKDiK51BEJF6Oz17ftZe0AA==@vger.kernel.org
X-Gm-Message-State: AFuF++mwLx7DWgvyijzCSsS+tOJXlnD4cwOSwEh8CBUIgo87+DYHT05w
	DkFgXzPb1IUkzNQ0kfxe42Q6pRqYyG0ZWiey7CDJ48w0U4pzZK1O+4D8LwKb3mJ+8sQSWTDh1BP
	cNyyJNKJQRsKWfKsK3b+b7txwNqaOqH53eAK7kZjsZzt4FefPm9o4v2VdGeXDGgohzw==
X-Gm-Gg: AYBFou3dWSt0XCTUo3ehm107JLbEz//HSXC85LgLgcFd/udHXUkeqPoNlm75eKPgRl2
	6pzyBK9YdNw8Kksbb8p933NVzZ+lXiTpzVm3TQsZ/+58xg8egI/prOoSA5qCraj9stZVeu8Vlbg
	E9/xQgpqVtjda+IKqFonHSG55wGlkctJhsDs8J66UtapZWqNCGQeWorTfoFh+hyOiicWEN71/fT
	RVklC4Gz4QiBwL4qvV6H5hoMteGrph3oWBXuKv/kjN5nptb1lJ/Ncbf5Aac2AVpuyM2jx5FLMPR
	44RTKsyMnYoSJ+jodbAgZfjcWGiUA7g0k/twFYx+1lxbdwkweld/7lH/7nfs6nAtGUhR6ByrlbM
	oRbD+B7fxYnPtBg==
X-Received: by 2002:a05:620a:22e3:b0:937:6d2e:d023 with SMTP id af79cd13be357-93980449a63mr1676794185a.30.1788770313304;
        Mon, 07 Sep 2026 01:38:33 -0700 (PDT)
X-Received: by 2002:a05:620a:22e3:b0:937:6d2e:d023 with SMTP id af79cd13be357-93980449a63mr1676772185a.30.1788770308078;
        Mon, 07 Sep 2026 01:38:28 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c6ba4sm30852179f8f.25.2026.09.07.01.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 01:38:27 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Takashi Iwai <tiwai@suse.com>,
        Faiz Nabi Kuchay <fkuchay@oss.qualcomm.com>,
        Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
        patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 01/11] ASoC: SDCA: allow building without ACPI
Date: Mon,  7 Sep 2026 09:37:15 +0100
Message-ID: <20260907083727.733705-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260907083727.733705-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260907083727.733705-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA5MyBTYWx0ZWRfXwt8DC5asF8qc
 f43BEHkVpnlXNJ9y+gtqoVre6PBm8ehL73a06LJoojKMZx9k7lEVbjrHsthal9LhdRT+BsLvLlB
 FPxAphaB6H0NJkrwo6CTP5lGE5OWHRM=
X-Authority-Analysis: v=2.4 cv=NanWEWD4 c=1 sm=1 tr=0 ts=6a9e780a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=RY6toyVs4qztpF5PSasA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: wTupzJ2XYt7m2l5pBpA_R8STc3CsOGer
X-Proofpoint-ORIG-GUID: wTupzJ2XYt7m2l5pBpA_R8STc3CsOGer
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA5MyBTYWx0ZWRfX0PBSy+gp1KXx
 sQKs0hL8f8TAwLY6AXs3aJiRjCN6DKxNrMk+jZuEhB7R+iMLzG8qTmEpNoMwAYif5CGpIGaboEs
 /WcFXq4Vfz0Za67gk3wXz68xuE6AUWb/g968NHF2TnTAhpFRsBjF97qst2ofxQIeyYqpBMl+kWl
 xa5yCKlMcWtADdydv08Ivnp4lbzRgWvpORMBzWPlH7cMG6MqUvx9Ekxtb/j8q6+ul5kzfhMaRzL
 QawardzelhsOisTOW5C/1WGnRhX+G0hM9tKM1iK6wGMJ0rdRfcwzGJY+7Jj+PWTJZH3PbSRbI5z
 +eAa60CmsUYbPq4LABGkgcnxsR0RHm+9zXE/3QEib/xLkOSPWbaeBfU+7aUw3trXdOfx0oNfkLa
 zKhLV1q/B5A9VIw9KsmsgmrKZB5Grie863oZdpo5PaQAuFw3zR9AtwHeAqcQQ1GSjeN5v42QG3U
 hP8YqCXjU0pgx3/6ZrQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070093

The SDCA class driver is useful on non-ACPI platforms where the
topology is supplied statically via sdca_class_hw_ops.get_function_data.

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
+	  Class for Audio (SDCA).  The ACPI/DisCo topology parser is
+	  only built when CONFIG_ACPI is enabled; on non-ACPI platforms
+	  (e.g. ARM/DT) codec drivers supply the SDCA function data
+	  via sdca_class_hw_ops.populate_function.
 
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
index e01d91eb3cc8..47dedb62c24c 100644
--- a/sound/soc/sdca/sdca_functions.c
+++ b/sound/soc/sdca/sdca_functions.c
@@ -25,6 +25,7 @@
  */
 #define SDCA_PROPERTY_LENGTH 64
 
+#if IS_ENABLED(CONFIG_ACPI)
 static int patch_sdca_function_type(u32 interface_revision, u32 *function_type)
 {
 	/*
@@ -199,6 +200,7 @@ void sdca_lookup_functions(struct sdw_slave *slave)
 	acpi_dev_for_each_child(adev, find_sdca_function, &slave->sdca_data);
 }
 EXPORT_SYMBOL_NS(sdca_lookup_functions, "SND_SOC_SDCA");
+#endif
 
 struct raw_init_write {
 	__le32 addr;
-- 
2.53.0

