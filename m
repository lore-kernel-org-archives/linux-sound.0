Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B46FB3ED3B0;
	Tue, 19 May 2026 13:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779198899; cv=fail; b=pJ5YD7d/9Wh0rL7LElmI0LgAoTdzFDSYNYv91/mkvyQ1oxaoXimGEhStRqVnFTB4MK8yX1K7/2BGKrBRt5vMxtrDdTN//t2Me/L8FORP8SkiE4V2iqSidFdE4sLWsgRUC1EMF8RoEIMQjTMfyr0/WJ8jDmFNAUXbdNVg5VxNU70=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779198899; c=relaxed/simple;
	bh=k+bHhsVgmMFq9H+kqMODdccRzjKjWxu9m7bRd8iHvQs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N6bYLvOkB/3nrVe1m4GHT84vgqCYgIggGev44Jm6m2qmU3GkLNE2i21/8j+/NdvZ777dcty+DWHYLj5TWuMszwnJ5gxb6DbHl3Jynp9MorxqKhQvBogcGm3C81bSu1VChN5GoF1hvqzKUQo1o6MlRcvV0lHm8M7QYgxgyM/y8zY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=nYqElYL8; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=TrJg3zOt; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="nYqElYL8";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="TrJg3zOt"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J4vHNH1263394;
	Tue, 19 May 2026 08:54:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=pvbemie9qg+jG2sF6d0e+ZumDIa6KpzDrFjLHT9wivc=; b=
	nYqElYL8wVg31EB9d/xZzaUhZoxHZmjR7jssUYqnXG2gJ9i0tTQtjfnT1kqa1zPd
	ovB5P0v0zIUQ8yMMCMOPmPSER2P+q099sUO+Be6h2+SnwQ8/BsQMBVhAQ5Ltn5bH
	ZLGf/7CnUTuw3KDOL81k/Lhtt26ps8pIuiVXieOQ5QNEJXfFBGIinhv5k5VNt9iY
	qaK1BWvDpViCduqsBlAGiUGxI+k19LTM0xniHeS+O9+CxHhSjpLx0SYFxp4v0Fa+
	3q2GS+w1+StvKMHOTMGpFc1zjdanoWhDFFhfYsSFCi1mThjHhGBGwoxIXsHWaEjC
	8K5pyytFoo1XsV2IstfYYw==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11020095.outbound.protection.outlook.com [52.101.201.95])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4e6n0hbpma-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 19 May 2026 08:54:43 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QAQo+RyYUnl8TLCvgKh2TPoLSHGAGwaEV22bUP0AFXMzRTFLpPQ20ALL8OeFlCzwmAM/4O1o0GE5SouYxIEjP9tCt1BUg6b1vNuxCycIfqiTtl3r5jgJGEM+FJHTnlmRxzbxNDqqm5VxZ0av5A8hgFevcgGgaWmQ7/RYmeMPzAbYXD7NnqrVDVzUBUx8YDCC6nA5oCVdIfAj7qV7x5UASxtrb/JmF68bNnqiGM0flnsfBu9ry9lV6Mad+/dQ9qMZa/rpzNcgBqN0rP4i3XoiDWPtBlNgsuz3ucIFD4qDjmGVjVmUYcJzf8WR12n1HqVTcvcBLFlgHE1jmWhYmO8TIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pvbemie9qg+jG2sF6d0e+ZumDIa6KpzDrFjLHT9wivc=;
 b=OY++UpCuB93WAzX6R2qCHplmHI0cdiA7JTbEe5ZvxWyAMtTyoXq2Np7jQ7CCP8tRbMRfzbs8bqhm0W7yi5CTuJCvTU7gTgxnzISx8bHceQo104NuUlLVcZDN6C67IotkV44gdtH5egxAygGHpDsFWTuFHvpd3puQEMt4QW/sBRM5sT/VmSFT8kq8sho4d6tFGNrTb2e27oHY2JYnenerXlqp29w/pQExhe7kHNobwx2dtJVX7FwHCtqEF/YkUaxzN6tORaH927cVITgvpXSTrTuPHLvrPAs7r/RDdp1m68sZUTET/Isc5/IRkgyRPMJjYgndjkjHaA/DDWIVM9tUHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pvbemie9qg+jG2sF6d0e+ZumDIa6KpzDrFjLHT9wivc=;
 b=TrJg3zOtggk66H04ziP+VwHvgjlmiee8Wqr5bNU/BWP40XFEy+MrZpY1LkYQ+ryPH7lzKTMTgT1rVBhGMILow6dea7/BWtHb5i9qJ5hsG1KlE7pVX3MfeBTzy2zS+khUmb8RwRrnWCb4DwFZvH7vAt3f15H9TTDGpdhwE1SgpHY=
