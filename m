Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8EEA3B5F48;
	Thu, 21 May 2026 12:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779366326; cv=fail; b=Cg8Y2M61xuaphr7jD0Lp8GTvUu90TWy9MFUUXW5SaIix2XUq4cnLP52nbg6+mpsxONujp/w5/LOIA6upfz2Ko6xWABLeMjGTTPCWR5fcfAlthI4YrBi/SqYLBAkNdUxHhkXNFcJx50J6aiin0LF37XR7JGfGK/olJmOZbzPFVT0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779366326; c=relaxed/simple;
	bh=L5vLK9OyRvBBwbsgzu9f/HiGZV3djIk+zD+tLxJxt+c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=swymgTOsvSuG801aEa8EAfKPBpgQjMmdR4zrOh7vZa3aIZvW/zLxKYq8xOOPSiHsdmdAlcGMt+C3PoRF9eNJGfwqjhJ3MmYgDU3/UkxDeL3Rqj1MUDqUZJOxqldR6ZgNsfw+CyZwfgqFawDpAhvYCJBNSzHif0u7GEbNquxCIEk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=eaAQ1cDP; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=N5EqRoGN; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="eaAQ1cDP";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="N5EqRoGN"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L5j7Qm2907624;
	Thu, 21 May 2026 07:25:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=84GlTw9xr1Z81MgBXDf+UMtk9TEu2VX//+1L0MlWuLI=; b=
	eaAQ1cDPGnKjoLUEM4UtNkyF8GEatS95Kj5JQbjdo54Q/fNvqJ9yZycT0YYL2WF3
	IBuNTpXzNBhplkHEXSwbjNNchrhEjE6arkIHFa1fjOphlSv8O8bZ+uusqEUtygiU
	STio2vB9S3abdlPQffWaZ7GtZfqjdyfQgw6g2XGBfCe1DhMAad8rE5n74+o7MV2Y
	HBn7aipneceNy8oaz0zN2uoZRVIClQHshu51jRd+ZNHcx+U03zEe1lX3gCKsBXlZ
	t70FC91v6znZ/yKWvedEfZTV6fNcitZ5Mm3D23wh5fKpLKoERMLOQSJrrtqMecPn
	0MO+Rvb4g61XrIDFvLh8oA==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11022110.outbound.protection.outlook.com [52.101.43.110])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4e93g1jbpv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 21 May 2026 07:25:19 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SJCklt+8ub01q3am1JHM94WqG3SEagtqjK1RhcacocWCKsqTDK7am0mg1OvuOzx9YssWTf6UtqrL6h5L1Cd5fBY/3xFFUS7GGvTiIbYMxAXBUVEjNfZzp86K9OyDZggKuNG/vjMLcJxfKq3uvM1Ks2DLoRFPyH0SSa5hbhNRSR4cBFuBaCtN9iutT18Xv5pXlYfsa7xyf3886h/ny/icDOS2rcxHJHCzlqQ01JvNy3pPYlIUpsg1wV0O0ZDIN4XmE3HiEdYL46P2NYK6oEbVpGWRqC3lG4lBF3ZFrBMKQuIqS78POf5RYSuGTolPCGg6tiNug6KbNTFCnWVz6ykgNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=84GlTw9xr1Z81MgBXDf+UMtk9TEu2VX//+1L0MlWuLI=;
 b=EKPEkvUNqGSu5pKux2b+46/dhmnYZccd/eQMtx8UE2rHeyZZLiyLP1Z4tbmd/bnPBHbq7WZXKsmym1P6RWJByv0GOVs9v10Mp9Yq+EfcoigCBSxEOy/7LBQkcTBRk0hEB2gE6VvEGPn6YpSvhJJ4ZwXPxbKpk+vhyCQbcBGzs9UCJBhHwSk+zi1A6Itguq3MbnZmPxM2YJSxO1kBhc7dXcTCh1E59snv4vSVuySdRAW4X3sLlQ2usFkRtUhBU/WR9haNQGvj9Gzda1MSUqCEdDx+OSq08RKA+De4nscE7S4NziSt0puPdrCf7QmCrgQSx1KsmRHs16izq6UvWm8Y0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=84GlTw9xr1Z81MgBXDf+UMtk9TEu2VX//+1L0MlWuLI=;
 b=N5EqRoGN1XaJjS+rCYqetHisJmehx2ZV/O3keQgkw1381QnAlGBmPS/tkNuu5+tkKPq2HedobR4jd22HBrr2s76+T6NkKgePdHK5oOqUS95NI3Fj010Dw2DRYKew1t2Rsbfda2xYeTyNRnBon4rugBtklkVh1hSthvYylaz5OlQ=
