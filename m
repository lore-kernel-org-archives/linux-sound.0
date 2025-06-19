Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022108.outbound.protection.outlook.com [52.101.126.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D099A18E02A
	for <linux-sound@vger.kernel.org>; Thu, 19 Jun 2025 02:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.108
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750298964; cv=fail; b=lteJ6nPJe9HIIfBVavprYzDXDCY9b9tpMCk8qx+bF1Ql1hJd+mIQl7b1y7PUoHiB/jIegOYOl+fO6Pjy0gQgNFCvOOX0CNxIYeCEhvynwW4otVKUBfIqYxd4tkiguJpsQVKPSeax+i3coVG6FqnBDEAsQ1cN66RMUzsupwkdshM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750298964; c=relaxed/simple;
	bh=s5YHBb45DmfRof878putuh1oRRxNWs4AnDG4cJcpkuA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CiltKofyYpZXAquk1g3QudwAsxtakTpS5hSwu06AF/Kh29b7gINouYm3yt4IoBlAqmEIOCMwfJFH1eGNEdq86pWswSwfa/ijnqsvtZM1RPrP9el6KsXWHx/peYr2MXD0KSRs7nUkvg7eb3TIrXes/9XsCHTLPL9vZbaLL0mUP5o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.126.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qCXZ5aJznaLTj7IaZ2NweARnw5mwFzoIgLB2YLWZz7LWwwi15hqGBr2PxpR0KdWAvxl6jYTM2ue6Rju3JNC38xM+HnIeDC+WBC5UfW65K1aaA7w02ifzMJDlyA8LhVc19dpjOT3Id+qesLwtxuOWK8Q3TRo0CZQv4iEylCc/MI5OIh/Fu7yZT4v+SlSsFe1xl26xh64fmZ4XFDbU8B91Usr5E+KwJ5a32FiUyd9dHC1kNJRq4BlgmteOmOo741aSSoFJIjlTsmcQMK9D/Lt4MGlXVCwydGBx9JQBFd8WJwmuMrhE9VuaD08mwWGEmF44pqgPONN6dzVJoliQJgtGaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=89kY6Q4rfiWVyxABzgSti6V4pmmWCeOucSJ8Q9H77Ro=;
 b=VVLUknWZuxabsg4rZwsB4XudEHQ7sjvbpWHSak8aeNMo1bXaL6OHfR1/SY8EJNAk054RbnMjPE35MCzYVzTdiwE1DZNR0jGvJEq1Y9l31xQ4je5mOD07nhSzTl0tarGYiVGBsOMxgDjF0cJsJR5+25VxtVtjPH9/Edq5VxKHIw+iq2plERE5CO6QFRfrv+Ka77mCC8OwOTqfgO24/hcogWaHdwv66kuRmWI1XAeUNwpl3Ude3lyra39NvIGNWggFQXY0+RvFOdFnkeCis5xL9zxwdyRgo1K9ZRPJd3xuMTDWuu9cXon3D16vykHLgxdSB8qrScevGFUHptG5WQLcGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=canonical.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from TYAPR01CA0174.jpnprd01.prod.outlook.com (2603:1096:404:ba::18)
 by KL1PR06MB6592.apcprd06.prod.outlook.com (2603:1096:820:f1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Thu, 19 Jun
 2025 02:09:18 +0000
Received: from OSA0EPF000000CC.apcprd02.prod.outlook.com
 (2603:1096:404:ba:cafe::2b) by TYAPR01CA0174.outlook.office365.com
 (2603:1096:404:ba::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.33 via Frontend Transport; Thu,
 19 Jun 2025 02:09:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000CC.mail.protection.outlook.com (10.167.240.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8857.21 via Frontend Transport; Thu, 19 Jun 2025 02:09:17 +0000
Received: from localhost.localdomain (unknown [172.18.64.15])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id D738640A5A03;
	Thu, 19 Jun 2025 10:09:12 +0800 (CST)
From: joakim.zhang@cixtech.com
To: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org
Cc: chris.chiu@canonical.com,
	kailang@realtek.com,
	geans_chen@realsil.com.cn,
	cix-kernel-upstream@cixtech.com,
	Joakim Zhang <joakim.zhang@cixtech.com>
Subject: [PATCH V1 1/4] ALSA: hda: fix controller cannot suspend when codec using jackpoll
Date: Thu, 19 Jun 2025 10:08:41 +0800
Message-ID: <20250619020844.2974160-2-joakim.zhang@cixtech.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250619020844.2974160-1-joakim.zhang@cixtech.com>
References: <20250619020844.2974160-1-joakim.zhang@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000CC:EE_|KL1PR06MB6592:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: dfc0be1c-2efb-4a4a-5f24-08ddaed64bc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uHHz7xCm1OxGBXcBWJFJ5fRsgtHYqAsrScVFe2gv52mPC41RxR8xHpy5B1ND?=
 =?us-ascii?Q?R+J4a5fOPgqqh5gbOdn13xf1jJF+GB4Ej9dgCV8JUu03QU9XDJQ38eHUePTY?=
 =?us-ascii?Q?j+g+hqVVIF/Z+wEW2ZENJxIX9ttk8+di0Lr4o0Y/f+TSmUJLS55YqxvtJtWN?=
 =?us-ascii?Q?hSA9cULryqlnOe4v/EQ/6kXeMHuQvIkXDTopp9WoO+po9yGGjHAm14zIlx9Z?=
 =?us-ascii?Q?lzQg2kptx+FEVaURTb+5ZJR/u7deawUMBpvH+L7+s1H1xO4DiBt1nxka6lTZ?=
 =?us-ascii?Q?PduApLfeiajNA3ZYdN8Ixj+k6ps296GBDjsahY6Y/ODOmPGm7TQ2egv3usOb?=
 =?us-ascii?Q?TkDNiuZAv/Pf84K2XrD3mWGPG0bHBFWFBfHTOCSstw/O1J33Wv1nDQtzpQZX?=
 =?us-ascii?Q?uQHJ2Ai1foB5qkD+HRad7S1iqmnK2mxi3WizC6fw1zJnnPr8ihiA9VZ8pHvQ?=
 =?us-ascii?Q?RvMB2fGrlrDkwt/CMAihI2x0y/13K2zby48lqmZ/AEhcq2GtXS1Tne1lvaDv?=
 =?us-ascii?Q?rR+RaCcOusGK3gD93U++Uudgo/ICnyoT7Umy35Q84zwZsHuJ4dB2KqgNE8Jm?=
 =?us-ascii?Q?Z5O5enAFNF20BiuXG1/fwluIz9QLed18LifUvfQ3+eeTOXKylU0YENhL3QHS?=
 =?us-ascii?Q?YKV87rORW9lE7uKoCqe1RX/ywGVeqooISWHQW0se95M4tTscDDHCxf1hq/7P?=
 =?us-ascii?Q?ucrzFb2z5GxLOPIrYV9sd7HztKMTCd9CRrr1MGKxfgMS3HiSJJIDveMNiLrM?=
 =?us-ascii?Q?aFUaWO4WMpkyb1kHA5z5nzZDMQraQ6gGYuUws1rQXETz7Smw48JLjmoOFkQe?=
 =?us-ascii?Q?VOFF3jUelSUyi5ds5AKXTUozjIH8aGOpOqRZW1RfZeVdZ3mAviErsfkBjjVV?=
 =?us-ascii?Q?iU7xau4uDIAZSGkKfOnLrXbsMddtILOJkspZUkTP12I4T78+tUoGvVxe9Vhd?=
 =?us-ascii?Q?FLOr5Pdx2CeVQFp2TzjJwuDXLofyb2LaTf5X/cx1azYY20mYzcO7OwvfAR+F?=
 =?us-ascii?Q?lftg42bga1jNMtyYdO/xyj01O6SHKGxsTPFGoKAnY2NnczG9czatWBhmyRJD?=
 =?us-ascii?Q?byEoI9o/jJ5xNjx7Z1Bbyr7MCxjT9zS0PemVNWpbgQDFIIfsuKe7kQrrdTMD?=
 =?us-ascii?Q?or6Cq3bzuect24IFd9ImzMavKHuM+v8anYZrw3fxe0DSGBE7cLrNyn1hzd6V?=
 =?us-ascii?Q?WlJKH6nQbg3OqNFgCXMaItVR4VHNUJZjoHiktJM+O50FrpZh//OPCmtgJZKi?=
 =?us-ascii?Q?TleplARLOzE+Vxr8sa0eDKpbepJFxhV8e65f2t0uEV4UvGWlaP1F0OFFE9WD?=
 =?us-ascii?Q?EfeEAJCgRDqmhM+DuGAnNjMORCQ1WhJhwkQX1HHhRhghE5AqNDsb23lUZY0h?=
 =?us-ascii?Q?wJfgZD670r4CAXAcFpB72SuPog5Xn+J3eop0m58OeVDCRS9Zr3D8Wa0OpDLj?=
 =?us-ascii?Q?oHdJwbBB1fsyQbnaaVoJA/oCdCcf4gsZEk5Y27pfrdQ3Fs32OQNKmUAdthdP?=
 =?us-ascii?Q?ZyYvsAMO51v6H978T+aT0p4SuAygUVcSlpjv?=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 02:09:17.1967
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dfc0be1c-2efb-4a4a-5f24-08ddaed64bc6
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	OSA0EPF000000CC.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6592

From: Joakim Zhang <joakim.zhang@cixtech.com>

For current design, sync cancel jackpoll delayed work in
hda_codec_runtime_suspend(), sync means it will cancel pending
works, so jackpoll work would be called.
  hda_jackpoll_work()-->
      snd_hda_power_up_pm()-->
          if (!atomic_inc_not_zero(&codec->in_pm))
		return snd_hdac_power_up(codec);-->
		    pm_runtime_get_sync()

The point where cancel_delayed_work_sync() called not in_pm,
though it actually is. It will runtime resume codec device again,
the power usage_count increase 1, but it should be 0 when codec
is suspending, finally codec is in resume state, not suspended.

HDA controller as the parent of codec device, also cannot enter
suspend, this patch change to sync cancel jackpoll delayed work when
codec in_pm is set, so it will not resume codec again.

Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
---
 sound/pci/hda/hda_codec.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/pci/hda/hda_codec.c b/sound/pci/hda/hda_codec.c
index c018beeecd3d..12caa5b2e678 100644
--- a/sound/pci/hda/hda_codec.c
+++ b/sound/pci/hda/hda_codec.c
@@ -2912,7 +2912,9 @@ static int hda_codec_runtime_suspend(struct device *dev)
 	if (!codec->card)
 		return 0;
 
+	snd_hdac_enter_pm(&codec->core);
 	cancel_delayed_work_sync(&codec->jackpoll_work);
+	snd_hdac_leave_pm(&codec->core);
 
 	state = hda_call_codec_suspend(codec);
 	if (codec->link_down_at_suspend ||
-- 
2.49.0

