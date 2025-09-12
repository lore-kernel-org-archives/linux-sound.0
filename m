Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76F02EBBAC
	for <linux-sound@vger.kernel.org>; Fri, 12 Sep 2025 10:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757673335; cv=fail; b=WYoDK0ATiB5ryVXfrN35tikv0u9t6EzN7ZQX0VjNkC2h1UhM5+OrjPbjAWn2dAILNXhyOKOA3Qp3cI3Q9LaqyND2AJ6PlUB2sZDdxKjrl6gjrLVlLXoZhLgNF0tZtIX1546/MhyFaRukJJhx6V+SVF44kyHnhr9Wgx0vzVWJO0o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757673335; c=relaxed/simple;
	bh=wn8v66vasqL98JqnaWCwBf76vM4EYIMX4LpkZaene60=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uXzL4EBZHrDBA5ypk1GTGf/zXmJfRQtCqOmI5/q6SSrr/t/xLxpj6hOOeX9IZXusScl+97KnVTT0f91Y0hWs738SIw6/V7dVEtyuDW2B93cInFQoT4h13TH6Q2TmZtHcUtBoVRSN7A07bu9aacNSkFYKaLDtaeAJtlSP2MJ3FHE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=O39xQPgc; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=ReSIHnDs; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="O39xQPgc";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="ReSIHnDs"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58C4oDtC1137784;
	Fri, 12 Sep 2025 05:35:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=G1rzFNwuCF5+ZR4pabSd0rWD9oXfbaS9eNmXSmf6lME=; b=
	O39xQPgchnjQdBsY3QVZGrh+OLLGoOpv/65k4Xt2vrST9JeEYtPcfP2aocPZCnkJ
	xW+pRwkehfpvneh0o2Sw8f9ZLE5OtujW4nbJk5+OmAQbVSEFrcj0H2FDMORfsdRP
	P3r/PL8EhSgApKtIW8cyGg/bKDRZU1spjDyIL0/3ef2T5cKAqPSKdhK7HsSEoWDC
	Wu7hYAbnmRKFuGO6Qm90WWvLtsM/e5ivF7LRzhfIphtcNVujBNcY4dHVF0iNdVAh
	xrmfHI6VRJ2KP2y4tS2mFjtv3ZQFKXdpIImNOiBJ2lcyFwbXx8fdIR8IskP/KRVE
	/KkgN5B+vyoTiaB069v+Tw==
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11on2135.outbound.protection.outlook.com [40.107.236.135])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 492q6tcphe-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 12 Sep 2025 05:35:20 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OIMD4dIDmYQc1baAbh2HlabeVfmDppdovBPbX8vuVLGN9FANX129H/gZ9MFMADW3ARpDULTUvG7rzKjEivf3PucAHhjaqltJfQtwacRSjwBmJ8icRvUOc6lt8YW0S2zo8N1xVM2iEMJv8BJsCLPNW3gmjfhEOKehUtSTica8sovxKaqQRHGT+uve89mJebGV7HdGyAvAbBnDuna+IGTd6sTNhUfVjrGXbWByK2AaKvdjaYgop4n/lFayCAD3MQajSGAoOyCRA6E8O6X+swLH9EL79kCuLDanbmqJaGUZEYNKvAzgXkHmJk2EKWcwk3AlnngGe3ldXfbWqxt63U6+jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G1rzFNwuCF5+ZR4pabSd0rWD9oXfbaS9eNmXSmf6lME=;
 b=TjKFdkQVtxqJah4oWdqEVw6BJWUU4FKHXGJANHAoKtbdnDKaU/8ppCQ4P1QLDGTI74DL9Aflxko53wA8Rpmt6LwJcDZ+r3Tbs5bykKII+kSdDyWxDyprRqst7j7r8rJ6GbVonnTL+ha0pQPFzr7g/fQExVGzkGOvSJRCWHjHei8+vtIT3s3Zm6CH+HrVCf+MDlkP4XodGfVFA/r7nVG9uF0u4a+MMhp0sIClLu6T+1qgxPC/egj9fzZrd7IXAGOnrnH7zUzVwWOTNFFvqDcptHNG8CnYoRuDqDJXpr0senSLXsFwSPAyIwbAXoZWUU7BoAH4r5QsILyqzN1yXPoD8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G1rzFNwuCF5+ZR4pabSd0rWD9oXfbaS9eNmXSmf6lME=;
 b=ReSIHnDsX5Jz545HE5yGpKAAOz337gTroO4va/XGsUA1NW5ql1waYaICJ+yy7I161PJcqKNnhxc0En1gNiRF+Ef0ZhDUkcXsrmJCKL0GKD42e1x8mO47SEVximEUQo94pWo5uuHcZW7/0X3uRKnH7WoWIgAlpuqGI0SxCeGEyI8=
