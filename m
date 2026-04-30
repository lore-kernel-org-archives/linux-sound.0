Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D26636C9C2;
	Thu, 30 Apr 2026 14:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777559654; cv=fail; b=RBe0NS/UFa1CLwyKVtxn0JeIqtY62O/Ltixwp+Q5+oOPizAnwWXIoXF2KG5/jUbXXCuNNAylYnvJaPuOb1ByGZcUQ1QE8uzSvpUT7iKTNmKkDWT/fTpAWsjbAoWdc0OSA5NV+KJAI3Z7B7lerpibN037oO5qqcIMb0f0AfnoWdI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777559654; c=relaxed/simple;
	bh=XhzdYewSAeBNLCE9LI88ZGn+shA2muG8ajQU/RpcLmI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=sE798i0+6VFNSdqG17RN3Cpe9QpczqMyCIVWeCIR4rSkrBgr1eZInNlRO5labj6u+dAv0uOP5YqoaKiio42KOjdBYozKWbX5O6n7SfnRAOSVD2lyv2C2RvNphFaS98mhuwKY1pnOhFqpzz5iYfXowNhCO3O+B03+uus0XQJfSyU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=RcGENQri; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=y6LUvPCe; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="RcGENQri";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="y6LUvPCe"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63UDXJd61587864;
	Thu, 30 Apr 2026 09:34:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=YOJ3xRehYpoRQFt8
	E7/ow9vbh4MbL4WslPaIju/d+Xo=; b=RcGENQri2o8pohTXOwF/PR48MqQK5RDs
	hTriceEdYV7Rov/8rXgm48e4G0qLhnkhJ3Uvmlr28EMXxBQnR59a1Ytt8UTSXTwq
	eY2ZLRbKJ1bzd5UC5YQfxrSURLOx+KUmFyXp8lod0kCWVg9amc8b4Igmn2NVBlvJ
	CFQ0KckVwXBLl48Mf53ht/bucOUAHdUT08BW4QUPKaftmErspzo/FisEgBuDN7Wh
	ApBHewKAZkMmv5lD5rHuLJfr8MTkTz691440qU/0QAyVlu/GpiHY7WUNzRUunakX
	cZ40RbWkE9KpGuESSh/6OXFyXHhWVkxgp/0q+CjwflSnCYX3Dv33vA==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11021113.outbound.protection.outlook.com [40.93.194.113])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4dv82e832a-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 30 Apr 2026 09:34:01 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UY+hJ1XEK3ryIrWtBjdrItMMiqzdIODCfhvlI6OgiQfqqGFhY0UfVdnVA03iBrA0QU52NVKB4C1L7KrfgrHYHtktPbwUi/t5lz+E5LF8JPcfd10PuqPU1Xr8zrkBc3QT/ASxizD2H58Z7BrYDx0+XjWzBcikhobNHWzfQEN+jwF47b2BXWrqPjGvAXFR3O6t3N37CRJv9Z44ohWcFpS4+S5/UNL2AfeuZNRQPmh2Q20SS/P5ltzj2UveoY9F9TLQuSGEvs7G7lG5HUwSBwwAmOqmSq2V+s20Rdrg55J5ExJ9oy5jTSw2FUQOFs+EnL0EMo4mx/OAompw6IWUmU96wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YOJ3xRehYpoRQFt8E7/ow9vbh4MbL4WslPaIju/d+Xo=;
 b=X/N4mXDWRukng9sND4OkPsTIlWS3wL87BQqp8K/tQ0GhxoF27lOhdkGedFpQGuYyCwdF6z5SBLgQWBaGVMJ7QYvOHt/anOv3M0L60DVdMA4Pfip+J42+9FrnP9kSHSFFydDK5x9w8YsjchNIirKlGEpoy4snWwg/5e6jYkwiIoIe6Nt1UXFd3PiGevm7LLM33bYUn5FKxp11D+KmgxJJWIIzn1Pqb4UgLShXcvkJJGhQyzo8mXhrQi0u6PoVaPXMryrANj4uxMtabBJZ9Ij6WIfI6rp2Jc2EKAyYufdPaZrhco8QvJDGgy0/K1eoMEncKsxtS5sn0MqNn+d/0uUteQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YOJ3xRehYpoRQFt8E7/ow9vbh4MbL4WslPaIju/d+Xo=;
 b=y6LUvPCe1HAmlptMLl80d/U+JbNFpPchJ9gTAj+JyxrSfRpOBohZvLUMuEC9/tfBcwdv+KH4rvwcWaPO8qk492CRcPicQa1FByA13biBw46cSHPEYnvCbmBKFHCVUzhv7oN+7Q/l0YBCIuNVvCbaaXSOV/0Q2he19jSTIeZSr9w=
