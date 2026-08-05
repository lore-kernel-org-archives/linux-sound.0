Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C87E646C825;
	Wed,  5 Aug 2026 12:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785933753; cv=fail; b=chf1d0NS3vLWIBS9Lnehag8jn5QWI6m8IJmIO5MrzFabvvg8mZf6tsJ6Fr4PQ5BdTjxtYbYedbukDnVqeIlKR0Ryg9LtVCjnkDlsz1+yOW3U0ZhogQVQcFhvx9rupZ4EsolIZOoIdXuQCjIqAi7ydZ3V1B6QezMuN4P9KrNl+R4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785933753; c=relaxed/simple;
	bh=u3TVJbx578qyCg7RbtEKoo8LZCM2WsNX43wBYQjeZh4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g7Zyf1v/yaGluuqjDx02oeZAxopmlKeyJHph0Pj7iYysmB7lNDjbrraIHOMb5JEtUslTw7HfUcvQCkpmszBLdseaz9tI9kN6jZRXfJHL3D/kdoz9yWTuHkMRgeS4ce/AnsvVEewK8xPNA56N1+LckztXiOiePX+rb8Vq+nvGrR0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=WcHeti6B; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=c1zWrf9s; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="WcHeti6B";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="c1zWrf9s"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674NPT2Y2014368;
	Wed, 5 Aug 2026 07:42:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=ywX8j1dbYT+DSRjoWs//H8scQXfNbsk55xp9+UyciKQ=; b=
	WcHeti6BKHWgYgb/2YOdVOfFyAE2/0h21B40PmWL94bLgCkULjo5oXHbs/8ED21e
	KcShSs6URBKYgrAn1pT+l+ZxqXqhBHZ1jo8LtK+sqgq0mfLJKWSeEQ8wnEM57OeN
	5WONnHWjbMuJO1ps8L1wKuYhNv0ne9vI+t42LektVEW5GV3v7JmtzVGQSPwc6F+w
	9Jzm1kZd238m2gaCM54E4cedgO1RP/2Lu0K7/CrKTjbjgpqt31GU2TxSy9nSFnvH
	0jCggR+8jm5kVFPvlETY8qy7AwMpYiDxt6kQUXIKSRVjgHg/NxtmIhcm8PyoIKgS
	3Cb+HQurg6aHFqjk7Yt1Zg==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11022133.outbound.protection.outlook.com [40.107.200.133])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4fsd7h5pe1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 05 Aug 2026 07:42:16 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qf3Yp/TOBvMHhyjO7MB1secDgxA5LfvfBJbrIef+xSuc0bAVyjD4EU8/0o0DCFhqV+BwiIbzieFSj7vB3YfJVrbFPK4HTAFmxGh8HA57WEeXj1nBdR4cpNPNqRFWqIfTEJIpY/yYpCS1Z6+F7iDWpo6n5hD0D/L9D9AYqDSgZvgz4EobxViG2XPY6UPeBF3pkGeKqoA63KzVpqvwbUUfYl7zgfLD4HsjMEyrUOagdV6rFQ7/PWMEILB2IzNM8o/Zn7c8mipifhaAtp8kahBrit2xP0A2DGWulbYGCFvlGlea6C6uPusHKZppjPNJTwrGXjLOE82G0wrPZpwAHpDi6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ywX8j1dbYT+DSRjoWs//H8scQXfNbsk55xp9+UyciKQ=;
 b=ED2nA0Te8ranIs7NqwcvaJIirDjsk9DqYHdA7K89uKlu7U2rEIcFc8HcyKfFhYCAitgGaCxMlhgw2rvPK+N+O+T1KjB8hZ0gE6ONiJqrfnBg0xpzYZKrsSYQwVmTs0ke9tUzNjGGVxVnG0RTycUotmY6j4cUR2498hKMGnTDGGbwQSdAsgoYmAk9QdiKlA/OE96o3B4RDiPge3qgVa5ziv8BSJ+EbcmtVZRTENmXPepfh7Ye8BTcwyi7awxjoXmF0ccut64h6CHiiKAGqbQxZUEJ3d90dfxkxk+GPTpP+B9iJkXBXUeTvDw6AgbVefe5eUIAt5+O0i2bTAQ5+4GVSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ywX8j1dbYT+DSRjoWs//H8scQXfNbsk55xp9+UyciKQ=;
 b=c1zWrf9sdJgie+Odcd/RRu5Kn92N4axQwAC3ACpYijsakvkfAseOlU5tRB+fUrWI1KbpmNhLRm0FaxaP4gmH87BVoGE0mBSoqEBzRWUbfa6wAuWNR79bfK4QayCF1YW4mgWrInSGZIEglz/ovqOILguy/uj2CxpcyyVpdCl7+x8=