Received: from MN2PR11CA0012.namprd11.prod.outlook.com (2603:10b6:208:23b::17)
 by CO1PR19MB4966.namprd19.prod.outlook.com (2603:10b6:303:f6::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Tue, 19 May
 2026 13:54:37 +0000
Received: from MN1PEPF0000F0E0.namprd04.prod.outlook.com
 (2603:10b6:208:23b:cafe::1c) by MN2PR11CA0012.outlook.office365.com
 (2603:10b6:208:23b::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.14 via Frontend Transport; Tue, 19
 May 2026 13:54:36 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MN1PEPF0000F0E0.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.11
 via Frontend Transport; Tue, 19 May 2026 13:54:36 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 6CC0F406550;
	Tue, 19 May 2026 13:54:35 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.13])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 4C218822542;
	Tue, 19 May 2026 13:54:35 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v3 3/3] ASoC: cs35l56: Use standard SoundWire regmap implementation
Date: Tue, 19 May 2026 14:54:35 +0100
Message-ID: <20260519135435.479949-4-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260519135435.479949-1-rf@opensource.cirrus.com>
References: <20260519135435.479949-1-rf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E0:EE_|CO1PR19MB4966:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 5da4b85c-d029-4e0c-d579-08deb5ae29de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|82310400026|61400799027|11063799006|18002099003|16102099003|22082099003|56012099003|3023799003;
X-Microsoft-Antispam-Message-Info:
	8Rs4OjhT1wvR9slQgvlJ2qjEir06ExB4PV0uqD19Jv+FF9OMx8xIcSNtU7jjaJCEzRZP6UJfL7QjdSzmBh04bl7JktmnQWLNqJGRH5RL47o2X/tr61RHxEvGMRLmK7G1xOsH9dOgu4PA5sEjr925XamJE7p/H2c/Yl1F8rxLMVYyPT+ypxgTCLCEKbkHsDReM922YSaQ0nqESxaoge9Tmf1TIwKcPqmdgjNRVw0VtCHz3sN+tB5WQxNsWcaYKLoilmam+eWdoZ6y6DVPZHYTgdjdRG6BlN1sWZ6UuOVdUh//BEH77F1+mdDE8TEoL/zwmgSId9/qY0Qnj8Dx8mjRe+rFoeZyhbUUTdmLpXGooRgiVf3l0+LHK/0Aqz/KJi81Kcd6ftmlQKgEYcOFbk29DGhDgiAuNr45Pq9aqojuUAaHWnqTQqy+rPUTjhixkXqRhYv/6cPKp91aaUjtsC+3Zi+gGLAt5Qs7oIlk6Y3XnNUMsTEqMiPwV5IOUM63sOjF7hI8/UETp3tRZGsblbU2rFTfDNUvW7MyfzgESEChp+oQSr7Z2UgI0CfvmMazLxf+WEO+vqMCcPnPXpJrChsoP/mhTrSnpkTpwSc1kYn93Mv3VPyhLpRJ3HEegNvY4LWYj9SVKcQ2LYge6F0UKE3D9TSOC0ify6nX0sBWZcBu7lz05wd9oQGGSGzdb0cRlWWszVrNpdRiKXVbI3q4FpGOSNjaCFdP29jxipVBK/oZw+8=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(61400799027)(11063799006)(18002099003)(16102099003)(22082099003)(56012099003)(3023799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	w2uBpj0yO4FmYBi8MuxcUaz6TVR+nLGd83gBWZWA5+c8XIzCBF7gJ/cR067ttZ9qZZq1pOBgUHI0Ir9JLlh+6qHYHNIQE2yeZbpYb4/L85XOnozou+7Y6TC3MxDPeIwnqlUmjLHTaR5pZWQsiMdtCwAPNVLazvk8tCA05uiwYBRN6j+kmF23rEa3Z/izja0DKQXA0lYitAchBbEn3FT+aNuxpRoRl294hOvRrDkVCkvVCCFo+ZFcifnoH9XfpfYdPp2c95US8U4JpuPHtWGDmrd6vsMudMlqiHjnYuPDpBgQXCElPSzKy90OYBP6WI2buMO7X7XMP/qO6Ja2ODdWsRN8M0dLDZRFfa/3dwI0ry0T4VrhAO5JLHWKz/YlJEkI65qkbBiwgrs+bw9xPFETwiz6H01MocMwCGP/lfEX0aBqiEql84C1Uvm7JDa1NQVK
