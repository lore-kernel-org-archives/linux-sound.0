Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D5A4BA1F3
	for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 16:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789491450; cv=none; b=rTso4vWrVfIBsaKE+fpowRfNPPNMYWXXfuaCsUszJH4IVY6woXwtAFAWoqjvOt5IY0Kji2VpVY9eY42ddzSQ5qdV9AX8YsZSoczc3t1pFXSThA9gXHJrpXjjMhY74P7gsLCWPV51vqyLN9+XwqXYlqEOwGTyXEV1N67SDF8L6JY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789491450; c=relaxed/simple;
	bh=AsXKWMqSsZYic+4+nHonSuw6IKnniuZC4TJ17xky5w8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nneSY7wBgDzCFEkqj0b4Msjx2ZchWYDmbHd+lEvVVyPFHZu/h1e8O0hVlGUvRJqKwXgGVvkvp9taHctfiixlJBeWifyjAPXeX5Lhxgf46hmRC+rG1oOTX2VHZP7i/CvoL7RxncCHzbVIVLsYqjGjr4D17hWk9whBpp5/3DF+YLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zvh6+Xes; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fc+JoXIK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zvh6+Xes";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fc+JoXIK"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FFAgp23567072
	for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 16:57:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=vThtmsH7s5Q
	Z/N9eRQC24RtKUvjkzyNoDSrqm4gjePs=; b=Zvh6+XesFDYRzFtmL7N7o2bYwlh
	+X/vj+7zZ+WIL30wUvLTTeuvmIrNCDP1iFE725JZnZP5sGaTBz6FXQbiYCztjX7/
	IWTQT7gtjdnd+b9RCrcSpHfvdsryqyQnau8qvLPdLxqTOK4fkaMFoILeD1Pv0gyD
	EMVTlxJJltQDvKrHH3pw3BEjOd8hA8PYWr1KtH60jZSAuWqHouQ3P3dJBsDZ7YLd
	QF5hJVwPvCGYGbF/Ew1Mq2dD9rgTqa6r4v7aXi3aJgKrkTxo6E9xjYTEWOT88oiY
	VatmXztCcTXdD4/WTs/BPk3TNR5x/O1EAyouKDqceJfTbpWL/DWbM8sINjA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpxydb4vd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 16:57:22 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-79129463bb2so1427355137.0
        for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 09:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789491442; x=1790096242; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vThtmsH7s5QZ/N9eRQC24RtKUvjkzyNoDSrqm4gjePs=;
        b=fc+JoXIKh4kLWNUi0T4sx8voKaQxFWZon8d/9CheIWwXT+C66IC6/IhL8zUkQ5hMpV
         PW7g5AG9imIL6C7odqatxwKZN6d1q2leBRFI4qSPBmFehA0KBXlIjYX2ug74WE89z2aJ
         55BCsT/Oi5Cjl61H3tELcAr3JbsgYWyWLmwGHFvVELfsVALa82Ot0/GLozHBa+vvC+mj
         SXNbJMGXT4UTUCmAdVO6AjrG+emc5B+TQgUZVoX/sC5cR7tAaV7YftzpCU3kRnfU/1Cn
         N+GFeE2buoOaFqoKARtBka3EC0cOFijJvnoeU9Pd38MO+6DrqYXHCkHwiJ+cuAOFzR6z
         i+BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789491442; x=1790096242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vThtmsH7s5QZ/N9eRQC24RtKUvjkzyNoDSrqm4gjePs=;
        b=l1IXPFauP+DmBrLyUQw7qtd/z4xCnjzCtCuXx5b3t9XO12hq5NaoPbRkwiKK9M73VO
         A65qvvC1J3aQHD4JA+pQm2UOyy1QN4syxmZCbVK+Wxw1W6iUsBXzCifFF9k1jfVle03q
         YkoM3BWg31Bd1fq3CXuSh2eNM1mH+QuGq/8NfmJRhzlwzHOxVYPCTw+XVfYzw++9JP5i
         p4B7Ne6rpW1kZE2NWJka+xqaTpn9oXvEO2w1E0Xh4VsZgXyvYi2bLVB+2eCpA5xBpP52
         5gHtLnvSH17z8K/ALmeSgxQmh8fTxJAjWbNbWaHs2Pr7QX/uzFZ5AhJwQQsrtLcUuj2A
         4esA==
