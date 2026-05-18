Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00DE333FE2F;
	Mon, 18 May 2026 13:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779109806; cv=fail; b=rpl7bkzc+4jEcvcp++lxdiveipBh08/NRcKmMCuP6uzDb0joPXlNPtjWg3OBCmHEZ6rRHxdlEtGtEBYbe2KKJPbr5OF/42DemZh0GEuIZYQaYESev7tSgsXhBWyIU3HR/SpRWvy6ObOk6YSKeoRJTWWzpgjryM3i09DPoKLZ2TA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779109806; c=relaxed/simple;
	bh=ABlBR0pZMnByysa8BQYcskASE/UQVEI1d7GeJ9lw4QA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=bB8O1BhPIZ9NzfrLCsoMb9+nScQCUfVo5Wo0IjepFW+f8+BPxVMbgrG/2IHoGYsQfARziGIxgEIyxriTbIdicPkYbxRZzOIvu/5TBcNoLHqpoLkA6Rji8cWLNPsg7SBsL5Cg8a+P81iyScjP2mkDYIGdcTBvYl+WT2LPk9ErYr8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=CzGQ3jX4; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=jWnCDiLQ; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="CzGQ3jX4";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="jWnCDiLQ"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I5sXsB3148790;
	Mon, 18 May 2026 08:09:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=b7J9bv06BNH/QmmO
	QoUEEquODrkhYkNCoC7OlDy1pVA=; b=CzGQ3jX4xXkfpHi3c/EcjNumqad1zwM6
	BPJoeiQ3uIiSnsP8iWjIQzysz8lIYbe3FGytRBWr5wqwyfFEgrjU2TycCmU985Xj
	E0kWOWvxiOtzCfdXesSQp4n2xlUeftP5Mc4X1XmUnRk/z32OSqOI6kxeSywS7d1q
	oyDtLWSlVktPVQLBHlebX0GdsqnVkqbHBYs8u/MvsWLTTprF22syhE22eOyNwzK5
	Yef46jCKH3zyYukQM7SNQ0cKCgPnIOZKgDT1gMaVj2kvprO170ewXIEDDO6gRkiB
	dcvAFL69urJgZwwyAu6dEbpzLdPzWDZJ866bKpAFZl1NXxWkmtC+mQ==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11021115.outbound.protection.outlook.com [52.101.57.115])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4e6n0ha054-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 18 May 2026 08:09:50 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o6+pOuKx2ZCbVxhFv0jQ9RvPEOK9sagNLq6OnbbeRgPJ3snL2jWH+ugbIGF5bWMH1wliks9TnalMML9cuDHAVty5mxyrArUXdECpAaMNFTzYYGJA2ybgm+GJeCOQI9lNPmcyKyiZK0p0ULSuqT8rw/6s3y86sDj3O5fxGW2KX1ksviBNCI7Pf9WOkNKyjM/9FoZ30HwNS10yvGwckXGakAM49qxeQBmdvUglQBgwLgliNKG4tJJcIJEzhPHAlPYqXq+YYoJe3W2pjc0BuOXnavFsS81FqRRO4vQDKOdCk7WVEU9sIQ3iUqnzBg4sHAw7uesVFr+lRhD3pv8YYNdffg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b7J9bv06BNH/QmmOQoUEEquODrkhYkNCoC7OlDy1pVA=;
 b=jmUJxAWhOlWRUsRp63dS543rF+EsOxa1Ib1KLCUZ/uxqAQDmAlZEPB1Fl4g9qAoobKrWmjU2J7yvilZ1KsQzx944ANgerVpO8iofR7iNiTzJyApKn+gyWeDOVbpxvSz51JFei0KWWxDPU3pjYgW1geGq6UrW2HNBcrWXJCKaI2YFXBEJN30xxLYtwMwAOZbEfE76/aJtqYr4On6NEjNlegD9gxbDGAUH2vXr/IFzGPV81KHCbKlJd1/FavcI8sDsFnEGj4oaM/ZdA3uRWt/rKDLBTMh89AvxB4ATAf97+y+P8SLp2sPQ1ORvbANTuKthEoSp92I76gXBjKL42TObgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b7J9bv06BNH/QmmOQoUEEquODrkhYkNCoC7OlDy1pVA=;
 b=jWnCDiLQVyooKD/1hRXevBZT2BUxK3AHFyw6vLey+kDpEsxMnko2C8lw3dMR45XzoVd0japkMIno1Tpq5xZUOS2iaWBM+gmmHMlgdG3hoh4taZtCtACPys3gfBaE2k14kviHYFAq0PVIUKzLpBERLAUFla0iS15CIn/QlGYsBXI=
