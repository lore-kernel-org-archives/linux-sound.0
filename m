Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A37E342CA5;
	Thu, 20 Nov 2025 13:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763646291; cv=fail; b=Vq7qeLHlgiU34zDcdbqGpYmEfC5eepkjpT7AX6og2ckezbgaVHu7KQBtK02Gy1o2vvYeu6+4TismQap+m0EvR9FcHvY42rSGjtBthCmcV3FeKm3Uv/6LHgXF+YrEFFppGw+v1LgFuCjUQDFMdpxryoMT82i+cln+RBGXWoKsYtk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763646291; c=relaxed/simple;
	bh=wJGApETpNrSiJl71v0/ce1fJq4DDayZu0Uu46pvocco=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N4zFobvgT/s62cxt15xT2s+eKnjJp4hkKEHtX/NXd9Li9LVxlleW3mUB7pIyPoutam214dDU/hdxBZzdGAaYZd3VmDsSDOM0xXRrUa0De6bUJKKKdDmSd1Tmgca182L0NYadC4pdUqX5n72crIlblR039+kXlLpzhqHdqD9nYvs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=YTJLLI4R; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=UjhkMg7F; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="YTJLLI4R";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="UjhkMg7F"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AKCpaS81058789;
	Thu, 20 Nov 2025 07:44:45 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=cJV+HjH7Z8YaqOpPAlwGOe7qmvncEKh/zeIFNWGdhn0=; b=
	YTJLLI4R5vbLjUzEIZK+WQVDgQU0L/umFui8+T7NUzh58ntwvo97gMPRuhmcaBsP
	pvxpmx3fNwcr+oeZZn72a3hVxB408ExFKTf2TGOJrW2L1SxEXRpMSS1Ls8CRjmOj
	OnyTrA10guxXlZpIDwfn2b2a8giY0ELLOjRsknzWEJofawwaUUiniD8CfVCzC4nW
	xjXT4aqVvBIerckOvVLTenyPwPXADshE0N6+J50S/hP+OYWbUAbXv0sN962YPT0y
	P5xMXri4mwfZsbct81YXeiNjTMgVHLLBKV3ddtLw4pps9UkH/A6FsvXfBXZ8OiN5
	NxNTIHHiXWltBX1LfuJDaQ==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11020124.outbound.protection.outlook.com [52.101.46.124])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4ah1bmaf4b-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 20 Nov 2025 07:44:44 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WtXYjkIOIK0iqdQXixLnNPH8vSeo4Dk5imUJpQVir5tErR9d5cuoSNi/qH5VeoJ1CMX2DoqZT4E+XRinskfSMAVCEwUzwAiA5LucqeUsm3RvmpdkRl+mBnt12iuwXIJsYKPwuCHt/F5K5k8j8oT35gHE68FgQ16+9bL9GegBA8x1RUhBEmkctr7eE38CTzMUpdRma1cWddDBgyVL03pxNu5BaQzJw8xdiGy9MXKSidtHVB48tunj7J7Tgs3ZfaZ5/sxaGEkMBMKrLmwryj5ExTWTnu361zU/UBzqZeTYd09paKA3Zo+zMTCzVVkPuMsZKZEmjizf/Y7Iu5cD0D062Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cJV+HjH7Z8YaqOpPAlwGOe7qmvncEKh/zeIFNWGdhn0=;
 b=WKD8olOqcv3mfc+5jX90oY6Tkp6wRKuLzIxMjWpf4TXNsac0G8hy9MTfapDAGCIz7Be1kyhLBzoW9HpjWgLA5yl+XsO4uHpV5AYCtiVnJoE4PYZ8QwpZlm6xTbt1nAlAm9o73vbwvB2cVojGSBbIId5gGyvJkGNxPnsNcpU41XdneWPhX94Gy9LGz2/8ZKeXCfzFG0xFn1Wvk+NcMLhk6oeU/sxBaVmeXDuXUxZdkxxQWHkY6WiFfBw7rZYK4KkCsXB/uDXTuj4g0AOkA+pcNzReUMLVd1EyyEVoM4gsp53sanWXLUD6mrGE4vKnDLdV0UwDanIZ33/gXusoKH3NUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cJV+HjH7Z8YaqOpPAlwGOe7qmvncEKh/zeIFNWGdhn0=;
 b=UjhkMg7FAr6d8PuIkcsFcSiOvqAWFqg9jGxB3aNiGpU2Kv23Wu6ezKFpxgGlZ7tJ0UmK0h4tYsnPqgtYGbuwqMBe2jQXHwm+UHenXJunu02ePesWY86EEBjaMMKHeiQiZvguQePaWotrdXwsSgiEwfJGg6EoI5KfAY/xMMgEShY=
