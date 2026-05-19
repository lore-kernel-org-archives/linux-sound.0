Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3236A481667;
	Tue, 19 May 2026 11:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779190635; cv=fail; b=ZjnJ42jbsjdyYhQAkdhvG0ItNwlOV1K6SgblFt5wlKjh31Mu1fmk/iEtRZjbS2ImjzpBgiRDmmPuTPLRG1IjGyvnP54kZxJHfxnSL7PAchX6Qzo5e02pJ7MqDUVZpzLe4+wYilOjgNYssjCzz3eSf9kRo4b43Aaxa4xXThIf73s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779190635; c=relaxed/simple;
	bh=yU5CcbnM4GC6cyPIE1QsY+DMUsSilaNeLVy+BttZ548=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VI1YpUKBNVcH8i5TttAFqe7BQjYn/jjLqcquXgIDzLEc+NYeQ2Jrbk2+7e0Zoo+WvEkXFskEyXs/LgU+aRRJ8G0HBy4AHm1D2TE29GSsJuWvZKkgeMwmqAlUcB3y39KrxaaEHCCJECOPJuKTv6JixW7Y5jq9E6bpyX6DkcwplGM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=QQXz8k+Q; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=GyGh55nd; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="QQXz8k+Q";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="GyGh55nd"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J4um411262315;
	Tue, 19 May 2026 06:37:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=ombwSrrTkeY3xsKUyF8/i0Hz+MpsfQu369QFp0sK4iQ=; b=
	QQXz8k+Q+l/BkvBbTDbamHx0DKQLwIttKxDesfo2/l7i65xiwujFUI2l2SiqPz0p
	3prjCBC63JCt3asllY7nnpwvYh8IIrheRJVUQFkVrn2EQaB5TK+ZPbDfVFunCwzq
	dlZW9Txc36YD93kWVM0ZWraKAGGTpSfR3p0D2RvuRFZnqcMPh0jp45pc8luSgbHT
	XsgFNq0uRPdLjSgQ1o0aE8RN+Ckx+7+zJ8QJMWig+iA4WT5a1sOx/6RUdOX19899
	zHpJL7Jinidxvw2OkvM4HSHcvRQuU0y7WkaWfeoEeknNsudWPdOZqFYGKst8pzE7
	fCgU2DLM5ZLCuSnzi7dLPg==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11022140.outbound.protection.outlook.com [52.101.43.140])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4e6n0hbftq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 19 May 2026 06:37:10 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JFUlEwpE1DPpU5K9kGR/ZZafyOyYqxeTcaUp7t+TcbpXuIF8ngwnL+UXzDfLneQ6W50b5+U801G0hl18EC0GKjMz4rt7lNeVEzc4wVirrLq8QrOv0BJYzeO8Mg+fJkmQ3hNlx5v0Rddzm3mD00mpg+RMdW4TU71SB9E6ChaT49xh1UHDJt/siJyeGOxWSq9YUFfmvOe2rsKVMrum3vbimtqYZmf+QpN+q2XGKoxKJ69Ww+RctIobf93wLEaT6x3TYwz705YedGJUfDoRKBreUbG7vDI9HhNO2sLV+CUW1LB94LZZPJWYnWSgq1XM99UAB7UGbtKmHedQ/kSeLdE7zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ombwSrrTkeY3xsKUyF8/i0Hz+MpsfQu369QFp0sK4iQ=;
 b=fN14PkDo4sJCk4xdkg917MyyVFHyfjgbVAeUTGCOs+NyV6rZqq0AZQobSPFdYitZ6YH0Sbt089wN169oaLPce8jKde4ugC587goITIGpaX3z5oaoxL9T2UyF7Rv/Z32wzuB6g382BLsxAPIJcb0jb1T0I+JxVV/nK7GIrDfCeBDQndoLGYvtIECOZ5HM/RnvikCx4cXOW5WelMZ2UQdCsygQWVWPwwJ34KoNGHFzuKO8IVliuHTqshYZZUq9hIFl9NYR+im/5mUSOraUY18KB6jMUOuoMAGyjxxWiK4B2dfrZKxEb19e0TdllW943QQ+UgAizLNDbTk1zYMtG/q11Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ombwSrrTkeY3xsKUyF8/i0Hz+MpsfQu369QFp0sK4iQ=;
 b=GyGh55ndUF1zbeZOaaZsE9Ym0P1H+Qiy/IfP0LG7HK23OM+r+8V5BKFoSZF/ISTC+PQOObb+ZetSZiy2r0xBAi+Isoa62vEk1cMOXwTasrT6KMjJnITNZ49M/pBo0Z1XdGzHq71ahgyBkU9/dFtHJHHm9cVnrHntq+0IsH/uUvo=
