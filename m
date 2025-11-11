Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010045.outbound.protection.outlook.com [52.101.229.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AC5F13959D
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820447; cv=fail; b=jPCDCudIHdiIIAH0dXhHO21meJBeLpe1Nry+coCIfLQF6XLcF2WpuIbbiK7ALK9l89qoCWlyGX25Q654j4bhyS6avOwZLhC/aZZMzLBUmoxnfOGOj5CcJr3RoOurkZu/settXHcUJh8OuH33kCEIDcMfutRrL810Xhv+MarDlpM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820447; c=relaxed/simple;
	bh=Fb7cDmuK5lChtvtynZ0yZVqL96tSxnswfoeUQOiIybY=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=aYpf+UkFSVlTjWwf5zkOCTpikBd3U2t4MDWEe8Yg2Iq5Zxub7pPBkOPtXYhDovmFmD9sAG117oyHafCNlXZEPIwA0V4yoCJy4t1C7H24Hky99DQ/nAZKHMDq/1yzCDxJiCxhptfpO9QlGbUuDIvgZkUZt9d8Dm0HfgfLJFCgzpY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=YJk5RSRV; arc=fail smtp.client-ip=52.101.229.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="YJk5RSRV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uF6epx47srvTKFhcN34CoXuHhxs2NRi1WYasJbdLFjui3SEScIGOtSD9K0TlhOwAlp7s+FE2jcxTdMmwGezoUOIkeFWZcoWP2B1bHrBGAH1CA94SQoOkC43EXl4jjidYA1lm/ukyH6YgZcSewoT9fO+zefdCUXDeiFcw4Iu7s0Y9HYxQ4JPdcc2xm9iGP+s9B5xLOjtvPiCESa0grB1pWTJ/1p+NnhVFkyy+N8OwZDCKYY9GcF3Xc4LK70wzgl87hqZemdjTt4J6RlfgNJ0wCtVdAY+EQ2JsOHnhaqhw4ss0XPzhuMvv/Zi99vgqiiW+kz/3H5jy2H459hSu7x4WHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IJ3Ww9WYQJwATEXv3VvC9FbHjDWAo6YsNFNt1yDFeEY=;
 b=h76SMgIoL8hZJj+IKil2gwk+94xyXmvr1v0VpczLytKiuDoYFJBRbUoMWWCjdSh1O/XLiNRIxNyvJtypSkiRamuxRaY351PYgUUG22y6LvFeBbb8ZwbQquZIcLB/XJz5+KCsG0QzTDWYgRiaiM86WEYmgqNFStXyiSOrMRCIgh622aYGQvO0AZAKCP4/XLKJZIALPudiTPaKxiq5ug5NQTy3WvM+RYweuMsJr+nXomy4B3YJx7UBd7EGbY2tG/JHQGzJ1dkrS3Pt5ZaASUS5BR8ERQtG/4ZaZ2lYZIWX1OPXWNzeQ2tQhyxo9ai4FnQheWut+/lSeyodOqRVWO4JfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IJ3Ww9WYQJwATEXv3VvC9FbHjDWAo6YsNFNt1yDFeEY=;
 b=YJk5RSRVT5JqNTF5y6gM2jtVSpnZftSktpZws7phoHhLfVXiff36F6hYvtzADvEJBS3JFikBiKrAWJJ7Y6pHJgUYhifVnUeU7+8EaVOyffb1yBeaUTYNaEDU546TA39pPlAhQcA1y4pAqVeh4OuGLJRh/myzPishUAMTiKNweaM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB6994.jpnprd01.prod.outlook.com
 (2603:1096:400:bd::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:20:44 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:20:44 +0000
Message-ID: <87seel7737.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 038/292] ASoC: codecs: cs42l51: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:20:44 +0000
X-ClientProxiedBy: TYCPR01CA0133.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::14) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB6994:EE_
X-MS-Office365-Filtering-Correlation-Id: b896a2b6-55fe-44ac-7d42-08de20b827cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hDo7CeWKxACt5nA9oRxGAfvI+x/d+7A84LJqUOw4hZBaDI6YwmgaEJ7WdaZu?=
 =?us-ascii?Q?wLsBP/y4TdEt6W8Hy+IH+jmX8SpombOviDuNKcEVFMG1m/1ZZ4uEkLY31HVM?=
 =?us-ascii?Q?j1LdXEgns7AqPiQM9zo7gdpaY3gaNB/ipA//55Y31gyF9KJ1nD+f+eMStY8A?=
 =?us-ascii?Q?2ZoWFbCoJyVxMFF+w81DqCC7xld2KeuXP3/W7nwdBH5XuAf1CNAfus5fTUGa?=
 =?us-ascii?Q?UxMhQW2s5MLGpVRjzMXtKHjKVm3XxmJkwcVRS9XWxmodq2f8RraSb3hrnip7?=
 =?us-ascii?Q?QLihyHdYwNEoUuiLjOUZD5uOZUXFak9vgluYoZTE01Cav6AQwitpP9JgA3Pc?=
 =?us-ascii?Q?QhfGLMnWaIHW1tJ8CfbwZWgxZZLo2HCVC7T22wqSktjfq8cRKAtbqOHmhzyy?=
 =?us-ascii?Q?icNkT+YeNgiDiYczzyDT6FS8rGZnujwhE4cLVJ0j/v4i38S8BHmssjzyfCtl?=
 =?us-ascii?Q?WjFFnZEfhPczm6f6ZthBnfQ4oV9mJgfqH9RjarFQxVcJ46f2YekSWED+NRqp?=
 =?us-ascii?Q?YVt7vtryWkH0rFAzt7CBFssNxqypvzYgUY3cpyRVFiHhVHiSXGXKAIFEnQrp?=
 =?us-ascii?Q?Y+KXRdGGpfZOdRNGL9EOswbbswAqhaIJhNo9Z0HY/0BB7e7PyvaZoz/3FsMS?=
 =?us-ascii?Q?3DTtqIVyL2a/hmDOov8kYBQ32fqN0lMmybpjkPpDbdtFgMLh9vlpdRarVCXM?=
 =?us-ascii?Q?2w8LekWNTRqmUNtDWV/x7o4Jsuxw4L8BraXjpSgAeQ7GJopSLmhsRzu1I+rp?=
 =?us-ascii?Q?KdKA55w6j2ZODvVGBZrbOOvtN4IDJS4YDNGrzYPZEHASq4uR5RBtWe/27+u7?=
 =?us-ascii?Q?KxCU0rp0cMHr7FGgHSNIu5gGJi1N7H4+bsF4R4HhZghlevnpIu1pVZm2+AYl?=
 =?us-ascii?Q?BWC2bW/F4IHtgNw0VTvgsePYT1Z2dTbUTxo3r27YeQoWBm6VPBVhyvbC+sd5?=
 =?us-ascii?Q?Tu+CEVd0oZrPxZrk5eLmxK70JEZq5nIqT17sTvZOOyqjLhjYBh4D5eaZGMkK?=
 =?us-ascii?Q?FXiAqltmv0MThdK/LnbyDdbXp7Fc8PcvIMYCn3pPq0J1b9BDVDc8EZDg58lJ?=
 =?us-ascii?Q?67d8TYNBxOvWp50YgPF4mS62YqL+5HU4doU2mokg7p1Xw0UlMNtxf0+M09R6?=
 =?us-ascii?Q?NGprkLq26fKzFlzh7dTlbbqGuPqNL2yZ0ku76gTM3tS6bnb3WK9AQ2EXkOOw?=
 =?us-ascii?Q?/h/EFqSu4j4cQp9BQuO8St9jmm9gDjbVFBAHaorPlhX5TAPWcXIR7ZXt3Qe0?=
 =?us-ascii?Q?mZioEu6CVFIu39JkGTqDp4zqiKS/ntW2wNjP1BHxvLE5TfqDibrMvIxJ+NcT?=
 =?us-ascii?Q?3jFH3omKVUHVHy+/HxEA+LKnAP07d4BrjpHK+jo6Y0aZH3dYSksfLasowRGD?=
 =?us-ascii?Q?VDL8tEOnm0x/YccU24oTT2I9WvHRrS//txTTiWsDspqiGwl4SsNERWTn74dp?=
 =?us-ascii?Q?7UADvGNlLQ3rouX7BDBrdueeXcXvYAgQV/OTubaFM0BpiHbRYwwUAuGglxck?=
 =?us-ascii?Q?0oRnHir7qKkgMvyl1BpXzMptmqZEWCnryjgd?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Q0Tyer4708os/Ah2RuCxOZv4HxstlI3UvrwSx+IHZWgSRSItLd2AXJsvVQ5v?=
 =?us-ascii?Q?OI1oOSc68Dd8LiDo/jboIlzC15MpmVIh18VjlgUi5x3OosRjFQAJcLCr4KiH?=
 =?us-ascii?Q?5+mSR8CV2qJ7XsHwVc7gUpZY9/X7X5Z1cQ8V6wtPfu+Dy5wdESqUPndgOa1K?=
 =?us-ascii?Q?S9M5WbWeSDu6+RdxokpaStOW0K5LLHb6Ll02Hpa05ZbY9CEwPsM9QdtVb6ft?=
 =?us-ascii?Q?+DH0qJ/ZkhGDfiYNrW4emAHoDTgpiYPZoULg/4nOXn1FQJ0iF/EhsRIM3ZcS?=
 =?us-ascii?Q?Ag9T/8rIC1i4JL61JYmNB6KizhQBW4XI8vwgLAPO4L1q+0sHwAOwKT95DBQL?=
 =?us-ascii?Q?0MZt80Yp155c23emUQk1buC+0VJxDGm0UUKZu/Q2Bbj8SuJxUHNd/bfx9D63?=
 =?us-ascii?Q?Pfpt1TxblpIxTGiQAQ3FzmK/aCeEjab+Z8gA8Lh8Gz2tmn28UEak1O1kYg2f?=
 =?us-ascii?Q?bCwy06yt6XGljZl8WBkV/RShCaLotFDMg2zkRdRzRqWMsmiMTqQk2eOGAKG3?=
 =?us-ascii?Q?Xw4IDsROsVGAQi3JpJk/wTWj7LsyAGXDcvi5/D4qw3A3WbRroT4hJf+E5PWn?=
 =?us-ascii?Q?HNkddR9SCXbX21PL9/msOX/C3Ci14VUi8dq/yW0B523vFiPEZucya5+LCzWr?=
 =?us-ascii?Q?KJ3jrr0N8lHtRDT/nV3TPdhD/RgGI1B//kKOJx4kR8h98uLV5K+0hhucdE/c?=
 =?us-ascii?Q?yZyc5uZ/6JkKoYTPZNDsa19MH7nEfns/qbWMUd7pdY2xD2EU4VrTbrrguE5q?=
 =?us-ascii?Q?AFxpKfZIscwPHYnJEiky5T1Rs3IQ1Pt0dXvbOesKgf4ITd9h5dTWZaoxjdqv?=
 =?us-ascii?Q?pbUExphPatUMKbARADQAOq6/24hbCBm4WgY3Z7cowaxtfMHgQH2n+EIUQlMc?=
 =?us-ascii?Q?F+jbRfpNJfuZ9b/ugHbAwhKk8ZwZe6+aaMhmSUjm91TN4rRvCi/sw8yl/RoQ?=
 =?us-ascii?Q?oYpOcxTeX4MCznTWuWaySJF7Y+we+SeFWj20iHNnC7Jizky/t5+EoE+vJjTs?=
 =?us-ascii?Q?qxENiNU6KvlONEEJiYO8D33aCwqv8N07BJZexCq5NfzEZNUst3Sb5lvapKXa?=
 =?us-ascii?Q?FBhrfo/4Lx8q/3yqypW7prgdWeBvqShUpzOugMtBAj7mYwbWvSXxLMBAzvMj?=
 =?us-ascii?Q?H1vXEDD/dt6ofoszYZLRiCxpcaVKkON6zcmEZDBeC8ToNBtg7FN3ZEz2lVUv?=
 =?us-ascii?Q?zuCDP/mFYNmw2A2FZ+Uzy+QcbqhVGVtxc3VEjnIURWAlFPs9xjRnW2kDHHzW?=
 =?us-ascii?Q?Tn0+T35ou1dQrvLuuuoLR5cD6HeV2EhLsbMyKMI116GX4L6J99lRZ+5c4x1D?=
 =?us-ascii?Q?0JDmCpI4RWap1oTN7/cwEOdEmRNGfjypeRLQe2LStW5vslK9MK0FGXo1zk/M?=
 =?us-ascii?Q?gdb+X/SupyqPuTj1FsBAy5bq1Js9QImr0Kb95pQy67rr8ouVwYhZtpAUEiyW?=
 =?us-ascii?Q?YwjnP5yJY/qDGz1OUF1e8yx4+fNedEjqBnrMRJqHEZsSHbQgkLLuX/3rdC0B?=
 =?us-ascii?Q?O3jeZ7siTCKGeVaszDYUMTwtnOEHNF9tXJ50qLufobiwvsFqiGSDKFuaMPzu?=
 =?us-ascii?Q?XkQ63O+BaLcr9pS4h1j6p3nPC/rfS582ymyDY+7tLuiRNVCt/JsLVxcmE+cm?=
 =?us-ascii?Q?ZbA9SjZIYQ1rKsexnhso/OQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b896a2b6-55fe-44ac-7d42-08de20b827cc
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:20:44.7959
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rlqlzblBdNyBG2ykzyYkkwpHrFRjANLvkqhZhDy1UEDEenz3kGKmULbXVT0XlAEtX8coSgbrPbkCBFDD51YRwUf9pGyuoge4Hy2WOm2HkNtB7oOxCniGem0AVofvuihM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6994

