Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE17B421A16;
	Thu, 22 Jan 2026 11:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769080411; cv=fail; b=HCLM4bB69+cdSeugjRtCs8h7/s+zKR4qYZoOV6Wll0TwjeGuPUQ4NnThZaoK8qSt8sdVSMuwmm9EJn3Cp4CZcivhClOp2eAXvVOUiDWLfXqE3wJB61IUc5ttQ5Hfe9wyQHKfH1xucrH1mT9EOUb9rNQ3Pt+LdRKKvSqRTZzZvz0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769080411; c=relaxed/simple;
	bh=OAQdbj5hQ3up/vmUq2RI62Kl/Vk9DFQEEeNukMavuGI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qBYgUjZ/J3Mn/Iryc6tzc7W/7EakpUsjsFRUy/ggt+FqymQOa/v9/vLoX6wo1SSPbVu6wKzwOZrmB2iZ+MjvvEIbpsnOHi/KdgxUu+7Ib5SvgN1sNqigpAZykVo0Hn4PUZMuUayMCcPnCDwFXhX17TTVz47JpZgjM4LAQtjKc40=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=iBfFrN3H; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=WUUnW+p0; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="iBfFrN3H";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="WUUnW+p0"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60M4vjHI2151627;
	Thu, 22 Jan 2026 05:13:11 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=v6ly8M9sabdAZdLw
	OAVklI8/pn4xHLyIMxzJ5c+xTrE=; b=iBfFrN3HHJOWo6GI7gZorrR95Wo3xxDK
	mVXzBD37j4BHaHcI7SmBfZwCeUJdMOljBnru/xyVlG8vBVbNcLEFqrVkncNuaoir
	ZtpmMipwKs45PXtsu5Xl+GDE4PV1KyT3KNg/bKa7G9rHV2lyGIdmQCaaglcwXvHh
	pB8ZQ9cZ+m2BzK7BD9em5PS1zDSnMa5FdMdnUe5K+QXlEaO9efm3Y9w2TPNP6D2R
	LrpPP2v+sXoxx/2A4J/0unbm4d8i/jR6SQAQdQ7dM4mvmA++w02mGRpefT2GS24t
	8dIpoJdhi3yTCHHKFADPKDCEo80qRIADNAfhN/pa3VzBQIddx/w5BA==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11020074.outbound.protection.outlook.com [52.101.56.74])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4br7qjx5ep-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 22 Jan 2026 05:13:11 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AM5lARAzt66k3JcQidA5IM8RpL2T2u45Hll8IMt2Nbl5mB/Zzblm5rxN9I/vGr/cdC1hA+kWcO7ZkMwByd+q1Tbp7lWCb+dSODnugINCS418hjGzh4PtUZrq7ew8PJCWpPCy1r95vIbeC7CkQNvyJH3By7C8UahuS2j7Bz3W3lmEpwkE+oqyN4L57iLCLcrtvLwUSLz1GvSyPlk9OOdhvOmMzRQR//v1IthuFJCJUektZhYRGcOpoG7FoHK96w9kaWl0sD26fFRCi6fsy4/SRK2dAmYGyt7GbTxjEk4ny8iFHTDdxSzWyM0Yd5B7jtOEEtzHEpdrAIAFdLzKmuR8fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v6ly8M9sabdAZdLwOAVklI8/pn4xHLyIMxzJ5c+xTrE=;
 b=JOe1EGjx2dIFcGtzNktny7T7Fg83/NK7CeT+ns+vY2Z7nlUdM9G9megR2sq6Tg+UVISh2rdQ2/wuubebEDyH4W7q32mEVYVBNsaMFrFA1BJ2VZ7zDgML4Qka4ocJwuSYo6IM4i/zmiyKpbk8qxPA0xYQO+eUXbhQjmuzBRWHyPi2qnAA3SqZ0nT4bGhuLUtJ6fdrG8HiqgalvWXhgopxm6G8bYofFYY4nv5C0SnKMYlqaexk3tGGoYtGGsnCVHJI2fXv91ApGHBNT6/qtUvbLwYgaukApyLjHrzRT5vV/Ykzn8EnmFaGxV3+W68V8LA2yvgvLVwh16gnRnUSFHpHQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=alsa-project.org
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v6ly8M9sabdAZdLwOAVklI8/pn4xHLyIMxzJ5c+xTrE=;
 b=WUUnW+p0c88A9fqNm9ao72at01ZYJkANQNCLnf6An1bYnxb4Rm8iBThJTGXUco8y6yEbfitqETtE2Ao+/RcOhrrpJHtlqgFiQxm6vOycPcGr2quU/6NKMo9Sp44oGtnUNcTfa1jyBtNEdGwSj7sfWResZG3o3T/6RF+Cy1z0JWU=
