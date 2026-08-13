Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5AA948AE00;
	Thu, 13 Aug 2026 15:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786635246; cv=fail; b=Ib0Q9MqyjimhLEiqwjru4gYZUEyiBI/aiRl02j2/bzIgR+eYwDFD62SquP9k1K7YZEMSaVcG2EP9RaJWPXqZ2gnvCEMcEfRqOEDdJOk8/7Wvx1z2uumY5tSdbAR7C3OKQ4ZM4rkNVJ6qvMJpCFUmQzoil8GIKk7COlvY8NgfQcc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786635246; c=relaxed/simple;
	bh=5nZqlqHU6wyckEXMCHNgOzywRWWRh5hkbYGNbDvRsM0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=P3EmmzxBdypVd5tKBk+c8TEJ3Gl/V0WdgWkxxWpbImC3Csg4vyc5sMSNfCh9FaeVISPDa+PTZtkQxvoIgt8I5nR53rmV1nRET7fIrdIkUNNSIOQBIcxuBN4fbJo16pNHQ7eV6z9FfGxJFpAZsYgNr0Ym8LPBDPTQziw9BMevCgs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Pd0/8gIt; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=unnjIbfc; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Pd0/8gIt";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="unnjIbfc"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67DDJZOr2062473;
	Thu, 13 Aug 2026 10:34:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=q6i3jSPumNJhOPG5
	W+xk6ZCtP1I1w7ajtM2lvoUV7pk=; b=Pd0/8gItCDFH7Wndk7u14BmxabnIWNoJ
	Aw3D1upqRaBUx6h/eN6JP+tGEktf7KxKwWdWFGuWMSJaQiDQbyL02YeDBdDmnrCz
	cTOC0EQDNPTCPGPRimpqm4gMsbGLYNlf60eMXzpyS9Ba/B6T1cFxy9h5O8bCrI0z
	14If6uex6GLc1Gku9fsB1NNwyc6zn/a/xHq2Te6uvYtDKcmBpPEMqBS7Nz4bDi+2
	5/Fl/YEPsmHWgD47B7ZgrhAg7QF7onclgkeYWyJXaGYaQ9wZl32h83l75DXyx7M5
	VkJnOaNA7T/PsDR8YJ9Sd/ZWHpVd7EWJ0Z9wB4qEbA1IjAe20o+5lA==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11020106.outbound.protection.outlook.com [52.101.61.106])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4fx1v121fj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 13 Aug 2026 10:34:01 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QRomBLfAcgeR0F58un2gt+WqVdgGtE9YsQgedKH4in18zSDoMuS+aGy0JT7LUkJdWYoTEO3kbTfKQ2FtkDQjaVoijnjLD7f47dGZkz7tN9i6RHBX+UcIPR2GuK30awAmLa4zzXOBDUONoRTukp9oD8XlkeZDXJ3S87U/aJ6nok0EsHyIkcDMhxr1FMbhqPUsaKr8PUjy00Jyo5NjGdDH+/FbqZpQIQq6HmAy6IevVchuREo8lyNSCYjzuI8Yu7MldkEUSR6n2i7wDFXpB3glogILGvwL5k/ovu6JVO58ua9pR3a6SdOwgGeMjBcByAPkBhclFXGEfGS6ADDUpxz3Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q6i3jSPumNJhOPG5W+xk6ZCtP1I1w7ajtM2lvoUV7pk=;
 b=SLNC6A/G6kisn42cMY9a1iYweRkd4sFQZb5T9ZEGul1WJI1ASluUQ5VQp/RseYBKxIJl8cQFNpBvuQKVAcDfvTAkLgL3GSJt2/1wXZVnsES0LkBCKu/GtADR05S+nKnbz7QiBXVzWHSp+KEgP0LDzaVaoCnjtjX+a1esxQBDrRukvtsO+mkZXM66dIPolyVRexdi9IpvxmcGPQ3uNK9HK1xHo0moDDp+FlDgzy8OHrzEqT07cn3weSx7Etu5gE3GnSxhmHl/rfeupJE+Om3Bj95OTpMszRqKTPf+eJSQ+YFc7xS4x+EORYQ7yfCt1JTe4/bPD+7/FLS3rNEwK9y/Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q6i3jSPumNJhOPG5W+xk6ZCtP1I1w7ajtM2lvoUV7pk=;
 b=unnjIbfccoxa3dAg8IsAuCMQsarUySnLEjIdr9XNKY/AzRypz8zGSjNBW1lBv210h5SujmIBbsfez1DeEcShGDsyJHxKSxm8dMFJRA1r4RjnlUKzNxprbaaO1cfEXjcKKNGdgW2wYHCcr7sZF9hEaA9uVFb8A8whvQWnXMY87j0=
