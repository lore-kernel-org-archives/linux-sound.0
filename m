Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984AE46A5E9
	for <linux-sound@vger.kernel.org>; Wed, 22 Jul 2026 23:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784763759; cv=none; b=b2Hlu9P/7cRBGykKMblbcYZQeQF0bG6723j/BrlOHuRZ8uwKY/mD1MFpasc8yF8/q4tbses1odjspIU9Ams92coSHnmowmKi3+k+Rl6+k7r4GCypBR/VUKnw6OCUWO1tLgUpTMccYj2qeag/C17CPvgegaqj+oGkSLFylaW1VrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784763759; c=relaxed/simple;
	bh=I3HeKdoaqr6J677nN/TvvOWVijKfTEhqVjX9TUsnPn0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TRIO2VN/PkKuo0T1WBs+8lKv9UWxOzKaOYvzfd0IroJWEGmAOaY870sOGm3hopooSN7BWyCZI8CKEKMyyyhOXKCV6aIDO3QBmtiEdRykWjVUBOewSsZUaeNYPWlXjLmxA938VH6nZBFWeL+G8q1GXcPagLYBkvI/jLz/uoe+DV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FujzAj60; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QPDMkVIo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FujzAj60";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QPDMkVIo"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MMnXRO2316155
	for <linux-sound@vger.kernel.org>; Wed, 22 Jul 2026 23:42:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=1ecc3MSmL7x
	fj8NmfMmWmihlUbejMMv9R5FqL2QClAQ=; b=FujzAj60e2jkOlS+8OB5sOg8TcU
	qlYOzqB+wAK63ukMyu2p4ROybvLMGaPbkufkK/vTu+WbhK2O398il05kBVvqAmnt
	KmrI99ME9NbJx1Y5h0gKN0xCwFE1MqORwTikHX/NF/i5w99gJPmPu91sfhbVhUeU
	dQw4kqBkp98MTxIqIcd4nLepq5f66ROD5KR5qh7k6lxpHWlapd9JfVoZxBid0h96
	5YUzKN44DR4pAIesqkHQkoPfrZhM8RyxGHqJW/GUsgmHNqnPnG8t+EQJaQh4SB0/
	WzTkdUGMdAq9Y+tJk3uyNsHer7D2pEi0Ag9XXqCIkJG+Bz8fbHY0psXXtow==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk5cc0fsm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 22 Jul 2026 23:42:36 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5276aa86d00so273111cf.2
        for <linux-sound@vger.kernel.org>; Wed, 22 Jul 2026 16:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784763756; x=1785368556; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1ecc3MSmL7xfj8NmfMmWmihlUbejMMv9R5FqL2QClAQ=;
        b=QPDMkVIoRM5gQ8DWDNgAAAKmVmZUdzppAXRx14HUS8FpPPNRF2lMXOmYB7/oOi5AJ5
         9nuwlWRZoc6dOolfbOLlAV9nSUru7FasEMH9vLzBBDpBT8Hd96aVVN9709+R2UX2d6V3
         puSdvPv7YqHl0xyGQM6QhDChx/+/IskknNHNkOnHDsBiaPTCub6u0Xhhqrmp/gk8FqsV
         JrFmZw2npbU0VVkGEW7DtKdip1fWGCobP9K2W0sIj7tO/3lMXtcb9EcW68/oruhF5NPs
         C+GYAZtOAtqGGabOQRIc7Z3TiHKJBOQo/l1GC7W/frx7/mDlyOfb1QJAt3xpDyly2/h5
         r3RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784763756; x=1785368556;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1ecc3MSmL7xfj8NmfMmWmihlUbejMMv9R5FqL2QClAQ=;
        b=or1c/zZ4nc9w5/MN4zXm3lvCxcHcV9Nw5Z45FYMeyhK1Wg2j74yDhRLh+8fJYzv5W0
         O0Luu7jdTO84yR7mugCU8KFC7XvCsvY9244lJFFXaSzpUDw2gveEMFekU4qhLd/7sQqj
         fHL7tfvduZgTU/hIPs0FiMzgqdNAE5yCzSOmIr9rwjvm5Ughk/LaDMndVEOg7bwLY0nI
         tffaGicMbedG/vTpUPQSNPH0O2Kh/jofZIbPEtsqq9Rhm8xORCgASIlKSqLAIRNcN1TD
         vx9ap2JdQ273wrwXAEnXtr0NrXAVow32K368bWSGBjLvA1VGjTu7KLLGGoyHqBdXrovy
         VD+Q==
X-Forwarded-Encrypted: i=1; AHgh+RrQHnZERX4LdgFdEUD/qbs9el7+jN7XAqcMMzv9THDm915alK3J0b/xIJ+OGHi7gB01d3w4Ran69pCPJQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxU8lT7gucexOlfeh8HKQZwYWx6yKh0xFG07HKQovtyrzRFe7Xm
	ovpKf6NA2rmslMZz1Uu8bOFsAMI0JXd1/LaS+vKT4TfGmmoEzymTRH71zqBvkw49LmcEW9c7oEp
	MNIdE6XZvyLeQMFwBFTPB2OgH8wLJ8Te4i5c52vIYOW7SL6Ks8kaR5l60bTg1UUG/mQ==
