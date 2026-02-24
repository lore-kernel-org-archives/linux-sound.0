Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D6DA239567;
	Tue, 24 Feb 2026 16:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771949925; cv=fail; b=n99jAqjBgGHwS8igc4z5xlyb4vhr8JJ2HpYX0FhPF1OCra+7YgMtyk35KhW8/Vg14NopFNCtsvBIRLI3JCNQupobedUuFMmHGx/oiJyLmCI8CzEuUsH8TdrdewVa1HNgfkUONWFvuwBDXHxQljmjeWDWBY4b5Art33dC9nuMwuY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771949925; c=relaxed/simple;
	bh=bkzmzrd5Oe7A72a+qZJ9HDtuNfZAoeV1Kz/XVxT/zlM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XVmMdbze+7IDsR0zzyEwCYTafi5OK1ArfrR2Wyj9yD5W1vIQWM3tVerU0Yk0opcheY2x3WwKwwu3+W21dYJafomjBrLKfb9BeNrKB5UWMAooI8OuTmjzxye3EuZAX//MEw1U3V1VnbQvp8NOI2PXupRPn0V+vhdDRHKBl5/R1Cc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=UJ3X3Z2O; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=WRsGOQ2y; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="UJ3X3Z2O";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="WRsGOQ2y"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61OEGu5M038320;
	Tue, 24 Feb 2026 10:18:42 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=TC1ogmsrhMbfRwPG6I9PCfc/VYOm6XyFz62MJrOX9zM=; b=
	UJ3X3Z2ObYxRnejgR1d/nYmTjOsBkH/uUxzOcmrvZs7YEnnI9CAj54cY3Z05usin
	WOMVGeedAqYlg3PyutiC7+4X+jUQd+Y5cGY09IbjaY1nU34v47BY8TtbRo5/b22R
	8eKZzBfHVdW5yedldJWJ7eE5lCFWXzpPCoY/5Za9+Mqj36+aY38odSNYj8aMbtKI
	GXYQO66T+A4Z1tkhOd/rabhwndA2ep4D61yPiskUHVj2I1shTfLlNshx6oZi8w7X
	z1irlzRbuojzuwqycB81+bXlVy4GPuvCX9FuSb/I2XQTLBCgYn6rL22+1sAZ/YEZ
	OR3flKG2+qy06pZ+xXjXdQ==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11022125.outbound.protection.outlook.com [52.101.43.125])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4chdku87vd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 24 Feb 2026 10:18:41 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MSlp1BI2Qv/0fY3luYYe+9pRTqpDWsjWqIHF1eH1DcYEggB+hUljO+r4y83N5vGHfb7jbL6YdaMma7462v7SnAkD+IH/VxXyIpR4tnpizgXKrYUutZ+en5chbIR9PPbqC3eXP5qQZmwGAIC0p61OhZmzJILEuaDKvl8KqaogFcEFnPkma2LqxgyU7vwnjFPklyPDIHF5A3UcD6A9GJZ6Vwg1e39rEWPaanv+JYsORO4u+IaQz1FAPR8o4l5wRCkqyEvCzNLXAYQdKz57VmXTlWAmml8IXJDoVyNbMObUQEpDrQuBRX7RkgJ64OQ1KID+k+bIDjL6pQUEVIAh8ac+hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TC1ogmsrhMbfRwPG6I9PCfc/VYOm6XyFz62MJrOX9zM=;
 b=MJj55O63I0BUWcxKnWLnRVeG1oOwBEYNxFqDMJnD2n2uJVyqmXZS5izPqwFDOlbYQRHZtTi8lELvGv2onksavitaHdK6fRKR9vqzreifsktTTw5TboXulA+2fxzAOL0rZ5Jx9on5mwAQk826fLTEYJ+/+IVfhO9/Aa/2uyWEImESXmrWXFHZpENvlL8sI8iVGHuQdA8tnRATeyXMJo7E3pxBdmbOXNyGRI7ZvYAALhO18oEtqKgnAncVPbQwosyqckkbvfhqYPo+FFnMir/9UuSF0A+lRtPSBM3fAeJ3YXLYEFgMMibgUGPz3XFq9QgTllWq9l0XV5v1qcX65TRnnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TC1ogmsrhMbfRwPG6I9PCfc/VYOm6XyFz62MJrOX9zM=;
 b=WRsGOQ2yL1CFTH+lTyTGSbyTTSwdhLEL4hUOhURrv0mgcCsFbWCgNAATDVL/oJxyhvWyauckDCz345tWJPzMUBrHgUFRzrNKklnUls5+1VFSEIUbZz7FizVC0eFZVZmqgNn/rCXqFVsz0gxj8oXRvuMVrrRwjL0MpoEFgDCUMF4=
