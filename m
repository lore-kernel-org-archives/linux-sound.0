Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FE23224B12;
	Wed, 31 Dec 2025 17:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767202049; cv=fail; b=IExXM7b3HNxREg6y1/rD8ccoDSNCRleIdZxSxy7tvb5HGtr+DDQ+DVESslR3cR6UCNV3AWmTJMwALcpFEKx7/KvC5cMcvrFncJ1YM0AsOyenrHPfGuChG/S5/pn2HZfyL1jgsvmVZxYrW/xWkxkhkprSwu8evWXStXjklJfEDpg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767202049; c=relaxed/simple;
	bh=LAkvj+eWQUv7Zy95vxEsC1SqFJtIGTbtx2qAld+LSK4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CV3KwN0sLhJb15dPL4ncR/0evaIPRRypV32xMd7fUwRNn3hG3pC+wvWWd3ETr295p+Cio1vKvHR1hz86wdEuLgxGMSPxhxcoke8KA2StOTEYbq902PjzXHFDdRogFY5dNiNrgkc+GWmre1RvjydgAnEL59nT/MsP4PzysCKeDXY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=qbvnAb1F; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=vUUoRhsE; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="qbvnAb1F";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="vUUoRhsE"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BVF0iaq743550;
	Wed, 31 Dec 2025 11:27:25 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=iNylqFesH7TaCQluYqZdJDHjt17xVv/9T+6hZlQWJkw=; b=
	qbvnAb1FqYAJuiUIndjQWLp/YK1RcG4OEtKYN+ey0iZEDjkdzddr5S7BOnFN8rWp
	WO8v6PoE5YtDks/4zfLI+Zs+ha2tPud0qLyGCgid/RM9Rr86+84v6ERaX3U5A9yi
	FOAv2pIQ/7hlNt/GoE7rKT6FN0zp9a8ilLHjUqvffjPC/dcwtLZaqc0o5LgagaSE
	XubpIyXNqlexDqJP7sMq9w0cm6MMrbkIyexA5Op4ccNrLsysXJh7/x6RWUZXojY7
	F1VUOC4M3yEa+nhx2Na3plp7oYn2Ie7l84SpbzCxdbJXdCYhYu1V6KV1Eq6bBd7y
	d43kOIT05gGmBtEW2+iwuQ==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11020138.outbound.protection.outlook.com [52.101.61.138])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4badr3cakp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 31 Dec 2025 11:27:24 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eKCNivVNyE9cYU2xywcv9Etuup9FXvVhGoe71iGl2qHevpX9nEF8ScnebSh0F0tO1hYf2Pm+D/hhEhWRJic+zo5TmHuK1571u4t7u5WdI2yF7BE5t5yKctNK1f5I45tDOkuBUFCHJwWpZdktXgL2F9I7MbewNxoS5ObTlb0Ee3/UYGHxmbiT46hvMBlZKG9VjOFnP824Zp4bBB7+Yen/VU/pZ6m8KdC9RI8mfPp+dMMf9Ge5MJrauSTYAOsyDzbhWJRfY0f4GZDtWa4FTTiRIj7v3qAm71aJeOZ+K57xJambr4/W8L6N6ZkHfjjevn+zvp0MU5NHwiTdweotpowQeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iNylqFesH7TaCQluYqZdJDHjt17xVv/9T+6hZlQWJkw=;
 b=IYoASSkjEAefbMNP1xdZPHfWszi16g09/ny4Jp/WpHqJJpHlulmmoF7j+lKPED1KbcRkCmnHng30EhL6DNK20VOWBW6DKgwUybNEzXpxc+JYoIxOUg/wfkHvl0PI9NBHJW2HkXxRD9oOp7gUwBtgX4o5ko6llU+Igz864laa7kkLkVBEBoVqy0H5dRFLsqUUxV0yWcQx4Nf/96CRxVhNLQRg0uWam/mu3cDn6fn22FGW3lQRUSeJKYbpm7pPIPNMMnOgv47S1sa9lqC9Ciap925Ny1pzvbsJhlKEqRXZf3WEWnGSKS+22NtULCYTRrcHXDLGjrnyxG+FtQBSmq0uag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iNylqFesH7TaCQluYqZdJDHjt17xVv/9T+6hZlQWJkw=;
 b=vUUoRhsE4ZOks7S8iEPn1FW2MxQEUYdnOxhH7MRbbLSkN7vjoJ1CHDowR43FECOtyjmDYBm53FcqzY6Gm5PeET2I7ubvuin+KNUN1M6dhpPhwaNwRbS//Da1psziXJzkLGsoPfA0JlYe5rkNGpCwgp104nxNqzyn6O72w8m/63k=