X-Exchange-RoutingPolicyChecked:
	biWXI7EW+I3d14xtmYjWbwLGJEY6sFjKGalRUOgW3HuiMcEng6TRnaxS10qQ3v3r+SbiF2QOxxkXEz7IlHVVnbLylZS02oQ8yIxgL7ddMKgEucEGz1AfyfydPY1bHuUV6LZTo88QdhLQt8K7c4xECs8xRr1iu4OMkNksXEWq0yppxjWCkXzY4/HmW/X5DY137VnbYgeD5FmcPC9AjqMTZeY11sNBByJoV2YdfUVCJnRCdHQbqE00VtnIJMEbQTD5kQewWDVt9ihJXCIACUdrpJ5XIjcUkhmTMx04257eCtivZkgfUgN7SOF+3wZt1wYuQnKS2r8bhAisXsUoXGSxFA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 13:54:36.2543
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5da4b85c-d029-4e0c-d579-08deb5ae29de
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MN1PEPF0000F0E0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR19MB4966
X-Proofpoint-ORIG-GUID: Zn_RPqwLQmA-qSjf-gMiMxyDQ_S-uSht
X-Authority-Analysis: v=2.4 cv=Cag4Irrl c=1 sm=1 tr=0 ts=6a0c6ba3 cx=c_pps
 a=kIUNUHS17e34GyAlH7lOBA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=52NS7YWLYOiMMeI0TnwA:9
X-Proofpoint-GUID: Zn_RPqwLQmA-qSjf-gMiMxyDQ_S-uSht
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDEzNiBTYWx0ZWRfX0XtURjeAbMvq
 AUFQFyXc7EinBOehMb176e3t1dcF3ikQUeNGoXTC24L3UmP5pmL/NFisFvhzEg1dPpTEMm3DhhW
 k39RKKYfL8vmEorb9zj/dKAoZi+4eH7IMXoDcFt7cDrqWFjxnRxArBX1gCm1E9JliL5GIekL7o4
 7WET8b2QLXCxC+aVXQHrmM5GXi4kaxErdnZ4ZxjH+tIwhQQzi8xMsqRKSPO6rLJpD5TKLVgyQie
 ZOY+ucFRQkAU5+ZDk8PsJan3ZMXeUh0PKLxpC0bnPMPPJOleSi0jryjHeJZl8buSWyOPEkHIM/w
 VUdMlghs33xtfPMOW0jAzTFm4Wm7M6LGmYzcyolHc057fGB11a3f6PZuuHWiXvgTV0XTTty/RjS
 z9o7XDqYtEcjcjkEhIBDN94VmyuGG90YdCKiZXr+ZR5eCNhs/GSza85LvGSTPmrnnl5hl59cdsq
 7GE+A/95R3r3DQbFl9A==
