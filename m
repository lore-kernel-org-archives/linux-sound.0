Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9564AD4B2
	for <linux-sound@vger.kernel.org>; Wed,  2 Sep 2026 19:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788378478; cv=none; b=KABs9C36ygSm8KilWZlRSeSNQu0H0wkaQzo67ZJ8NuH38K+4/NxV75R4uBQLYFyI8cXDt7qht5cBZ75O9+6PmreH2SWR3Fh2/48wsv/7EMiTA5hEab2J/Rz3UVMesobO+Udc+tGS+W6ScyWOrj9sXJTzxR94pBB9s0M8fzFfnLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788378478; c=relaxed/simple;
	bh=8IJgnYMH8lZGxQI7mdW1WzUt8n14n2OLz6T+fV/tmC4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VwB0VWXo4Y9ERQU6i3MnBGazlprIhCd0HxVlwiO1k5jO2zDt0NZ6fzNJSBR9r84MjtofxiU+IOSEXxieRzoyd4FaHr0hF7VkB6X2ntMT9xpm/bqvYr2eDkG9xujSDsqhRKILIJHPiN4T9Mj/ri1MuJuzUOo5XBahu1U3TjYFKVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mUvxqWw4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hGLEy5/4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mUvxqWw4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hGLEy5/4"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682HrXeI2483838
	for <linux-sound@vger.kernel.org>; Wed, 2 Sep 2026 19:47:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=i7IUo5ODu1Q
	vw9BB74gz8i0GZ3EQa2sp7V1MaY9r7c0=; b=mUvxqWw4oJGdn61l8WtLkN5uIbC
	pOe3XUIGU7bNwqp8UilUWssgk7nvV7vFxGa8NGyg4XbgnGg3Cyr8ZxunqeYhQ8+f
	TCiZjQMM60U6inCxKvFki6V3rZcNiuqzMAmYJBCJ8GXJCs7/+yunwXADfqiZPLlC
	NQqHTfMpTn3DYqAPCrQq7UawxehowYfaIMMqCReJix0QfXobob3YqJOQhcuoxQSp
	S7RjP/hXbrwfZGQm65rspmTNcr6wbpkCMgFkDIA37V4GWfIjv4g5g3RwYdZxY9dF
	vyqcJC/0j0ItsF+Xf91mfl/pzHyIEh//JF9RYLhGRR0tsDBpwI2Wa5g/KEw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemjh9m79-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 02 Sep 2026 19:47:42 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e1118e4abso2863166a91.0
        for <linux-sound@vger.kernel.org>; Wed, 02 Sep 2026 12:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788378461; x=1788983261; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i7IUo5ODu1Qvw9BB74gz8i0GZ3EQa2sp7V1MaY9r7c0=;
        b=hGLEy5/4zpZCi1I/P20G3JDa7QeS+qKk/mRjstg+/jMNf3O/Kv83i/yLIwM+0xZfre
         9Kc3nRxNfmTXF6R5EMUQ1Zl9BZt4KPcegjMu/sW4VI8ZDEFHxfkkRiIJxICbJopbSzOm
         fadf22ym1IAIaDl+9s8xScZA8A+8yW1Ws3WPGhahYFUmRe61zlW4UBAtLnQf8K26wAPu
         a1xxEq4A4Yo5EYmK4AD5jn6sYP3eBn/PWlyXGr4RAa+Ij/A3fZ+WXlC6ceaCtJxN7oBN
         LCYJixSQaign/HfCC7l6okGhsY5iUHiZC+yj5qkC4MDHJKuSEEfDgQuYQDUCYeICqc9q
         7CVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788378461; x=1788983261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i7IUo5ODu1Qvw9BB74gz8i0GZ3EQa2sp7V1MaY9r7c0=;
        b=k4TJY6ikmol2kGpDL/+7MiHTA/zebm8CRmZed9Dm83aBNiR0qp/WWt43K7y6s5FxyW
         DoR+tWkzlcL/Opz+Hl3LZEmmS9Hqw6doDcbUwdqGE5KB8dK8Tzofv43ctJAotvVzTFrl
         yjwNozT4pC9+WW8j3Yc9Tu+f6wRl/SRNecZ83U2GcpPO0lxm4svR2H/ftks5HhUBIdmA
         RpI5ugLo0qbMktDkd2sHQYAHmLm/im1bwtGVL7dIEIZ1j+eN6Vt5/WzMsAWM8F7SGVmp
         nGMOb5UFgAifJKEqUSVKMo/DC24r2nYNcjq9rK6IUZHMWJ3+d02RIFbuUZj75y12JWHu
         7Egw==
X-Forwarded-Encrypted: i=1; AKwUvByhaP8aOcP7HXk9+/h0fkSUNOTsS0VIuHuaYsrcMLYNPasP5FIYgEj3y6hVXFPocxPr3V7j0yjNoPVP1g==@vger.kernel.org
X-Gm-Message-State: AFuF++ki83YR53+DjIxCMAgKfx+o+gv+unzqKSVsAxYN4eCf7hpa/oL6
	IRvhImZpCPPyVosLxXcKA14NShIZPUdo5sXOjRNzJmp/Oepn/1SLJzzDMUyh7/I+GCJssS/ajT+
	7J6/ThsXidmL41ZF/2oea15QN1wCxjkRwMEE7hhSo1dsXMOBIinnnZV7gMaJ3XPDKMw==
