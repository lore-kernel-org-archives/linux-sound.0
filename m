Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 137FA3C6A4B
	for <linux-sound@vger.kernel.org>; Mon, 13 Apr 2026 12:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776084422; cv=fail; b=apFY2QN+4GOLSCPI1MiCWS+r8PcZiYH7APaP5xRODYxckH6zahtMDD71PJKl9w/gMMaxINy3CUXKRrynmUznKwhVhG+QWVO79HqRK1BnEujm3xB6J9Ql3ZtQ9+WAEGAH3J0hh3UBtIQ7Xk2Hf26qkR3FYIjSAZfUWFIRh201Nr4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776084422; c=relaxed/simple;
	bh=POJ/D0nRDbgtRD9HTjdQjYJoYSHcLp4nokKt4gKeOrU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=urpkh4G0RhiNWuZZ542m0jKWjHhkN4GNqRG97REMrG3mxPuWBL6Uy/Y49egPZ+xO+pItWkhfz2l5xTu99YlpzLA9hxNKcupwqsXSm61DJuqwhGaQKgJIe/5wcy8NdfXsjDjmcs/7HmTVRmUVpm8PerULvFEmtxREy/Sd8bF1WfU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=B/HgcGxa; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=WaRkiuHZ; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="B/HgcGxa";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="WaRkiuHZ"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D50WdI139208;
	Mon, 13 Apr 2026 07:46:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=uRBxXjlSUemWv9W4J7GI/9JcsqnRcU6cCDfmcyPoIWs=; b=
	B/HgcGxaQj4+K2mU8QaovzVFPDryT/HRnQtCnP5qV9lteaFJBbphds5WHrOOXXmH
	0yeUtv/8KJl+gUDsyPDw2qS6q5jIj0E3Rj5YuWaQkssUKRN+LFG3a4/U5dQlSFGJ
	v5kW/5Cbyzv1MqNqWdMFgrxEwPcEQK1CBGhMotj9TgsY5hC6+XKysLMfgBf0JrTE
	E4mKQde5qI8GTJqO0ZeSFlHBgSe5DMO01pr5H7YfAt2m0qKOHSgXm0CvBakZahsW
	jY9DxS/BkRiwbu2BJ0Flx/0U/+65IUCPyPbZvzMWWbt2zclOFMw05270ABYrkFl5
	wTYbcBCDT51rbGikrQo7YQ==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11020119.outbound.protection.outlook.com [52.101.193.119])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4dfjqfskq8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 13 Apr 2026 07:46:32 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RYijrPuKvjUAzUtl3lxRNVU21d8rMga1NpFrD/SoFyhkPAa+iNtTdpMkZ+ijXTpBeW98p6NLwWI2pvt4xt0q/dfPSW5S5zLcpXsMWO6QpXSZI/otr4LSYypUlKLqVUSmurmdngAoj8y6mffQR+MCPNuQxefzyKf4VYLAmVn98L+R3BNoNe4oJMlrotNUzXIr9yl+Js7P1o1Law5B7QG39aWu044TpKrIYg1YHNX7B9x/9VVDTASVN7bGTcajeBHN5mB0XNFgdMobo5UT4+bKwmCrwhlVGXtCjxGx9T2rwEkRkgsupU6cc6DAZhWj7k/OcZaq3aldPzL39LiMKQ7aIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uRBxXjlSUemWv9W4J7GI/9JcsqnRcU6cCDfmcyPoIWs=;
 b=Zz0Y8Iu2JoORn8JMyXfCReyltqePDVJ4altme4VHsZHc40bCbgwK4bScIM1JuBjgMxzf86A/uU/E8w6TFIWnoHIoP1PD3sd/Sr8C5gi4HLTcyGw1FU4qo5KS6RyDwBiGdKuBFt4hs8N9FB+VFlg/wH4qtNAvgLKdLZ+CipTdCaglqYjQYoVc+zNtSh+w5m/0gv+VQMutDxP2/H8znJjmfaDLzuma6Kkz+WOHTXMWKMhUVDRWagtktYFThVNkRRyK5VW8DeoDFwfiSIHjmRG3UtgYbPIfbSbhl0VELpCCvcaaGWQ6al59Fou9PU4aVPxYZ3nIFHWIG1cgjuiOm5pKxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uRBxXjlSUemWv9W4J7GI/9JcsqnRcU6cCDfmcyPoIWs=;
 b=WaRkiuHZMRG1qVzlG58GqxCWGfyXzcP7q/eS2soeA3tdEK6nkJuXByah/kSB2IZIXh6qnECct85NmlrUI0hxq5kQ9WBdDDBwC9Ido58YPEHXBj6ad9oCWht5nkEiJHGYu3q+jT5jAH4Ut5cv+KLomYBJeE0s9L3y6xHWUjI44lo=
