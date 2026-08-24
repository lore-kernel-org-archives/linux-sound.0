Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B0E1DE4EF;
	Mon, 24 Aug 2026 06:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787553411; cv=none; b=femYqMFlC/39Mps+MNHhTetvaNTqf1SEDFkVu4jb2xx7/co1cTxO1Vt5I7xKIuWBUBnAUg0XbujMKjlBH9hMMsrrl+0yNXLTWsAtYw4Jg24faFD8LOJkku69UniArZViEF6AhmsomRdlCloiMiLL71vBW5M+LAwmtmuXwFsjsew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787553411; c=relaxed/simple;
	bh=L9SBnzSSTBpgXwkEdhqqWKPxWhcIwMHzbFUSz/JdpGc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KiNmQcgNEprkivqysllIT7UW/XmCbo60iqn3VlXPTtjXBbLnQzFk43IEQs6NJy8dWummuCRxA+3BTxYSgCO9aqyi3LTAd9W/o5ae6WK7iiDSgNepvX+xth+jUOq+bm9kCtlBOCYxs+NRa57eYm/u+RvChoY0vPBNALMetq+ym3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oyz3jIIl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oyz3jIIl"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O5RGMb1008285;
	Mon, 24 Aug 2026 06:36:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=LoNHRyPCZNf
	4n0kqk0Sgg6I/8Qxak4myPy14FhqaGc8=; b=oyz3jIIlcmUmbAFdO3spJO0HvMf
	Vf+GCzyT6hioLF+qnTXPK9gplJbikqitGzHQWgWj+QuLb1MiJo5pYEhgm/MQ0uC0
	uZvcQJZFPtPKOapCXmAzKGX36jRgJAdl30qsByxXtFLTRE/2N1/Ek+i6NpAhYDwa
	H5eDlpX8i2nfi6NbV1Q2M0wBtkBF6nX6RunCk605r3x94rRxHU4ObViZs7DKLivb
	sm4OeaqIvmr2Vd16FA6K/WtwHSIsyYBRwSMRNaSuiuHD7PzOmHLjoHvYDf8csXOb
	o6C0JDmHYfqA3BqAzxhaUwvlL12sd7ukrpOKzx7UYbBPU3NB4TrjOvH/xhw==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g74xhdgnt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Aug 2026 06:36:41 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 67O6abLV016049;
	Mon, 24 Aug 2026 06:36:37 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 4g74uj2h8q-1;
	Mon, 24 Aug 2026 06:36:37 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 67O6aUCM015364;
	Mon, 24 Aug 2026 06:36:37 GMT
Received: from hu-hgautam-hyd.qualcomm.com (hu-hgautam-hyd.qualcomm.com [10.147.247.91])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 67O6aUFF015360;
	Mon, 24 Aug 2026 06:36:37 +0000 (GMT)
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Subject: [PATCH v3 5/9] ASoC: soc-core: Add snd_soc_of_xlate_dai_name() generic helper
Date: Mon, 24 Aug 2026 12:06:23 +0530
Message-Id: <20260824063627.3595610-6-harendra.gautam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260824063627.3595610-1-harendra.gautam@oss.qualcomm.com>
References: <20260824063627.3595610-1-harendra.gautam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-ORIG-GUID: Ll8FiCL_3enqF41IsqR6eYRid8isuElu
X-Authority-Analysis: v=2.4 cv=GdQnWwXL c=1 sm=1 tr=0 ts=6a8be679 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=w5fx3SuNlompWjsWq3UA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA1NyBTYWx0ZWRfXwRe0qTazF6ig
 eVQ4suXZfrRiCdhd4ZAkE6KOTVJTrPNknG66B/d5NsNfyLXUsd5ZAUaIsIF7iKgHBechs17L43p
 kJW2GB8JXCzU8v99feSjtN9y8OUaFlFvP3CwJIty0iYhuwhVYyJd0cRqbF58jAbkrFgRLWTJDym
 3Fg+uHar0CY5V0KTpubfjVwQReEqeeRucr+/j8vk9DoZFga9YBenMAIiQn+xeQHD2oWn120N8eg
 yB1bfrVuExQFjBK7dwh/a0XTKoFeI6887OZfVZ44QycWIJRuKs+Wg1SY5xUFT0njFO0wYywfqSU
 oUEI7HImA7zmgFD+QQvIdiY30bnusVWZE4gOtMBW1gKtJkUb4W4jTVzBGaSJgPaSeix33Jvx5MR
 +CH097UnUt0U26Cd8I4GU93WSKEbLDkyjzyzevQM9XBsepAxkw+k1VHXsiqUZ3lPLrwJINroMX4
 f3h8RvTOUdVUSci4fbA==
X-Proofpoint-GUID: Ll8FiCL_3enqF41IsqR6eYRid8isuElu
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA1NyBTYWx0ZWRfX3ojhMJxhw4nr
 gvnNj4atS6sY7Kd7lNL8Y/nhwk/jzGWC03CEFve5eTrOVlPwu1nWE3ZzpEFdNeb6doJ7GBCNK34
 jBRbxaQ58l7YBzIU2Bg9WBqfakypb08=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240057