X-Gm-Gg: AR+sD10YHeQoegTns3Jmnh4sHyUcA9wLpYazfo6+AlQY+MjdtUAbfSSLg3FWJH3uHZX
	dYeUIeFfbNzKrIOFxvs2+49+41Tcy9pouvmvnW3vd+5OaXgBTW7L2IhaodzH+sb0dS7Z67vW8gs
	hdP2Zl8PJmPWpO19FWhdphhSe5OH9V9v0SUXTpdGUfwKglFuSIggRdACanCqO/n3gpxXvchwBRX
	uoeeuG92FzqrnVv6E6xIcxRUqJA6M9SEJ3wwJEEWD9jCUSArsZbxzz4Q0p/BWZfxKGzDHkWNX5H
	fxFlt4j2Km69GrK3ycmgaVrFbNaHZY1s1dIm8IKYb+uKGlqvKAL0pT1ffuNd/dv5ZGAmlSC69PO
	QHmnhxRgLSiFsug==
X-Received: by 2002:ac8:5d49:0:b0:51c:7b12:5ff6 with SMTP id d75a77b69052e-5283dff0b9dmr6908771cf.82.1784763755731;
        Wed, 22 Jul 2026 16:42:35 -0700 (PDT)
X-Received: by 2002:ac8:5d49:0:b0:51c:7b12:5ff6 with SMTP id d75a77b69052e-5283dff0b9dmr6908501cf.82.1784763755268;
        Wed, 22 Jul 2026 16:42:35 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956a4aae16sm101796345e9.0.2026.07.22.16.42.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 16:42:33 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, patches@opensource.cirrus.com,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [RFC PATCH 4/8] ASoC: SDCA: add PDE pre/post-pmu hooks to hw_ops
Date: Thu, 23 Jul 2026 00:42:14 +0100
Message-ID: <20260722234221.884765-5-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260722234221.884765-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260722234221.884765-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Ybf0okQurLV5_La9mzCl0yUOZqHNEtX7
X-Proofpoint-GUID: Ybf0okQurLV5_La9mzCl0yUOZqHNEtX7
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDIzMyBTYWx0ZWRfXwpys5ACkYbG/
 r8eTGgFbqZXDEEvIOImQzQml1w438ixmuVpGX/uOLEFVfl52zvD+Q4Dcgkp/w3oxZjcrOtjNzUJ
 5wetL6+b7chrwLBKsPV0jXvoh4hg+/E=
X-Authority-Analysis: v=2.4 cv=L/ItheT8 c=1 sm=1 tr=0 ts=6a61556c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=L7SaaVQrovU1Y9o8N14A:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDIzMyBTYWx0ZWRfX/FohLUEJwB3d
 /Qdk98nZ2dFRCqF5qVApZSADGgiDr+RfjVgV9zZELrs890rHzU15H98V6h73pSbVbBiyKi9XLq+
 31LFoiUuhMrMZsqMEgJ6pip90IHmzA2q5TUfuKE2vbc6uTCmpYorD7iSg2/Gha0ypuaI3AcjblH
 Rc5Gef/b9DKV4rXbinaQK6CcpIRYbJTSRRFdlO2KQPZdBplDRcofV8oFYXn56jijLIdm9wiLUmV
 zjscgiTIEH+lvDLNcLMuIPclcyFIfF73RSk+MAFNXTtjzD5wNJp6QZb0O/Gd27B36xizHTtkuaN
 Z7MaFHjgOpBQ2W5TtT+6QSoL/r0TLK8JY3lbCZXs61MepYepZ03yH1AXqPDr82cyd+ecgHK1yZA
 aauBkbF5Hs8DRPvqgnNRwsZn/bUfwp8hVrZ09fZz5z73NPP5gi6aPpqNq9kAtL7E9BXTacjN0NK
 6zz+gpGrrKKNpDpos1Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_05,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607220233

Add pde_pre_pmu and pde_post_pmu callbacks to struct sdca_class_hw_ops
so codec drivers can hook into DAPM PDE power-domain transitions.

pde_pre_pmu is called before REQUESTED_PS=PS0 is written, allowing
the driver to stage state (e.g. IT_USAGE, MIC_BIAS) that must be valid
before the PDE sequencer runs.

pde_post_pmu is called after REQUESTED_PS=PS0 and before ACTUAL_PS
polling begins, allowing the driver to commit pending writes (e.g.
FU mute/volume via SCP_COMMIT) that the sequencer needs to see.

Both callbacks receive function_id and entity_id so the driver can act
selectively per power domain.

Assisted-by: Claude:claude-opus-4-7
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/sdca/sdca_asoc.c  | 33 ++++++++++++++++++++++++++++++++-
 sound/soc/sdca/sdca_class.h | 11 +++++++++++
 2 files changed, 43 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sdca/sdca_asoc.c b/sound/soc/sdca/sdca_asoc.c
