Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 324AD3B8BCF;
	Fri, 17 Apr 2026 14:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776437172; cv=fail; b=a7MWNi+R9E9FJ9C4zO9IIF0xos/doU6RW3M/rYoMzXrNAgeG0O9Sf9cB2i9/+pz3TgkZJGLYCLGbsKfi/QLa+ld3GO2AeP9V2hhfOFJyIqtbo80sZCji4Wxcq5fXS+Llqcpw6bpsVRRX+haWcPLpdU8QZFB7fu6DiN/GbvpwW8U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776437172; c=relaxed/simple;
	bh=S0CovjtMMqJ2pxrH8huEkZl40uaGpL5CfbqqR4+Vr7k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=TVLwzk/jHTKaFZHQ2+P55dWXHPdZ7/cVu8pIYD1aTOSmtArLIQFTAKyp/Qtw0+eWeSTU2uUvAJZBwMNrrfu4kWzF+RpfCO5pyPumEC8oYl2pExSspipjbR7JVldPePAzdY+OnYvhpDSgtd8mKr+DOUuQXf90JDvSuF4F1vEwBI0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=nNNrXpQC; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=jJJh3EeO; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="nNNrXpQC";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="jJJh3EeO"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63HBR4Tt1946792;
	Fri, 17 Apr 2026 09:45:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=wcPboseusSKf6+pe
	xLnveTgOBugDADxvozrPjaA0mss=; b=nNNrXpQCrJBXmNuDJ28m1Gq5itvgVx0h
	7f9w5+M92mSa+5SahlgobQNPy+hs+LzRsZuPUWvnOtDJu5o/VVkdAiF8dS55IRYk
	6uHFqRug9wr05VBI2yf4Eugf8Pf2TbpG8QK7vyKXeJm5sw5ZTnYDsuLisqbEqSX0
	CUXHaKwrWqxNFR3fV6jiog79ks2OBQpD1bIe/YceHo3R6Ov12ad1ETHib0N0BzeZ
	7LivSxgE9r0gfJazUt7fsuZfBsL2V97WCDKsn7ISF3rIUpyqnEuDsMA1uZIdSTMN
	dEZFto4B/twx6u/MTKC9CfGpFri0hHIv36fp95bFzVUOJC5xjFHFLA==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11023102.outbound.protection.outlook.com [40.93.196.102])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4dh876n7pc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 17 Apr 2026 09:45:44 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rdD+66YbGirjJbl4h2Y3bbYJdMC+ypBZIFp0CmWN5cH6y1trQXphEDnKiutw2dwdd7GcdYEcHDOuZMOR5YGMCEeJg9m8gVyUaeotYP3XpL5tIGwGR+xm3nrMuX4bNd+nf17Ir454B7hGom6sRscD2GE3C1kKa2QBp4wiPZMpwNgsFzZs355lstivMmAvZ7yx9NbgVzfOOZvh4pggpcI157PxpXrEzYeJT0Z5iVtzz2GMMR0QojogRL2ksDwgPPsAbOxbMF2+obV8xUly8y88iPBTda+woGj2+J5Jq7Ybd7kx86/WJUzZwxSkHGYEBG68Gfga3qWjATKIOEb+cQ2feg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wcPboseusSKf6+pexLnveTgOBugDADxvozrPjaA0mss=;
 b=jcecx0vC13M/vlmqN/6r4G1RttrDKMHpdtYYoeyhmp/cRaATzhborisldio89wmW3I0FVeoeVAnpf5oDur8YZ+cyyLfukzfG8ahQBlrJfbOREoD31bABprVB9AAqJGhI+RAfA4HmKXbaZfA6RiP8vz0a5Oaau/75Y30ztGhqYxGQ5+gkEPp/hnWKjnEsLzVr5/V/kIWUtg5Lvlrwqf1PbQYA1RXA1H/ascJducq4ADj6kb0P5nL6tPR548Qf9Kv6Q1l6ZU6fZCyrikJorM8Z74/gwYN18lXtAJmBVNFoJLKOeyVmez3AiybgyBkTQU703wgRINy/qyy10P++4zkTOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wcPboseusSKf6+pexLnveTgOBugDADxvozrPjaA0mss=;
 b=jJJh3EeO/EJydCC4skXP+D3hZAmrzL8FMa6wl8Jh3DlI8yVcc5A+uyEGhwiBuAJ/DDFbXIoHHgUFlTguoSveqpw4mTiAzrViyiZzSs/E0vVDGW8XaUImQRrRV+fXK6J7Mfj0PCkPBQQ/pPa78+74ZHjgyEEHG6fjc0cl9FpzxMk=