X-Gm-Gg: AYBFou0HWoUHsNHvbD9Y1uU2Ilf/34KRdOtQ89be40olceEGkTm/w3yDxnFqpJKlC/r
	ERv4MQQlc7zTDzZG8wY4HXg/icUQL1pGhFS2+eZxNP/Rp8csj5N+984l5Wcj3yZ1J+fwBgjmx1q
	XMFO8Ut6ml0RdGwYgYcMi6EkBE4tjnnO5GmPZjJ18JzAu8kQuVj63EkUG6pTZEG8O0Bk1vUg5VW
	r9PRULSLs2ShrBENKB0ofDT45O6Re9Yex3Nf9JRqc14+Tn6vt8fhR2Nb4FhKw4VOzbttLChthlO
	jPnSmOsuG/jOLrOmeVFNxQV7/VgY8q8knT/cQlMotOut4QQUNK/YnuShxiGtOqBb0MYzlu1uMic
	g7vFXQjQbyRwToQUx9bEawfy0kQQ=
X-Received: by 2002:a17:90b:3949:b0:398:9c00:29ee with SMTP id 98e67ed59e1d1-39aee208a63mr11569147a91.22.1788378460849;
        Wed, 02 Sep 2026 12:47:40 -0700 (PDT)
X-Received: by 2002:a17:90b:3949:b0:398:9c00:29ee with SMTP id 98e67ed59e1d1-39aee208a63mr11569098a91.22.1788378460471;
        Wed, 02 Sep 2026 12:47:40 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3325641b4dcsm307065eec.26.2026.09.02.12.47.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:47:40 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Gary Yang <gary.yang@cixtech.com>,
        Fugang Duan <fugang.duan@cixtech.com>
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        sound-open-firmware@alsa-project.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 2/12] ASoC: mediatek: mt8196: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:17:02 +0530
Message-ID: <20260902194712.2003414-3-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902194712.2003414-1-mukesh.ojha@oss.qualcomm.com>
References: <20260902194712.2003414-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: jnRSt-O-SxRVjtgWKcDJDYJF8noVjmoq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3NSBTYWx0ZWRfXygVgwb7m7vR4
 IvUCfaWlyQbsZPtLmqWbsgP9OQTZsInp/vVwMVh5ypD4TRYpVb88q3IMcmav4PDoHApnzz09fN6
 mch99ridichQXYcsBHRm/r6bcYGKTG/bIqHDO0aBGuRactN4kz09qiMpVmd5GqWQzixr7A9dCNH
 qdGGXnmWo/7SCusICHJaQjy/R7Tbq2/tk8GSTClNU0tzKMfzz3lrDph58pGyI2Tt1rHGU5DfhuY
 FHQ7WMIUZRmEAl/PQTicZ36RvAXDqHkoN8UGGaB0GqoGzTpJOjYsH0BJdvOr5HHL5NY823M2Wgs
 w3QfwNzaKhwpPchKN8RHFiNHnnJF6iz2THqHQmnxVX0WuZkVL9Gy37p5Bumx9inhYbx/q4B928s
 RuG76Qr701+oGXt4u6PSUT5S94AnU5iMwGttDSVH57Wo9qFx1N6+CkSSY0MEh8mncIckfISLIwh
 oqdlQWGmymF8dzqbF1w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3NSBTYWx0ZWRfX43sUPKl1Xick
 PdBZjk3tV5WfPSCIBm/rr6NaWeFzRTK9TvVG381YUelye44eKOiu6fxiQdkQ8kDS5zDhd7ugEqG
 uANXRxoOlvUfqovakHx6HtTa8e2pD/g=
X-Authority-Analysis: v=2.4 cv=ErHiaycA c=1 sm=1 tr=0 ts=6a987d5e cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=2Epw-RBMujpMcR55kOQA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: jnRSt-O-SxRVjtgWKcDJDYJF8noVjmoq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020175

Replace the hand-rolled devm wrapper (mt8196_afe_release_reserved_mem +
devm_add_action_or_reset) with the standard
devm_of_reserved_mem_device_init(), letting the device resource manager
handle cleanup automatically.

Acked-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 sound/soc/mediatek/mt8196/mt8196-afe-pcm.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c b/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c
index a1ae8322d8b6..dcee037991aa 100644
--- a/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c
+++ b/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c
@@ -2309,11 +2309,6 @@ static const struct reg_sequence mt8196_cg_patch[] = {
 	{ AUDIO_TOP_CON4, 0x361c },
 };
 
-static void mt8196_afe_release_reserved_mem(void *data)
-{
-	of_reserved_mem_device_release(data);
-}
-
 static int mt8196_afe_pcm_dev_probe(struct platform_device *pdev)
 {
 	int ret, i;
@@ -2327,14 +2322,9 @@ static int mt8196_afe_pcm_dev_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = of_reserved_mem_device_init(dev);
-	if (ret) {
+	ret = devm_of_reserved_mem_device_init(dev);
+	if (ret)
 		dev_err(dev, "failed to assign memory region: %d\n", ret);
-	} else {
-		ret = devm_add_action_or_reset(dev, mt8196_afe_release_reserved_mem, dev);
-		if (ret)
-			return ret;
-	}
 
 	afe = devm_kzalloc(dev, sizeof(*afe), GFP_KERNEL);
 	if (!afe)
-- 
2.55.0

