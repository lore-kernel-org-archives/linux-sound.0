Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazhn15010016.outbound.protection.outlook.com [52.102.133.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E9E63EB81C;
	Thu,  5 Mar 2026 19:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.102.133.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772740720; cv=fail; b=BDJuYFZjtRugldiqT8tZM4/gGdWa7W+CILl4sLYND+t68OXYP2FFuRxN9FIOChUd3tUco/U9HTi/185+eiNec8UE5PfrYfHEMkuXHS4mQBUdcBTFCgOOvkkTsjvVQdtx37wz8x9UnLir5TlYxAtoKCOJ4jfeeosvSXJffpBY/Zw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772740720; c=relaxed/simple;
	bh=/EZSWOBqR1j6a8mTMEK/DZnx4Dao25qn6WjY4mddrmw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qP1b0Ruf2lCJ9qQ2Q8pdCj9SsRVYUUUWJ5hIcPgyqYWlHsD+Ew6RRIbJ84Xnfdgd7I7Eqa0G5GZKSiCE9az7heP4a0oI5/03LKhkLXqkJ/RGGpcpMeInQE+PkEVh9NlqDvICTHryTH83ehnUSd6Sd4mvaKelwO2+bTaZFGOuAxQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=XzZZkxZw; arc=fail smtp.client-ip=52.102.133.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="XzZZkxZw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CCRvjmU6ASjyDTLe6aehNFEmIAIxElMZCUv+q303qbqcLhpsqQasqCKZKCX86Pt0PYbATTbFY/UrM08oRGkSmHkA86+GDcxENCQpNUkcbcvw9jhcQN8Y3ZtQ4d93zf2+QylfbYtnzChbypL35nuKd8sIZFayofT6j4WK0dttPvkhEYoy6s251AR7ATHORTCOmgwhbLAVFjzdnHZt9SAPSSHqGt3zZHxTby+822rr62Aca9UckBqYFlTkd8pzwU+N77CSM7Ae/EIRnJpisfEX/AnpkyiRCNrUM1sm4M5WzTS4rc94IW0hvuRGcZL5DVawqsZ05KTO1K2LDsMiR1ut6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a4k60zfkiEJ7XCZxxziTcdWFP6OQIZOCN21yW1A+bEc=;
 b=LWBWqsb8UaUvDxLmB+rCRDNPER31YA54uQM42EkEpTT+yFPbzJAY/q0QPCSC6U7j+mvZQnv0K2mWQL9o50pnsT9DW8ZSDTwHZZJQYpgsJXInIoznEdrivrXclI397EXZxlEKJEFWap9PyCmqIaBQKIWi6FlcPNvhOKijPRE2rqAqlq4Bq3PZo/14FN6Ge9k4w2IotO/vgNMI/r0um0MdifvHLgcG7ozX9iajKeaYlGd5gSTfjW1QVy9ZspBlI+gZrDt6JCYM+57KFbV3lxm8fZbNVQKu2w6FKubSuLLxdDHIv3WqRq3rawgr+BoISzFC57XkwKskmItefh5b8iCjNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a4k60zfkiEJ7XCZxxziTcdWFP6OQIZOCN21yW1A+bEc=;
 b=XzZZkxZwTuNZlD4bl7ERCs0FsZkISG3Hfdi1bapAwJD/nJ2odgTMzj1zO7uGjOnklgJAGl1BHojvuC/4wthzeTGfzC4saf3/OBfZAt+oHZ6+rVWiKAWg6NgEh8NZjaBhx7iJYI/WjLe4YxMPemyPv7ebRx3igDlj7WsIzwngrbI=
Received: from SJ0PR03CA0143.namprd03.prod.outlook.com (2603:10b6:a03:33c::28)
 by LV3PR10MB8011.namprd10.prod.outlook.com (2603:10b6:408:28b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 19:58:31 +0000
Received: from SJ5PEPF000001D2.namprd05.prod.outlook.com
 (2603:10b6:a03:33c:cafe::d3) by SJ0PR03CA0143.outlook.office365.com
 (2603:10b6:a03:33c::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.23 via Frontend Transport; Thu,
 5 Mar 2026 19:58:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ5PEPF000001D2.mail.protection.outlook.com (10.167.242.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 5 Mar 2026 19:58:29 +0000
Received: from DFLE207.ent.ti.com (10.64.6.65) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 13:58:29 -0600
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 13:58:29 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 5 Mar 2026 13:58:29 -0600
Received: from localhost (mz02jj9v.dhcp.ti.com [128.247.81.0])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 625JwS4t2458465;
	Thu, 5 Mar 2026 13:58:28 -0600
From: Sen Wang <sen@ti.com>
To: <peter.ujfalusi@gmail.com>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
	<perex@perex.cz>, <tiwai@suse.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <devarsht@ti.com>, <r-donadkar@ti.com>, <s-jain1@ti.com>, <m-shah@ti.com>,
	Sen Wang <sen@ti.com>
Subject: [PATCH 0/2] ASoC: ti: davinci-mcasp: McASP code cleanup and clk div fixes
Date: Thu, 5 Mar 2026 13:58:23 -0600
Message-ID: <20260305195825.9998-1-sen@ti.com>
X-Mailer: git-send-email 2.43.0
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D2:EE_|LV3PR10MB8011:EE_
X-MS-Office365-Filtering-Correlation-Id: c5d2cb8b-95e8-478b-aef7-08de7af192a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|34020700016|82310400026|376014|12100799066;
X-Microsoft-Antispam-Message-Info:
	AvxIBD1GlrP8ai15Eskxd1sEsaEwI6ldQ2guQmW4btcytk4QrJRrdAeI52qA8QIrzNw92olwloZurqWZa7DCm/Ct8Igl3FVcM91Gl+iU0NQl9X/G20kC2yYQ9x8vs9HXssmFjPQxUA2McuyzJq3keXzpSlCbOgfod6COUtCJxJ/01elED3XX7tIsz/Bi9uIVNvPuLjF20kcXHsV0hvm4kO0maMy9zfnUPOAEMhe6ZS+W91SrMj76tFsxHgleJSwhVBK3dapoC1xT2U5GaKfBfwN5T1NHrgfQVNAH26ybVnDZVSYwdwrb4ixRwNvolokhwvbyKbQKU3vHkal1wKExIfPvgX+6kSr32xmJ9xiNiryFZ4iL8cnOYN8hNw8/j2x0Lh69X+KYnq7HCJambabjc15V1CXKh1iueJNrg4yNq2L6jR6ZF/mFL5/ygvz2LpCaL9p2ui3AgahmDgm8+QO+6fCZhZhbJmyQSZiTE6ubTnetXxEi/tbxE6HpK5HX/XO1siEdUh03P7awZTL5vFCuvb2J9/aeUNhk5yuUdfVHr4YX1DN8c9zlzVP+/hMPjzIQe52jANBAxKv6m54HbHRUqbEkTF5R2p9AgnLtLpVRlCK9dzNimKPCPh4oxgARL9e3SrzpLzGRt+mrY2iolkrIdTIWFfnsMuNEl0pAlkkwTeRAhEW4k0rrlYdA74jA2Q/UUOiAxd5fBYiKlam1VKLHB39GfkkiTniY+Q6Esjl3NZHydIKNILN8x/3tmeRai3VGAC3/R5sXPcBhKbcYab7l5g==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(34020700016)(82310400026)(376014)(12100799066);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	wuE/Q4S/lJSuQAIpCYOew/3hogaTisLlvq2C98LosTukAlf3l+Ee97XPIJ1Ui6kXuHZ3VWHXcuGNn4ZJZpNIDmci7ZANq9bwtAu950pK8KTe4hXMEFUV7b44vdBySF2oh/bdosLcyUJUIFqeeOX+t2HR9z8+/2UgkIisCyy7OOPeEoLokiAZCBa3UefeV7y+VVVpr/Y+rZqhL27ItX9do3GhjEffphLNDJo2kJvnqA9rWY7C2IvxqPif2Rj44dIPnIcm2mdsDHcK1ug8ErA1u+W5aSs3v8dHmmjBMS/2wKPSEBJ1tQZr3fQWfrsymqWRUD/iK5KoBeF9iyofZ/CeKtsPwO9nimf3MQ7Hmh0Xuc5cVRbAObtrx8qofEsIWOxzW+bbupgI5RJ/T3P792PO7z4x2QASdjKhuxtkcQKrg8nJt+f6j/AfbHiiEPj9bLhH
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 19:58:29.7801
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c5d2cb8b-95e8-478b-aef7-08de7af192a3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB8011

Just two minor patches that aim to tidy up the code a little bit,
as well as fix the aux_div selection in davinci_mcasp_calc_clk_div()
for mid-range dividers (33 <= div <= 4096).

Sen Wang (2):
  ASoC: ti: davinci-mcasp: extract mcasp_is_auxclk_enabled() helper
  ASoC: ti: davinci-mcasp: improve aux_div selection for mid-range dividers

 sound/soc/ti/davinci-mcasp.c | 45 +++++++++++++++++++++++++-----------
 1 file changed, 31 insertions(+), 14 deletions(-)

-- 
2.43.0