Received: from BYAPR08CA0032.namprd08.prod.outlook.com (2603:10b6:a03:100::45)
 by CH2PR19MB3976.namprd19.prod.outlook.com (2603:10b6:610:93::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Fri, 12 Sep
 2025 10:35:15 +0000
Received: from CY4PEPF0000E9CD.namprd03.prod.outlook.com
 (2603:10b6:a03:100:cafe::48) by BYAPR08CA0032.outlook.office365.com
 (2603:10b6:a03:100::45) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.17 via Frontend Transport; Fri,
 12 Sep 2025 10:35:12 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000E9CD.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.13
 via Frontend Transport; Fri, 12 Sep 2025 10:35:14 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 7056540656B;
	Fri, 12 Sep 2025 10:35:08 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 5DBCE822548;
	Fri, 12 Sep 2025 10:35:08 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: rafael@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v2 18/19] ASoC: SDCA: Add early IRQ handling
Date: Fri, 12 Sep 2025 11:35:03 +0100
Message-ID: <20250912103504.2679226-19-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250912103504.2679226-1-ckeepax@opensource.cirrus.com>
References: <20250912103504.2679226-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9CD:EE_|CH2PR19MB3976:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: e05bb99c-c15e-4986-e9d0-08ddf1e80f48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|61400799027|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?n2TEwNKYZxd53iT306RbbeU2Qcn/Ei9offe2yQX7ssRrRP7JXCxn34S3342Q?=
 =?us-ascii?Q?15vD3OTSrKAOqXhbFxWpFhynr+lzik+ZClUrhHUdx0aL7ObXw1wRs5Yo3V43?=
 =?us-ascii?Q?Dg3JxHHH8ZRwFflU8PtTqEs4XDMB/hgg5ZB/k2pbuwOCuCwCIs9ocdsVGVQJ?=
 =?us-ascii?Q?egG8p6RzOvIcGaP7a1ARQILQgo6erccqCRUCzDORAUS+0nHtRA+y31iFj2nP?=
 =?us-ascii?Q?/WpmdBl/qKvm2k9/+ELx6K3yc0yyxuuO9HTJAj8xCwLZq+0bMa05jAWSdS9U?=
 =?us-ascii?Q?eXN3BFpRAHwLfj3lfjXVihijYOcT/gvP9nvGlXewh4mfSZe6Ji/LH17xmnjl?=
 =?us-ascii?Q?7A5SGDSTFlJiGNcWm4cJNVNSTAhkRA/2uywbBv43Z1nkhzvIUl5H01R9tMO2?=
 =?us-ascii?Q?pV/95XstKA32S4HTziyrEXe2vo9j4MOvzwByMhTiBMP0xt2i/DFoV77Kdb/a?=
 =?us-ascii?Q?4oJ5H+yJRJe7NmRQOidug7RmSKqAyIlY9H2cqA2f8GcDkxGCX0KVZLqCzFk0?=
 =?us-ascii?Q?O8VEq+ujHuE412fYYB7cwje+zxYoqJSCba4iPjuLIGqNnbvO46Dtbkf/nkp0?=
 =?us-ascii?Q?jX4UVLWJi2PiuPj16B1S4YXvoai7iobQTu3ekT59OzIeS8KCM09DAGIQC845?=
 =?us-ascii?Q?+RIFua8ZTD2rCqwjhzdMa0tkqTMPj+mDPOsb1taWZk+V3TjqqLsorlrB1EMh?=
 =?us-ascii?Q?TzwtUCgowlW3quwvr4IvpwsQ5YZQufzjGslrHaroIa+HzA4yGzfrg73Fca0u?=
 =?us-ascii?Q?ku+KHTioWMp3DSLRVJk6P6yUTjPvKfHzVsvtpzmAbiFsW634suPSQZUj3JaO?=
 =?us-ascii?Q?bm9/YKNoDCy8i6rcyky0Yle3m9auZ5+YXT2eBZn8GAZkTe4uLdGh3avLqvKG?=
 =?us-ascii?Q?vo6apNmAGbWrbD5keCsMsdlMNYzEsENySWjuMjSgOKLCWtyHfSCQ0RhjOckm?=
 =?us-ascii?Q?TEEgsts92EJQnrwCEmNGMUOVKAZ0SGDnGxotyf/ZzHUZjwH7eG657iqzij59?=
 =?us-ascii?Q?3GleWyGG3lbU9x92AJ8KQilgR2RKo7Y+5ZgOrmN0/JD+LUgWoCiodHtTbtS7?=
 =?us-ascii?Q?fL9HKMwo5UQG5+OwVxvVuKm6KroJt47tIB+3Fyu0SbtxrRFniVn+5W50ilgK?=
 =?us-ascii?Q?FCHYD7928sdfirXzDDJrU/7Fx5u/BrjOf1L3XoTFfTmb4hja/YQmk6tZyyMO?=
 =?us-ascii?Q?TZ0dklLz8s1BwyadWTROTSSjm7on3Lifo5/nU4cRt/nIY2h/9FeS54sM8WRE?=
 =?us-ascii?Q?6EoOpbSJM4c0dsZNn08/3Nj8+rOYNlL7QSmt1VhJMP801YwUhS090lDDKwhr?=
 =?us-ascii?Q?DeuGXd5n2QwOfhP1CcMwjWrmHmBNW1Gy5L+DmtFo2MFaV5i639qRiPCcD4ko?=
 =?us-ascii?Q?qi9r2+X5o6OOq0og3VL6JHtDBIELi76UZFPtt9LKGnoRjycBvljqu+vQRCEC?=
 =?us-ascii?Q?NgOB+nQxCacQrysFnKOXbnYKeb7i4cUIQIkwjH0c3JOWqwSzly+9+BRDiuO5?=
 =?us-ascii?Q?1rk60OQ2PZSC7kfMpVBgxz5njKt7pCW/dcFP?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(61400799027)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2025 10:35:14.4756
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e05bb99c-c15e-4986-e9d0-08ddf1e80f48
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY4PEPF0000E9CD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR19MB3976
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEyMDA5OSBTYWx0ZWRfXx1rl2uoxR8LQ
 tQo/6wzH40CWxu9Z1ptj1msvmQiB/qUe2JwKrQBJVibmYJmcvGS/b97lTteoqkd5vJo12AV2kgS
 qqWOupueQWhMxN3Spf3AaDLQ0O7c2LLC1Mlvy7F6vLrjca1+bZu6DFcdQxX3DP4Bt8u8xXN9vHU
 Lk82LsfRB0x9s0Xunp6kJ4R1UXf4KXi00p0U9qhe20TB48jEk+J60x1YBk73QMyVU7/Iq0IHrST
 pTHe1pokKpfA1lbH/b+NzygKi70GqJ6J67vAUWjLC4S+aGUXuVAqppvbspW/OlmL6Mpufj/Qn9u
 R94Zb9aOHL+JFWLWquK4Y29YJpGAO0OeI5ohcKickzjTyPLHmr1Pn+3aFDciz0=