X-Forwarded-Encrypted: i=1; AKwUvBzyrhvsSYy8FZUwoMzfbWaWfYavySFg7zJYp+lp4AZ3vmDlrbG2wGmwo9z2PgmDZRJFEK5jKeOL2RNs5A==@vger.kernel.org
X-Gm-Message-State: AFuF++l4y3Ro1jhdfjFgiPyTPqPhs3R0jd7XgJyUcNbh5PoJDiV5pOum
	3w54JP/HOG9B7SBO9q2TBSVD4fMuQg7OqjV3yrWFMOmF/T5BEgm7BHg8xtE1VHLg0JeSCM1k6gd
	IbLpf/H2ZltDryD10fiWz5kSIHMiNv/vgyHoFR/QKKjPKdy9uGXNYgbCBkBxbMCnMcw==
X-Gm-Gg: AYBFou24yzqiiPq2OKsZNv7ceezkFqmyGRCiJTlF7qKEdky6G8gvnrh/vaUlGek48Vr
	c+vsHHhanLLQNDbBcCGFqXCpMafLwyxp3gPrgowBrZMOmpibJ5XoJxDf82yaZORJMyi9zpHxtsJ
	pC3n+bJ590KP/Sv2s2lxWSTSs+wcU48G6RsesAwhGnvg4LXLX9gh8Qj62FhxQpUxB1hNjGaqjsH
	INGPHuocG693EeFhod5n/uzGayjPqgTY8hiUmff+l189fj1mYYqaG+7PSI8hfLa/jd9nL2Sc/lv
	+givP+K+113x08akAM+LGGXGGFGSk3oYca5nd6IJ9dwp/RyMOpcCIkptWXUyFd75hKuLZojFs8n
	+9NMIgbXSwGr1Xg==
X-Received: by 2002:a05:6102:5f08:b0:79d:8255:3bef with SMTP id ada2fe7eead31-79d82554188mr6083047137.4.1789491441978;
        Tue, 15 Sep 2026 09:57:21 -0700 (PDT)
X-Received: by 2002:a05:6102:5f08:b0:79d:8255:3bef with SMTP id ada2fe7eead31-79d82554188mr6082921137.4.1789491441493;
        Tue, 15 Sep 2026 09:57:21 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83d9057dsm4361335e9.3.2026.09.15.09.57.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 09:57:20 -0700 (PDT)
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
Subject: [PATCH v3 6/8] ASoC: SDCA: add sdca_apply_default_control_classifiers() helper
Date: Tue, 15 Sep 2026 17:56:48 +0100
Message-ID: <20260915165652.914893-7-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDI0NyBTYWx0ZWRfX70yQnasxK3iI
 Zh9lO5IRhWQCVMCzY0WmMBnCRhfXBg5ccoyApALALKnD0bjfI3tu2QABnyJ+VMayMIMBoy4vjo1
 28uxLQZawxF3IqaVKOaOPLtBtBrQFCI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDI0NyBTYWx0ZWRfX1Q1czatp6d/K
 RK5VYu+/yr+g6k7SaGEkL7sl2QyaHdbTfI+gLJwDPUkGEEigVaFR3l49YvwXOyr/tJapEQ4IVpA
 Lv/riEO0VabOkq8uO7PbzktClleU8rrZszErTXf0rTksA++5HKV0FvHVE2bCppgB9fdv4/li1be
 r8Yiau6tpbKz6Cyg+sDXf4CEUafRjVjqCYfdZuXyo8PA/Q95oqF2Z1iNsEQjx9k+VNmmICvkCoV
 oyByUWt+a7ogoLavgYTdBX/oSd4qD0+yYl79cikJ+AggDfkiDo8ybT40rnP+D5ly6HKVRGwXzob
 KWBfm1bqQsAeZciiWtLSTnIdllFfvR5QOX5Ai+GMRu+zhdt8SyU3ufFzlJv4JaPGvXZ7LNe9wh0
 GIPeC/PZKrXz58VxlrsI/slMj0dvRiw/ORZt1WtAr4r3GB7uXk0kCTaQgnl7PXNdRsGyVcyT9b/
 G1PNNGyZG7y8NprZ+gg==
