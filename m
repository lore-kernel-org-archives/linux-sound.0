Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 314323C6A34;
	Fri,  6 Mar 2026 15:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772810958; cv=fail; b=gqF9j/1y4J7hbmT9rAYF9gVVOFVPP0Rsa/5zBm723RCZk+NLAMlekM0nq0pBWp4sj7QAfHIjQs/5lE6Kt0/d7qmLlG1kZmCqmiS5+FvnqQnbOPDn0sXIXXqHOamWYQAfkBbOk7jESv4jRnm31tJYQWX73J4oVKuI2m7EQ4YZMU0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772810958; c=relaxed/simple;
	bh=CP51xHVyVEaFn6XJm83mqqRbsU7Smf97oDm6oQ8nS2k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=TUvfxqJyNHZEfUsO7MG6lP8guVGFy5fzuDte5mdx1YmcNmLXn3z7krJ4NFxcrO/tOEdKzmZga8p8fZBMw0kA9vRUI4LIJmLrR0UrDMik7HTRQHGfTNFnAMZKfWu/BH07gbD7wczuKLcxAqBRo3VxpYNIUwyMkBsg7zDAy7aBCd0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=AL9IwNln; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=uXIJYKXN; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="AL9IwNln";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="uXIJYKXN"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626D5dTZ087281;
	Fri, 6 Mar 2026 09:28:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=4numIxrbfgkKj6kO
	7n2aQd+hEsWGfztlrpr6V5tWJGo=; b=AL9IwNlnCr4K72BVMMD0WI3/7OJAUR9z
	+4C/ysFuwgueNJMpihdMMscvfElXeuMbSn74TUzgZycowJ5ZORHarn1pAOzjbDqa
	3CDMVpHpKt47kpcBQyO5XmMk+0j+UhEp64NJQpCCQY/eyU8VxfWb807X246q33F6
	M6YpgIgy6h0QzLr4I+GmiAN+CjnzNILw6511BGxx9/ZZF7gU85hweWVkhyxPYMZM
	RJr6qI6IiJZ8HZYl17QN7XV8ipktSDxDbhwnS4EFymnfTFRmWR6KBf+Bh+it9AQX
	bcHt+ngqHJKQGAyPkEzMsWfnOBCowHCa6IPiAcow7czivHO5zCes2A==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11021103.outbound.protection.outlook.com [40.107.208.103])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4cqyg886ep-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 06 Mar 2026 09:28:54 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nJuGZg/A4i9LE+IXiN5QuHqoOWnoQ8XN5qFMA4bvrhdlEBii0Hskta6GNs+XfwWQtUBMADGpshv1gG1U1Hv9QLeI+duwThsdY7vXTEEqp1wZkA4qGG0FsVxkqU/IkroBPx/FASZBn5tlFN7kMkpDnrQqoLqz8cGsgE/25p2axFhxLncVtZ7LOETTTy5lj5bApnaA3bPjukpIouqDy3CXb7Zx+QOUs1atCZMlGHvCXHszjhzI8++nbCtOB5C4FHvuTsMqTH8ntk7BEKF5NNCJsig8l+gpiaIVNE9nxMgAnkbeTg8ZKuysR4S685chagtFy1P2n618qm48HEQ9I9GSBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4numIxrbfgkKj6kO7n2aQd+hEsWGfztlrpr6V5tWJGo=;
 b=iFXFsi8DbogpbwR/9ETKly0pM8G/4L4nn79Wu3SAqvc3duIpygUjo8WWPvw6a4iOim++IgJP9bi/y8grVxys/uigKGNQie6eUE0xEmPdHWj4D8srLhtkG5A2nt0hoglACZUcx7UNYEX0PthlVQ38dFjJyfGuUm+4kdDjT+8lBoNjfJSSBJv/svaGpmQfOZQfzshAfKTpyjZush8lb6b/peykl7YV4osPqb1fjOHrxHcERIxcBQ0+LOyJLFKktr9QtApgWK4BHWwKmofkzyEl4kqMFOngrV4CDRufDmnoWCVq8TAejQa7is76m0o6LFpbvlE4VZd5zFmlOJeeEUvmWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4numIxrbfgkKj6kO7n2aQd+hEsWGfztlrpr6V5tWJGo=;
 b=uXIJYKXNoKkYwR0CCUsLVM7T5GsDVedNQTfQ+Bto+ERe505Pdzjjw6Dgx1D5ZqQiBVrUF8zsfqFuCv3ZDR+rkzYspKguvTU44v53exT1OdYqLCkugQyvANG3q9hWVrH/WyvS/KYaul20V9U4rxL+zQnmK+k5ZLnPw3syvYhHxCY=
