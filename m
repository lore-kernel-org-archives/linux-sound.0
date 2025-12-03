Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0260734D4C2
	for <linux-sound@vger.kernel.org>; Wed,  3 Dec 2025 16:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764778381; cv=none; b=oEQLgy+s0IwlZPLZj9E/WxLF0qRiov2oDTjD8LMY7oJnEF1ShCxLh9S63UEeOxFMsYAmiWxZrruhZQgit49+FATr0rGlN//2zjACHEdVxK3mbKEiJpBkFqP2+1aL2f5/Xp/1QgnIUXCTIHt5NKhhp6mHXGoI1hGn7lXCNNZ8Gms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764778381; c=relaxed/simple;
	bh=q9mFEQZfeT2leld7qV71CIZ5Fa2tn7vOKw3CYO/eH1o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Dn2JZHHLuIHTh+TZ0PiAjT2LhFwlsVCO6zUV0WRM+y7lo0SxFgVUpsuxnG4Aii6135U2n0L7TKcEK1MNF1IAY4Y9Y1+UM2tHgQvQLwSiYO7YPA+zM9S+lD0QUT9FQTspza9rKTI1MVNEA2iH7f++UWk15tYGXLksOPV5Z8jjoVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o5WpI5Dq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hZ9fqF/l; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o5WpI5Dq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hZ9fqF/l"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B3EOigX404620
	for <linux-sound@vger.kernel.org>; Wed, 3 Dec 2025 16:12:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9zetZLsiOGM88I/BZRhofKQK2G+O59uui3APX6JUHZc=; b=o5WpI5DqgzSUgfEo
	GrOVMI12yfBCjGKpm2AXoOje7RCXHRKCuuo2u0Z/mVx2b2smx5fuqvznMffn/3Ar
	iDoq3rnCa187nsroOweqYXqirSUAY08eA/RG+i0NjV8lNe4t6M1rUZe6FlVVtANX
	NBmti77jJMbFUXg2Ln2UBwq7QZTv5vOBYvbj1dLPU/usqwFaTsr4G8hPPPsIaNHt
	xqG1nxVAeeU/eaZdUrXS7LYQHt65RDLLk2E4jhukElq/Ys2KoXeXLMvf/x8y43K4
	irCjfuUsPv61rBlMtYuORaplrTR5138Pb7zwCorXOOcmh/xP2kEhIVxO4gH/sI6o
	x2BFOA==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4at9fcavvr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 03 Dec 2025 16:12:58 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-9353647cc30so1242416241.1
        for <linux-sound@vger.kernel.org>; Wed, 03 Dec 2025 08:12:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764778378; x=1765383178; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9zetZLsiOGM88I/BZRhofKQK2G+O59uui3APX6JUHZc=;
        b=hZ9fqF/lKHPMI4156llBSMACvLlXH93K0/DvS3q8isZM49D7Hh6y+aGGPRvVJ8R8Hj
         +H06yWrFLaxUQPOxJBUiyziA0ZGSGXkaYwLaVuc0lq2kSR1CGm5pLs3NH8t9XbBgTXwh
         5VNmvvS6XDovRwVcyCWRTfTFkYLqLA09HGR8v1eSbX39TkN4J7uPOiH0nrLleYNTump5
         //0Uqlx8yQTRDmbUpJF1teOe4+6XndvwCeCkMjusJmvGsEGgbfs55FLrJeKpfOZGNcSt
         vywr4jFE9VA3C4Op7nL9AsXzY2r4QEp/chofKYj2rLe0f93elcaic3en1JCo0nc7kIjL
         8f6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764778378; x=1765383178;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9zetZLsiOGM88I/BZRhofKQK2G+O59uui3APX6JUHZc=;
        b=Wrdp4I8cGyFkyMl3qzM7SK8mLK9rPCVMzKSpsI3uL9IW1c9FNLMqYO14L19Mij3vti
         G5YP/jFycEgto0wuubbbXzPl+PevRRbSgo39tpuXu8SRV6L34iIeOw0ixrFW1ZZOGid/
         8bh69Y72S1e2hBekvrGQbF/tKWDGk91Ie/PA0BhqewcMuqMhEHA7g0dk3uMK3GL2j+W6
         uUKnCVyVhC2TxDlW6TT3Q+xFagcAjWMScLZ/bZQzUdDZxFSrgqeULZFxlfsrgKz/B+QB
         2TYuC4ZN/GNOHWua0CioSoH/d8WheN12JMiwKzHOZkF4GoLMHQxr88K9uzV02geZsz+n
         HHNA==