Received: from SJ0PR03CA0232.namprd03.prod.outlook.com (2603:10b6:a03:39f::27)
 by CO1PR19MB5016.namprd19.prod.outlook.com (2603:10b6:303:d6::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Thu, 20 Nov
 2025 13:44:39 +0000
Received: from SJ5PEPF00000206.namprd05.prod.outlook.com
 (2603:10b6:a03:39f:cafe::41) by SJ0PR03CA0232.outlook.office365.com
 (2603:10b6:a03:39f::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Thu,
 20 Nov 2025 13:44:37 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ5PEPF00000206.mail.protection.outlook.com (10.167.244.39) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.9
 via Frontend Transport; Thu, 20 Nov 2025 13:44:39 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id A15DF406553;
	Thu, 20 Nov 2025 13:44:37 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 9B267820247;
	Thu, 20 Nov 2025 13:44:37 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 4/4] ASoC: cs35l56: Use SND_SOC_BYTES_E_ACC() for CAL_DATA_RB control
Date: Thu, 20 Nov 2025 13:44:37 +0000
Message-ID: <20251120134437.1179191-5-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251120134437.1179191-1-rf@opensource.cirrus.com>
References: <20251120134437.1179191-1-rf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000206:EE_|CO1PR19MB5016:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: bd14a742-dbd9-4113-3852-08de283af39b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JIqIIUN4+XBsS+OjGpuW9eMuFWcLNnTE25IssoKCnp+5aVeEfsbc7wfPM+eC?=
 =?us-ascii?Q?pRJ+3GuU+jAzAZlpJxNgZ+acJJ/Jg7e2AwTiI4lRoXQyHbvAcEVtZV6qGJPH?=
 =?us-ascii?Q?Ew7I+UIVFVzMfCrfQmnaXxh587V51eepUx+Tkm5BWQK1wSnmpyuIunuvQSI0?=
 =?us-ascii?Q?jY2qRqXoXiYsJSeIVe0lpiu9POP76XO2KGyQ23Tibwg2KvJ1GgxaVKlbXbBz?=
 =?us-ascii?Q?24X+K/kidb/lCWyR8x+B0uKB2zhCQsvU5msW8pEEi+Qa1GKv9TKznbfbM5SS?=
 =?us-ascii?Q?gbLlqVwXjMe80AGZY2trn1Un1m8hBJY23kd5U78Kl9jQCvHb8HXol7kQ+j6C?=
 =?us-ascii?Q?Z8rz0C386KzZdCe4iHDP4820zXQEEvZVR04jjVirii5SqWnJYCHW7XThrNxj?=
 =?us-ascii?Q?P5w5xittJLXXt7LPjKiuDazdN+cXCHbLqWXDgY2OYOQLjuSVETaKfbaubgit?=
 =?us-ascii?Q?Da0XdqL7c1JpI7nIbMACrIB9y4odEg6dOC+hiwzhacILlQ28vCgb0s4G87F7?=
 =?us-ascii?Q?TxiK7U06iQ9CfNSUPkowBrBot6XIafgCFl8okVAbR/K79Me4cIuMOqmUDGBR?=
 =?us-ascii?Q?YFvB/AlREEAxQkkKuijjIl/QU/4pPuDy4smV7XO0/OR4zFGp6emw1mnhChHw?=
 =?us-ascii?Q?Aa5O8tDbzZwBOSSN7NbVcoUFHveP7eyRBEzzzSmk6mzUchMG483AJQTnrTrG?=
 =?us-ascii?Q?l7YZpJw5QzrIqlV+YwNEycSH9vEVTnuE/5D9gkK/rFBJBT7IaehMs69CAj/v?=
 =?us-ascii?Q?0MUdwI56rkbCdAog65tQaZmnvCHvSG2Srgv2Pq8WeFAljvMO5S+uAujASHxQ?=
 =?us-ascii?Q?i+NQl/aQAJyxwH+U+eV7Eu5De2Pv3S97Qvza9ZYAZ18Mh5sXF5QJO8IPeBRc?=
 =?us-ascii?Q?J3+VggueKLMd3aewQ7wbpDxBxt+V5Vvbvfg0sJeSO6EZ2GdeUNATTiF7k2vl?=
 =?us-ascii?Q?/8TWFSHALuu/00wBuCoVZUHZbNmg3iksbmilXRiIhE4Z+cg7bM8KDE14wMlV?=
 =?us-ascii?Q?qeMVPjWkwDxzIEevHmrn89J0XRjEfbdWRu8RWdS5FU0ngM5JNWXmA84wiG5w?=
 =?us-ascii?Q?VF1kD93glxQoFWDmnRwEfqAVPQqFeXWxO+shH+hlPTCHkFt9CW5jBpAVUo8g?=
 =?us-ascii?Q?4a3VGj96yjJNvjNCfFw9hXhHEJnwL5N+B7QlyP+qgjogtOylMzw2PNusmbxG?=
 =?us-ascii?Q?NNW8xttXrsofhPsHUEPeJ4u6YTcllHHOLXNgKbZurTpQAU8+a/vGcqeUmiMG?=
 =?us-ascii?Q?p/7q3dESWqv6vqxs+zdu+TpVdXfmx75TmghCCRZyzxk6abslcPaomFHMJBqM?=
 =?us-ascii?Q?aqYEYGACejn6u1sDdcUoybEVSeouF7znndveVU//7DD+JbL5laeUWMGyTIHE?=
 =?us-ascii?Q?in+ZZuD6rOFefEc7naULBZ3YBENCf98lbw/q+voV3YqaJBn0DXVRf0T8Rx1/?=
 =?us-ascii?Q?CQbgw0/SaLbKosFQWiORsIXpcynq9iETg4+za/pOu3CFi1V5N+FW1fvrTVTr?=
 =?us-ascii?Q?CtP3LNLz2Aa+ZmqT376rbSTbNZChSZ2HK6FHNWR5xaaMG8iKyu6iPgimxqn9?=
 =?us-ascii?Q?cntRJK35LJv+VuGJNp4=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 13:44:39.0042
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bd14a742-dbd9-4113-3852-08de283af39b
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ5PEPF00000206.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR19MB5016
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIwMDA4OSBTYWx0ZWRfXyJMG/0AyYbDU
 i5W+84tmJySO4ygIPeaIUb8nT7Oiq7Qc8JTVdudsAE3+PCFfec92CCTIE7BOpZja6dylDIxuokn
 /PmDj6+ihMl3ncWWCK01jhlf1+VlYbXXOVg9vmXpzldrWguxA1LC/+4n8HSzRbhwyeFXKGNRdG1
 ime7H+AdBDfoltIz8QNkXukLvHCYrWonBASqBQwH5j/+UsAL3LHxVLbtVS962fnl9wc5NJoistz
 TuAErk703KLnSW15n9jrzy7NiJ9o0hYgbqjfVLSyuSTMleYIQaw5+dPlO7C1i9SHddhkvich0w1
 4nHFyv0eWYWjW5wFn529Jg8bIew8Ih1RKdvcJrHtNKTQohP8eDDMXKzmdArOJ/MUcBivwHhXAA3
 aAb4Sbd5qiZEykDByB1EQYWH0knAig==
X-Authority-Analysis: v=2.4 cv=XcmEDY55 c=1 sm=1 tr=0 ts=691f1b4d cx=c_pps
 a=KzuZNAusUQo1wHVwqbxTLg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=8K60sZ1CEUfmsYt1aJoA:9
X-Proofpoint-GUID: 6iWIxqH0MZY6cbAzK--UrtyDLC82TsoW
X-Proofpoint-ORIG-GUID: 6iWIxqH0MZY6cbAzK--UrtyDLC82TsoW
X-Proofpoint-Spam-Reason: safe

Use the new SND_SOC_BYTES_E_ACC() macro instead of SND_SOC_BYTES_E()
to define the CAL_DATA_RB control, so that it is marked as read-only
and volatile.

This avoids userland code expecting to be able to write to it and
then getting an unexpected EPERM error, or assuming that its value
can never change.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l56.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index f5fd20c8cce1..d8a3babce0f6 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -1099,8 +1099,9 @@ static int cs35l56_cal_data_ctl_set(struct snd_kcontrol *kcontrol,
 static const struct snd_kcontrol_new cs35l56_cal_data_restore_controls[] = {
 	SND_SOC_BYTES_E("CAL_DATA", 0, sizeof(struct cirrus_amp_cal_data) / sizeof(u32),
 			cs35l56_cal_data_ctl_get, cs35l56_cal_data_ctl_set),
-	SND_SOC_BYTES_E("CAL_DATA_RB", 0, sizeof(struct cirrus_amp_cal_data) / sizeof(u32),
-			cs35l56_cal_data_rb_ctl_get, NULL),
+	SND_SOC_BYTES_E_ACC("CAL_DATA_RB", 0, sizeof(struct cirrus_amp_cal_data) / sizeof(u32),
+			cs35l56_cal_data_rb_ctl_get, NULL,
+			SNDRV_CTL_ELEM_ACCESS_READ | SNDRV_CTL_ELEM_ACCESS_VOLATILE),
 };
 
 static int cs35l56_set_fw_suffix(struct cs35l56_private *cs35l56)
-- 
2.47.3

