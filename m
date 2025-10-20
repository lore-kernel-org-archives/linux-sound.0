Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C962773CB
	for <linux-sound@vger.kernel.org>; Mon, 20 Oct 2025 15:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760975754; cv=fail; b=T15O/3/ViPkVVsY/US+nfuqjjQqYsaeTk8pmLDn5VvMB88eiIdAwGSaSf0gt8nAcp6orz1KaRkT2EmukMfngxEvUgzAdGrYE1PuSAkYeqiBB4Ek7Tnd9BzY4bD+1XRx53tjStitRUXO9wAgN68JV7+CkSPzGEtEpvKupJFiKTtU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760975754; c=relaxed/simple;
	bh=iIJjeQ2MvyYmmg8Y2gm/aLGzAnfAKVwROFXm7VWQffE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qa+ajFTRWxAN8s0tHVQ9/8w500AL0DLuDz6xwnnyXQmnbOudKm7ElIn+k1E2blnPcGXTvfu0AYYjMgNRh8ho0DKlOK/Nb0iUcPIVdBBcZWsqMzsc5CEHuRDXVNnRx0OSR7IWZoMNeJx7EGeg//K9zOfzkQXXM1PtaFeeiuXeZYA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=HB6cZkLZ; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=NR0MtaEK; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="HB6cZkLZ";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="NR0MtaEK"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59KEAYE13744736;
	Mon, 20 Oct 2025 10:55:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=e7vku+r2E4678bsiXZJUPGGceI1Upp6VCD/swwvJu+g=; b=
	HB6cZkLZZa+Sw/644Xw+JlQSt9xzrvqx0dEBkoiNc0piQ9NpfsfZ8angDyvgQZOX
	3y/6imE5c8fOfo0WflgDJLnVc29Q+r/AIL3XGl7DhsYh0vF+UjbOBt0xBbMQ/U/e
	0Zx1em0CB3GMJdW7vfkJpGT4rCzNpcrlfmmztE6CE0fMhs2wPhN6Bwq+6OCmVFXf
	EY3lVIy3uPqjzO4hgJkSqrIQbMe2JssbNeS5l2g5yvv9Ta6QbrU8uLC1V7kYulGF
	K4Q5BeCJDh664Hx4VFQpOgVbnlMU1LEL0dlmmWPH3yFJs+HPzO/FJO0qsVfT0a3C
	4G/ocWha/lv7sGDAOsl1cg==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11020113.outbound.protection.outlook.com [52.101.56.113])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 49wnc4r8dc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 20 Oct 2025 10:55:25 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rSpJ2DyRi+WehJGZeZ34hbu7/u6xm/MA/DTKTFVfSeul9HQRZo0grNHfH2uh5jSfRi+RHRawQ7mWLGyOAHzKxC35lw9WEvc4hb4z9FMUlAui+va9i62QtgQYzICmd/cMu0hUdf199Y3BPe/XSTgh8hU+n3hrw3INc3RJFRsQT7hMuRFCSXD8OEj/tSwo7s/mejQIVdP42FQepDUBOkSTO80Z7CLHe4RL19kz9RJimzUxDC1AgabFZF0lQ7C1iOCKvdyi2e4y446uNno6PFsO7oUF0CGyosuKaH3mW+lsBsqJv6isbdm8K4V7QICXIPZT5kwA7YQKHaG7kE1pt5O5Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e7vku+r2E4678bsiXZJUPGGceI1Upp6VCD/swwvJu+g=;
 b=ibx6EDysd8dWsPZkG4avBjbRuiayeb8EMybGxs+F98vuhnKEWYDFIThxXV/G0QoJw1Jdb2+InkVGhfhI/gT7wSx/Co80He0Bww9X632H60zbl4yvESY1Y8VvoRxjEAt7YVZopPJaGqsheGAxpvwrYgj7pSMHQjW4escQ4W6bwcDfC8QNEq8aZg5jPJlEy7XgFmZGZRhmHUMkif0HcEI4aYfMOh7adpg4k0/4yaInuX8Zu4pmWcySj3Ej/NiwuEnn/vh1Tg0ZBJ9zoMcxArnO1uM7/jg1xt9TtsrVbScT4Nir4+RtLxATpmYecqx7NWNL5Vuy1fhX6GAbEv/5PfIx4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e7vku+r2E4678bsiXZJUPGGceI1Upp6VCD/swwvJu+g=;
 b=NR0MtaEKp1Kev0tK15yZ/NgwoURqfBFNspON89LxmsWI/PdEb0pwv+Da76BaRXrQIc2wnUal7rArILvC32/DhvCge4/bhsUaBrhXQv7ijm/TYbZlmiBjpfU9orcUqis+KnzCrVMlsgsHi5zDa98SxyYJjKwWqcDyn0i6bU7sUto=