Add snd_soc_of_xlate_dai_name() to soc-core.c as a generic helper
that can be assigned directly to the .of_xlate_dai_name component
driver callback. It iterates the component's DAI list using
for_each_component_dais() and matches by DAI ID.

Use the helper in lpass-cpu.c and qaif-cpu.c, and remove the local
lpass implementation.

Signed-off-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
---
 include/sound/soc.h        |  3 +++
 sound/soc/qcom/lpass-cpu.c | 23 +----------------------
 sound/soc/qcom/qaif-cpu.c  |  1 +
 sound/soc/soc-core.c       | 33 +++++++++++++++++++++++++++++++++
 4 files changed, 38 insertions(+), 22 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 10ad80f930c2..9d2b16a7ac2d 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -1329,6 +1329,9 @@ int snd_soc_of_parse_tdm_slot(struct device_node *np,
 			      unsigned int *rx_mask,
 			      unsigned int *slots,
 			      unsigned int *slot_width);
+int snd_soc_of_xlate_dai_name(struct snd_soc_component *component,
+			      const struct of_phandle_args *args,
+			      const char **dai_name);
 void snd_soc_of_parse_node_prefix(struct device_node *np,
 				   struct snd_soc_codec_conf *codec_conf,
 				   struct device_node *of_node,
diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
index 242bc16da36d..61efa45376cd 100644
--- a/sound/soc/qcom/lpass-cpu.c
+++ b/sound/soc/qcom/lpass-cpu.c
@@ -458,30 +458,9 @@ const struct snd_soc_dai_ops asoc_qcom_lpass_cpu_dai_ops2 = {
 };
 EXPORT_SYMBOL_GPL(asoc_qcom_lpass_cpu_dai_ops2);
 
-static int asoc_qcom_of_xlate_dai_name(struct snd_soc_component *component,
-				   const struct of_phandle_args *args,
-				   const char **dai_name)
-{
-	struct lpass_data *drvdata = snd_soc_component_get_drvdata(component);
-	const struct lpass_variant *variant = drvdata->variant;
-	int id = args->args[0];
-	int ret = -EINVAL;
-	int i;
-
-	for (i = 0; i  < variant->num_dai; i++) {
-		if (variant->dai_driver[i].id == id) {
-			*dai_name = variant->dai_driver[i].name;
-			ret = 0;
-			break;
-		}
-	}
-
-	return ret;
-}
-
 static const struct snd_soc_component_driver lpass_cpu_comp_driver = {
 	.name = "lpass-cpu",
-	.of_xlate_dai_name = asoc_qcom_of_xlate_dai_name,
+	.of_xlate_dai_name = snd_soc_of_xlate_dai_name,
 	.legacy_dai_naming = 1,
 };
 
diff --git a/sound/soc/qcom/qaif-cpu.c b/sound/soc/qcom/qaif-cpu.c
index 8792d01254a6..384562dbd56a 100644
--- a/sound/soc/qcom/qaif-cpu.c
+++ b/sound/soc/qcom/qaif-cpu.c
@@ -596,6 +596,7 @@ EXPORT_SYMBOL_GPL(asoc_qcom_qaif_aif_cpu_dai_ops);
 
 static const struct snd_soc_component_driver qaif_cpu_comp_driver = {
 	.name = "qaif-cpu",
+	.of_xlate_dai_name = snd_soc_of_xlate_dai_name,
 };
 
 static const struct regmap_config audio_qaif_regmap_config = {
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 7817beea5b3b..4b3efcd56b37 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -3040,6 +3040,39 @@ int snd_soc_of_parse_tdm_slot(struct device_node *np,
 }
 EXPORT_SYMBOL_GPL(snd_soc_of_parse_tdm_slot);
 
+/**
+ * snd_soc_of_xlate_dai_name - Resolve a sound-dai phandle argument to a
+ *                             DAI name by searching the component DAI list.
+ * @component: ASoC component to search.
+ * @args:      Phandle arguments from the sound-dai property; args[0] is the
+ *             DAI ID.
+ * @dai_name:  Output pointer set to the matched DAI name on success.
+ *
+ * Return: 0 on success, -EINVAL if args_count != 1 or no match is found.
+ */
+int snd_soc_of_xlate_dai_name(struct snd_soc_component *component,
+			      const struct of_phandle_args *args,
+			      const char **dai_name)
+{
+	struct snd_soc_dai *dai;
+	int id;
+
+	if (args->args_count != 1)
+		return -EINVAL;
+
+	id = args->args[0];
+
+	for_each_component_dais(component, dai) {
+		if (dai->driver->id == id) {
+			*dai_name = snd_soc_dai_name_get(dai);
+			return 0;
+		}
+	}
+
+	return -EINVAL;
+}
+EXPORT_SYMBOL_GPL(snd_soc_of_xlate_dai_name);
+
 void snd_soc_dlc_use_cpu_as_platform(struct snd_soc_dai_link_component *platforms,
 				     struct snd_soc_dai_link_component *cpus)
 {
-- 
2.34.1

