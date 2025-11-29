Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A4D4309EEE
	for <linux-sound@vger.kernel.org>; Sat, 29 Nov 2025 13:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764422295; cv=none; b=Knf/CCq/QMysM+wHSla0vU+Cyr1yBkrYEGWoEWp+yLP+XqJtmFGoWijEbBVou02arD8or36N1mURO+Daq0V/h9/VKg2x4O6VXIBl4gSprR6s9NH2I5TCLZ0Ny+ETB/UP3mqi8fkijbTcDJ8QcT1nTbXOtcn1l23HA0QydlEdNEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764422295; c=relaxed/simple;
	bh=rFxrLG6iFK7DhIqNwVyLA6RFcipWa+9ielcQ0jNpcW8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LbGCC/sVZX0Soveyf7pVVJ1INV+pt/TuQrJzrrxXs4W/FRzchs42PJipp83piS78O0mGcntnM2d0go5JMkEbIKuFvvXqyKFiB3Kxf2cC4F27x2rupvLcc80LIvtmP1aSjqgga22/82ZGQqhAYiLbAiNWqConefNbq5WjyjE6F6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ezhJxcfs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HT5bar6r; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ezhJxcfs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HT5bar6r"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ATBaDh82088087
	for <linux-sound@vger.kernel.org>; Sat, 29 Nov 2025 13:18:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WRdTU43px+9dnjQpkvdch/AXAnGzM7VVwsbwnmdMUAM=; b=ezhJxcfs8xdJTJwq
	3j/p1xuLBzs4hlIijvw9/D3/7jOt8ky6h9jnRYZ1LKv0rnMZpEs7IfE6n9KYmy2D
	Ntc0GLOc/58gn0nX5coJyINXoXzqDyt95Tj76JTBYWmhS0wOHmegGeWxh4VByJkQ
	BXVIEoGjSccPBnOy+0EmYiIqHLxyi+f0Z9WodoKoChrrp38yzx4js0+edkPrgfd4
	Mz6C6nDyWDDDsiM15CpcC8H90nF6LjQyA0e2vKeFYm3OhPbBgzRXqYcp1P2t2n3y
	QNX8aj6+ZosjiIwNHSJ5EILh8RNA7kZekVgHMamKTtRCRpkR0uP63kuY0yOFi49M
	vrQoIQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aqt0j0kxn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sat, 29 Nov 2025 13:18:12 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b51db8ebd9so707152285a.2
        for <linux-sound@vger.kernel.org>; Sat, 29 Nov 2025 05:18:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764422291; x=1765027091; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WRdTU43px+9dnjQpkvdch/AXAnGzM7VVwsbwnmdMUAM=;
        b=HT5bar6raqcn31kqmKESH8dZrH9A9zl/kbygRHy0PI/WmTIC//exHghBQqWCjkenAv
         dEbh1d/H3DffbkR7EW/tlMGMDQYPxZ7+M6ihfYTE90n/PDp3EKOp73w+i2Pdh4/EtYNJ
         KdJVmxD6V9+eBcXj83PFvU0WvM7MjtpBR0mZJlzDD66UdVYut9PQVQCcOx7wxYb6U34N
         e7N6INcYuGR5K9uEcRJ5bR895gpiC0qVwdnBwjyj7IqQ4M1fVqhh39BzTzy7ffdgTIA5
         NPzw6b+fwJCWr5BODAc53xp5yxbOVPzysE9Y5gUd95SG3SMaIloASyT6sCwB1fdwBXbv
         MWDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764422291; x=1765027091;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WRdTU43px+9dnjQpkvdch/AXAnGzM7VVwsbwnmdMUAM=;
        b=C2yVDOrKukkAaM2n2q+tT7/1VmxwHV4t4Y0kiHOs5oHdsgQ9gwekk3kE53LZh9EYrQ
         Uo5sVueo5Yxiaup1E0TznG+9u/uP+C5t9BgmRpcfF7Wdv4pj2s6MrzcX67135AObRrnj
         8Bpg5oBvqvTUMwiZYC8/aJDynBy9Ka2JufGXi0hzjxk9m8KxFbc40lIE++C7bQ/ZF0Xs
         ++bk71coIqLx2cRqXL5KniNHRPZMS91bsIiETY5X5os2oP7pWWF5hbixFC1iVGKXSQvF
         IpTNyMw+mjssnI5hTpUu5A8pdaDkJFP5i+VIbwBrgkk69qSyE/rmBT2KKQaC9bmTAEVE
         n80Q==