Received: from BYAPR06CA0011.namprd06.prod.outlook.com (2603:10b6:a03:d4::24)
 by BL1PPF9E0613D19.namprd19.prod.outlook.com (2603:10b6:20f:fc04::ec4) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.17; Mon, 20 Oct
 2025 15:55:22 +0000
Received: from MWH0EPF000971E4.namprd02.prod.outlook.com
 (2603:10b6:a03:d4:cafe::bc) by BYAPR06CA0011.outlook.office365.com
 (2603:10b6:a03:d4::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.17 via Frontend Transport; Mon,
 20 Oct 2025 15:55:21 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MWH0EPF000971E4.mail.protection.outlook.com (10.167.243.72) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.7
 via Frontend Transport; Mon, 20 Oct 2025 15:55:21 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 5BCB4406556;
	Mon, 20 Oct 2025 15:55:17 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 55F5B820244;
	Mon, 20 Oct 2025 15:55:17 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        peter.ujfalusi@linux.intel.com, shumingf@realtek.com,
        lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v3 RESEND 06/19] ASoC: SDCA: Update externally_requested flag to cover all requests
Date: Mon, 20 Oct 2025 16:54:59 +0100
Message-ID: <20251020155512.353774-7-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251020155512.353774-1-ckeepax@opensource.cirrus.com>
References: <20251020155512.353774-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E4:EE_|BL1PPF9E0613D19:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 6252634e-9606-40ca-7f05-08de0ff1133b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|61400799027|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QvI3IXgeqXp1bRvMu26/uxzdVwdajbF+1/BQCTedIMgk6lat0Xb/QPfdLGLj?=
 =?us-ascii?Q?Za+KqMLG8aMLUNi7EIAfd13eDJP+qpFpFhwSuAi57aWbBDHU2PO0j53rMd7m?=
 =?us-ascii?Q?61kXSvYvv0IOyQF1OZmiaSxNMLtl/zNHVt7n4KMY+dSENNuJN3OdDOQ5vO0u?=
 =?us-ascii?Q?AwmWbW0lzgRxDl01BK4S7jiSdFKCYABIfsW6Dsdslz98fxKH+YT0dXhu5pI6?=
 =?us-ascii?Q?vd72E1jP2dgrzxdm71PQDKvJLcjNyi2j0qXyEWaErjnTij8CevdzRCFvcwot?=
 =?us-ascii?Q?OlIP9/qCK0lYzNG3IbsJZkU/YsKa6LNBYHMkR7SvywulKHnsARPelq5hnac6?=
 =?us-ascii?Q?1a/iwQsmNM/EaBGNKh6H2EYeSt72tnGEJ0Rzi1HgGDD/9Mk0DDIim98ei7fT?=
 =?us-ascii?Q?t4vuHJKbCWiwLk9isP1//1PT/gnqqPtknYIeCdTAjYg9zAehqJ6nDfPYSvd3?=
 =?us-ascii?Q?KXGRX2AAYx2LsVTVyS9l8EyUHtcWqziLTAWi7CJCA3Cu5Uok29J0++P6tiaR?=
 =?us-ascii?Q?w7wlkzWXijmFrFTvUgSDTElsz/5G4q7dGkh1eAaCe2g4NhIigedSRVK5j6Vb?=
 =?us-ascii?Q?7BNZZClGPtjIsRzomsuXh7VyN6Eop82VdWt623bzHzSf/bXl+wxNKNcPqlED?=
 =?us-ascii?Q?q9VdOvKC9eok3H8kUhbe4NRJt+A63fAomkO/fefRHrQu9upMcZgEU2p5dPYx?=
 =?us-ascii?Q?h0bF+AreuhJB6zTBNs/FqkhPBpsTkugnOlEuHo92BIZrQUxXCe0NFa/h+Qrr?=
 =?us-ascii?Q?jJ8sAht4zjFANfPanKqw4KjsLw709yj73EQ1AqJeUPXBKttsnGjt8ipkY5V2?=
 =?us-ascii?Q?D4Zhsc7pQiJ7Lnx7UyJIgicFZ27hhlvPilaYR7Dhw1k+5tr3nHqdvz2EcrUW?=
 =?us-ascii?Q?V53VgRL301yhhNmckowOz+EWbUaiviKfHEggnE4c+sgesKdp7zUAXj5U3iuU?=
 =?us-ascii?Q?aLN8DEjQ6b1dF0JvH9fqqYZbGM0GnIPrWrmz6qbJImDZKXOMSBKtyJRwsd4U?=
 =?us-ascii?Q?LIaG3cFx3Mr1cnoHGnSlWLeyXiHzP4mlgtVGy500LUnS0CQaLXJy6VZfHZwT?=
 =?us-ascii?Q?/TRS3eGinDGdMW5Fgfi2H4x8AdzTutYXZw2wT1QQ4+5JL23moMZrFhjoT5Kd?=
 =?us-ascii?Q?8Cs5a/GbkUYnPi+GslLhA6Aq8bvnTbjtDREpXkAvHgUbCfAzA5mqFnxI/zKR?=
 =?us-ascii?Q?flzSFGiLTQhcC8VXIc+ojdghk36cAISRcj/R7SK5C9VYl/69Q4mDN5cSeUbr?=
 =?us-ascii?Q?mCU62VqABk/FrvYXrdSlW5Rf40HlS4uXJ84W9+3dIbrDGsA1CwGHPFjkWNx0?=
 =?us-ascii?Q?8pUclSduCWV6Ke6f65znna0als8pZPyFZai/D44taFNHl+HpRhUMNQi2P19a?=
 =?us-ascii?Q?CJi/lvSNoowmmocquC6ROdLbIOq0MrXOrm8koR+ue4OJARjXZ1qAKUar0fdU?=
 =?us-ascii?Q?BftS+leSL+zKtuivVMUbK17V3enF///TzhRk6bdIBqmrpNhPFlpFdBep9Myp?=
 =?us-ascii?Q?UuGTKK9fFbGcUrXo8CRuBD594qVZNxA+1V8aY+166PsuPSkVmJAPExSHlZ8M?=
 =?us-ascii?Q?0VKnfHcHSZYd2XVkXUk=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(61400799027)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 15:55:21.4102
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6252634e-9606-40ca-7f05-08de0ff1133b
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MWH0EPF000971E4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PPF9E0613D19
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIwMDEzMSBTYWx0ZWRfX8sOG+LG5dObW
 F8r3QYDlWvhT+PmrpDp/NbnMqPtipMVLtvKzAtShzuZS8dMNf4PZnwmGrZ7jti0DOXDZb/ZQ812
 cranKL7DsG1IX70ZHT0R56TKBd0gPQKZZH+xSIv2jiogQexewhOrblmnojOLdGBdrTB9l/MQuR0
 VwXjwJrrN9v3HAIlBVU2izhswNRexRjCkeO1LcAA5fGwRpxwFqnJ7Gvwbhl/vuRPB6NUlDs5nCj
 xzr3YQgez0pqo56ofa8PcxiZIieWZmZsxTRShqN0DRp5Hty/p0Y4DIB2geXMn4LXBDSMXYVEBdI
 iOAQEBXOSDWnM5z/gHia8upzC39N6ai7dR1fF+OkDNeri3p9jwsfRpTuOazOV7ksCgf5OaLCSsc
 EIGLbkSjfqhSLE8qxZMfhIeGcqWNZg==
