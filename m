Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D31943D9DA2;
	Tue, 28 Apr 2026 11:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777377164; cv=fail; b=uK0+/3Q51iTF7XMLya2+eHWp4a/22aAbUTMLdseAvcRk6MsyL/2Mlx2b8oAPObypIDQI2WQAZ34pj+7j9NSiSSgEvph7IVEmq03CJVVF1WLNUI41gT/mJn21v/WGNwgefxbVxWpbl2fZkgZaXe8BN41GNUKEy/b/hsxUBcuB2R4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777377164; c=relaxed/simple;
	bh=qsj5UEQkLYeMap41rzg2grybAesRy+qYBFw9/q9+BJE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=X0rtTZtABuMshEoByhI/60ji5nHcrsDJB1+ZpxMcdIhS4+BfAMf9bpoEpgkY0g8I54rGZ7DDPl81WIlpHDx1sofkpuJn57ZXwWCYaSdJH7/ROUNWJ+AWWKpg/14bHS/c99dYzAFhZkzCQu+Ada9G4fFAg66NAEyFIlmVk3SLtdQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=KelsnQQx; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=xUd+sULA; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="KelsnQQx";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="xUd+sULA"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S81E3V427299;
	Tue, 28 Apr 2026 06:52:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=pQxt2y6YhzV1r3dq
	uO4XmdJaj5F41hZHDARDiEG/6QQ=; b=KelsnQQxkXmb/lanKf6mEcRuib+R/vgM
	53Brxy2vBqMl1MTciPW0vFz/vnBK9FahDlu7oRBe9HZF2vuZx4Spow96GufuVUqy
	K62jK2f4QrEdcEhSyWEoptPf8GQLiKYLL4V8rWkF/qVMqCIbGbbkqojvPUukpX+J
	KPKXU5ldqfLrD3fcZavt/QZcT3eEEJMWDdDbWR2cuNhdwODzkVNmPWNpdzLjRzHA
	hGckUvuo8W2Xz151IvxY4QPgp1YSOLVNSOYtel1gqU1trT1ixMonDfOoPutPxf0c
	7e8fLWTfSieaijjf3s37m9gQmVO0Yse1FkhbONJ4hV73DT5mdaR6mw==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11022087.outbound.protection.outlook.com [52.101.43.87])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4drt1jky3s-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 28 Apr 2026 06:52:34 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w4MePFkgCmVPVw42X4TS53DRz+vImxrt1g/XUfBamdGf+DwHEd/AUMh5jTtHfEAliZQuXoN+5deP2XDKL4m6P9uD63ko8357AWSMRP48nXa7urWgmJ2O4wC1GjMnj0hk7vJ/g2IDSZCLPeJPsPNMkzK1R/onkDdnc67ZBaJguGlpeHphnxKJw+Yk8XdBv1fSZIE4exqGaDJio41QziUYQP5HDYs3ZMtOoPtqIJY3X/iaeuUBiACoo/B3N0Q+aqV02WVFeTjS53q42yHTOIfZ2W9aF+FQ/6Kb6Ogwurb4RyQxnGlFO97MJCc/MhHJgZ8U2cuaG0FuV5KYaLP+Lv+8Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pQxt2y6YhzV1r3dquO4XmdJaj5F41hZHDARDiEG/6QQ=;
 b=tLfPj6utAtiGNE7983VqCTo8DusbYva++kU3I6Qdmox1ORyUd/Xjqat8j/CmpgcqMOc/5CnwDVNU67dqxLAv/TpF5Lup3kyjXNpbwcARhArg7NmcgRG7csyc2dqgiegXvV0L0Ij5YVTadTNpVccVBq5hYcBLPN1/u1xvLSkyPPfDZLEi0/1neB8B7vi+l9taKsBvCQwYQQbb1BHauXuo7RzTeqV6R9MnNcZNBfdXyMHOgWIic63BRpeLrZz5Y+VFSQNY8Vm7GqbH8Pi6UebXYAeqDO+6G6HaWwD00gFK5M+agzgoSXFzPkvcmpgD4v3MMpyKCFYD2H4RuCc2bRqmqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pQxt2y6YhzV1r3dquO4XmdJaj5F41hZHDARDiEG/6QQ=;
 b=xUd+sULAlWAKjh4aSvIl5AytfpyD4CWr8ZHogq8S78kYvQGBP7i3t9ZKUQqHisINppQHrsB9bUKxWGwRREmGrrIyE6vS0q5XcrJwXZTAON7MLMQWCFPCgBxuLLve71JJawi7LmXMWvqEWpDdb5WgEfWz2WoOYp2aKzEsGL8y61s=
