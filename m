Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11F63E8C4F;
	Wed, 29 Apr 2026 10:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777459326; cv=fail; b=gMdquX8HWmwU5kKwkWnO1Ifq7ImXuabwpzcZKEGhIsHRX+phhOi9R8lDJpMX7NC2XErgLi5eBQpoV5Fo001f87IgW9PimU/u+60T9YQBchii83awDoZ3ZOtk/UbTzqhC9ALsLQMoN3vWDc056a9js9JFG4F3NLDN0UL0KEaeamg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777459326; c=relaxed/simple;
	bh=F+QsDDC/Cla/fCduHdb+AP4f1cHrEpub4Ax8rKgH8uk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Bme+uKqSgFbrEhVam8cZtOUqq3ubvqZkt/7Ye2mFfae2hwLbEaY4lN2kRsxi6DnvLip+Eagf1GqoulvTgYqLP0inWIP5r1XFJe6EtBJULEeBot/tbkMVGKKlv0DRj+E3C0KvlE2tpKyrWdaJ3/wH8oLln9odVJ1FmdiNV4AMniM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=a9fU2B51; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=ijvbVRcG; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="a9fU2B51";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="ijvbVRcG"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T4mM1b486071;
	Wed, 29 Apr 2026 05:42:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=gXWmGnReMW3aqYKJ
	Kc+wVIscAQlXB6cPs4T2ln9IydI=; b=a9fU2B518+k5Sb7xtSAKtQmJDAItlnAk
	ayy1dsmHVxGnSG1tMKOTVmH2VZCIaP71UOzH51D4cu51HLTEB/ATSxGLCHuMzH10
	373fCdbbJdmefsZjnmS5sNyOuGlpj+6GS1uEiJLCYrpEW3sKNG+tJN0OkZNP+3f7
	LrAIXhuLSAwZdl+kWAkXtUbE69lWoPDE9uc4rvtMWNyOHxw9GBCDUoRx8QAVgRyb
	P+gfx+hKJ7FB+V8owoFhqyKllVVI88b+cwbAj+9SKc6sAaQ164c6/PUuD1yckQzY
	eVtmFlfvoZY34DRMSVUNHkRBl25Upnf04oXtjo2t+5QuqawdxZWG7w==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11022141.outbound.protection.outlook.com [40.93.195.141])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4dru10d0kn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 29 Apr 2026 05:42:02 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ws3RIVCyYq9aVpWExg44yUqqB7hJmNnm/8LcDcXhCmN63KFfmsyrbAza+jVBeozbImTSJ0xDxNnpTkS5DlPapzvJrcfQNpWM/y6squgwW7kEASeeXQNQpm6KG6AvM3+Mw+/SbucOoAn//pp3Oml0f/tPjynJGF5R+6c+d+Oyc+pdf5gFqrhu2XrZuWX52EXrFIORMgUEx9zXgoZdfXj2wvS7fyJdbfXKLwvhpTEbEITLSufL5HzQk2l9AUyV01DB7lmCqwBmc439xayuL9+vfkVuTvSem5PRBuc04iPHRqSvDdO3opIB47WJg0lt3uSV95vl5+QGwLly0E/NduYlJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gXWmGnReMW3aqYKJKc+wVIscAQlXB6cPs4T2ln9IydI=;
 b=gP2fHz2S8o11j9DSkVKaA8yh8tNQxlSroV4DB8RmAk51M52UBB0FYc6jaNSWKEOTgJA/1ywBtCScl/AhDQkF8OzSI7V4Zy8MXMwBUfyDIehhtKTEIwxLZqR6v656snnnKSYvwu1R/v1Dwa1PFne86/W4mbwRp/TF/Wx0UUT0wgsu6kq3wznJrnVC71E5s+MH6XB9mu2lt1csvstYhrjvZva7NNkfiAC7Lqh1ELVbGqDJHZlr8sSxHALmGWx8ZfsF12ksvxbovyDuxQ51tnkbzZTs2R7ctd7xxlY7180K/vyb5vovQumbdJLaxXiCjxQgW/wfddW+xBpYL5HuJHFFcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gXWmGnReMW3aqYKJKc+wVIscAQlXB6cPs4T2ln9IydI=;
 b=ijvbVRcGruMteYJSGC1jgdtmlOaHdvDsXT+EPjWvQS6hmKo6V/9hbRT1vpAu4wzCuHewLmyNKuTRexr1ZYAS6hrYfEJtPhvSs32nwDypA0Jqe9DVNUeZ6vVfoBpUcfk4Jb1Gan3NPbCzYtLAGjzGAqSh2LH6l7ZIfitrukbws2U=
