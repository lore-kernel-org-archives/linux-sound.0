Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011055.outbound.protection.outlook.com [40.107.74.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 092B3130A54
	for <linux-sound@vger.kernel.org>; Tue,  3 Dec 2024 02:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733191512; cv=fail; b=jIkDTdb3pkjIb0JFGWkeLk2tGRQRqvPXnK/KMEtl0o6P4/kzU+4Dpdk/T9JeEU46h2SQAWq3byv3NiPhMB55kniguBmUWVvXbaf4gWLTXfGd5T7H5ZYtj7/J20mbyIFDU+dVfRi127ZJxBjeahLWpTUt1PJCRrcuXsLxG/2r0UU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733191512; c=relaxed/simple;
	bh=rkz7gWxzoSnB197p+jDAek1y9lAtksgqQunev59w18I=;
	h=Message-ID:From:Subject:To:Cc:Content-Type:Date:MIME-Version; b=QrRGDsMzlr0Wg+O3xMwuXnQGG5WcSZSGxX198nkWNQ0kYkDnZq3Al7IjoCxlGT5AnKow6UonhROIY8JboSCfKQ6c4HSWPIulDaOYbpd1VRfUjnevVfLB+V0jKiaO97x49s97cBLightZpPCvXwogzIREJDciu3kBUbobKGGbBag=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=kFZUruoy; arc=fail smtp.client-ip=40.107.74.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="kFZUruoy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HUZ4BGGvRnKMiP34hCRuRvey2vBjEvktNjJo76nD58NimM10nMpasp6CGCqXH1DG3W5+7ysXIqS0090myRWOs4KrxkgkfUXYRmHoEWM6UIrQO/m7I3hh9BKZ5cyHLkDbL5DV71QXeZKthbBuG9jU/dV6j3kFuI5dYVphikZg4pgvE3F9LRY4OyZm2aKtcu9KuDoZ9Bzx8BnvHPtCotZdm+gckEZPklwtAXo0Q6wpYm/oDdpPppRk49VYGKEyjH6tQr2OiB0kXH0KtCQW7IjOySxgOSN1nCrS1msbqFlAkTekgmDsMOLlleu4141DT+lkSESz4APqfAX4WSIFmlwDMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bn9zok1yffFYP+cU0NDp8EhCjSaQfo+H4B0nzgjXcBA=;
 b=FXx8dzTq+MafCKwJDgr9pVBDmjTecegU7cOqYrBKe0/08HIMJ1ir9jng5Eo/3p9QXwEKlfcs7Td1lBsN6FGJYH+bUFkqWEKRjnyQIAcjMVoVKB0jvYXAUjQXwOwmgCveISPvUzFpZcDUDfB+UJzSAKYCgxaEUuHWZn50dPaQ5MmE9mkMWK8kPz5SnMztOe9nzOVUnUUtZEqPnn8z0qVFLY79Y9d7ybFcGjqAVAe5U5QN/GmMNyfgW73sPsvYsFo1z29LpsEL6F91l6xaGfNU0g7+zFuWE6J8qNKNvjG9PzHWpmVsh+8p8ZGOxwby8PlRMU6e5z+m+BTlGxUsYern0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bn9zok1yffFYP+cU0NDp8EhCjSaQfo+H4B0nzgjXcBA=;
 b=kFZUruoywwB83OlyuJq2SnNMKSDmeYUWfULC7hWMcJfChx3601oIT2d9+mdkZaZaN/747Vd0t5QCRixpuvNyN7gkK78TmstoLoQw6/+IRK2QyFO8dPUpsefXFT2U1FBIyheEepJooIdGGUHsUzjpADyiZQA3Koapwcj2Q4T0z1I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYYPR01MB12888.jpnprd01.prod.outlook.com
 (2603:1096:405:15c::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Tue, 3 Dec
 2024 02:05:06 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8207.017; Tue, 3 Dec 2024
 02:05:06 +0000
Message-ID: <87ttblfrn2.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: dt-bindings: renesas,rsnd: remove post-init-providers property
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 3 Dec 2024 02:05:06 +0000
X-ClientProxiedBy: TYCP301CA0003.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:386::9) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYYPR01MB12888:EE_
X-MS-Office365-Filtering-Correlation-Id: e8c211eb-7ae4-408f-3731-08dd133ee82f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WUgPgYw8tWz2Iq6h18LnIYesJWCBrkKs4JLfAUVYWtuDAXc80HecA2/yDUM5?=
 =?us-ascii?Q?6s1AmxAIw5GcaRGkwEjdeqe6bg/f+/WjuZFtFWMe1F2hO8wm6+NgfQOJEP8I?=
 =?us-ascii?Q?XEFiV5i52v8EHx24Jp6sIH3/Y6BhfV5AdBQ3erJw4E2cnALQgT/gVthG+oAl?=
 =?us-ascii?Q?gqDca/F+0SoXugA8fv7f0Y59/1ZXGY6an5TJtsTK6xsHVh1C3oZQ636jbqdl?=
 =?us-ascii?Q?z/JbtL5lV/4BnYmwSvBYnkiPvPjaqdh5GAQcmTlDKFp4YKdcJoQ2+sOk0R1c?=
 =?us-ascii?Q?ToVcrhnsgmlMC3O7cBJHEbkkb+2ejPh3GJVbEcE6JRJ092W2DKi+YBnitrzm?=
 =?us-ascii?Q?IFz7Z80wz2ie+/Hp6E7IY7749MdI4vJXKjw1lIBTxd2lNp2wrTg6jpgZmGZc?=
 =?us-ascii?Q?RfwK7NM6xAW0DW1xT3UqNcnsl1jwGGW7COPyO1IHfP2o9vlmilJEQMOGIoui?=
 =?us-ascii?Q?ss//ykwkRcyR4eVc1Lv+7O5S8WZU8q3Pamx1KWN/DgAUaHXlwkLLghrx+aS6?=
 =?us-ascii?Q?7VTJNN4ztam3CixXcs15UdKJZ+fJfoHhDL/OjERH3zhjY1wvH6SyzyW3XuB5?=
 =?us-ascii?Q?onnMzPHz4+nyGrPkycR6j0t2p1mw0lcX4dKazKniEtpTPGvweKgD82sARU3T?=
 =?us-ascii?Q?qa4MZADi2m0xyex5m0GoEL0BKVhM5fDb8fxBqs6kEJ2N3vvroWN8lbxWSqsS?=
 =?us-ascii?Q?mDVZ1kiV4rzLO3Nu1Tv3k6o5nXgGDsXXrfOg7OjB5ys/+lEfAiNx8R5bswxa?=
 =?us-ascii?Q?VIHip+BJ5wu9hSVe2JhZGGK+4SKvVmOQdJEtJvbOcUuwSz1wHGijOGQ1Ahcg?=
 =?us-ascii?Q?UbMkxxOX8sWn6wFRjWcicq97LekfS2eTEAvUsyo+yz6Zg92eZf9TdtpgGsnF?=
 =?us-ascii?Q?FQytthgfFHryf3NC7l5XsyEFeBbtLIVrua9KsXaDsKGwu7AQeAXm7AwIec/A?=
 =?us-ascii?Q?5znf5divqr6H89fMogbW+lDfyibF6GqQAyS/BHADdDFqP7AXX33TkuRBjh6e?=
 =?us-ascii?Q?obSb9m1lKc7Q7zu7bB8SSRdPh/dE09pzy7u5TR+fMRSKG2k33gWXoFSJi96r?=
 =?us-ascii?Q?WSDspUCHzg1cLZLzCJ/Ir4z1NAyPj3yjZuXUP3qM+sGSziJXpV7JPTeifU+8?=
 =?us-ascii?Q?7r0EJU0AiEtWd5jz9Fb7MbxDHSJonGXtSMQlqee38cMeg2ISKfTkXL/Mb5wh?=
 =?us-ascii?Q?LJHaFS3bXUE45cVYbwlWIIPH/3HFRJ+RDNBBMj+selC3oLup3Ih8bUuOneab?=
 =?us-ascii?Q?cC/FLUrF478/sRoEzXCz7sXRzJcjqn/+9YeDAfJRw86BmDrLKIBu1M4x2ILB?=
 =?us-ascii?Q?PMCIHo7B+i3TeRq6KLxcM4OnQVAeaYjd8tPqebXIczNPhJQLvWy7Q7xLf6xo?=
 =?us-ascii?Q?+vo9pmUwSyPa6rfW86EVJjS52duPLf8B0tWjWIhPyLRqHqiM6Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0P6cg/E5KXQjCmre7dcchdEied3ClYCE29xSf2z2qTno+9v5OYK8zWdfVCMP?=
 =?us-ascii?Q?3+73pHmfe6vnXkjZK0doOKY2nCGBG/TfdFAr5G0p0Wm15JYpZK3l4Sgfc+B4?=
 =?us-ascii?Q?WoLWcDy25uW1EmGB9WeN0IDVOMoMSJJMUuXz04R88dIpIHKVcY4HXl2NbB4g?=
 =?us-ascii?Q?qNMNf9XVWTgmPEyHivAhs85j8Q6NAhRNs19EPRfc4CKvUTNWGNX1xiUcq4zy?=
 =?us-ascii?Q?3pubdzeft+8HSUyQdpzGZU0RSKqcObd1vClRumFbQmTqkKVprLUJnnBEHAsx?=
 =?us-ascii?Q?jRdYUGdOjME7YYxgTwAkvvkZ+qeCEkBkIGhWAPI+wS+F++DMJigTJm6eCjqs?=
 =?us-ascii?Q?mOs1W0jHrFprgYkoZ8Dc3EdGA3q8xE3q05zXA2nIS0Il8qxD05SlP9/OVEpk?=
 =?us-ascii?Q?5Os13yuZfoEISXU5caFyCp3m3nSFdPMr+mNrGDQJ8NWWVjwMOoeehDFXuAw5?=
 =?us-ascii?Q?tzz2ccYlMz94AL/h7Yv5qdArrSY95g1zNFKKRn+kvohgdliAT91mY87zIQxl?=
 =?us-ascii?Q?Gx+nZnw27MEBCAaZkkS32812c0FJAe2wd5Ai1xcf5wxDCe6TdNIeAo/KoKyM?=
 =?us-ascii?Q?Aax6zmPzinQc7mcv6mz/ksmxrztZv1K6isGccszf8tejMGH90bE5e8eeRGqT?=
 =?us-ascii?Q?h42W3tiSx2Z2qEL5MrtRAoHAhgdkuGOG9qYd1lmL2XN2ZA2wQeVyWwF5YxQQ?=
 =?us-ascii?Q?u1yHVdbiePZMC3DaofKa/APq8T3mcMcPUUbp5wobp2JGBUAJrT9gaiUaIk8j?=
 =?us-ascii?Q?WtdxVvvQHCDrslEPxMVdbT3dCLBG67V1v7UVM0BflR4/4lNWXo+HBYdsaxLN?=
 =?us-ascii?Q?oCMaqXpjaFdAPSFOZe5SykapE9cwlAQJImFPKM/GYOwYSfQRyu+Ua+/xJmn3?=
 =?us-ascii?Q?EorLysI1MmtaxgmHVNs9v9PjUppJ6W+lQl6cZOUJX2mk+CmB6z23HlbuuLcu?=
 =?us-ascii?Q?Fy5DHgeZCzLXOdaKBgqKyoiL6m24JvxRJmbxKUoC3G7HwHyBzNeAB4/HsM+6?=
 =?us-ascii?Q?WXa9qxGHyPircStt03dhWiGfOXSa2ub5NoPem49A/Xapi4GAUk3sO2q/fRRS?=
 =?us-ascii?Q?IiqhvITb38Wis60ss4uQxqzcGvLED22NXiJt5gpI8+akNRhyC89JBP1x3noc?=
 =?us-ascii?Q?NrGFVRnaUn6LWhqOLY6A1HcJp5OjKe+QkulocC67g8P/J9DhlluSscuWJhGl?=
 =?us-ascii?Q?2sYPQjCcTlU8Hv+Y4C8/sormvOUCydv4p6o0yM+Q6LcMbicp6bGVNSv9cirG?=
 =?us-ascii?Q?gsUrIxNZRSlLBHO8bgfzvnSdqBlZmaC5AwNn5AM3Y0zO7OHsrQOUhFrVkszl?=
 =?us-ascii?Q?+QisGpOoMdN8SyDzEDgBwsjd0KUJLOjLBMt8BBonEsBvmYXjNo7O8KHTsRFH?=
 =?us-ascii?Q?5rNkHFBQE1HqUQzNbkAKKn3dPe0lNQk5RJ9lByWIM3EpLsPDU8Q0nrd8fy3u?=
 =?us-ascii?Q?+VO59zxflyApO2IFWrvHUNNzvm1mQkL1B9N/x/ZV8SvTjeN3LbHFQmiSSw46?=
 =?us-ascii?Q?gqHSVahb6RWhUSwDI7c3MwrQDoEjnPxOzx178RtxYtJoWamiocz/wNqO5O1r?=
 =?us-ascii?Q?iGc5LiQVHLJ6UBEeXSH58eylzsBI6qfrJpbuCI1inRO1DxK1I2ZZ2kAoJhGN?=
 =?us-ascii?Q?PLB1i+0fRoF+JZNKPlyMPyk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8c211eb-7ae4-408f-3731-08dd133ee82f
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2024 02:05:06.2143
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H7ue/VOPcRb2l3ZDnzKqFWUi7JlpRzVfZM9I/m4bp71FPPLBHLXzWGu3lC/4siizg3LtqsEqmrtmFVmHtBdwZjLo5vvwln2vhJAkEhFCNjFJDYnWnC7BUuyJYeSmxBvA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12888

commit f8da001ae7a ("ASoC: audio-graph-card2: Purge absent supplies for
device tree nodes") marks multi/dpcm/c2c nodes as no suppliers. We no
longer need to use post-init-providers property to break fw_devlink cycle.
Let's remove it.

Fixes: a2187d0dadf ("ASoC: dt-bindings: renesas,rsnd: add post-init-providers property")
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 Documentation/devicetree/bindings/sound/renesas,rsnd.yaml | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
index 6d0d1514cd421..e8a2acb926460 100644
--- a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
+++ b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
@@ -112,12 +112,6 @@ properties:
     description: List of necessary clock names.
     # details are defined below
 
-  post-init-providers:
-    description: At least if rsnd is using DPCM connection on Audio-Graph-Card2,
-      fw_devlink might doesn't have enough information to break the cycle. rsnd
-      driver will not be probed in such case. Same problem might occur with
-      Multi-CPU/Codec or Codec2Codec.
-
   # ports is below
   port:
     $ref: audio-graph-port.yaml#/definitions/port-base
-- 
2.43.0