Received: from SN6PR16CA0067.namprd16.prod.outlook.com (2603:10b6:805:ca::44)
 by MN0PR19MB6430.namprd19.prod.outlook.com (2603:10b6:208:3c1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 31 Dec
 2025 17:27:21 +0000
Received: from SA2PEPF00001506.namprd04.prod.outlook.com
 (2603:10b6:805:ca:cafe::1) by SN6PR16CA0067.outlook.office365.com
 (2603:10b6:805:ca::44) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Wed,
 31 Dec 2025 17:27:20 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SA2PEPF00001506.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4
 via Frontend Transport; Wed, 31 Dec 2025 17:27:19 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id B6636406543;
	Wed, 31 Dec 2025 17:27:18 +0000 (UTC)
Received: from EDIN4L06LR3.ad.cirrus.com (EDIN4L06LR3.ad.cirrus.com [198.61.69.19])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 61F3E820249;
	Wed, 31 Dec 2025 17:27:18 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v2 1/8] firmware: cs_dsp: Handle long-offset data blocks
Date: Wed, 31 Dec 2025 17:27:04 +0000
Message-ID: <20251231172711.450024-2-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251231172711.450024-1-rf@opensource.cirrus.com>
References: <20251231172711.450024-1-rf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001506:EE_|MN0PR19MB6430:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: efa0365d-83ec-457b-fc5f-08de4891da24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VsS0IHM8JGjNOLjFZLm9Ecv+g76RubYjlChxrj0Li2YJkGOLgKem03l+VU71?=
 =?us-ascii?Q?mtBwtLS1VxJs1vgcm93xRe9E6LcYNUPnh2hOgHOXHelxJ1FppgJODbyW/eAb?=
 =?us-ascii?Q?2VWaLIlNo6iPCKtpi/nJ6/F6Nc+4tj9DfF3WbOR2qA1MvzkDqUzkRPIvvTmC?=
 =?us-ascii?Q?HC3EIAlT6dtX53JuJVSY1AfLmvVvFbPfY3Srg3iCT8eVwyDaJc5/YlUSlSFG?=
 =?us-ascii?Q?vy7IDntvaL/esbUpgyF1b+x9dfDaeX4zjxmqBwGictw4HS4ZOxubJEIZYn6s?=
 =?us-ascii?Q?x8xKfPB/zQEuDaaJVHgEfitxc8iHiCGtpCnJ6PDh90DiZ0h29sU9Yl4aIUFq?=
 =?us-ascii?Q?KWpTkeJNCFcPMnPwHVbBqutZtt1oPRnvqmZDMNq/bdzz7yGQQe2lCWPxg4we?=
 =?us-ascii?Q?B7Ydxs1leiEqhubP61UAXHxLjZeR1zuhK0vkMF4ACtsCAIlf17OnOjU2xpF7?=
 =?us-ascii?Q?CGq3duSEt8Rtq8q7YhrtWsZUYpWnwd8OKXpWGfoS8IK7kwT+HWIhYe2noHJN?=
 =?us-ascii?Q?hGP8NHF8qtp33TDWFIE6QSrAv62qo2d7tPbV9ZCKrPQsZvZLdQr+kwiQOpmx?=
 =?us-ascii?Q?NaRVy3OEwnXuHwOuqIMnwnt4pm0+IvCmimfoDuF8VOJTnzRrBAo73GyHmuCU?=
 =?us-ascii?Q?pjR8rcAo5tGOLPK5HFPpGHxAL6UWTo/su3spLTBFPu5moTc8XKWLUFO7Txm8?=
 =?us-ascii?Q?p0U7feOySREvhLex7sUrEqfhA5D0DNrpZ8fLiFpvUr9F+L6V/s4D5abUIp3H?=
 =?us-ascii?Q?mr61CdvNX7Jp5/voGtkPh9CNAiI2uVAq8n4xTw7RvE50blEA+uHReAwBotIg?=
 =?us-ascii?Q?/PrddXnOPd5Xr1wYLOygA/a0d6qIECbYpOrhFF6gDFZiznXH0jHdmNA2w1Vr?=
 =?us-ascii?Q?IjPRr/EXO8qUPcXEuoN2+Tg9fETy4OK7+zF3eGwLkn0QhZkbCzok82QJ/sTo?=
 =?us-ascii?Q?jt4EzbNMa4OqdPbdVR3chNADBfgtV1Vq9dIsj8zFc9TVtCnx9a0PgyEJj19q?=
 =?us-ascii?Q?WB5BaPkZvKJ64XiQ60jfdD/KOsvSubPSZM0iXqCOdmW9l1u2pdWw5gN39+98?=
 =?us-ascii?Q?Sr0YST9s4d7ZTXf3v8P/aYWKKIqyqagieKrdAfcgT88M7oWZ/JRarXvj4cuK?=
 =?us-ascii?Q?xBSG2QkBAXlex75fnbKT2nSmFaHS/98VTZI3ES5HSDxh/jIP7kSGUyF2msrO?=
 =?us-ascii?Q?Bj4KogiD6x658zoo3DjvDlrNnwbL8oNO8mshnfAhMDieofVRCEimCtmRm7lh?=
 =?us-ascii?Q?gJMwp3N926J+4nyp7LFQzd9BP9mBPU040Q6hb6wrJvw/2Vm/gnZFMRx5haCu?=
 =?us-ascii?Q?w81nY+f43Z/ZYI+/U5xW5CFtr0TokKCb06u60tq20Jt9HeHbrilRlZMy8U5C?=
 =?us-ascii?Q?PbxGEMKFww6Vl2EoS8KExEIQfYMXVZltiUDuDIr/u7iKgN2BPN2A4J68B3c8?=
 =?us-ascii?Q?pKpaGzIinDTR4wHL4eMIHXlSqxVnifRHq855UFbyzT//yEi3Bm8snwM5WnpG?=
 =?us-ascii?Q?W/wwQgnOSBj9wyAME+Xil5ZCajtK8AC3MOzsnxt4RUnYGCNs0JlkdIPw4j6O?=
 =?us-ascii?Q?5NBJJLsMCSFRC6D6meA=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2025 17:27:19.7760
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: efa0365d-83ec-457b-fc5f-08de4891da24
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SA2PEPF00001506.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR19MB6430
X-Proofpoint-GUID: 0jFvsrHj_3sBNXSK0MUYNsu2JUev_Hmj
X-Authority-Analysis: v=2.4 cv=Z8Hh3XRA c=1 sm=1 tr=0 ts=69555cfc cx=c_pps
 a=GFF/Av3140jeC91+tyO9Ig==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=zNSSUrpu5HfUGby_qDoA:9