Received: from SJ0PR03CA0293.namprd03.prod.outlook.com (2603:10b6:a03:39e::28)
 by EA3PR19MB9326.namprd19.prod.outlook.com (2603:10b6:303:2af::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.18; Wed, 29 Apr
 2026 10:41:59 +0000
Received: from SJ1PEPF00001CE5.namprd03.prod.outlook.com
 (2603:10b6:a03:39e:cafe::ac) by SJ0PR03CA0293.outlook.office365.com
 (2603:10b6:a03:39e::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.30 via Frontend Transport; Wed,
 29 Apr 2026 10:41:58 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF00001CE5.mail.protection.outlook.com (10.167.242.21) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.18
 via Frontend Transport; Wed, 29 Apr 2026 10:41:58 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id B273C40654A;
	Wed, 29 Apr 2026 10:41:56 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 84DC5820247;
	Wed, 29 Apr 2026 10:41:56 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH] ASoC: cs35l56: Fix hibernate write in runtime resume error path
Date: Wed, 29 Apr 2026 11:41:56 +0100
Message-ID: <20260429104156.2436987-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE5:EE_|EA3PR19MB9326:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 05cc7878-1ce6-4467-6891-08dea5dbf083
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|36860700016|82310400026|376014|16102099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	OBR/Ss6GRgmfg7Cxgsg8Ia1AOO9FQwQHMz1VPcI2XDkUfaU4Q/N0Xcc52sd/BRCQxcptbY3EsrGjpvuK0NJLJJL94bfXxzR/DvvEICJq+TxoGFKxNwaxeE9iPG+EsqcSI1ar0o7MN4AD+pe/buSN1GcU0k0mXNGQM0+MqMLPPGQfqRwcOuPQMtObvDS8gz9bBQg+Yu7WN5eI0EiazJhyGxdCoPiRiOaSLqNCANmIQGVkaP8VuS1reQ/GYVjFRYljdiIKdkKBK9IO6DPB21EB96YeY5JinzGovU6V4YM3hkIPerJyAHPmuXQYS+xAgZpQuBULc772qpk93Js7CPtmSF0iTI4FExN+l/IhVhgl/rzJzwq8/EKIJzV1AozgX0ewNOIv2xFCEXEXwRzhvGuH7ZNqd+5ER77H3Dzi6fjpr/1GDr2yU3JaQyhyEZIy+7LYsLqrYbkqIgsdQXH2BD4fZbtFcQ8+i1skdFsPQQorqzoKQixRewD8Wc1yT3EBjrO9SHZWlpAxasdH+yu+RTJDPm0EXF/2HyZGKp4adUrbyxDS5Srlr0kPTyS+taZLmPDbAY+nme+HTxaDuwBOW3RFVq5XZvTEW6CLjGEtp9jkvZrGLCxb+YO4ShAbCKlouQZS4ydgd3gz99GrM3UfEpNTE6ZNOPI/BDCsxyv+USdLhUfi690zCi0D1isKnGLFLUsXPDo0UwF8oQ2CbgSBGNIqK6UtnHRIbUUtvNAwhjyu/wYzFSlTrzqdkRZn5CMRIFdCbBc6A//gGkAkybqCrhURGQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(36860700016)(82310400026)(376014)(16102099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	OA4DjKN0gjUuNGCTD/gU+cnLfddDEBmrfpQyPeasvQLGhy4ciWCAYvCqByW2D/HB7vdWU7aCKAu1mXjSjXGKq+fNFrDQtv2BN6xwQrhlUEaxQdqm5xbm8gyin/SNjBMZKMK6sOS/OHJZ7Ky9R0f4kIOp2j18X4ZsqoOPvnKLZsqEKDDjLJs4I3xvmDr2S0eT9lgD7kyTRi0qt6ZrnfZJsNXCmH4CWW7vMhf1zICIwkwyBDojQaSbBY+dd7aJl5GG7ctL+s8CPUp3EJ+ILbnpEKyuXEeA5mrRnumB7SK9hBonhJjoIzaVXYrTUKoHOAdyXCe8Kpz/bK99D3YZwXeoq/6pH3LR3L7hp/vBya/fTeoG28h0jlDyo2rlBj5hfi/K8gADfIef+43qr4FrPsDDKXmKdPaco72GigT7vQ90NCfzqYo5Fo1xzClb6tvirY7c
X-Exchange-RoutingPolicyChecked:
	aEfKeKxAlFyf6lGp4/0B9AbECQJDar0BZcAioEaewyS+4VbHaItmRw0beQlvUDFd1o/AN/wTTDriD74WpZTIqQjoSv78iuUtiWohp4YFc+ooM/rMT92PXVZI4YyrskF1PH8voFYQH4TsVLS3hi42sbsWT4VEuFRBuZem+k7gp6lZiAEQWqK/vPKQ0d6Pbl9ePYMumYZMAbhSMx/BkV7zfdvij0nQZ1dYzAvcKRv44HS4hCYwrMewhWrQRBqJGLdjhuB0yLXhNxf3qhjuYM+bMkhoXe9WglgCOrLJsgznBvHI1JcAbzKSScDJINYZ2Th3vznMIL3rFZFJ2xWBQ45EXw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 10:41:58.1449
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 05cc7878-1ce6-4467-6891-08dea5dbf083
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF00001CE5.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EA3PR19MB9326
X-Proofpoint-ORIG-GUID: 8jQQpsKBhha7s3qGEQ1PgDfY_i5sFNKC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDEwNyBTYWx0ZWRfX9vS2lsKqorTX
 hvrlHifTNUPr40vWrZSaNWU5swItcjsMDwmxh9rvl22j6XVXb7RGM3Le2dSln38jp2kF6rUoJeS
 T31qeB2+coZoo4eb/p5/1e0w9IN0iJ/z7sLs1YJJYjKd8Fo3rJB9MCYe3iP9n+eJJgcnpjc9rwa
 kePRuMGOftDUNOvgU/3A2Lm+Qmua6Mkn2eBS38hqMwSlOTKodeZ33PoPzlkkeNFNGaOce3sisD3
 sIyDLNhHxD46HtIrD8z0YyXs+98apGIlSR54lM0agzkc/mVMVtE5bt2uRv2isUFLdWRVe/gk3d5
 8I1BMfKokIAHR3DAJbwHfWasMWFFrVm8de+yBuo+TMEKC4jfDCoeYZeoFc5zjmb3RQrZqu8vMM6
 p3elK9ON78kz/9u2wz67SoEDdHyyoDk/5CQF/mL1thcrJt7x5xmH876b1vYQy/gTOD6CSt4STKD
 77us8xZVFMH/+RyfzUA==
X-Authority-Analysis: v=2.4 cv=EuTiaycA c=1 sm=1 tr=0 ts=69f1e07a cx=c_pps
 a=grR+JLqVfS8Y5b128bbGRQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=A5OVakUREuEA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=mH1iOKHdUUto128OOdYA:9
X-Proofpoint-GUID: 8jQQpsKBhha7s3qGEQ1PgDfY_i5sFNKC
X-Proofpoint-Spam-Reason: safe

The error path of cs35l56_runtime_resume_common() should only write
the hibernation sequence if can_hibernate is true.

Something has already gone badly wrong if we ever reach the error
path. But triggering hibernate on hardware that does not support it
is likely to make the situation unrecoverable without a full reboot
necause there might not be any hardware signal to exit hibernate.

Fixes: a47cf4dac7dc ("ASoC: cs35l56: Change hibernate sequence to use allow auto hibernate")
Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l56-shared.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/cs35l56-shared.c b/sound/soc/codecs/cs35l56-shared.c
index 033e56d5e9db..ea724101cdd1 100644
--- a/sound/soc/codecs/cs35l56-shared.c
+++ b/sound/soc/codecs/cs35l56-shared.c
@@ -851,9 +851,11 @@ int cs35l56_runtime_resume_common(struct cs35l56_base *cs35l56_base, bool is_sou
 err:
 	regcache_cache_only(cs35l56_base->regmap, true);
 
-	regmap_multi_reg_write_bypassed(cs35l56_base->regmap,
-					cs35l56_hibernate_seq,
-					ARRAY_SIZE(cs35l56_hibernate_seq));
+	if (cs35l56_base->can_hibernate) {
+		regmap_multi_reg_write_bypassed(cs35l56_base->regmap,
+						cs35l56_hibernate_seq,
+						ARRAY_SIZE(cs35l56_hibernate_seq));
+	}
 
 	return ret;
 }
-- 
2.47.3