X-Proofpoint-Spam-Reason: safe

Use the regmap_sdw implementation for SoundWire instead of
re-implementing the low-level bus transactions in cs35l56-sdw.c

The cs35l56 registers are big-endian on I2C and SPI but little-endian
over SoundWire. The firmware files are all big-endian and contain opaque
blobs in big-endian order. So these must be endian-swapped to transfer
over SoundWire. A custom regmap bus implementation is used to do this
endian-swapping.

The original implementation of this custom regmap bus was a complete bus
backend, performing the endian swapping and low-level SoundWire bus
read/write.

This commit changes the custom regmap bus to only perform the endian-swap.
It uses an underlying simple uncached regmap_sdw bus to deal with
transferring the 32-bit registers over the SoundWire bus. Although this
adds a small amount of overhead, from passing through the regmap APIs
twice, it avoids having a local duplicate implementation of what regmap_sdw
already does.

The slow-read handling for OTP registers must access 8-bit SoundWire
registers so it still uses low-level SoundWire bus reads.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
No changes in V3

Changed in V2:
- Select REGMAP_SOUNDWIRE

 sound/soc/codecs/Kconfig       |   2 +-
 sound/soc/codecs/cs35l56-sdw.c | 132 ++++++++++++---------------------
 sound/soc/codecs/cs35l56.h     |   1 +
 3 files changed, 51 insertions(+), 84 deletions(-)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 5fdd0334c355..a7c61f7c7f4c 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -887,7 +887,7 @@ config SND_SOC_CS35L56_SPI
 config SND_SOC_CS35L56_SDW
 	tristate "Cirrus Logic CS35L56 CODEC (SDW)"
 	depends on SOUNDWIRE
-	select REGMAP
+	select REGMAP_SOUNDWIRE
 	select SND_SOC_CS35L56
 	select SND_SOC_CS35L56_SHARED
 	help
diff --git a/sound/soc/codecs/cs35l56-sdw.c b/sound/soc/codecs/cs35l56-sdw.c
index d9dcca1e952f..d2b82a846ae8 100644
--- a/sound/soc/codecs/cs35l56-sdw.c
+++ b/sound/soc/codecs/cs35l56-sdw.c
@@ -17,6 +17,7 @@
 #include <linux/string_choices.h>
 #include <linux/swab.h>
 #include <linux/types.h>
+#include <linux/unaligned.h>
 #include <linux/workqueue.h>
 
 #include "cs35l56.h"
@@ -95,55 +96,23 @@ static int cs35l56_sdw_slow_read(struct sdw_slave *peripheral, unsigned int reg,
 	return 0;
 }
 
