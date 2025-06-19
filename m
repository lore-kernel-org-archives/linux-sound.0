Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023131.outbound.protection.outlook.com [40.107.44.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F0AF18FC92
	for <linux-sound@vger.kernel.org>; Thu, 19 Jun 2025 02:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750298964; cv=fail; b=aRFeHtPxgNJii/Jf/B/MFtiMpbrjbQRBW8ZVJtO2oyDDDwMlNr0Gc09u8vIGeN8OgK9SktuWqcOztRGAm0h0uQLKzmdcmlqDaFGCx7ih1d6w2b2YROh4moTEIOTn3BAINPTRlXBXqww/cd+puFqQMaC4H4fOo/rMWfMcp27B/0Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750298964; c=relaxed/simple;
	bh=rYP1vOW2STtabsO9artkqor9Dl9ahtgNLmxeYEJGXpE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eGXKC5Z8ulhls+W+Y2+ksSTneFkCyM7nffLheqwQccrM+AufEToWuej+PBVQOW5DQNQoL27a9aDqLpqs5yG2Fa98lGoV/20ob0VnrrwUeNU2fQqkikx2h65UxrJjeJT+djN41Z/UijOQgCc1wmBqrOVevFm156MIbtEfUtBXkag=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.44.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W2ivCcDYOBHiq0ikpedepRkKJLD7I4Pb+zHrXRcH6oG5oVvfmRAnNhxj8bQF66ia+tj/PaCpFUFnvi6O4nGHDg2KsCU47NQmo+c9pPMMMTTKC1Rr5LfaF/kOllOViQdPH3JTdEsVS+mzJYJAGD2tRa5rNg5jHpn1fverqXEX2ZhHtpGCmkkm1Oe80+b8Yqy+uCxrmp6npEMeEKIaGrn+NSpMJWSUXGxdpB8w6q6AtJ9NbIStJGEP13W4qzOkF6yXvNRAjXW6+GrWJSDTdSYwxxPbDuQQ0HyhtHiOnFjfwc3H/5PuE2B0SHYgNb9Un50ci/Nkb7AVe68asKM8K7777Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JZRA1H0iQisCBM4+xH0oFqdvHf90LCtfJjdcob5zeKE=;
 b=udbbwhjJ2dqVTH4VgTpBjSbueZynpr6xpQSD9/d9yS242geBy18HpJWeUih+KlaTu/Vncjc0XTBSHG6r0aHTbQXoRCFSVSK80+H4WBaQ64540qrX9VIN7G5emNCl73VBriIsOMxHoO5X6lyr43qqOxGeQ3KeTQVc4tABzrsP0SktoCghju49efour42pWeXClFAfZQTsGdNPCvmu7y7kRDCa8oVKM+PFhere3bzLbKFL+OQT6Zofzs7TPpB8v8dExjBgzPclYKpp0QOkQjaq+gA64avqPaCvDsKI7U7tz6MKR15MZX/3BvxwLvNcuhDR03BATbyirFmERqFFETggeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=canonical.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SG2PR01CA0162.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::18) by SEYPR06MB6929.apcprd06.prod.outlook.com
 (2603:1096:101:1d9::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Thu, 19 Jun
 2025 02:09:18 +0000
Received: from SG1PEPF000082E1.apcprd02.prod.outlook.com
 (2603:1096:4:28:cafe::b4) by SG2PR01CA0162.outlook.office365.com
 (2603:1096:4:28::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.35 via Frontend Transport; Thu,
 19 Jun 2025 02:09:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG1PEPF000082E1.mail.protection.outlook.com (10.167.240.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8857.21 via Frontend Transport; Thu, 19 Jun 2025 02:09:17 +0000
Received: from localhost.localdomain (unknown [172.18.64.15])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 19FA440A5A1B;
	Thu, 19 Jun 2025 10:09:13 +0800 (CST)
From: joakim.zhang@cixtech.com
To: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org
Cc: chris.chiu@canonical.com,
	kailang@realtek.com,
	geans_chen@realsil.com.cn,
	cix-kernel-upstream@cixtech.com,
	Joakim Zhang <joakim.zhang@cixtech.com>
Subject: [PATCH V1 3/4] ALSA: hda: disable jackpoll_in_suspend when system shutdown
Date: Thu, 19 Jun 2025 10:08:43 +0800
Message-ID: <20250619020844.2974160-4-joakim.zhang@cixtech.com>
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
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E1:EE_|SEYPR06MB6929:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b8e48ee3-e162-4d2c-a91b-08ddaed64ba3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iJwKWWqDT+JmiQC4XTHdG6JCjtbYRhmDAykiDOXGaz00Xyb3MozxwUp+CRXz?=
 =?us-ascii?Q?NMnC+sMyOiQZ6Yy6+pvGjpTT6tu2yX6S2Zufb3IpOwTaL8NWmAWks8LllsEu?=
 =?us-ascii?Q?4l8Ne18AtXzSTQe2OoqixvehAG1OUw75df8VqPLVvF+uIm3Tg1cCQlV0zOiY?=
 =?us-ascii?Q?pIx6mss2C1f/hVqE9vCVOlW///NCeyyYQUUpIX48yc/yXRivQEOWnaJdFC1d?=
 =?us-ascii?Q?echIn++3QYSJ+sxi4AowIC1q7hwHVwgEwQQOP9nuQoHqOIia2PDUJ1nzzhg+?=
 =?us-ascii?Q?d7WtvCTIYn7diPa4ZO60CZrdkqwJHy7peH9i2R8QARtpL8aQJEZlPyQfy/l4?=
 =?us-ascii?Q?acahrzo1pAxlyfA0EJkOVqAVCfoLSurxOhLGOSq7eU/FqPmoDtKllRiyia+B?=
 =?us-ascii?Q?RtWMzUjk6RPhu+r2A/SpiPjoYKhR254Th9NZD27V7MLceutiL7T2r57jmD4b?=
 =?us-ascii?Q?9UkGc6J6pFmmDrlMne/2ieWnY15MPVtzVCe9kZ1XDyGr2NfEEnit2OHVSYW9?=
 =?us-ascii?Q?dQupejJ1W7PEDv3bWj8gwX3cWQKJLaevwZNWkJhLbMyNN6FRRDQd75/PISr6?=
 =?us-ascii?Q?bRox5vQ0EPeG3XZZHeeAtIP5eAasAPXHyXBXYYKKX0basRo6Kla4MS+irLwj?=
 =?us-ascii?Q?KTQ+hy4qDz1tFt8nbb5XrgRA8r3jPmaxeBt0g3JoOKCoX6LdTnsbVZ1MrCUp?=
 =?us-ascii?Q?+cEGARB3ky8nkmihrAHCpANBdcSH4JRAtX1Iqhhx7EgdLgETc6lH5QLIDJZo?=
 =?us-ascii?Q?qKgrMVmDuh8obYNEPOoeL6Y2rdK6wI4+2c5EfGJ2tTu0wcysVPapdAUldc2Q?=
 =?us-ascii?Q?E9r6lrwoyRI5arY/1S433L6/TZIsKZRzIlgyRnhENSU0KGWprV5dfZRtF1w3?=
 =?us-ascii?Q?xxvBxGyXXuH73gk/qWRn0B4i6CZj8vmtSCXARGS0YakHfP7pIbgSXtEnHo75?=
 =?us-ascii?Q?9/2zJbxPQwQDPVxJjtSybwpvoewBV6m8zwyAIyqdrQPjtW8ba7nbud6abKpO?=
 =?us-ascii?Q?Y9JnODjFZPKMReTVfB1Sdn3IeuyXXYTMk7KHNbTmgvQp2piHi05v936GC8fJ?=
 =?us-ascii?Q?DmeNTtOjC0Lpzk9/BjmNHte/jRwG+JR8T71u0FvWFkfYT+37YNyCX84/MwTM?=
 =?us-ascii?Q?783xDC0WAP/IpqYeVlqHy9uwtBytyI3/JSYArscV1i7LebhPskpwQp1c13PB?=
 =?us-ascii?Q?nJTTDU+duHvFUaTs4GSo4ckalGQXMceqW1FczZdVjEToiZVdRVv9G0J/Cwq6?=
 =?us-ascii?Q?h6Ej/wC5Obg2jYKlJqeNFAcmzyXf2UMjA90nNtPThxZSEC6R1v7QQXymBYBv?=
 =?us-ascii?Q?RU1r/OSgguY8+PfurlJT0cSw7uYH9+U6MXuTCr9f6vhfge9je9YP5ZmfQd3D?=
 =?us-ascii?Q?ndfJ/qfvfLcnErcgjWJu92KVnJ2fP+J0IfQ3pzncSkH+ZtU2SggHdKMB/wH5?=
 =?us-ascii?Q?zUqIL33RLC6CcXIUjFsSNhA072F3OWCM8J6AgyX6IGD+1xQ6RnB/hQTo1Acw?=
 =?us-ascii?Q?0iriskegeO5EDumjMs4Xxe15xiOZ7+pJDgmm?=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 02:09:17.0014
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b8e48ee3-e162-4d2c-a91b-08ddaed64ba3
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG1PEPF000082E1.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6929

From: Joakim Zhang <joakim.zhang@cixtech.com>

When do reboot test, kernel panic when system shutdown since
jackpoll delayed work tries to read registers via hda bus
but the drivers are all shut down.

The root cause is that when system shutdown but codec may in
runtime resume state, call runtime force suspend would trigger
jackpoll delayed work active again, finally cause the kernel
panic since it access registers with clocks/reset/power off.

Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
---
 sound/pci/hda/hda_codec.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/hda_codec.c b/sound/pci/hda/hda_codec.c
index 12caa5b2e678..e3424ac7b5a7 100644
--- a/sound/pci/hda/hda_codec.c
+++ b/sound/pci/hda/hda_codec.c
@@ -3026,6 +3026,7 @@ void snd_hda_codec_shutdown(struct hda_codec *codec)
 	list_for_each_entry(cpcm, &codec->pcm_list_head, list)
 		snd_pcm_suspend_all(cpcm->pcm);
 
+	codec->bus->jackpoll_in_suspend = 0;
 	pm_runtime_force_suspend(hda_codec_dev(codec));
 	pm_runtime_disable(hda_codec_dev(codec));
 }
-- 
2.49.0