X-Proofpoint-GUID: V9Y0xQuHDMBoqH9JioqbM4xL6CFbt9b0
X-Authority-Analysis: v=2.4 cv=X71SKHTe c=1 sm=1 tr=0 ts=68c3f768 cx=c_pps
 a=zyo/4fEFTQ0kavnXrlnuAQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8
 a=QVwGPAhPMYaFeXMKfhcA:9
X-Proofpoint-ORIG-GUID: V9Y0xQuHDMBoqH9JioqbM4xL6CFbt9b0
X-Proofpoint-Spam-Reason: safe

Some IRQs (FDL) require processing before the primary soundcard is
brought up, as the downloaded files could be firmware required for
operation of the audio functions of the device. Add a new helper
function which registers the required IRQs.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v1.

 include/sound/sdca_interrupts.h  |  3 ++
 sound/soc/sdca/sdca_interrupts.c | 71 ++++++++++++++++++++++++++++++++
 2 files changed, 74 insertions(+)

diff --git a/include/sound/sdca_interrupts.h b/include/sound/sdca_interrupts.h
index 4c347fdce165..d2843f88d783 100644
--- a/include/sound/sdca_interrupts.h
+++ b/include/sound/sdca_interrupts.h
@@ -75,6 +75,9 @@ int sdca_irq_data_populate(struct device *dev, struct regmap *function_regmap,
 			   struct sdca_entity *entity,
 			   struct sdca_control *control,
 			   struct sdca_interrupt *interrupt);