Received: from PH7PR10CA0020.namprd10.prod.outlook.com (2603:10b6:510:23d::18)
 by DS0PR19MB7497.namprd19.prod.outlook.com (2603:10b6:8:146::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 16:18:38 +0000
Received: from SN1PEPF000252A2.namprd05.prod.outlook.com
 (2603:10b6:510:23d:cafe::b6) by PH7PR10CA0020.outlook.office365.com
 (2603:10b6:510:23d::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Tue,
 24 Feb 2026 16:18:32 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF000252A2.mail.protection.outlook.com (10.167.242.9) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.12
 via Frontend Transport; Tue, 24 Feb 2026 16:18:37 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 43303406543;
	Tue, 24 Feb 2026 16:18:36 +0000 (UTC)
Received: from lonswws02.ad.cirrus.com (lonswws02.ad.cirrus.com [198.90.188.42])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 39C06820257;
	Tue, 24 Feb 2026 16:18:36 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com,
        Stefan Binding <sbinding@opensource.cirrus.com>
Subject: [PATCH v2 3/4] ASoC: cs35l41: Hibernate wm_adsp on runtime suspend
Date: Tue, 24 Feb 2026 16:18:07 +0000
Message-ID: <20260224161821.93365-4-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260224161821.93365-1-sbinding@opensource.cirrus.com>
References: <20260224161821.93365-1-sbinding@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A2:EE_|DS0PR19MB7497:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 252532da-dd78-48d4-9f2f-08de73c05dc7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|61400799027|376014|36860700013|54012099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jnXKu9DglumVpMUVGVh3NV7O6RD0rf/FkLMcLuGgUYZi/NkqGENyMskbtTZ/?=
 =?us-ascii?Q?jHtokqAbP/fALsrBZTnpZjwHwvPBS7TrFIculXv1GfkdYQQvG5nkBWP7yknr?=
 =?us-ascii?Q?xGII08Wnu10rfNqFMSqsocCst7/ALVeBKzMzIulA7/WpglkcAbmt52Ky7JEZ?=
 =?us-ascii?Q?GYl0QaS1kjmBj4uh+yNfTtEGU4hQFjRx/GdkKwUJp6KTTKluetIa68QynNvw?=
 =?us-ascii?Q?w055T+y8M51r1VwBII5I3ijZW0SHZe0fkfhW3CALwZ1t8qX/pnewETMt+Hau?=
 =?us-ascii?Q?RTGuTBjgX3fC+H9S3GylfNVtiUQBrWgyagFOq17992BoDLkUTIBYWgCkD1KL?=
 =?us-ascii?Q?lsRTus97qh2Xe+7r22hMb01+yRFWle3fG2THjI+c3WrZXdiBW/ebIBKY8d3s?=
 =?us-ascii?Q?zoTD42I/2rGanLabOFwydOAj6G7aDK7dd/SGjyI+wU3sbTh9CwUN2Bta/Lf9?=
 =?us-ascii?Q?08I72DZsJUJj3uTrdUsiXD347iwLN0269Ln84kKWLS9X5vwLLscxCp0yfClG?=
 =?us-ascii?Q?867vd53W6ewBBs+ERzu7AdbS47V15DMwwcLeIdJvWiJsqtw9c+NS+kmAUXGI?=
 =?us-ascii?Q?7SLFkUp/EZxfW9NQkUhi9DAeQjy+fyULNYy2aj3rnujvdst6jmkGMUKmYqev?=
 =?us-ascii?Q?oegodwCmo79UtUGnfpV66dZC3GcJiGic752TwTtILtQdXe8mGym7RvXltYhD?=
 =?us-ascii?Q?EXca9sQ6RL2f0CNy0vXywZwSc9HSgrMz/KlEdvOyZch/8zvtbbBSgYFK+ku8?=
 =?us-ascii?Q?kXqHeOvXjVe4sTgVgsNZC6Odgvi0JvHuDWeC7ue4/h4ZwxpmvHNBKquwcgK3?=
 =?us-ascii?Q?8J9+6smf3jzW+r84cpA0oDlAy4RCB20Qot+EIQu33XH5v/d6LnTyrb6WAvQf?=
 =?us-ascii?Q?FqdpIyinAl+346o0EcGl9h80++2qBUfa8ZvaX/qEmX1HwrMQw6SE4DIEd5j+?=
 =?us-ascii?Q?7qOaDQp/rcsgOpmkfkXvGzM+ekSfKP+UlJzwL+IWAp6JFyvNeQkFuzdehTcM?=
 =?us-ascii?Q?eRUVj+qFhb83fh5GNtLz1uE+U5jYaQAGd1/zrPYdCs1ClToELN9DVPPJF7IB?=
 =?us-ascii?Q?SPpz8g5yeXqXiNRbrdHO+NHG0rkXsDscB+DW3jvAasiVQDRGcpTd9w7C4kSQ?=
 =?us-ascii?Q?Xa26URqGTz7wNp1ipKHMdUV8eGRAwKQXDSDQ/u374v8Y4rI312xfAwn3KjrZ?=
 =?us-ascii?Q?rtI9pDnPGFjtSwFeUk9PiuXHn+mJ6AvJU5cPgW9bqgOVeDR93/nxpJBlY13q?=
 =?us-ascii?Q?gMBSMtFQNC94Rxp9fWWg4u97HFOn9mUwCHkB3kKyXK3YulNs+6q8N/aV6eev?=
 =?us-ascii?Q?yCvddlc3DZUC/SKL7XKOBE6fNz1UO481d5afzILfqBsccmMVYGvCp3pUdyaG?=
 =?us-ascii?Q?Rc4p0NBy0utb4xWz0uMIeza3xiRi36TqKj8vgHAOzhaJJWRBWdcAME3J3xxf?=
 =?us-ascii?Q?w5lCmnC4lkbNk3NYs6+3CI//+T27u4R37+I6KmJzF+hJwq415HUznmt3rRls?=
 =?us-ascii?Q?b9wM/gOJJXvhibXm13Qp8F9CMd26JoVBqJRHqXLeW1rnNj4FOlEMEPesF82V?=
 =?us-ascii?Q?tzsj7eH/7tQe4RYff2s+ABWhupQwphd+25Puv47eeSYmzIm1cuL7O5mI45Xj?=
 =?us-ascii?Q?opeLmNU23dBTWYyD4HoUhVhbwuT9FOHKyfYNXcJa3z3JyeKJ7GUAWoWQxewx?=
 =?us-ascii?Q?YfM+GQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(376014)(36860700013)(54012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	MNA2qfBi8tpByUtEaU68U23+V2e5JzoimdWkBZ9VKOI2T0zsOt2gTDvIBHimANwV+SEbJJOLCbVpOfO+LRKqTLEVRVQFl0H90ejaeUHlnsDPEcIP/uNdn9it1kuNtwf+qU2u+Yj7R1VSejLvFHvxKWyd4nMpMm3zzd0/ACnbkKw7JBMyN1DysN9mQLSw0Fx0nJ07JSc0SUfMFD5vgW4rc3JkhZ92gjVk6rncnt02d2FRDQizE2Vdj7fIidSLn7/fDMUPbuemYjANPL5Gq1x2QQTyZPBCRiA50+NsaV9U3zsfjS5Uf/+hxYObs6lkYZTsTuyJtXFSveSvworKoKWWP4uu02T10RZi5uxqsHSrbs+9sKv+7JM9TOdE6aFOuRCP8l7xaw+CH55HnzubfAkSs6iqJCBdwUX4BriHYTTlAQGng0pflccNsItrAK794I/0
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 16:18:37.4737
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 252532da-dd78-48d4-9f2f-08de73c05dc7
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF000252A2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR19MB7497
X-Authority-Analysis: v=2.4 cv=OZiVzxTY c=1 sm=1 tr=0 ts=699dcf61 cx=c_pps
 a=YMpgYF4YqoZtRZf0gxQL+w==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=HzLeVaNsDn8A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=mmtDOMPXX2ZRX6g6iDEA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDEzNSBTYWx0ZWRfX1OCfYlRxfykx
 ZR7OIaRl3ItqMTRbqbalNzZpzzyHMbXuJIULxyMiFxCXl2CiHjUlosBKfbfyvPwYyansth4jAkW
 fQQarE88JHXcULvxBJhd4rQvN4jZ0G0vQV6XbAma5SXMSQYRoxSszO/VCMjT0T3y2rNpS0STsrM
 q5WpG06egin6Axz8uKina0RBrJT3X+ZAi1akfCuOYWHhKouLpJvCDCltCOmLeazvfhKbjoH+snD
 JmwmBwAeXIkZ/KMf+HqkTgpf0joCgMMbbLpqRIsdek8HnJZdnX9eUVbZD6+3isGcSoPCAFmbLtM
 BhkFWMZCSxZTVRhcdB6D5asK9N6pm04sIrVaDR78YdTIu42r5oA59NpXh6oJWi+3T/0f2Btf+S4
 PLevLJ9o7p+V/JbqvlkJeRwpOmjNb7TzF+6g0/7DxKK1aBmFF8ffaQ3U3rEjIZ8usxOkyvt2UFs
 jQUhgaQ691sBkPePIsA==
X-Proofpoint-GUID: iHddOYgeZyYqWwQ-9xlKt7nAqTltKovV
X-Proofpoint-ORIG-GUID: iHddOYgeZyYqWwQ-9xlKt7nAqTltKovV
X-Proofpoint-Spam-Reason: safe

When the CS35L41 driver suspends, it is put into hibernation, and
the regmap goes into cache_only, but the firmware is still running, and
wm_adsp is not stopped. If userspace attempts to read a firmware
control, it will perform a regmap_raw_read() and this will produce an
error in the kernel log. To prevent spurious errors, put the DSP into
hibernation which prevents access to the hardware for the ALSA
controls.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l41.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/codecs/cs35l41.c b/sound/soc/codecs/cs35l41.c
index ee56dfceedeb..b2a076706c79 100644
--- a/sound/soc/codecs/cs35l41.c
+++ b/sound/soc/codecs/cs35l41.c
@@ -1404,6 +1404,7 @@ static int cs35l41_runtime_suspend(struct device *dev)
 	if (!cs35l41->dsp.preloaded || !cs35l41->dsp.cs_dsp.running)
 		return 0;
 
+	wm_adsp_hibernate(&cs35l41->dsp, true);
 	cs35l41_enter_hibernate(dev, cs35l41->regmap, cs35l41->hw_cfg.bst_type);
 
 	regcache_cache_only(cs35l41->regmap, true);
@@ -1432,10 +1433,14 @@ static int cs35l41_runtime_resume(struct device *dev)
 	cs35l41_test_key_unlock(cs35l41->dev, cs35l41->regmap);
 	ret = regcache_sync(cs35l41->regmap);
 	cs35l41_test_key_lock(cs35l41->dev, cs35l41->regmap);
+
+	wm_adsp_hibernate(&cs35l41->dsp, false);
+
 	if (ret) {
 		dev_err(cs35l41->dev, "Failed to restore register cache: %d\n", ret);
 		return ret;
 	}
+
 	cs35l41_init_boost(cs35l41->dev, cs35l41->regmap, &cs35l41->hw_cfg);
 
 	return 0;
-- 
2.43.0