X-Proofpoint-ORIG-GUID: 0jFvsrHj_3sBNXSK0MUYNsu2JUev_Hmj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDE1MyBTYWx0ZWRfX7kA3sOA4b/eI
 /7e1pNSQeUxMu+uRIoJE+q5SFlZj4Y1Uzb3Dn3jcGnxRxMBQq1N/9M3Gpc/mDYDindvERNKyTpi
 wHw3MHO80PgNLddyURIjfV2U5nzokVSiJ/DCTtfsAXgVMEwR+SWKC4eNrVEvgB+aH73FjK+gubN
 5aEmlc6JLScumWHCZcitvGFCdyBXu+r1jCYEC4Xlgzu6tfkgeahrwwNKfUKE/LnjM+PYzY8MB3j
 0OGvaLberQAWuLz4HioT87/64r3Dfe+o2heIPyx7TX1VAy4jCNY08k2e18zz04cIkRTkxD6b+X/
 7s8HZqjLBhZ8xHMHhTrJ2kj9vIX6HB5KGis+z5b2vgQ4vkBj+8vnnH9vyI4JscFBJnh4i1R6fNj
 lwlBemQcI859nZ8rP9VqWjuOIqKUcxfkqCNDqxtZqEmQPkyHo6XcjrIyqUlng9650RtKzdSMt3o
 yp1yg2Cmx3LqXKb/c4Q==
X-Proofpoint-Spam-Reason: safe

Handle a new type of data block that has a 32-bit offset. These are
identical to the normal blocks except that the offset is now in the
32-bit field that was previously 'sr'.

A new file version of 3 indicates that it is mandatory to process
the long-offset blocks, so that older code without that support will
reject the file.

The original 'sr' field was never used by the driver so it has been
renamed offset32.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
No changes since V1.

 drivers/firmware/cirrus/cs_dsp.c     | 19 +++++++++++++++----
 include/linux/firmware/cirrus/wmfw.h |  7 ++++++-
 2 files changed, 21 insertions(+), 5 deletions(-)