-static int cs35l56_sdw_read_one(struct sdw_slave *peripheral, unsigned int reg, void *buf)
-{
-	int ret;
-
-	ret = sdw_nread_no_pm(peripheral, reg, 4, (u8 *)buf);
-	if (ret != 0) {
-		dev_err(&peripheral->dev, "Read failed @%#x:%d\n", reg, ret);
-		return ret;
-	}
-
-	swab32s((u32 *)buf);
-
-	return 0;
-}
-
 static int cs35l56_sdw_read(void *context, const void *reg_buf,
 			    const size_t reg_size, void *val_buf,
 			    size_t val_size)
 {
 	struct sdw_slave *peripheral = context;
-	u8 *buf8 = val_buf;
-	unsigned int reg, bytes;
+	struct cs35l56_private *cs35l56 = dev_get_drvdata(&peripheral->dev);
+	unsigned int reg_addr = get_unaligned_le32(reg_buf);
 	int ret;
 
-	reg = le32_to_cpu(*(const __le32 *)reg_buf);
+	if (cs35l56_is_otp_register(reg_addr - CS35L56_SDW_ADDR_OFFSET))
+		return cs35l56_sdw_slow_read(peripheral, reg_addr, (u8 *)val_buf, val_size);
 
-	if (cs35l56_is_otp_register(reg - CS35L56_SDW_ADDR_OFFSET))
-		return cs35l56_sdw_slow_read(peripheral, reg, buf8, val_size);
+	ret = regmap_raw_read(cs35l56->sdw_bus_regmap, reg_addr, val_buf, val_size);
+	if (ret)
+		return ret;
 
-	if (val_size == 4)
-		return cs35l56_sdw_read_one(peripheral, reg, val_buf);
-
-	while (val_size) {
-		bytes = SDW_REG_NO_PAGE - (reg & SDW_REGADDR); /* to end of page */
-		if (bytes > val_size)
-			bytes = val_size;
-
-		ret = sdw_nread_no_pm(peripheral, reg, bytes, buf8);
-		if (ret != 0) {
-			dev_err(&peripheral->dev, "Read failed @%#x..%#x:%d\n",
-				reg, reg + bytes - 1, ret);
-			return ret;
-		}
-
-		swab32_array((u32 *)buf8, bytes / 4);
-		val_size -= bytes;
-		reg += bytes;
-		buf8 += bytes;
-	}
+	swab32_array((u32 *)val_buf, val_size / sizeof(u32));
 
 	return 0;
 }
@@ -157,57 +126,34 @@ static inline void cs35l56_swab_copy(void *dest, const void *src, size_t nbytes)
 		*dest32++ = swab32(*src32++);
 }
 
