Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE5A73F9278;
	Thu,  9 Jul 2026 12:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783599754; cv=fail; b=Vz4UgOi8xfnz9rQoxzPuvD4OEPzGif+8ep6Zg9DLBMd5HQ5OvCu8mMGyc1R3cs3DLH5aWQuxBI3hzLO8I2OY5jhe8rsZ2j69RfKGOe/mQ8OHtMdJ/iqGNOXicmURCzqNmMVBieYhgsIIQGNf8AeejCdImmgZhUMwJ2Q7MSTsaIA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783599754; c=relaxed/simple;
	bh=fTKa+wI9/46i117aa3N3i5ARsL1q8Aa554LcHzWpcmI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PoUhwHDNRlszROaBURHTl35YpKZ7Mxn0k5c+NXORWXqDAMAF09mcGb4B8/J+lL8Z7KmoR13+YOwK10v/hTvyLJiTx3bK6R4Axpi52yYG7F6clRsfP8/4kUJA5aelfHclu9/hisk6b6qwAM1mzncXqdzBkdS0vGr0l0JoK4JZIik=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=bnrSGtK9; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=DlKOsPKl; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="bnrSGtK9";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="DlKOsPKl"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6694iH3o3030289;
	Thu, 9 Jul 2026 07:22:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=uvcxwezgYgwow+1s
	SPA+LA8/ARWTHSFduw4Lcxtl5lw=; b=bnrSGtK9Nhg4XchvszMzfcOynCqqlO1K
	pufNqywmYlw6TNOj2q0R5ZXlsUBv/KbBTrKWblv5dLf9SkPJav/te0eBicHQ8qdw
	3cvqZB9Kx5A/ShBPWKNWoavk0hAJrjsjd1oweta6xgyGMWfQqZK2aiqHdNnitlNE
	4AZ7hEk09FQ/K4Sl3MqL+fbVUH8V41kVuGGrDpGkKVt3NIbGDkLLTPLPuUkLJPC7
	RBnz3q6wlKfVq+2rwjB7HnE4aGz1H1qrqy2e0fjN0qhDS/2aFnAJjl3anX+aTsxz
	DTA7/XvdMod4GwO54eXCJsFC0f0XwOCkUGpaQweazVs6f+Up/f5TPg==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11020143.outbound.protection.outlook.com [52.101.46.143])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4f6yjxr4nk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 09 Jul 2026 07:22:24 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vglXTldajsv+G4cGie9dNR8zy1HJk2+O+cVQS1Jiqg+pmwSvDLWcEoFS+VZ/GtaexVhmXLdtzq/Ehz7029moQwE6Sziy9zP267sVRAEE5ChOksH4KRdLqhuUi7oWIQT2zUSDL0cWqH6xLF+7ydOSNZ1QE6ViBnl5E4R5j94IpDson7Xh6IKH/U28p67b2o9i8DdFKjVa1xxRaue5m7Is2K0kx4SDH8J2ZEBKCm5CWrZ2ZLrtMPz33v5x3eqhJLUMzj9u+2BKcAZtjIAFAGdV+1nfSnRjSAbhCcAjcrve5ZzowLwRPL2chggMjwOo5gJ9FS/MJTh/btIuq9FLrsWleQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uvcxwezgYgwow+1sSPA+LA8/ARWTHSFduw4Lcxtl5lw=;
 b=vJvN/gBBQAr3rVwcVoVjbndmAzND3n9uPBB1YEmlUrE9RWMqsRHcZOxj7G7VGiCiLxte7cTtehX1QjRKqozjktUftE1iiZ9JmVRWQ54YN9UEzZOEnOaXrdjsd7Wd27wnjRSxqcS1x+99sWOrHAgr6jb0XxnjkoblGLT+CRyPK3BhTTPhd3l95F73G3I3w1sfs0qAC5N64HYQHQ80AJRkmFaKysQ0K+QKxNDUlj5QxDNAalz4LyIX8Mw5d9Wc+w7/jc8R+0GBjAxf1Qtbe5MwK210dULlMSiQE/SqC425gKpk1E21rDo2FiTdA4biAZBI4anU61vbxJcHwbkGSL2HDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uvcxwezgYgwow+1sSPA+LA8/ARWTHSFduw4Lcxtl5lw=;
 b=DlKOsPKl+5nUv8zj5y7aWI+NFFo4ypZM1//qAlZf8qkHrVBl6HVQXNssH9l1rlbVTDY5ad4Koe3xL9Rdj77w714BihFt8HkiHh8d/Skyamiu0ZG+fJ9F/MuxgicZZ+HfWpKjS3bU+a3yV/ZJ1y9xhgLgJNIhu61T//9h+7G3hic=