X-Gm-Message-State: AOJu0Yze9JzKnKyHLIR7hU9K9JvuxOZ+o6bjZO0Za3L3o5LGHWz2AwRn
	3XjVjjKR57ooJhuc1I5rh4idhnKbj+vxXC3HEiTrOatI8qaZZD0OCGT9dFl8mM5XOB+EOQ9tx3x
	hekSpgU+hui6Olj+g49jipGjQB0f+9b+GaBMab4wal3b6udQ9IpG2JigeTo00EdAPeg==
X-Gm-Gg: ASbGncvNAJ8CH/0aUjnfyCjLP1WfnVL8zRPtIjRCya48MOV2Cxz1flot40/kOTgIGMQ
	bmAF0MocChLC8XPyLRzhOARqCjD7FYkyidM5eMSXlMsylb54LDXlT5eUlpKBrljRHFIyYt2o6Ih
	JCxUoQNunOuCqLTlWpWfFSU9m91wx66SdYGgWhgElJ+JYhbbt5SwuE9ZVyBtCz3X1AjL/31Fn6v
	jpR1sLV/Kip8cIuH/pUUsg09906SSjrCxSxErJa5Jlrbww0NSunoIrWJRVI9RLiWTbwE2Mt3EiI
	l5rNYeM6TeuyFoQ71O8+wKBXV/hcBLGjkDi26saiViXU30nSkxaWpoWaEAESaVpYUKC2tRqRSG5
	XtOz8dnHF8m3Ru8oYFF+WCL2KZrhVFFexaQ==
X-Received: by 2002:a05:620a:179f:b0:8a1:b435:984a with SMTP id af79cd13be357-8b33d4ccf48mr3896154885a.69.1764422291439;
        Sat, 29 Nov 2025 05:18:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEN5WjeSaw/et52cC/POlt9tqBhJcGDS2ZYifyqsF2haY8nXfZ5eGR+ClgfmHNWFxVc9rF87A==
X-Received: by 2002:a05:620a:179f:b0:8a1:b435:984a with SMTP id af79cd13be357-8b33d4ccf48mr3896151185a.69.1764422291023;
        Sat, 29 Nov 2025 05:18:11 -0800 (PST)
Received: from [127.0.1.1] ([178.197.195.159])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f5163903sm723233866b.7.2025.11.29.05.18.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Nov 2025 05:18:10 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sat, 29 Nov 2025 14:17:56 +0100
Subject: [PATCH 4/6] ASoC: qcom: q6afe: Fix confusing cleanup.h syntax
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251129-asoc-wrong-cleanup-h-can-people-stop-sending-this-without-reading-docs-v1-4-c38b06884e39@oss.qualcomm.com>
References: <20251129-asoc-wrong-cleanup-h-can-people-stop-sending-this-without-reading-docs-v1-0-c38b06884e39@oss.qualcomm.com>
In-Reply-To: <20251129-asoc-wrong-cleanup-h-can-people-stop-sending-this-without-reading-docs-v1-0-c38b06884e39@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2219;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=rFxrLG6iFK7DhIqNwVyLA6RFcipWa+9ielcQ0jNpcW8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpKvKIqVWoM7pPky84XR61xbxactJGJ+7aWo4UZ
 j8itDkFWfuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaSryiAAKCRDBN2bmhouD
 18PVEACLxagZMgDxiT/r/NQQytM3sDdCluOz35+qCRhmnWmummLyjxzohBsaFWg9FQJfwbMuJHa
 NnPHOPFFceF+i2iXAiI4RTiAa7EyLx+rUhbWmnp1S8MfO6ymShCxmEk9RZq9ny5QuxHghST6Ke/
 1EW97h/bPCgZ+BcmbnVIXP/Z+BV6rpI4KeVKFONUsNd4fVW+ZY3sz8k8LsmYoKuk7MoajWWYbgo
 WqF5z7rXvnNuoZDb2ulGNykJidQhmF/ZAUBShCzu8Lwv0IxVL3UipHfltm1HcYM5XGbFaBDE86L
 15Ep5Mr96HIMJxT1MRXaDAq0peyS9Hq0383oNS/XakSJ4xKpOoY4ayJHnFJUGM4oCI2A06xJdm5
 /agFjJdAx+zRDtVd5psjpJZf76YyX3JmgE6kUfx2LWKXNKS6q6yIqgYhDgpFflsBQbZIwwitgii
 qz5ygsItnJXma3DWX9GPcdlOUxb75VUThvGDL1vm852KqeqD9nnlm2h15RmE9bQsBt0U/Fj4ZSL
 1PcIGQfcf6ChC2dMsIosRZR7lmcgNMCUF3Wd1sGT0YDQs5/HuyFjWaNWmaQTH9WAHl1xkd+wm69
 3Bgt8ITddrcR9Qg+Gmc70lIzqydXy0U9eidVd0DIdkMrEp9TPeDAmEj5sNuCWaQ6uL+P0OijyoW
 zw3YW0T2ny3mneQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: Xmft44Eh62d0jij1UVo2OntshJX0FEXS
