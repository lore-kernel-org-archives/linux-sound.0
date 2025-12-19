Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C3EF332914
	for <linux-sound@vger.kernel.org>; Fri, 19 Dec 2025 11:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766144758; cv=none; b=OpCUAiwN3+4g1fU4K2jciwfWM/wpzBn68VNROkgyrS5wGHKMe0azVcl/9zqzFsmlA1L+aTISPkTvlaI5Vyz2LTfraJWxvDNaMZGJ6JZMwnSZeFDeoCN99DS17mU4LrcKWHub31LNCyMJniChrInwiNZhoc7uLhhUxaLPmSJcBgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766144758; c=relaxed/simple;
	bh=6iQcqoX6EI5dlA/DvhZnH1NTKtirFC7ZgIFkbryUzbY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LDCMHYrBGeIudGLWRilwTB2CfH0T9aNSlPE10yvxuTUcAKJhGNks0wsKE89RdhEvB89WVz9d0dB+xOIdBrJEd0csCISKliiDNmf6e25EejAdKxV1CRDKvaB69nx01I/VU1SgtM8ABhWzDaWWjqxwxQlevgKNNj9LR49xOxI3vlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DVxYbzuI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=REAUt2tW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DVxYbzuI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="REAUt2tW"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ4cMTV091962
	for <linux-sound@vger.kernel.org>; Fri, 19 Dec 2025 11:45:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	36PQfpvZIMXAADK9+hYs7pMJ/as3fZIUaaNgWdG/gSI=; b=DVxYbzuIF3Abdhb6
	CRnlsPQaBmZ8B6k0EUIUsdpTSjCyjMSZ3Srrdw0s5UQG6PTnKP9KfaDX48zrA/pt
	4W1wNoTpeMfuoLaXzzSaJGGTSSI4Pq6Cv4ukr4Wmoka4kE7j450ZhOB7h8sfb5M1
	IG2qVCvKtH/Gokq4BiuW+bfnYRPEsSxzXiWZ4UlFW1l67gz/sbM4x5XQ+bcAE11t
	Q6VmHB9cV/p8cQ6sEosNhZVtS3qkdmQs6kyFL6Vx8ByFg1kwH3dj04LmMkbpDXns
	p6IzoJTVNScstutzxFuhP93tcc1vjpvi38Ae60zQhDB1G+/1Ppgq+vDSaGmNyUbU
	wqCDUA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2eagu7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 19 Dec 2025 11:45:55 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4f1d60f037bso33900781cf.0
        for <linux-sound@vger.kernel.org>; Fri, 19 Dec 2025 03:45:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766144755; x=1766749555; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=36PQfpvZIMXAADK9+hYs7pMJ/as3fZIUaaNgWdG/gSI=;
        b=REAUt2tW86QM7vKkZg56fwMN0qGl/YV8O3ObprurGsHtpECdTw1O4QtR3iqDHul+J2
         fmYuWzZhjq1BvPtMPJVRxqFPUJmwU33h1gjjP3whWIzNZiPQUmS+lLKX/xIO0BB8gUbq
         mwJkrty3QfKUX8UAJCI3Bano0iyL28uYfFYAkVwPxamzQslDTdUfmVmZMTr+gkwj6bIn
         OO8/KtzviQQdsqAKqqN+mhnZCuWwF3QvOZwyVnivkFJO6iKCZBCgBhErOCp5ODWRPsDB
         egGiaQXdiEtwdgZxocmkRrSjBg3gzyKvLHL5Er7ch75PadaNvqW75P67+6mi77lmXiqB
         ORzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766144755; x=1766749555;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=36PQfpvZIMXAADK9+hYs7pMJ/as3fZIUaaNgWdG/gSI=;
        b=BVsRvzFJu4MGsXI+X1LJrF05bH7ScgLpODk0OLhdawn4xYX7j54m5NHEtAABFgT6qT
         e7y47CJHGiFkp6kwDhsyWW6RRY3BZzRA7fPWBgnq03tya6HzThPw0R47i7+U38YRu1PJ
         Qwly5AScXzUQ18q+U5xg8Zl8IF1jsWpHOo8NqlKZh+66vSSrE8L7QSDWjAvKq+drbHN/
         XWLB7VVREf6MmF56iuJ2+/UlfHioc43YqkD9HCQn9l3xuCJ3CWPKKwBL8pycAuW5PSCq
         s1VHSo3DQtNa3AuOc6FKHuAlzkSGb/SERNvOyhBkMbcZB0evJ9ROekk30diPI/wi5rk0
         Ff2Q==
