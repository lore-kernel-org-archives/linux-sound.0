Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A73BC448CE9
	for <linux-sound@vger.kernel.org>; Mon,  7 Sep 2026 08:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788770324; cv=none; b=UkZCANPWE8sgzbLhmGCao305fLMRqOcL2umeTmRG0jK7xxnt+TyLLPJKA7tThWup+dMFDWnxF1yvU4GjaW3a13x4/FOv9EKBRfNxaqlBfJjB9eYkwlgGknyVk4Pi9/bSYxrVbrxMtsJnoodGduE057q0nmcZyGbpCq6fM6bBZL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788770324; c=relaxed/simple;
	bh=iW28TnsYJ0VMS/rwDLxo2MLYsPIWZDhDjeusU3juDdo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g4W8qNEBj7eToHUjX3vfa312lrNq0QGHT8mKF7vTzqm7Xe7PaPmYGbmQ8mDkIrhyyEHMDXpOetAIRxz8eIyl20KWkn9oH+sGaiKxDS0VKnaLM7gpF4s+h0BrB6EziepkXK1ux/tj+i0PPEFoHothd0OuJGBuEbxpUWrX3VZwjvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Aia4/VqN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NTWIltLH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Aia4/VqN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NTWIltLH"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68777LqF3363499
	for <linux-sound@vger.kernel.org>; Mon, 7 Sep 2026 08:38:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=NZJ7nSDv9GL
	/FplrIRnBTH7KK1iSSswSLlWYBNxdg58=; b=Aia4/VqNgfaAFLH8Fc401vv3Ocx
	gjJUCCh3hgLDHq8fZR5/Lr949yRtMXhQJ0wXNgL+mG8pUgAxmVkOygG9wjCh5j8M
	xXITpR1o+ArulQ1SmaH89MkJx2yUMUMyM38TQdHeutrt9/WA57HXJpjxGGl+AT+4
	H0F/LlrMuYDjfhDSAXO5+MKUk4q6q0OmMFi1+pI3EKtkpFJ1l5SMv0n+GPXGBI22
	ZstC+2mmh4fexTcz/1slAjvUQRe6VKx/Bzc7+aWhc4Bfe6uMLXHS+35BnBYAT8qB
	KefzXzZPRDrhrOlhVSXe7gWjQeU3NL0MP16ai6fENDxtZVNZnpR9hPr60Ug==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghnmj131r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 07 Sep 2026 08:38:40 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-936e393061dso442671785a.2
        for <linux-sound@vger.kernel.org>; Mon, 07 Sep 2026 01:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788770320; x=1789375120; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NZJ7nSDv9GL/FplrIRnBTH7KK1iSSswSLlWYBNxdg58=;
        b=NTWIltLHAxoQUWLV6qKjWYthEkibG0mbKamHyTRuDmsR3W6pQIFTCjsom6tmTLb4Qw
         Q2t2P6eOUndYxqMtVeISgu8fOJVA6tYEC/vArPsplXRQ+Vdwm+54Ph6RCs4oKOaNnc4F
         2ycLHooJnwXB8LVKgdienLM4cfPCh6/NJVturHLEjHzjC0rqmqZVIfgt2qzhCtF2Xmic
         8nS08KCOyH1aa7loFyGMyb9JRLb+49UIB5ltBN464X3MjuHtKLgxRDh8y7kKw6WycikT
         DseKlCuHZDNhEm8TXmqlrp/PJZ8XBgpNc0sIKlMzX6mkAPq8rt8CbLk/H+StnF3EklXK
         DjWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788770320; x=1789375120;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NZJ7nSDv9GL/FplrIRnBTH7KK1iSSswSLlWYBNxdg58=;
        b=S7UKojB6uAdHZtoA+cGTy59Ii2SJ50GnK3LtRaTGO6PltP+pZjni/TJztyiDt2FXiw
         Ti8R+742ryEx4CC+2YUhJ5QJCCoZkb0F2JWakzP6qx2VfgCCJH1K0B59hlRy2wRUQ9Z2
         seKfuJ6oP9cw8U3SuzQ1uzqqx8FLYYJ/vtf7AO1JLRfIV9CLrEty9IhK6igucuyNVbhw
         kOgjuE6+W5OxzDFZhSapP7suDktc9CasQbSUCuc+rE1bFIKvUT5M8cLKAYHIl4wqKOAv
         muBuUJQCnDF1LlXkuDVcV5hYsnaLAWBrwKr/ds+B4hVR9pYIqcEk7CXe951uLbqcFn6N
         sgoA==
X-Forwarded-Encrypted: i=1; AKwUvBzRKfXbiK104vB0nWOKZqRqANXDAURS3PgHRB2TVlUygfBG874YIM+33x62hN6W1uuNKf6k72ivvVQykg==@vger.kernel.org
X-Gm-Message-State: AFuF++kWHFfXnNhE+pBUDAUSN4d4pA+kEE7mIbi8/VsfS0ItcuDGeRDO
	J5OuZ7ZmBI3P5jcFFsYJX5ki0igHSx7A1s8JaF/JDvE3dlG0fiGweF/jogBwvMz0x/ebzjAFmca
	gCc9S1y1MTK2potL+omfnnT7wB8Zoz8f0E0dj8pmadjGSJn5wiCYP42+H3S/qcXxIEg==