Received: from BN9PR03CA0363.namprd03.prod.outlook.com (2603:10b6:408:f7::8)
 by SJ0PR19MB5398.namprd19.prod.outlook.com (2603:10b6:a03:3d2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Thu, 9 Jul
 2026 12:22:21 +0000
Received: from BN3PEPF0000B36E.namprd21.prod.outlook.com
 (2603:10b6:408:f7:cafe::35) by BN9PR03CA0363.outlook.office365.com
 (2603:10b6:408:f7::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.10 via Frontend Transport; Thu, 9
 Jul 2026 12:22:20 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN3PEPF0000B36E.mail.protection.outlook.com (10.167.243.165) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.0
 via Frontend Transport; Thu, 9 Jul 2026 12:22:19 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id EC586406541;
	Thu,  9 Jul 2026 12:22:18 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id D489B82025A;
	Thu,  9 Jul 2026 12:22:18 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: tiwai@suse.com
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH] ALSA: hda: MAINTAINERS: Fix missing cirrus* file reference
Date: Thu,  9 Jul 2026 13:22:11 +0100
Message-ID: <20260709122211.615785-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36E:EE_|SJ0PR19MB5398:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 55f7eb11-2495-424a-3067-08deddb4b8fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|376014|82310400026|23010399003|36860700016|16102099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	YzWm6Adpt6tY+I5gR0v9t4IFrTQBuzHb0e6kU6uwybPCBFDm3Do9z0l/jcZ8IH7fZqL1EY0s7v6atGy2nqh/CVmFPS+ACr2ysQQJ9AiM74XsmDSj951JZdrwFmtYjknW7GphcIhABpGc9Mv0zBsVViVqWWqb9fXmLh7QAc+CbmCJVCd6CAyMppfP/A6SJGYi2qoN8sL4P15Km9fnbeYW+RmqA141/BK4bom4WQ9nsFeFLQszt3tcxiX9yv5f4bvGZA/efDQcrsVVLdyqtvHWzmyBtra+D4fMW7Kw/7c9JF/yKT/TVYgMbuAJlCNl3yTltpI45Yiy9NNUjfxtf02SSYwKe3Slo31bFR58gutYI9oWTS+8rlxZnetBV5cXdgmzotgExpuKqFsmfM9bQfNQmho1kGYVdurwR5equIzlcMUpP2lHV1CxIbBBHY5ykqZ2gH34iXbXCOFU4Cr3zbVOms3atwDEkz+4nwJx3hHp+9MHqawQX+mdr2G7oCdEEFucb8U5QlXv3DrtqVNbQbpGmmxLQw/e6rVsqvJYsQ5sGBbDat/vpXtLeCp9FHVCnxAEIOWNr45Gffg8FPOavRJCeyn8wTldvKe4TUjMyorJ49XIfH1nHQxhuG00ZFUh8pl3QH0bB7GmPqbdQNqXQkK6kXxoAhgnscoVNO2tZf+V5SAnyk8mznAZoSAJ9cQCBF5nKe1WIVRccymZeTJ/fZOxxA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(376014)(82310400026)(23010399003)(36860700016)(16102099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	N9szxI3IAmju/vZfxOD6wyrmZdMLZ2wKtSD+oU531xhgckc6gmhUEyJW6OUgxKmIV1giWveL1V+nHrjX3xKZ4dgkj5C2fPB+bnBa6adIubnodPzv5KHPd4sZRfrYanyJH0Zpwc5bRfO+MuDY8pkkvf1LObqvn0Fd8thlmLE3BbQDhJgjPBPepF6Anyb7BKwLw/Jbmo/UfZ9bTwfZtLpChJ5Iwl5/640/wJfiCA6tnn+emohX+iHWDY/qn2agQ+mbFSjumknWMQrZM3F2/ZQhvXoH8hGx98b2e0v/08NyFGc//+EPLv+sHQSx/tNtTxvZn2/H04jlrj3gHKQJkgMOdKH9D84/IWIthlFGSYte60tR02nEZXcWioD7GD5STHepgtfMjxeF/vKwsYNgpJCstYd89NdyBciXXbaCEjB8z4SvNF+GsnrhLaJ3pzqb06vB
X-Exchange-RoutingPolicyChecked:
	jYaj0bBdLpA0S/Bqky/3lS6flGRui1hGoHBNp+eErkJRADIMQvuMIy+CUgfmLDnluPJlMX3aQfIQ6RtKNot0ISRSL0nLZr3o+FWfOCCOIQgdp1ICZQZziAb2BTNwKtX4SJV55otL9UbEtvuCa90Uuf/oB96nVEZ1iKqAGAGewkIOgdHCfrAEbGY5mFbFbXLXdsCe8xSqcDUHbv9ufSbrqeUQrrhELtuY2mVRdTkAFv5OaCme3++FQgkp8oqQvkcNWZ7L9vYTOAoJoWOmNUi3ExTb5PjCpHFlRMSp53JKDKwBKSCymCZiFcKJ2GvC9U3lNlYfsRVB21ij4lb2itkKMQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 12:22:19.8452
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 55f7eb11-2495-424a-3067-08deddb4b8fc
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN3PEPF0000B36E.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR19MB5398
X-Authority-Analysis: v=2.4 cv=Fo81OWrq c=1 sm=1 tr=0 ts=6a4f9280 cx=c_pps
 a=XSy6xVanZX0hR9uvxkBJyg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=X1oAwugXUDSYErgB91AA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEyMSBTYWx0ZWRfX0nrwtHAy6yfD
 usv41zlSCjguZRL2xmb2S0mFb2Tif0zxW+RRZt2nOiBjN1URNQXZ0oIl6fIGPO40U4lMIuPRhNM
 1ch/LpTR9xG1A6SAlbTLYDIzz2QjL24=
X-Proofpoint-GUID: c-BAnNpc7EFAEVwD3QulGiAW8ncb5BKj
X-Proofpoint-ORIG-GUID: c-BAnNpc7EFAEVwD3QulGiAW8ncb5BKj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEyMSBTYWx0ZWRfXyBbXY7W28x8H
 pgleSFCRvj0u2tKhlNWjEODKBK64jg0ghtV7JHq0IbLo8kek1w8LgdoezP6I65Kav3H9uOXbiv2
 oGGyLML0f9HIYNtru/nyYAnoaT+uVNST5V3CTgvcTzD/Sy2v8X0NbE2ZpaBFFSEKquxKesTKQ5C
 aUG7diFqqe6m7KFYHfUDFwcOIzLYS+AuGn/J1KTb8L5CbSU8Wl0Pkn+r2vZ/kX41BOoiIT+WLk8
 ZGDlOFonv1/+LelnIuQhOONdzxMCDREqQ2A4Pf8gF2qhLu5LjjM99OW3ieK5piupd7yMnry5kni
 JLg25Jd/3zPIiu7Zw08J3zmxfzvvzC5xYL2AYTQgxjOQRwm4ppd81Us38k8JNrOnljxBQe4QfLm
 vtyFQ8JVpJt5XHzvlTqVodn0v76TKV8bBg3fOh1BV6HPRoseCK6FvMBPknUuJl5TkiA8zerlD/J
 2rOLDszVOQPkDJhLjPA==
X-Proofpoint-Spam-Reason: safe

When the HDA source was reorganized some of the cirrus* files were moved
into a new 'side-codecs' subdirectory. But MAINTAINERS wasn't updated to
add a cirrus* file reference to cover these moved files.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 15011f5752a99..56593f52add28 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6209,6 +6209,7 @@ F:	include/dt-bindings/sound/cs*
 F:	include/linux/mfd/cs42l43*
 F:	include/sound/cs*
 F:	sound/hda/codecs/cirrus*
+F:	sound/hda/codecs/side-codecs/cirrus*
 F:	sound/hda/codecs/side-codecs/cs*
 F:	sound/hda/codecs/side-codecs/hda_component*
 F:	sound/soc/codecs/cs*
-- 
2.47.3

