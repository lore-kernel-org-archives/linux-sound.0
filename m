Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C990C351C1C;
	Wed,  5 Aug 2026 12:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785933749; cv=fail; b=R0vd4ypZi53HF5BxQolrUhjejiOnuGwEF17a3ryzdj536gJjrqQPm09pwDw0ivrMYR5/vvl101s5xJ8xx6rXsSiAHqydXdK0BG1y2KuV+1bn4tKGxxKvRn3EOEzm/n0zNFU4P7AjURDRozrHPy2rC6zEQI6ChyPy4mzpc/4wgvg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785933749; c=relaxed/simple;
	bh=X4nsh5GvJwRcEC0fIVSzuScBsjiBKoJZ3xy5923rO6M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bxCAC/FdkknH9xePZ2qDLexntDW64iIbw4PH3ov9nB8OU3p30mfCN88RW/3TQtW94+6s0Oox+zOWi7aJVluUN50rcb9RrIgN7u5r1aqe4SNcHSJamlcq9r44FmspGLID0P0gkVFYx71t5JgpYrfp5HGemd/RNYR2hhbC90T2z+w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=q6fBwyzn; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=bctl+LE6; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="q6fBwyzn";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="bctl+LE6"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674HY96F2306777;
	Wed, 5 Aug 2026 07:42:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=cXxXPe8zf3UuaYCpGJIHp1bMvWXiUr5phSf/sD3fPmk=; b=
	q6fBwyznLeqdq6rRVe0io2wlfVa3RMUqqB5VFdtymqqZOgf1Ic+1ilhMdVMBFIi3
	xGB/Bx3jInjY8v4hs5N+TPmt8mqTGSuerR/Qw1W7JLUL8Ui0qS1xnRUTCrZwxsPN
	iKah+o92tjMK5I2n7o8IqjvQXoxfrf1yuw1z4BPoC1Kdk3ugQzyvYe29Mjc4AHf9
	3LCJytvKEiZ5yWtm5HI80SoguQBxtRLrh8CdDGbHFmTlK4qaphIlS0oDSMVha320
	GbdQzui0F6cePfmEMG0Y97FWBxFPsXg6Fu78F9PdnDazK/N0+UNMOJEEnod9ERbJ
	Hyv5LBg/FDJKm2WagS5BuA==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11021104.outbound.protection.outlook.com [40.107.208.104])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4fse6vnmde-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 05 Aug 2026 07:42:17 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aDdg+ke4N6q75MxTkGgD00LmfDRNhg9O5q5oc3vJL2e+ebVrnlsdmeTtiyZz+K9edAi2iurvXhpvWCYZB3pFYDr1Y6c9vzvOpwylky6vnKGa84MLqW4aMvenf/uV//pB9jDxiX1gk8FmH9PdNbjt8bDEovmXusu85I3Pd4oVbQlMlIng2IGc91F5B0o7pm1GlTNDD4w3ZVR/IqgBfqcy/IaajupfiFhqJvO3EONTxN9TTCIGmTJ4llGEukfPEx86nLDc+s0bQ9XuzyZBZEiMAaffHNuwj9bysKz/b7+8OX1LucpvXlV6oA8IX2J3bNQ+FJPkSp69KHRLbG6KDwEp/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cXxXPe8zf3UuaYCpGJIHp1bMvWXiUr5phSf/sD3fPmk=;
 b=eXs7eqaXszQDsy6bI63pbwqnaAmDOtwbzAqGvYd/7nLuQyfpYGlDthkbjcBn9Do2lO2xaw4DKNufTAh4j+bX0ymCFE++5WlR606+i9VTqmHlSLCZKNu/oRKmKJBVfoo3FMF1A83e8NFD3OwQBGPQFFysMF25tXJ24gNoxWPC0WYnI8Oco8Yx5p6eynBfXQJKSIF4wR//aQCg/g23R3miE+ZCzYzei8wReR2VPfGkDt0vGXNgqTwiNkRgal+NwsBpF7O4v5w+r8gpLXDxVCTQeOtEzFrkKhSDEkzjnh+hyp1byaiG6B75LXwB3ARQ+7apI9BQjQ7ms85jLN5YBvpDXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cXxXPe8zf3UuaYCpGJIHp1bMvWXiUr5phSf/sD3fPmk=;
 b=bctl+LE65Kiw92efbJLu4yh3+osqXE+rljWoM5tIsK30lAVnFIpjoK3m1J8W+NkcdatksLSM7VCBcM23H+wGCU79tlFWm7eV7F2q/+EUKPRcPC1kobIOYFt37PASyjTlrr2CiW7m9RDEYL5AdLRR2CFxs2qx0Iampi0BKhXrQuk=