X-Proofpoint-GUID: JH5qFaSUDHMOwOnWlvaUk5AOnMgXSg0f
X-Proofpoint-ORIG-GUID: JH5qFaSUDHMOwOnWlvaUk5AOnMgXSg0f
X-Authority-Analysis: v=2.4 cv=bf1mkePB c=1 sm=1 tr=0 ts=68f65b6d cx=c_pps
 a=gm+t6+/57aVGIJ5RQ2SxIg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=x6icFKpwvdMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=QyXUC8HyAAAA:8 a=w1d2syhTAAAA:8
 a=n3emF70xWfdXXSmRECkA:9 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Reason: safe

Currently there is a flag to indicate if an IRQ has been requested by
something outside the SDCA core, such that the core can skip requesting
that IRQ. However, it is simpler and more useful to always store the
allocated IRQ number. This will allow the core to see if the IRQ has
been requested, to perform additional operations on the IRQ, and
request IRQs in multiple phases.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Changes since v2:
 - Use IRQ number rather than a boolean for tracking used IRQs.

 include/sound/sdca_interrupts.h  | 7 +++----
 sound/soc/sdca/sdca_interrupts.c | 8 ++++----
 2 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/include/sound/sdca_interrupts.h b/include/sound/sdca_interrupts.h
index d652c6e94ddcb..e4bf123936bbd 100644
--- a/include/sound/sdca_interrupts.h
+++ b/include/sound/sdca_interrupts.h
@@ -29,9 +29,8 @@ struct sdca_function_data;
  * @entity: Pointer to the Entity that the interrupt is associated with.
  * @control: Pointer to the Control that the interrupt is associated with.
  * @priv: Pointer to private data for use by the handler.
