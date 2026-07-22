Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7339346A15;
	Wed, 22 Jul 2026 10:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784716521; cv=fail; b=SaDG+Gn9K6MePZ7D3VPUw0upj9ZlQF7hOygbKfeLADXGBFOy9qRegSFkqQ4EBTnMO7vgpcIqxfeBHIOzhaVgo+wU5YJPQ2KMqIEgf/q1z2Pqt2wZWm3qkJhkmZCVMGR1ltbaaNk5P0C7fsNB+Xp0OXsW3Pc5adcGu9suXn7A6KU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784716521; c=relaxed/simple;
	bh=43U3XdnXSN0AnPPMDAnQFhmH+dfc8AQiAnfWGmyEIbI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lUh2lxBAUEZnL6ICqarH28yXQBxwm8Vf8MesUX07SFgelB9EgkRbYG4Xdugo/Rbt8CPHqGjQYgWe7RxkZF+5jfyjUlg757Ak4+VRYJRGOFbg281L9o1BzH3tdkxnw9l79uzmLYfENn0mofcgT0Xz/V14GytAN2FPAKJtSK2eaXo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=af3rF8y5; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=O+BkV05e; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="af3rF8y5";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="O+BkV05e"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M5NoiN004689;
	Wed, 22 Jul 2026 05:35:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=6+J97xPstaBoFc4QFETnttjH2F2Of5kutDtOgt3o2Dk=; b=
	af3rF8y5VtjAs+NgbKZgIDGkrnO/E2/eB5tYo6r6z4jZ+1zvHjLmZuYuYRMB6Wmj
	6xVUY+3N578oA6Y4ORbxjn5UMfEVDAoOfWcPDojyj/6jHtuIedUEuXZC89ZpYoFF
	1XMptHnDCbJTtzPNoYzVgi6VKzxWTUmW6dqGLak8+RRtLCKYK55TYXxifUc4uOKx
	9LMwL3OJjEfoeMhRRRN3RaKSVUaFwvNg9p43T91EpdMkWb9dJ8chb3fSg6sh+BlB
	6mWL/+3CWsD7nYLZVIbWjCEemZfNspuaMhRaDTFXCoJMq3TzaJvgEcL/ml2vqVHA
	tS5U2UmorGbn1kndPqDLhA==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11020082.outbound.protection.outlook.com [52.101.46.82])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4fg6vynn34-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 22 Jul 2026 05:35:13 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=euAJeiTalR9rWQCy7qTQzLdUFItouOxWrDC72YX8NOwIgFi0oYS19dPUPR2vOrXuh5q/mcrQn4taa7sPeAxu33OffNQgVXHUXF8ks3S69WxYRPvLOUvk2Oz8MLcrcWPaz6sroyjFwxlKmr/ZTCZah74D9HZh+ifnAh+lWRtoDIG+iOXQvXYX48eIsuhKyYf5yWbDm8qwxTCHEmdmmY6+wfQdgKJXvbbuXwQfOhptq3f2XNbZH0RrjREI498oeyQgvG5eulXmFXJLkHGGFlXXUoo1RK2e58afmLTn5E/D0rRp0qnhpPzwPVs7UwwF1ifz1gkOsxz/pNvlVXyO4gz8MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6+J97xPstaBoFc4QFETnttjH2F2Of5kutDtOgt3o2Dk=;
 b=eprIUES7BDW/PZWyPA46JsAostQFms2I3BRPW9SeHfVMcnMHHLMtw5sy4ogq1fptpu0h4d6G9Z/IyQEx7gObyoooHC3O9nFXzwxty5i0RZSOMCD2UgA/3TrYN4t5AGHCaBoyqCqaB82Sj7Xtn73aJZGS+KcxvmvqzwkFEtHolxXNCwuGlzPGCF+Ks4v6vD9pqbBwKP8L083JPpSpz9mx+hOsMz1MKAfaEXzKt7deHT9OtS6YK75DIAoEyEszvpfBtU5KOpuCh6vq/v6+XZZepEmjYKO4mX6TFsl1ArqeA/WXUVZFS3CNg8KLSscVYZK8adKkQEEazoS/5/eAqaLWlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6+J97xPstaBoFc4QFETnttjH2F2Of5kutDtOgt3o2Dk=;
 b=O+BkV05evdfeHQmsLLiQ4Vmnzw4OrGmIQ2azMqxCeTc4v+MG2xXSClKWLpQ58KXsLgYrC8Qp5BtuCN2jgC3cMxQfn+zftQWtUGbBMUgI05BSLtlZHS1qdSBaJlXfvTzqG9/LYOOQzdLTHz+k1NlJ5PCzi/PO/OMAQWufjT2QTJg=