-static int cs35l56_sdw_write_one(struct sdw_slave *peripheral, unsigned int reg, const void *buf)
-{
-	u32 val_le = swab32(*(u32 *)buf);
-	int ret;
-
-	ret = sdw_nwrite_no_pm(peripheral, reg, 4, (u8 *)&val_le);
-	if (ret != 0) {
-		dev_err(&peripheral->dev, "Write failed @%#x:%d\n", reg, ret);
-		return ret;
-	}
-
-	return 0;
-}
-
 static int cs35l56_sdw_gather_write(void *context,
 				    const void *reg_buf, size_t reg_size,
 				    const void *val_buf, size_t val_size)
 {
 	struct sdw_slave *peripheral = context;
-	const u8 *src_be = val_buf;
-	u32 val_le_buf[64];	/* Define u32 so it is 32-bit aligned */
-	unsigned int reg, bytes;
+	struct cs35l56_private *cs35l56 = dev_get_drvdata(&peripheral->dev);
+	unsigned int reg_addr = get_unaligned_le32(reg_buf);
+	u32 swab_buf[64];	/* Define u32 so it is 32-bit aligned */
 	int ret;
 
-	reg = le32_to_cpu(*(const __le32 *)reg_buf);
-
-	if (val_size == 4)
-		return cs35l56_sdw_write_one(peripheral, reg, src_be);
-
-	while (val_size) {
-		bytes = SDW_REG_NO_PAGE - (reg & SDW_REGADDR); /* to end of page */
-		if (bytes > val_size)
-			bytes = val_size;
-		if (bytes > sizeof(val_le_buf))
-			bytes = sizeof(val_le_buf);
-
-		cs35l56_swab_copy(val_le_buf, src_be, bytes);
-
-		ret = sdw_nwrite_no_pm(peripheral, reg, bytes, (u8 *)val_le_buf);
-		if (ret != 0) {
-			dev_err(&peripheral->dev, "Write failed @%#x..%#x:%d\n",
-				reg, reg + bytes - 1, ret);
+	while (val_size > sizeof(swab_buf)) {
+		cs35l56_swab_copy(swab_buf, val_buf, sizeof(swab_buf));
+		ret = regmap_raw_write(cs35l56->sdw_bus_regmap, reg_addr,
+				       swab_buf, sizeof(swab_buf));
+		if (ret)
 			return ret;
-		}
 
-		val_size -= bytes;
-		reg += bytes;
-		src_be += bytes;
+		val_size -= sizeof(swab_buf);
+		reg_addr += sizeof(swab_buf);
+		val_buf += sizeof(swab_buf);
 	}
 
-	return 0;
+	if (val_size == 0)
+		return 0;
+
+	cs35l56_swab_copy(swab_buf, val_buf, val_size);
+
+	return regmap_raw_write(cs35l56->sdw_bus_regmap, reg_addr, swab_buf, val_size);
 }
 
 static int cs35l56_sdw_write(void *context, const void *val_buf, size_t val_size)
@@ -226,7 +172,7 @@ static int cs35l56_sdw_write(void *context, const void *val_buf, size_t val_size
  * byte controls always have the same byte order, and firmware file blobs
  * can be written verbatim.
  */
-static const struct regmap_bus cs35l56_regmap_bus_sdw = {
+static const struct regmap_bus cs35l56_regmap_swab_bus_sdw = {
 	.read = cs35l56_sdw_read,
 	.write = cs35l56_sdw_write,
 	.gather_write = cs35l56_sdw_gather_write,
@@ -234,6 +180,18 @@ static const struct regmap_bus cs35l56_regmap_bus_sdw = {
 	.val_format_endian_default = REGMAP_ENDIAN_BIG,
 };
 
+/* Low-level SoundWire regmap to transfer the data over the bus */
+static const struct regmap_config cs35l56_sdw_bus_regmap = {
+	.name = "sdw-le32",
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.reg_format_endian = REGMAP_ENDIAN_LITTLE,
+	.val_format_endian = REGMAP_ENDIAN_LITTLE,
+	.max_register = CS35L56_DSP1_PMEM_5114 + 0x8000,
+	.cache_type = REGCACHE_NONE,
+};
+
 static int cs35l56_sdw_get_unique_id(struct cs35l56_private *cs35l56)
 {
 	int ret;
@@ -555,8 +513,16 @@ static int cs35l56_sdw_probe(struct sdw_slave *peripheral, const struct sdw_devi
 
 	cs35l56->base.type = ((unsigned int)id->driver_data) & 0xff;
 
-	cs35l56->base.regmap = devm_regmap_init(dev, &cs35l56_regmap_bus_sdw,
-					   peripheral, regmap_config);
+	/* Low-level regmap to transfer read/writes over SoundWire bus */
+	cs35l56->sdw_bus_regmap = devm_regmap_init_sdw(peripheral, &cs35l56_sdw_bus_regmap);
+	if (IS_ERR(cs35l56->sdw_bus_regmap)) {
+		ret = PTR_ERR(cs35l56->sdw_bus_regmap);
+		return dev_err_probe(dev, ret, "Failed to allocate bus register map\n");
+	}
+
+	/* Wrapper regmap to simulate big-endian ordering */
+	cs35l56->base.regmap = devm_regmap_init(dev, &cs35l56_regmap_swab_bus_sdw,
+						peripheral, regmap_config);
 	if (IS_ERR(cs35l56->base.regmap)) {
 		ret = PTR_ERR(cs35l56->base.regmap);
 		return dev_err_probe(dev, ret, "Failed to allocate register map\n");
diff --git a/sound/soc/codecs/cs35l56.h b/sound/soc/codecs/cs35l56.h
index cd71b23b2a3a..d029fa3f8656 100644
--- a/sound/soc/codecs/cs35l56.h
+++ b/sound/soc/codecs/cs35l56.h
@@ -37,6 +37,7 @@ struct cs35l56_private {
 	struct snd_soc_component *component;
 	struct regulator_bulk_data supplies[CS35L56_NUM_BULK_SUPPLIES];
 	struct sdw_slave *sdw_peripheral;
+	struct regmap *sdw_bus_regmap;
 	const char *fallback_fw_suffix;
 	struct work_struct sdw_irq_work;
 	bool sdw_irq_no_unmask;
-- 
2.47.3

