Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EADB530F959
	for <linux-sound@vger.kernel.org>; Sat, 29 Nov 2025 14:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764424969; cv=none; b=MudwPZBbLTks7NLIcJjgiBsTn8TvWgOgUGSe9XkAfR3pb04rYdjx0qWFSDgOd5XtMxUpNxRuTT5mPG1TVwhmhuUuN6qepF8GgPZw0EJ+tKPoA7RbdMguyRv2WFixZ7ShvG4rpsy3BxS3U2d0r9NYmMRJLjNoqsJRw0zTe681Se0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764424969; c=relaxed/simple;
	bh=v+HVACogLyEtUIet3IIwaQ0glQamIbHNgb459QXBxoA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EsI8QESDwc5z5ps4p76H84VUmK6Fg3ecGR+v7YgElFG7lSp7VerihkX1JEr0FdTzcVPcKkR8HkCxUtkVyj55VNTzeXOzUZHYHUKeK5emPJNKtFXQdex2z9jqMV0fJpzHDXdmoS9CNYpsz5BdVo0KeVI7Bj5gG6zehLGNh6ezmdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jV+3ShSM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E1+V7DSz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jV+3ShSM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E1+V7DSz"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AT7jte72303923
	for <linux-sound@vger.kernel.org>; Sat, 29 Nov 2025 14:02:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OW6JtCwDn/qbVOrN680vmFGN5PKjrbW5WN5tZilfmQo=; b=jV+3ShSMfGrRACQz
	d/AFYB7QVOdLZo/1KTi9bECIciqNNLy8jrrJsH21aWDP1PyBuSzFeloRK4Fj71q0
	Wfbtt1RZj55Md4hNaqLUg97gBjd9FVS2pdJ6xx/w4Aq83dutqd/PSIvakKTYWIQm
	NwSPGccQzD+WSeWxAjV4hR4BnJ1n6XpztRB+9oA/8UoStK2rAoswD8OSsYvNBkW2
	4/I4NtKfoC9uXbupmaiPMrcMeQ11R8BGAj0gOYwgOBJus8lkBRouSkk3Q/H5MOJD
	IKioiYFe7FIqIhlEU2YjRoFY/903IP/T6Iv/3voligCImQK8ascG6ErpBaArRSxq
	3RUx6Q==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aqqsqgv1k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sat, 29 Nov 2025 14:02:46 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-9353174a042so1027361241.0
        for <linux-sound@vger.kernel.org>; Sat, 29 Nov 2025 06:02:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764424966; x=1765029766; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OW6JtCwDn/qbVOrN680vmFGN5PKjrbW5WN5tZilfmQo=;
        b=E1+V7DSz5Rdd14tymZGG3/uxvD9ZpWRCogQQwtrEdHCTFUOqS6bwt4zkFsJTBGlvnX
         fZJXhajNBA7wfNIuDTGDHuyd8KLDmGuTwsuwhFoZF9UCJcsBJV/iipOIuSJ08ajz//XK
         V3uq3hrL05bBEfOOqKySUiWftmn57VVpOLgBWComGrB20kX2H6QjCxpEpGh/1yFNCoZd
         CfDQy+mP93cs1NqQeNX1mya/oEVHWiDyk3n0H83ltbSU8jo93xFMOFP0aIU8UEuuHAUK
         OEf+14k52ySkLZN0Cg/fR70EG1WASPaIsTiyDFcIPrDNRVo1cSsumVXLD5f/CLaAafMl
         gVnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764424966; x=1765029766;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OW6JtCwDn/qbVOrN680vmFGN5PKjrbW5WN5tZilfmQo=;
        b=SEF3StqHJWll1zOv5chcxefLrCr78cDGeR4/G4ewSNTiqyeqg/laeyB6328DvczFSp
         EjFG5szrugu4PxjBrip523SJX7mhmkrbYpvSYYN/c1nJnyfNm2UNe9/H2FHHJ7ghs0x1
         okLZuZ8boTNJHCOxIQGyfxbRpVL/kKjO90O/FsbF/yGRw6Yee18+N6imYPuiDXGLl9LJ
         1Gv44rZ8KhezCyN/K6k3hUrC9WGerwLsq6pQSNhmJ602NWW/GXB3EmVQyXUXRpsqQSEe
         0dInPP0hedHVAYk6XDOj7CKGUmqI7VXXnUTUsy6Mz42CqeibYGqQk+OPcs8sjjmYyp55
         3Rug==
