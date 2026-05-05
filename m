Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F0C48B36B;
	Tue,  5 May 2026 16:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777997504; cv=fail; b=jqF3C7lY9v8bFN0ZliKE3WQqHI7PjJZGCx05b+PTtsb088CsoYJYrA2YJZfTmFl2QIApOR12rPOLyArSsqURParrLYT6dWKqogeao9xpRg39jm4zdogspDThaRLREcE4ciPent1jSlt/m1tuEIoLLhuyni/A1jPs1V5G1uub03Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777997504; c=relaxed/simple;
	bh=wtXxv8X88SilgH9WNb81KAgOn2lu6/n1QL/pONLQmA8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q9bA4Kqh0BT8MlTY3r02OWC7LhVY5rDrO9hFPP1Q/UfRFvf64uJ4rOjBjw30KdOuv0aGAOKjS/1o4+nwxhQ/QEFVukXCUl/Ec5IzIEQo84uayL5ji1uroxOyjAK77+XvMF2yBz1uPiDrb10saqhIBX7SJ78DCWUQ5HHqgo/i3G8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=T1k/PT4N; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=x2JCXBJM; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="T1k/PT4N";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="x2JCXBJM"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6456Tem51903558;
	Tue, 5 May 2026 11:11:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=oXBPpcPLm3hKx6vqSE+VMx15DBHgSZP0P98rCu4X7Nw=; b=
	T1k/PT4NNvFMiKQSYGwBEbhj/qVXPA7JF3t+8S/lF8roTGbqYeWeQ28NbdlFtF6c
	VAFEraJtaddo8u6XNw0K9XWYnE/Vc4TFw8pkX2JxLtH5cXFabGSfVNPlaaegJwLG
	fEFvMs+2nEoT61JmmzsWO1q2ErvbH2M2n+vnuWnQKx1txeRNnKg2/ENAfZeNWFyG
	xvAquMwxXoGyXjh4JWO5VeSpdaZQtzfZv1Fa7/NeSm4RiF0zmSO5yZAwJ0u+SCVt
	czrhvN3Q5XGTbJ/lQ9abH8OdS4M+x3Uq9WPJCLUT7+iiBOnFVbMlBd7V0v5njBHn
	LnOIC1KLRi0E56f2uN7ttQ==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11022136.outbound.protection.outlook.com [52.101.43.136])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4dwep0utfy-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 05 May 2026 11:11:30 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oPrPvydwhaCxAXMZZlA7B/9OjuxD1UtID3XejAV39/NeA1FtUQyZwrl7Tq/CFTIizuf4GHRAu2nRaHeH9svuygFKBMLt05VzF4KnmygStx6Bgc5KVX8E5MgFHnoU0LJP9spNXzNLbOxnbMaxEyF1HbcfnbvY+achYbY7mfXl2wU6aleB/tFquL10naNsjcGxp6WDFZH01yp/+vCsrKrJIw0sHQAgiA7QwBTD12XrUGq6kMH3qJVNaXYENHtyy0fGYexllLVWvCL3csWYVv58EXupas6tTGveUr6azCqAMyNCFHMmK1nBMT1P7ir5xiZ1R5qHPxatLHzreeboAyQUlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oXBPpcPLm3hKx6vqSE+VMx15DBHgSZP0P98rCu4X7Nw=;
 b=bU5YHw1EVP6IF/rwzdVzDgOJpvR9qBIZyu14lxSjzEwYlBBL33M1FqZT8dMiWuJlJ6iQpEUfyWY+FccWynHyD1T7pMUr6rSgqengEW5ccU3zi0SNAO5gqSRO9LXJctlC1qZo2ODMUQvqq1aiXuYEY82Ni+lJ7+ZEK6ChxomCZE+ZUY4YxqM42GK6scxFrOsT/4v+m4SXQ4X2p75GBDfxwRbVjX0J/WBO2HqWwzILzwvY/aZ5WEAptfmYqxRoOC2j882YwaOxwk3QE9AtEV69fRPhqGyjXr8+Paemc2WZ05Ub9ZCC3+ROk5z+nExqyrK0s5IKUrZ3o6QifMYSGF7mCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oXBPpcPLm3hKx6vqSE+VMx15DBHgSZP0P98rCu4X7Nw=;
 b=x2JCXBJMytfN8yMEkNWHAHpJyFlvy9daQb4b6Ps9bwVFjJj2tIizViH8W0yLaIa89TOFUbh3ppJ5kMKYdnwS5yqsCYYfcUFbJQH7jHHeqn0g7cOuc1JEVSUB6SAxG4voZNRZKIDuQ5bqvrYxd0Zh32jJzcy3L1M2YpDzNbsC+4Y=
