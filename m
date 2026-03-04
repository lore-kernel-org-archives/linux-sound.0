Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA4413A6EE3;
	Wed,  4 Mar 2026 14:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772633593; cv=fail; b=i199Lg5dohzpE+Cz5K/UfuPebOO53RDa9s/1Djz3F2A1d5V7CeaWAZcfUQ2Rf1mE8C8QCnL7o0I/ZtJiPskR43v11xcQEJ9Tvv/0Aj+iKT2L90WZN8l14DdMtC2INj1v01QFLZNm29dxPfB3OUUvkFYmEgc4RS1OeaCcVY5kHNc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772633593; c=relaxed/simple;
	bh=DKtCihXk+gFqf4VlcDo6dESF2aWZVwSIiZF0y7etlfY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=B5B91T9JykH/eNmHKlkcA74LC7gyNRgffv76/lSvkZpr8xvHbZl50BMA6QGZYT8x7aNJmYi6++G/ti294wIAatgNEZ0BltBERjKYqWounMtIGeVq7uh5Zwl4O/iPu8Kaw6CWkR763alGC0ObID/vJvDuStYiSPlnjaBstMRLmtk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=kzo/j2Xn; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=gJRDLhS6; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="kzo/j2Xn";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="gJRDLhS6"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6245HEAE2857071;
	Wed, 4 Mar 2026 08:12:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=W+To9IRR187rr1Vn
	m9vXmXSYftawMHcPiBp5Gn1fat8=; b=kzo/j2XnvBHuhVV+kR+ezlm8jRMqndA+
	kLYF5Bx+IS6mz6cs9LaVCxDR/u79pA2K4cViIBAMdST/5W9+ssH5vOrQmy4XmGZk
	WCFzIsjg7JXUM5OKcNSf0/dpPJC2SFa2OP6hLR5xnEUr9Bqtkd+qZCFDyA7ssZej
	xvJoKjeZkpnC1oWt3WhVeHA7SYYW4Gg4z0AavI4ebwokR/C9f5dCyPpFjGIWnTph
	lcZngTNvpcPmYpGAsBYa8x0BkmUPXO8FxIlxQ+UhVma06zPSMgB4iPGkzMXWjjZP
	aOU7Snx8aKNVY40iyFvaVAI/wnDWM6wuduNQtmY4IHFqCqhNrIWTPg==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11022108.outbound.protection.outlook.com [52.101.53.108])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4ckwnn4u7y-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 04 Mar 2026 08:12:56 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iN5VbkjjocolV/6Uvo1OLfO9danfWjfJrcEg6qXgynuSOE/g/ZlSG66RiT2tz7mhmMBrbVttD/ohWcxvEsQjgw1sEPxOT7po6Xlo7CZcfbibUdTKPQ3+wA65PJiSu2rIufz+kwMJkNxTQLzYoqByyFG5edB6A1+9DLz7zLiKuMmkzPRTvlhJbHio+Kog04yjw+2GZw/YEpGQAQSbjKBLdRd/BjuNhxVZXODs+S6XGygo1IfkvmOfybxp9u4whQlYrNc7wWhPkW86pPP1QMAMdhm5pGdgfiJH/dMu0C7he4DgAgYehUYfap9Q9uboWvr3BrGNUutC5RUJJj7SMzzdYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W+To9IRR187rr1Vnm9vXmXSYftawMHcPiBp5Gn1fat8=;
 b=HwUEVkxh0J13lRGxSzmq5yxRALR1m81qrpTZtHDeMC/5/qpCFyn4uza+7UmNHNvffLo6lO6IarBNIPpM0yPiqlZg/ex98XbT67Xj/Qah2CCzGbmuZVJ5icbZOA6Cw1wvhNCprxEhsHyRbwoPuOZ7KEkfd9m4VVzW6N21OBFVNQDfqxqjMboTUXt6xNc4p/LAbW5WlmdBm2ymmH8zbGfXWPasFLnkPGmyFwc5sCozT510XMS1U+UxMhcuOdbCGHIkb15vsCbFleIqsXtJRQKM21tAuCqhshc8KrI0fzk+pABLtnwH79Rptma8Xlq5rLc33XrmDxp1yLr10ETp4ACmxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W+To9IRR187rr1Vnm9vXmXSYftawMHcPiBp5Gn1fat8=;
 b=gJRDLhS614/z0MIfTmoVnT8oO481JnO8BREVfIiTytzmcCcGo6saziUT6+yTH0RKw8EdP+yq/fxD1HXNtf3dQ6TGu/ty8PuutE/4KMp3azMmQwwnYJGeDOw2288NK5zEfAGswSj6/MhueJRf4f6cz+VFgtAiEGlvv25Wcjl9Efk=