Received: from SN7PR18CA0016.namprd18.prod.outlook.com (2603:10b6:806:f3::20)
 by BL3PR19MB5290.namprd19.prod.outlook.com (2603:10b6:208:341::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.24; Tue, 19 May
 2026 11:37:05 +0000
Received: from SN1PEPF00036F3F.namprd05.prod.outlook.com
 (2603:10b6:806:f3:cafe::e2) by SN7PR18CA0016.outlook.office365.com
 (2603:10b6:806:f3::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.14 via Frontend Transport; Tue, 19
 May 2026 11:37:05 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF00036F3F.mail.protection.outlook.com (10.167.248.23) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.11
 via Frontend Transport; Tue, 19 May 2026 11:37:04 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 92FBF40654A;
	Tue, 19 May 2026 11:37:03 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.13])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 7F20782026C;
	Tue, 19 May 2026 11:37:03 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v2 2/2] ASoC: cs35l56: Use standard SoundWire regmap implementation
Date: Tue, 19 May 2026 12:37:03 +0100
Message-ID: <20260519113703.393210-3-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260519113703.393210-1-rf@opensource.cirrus.com>
References: <20260519113703.393210-1-rf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3F:EE_|BL3PR19MB5290:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f9f4822f-0b20-43d4-de1c-08deb59af395
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|61400799027|36860700016|376014|3023799003|11063799006|22082099003|16102099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	v4nDtvaovH/u+Anjizml0RNIjugjawgnhYEZkhfIUjEJbJoqMdEpBjC6GtKXzTwTghH3LAhpScJUAarwQ+Gf4xo6FoRsl7KchiU9wLBIonkbhtGYkNCdTCWLC+AlH2yEcQv+tmytf2bZco88hZxI2qC+7GBhznCe/5XHyfravjcLu1RMm/W65MHaafNpOD+ZK4ecTSr00N5ZR2zyqolZb6pN+NCeS9dr76Cnv92kxUDCdSP/ECEYfq/rK8Pl42ZUFBuYIPfNoYmrPsBW6UAf6kZMJNXeUHlQkOvLfu7/FD08+dHZ7q/mrePUp3q6hUdd1SAvlsy4aV05nbl2n6lOJaG5V1Q2vrRI/4zQ/4EikvdTF1TDMXb/IhBh6TA1HWqOR86U9wlY5kkyuevx80qwn31+Plr9ZnvJo3fBmvxn/SLhFUAQ78DX1exJQc9ctP9I304ifa0eDZ+6tF49nvtoBS/yG7DIay7AbBtLVNQsO8uk3yBxgQ+8V0/wzJE8uUmUt7T9YfVhV9jHSqBAwAFmQiuy4BLRvtPApkgFZIZl/j0AYEN5XOGCU5r1KizD+NFM97/eQCCswIYyltCVDaKr+U9uNfzBCskOx3HPHgKfQxCFq8kvEwRvcrMMYWH4wDaZ59JfKKkdWnkq5FvHHKzn/sBpySPCaGW7WXrCR2QX1d7V5X+EzIc46ZBAAOnscZKFHWM/qf95v5pcHWhEKNDJlIHWUixdNHeIib1aE/nq+RQ=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(36860700016)(376014)(3023799003)(11063799006)(22082099003)(16102099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	yd7uuWDm+XPtqFdKHF7nPtiwPVfRmKvxGnBvJIpXBqx/3XJpkPyISPakFf1OpTxuBwXTr+OsG3DsYq/py2JtBdHxrlnM099lFFLtbbRZ0SankDMo4vsnPVW2KVRxmb72gd0+Oen85Ed/U/ggk12/QMNBY3ey4fH2PE0x3SiAbXy2m6usoCbQfenmVtn0tNxvlAx4rzNO6ovgJKZv+MvC5ewPFsIgkeKgKR9pAdEJUWGe7+A//edUlfvZhf3TYg3HxnVqSVXonRVsCnTYE1DMq4EijfjpTDht52FbuOWcKy4o36QVVL+TnLA6D5VWeJbZjXr8N5QnjnNTTxsBaEnE1OAOGOs4nrbaFj7NEWkpOoNwoXtYps7PPOZcPw+9FY5st9uOnXpELbhvFLrD0w3/L0aAhyqlAmiChpozpNuqRpuZF5UjBypPIIH4coiF90J9
X-Exchange-RoutingPolicyChecked:
	pdnk3dWX5uaUIMTRZT6r6RiC++odHcz1zARn45qlFJSJImkp2yIhcQQqBld2WDBOglngQwB+RyHmg7sxiDesWQb+xOmhyVEP2oUZsz/kXN3VwyG2onlSNb8MEsIu+v1VTtk4sj19SUYq0l4MN/Qzj68wRKznqpldFudybMNy3f65Ys8kB9ZB1vANyoDretTQzvgHs2mxRoRXNwPPtH9ZSM6p/M11Kum7UVH206AOKauPgIcS+bFWlqCqNTaYtZu3DnFR/BTPpzSpJ4mae3epIUUEuIjqYx7UTWQvSk5CxcWZN5qPHbYyEQpW6KMPNvuhFr4Y3wK+FPh/1OJF0EA67w==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 11:37:04.6772
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f9f4822f-0b20-43d4-de1c-08deb59af395
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF00036F3F.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR19MB5290
X-Proofpoint-ORIG-GUID: Ukqn7S-rX-s6UfQZE9a3s-8VGfoFZ1Pr
X-Authority-Analysis: v=2.4 cv=Cag4Irrl c=1 sm=1 tr=0 ts=6a0c4b66 cx=c_pps
 a=Qna4ymSQF555k3G5Ibg6fg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=52NS7YWLYOiMMeI0TnwA:9
X-Proofpoint-GUID: Ukqn7S-rX-s6UfQZE9a3s-8VGfoFZ1Pr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDExNSBTYWx0ZWRfX3dY8KHwhWh59
 aYI7KxTof2HtfZYXKr/MGluAwKXgity+LEagQrh1g9MPmy7ZlnoMozBbp+t4bdfW5gN3EcID2Gw
 nHDJIstjAOmFsecbwSHvCOoM4eXaVIxKBvrolwJymT9ARJSxVNs+JCxuaQ+pyhrmLc6OHCG736E
 6BL//GOZ75astKkpm1A3gHUnqkleWmxHt9mivb1+raVFnLMPvkaSi1lXIPrRWfriABsLfIJxtTE
 jsnH9Mgh0AK6zdF+GJJRQfAMChxA3N8z9GQqCeHAf1j/rLmLu8MQFmgp3cGZ+BU+woF8cKz1m91
 YSO5FSaGdYRMlnUBD1Kyukj6LJ5ybF25c/sMITgpWfGojtPFreAl86ujCDaGjbjYPxjQ7GkHE9n
 alRUPr1IZvWsQdkvwTHDTUnJtgflEWU+kWSgT0G2MoFAIEyO5IBCgz549MP2m10uXqtObTTPHgF
 FLil22oMwpKf3xbJbbw==
X-Proofpoint-Spam-Reason: safe

Use the regmap_sdw implementation for SoundWire instead of
re-implementing the low-level bus transactions in cs35l56-sdw.c

The cs35l56 registers are big-endian on I2C and SPI but little-endian
over SoundWire. The firmware files are all big-endian and contain opaque
blobs in big-endian order. So these must be endian-swapped to transfer
over SoundWire. A custom regmap bus implementation is used to do this
endian-swapping.

The original implementation of this custom regmap bus was a complete bus
backend, performing the endian swapping and low-level SoundWire bus
read/write.

This commit changes the custom regmap bus to only perform the endian-swap.
It uses an underlying simple uncached regmap_sdw bus to deal with
transferring the 32-bit registers over the SoundWire bus. Although this
adds a small amount of overhead, from passing through the regmap APIs
twice, it avoids having a local duplicate implementation of what regmap_sdw
already does.

The slow-read handling for OTP registers must access 8-bit SoundWire
registers so it still uses low-level SoundWire bus reads.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
Changed in V2:
- Select REGMAP_SOUNDWIRE

 sound/soc/codecs/Kconfig       |   2 +-
 sound/soc/codecs/cs35l56-sdw.c | 132 ++++++++++++---------------------
 sound/soc/codecs/cs35l56.h     |   1 +
 3 files changed, 51 insertions(+), 84 deletions(-)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 5fdd0334c355..a7c61f7c7f4c 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -887,7 +887,7 @@ config SND_SOC_CS35L56_SPI
 config SND_SOC_CS35L56_SDW
 	tristate "Cirrus Logic CS35L56 CODEC (SDW)"
 	depends on SOUNDWIRE
-	select REGMAP
+	select REGMAP_SOUNDWIRE
 	select SND_SOC_CS35L56
 	select SND_SOC_CS35L56_SHARED
 	help
diff --git a/sound/soc/codecs/cs35l56-sdw.c b/sound/soc/codecs/cs35l56-sdw.c
index d9dcca1e952f..d2b82a846ae8 100644
--- a/sound/soc/codecs/cs35l56-sdw.c
+++ b/sound/soc/codecs/cs35l56-sdw.c
@@ -17,6 +17,7 @@
 #include <linux/string_choices.h>
 #include <linux/swab.h>
 #include <linux/types.h>
+#include <linux/unaligned.h>
 #include <linux/workqueue.h>
 
 #include "cs35l56.h"
@@ -95,55 +96,23 @@ static int cs35l56_sdw_slow_read(struct sdw_slave *peripheral, unsigned int reg,
 	return 0;
 }
 
-static int cs35l56_sdw_read_one(struct sdw_slave *peripheral, unsigned int reg, void *buf)
-{
-	int ret;
-
-	ret = sdw_nread_no_pm(peripheral, reg, 4, (u8 *)buf);
-	if (ret != 0) {
-		dev_err(&peripheral->dev, "Read failed @%#x:%d\n", reg, ret);
-		return ret;
-	}
-
-	swab32s((u32 *)buf);
-
-	return 0;
-}
-
 static int cs35l56_sdw_read(void *context, const void *reg_buf,
 			    const size_t reg_size, void *val_buf,
 			    size_t val_size)
 {
 	struct sdw_slave *peripheral = context;
-	u8 *buf8 = val_buf;
-	unsigned int reg, bytes;
+	struct cs35l56_private *cs35l56 = dev_get_drvdata(&peripheral->dev);
+	unsigned int reg_addr = get_unaligned_le32(reg_buf);
 	int ret;
 
-	reg = le32_to_cpu(*(const __le32 *)reg_buf);
+	if (cs35l56_is_otp_register(reg_addr - CS35L56_SDW_ADDR_OFFSET))
+		return cs35l56_sdw_slow_read(peripheral, reg_addr, (u8 *)val_buf, val_size);
 
-	if (cs35l56_is_otp_register(reg - CS35L56_SDW_ADDR_OFFSET))
-		return cs35l56_sdw_slow_read(peripheral, reg, buf8, val_size);
+	ret = regmap_raw_read(cs35l56->sdw_bus_regmap, reg_addr, val_buf, val_size);
+	if (ret)
+		return ret;
 
-	if (val_size == 4)
-		return cs35l56_sdw_read_one(peripheral, reg, val_buf);
-
-	while (val_size) {
-		bytes = SDW_REG_NO_PAGE - (reg & SDW_REGADDR); /* to end of page */
-		if (bytes > val_size)
-			bytes = val_size;
-
-		ret = sdw_nread_no_pm(peripheral, reg, bytes, buf8);
-		if (ret != 0) {
-			dev_err(&peripheral->dev, "Read failed @%#x..%#x:%d\n",
-				reg, reg + bytes - 1, ret);
-			return ret;
-		}
-
-		swab32_array((u32 *)buf8, bytes / 4);
-		val_size -= bytes;
-		reg += bytes;
-		buf8 += bytes;
-	}
+	swab32_array((u32 *)val_buf, val_size / sizeof(u32));
 
 	return 0;
 }
@@ -157,57 +126,34 @@ static inline void cs35l56_swab_copy(void *dest, const void *src, size_t nbytes)
 		*dest32++ = swab32(*src32++);
 }
 
