Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013067.outbound.protection.outlook.com [40.93.196.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB471547EE;
	Tue,  3 Feb 2026 04:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770091502; cv=fail; b=K7wsH1xysV248aSia3y0nQZEzuEVVqp/zZ95zxj6/1hy1tzVw/QtLLaZ8+aSFWS2hEqpjWccZpL6IsGLTHLjgcnwz8fRzWp4i2vJ1aE+bdv2QYu5OBt/8QYe7I/HxqurbV7FBUC7fnfaRgX0lSQKziIxVqj3Kp57lY95Nx782WU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770091502; c=relaxed/simple;
	bh=uJTsf/0tXXugKexGDTQOOkU+YlS103HHiGEOKww83Eg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=KUDeL7VhefctFSdJpNqcr/U+u839bTPvykBq6xCLL3Uq1iWasv2Ahl2dtbQuObveqSD3HxM6HDE2P5/RtSeCy8KBrBf8rPXpxijr0ZoicOVZ/vbI55z+52AVXblGrfD36X3CwlQTtNJBxUsgU3VpM5pbeFZJteIi3qFrOlSXLR0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=D0OEyWhU; arc=fail smtp.client-ip=40.93.196.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="D0OEyWhU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t7nr0VxO6XcFDCaHCBvixHYaeapyvBbahaQHj0/sH9+Ad5CTrRWBj58qoUbuqd53D9P3varQDo2JpWJXlOos+qSaeoqPg61WJHZf2DXdAkQUYIkYevi+XQZF8n9n6JM/LOxibcc1sJv00HpPHJeH5wWBv+m/tW7h1rHcCzCfvf9d1dR/IfmPNWyYg+ekB0BZ5AHXPsEMmqKq5UbJ5cEt0sp7cZn88EiUdwTofA5TlDz0himabPGP+I7vLSoyR+Kxy8SJbAGbZIpqHamCqXgEXmICWME1Sbg+E8HRAHe96M5BryJztP8XMw/CfmI/kqKXkZBk6iYT2xl7jYS5llKIsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DErRRd+fQfTutZKOwASb2AiEYlCzzwtwqTfPSvrIbI4=;
 b=iNQf0Lqac6lsbCfLW65sakRbn2BZRNBbT3vHBPlphUoeglyESsgTaUzmQNNqgg2eL7LSte2qLRdQW8mGMHfS5KRSuk5L3Go+xVisYHLPn0Ou/d/u6H/rp7MOAfxyhkuJyql/cdrhBt6MRd0niAyVXieqg2jTQ9YY5ArZf9RYxEF2xZ0zya0r/gD3zn7l2xD0lGnKHoumu7V1769P5foODwuJ5uR5tzVZuNsLLLG1Udj6fkGCIrMP72P21rvyJbKi9V/fVf+DsjbSP6F0Uc/Ucyw5PU8QjRMBAORJccYCrWV3tfAsDkNyu1lkdFvsvVity9QN4ylTTrpqRAUwnXC18w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DErRRd+fQfTutZKOwASb2AiEYlCzzwtwqTfPSvrIbI4=;
 b=D0OEyWhUT/IpE6BOkcN3FGfjuDuGdndEcUZK2Ykly8l2IWXE35jaIBoAPAPWlfBy5CbM/Ny/ssoDcXir9KkgxutYRLy9NSNbsY6MlhuwcvPcJLVH41YXz58B+VA/RrWx2/tWilitPhDFZ+woStCbmwj4ARC0iTi/JVBtWOO+Su4=
Received: from CH0PR04CA0101.namprd04.prod.outlook.com (2603:10b6:610:75::16)
 by PH0PR10MB997667.namprd10.prod.outlook.com (2603:10b6:510:382::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.12; Tue, 3 Feb
 2026 04:04:54 +0000
Received: from DS2PEPF0000343B.namprd02.prod.outlook.com
 (2603:10b6:610:75:cafe::e8) by CH0PR04CA0101.outlook.office365.com
 (2603:10b6:610:75::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.8 via Frontend Transport; Tue, 3
 Feb 2026 04:04:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 DS2PEPF0000343B.mail.protection.outlook.com (10.167.18.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Tue, 3 Feb 2026 04:04:52 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Feb
 2026 22:04:28 -0600
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Feb
 2026 22:04:28 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 2 Feb 2026 22:04:28 -0600
Received: from LTPW0EX92E.dhcp.ti.com (ltpw0ex92e.dhcp.ti.com [10.82.30.14])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61344OZ42864255;
	Mon, 2 Feb 2026 22:04:25 -0600
From: Niranjan H Y <niranjan.hy@ti.com>
To: <jwboyer@kernel.org>
CC: <shenghao-ding@ti.com>, <baojun.xu@ti.com>, <linux-firmware@kernel.org>,
	<13916275206@139.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <sandeepk@ti.com>, Niranjan H Y
	<niranjan.hy@ti.com>
Subject: [PATCH v1] ASoC: tas2783: Add Firmware files for tas2783A
Date: Tue, 3 Feb 2026 09:34:08 +0530
Message-ID: <20260203040409.817-1-niranjan.hy@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
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
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343B:EE_|PH0PR10MB997667:EE_
X-MS-Office365-Filtering-Correlation-Id: 4462aad9-851c-41ab-ff0b-08de62d96214
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GOyZwY7N56K/EY4FS7aQiH0nUZVlNYjhL9WiSNLPTnm8aCn071reniKMrivN?=
 =?us-ascii?Q?c2mXpGtde/vcjKgZSQC9qUc2CinLuoz21Zrmo/rhQo1itR1PMwYZulA9F2kO?=
 =?us-ascii?Q?Zq+wkGNHMQtPQEitc2YQFWR8ZQfNyvI6d9BgW7RRnvZTNgSGxu1G9MaRNYVy?=
 =?us-ascii?Q?zPsivlhKe84FrOyZitUaFRKevjR3EnH5tDw19IUT70TdMtAwHciBNybHd/QY?=
 =?us-ascii?Q?u24RjEc4bOMQm51lIiJZCi2fhsi2ES5M534qL4vGQ+XfhIZEzgbhVfg1Wsxi?=
 =?us-ascii?Q?+L3tQM5TFCQD96naGS2a3VDIPGMXwxLkEm1xUZPDrciI5AavYHCbRa1CfoTK?=
 =?us-ascii?Q?00YekWPbkCTJQvru/3Hiv6xWpvFNyWgezmxogt08vH/H21Jo9+E2BQL09iNM?=
 =?us-ascii?Q?Zfk6Wv0HWtteu4rRMgL+gNoeYCtH3kW9kphtWqStS432n4ry/uifKM20WASl?=
 =?us-ascii?Q?yu13a1W1hiKbFxkqtXyBLj8lD9NjbHIfmoDGsOHRYiTnp0mHwL9GBJzqgJA/?=
 =?us-ascii?Q?20tF4r9lwueydYbRgU3YvTvSARj3cVeIUfSIleXVL9t7UxlGlCvmF216Fags?=
 =?us-ascii?Q?eF+ZFbVFjISOPDnHNJAJi2nsqOWOO5tcCt5KLMcLeaEhKnJxmNpsjqvPS0OC?=
 =?us-ascii?Q?l+ZM97Zyap+//W0smqh8S4n0WYRCL16nqoxyowf4inX1m6pYEqVF47UZMRs9?=
 =?us-ascii?Q?AKgS4SZvxOQKmLqtFoG3dS+PWUIpUlzQ/Qsh1WI0d+Fu5uLO9GIJVMplnhDi?=
 =?us-ascii?Q?uQif1hOuINvU8oP3F9r/QBqQgoUrZ+w/IG49zX+ebKWy9POZ2J1rCHHykct3?=
 =?us-ascii?Q?h0G0DhiutcvpGMOZfBEmRY2Ujuy7YOr5GnWaEMUdVN2FYiNSUYx20vXwHixZ?=
 =?us-ascii?Q?K6Rlhj+ImyMD1qJTAWhdJIoEibBT3Be1vTST8pp5pPRnGl8wUcd6LBHJAeUM?=
 =?us-ascii?Q?GB44M2pomAjPHYPzmmlqalx6j11zyVFnjmacPNTJLw6CsnRsVhDtACxi5olC?=
 =?us-ascii?Q?WdQ/lONzhReX5Dk8jG5tqY/Bfmn3ZgKo14Y8997whUaY7BPfNezgoONAtTcx?=
 =?us-ascii?Q?NJZ8AD7Ew98TXsnOM9znWFUd1ATbWe7iNfx1oN4KLDkI8+21p7CMCbjqFpuW?=
 =?us-ascii?Q?61B+j52wTjiMFQ4XmP/+gmy6jAsj7HONDgXcexqo4+z58r1/qSyqIDdWBdAS?=
 =?us-ascii?Q?i37KQjVSzw3gSZljLYFMoxi8fc3j3xg0gCeNrRDKQDNjs63iaNd1u5piWb96?=
 =?us-ascii?Q?XcGRivi97z755ZOuMQlyud3j+TjTpQZw2LW3hqM+X55+8WX0QgsHgPdzkXH7?=
 =?us-ascii?Q?8e9wQ7/CdQB6PUy94RaCWpK+DUPWbQZfpXAN4aFiDY53vl1BAw03gUTWvltC?=
 =?us-ascii?Q?/ZNiBMu2F2ju14bVosSfuL68TXlO1akFQYDwVS+KPMspoj8vjCYmTkNxOcED?=
 =?us-ascii?Q?2Iw0tWzcPPYW82oFjt8qNJ7mU1+ctsOqEvlKbBFX/Yky2C25q6O4tQM/TSLr?=
 =?us-ascii?Q?SAa7/UnD8yd+g0x9fZPaK6QwiMH19dmnmM0c6TSheCFqatRrXw0yYrq01xaa?=
 =?us-ascii?Q?RisEisjijEaPkkiPfdNf2cG/mDEOhz/6KND77ri566qBcBa1GN/fvdtIfoKK?=
 =?us-ascii?Q?q+IkjqC6K7voc5XMZjRVlJ8T008T+27RjqQ759LeYSc0rv4jcvx0fnfMqZgs?=
 =?us-ascii?Q?cIk51g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	wYzCeGtrFlf9Mq+ysplwYOH8vzYERnbA/v57Aa3Ft0+YeyYI8c0V4HaaKXtl9L0oXxKXFotuRXj9GTfHJUfYEhk8pAfywWCvg16/jFUrqX0QibhsHkmdzgi5UNRPh1GqvrVQsUKJ56oG9pTREIb+TreDSJwPS8rbpWHAlz39Ywuo0J6acjpZPzKR7ak7nK1bwmrOvRW/OJAsPT/R9mDg6KJPwfF4HiknhEkup5D4jsOVeNyoN4n5BVs6eDkUu27Y82l22mWbPO4epuZSsKeyOjLHD+VSK0YYNJFb991hfm14BNdfpfhjX/0RDgYDBxndK6RIIAL9llN1LhrfsMq8hOWc4JK6t+Ido46o+UMqexw1nH+GFy/bdtYd/G3odPr9zvfMj791lOCt7p3CeBcYapjqaX3/jpL3ez3DnrldXTItxE48lenmF7uW5PVH7Q6L
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 04:04:52.5219
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4462aad9-851c-41ab-ff0b-08de62d96214
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF0000343B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB997667

Add the firmware files for tas2783A device for HP projects.

Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
---
 WHENCE                        |  37 ++++++++++++++++++++++++++++++++++
 ti/audio/tas2783/8EF6-X-9.bin | Bin 0 -> 40746 bytes
 ti/audio/tas2783/8EF6-X-C.bin | Bin 0 -> 40746 bytes
 ti/audio/tas2783/8EXX-X-9.bin | Bin 0 -> 40746 bytes
 ti/audio/tas2783/8EXX-X-A.bin | Bin 0 -> 40746 bytes
 ti/audio/tas2783/8EXX-X-C.bin | Bin 0 -> 40746 bytes
 ti/audio/tas2783/8EXX-X-D.bin | Bin 0 -> 40746 bytes
 7 files changed, 37 insertions(+)
 create mode 100644 ti/audio/tas2783/8EF6-X-9.bin
 create mode 100644 ti/audio/tas2783/8EF6-X-C.bin
 create mode 100644 ti/audio/tas2783/8EXX-X-9.bin
 create mode 100644 ti/audio/tas2783/8EXX-X-A.bin
 create mode 100644 ti/audio/tas2783/8EXX-X-C.bin
 create mode 100644 ti/audio/tas2783/8EXX-X-D.bin

diff --git a/WHENCE b/WHENCE
index 403a1e8b..4471ef62 100644
--- a/WHENCE
+++ b/WHENCE
@@ -9177,6 +9177,43 @@ Licence: Redistributable. See LICENCE.ti-tspa for details. Marked:
 
 --------------------------------------------------------------------------
 
+Driver: ti-tas2783 - tas2783 firmware
+
+File: ti/audio/tas2783/8EXX-X-9.bin
+File: ti/audio/tas2783/8EXX-X-A.bin
+File: ti/audio/tas2783/8EXX-X-C.bin
+File: ti/audio/tas2783/8EXX-X-D.bin
+File: ti/audio/tas2783/8EF6-X-9.bin
+File: ti/audio/tas2783/8EF6-X-C.bin
+
+Link: 8E86-1-9.bin -> ti/audio/tas2783/8EXX-X-9.bin
+Link: 8E86-1-A.bin -> ti/audio/tas2783/8EXX-X-A.bin
+Link: 8E86-1-C.bin -> ti/audio/tas2783/8EXX-X-C.bin
+Link: 8E86-1-D.bin -> ti/audio/tas2783/8EXX-X-D.bin
+Link: 8E86-2-9.bin -> ti/audio/tas2783/8EXX-X-9.bin
+Link: 8E86-2-A.bin -> ti/audio/tas2783/8EXX-X-A.bin
+Link: 8E86-2-C.bin -> ti/audio/tas2783/8EXX-X-C.bin
+Link: 8E86-2-D.bin -> ti/audio/tas2783/8EXX-X-D.bin
+Link: 8E87-1-9.bin -> ti/audio/tas2783/8EXX-X-9.bin
+Link: 8E87-1-A.bin -> ti/audio/tas2783/8EXX-X-A.bin
+Link: 8E87-1-C.bin -> ti/audio/tas2783/8EXX-X-C.bin
+Link: 8E87-1-D.bin -> ti/audio/tas2783/8EXX-X-D.bin
+Link: 8E87-2-9.bin -> ti/audio/tas2783/8EXX-X-9.bin
+Link: 8E87-2-A.bin -> ti/audio/tas2783/8EXX-X-A.bin
+Link: 8E87-2-C.bin -> ti/audio/tas2783/8EXX-X-C.bin
+Link: 8E87-2-D.bin -> ti/audio/tas2783/8EXX-X-D.bin
+Link: 8EF5-0-9.bin -> ti/audio/tas2783/8EXX-X-9.bin
+Link: 8EF5-0-A.bin -> ti/audio/tas2783/8EXX-X-A.bin
+Link: 8EF5-0-C.bin -> ti/audio/tas2783/8EXX-X-C.bin
+Link: 8EF5-0-D.bin -> ti/audio/tas2783/8EXX-X-D.bin
+Link: 8EF6-2-9.bin -> ti/audio/tas2783/8EF6-X-9.bin
+Link: 8EF6-2-C.bin -> ti/audio/tas2783/8EF6-X-C.bin
+
+Licence: Redistributable. LICENCE.ti-tspa for details. Marked:
+	 Copyright (C) 2026 Texas Instruments
+
+--------------------------------------------------------------------------
+
 Driver: ti-tas2563 - tas2563 firmware
 File: ti/audio/tas2563/TAS2XXX3870.bin
 File: ti/audio/tas2563/INT8866RCA2.bin
diff --git a/ti/audio/tas2783/8EF6-X-9.bin b/ti/audio/tas2783/8EF6-X-9.bin
new file mode 100644
index 0000000000000000000000000000000000000000..061e99430e9c69b16d284cd4ed5c98d2f5a72095
GIT binary patch
literal 40746
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
RMTglHOj-D_a+uP={|`r{tC|1+

literal 0
HcmV?d00001

diff --git a/ti/audio/tas2783/8EF6-X-C.bin b/ti/audio/tas2783/8EF6-X-C.bin
new file mode 100644
index 0000000000000000000000000000000000000000..1fb90a271e165985e27cf72807b13143ce162e46
GIT binary patch
literal 40746
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%0DxAbXz?>XsP|6JtL
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
RTy&US!IXs$D~Bl^{QqdStBC*r

literal 0
HcmV?d00001

diff --git a/ti/audio/tas2783/8EXX-X-9.bin b/ti/audio/tas2783/8EXX-X-9.bin
new file mode 100644
index 0000000000000000000000000000000000000000..b63c1cc19fdd5157ba8424ef7adb92dc8b4ee7c5
GIT binary patch
literal 40746
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
H2KfH~;|8Lr

literal 0
HcmV?d00001

diff --git a/ti/audio/tas2783/8EXX-X-A.bin b/ti/audio/tas2783/8EXX-X-A.bin
new file mode 100644
index 0000000000000000000000000000000000000000..c65124efa9c0ac8adc31ac06ab651f27cc581e86
GIT binary patch
literal 40746
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

literal 0
HcmV?d00001

diff --git a/ti/audio/tas2783/8EXX-X-C.bin b/ti/audio/tas2783/8EXX-X-C.bin
new file mode 100644
index 0000000000000000000000000000000000000000..91e24aded909fdd8cec48cc84ec6273d0034be7a
GIT binary patch
literal 40746
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
Gfd3Dx9HGAe

literal 0
HcmV?d00001

diff --git a/ti/audio/tas2783/8EXX-X-D.bin b/ti/audio/tas2783/8EXX-X-D.bin
new file mode 100644
index 0000000000000000000000000000000000000000..6931e40efd8f02531cb4f77b92ed9ffc48c2d512
GIT binary patch
literal 40746
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
Bexm>Y

literal 0
HcmV?d00001

-- 
2.43.0

