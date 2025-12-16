Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 473DF39B6D4;
	Tue, 16 Dec 2025 13:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765893017; cv=fail; b=PAmKPVu6tloEUTD11Em0831T57d7kWhJ53GkBWQM3+fL9OJCCFL1kJoPIQVQcujh70+nr+kodYW4j8zlnSYT66NxKT/ZuWlbLH+f5BKWw5uHLLRK6xWAoMkhiAnyS+j4o+S5U+KFx4q5fxt1GMDloeClbOe1VX1Z9Jc6mg7aziE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765893017; c=relaxed/simple;
	bh=KM0JTnh2VENd/grmzJ29E+aNnKh7aZWsCnYNh3IziX0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=h0VEbmJ4IAb8krnQ1QM9So/25gGjZ+Yxem0UtZ+1i1YXaqB1DyJ+6nhwGb8rBjSo0ukDw8H89a3ZVRh6EBHF6laAtQZCyX1a5mHDnmgQP5ECTEhpg8qcnEdj786L/bec2hfsaMV2hcWCcUlYb21TADlJM6J3x0hURQraD8IPg0Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=e9CpeSXV; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=WHLiJl/t; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="e9CpeSXV";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="WHLiJl/t"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BG5koJe328239;
	Tue, 16 Dec 2025 07:50:04 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=warxqX6gRAEb4Xtz
	On/aD+LmawBjF0ITJRTtDP6eit8=; b=e9CpeSXVSoaybhJosRUOu2d0vpQ2RYbP
	+swaChy0GVl0LWKz7zN0XGvwyIfpI3Su4BuK4kLommp+Xdql3ornsTz3QNOdVEt8
	wWbVCaSIxU4ja7LY1jMO2lpY3/47YfVjHz+9x8Bt/DzIRfiv0b7w1F3GpWPlKzdX
	k5+BgiLExW23LyF77amn45farnRsTli2JU88Ww6+o73lhRJ1uedza5eBUbSbYOl3
	hF789M3CRLbVd77nHe2/7aKdrpebZoHGhAIeXjnYMdXL+ooSDl+KESqewaptr+nI
	50SHhwklcl5WYX/mzFxd8TWHnvZIQTAJug4vUEGsj/bpmimFJhif8A==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11021109.outbound.protection.outlook.com [40.107.208.109])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4b15ejbdjf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 16 Dec 2025 07:50:04 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YQlrLYljQzCyuxyhV9qAOx00kjQsGe18QB67JfZ/Dm2ZY2e2t4senXEuZLn/43EpLfvspMiFaHCfzF/c+kXbIzTGBINUyAMTkIi5aV+ppA8yvtJfu/IwKpgvgc85PwM5PGGxSQqbT3fdJRIlimuLnCH+RfNlBWry0onpfdEB/EGK1eHTvnUm84BKsiygdPxqmixd3yz7mbLK3HppnaqVGFFSc/AFY1cir73fLtANmNDGm/2OjtzaVjTYu8ktDwSsLUuhuqV2MYO+x6gAA/LUi6gDHkmb7p2wfGN+IC3qOllJetMnM2zvc0veff5NGttcLTWBIDw67Ch2RBQNGBZZlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=warxqX6gRAEb4XtzOn/aD+LmawBjF0ITJRTtDP6eit8=;
 b=ZJ8PbB0fglSGQDFHBO16s7XB1rd+Nrhv9S93W+1NBUQ1c35nOlwYxlsNAWWZKNl3ESdtVGgIZ/ZYUfX/lubFxpTz5yltfIkAPVLkPmwroFybsJ4tZZ8jJqTLww9g3E5Coco51ZFe+hyOhdpp2OMxSxQA4UVXAvw524DX0Yo4+oTjmSD6U+jwqGWtMRcuJ1IYmTBJhcXDwcKtCCPwgF0DdXk8ZpGGj3ajkRq9DEsX8mzen2xelwZ1jARQjDmObmw/6J83in8pCLZVIDZglJMZd7vRMcn6dKpiZASItXWWaOQRhUr8pRbaHhsAHea/GjKuMsKcdLx/v03B9cn9Fr6RPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=warxqX6gRAEb4XtzOn/aD+LmawBjF0ITJRTtDP6eit8=;
 b=WHLiJl/tVI0R0ngInhebU8lYopmw6iGZUEfJAb8tc0WXKtpZSZbMuNvpLCfHdlIvbrVej+s38UC+xu65B3uhZ1oMQpxOwp5gLt0V3b2yE98uKvE/krj9DCYOTGKyk4tDa8hGRlz614lOq+VIt6FCnzFtxD7d5IFV6zX14hD0ONU=