diff --git a/drivers/firmware/cirrus/cs_dsp.c b/drivers/firmware/cirrus/cs_dsp.c
index d35d0f5ccaf7..aa6e740f9cd7 100644
--- a/drivers/firmware/cirrus/cs_dsp.c
+++ b/drivers/firmware/cirrus/cs_dsp.c
@@ -2138,7 +2138,8 @@ static int cs_dsp_load_coeff(struct cs_dsp *dsp, const struct firmware *firmware
 	const struct cs_dsp_region *mem;
 	struct cs_dsp_alg_region *alg_region;
 	const char *region_name;
-	int ret, pos, blocks, type, offset, reg, version;
+	int ret, pos, blocks, type, version;
+	unsigned int offset, reg;
 	u8 *buf = NULL;
 	size_t buf_len = 0;
 	size_t region_len;
@@ -2163,6 +2164,7 @@ static int cs_dsp_load_coeff(struct cs_dsp *dsp, const struct firmware *firmware
 	switch (be32_to_cpu(hdr->rev) & 0xff) {
 	case 1:
 	case 2:
+	case 3:
 		break;
 	default:
 		cs_dsp_err(dsp, "%s: Unsupported coefficient file format %d\n",
@@ -2171,7 +2173,8 @@ static int cs_dsp_load_coeff(struct cs_dsp *dsp, const struct firmware *firmware
 		goto out_fw;
 	}
 
-	cs_dsp_info(dsp, "%s: v%d.%d.%d\n", file,
+	cs_dsp_info(dsp, "%s (v%d): v%d.%d.%d\n", file,
+		    be32_to_cpu(hdr->rev) & 0xff,
 		    (le32_to_cpu(hdr->ver) >> 16) & 0xff,
 		    (le32_to_cpu(hdr->ver) >>  8) & 0xff,
 		    le32_to_cpu(hdr->ver) & 0xff);
@@ -2202,8 +2205,9 @@ static int cs_dsp_load_coeff(struct cs_dsp *dsp, const struct firmware *firmware
 			   (le32_to_cpu(blk->ver) >> 16) & 0xff,
 			   (le32_to_cpu(blk->ver) >>  8) & 0xff,
 			   le32_to_cpu(blk->ver) & 0xff);
-		cs_dsp_dbg(dsp, "%s.%d: %d bytes at 0x%x in %x\n",
-			   file, blocks, le32_to_cpu(blk->len), offset, type);
+		cs_dsp_dbg(dsp, "%s.%d: %d bytes off:%#x off32:%#x in %#x\n",
+			   file, blocks, le32_to_cpu(blk->len), offset,
+			   le32_to_cpu(blk->offset32), type);
 
 		reg = 0;
 		region_name = "Unknown";
@@ -2236,6 +2240,13 @@ static int cs_dsp_load_coeff(struct cs_dsp *dsp, const struct firmware *firmware
 			}
 			break;
 
+		case WMFW_ADSP2_XM_LONG:
+		case WMFW_ADSP2_YM_LONG:
+		case WMFW_HALO_XM_PACKED_LONG:
+		case WMFW_HALO_YM_PACKED_LONG:
+			offset = le32_to_cpu(blk->offset32);
+			type &= 0xff; /* strip extended block type flags */
+			fallthrough;
 		case WMFW_ADSP1_DM:
 		case WMFW_ADSP1_ZM:
 		case WMFW_ADSP2_XM:
diff --git a/include/linux/firmware/cirrus/wmfw.h b/include/linux/firmware/cirrus/wmfw.h
index 74e5a4f6c13a..eae24dde9e41 100644
--- a/include/linux/firmware/cirrus/wmfw.h
+++ b/include/linux/firmware/cirrus/wmfw.h
@@ -172,7 +172,7 @@ struct wmfw_coeff_item {
 	__le16 type;
 	__le32 id;
 	__le32 ver;
-	__le32 sr;
+	__le32 offset32;
 	__le32 len;
 	u8 data[];
 } __packed;
@@ -200,4 +200,9 @@ struct wmfw_coeff_item {
 #define WMFW_HALO_XM_PACKED 0x11
 #define WMFW_HALO_YM_PACKED 0x12
 
+#define WMFW_ADSP2_XM_LONG	 0xf405
+#define WMFW_ADSP2_YM_LONG	 0xf406
+#define WMFW_HALO_XM_PACKED_LONG 0xf411
+#define WMFW_HALO_YM_PACKED_LONG 0xf412
+
 #endif
-- 
2.43.0

