Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011060.outbound.protection.outlook.com [52.101.52.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F93F36402D;
	Wed,  1 Apr 2026 02:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775011359; cv=fail; b=I9nvitwlkQHuhEvYtvIEwDZgulniIMIPYWWnYylWm6R7qkbNeZt7Gq9GUa4yWaeLVyIXA0FgJdb7j4zHTiOkLSGummcIPnxMdOqT/XbWhXH81gKgXYxDVVaiuheGgy7JVOLFF8V/CO1Su0LipEVefN1+PfSiv6d0JZ0xOozg+e0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775011359; c=relaxed/simple;
	bh=rc7WOsvlMTx/Xz4R+vH9nwj1BrfsJ9tT4FSLHmpHY5c=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Crh9ec+9lCwe6M29OnyK+1v0Gnxdi461tq9FUiRJqwG7c6LYHFxxLOv2kQW10LFrsaNVqOC8/0FcEidWybPkRxt9528DIG6TdnDxmfPUBOHwguLD7o+GpCWM2xhyHtlL4G0nqSSuBmqlQIV73w4tWbrLTt520Gf7pUs4Yt3zPKg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=HF/spM3l; arc=fail smtp.client-ip=52.101.52.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="HF/spM3l"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pdOnpE5I1o2oBhvC1ePl2g2twz2R8GM9iSwoUMBpZHR+yACTCOg60leoiHzhTpQpBdxml2+s6iOH2JfqDWltq/+tErwbOIB/i8Gooywmqf0RBQ5zT4T+TlqJTDjbfIdNjAoaHEDSh98yYID22ugi6ycaSasPSRxJdNKOqcnbbffzRWOu/PrGVi7aFTU5HI305SFTrYnoEKr7YLAuRDWZoPe6zu3gp2V0LGS9kjXOIbsqhOgMZhBhd0Sl22Ou9fwuxX5QRvrief+ymydwHypiuHK3ZP/1ckA1WiO82UyNRxYmel4uqCE/izssanIJqOb0xClzHY4TS91H/RpKsXkxnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7G4Bq7eGoPEmFv6nBU5TZN96ky7FW5IWX8m0IhRXDOQ=;
 b=k7gfP1OuJhkl4VbY1KF3rShEOcxzmmSzzLZhFSnnD8xd4mBEd42Wjy1zGEvlEgsY5RlC5IZ6x7AkQ5/uPALaYQnhlvv9bFmdEVZyIWOO7X00WHpaZXIIWqnBxbhP554PJbmpgtcPhb3e19X5sho9NnZ+KRDGaQxAxuzyQGTMqckD0gQXMCbTpRAzT1vfNXyE+NfIvQ61DecZe+DYcSDqzPSvklHm07THB7UWDR4+KqNSACN2ymYM8q9hPSC9mu4wfe2Xy7SeExu5lkjpsAb3Qv0lOgBi3f2aGnx2LavhouL4zI1iiXxDFtPEr4QkuRmt2CNRUCKj4QhihA3xli/rEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7G4Bq7eGoPEmFv6nBU5TZN96ky7FW5IWX8m0IhRXDOQ=;
 b=HF/spM3lJieQCQ4b2let4fEXKImh0p3z38DeoCkUSq8cUm4ENfB8rfMa7C8F63ii1BaGVhhFbpbylez7QqkwxUFUK2hLtvnGJRs7/+M74fQ7DIPTiW/sgObClptB7iLZSG9rkn3jATqOyBUQ9D5bJVMFSkckLO/G6vjq15E+iPo=
Received: from SJ0PR13CA0011.namprd13.prod.outlook.com (2603:10b6:a03:2c0::16)
 by CO6PR10MB5570.namprd10.prod.outlook.com (2603:10b6:303:145::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.16; Wed, 1 Apr
 2026 02:42:19 +0000
Received: from SJ1PEPF00002320.namprd03.prod.outlook.com
 (2603:10b6:a03:2c0:cafe::15) by SJ0PR13CA0011.outlook.office365.com
 (2603:10b6:a03:2c0::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.15 via Frontend Transport; Wed,
 1 Apr 2026 02:42:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF00002320.mail.protection.outlook.com (10.167.242.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Wed, 1 Apr 2026 02:42:19 +0000
Received: from DLEE201.ent.ti.com (157.170.170.76) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 31 Mar
 2026 21:42:17 -0500
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 31 Mar
 2026 21:42:17 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 31 Mar 2026 21:42:17 -0500
Received: from localhost (mz02jj9v.dhcp.ti.com [128.247.81.246])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6312gHT93899137;
	Tue, 31 Mar 2026 21:42:17 -0500
From: Sen Wang <sen@ti.com>
To: <linux-sound@vger.kernel.org>
CC: <broonie@kernel.org>, <lgirdwood@gmail.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
	<perex@perex.cz>, <tiwai@suse.com>, <shenghao-ding@ti.com>,
	<kevin-lu@ti.com>, <baojun.xu@ti.com>, <niranjan.hy@ti.com>,
	<l-badrinarayanan@ti.com>, <devarsht@ti.com>, <v-singh1@ti.com>,
	<linux-kernel@vger.kernel.org>, Sen Wang <sen@ti.com>
Subject: [PATCH 4/4] MAINTAINERS: add entry for TAS675x audio amplifier
Date: Tue, 31 Mar 2026 21:42:09 -0500
Message-ID: <20260401024210.28542-5-sen@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260401024210.28542-1-sen@ti.com>
References: <20260401024210.28542-1-sen@ti.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002320:EE_|CO6PR10MB5570:EE_
X-MS-Office365-Filtering-Correlation-Id: c706e9d2-6392-488b-8efc-08de8f984b7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|36860700016|376014|82310400026|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	sf3sy+ndINQxeMUjC2IMQOAgoo6L74Z2z8UeAJC4J3fe17viZ6MLph73WiDOLiocF8j5RLlo9GMF39U6ZSo86Wjr692kDT4ZV0sh+b2RnPujiSfILmrkTmK9XPwXUaIe6h66ktIHNcy5Hywf9HMqQsnoVRWxKPim2urnbOieDqZh6BO6F64rKZPqXz6Wlwy84XZ4sAkP0cwN2ekir70TrHa1X83BEQwYcs8oeo6yVd6NkhhfTvp8EbCWY3XZtmggRaE/JlnRo5nzxHC3nVq8MV3uTpKKD38JN+jWkOI52iP9klE5CQQ3vDVlzpehFR0XhjNo33I6+ErOZfKY83xoZgd9BPDPvuiDZJ9nnel44Qdq/iCWvBd8BcgHIcD7dMhtWThl6Fw6F9EKRUwSuMpYlq4/t0YqSUPeOEYHkR90buf8N3esiY40ecRbhXI9STqmgdDSisGK0bVx7SchdBctQkP9SGwADbDJ5ja8YUVCy39BisK8siMVwArlIw4M7iERyQBQidnoi1PbTtCbNt0VFP7apdywq1jZUXoKXIbFVkU1OgewczIXBKXCHRSZRYwPgYHfhgcpMRsV6QtAKhWAFx0lKk26CUn+8XVsKaCU+IoEqMsZCQCWwcVCDHEYY/8fmHit5L12EeElzWkSeqKuRwHuebjiogTbAXwDI//bfZq0wN39WSyAqJIss/18Cxupvj48MWXl2+cAMNgF1cDRNdR4HJO7gEt9tRTbv09zpf0cA9BiBIPiEv1JyeL/rdUT79LiMbrsqV6a6FX5T0snqg==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(36860700016)(376014)(82310400026)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	OjI5Mmd9WQbaD861Xvt7kgSPSekBzkvMZNBn/kwwxYjSipa5+9TrKr+1OqI8UnnXVRoUxg+uGSCr9uzqU4kYWLksBK1jAKYr+dppn2+BAcWDh9a224tmwLyYOJJdb1NT3xClw09nSbCl0ruoor8CArEs1b9FCd1T20ndHKnsR+btTihHYx4ACMf75mjMlheU5Y/+sYIcnI9hCBETt/q5fzflS5Kx+uL9G4PJnKGUAaLjdk5FQtIB+RAG5nDAOBtKq2wtEfOh0njAkox3JzJbR81JZQAS+O692mGs6JvEIaWNbxkpYRS3dBrgAt3nCTjJ2+KR7TKikx/LTe8BViPNPC1IN9R11Xf3KmRfsA3+Q+HD9bBBMjTGaaLDHMU5SuW//9LQG44/25GyvLHuS9bzFRfUilNbWBVSlVpLYFaTQLA6Z+vS6H5jWFill9eZMrE/
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 02:42:19.5897
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c706e9d2-6392-488b-8efc-08de8f984b7a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002320.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5570

Add Sen Wang as maintainer and register file patterns for the newly
added TAS675x quad-channel amplifier driver.

Signed-off-by: Sen Wang <sen@ti.com>
---
 MAINTAINERS | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a626dee5c106..ea61bb439652 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26191,17 +26191,20 @@ TEXAS INSTRUMENTS AUDIO (ASoC/HDA) DRIVERS
 M:	Shenghao Ding <shenghao-ding@ti.com>
 M:	Kevin Lu <kevin-lu@ti.com>
 M:	Baojun Xu <baojun.xu@ti.com>
+M:	Sen Wang <sen@ti.com>
 L:	linux-sound@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/sound/ti,tas2552.yaml
 F:	Documentation/devicetree/bindings/sound/ti,tas2562.yaml
 F:	Documentation/devicetree/bindings/sound/ti,tas2770.yaml
 F:	Documentation/devicetree/bindings/sound/ti,tas27xx.yaml
+F:	Documentation/devicetree/bindings/sound/ti,tas675x.yaml
 F:	Documentation/devicetree/bindings/sound/ti,tpa6130a2.yaml
 F:	Documentation/devicetree/bindings/sound/ti,pcm1681.yaml
 F:	Documentation/devicetree/bindings/sound/ti,pcm3168a.yaml
 F:	Documentation/devicetree/bindings/sound/ti,tlv320*.yaml
 F:	Documentation/devicetree/bindings/sound/ti,tlv320adcx140.yaml
+F:	Documentation/sound/codecs/tas675*
 F:	include/sound/tas2*.h
 F:	include/sound/tlv320*.h
 F:	sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
@@ -26215,6 +26218,7 @@ F:	sound/soc/codecs/pcm3168a*.*
 F:	sound/soc/codecs/pcm5102a.c
 F:	sound/soc/codecs/pcm512x*.*
 F:	sound/soc/codecs/tas2*.*
+F:	sound/soc/codecs/tas675*.*
 F:	sound/soc/codecs/tlv320*.*
 F:	sound/soc/codecs/tpa6130a2.*
 
-- 
2.43.0

