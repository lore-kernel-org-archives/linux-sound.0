Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5108A348C51;
	Tue, 19 May 2026 13:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779198889; cv=fail; b=W/BLEtmuzI0yyneXvhiGGvIPPQOM5jo68Fi1Tm7BSp77fdoO5WsRsv7KPRlyPEbrEXGEVANWB8MWACyD1HFmPhU2gSDu1zNWZlUL1ZJxiygt3807uNOHRm5YITpnWoPzoaQ33oh8LqS7Gw5eI8JoHcBSN9WIXe+1E/6rjaqovdA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779198889; c=relaxed/simple;
	bh=ec/9M6OhwYDIcauVGVxyu/spOr6wVeC4O1yOk9HmjxY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nSz9vI+nsz/OY4/5F306Da8enH8KoWQptkS3Hq6KuRo57ZbA0LkM0nK6gETC6l18zY/7RV2H5jEeW32GjQ5LkrRPfoiyFJZ9Juk0xiQ9IIjWM9TQQ/gby4hfltSsv7ypuxWfbwNjZL17ZNgSh3HQkAwZMz69IYvmXUfQhEnPH7g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=FtOhCMv+; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=EI0QUhDi; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="FtOhCMv+";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="EI0QUhDi"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J4f41J1301056;
	Tue, 19 May 2026 08:54:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=MSY6tq0kGwcq6De21sacBNjFsnGN43LEgbMzl8H/zS0=; b=
	FtOhCMv+zJkFOz60K7mY4D/szp7GJUwLmoE/nT5rKReg/lL8SrGPX5wWd59j6pEt
	Ac1x34WISVXcaVjH3TksBrlDS5rj1yPsNRpaUiUjqJu6KzgrN0UQbgjGAz6XFcZf
	K+uZW7Odlgb8Fp1MCbpp2wdUL8XmDf+wWuJo7d456YlC5KUOhnQVIOBZwpXDi2Hc
	BreNSWW8DAnZWB5Ec7Vl5rwvL4X8FlGWzDeCaxgMPeAb0rLLZxHQF3gQPLmj/5yc
	2PpJgMWxgzE9BgWqxmN3srp0K45tIcxeYLP7pSf/fgFyetKGxx2TbZ4MZe2MxkFT
	HCFCVanVKiK2f7QjrVmV1w==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11022097.outbound.protection.outlook.com [40.107.209.97])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4e6p00kpe0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 19 May 2026 08:54:45 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QHbPpRZEmvW0tl2mLKi9HpJWfRC9Y3cO98idubwZrBPCfBSBNstQt8JcCWkiS4SI3ZvRHubMk2cMqnXFZDkcO/tfPtmeN6JkEPz6OutEYTh7Z5q1kz49Jy6GRw+Yu4oK0QT5bcGwkhzIXeXEMA1GoxLe5TJV85x3tbRSTndk7adUzzMls2+8yCiik/3U9SeuEa+U9kmsvDxZJ+sMtmRoyHmDLR5/X5hA6uraWwAa01H2sSwYA0ecC2v/Ni3ZnlVfvjVQFWCRXYbqbMT9Lu124HHLpE/S5iE608yIV9n6fnQInorHGYr4MowSq3PeTZnJh2IVq/wIKr6bDL6sIOAK4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MSY6tq0kGwcq6De21sacBNjFsnGN43LEgbMzl8H/zS0=;
 b=wbRt9cijJ6d3INDXOjvvnnfjhCt4aysuMDTfSxoDnt9qI7k8eOf+7htFAGrwx+7iTEPlmoHZU8D+TlUxUT8U0nJDB4Rr8YmUBmCZrUGcq7MO2gpK74/EZevK1X6ArjxAhEgyAR+ZKL7Lf7fetSDpiD92v9N36QBO7fb8ZkThj+qhRUBjeC/vwPuglDNHdsJwHOuYcGvKpIVoBJWNJokLOPpMM/QmXorhg/Oi+r7gbK/mPUHHKKrCDyfNo4RxwYyXRjezFl+l8a7YH+nA2WTzi2XFU9qMCW+kHj5dy0otG/NuX6O3/a5TTAn8lViR2SC7eDFkWZD4ffjpuodLwiuvcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MSY6tq0kGwcq6De21sacBNjFsnGN43LEgbMzl8H/zS0=;
 b=EI0QUhDiSHZl8q8PEl3Sy+VNiugypBONZBXBcL4yt61lTtuQ+KP3/+z9B7cjO5ROQ0sFz8KXOgqiDkwN6y2dTK0VCVZHqulrEHb58JCcPQ8+YYOMRoU+aP2uM8/E38MInMtJBIBMP89uYl6oZm7GU/GijF5JD0ggYH+oU8VFeHQ=