Received: from BN9PR03CA0972.namprd03.prod.outlook.com (2603:10b6:408:109::17)
 by SA1PR19MB4973.namprd19.prod.outlook.com (2603:10b6:806:1a0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.16; Wed, 5 Aug
 2026 12:42:11 +0000
Received: from BN3PEPF0000B074.namprd04.prod.outlook.com
 (2603:10b6:408:109:cafe::77) by BN9PR03CA0972.outlook.office365.com
 (2603:10b6:408:109::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.19 via Frontend Transport; Wed, 5
 Aug 2026 12:42:11 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN3PEPF0000B074.mail.protection.outlook.com (10.167.243.119) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.8
 via Frontend Transport; Wed, 5 Aug 2026 12:42:10 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 90F18406553;
	Wed,  5 Aug 2026 12:42:09 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 7EA5E822545;
	Wed,  5 Aug 2026 12:42:09 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, shenghao-ding@ti.com, kevin-lu@ti.com,
        baojun.xu@ti.com, sen@ti.com, niranjan.hy@ti.com,
        oder_chiou@realtek.com, shumingf@realtek.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 5/8] ASoC: SDCA: Update HID DisCo parsing
Date: Wed,  5 Aug 2026 13:42:02 +0100
Message-ID: <20260805124205.4152543-6-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260805124205.4152543-1-ckeepax@opensource.cirrus.com>
References: <20260805124205.4152543-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B074:EE_|SA1PR19MB4973:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 908d3613-e7c7-47a5-9ecc-08def2eef80c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|61400799027|36860700016|82310400026|23010399003|11063799006|6133799003|10067099003|16102099003|18002099003|56012099006|22082099003;
X-Microsoft-Antispam-Message-Info:
	6Tks+ccHsnxyxZQYai1glKNJQkkLhYtSHEPvlsEDgUkGoNfUB09aotQ7XDgKBc2H3p2pXL1cGQeVRCmAJ+Idu57n0pYyAcliCWNDsrEOLtrUffOTNoKu3vdpZ6VWJEkfOVXAQZ7+U9rTpjjJTwPrLyqzzR+MNazrATFvoADJ+f2gsWyqOrcwyRVzQGSqAr3oPQJ8QiaOI6JEie7kGLt2Wg5dh3HJoY8oj3ylkTFkqaQZrzbZBiIfOk64uw9wp9dKuYOEKsTAeLMqqCUTmVsRpQc3uYzXx/953AzDzamLoaUqU3JFjq1zMMMoIf1nqo7wvhPf9e1vcLW3VBiaB6dAM9BCUBHYTL41ipkSI6LCMxazpvPGgt8J15h+DjW61Jc6Nxi6jlpBDWq3K/jygzPvhlO8eJ4jet9WDYwNDsdcpFoFr4VCm/GfdqZLbJBpRTymwy9Z2djlVF928/khAOD5h+PSJaXqG7rN7dLSTHC4KFkn3F79bhSFMbPuEKo4WeLxnFuEJBqqk1v0/2A2Fv05GFyV30Pv/Dg2xuqcNmzeO0vYINWj0lttcPiurZuXkVHyHvX3xySwAPLf/RWfC91K2hs2syPgiY4udjbvC3NA6SgNbasoyJWeqlCkSKlfd3SZP/b7EJNNqGNgvITE/M0TZ4Agy7zM4FX/IDc3ltJp7yIG5fzhl0JjbwdmLyl0U814e4CvxDKSAo0DhgMLCIUFZA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(61400799027)(36860700016)(82310400026)(23010399003)(11063799006)(6133799003)(10067099003)(16102099003)(18002099003)(56012099006)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	m8XSAfI3CQqN6GrRQmH9xrISD73AUGVBzhyWBjYpF/YSIKBR58VdTr23dO2t3647riNW7Y52J7rWXsa3/j7hDYsOO/RAG6GOax/fxM8gCANuWrk8dX17CpaIsMZi+DETL6zySWm4uCt252UIgS1ICpN2wTt8WFfrnZsOeHntQ009R/EXypfNp6rJnrXvRHeS6XTIioEu8y1T3dHcPpv7VfCRGP6xxM2VznUKdyAyCe1iNNWh2WKZ+xt/WhB/zJraQmTkW8Y9jR/lVD6Sce/P27+Gejn2b1SgAFmRuokaNNR3ICs+GL1FDmA+zc1mQZjNY2HNUpnegdHgo6iLHXkWXsjCbYK2PKYVcyMdOPC3P+0/k8b0Xjbo8XqUDlc+J6QW5T/sCl4JUnEqCML7GxME/RwZqtJ3MFCGjhT0wPb9WaH31r+i2Qp67DJtAO6RA03w
X-Exchange-RoutingPolicyChecked:
	SfMdK4Np270HKPOcu3B/zORf5C8Pi5cBpFan6gDAwRcAYrtHxmnd+a6nghy+gmmp5ie6fjDwTfY6tdCxE6MHdCIfyNSwRY7MIPx3p63FwRRmbyaCf099Y4dod7kGLvIPTzfGyXWd65dPeP/6kI4wktghjNXNfsgGBK24xhf3rebuivn0JsYxRACJ7sxrVSL/jbOSFzHyw/Sjc3wOvkD6pKWFN5Fjv0zGNJVWaMAe+pYUKbYHX24QlhErfdCeST2nixhi7YldK9Ds2yCzNROkTlzsC93EwUoVW8XapGwQwk2Sgt/RSVVwrTRxQ1R5VpFPUOY/Dsbr5waaYXYrgM0h7w==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 12:42:10.8765
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 908d3613-e7c7-47a5-9ecc-08def2eef80c
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN3PEPF0000B074.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR19MB4973
X-Authority-Analysis: v=2.4 cv=ZK/nX37b c=1 sm=1 tr=0 ts=6a732fa8 cx=c_pps
 a=zIlxSkAlgAN8/7mUobs3rA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=-1BAiDLmoNLMV61lCjoA:9
X-Proofpoint-GUID: -q3Mw8-gqa4QS-Pwp_bv0j8ORUZrUpxv
X-Proofpoint-ORIG-GUID: -q3Mw8-gqa4QS-Pwp_bv0j8ORUZrUpxv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDEwMiBTYWx0ZWRfX6l+iSmUBbwN+
 280IBrIsbrAoGnLtH6mGCofIUXGBpM+DXbcQ6XWM+4pLuEHsE+ZmMoZGbJALxb8d+ozRdJMwS+A
 SNjmupNwooJhpY1Ejs61t8QmAalwZFGTuukl4hFsZegKnC2zJl+6J8pcusddm4GN8qOH/ypaA7p
 lc2ybkZW0DTNlDvCF3fLpdJ5Vo9jFTIlwO4NN6kehYa+Az/vJL92k5HPZnEoXCehcMlCEZQv/Ho
 TLpdxWas8v8rZ3RSWHJVZTiUq8B6YzKJfhf10FBG3djaIFF6kn1Kcy/OBg0eQBSVj9pz4QZa2GA
 ofZBWTeyYwnE502mxX/2CPxINdJ1HvaYF91Zn425KHjQI00a3WXLI0jIrWgJownBOCGYeVrR5eJ
 nn1eaz6Wq7anolPO9iOD6DUfA+BgwqlWg6eDz9zwH+LvtkpFUHarFlIkUfWxwclsuX3yyBwGRc6
 nCOS2yB0h2QC1Yce9WA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDEwMiBTYWx0ZWRfX/ZKxWgG40TJ4
 aC6TTmWWyleMPvUBIU/O6t0qUGLrdAo5kNzTY9HYoDofiOBcKb/BpMPVELh4Kxlf+QMA5ee3W7D
 3sKuHxdwFOY21sPmtJpNoEykgF+gWUw=
X-Proofpoint-Spam-Reason: safe

Add more error checking on the parsing of the HID DisCo and bring
the code more inline with the rest of the DisCo parsing.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/sdca/sdca_functions.c | 119 ++++++++++++++++++++------------
 1 file changed, 74 insertions(+), 45 deletions(-)

diff --git a/sound/soc/sdca/sdca_functions.c b/sound/soc/sdca/sdca_functions.c
index e49acfe49e289..1196cc09389ae 100644
--- a/sound/soc/sdca/sdca_functions.c
+++ b/sound/soc/sdca/sdca_functions.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/acpi.h>
+#include <linux/array_size.h>
 #include <linux/byteorder/generic.h>
 #include <linux/cleanup.h>
 #include <linux/device.h>
@@ -1369,59 +1370,71 @@ static int find_sdca_entity_hide(struct device *dev,
 				 struct sdca_entity *entity)
 {
 	struct sdca_entity_hide *hide = &entity->hide;
-	unsigned int delay, *af_list = hide->af_number_list;
-	int nval, ret;
+	int num_reports, ret;
+	unsigned int delay;
 
 	ret = fwnode_property_read_u32(entity_node,
-				       "mipi-sdca-RxUMP-ownership-transition-max-delay", &delay);
+				       "mipi-sdca-RxUMP-ownership-transition-max-delay",
+				       &delay);
 	if (!ret)
 		hide->max_delay = delay;
 
-	nval = fwnode_property_count_u32(entity_node, "mipi-sdca-HIDTx-supported-report-ids");
-	if (nval > 0) {
-		hide->num_hidtx_ids = nval;
+	num_reports = fwnode_property_count_u32(entity_node,
+						"mipi-sdca-HIDTx-supported-report-ids");
+	if (num_reports < 0 && num_reports != -EINVAL) {
+		dev_err(dev, "%pfwP: failed to read hid tx ids: %d\n",
+			entity_node, num_reports);
+		return num_reports;
+	} else if (num_reports > 0) {
+		hide->num_hidtx_ids = num_reports;
 		hide->hidtx_ids = devm_kcalloc(dev, hide->num_hidtx_ids,
 					       sizeof(*hide->hidtx_ids), GFP_KERNEL);
 		if (!hide->hidtx_ids)
 			return -ENOMEM;
 
-		ret = fwnode_property_read_u32_array(entity_node,
-						     "mipi-sdca-HIDTx-supported-report-ids",
-						     hide->hidtx_ids,
-						     hide->num_hidtx_ids);
-		if (ret < 0)
-			return ret;
+		fwnode_property_read_u32_array(entity_node,
+					       "mipi-sdca-HIDTx-supported-report-ids",
+					       hide->hidtx_ids, hide->num_hidtx_ids);
 	}
 
-	nval = fwnode_property_count_u32(entity_node, "mipi-sdca-HIDRx-supported-report-ids");
-	if (nval > 0) {
-		hide->num_hidrx_ids = nval;
+	num_reports = fwnode_property_count_u32(entity_node,
+						"mipi-sdca-HIDRx-supported-report-ids");
+	if (num_reports < 0 && num_reports != -EINVAL) {
+		dev_err(dev, "%pfwP: failed to read hid rx ids: %d\n",
+			entity_node, num_reports);
+		return num_reports;
+	} else if (num_reports > 0) {
+		hide->num_hidrx_ids = num_reports;
 		hide->hidrx_ids = devm_kcalloc(dev, hide->num_hidrx_ids,
 					       sizeof(*hide->hidrx_ids), GFP_KERNEL);
 		if (!hide->hidrx_ids)
 			return -ENOMEM;
 
-		ret = fwnode_property_read_u32_array(entity_node,
-						     "mipi-sdca-HIDRx-supported-report-ids",
-						     hide->hidrx_ids,
-						     hide->num_hidrx_ids);
-		if (ret < 0)
-			return ret;
+		fwnode_property_read_u32_array(entity_node,
+					       "mipi-sdca-HIDRx-supported-report-ids",
+					       hide->hidrx_ids, hide->num_hidrx_ids);
 	}
 
-	nval = fwnode_property_count_u32(entity_node, "mipi-sdca-hide-related-audio-function-list");
-	if (nval <= 0) {
+	/*
+	 * FIXME: This should probably link to the actual sdca_function_data pointer,
+	 * but updating to do so should probably wait until we have a user.
+	 */
+	num_reports = fwnode_property_count_u32(entity_node,
+						"mipi-sdca-hide-related-audio-function-list");
+	if (num_reports <= 0) {
 		dev_err(dev, "%pfwP: audio function numbers list missing: %d\n",
-			entity_node, nval);
+			entity_node, num_reports);
 		return -EINVAL;
-	} else if (nval > SDCA_MAX_FUNCTION_COUNT) {
-		dev_err(dev, "%pfwP: maximum number of audio function exceeded\n", entity_node);
+	} else if (num_reports > ARRAY_SIZE(hide->af_number_list)) {
+		dev_err(dev, "%pfwP: maximum number of audio function exceeded\n",
+			entity_node);
 		return -EINVAL;
 	}
 
-	hide->hide_reside_function_num = nval;
+	hide->hide_reside_function_num = num_reports;
 	fwnode_property_read_u32_array(entity_node,
-				       "mipi-sdca-hide-related-audio-function-list", af_list, nval);
+				       "mipi-sdca-hide-related-audio-function-list",
+				       hide->af_number_list, num_reports);
 
 	return 0;
 }
@@ -2152,29 +2165,45 @@ static int find_sdca_filesets(struct device *dev, struct sdw_slave *sdw,
 static int find_sdca_hid(struct device *dev, struct fwnode_handle *function_node,
 			 struct sdca_function_data *function)
 {
-	int nval;
+	int num_desc;
 
-	nval = fwnode_property_count_u8(function_node, "mipi-sdca-hid-descriptor");
-	if (nval)
-		fwnode_property_read_u8_array(function_node, "mipi-sdca-hid-descriptor",
-					      (u8 *)&function->hid.desc, nval);
+	num_desc = fwnode_property_count_u8(function_node, "mipi-sdca-hid-descriptor");
+	if (!num_desc) {
+		return 0;
+	} else if (num_desc < 0) {
+		dev_err(dev, "%pfwP: failed to read hid descriptor: %d\n",
+			function_node, num_desc);
+		return num_desc;
+	} else if (num_desc > sizeof(function->hid.desc)) {
+		dev_err(dev, "%pfwP: hid descriptor too large: %d\n",
+			function_node, num_desc);
+		return -EINVAL;
+	}
 
-	if (function->hid.desc.bNumDescriptors) {
-		nval = fwnode_property_count_u8(function_node, "mipi-sdca-report-descriptor");
-		if (nval) {
-			unsigned char *report_desc;
+	fwnode_property_read_u8_array(function_node, "mipi-sdca-hid-descriptor",
+				      (u8 *)&function->hid.desc, num_desc);
 
-			report_desc = devm_kzalloc(dev, nval, GFP_KERNEL);
-			if (!report_desc)
-				return -ENOMEM;
+	if (!function->hid.desc.bNumDescriptors)
+		return 0;
 
-			function->hid.report_desc = report_desc;
-			fwnode_property_read_u8_array(function_node,
-						      "mipi-sdca-report-descriptor",
-						      report_desc, nval);
-		}
+	num_desc = fwnode_property_count_u8(function_node, "mipi-sdca-report-descriptor");
+	if (num_desc <= 0) {
+		dev_err(dev, "%pfwP: failed to read report descriptor: %d\n",
+			function_node, num_desc);
+
+		if (!num_desc)
+			return -EINVAL;
+
+		return num_desc;
 	}
 
+	function->hid.report_desc = devm_kzalloc(dev, num_desc, GFP_KERNEL);
+	if (!function->hid.report_desc)
+		return -ENOMEM;
+
+	fwnode_property_read_u8_array(function_node, "mipi-sdca-report-descriptor",
+				      function->hid.report_desc, num_desc);
+
 	return 0;
 }
 
-- 
2.47.3