-static int cs35l56_sdw_write_one(struct sdw_slave *peripheral, unsigned int reg, const void *buf)
-{
-	u32 val_le = swab32(*(u32 *)buf);
-	int ret;
-
-	ret = sdw_nwrite_no_pm(peripheral, reg, 4, (u8 *)&val_le);
-	if (ret != 0) {
-		dev_err(&peripheral->dev, "Write failed @%#x:%d\n", reg, ret);
-		return ret;
-	}
-
-	return 0;
-}
-
 static int cs35l56_sdw_gather_write(void *context,
 				    const void *reg_buf, size_t reg_size,
 				    const void *val_buf, size_t val_size)
 {
 	struct sdw_slave *peripheral = context;
-	const u8 *src_be = val_buf;
-	u32 val_le_buf[64];	/* Define u32 so it is 32-bit aligned */
-	unsigned int reg, bytes;
+	struct cs35l56_private *cs35l56 = dev_get_drvdata(&peripheral->dev);
+	unsigned int reg_addr = get_unaligned_le32(reg_buf);
+	u32 swab_buf[64];	/* Define u32 so it is 32-bit aligned */
 	int ret;
 
-	reg = le32_to_cpu(*(const __le32 *)reg_buf);
-
-	if (val_size == 4)
-		return cs35l56_sdw_write_one(peripheral, reg, src_be);
-
-	while (val_size) {
-		bytes = SDW_REG_NO_PAGE - (reg & SDW_REGADDR); /* to end of page */
-		if (bytes > val_size)
-			bytes = val_size;
-		if (bytes > sizeof(val_le_buf))
-			bytes = sizeof(val_le_buf);
-
-		cs35l56_swab_copy(val_le_buf, src_be, bytes);
-
-		ret = sdw_nwrite_no_pm(peripheral, reg, bytes, (u8 *)val_le_buf);
-		if (ret != 0) {
-			dev_err(&peripheral->dev, "Write failed @%#x..%#x:%d\n",
-				reg, reg + bytes - 1, ret);
+	while (val_size > sizeof(swab_buf)) {
+		cs35l56_swab_copy(swab_buf, val_buf, sizeof(swab_buf));
+		ret = regmap_raw_write(cs35l56->sdw_bus_regmap, reg_addr,
+				       swab_buf, sizeof(swab_buf));
+		if (ret)
 			return ret;
-		}
 
-		val_size -= bytes;
-		reg += bytes;
-		src_be += bytes;
+		val_size -= sizeof(swab_buf);
+		reg_addr += sizeof(swab_buf);
+		val_buf += sizeof(swab_buf);
 	}
 
-	return 0;
+	if (val_size == 0)
+		return 0;
+
+	cs35l56_swab_copy(swab_buf, val_buf, val_size);
+
+	return regmap_raw_write(cs35l56->sdw_bus_regmap, reg_addr, swab_buf, val_size);
 }
 
 static int cs35l56_sdw_write(void *context, const void *val_buf, size_t val_size)
@@ -226,7 +172,7 @@ static int cs35l56_sdw_write(void *context, const void *val_buf, size_t val_size
  * byte controls always have the same byte order, and firmware file blobs
  * can be written verbatim.
  */
-static const struct regmap_bus cs35l56_regmap_bus_sdw = {
+static const struct regmap_bus cs35l56_regmap_swab_bus_sdw = {
 	.read = cs35l56_sdw_read,
 	.write = cs35l56_sdw_write,
 	.gather_write = cs35l56_sdw_gather_write,
@@ -234,6 +180,18 @@ static const struct regmap_bus cs35l56_regmap_bus_sdw = {
 	.val_format_endian_default = REGMAP_ENDIAN_BIG,
 };
 
+/* Low-level SoundWire regmap to transfer the data over the bus */
+static const struct regmap_config cs35l56_sdw_bus_regmap = {
+	.name = "sdw-le32",
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.reg_format_endian = REGMAP_ENDIAN_LITTLE,
+	.val_format_endian = REGMAP_ENDIAN_LITTLE,
+	.max_register = CS35L56_DSP1_PMEM_5114 + 0x8000,
+	.cache_type = REGCACHE_NONE,
+};
+
 static int cs35l56_sdw_get_unique_id(struct cs35l56_private *cs35l56)
 {
 	int ret;
@@ -555,8 +513,16 @@ static int cs35l56_sdw_probe(struct sdw_slave *peripheral, const struct sdw_devi
 
 	cs35l56->base.type = ((unsigned int)id->driver_data) & 0xff;
 
-	cs35l56->base.regmap = devm_regmap_init(dev, &cs35l56_regmap_bus_sdw,
-					   peripheral, regmap_config);
+	/* Low-level regmap to transfer read/writes over SoundWire bus */
+	cs35l56->sdw_bus_regmap = devm_regmap_init_sdw(peripheral, &cs35l56_sdw_bus_regmap);
+	if (IS_ERR(cs35l56->sdw_bus_regmap)) {
+		ret = PTR_ERR(cs35l56->sdw_bus_regmap);
+		return dev_err_probe(dev, ret, "Failed to allocate bus register map\n");
+	}
+
+	/* Wrapper regmap to simulate big-endian ordering */
+	cs35l56->base.regmap = devm_regmap_init(dev, &cs35l56_regmap_swab_bus_sdw,
+						peripheral, regmap_config);
 	if (IS_ERR(cs35l56->base.regmap)) {
 		ret = PTR_ERR(cs35l56->base.regmap);
 		return dev_err_probe(dev, ret, "Failed to allocate register map\n");
diff --git a/sound/soc/codecs/cs35l56.h b/sound/soc/codecs/cs35l56.h
index cd71b23b2a3a..d029fa3f8656 100644
--- a/sound/soc/codecs/cs35l56.h
+++ b/sound/soc/codecs/cs35l56.h
@@ -37,6 +37,7 @@ struct cs35l56_private {
 	struct snd_soc_component *component;
 	struct regulator_bulk_data supplies[CS35L56_NUM_BULK_SUPPLIES];
 	struct sdw_slave *sdw_peripheral;
+	struct regmap *sdw_bus_regmap;
 	const char *fallback_fw_suffix;
 	struct work_struct sdw_irq_work;
 	bool sdw_irq_no_unmask;
-- 
2.47.3

