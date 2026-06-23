Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1D8C36C0AB;
	Tue, 23 Jun 2026 10:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782209928; cv=fail; b=hl3H2oC8mgO9LK6xCMK7XVrkaCVhAxqi4dKyG90/4zwlYFEWXIvZddQc82bLzacI1Vi9WnlsqcBr393bYAX4gowzpW1c0h337SMi6XCPDA2+HZQgN6M+I2QMU04MZX7vaPlqGsc+pIYbgeoCyN3FVrMq3L0eMYPvotbY9FhkLIg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782209928; c=relaxed/simple;
	bh=VlwruK5MDG31QOoXz8qekMEqtmGjr5qn6SiRAMrOjC4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PJQf61Xo4Oae+6jVot41WwmvGRDjF5b/avF5VUJl7oYJm/iLaZTvXlfIvZyiYPPfrZ+bA5v4jRTXiKcuCT40to7qHw4B6CZ4UtpHUYrD143pH5uC2Q7MPXNsbGGEBlSsHCuyv/drdErHwbt4k4hFusSnV/Mn0cOuGk5XWZsbQzs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=L4sDnteL; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=v1Se5/Cj; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="L4sDnteL";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="v1Se5/Cj"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65N3lKH31004459;
	Tue, 23 Jun 2026 05:18:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=SR6wjaH4nVgi62f8
	z53eRQeQJTNmNzLGQj6pmcuRLmU=; b=L4sDnteL/Brn9XlbtAxEy1GdLJqz0uPz
	EEVMAe04/OclG4YME7OYmLGC8WaxvfHsYUFAEhUC6iOTxf8s41YoS1lr969yS5bW
	VzMsT35atTkQTCScbGRMg3U2YeA27pv4nV2ktQxD+KyYGsgtdU0vQCA3M79QvWDN
	j7Iyk0BhlC+Tp6XMiOryZ0lYxj86UZr4gQc6beQ/l38PgFxTAFBEMUZXfjjisY/X
	/TRC9SIIS3EfGfG3FRu1enNC0wZAKCXJqsxqs3kG2EWCRfKAY3v5hxITpKn/EnD2
	zEvFAvNOvhtpemFMYNtRXsBWIo7JJLcrOOtwP3NzAfr+6IPYuq8Bxw==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11023075.outbound.protection.outlook.com [40.107.201.75])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4ewq9jk5wf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 23 Jun 2026 05:18:26 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bfnkGOvu1I8ORymU3Y95O7g3k4k+BFu8B8OIVV66fTPn0rq+mIViMDnWyLnfLCk7QFAroBi8YTMfT45cHNipgdtF7M64pG6FtJY7b8CbGUlUBqNjdNZnd7s6KlhC7dH9nYACafJiGmHUquvSczqa/F7aIBqSab/A7QVfxaTDfR6TKOVbW0OOe19h9kOtVjpKKswxXgGGbcrkiFBG1xyiiLkIuaA0QiDaX/pNYwt5fZ+U+APSzTOTezRXkkJN8VbDG6eH08tBEJM/QaX+Y7tRof8DI7Xn0zsNqanGF1fkWBByZINVjwhQ48GkzgnyRzMNOu8YoSdbt3IthtvPj17pAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SR6wjaH4nVgi62f8z53eRQeQJTNmNzLGQj6pmcuRLmU=;
 b=xCPFqJy1b8vtxM3M+Him+pwp2SF3c/rzeADHPbgFEs/wC5ZKZS+AVaAUFmQXYLkse3sQ9bYGA1dopLRWyypclvygoQTwCAz/3YOK9XwTefdfrLSGKlmyeXGZroGDFiTBpXQbZZtto8DJyLxpxqkE87zum26qBs13irqpu7CKE3FFbbvdYL44egAmR7GOD9tbW5XNe++3xjtBWgIRFZZNVKVMp5XjRjsOs1selt46jngnNSq+wQueqV/HllJLRxuj30sZdGS9pbvH4sHW4MkKMNKWaJNqlTTzVXWpYxnLW7iW/kQAqbX6RmuTgGKX1qiL0r9/XWE6lLpStkD066q+Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=arndb.de
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SR6wjaH4nVgi62f8z53eRQeQJTNmNzLGQj6pmcuRLmU=;
 b=v1Se5/CjLz01T00O76L222y16UMgtX2Is118sZ3VWZ2vTf5u10SelZ2f3Eisf4L74cOtmqZq+fu8qXmIdFj0WMnQkCJiWZYXdEBBMc0FLTk2sJJRFs/koH5qkesMTkB3Oppii0veDLElllcJE2nupxSfkHrEEDHnPuwrjFY/NHQ=