Received: from CH2PR11CA0008.namprd11.prod.outlook.com (2603:10b6:610:54::18)
 by LV9PR19MB9157.namprd19.prod.outlook.com (2603:10b6:408:2f4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Mon, 13 Apr
 2026 12:46:28 +0000
Received: from CH3PEPF00000010.namprd04.prod.outlook.com
 (2603:10b6:610:54:cafe::33) by CH2PR11CA0008.outlook.office365.com
 (2603:10b6:610:54::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.48 via Frontend Transport; Mon,
 13 Apr 2026 12:46:28 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH3PEPF00000010.mail.protection.outlook.com (10.167.244.41) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.21
 via Frontend Transport; Mon, 13 Apr 2026 12:46:27 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id A918E406543;
	Mon, 13 Apr 2026 12:46:25 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 9201882024B;
	Mon, 13 Apr 2026 12:46:25 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH 1/2] regmap: sdw-mbq: Allow defers on undeferrable controls
Date: Mon, 13 Apr 2026 13:46:20 +0100
Message-ID: <20260413124621.1345315-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260413124621.1345315-1-ckeepax@opensource.cirrus.com>
References: <20260413124621.1345315-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000010:EE_|LV9PR19MB9157:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 9d099c50-d7d6-4fe5-a092-08de995aadbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|61400799027|18002099003|22082099003|56012099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	uh5FgCSFl993wRfe6JfSWQiOomiix2m2VSsHjRKWXhU5oXyRYW2WVYT06xdw8Q7bEttGyDqjZgDWWvKK8hn7ReBIsfdf2yaGibSRoPwhncI1Iz2p4eB+zPTmdF5/UvEXx3SdPUSoYrnfmi8OW8zURX89O05fgGiDy1mNLa8wjF2dD/uswLSXxqHxeSa0QMxRV2RDmKE9P4i6DzZeKNkjiWk2/FnKGSaZz7Kttu5IMtjhegSLNToL9OJYtKKluKEPwCiQpSfXVZB2cA7pqM7yJcFAdEiUjgfWoHtrP05i8bwBW3gvIumOx56AgwB0RAN97LR7DkVKA0o234JWz2yTZbJFpfSzAngWzF7VyiBtytizcq55VA+HqDdkX1oSciP5WBa90bYOortcDl2asvwFq/Skgg3I/iGzHtHrScexbgl6Q2XQc2qunQm7SV+1BE+ofBZLlDvpRaHyYjrFQz0EX2XMpiJWhUIo00cjS9fVY3MQjEGrW5xIrEykXMwlhvrHmETKvefxJQYcpgcyZuglyM3WsR8zvPdxZVJ8bvGZYMFfjsgJRiRw5+kYwPmNEnpWimhln/T81HWaaCr17D8vWQ1VlncxB5wNsiSqHf7LD+Vo8i6F1zzryw9kuL2UR2dobPcda+gyfola9BejHwQxB12ZXTU7iRvb4wJ6m/o3gtCNrkcmLTdq/QciREVEHkAWWMaUITV3rmmLHilL9gfE91BiCOPavUUUjgzIMzgunpJhP+KKqZBc7S1lapNVj5+RlQMdj0+dFHcPvMv9SUNeCg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(61400799027)(18002099003)(22082099003)(56012099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	LK/Av2yqivcbdqHQ0H9ajHSNw4okVW1/SFn+Ji8wU2WvU9kbx1GFcD6pynTd0nw2u25JOX1zAhzeGM5Wi2Bke0qVz3j4kIDAKAJP8TgHHZ5e8dn3xbVh6ICXat2joXMC2OgvafaasylaT60g77f3VuMGujtRqTu+Pi1+FUBq14HoGRk/KzSyAunyghMG9ggyg5sXhRwsCUI7eOsmP2Uhfybdruz9co74JAUzgCxpy6v8iRXssrrOQa/r1kvOQbSJu9E0V2jTBsFfJHZOyR6P7xOnuNc2ZczyvLze4MzIT7wk/gyjwUaKe2+6QvGowrOU5Kzp2tR+DoR3vQCNAYkEGnoGhHSxdcih8DjZ59kiMni86853ZlZkldrpZ7mR4OKqscYul59waWDr8WOlUVNX7vi5aRyADA7eEIBCwKGGYJH87ZZKfLTremiP3dqyVLj9
X-Exchange-RoutingPolicyChecked:
	RmB7sK6Wr4iSMQcX4IotQP8kEuEiMHbenwfH/WsGbZSBTgfDN/bIfbGe3RUCVOB026VedR3ri0mB64AlPEZTgrf0x3paaK5E8nug7A/OIVs3XDUrlFaeLBAIKHkhZcnDvdzFgLBC/15tLuFf19UVTdk3EqReH4GDBbHZFaZY3pO1ZrQwOMsSqAkXCWJLVkn7P4mVxqghF4KcByF8VkAmOTN+uHvlFEZz3v3hIrXm2Mjl6XKG9Jv3ZrSyrK/PCvWxsxl9srMNUQxZ0iAGcX3pHk/O0fObwyqrn2gfYniF1Sgd2v2FL48JMzNPeJJCoIKt0zoh5IwnEuUotB6oacpPWg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2026 12:46:27.1816
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d099c50-d7d6-4fe5-a092-08de995aadbd
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH3PEPF00000010.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR19MB9157
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDEyNiBTYWx0ZWRfX+ZVdYmunq34v
 2PmNIgmqOeb+Pfv4lltZdLq1T+oMQK6L4C/8ETALJvGvl6X5N3sZLcmyt3QfvixHAtbCsv0qmeE
 UxL8EgYwQPK+wHhiLcdh7vj8E4QJ8HyLqZelaz5Lpk6evftg5f+pFOGdX996l+JyeTSaSTj3Eu1
 3+r9vR7y5suSAK29fMHGYxr/aMhxB2dKxoZT7gnsSprm+9qw4otexC96IpA3naN8Su1z4KZzEnl
 BzwFflzAtd/47Bs9R+1JL0eK3Q8wlzg5XDjgDuQytDpyPNpmiLR2ci5wfeqadzj8CqTvEXoBhI2
 85iUHsngvHLN0bctF2xLxEiP0gBEGXMBbQt1B0xrraeCIyjz7fRnpKEQ8dlklUImFwNpxuG9uGL
 b1d/w+b00qhoroV5TMzlsfOeP4g1jFmFI4WkNFt47Wa3qni6BdeOveFQ19uujJ4mjwcrvT/Dvo7
 oU2IhrJNVbMF2kzNoqg==
X-Authority-Analysis: v=2.4 cv=TdumcxQh c=1 sm=1 tr=0 ts=69dce5a8 cx=c_pps
 a=tDId93ursMd3H6XzuY9MuQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=A5OVakUREuEA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=RkYXsAOf6aT8Hpss5kMA:9
X-Proofpoint-GUID: Bj_k4D3adl2PvWPlffSfXq7PrtiifMMj
X-Proofpoint-ORIG-GUID: Bj_k4D3adl2PvWPlffSfXq7PrtiifMMj
X-Proofpoint-Spam-Reason: safe

It is a fairly common DisCo issue to have the deferrability of controls
marked incorrectly and Windows seems very permissive in this regard. As
there isn't really any down side to trying a defer even if the control
isn't deferrable, allow this but add a warning message.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 drivers/base/regmap/regmap-sdw-mbq.c | 36 ++++++++++++++--------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/base/regmap/regmap-sdw-mbq.c b/drivers/base/regmap/regmap-sdw-mbq.c
index 6a61629f5f895..4533fe793c5fd 100644
--- a/drivers/base/regmap/regmap-sdw-mbq.c
+++ b/drivers/base/regmap/regmap-sdw-mbq.c
@@ -74,7 +74,7 @@ static int regmap_sdw_mbq_poll_busy(struct sdw_slave *slave, unsigned int reg,
 
 static int regmap_sdw_mbq_write_impl(struct sdw_slave *slave,
 				     unsigned int reg, unsigned int val,
-				     int mbq_size, bool deferrable)
+				     int mbq_size)
 {
 	int shift = mbq_size * BITS_PER_BYTE;
 	int ret;
@@ -88,17 +88,14 @@ static int regmap_sdw_mbq_write_impl(struct sdw_slave *slave,
 			return ret;
 	}
 
-	ret = sdw_write_no_pm(slave, reg, val & 0xff);
-	if (deferrable && ret == -ENODATA)
-		return -EAGAIN;
-
-	return ret;
+	return sdw_write_no_pm(slave, reg, val & 0xff);
 }
 
 static int regmap_sdw_mbq_write(void *context, unsigned int reg, unsigned int val)
 {
 	struct regmap_mbq_context *ctx = context;
 	struct sdw_slave *slave = ctx->sdw;
+	struct device *dev = ctx->dev;
 	bool deferrable = regmap_sdw_mbq_deferrable(ctx, reg);
 	int mbq_size = regmap_sdw_mbq_size(ctx, reg);
 	int ret;
@@ -113,13 +110,16 @@ static int regmap_sdw_mbq_write(void *context, unsigned int reg, unsigned int va
 	 * process a single wait/timeout on function busy and a single retry
 	 * of the transaction.
 	 */
-	ret = regmap_sdw_mbq_write_impl(slave, reg, val, mbq_size, deferrable);
-	if (ret == -EAGAIN) {
+	ret = regmap_sdw_mbq_write_impl(slave, reg, val, mbq_size);
+	if (ret == -ENODATA) {
+		if (!deferrable)
+			dev_warn(dev, "Defer on undeferrable control: %x\n", reg);
+
 		ret = regmap_sdw_mbq_poll_busy(slave, reg, ctx);
 		if (ret)
 			return ret;
 
-		ret = regmap_sdw_mbq_write_impl(slave, reg, val, mbq_size, false);
+		ret = regmap_sdw_mbq_write_impl(slave, reg, val, mbq_size);
 	}
 
 	return ret;
@@ -127,18 +127,14 @@ static int regmap_sdw_mbq_write(void *context, unsigned int reg, unsigned int va
 
 static int regmap_sdw_mbq_read_impl(struct sdw_slave *slave,
 				    unsigned int reg, unsigned int *val,
-				    int mbq_size, bool deferrable)
+				    int mbq_size)
 {
 	int shift = BITS_PER_BYTE;
 	int read;
 
 	read = sdw_read_no_pm(slave, reg);
-	if (read < 0) {
-		if (deferrable && read == -ENODATA)
-			return -EAGAIN;
-
+	if (read < 0)
 		return read;
-	}
 
 	*val = read;
 
@@ -158,6 +154,7 @@ static int regmap_sdw_mbq_read(void *context, unsigned int reg, unsigned int *va
 {
 	struct regmap_mbq_context *ctx = context;
 	struct sdw_slave *slave = ctx->sdw;
+	struct device *dev = ctx->dev;
 	bool deferrable = regmap_sdw_mbq_deferrable(ctx, reg);
 	int mbq_size = regmap_sdw_mbq_size(ctx, reg);
 	int ret;
@@ -172,13 +169,16 @@ static int regmap_sdw_mbq_read(void *context, unsigned int reg, unsigned int *va
 	 * process a single wait/timeout on function busy and a single retry
 	 * of the transaction.
 	 */
-	ret = regmap_sdw_mbq_read_impl(slave, reg, val, mbq_size, deferrable);
-	if (ret == -EAGAIN) {
+	ret = regmap_sdw_mbq_read_impl(slave, reg, val, mbq_size);
+	if (ret == -ENODATA) {
+		if (!deferrable)
+			dev_warn(dev, "Defer on undeferable control: %x\n", reg);
+
 		ret = regmap_sdw_mbq_poll_busy(slave, reg, ctx);
 		if (ret)
 			return ret;
 
-		ret = regmap_sdw_mbq_read_impl(slave, reg, val, mbq_size, false);
+		ret = regmap_sdw_mbq_read_impl(slave, reg, val, mbq_size);
 	}
 
 	return ret;
-- 
2.47.3