Received: from CH0PR08CA0027.namprd08.prod.outlook.com (2603:10b6:610:33::32)
 by DS7PR19MB6376.namprd19.prod.outlook.com (2603:10b6:8:94::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.9; Thu, 22 Jan 2026 11:13:01 +0000
Received: from DS3PEPF000099DE.namprd04.prod.outlook.com
 (2603:10b6:610:33:cafe::5c) by CH0PR08CA0027.outlook.office365.com
 (2603:10b6:610:33::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.11 via Frontend Transport; Thu,
 22 Jan 2026 11:12:50 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS3PEPF000099DE.mail.protection.outlook.com (10.167.17.200) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.3
 via Frontend Transport; Thu, 22 Jan 2026 11:13:00 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id B6E49406540;
	Thu, 22 Jan 2026 11:12:58 +0000 (UTC)
Received: from upx-mtl-008.ad.cirrus.com (upx-mtl-008.ad.cirrus.com [198.90.251.5])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 9CE37820249;
	Thu, 22 Jan 2026 11:12:58 +0000 (UTC)
From: Maciej Strozek <mstrozek@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
        Maciej Strozek <mstrozek@opensource.cirrus.com>
Subject: [PATCH v2] ALSA: control: add ioctl to retrieve full card components
Date: Thu, 22 Jan 2026 11:12:47 +0000
Message-ID: <20260122111249.67319-1-mstrozek@opensource.cirrus.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DE:EE_|DS7PR19MB6376:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 7a6f44f6-74a9-4ee4-4967-08de59a7342b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|61400799027|36860700013|13003099007|54012099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HXLZOemj9aEApCoYN9gCDxlwmu7ybYz0TkhzVlm19jU1pWCuZY385/oWnEgx?=
 =?us-ascii?Q?qOJHyfKDHJBc0V5g5gu8+nL5G0ZuFIhshCT3SVmPTfy+NPzf0nupROS/frSJ?=
 =?us-ascii?Q?HOrNXg4B8w9x62MpxbGQX+f5yLMJ7fNT9XFrEWwG/cM8Jv56JQC6fCSSuRoI?=
 =?us-ascii?Q?wdoFHVyV9yVSI+Zgkb4rrv5vZAIQ1X6ILz769BqmF0qaDJaQwUkhy3EkISV8?=
 =?us-ascii?Q?ZZ5SpThysPz9zVclLVRNjyoOrbrG7ndkU6WZmsdhjBqQd6VL6higiObrGMTF?=
 =?us-ascii?Q?Y7Ami9ADUoKTLAOSVLakV1B4B2JCrKjjc8ZyasG8hhEhlpSDCxlB309/Zf1f?=
 =?us-ascii?Q?J5qpZbjf+hXh9nPP5OW72SnmX8+oawMkfmBJ+OHt+rbX7kIUXFHJAc1ykvlJ?=
 =?us-ascii?Q?g2xAEb0N4hGboFclY6WSPTpi0cMD1QieTScbDSJDfWLXh6ZGMka/uGoYiT8X?=
 =?us-ascii?Q?qqN1e8eLVNi97rJK/ABF5T5g808aXX1k9YYUc/IZ0rcQv7Py8Tbdiq5qxxWs?=
 =?us-ascii?Q?Ep3ZJbWa0ZBqzLg3mJx3IInn+6TrciLCfB8J4gWM8W7e5I7hT+H0sM0gxxil?=
 =?us-ascii?Q?ZM1RFV7JmZx6hu+60YQJ6uQJcsCV46b7Zw/lbqEw4To0twVRt+4umDNxrZJ8?=
 =?us-ascii?Q?Qu9NPynf/wWNSmWnZ3qLJ9ru0hsY14htV77cW58i7zAqUbegm/+6m7g7bX30?=
 =?us-ascii?Q?wEfUZRQSnb+8wFgXZpQWgZ4a7ciDKVWPcFwWrK/KTHXSrljQkfE/AAD6DwO1?=
 =?us-ascii?Q?6ARHHdIiojFzpMKQDToeEs4VLesi6+2X/io4pkv1csRk3WtFW+F5f66MbHKF?=
 =?us-ascii?Q?C/r0CAQZ42GcamAuSl9QzQHla7pxkj1LPlHnrXBbPnPtHQ77sdwPOvba7jI+?=
 =?us-ascii?Q?5sKEMrp4HUctOa4qaT4xSuVu3f9bx3+8cFZfyDqb8/QK20mRzF6YSncYZfNP?=
 =?us-ascii?Q?i2XXoiIas+0FSZP5HXj+gPw0xQG+DVd6bDUJeyFKoCXQ/8PJBnetnZdve21I?=
 =?us-ascii?Q?045Ffr0uH5uiJiaxVHZr+e+fg431Kh/pTYtVWWtidLZ7SIgBPQ5UTtEbDLgX?=
 =?us-ascii?Q?YF/ZuKzaOzJgv2ow1LvBj7qVvIj8v7sW9/nkpXaWOUpg7aRPeQc5Pm1Su5oZ?=
 =?us-ascii?Q?JS6E3OaKZsAf+urGBY7wXdHq1ZCNs4WhE6lfTkE9UqxOt1PHwt1Ktq2FVcPp?=
 =?us-ascii?Q?n/x2x7tH5wku5Y30QQd6o5xgaDCLRdmNUFjokyOib/af3t1NDH9aQGV+jPTy?=
 =?us-ascii?Q?cm4QkHo5SUPdyNPh049d6fd3nfvGps0iH9CXOgDL6fUosoiOT6yilCYg+Igc?=
 =?us-ascii?Q?a2u9aO/3RdZy1oKvs5XHKOYOjXfLtRuoydc4yqIdA/HpahSP/E76LFCkrtgu?=
 =?us-ascii?Q?S4vanbZv18reVycqIjjmquHtDT1/tr/bcW8VySYgbrOA9h+RmHAmfIwaSn4l?=
 =?us-ascii?Q?2ueJA3xP3hs54JQbyOCVfzsbJfwdo6HuGFmOPdochcxRSCO/Wc1TI+FqAB4D?=
 =?us-ascii?Q?vRFESR4sUcQCTy7NHgBy3PsjQQQ76ruHx4HuklKWvzvYH8PQ9h0+xm/hulm6?=
 =?us-ascii?Q?dSES1/u2LZMGNKoJblBQsbo+IXTJrWYxtFSJCmmrZHnRdn9xeTE6awZuzFWP?=
 =?us-ascii?Q?fHwa7TpOqeytjZN/4kDiWCroeu0HVQ0Hh6SOWMd/QjlOTOf+VP3GiPAnR4A4?=
 =?us-ascii?Q?c2dZwg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(61400799027)(36860700013)(13003099007)(54012099003);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 11:13:00.0173
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a6f44f6-74a9-4ee4-4967-08de59a7342b
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS3PEPF000099DE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR19MB6376
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDA4MSBTYWx0ZWRfXyLi1ZCAd+WqG
 WGUW3UbWsFJawLgQpfXzySv18DahlHlglWDYvWwim2Oq18U0mhnYdcbphPK+XjY3ygK8CLMKeQg
 fHLngofZXPuH92EmZG2ToXDQ3RFmY1iXKNtitQ7+p20hSArnLZiw8qNYJ17admjzVewOLsRLauv
 xcyL4aTmSNkMTOScvq8+SU2at5Ecl4wtapm/NthTEVbVVCP15iQjRyE4nBdIarTQLcrLD8TEAVE
 H40kspTlfv1+BavQc7NrH4gATJj2caXp6u2sV8O3TkMEFWUGg8EP6mUP4Tj8oErTzpuSIPMzcfh
 TOPjP3eZuPxMGdwjY3js1KbqV0Mb7V+/VXKYVtDTym6UJGgRZVo9bHNLFpyihB7k3O1AicTALdq
 Oiyq/Tq3r8m/rEad6Gtre7Th2uX7q4sFy4rnIiWyYZbDcaTXzNF6TFX+nv+TFJXVK8B6475ZikO
 i7vpqOk5censb9FZnng==
X-Proofpoint-GUID: eLSGCEwt67lxpodu4xS6xSpHakuyC0F8
X-Authority-Analysis: v=2.4 cv=GrRPO01C c=1 sm=1 tr=0 ts=69720647 cx=c_pps
 a=Syn3MuHMyA8lBdxmL2NqkQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=iox4zFpeAAAA:8 a=w1d2syhTAAAA:8
 a=KAeA-HvSNB7zO9yIcbMA:9 a=WzC6qhA0u3u7Ye7llzcV:22
X-Proofpoint-ORIG-GUID: eLSGCEwt67lxpodu4xS6xSpHakuyC0F8
X-Proofpoint-Spam-Reason: safe

The fixed-size components field in SNDRV_CTL_IOCTL_CARD_INFO can be too
small on systems with many audio devices.

Keep the existing struct snd_ctl_card_info ABI intact and add a new ioctl
to retrieve the full components string.

When the legacy components field is truncated, append '>' to indicate
that the full string is available via the new ioctl.

Link: https://github.com/alsa-project/alsa-lib/pull/494
Link: https://github.com/alsa-project/alsa-utils/pull/318
Suggested-by: Jaroslav Kysela <perex@perex.cz>
Suggested-by: Takashi Iwai <tiwai@suse.com>
Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
---
Changes for v2:
 - do not modify existing card->components field
 - add a new ioctl and struct to keep the full components string
 - handle the split/trim in snd_ctl_card_info()
---
 include/sound/core.h        |  4 +++-
 include/uapi/sound/asound.h | 15 ++++++++++++++-
 sound/core/control.c        | 34 +++++++++++++++++++++++++++++++++-
 sound/core/control_compat.c |  3 ++-
 sound/core/init.c           | 14 +++++++-------
 5 files changed, 59 insertions(+), 11 deletions(-)

diff --git a/include/sound/core.h b/include/sound/core.h
index 64327e971122..0b16e2cb3f53 100644
--- a/include/sound/core.h
+++ b/include/sound/core.h
@@ -15,6 +15,7 @@
 #include <linux/stringify.h>
 #include <linux/printk.h>
 #include <linux/xarray.h>
+#include <uapi/sound/asound.h>		/* SNDRV_CTL_COMPONENTS_LEN */

 /* number of supported soundcards */
 #ifdef CONFIG_SND_DYNAMIC_MINORS
@@ -88,7 +89,8 @@ struct snd_card {
 	char irq_descr[32];		/* Interrupt description */
 	char mixername[80];		/* mixer name */
 	char components[128];		/* card components delimited with
-								space */
+								space, truncated to 127 chars */
+	char components_extended[SNDRV_CTL_COMPONENTS_LEN];	/* full card components string */
 	struct module *module;		/* top-level module */

 	void *private_data;		/* private data for soundcard */
diff --git a/include/uapi/sound/asound.h b/include/uapi/sound/asound.h
index d3ce75ba938a..5645ea8bb8a4 100644
--- a/include/uapi/sound/asound.h
+++ b/include/uapi/sound/asound.h
@@ -1058,7 +1058,7 @@ struct snd_timer_tread {
  *                                                                          *
  ****************************************************************************/

-#define SNDRV_CTL_VERSION		SNDRV_PROTOCOL_VERSION(2, 0, 9)
+#define SNDRV_CTL_VERSION		SNDRV_PROTOCOL_VERSION(2, 0, 10)

 struct snd_ctl_card_info {
 	int card;			/* card number */
@@ -1072,6 +1072,18 @@ struct snd_ctl_card_info {
 	unsigned char components[128];	/* card components / fine identification, delimited with one space (AC97 etc..) */
 };

+/*
+ * Card components can exceed the fixed 128 bytes in snd_ctl_card_info.
+ * Use SNDRV_CTL_IOCTL_CARD_COMPONENTS to retrieve the full string.
+ */
+#define SNDRV_CTL_COMPONENTS_LEN	512
+
+struct snd_ctl_card_components {
+	int card;			/* card number */
+	unsigned int length;		/* returned length of components string */
+	unsigned char components[SNDRV_CTL_COMPONENTS_LEN];
+};
+
 typedef int __bitwise snd_ctl_elem_type_t;
 #define	SNDRV_CTL_ELEM_TYPE_NONE	((__force snd_ctl_elem_type_t) 0) /* invalid */
 #define	SNDRV_CTL_ELEM_TYPE_BOOLEAN	((__force snd_ctl_elem_type_t) 1) /* boolean type */
@@ -1198,6 +1210,7 @@ struct snd_ctl_tlv {

 #define SNDRV_CTL_IOCTL_PVERSION	_IOR('U', 0x00, int)
 #define SNDRV_CTL_IOCTL_CARD_INFO	_IOR('U', 0x01, struct snd_ctl_card_info)
+#define SNDRV_CTL_IOCTL_CARD_COMPONENTS	_IOWR('U', 0x02, struct snd_ctl_card_components)
 #define SNDRV_CTL_IOCTL_ELEM_LIST	_IOWR('U', 0x10, struct snd_ctl_elem_list)
 #define SNDRV_CTL_IOCTL_ELEM_INFO	_IOWR('U', 0x11, struct snd_ctl_elem_info)
 #define SNDRV_CTL_IOCTL_ELEM_READ	_IOWR('U', 0x12, struct snd_ctl_elem_value)
diff --git a/sound/core/control.c b/sound/core/control.c
index 9c3fd5113a61..0f0d9828aeb1 100644
--- a/sound/core/control.c
+++ b/sound/core/control.c
@@ -868,10 +868,14 @@ static int snd_ctl_card_info(struct snd_card *card, struct snd_ctl_file * ctl,
 			     unsigned int cmd, void __user *arg)
 {
 	struct snd_ctl_card_info *info __free(kfree) = NULL;
+	ssize_t n;

 	info = kzalloc(sizeof(*info), GFP_KERNEL);
 	if (! info)
 		return -ENOMEM;
+
+	static_assert(sizeof(info->components) >= 2);
+
 	scoped_guard(rwsem_read, &snd_ioctl_rwsem) {
 		info->card = card->number;
 		strscpy(info->id, card->id, sizeof(info->id));
@@ -879,13 +883,39 @@ static int snd_ctl_card_info(struct snd_card *card, struct snd_ctl_file * ctl,
 		strscpy(info->name, card->shortname, sizeof(info->name));
 		strscpy(info->longname, card->longname, sizeof(info->longname));
 		strscpy(info->mixername, card->mixername, sizeof(info->mixername));
-		strscpy(info->components, card->components, sizeof(info->components));
+		n = strscpy(info->components, card->components_extended,
+			    sizeof(info->components));
+		if (n < 0) {
+			info->components[sizeof(info->components) - 2] = '>';
+			info->components[sizeof(info->components) - 1] = '\0';
+		}
 	}
 	if (copy_to_user(arg, info, sizeof(struct snd_ctl_card_info)))
 		return -EFAULT;
 	return 0;
 }

+static int snd_ctl_card_components(struct snd_card *card, void __user *arg)
+{
+	struct snd_ctl_card_components *info __free(kfree) = NULL;
+	int copied;
+
+	info = kzalloc(sizeof(*info), GFP_KERNEL);
+	if (!info)
+		return -ENOMEM;
+
+	scoped_guard(rwsem_read, &snd_ioctl_rwsem) {
+		info->card = card->number;
+		copied = strscpy(info->components, card->components_extended,
+				 sizeof(info->components));
+		info->length = copied;
+	}
+
+	if (copy_to_user(arg, info, sizeof(*info)))
+		return -EFAULT;
+	return 0;
+}
+
 static int snd_ctl_elem_list(struct snd_card *card,
 			     struct snd_ctl_elem_list *list)
 {
@@ -1914,6 +1944,8 @@ static long snd_ctl_ioctl(struct file *file, unsigned int cmd, unsigned long arg
 		return put_user(SNDRV_CTL_VERSION, ip) ? -EFAULT : 0;
 	case SNDRV_CTL_IOCTL_CARD_INFO:
 		return snd_ctl_card_info(card, ctl, cmd, argp);
+	case SNDRV_CTL_IOCTL_CARD_COMPONENTS:
+		return snd_ctl_card_components(card, argp);
 	case SNDRV_CTL_IOCTL_ELEM_LIST:
 		return snd_ctl_elem_list_user(card, argp);
 	case SNDRV_CTL_IOCTL_ELEM_INFO:
diff --git a/sound/core/control_compat.c b/sound/core/control_compat.c
index 6459809ed364..edb7b28d8177 100644
--- a/sound/core/control_compat.c
+++ b/sound/core/control_compat.c
@@ -416,7 +416,7 @@ static int snd_ctl_elem_add_compat(struct snd_ctl_file *file,
 		break;
 	}
 	return snd_ctl_elem_add(file, data, replace);
-}
+}

 enum {
 	SNDRV_CTL_IOCTL_ELEM_LIST32 = _IOWR('U', 0x10, struct snd_ctl_elem_list32),
@@ -445,6 +445,7 @@ static inline long snd_ctl_ioctl_compat(struct file *file, unsigned int cmd, uns
 	switch (cmd) {
 	case SNDRV_CTL_IOCTL_PVERSION:
 	case SNDRV_CTL_IOCTL_CARD_INFO:
+	case SNDRV_CTL_IOCTL_CARD_COMPONENTS:
 	case SNDRV_CTL_IOCTL_SUBSCRIBE_EVENTS:
 	case SNDRV_CTL_IOCTL_POWER:
 	case SNDRV_CTL_IOCTL_POWER_STATE:
diff --git a/sound/core/init.c b/sound/core/init.c
index c372b3228785..3ec2f08ba765 100644
--- a/sound/core/init.c
+++ b/sound/core/init.c
@@ -714,7 +714,7 @@ static void snd_card_set_id_no_lock(struct snd_card *card, const char *src,
 	int len, loops;
 	bool is_default = false;
 	char *id;
-
+
 	copy_valid_id_string(card, src, nid);
 	id = card->id;

@@ -1023,24 +1023,24 @@ int __init snd_card_info_init(void)
  *
  *  Return: Zero otherwise a negative error code.
  */
-
+
 int snd_component_add(struct snd_card *card, const char *component)
 {
 	char *ptr;
 	int len = strlen(component);

-	ptr = strstr(card->components, component);
+	ptr = strstr(card->components_extended, component);
 	if (ptr != NULL) {
 		if (ptr[len] == '\0' || ptr[len] == ' ')	/* already there */
 			return 1;
 	}
-	if (strlen(card->components) + 1 + len + 1 > sizeof(card->components)) {
+	if (strlen(card->components_extended) + 1 + len + 1 > sizeof(card->components_extended)) {
 		snd_BUG();
 		return -ENOMEM;
 	}
-	if (card->components[0] != '\0')
-		strcat(card->components, " ");
-	strcat(card->components, component);
+	if (card->components_extended[0] != '\0')
+		strcat(card->components_extended, " ");
+	strcat(card->components_extended, component);
 	return 0;
 }
 EXPORT_SYMBOL(snd_component_add);
--
2.48.1

