Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9760819992C
	for <linux-sound@vger.kernel.org>; Fri, 12 Sep 2025 10:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757673417; cv=fail; b=Y66ZdwKZYc5mYKU82MRg1fsY1lj5wfhmp8gBJemSMsMVMGqFoBDlFHGUTdG/SWHkZTo1TlIN+m/2mRH4VgYAVwj/LjYfmYhFFOitMGGnlaCQhm7d/RIrKFYKkqAXlY5RrGSZGE58KaYsMLVM3w04CoVhQIT12Ov0hMp4XF8bTJM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757673417; c=relaxed/simple;
	bh=2H0wB2HfjQmwJnPe876NN2ekqu5PQ+GOOo7GMsBQLyc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rd00FRU2AL1agufH8W/RSFZ0zdw80wOxBKr9JnrZpl/N6PCkP26gkoF4Z7GQua3+FW51zzXajn+MJCKzrQV0Wq/zX+eDp9uwHbbzseP+MzYMqo5CcodpVdiAUAd4cdN4VmUzDE+lYAxQZp7Te0AKM+HuWEr3n4TfMygmZgh86jI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=MOfyl1Ye; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=ax6dpXJT; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="MOfyl1Ye";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="ax6dpXJT"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58C4oDtg1137784;
	Fri, 12 Sep 2025 05:36:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=y4bYMTcfcqTOJdmgWpXnhDukS4uXJLU9yEyJf6Lt/t8=; b=
	MOfyl1YeqVZiu4OdhcUdBZwr6i6ANrzWT+02JNB0l+9BAJSkZAQiYXmzvdyRZ+Gm
	1YB8wJYImK3VJgwslCUXUs8a6R1Jaq5Ye4+GA1C0mnIjuXuR4Md5QJhoMcx7epSC
	1pYhC4tPFqHBbitbbORJ7DgmIu7GTKlkohYw5bo/yv+PNcNLLN1Ve0tHmHp6x33D
	NkRd1jT0QCWRJ3miOdxl3PuGd4qtlSJVwTVnXxmMsxwH1gGRRG8EfDMaFTtiTgBP
	KNMy1YdB5WYTkw/CzjdkpK9e+mgYY1Jr5b9AgLZTXAqYUSYPw81U5P5wWkRs/E1K
	7RvrsUkZ8dUtJidIqBt4vA==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2104.outbound.protection.outlook.com [40.107.244.104])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 492q6tcpna-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 12 Sep 2025 05:36:47 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=noWoAhYS9eCowiJ7jpdLLhyRpYO/nEaEl+Lq6lEitznY+eapt9iDfM7HlzzOg74JOVjLXJXGM/Zz/RQIps5EEhX4EZ8eDthWnQMemv0Gf3mcoWRJMHkixX8ZxlmRgA/ZmOK0U/Ys8dxMOCAL7dMH4qxVsKFED4+z60pAkV0ijGSE8rfTAMzNJbZ7o/bkxPqwNq9fftK34j7mOGpcMX6kBvlcej+Vr/OWeJf6wJflQt8s1jvZmY13+lcfppbSrKHuaVa+QOv3KCrRENUzYIkFMkt1w2Sk3/eZL0rIujjD4qaxenMDoXTSck1hSP4YRACE/jZ3DjaHpyaW+kaRqA5D1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y4bYMTcfcqTOJdmgWpXnhDukS4uXJLU9yEyJf6Lt/t8=;
 b=Rb95VmyN85lB+QyuZ/0wYsTXXc0vH2eF7/hlF1Oadd4AvDXxXeC+cu4qdMqufRffcVp13d2wL9mWw5pAezwFC9DIqUY57qX3y3CHOqzyEm4M0/i81RTU1gjkAlKz3acedPT13QQ2XZDrWv36rTYxDc8YAt0vAPXgqhafmIfOyzgPXvbHEr89xF4OIUN34QCUV8LYjeW/5zo+1r8q7BDnK4N352FmdwDrPoVLuOrWcuUBnI/RkUKYC8CfIC5cRVPpCHjx2XimmAEVtM8PPIFtVdVa8/b0M2At8KX7tb/h14iLzThHeTgQT1XvIWi/vvtZOzGScFN/Y0vopY/8RbH9yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y4bYMTcfcqTOJdmgWpXnhDukS4uXJLU9yEyJf6Lt/t8=;
 b=ax6dpXJTt5YoRSA/hKDCsRd3YHj6+pnYobX4XNIDVUdilasnoyG/O0OMP5cWTLET+/15QQxQT4d2aO2v/czQxm1zZd+4gJ9Yi224hxcvpImN5Obmc0DBlpfQ6sDbEYJZoWLAUKH/CJ4mcHuo1kGqEUCxjlBYDO/YgyjRKIq1zVI=
Received: from CYXPR02CA0044.namprd02.prod.outlook.com (2603:10b6:930:cc::12)
 by SJ4PPF04F8C1DDF.namprd19.prod.outlook.com (2603:10b6:a0f:fc02::a05) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.19; Fri, 12 Sep
 2025 10:35:15 +0000