X-Proofpoint-ORIG-GUID: FV8VWkmDTZIc7t2mK0UdqhUqz_fIia44
X-Authority-Analysis: v=2.4 cv=LYepeTfi c=1 sm=1 tr=0 ts=6aa978f3 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=V3wSzEE_ktrjQKcqLJ0A:9 a=O8hF6Hzn-FEA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: FV8VWkmDTZIc7t2mK0UdqhUqz_fIia44
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_04,2026-09-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 adultscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150247

sdca_parse_function() derives is_volatile (see c7b6c6b60594) and the
spec-defined reset value (see 02d851b46b36) from each Control's
(entity type, selector, access mode). Codecs that ship static SDCA
tables via populate_function skip that path, so RW1S action Controls
end up with is_volatile=0 and get replayed on every regcache_sync.

Add sdca_apply_default_control_classifiers() to re-run those two
classifiers over a Function.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 include/sound/sdca_function.h   |  2 ++
 sound/soc/sdca/sdca_functions.c | 29 +++++++++++++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/include/sound/sdca_function.h b/include/sound/sdca_function.h
index e580201d69d5..d3d77d8bb7cd 100644
--- a/include/sound/sdca_function.h
+++ b/include/sound/sdca_function.h
@@ -1464,6 +1464,8 @@ static inline u32 sdca_range_search(struct sdca_control_range *range,
 
 int sdca_parse_function(struct device *dev, struct sdca_function_data *function);
 
+void sdca_apply_default_control_classifiers(struct sdca_function_data *function);
+
 const char *sdca_find_terminal_name(enum sdca_terminal_type type);
 
 struct sdca_control *sdca_selector_find_control(struct device *dev,
diff --git a/sound/soc/sdca/sdca_functions.c b/sound/soc/sdca/sdca_functions.c
index 6eb0e1059dbd..4196c5c86a85 100644
--- a/sound/soc/sdca/sdca_functions.c
+++ b/sound/soc/sdca/sdca_functions.c
@@ -2267,6 +2267,35 @@ int sdca_parse_function(struct device *dev, struct sdca_function_data *function)
 }
 EXPORT_SYMBOL_NS(sdca_parse_function, "SND_SOC_SDCA");
 
+/**
+ * sdca_apply_default_control_classifiers - apply framework-known Control fields
+ * @function: Function populated via static tables (populate_function path).
+ *
+ * Runs the same per-Control classifiers as sdca_parse_function() so both
+ * entry paths land on identical @is_volatile and @has_reset/@reset fields.
+ * Elevate-only: codec-set flags/values are preserved.
+ */
+void sdca_apply_default_control_classifiers(struct sdca_function_data *function)
+{
+	int i, j;
+
+	for (i = 0; i < function->num_entities; i++) {
+		struct sdca_entity *entity = &function->entities[i];
+
+		for (j = 0; j < entity->num_controls; j++) {
+			struct sdca_control *control = &entity->controls[j];
+
+			if (!control->is_volatile)
+				control->is_volatile =
+					find_sdca_control_volatile(entity, control);
+
+			if (!control->has_reset)
+				find_sdca_control_reset(entity, control);
+		}
+	}
+}
+EXPORT_SYMBOL_NS(sdca_apply_default_control_classifiers, "SND_SOC_SDCA");
+
 const char *sdca_find_terminal_name(enum sdca_terminal_type type)
 {
 	switch (type) {
-- 
2.53.0