X-Gm-Message-State: AOJu0Yx7RULZpgo9ePyLvheB/xx1/EP5KvEaoXAgZOT9Pa2qXZ6Yemyb
	tM0lOez8YWkBsjodqWX8WdzHmwbmWsJAYLPFPSlTYpGEpHKSdG7bRfNmbBM9MSokYE/3E/SP1ab
	bKcSUhAK2+Y/uf4H+WP/UWn7a6pf4w6B5ZYpatMie7F1GqRmfpSqS2hzMZTyNfXVHxQ==
X-Gm-Gg: AY/fxX4vXjDZoD7XF4eXJmh9m75+jn6Un4QZ1Aano/o99KFaYHEc2kxPEarFQJ2Ki1u
	klrAuebQyhmWzSMwATmtQm/61w/D7nd/flIE1uVsCtyiAV3jqQ07uPik8yEsv3LdsY+0Ypa2gaM
	Up3KxwHB40TPqrEHaVik5hVy2xp7vukLNHTkZ5pD9IW4JaLI6DAPxIss456gk777T/w9NL4VTkr
	lq5djTcS2c5KASg51FZdUvxn27vcnpHEaoPVUyQoWsZ1uSpt/YtlsjzR4rOZv0SqzujKzt6BVFX
	UsqiQshFxW1VWlFb07t83z0rHPAwG/psDkhPtfrfFy9X0LI6pSC3R43qzwPnmcfu24DFpdTRw7L
	JAjzaokazQNBA+xv69Wj7KLGI5um/au1b8pRyrPc7ezztYPuh0kMTETg6y6YyNobTteTc
X-Received: by 2002:a05:622a:90b:b0:4ee:1e28:acc5 with SMTP id d75a77b69052e-4f4abdb8a83mr34459361cf.61.1766144755272;
        Fri, 19 Dec 2025 03:45:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEj/wWg8UX4Lk00EwF/Tg7aeliCSqzdQO+EZ1nBaXedJue4tu12ePIdbTJEtt5WJGatpPxiEA==
X-Received: by 2002:a05:622a:90b:b0:4ee:1e28:acc5 with SMTP id d75a77b69052e-4f4abdb8a83mr34459001cf.61.1766144754855;
        Fri, 19 Dec 2025 03:45:54 -0800 (PST)