Received: from BN9PR03CA0698.namprd03.prod.outlook.com (2603:10b6:408:ef::13)
 by PH8PR19MB6883.namprd19.prod.outlook.com (2603:10b6:510:1bf::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Mon, 18 May
 2026 13:09:46 +0000
Received: from BN1PEPF00004687.namprd05.prod.outlook.com
 (2603:10b6:408:ef:cafe::2b) by BN9PR03CA0698.outlook.office365.com
 (2603:10b6:408:ef::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.24 via Frontend Transport; Mon, 18
 May 2026 13:09:45 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN1PEPF00004687.mail.protection.outlook.com (10.167.243.132) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.11
 via Frontend Transport; Mon, 18 May 2026 13:09:45 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 01907406540;
	Mon, 18 May 2026 13:09:44 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.13])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id EFFA3820244;
	Mon, 18 May 2026 13:09:43 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 0/2] ASoC: cs35l56: Replace open-coded SoundWire regmap with generic regmap-sdw
Date: Mon, 18 May 2026 14:09:41 +0100
Message-ID: <20260518130943.82485-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00004687:EE_|PH8PR19MB6883:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 9d686d24-e6cb-44e1-0506-08deb4debb96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|36860700016|376014|18002099003|56012099003|16102099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	hPmaA1Ot2pm+Qs7NggMXrZuDlaxF3EH1jz8voS3FZivHsdkx4aMwvndh+YOWH55l2ljQavUfgchgISlEP4SaAJcl2kUntYN57whXmRZ/REbxXDbjn3B3dx80f+H1pvPbXLNC6IkIdzB2azsq3A2yRnQ66B8fk7tvF6OdC8Cg0LQCSqhoZjI69FyVyjrUIQdIWxCshvxMW0kqY3dALM6k0JjloK4MzkDBZag4h/Pp/PtxJvMhH+pYgKUdTIJKOpg8I70aY4AGpLZ6jsSNHXPl/ltze6yV3nhqfyvcxOyHWEOqskdrw0vfayEdsL86B4f03nonvtKb6QQpmmK5ZY7d1oKXF1NAiqRG5q93wm/9hsFlHNlgyVHmoY1ABlE44QR3lrScQ5HcpglB7/kxTT2Y7sQFCfe8e+p42FK279dhycOGsKG9wvgWe5yBb6C1p7riu8BntoLjYT1SIvdNPvuzQL8ZO9TlcF2vCWZKkGwKLwK0qm/bBMuthpeTnJA/OJ7/zMjWmKq/dywSDOrdGCncOFUktznUtiVpwpZQzzc6KFH8vdzzmsyKdI6ylF8X2tDsI6G7DXN5MQhNgOBxKvtS+YzBkq07i3T2j6aq4k+hpa8O2F3tlksZFT2B5lm7qX2BCWT5PIO2oOiO1WirdskcltY4ooryS08/bSCKmeJv62yHXXwjVR7IrbKN06pQaJ9ki53tc1oVAlNG4IsSrykKJRZE7oC90aEZXAv+B46XCw0=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(36860700016)(376014)(18002099003)(56012099003)(16102099003)(11063799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	5ekMRnuW9C/qNI6SFKKoEb7vaBtWxy50FYxSx/krTGaJX8Nk9KUQqlnr1ePhRa0A0HMeWECI6zM0QZMMLgAsD7opuLQogblU8ghArrvGIgxK2nHmDA8XwjwAIWbAyOQEHcoyOG0EOk/p8jyq5zDasjOBgfF5MeCk4OMGv6uProFoHM160GWmnexqt9zeBLMYIKfgSOvMwpCH262ubDDB8BDdcbzBH95PItZS2IgbY5VamNp3vaTqleE8ayGXxbDI8eWYiwhK3IyWAIuwnIjf1Skuim2RfkYYWyux3I/ts0d6k67HEszcLwSQG626yUrxnqeSQsdD/n0vPE2IcmxwW0deGmJWU9pACxe2nLN9xG6vIkb7ZYaKZD9a0LVwhEpM+QMQEPFLsf4G9Z3TvQ75nuDnVgMOQUol23FsOQoTO1imAh+g7bVhR/ds33bK3lQR
X-Exchange-RoutingPolicyChecked:
	ojnIMHEHZ52awFs4bwvXwe12VbFeLqyDH2oy5LFwXc4M5TRgoHsRxEMYcCHmQ7kCk7kYna8KypP7vAbM6vRAtl7zRoX7Qq15Rpji2+UmUkDb/s0k3cA9gLlD2VvfgT2GH4vw8B5fj3Dk3qxcPN8pTgGkYVucZvWFr0XpoYmlt2PdNzf6eFGAXjtn9wh66ExI8P25O03CB8I1XlnSzn4RNQvLGicnibIQ/2sRUJQ2MvhdKXBO+mjy403mYLc/Fm2b80IgCU9X/VeZ8Hw94eDUeDxxPaJFNMqI62DWXNc9MR4BMhhiw5TLGFdwmHTQGJLVrphGqGeWv3ZPwee+sWhX3A==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 13:09:45.3983
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d686d24-e6cb-44e1-0506-08deb4debb96
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN1PEPF00004687.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR19MB6883
X-Proofpoint-ORIG-GUID: nqh5u33QzE2DEINORxjjQF4981r_TnX9
X-Authority-Analysis: v=2.4 cv=Cag4Irrl c=1 sm=1 tr=0 ts=6a0b0f9e cx=c_pps
 a=jYOLmuRG9FCngycrw98U6Q==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=aXIz5WGUO8OSZWwI1R4A:9 a=zZCYzV9kfG8A:10
X-Proofpoint-GUID: nqh5u33QzE2DEINORxjjQF4981r_TnX9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDEyOCBTYWx0ZWRfX5uFLnttAcQV4
 HnzbdT+cYWNOOR5rcAYoNKO9U8jlTLuZoPtTeQo0SfH5ixWUHN+q8H48wF1kuOd07aoCg3OkJWN
 eNADMmb5KMMOw0hjCwsly7/ILdcSxEbgXXaPXYP/AE9J0JdaOFl54XTmttlFZuM8IhM33Io5ljo
 Yj7/HaEstlxEG4MMilHQquthG+770rL+QYEF9ig90UcMLqQu/yW5y21YjtTMTWjmIRgorpyS0k3
 tHcbi+bpy+S5N/36Pr18ahJtvUhXm7xtla3hdgfhCowvu0I6Yx4BbTRF8gllgwH+ZCB8+PG5ViD
 Qf2BcV/fDawGNXIi0H5MNqnmDvV2+nbLjwqGPw0gWyDcJAdMAePUYQefPoyQz3JPLG0WjkVWfMC
 tEmKSvfJLkytVH7nPrY2cLHPREo2zYcsFttWDTFKJIjktg2puNDFt+sb3SWbOy+2za2rMGyv69+
 D9fShn9fovvDiCokvzQ==
X-Proofpoint-Spam-Reason: safe

This series replaces the entirely custom SoundWire regmap with the generic
regmap-sdw. The reasons for doing this are:

- Avoid code duplication
- Avoid effort of keeping custom implementation up-to-date
- Prepare for supporting BRA

Richard Fitzgerald (2):
  ASoC: cs35l56: Use reg_base to offset addresses on SoundWire
  ASoC: cs35l56: Use standard SoundWire regmap implementation

 sound/soc/codecs/cs35l56-sdw.c    | 137 +++++++++++-------------------
 sound/soc/codecs/cs35l56-shared.c |   2 +
 sound/soc/codecs/cs35l56.h        |   1 +
 3 files changed, 52 insertions(+), 88 deletions(-)

-- 
2.47.3