index ac688cd62970..795498b9a314 100644
--- a/sound/soc/sdca/sdca_asoc.c
+++ b/sound/soc/sdca/sdca_asoc.c
@@ -32,6 +32,7 @@
 #include <sound/soc-dai.h>
 #include <sound/soc-dapm.h>
 #include <sound/tlv.h>
+#include "sdca_class.h"
 
 static bool exported_control(struct sdca_entity *entity, struct sdca_control *control)
 {
@@ -432,6 +433,8 @@ static int entity_pde_event(struct snd_soc_dapm_widget *widget,
 {
 	struct snd_soc_component *component = snd_soc_dapm_to_component(widget->dapm);
 	struct sdca_entity *entity = widget->priv;
+	struct sdca_class_drv *core;
+	unsigned int fn;
 	int from, to;
 	int ret;
 
@@ -439,6 +442,19 @@ static int entity_pde_event(struct snd_soc_dapm_widget *widget,
 		return -EIO;
 
 	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		core = dev_get_drvdata(component->dev->parent);
+		if (core && core->hw_ops && core->hw_ops->pde_pre_pmu) {
+			fn = SDW_SDCA_CTL_FUNC(widget->reg);
+			ret = core->hw_ops->pde_pre_pmu(core->sdw,
+							component->regmap, fn,
+							SDW_SDCA_CTL_ENT(widget->reg));
+			if (ret)
+				dev_warn(component->dev,
+					 "%s: pde_pre_pmu failed: %d\n",
+					 entity->label, ret);
+		}
+		return 0;
 	case SND_SOC_DAPM_POST_PMD:
 		from = widget->on_val;
 		to = widget->off_val;
@@ -451,6 +467,20 @@ static int entity_pde_event(struct snd_soc_dapm_widget *widget,
 		return 0;
 	}
 
+	if (event == SND_SOC_DAPM_POST_PMU) {
+		core = dev_get_drvdata(component->dev->parent);
+		if (core && core->hw_ops && core->hw_ops->pde_post_pmu) {
+			fn = SDW_SDCA_CTL_FUNC(widget->reg);
+			ret = core->hw_ops->pde_post_pmu(core->sdw,
+							 component->regmap, fn,
+							 SDW_SDCA_CTL_ENT(widget->reg));
+			if (ret)
+				dev_warn(component->dev,
+					 "%s: pde_post_pmu failed: %d\n",
+					 entity->label, ret);
+		}
+	}
+
 	ret = sdca_asoc_pde_poll_actual_ps(component->dev, component->regmap,
 					   SDW_SDCA_CTL_FUNC(widget->reg),
 					   SDW_SDCA_CTL_ENT(widget->reg),
@@ -502,7 +532,8 @@ static int entity_parse_pde(struct device *dev,
 	(*widget)->mask = GENMASK(control->nbits - 1, 0);
 	(*widget)->on_val = SDCA_PDE_PS0;
 	(*widget)->off_val = SDCA_PDE_PS3;
-	(*widget)->event_flags = SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_POST_PMD;
+	(*widget)->event_flags = SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+				 SND_SOC_DAPM_POST_PMD;
 	(*widget)->event = entity_pde_event;
 	(*widget)->priv = entity;
 	(*widget)++;
diff --git a/sound/soc/sdca/sdca_class.h b/sound/soc/sdca/sdca_class.h
index 74db9d4ce4a2..1278159ea61b 100644
--- a/sound/soc/sdca/sdca_class.h
+++ b/sound/soc/sdca/sdca_class.h
@@ -29,6 +29,13 @@ struct sdca_function_data;
  *             an array of struct sdca_function_data and stores the number
  *             of entries in @num (must be > 0 and <= SDCA_MAX_FUNCTION_COUNT).
  *             May be NULL.
+ * @pde_pre_pmu: called before DAPM writes REQUESTED_PS=PS0; use to
+ *             prepare device state that must be valid before the PDE
+ *             sequencer runs (e.g. IT_USAGE); may be NULL
+ * @pde_post_pmu: called after DAPM writes REQUESTED_PS=PS0 and before
+ *             ACTUAL_PS polling begins; use to commit pending register
+ *             writes (e.g. FUNCTION_ACTION) on devices that require an
+ *             explicit commit trigger for PDE power-up; may be NULL
  *
  * Codec-specific SoundWire drivers pass a pointer to this struct to
  * sdca_class_probe() from their sdw_driver.probe.  Codec-specific
@@ -39,6 +46,10 @@ struct sdca_function_data;
 struct sdca_class_hw_ops {
 	int  (*hw_init)(struct sdw_slave *slave);
 	struct sdca_function_data *(*get_function_data)(unsigned int *num);
+	int  (*pde_pre_pmu)(struct sdw_slave *slave, struct regmap *regmap,
+			    unsigned int function_id, unsigned int entity_id);
+	int  (*pde_post_pmu)(struct sdw_slave *slave, struct regmap *regmap,
+			     unsigned int function_id, unsigned int entity_id);
 };
 
 struct sdca_class_drv {
-- 
2.53.0