Received: from BY5PR20CA0011.namprd20.prod.outlook.com (2603:10b6:a03:1f4::24)
 by DS2PR19MB9602.namprd19.prod.outlook.com (2603:10b6:8:2d3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 14:12:54 +0000
Received: from CO1PEPF00012E7D.namprd03.prod.outlook.com
 (2603:10b6:a03:1f4:cafe::bd) by BY5PR20CA0011.outlook.office365.com
 (2603:10b6:a03:1f4::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.22 via Frontend Transport; Wed,
 4 Mar 2026 14:12:56 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CO1PEPF00012E7D.mail.protection.outlook.com (10.167.249.52) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.18
 via Frontend Transport; Wed, 4 Mar 2026 14:12:52 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id ABF83406540;
	Wed,  4 Mar 2026 14:12:50 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 8AB7282024B;
	Wed,  4 Mar 2026 14:12:50 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH] firmware: cs_dsp: Fix fragmentation regression in firmware download
Date: Wed,  4 Mar 2026 14:12:50 +0000
Message-ID: <20260304141250.1578597-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E7D:EE_|DS2PR19MB9602:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 64bec13a-27f7-4a59-92ce-08de79f82002
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|61400799027|36860700016|376014|54012099003;
X-Microsoft-Antispam-Message-Info:
	tYjPxQWdxCvZfCv9zs5eAqNwR7WtBBo4wOlAWup5mRevraXyQLclohaG2gb7ZQWgh+JGE2YkDjzoHIzc7CN9FN8Jgo4rSaoDinUd+oPfl96fjDlWAOiIqgSg1OaNIDChh6FNRpWG+Jl9dHyLw7Pq8ipNuto882mgt1KS456fAlspI9aE93A+bmzkDgcfW7UVsxes/osAJwJrR5BfDx8tLoW6zLTFA2LoWI+scoCwyQWE6LbWCkkGVpamJ3Xz/JQFLcqSRkimTeDpOrrD1QetFWU7ltOntEJ85g+lpZWXRnIitTIenQwQI1folz/FA5r/Qj5IjuI6+UqzLf2blIbtkPMD6VJ5g6+brIhnCDv0pY662jYYOfgUbJnuiJSxscxamWm+T7IvWqYVlvhtx1pYtZTtv09pwMAnjP4jqOHeL5+8HbIVJBSSXFqzpIBUcPsOc/m1Dfr8FrlF4GNzmS2nhwvaXUEcgMtrJfavFwiqcmizN3RXlhnWOa0/Hw6yxzSnVAQi8Hg9qO7Qr85JJb/HGWrBJhzaXBbwC8d0BZKLkX+HKUYZyZTArMYIO0lOEIeTGuSIm+yG0c9YBg3+y8yeTyFU5VQP3UO06Wu4mMtkyNItN+TUonL9gmnfj8pCcpgT43hejBbTz3vEh5E5gSBZCltslE24r6T+Bf+Hy0z4xvURZ3iDS3fWZLQaWLtDv+hfTYafJep76xZryW6rfmbSnKCQurE4BBIgm3laG+/T3iKZiRSIf3luWN+GAFthwWwknfxfNvx03A5mFK5LAbCcPQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(36860700016)(376014)(54012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	hkTNtd6k9xOUpZw4kdxZY0xRvELuu7WCGiQ+83FXzjDZt2kyKFRLgxCOxhLyY1DA7QplEhDgsTlwzWFU59mdXEoc+9ef8ZhRlJ+a4JmiOZkdoChvJsejeeXrUw9FSdRQ9y9p2c8M/SfXT2Uled/XB5PZV8fwp9cz/q+qjojdL/KZtlajAyPknFe3xSkycWFaEzXtxFoVsLJFXDaqhyZEzRBIXzN/Gy0oDbsPPvtNuwrpl7wuCixeDtvvcuDJLERTbNXfjzEHvK1GF3sT6fFmbjEkN3jbwcmB9hVJMf/WHCEQ+NFLumh+KgUgqZlKk6rbpzTDierG+G4Za+srvllzy2hiTYCckiDokBhxlYxPtJz4Vo3M7EMBUOlDcHQFTxEPTK59Qi52uGtgCskq0Mk1Z4/OrjJf7r4dasAQvn5KKwJaMYxoD0fPXS5J69A4DcsM
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 14:12:52.5826
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 64bec13a-27f7-4a59-92ce-08de79f82002
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CO1PEPF00012E7D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR19MB9602
X-Proofpoint-GUID: rgj1QqYXs6_jx-kbHeLvRTI_XDtAo-Uk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDExNCBTYWx0ZWRfX1ITXICs8Zvp4
 ARvPhSwsj5wGT+V6y/8c6aHutqbBUiywQDzRJpYu+8C4jymoh44PyVrb5y6fRU6g71pQlSGxmk3
 4DGSbOMpEAAEgIQEP7C4GxWl+tLEW7udjrt4WWizXlR5sFMp3bMIOONdcEdJg5di01KXemMs9AN
 llQmONkjfoRW/Ajt6RfwadmwUlVTFBv8J11xX2YfyvrqtkAYLj/ohzxJKZtEsfHyHI1/4Uxexdm
 822GcQCI1zRBWBaMEg4mET6hI+c7Mr1z9K0WaAwuS4OyirUoI8I3gVPPXjZYmqeUD/2co7CYtHl
 xVUF5uB/eWFEYFkNVC2lmylt6IOCPEll0CGVxW5zvvA1/B2FilA0sUhaNou/jnzK126rVzXtz5H
 5ZIMsmtYOl5/47ibEmEN0LRdmevYKsRCVdV3HhtVUW5d1Ni+98cVq6qE5eE+3NVd8SI8846gKPB
 Hl2ChvFj1tcxifosw5w==
X-Authority-Analysis: v=2.4 cv=ZaIQ98VA c=1 sm=1 tr=0 ts=69a83de8 cx=c_pps
 a=MxHkyKj2cFYSCUcUIFQv8Q==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=Yq5XynenixoA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=VPiZ9B359oYZXejlRp8A:9
X-Proofpoint-ORIG-GUID: rgj1QqYXs6_jx-kbHeLvRTI_XDtAo-Uk
X-Proofpoint-Spam-Reason: safe

Use vmalloc() instead of kmalloc(..., GFP_DMA) to alloc the temporary
buffer for firmware download blobs. This avoids the problem that a
heavily fragmented system cannot allocate enough physically-contiguous
memory for a large blob.

The redundant alloc buffer mechanism was removed in commit 900baa6e7bb0
("firmware: cs_dsp: Remove redundant download buffer allocator").
While doing that I was overly focused on the possibility of the
underlying bus requiring DMA-safe memory. So I used GFP_DMA kmalloc()s.
I failed to notice that the code I was removing used vmalloc().
This creates a regression.

Way back in 2014 the problem of fragmentation with kmalloc()s was fixed
by commit cdcd7f728753 ("ASoC: wm_adsp: Use vmalloc to allocate firmware
download buffer").

Although we don't need physically-contiguous memory, we don't know if the
bus needs some particular alignment of the buffers. Since the change in
2014, the firmware download has always used whatever alignment vmalloc()
returns. To avoid introducing a new problem, the temporary buffer is still
used, to keep the same alignment of pointers passed to regmap_raw_write().

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Fixes: 900baa6e7bb0 ("firmware: cs_dsp: Remove redundant download buffer allocator")
---
 drivers/firmware/cirrus/cs_dsp.c | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/firmware/cirrus/cs_dsp.c b/drivers/firmware/cirrus/cs_dsp.c
index f9d8a883900d..42a50a4f8f58 100644
--- a/drivers/firmware/cirrus/cs_dsp.c
+++ b/drivers/firmware/cirrus/cs_dsp.c
@@ -1649,11 +1649,17 @@ static int cs_dsp_load(struct cs_dsp *dsp, const struct firmware *firmware,
 			   region_name);
 
 		if (reg) {
+			/*
+			 * Although we expect the underlying bus does not require
+			 * physically-contiguous buffers, we pessimistically use
+			 * a temporary buffer instead of trusting that the
+			 * alignment of region->data is ok.
+			 */
 			region_len = le32_to_cpu(region->len);
 			if (region_len > buf_len) {
 				buf_len = round_up(region_len, PAGE_SIZE);
-				kfree(buf);
-				buf = kmalloc(buf_len, GFP_KERNEL | GFP_DMA);
+				vfree(buf);
+				buf = vmalloc(buf_len);
 				if (!buf) {
 					ret = -ENOMEM;
 					goto out_fw;
@@ -1682,7 +1688,7 @@ static int cs_dsp_load(struct cs_dsp *dsp, const struct firmware *firmware,
 
 	ret = 0;
 out_fw:
-	kfree(buf);
+	vfree(buf);
 
 	if (ret == -EOVERFLOW)
 		cs_dsp_err(dsp, "%s: file content overflows file data\n", file);
@@ -2370,11 +2376,17 @@ static int cs_dsp_load_coeff(struct cs_dsp *dsp, const struct firmware *firmware
 		}
 
 		if (reg) {
+			/*
+			 * Although we expect the underlying bus does not require
+			 * physically-contiguous buffers, we pessimistically use
+			 * a temporary buffer instead of trusting that the
+			 * alignment of blk->data is ok.
+			 */
 			region_len = le32_to_cpu(blk->len);
 			if (region_len > buf_len) {
 				buf_len = round_up(region_len, PAGE_SIZE);
-				kfree(buf);
-				buf = kmalloc(buf_len, GFP_KERNEL | GFP_DMA);
+				vfree(buf);
+				buf = vmalloc(buf_len);
 				if (!buf) {
 					ret = -ENOMEM;
 					goto out_fw;
@@ -2405,7 +2417,7 @@ static int cs_dsp_load_coeff(struct cs_dsp *dsp, const struct firmware *firmware
 
 	ret = 0;
 out_fw:
-	kfree(buf);
+	vfree(buf);
 
 	if (ret == -EOVERFLOW)
 		cs_dsp_err(dsp, "%s: file content overflows file data\n", file);
-- 
2.47.3