Received: from CH0PR13CA0035.namprd13.prod.outlook.com (2603:10b6:610:b2::10)
 by PH7PR19MB6561.namprd19.prod.outlook.com (2603:10b6:510:1a7::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Tue, 19 May
 2026 13:54:38 +0000
Received: from CH3PEPF0000000B.namprd04.prod.outlook.com
 (2603:10b6:610:b2:cafe::3e) by CH0PR13CA0035.outlook.office365.com
 (2603:10b6:610:b2::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.15 via Frontend Transport; Tue, 19
 May 2026 13:54:37 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH3PEPF0000000B.mail.protection.outlook.com (10.167.244.38) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.11
 via Frontend Transport; Tue, 19 May 2026 13:54:36 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 5DD82406544;
	Tue, 19 May 2026 13:54:35 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.13])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 4716482025A;
	Tue, 19 May 2026 13:54:35 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v3 1/3] ASoC: cs35l56-shared-test: Subtract reg_base offset in dummy regmap
Date: Tue, 19 May 2026 14:54:33 +0100
Message-ID: <20260519135435.479949-2-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260519135435.479949-1-rf@opensource.cirrus.com>
References: <20260519135435.479949-1-rf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000B:EE_|PH7PR19MB6561:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f4cb1bf2-1f01-4ed4-d241-08deb5ae2a48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|36860700016|376014|22082099003|11063799006|16102099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	W5e/PQLF67jO58YxVW25iQHzOZsM0vK2k4TxBOsw2iJvmathICHaQSXo5FUfbC+sNyX3Tlg6MGyZVmJbt6pzOmlrs/K/lowilyU9hbLac6JFyGbIhfmyUrYTu10UacUN+zErXFHx/hGDmc2bGc+Qg/1DykC8rnY6fkclbMBgvKrRigYRuGNNyE5bGd8PpORLLwDaL//v+eSnYfoDqJr2mYajMHLSzI2NW4Mft/PMOkXgUNPlpJTaXGNrNZN19Z1mNkQ/y13XKZ7dKUCqrtxgb0T7s36dN74GCwSOtCaJlF3MoAtQhBsM4LJ99g1hT72JbAr5IngYpzIcMNkQJSw4EZ/ZO+x+9ri4rEmW/vZYxC7aIaGpSELUS+Hzag6RpBZw2nXV3ZBdUb9IVITP58NTZu8TPY4Oh9rb0yR7j5fJnquu/0qm82g2uRrB0MavgPW/spFC/IGpHIqmJaEFiMoEtWAT1BBU05aws7FOF64k/1W2TaunMOFDwVBt4+iy3O9FhTapnggj2eQxbzWYvPqZ0PQS20TGOKOaIis0OKET6JwvbF50AXgLGoouSztwCK4+xDcWm7dlh0p5Y8+aXXP0nt4wuEeoRjwadIncuXcRVcyqV4hVCIaReMaF3eJ2UWjST05b1YXXd+a9azwZF42JIHP1sVugfp/Z4MAcDRdJE83rg5HMP7ttMZz61pYm3mVnN3P2kE80GflTh0FPt4LBfba5geFI3qBI2ejfee5ypKY=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(36860700016)(376014)(22082099003)(11063799006)(16102099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Fm+tytFkH6JeG9HE3Kk3k7awWwaULVzLahe1yKdIHYXPYPNamVjtLW3Ym7Wwo19/DyjvFLakxPlGUS9B9OCfcRZMXra6peNL1oetCCJc3sxcuruo1nCPsk+M76vUdGEUrMNRKS7J5cLmz0l9q51pXg9zv4lvBIiEjIXVC8TQeaJL7yUrcWJLMBgirknS4ZsUjVNhdgnIRvV6uCIDTqxT7ZVkTqODTQpLCnDf/nzbO15zdTYeCpaEF5TC+EU6b1KBd2PTJn+jlcZ1UdIvPtOIGlv8Hl8WS1nDVJiHxAAsFO/mgKT4brn6tKKRsRVGuJJc86Ht2n4+yk2QkDrWXgCZ7WmsTK9ojDk5M1qp2YpZKrF6xdZv4wF+h3WT8cnzIG1PpvnSZm8Y29rwNnyDMKBnc3778FxXDIM1kqnzIGBnet0IIrkyETfRt6BUfCYiHfez
X-Exchange-RoutingPolicyChecked:
	NNpip2gh7MhRXoGavjFX7yQmhjvxr2XJPSUab3D1b0SN7v1IUlE4/FRqI1a6EZY2T6uyHp3HNnSrfVHSrUQW32cRY39IA/lTndfrBXkXsB0Z6tk1Sukm1sv2f3Xj7dODQgP0taCvJoNovwxCjEfzIayanuNsh1n82cW1ToJ0UXMVVKl64afRs3mdm6FSQyouLjjoxdmz1/NcgoRq9IiD6ukp4sC9ysN0FA8pkZvDsKhgUEyLyAKwedKfub/MvnaJq/CeXhyzX/b7bmneDQJNBRejoLGy4+b9x/5XT0ex6v6ouDDrb9TGTdwYEhVNjDLU3WcJy2LUg/GwZO2vouFbXg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 13:54:36.9187
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f4cb1bf2-1f01-4ed4-d241-08deb5ae2a48
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH3PEPF0000000B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR19MB6561
X-Proofpoint-GUID: lFqGjCcCHS4tgiM47YPvovToCPKUoTH5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDEzNiBTYWx0ZWRfX5kgAsUD8Lxdf
 DPRxdbcDMgfn+owKTsvHOZlNLr6juj3L2D5hD1RuK+em1tJZRuUpIYIFpGJ6h4C8xKKgbIWseDK
 lIzKpNYmAt890Sld3f6oG8T1P2R86vM4C5Iq5BkHmx8/7zBdnvy19JNViHTBsTXp/Yvnc0DgVLi
 weQJ1xeDxGk8L4ndWd0VH1lX2ioJhzojzCKbLg4897Zrgi9ruj+7LNfTArl3eeYtNadbc83rni6
 pfYMHmKkyfpJ33DKS41rGCNgMBk7bH0jFhAlkgpvkiMSzqwbrWaPVOzA4V8Rwly8iMNqVD09HeW
 71X0423GVN/zwisylkdfwCkes6fhpWYGeXVs8EveZRN0ariDH1H1h5ppniTZaRN3GtEOtJK2ADR
 pf40/SKBd9L3dnbB2bM80mPVWavtA+uhkkyoTtS/ECtBZb2LIOg7FQ5LnWbnKUP/+ZjYPwxG1yT
 LsG4FRLKflbAlyQy/BQ==