X-Gm-Message-State: AOJu0Yy591Yfx6XkE1TISeTWWtlIvbT9HoY5LDtSgwq0SdeUwGLoa8Sb
	fUP5xm0xvXexLuZKw/omm8TdIlG+EEGPwj7jr1Hs7lXwhc5NphicTHaGcUKejUGVePBNn270vdw
	gI6i0CciqTna6SGMJMQ3CopXGSVLQVslBDJDNP4MqxCmzm5nxVvzKRiDRnwQEY7CpSA==
X-Gm-Gg: ASbGncvCoykGp2reImkGyaItNcHN+DVRnsSPJURCCuJjhI7VHH8TwH+lu0EXE1CqMt9
	VoVtSeeSwgCr0JB4T3z1yWbjlkB1FNKU6kfAAlI6sFSHdn84WinyYxbgCe/+DIxrLB5YwJzTHSJ
	pHo2wyuRGXfw32hZc/ga0wyDqHasmaQEkqgyTPeqR9ssSLv6WH9TdycZzVS4tcstWOY68HEYr5q
	hvwBmx/JOymYLTkFPR4Now7X5R/Dt7lOoKraj4HGxzOtabc4TgrPOgX5HZPiSHjXPPfAR3CN56q
	omdzPi+/eCGsLonFJP+zPNaRNFbUk/XsLWPlDsCEA7eFA3iCL+NMCNBWNCfg+FWRcKWY3CUyhnJ
	jmOERXKBZVwqCfXEebDXccRlrscPl0WZX7w==
X-Received: by 2002:a05:6102:b06:b0:5db:3569:9059 with SMTP id ada2fe7eead31-5e48813bd66mr1073187137.17.1764778377645;
        Wed, 03 Dec 2025 08:12:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEerlhmKZZIZuxokKtvCNjfaLCZfMCV1X+c1fG9SX8ti29Pfn3n6iYlA3IhNhTNW2VVIfMvqQ==
X-Received: by 2002:a05:6102:b06:b0:5db:3569:9059 with SMTP id ada2fe7eead31-5e48813bd66mr1073166137.17.1764778377202;
        Wed, 03 Dec 2025 08:12:57 -0800 (PST)
Received: from [127.0.1.1] ([178.197.195.159])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4792b021cd2sm23688295e9.1.2025.12.03.08.12.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 08:12:56 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 03 Dec 2025 17:12:40 +0100
Subject: [PATCH 3/3] ASoC: SDCA: functions: Fix confusing cleanup.h syntax
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251203-asoc-wrong-cleanup-h-continued-v1-3-5142be4874fb@oss.qualcomm.com>
References: <20251203-asoc-wrong-cleanup-h-continued-v1-0-5142be4874fb@oss.qualcomm.com>
In-Reply-To: <20251203-asoc-wrong-cleanup-h-continued-v1-0-5142be4874fb@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5457;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=q9mFEQZfeT2leld7qV71CIZ5Fa2tn7vOKw3CYO/eH1o=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpMGF91M3TnX1UKmTqGltaqVD/j6uQbaud6GhJK
 PXvUMrq5QSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaTBhfQAKCRDBN2bmhouD
 13VOD/9kd9fX1NQQ2qiG/kBorz6TKkPdQu0/4LselpRy45PR4PA7iNJ4GuioHYuK0pOE3YuQSv5
 1gMB4WqDLkDUlz0jKBzKH4Y83hT3tmKQwy5vCgEfcafqMF1KjBEoOj3RDYhwtpv0jWCX9ClYHdh
 mLKe53lOunX++YCPaX/A26Vbyx6/yjDf9I3H5aTOG1IIXel6bZctM946cY9M7osSNW6H7JXLlOe
 WUTPKLy9huPGOCsA28gnVZtcGOdlH1hbOh2Lrprb9YXZYvgNEfpEu5x0Ub+wNbYjMS4b6CJnnLK
 2els/HDnauv3rF/l8HT6DEzw4W6rrzUyBb7A8jabDZEe2Oba+F+APZyURI31ZMXUYIoLH+nIvk9
 K5MkN2gpKYi7f5qVqJdGjpgxgyWNOcOK4LAg4oBx5Gblyh1NA/42hY/OnXXKpMmrkanowZelWG8
 k3vHwl6PbGvXexbHzTizBRmch3YJwXTrgCFkddk6aSRZF9hcsFM+bM3oCmbN4MFw4b1sCbJjlVy
 Fj1A47uqjXpxzCvM65fLlfnZoWoepHHUJGiYKjmPu3AXN6iOnEvM7zGgmkA08K1fLy/1XNk5SAl
 UKFqM5Ufp4wfkS+61QfyU7kJiSvZi7MVG2BPoFOBHbgZ8M6NDVx0+XvNP8n3uc8LDrq7ebpNLP0
 /A7TnQKVV9hiTrQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAzMDEyOCBTYWx0ZWRfX1j/Bz3+rhJBZ
 jxhOOzOnTbPMEbJPXKGh84iUa0nswRgKuPzhTmYvqhUDcSuPse7V8zEUviqxzWSL8de7AHBoEzZ
 l2EhX24iwnWEgsfjvs4Yp/ncvOitOJgLv8FANcXBpzEfI9PI9esQscK2qM5KsB/7ERgxUJtlRTm
 qfjzee8lV4mAqAdh7ueuH0mlR0rIlEMKLeTrt8j9qOjVweBX0IpZVCWIdXaZ/0pmQjIUcY4AWSY
 +idG+10AXKDKFNEC19Jrrzb6xViZSrdmdNrsqEiy5tO1m7xhsbkWS33geX2a+KSbJMvi27svY2t
 jk/nyidD4ynAnac4KIYyuIXb1roCI54iIehQdpTWRudHxIjDEwXvaPG7/Z/w7RiNZnzINjycHHC
 uNUX453nPiJAtSkuQiX8XC1SvQ53dA==