Received: from SJ0PR03CA0053.namprd03.prod.outlook.com (2603:10b6:a03:33e::28)
 by BL3PR19MB6537.namprd19.prod.outlook.com (2603:10b6:208:3b9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Wed, 22 Jul
 2026 10:35:07 +0000
Received: from SJ1PEPF000026C6.namprd04.prod.outlook.com
 (2603:10b6:a03:33e:cafe::1a) by SJ0PR03CA0053.outlook.office365.com
 (2603:10b6:a03:33e::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Wed,
 22 Jul 2026 10:35:06 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF000026C6.mail.protection.outlook.com (10.167.244.103) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.5
 via Frontend Transport; Wed, 22 Jul 2026 10:35:06 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 5767340654A;
	Wed, 22 Jul 2026 10:35:04 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 30322822544;
	Wed, 22 Jul 2026 10:35:04 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH 3/4] ASoC: SDCA: Make UMP message size check more robust
Date: Wed, 22 Jul 2026 11:34:59 +0100
Message-ID: <20260722103500.872714-4-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260722103500.872714-1-ckeepax@opensource.cirrus.com>
References: <20260722103500.872714-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C6:EE_|BL3PR19MB6537:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 51626240-2c02-40f5-305b-08dee7dce591
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|61400799027|23010399003|16102099003|22082099003|18002099003|10067099003|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info:
	RmbYB+IQPUMuGXi44lXCX/qsds+DWsPRbls9ETMufNtmGTvC17SOnHRDdXX+Y+9BWK4ARxgCzBkxllHliZlPCAiFPcXY0Bl7Lxn9AphIigmSMg+9e709YIRWJCFj+ex0qJYTlPuUeqtYGtydqfB4dxQRQIxtzLxGOgbQGJosEyOXfWJNaepsLnt19OP4H1x8sjb8zwf7jiKWd6dIG4Gawy4iYIpcAMLn6cHCyYzDRdt9YQ36JYqrTepUJSVvYfE9Cym7AmLSrX0JKgjMm9dIDw2JF/cwC9YwBxNrdeGXG7tbWzyiJ9+2U0vd8ZcRt+2areftuFnR2iD1MMlWYNfKvLpn/QTYdcFT0bsl3xb+TQXzZKu/3GVxpsT1EOi6JThQcJCCUAHnwlv2a0uKa2C6O8Fo5JyatC5ciJZnlzuXhmDpPFvLi6uG2QtKlXyWjfSmvPxi7nOVOdHlH4xW15esRfOaTfrqoqwzsGulde0N8rRhcTq+kMNvjphgAQtqKUaWXti2c63Ilx7KQQJRNDOKU3oXgMZE8CY69pcoD/0GP+nZlwHWsZr8ALwe2xQR+PpfBG/SR4Em8L37S0tsyrgWBkgQbdFlbxUF/BWnQCsHDXSrrOazKfk4J1Kn87Pm9tklFa7sPprL1fvB+YSTTtny+IYasj6qPNeZ8m6wEJn33jxhZ8nuw1zPZRI1aH7YpkEcwg5nxElS0yo60x/9OaxbZQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(61400799027)(23010399003)(16102099003)(22082099003)(18002099003)(10067099003)(56012099006)(11063799006)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	NbRkybnN3s4jl1s4WmTnyFaWxCQKOCQylTX0BN3flckE7c5GPVtXHpsmlhM1IPGkgtyKJIOnqcfcmESPiwT663Dg/urihw3+oBQ/zzeOtAZQfr9WW2DKnvwjEVJX4DYc36wjdbSD0S1UGuxuFvnJGKrKJHNDckdC2sQ8DT8OGmiaOUZA7uqGvxwklQzgPioGxJAOTeS+ZLOS77cu+WpjMHUi/FjEWXxPTblOW2F7uRjC6zb9ZRcE308KHDmW7RIu9OvbsDqpMQYQebxMY/P98jxQFfgNbFoNpa8X/9Et7VK0T05WxXF1e32DMwXaNUFUvxS8ihRJdvrPQcWV/C1BXTQj7di4LsCDZTK8xKrmlHEekhM68L1u7JR+stax/aGRk6Mcjnc5R76QR+0RYp/r8efKFRXCUCPgDrGk5pRdS4lcPqetuQm7T4y+EbPePity
X-Exchange-RoutingPolicyChecked:
	jF8HmW2YUzs89T0V02zSESo6LkQ2qkbooQNcCrHcsYhSAl+hYUZao8/+O8cDmZMVRvM0YeeHs9Vac4v/NnGGdrJklUa9ZhQ3498wivSD/eE88fjR+frdP5RpfgzdfrpfzOqA145/pwRAWdK9MIqZ9No4EdjtGjyl/jKTTtrgrRJoA0LYe70aq3bgD12i5AVIMT7WiWc1ICbwEhUHD9ZVSgDHDYcqyj0fMxv0sfzYkqZJCxTCx/yEaYq1aBRuJDykr45PQv/fGMhYlmL7089FmVcu0DK4W62rHB1NyGK+AM2Z4dP7zBfg3KYet9UCBgjH49lo27X/ZYl/B4xjV4TbGw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 10:35:06.0231
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 51626240-2c02-40f5-305b-08dee7dce591
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF000026C6.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR19MB6537
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEwMiBTYWx0ZWRfX3QOnrnd+H0pF
 +77xc0bdkIL1g2RBWjaA6B8SGZR+4Rrygd3MieLSgh6JF9pxg/21uzE13MvQJJiXgc0Q6qarWbw
 42rdhUIU9oMVq3+FEuA4e8zhYEiXY10=
X-Authority-Analysis: v=2.4 cv=f5l4wuyM c=1 sm=1 tr=0 ts=6a609ce1 cx=c_pps
 a=SBNZrs1CJjyqcQ6ja0jd9g==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=7kdKIpNzXG54ww5W1h8A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEwMiBTYWx0ZWRfXxk1x3CK9iq1J
 AQrdq9k50SzApnIV3mDVeFVc31Nfk/Sj20XwqfJCbxv6OCrU6JJlWn3760DozckoHOtYuTY0clC
 7NyLfArEY1S60h15bYa8K5wsme4ROJ5equoXRUINSE50CVRn4XRVUQOsIPye2FvVHgMtNBvpcJl
 tCxyHuM7boGG2lOBbVsaVBCruMUIwkN0EuRll12WViRD/Ba+5Px290eJYq1vse44ACw5oYGEjVP
 9/6NuSeWZ9jEMuq/tDk6Y5YR7vSb6s7fp1/BXOW5XojXozzfm9/5IOmSlsumN/2XrRHOZUhSNcx
 npS+00K+fnANdfx8ix6nFpjxodZJjC6Un0GC/88IYH+a9qdEsqhfM55ndWaFm9VilFxik/xoCK5
 GsWdeD/XvbRtHXy3UPBwE3vtJ0az2uedA82uPN795MTDFanH1Sy+sKfs326iUiAf9kUk1v4392E
 SkRoI3lHdxhWdYkDWag==
X-Proofpoint-ORIG-GUID: EqO-B1GL_cLNu-B4dJ9x7U97giNvmtVV
X-Proofpoint-GUID: EqO-B1GL_cLNu-B4dJ9x7U97giNvmtVV
X-Proofpoint-Spam-Reason: safe

If message offset was larger than the buffer length the size
check will pass incorrectly. Refactor the check such that it is
more robust to invalid sizes.

Fixes: daab108504be ("ASoC: SDCA: Add UMP buffer helper functions")
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/sdca/sdca_ump.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sdca/sdca_ump.c b/sound/soc/sdca/sdca_ump.c
index a86bb28c6d0ad..82a8bf75bbca5 100644
--- a/sound/soc/sdca/sdca_ump.c
+++ b/sound/soc/sdca/sdca_ump.c
@@ -141,7 +141,7 @@ int sdca_ump_read_message(struct device *dev,
 		return ret;
 	}
 
-	if (msg_len > buf_len - msg_offset) {
+	if (msg_offset + msg_len > buf_len) {
 		dev_err(dev, "%s: message too big for UMP buffer: %d\n",
 			entity->label, msg_len);
 		return -EINVAL;
@@ -207,7 +207,7 @@ int sdca_ump_write_message(struct device *dev,
 	buf_len = sdca_range(range, SDCA_MESSAGEOFFSET_BUFFER_LENGTH, 0);
 	ump_mode = sdca_range(range, SDCA_MESSAGEOFFSET_UMP_MODE, 0);
 
-	if (msg_len > buf_len - msg_offset) {
+	if (msg_offset + msg_len > buf_len) {
 		dev_err(dev, "%s: message too big for UMP buffer: %d\n",
 			entity->label, msg_len);
 		return -EINVAL;
-- 
2.47.3