Received: from BN9PR03CA0045.namprd03.prod.outlook.com (2603:10b6:408:fb::20)
 by CH3PR19MB7983.namprd19.prod.outlook.com (2603:10b6:610:162::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.14; Thu, 13 Aug
 2026 15:33:53 +0000
Received: from BN1PEPF00005FFE.namprd05.prod.outlook.com
 (2603:10b6:408:fb:cafe::ab) by BN9PR03CA0045.outlook.office365.com
 (2603:10b6:408:fb::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.15 via Frontend Transport; Thu,
 13 Aug 2026 15:33:53 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN1PEPF00005FFE.mail.protection.outlook.com (10.167.243.230) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.3
 via Frontend Transport; Thu, 13 Aug 2026 15:33:52 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id D1563406540;
	Thu, 13 Aug 2026 15:33:51 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id B934B820247;
	Thu, 13 Aug 2026 15:33:51 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH] ASoC: cs35l56: Fix probe deadlock waiting for SoundWire enumeration
Date: Thu, 13 Aug 2026 16:33:51 +0100
Message-ID: <20260813153351.1517556-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFE:EE_|CH3PR19MB7983:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 0d0f5f8b-24de-499a-a8c6-08def95047b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|36860700016|30052699003|23010399003|376014|82310400026|10067099003|56012099006|11063799006|18002099003|16102099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	RK8tRIUiFZN03gXdDHP7/l2wyB3jcBNvlemd4anup1Km8EV89GwWaqQH3NkJf8LD2yQUm40h+9VVt12+pIf1yvnj0P8Hwu4dZzfbmYY89RqXKY97uJrVEX3sOFulWC7bmvsfR9tVen9a2YuEw1jTbO39y+UypLjq62AZ2MqYpQZq8o7JgWTGtMoVdN3PKPplJ3M1gZmXUudii4jH/+YXStBvHZE/wUC7eySibNWUigQbI1+8gQZARfy521P7LyX8fMCWc34/Y6J1Jfjnius6Vr9RwPOawbnd+8UzqL/eQvYsYkxZCW9Cz39Cqa5R9DhUpFQ8zZymAme4OeSH4hT1l3PGrTMA0n+vQgjjVl0JOnfuuicdAhUpE4lTUwzblNoXlIg9TOk7UVSePs632BhkwOr3gxD4ynHudTVN4/IAZKQSjqQcC+9WQgKLvG4CJwBi4HOYu+yoq6CJhJf9as2J/97RU2V6WKxDWZojnak8Xf3Z4FNY0wFHMSpoDOiN6X/Rs1hZYVtPaalWT+I3D9l7hPuk2xwN6abmNoBn2EGGQ32jLXHkdK29AcnRTzod/Jcw9X902ZlMccUVtZPXu8bUAN4omftgfAxFFvF0qwzVkavRlLYNqlBJHU99n+JGPkXFJ4/8CDvea7ognylKrJbuL1i0EQ+4qAFgDjk/hxjIBJkHSeat8DkoLmDEvgzUYVyskKTQ7vXZjtZeSFFlfx+vQw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(36860700016)(30052699003)(23010399003)(376014)(82310400026)(10067099003)(56012099006)(11063799006)(18002099003)(16102099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	udRh+r7eGxDssnssueZVmme1AnZV2Q1z13K5IV7KSWil0tSqhlbVGTxGkledjzakii3P8T028ceO+oz3ccGGwDh3xJgsRvXtJl3Gs0AffZ59EYec20atC/U5EvwzNrizc2q8i49MUQNjysf28C3m0vvL3S/xUoVY8czQtbY7r0LHGHmDZfbhPLJ3HFJctecaII1ObUdn+PXZoJEQzm4+PpbmG1PQQswPC0UIvRY/YDLmCVYJBT7BYAzfzUud5bBXIYrqsVw/eYQ0cXuJBFw5EWWyl40G0pL2KkiNherZBG+nseei7ZUab7lTWw8D3omLS6pbbY6lHLvvnnJtJAl881phdTNscR2X3gneaT+z6FBUYU/MdOMUF6OuG7J0qxeXJg7k3z11AQs/rcQY/6v3yUNLLBmJTa0MJOVSdmGFtj/8OPP4RBaPut+Gewna6+nA
X-Exchange-RoutingPolicyChecked:
	ghJGPK020Moo13cx/Ob1ZUYkTaa1OnYqTgwFVGIYYoQODlDLUnrkX1FL4U0+Z179E5WSEYMFsLr9WovSz8g1NO7Prz7EwVkGtzCtY2LW9o1p7rtBFO9W0ovbU3h1NLCwNiKHljK7nL0QED10a9rv5n51MBLCuwSqvoYopQ6KK50AjMy+QL+BYcpOq+lqKXXWbZIaDFyt2nlRVCIjUQPWusBdefe8I7+bvj/GCRq/gtHBegYJ5fhj2AT3jjTSNp+GkyjaJbrVAtEGY0+488ijlfpEZEATq4mjpI0bBKORQ48LAbvgH7FYrW6fF5GOBsASUv6NrHHy1la7WT7iLVpoLA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 15:33:52.6580
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d0f5f8b-24de-499a-a8c6-08def95047b1
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN1PEPF00005FFE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR19MB7983
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDExMSBTYWx0ZWRfX1BxKnJC977GN
 kWoLhAGypFCVe2dyPWg7ephgQmz6u7wNjSH/G3mAL4N8tRVNIZWCwF3Le+A05jpqeRzJEFep7yh
 RTj3r10TWrMzj094N5UIjo5XCOAKpZs=
X-Proofpoint-ORIG-GUID: AyRZGZAurqfdGgtt3aDDEsGtWDoH9iQh
X-Proofpoint-GUID: AyRZGZAurqfdGgtt3aDDEsGtWDoH9iQh
X-Authority-Analysis: v=2.4 cv=ZMrnX37b c=1 sm=1 tr=0 ts=6a7de3e9 cx=c_pps
 a=X0tkg3G9SmSAvlwNIS9bXQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=rD7PorXtnt382vVsK5kA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDExMSBTYWx0ZWRfX6wDmsV3sqN8H
 nOtxrkrOYmk7E1wYCUVL/RQSfVwjmKJ6gp58STeLv403L6DxzC2cg6cJs2YIZSo2aJWk71PuL0N
 8q7IMBtO54LLM9Cfl8BryP3ftYwN1DXz7lGpwuof55DAbAB6Dap60fhRLL/yTvzIUA+q1t6+W64
 Gzxcd43ZjUzUIZacCosj6/OvGdpp5mvIsV6ZiqqfnuH6GAzgW9eotttELhxFBk5hy5MLbEN+pCy
 89qlfSVnLk8BtDRnEOSnhi/muAoM3NyFZcMVv0AehsE13Zxtmev8jdzIL7xDkoqyYqcTuuU0Qay
 cKhMf7usqim8WUNKMHIGX6buwet6ZfYmBc0BB+/RDtmSA/0VVZN/DbGFLXv106FxzaVwzbmKCC/
 btJ32oJg5lLUKSoHqZJ0+GEcPBELC+CmCTb2JZ61fUoUCsyaq7YrhJXeoxd0p/1KghhLjBrgyDj
 TBjdZ9uEJJCmdQGVgwQ==
X-Proofpoint-Spam-Reason: safe

Defer all the parts of cs35l56_component_probe() that require register
access to a work item. This is to prevent a deadlock where
cs35l56_component_probe() is waiting for init_completion to be signaled
but is blocking the code that would signal it.

The deadlock occurs when this is the last component needed for a card.
In that case snd_soc_register_component() directly calls
cs35l56_component_probe() inside the driver probe().
cs35l56_component_probe() is waiting for init_completion but, because the
driver probe() has not returned, the SoundWire bus will not call our
cs35l56_update_status() to report ATTACH state, so init_completion will
not be completed. This is a deadlock until the wait for init_completion
times out.

This fix moves the wait for init_completion, and the code dependent on
that, into a work item that queues dsp_work. Now cs35l56_component_probe()
queues this new work instead of dsp_work and then returns, allowing the
driver probe() to return. The rest of the driver is waiting for dsp_work
to complete to indicate that the amp is now in a usable state, and that is
unchanged. (The extra work was inserted, instead of moving all the code
into dsp_work, to minimize the size of the code change given that this is
a bugfix).

One thing to note about this is that ASoC can call bias_level(STANDBY)
during component_probe(). The flush of dsp_work was previously done
at the STANDBY stage but that would lead to the same deadlock. To avoid
this, the flush_work() has been moved to the PREPARE stage. This has a
benefit that, because it happens later during boot, there is a better
chance that firmware download has already completed.

But note this comment from include/sound/soc-dapm.h:

* @STANDBY: Low power standby state when no playback/capture operations are
*           in progress. NOTE: The transition time between STANDBY and ON
*           should be as fast as possible and no longer than 10ms.

A 10 ms transition time cannot be guaranteed when:
   this is the first PREPARE after probe() or system_resume
   AND
   firmware download has not yet completed.

However, there is a good chance that firmware download has already
completed, and this is better than a deadlock that results in no sound card
at all.

BACKGROUND
==========

The probe() of a SoundWire driver does not have access to device registers.
Register access is only possible after probe() returns and the peripheral
has been enumerated on the bus. But anything that could return EPROBE_DEFER
must be called from probe(), which includes snd_soc_register_component().

This creates a strange state where the component has been created but it is
not yet possible to access registers. Fortunately, the registers for DAPM
widgets that ASoC might attempt to read during component probing all have
defaults and can be accessed while the regmap is still in cache-only mode.
But eventually the driver needs access to the registers.

The way this was handled was a 3-step process:

Step 1:
  cs35l56_component_probe() waits on init_completion.

  cs35l56_sdw_update_status(ATTACH) calls cs35l56_init() which completes
  init_completion.

Step 2:
  cs35l56_component_probe() queues dsp_work to download the DSP firmware.

Step 3:
  cs35l56_bias_level() flushes dsp_work when the bias level changes
  OFF -> STANDBY.

Step 1 is where the deadlock can occur, as described above, because the
core SoundWire subsystem only calls the update_status() callback after
driver probe() has returned.

Fixes: e49611252900 ("ASoC: cs35l56: Add driver for Cirrus Logic CS35L56")
Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l56.c | 49 +++++++++++++++++++++++++-------------
 sound/soc/codecs/cs35l56.h |  1 +
 2 files changed, 33 insertions(+), 17 deletions(-)

diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index 0b7b080939a18..145768d9ddea6 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -86,6 +86,7 @@ static int cs35l56_dsp_event(struct snd_soc_dapm_widget *w,
 static void cs35l56_wait_dsp_ready(struct cs35l56_private *cs35l56)
 {
 	/* Wait for patching to complete */
+	flush_work(&cs35l56->deferred_component_init_work);
 	flush_work(&cs35l56->dsp_work);
 }
 
@@ -1359,6 +1360,30 @@ VISIBLE_IF_KUNIT int cs35l56_set_fw_name(struct snd_soc_component *component)
 }
 EXPORT_SYMBOL_IF_KUNIT(cs35l56_set_fw_name);
 
+static void cs35l56_deferred_component_init_work(struct work_struct *work)
+{
+	struct cs35l56_private *cs35l56 = container_of(work,
+						       struct cs35l56_private,
+						       deferred_component_init_work);
+	int ret;
+
+	if (!wait_for_completion_timeout(&cs35l56->init_completion,
+					 msecs_to_jiffies(5000))) {
+		dev_err(cs35l56->base.dev, "%s: init_completion timed out\n", __func__);
+		return;
+	}
+
+	ret = cs35l56_set_fw_name(cs35l56->component);
+	if (ret)
+		return;
+
+	ret = cs35l56_set_fw_suffix(cs35l56);
+	if (ret)
+		return;
+
+	queue_work(cs35l56->dsp_wq, &cs35l56->dsp_work);
+}
+
 static int _cs35l56_component_probe(struct snd_soc_component *component)
 {
 	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
@@ -1368,24 +1393,11 @@ static int _cs35l56_component_probe(struct snd_soc_component *component)
 
 	BUILD_BUG_ON(ARRAY_SIZE(cs35l56_tx_input_texts) != ARRAY_SIZE(cs35l56_tx_input_values));
 
-	if (!wait_for_completion_timeout(&cs35l56->init_completion,
-					 msecs_to_jiffies(5000))) {
-		dev_err(cs35l56->base.dev, "%s: init_completion timed out\n", __func__);
-		return -ENODEV;
-	}
-
 	cs35l56->dsp.part = kasprintf(GFP_KERNEL, "cs35l%02x", cs35l56->base.type);
 	if (!cs35l56->dsp.part)
 		return -ENOMEM;
 
 	cs35l56->component = component;
-	ret = cs35l56_set_fw_name(component);
-	if (ret)
-		return ret;
-
-	ret = cs35l56_set_fw_suffix(cs35l56);
-	if (ret)
-		return ret;
 
 	wm_adsp2_component_probe(&cs35l56->dsp, component);
 
@@ -1433,7 +1445,7 @@ static int _cs35l56_component_probe(struct snd_soc_component *component)
 	if (IS_ENABLED(CONFIG_SND_SOC_CS35L56_CAL_DEBUGFS))
 		cs35l56_create_cal_debugfs(&cs35l56->base, &cs35l56_cal_debugfs_fops);
 
-	queue_work(cs35l56->dsp_wq, &cs35l56->dsp_work);
+	queue_work(cs35l56->dsp_wq, &cs35l56->deferred_component_init_work);
 
 	return 0;
 }
@@ -1442,6 +1454,7 @@ static void cs35l56_component_remove(struct snd_soc_component *component)
 {
 	struct cs35l56_private *cs35l56 = snd_soc_component_get_drvdata(component);
 
+	cancel_work_sync(&cs35l56->deferred_component_init_work);
 	cancel_work_sync(&cs35l56->dsp_work);
 
 	cs35l56_remove_cal_debugfs(&cs35l56->base);
@@ -1478,12 +1491,12 @@ static int cs35l56_set_bias_level(struct snd_soc_component *component,
 	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 
 	switch (level) {
-	case SND_SOC_BIAS_STANDBY:
+	case SND_SOC_BIAS_PREPARE:
 		/*
 		 * Wait for patching to complete when transitioning from
-		 * BIAS_OFF to BIAS_STANDBY
+		 * BIAS_STANDBY.
 		 */
-		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_OFF)
+		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_STANDBY)
 			cs35l56_wait_dsp_ready(cs35l56);
 
 		break;
@@ -1689,6 +1702,8 @@ static int cs35l56_dsp_init(struct cs35l56_private *cs35l56)
 	if (!cs35l56->dsp_wq)
 		return -ENOMEM;
 
+	INIT_WORK(&cs35l56->deferred_component_init_work,
+		  cs35l56_deferred_component_init_work);
 	INIT_WORK(&cs35l56->dsp_work, cs35l56_dsp_work);
 
 	dsp = &cs35l56->dsp;
diff --git a/sound/soc/codecs/cs35l56.h b/sound/soc/codecs/cs35l56.h
index 9acd2e7e17c93..1ff6ffdc12e26 100644
--- a/sound/soc/codecs/cs35l56.h
+++ b/sound/soc/codecs/cs35l56.h
@@ -32,6 +32,7 @@ struct sdw_slave;
 struct cs35l56_private {
 	struct wm_adsp dsp; /* must be first member */
 	struct cs35l56_base base;
+	struct work_struct deferred_component_init_work;
 	struct work_struct dsp_work;
 	struct workqueue_struct *dsp_wq;
 	struct snd_soc_component *component;
-- 
2.47.3