Received: from CH0PR03CA0095.namprd03.prod.outlook.com (2603:10b6:610:cd::10)
 by CH9PR19MB997465.namprd19.prod.outlook.com (2603:10b6:610:343::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Wed, 5 Aug
 2026 12:42:11 +0000
Received: from DS3PEPF0000C381.namprd04.prod.outlook.com
 (2603:10b6:610:cd:cafe::50) by CH0PR03CA0095.outlook.office365.com
 (2603:10b6:610:cd::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.19 via Frontend Transport; Wed, 5
 Aug 2026 12:42:11 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS3PEPF0000C381.mail.protection.outlook.com (10.167.23.11) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.8
 via Frontend Transport; Wed, 5 Aug 2026 12:42:10 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 78BA040654E;
	Wed,  5 Aug 2026 12:42:09 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 62BA5822542;
	Wed,  5 Aug 2026 12:42:09 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, shenghao-ding@ti.com, kevin-lu@ti.com,
        baojun.xu@ti.com, sen@ti.com, niranjan.hy@ti.com,
        oder_chiou@realtek.com, shumingf@realtek.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 1/8] ASoC: SDCA: Tidy up error message
Date: Wed,  5 Aug 2026 13:41:58 +0100
Message-ID: <20260805124205.4152543-2-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C381:EE_|CH9PR19MB997465:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: cb70b4eb-6c87-4e9f-d670-08def2eef7e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|23010399003|7416014|36860700016|376014|22082099003|18002099003|16102099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	v+y6p7x6o2LGHDL6REIArxgQHiJSEv0l0sHDJHGQ/yxKXpQij7/Hg+TW/iaE6ofOsIfPz8GJdOpQUiH77i9kZilFPe+o1zO9yQGPsw282/p+CdDoUS9FGeiNPQSyzrQsY9Q6THI9kOYUeT+T/XJY5D+QlTtkOwna5Gbtuss25fDI8AvSrgfcXJMHnrKW7EEC4QZH+/yq3mBhZDHZGxI212mRiV33HI/xLqLj+hFGpx9pPw+i/kL/rcKUs8NbfGvUjXDSqbNtFhfa0LYhnx5F7o2y3yS51RoAMnsT4Fz0dEdHFJlDnHiDxesKFChqI6I0JqhpUalExGo20/bbM9vR1P+0kn1p+7fR8WHVt34zxWYIcFcVLxakbAMBtKfpN3kmQsqNOo7ff3bNLzlzxNqCjSVvNnv8WVktLCmGTMhHo9CyNGQWbThLj9ih3C0+A9Fv0G954hUNqwrpRGgUkh3JCWXk0pzuXsXMMiMU2kgppd/BQJ1jbEAWDE0w4VBsgzJSZUj4ueGsfNrIRR3ysvfLH8gA/kUxzEpC5qrr8CDvBeEuFsEQljbOHWx+yGtSSytrfY8KEQiap1T8OJBSybKAT4/wBILeYaqa3uurr4iXBmnGQVghjn1xOBIAEJ0fWzuQDqIaBABrH4YgOPr2s2Ffbjbl9gh+IcTpJoyl0ONyIngTofGUc3XrG+rxitwQAd8VBp6BZfcoaT3UKBtRcnepLA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(23010399003)(7416014)(36860700016)(376014)(22082099003)(18002099003)(16102099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	j6eoXjVhMtmUDnSiV9MtPRa3VHjHlgWuom6lJn8Uxf5auzkrfyEMAnVRHe83sCbyAVPrkLwx30hQJt+h/YDhabe6RMOwi4AQx13nbsmfdIOgABhpE7McM79BD2iHDhC2NbXjsFQroC78LUYaWQHpW/Ay572+zdAVAEc78Y3MfTwmrv8zAqWOAncG4KlbVxO+8bxE2926Z2KTmJgIqyEWajagz6y2aF233vLq1FkwQ2cZjuZyodx+gbD8CgyUs6HhIR1vljOv/LEYVE28oavsYlvwdFBjxYAiytUnDBOlmMPZOYpIz84TjsGho5GFQv69YDCVk6eVBCgxzwIcA9Z3O4C666mLQ9ocaCyi5ZWEGuVa+FilgpqEKqja4hQJ0L3/vQJWtRdjv9i4yQ/KY8BqgEWGmKRROTRzhWZbXS7xXoLQ/V20h6v6xWkM4siuFgQZ
X-Exchange-RoutingPolicyChecked:
	J8rGTcfziytlOlydIcd268yjWnDoRundMGNfTfg+2wy+p3HxwRzmkR5W8Oo7n2i41jQeLpQFLlEWsh/lfY2GtMbhhAk215oFNgCo8K1ZhoxgarB5EReLkOXK8m/g2ZhmA25XuOKu57zvB7aI3eAXVG3vLH0JW5gLyOFtxCW2c7ehEKim8LL+AMBUcr61Y8s7dLVq1I5fKJ0SF9bj9X7K4YO6lnFgwCs3sZ2q6wmqWGbBprTDE7H7DxNeztQEWZ6hUPegZwTcT00jzEA+1XNLGr8BIfNeX37cbTcyf5TJRntVps7zplU/jeHZV/N4VQLv9lIZG7KpsJI88PVqP2iBFQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 12:42:10.5401
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cb70b4eb-6c87-4e9f-d670-08def2eef7e0
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS3PEPF0000C381.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH9PR19MB997465
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDEwMiBTYWx0ZWRfX14An48rN84N3
 1tGTPwO4Z0xOKZU/SoLz8k6RWxFIYN0BTG+O8CNj3rBKpU4eZJLs706uLkEnpsTNBWMYxIo5ith
 HIErTH32Z79KIxOhul6dDfMnK8CuHbE=
X-Proofpoint-GUID: 4G0QuCM5rrZrPKaxhILs7uu7zrUbnXRf
X-Proofpoint-ORIG-GUID: 4G0QuCM5rrZrPKaxhILs7uu7zrUbnXRf
X-Authority-Analysis: v=2.4 cv=N+MZ0W9B c=1 sm=1 tr=0 ts=6a732fa9 cx=c_pps
 a=jSq2D0RH6kfjLa8OhrZnlw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=37XQl_cq8Cqo8MCQfbIA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDEwMiBTYWx0ZWRfX78zp3OvYn4R7
 QQhxeoq9r4SaPkLu8aTrhJzMC1wto/fp6unTAjzEMctse3m8v8UaZRiWZ3xyemsWk8TPtK6UhLz
 ZkWdUoPYmDH8R6ryl8GCPXXFzZxT0uvWfAn+OBhCAyVSjWG9ntImaflNPFMoRbBWMmnAlRuPgYT
 8NV0HHV12zLfFDVY9gwzPZ7+GC0BCfgP5F1arF2Ovvk+ZXp4d/u7zEMxBPs2UmKTeSstDRKL7Vs
 ITKUoW8c/EqlhDvqNOZr7c5v1P1zhlqT6R178dAI09Vx9BFvnbYkyZ5Bri1HoX+XpcsBOTENQQb
 w4bhKzvJDOGXkzlKd+wiPvglLbmEfDx6pWtNV3Csqg1vvD98Uwv6IroPmBQtJXbuwWqVc6V1tE9
 xwrw3ogW2HrYbszpQSlOZ2saR8OCquSjgtvIy7oSxcLJDXpkkaqjNN52yshJQM6LNfGqTBh1f8V
 JC+eBws7iLCLAMaulHg==
X-Proofpoint-Spam-Reason: safe

Bring the entity_pde_event() error message slightly more in line with
the other SDCA error messages.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/sdca/sdca_asoc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sdca/sdca_asoc.c b/sound/soc/sdca/sdca_asoc.c
index 9a6c0036b7be3..03486d1c1b2f3 100644
--- a/sound/soc/sdca/sdca_asoc.c
+++ b/sound/soc/sdca/sdca_asoc.c
@@ -458,7 +458,7 @@ static int entity_pde_event(struct snd_soc_dapm_widget *widget,
 					   entity->pde.max_delay,
 					   entity->pde.num_max_delay);
 	if (ret)
-		dev_err(component->dev, "%s: PDE transition %x -> %x failed, err=%d\n",
+		dev_err(component->dev, "%s: pde transition %x -> %x failed: %d\n",
 			entity->label, from, to, ret);
 
 	return ret;
-- 
2.47.3

