Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE00398915;
	Thu, 13 Aug 2026 17:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786642635; cv=fail; b=WDP2NlKuXmy1mS1F3q5UIbLz19ZxRQILE84MH/Lfx7LKpHXUFNSm5KdRZChRF23819kdwx1vuLQlWu02bQAm3z4ZXloCmffrgO5r1dt+hHEMfXa7FLnSVmZYtRry6qCHqA95mKRJp9wUxfG0dqwZXLnfD3IfkZ2gCY5J9lGj/OA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786642635; c=relaxed/simple;
	bh=YMmzN4e8xsNGggDgp1lJ7OxWJnVBtqgMnCy8fJ7gpHc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YL0NOEc6yUAzScH4C1iR4lwONQnb2bu7a0pu8s3L1A1a8UdI23nCOglTSDg2X32nJl1g9jSrN4ycHLevI5lAS0i66V+/6XfeyGiz3n3lqDfIBtQ0uhAvxSO/45AKD9Blk8KlUt7CspQwDIvoG6v+8FQ11cnDGQIb/7T8HIRRCQo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=DEchYMXg; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=birobduy; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="DEchYMXg";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="birobduy"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67DDKJFj2064075;
	Thu, 13 Aug 2026 12:37:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=trtOH5b9eXTRWYhV
	00RjJnnjIt7JBvQPd29SE6EBvDo=; b=DEchYMXguzSetspmY+eyCZWQ4bBrazWv
	87nqgyiz/rxhATpmygYuTJnueEtwe1bInwcubfBYnlYwZnOUwBR0F+K1yOVqfCOX
	JUMFXRIcYABbF09yvZJFX5WhPKLYQyAv10CaQ33b7ENciVdmzVBVYbigySViVxvU
	tToy/yi3acTj0vNj1QNLoy+9izLPaYB9ri4Suqa96vfIB27C9+oF6vDh5IFVjsnh
	UZKkmWwgTTyB5TMfXY6FhHkrbgeU/90cZk+MRlYuwyGpfcTLPz6rdga4ZfL0Fbd5
	l+5OrxeyL0IPwAiX/nV1BSwBMLWSd1F9HwKDf9FUfgb7dek2k+/AfA==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11022125.outbound.protection.outlook.com [52.101.53.125])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4fx1v128yy-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 13 Aug 2026 12:37:10 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZMP4eWZOit+lxG6kumwQeokCjw5CaLDv2lS7GLOr59hYllaoBlu/JJTeakpCUTC+8vfTiuXBDEvHnSAbiq4sMdR+wJ3t4ujFkq6q9xiJck5I++ZrnkUo8UYKnHoK3NbmKpS4pVIuGz7+5LI+R412BW3FM5Fu23xMG+v2FsKGyd4+ZsHpqguiw10Z9BS/xaGAtLspJX2yKzaL2ARZ2haEP+i9Z3LxpJZ70hsQlBSwZFqquoWCjHvmOdozm56Bj4H/n23iW7qIl1torwlp3IvR1JPQfFPUvuIBLyMgdVdwp9GD4xG6T6emvieUgGF9qBT7qb6X6jd81TLvHYh3ooM3tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=trtOH5b9eXTRWYhV00RjJnnjIt7JBvQPd29SE6EBvDo=;
 b=oZwk5bqit3C1uuRAf29L3nuNYPm6duEEBZ6G0cALyAKBob8tH2iuQmw6UGINrCCv+UI7AfFeDmwHGCPQOg44xyI4VPVRS+Fe8ByIZIZwOFdLjr+paD3CGypibeq4e73qPw5TMTNtYi7vnLaaGNMgB6MjRQ++aAYUAiaAI/Lp+/biaDelrJ5iUzd2ZXOnP84Sd5fiIX59/rot3OSdgnaAzIIowxQp3ubunkXtCW1eB3NcOJtCCFwNWod3xG2KDsICPVonP8IjTZEYi5kj9Fu1hU2uBIAihIvxa7/CV5bfDdtb8cuFRLpfpFVfkuOro+nnzWWz5g43uXdsRo5snG2gZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=trtOH5b9eXTRWYhV00RjJnnjIt7JBvQPd29SE6EBvDo=;
 b=birobduyqqUU4y6N+vGjgCZkOy2r4UbFC3+R2KhcGiTrDryHXs7gsruLHRRNCiukwNfGZ2VvBHNtn+2rOe4pleSZkVtYBVV14IF9ySkbLvVS4iVn2oyyeX/xv4qpGEYfozMdZGeXGtTTh03PD8UJbx1X+BO8TehGW1PDT7JSiI0=
