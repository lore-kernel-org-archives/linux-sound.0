Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010039.outbound.protection.outlook.com [40.93.198.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95B6D3655E7;
	Tue,  2 Jun 2026 09:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780391917; cv=fail; b=vA/VjIhJS+ItGanhUfJTAeLeW1bVykDW9U89HHip5iUQDGdqUMDpz866nts6W7Px0cBL3KliPgWH7OM3mUNUv5nLRc5j8QgBU93Gf7ZW3alPQc4QWjA+toxdonehlbsa5jk3skFLalvlY812zxuhfg8n8lkiME93hJCVf1iG8VA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780391917; c=relaxed/simple;
	bh=zd+aZS4p/hWcd5q4Gbfq/fQuXvqRLlHO02stJc8az24=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=V0ZTtTG5m8327pecxcQFRZd0wJOZav8Xd39zvhDmfJax8sDt4Cqd3eUaY23xXUFKiHXzBU3VLOTcejAoZT3BMDBS7W9aPk74E7sI//NRsHuLBP+v3nol4AlSrzhQof/qB+ibDcnXernc3KDyP0JhQSoftCTeWWfV2272p4h8TwI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=iEb9KJaF; arc=fail smtp.client-ip=40.93.198.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="iEb9KJaF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JCHSPfU+x7x7OsZErz48bURvsxNsCVwLb2VmeFASogCSiK2xjTCHsHLr7FcF99vY7myOHR6ipzXe2Z1NoqcDufNkNRM3dne/inl16jdYE4cDznHIly9H9BQxmnJkpNAU6xTjqugI+ZMIUi4w4nHFqyNx7AV0Cj60Q1YhYgYZkYrJrcI9PN06QJ1x6v80AIINahMH+nxB+M3C5U8sx7ljS0Lv+lQlzIbvgrEiiIC2kODE4ZwEg0F9dog2cRQ6p3qAaF+pRqNwhKIbtdK51fokwKLn+M2SKS+TnNgAxb5TaLRk2ZSJjAJxSdDwjDzWFXKP7bXjaPC7q8RQwcnzFqJurg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TCYfSoAj/iKHBsJlI0OSmTj09tFxytEbFe3axu9sqhE=;
 b=ETEEHo3zNX1DgFzyOTSdVvPp++2zPgegV8idkFkAQK5Jg3RIg8T1do+/Gzzi4bzk7TnUooabr2rfeoHpvUBWXS9Vijq3r0lNb8Z2opfZ2R1DyO8HQ5yPwFh64QfMmGembAjkDMiP/QSWiASF88mnx74GTs+Gl5NgXwSKBV6njgusO9kS/18pNdVJk1zwYsA1xD1S37gn8yBe9IXn5JFei4cs7i1+vpsd3iYcgHrB8Sppy8SZFYj9OFzAXlOdu3iIikCWdQLWOgq6aHUXsLMf+DC88vk1XZum6WiwaJGV/QnHHawK5W15a+mR7dMf44o1amsqTuna1WgkZfboRUYnPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TCYfSoAj/iKHBsJlI0OSmTj09tFxytEbFe3axu9sqhE=;
 b=iEb9KJaFQi+VVA1JMI4hrguZlBmg/vBzicw+PA8TxARgpUR+3csf4xVwoIlV5uamkVsY58yGUNKM1lVCdA005GJUFhPLJcbrfNxJEgV74pmLzkF2O9gNlixzPezdCpdrI2dcZOpFJBMjMP+URdoy2ziSMbx/v+JoL1LOeXUw0aM=
Received: from BL1PR13CA0275.namprd13.prod.outlook.com (2603:10b6:208:2bc::10)
 by CY8PR10MB6444.namprd10.prod.outlook.com (2603:10b6:930:60::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Tue, 2 Jun 2026
 09:18:32 +0000
Received: from BL6PEPF00020E64.namprd04.prod.outlook.com
 (2603:10b6:208:2bc:cafe::8b) by BL1PR13CA0275.outlook.office365.com
 (2603:10b6:208:2bc::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Tue, 2
 Jun 2026 09:18:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BL6PEPF00020E64.mail.protection.outlook.com (10.167.249.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Tue, 2 Jun 2026 09:18:32 +0000
Received: from DLEE208.ent.ti.com (157.170.170.97) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 2 Jun
 2026 04:18:31 -0500
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 2 Jun
 2026 04:18:31 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 2 Jun 2026 04:18:31 -0500
Received: from lelvem-mr06.itg.ti.com ([10.250.165.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6529IRdR2931596;
	Tue, 2 Jun 2026 04:18:28 -0500
From: Baojun Xu <baojun.xu@ti.com>
To: <jwboyer@kernel.org>
CC: <shenghao-ding@ti.com>, <linux-firmware@kernel.org>,
	<13916275206@139.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Baojun Xu <baojun.xu@ti.com>
Subject: [PATCH v1] linux-firmware: Add RCA firmware files for tas257x projects
Date: Tue, 2 Jun 2026 17:18:00 +0800
Message-ID: <20260602091800.6237-1-baojun.xu@ti.com>
X-Mailer: git-send-email 2.43.0.windows.1
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
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E64:EE_|CY8PR10MB6444:EE_
X-MS-Office365-Filtering-Correlation-Id: 35fee516-c445-4dc0-a04a-08dec087eaba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|18002099003|4133799003|3023799007|56012099006;
X-Microsoft-Antispam-Message-Info:
	Xyp/Dw5FrqtHV630LB7+0eyGZEwlGbWU2yCb+V0V6zdJBqKdzZk8hUDoXcwR20O2RiN2pJZ+X9zlHmF65xGzQ3/WGyNDSUS7RnSDxFjfvMBo2otC6iS5rVq1zk00KF/npt8dYnPmDR83uhelu6RgM1Y/P92vwejp7O9gi0WcA3wXGGJAOY+qq+ZRHEs/fYY5QfBhg9eEIrtOfJ/JgQybIHWb2iRPp4QpM1tqp79zBt2w7iF4qCITSKTkRkAANBxGZNBg+Al2ZGW9JiGT0yUw39HXN2vrR7Dm3yMLtl7nC8Hx3TKW81SBUwBHxyraL+JvHdVLlskJepvdSYcIt9/wIWYzf+d8swUkyLF+Iwfqi1sCQfOK1AbcmCCn8GGy1M59cxBjQ4dqUn57vzPa0Z+3R4KC3LbYeJWiDe+i+ktoXD8bWQUrhXk+scWhMvLtVrx1y3ZgsjHZMD8x0rG4d37ndH9ZddtX5Ceoxu8/9ad/5O/1BHOgBVKhlDEojZrp0xN7MMYW4s0+4IaNCuQz1gwQAQoRVbpx0LzLJQyiqoblxCdhIrm7yrq8mT8QISnnfFf+GcNKRCqEaYTgFuzwlO+7xb2h9FsSl161yWaOX/8tVNR89tHFwN7WARWkPbCPbFODJMdGUoOj4bZl01RtVv/H/s00SPBtxrAYgc9LapeOTDZ7sMePQXffgeN1LPZbYpwxKLHGQ+VajE19jdUKyUWm7mKb0oRiaiFzP8hPy+MrztQ=
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(18002099003)(4133799003)(3023799007)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	7P3WOQb3lIpt63XMwF6rZR9nf6YWXum3PTmlUBwRSB8eUHJIxVquMcx65qTBOAoBDH6cNNhm36kKUiLLpoRjYbBB1iOxJeP0oBhdyF3jMsgHD9cSqlg7SlGUOvR5jAma1/yQ2UDE+2oU2ZroThiz9H5zKGCPtmqwb39yBiDiPaAl1Ydkwp/DTHjjD5du0d5dqb8zLYy2vQq2+nfdof20G7jyBvAsWDGhrRWHv09Fc/kCuVSDNuIemFd47xTJx6nMCFuG0vSL3Sp3+t8nLPzJA8ezZtkB9YwXSgk2s9WnmB5mAVX9p8wHiOjj2KxwD0F5gdlNQNfNECkJxh5KsSHn1gjJVpGS8x5Ptb9PZKBqCzegMsAYD5rOrDIBuP71tEUxY5OGb70/E4GIMY8x+s8AMK/z7/7w7Srdo2TmcocYsjABkxeO6RIyWsqQnURcVQFc
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 09:18:32.3263
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 35fee516-c445-4dc0-a04a-08dec087eaba
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E64.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6444

Add tas257x directory and RCA binaries to ti audio folder

Signed-off-by: Baojun Xu <baojun.xu@ti.com>
---
 WHENCE                                  |  12 +++++++++++-
 ti/audio/tas257x/tas2572-1-1amp-reg.bin | Bin 0 -> 3844 bytes
 ti/audio/tas257x/tas2572-2-1amp-reg.bin | Bin 0 -> 3440 bytes
 ti/audio/tas257x/tas2572-3-1amp-reg.bin | Bin 0 -> 2132 bytes
 ti/audio/tas257x/tas2572-3amp-reg.bin   | Bin 0 -> 6912 bytes
 ti/audio/tas257x/tas257x-1amp-reg.bin   | Bin 0 -> 416 bytes
 6 files changed, 11 insertions(+), 1 deletion(-)
 create mode 100644 ti/audio/tas257x/tas2572-1-1amp-reg.bin
 create mode 100644 ti/audio/tas257x/tas2572-2-1amp-reg.bin
 create mode 100644 ti/audio/tas257x/tas2572-3-1amp-reg.bin
 create mode 100644 ti/audio/tas257x/tas2572-3amp-reg.bin
 create mode 100644 ti/audio/tas257x/tas257x-1amp-reg.bin

diff --git a/WHENCE b/WHENCE
index c0a0075e..902b51f2 100644
--- a/WHENCE
+++ b/WHENCE
@@ -9606,6 +9606,11 @@ Originates from https://github.com/linux-msm/audioreach-topology.git
 
 --------------------------------------------------------------------------
 Driver: ti-tas2781 - tas2781 firmware
+File: ti/audio/tas257x/tas2572-1-1amp-reg.bin
+File: ti/audio/tas257x/tas2572-2-1amp-reg.bin
+File: ti/audio/tas257x/tas2572-3-1amp-reg.bin
+File: ti/audio/tas257x/tas2572-3amp-reg.bin
+File: ti/audio/tas257x/tas257x-1amp-reg.bin
 File: ti/audio/tas2781/TAS2XXX0C94.bin
 File: ti/audio/tas2781/TAS2XXX0C95.bin
 File: ti/audio/tas2781/TAS2XXX0C96.bin
@@ -9696,6 +9701,11 @@ File: ti/audio/tas2781/TXNW2781RCA0.bin
 File: ti/audio/tas2781/TXNW2781RCA1.bin
 File: ti/audio/tas2781/TIAS2781RCA2.bin
 File: ti/audio/tas2781/TIAS2781RCA4.bin
+Link: tas2572-1-1amp-reg.bin -> ti/audio/tas257x/tas2572-1-1amp-reg.bin
+Link: tas2572-2-1amp-reg.bin -> ti/audio/tas257x/tas2572-2-1amp-reg.bin
+Link: tas2572-3-1amp-reg.bin -> ti/audio/tas257x/tas2572-3-1amp-reg.bin
+Link: tas2572-3amp-reg.bin -> ti/audio/tas257x/tas2572-3amp-reg.bin
+Link: tas257x-1amp-reg.bin -> ti/audio/tas257x/tas257x-1amp-reg.bin
 Link: TAS2XXX0C94.bin -> ti/audio/tas2781/TAS2XXX0C94.bin
 Link: TAS2XXX0C95.bin -> ti/audio/tas2781/TAS2XXX0C95.bin
 Link: TAS2XXX0C96.bin -> ti/audio/tas2781/TAS2XXX0C96.bin
@@ -9819,7 +9829,7 @@ Link: TXNW2781RCA2.bin -> ti/audio/tas2781/TIAS2781RCA2.bin
 Link: TXNW2781RCA4.bin -> ti/audio/tas2781/TIAS2781RCA4.bin
 
 Licence: Redistributable. See LICENCE.ti-tspa for details. Marked:
-	 Copyright (C) 2023 - 2025 Texas Instruments
+	 Copyright (C) 2023 - 2026 Texas Instruments
 
 --------------------------------------------------------------------------
 
diff --git a/ti/audio/tas257x/tas2572-1-1amp-reg.bin b/ti/audio/tas257x/tas2572-1-1amp-reg.bin
new file mode 100644
index 0000000000000000000000000000000000000000..16d530e2158eb57f71921544ea8a6f8c9ab4c613
GIT binary patch
literal 3844
zc%1E(&1(}u7{;HO{YcuTNzh2DHqwJi1XuE<Mm-p$NRK6mcx*^FCbr3zB*Y#(MDXH0
z2k&0ID&kqhOaFtO)q~*C9y}D{JG0XeH8IUn@Ppkj<k?~7nVt9fF#|;OFZtCXzzk~a
zLE?Opk<c)B<^X<{TF7m<=Qg%Kq`$dMzW;Ymxzw^#X{)tmmp1ICCkxJW_JL~jmUIFP
zIxuqv2z>?SZvo)~^%Q^z4WS<b1~~OlxeH=8!#r@E12^6PA{iqGn3R|P8i-Lg37VMc
zfh8kgQ4Q>Z4i?Wy4}AgQox5;#8^Na!m0l#DiqhLdI*8(4Txp8?#I9JMgPkPb*`Dk-
z+t4d&ytxgdv!nDQMCERUUPL7EO6euUA3qm52EIvtU97GHYwx?b{ppUX5RD5gqiQyk
zPSUtFrBj%7*SiQUivAvOI-3Q8K>xF<uvx(+@h|#zRbR+(=W9Xax^j&W_=;Q8K{Dd|
z@>qEpQ#ys4#eK17D)c$725I!h+-$hUG!}MO8uW3=Nalc%rMlB_(jFLjN0u*sV&wQC
z8JQVkgm$Yx@tN?*gsd-RKb{SCz{FS<vOlnp@xVfU1PdR17XCpNa#pp}SZ~?wDJf82
zKrD>*y=--yTG{sKKHm3=Rj=1P-*<vt5#lq_rzWsV00kC)WmVi~;_UUAJ>ok}WQ^ak
zdR1oMw99s_Gky5unaW$ua>uG}P3t(x_Zo4!VKto6=6z>+U%~1!S@tlQ)w$8E`kej=
ePSYuwyH}n>?)@opKj!EDm*k$7=aYSu=g4=Txjkh7

literal 0
Hc$@<O00001

diff --git a/ti/audio/tas257x/tas2572-2-1amp-reg.bin b/ti/audio/tas257x/tas2572-2-1amp-reg.bin
new file mode 100644
index 0000000000000000000000000000000000000000..03c32acd34f2dc6372329d27775583c44bfb92af
GIT binary patch
literal 3440
zc%1E)zi$#@7{|Zwd&fbMUkMo0LS)dUMz7(QT6M5PQ#+cbY1}NKhhWQ(0KpCpXX4_{
zA7J9*;G!|k4jR+R$)vjuE^fp)nAGRJdx18V!V%(NIP&JcJomoemwTQM&mG{e{qS};
zz+5!g!`RPHjD&*TaSGrU=zPx}+(#oMwMtWe^{-juzdQ1|hLKF^jhd0$HtJ(paHg^p
z<?21@I2b5zGYfz(4ER@oz%oUafFMnw58N(ricqST#A*gVaFc3u>m48}<H`aW)k}Q~
zM5s1#T9|Hw%?H6k3fLtTESk1F)H4X|ZNSz|c%D6yIz~PPsdo=)57s(Ssj1Yb_r?Ak
z>@4|u+g4m_LM_Po+AdtJJ*gifWZkXMF$Cjpq)s6E<b}`?@E!6qad!*Y{9t0`+q%pU
z&2ulKs8yt%r+J%FC*igCy8<PIgAOp8$p9YU;JeJQR=|Qdi`c%5`CRsT#e=MA?coDo
zwR765jQD+vSbZIlI*HqBzr{UMqAzkeNuh7dt_@e1!UFbAy%@I`Np~4Zl&h6$${{0+
z7&+cIbHq12G2g6S%vH7;M$@6AeF&zBOZE~+nf^MA=|s38Vl#)BHi_k@Q-()i*vchw
z>5OI8Wq2UFSM^r4lsCpCLa=b3EMH-?{ub-9aOd-!h<POoANwqb|K5~`lX$pn!f8+I
zaWJ%(UDM0u(%8?u!9C}?<y$xMMyci8Sa9}*ET5B}9ny2?y~TY@kC}2cv1euX{p4@P
zaAL1n)a&_{UaUE-exHH!WZ5QtZUhFxQwILY`_k~b-=Kc7tyikKod;FtbsyMMQc25q
PT%HE|rmS9NOw#uc`NS1b

literal 0
Hc$@<O00001

diff --git a/ti/audio/tas257x/tas2572-3-1amp-reg.bin b/ti/audio/tas257x/tas2572-3-1amp-reg.bin
new file mode 100644
index 0000000000000000000000000000000000000000..122f5f892933c861e67c014ad5f9ac65c5ef87ed
GIT binary patch
literal 2132
zc%1E(Jx|+E6o%h>?Idn+NhE?&RJUTOlvWtU2~a+UG9ZLHwFp%mv4Yctd>AEBU|<Lm
z3wxzX?MO!!82ANU_y<f~=+Ga4kdP{+$Je(Ai$*Asr>eHD{QBtlIoIdj*9Nq;=JktD
z0E^IIo5t05Mnb{OF+}5iaB%HzOvID;2akf?bh4J&+;Z%S(-;WBn97Ff>h+C@6Pycf
z?hkjo=GI*+G;Th?&4tFDGD~)Sqv^EzB;LoJHrsBw;0#FT#3d&CO4=Z*3OslU=p(>G
z4p2!Ii$KD!ikJaT5w0U+fA(T=V4m_8P64Gu$@{=Fy3eJ+G6}Gx0`^=5OXtLM>LU!F
zy@Rh?&<?hxHmH12>YZC!!|G*PY8@Co_iA#mG2+HQig>gIwJ7tWJBYN;q~3)vmCyzf
zPfnyBM|$tj(<$&O@j7_30jz)PVEM<I><Z<@mQae;rOr^^y3|?3{dyBnlIUInkMnu4
zGTooDtI;AR;jdQrT*mZ>|Gc7Msv~OX;45BpZ>@$mzgestr=-r})#@+Vd#-@qnkhZ@
z!Hij}l?V1(@BQ^sa2rm+DYyFv_vX%;jY8WjZS_6Xd$@DdgNj*q?dk_NM6Q(;+|cK1
zS)#wrfLzbNUkG`Gpnos^;$Qk7#m4^oHDtfiuUmQj_O5s78@YJ%J^>%2mydq~zaW})

literal 0
Hc$@<O00001

diff --git a/ti/audio/tas257x/tas2572-3amp-reg.bin b/ti/audio/tas257x/tas2572-3amp-reg.bin
new file mode 100644
index 0000000000000000000000000000000000000000..a226bcd22055ea963c015f082f8cf56531a63f9f
GIT binary patch
literal 6912
zc%1E*&ubGw6vw}_yGgfkZ31oZM^Xvup(tCji9cdJ7_^874@Imup&{Ma*d{4Sh&_mn
z;Kifh!HXbz_97nq10v{E5Q=#7qFxp8AjG%3Q}V;jVHd=W%)lhyo!On4eed(;%>oHj
zpI-d}un<*tGx?*-0GSGS*+ZA#0ZHjqxifg(U;n>SEHuotp*J?o!n#@aHH5+xmM8nZ
zB0UQRveV=tK>G&lJr7LfsfGHZbPFQDL>O3*fU~d3)@>k^q9I-aGe?2UL$J9hSWJdQ
zPbvE`_4XPZ-GqAo7S~DgT%PMKnzqEXiVKy;Tx&pl$I-Hi<1`b^FM%D9!6J|B_HYwQ
zi9Z|O>eIIoUtZ=qiRkPLu2a}|_nD<<AZ^ficd)bytaRGAtQw9rtotSwu@w8r^&H)|
z!gU%EXO0}?7`jAWBAW$Np!=CyGhD(v{dIp*-QjIo2-{yDpdGJa`~8u@caoq%x?~x+
zSFC<Dhy39VUw0bkuKcpzpE(|bY<18tbK1x(GMj|G65E4Tza%MaVaTtvG;NyvdXfCP
zDEu0Hze+BCwPQZB8}q43ty(iY#Jjx`iuoK3`Gj<$FXpFRVqX1|4dtF-;x9AN$AVjI
z+YDp}7|8fw;JFI}p9BMA#J~xCtx#QUm`#t~=QC4|I5xz<JZE4yM+gS~F#{uW!AZSU
zD;G_lBq*}T1!Kd2?0(LB;}XMe=RC`Qn($u$WB8O_sg!+x$62}jorhe0P%sd{Tz=YS
zpl%k;a?3je);@6ELoOHlKoIwVoL(=s^tDZ|-tRH6?12HX4+N2cGn5C`^=hrKaiivg
x0g(&Fhk;SKz)0KsfIkA9eLyfUCJc<)2MohL514*)0e#nf@W6mL4+QMH?l%gfr9S`w

literal 0
Hc$@<O00001

diff --git a/ti/audio/tas257x/tas257x-1amp-reg.bin b/ti/audio/tas257x/tas257x-1amp-reg.bin
new file mode 100644
index 0000000000000000000000000000000000000000..c129baa9af591216ab91375d38e768bbad774c27
GIT binary patch
literal 416
zc${NkU|g`R;q+$)21ZsOX3UcLR?i4zFf+gbkjqfRFoHpHVsWa0p>A<OYGQV35m`ns
uF|sf|0@4yd%nS@sV3=~+F|aV$0l5l58W`M6z(8l@1j=(TfWjOi#smOH1Pu-V

literal 0
Hc$@<O00001

-- 
2.25.1