Received: from [127.0.1.1] (83.31.98.88.ipv4.supernova.orange.pl. [83.31.98.88])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b91599844sm1974465a12.25.2025.12.19.03.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 03:45:54 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 12:45:44 +0100
Subject: [PATCH v2 1/5] ASoC: qcom: topology: Constify pointed topology and
 vendor structs
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-b4-container-of-const-asoc-qcom-v2-1-05fd2ecc06fe@oss.qualcomm.com>
References: <20251219-b4-container-of-const-asoc-qcom-v2-0-05fd2ecc06fe@oss.qualcomm.com>
In-Reply-To: <20251219-b4-container-of-const-asoc-qcom-v2-0-05fd2ecc06fe@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=8790;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=6iQcqoX6EI5dlA/DvhZnH1NTKtirFC7ZgIFkbryUzbY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpRTrr2vYzNesFQ+sK/Axv9hE7nGKF5leh2uV09
 ezIYLvg2PaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUU66wAKCRDBN2bmhouD
 1zHYD/9JTgWW3uIaKU2bHDN80TmFDCOG9MBeVWwKfayeTqJ6a46I5HNESHwCAvkiaQU5nWyLOgI
 1JnpgYwzXsIpMU/QgpLSC6ds5mLpfezbSkhtAxgzLgFJp6Q8HLTKrBsPz5olOeb7lbleyTxjBpZ
 /uOJ7NrJTvJxkyksDI28YOzIB6HqzQzL6BhN04KLaMooFmEthxOPm6mulAftuuQgRSKkxBicztk
 wrybho9rIp39ShwUoom0AljtMpMdvm/mqWi19njbSmy/vQVnWb7FL6kvub/tGXb1Xf6JqIBV2rd
 oFUEIyMbZZdD5cLmiCtTqkHeGF7s1Y8hjDXBvpTbIguVxkeGE/SiH2+mLE9ZYXYDfM16cpZaB1j
 2UZLGv1toVYnB1uH7K9eJFEXVGs0Mq4bA1lSfV9g96Vq0NCa6cjyHGQHsCWEUNRgMqu3ctDwgwo
 3LuFq1D7IVCZKuG44MW/IhXwFssMcK+EfrBMaNw+ZOmnvzQjGeuSJUDcPLQhU1CZHI+auC5UGtA
 LO/s1ZMaVRBedRBU6oPC8vjb1p5KzVarmKaswZM0xGsRQHoWAoJwetyvjdJoqIqiiFRPJTBxpn4
 UTIryQ8923FBHY83+ycm97pfHDuIjdkY9oV7r4lUJ1QIL1Kr4HleiDRmweCy4t35sKM9wkrIbX/
 zT/siaq0N8EvhtA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA5NyBTYWx0ZWRfX5pL4NFvWcldV
 4+dqgkQdhcQt7R0BxISpbfVmCUygZZ+771TVMgyym4lKU7wvILrLogtFnekFZ5q1JOxMpSnyrSx
 MbRMbTvDQ86D5zYO7uNcfzQNNvd9VTrVkjlS+wSpHfUQ3eHjmZY+rDIneGG/HgXi6Jb+iIlZZ9+
 lw5t1m/mz6D1F8myjMh5UzNJeY7+PUdwdVQ8xn963faf+x7sj682ISNEvEakZr7YU3hjU8DRsou
 R06jfU4+quoTW6hUTJSw1G7J4AF8pRcNVuldaw3WmGu673f9dzbRa7K2fciKJH2qmfs6ZhMhfuc
 VfTfHe0g3FUUxhYZztdRGc94ItH7UAR6la/fApWb688AF2YZUt568Xb9KirJpztwgCL7JCWQqsg
 e8eLDpSfxAooHi27r2Xli96oq+hdqpbINhqaIPPCpNsH6PfBxqaRzPRei5NTorUfDEF1yOfkiDf
 JbqLxqGQPK4A8YrhhAQ==
X-Authority-Analysis: v=2.4 cv=W+c1lBWk c=1 sm=1 tr=0 ts=69453af3 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=qe4J/qXhiWkb1JZGYKbLYA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Q5gdzY3N6a2DZr8aCz0A:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: nbjR3lc5SdgaFhHcGduI8R16DeVx_Na0
X-Proofpoint-GUID: nbjR3lc5SdgaFhHcGduI8R16DeVx_Na0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512190097

Several functions in topology.c receive pointers to 'struct
snd_soc_tplg_vendor_array' and 'struct snd_soc_tplg_private', and do not
modify their contents.  Constify the pointers for self-explanatory code
(pointed memory is not modified by the function) and a bit safer code.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/topology.c | 70 ++++++++++++++++++++---------------------
 1 file changed, 35 insertions(+), 35 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/topology.c b/sound/soc/qcom/qdsp6/topology.c
index 5ce6edf3305e..062eb01fc7a7 100644
--- a/sound/soc/qcom/qdsp6/topology.c
+++ b/sound/soc/qcom/qdsp6/topology.c
@@ -206,15 +206,15 @@ static struct audioreach_module *audioreach_tplg_alloc_module(struct q6apm *apm,
 	return mod;
 }
 