X-Authority-Analysis: v=2.4 cv=Qblrf8bv c=1 sm=1 tr=0 ts=6930618a cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=FPK7cjBCgYbqzSTDLBmM0Q==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=EXIqECK6dIgXzTZ5EzcA:9
 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: Wppzxce0Eqg3uhhO6Zd9JNUCkrrh8Un4
X-Proofpoint-ORIG-GUID: Wppzxce0Eqg3uhhO6Zd9JNUCkrrh8Un4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-03_02,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512030128

Initializing automatic __free variables to NULL without need (e.g.
branches with different allocations), followed by actual allocation is
in contrary to explicit coding rules guiding cleanup.h:

"Given that the "__free(...) = NULL" pattern for variables defined at
the top of the function poses this potential interdependency problem the
recommendation is to always define and assign variables in one statement
and not group variable definitions at the top of the function when
__free() is used."

Code does not have a bug, but is less readable and uses discouraged
coding practice, so fix that by moving declaration to the place of
assignment.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 sound/soc/sdca/sdca_functions.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/sound/soc/sdca/sdca_functions.c b/sound/soc/sdca/sdca_functions.c
index 5a1f120487ef..acac066f1d8d 100644
--- a/sound/soc/sdca/sdca_functions.c
+++ b/sound/soc/sdca/sdca_functions.c
@@ -1184,7 +1184,6 @@ static int find_sdca_entity_pde(struct device *dev,
 {
 	static const int mult_delay = 3;
 	struct sdca_entity_pde *power = &entity->pde;
-	u32 *delay_list __free(kfree) = NULL;
 	struct sdca_pde_delay *delays;
 	int num_delays;
 	int i, j;
@@ -1205,7 +1204,8 @@ static int find_sdca_entity_pde(struct device *dev,
 		return -EINVAL;
 	}
 
-	delay_list = kcalloc(num_delays, sizeof(*delay_list), GFP_KERNEL);
+	u32 *delay_list __free(kfree) = kcalloc(num_delays, sizeof(*delay_list),
+						GFP_KERNEL);
 	if (!delay_list)
 		return -ENOMEM;
 
@@ -1250,7 +1250,6 @@ static int find_sdca_entity_ge(struct device *dev,
 			       struct sdca_entity *entity)
 {
 	struct sdca_entity_ge *group = &entity->ge;
-	u8 *affected_list __free(kfree) = NULL;
 	u8 *affected_iter;
 	int num_affected;
 	int i, j;
@@ -1269,7 +1268,8 @@ static int find_sdca_entity_ge(struct device *dev,
 		return -EINVAL;
 	}
 
-	affected_list = kcalloc(num_affected, sizeof(*affected_list), GFP_KERNEL);
+	u8 *affected_list __free(kfree) = kcalloc(num_affected, sizeof(*affected_list),
+						  GFP_KERNEL);
 	if (!affected_list)
 		return -ENOMEM;
 
@@ -1495,7 +1495,6 @@ static int find_sdca_entities(struct device *dev, struct sdw_slave *sdw,
 			      struct fwnode_handle *function_node,
 			      struct sdca_function_data *function)
 {
-	u32 *entity_list __free(kfree) = NULL;
 	struct sdca_entity *entities;
 	int num_entities;
 	int i, ret;
@@ -1517,7 +1516,8 @@ static int find_sdca_entities(struct device *dev, struct sdw_slave *sdw,
 	if (!entities)
 		return -ENOMEM;
 
-	entity_list = kcalloc(num_entities, sizeof(*entity_list), GFP_KERNEL);
+	u32 *entity_list __free(kfree) = kcalloc(num_entities, sizeof(*entity_list),
+						 GFP_KERNEL);
 	if (!entity_list)
 		return -ENOMEM;
 
@@ -1642,7 +1642,6 @@ static int find_sdca_entity_connection_pde(struct device *dev,
 					   struct sdca_entity *entity)
 {
 	struct sdca_entity_pde *power = &entity->pde;
-	u32 *managed_list __free(kfree) = NULL;
 	struct sdca_entity **managed;
 	int num_managed;
 	int i;
@@ -1664,7 +1663,8 @@ static int find_sdca_entity_connection_pde(struct device *dev,
 	if (!managed)
 		return -ENOMEM;
 
-	managed_list = kcalloc(num_managed, sizeof(*managed_list), GFP_KERNEL);
+	u32 *managed_list __free(kfree) = kcalloc(num_managed, sizeof(*managed_list),
+						  GFP_KERNEL);
 	if (!managed_list)
 		return -ENOMEM;
 
@@ -1961,7 +1961,6 @@ static int find_sdca_clusters(struct device *dev,
 			      struct fwnode_handle *function_node,
 			      struct sdca_function_data *function)
 {
-	u32 *cluster_list __free(kfree) = NULL;
 	struct sdca_cluster *clusters;
 	int num_clusters;
 	int i, ret;
@@ -1982,7 +1981,8 @@ static int find_sdca_clusters(struct device *dev,
 	if (!clusters)
 		return -ENOMEM;
 
-	cluster_list = kcalloc(num_clusters, sizeof(*cluster_list), GFP_KERNEL);
+	u32 *cluster_list __free(kfree) = kcalloc(num_clusters, sizeof(*cluster_list),
+						  GFP_KERNEL);
 	if (!cluster_list)
 		return -ENOMEM;
 
@@ -2026,7 +2026,6 @@ static int find_sdca_filesets(struct device *dev, struct sdw_slave *sdw,
 {
 	static const int mult_fileset = 3;
 	char fileset_name[SDCA_PROPERTY_LENGTH];
-	u32 *filesets_list __free(kfree) = NULL;
 	struct sdca_fdl_set *sets;
 	int num_sets;
 	int i, j;
@@ -2041,7 +2040,8 @@ static int find_sdca_filesets(struct device *dev, struct sdw_slave *sdw,
 		return num_sets;
 	}
 
-	filesets_list = kcalloc(num_sets, sizeof(u32), GFP_KERNEL);
+	u32 *filesets_list __free(kfree) = kcalloc(num_sets, sizeof(u32),
+						   GFP_KERNEL);
 	if (!filesets_list)
 		return -ENOMEM;
 
@@ -2053,7 +2053,6 @@ static int find_sdca_filesets(struct device *dev, struct sdw_slave *sdw,
 		return -ENOMEM;
 
 	for (i = 0; i < num_sets; i++) {
-		u32 *fileset_entries __free(kfree) = NULL;
 		struct sdca_fdl_set *set = &sets[i];
 		struct sdca_fdl_file *files;
 		int num_files, num_entries;
@@ -2079,7 +2078,8 @@ static int find_sdca_filesets(struct device *dev, struct sdw_slave *sdw,
 		if (!files)
 			return -ENOMEM;
 
-		fileset_entries = kcalloc(num_entries, sizeof(u32), GFP_KERNEL);
+		u32 *fileset_entries __free(kfree) = kcalloc(num_entries, sizeof(u32),
+							     GFP_KERNEL);
 		if (!fileset_entries)
 			return -ENOMEM;
 

-- 
2.51.0