X-Authority-Analysis: v=2.4 cv=UYBhjqSN c=1 sm=1 tr=0 ts=6a0c6ba5 cx=c_pps
 a=r3te4Imtu9HTTQNar+7i2w==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=ve_jvgD7g6zz6r_kzScA:9
X-Proofpoint-ORIG-GUID: lFqGjCcCHS4tgiM47YPvovToCPKUoTH5
X-Proofpoint-Spam-Reason: safe

Subtract the value of cs35l56 regmap_config->reg_base from addresses
passed into the mock regmap bus.

Chip register addresses transferred over SoundWire are offset by 0x8000
to move them after the address range reserved in the SoundWire spec.

This commit prepares for changing the cs35l56-sdw driver to use
regmap_config->reg_base to add this offset. When that is done the
addresses passed into the mock regmap_bus will include this offset.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
New in V3

 sound/soc/codecs/cs35l56-shared-test.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/codecs/cs35l56-shared-test.c b/sound/soc/codecs/cs35l56-shared-test.c
index cfe7938065f9..8060a275d32b 100644
--- a/sound/soc/codecs/cs35l56-shared-test.c
+++ b/sound/soc/codecs/cs35l56-shared-test.c
@@ -29,6 +29,7 @@ struct cs35l56_shared_test_priv {
 	struct faux_device *gpio_dev;
 	struct cs35l56_shared_test_mock_gpio *gpio_priv;
 	struct regmap *registers;
+	unsigned int reg_offset;
 	struct cs35l56_base *cs35l56_base;
 	u8 applied_pad_pull_state[CS35L56_MAX_GPIO];
 };
@@ -194,6 +195,8 @@ static int cs35l56_shared_test_reg_read(void *context, unsigned int reg, unsigne
 {
 	struct cs35l56_shared_test_priv *priv = context;
 
+	reg -= priv->reg_offset;
+
 	switch (reg) {
 	case CS35L56_SYNC_GPIO1_CFG ... CS35L56_ASP2_DIO_GPIO13_CFG:
 	case CS35L56_GPIO1_CTRL1 ... CS35L56_GPIO13_CTRL1:
@@ -214,6 +217,8 @@ static int cs35l56_shared_test_reg_write(void *context, unsigned int reg, unsign
 {
 	struct cs35l56_shared_test_priv *priv = context;
 
+	reg -= priv->reg_offset;
+
 	switch (reg) {
 	case CS35L56_UPDATE_REGS:
 		return cs35l56_shared_test_updt_gpio_pres(priv, reg, val);
@@ -657,6 +662,7 @@ static int cs35l56_shared_test_case_base_init(struct kunit *test, u8 type, u8 re
 
 	test->priv = priv;
 	priv->test = test;
+	priv->reg_offset = regmap_config->reg_base;
 
 	/* Create dummy amp driver dev */
 	priv->amp_dev = faux_device_create("cs35l56_shared_test_drv", NULL, NULL);
-- 
2.47.3