Received: from BY5PR03CA0002.namprd03.prod.outlook.com (2603:10b6:a03:1e0::12)
 by SJ0PR19MB5480.namprd19.prod.outlook.com (2603:10b6:a03:3d8::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Thu, 21 May
 2026 12:25:14 +0000
Received: from SJ5PEPF000001F1.namprd05.prod.outlook.com
 (2603:10b6:a03:1e0:cafe::5c) by BY5PR03CA0002.outlook.office365.com
 (2603:10b6:a03:1e0::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.16 via Frontend Transport; Thu, 21
 May 2026 12:25:14 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ5PEPF000001F1.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.7 via
 Frontend Transport; Thu, 21 May 2026 12:25:14 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 40C84406544;
	Thu, 21 May 2026 12:25:12 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.13])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 2CBE582026C;
	Thu, 21 May 2026 12:25:12 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 2/3] ASoC: cs-amp-lib: Fix missing dput() after debugfs_lookup()
Date: Thu, 21 May 2026 13:25:10 +0100
Message-ID: <20260521122511.987322-3-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260521122511.987322-1-rf@opensource.cirrus.com>
References: <20260521122511.987322-1-rf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F1:EE_|SJ0PR19MB5480:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 50a7a1ff-8e46-4175-9a2c-08deb73402ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|36860700016|376014|11063799006|18002099003|16102099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	JDTOpHtDJQJ9PJXNZOdkLxFIahOaPrc4O1LF0MmuRURxT+C7WDn+lE1ArgD4YR/dO2j2MNfOpH9ITiRv0/TfTg+/XIEaeY04DP4dzMMhioPzkMMfP2p2ReJw29m35WiOAHpg8Z67omaE9oz1dhIm1WpzQcKJtj9ukKe1PjKFCTsSQlVam9Eq2RrgG5gqRwUTYM8Z2ulkSekWrxQ205+gfWKZQydK+4821z5JcrMeXhhGcSuMMIdwjP72mtFfF4oczLRoAlF6HtmH2qII7Eu3F8cRatyAtcw7Mgh9D2bTfCkDbKyGxjYIad+qhIpM59qE856GjY7tdCiQ/Iuuwo4Xtcrzb9tpQAubVlKl2afaY3b181XqJqECIoQiugHWFZt7lA8CRFPGu3+0djSsNPKo3b4yk+/gCCpNeCSTyaMQlsAWRfYwKGiu3F4+AGbVNLeSALDPvblYJzBVfIDYkXZQiSPLXMLGzvYuH5YCM3St/DxSTE+BtWvkk2KB9ByTASSE6eJHsyYV+Td4amIYilOxu+tomZcD8teex5YYjle4nccGwfns+kTEF4y6kuqiSVcFvNcQkHdULQefO53vcLZBf4M05+NE8xwGF2xHb+YqJki1HH3LHCkAUj04I8VJHSym5G4fFqI26f7R0lHGW4B6xTIeMi88ufHfAQcS18yuz7P8nhUex1c7IuCRlYiq/30FVEqM7pvQUwQFijgb4Xaj1ZkOwojYWZjHDBrRtQC0cAA=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(36860700016)(376014)(11063799006)(18002099003)(16102099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ZonywTtUYlgYyjffUpmMUz+2SjLrMxFR0kuE567nW1r9FPrWbXEVWWEZ4DszYM15H8+JT7ib8w9QqsmYbvjKbqbuG9WLLqu/XOSZuqcn53F8hGWgiDUWJY4/sHXEXI9UZG08CKy/goPkKxfOkgr87hdAMvsQL8jCRuZFGcNv55Q9tQcSKu1dp3/QExoNGUl+hNCOyRhLCtTRy6jx7XwXJvn7XIdLy7Xmdnw1CUfSjiAqG5g4OkJmy2rMTL2bnOwc/9hGvP2kd2A/G4I39tMVbKmiiFlGi+wOU3lPk9neyzPYAEtMLgtciy3v6t2JCFHaE2E7a/LhUcalvE9yfrwT7+xd6nNQKem9wm8WSxyxOJJkMDcROdiKdZSDIbEmkMQztjY4fIqd+a5Em/OH3iJyTgWZvIOcTN7p5LDpIKtjsf/QPzSkXKofWh6cNCo674aW
X-Exchange-RoutingPolicyChecked:
	NtfNNdINCmQNpgAlwPKjarIjdjNNzLwt4CCpgUA4O8I29KeoI/vfvxvD7osTrZm60g/zMZUfe4wHmehs8e4i/7dV2IXysvJUyzyjCnJrgBMKeRSy99nDlwVkNLFBCeo2dni9hFxPLpktC1lmipMjYY8FOI9eEwwTgbXWSlcPpoPAj29y62zRiUkXnryyXue1SN6236x1HoOugLHAyywfs/50IkQFYYsndRdYIpOHep0hes6b0SfJYiRAFhCbWaQAL/56/2Cad9PqG7noCrnKesvNAVP+dDfrMKrDDOfV25syVwjK4eGmdvejzc2sTMLMMyFVbCunU1Nw/LfWkz1Rcw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 12:25:14.0827
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 50a7a1ff-8e46-4175-9a2c-08deb73402ab
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ5PEPF000001F1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR19MB5480
X-Proofpoint-ORIG-GUID: yf6AOARlucfHrqww0TSeVTM1f-z1z-ke
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEyNCBTYWx0ZWRfX1r+6FOaQKi3P
 JKF8rIJYFnGz/HI7j8VGW87BnzEBJflnDaiMotpTOfTYLHyHm5GMRwG5PwODURZXh217sMLlzV+
 16fmtfJkg8CkkGE6sXgKEPnIivTixYMiaw5pSeg7Dv2uioxFp93cBzdIgvBxxOKT0wZ3N0ostWU
 ebIK6lSWG6cw1rsvA6MhNrNmi8K86/eyCqMGNXUmqtupr2BzHKezRs7kfGHupQ8sHQVqJSSMf1O
 Vdi/FmuIGyUCrWZILWpDPFAJJiFc3331VKhOKwWy5SrtCVXCuSDED49G9xws85h9TBIEV0Dbxtk
 ShpshPxs2rg4JtyZXJ2mdL/aQWeEWe/S8xwNJhaDauHsg20em7jOwp3gHtRAwTRqbRVMGGYFWld
 LyTxo7MSyNPVWVat22UPPw57EJ1BNCzanGLPhX8qsg1hcr0FBm5q8dJxFo5bXEDvDEywnwPORHB
 bDKENN+K7aejnVz4y1Q==
X-Authority-Analysis: v=2.4 cv=Wrcb99fv c=1 sm=1 tr=0 ts=6a0ef9af cx=c_pps
 a=R5lJJwLUw69E8voCr07FQA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=649nZLQrhVN-gLmPknIA:9
X-Proofpoint-GUID: yf6AOARlucfHrqww0TSeVTM1f-z1z-ke
X-Proofpoint-Spam-Reason: safe

Rewrite cs_amp_create_debugfs() so that dput() will be called on
a valid dentry returned from debugfs_lookup().

The pointer returned from debugfs_lookup() must be released by dput().
The pointer returned from debugfs_create_dir() does not need to be
passed to dput().

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Fixes: cdd27fa3298a ("ASoC: cs-amp-lib: Add helpers for factory calibration")
---
 sound/soc/codecs/cs-amp-lib.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/cs-amp-lib.c b/sound/soc/codecs/cs-amp-lib.c
index 881c6f2264f3..e97a125ebbb3 100644
--- a/sound/soc/codecs/cs-amp-lib.c
+++ b/sound/soc/codecs/cs-amp-lib.c
@@ -833,11 +833,18 @@ EXPORT_SYMBOL_NS_GPL(cs_amp_devm_get_vendor_specific_variant_id, "SND_SOC_CS_AMP
  */
 struct dentry *cs_amp_create_debugfs(struct device *dev)
 {
-	struct dentry *dir;
+	struct dentry *dir, *created;
 
+	/* debugfs_lookup() can return NULL or ERR_PTR on error */
 	dir = debugfs_lookup("cirrus_logic", NULL);
-	if (!dir)
-		dir = debugfs_create_dir("cirrus_logic", NULL);
+	if (!IS_ERR_OR_NULL(dir)) {
+		created = debugfs_create_dir(dev_name(dev), dir);
+		dput(dir);
+
+		return created;
+	}
+
+	dir = debugfs_create_dir("cirrus_logic", NULL);
 
 	return debugfs_create_dir(dev_name(dev), dir);
 }
-- 
2.47.3