Received: from CY4PEPF0000E9DC.namprd05.prod.outlook.com
 (2603:10b6:930:cc:cafe::21) by CYXPR02CA0044.outlook.office365.com
 (2603:10b6:930:cc::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.17 via Frontend Transport; Fri,
 12 Sep 2025 10:35:14 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000E9DC.mail.protection.outlook.com (10.167.241.75) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.13
 via Frontend Transport; Fri, 12 Sep 2025 10:35:13 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 468E1406566;
	Fri, 12 Sep 2025 10:35:08 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 3EB5E82024A;
	Fri, 12 Sep 2025 10:35:08 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: rafael@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v2 15/19] ASoC: SDCA: Add FDL-specific IRQ processing
Date: Fri, 12 Sep 2025 11:35:00 +0100
Message-ID: <20250912103504.2679226-16-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250912103504.2679226-1-ckeepax@opensource.cirrus.com>
References: <20250912103504.2679226-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9DC:EE_|SJ4PPF04F8C1DDF:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 20fc386f-98e2-4da4-972e-08ddf1e80ece
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3qpfKuo3qGtZk0tJ9qzVGvAD7HbLUYYeNDodACbWF+nux4BB14b1cIOXgyZl?=
 =?us-ascii?Q?S6gq/CB1zbGWSAV3+WIA5wdpSdRPCsq2FpBTVCnNorspzai4JWsKFzF3pZve?=
 =?us-ascii?Q?f8N8JhEwJl/8/zXt7Uj3Yc9U3At42XNubgHqxBJT/ZaddnLBdhM6EXgO8qKm?=
 =?us-ascii?Q?PRfTsHVLLh5EiAuRBqUDxCO01EHjk5RqrD+CorXYX7QF7d7hIW/9J3gbStLE?=
 =?us-ascii?Q?JGEroU71s7DPPTTMKbSVCdhHiynD9NEqB2ZL3hz56Mn6Iukn93Rz0DDRRNDO?=
 =?us-ascii?Q?ZDDK7LzWNteolRUf/ed5d7LDcv5XAdAYpNMFn2znFPICXJjXF2mogX7hCuea?=
 =?us-ascii?Q?Fh3gjdlutlyF8NND56x3WRkTsZgdSjFRSLOSxAJ0HBtvqqws9F5BuVIL1HCj?=
 =?us-ascii?Q?/dXH2XfRKXtNv85HlgDVZcEqcGxh75GwJmYqjOEOcryuu1aCFBC/Wx7EuKIk?=
 =?us-ascii?Q?rHQYV9fZZB1V2av+krqUJmY7rpWxtTC/sMt0RD/V9FRy3jvb8/XKPipffktm?=
 =?us-ascii?Q?Ybs/fxAONNTx5oyjhUtszqRyUR7YEiK1yYc6OI7POWEUK+wxTMmxa/jOACB1?=
 =?us-ascii?Q?1j4BEIAxnpXnwlRjVU6MBgGYyZGkKZQHcId1wvF6RnT39ecIWYxpa+L0haxW?=
 =?us-ascii?Q?TkAK7nucPfx7gJIhX7zGHdND5bZ37vScuwUorDmvPLJOpxByJ1UMueT1zZ3F?=
 =?us-ascii?Q?mE6K/rzgYM5F7ukXt/mn+93Z26Wnc4XKh19vqpZfNPIsQNjf4Ztzp1S6veu2?=
 =?us-ascii?Q?MbT1OrcVTmmxWglf9O5MaXFX0YptR8g+T5tT6ImIz86jH1dkaOHLBxCl4qXy?=
 =?us-ascii?Q?xN4JFtcvUcsbVzfH4uaQxoHRbMFfI0Mr1ifpzUiKw+u/bpuOWsalVP+yBNE3?=
 =?us-ascii?Q?0AFX7+iduSSoPnDRnRc2QbmZCzh4MiI0XMP7X5YTMHdkfTJI8ksobzzAQJv0?=
 =?us-ascii?Q?s/UKFs5Dm+tbOJlKes0co4SXl79IZpxEgvLSCQJbcWZmGuSsSoai++r/EuHV?=
 =?us-ascii?Q?D/T9Ul0xtb1Op+AqmHGEvc4FZDltmv5j1ie5UkfhaovlTssye6PnaMXnxNoo?=
 =?us-ascii?Q?zkR8TR0GnawzzStWuXFFcnSOltD2LHYkBJjdxFZCOGLdmZBibE5V+5Qf2QCa?=
 =?us-ascii?Q?5V1ovAxG7mr+QIRx6h/JezrrO6LfIBqn0xrwaGyPmarM4+adcJSjPywc/CBk?=
 =?us-ascii?Q?eRd/GB9Y6JLhbASpHDYtKKuQbpz57y1kKUt+vFOTMHbyXVDwK/DDEjJYYtnT?=
 =?us-ascii?Q?Zdozggq29nKgyINVws0HgiLsflkvoVqk/i/PVGi2aVhSvsUmCOww7ALQPfwQ?=
 =?us-ascii?Q?eMuLr3dl6sWKU9os+zhCj2SI96EIiT8gGPBlE+z7W4Q8jwvdvjTkH3TUNuHM?=
 =?us-ascii?Q?RJ811HKQhWfzyuxjmo0M6LyqI3PxjyQRiOUKJDRC0UvhaNELsHkfHAW2rUC8?=
 =?us-ascii?Q?HrQM9CH+NLnfY90mv+ky/KXmAd5flOd+tGHcKtrxsVl6rMnXrYJw1nuNhAWF?=
 =?us-ascii?Q?lw+D43wtOcTTpZt3ByvQ+wPBdFQYf/EswFgV?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2025 10:35:13.6745
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 20fc386f-98e2-4da4-972e-08ddf1e80ece
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY4PEPF0000E9DC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ4PPF04F8C1DDF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEyMDEwMCBTYWx0ZWRfX8vQtgoqCHwh3
 lQeJ43vWT8shVYUPj4aJU54Eh2kWvres+QGPhctQHZYGFIupMmf+E0X7oe42dEnormRV02s6kCm
 W9ccT5NaEoGqTXy46Uo6U4GksfYvR6WgBqSLWq0T0gdEwuPmge/VSSxY34XL1Nk80BCOS/HoH+G
 vgDeEQKWoLX50CCH7CWLKjcmik+XYm3dXyULuyaADoe5jdoUrY4PSDrOAmCLj9A7vcfA8Ml3/WP
 4oKoIgNjCdxUeQN/zZfs11JJW1C9dA7Ub8JrMxmGiEX4/Wk/uceMrW/NkL3zoqiWsVIS3cAIGRw
 4arnoT4w/6cTjIdfi0l0dD0tnCf8uJN/ywp8cr1qQslc7zw3Fg9PChjnSlHXVc=