Received: from SA9PR13CA0001.namprd13.prod.outlook.com (2603:10b6:806:21::6)
 by BY3PR19MB5089.namprd19.prod.outlook.com (2603:10b6:a03:363::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Fri, 17 Apr
 2026 14:45:39 +0000
Received: from SN1PEPF00036F3E.namprd05.prod.outlook.com
 (2603:10b6:806:21:cafe::c4) by SA9PR13CA0001.outlook.office365.com
 (2603:10b6:806:21::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.52 via Frontend Transport; Fri,
 17 Apr 2026 14:45:39 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF00036F3E.mail.protection.outlook.com (10.167.248.22) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.17
 via Frontend Transport; Fri, 17 Apr 2026 14:45:38 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 2E3FD406547;
	Fri, 17 Apr 2026 14:45:37 +0000 (UTC)
Received: from ediswws03.ad.cirrus.com (ediswws03.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 2002D82024A;
	Fri, 17 Apr 2026 14:45:37 +0000 (UTC)
From: Maciej Strozek <mstrozek@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>, Bard Liao <yung-chuan.liao@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com,
        Maciej Strozek <mstrozek@opensource.cirrus.com>
Subject: [PATCH] ASoC: sdw_utils: cs42l43: allow spk component names to be combined
Date: Fri, 17 Apr 2026 15:45:25 +0100
Message-ID: <20260417144529.2385360-1-mstrozek@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3E:EE_|BY3PR19MB5089:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 51556366-5b4e-4625-e4e2-08de9c8ffddf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|61400799027|376014|82310400026|56012099003|16102099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	j0Q1nQ6x85WDuWq9x6tswtedZMJuvTR3pjg+koTmaQHqiOqpwjt7kZZtT1+JJZdBVLi7zf2i5Wu8HWUQMvas/v7SCqfrMyFVd2OTmffANYjDGK+TD5SU6NH1sjFz4buG37uaLa6mONCIUP8Wg020Ba2UP/K5OFtz2fItmXwjSJ6oJEhEXA78xoHnCIXjeulsMwj5aI7/VUlkz/rvRFrs9NG+qF8g5nMGMg1OVp5NFyUhQYlxwVeeWbK5CofJm6jwvtQs5Clfsyz5A+uG12T9GZzz4HNceYlSwRbizxm7XgE7C49Gu/Jo/db50gyPr6x2SW1AWoLQf9aOkDtZGLOLqOUQLoBcuBOZ5GyDO0aJRn1cDzcvWKYfpjfa/fUrxaZc3HrV+AQZ8iYm1w/q4IUJBG6mg/8AyD73xx6Jytc+loy2sOwF1FHTtkHTFJy+IwUwnVTIikj5cd/gU8NFmCkoLsQ27rT5MQ2TEqfqjfhmHBVCt/GCpmnRnuHr0jwJ6QYrgYjhswF8dd6+WfyyEc3xQQCaH/i2WbZTV/VatC7i34R2ZpV3qiteIBsGgXUIAtXq/rdwN0jcK/4Qex1pC+Gc/8fak5v5SpXcF7To+fO+2+aUyDdj1uNDCxgOwyUW+2sBfPfhFHrGoidgomO8n8tJAssUl7z9jiNBRovCabogG+2DCGWttgMMAiAUxVG4vcEtjZCNq7WE59TWPMkUPgwnahJ0xaxC7CGx9nfD/NCD+GJQbn5HTavbT6M5GXQTTDinpjHe0Rv3QWY1eZkzy9YS6A==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(61400799027)(376014)(82310400026)(56012099003)(16102099003)(18002099003)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	7yS2cHpYhH4umeINouBDoP55JsEcQ3zu5pIkSnLw4UxX77Fzrv9sPT2ytEoJ1Qi94dUqL/JdwdFSTo+qjsqwZ4H7k+rvwK7XCeFbrR6rgxnmIt07qdFov2tDL6ngvluctwVdsXaYNlZbVcSpZkDzeLwWOemLw1TFImaDjP7L7MdoG4ef6Mh+1l29al4X+A0Mm4q2IiG0sXcni66afw+Xiav419jAYoLjyZ9U0EQEpvMhCh/e5jQ0/6scfE97g2l8WiJ9vUGscdhbTQ6+CubOUSIog2B7Jrjr4lyVor+Ch7TtyhcvzZeQ7laZ3m7zR2qlY+7gvReczn853lyiuW60TAznDkxtj4aSmJq1/+HPMro0UPhhtmpo+0ZIAzr9FZHAVu42i6XY0YS3wQP0nB8xb/0ulk25JCcsUx+yZjbRLecmW/8IPB5+5y6wtK7OTx3g
X-Exchange-RoutingPolicyChecked:
	nko37Lj015IwF/RVYEXcdeQ/Vgv4eYDhrLHmvL2vRk3LimNr2mg4U13KMbesETcHGPRhXEGfKTSaJlinYL1jIwsVI8/5IeZCYY1wZbZoy++7mhKAEQOJJqKohwEthscqkHDhP7N0fv2LLL5HxXD0BREjivjtYiuawj3murPcj4GwvTTWn11RodnY51jasePtPpjQN9XE5UsUGiR1EYuGVsRXqi404EhPd/uuYfdwpQiu2XQQ1y+tMU+7aNts9kVSBE82O/k66od/zijrYPcKONjjXpXiLB4sLWoD1Sd2HzcwOHSMwo5Ol6er6kKHVDb/iw8oqpV5lA7JfKOFzD2FnQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 14:45:38.3887
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 51556366-5b4e-4625-e4e2-08de9c8ffddf
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF00036F3E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY3PR19MB5089
X-Proofpoint-ORIG-GUID: GYQySBTpHosJoJum6O04g-DXVtiAG5Nt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDE0OSBTYWx0ZWRfX8Rsq8G1gIr9c
 aqc1Uhc3iB9TWhjXQXrzCTJjXbe+EUdxYbzBY5G5zQqLuQbbJottIgqqBpFH56yyXGHrvMyRIpA
 EtdgBJnJCyD9dIyQ0l3+km/3sh2F9H/98O6jcIHXuzFuyvBJs2kAF0SP3V3soEWbs1RvLQpcrtK
 DLX88A8SkWOOk+w33G3QaaiVrqxHzr9/oR4ytrrsO/HE7CEOfpHXcbshFhB7Ie1yCOceelIMzzH
 6OOji73xyZHrdDjUs9+qmu69kgy0s1qw4xeYxw0n2pG2b3VZYg5iMSstUraOfb0Y/ysFK2IxqzC
 hHq48rrez6BH/E3FU1Axs9vwriChTtbLdQZU8oKn890haTOjA/BMtnpSjpXORJFylbBUBsm7OJ/
 72IQhbNf1IdgDbQOQQHzEVkvdwYFHrKvAtGrtx00vGWYAQNiLvn1QV0z7tgHoEk4fPOEdNFluOH
 COsC8lx/WYZSz/Em/2Q==
X-Authority-Analysis: v=2.4 cv=Iq4utr/g c=1 sm=1 tr=0 ts=69e24798 cx=c_pps
 a=9MoqB078x+EmXT3bS47rQQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=A5OVakUREuEA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=NEAV23lmAAAA:8 a=w1d2syhTAAAA:8 a=lDUFhbT0FZI9Q2P5P-oA:9
X-Proofpoint-GUID: GYQySBTpHosJoJum6O04g-DXVtiAG5Nt
X-Proofpoint-Spam-Reason: safe

Move handling of cs42l43-spk component string into SOF mechanism [1]
which will allow it to be aggregated with other speakers.
Likewise handle the cs35l56-bridge special case which should not be
combined to keep compatibility with UCM.

Link: https://github.com/thesofproject/linux/pull/5445 [1]
Link: https://github.com/alsa-project/alsa-ucm-conf/pull/747
Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
---
 sound/soc/sdw_utils/soc_sdw_bridge_cs35l56.c |  6 ------
 sound/soc/sdw_utils/soc_sdw_cs42l43.c        | 10 ----------
 sound/soc/sdw_utils/soc_sdw_utils.c          | 20 ++++++++++++++++----
 3 files changed, 16 insertions(+), 20 deletions(-)

diff --git a/sound/soc/sdw_utils/soc_sdw_bridge_cs35l56.c b/sound/soc/sdw_utils/soc_sdw_bridge_cs35l56.c
index 2a7109d53cbe3..e0e32a279787c 100644
--- a/sound/soc/sdw_utils/soc_sdw_bridge_cs35l56.c
+++ b/sound/soc/sdw_utils/soc_sdw_bridge_cs35l56.c
@@ -40,12 +40,6 @@ static int asoc_sdw_bridge_cs35l56_asp_init(struct snd_soc_pcm_runtime *rtd)
 	struct snd_soc_dai *codec_dai;
 	struct snd_soc_dai *cpu_dai;
 
-	card->components = devm_kasprintf(card->dev, GFP_KERNEL,
-					  "%s spk:cs35l56-bridge",
-					  card->components);
-	if (!card->components)
-		return -ENOMEM;
-
 	ret = snd_soc_dapm_new_controls(dapm, bridge_widgets,
 					ARRAY_SIZE(bridge_widgets));
 	if (ret) {
diff --git a/sound/soc/sdw_utils/soc_sdw_cs42l43.c b/sound/soc/sdw_utils/soc_sdw_cs42l43.c
index 4a451b9d4f137..66aa9958ad184 100644
--- a/sound/soc/sdw_utils/soc_sdw_cs42l43.c
+++ b/sound/soc/sdw_utils/soc_sdw_cs42l43.c
@@ -110,18 +110,8 @@ int asoc_sdw_cs42l43_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_so
 	struct snd_soc_component *component = snd_soc_rtd_to_codec(rtd, 0)->component;
 	struct snd_soc_card *card = rtd->card;
 	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
-	struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
 	int ret;
 
-	if (!(ctx->mc_quirk & SOC_SDW_SIDECAR_AMPS)) {
-		/* Will be set by the bridge code in this case */
-		card->components = devm_kasprintf(card->dev, GFP_KERNEL,
-						  "%s spk:cs42l43-spk",
-						  card->components);
-		if (!card->components)
-			return -ENOMEM;
-	}
-
 	ret = snd_soc_limit_volume(card, "cs42l43 Speaker Digital Volume",
 				   CS42L43_SPK_VOLUME_0DB);
 	if (ret)
diff --git a/sound/soc/sdw_utils/soc_sdw_utils.c b/sound/soc/sdw_utils/soc_sdw_utils.c
index 2807f536eef0c..1637cc3f3d598 100644
--- a/sound/soc/sdw_utils/soc_sdw_utils.c
+++ b/sound/soc/sdw_utils/soc_sdw_utils.c
@@ -758,6 +758,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 			{
 				.direction = {true, false},
 				.codec_name = "cs42l43-codec",
+				.component_name = "cs42l43-spk",
 				.dai_name = "cs42l43-dp6",
 				.dai_type = SOC_SDW_DAI_TYPE_AMP,
 				.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_UNUSED_DAI_ID},
@@ -1104,6 +1105,7 @@ static int asoc_sdw_find_codec_info_dai_index(const struct asoc_sdw_codec_info *
 int asoc_sdw_rtd_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
+	struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
 	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
 	struct asoc_sdw_codec_info *codec_info;
 	struct snd_soc_dai *dai;
@@ -1179,16 +1181,26 @@ int asoc_sdw_rtd_init(struct snd_soc_pcm_runtime *rtd)
 		/* Generate the spk component string for card->components string */
 		if (codec_info->dais[dai_index].dai_type == SOC_SDW_DAI_TYPE_AMP &&
 		    codec_info->dais[dai_index].component_name) {
+			const char *component;
+
+			/*
+			 * For the special case of cs42l43 with sidecar amps, use only
+			 * "cs35l56-bridge" as the component name in card->components
+			 */
+			if (ctx->mc_quirk & SOC_SDW_SIDECAR_AMPS &&
+			    !strcmp(codec_info->dais[dai_index].component_name, "cs42l43-spk"))
+				component = "cs35l56-bridge";
+			else
+				component = codec_info->dais[dai_index].component_name;
+
 			if (strlen (spk_components) == 0)
 				spk_components =
-					devm_kasprintf(card->dev, GFP_KERNEL, "%s",
-						       codec_info->dais[dai_index].component_name);
+					devm_kasprintf(card->dev, GFP_KERNEL, "%s", component);
 			else
 				/* Append component name to spk_components */
 				spk_components =
 					devm_kasprintf(card->dev, GFP_KERNEL,
-						       "%s+%s", spk_components,
-						       codec_info->dais[dai_index].component_name);
+						       "%s+%s", spk_components, component);
 		}
 
 		codec_info->dais[dai_index].rtd_init_done = true;
-- 
2.47.3

