Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BAC83C5855;
	Thu, 21 May 2026 12:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779366667; cv=fail; b=eNPpsR7Koumk/Om9LC9mG7XQC4Thvs/FQLAkSFuR2ORAL9KnfkE+QT4GpsP/rKlZiclYtZtEe/iHqCn+RaYICA5qMyDlYqHLO/7P9JOTn+N0u/AZBtVy9g5XszDlBnTq7JmkYlIeBSOZaBJ4e+RfuOQDnOkTW69tGhtt4nQX3LI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779366667; c=relaxed/simple;
	bh=LWC/fzyzdbt17UPVAGPWiC6viu7+WEKEPie0rClRUZU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=DPH9lwh/rj+oouXGnS6rbQAHJ46PNigTKjv6Z2XZ5kW+Xxw3j4nMSsTt24B8BB1ry2sdvyrx20QmlpOUmlX1XOE6dlRhwby4cKg036kJwP33N/dbdO7T8dALHMtR0M3vVH5Zun9q/tKI/LnhAQd5sEXlKULJOn5yuXTsY1qrq9M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Rr+Co2A0; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=QeZMYZ89; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Rr+Co2A0";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="QeZMYZ89"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L50ZGx2685326;
	Thu, 21 May 2026 07:31:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=DkijBLTAE1ynW/Pk
	iPngDvfik5lFEhHj3H/GpQkxmHQ=; b=Rr+Co2A0eeo/E6Vg4Fu+DcAuvIxqshPc
	gvye95Fv8+8s6LwbRuGgKib9O2+cVLJH69wP12S6TaGgMRzi6Xp71mcdalISVuV/
	4vX1e3V41zLFNJnLu/nm8we0SwNwk8lIhbCh/ORm7xUIHKSXiUjPVFh0qDATK0gV
	YWGZR3PHlkJzVEu3ZlTt9oYGrIzl5YBk5/u26KPwNfJ7CZ6ve3V+59ViEuPMrnhn
	2E6eSK32obnIJbxBk4ukYC2j3nEp1aMvZYni5pxOvF+bTsIsFw3uaJFEh7nRCWoq
	BwOqN3VMmUHH2Yxja7fxmcbpioVG9a+2z2XrLCiUU6C7tj9bp6arzw==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11021084.outbound.protection.outlook.com [52.101.57.84])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4e93xcjewu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 21 May 2026 07:31:02 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Byxa6/gRcygmvT+5NURFnwgrWbyWxv3TPh0aQ/rxhx5NvMZZ2SDDEWmxOpYAej9LsUF8OKe2wtsPK8aO49oUOQbOrYMp9byFX7xns+NlhVzJzK3Mu4E1FgWKwtVOKWhIPLLwwz+3U8DXm5sqtGnfmDoiCkdwlQ13jumMctv05pZjJqygTwq/R7rFZRxp7U+EX4frKCPHYNQlmmSJYytJ2MLLWchuhIrO5pUGgTxzvrQ4BAvu/Cg36xCWMpR9Qz3/uTJeuFatRq6zqWP9mrV2g0WB6HtrCJ5dClXqYUq1gonhQVJsh26NYAo568rCxx4VRuhsv6lAUVN54g8vzJdNQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DkijBLTAE1ynW/PkiPngDvfik5lFEhHj3H/GpQkxmHQ=;
 b=Sd71iX6lv9tlXzy7jO6Sdzh3xnpiArQS9PirNKbZ098dERlliyDQETagm5yIIVKy7xuMwppSoxGWQaVLqTzuWDnQwxVY4HfMbP5K4FJ8a9YmT36XkbOe2cYP8m9+IBmo0nfax2ONsN8qHk5KqQa9GGcrNZHt20p1at/3JyzgVAXXiIbJVvkJ6bUiOJoJXBty9WNpqJ0gSnjfuK6D/W4ilHudqGDsf+eO+S88Dupuzh6mLky4x1kmr18qbwIzB3Jybi1ZWpqMtl0sYNnPqgSLTyiQuJ8eDuJ7mpZkBKR2wJPzdUmQ6QjDIpckgRx/s3eFCHnaSzKrUrHRMTmKVjjUGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DkijBLTAE1ynW/PkiPngDvfik5lFEhHj3H/GpQkxmHQ=;
 b=QeZMYZ89qrNYcznKwWRyCtXwH+idVBGRCq9wis221Tvh8Fqx3EdBmByxB+1viJudSKpoWTqUjUBCXmJpOkcMeANYyk4T5Ju/4ay/0Plz+M3o4DfHggoKZmGozQUAv/TE0bjViu7YVfflx7bxvueUvaKUZVXGoOO2WudqFoYQcPk=