Received: from MW3PR05CA0006.namprd05.prod.outlook.com (2603:10b6:303:2b::11)
 by LV8PR19MB8199.namprd19.prod.outlook.com (2603:10b6:408:18a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Thu, 30 Apr
 2026 14:33:56 +0000
Received: from SJ5PEPF00000208.namprd05.prod.outlook.com
 (2603:10b6:303:2b:cafe::7c) by MW3PR05CA0006.outlook.office365.com
 (2603:10b6:303:2b::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.20 via Frontend Transport; Thu,
 30 Apr 2026 14:33:56 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ5PEPF00000208.mail.protection.outlook.com (10.167.244.41) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.18
 via Frontend Transport; Thu, 30 Apr 2026 14:33:55 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 910E440654A;
	Thu, 30 Apr 2026 14:33:53 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 842DA820244;
	Thu, 30 Apr 2026 14:33:53 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH] soundwire: stream: sdw_stream_remove_slave(): Check stream is valid
Date: Thu, 30 Apr 2026 15:33:53 +0100
Message-ID: <20260430143353.2702714-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000208:EE_|LV8PR19MB8199:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: d6b97ce2-f26e-4fc9-869b-08dea6c58258
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|61400799027|82310400026|16102099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	dijx5sjw8yh4IaevY3C053ezYyehStkAENbdKLxANnKZxtw5k7Bzt11MIk9rxfYjF/5cGeC6PIUoz08XnhSPr1zd8s9jxGCuOeUF/IIkFRCBkYfTN4L2lS02aND6VwBWFJ8Yxv0znEkPn3xMU8786xL2E/6yWER3s2qcfGXAztOrffC7cMWoZpy7q6bVMCYR2nCUc5KJHGFx7akQ5/S7HXspczhscGBqoOt/l8vO10RUq3/xrKzacCOwOZ5HnfMVIInJfj6xCzOP/i6rc1v/I+jM6H9PXTYLf10OVHWVglU3b5TropkCmGYY4xODyQGKLGgxA4kXCEOpTJs5tHZZ5if6PFmIbWbVybMQ5OV7mh6iIynw+NysfM7XQsOfKPsmeMEJPpU0tVtBSMOqHTPIVHKWDGJoSGdt2tYPkHLxoCdqJqq23mTLdh8pgXK2N8wNh7WSE1N/I7Rq0iE3WnCRlKPhsC3iRR27SRbAtB/BsGlZ9K1Ftfda8FNMNReLkLoGgvFXCd0KagMysU7nI2yUoFIUtuV7dCeN4j/2LY+XIfaDAy8XCBtsu0TxyjL/I/79WNSOB7Nifi5d8Tdecu3levl7gANvm6cJqleZC3H3yySoj+epRJoPW5+gc6pRoIdAIdqRnD3rJ6LvWPwlvSaQvmX0r00zEWjHQ6kNvWd/KXNsVp2SQoDNRKkj46PaHzFStZyEXihKLdXvGL8vx4fFL5hQVqtBh/d1iTz3p6qLktV9khtWaAFFDijaZZ1OSZePxqX9ox7yN/+XD2xtq7bcqA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(61400799027)(82310400026)(16102099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	DNU9jwSMm1OgXzBKGaQDTjqBVo1EOFWiOVLV38IvPfpAh/y38ONpxDsuZEodbGrmKci+bApn3uz5w44MGl2UyuQ3dq7LOiONeF8aWrD4QG+FzPZtoKi0+/QUJqHuCcr6AAnBr4w4EPbUmyEzfE/+2mQobHGcxfVQfxU9u7mp1PzMEGmrNQ8sMMlDOTO0lvQ6fj9/hsd9tXIhlmQBil55446Jw4ZCy28VlhFYCkAgH3P/Pr4lFN/XzHyjYVIeoBqcu/q5LNSOLQ4as3kleliNu5FWtTCqH3FXv5LM5ehAtDkrWFwOsImY8Vryh15AK7IFrCeRZYMajsPNzS7Zlkqt5CXKGUNPsRNqYoQAyZR/FKeO5/gmpy5YMnsI9Eo9iA1zQ5gQlb8QLn3UAQUOprMGUb1yxxf2Rs2K+fPJqsxW4JTNdjmt/uq7oErPES9WQR0y
X-Exchange-RoutingPolicyChecked:
	QCho3cOUB0wBKTgBVeID5IuW/yukXn1eh2TPT3jEFsA0mxIEgQA2gEleAkuw/0JWtUNfpdtOg0pJRRNu7DTsaCj4z4rbfQDFmoXMKs9MHI8Dq2UQnlOpP3Vmh3cpLHRaJVsajSk3H8u/j2Yfma+n78301etE3WBXiO7POBwdylIv3aZxuuNh/ArcKmodT855+9aISfa4QUMBFYkKoDC67KFGIGitoyhs+H3HjYoJ/p0oxd7CBx1A+lWlSfVM0Yb5UXpcezGyeqKMZdXH6IlFKeZ5oQ7SluHf4pu8iT4W9aPYOvvtXL1MmGfrHsfUTRUQlEIhBIEe1BCfvmx820bcyw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 14:33:55.5471
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d6b97ce2-f26e-4fc9-869b-08dea6c58258
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ5PEPF00000208.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR19MB8199
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDE1MCBTYWx0ZWRfXyr7d7JeP7KC8
 EjWee+E9ZsVkLGkps8P6J7xhJOdCQn6lcL5oJtSbQGYzzCAQad1J4XO1l9RRN5DmikZ9QIXefPq
 NdNCkoeAXPHXtUjRNAUhPLCtORxTcuZUqTlEOGAplPnaInwoRpd84kB6hodNdfNx5cBILB52sxO
 HVpuwTC/ZS2txqjyF0OUkHp0H++zWY29/fGZZPJ8T9RrR0of0+0wNcoA98h42WxEkmxi4vvPaxM
 MVy8tAuOlXmE6i2NeUM7oI3JoWB9eC9CGlvEgZX7SJcEaEvuhpMLkrPTNrR8eiBVKPXrbBDTt7F
 Cv4oE56ZwCydsBWbULicATTaGcsKfBT35NyRN53YS4JRu8hrmgm2ljIyFWxaXOqOqLuhmWDBGes
 P+Co94VWKgkazY0grsd6HzGTyJMXFRc0ovhdhclucNu/qfk7AN/w2Shjjb9W3K/tXT8GaiuIhlY
 E3flhKw03am65n31DKg==
X-Authority-Analysis: v=2.4 cv=P64KQCAu c=1 sm=1 tr=0 ts=69f36859 cx=c_pps
 a=+jjOclGHkOGhuepu6R0Llw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=A5OVakUREuEA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=v4EF2MdxWn5Ym55bSDcA:9
X-Proofpoint-GUID: oe3p5HrIZk8DhAv7wLsc6SyxEwvJiNws
X-Proofpoint-ORIG-GUID: oe3p5HrIZk8DhAv7wLsc6SyxEwvJiNws
X-Proofpoint-Spam-Reason: safe

In sdw_stream_remove_slave() check that stream is a valid pointer
before passing it to functions that dereference it. Return 0 if the
pointer is invalid.

This is a convenience for callers. They can safely call this function
during cleanup code without needing a pointer validity check duplicated
at every call point.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 drivers/soundwire/stream.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index 4ed8fb7663ad..c1ef177a0021 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -2229,11 +2229,15 @@ EXPORT_SYMBOL(sdw_stream_add_slave);
  * @slave: SDW Slave instance
  * @stream: SoundWire stream
  *
- * This removes and frees port_rt and slave_rt from a stream
+ * This removes and frees port_rt and slave_rt from a stream.
+ * If stream is NULL or an ERR_PTR, do nothing and return 0.
  */
 int sdw_stream_remove_slave(struct sdw_slave *slave,
 			    struct sdw_stream_runtime *stream)
 {
+	if (IS_ERR_OR_NULL(stream))
+		return 0;
+
 	mutex_lock(&slave->bus->bus_lock);
 
 	sdw_slave_port_free(slave, stream);
-- 
2.47.3