Received: from SJ0PR13CA0156.namprd13.prod.outlook.com (2603:10b6:a03:2c7::11)
 by SJ1PR19MB6308.namprd19.prod.outlook.com (2603:10b6:a03:455::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Tue, 23 Jun
 2026 10:18:21 +0000
Received: from SJ1PEPF000023D4.namprd21.prod.outlook.com
 (2603:10b6:a03:2c7:cafe::12) by SJ0PR13CA0156.outlook.office365.com
 (2603:10b6:a03:2c7::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.11 via Frontend Transport; Tue,
 23 Jun 2026 10:18:21 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF000023D4.mail.protection.outlook.com (10.167.244.69) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.0
 via Frontend Transport; Tue, 23 Jun 2026 10:18:20 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 411E840654B;
	Tue, 23 Jun 2026 10:18:19 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 1B76E82025A;
	Tue, 23 Jun 2026 10:18:19 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: vkoul@kernel.org, arnd@arndb.de, lgirdwood@gmail.com,
        pierre-louis.bossart@linux.dev, yung-chuan.liao@linux.intel.com,
        peter.ujfalusi@linux.intel.com, oder_chiou@realtek.com,
        jack.yu@realtek.com, shumingf@realtek.com, niranjan.hy@ti.com,
        shenghao-ding@ti.com, kevin-lu@ti.com, baojun.xu@ti.com, sen@ti.com,
        zhangyi@everest-semi.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v2 0/5] Fix SoundWire randconfig issues
Date: Tue, 23 Jun 2026 11:18:09 +0100
Message-ID: <20260623101814.24044-1-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D4:EE_|SJ1PR19MB6308:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 77236488-7bf4-487d-d2ab-08ded110c04b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|7416014|376014|82310400026|61400799027|13003099007|11063799006|56012099006|18002099003|16102099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	a5fH8op+jG5TndWOCtFFqNuUP5ehV+e24a/zy1x53bTv+BTdeWtdJ8XgCychR7c7lyIbjHGC3G8Vz192OuKshWgTclRva5U/g5gRNys8D3D3WRAWQOVBFSAzhAUzA3pZhWK/Wo4LFpcDIpTvqvj69Hjw3HfIlstKIqmllPnrTcB3PxiEFLdp+YrdL1wH+2cNkSJAbbqnwPisk9Xo8wrqFWMfivqU9IPqMw8FFxBf/siDYNob1W5O++MOTM8/d4SewU2lp+eHo6wkUyQvQnKeouKgLqGr3sUAVVPYEws0lk2FaZVJ2Est2SRy/XVTlLrtde7Dg9NpAJkNzLbjMi574qGkrwVdEetS82/ZpOY630K+J4Bx4kgX2cf3U5uP1AnJrYYuRc8MVCGXSQOQjmnP0h7HsxNAZKhTtdNQmK0Y1ZE8abXfyDo96OADDwzG7sJMh9XJKtC9mlkEjxmZWYStOgqIm32FvQNMlmS6oMYxPxMttftswlvq4DN9j4ScVc9alcp8xZ+SILXMPrylYFAJZT3JdCJwrez319z3O0WJJVvAH4IlPYhD/tubkSEFTfA0seIQuQM7G0FRWXD5FyTWzGYEgWDYC63JVjEQCqlVXOGc3B98b1cZHMHxlsIvZPgyaLSoApCaK608RZCUlir4MeNURpd+rsllwqF1d0NcvC0LCOfGDfnXgI6rKUYpuCpgqJDdsDHJ7OzYgPURcZoZIA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(7416014)(376014)(82310400026)(61400799027)(13003099007)(11063799006)(56012099006)(18002099003)(16102099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	HFf/s69YtvSImd+2VM7WsrEC4mSQNd7RRaIZ3RY/vzcpyUSg1IHJVkPC8wjnsmkBh69wQGbpK7zIE1+2w65RtUoMA25gR5xaRQGhA0dnwwkqa+swYxTJ/cM/BXKDtihEPMtk5qErxJkimp1NIbmTJznD1gsOVb1oUDjRO85/hD7CLK4U6DEMUPGUzoawikkcJjsokDJgvi+814KcktTHmChS00Qsy7zBZwmkfizL6gbj4xDipvNeasmCNIZfrWxDTLZw0nyzSWYSp16afxp+OmrcxlgYGAu0PWjs2PBI5XPkNnppyYDQ/KO/n1uHxiFgu+tjOHPGXDKIvF9fIKtQO2bmcCbkhsr30xf1SXKWI/k1UittBVmIZHd+qX2E9eOc4zLEe3DYNbQNAS6LEPdA3jTZU+JZRY0QZ7LgLo6E8hFZO1LsWr+X3ii1pRnQ1sFi
X-Exchange-RoutingPolicyChecked:
	RSdJoyD0jLxb5HIEtX7HobvmEBJeIkUNiA2gJ60mkpGMvWfkXdztVMORxTumvDmHOLV9dqJ6oSksiI8SXXFIEO+FfBeS60HPiqQpqFz5ivcNuzulPTcf94HQdzp8uS/nKwWxz5hL/qF0bgp/xepf5VYLhSWsoFl4KfQNqDT8tGgGUkZqy3FKx8R0jcVJpLxLiVUfRBubEiusoC5l0873+8o72yn+0z2DvcCfjpMqfVCF1XJ2Aa4cwbPTJhA0vPbE3t3VPckMzkRN7q8yWD5oPPTdHXJ0C3AIbNlQuJaJgAysni4fhXRxbDhT8MXDtGWziy23BhX+ixVTWEoTk5ElUg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 10:18:20.5851
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 77236488-7bf4-487d-d2ab-08ded110c04b
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF000023D4.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR19MB6308
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA4MyBTYWx0ZWRfX0cmSCLsw3L6i
 iNxwTFF6K7WgXdxWVegw6Tq26RHJAxagNYeXAaaHH3Sw8lADhZBm/06Q7Jzds41z9CCyREH0OkP
 OYqxZAVaVnCo64jqGuq6kRVU/AAt1xbIdECMu6yjUwYdzecUgSBTZsciwyryUdAdsT++cCNr/+i
 yEOseQb5iuhrvr9KZmEhj2jCmKDu4FBXruRTe58Ynw9d56GCzi5Ii2xWOWPJtE2R2YgcmiqSnaP
 1vupMkDkEGdNTyLPyIKJzJ2bNHuubl8xpiFeC0Q/g/c4oEFSEgE3jOLBbDfRaNzxqMebAneCepm
 hm65fygLmS25NbsMUD601dDf0yt4yJ6SZgrJYtRVJ/x+anVlXbjnjL86IR9gSSRgKjB242O7637
 cAwlH0R8o8nVJEFYDsPn4K6oIqCOolmirucSxXSexETvTEx4r9EVJqJZP/OpLhPJDPvOnM4SEWV
 jJU7ziXYM8Mwzx+v0TQ==
X-Proofpoint-ORIG-GUID: Nsm_JZq5MQck3uUhfW-3N-L13qeq1dU4
X-Authority-Analysis: v=2.4 cv=SajHsPRu c=1 sm=1 tr=0 ts=6a3a5d72 cx=c_pps
 a=CMChTFI+x3L+VPqXLnm0rg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=VwQbUJbxAAAA:8 a=w1d2syhTAAAA:8 a=qsZerDP5sSoKjTAZVc4A:9
X-Proofpoint-GUID: Nsm_JZq5MQck3uUhfW-3N-L13qeq1dU4
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA4MyBTYWx0ZWRfX2KNMWoyYE3Ks
 MGRRC2j8QE2GwCjc1pRUp7MbtgnUHjIphiD6DfTk+syG5jFbsteLRECYFOjyIGT+L8UQ1mky8gI
 aGy6tm0NtAw9MW3Rp6rQRRsiggz+Kjg=
X-Proofpoint-Spam-Reason: safe

Moving all the waiting for soundwire devices to enumerate into the core
code [1] has caused some randconfig issues. This is the second attempt
to fix this after there were some short coming in [2].

Sorry for sending during the merge window, but people are keen to see
a solution posted.

Thanks,
Charles

[1] https://lore.kernel.org/linux-sound/20260608102714.2503120-1-ckeepax@opensource.cirrus.com/
[2] https://lore.kernel.org/lkml/20260615150523.4006982-1-ckeepax@opensource.cirrus.com/

Changes since v1:
 - Add include of jiffies.h

Charles Keepax (5):
  soundwire: Move wait for initialisation helper to header
  ASoC: es9356: Add back local call to sdw_show_ping_status()
  ASoC: max98373: Add back local call to sdw_show_ping_status()
  ASoC: ti: Add back local call to sdw_show_ping_status()
  ASoC: realtek: Add back local call to sdw_show_ping_status()

 drivers/soundwire/bus.c            | 28 ----------------------
 include/linux/soundwire/sdw.h      | 38 +++++++++++++++++++++++-------
 sound/soc/codecs/es9356.c          |  4 +++-
 sound/soc/codecs/max98373-sdw.c    |  4 +++-
 sound/soc/codecs/rt1017-sdca-sdw.c |  4 +++-
 sound/soc/codecs/rt1308-sdw.c      |  4 +++-
 sound/soc/codecs/rt1316-sdw.c      |  4 +++-
 sound/soc/codecs/rt5682-sdw.c      |  4 +++-
 sound/soc/codecs/rt700-sdw.c       |  4 +++-
 sound/soc/codecs/rt711-sdca-sdw.c  |  4 +++-
 sound/soc/codecs/rt712-sdca-dmic.c |  4 +++-
 sound/soc/codecs/rt712-sdca-sdw.c  |  4 +++-
 sound/soc/codecs/rt715-sdca-sdw.c  |  4 +++-
 sound/soc/codecs/rt715-sdw.c       |  4 +++-
 sound/soc/codecs/rt721-sdca-sdw.c  |  4 +++-
 sound/soc/codecs/rt722-sdca-sdw.c  |  4 +++-
 sound/soc/codecs/tac5xx2-sdw.c     |  4 +++-
 sound/soc/codecs/tas2783-sdw.c     |  4 +++-
 18 files changed, 78 insertions(+), 52 deletions(-)

-- 
2.47.3