Received: from MN0P220CA0006.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:52e::30)
 by IA0PR19MB7195.namprd19.prod.outlook.com (2603:10b6:208:441::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Thu, 13 Aug
 2026 17:37:04 +0000
Received: from BL02EPF00021F6B.namprd02.prod.outlook.com
 (2603:10b6:208:52e:cafe::72) by MN0P220CA0006.outlook.office365.com
 (2603:10b6:208:52e::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.15 via Frontend Transport; Thu,
 13 Aug 2026 17:37:04 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL02EPF00021F6B.mail.protection.outlook.com (10.167.249.7) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.3
 via Frontend Transport; Thu, 13 Aug 2026 17:37:03 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 48C48406540;
	Thu, 13 Aug 2026 17:37:02 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 304BB820247;
	Thu, 13 Aug 2026 17:37:02 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v2] ASoC: cs35l56: Fix probe deadlock waiting for SoundWire enumeration
Date: Thu, 13 Aug 2026 18:37:01 +0100
Message-ID: <20260813173702.1534029-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6B:EE_|IA0PR19MB7195:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ae22de66-c666-4a1c-b6af-08def9617ccc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|36860700016|376014|23010399003|30052699003|82310400026|3023799007|56012099006|10067099003|11063799006|18002099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	lwX0Dkuap6kfZ221coGT8z17BMODmLU9mxWfZoQoOiU7L07Su36Z+LdXZOnW6h6aZn9qXooWY7uu9sQ5zk19EsgEpYqXXSCphbpGvMCWtKP/aKEV7sb0V6TzLkPeA1FYzqka4EoarBqmL6sRK7a5i6tW844KePEOdenokEJ4AQxyGn0/H0+0q0jKDzr2FGJI8PQ1O0cM66lHNb5k7YU4d8lz/dywYGyKe2JWxOJgaBLRpMXoLCeNW1T+Nh/FzOiOnIQ2I2W4pI64K9t7DL5yGsoXZQv4UxvXSuDFClYh072eAAYdmbe4JnsXpussDjMviivJv6y5PDYteE4LYwwCCcFvNl5euW/MKKu6Zjm5vHJqCKti2LT/IOHM/LfHUjxqECtC8KHpShUuu6AIm4KbNup2WX77MYjaaMadvoLt+cL769UIJfGqJBqr2oZcVFFD1VGIlSy2as8aTV4kRKKd2BOJDmgFMy6jvohLYWT7Qph97wJZOb1rLqlE4kimLdE5c7J0H2wbK570LCRM0Pr9pzli4j1gUlit8Ayy4r4EvSWStqrz3/rkdo6VZTSnRHDWmEDHs8LBSRaHB+h2os8pWMdApEw803QW2sRenVkzzMHCfStdT6UQeQS5kUYdfG1ih2cCoWzi5RcKcZZ6icUeuBZKx3nd3iJUhkgQVjQssA1n8FMkNSyyJsIGzBjob/64bgkoBIihJPMbGIykW7R9jA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(36860700016)(376014)(23010399003)(30052699003)(82310400026)(3023799007)(56012099006)(10067099003)(11063799006)(18002099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	pfqLdEjqwSHFMW00DQL7SuPVNrS9Zq8KPYTgDRGlzAjn95W46zE+esWcl1thy0vtNu87IbBYIXOuCzVoqt+Tuyu6+QWTJO26w5WO7z4Ls7efCq0B9jpAtrOMibu7XYr5Ws8Vyv3ArJerxXen2ILVLZCWGqkUfp5tUEjJZ20fxnFVY9z8moC8NaxqC2T8iUeCRbWb1JVvL2Qw0w7G9a6kGo+8KoiHwAS3GtDnYCpqkC80D8rFEHieciboC56AvVZfpwwC1NyoJ/vb2Nmt6vm/dCUM0bH2xcX/Ol6hQrcS3LlhUGlGTYbBJ/kXNmoUyif9YEnNayzlexP+eVzxskSb+3mUa4hIRsQHz9sr35eS4U2r7ptQhpFkITGfzuxMnn+GEa/Lva+cIjC1NhPrUIjP2/lFf2uSa+K/l1VA0jSxBDpknBMZPU4d92knn/G/6SzE
X-Exchange-RoutingPolicyChecked:
	qxupQMb8X0IdU0kvWJgnkv5CUoEQpPhnnGM7tGjRLd1PdInNisH7BiAltnsjFpnus9vm+Fcq9upnSDpZ4umRCo4k2ZSwQX0i7oIydGZUA98b+fDg/W1q5j9EkKh0QRPjQ2ON0kvs5nWa2hwdoSHWWBVPvzakBs1vjx4DBLNzL5LPDAYYptGD3NozjRlN8TGMQD7zPIEJ8EwT4uWzYA3eNTfaIF4OhCwFcaVGig1YamH+KyZCNAeln1STndcm+/enWy2RxTOBhuCqbVxRxULYS/tT32Yc2TUATjF5TmnEQYVf8JlErOshhtUFyc57l8zFRGqieh4XS1kzDWY7KCTwvw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 17:37:03.2059
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ae22de66-c666-4a1c-b6af-08def9617ccc
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL02EPF00021F6B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR19MB7195
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDEyNyBTYWx0ZWRfX6EV3Y1wPWoB2
 r0po+RTBnAIYf+lEN75K7MFYT65ud6w7kxWtUWwrx75v2GMaYtN6Pfqtt7Hljt+x++u7jb+tHyf
 7xsAP0hF1yHpfZrZ1Qu0JBoUDL8826I=
X-Proofpoint-ORIG-GUID: 5ddnkcYfvrbLGW5tZOH27YqcfTKSCVIt
X-Proofpoint-GUID: 5ddnkcYfvrbLGW5tZOH27YqcfTKSCVIt
X-Authority-Analysis: v=2.4 cv=ZMrnX37b c=1 sm=1 tr=0 ts=6a7e00c6 cx=c_pps
 a=uzcQX1OguHUvQ3v7haQiOg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=ENopUhEeGXLvG5j3gvQA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDEyNyBTYWx0ZWRfX5m+R0INxxwdB
 wnbbJpYdbq5XBQ/JSF7GCTc8/I4UpmvP8vXFE36W7TtJNCA2wiev+WxQKYSvamZuHKbcaxAchaN
 jz9r+7lLMdiDnmriR9aueJpjz460Ky0BnwkgoYHRCmfaODayELIeRMB3J7xGK6MdUKrqyAg1ynQ
 PCWLeqvRNz0cqX2ab0ZxyFn2F1T1Drv/PFXei54cYZ4kWHapW4wiIeNQ1Gy0FMURFSTT2jA1lXU
 cIR5KPoW/LdyiKTDspjHDOtgSH4hiCKZZ4wOcTpdGYmGUflCdu1/COXX791+eIjN2axUqUt2VXL
 BirA8yG6gRP+/dx27NlA2fz445XETs/vjEwEI1lv967E0Jp1VVl7D4liMS+hoVE4n0q9C8PfRzB
 UgKPAFb8wjj/EU67Kce0t5VJ0liS7utnJnDBWq1Lmu8p9ERzzS0CyYDXHBUVgcmAm20crj+BVux
 FiZNKZOq3SSmLo5zYuA==
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
Changes in V2:
- Fixed missing flush_work() in cs35l56_system_suspend() by calling
  cs35l56_wait_dsp_ready() which already does the correct flushes.
  
 sound/soc/codecs/cs35l56.c | 51 ++++++++++++++++++++++++--------------
 sound/soc/codecs/cs35l56.h |  1 +
 2 files changed, 34 insertions(+), 18 deletions(-)

diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index 0b7b080939a18..00a730d047780 100644
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
@@ -1530,7 +1543,7 @@ int cs35l56_system_suspend(struct device *dev)
 	dev_dbg(dev, "system_suspend\n");
 
 	if (cs35l56->component)
-		flush_work(&cs35l56->dsp_work);
+		cs35l56_wait_dsp_ready(cs35l56);
 
 	/*
 	 * The interrupt line is normally shared, but after we start suspending
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