X-Gm-Message-State: AOJu0Yy26npUod1PhuAUTzDCyCeLIHKgKKRK5vCugbNYTvNkR6dEwxZW
	9idyYLeESQqwGi88HyyRD6wh8LZtgbEMGt3AISE5V4Q3cjbJ1V1t+eg9DfdEcabFa4Z2YjwbBqJ
	jIqRBRRF3QYegsmQjrnWBtBocPy/h6/eQI0xAmgSREG4IWdNN/Mac18xI7pyv5a0IUQ==
X-Gm-Gg: ASbGncsrTnWVu4Rfsqy4Qap5b+PCjYi/XSa50yFYHW5/KbnjtxP0087OnKpkDn9l4dM
	aNK2d3iEVuY/r6r/KX4cGMHQBIMCMaK2ad/Fo6DBFau3rykzIUsLUkluNmtS0QIle0t0eegAAqE
	pEb2BNFGWmpvWKfXrdz4kv3b3rX9nm7k6QrOKvD+mb6OZd0jDYvChKoUb89azmJOElteSmgCcuy
	H2yxQeb5G0cKPew0DgN4r3afb42Y6lxIg5M/sT20LqeJdS2bHqXG5K1ivNjFVw8+qiX1NXxUZI1
	ruYZduLNFDlCzVgVKGMSPmRsjhGIZezEnKyjtX8iyS93Uc3OCe7yCQoOJfBLZ6Yyaq6AzpM4Nuu
	2448lcoOk7Z+1OjXSYiztiiGUhBpyxjVu0g==
X-Received: by 2002:a67:e7cc:0:b0:5db:cc92:26e7 with SMTP id ada2fe7eead31-5e1de3ceb1emr10823696137.38.1764424965674;
        Sat, 29 Nov 2025 06:02:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFDqRf68vSeVk8p75zlrmxrI01x6eS92q+lXYJA0Ejy1gbR7av+9gSdVKL77c9kBuG71/MzZA==
X-Received: by 2002:a67:e7cc:0:b0:5db:cc92:26e7 with SMTP id ada2fe7eead31-5e1de3ceb1emr10823621137.38.1764424965224;
        Sat, 29 Nov 2025 06:02:45 -0800 (PST)
Received: from [127.0.1.1] ([178.197.195.159])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f59a63dfsm681649866b.37.2025.11.29.06.02.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Nov 2025 06:02:44 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sat, 29 Nov 2025 15:02:33 +0100
Subject: [PATCH 3/6] ASoC: qcom: topology: Constify pointed ar control
 structs
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251129-b4-container-of-const-asoc-qcom-v1-3-67a3d3320371@oss.qualcomm.com>
References: <20251129-b4-container-of-const-asoc-qcom-v1-0-67a3d3320371@oss.qualcomm.com>
In-Reply-To: <20251129-b4-container-of-const-asoc-qcom-v1-0-67a3d3320371@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1999;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=v+HVACogLyEtUIet3IIwaQ0glQamIbHNgb459QXBxoA=;
 b=owEBbAKT/ZANAwAKAcE3ZuaGi4PXAcsmYgBpKvz7nA8r/efiRFsepiYU1Bvol2xjr0+DijlHF
 7DkbLzNz5aJAjIEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaSr8+wAKCRDBN2bmhouD
 10qPD/dht97MXXGcmlu8RLAYcE8QlaLip6Sl6hRN0YpVvPcaPQVAVWS0Ao5Qi4JvM+FJIF1yXRQ
 Whq8Mq8bG8pkuKzBMDa+iRGcH7+7Nv9FIyUz2zO9B7iC+MBJE2LO0HZzcKHDdXrqpTzH75+ajA0
 keSfFuyeT9p448z/UlezhqrG+3e1Hj1di5XzxOAMbut/UE4xp+or0R4tVC9U528IZKn3gs6Qdms
 ryUAMn7mTiNpxtI2VjM+gDbIg++yRpoliR1SCW5ebZ/MrbOxGS07xVjsxG7o0gUQlA/yvfgvYvU
 0zRaraGXGPj2+wBcRunm7yiyk4cbTypeEEgypyhizfZ0NC0QCCDOWdpzfhCKeVB93GOutexZ161
 xCKSCHxx3tEteOgo/BOZYtgUTetg+nqaMO+mXVe1GO82qtzIpC+O4HuBNSnGtUyDWXu8IvG8R9f
 H8Az71+EjJzZfrznsHAIfoWnvM15/7kezM82WPSq1C9nZJ6c6Y4n585t2TMPTy0Tip99L1jXk47
 2Cbnmc77IBZ2rLF0HMSnwFvSPqCKZeuv1i7or3jOFM2Dhh7j6qraFreOYkpwIKEH/Ila5wivXQ+
 f5F6LOrO/n0X3g8c4A71PfFiN9nAzua/p7JUEkMypZrASHdYJPYTqeh8VdKkyKvO4MmlZxp+K2n
 QJd0MearypNY+
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=UqVu9uwB c=1 sm=1 tr=0 ts=692afd06 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=FPK7cjBCgYbqzSTDLBmM0Q==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Eep4eOvNbGvhNPJmoRUA:9
 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-ORIG-GUID: -aBOuwoB8IODhUwIYbn6XEFdE6k98JjV
