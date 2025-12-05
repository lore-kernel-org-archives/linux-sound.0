Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023132.outbound.protection.outlook.com [40.107.44.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E01BC31282B;
	Fri,  5 Dec 2025 15:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.132
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764949602; cv=fail; b=umvZsT5DYhSJnAxPUweU9t1El3qNdrMWudblDHFS7BVx9Rrwb2IWdL8kFw+mh+6XD5tY5D78DVCB9C0nDuzNOLfY1FY+V1IPEmT+G5Kc/+CimZxJgcMLy6k3XAJpYHNOkzeHQkxrgtEoNykmjhAd9R0SswzSnGRhB+nAfawAs8k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764949602; c=relaxed/simple;
	bh=flHN0V8py96ipeYeAvG5+LOwPTp4wexNmiE8wBTHo2Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=r6R9bEZLREZ1SqLpLiUlaW6HWzruXWtXnYQVH5Ui3Ews7hmYRqik5CifvaIHov7eXv/dfkMhMxDGMuAL1TZiiQ7FFeQ84O6Wf+bGrDdk8yj6kAZK7rXP/dHW+PRTF/hcT6iWDv8XCP6ALRwsFgZJIuKKBLex4iJaXzDsVn9sSTI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.44.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TJkOfWVniIF7EcPHvOEPgWMgj228YX5yIOSFrByy/mczK7jTSmSKRNhl0+Qi8zNJEmkQOnSB5zwm3ywE3Tg9h7rmCXHsGEwSPSF9uFHmASuv5Q9tWrALVS71gIyGGziNPZvZvCCVk+trtog+d+fX6HstW3NIPIAlWYsjRt46oEeg9k0pFW4ozsXpt9nfQAxxFrGpIrfr9zzgdgAMQmnSCBcSd31ToyqPJ9b1vWYmvpdHeR1Vq8J+6JeNQYlzdG56LS3mUKM1ItZclsgksIBFD2q/HCTe693UsaGbAYtH/lmMZWVU5laBHQwXGKS0cyD3JocUsi69jhEcboEdXTgf+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l2yE/o1I3WbNetXKg6N7fKWvz/q5b8aSnFOP0c+pfHM=;
 b=xPnI7OXIpqX+v6a+wbS93OkG0C+ijWoy6l7R1igEEjLhY42AcNtHafLtIo14TWztX+sbOFnZhKx8a3vo65g2G7erd0oNnZ2QRxozzeUQb3EQ6FokeN7YD4s61qlF4ywetXQACPUYtOjbwe4iuc52z724O6gi8/XKlnT3gSIxVm0nGikGJXuItsRRTBAvSYn376wxA/g3wDbx2Z+d5OooEl7i8S5tNJ4vmcCD7V0PI0pcXd8MIzM2AhnUabf3cmKE9TdCqGu5roSACqSWAw2k98zqKeawloCBbGNENIIAcUbnbFoB8yPrXB9YjKDkJPTpXORkEy2ybWpgsRAH8NwIag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from PUZP153CA0003.APCP153.PROD.OUTLOOK.COM (2603:1096:301:c2::9) by
 TY0PR06MB6802.apcprd06.prod.outlook.com (2603:1096:405:11::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.11; Fri, 5 Dec 2025 15:46:26 +0000
Received: from OSA0EPF000000C8.apcprd02.prod.outlook.com
 (2603:1096:301:c2:cafe::86) by PUZP153CA0003.outlook.office365.com
 (2603:1096:301:c2::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.3 via Frontend Transport; Fri, 5
 Dec 2025 15:46:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000C8.mail.protection.outlook.com (10.167.240.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Fri, 5 Dec 2025 15:46:25 +0000
Received: from localhost.localdomain (unknown [172.18.64.15])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 3F41C41604E0;
	Fri,  5 Dec 2025 23:46:24 +0800 (CST)
From: joakim.zhang@cixtech.com
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: cix-kernel-upstream@cixtech.com,
	Joakim Zhang <joakim.zhang@cixtech.com>
Subject: [PATCH v6 0/3] ALSA: hda: add CIX IPBLOQ HDA controller support
Date: Fri,  5 Dec 2025 23:46:18 +0800
Message-ID: <20251205154621.3019640-1-joakim.zhang@cixtech.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000C8:EE_|TY0PR06MB6802:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: e62a6f4b-08bb-4be2-2411-08de341572b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+qoE0yuySbnveEpCAA9HZMUDKrQtcIhiYzL6synKroMqWIpM30E1hNOtmA3Y?=
 =?us-ascii?Q?VzJoCBBdeB1Ctcxerr3CzlB4rQPOR+3u4ve7xAz01DhX27d51SkmF8suPMti?=
 =?us-ascii?Q?o5+oog2XYOl9IixFUa4r8PcAKRhm+Chk1a7tCU5qT6IKnTxqvL38eqpnNiy1?=
 =?us-ascii?Q?A76+yb9MwQKkquDLmhLyKnVzBBzFxtCeBLuXWwPB2Y8Qq3l6hYcLdnsuF7HK?=
 =?us-ascii?Q?7Sxq2wSFTcuoG0vqpB0sYw34W9n4bDb82cZOq26VeM7FrDIrtxarEd/7Hp4H?=
 =?us-ascii?Q?vbcHjsfCMhTecV5pPsVGr3JvI7Hcaj8lE9NuljKzLUd3D4owm45awI3gRnSh?=
 =?us-ascii?Q?Q2P844L6ZgpRBHuvj6q3mFWFpt4fZHWCAjgc0NSaV+7fvgzcFIfjN007n6hq?=
 =?us-ascii?Q?YGdsLoLKr7vgW1LyDfWzXR1eNx0S1iaHrIJtqVNHTfAZUeGmoQDTjvBYQi9j?=
 =?us-ascii?Q?Ht9Aw4c4hZkgQtvnjPd78rjaGgymOj9NwGJ9gVBlEGFvgJ2I4KzFaITeSXkg?=
 =?us-ascii?Q?9lvMmQgQMY3olWO0BpNo0i+8Rubl5mQSuORLLWc8SDpt3GjRBfXblAssdbLB?=
 =?us-ascii?Q?LkUJNbHXmCeb3PgcTaA5jHsksZagbmfjwatnNhJIjYDfQKqaOORa8RTQWNTi?=
 =?us-ascii?Q?veSIzIQS7oyNqMBChuu8Ullj0Mo+vgF/bcRATEonG6HipJeAzz0zfMz2qRvl?=
 =?us-ascii?Q?9i0TwTe/ABnfrciEzRP3Lb2H3KD6Hb/O8nBGLQ8jZ0AuzMFatwAKK7zMGYjQ?=
 =?us-ascii?Q?av483U66RdA2+P7fMqthY1816szQhu8qbyrBYsjuYxWghgMMl3lAj9MKSVtR?=
 =?us-ascii?Q?zSGdOt+LcRw5hW1LNE2DnJUqWiCE1BlWPm+ODfsH6BwOb8RygdByUlO2Xz2m?=
 =?us-ascii?Q?8KMuR0I1h+GslYKIIFTzgKoGin1qJcKmcKpNVqsu0GGkK4/iGFBnuR4HM5pU?=
 =?us-ascii?Q?WDGQFvRQlsHN+PiptZKtlSINGqP1jre/rw8PLwyWmSIbX1oCaL0VzNqJPdek?=
 =?us-ascii?Q?emf6+O8wlTVcAU9zgLeWLhU8pW0LaYOdxF8edpOhJrexVNPvohNvocUgGgTM?=
 =?us-ascii?Q?rKLxMjV4YP7aBCVgZnuerEPTg/4tWI80Z9VwbOjxGAIEeuvUE7I70ixopJus?=
 =?us-ascii?Q?4S3VDTOVPMVd5sLUyAU+htTCXmu6fgpQny3RvFshIm7cMITOiaePwrmyvQYo?=
 =?us-ascii?Q?w+AAyQBFhwsE0reYcoSmAHiphJU73oA9tAHrl6j9Fkv0d9UoUsvNWD8oLIZr?=
 =?us-ascii?Q?6BD5oZrYRKUR9+HwcWpsRk06kHHvIaz7fstZzPEEYVhDFcqBR/pvlAUusBUl?=
 =?us-ascii?Q?E/ut7LD+8APeROSwONcJh+tmVCKac+5ZTQ+wgfD7TTRimuBn2rQcE5Athtix?=
 =?us-ascii?Q?Re/XzJFaENJXtfGdhCpVync4Vz2G6hqzyBGGLH9vXalHPttUWFhCbsPtWsGa?=
 =?us-ascii?Q?bVmsP1ROK8HsW/450lOJlJp7MF+3VLhFwP+oreoRl48SKt6GnQIQly0yjeYk?=
 =?us-ascii?Q?WXdy0xAuaq/p17LxHzwBGoqO+kinZF6IlesW/l2TVpplpgnZFQfGkxD+i2YU?=
 =?us-ascii?Q?Kg8HVHkPw4kjEETX4t8=3D?=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 15:46:25.1431
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e62a6f4b-08bb-4be2-2411-08de341572b6
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	OSA0EPF000000C8.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB6802

From: Joakim Zhang <joakim.zhang@cixtech.com>

Add CIX IPBLOQ HDA controller support.

Joakim Zhang (3):
  ALSA: hda: dt-bindings: add CIX IPBLOQ HDA controller support
  ALSA: hda/core: add addr_offset field for bus address translation
  ALSA: hda: add CIX IPBLOQ HDA controller support

---
ChangeLogs:
v1->v2:
  - fix dt-binding issues
  - remove delayed work for probing
  - refine dma address traslation
v2->v3:
  - update dt-binding commit title and message
    - ASoC: dt-bindings: -> ALSA: hda: dt-bindings
    - use full sentences for commit message
  - rename cix,ipbloq-hda.yaml to cix,sky1-ipbloq-hda.yaml
  - update compatible cix,ipbloq-hda to cix,sky1-ipbloq-hda
  - "cix,model" to generic "model"
  - change the addr_host_to_hdac bus callback to addr_offset field
v3->v4:
  - describe more for both dt-binding and driver commit message
  - remove __maybe_unused for pm ops
  - fix robot compile warning for 32bit system
    - Forced type conversion for CIX_IPBLOQ_SKY1_ADDR_HOST_TO_HDAC_OFFSET
v4->v5:
  - rename "clock-names", "sysclk" "clk48m" -> "ipg" "per"
  - remove "reset-names" property
  - remove "model" property
  - additionalProperties: false -> unevaluatedProperties: false
  - update the dirver since "reset-names" removed
    - mostly is devm_reset_control_bulk_get_exclusive to devm_reset_control_get
v5->v6:
  - add Reviewed-by tag for dt-binding
  - add return when reset get failed

 .../bindings/sound/cix,sky1-ipbloq-hda.yaml   |  62 +++
 include/sound/hdaudio.h                       |   3 +
 sound/hda/controllers/Kconfig                 |  14 +
 sound/hda/controllers/Makefile                |   2 +
 sound/hda/controllers/cix-ipbloq.c            | 436 ++++++++++++++++++
 sound/hda/core/bus.c                          |   1 +
 sound/hda/core/controller.c                   |  12 +-
 sound/hda/core/stream.c                       |  10 +-
 8 files changed, 529 insertions(+), 11 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/cix,sky1-ipbloq-hda.yaml
 create mode 100644 sound/hda/controllers/cix-ipbloq.c

-- 
2.49.0