Received: from CH2PR10CA0027.namprd10.prod.outlook.com (2603:10b6:610:4c::37)
 by CO1PR19MB5094.namprd19.prod.outlook.com (2603:10b6:303:da::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Thu, 21 May
 2026 12:31:00 +0000
Received: from DS2PEPF000061C8.namprd02.prod.outlook.com
 (2603:10b6:610:4c:cafe::62) by CH2PR10CA0027.outlook.office365.com
 (2603:10b6:610:4c::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.16 via Frontend Transport; Thu, 21
 May 2026 12:30:59 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS2PEPF000061C8.mail.protection.outlook.com (10.167.23.75) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.7 via
 Frontend Transport; Thu, 21 May 2026 12:30:59 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id C75BC406540;
	Thu, 21 May 2026 12:30:57 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.13])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id BA446820244;
	Thu, 21 May 2026 12:30:57 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH] ASoC: cs35l56: Fix flushing of IRQ work in cs35l56_sdw_remove()
Date: Thu, 21 May 2026 13:30:57 +0100
Message-ID: <20260521123057.988732-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C8:EE_|CO1PR19MB5094:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 486807f4-2b6c-4f65-9d7f-08deb734d03f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|61400799027|376014|82310400026|18002099003|16102099003|56012099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	tutIxXHfmlXeVBhMLtucGIylVb9fwYCLIqgWbNz1XJYfftCRPAU8+CrgmbRGtJlvinxSfYQUenug6fY/ywefnMvipSRMhnFYFOOj3uwtQgg3TgsWZlagw55wUjnuZR0OcIfW2SPmK7/nXpyxIWmLqC0By5wVfyE0cIfysfcT9XG4p2EPvtjeaDgBwAQv6XoxkjlYF1M8gtZvNTniYsg8WQZABqD47C81hp574RxciU3J7ubxgyxKIOqtjcKLmiHm4CLcNqe8MJ9oxpBYkQPH47OK66IXDUVwWf4i/HH897GTvaNOJczer3yz/+WcFnNglzHBehHyts/o4zi4vxEKtabIihdyrAQAKl7GVhcbRN77jkEpHLvraqTbnBxbnb4GJS0cUZPdSsuhtulCdwrgcW0YLnss/HMME0RNhowstGvERolR0lWbMcPIrp1xMF9ZDEvZaC50svV2W4E/6+UkNDna8O2KspBFfBaIUR6Aj5y5CMlTLuTk3XhvRPoFYLZJknUcJL1lgZ9RnjN5WEaBdAElq/f/77BhpGfn+ItTLsUAAOFyfsMcFqvhYGRIoIyNqgDVuO7WDaJbAhEF6vc/ePB3U2eSTPX2k9XNT9K80+crvYxYLU4jlZEzYsU4XlZCAugcjkpnwif0/0dLtkx5hvLGOPP8fdWvDHVwlRV6FPbQ+S5jH24HL3xBnwoJmduFNyJLXvW3ew0t2KWB2coNQrO0fml9zlmLpo3URKClY6Y=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(61400799027)(376014)(82310400026)(18002099003)(16102099003)(56012099003)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	YH27PibF3BBVJboqA9I78Vi0BX6uJExnDWNsaFG9YsF+jlJ8e549ZgZBOv+9m5qwQRaUfW7trv3QbpEjc6Ce33IqMyAh0UWPZykVsOspDSTO1ykVWGhb46rfiw2/SWeh61Jq85VPkUiUhAAhfhhOrDitRtzQTGdXZ3khGbJUINrP7oG2xA746BhsHsBvutcTydahOFLu/mtYp1kB/aWZTq4V9tmb7X1MtjZwee99ko8WkPRlgUOJzY8kwAWE4RDBFw290ZNU6SJDH/UnfvYnvHgbRB+zkdrth6lkJjqkwgh4T3tIm4HQ4dOnVxqwok6TEMh36uBgbRLK5tA2nQlVhddrfMZrmV8YC6ahG2OElBdU+phN4vKzx6cjLFFe8L24lfk0VxntujkB0+fEBkWS3K5CGiH2NUqPmhNlWPqgCdWMHoHkOvaoXc5lOnoOdG/h
X-Exchange-RoutingPolicyChecked:
	PgVerZmTBBhhXd9vQZxvGUiEcJdROFdJ1M4jmR7NVBLW31lnTnpnlJS+89CIvY8u8PjTvfVFlDPLs8lVJoGXzHzFoh4D2q/PwayFfo8EU3+54qrZJW7EikaKi8UzUlfAaBRwjpjjeGblkN3y/qc78eNg9Y2Cp02WWMWLr4D97QhmPYey0PTMOQ6/ftGt6VHzIJd3Aw2ksIiKsBmMWPouiJjvzTpB19qFkqFW0ABv/JufCvzDyqv8arXx8ilO3pXSFGQFu0OO0OpTChVpFh3vMv483tNMgS0q/zuEpqBvl+dIPr3n1T1sbtyE/gjAaMUWAvZTpLboUEhnbT4aX+qhlQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 12:30:59.0454
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 486807f4-2b6c-4f65-9d7f-08deb734d03f
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS2PEPF000061C8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR19MB5094
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEyNSBTYWx0ZWRfX5Hy/FUO4NUOD
 M7aGTfAhMfXK8wyspVaue3BWSUSVkoPo4inCq2Gep2HIoN7FzKrbq7wi2fkSY5Dj7yo0QB4B9QO
 LeSXfMwscvNowC8tW/DgTsX6qGQ9vSpzYJttsXqXUIxFUdsFUL0Rhifmkn1wQcAURxG+rxAczEQ
 +zLgf9YHiR8Avcu/LeTKaSLDHuvOUJ4euHqtAxDbGTrEvv8lN5uwOMiT68S5ijdE4HxaVi5jLOU
 DJXX44DrPOZt8DgYwMWEJwZagbvsH21gvcOm1NR230kzFRoFJi/iNo+3OXckZar3rkZ2Y3wGHU9
 pRAjpPqNpXUBE9YHEgIs8SWBceMQ6WlwhHG8O2c7rHvHrm2eZFxw2haIpmx4Xp0DyTmZqjJBbGq
 6dI5Vacxi5F+7lqh3XeAIT+XX/1XHvqXz0+RKNYoVab2IzJqluXfdIlB4jZGA0+TEexe9Bqdgey
 8X/i0MbSW9+PlV7MvCA==