X-Proofpoint-GUID: -aBOuwoB8IODhUwIYbn6XEFdE6k98JjV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI5MDExMyBTYWx0ZWRfXw1QPiuDsXhxa
 bSeUjxUX6a8IxtLiT1yRzcJ4Zsgi/zSe3z0u1thskl+n5kpQ8R34adhKZx8Xi6VAeB7e4dEYiTS
 rl68+cy4VWo8RkrUbtIUr7z/xJdr/fyzMnzVZYHN1NBwKsfN34TPfL+IHIal4ARDThAQtukD0in
 khb3f1nxEmbyKOZwZG0vgkOgrHT8pQuS5NIXkHAzdJyDdsPpI8rUjBhdLADDT9X+jkPtG9e89bz
 N7C5eqLg4q/ejkxn0AZIpZZ+zh8EKOVYdsKTq0f1qIyACecy9kfvBXR9T2KjFvTAuNU4X6tvY7A
 zVjDz6EQDtTavWQlS2GQb1iVPBgCtw5bee9uYYnXAO3EXvNqOl1kc3IW7KcScFHOnCSdtufsit5
 yaa4hMZxnnqdzsegj9M061tJLNEcyQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511290113

audioreach_route_load() does not modify the pointed 'struct
audioreach_module' and functions for connecting subgraphs do not change
pointed 'struct snd_ar_control'.  Constify the pointers for
self-explanatory code (pointed memory is not modified by the function)
and a bit safer code.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/topology.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/topology.c b/sound/soc/qcom/qdsp6/topology.c
index 748a3b7fa78d..67d3147caf62 100644
--- a/sound/soc/qcom/qdsp6/topology.c
+++ b/sound/soc/qcom/qdsp6/topology.c
@@ -1032,7 +1032,7 @@ static struct audioreach_module *audioreach_find_module(struct snd_soc_component
 static int audioreach_route_load(struct snd_soc_component *scomp, int index,
 				 struct snd_soc_dapm_route *route)
 {
-	struct audioreach_module *src_module, *sink_module;
+	const struct audioreach_module *src_module, *sink_module;
 	struct snd_ar_control *control;
 	struct snd_soc_dapm_widget *w;
 	int i;
@@ -1098,8 +1098,8 @@ static int audioreach_link_load(struct snd_soc_component *component, int index,
 }
 
 static void audioreach_connect_sub_graphs(struct q6apm *apm,
-					  struct snd_ar_control *m1,
-					  struct snd_ar_control *m2,
+					  const struct snd_ar_control *m1,
+					  const struct snd_ar_control *m2,
 					  bool connect)
 {
 	struct audioreach_graph_info *info;
@@ -1123,10 +1123,10 @@ static void audioreach_connect_sub_graphs(struct q6apm *apm,
 }
 
 static bool audioreach_is_vmixer_connected(struct q6apm *apm,
-					   struct snd_ar_control *m1,
-					   struct snd_ar_control *m2)
+					   const struct snd_ar_control *m1,
+					   const struct snd_ar_control *m2)
 {
-	struct audioreach_graph_info *info;
+	const struct audioreach_graph_info *info;
 
 	mutex_lock(&apm->lock);
 	info = idr_find(&apm->graph_info_idr, m2->graph_id);

-- 
2.48.1