This patch converts below functions.

dapm->dev					-> snd_soc_dapm_to_dev()
dapm->card					-> snd_soc_dapm_to_card()
dapm->component					-> snd_soc_dapm_to_component()

dapm_kcontrol_get_value()			-> snd_soc_dapm_kcontrol_get_value()

snd_soc_component_enable_pin()			-> snd_soc_dapm_enable_pin()
snd_soc_component_enable_pin_unlocked()		-> snd_soc_dapm_enable_pin_unlocked()
snd_soc_component_disable_pin()			-> snd_soc_dapm_disable_pin()
snd_soc_component_disable_pin_unlocked()	-> snd_soc_dapm_disable_pin_unlocked()
snd_soc_component_nc_pin()			-> snd_soc_dapm_nc_pin()
snd_soc_component_nc_pin_unlocked()		-> snd_soc_dapm_nc_pin_unlocked()
snd_soc_component_get_pin_status()		-> snd_soc_dapm_get_pin_status()
snd_soc_component_force_enable_pin()		-> snd_soc_dapm_force_enable_pin()
snd_soc_component_force_enable_pin_unlocked()	-> snd_soc_dapm_force_enable_pin_unlocked()
snd_soc_component_force_bias_level()		-> snd_soc_dapm_force_bias_level()
snd_soc_component_get_bias_level()		-> snd_soc_dapm_get_bias_level()
snd_soc_component_init_bias_level()		-> snd_soc_dapm_init_bias_level()
snd_soc_component_get_dapm()			-> snd_soc_component_to_dapm()

snd_soc_dapm_kcontrol_component()		-> snd_soc_dapm_kcontrol_to_component()
snd_soc_dapm_kcontrol_widget()			-> snd_soc_dapm_kcontrol_to_widget()
snd_soc_dapm_kcontrol_dapm()			-> snd_soc_dapm_kcontrol_to_dapm()
snd_soc_dapm_np_pin()				-> snd_soc_dapm_disable_pin()

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/cs42l51.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs42l51.c b/sound/soc/codecs/cs42l51.c
index 7b60aee9cf15b..0519affe0ed8d 100644
--- a/sound/soc/codecs/cs42l51.c
+++ b/sound/soc/codecs/cs42l51.c
@@ -567,7 +567,7 @@ static int cs42l51_component_probe(struct snd_soc_component *component)
 	struct cs42l51_private *cs42l51;
 
 	cs42l51 = snd_soc_component_get_drvdata(component);
-	dapm = snd_soc_component_get_dapm(component);
+	dapm = snd_soc_component_to_dapm(component);
 
 	if (cs42l51->mclk_handle)
 		snd_soc_dapm_new_controls(dapm, cs42l51_dapm_mclk_widgets, 1);
-- 
2.43.0