Received: from BLAPR05CA0039.namprd05.prod.outlook.com (2603:10b6:208:335::20)
 by CH3PR19MB8330.namprd19.prod.outlook.com (2603:10b6:610:1cb::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.27; Tue, 5 May
 2026 16:11:26 +0000
Received: from BN2PEPF000044A6.namprd04.prod.outlook.com
 (2603:10b6:208:335:cafe::94) by BLAPR05CA0039.outlook.office365.com
 (2603:10b6:208:335::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.15 via Frontend Transport; Tue,
 5 May 2026 16:11:26 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN2PEPF000044A6.mail.protection.outlook.com (10.167.243.100) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.9
 via Frontend Transport; Tue, 5 May 2026 16:11:25 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 052C8406550;
	Tue,  5 May 2026 16:11:25 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id E6AE782025A;
	Tue,  5 May 2026 16:11:24 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v2 1/2] ASoC: cs35l56: Don't use devres to unregister component
Date: Tue,  5 May 2026 17:11:23 +0100
Message-ID: <20260505161124.3621000-2-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260505161124.3621000-1-rf@opensource.cirrus.com>
References: <20260505161124.3621000-1-rf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A6:EE_|CH3PR19MB8330:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f91e1356-b654-4aca-a0a0-08deaac0f571
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|36860700016|82310400026|376014|13003099007|56012099003|22082099003|18002099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	63MOzaI5kFhXSjs+ttgtHsRMBdmK399XJ4+UkhQ3XrS3POb/VVydXo1MXTYmOM3q9zL0Kz1Y5/nNX8j2T2P9ChtJkqAfQnxQlRAm4Jt+Nkt1IH6d8mbXt0W8M1kYPU/4N4GUWAI4jIS4NXrkdkq3YSclbA4cB9LqNgpZGpTv5fT3NC8cehnfI5WQCR9+OtO8yZyu2eS8e+ipQ30Nn2LQQ6kiJiv2hcROVuZLOIAVhcr3oitKLGN0Q4otGXPfXAVgjJYSdvcuY7XKldCLZNF6pCNePkLy2BQ2sjKw1Yw9Vld/k2IH9OLxL9AZ89l0M9Q7uD0ypFzX9vxWGQ6z0n30CR6w1WIwFisW1Ebn/A/UKKoxryEssRpDR5RwNkWmHFY+QG7RyUqHJu1yGoPWZ4S6yi5J2mEyP1872mg6H1h0mJsIAVRNTh5DyVCx8nRoLPfeRB5zWO7uA6lSnTa4YVN+pa08iUow3+J1aflnJgWLmRzv/zrKpRv6RTInWvAibdIF/aKoaKS6/cu5wK9CpsPOlnrhxaNyn3MYqRBZjWpPEWi3IqRiyFO6zNHMq0hQLhJDhR2qTkm6xrZfojGFPLTteF8zri+zT6TfjRXP2jSSKtQdI+tmTZi6LGMbDxP236J9F7EI2GftT1c76pI8epePT+rcLBcrPOe6dPLk641Mm3/X1CpGIUtt7eL8TS48Xiv3
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(36860700016)(82310400026)(376014)(13003099007)(56012099003)(22082099003)(18002099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	q2R9bUnNT43v3DfWlpJ7x+oRDLxe12OhOtAcHV6slRKUGdY+Y+6dOlcGmP9l+U7D45QFpejnqJCy0MhgLadW4HAxGntDj8ullAU3tJXlu0qBmN6I/PqD/cQy6mv2Nx8C9vWcMFhjtDHurDaT6a4SeevtaZCB7HO88pg7mCvvrOyujnDZJpSQ5gYtip4ZBCBBGc7AL2QMQc41KRxG8aB7FTOKrknWdmoguGDnmFuXDvou66CBuQzsjJjqQP2TXWQM4lkNTMrTCggfmkSgvl1GRvPSh+Ga1uJHHGcmclgRcua9HmVmOog8Xmvkx0WK+Ab9OUmK6MJniD7Yq/+I9/+4PXApWym0r/ZoWbO2Ki0pi+D4N9FCWHlH6ncIblRpA3UG/OMeDfq4L890WUqG+gnI8ZK04Jtz9ia4fGJYHJuFJdyMx8p6wZQwMzwnKpBBWeqZ
X-Exchange-RoutingPolicyChecked:
	bwD00cFyOYRlsV/RA+LbXzARPkxsVpJnhrGKO+hofoH/WvFifP+7Zgi3zn726MxzNuHQ2b2ZIH8EilfBgoL0t8Hn2MASgbwCqP32t/xnUtRUpKMvlcVrxZ3JaUNJQS0Lc2OgelG+YWVy+zfSp3+tjUe7rNRpUjqrwwGP/Wsw5nRWHZHbA1V2CfTLzMvKGWFUAo+M/G0wdRaAMX+nrl04kMXhhR8tafb7gs7JRE/xmL1PwDjF1hLtHy9F3QjNEAENod8vtSBn30d3up8jxowyC8x3fCdPo7bL3ZhcGLGSeVVYDOKQJ7dJE93E6/k9g/hZjWp2Kd38jxP5mhRVACsxZQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 16:11:25.9374
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f91e1356-b654-4aca-a0a0-08deaac0f571
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN2PEPF000044A6.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR19MB8330
X-Proofpoint-ORIG-GUID: I1zLdR2QRkxIXuaFxXbvNJndethcbKfT
X-Authority-Analysis: v=2.4 cv=fcCdDUQF c=1 sm=1 tr=0 ts=69fa16b2 cx=c_pps
 a=/d/dYiFJ9j2vSnh1phFeww==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=c92rfblmAAAA:8 a=w1d2syhTAAAA:8 a=Wf-_Xi67x8UVAN6vj-YA:9
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDE1NiBTYWx0ZWRfX+o3lZhgBBbYP
 AUMhuMxnp0vYnrIYrPaPhAstzX3VT4E7MwudWhHlcMsrjwJzBREEY0L7TPZTwCXs+s0qQIU3Vur
 EUGxHZmnlzn+EmkFrPSX04gbRN/BrbS96+Nx3Gyhjt9drODyjOJoRwgflnOJZXslCxi2IEM9fRr
 SvzC730mc/YRX8ANgET+sMfq2x8IyOb8dNT1NZuYymZIfakOxHl26sNz2RiLD0wKI6b5bwzAjCd
 Yv8hdVWJbVuZbnvebARBUIp++JalWfiskRUrUmfx0Gs+p024dvNmfHtVYN2Y//v6y6GW8QcgjrY
 cqIirCGGXqyRl4iOXuGjUP4Dru357bUc/o5SUAM4l0yxXBKstELtRz0NXQIWUds5p0q75Nj53hj
 RVfkO7perrj/DEo9KVokmn3llmlnyIywSeExnLgZS4r99Fg7Lf4TWD6kKby52VzSFP4CyUJ4N9L
 DgPFuqd5mcCMqUjey2g==
X-Proofpoint-GUID: I1zLdR2QRkxIXuaFxXbvNJndethcbKfT
X-Proofpoint-Spam-Reason: safe

Manually call snd_soc_unregister_component() from cs35l56_remove()
instead of using devres cleanup. This ensures that the component is
destroyed before cs35l56_remove() starts cleanup of anything the
component code could be using.

Devres cleanup happens after the driver remove() callback, so if
snd_soc_register_component() is used, it will not be destroyed until
after cs35l56_remove() has returned. But there is some cleanup that
must be done in cs35l56_remove(), or wrapped in a custom devres
cleanup handler to ensure correct ordering. The simplest option is
to call snd_soc_unregister_component() at the start of cs35l56_remove().

Fixes: e49611252900 ("ASoC: cs35l56: Add driver for Cirrus Logic CS35L56")
Closes: https://sashiko.dev/#/patchset/20260501103002.2843735-1-rf%40opensource.cirrus.com
Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
New in V2 series.

 sound/soc/codecs/cs35l56.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index 378017fcea10..e847bb32af2e 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -1956,9 +1956,9 @@ int cs35l56_common_probe(struct cs35l56_private *cs35l56)
 		goto err;
 	}
 
-	ret = devm_snd_soc_register_component(cs35l56->base.dev,
-					      &soc_component_dev_cs35l56,
-					      cs35l56_dai, ARRAY_SIZE(cs35l56_dai));
+	ret = snd_soc_register_component(cs35l56->base.dev,
+					 &soc_component_dev_cs35l56,
+					 cs35l56_dai, ARRAY_SIZE(cs35l56_dai));
 	if (ret < 0) {
 		dev_err_probe(cs35l56->base.dev, ret, "Register codec failed\n");
 		goto err;
@@ -2057,6 +2057,8 @@ EXPORT_SYMBOL_NS_GPL(cs35l56_init, "SND_SOC_CS35L56_CORE");
 
 void cs35l56_remove(struct cs35l56_private *cs35l56)
 {
+	snd_soc_unregister_component(cs35l56->base.dev);
+
 	cs35l56->base.init_done = false;
 
 	/*
-- 
2.47.3