Received: from BLAP220CA0029.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:32c::34)
 by SA0PR19MB4425.namprd19.prod.outlook.com (2603:10b6:806:b3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Tue, 28 Apr
 2026 11:52:30 +0000
Received: from BL6PEPF0001AB55.namprd02.prod.outlook.com
 (2603:10b6:208:32c:cafe::d0) by BLAP220CA0029.outlook.office365.com
 (2603:10b6:208:32c::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.26 via Frontend Transport; Tue,
 28 Apr 2026 11:52:30 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL6PEPF0001AB55.mail.protection.outlook.com (10.167.241.7) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.18
 via Frontend Transport; Tue, 28 Apr 2026 11:52:29 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 92493406540;
	Tue, 28 Apr 2026 11:52:28 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 777C5820247;
	Tue, 28 Apr 2026 11:52:28 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH] ASoC: cs35l56: Fix illegal writes to OTP_MEM registers
Date: Tue, 28 Apr 2026 12:52:28 +0100
Message-ID: <20260428115228.158252-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB55:EE_|SA0PR19MB4425:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b773df2c-f98e-44de-ef16-08dea51ca01d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|36860700016|82310400026|376014|56012099003|16102099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	PWuHkLTO90exKZGK7vstC6pnIXGGXKjk+1ASYG82TB5rdeirKBwFThU0Ad5tzv7oz1hbQ7rVGIALTVCAKbPD+optMZ2nM5OKl87svT41HzPzAZoMtkJlLLi7zVrVfxIA48PCDpNxwjiUf944hxr3bOIEUwQ4azQm+LtALbSuie/xYQjwVbJDN1nNIaNzXSs2SoXCBmIKM6nMTJz8w6ruBZ9IrEejQ6CDizXFjzzuh4qBEUDfd4pRuT0WagTXjB/H0bQM6gVhlHB1du0SZmoqRrD1SXkYUoqluydg2UHTqGyYeommnPfA5iXb0syEmFo6xGEu0ciq0Pw9R0Iu9HTp0ubbQF2Vd6deBGeY0Ybsox04h6oEG9FASJ3xb3yo4bRBsSA6roVE7FUT6mMorKWYCMs4SiN2ggkMSJHIjMvUmSwwdMTrn6Q6KlT9ud/xa0uIfu7xkIDePXITfrWDTx6KLX5383D1vSqGMisHu1ac9vl7KInilsONqug9u21Je9tBGoGjNV3utsRIvGkVObHGKNjgZb7abQAMo+JG8qFdqRo10OKMIAONQUpKVfydjkDZ7BeQJ+873W85r92YYbdVBhIyk3YScu51qMbvmogvCEGMDlJ4O9I4jqpoYnA2kHaX+hNRNFceHOm14pBDAs0cAJkv9eVACD0sc2DStyaITnlASlrLtDPj8P92RBE5QAL2SD01phfwHV8+31UtcKjty36igjrRGNWL0H4dpy4U0uMAuohYbRTxEPwSa6lRfdUCQ7x8sdeIhtiGru9ViQuxWw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(36860700016)(82310400026)(376014)(56012099003)(16102099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	bIwFIMjjBJkgOT9UYT2Wv0Johfjqae0Irfime0zfJugPs6Mk+cUVITpo/mOwfLLKpWOKu2Nunvgl5fjSD4PyHpliLRppS610ZA5Bz+ETRZXWXpWMyK742nZR22dwjOQEBMgoXjaJUeTE46xedXZ69TRrAq+BtlleG9OWcVjIOVM5XXMR3s5G67z3NZss9pdG4VA0/9G+HjlHFdfDNDruSg9nro9wy4c/Fu+1ODbSkfEH9qFkTiOhDmIPk666GefjeQKLaHeIfvqNa+LP9hLbfZrRzRIGcwd9+Gg6EluApsBIRNdwx5nmUrjxFUD6YluI1XRr2jEwgdvub8fo4Lay6QdvzfTLVLCSyyi6dhJciyQ7gPWkQy0Hm7UNhn5Up2ifufHAeN/trBtc+vKF5KURlX8S+XvF2bC2wX37dBQdQRR432U4Dg2TjYm3ufOhHI2w
X-Exchange-RoutingPolicyChecked:
	sIdhyuo0GhjcXAKEp3wajrLyM6ibSy1s+x6cqGvfteuxm5dDfVG/MrjJTQV2gaOR/sXBzdteOrGx321qe2sin8QGNOuXXJFcalJ5e/K+idzAOc0HN1Tl2xKaepNuRxuCSFGcRJ4g5uIYNKXYmyGPwU2c2drmd/tJaqDHRaBXwFWYLdn+WWYE6sIrDanBPSI/vXv9/LSmZ5WPoeHGzi1HzaW8i9A+RPQNMv7Mml4MtqJDqFpJGrdJ1y+CGlIgQELpqUz5Z09mPDEwV+xbqntSrmgYt32lppkzBmXCBUtbEMXqzG2UKI/eiH2DgNFoAMrHZ9BMvCgY8B3bRZeKHaekyw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 11:52:29.5114
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b773df2c-f98e-44de-ef16-08dea51ca01d
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL6PEPF0001AB55.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR19MB4425
X-Authority-Analysis: v=2.4 cv=fbudDUQF c=1 sm=1 tr=0 ts=69f09f82 cx=c_pps
 a=LzkVVAj3Rd1zMMBobGGGjw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=A5OVakUREuEA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=1K9zn4gFvoDAxa7QBCAA:9
X-Proofpoint-GUID: jUSpButyGz2a5t33ku8oFOqG45lhjT75
X-Proofpoint-ORIG-GUID: jUSpButyGz2a5t33ku8oFOqG45lhjT75
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDEwOSBTYWx0ZWRfXxvPgXlRkBXcD
 oJ3KU/VNQorFXfergFMZ4+hdvPQ0NwXufhiezQ/i4siAFpxGi3GFQ49lGq3cM3tjgPZV98UWB/j
 XFbwRE3cx88IvvJbYQTaufipBrLRuZuTyLHGoa/478S9zTMgvltafbVTOnWRMZnC5w6lo17n7bB
 CM37ZtUQiW74rkWtuCwLZRzOAb2JQ4PpcpXgWJGCyjDGycqw9ZRKl8yV7dftnbwdyeCiGIWEQkw
 1cN8Xz0Q4w2poiggQGS6GEbkdnCpOVnRklXugGi1A+al4Yb+f/kNPKukFV3YMTc+krR3X+MCnV+
 VQdHEWyzH5rsfAOeLMctrqTFI2Da3vcZtwraGbViWaQrgcAOBILTgqaUBfiEYQTSEa/R0zr7WbR
 jqI85VG89bQ5pbTH9IP5gNeiraci58blgRlzcVCS/0UlCTBpp7aEcrX6U+AS5voHRKh/ZaVXh+l
 pAFeC/QQMtsXDdMdntg==
X-Proofpoint-Spam-Reason: safe

Mark the OTP_MEM registers as volatile so that regcache_sync() will not
attempt to write to them.

These registers hold a constant, and originally they were marked as
readable non-volatile so that this value would be read into the regmap
cache. The problem with this is regcache_sync() issues a write for any
cached register that does not have a reg_default.

Though these registers are constants and writing them in normal use
cannot change OTP, it is illegal for the host to write to them.

Fixes: e1830f66f6c6 ("ASoC: cs35l56: Add helper functions for amp calibration")
Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l56-shared.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/cs35l56-shared.c b/sound/soc/codecs/cs35l56-shared.c
index e05d975ba794..033e56d5e9db 100644
--- a/sound/soc/codecs/cs35l56-shared.c
+++ b/sound/soc/codecs/cs35l56-shared.c
@@ -108,8 +108,6 @@ int cs35l56_set_patch(struct cs35l56_base *cs35l56_base)
 EXPORT_SYMBOL_NS_GPL(cs35l56_set_patch, "SND_SOC_CS35L56_SHARED");
 
 static const struct reg_default cs35l56_reg_defaults[] = {
-	/* no defaults for OTP_MEM - first read populates cache */
-
 	{ CS35L56_ASP1_ENABLES1,		0x00000000 },
 	{ CS35L56_ASP1_CONTROL1,		0x00000028 },
 	{ CS35L56_ASP1_CONTROL2,		0x18180200 },
@@ -138,8 +136,6 @@ static const struct reg_default cs35l56_reg_defaults[] = {
 };
 
 static const struct reg_default cs35l63_reg_defaults[] = {
-	/* no defaults for OTP_MEM - first read populates cache */
-
 	{ CS35L56_ASP1_ENABLES1,		0x00000000 },
 	{ CS35L56_ASP1_CONTROL1,		0x00000028 },
 	{ CS35L56_ASP1_CONTROL2,		0x18180200 },
@@ -282,6 +278,9 @@ static bool cs35l56_common_volatile_reg(unsigned int reg)
 	case CS35L56_GLOBAL_ENABLES:		   /* owned by firmware */
 	case CS35L56_BLOCK_ENABLES:		   /* owned by firmware */
 	case CS35L56_BLOCK_ENABLES2:		   /* owned by firmware */
+	case CS35L56_OTP_MEM_53:
+	case CS35L56_OTP_MEM_54:
+	case CS35L56_OTP_MEM_55:
 	case CS35L56_SYNC_GPIO1_CFG ... CS35L56_ASP2_DIO_GPIO13_CFG:
 	case CS35L56_UPDATE_REGS:
 	case CS35L56_REFCLK_INPUT:		   /* owned by firmware */
-- 
2.47.3

