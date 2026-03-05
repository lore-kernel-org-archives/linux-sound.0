Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazhn15012043.outbound.protection.outlook.com [52.102.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D2363EF0D3;
	Thu,  5 Mar 2026 19:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.102.128.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772740724; cv=fail; b=FlCPuE5kPAkaYehLgsNA5g5t6ari7fP6c5gZJj+nKlRL09ig9e7glDQbKDYC5iQ6HiOlfzshZautm18JWQHjz9l+OKpGboPkmh2dp9154TT8HTpEJmAZjSxRLH0HBKq4mkGukcopAHF6Mp05l1l0TC07R21fKg/fE4niDyyRooU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772740724; c=relaxed/simple;
	bh=/rcWbbQRuNA0TUgj04vV+fiwOe5htl4FXwpMjyCcqlg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GctaslchDqg2aKrP6AAR71OZiHNQUkmNd0IOiv7k19dyKbF57DBT0TUnxC1uk601h9enhNK+H4tsZD+UJZQIe7NX8RnL/Rtn/DHXte8bMuuYl81XbfuRou0KsABgI3GAXjmqkCWdFAtVhiV10mDohRbo3P9SLyvtoaJh8QcRVq0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=A6fy5soC; arc=fail smtp.client-ip=52.102.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="A6fy5soC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wizEBNLp8UR+dV/VNFLlT4T61sYyiBwPs1kJurM2BFtup7JrqlVAcQnkcZP1Oyv1fJ3KivrBU9cA+Ejmxp02ThWbtSdRt9IvAjqYztJVwALOP1H6ZPtEyNjdDrvEbM7lO3JRxw4IYecerBzDRopBUdY7PshA60M5vR9M5KaSfuB5Jp9uFTAQ6SfiYGmOUzUsgwsnABM9bTZP+wYZ2COq9w0vPyduGJSg8XGZbFtE4sCpK96b95gt10F2nYxNMkUUz0u8Kjuso7sAIexMcPvgwQJVMfnJLei0gf24Dfsl0ZKfNrJN9Dx3e8vFUsj58FExrpQpMx92M6z/mtOn1yqKMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jellVAuGs8quJmDKLXWxNvEJHofzNiAJVdNYmPlkciw=;
 b=jPmUCngWVYYFmsl7tB2ZDInwNlEgvJmv0XRMR+yt2yVUvKEyyz5TOMDDiYvCMzD3RNnVM+O4T+CNtuxVKxwS/+rRSC6v3uZTriqPukLp3Zw35M+XtNkQvnTPS2cTr/xG5ARz3YO078hIsY1AJ3n+ZwCo9+DMnlD22woTfxE8TuR30sgiXOunhvpUMpUon14XYFvrYSEjRdPEmuUuGrPrW1jcxnMhpkQEi0bMreHuH7CH/0/v4VXYi7TG2xq8b57qM/aAyZIUo99RQ0rpU8TOT4KVQUcrJFyjbGMIFGaAl3SUZ1yyl7pQp2Mt4BeTXlqbr2RF9eZGFok0q1goQAxBnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jellVAuGs8quJmDKLXWxNvEJHofzNiAJVdNYmPlkciw=;
 b=A6fy5soC3bTVAxdw+vLk/ORt53ZiG7MiwbUsGDlymKiBAN50qIk0ELqFerdAY6fE38WMTHb11naL/Mo614z1Prm4+ulNUyn1V8cYqli8AJ7/vS0uF0DwxWpNKPsa18l2am7UCDDW038I/Cd44HQgs9LhllQG4Hn5KKCexXLBGVI=
Received: from SJ0PR03CA0135.namprd03.prod.outlook.com (2603:10b6:a03:33c::20)
 by PH3PPF350708D76.namprd10.prod.outlook.com (2603:10b6:518:1::794) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Thu, 5 Mar
 2026 19:58:33 +0000
Received: from SJ5PEPF000001D2.namprd05.prod.outlook.com
 (2603:10b6:a03:33c:cafe::56) by SJ0PR03CA0135.outlook.office365.com
 (2603:10b6:a03:33c::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.18 via Frontend Transport; Thu,
 5 Mar 2026 19:58:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ5PEPF000001D2.mail.protection.outlook.com (10.167.242.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 5 Mar 2026 19:58:32 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 13:58:31 -0600
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 13:58:30 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 5 Mar 2026 13:58:30 -0600
Received: from localhost (mz02jj9v.dhcp.ti.com [128.247.81.0])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 625JwUgL2458492;
	Thu, 5 Mar 2026 13:58:30 -0600
From: Sen Wang <sen@ti.com>
To: <peter.ujfalusi@gmail.com>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
	<perex@perex.cz>, <tiwai@suse.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <devarsht@ti.com>, <r-donadkar@ti.com>, <s-jain1@ti.com>, <m-shah@ti.com>,
	Sen Wang <sen@ti.com>
Subject: [PATCH 1/2] ASoC: ti: davinci-mcasp: extract mcasp_is_auxclk_enabled() helper
Date: Thu, 5 Mar 2026 13:58:24 -0600
Message-ID: <20260305195825.9998-2-sen@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260305195825.9998-1-sen@ti.com>
References: <20260305195825.9998-1-sen@ti.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D2:EE_|PH3PPF350708D76:EE_
X-MS-Office365-Filtering-Correlation-Id: ed51833f-c498-4868-ca52-08de7af1940e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|34020700016|1800799024|82310400026|376014|12100799066;
X-Microsoft-Antispam-Message-Info:
	a2PbuLAtVkDJV680yzdEJ80naJ8TaMwlZkss7RiGAVjBqKxqWpogJIY5CqaK3NR1rcj/skO8RBIB6dPXLGU0JrFSBfwZZdBhvgQGDlxrOLSLvMc5bZdC8RbLxJxJw1S1Y3CMYMnbanHP8oaQxWg0UJCekXzqf2xbwj5WjANYiFC8JD8c5wxixW4vhGuLA7K5wC/2pCbrF4CxzbQ/3rQnY99fY0dwsJtH1RSjfyTSdZGP1NvqCQt8APUV6DFPooEQBypWklrGuF4pCbxpfr0m9BUH0/EoQ+/S2oRxW+CoqrWielUfGBNyfPkW0HvqJEuKAw2cpPYJCZg601AbLY914ZPu9btZ91cQCmAby5dzyUWH8DR4fUO87u3b7kKFDRwCXexTwXX7WGQ58flQIP2DuPgyKe5YGYN6MzRWks0Gqo1Ep5ndxe8Ewck3YpnPRI2vcyG/rmyVYtSenwYGstFoQMMf3kYl1dtrMNMlQ0897XavNCsZXuqpHawbOrjfLb6/60pnar1kBFoCQKCb23OCiLAtpThEQIh1LvJefNu8ItNS8sw3fCWhKAQHpTHDZPz8TDRyQnrEOQKFHolEUeWvKcUTggUJwVH6TIsI6rZx8SBxwnZtGpHB9P5emV3lrobVsokk/o2B80DuChoK+T03mNhbPqXl4L+pbvuP3o7NTcH6zdaArMywtWmHDgV9oEMRaq3g5vFHDrzn1TJ9MyU+Ff3p5Hj/qJMtbhlNtkkbkFdbN4vUOUTaa+SyDGZI8citAiskIf/7qWiQkCHBvvcryg==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(34020700016)(1800799024)(82310400026)(376014)(12100799066);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	qvVm9DuQ/c1xRGTw19M/NHbRcTXXZm/jAaE+39HHh8GDpOviBz2VS6ku0CaShfLjglvDC7KMvNQj352V7d/gCZTpFYvSbC9J8BsNXQVYfA0dTmwTvPnmosnGwDu0Nm0ld/0Xwdr10IRBBZnrJ+2CFTaNMbxvI2X9Vc3k8XWLEYVuzjaeSlOcmw5Y/nxqG1k2vUW2fGbAkJozJsRH0pHVJfR9ASQMao6EhUpjYlx2cgcTHzTkrd2N03VYx/gBzxSXe6vwHfjl054zIKJmK8d2SHW1eAPHN9+BbWMqe4a2Az17Hn7TLwRgSqGpxRLBVBhsrbQ6Nohp+/hOmjz7Jb19AnrkBsULSlBZPmbkThTqJBvRphCBVCzI1ZcHA2IhbxPvAyHELxihNVSTPoh4gUhUga3xwAkcG4dS5kKIU+ACvuYxKSv7LtGpa3pCgBGbYR/P
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 19:58:32.1573
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ed51833f-c498-4868-ca52-08de7af1940e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF350708D76

Move the AUXCLK-enabled check out of davinci_mcasp_calc_clk_div() into
a reusable helper.  No functional change.

Signed-off-by: Sen Wang <sen@ti.com>
---
 sound/soc/ti/davinci-mcasp.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/sound/soc/ti/davinci-mcasp.c b/sound/soc/ti/davinci-mcasp.c
index 2d260fbc9b83..6d0310f09b12 100644
--- a/sound/soc/ti/davinci-mcasp.c
+++ b/sound/soc/ti/davinci-mcasp.c
@@ -274,6 +274,14 @@ static inline unsigned int mcasp_get_auxclk_fs_ratio(struct davinci_mcasp *mcasp
 	       mcasp->auxclk_fs_ratio_tx : mcasp->auxclk_fs_ratio_rx;
 }
 
+static inline bool mcasp_is_auxclk_enabled(struct davinci_mcasp *mcasp, int stream)
+{
+	if (mcasp->async_mode && stream == SNDRV_PCM_STREAM_CAPTURE)
+		return mcasp_get_reg(mcasp, DAVINCI_MCASP_AHCLKRCTL_REG) & AHCLKRE;
+
+	return mcasp_get_reg(mcasp, DAVINCI_MCASP_AHCLKXCTL_REG) & AHCLKXE;
+}
+
 static void mcasp_start_rx(struct davinci_mcasp *mcasp)
 {
 	if (mcasp->rxnumevt) {	/* enable FIFO */
@@ -1337,16 +1345,15 @@ static int davinci_mcasp_calc_clk_div(struct davinci_mcasp *mcasp,
 	int bclk_div_id, auxclk_div_id;
 	bool auxclk_enabled;
 
+	auxclk_enabled = mcasp_is_auxclk_enabled(mcasp, stream);
+
 	if (mcasp->async_mode && stream == SNDRV_PCM_STREAM_CAPTURE) {
-		auxclk_enabled = mcasp_get_reg(mcasp, DAVINCI_MCASP_AHCLKRCTL_REG) & AHCLKRE;
 		bclk_div_id = MCASP_CLKDIV_BCLK_RXONLY;
 		auxclk_div_id = MCASP_CLKDIV_AUXCLK_RXONLY;
 	} else if (mcasp->async_mode && stream == SNDRV_PCM_STREAM_PLAYBACK) {
-		auxclk_enabled = mcasp_get_reg(mcasp, DAVINCI_MCASP_AHCLKXCTL_REG) & AHCLKXE;
 		bclk_div_id = MCASP_CLKDIV_BCLK_TXONLY;
 		auxclk_div_id = MCASP_CLKDIV_AUXCLK_TXONLY;
 	} else {
-		auxclk_enabled = mcasp_get_reg(mcasp, DAVINCI_MCASP_AHCLKXCTL_REG) & AHCLKXE;
 		bclk_div_id = MCASP_CLKDIV_BCLK;
 		auxclk_div_id = MCASP_CLKDIV_AUXCLK;
 	}
-- 
2.43.0