X-Proofpoint-GUID: 2cJK1flouK3-BUKyNwl1EEmyND9Kj9zp
X-Authority-Analysis: v=2.4 cv=Wrgb99fv c=1 sm=1 tr=0 ts=6a0efb07 cx=c_pps
 a=UWRz77ybNBoRz3V4z6xh/w==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=PdROo7M5Azm5kVLD3_0A:9
X-Proofpoint-ORIG-GUID: 2cJK1flouK3-BUKyNwl1EEmyND9Kj9zp
X-Proofpoint-Spam-Reason: safe

Use flush_work() instead of cancel_work_sync() to terminate pending IRQ
work in cs35l56_sdw_remove(). And flush_work() again after masking the
interrupts to flush any queueing that was racing with the masking. This is
the same sequence as cs35l56_sdw_system_suspend().

cs35l56_sdw_interrupt() takes the pm_runtime to prevent the bus powering-
down before the interrupt status can be read and handled. The work releases
this pm_runtime. So cancelling it, instead of flushing, could leave an
unbalanced pm_runtime.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Fixes: e49611252900 ("ASoC: cs35l56: Add driver for Cirrus Logic CS35L56")
---
 sound/soc/codecs/cs35l56-sdw.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs35l56-sdw.c b/sound/soc/codecs/cs35l56-sdw.c
index d2b82a846ae8..c21568f57c63 100644
--- a/sound/soc/codecs/cs35l56-sdw.c
+++ b/sound/soc/codecs/cs35l56-sdw.c
@@ -544,10 +544,11 @@ static void cs35l56_sdw_remove(struct sdw_slave *peripheral)
 
 	/* Disable SoundWire interrupts */
 	cs35l56->sdw_irq_no_unmask = true;
-	cancel_work_sync(&cs35l56->sdw_irq_work);
+	flush_work(&cs35l56->sdw_irq_work);
 	sdw_write_no_pm(peripheral, CS35L56_SDW_GEN_INT_MASK_1, 0);
 	sdw_read_no_pm(peripheral, CS35L56_SDW_GEN_INT_STAT_1);
 	sdw_write_no_pm(peripheral, CS35L56_SDW_GEN_INT_STAT_1, 0xFF);
+	flush_work(&cs35l56->sdw_irq_work);
 
 	cs35l56_remove(cs35l56);
 }
-- 
2.47.3