+int sdca_irq_populate_early(struct device *dev, struct regmap *function_regmap,
+			    struct sdca_function_data *function,
+			    struct sdca_interrupt_info *info);
 int sdca_irq_populate(struct sdca_function_data *function,
 		      struct snd_soc_component *component,
 		      struct sdca_interrupt_info *info);
diff --git a/sound/soc/sdca/sdca_interrupts.c b/sound/soc/sdca/sdca_interrupts.c
index 74a79173ce8e..3fb844994712 100644
--- a/sound/soc/sdca/sdca_interrupts.c
+++ b/sound/soc/sdca/sdca_interrupts.c
@@ -396,6 +396,77 @@ static struct sdca_interrupt *get_interrupt_data(struct device *dev, int irq,
 	return &info->irqs[irq];
 }
 
+/**
+ * sdca_irq_populate_early - process pre-audio card IRQ registrations
+ * @dev: Device pointer for SDCA Function.
+ * @regmap: Regmap pointer for the SDCA Function.
+ * @function: Pointer to the SDCA Function.
+ * @info: Pointer to the SDCA interrupt info for this device.
+ *
+ * This is intended to be used as part of the Function boot process. It
+ * can be called before the soundcard is registered (ie. doesn't depend
+ * on component) and will register the FDL interrupts.
+ *
+ * Return: Zero on success, and a negative error code on failure.
+ */
+int sdca_irq_populate_early(struct device *dev, struct regmap *regmap,
+			    struct sdca_function_data *function,
+			    struct sdca_interrupt_info *info)
+{
+	int i, j;
+
+	guard(mutex)(&info->irq_lock);
+
+	for (i = 0; i < function->num_entities; i++) {
+		struct sdca_entity *entity = &function->entities[i];
+
+		for (j = 0; j < entity->num_controls; j++) {
+			struct sdca_control *control = &entity->controls[j];
+			int irq = control->interrupt_position;
+			struct sdca_interrupt *interrupt;
+			int ret;
+
+			interrupt = get_interrupt_data(dev, irq, info);
+			if (IS_ERR(interrupt))
+				return PTR_ERR(interrupt);
+			else if (!interrupt)
+				continue;
+
+			switch (entity->type) {
+			case SDCA_ENTITY_TYPE_XU:
+				if (control->sel != SDCA_CTL_XU_FDL_CURRENTOWNER)
+					break;
+
+				ret = sdca_irq_data_populate(dev, regmap, NULL,
+							     function, entity,
+							     control, interrupt);
+				if (ret)
+					return ret;
+
+				ret = sdca_fdl_alloc_state(interrupt);
+				if (ret)
+					return ret;
+
+				ret = sdca_irq_request_locked(dev, info, irq,
+							      interrupt->name,
+							      fdl_owner_handler,
+							      interrupt);
+				if (ret) {
+					dev_err(dev, "failed to request irq %s: %d\n",
+						interrupt->name, ret);
+					return ret;
+				}
+				break;
+			default:
+				break;
+			}
+		}
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(sdca_irq_populate_early, "SND_SOC_SDCA");
+
 /**
  * sdca_irq_populate - Request all the individual IRQs for an SDCA Function
  * @function: Pointer to the SDCA Function.
-- 
2.47.3