- * @externally_requested: Internal flag used to check if a client driver has
- * already requested the interrupt, for custom handling, allowing the core to
- * skip handling this interrupt.
+ * @irq: IRQ number allocated to this interrupt, also used internally to track
+ * the IRQ being assigned.
  */
 struct sdca_interrupt {
 	const char *name;
@@ -44,7 +43,7 @@ struct sdca_interrupt {
 
 	void *priv;
 
-	bool externally_requested;
+	int irq;
 };
 
 /**
diff --git a/sound/soc/sdca/sdca_interrupts.c b/sound/soc/sdca/sdca_interrupts.c
index 898069ceffe93..cb7c7a6f356ed 100644
--- a/sound/soc/sdca/sdca_interrupts.c
+++ b/sound/soc/sdca/sdca_interrupts.c
@@ -262,6 +262,8 @@ static int sdca_irq_request_locked(struct device *dev,
 	if (ret)
 		return ret;
 
+	info->irqs[sdca_irq].irq = irq;
+
 	dev_dbg(dev, "requested irq %d for %s\n", irq, name);
 
 	return 0;
@@ -301,8 +303,6 @@ int sdca_irq_request(struct device *dev, struct sdca_interrupt_info *info,
 		return ret;
 	}
 
-	info->irqs[sdca_irq].externally_requested = true;
-
 	return 0;
 }
 EXPORT_SYMBOL_NS_GPL(sdca_irq_request, "SND_SOC_SDCA");
@@ -379,9 +379,9 @@ int sdca_irq_populate(struct sdca_function_data *function,
 
 			interrupt = &info->irqs[irq];
 
-			if (interrupt->externally_requested) {
+			if (interrupt->requested) {
 				dev_dbg(dev,
-					"skipping irq %d, externally requested\n",
+					"skipping irq %d, already requested\n",
 					irq);
 				continue;
 			}
-- 
2.47.3