X-Proofpoint-GUID: 1OXBPgJqoFZMiD391rLHQzfDajvA47ro
X-Authority-Analysis: v=2.4 cv=X71SKHTe c=1 sm=1 tr=0 ts=68c3f7bf cx=c_pps
 a=UmjVza0x1M4UpXJilF6xSA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8
 a=vrUAae3nbITHHW_ohNAA:9
X-Proofpoint-ORIG-GUID: 1OXBPgJqoFZMiD391rLHQzfDajvA47ro
X-Proofpoint-Spam-Reason: safe

From: Maciej Strozek <mstrozek@opensource.cirrus.com>

Hookup the XU IRQs required for the FDL process.

Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Changes since v1:
 - Actually remembered to add my sign-off
 - Minor commit message tweaks

 sound/soc/sdca/sdca_interrupts.c | 34 ++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/sound/soc/sdca/sdca_interrupts.c b/sound/soc/sdca/sdca_interrupts.c
index afb3a9476332..74a79173ce8e 100644
--- a/sound/soc/sdca/sdca_interrupts.c
+++ b/sound/soc/sdca/sdca_interrupts.c
@@ -18,8 +18,10 @@
 #include <linux/soundwire/sdw.h>
 #include <linux/soundwire/sdw_registers.h>
 #include <sound/sdca.h>
+#include <sound/sdca_fdl.h>
 #include <sound/sdca_function.h>
 #include <sound/sdca_interrupts.h>
+#include <sound/sdca_ump.h>
 #include <sound/soc-component.h>
 #include <sound/soc.h>
 
@@ -245,6 +247,29 @@ static irqreturn_t detected_mode_handler(int irq, void *data)
 	return irqret;
 }
 
+static irqreturn_t fdl_owner_handler(int irq, void *data)
+{
+	struct sdca_interrupt *interrupt = data;
+	struct device *dev = interrupt->dev;
+	irqreturn_t irqret = IRQ_NONE;
+	int ret;
+
+	ret = pm_runtime_get_sync(dev);
+	if (ret < 0) {
+		dev_err(dev, "failed to resume for fdl: %d\n", ret);
+		goto error;
+	}
+
+	ret = sdca_fdl_process(interrupt);
+	if (ret)
+		goto error;
+
+	irqret = IRQ_HANDLED;
+error:
+	pm_runtime_put(dev);
+	return irqret;
+}
+
 static int sdca_irq_request_locked(struct device *dev,
 				   struct sdca_interrupt_info *info,
 				   int sdca_irq, const char *name,
@@ -423,6 +448,15 @@ int sdca_irq_populate(struct sdca_function_data *function,
 				if (control->sel == SDCA_CTL_GE_DETECTED_MODE)
 					handler = detected_mode_handler;
 				break;
+			case SDCA_ENTITY_TYPE_XU:
+				if (control->sel == SDCA_CTL_XU_FDL_CURRENTOWNER) {
+					ret = sdca_fdl_alloc_state(interrupt);
+					if (ret)
+						return ret;
+
+					handler = fdl_owner_handler;
+				}
+				break;
 			default:
 				break;
 			}
-- 
2.47.3