-static struct snd_soc_tplg_vendor_array *audioreach_get_sg_array(
-							struct snd_soc_tplg_private *private)
+static const struct snd_soc_tplg_vendor_array *
+audioreach_get_sg_array(const struct snd_soc_tplg_private *private)
 {
-	struct snd_soc_tplg_vendor_array *sg_array = NULL;
+	const struct snd_soc_tplg_vendor_array *sg_array = NULL;
 	bool found = false;
 	int sz;
 
 	for (sz = 0; !found && (sz < le32_to_cpu(private->size)); ) {
-		struct snd_soc_tplg_vendor_value_elem *sg_elem;
+		const struct snd_soc_tplg_vendor_value_elem *sg_elem;
 		int tkn_count = 0;
 
 		sg_array = (struct snd_soc_tplg_vendor_array *)((u8 *)private->array + sz);
@@ -239,15 +239,15 @@ static struct snd_soc_tplg_vendor_array *audioreach_get_sg_array(
 	return NULL;
 }
 
-static struct snd_soc_tplg_vendor_array *audioreach_get_cont_array(
-							struct snd_soc_tplg_private *private)
+static const struct snd_soc_tplg_vendor_array *
+audioreach_get_cont_array(const struct snd_soc_tplg_private *private)
 {
-	struct snd_soc_tplg_vendor_array *cont_array = NULL;
+	const struct snd_soc_tplg_vendor_array *cont_array = NULL;
 	bool found = false;
 	int sz;
 
 	for (sz = 0; !found && (sz < le32_to_cpu(private->size)); ) {
-		struct snd_soc_tplg_vendor_value_elem *cont_elem;
+		const struct snd_soc_tplg_vendor_value_elem *cont_elem;
 		int tkn_count = 0;
 
 		cont_array = (struct snd_soc_tplg_vendor_array *)((u8 *)private->array + sz);
@@ -272,15 +272,15 @@ static struct snd_soc_tplg_vendor_array *audioreach_get_cont_array(
 	return NULL;
 }
 
-static struct snd_soc_tplg_vendor_array *audioreach_get_module_array(
-							     struct snd_soc_tplg_private *private)
+static const struct snd_soc_tplg_vendor_array *
+audioreach_get_module_array(const struct snd_soc_tplg_private *private)
 {
-	struct snd_soc_tplg_vendor_array *mod_array = NULL;
+	const struct snd_soc_tplg_vendor_array *mod_array = NULL;
 	bool found = false;
 	int sz = 0;
 
 	for (sz = 0; !found && (sz < le32_to_cpu(private->size)); ) {
-		struct snd_soc_tplg_vendor_value_elem *mod_elem;
+		const struct snd_soc_tplg_vendor_value_elem *mod_elem;
 		int tkn_count = 0;
 
 		mod_array = (struct snd_soc_tplg_vendor_array *)((u8 *)private->array + sz);
@@ -305,13 +305,13 @@ static struct snd_soc_tplg_vendor_array *audioreach_get_module_array(
 	return NULL;
 }
 
-static struct audioreach_module_priv_data *audioreach_get_module_priv_data(
-		struct snd_soc_tplg_private *private)
+static struct audioreach_module_priv_data *
+audioreach_get_module_priv_data(const struct snd_soc_tplg_private *private)
 {
 	int sz;
 
 	for (sz = 0; sz < le32_to_cpu(private->size); ) {
-		struct snd_soc_tplg_vendor_array *mod_array;
+		const struct snd_soc_tplg_vendor_array *mod_array;
 
 		mod_array = (struct snd_soc_tplg_vendor_array *)((u8 *)private->array + sz);
 		if (le32_to_cpu(mod_array->type) == SND_SOC_AR_TPLG_MODULE_CFG_TYPE) {
@@ -334,10 +334,10 @@ static struct audioreach_module_priv_data *audioreach_get_module_priv_data(
 }
 
 static struct audioreach_sub_graph *audioreach_parse_sg_tokens(struct q6apm *apm,
-						       struct snd_soc_tplg_private *private)
+							       const struct snd_soc_tplg_private *private)
 {
-	struct snd_soc_tplg_vendor_value_elem *sg_elem;
-	struct snd_soc_tplg_vendor_array *sg_array;
+	const struct snd_soc_tplg_vendor_value_elem *sg_elem;
+	const struct snd_soc_tplg_vendor_array *sg_array;
 	struct audioreach_graph_info *info = NULL;
 	int graph_id, sub_graph_id, tkn_count = 0;
 	struct audioreach_sub_graph *sg;
@@ -392,10 +392,10 @@ static struct audioreach_sub_graph *audioreach_parse_sg_tokens(struct q6apm *apm
 
 static struct audioreach_container *audioreach_parse_cont_tokens(struct q6apm *apm,
 							 struct audioreach_sub_graph *sg,
-							 struct snd_soc_tplg_private *private)
+							 const struct snd_soc_tplg_private *private)
 {
-	struct snd_soc_tplg_vendor_value_elem *cont_elem;
-	struct snd_soc_tplg_vendor_array *cont_array;
+	const struct snd_soc_tplg_vendor_value_elem *cont_elem;
+	const struct snd_soc_tplg_vendor_array *cont_array;
 	struct audioreach_container *cont;
 	int container_id, tkn_count = 0;
 	bool found = false;
@@ -437,7 +437,7 @@ static struct audioreach_container *audioreach_parse_cont_tokens(struct q6apm *a
 
 static struct audioreach_module *audioreach_parse_common_tokens(struct q6apm *apm,
 							struct audioreach_container *cont,
-							struct snd_soc_tplg_private *private,
+							const struct snd_soc_tplg_private *private,
 							struct snd_soc_dapm_widget *w)
 {
 	uint32_t max_ip_port = 0, max_op_port = 0;
@@ -447,8 +447,8 @@ static struct audioreach_module *audioreach_parse_common_tokens(struct q6apm *ap
 	uint32_t src_mod_inst_id = 0;
 
 	int module_id = 0, instance_id = 0, tkn_count = 0;
-	struct snd_soc_tplg_vendor_value_elem *mod_elem;
-	struct snd_soc_tplg_vendor_array *mod_array;
+	const struct snd_soc_tplg_vendor_value_elem *mod_elem;
+	const struct snd_soc_tplg_vendor_array *mod_array;
 	struct audioreach_module *mod = NULL;
 	uint32_t token;
 	bool found;
@@ -622,8 +622,8 @@ static int audioreach_widget_load_enc_dec_cnv(struct snd_soc_component *componen
 					      int index, struct snd_soc_dapm_widget *w,
 					      struct snd_soc_tplg_dapm_widget *tplg_w)
 {
-	struct snd_soc_tplg_vendor_value_elem *mod_elem;
-	struct snd_soc_tplg_vendor_array *mod_array;
+	const struct snd_soc_tplg_vendor_value_elem *mod_elem;
+	const struct snd_soc_tplg_vendor_array *mod_array;
 	struct audioreach_module *mod;
 	struct snd_soc_dobj *dobj;
 	int tkn_count = 0;
@@ -660,9 +660,9 @@ static int audioreach_widget_load_enc_dec_cnv(struct snd_soc_component *componen
 }
 
 static int audioreach_widget_log_module_load(struct audioreach_module *mod,
-					     struct snd_soc_tplg_vendor_array *mod_array)
+					     const struct snd_soc_tplg_vendor_array *mod_array)
 {
-	struct snd_soc_tplg_vendor_value_elem *mod_elem;
+	const struct snd_soc_tplg_vendor_value_elem *mod_elem;
 	int tkn_count = 0;
 
 	mod_elem = mod_array->value;
@@ -690,9 +690,9 @@ static int audioreach_widget_log_module_load(struct audioreach_module *mod,
 }
 
 static int audioreach_widget_dma_module_load(struct audioreach_module *mod,
-					     struct snd_soc_tplg_vendor_array *mod_array)
+					     const struct snd_soc_tplg_vendor_array *mod_array)
 {
-	struct snd_soc_tplg_vendor_value_elem *mod_elem;
+	const struct snd_soc_tplg_vendor_value_elem *mod_elem;
 	int tkn_count = 0;
 
 	mod_elem = mod_array->value;
@@ -719,9 +719,9 @@ static int audioreach_widget_dma_module_load(struct audioreach_module *mod,
 }
 
 static int audioreach_widget_i2s_module_load(struct audioreach_module *mod,
-					     struct snd_soc_tplg_vendor_array *mod_array)
+					     const struct snd_soc_tplg_vendor_array *mod_array)
 {
-	struct snd_soc_tplg_vendor_value_elem *mod_elem;
+	const struct snd_soc_tplg_vendor_value_elem *mod_elem;
 	int tkn_count = 0;
 
 	mod_elem = mod_array->value;
@@ -754,9 +754,9 @@ static int audioreach_widget_i2s_module_load(struct audioreach_module *mod,
 }
 
 static int audioreach_widget_dp_module_load(struct audioreach_module *mod,
-					struct snd_soc_tplg_vendor_array *mod_array)
+					    const struct snd_soc_tplg_vendor_array *mod_array)
 {
-	struct snd_soc_tplg_vendor_value_elem *mod_elem;
+	const struct snd_soc_tplg_vendor_value_elem *mod_elem;
 	int tkn_count = 0;
 
 	mod_elem = mod_array->value;
@@ -780,7 +780,7 @@ static int audioreach_widget_load_buffer(struct snd_soc_component *component,
 					 int index, struct snd_soc_dapm_widget *w,
 					 struct snd_soc_tplg_dapm_widget *tplg_w)
 {
-	struct snd_soc_tplg_vendor_array *mod_array;
+	const struct snd_soc_tplg_vendor_array *mod_array;
 	struct audioreach_module *mod;
 	struct snd_soc_dobj *dobj;
 	int ret;

-- 
2.51.0