Received: from SN6PR05CA0004.namprd05.prod.outlook.com (2603:10b6:805:de::17)
 by MW6PR19MB8038.namprd19.prod.outlook.com (2603:10b6:303:23f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.11; Tue, 16 Dec
 2025 13:49:57 +0000
Received: from SA2PEPF00003F65.namprd04.prod.outlook.com
 (2603:10b6:805:de:cafe::7e) by SN6PR05CA0004.outlook.office365.com
 (2603:10b6:805:de::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6 via Frontend Transport; Tue,
 16 Dec 2025 13:49:54 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SA2PEPF00003F65.mail.protection.outlook.com (10.167.248.40) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6
 via Frontend Transport; Tue, 16 Dec 2025 13:49:56 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id CC18D406540;
	Tue, 16 Dec 2025 13:49:54 +0000 (UTC)
Received: from lonswws02.ad.cirrus.com (lonswws02.ad.cirrus.com [198.90.188.42])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 875DE820247;
	Tue, 16 Dec 2025 13:49:54 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>
Cc: Niranjan H Y <niranjan.hy@ti.com>, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
        Stefan Binding <sbinding@opensource.cirrus.com>,
        Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: [PATCH v1] ASoC: ops: fix snd_soc_get_volsw for sx controls
Date: Tue, 16 Dec 2025 13:49:20 +0000
Message-ID: <20251216134938.788625-1-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F65:EE_|MW6PR19MB8038:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 4f9b2a31-243c-4538-3370-08de3ca9ff80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|61400799027|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3243wD58HrQKBqWtyleWU1Xx65ubnCfr9Fwe1dSZKvKMgsmbd/jmSjoGCUlV?=
 =?us-ascii?Q?rpQfmwEeCdj+1CFqQWbAxSuon9nMinGxkkHOmclZUK+iks9UBeeepuqDhjXf?=
 =?us-ascii?Q?c4WTixgHf7uW0y1RArbDezCnHWJNVtWyvDZra/SnAB5xzi1llEd8iaWlzrwQ?=
 =?us-ascii?Q?bAGjpeVD4L1iG/GuFmisbw8yyxUyaKtC60o/XVPN5UoNXLT/YqMtWQ7XPRdQ?=
 =?us-ascii?Q?1NjBeFpRzfNRFjrElUZl/Jk5qxVvR1QPlsvchsbmX1aSQFfnZMiGxiNOkjVp?=
 =?us-ascii?Q?BZLqHcs0BdvTDMsICJScWo9yReUyZIl9Vo7qfjJiKSKVw0cy+WkFP9HiQ6Td?=
 =?us-ascii?Q?Zu1QLNU3KGvWVnRCC/yR63z0M28cjNXLEJYKBOU8ytue1dI2OByXgkCo4HJA?=
 =?us-ascii?Q?/V8YnlsWz5lPWAJJp4Q5tBbztrVzlKRfv/sSPSxum0nrQ7xpaPanvR8RtZXY?=
 =?us-ascii?Q?h21Wt2uO0dM/XRa1Xu3Ze5gENxnxjsLGtBHWynJVls6/siwX1xQj8/YVdDga?=
 =?us-ascii?Q?RNAeR6ixYDQygKZdQ8glY01JrcHGQuxxJ8LlMuMVs6euKNTXbg9QUR2LO6zL?=
 =?us-ascii?Q?J+aDfFKhd9PII0BuCLyS4mW9KKuOuQ6s6g12YSTivty6cxLFDnCXQbmunj5n?=
 =?us-ascii?Q?6Sl9LRnp0OBCS0Gv67zIRA2KddOm3sl5Zz1422gJ5d51ibidFbe0zoO4e/JN?=
 =?us-ascii?Q?1W/8DSADMNuKXx3nz2q2cvu5buuOICQnu+Uld+9LL/DoWJBwcHTe6BVs/PcK?=
 =?us-ascii?Q?IsJYABrnWZNI5NPiV2n8d2JsIueVm7ZsswM7yE0V8isPiG9uUZFPHRI/rSsc?=
 =?us-ascii?Q?lxRwbrMwoOvY7QoqAoDS/W+b/dHITTN9NPUEIiF0BLpNysvpG7lFqTRzd36l?=
 =?us-ascii?Q?KaeRktGVmt6ZV0iI+KyAC2ZYOlFeAW0L5dcYvYEECwRCjC9cEyGxoA+704bx?=
 =?us-ascii?Q?AMMDTk+Y7nvwRY5n6ZpBggLsfbjl7xYO79qqbb3xTWAo9aad2J8fcGYyF3Jf?=
 =?us-ascii?Q?uwv7ku0lQXwCOK/t9E/j4NyIliOv0BJrIfmk9PmXFcT5hIp+bSsAwLqHpcM0?=
 =?us-ascii?Q?wMS0GWRufU50JdeNECuwE64zv5A8k8yT1LNWy2TXE2s35Wu4cC/id0gtDFVh?=
 =?us-ascii?Q?dC4AbSPyElBI7LlyefIyq48BPZcl+6L+SqltkY7/pNKvtBcgPfZoVCca1s2o?=
 =?us-ascii?Q?j2/9atEgd7HVmtyJRiuYSpLVdyp+Per9wZJdJT4u7Lrxl+V3w1wVnve3hRzj?=
 =?us-ascii?Q?s+TmiaoK8qDo/qn40lJSYc+oOH1viUOVJyi6+DdFiEZ/j4Se6F2ExCNOFt+S?=
 =?us-ascii?Q?00HNPJA5sctdhXq9gMNhBH18MtaaF8HuVXR1WADChx3/UdDol9zRy8AMfNTZ?=
 =?us-ascii?Q?kcy2hTSCB9HWNCsqeGCdZA+MZ0L7Gl24+/ZH+U8oPl1LFNFzygnV7sqsSbM8?=
 =?us-ascii?Q?yXzUiJza1TW5fQ5ZEJUBUeB6e2KTbC4kCcWX5VmHvQgJCfqQWmckSOBlv4lW?=
 =?us-ascii?Q?s4sAeV9Jl6Wp58iTt50XhKJhXrPaHbo2xM8Cc9eaNiSUZWivb28SjfkD1QL1?=
 =?us-ascii?Q?BCC6DmxkSzTZ2DU+eZk=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(61400799027)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 13:49:56.3964
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f9b2a31-243c-4538-3370-08de3ca9ff80
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SA2PEPF00003F65.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR19MB8038
X-Authority-Analysis: v=2.4 cv=ZZUQ98VA c=1 sm=1 tr=0 ts=6941638c cx=c_pps
 a=0hJHWFAiWqvHUFm5j3G3Dg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=XgZiXsL_g1aib5ZY6hYA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDExOSBTYWx0ZWRfXy9qWDtJfuG8U
 ECUlqYYwEZC+uaOLS3M8ltZyWJmGkcqv7nPDXUi7BDxREYjgwXYxlQFAesxF/52yfmHt+hEf75H
 YSy85saDUQDZn6nJHMIXozY+vL116U9YRF/L+2MG/uB/OptPOEdBpGFYZOosbmYivnsj/QeXmWh
 K6u/nHJYyWItxM3VpP5SFMccSuTGBSxwRwjWSW0o68WqWKdy2O9NHb076fZb/lLLQkoI3FX/2zE
 E7sJnyl40qnB0jXKsYJDs5GPLZ25jLVDctaz1dkWXfY53GbWIOGPeUHvMUMGoyDN5k+rO9IMJsj
 i/PMw9gnM7GOPdlZSiMIdwPCdX5vry1VN4mgRdI+3C1+WIwU+a699bZuNaWZw88rrd+Z0BUzs9Q
 PyfOT01VlKPSwEkkc2OykU6K+Fvy+A==
X-Proofpoint-ORIG-GUID: hhNQwLJNWH5f717rx5s_DhdOwmfplP_y
X-Proofpoint-GUID: hhNQwLJNWH5f717rx5s_DhdOwmfplP_y
X-Proofpoint-Spam-Reason: safe

SX controls are currently broken, since the clamp introduced in
commit a0ce874cfaaa ("ASoC: ops: improve snd_soc_get_volsw") does not
handle SX controls, for example where the min value in the clamp is
greater than the max value in the clamp.

Add clamp parameter to prevent clamping in SX controls.
The nature of SX controls mean that it wraps around 0, with a variable
number of bits, therefore clamping the value becomes complicated and
prone to error.

Fixes 35 kunit tests for soc_ops_test_access.

Fixes: a0ce874cfaaa ("ASoC: ops: improve snd_soc_get_volsw")

Co-developed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 sound/soc/soc-ops.c | 32 ++++++++++++++++++++------------
 1 file changed, 20 insertions(+), 12 deletions(-)

diff --git a/sound/soc/soc-ops.c b/sound/soc/soc-ops.c
index ce86978c158d..624e9269fc25 100644
--- a/sound/soc/soc-ops.c
+++ b/sound/soc/soc-ops.c
@@ -111,7 +111,8 @@ int snd_soc_put_enum_double(struct snd_kcontrol *kcontrol,
 EXPORT_SYMBOL_GPL(snd_soc_put_enum_double);
 
 static int sdca_soc_q78_reg_to_ctl(struct soc_mixer_control *mc, unsigned int reg_val,
-				unsigned int mask, unsigned int shift, int max)
+				   unsigned int mask, unsigned int shift, int max,
+				   bool sx)
 {
 	int val = reg_val;
 
@@ -141,20 +142,26 @@ static unsigned int sdca_soc_q78_ctl_to_reg(struct soc_mixer_control *mc, int va
 }
 
 static int soc_mixer_reg_to_ctl(struct soc_mixer_control *mc, unsigned int reg_val,
-				unsigned int mask, unsigned int shift, int max)
+				unsigned int mask, unsigned int shift, int max,
+				bool sx)
 {
 	int val = (reg_val >> shift) & mask;
 
 	if (mc->sign_bit)
 		val = sign_extend32(val, mc->sign_bit);
 
-	val = clamp(val, mc->min, mc->max);
-	val -= mc->min;
+	if (sx) {
+		val -= mc->min; // SX controls intentionally can overflow here
+		val = min_t(unsigned int, val & mask, max);
+	} else {
+		val = clamp(val, mc->min, mc->max);
+		val -= mc->min;
+	}
 
 	if (mc->invert)
 		val = max - val;
 
-	return val & mask;
+	return val;
 }
 
 static unsigned int soc_mixer_ctl_to_reg(struct soc_mixer_control *mc, int val,
@@ -280,9 +287,10 @@ static int soc_put_volsw(struct snd_kcontrol *kcontrol,
 
 static int soc_get_volsw(struct snd_kcontrol *kcontrol,
 			 struct snd_ctl_elem_value *ucontrol,
-			 struct soc_mixer_control *mc, int mask, int max)
+			 struct soc_mixer_control *mc, int mask, int max, bool sx)
 {
-	int (*reg_to_ctl)(struct soc_mixer_control *, unsigned int, unsigned int, unsigned int, int);
+	int (*reg_to_ctl)(struct soc_mixer_control *, unsigned int, unsigned int,
+			  unsigned int, int, bool);
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	unsigned int reg_val;
 	int val;
@@ -293,16 +301,16 @@ static int soc_get_volsw(struct snd_kcontrol *kcontrol,
 		reg_to_ctl = soc_mixer_reg_to_ctl;
 
 	reg_val = snd_soc_component_read(component, mc->reg);
-	val = reg_to_ctl(mc, reg_val, mask, mc->shift, max);
+	val = reg_to_ctl(mc, reg_val, mask, mc->shift, max, sx);
 
 	ucontrol->value.integer.value[0] = val;
 
 	if (snd_soc_volsw_is_stereo(mc)) {
 		if (mc->reg == mc->rreg) {
-			val = reg_to_ctl(mc, reg_val, mask, mc->rshift, max);
+			val = reg_to_ctl(mc, reg_val, mask, mc->rshift, max, sx);
 		} else {
 			reg_val = snd_soc_component_read(component, mc->rreg);
-			val = reg_to_ctl(mc, reg_val, mask, mc->shift, max);
+			val = reg_to_ctl(mc, reg_val, mask, mc->shift, max, sx);
 		}
 
 		ucontrol->value.integer.value[1] = val;
@@ -371,7 +379,7 @@ int snd_soc_get_volsw(struct snd_kcontrol *kcontrol,
 		(struct soc_mixer_control *)kcontrol->private_value;
 	unsigned int mask = soc_mixer_mask(mc);
 
-	return soc_get_volsw(kcontrol, ucontrol, mc, mask, mc->max - mc->min);
+	return soc_get_volsw(kcontrol, ucontrol, mc, mask, mc->max - mc->min, false);
 }
 EXPORT_SYMBOL_GPL(snd_soc_get_volsw);
 
@@ -413,7 +421,7 @@ int snd_soc_get_volsw_sx(struct snd_kcontrol *kcontrol,
 		(struct soc_mixer_control *)kcontrol->private_value;
 	unsigned int mask = soc_mixer_sx_mask(mc);
 
-	return soc_get_volsw(kcontrol, ucontrol, mc, mask, mc->max);
+	return soc_get_volsw(kcontrol, ucontrol, mc, mask, mc->max, true);
 }
 EXPORT_SYMBOL_GPL(snd_soc_get_volsw_sx);
 
-- 
2.43.0