X-Authority-Analysis: v=2.4 cv=WpYm8Nfv c=1 sm=1 tr=0 ts=692af294 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FPK7cjBCgYbqzSTDLBmM0Q==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=5W2fhO5o7LvhZa0qPfoA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: Xmft44Eh62d0jij1UVo2OntshJX0FEXS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI5MDEwNiBTYWx0ZWRfX454JxBSQ7m43
 rfP8mVFbuoD64Wp8QdaH4yMSgYe/wEPW8T0uhqLGsqEnc8XudeYMpHbjxAuUaKkHdWFUyTzmJZj
 SkUXgQTP63IRboMWzaByNkEfSwStBZUsofp4GIYDod8E/bjuewualZ5U4Qogw2DJs14OD+Ezjhr
 mf/sbo5UZX69/c4x9Y/OdRYJYto2/ohVkcCN7hS4rgFkGrBhryPLmsDmyOeyYQolvdR/i6cAUIT
 qfb0lGwzC5G/dX5vZtrV9c1HozwWh4VGRoTUiZrVjP+FvTcwGG7FzBmXNi3QUAx/1QNVavPPYf4
 V6BC1qE/qK9vW6so0X6pqNKozq2g4QwyanYH0icVlTkC8Auhzx9yvFb+4OW+zrIFofZvMzzJdWi
 jv5iIoW19ecsuTfXthDOWWQX11hjSw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0 bulkscore=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511290106

Commit 55094e55ae36 ("ASoc: qcom: q6afe: Use automatic cleanup of
kfree()") did not make the code simpler but more complicated.  Already
simple code of allocation and free, without any error paths, got now
declaration with one constructor followed by another allocation, which
is in contrary to explicit coding rules guiding cleanup.h:

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
 sound/soc/qcom/qdsp6/q6afe.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6afe.c b/sound/soc/qcom/qdsp6/q6afe.c
index 980851a12976..c9fdd53492e0 100644
--- a/sound/soc/qcom/qdsp6/q6afe.c
+++ b/sound/soc/qcom/qdsp6/q6afe.c
@@ -1277,7 +1277,6 @@ int q6afe_port_stop(struct q6afe_port *port)
 	int port_id = port->id;
 	int ret = 0;
 	int index, pkt_size;
-	void *p __free(kfree) = NULL;
 
 	index = port->token;
 	if (index < 0 || index >= AFE_PORT_MAX) {
@@ -1286,7 +1285,7 @@ int q6afe_port_stop(struct q6afe_port *port)
 	}
 
 	pkt_size = APR_HDR_SIZE + sizeof(*stop);
-	p = kzalloc(pkt_size, GFP_KERNEL);
+	void *p __free(kfree) = kzalloc(pkt_size, GFP_KERNEL);
 	if (!p)
 		return -ENOMEM;
 
@@ -1667,7 +1666,6 @@ int q6afe_port_start(struct q6afe_port *port)
 	int ret, param_id = port->cfg_type;
 	struct apr_pkt *pkt;
 	int pkt_size;
-	void *p __free(kfree) = NULL;
 
 	ret  = q6afe_port_set_param_v2(port, &port->port_cfg, param_id,
 				       AFE_MODULE_AUDIO_DEV_INTERFACE,
@@ -1690,7 +1688,7 @@ int q6afe_port_start(struct q6afe_port *port)
 	}
 
 	pkt_size = APR_HDR_SIZE + sizeof(*start);
-	p = kzalloc(pkt_size, GFP_KERNEL);
+	void *p __free(kfree) = kzalloc(pkt_size, GFP_KERNEL);
 	if (!p)
 		return -ENOMEM;
 

-- 
2.48.1