Received: from CH2PR04CA0016.namprd04.prod.outlook.com (2603:10b6:610:52::26)
 by BY5PR19MB4018.namprd19.prod.outlook.com (2603:10b6:a03:22b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.19; Fri, 6 Mar
 2026 15:28:51 +0000
Received: from DM2PEPF00003FC4.namprd04.prod.outlook.com
 (2603:10b6:610:52:cafe::be) by CH2PR04CA0016.outlook.office365.com
 (2603:10b6:610:52::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.18 via Frontend Transport; Fri,
 6 Mar 2026 15:28:50 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DM2PEPF00003FC4.mail.protection.outlook.com (10.167.23.22) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.18
 via Frontend Transport; Fri, 6 Mar 2026 15:28:50 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 1AA6740654E;
	Fri,  6 Mar 2026 15:28:49 +0000 (UTC)
Received: from ediswws03.ad.cirrus.com (ediswws03.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id E6A4E82024B;
	Fri,  6 Mar 2026 15:28:48 +0000 (UTC)
From: Maciej Strozek <mstrozek@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com, devicetree@vger.kernel.org,
        Maciej Strozek <mstrozek@opensource.cirrus.com>
Subject: [PATCH v5 0/4] Add support for CS42L43B codec to CS42L43 driver
Date: Fri,  6 Mar 2026 15:28:07 +0000
Message-ID: <20260306152829.3130530-1-mstrozek@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: DM2PEPF00003FC4:EE_|BY5PR19MB4018:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 74d9a590-fc02-4031-1428-08de7b951151
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|7416014|36860700016|61400799027|54012099003;
X-Microsoft-Antispam-Message-Info:
	A0YmKPktCKt3g6IzKTURGi2qnPLO1is+r+PI10V46Fl51vW6wygh51HuZDC4rkLZUx5b68jSCh8GiPYVGkZkWpyIWyc339XLt48Ozn/ZFyaQyjVZqXzekfkoDIXCTiY4/bQ1xMvrO9YFLIMkRKU1IrPGudKp1sCmV0JsJZLJNA/bD37Hv//ngo55RE3QSWCsk1X3VqdbbUfERcdUsz6rkESn4/zNQe117r4j+07x/GsZ5wchdz6ZcZvXlsOHrMXIHib7436BOXScq+kF1BLpD4M+V76gXMHjM8gAk5am1Th7tLs/xfOSRLswsisO5itIx5gBj93ZNZI4pb+V0IaczbciBW/s5xeWFKZg+WSE0mfjLTbN8XuUvfo3NUdPM0z4HklM4mY/5Vf77yRGxbR/BQcmdBAftMziQN6mUNKIz6TkgVtPOW+HuECVDaUP4VaNmtS+HvIWd9GCbdXtujwYLm+2GkhXDkfWEjpCL1rRX0HwfBKn5c/pUOBUdvxUiRB2zO9joID0es7YcUhE3TXN0jL0bWYlKpqJ/ggne4J35EK3qqOuSnyIpG6/FFs3qXpKfTtOdEOBstgwFRiquUPVVX0pApqn9rQZmALInVJht1KD3AgevLQhf3VVyVj35eurPvP2mvqx4rv5BR36Zd43b3/Wy4LJT1tIhLxgkYs4qTuC06+l1fheRwdvYgMeCzUraiAaxXlF8TJJsyapAHKobUsblmJPjyD3FU//vqInF7rjapl7wXWhFXuH+Pm9ruSIjLqLJ68yYDqgibz8hb89qg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(36860700016)(61400799027)(54012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	vYHjikgYGHqZVHXJ6o61dj98Z4VIb4crZI8CpPhqsDB6pkl4iLLH++vgj1GyyDmp3CZ3yJSLF5BhSzIjCEPBA7JMPz3Z/MNzHpT0v4hkhK/Wt63yfeFeSYPmGMMlJQPsAoxQHMDJr1tUSG+d5d69sl08kosofCDKgwv0uBqdtnrnSYfQI8AY3wejdWOOR4we7dzovED0nySURI+YHrORKZd43UVK6jHFjHCbKzSZtAwYfVnmt4Zv/7BMCpBLY/VlQX+duI/dmLZRDuzA3si3wCai8beg3q15tAHjOYThptC0q85CmKCtxiHUu6ANuurxhbV6q4yPdyYScUjipNmZHyRCFmGvrnLXtheBYCfhqJmNO6X16MExLu5ldJ63X/1nk3Z6OkL1N7igJ396WCQAyVnLFT07VfzYv7BrwQMmNgH2DY/rWJe5GNR45s+ok1tL
X-Exchange-RoutingPolicyChecked:
	kegX7T7xZgeya0HcCg9xpaduFGV/dd2pY8lAoDQ2ZlW/y52iNpyzjsfd6AJJeQ3PavlqI1CKSVprvc9AVWBvzmdpi91SD59CoAuMur8MDhv1puCCtggfDsJfSqRLuYZEM2yS8nxzZft6jLTjNdGtidkH9GUXdbqYYbJTe+qtBA+vXMhsYqGyB24sGEQ84LIz46hdhMveuNCDBBF6wmRzCwVxk5zBhrKlpQqDOSDUAmj0BYzDPZUs7Bcg8oNis+Dwnx1VrtLgBhsDHbHSGcoBYF5kl/lwYvfvEZ4VPwExET6q8YPJaSe97ELT6DvNLCuIxF4qT/a4XLQ4nJdTQnL/hg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 15:28:50.1452
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74d9a590-fc02-4031-1428-08de7b951151
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DM2PEPF00003FC4.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR19MB4018
X-Proofpoint-GUID: 0mw0S-VRqlMUbNUVOQkYEpE4W5XtT9s4
X-Proofpoint-ORIG-GUID: 0mw0S-VRqlMUbNUVOQkYEpE4W5XtT9s4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE0NyBTYWx0ZWRfX3OqUO/gHKpiL
 7h6SsjzSQ2J7iec3atzjSsyu0rZdOhpDpaI2p/C8gddNYZEywGDy5fxmpH+WaAMkUAgN3Y+QSVf
 z4nk+yshCaFHbRolQDr+s2X9YOE/dDZVzppGbD+Fo3KUkuQeGonazjiv7ODQkV2dZ7oRHzHREbb
 58ZY99n3DrybhM2hUmiWh2mYfxbeUNWaRTYAAFT24nLxhSyma6czW2KHdJ6IPlfa6qN1YwxRDt/
 TYtHP4bqfAJxkb+DupmnFiYqORVboaSKpg6wShmkEDEhta+3gaTDJqO23cz9xQRP8jEc3mCBnIO
 1RiBaZ4GlTzXw3yrPlg4vwb9bkKXF1mjHN1TmQdMk72i+TWDE7CTHSapgQafJuN1f9gEB8hHLeJ
 pGZhUkYdb83C18teOfL1B4ipZA/RJxd6gNNNiFo4OAw3e7wVzT9HTzjCF9LBwyANmB7uLbKdQIk
 BlLdPFbV75FHinril1g==
X-Authority-Analysis: v=2.4 cv=IIwPywvG c=1 sm=1 tr=0 ts=69aaf2b6 cx=c_pps
 a=oz2EmwyjMC44gvVfu4wkxw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=Yq5XynenixoA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=3fcK6sipGkM-lnU_H0wA:9
X-Proofpoint-Spam-Reason: safe

Hello,

Introducing CS42L43B, a variant of the CS42L43 codec with changes to
PDM (DMIC) inputs, RAM/ROM memory and extra channels to two SoundWire
ports and ISRCs, and can be supported by the existing CS42L43 driver
with some modifications.
Support is split into four commits:
 1. Add CS42L43B codec info to SoundWire utils
 2. Add dt binding for the new variant
 3. MFD driver part 1/2
 4. ASoC codec driver part 2/2

Regards,
Maciej

---
Changes in v5:
 - use snd_soc_component_to_dapm instead of snd_soc_component_get_dapm in cs42l43_component_probe
Changes in v4:
 - change variant_id to long int
Changes in v3:
 - fix incorrect type cast in mfd patch
Changes in v2:
 - Rework the mechanism to identify the new variant along with some
   error handling improvements.
 - Added some comments in cs42l43_readable_register() for clarity.
 - Add handling of the I2C path for the B variant
 - Add a dt binding for the new variant
 ---

Maciej Strozek (4):
  ASoC: sdw_utils: Add CS42L43B codec info
  ASoC: dt-bindings: cirrus,cs42l43: Add CS42L43B variant
  mfd: cs42l43: Add support for the B variant
  ASoC: cs42l43: Add support for the B variant

 .../bindings/sound/cirrus,cs42l43.yaml        |   3 +
 drivers/mfd/cs42l43-i2c.c                     |   7 +-
 drivers/mfd/cs42l43-sdw.c                     |   4 +-
 drivers/mfd/cs42l43.c                         |  93 ++-
 drivers/mfd/cs42l43.h                         |   2 +-
 include/linux/mfd/cs42l43-regs.h              |  76 ++
 include/linux/mfd/cs42l43.h                   |   1 +
 sound/soc/codecs/cs42l43.c                    | 756 +++++++++++++++---
 sound/soc/codecs/cs42l43.h                    |   4 +-
 sound/soc/sdw_utils/soc_sdw_utils.c           |  54 ++
 10 files changed, 848 insertions(+), 152 deletions(-)

--
2.47.3