X-Gm-Gg: AYBFou3EWF7iMsDISVZ/LZaNNNU7Otg+rFoRJ/urrm22rJfiY/pmajH6ljq18uycNVG
	TuiTNez1mNj0zMB5wGU99qWNzpQSGA8+vUJAQzNxi5ftB/xX3MBcnIzcJkUkOtaLRGvo6J6W0m+
	TPP9Wz0HRMKwvnx+9DVgSxKh1c8yGf4VIDRyYIdCTCII/0uvR5GeZ2MoofGw/uIQK5tswfJ95aW
	ho9q97g1+LGYSh1jlkKNNPksQmf06jlJiODCNqKdhJ3vbC/ef4KkKsTGNZGtx4xnFq88OK74Dbe
	vqoiuQDnGaDhN1TZ9AVy7MXZVriCW1Nk0gMKnsWPKt0qytNtVdu0nR0liNccgyaXzbzx5Jqtu+O
	gcYmsKeY6oJqnhQ==
X-Received: by 2002:a05:620a:2720:b0:939:6dea:374a with SMTP id af79cd13be357-939804f807fmr2245692085a.46.1788770319811;
        Mon, 07 Sep 2026 01:38:39 -0700 (PDT)
X-Received: by 2002:a05:620a:2720:b0:939:6dea:374a with SMTP id af79cd13be357-939804f807fmr2245686585a.46.1788770319319;
        Mon, 07 Sep 2026 01:38:39 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c6ba4sm30852179f8f.25.2026.09.07.01.38.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 01:38:38 -0700 (PDT)
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
Subject: [PATCH v2 09/11] ASoC: SDCA: add sdca_apply_default_control_classifiers() helper
Date: Mon,  7 Sep 2026 09:37:23 +0100
Message-ID: <20260907083727.733705-10-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA5MyBTYWx0ZWRfX8OnT3+ZRfPQL
 EyhyV7njeMgueH/bscwHm8shFKS0FcuI/FHb9V0mIGc5peNgQ28u6gyV4FqXrSNm6faP4L2YiWq
 LvZZhgFCkGkXAVCShVzX74b8lvgLc6XKT39vHu34JqN0qCbz5d2FXSKdHXnO/QH8wHZ0704CJAI
 OY5GMYxzQVJ1DUh5QYGsB98dDQUW0q1tNPFcisLZn8hR6a1qbUCOQqLRQEGSdpll1egceF1ka05
 /7HJJbnYT4BrQsA6L6XXUpst6bLS9xmZb8OefN6d3yCSr0IY65M7kiLh2zW3ZUl5KWItq06MTUf
 kkLSb7PNjFt7Qp8ut5mM4b1BiCWFdZVGtloUcvvtvZIEy1wWqol8zRPtQk+45Wi03QPzSrex7O6
 xoz7MOsGUzIs8cosOGjHbJc4kqHxr63AfN/9RpvjDa/Pi7DmuJX7jDSZwnL6Ena9bQl68RknP6T
 gRUn7IduA5fMgGS9Hzw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA5MyBTYWx0ZWRfX8qnrC27GmaeN
 qNRzsiDlH5+XciTTOOJE0kQFtLz0+NoICYeqE/V1QphyurleRo6DHJ7fcIpu9lSoju68Jr1Wvot
 mqPCQqCcYcFAOQDqETwvSkyS+sVz8/0=
X-Proofpoint-ORIG-GUID: s7o2vpNcjIxw4ISsG8J6O6D3qKP1b4Oc
X-Proofpoint-GUID: s7o2vpNcjIxw4ISsG8J6O6D3qKP1b4Oc
X-Authority-Analysis: v=2.4 cv=LZYMLDfi c=1 sm=1 tr=0 ts=6a9e7810 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=KCW3dyBotJ-MOgbrRv8A:9 a=O8hF6Hzn-FEA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070093

sdca_parse_function() derives is_volatile (see c7b6c6b60594) and the
spec-defined reset value (see 02d851b46b36) from each Control's
(entity type, selector, access mode).  Codecs that ship static SDCA
tables via populate_function skip that path, so RW1S action Controls
end up with is_volatile=0 and get replayed on every regcache_sync.

Add sdca_apply_default_control_classifiers() to re-run those two
classifiers over a Function.  Elevate-only, so codec-set flags win.
Call from the tail of populate_function.

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
index 68a50552f4e4..8f4d04e09032 100644
--- a/sound/soc/sdca/sdca_functions.c
+++ b/sound/soc/sdca/sdca_functions.c
@@ -2268,6 +2268,35 @@ int sdca_parse_function(struct device *dev, struct sdca_function_data *function)
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

