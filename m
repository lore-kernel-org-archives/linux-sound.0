Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2055.outbound.protection.outlook.com [40.107.223.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F038B1D5CF2
	for <linux-sound@vger.kernel.org>; Wed, 21 May 2025 14:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747838323; cv=fail; b=YuFzanReEHF2ePucs1kG0g0Y3vQBg183RzofY1bEQisQRE0GXMjbzMtItvkjktYzw4bt0qj8xARXmx1HUP8Iijy9c+E4n6elHql53mgRDc1HOoDjlsB+oO+h9RSeMT3PnOxoEib+3e0pIlpwdNnLMMAKVYegQuAVxU3fh6eDrz0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747838323; c=relaxed/simple;
	bh=YMzIuajzMkZmATldld2Kr7/MQQd3DgFiJbmUFbBQXkE=;
	h=Date:From:To:Cc:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=n0P9eCJMSU2SDC5M7trwqSFf9bZ2quR7twhVxRYyqldvsFbWksXLf28Nl7lpr//Ui4bQ1bw/GBrLiznblQAK4F+swMyjunP+Lk6H5OKeJckOsXEyuHzYkpqnib3lKafwVSFd03Nzexul3sNWGEAxzi7tbE/lcMTRBIFvbgrWAJ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=rstUt38k; arc=fail smtp.client-ip=40.107.223.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="rstUt38k"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mAoM1W4OxdU9oQjZBo8nPU8r0Ddo1t+4vRS9fDLm8dvxPhSSrkNxBz5UUx/+lisDZwFreQNJohQU3713V3Bo/ZR2ZovYo9JCRRjt4qKfWoXq321BuyPH73mnP40BBm25ki6X7XY2swNd9HZ5msgdnn3K0rrUX/FbMhx0RR+Sg1CsX1UV3JX+WBoOk0JVXPWBhSdfDqbwX1qcThUW5B3yGxnoybJW1eLg4U9hjUvogw+LatODUMIBMexu8IC1xRY8eNtBnAkZYZd5bg3LaYFT9vzWmMdE2pTJu0YdS8yZpmIger5AIrTzVvbqJDR46fL0uvvpCjm0I7eDo4PUaAyk1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ErgEo0NOp70bFKm6Is8JfQRBRYED3QU8bnWHzbb5KjY=;
 b=qVSsBQfeAI9Yrc1Fi/9eXBC6dJgeWMutzONMHg0lYNOWEntLev/wEltDEBOIBRHE6ywn10Inc7bGT+A7651aH37J3oIhzGg0Z9I2CqEnyLm031K3z//7Gld7w4X+Uzv/x0MR2hb0LfSP9S0Tv5SUKXDNYf5mxdq6XtNClhQxQmfMd2tFdZFpOqQBv5iN3Hl5Q61njBkuSWfwLWQ+r8H65nOqA5uwP238FMnQ5htfMSmeSDZwxIDSnNb0HiOLGi/pZYipVLz3QlAiru1l+7p26jXSp1I5458m48R8WZU3Bqu0zVtkLXQXf0pDvTQaGx2tWTDBk2zVp8y9jyVU4r40oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ErgEo0NOp70bFKm6Is8JfQRBRYED3QU8bnWHzbb5KjY=;
 b=rstUt38kY5D1dvQA/w4qDwij8cUEdahe0QG5+pi7Bq7uYXoTQQhIgyYyldMukkjKR/ZfkBXirdWd06DjqwVs5CTH9csg8YScR6Mv3W4UGGaGbXTspm8x8pkI4ZdLSqU605mxtI7V1bVoQ5aVzbGwp0PIWbxOrnFgo3+V/ZznJoEXi2Z7kZoaNeGcd4PTBdHg1uSl0rc8ayZef5qXMZVsAIscMwW7ZBvX/GdWc5TWZ77bbQM6An810N6OfOQUWOLWvd+y/FzPPXl0yW41KO77ZZs6UPaWfa4JbQKLZvZ++VFlMEMTbBMflTJd6HtGtGeAfMJ+fR538/8B8H1el/VFCw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8422.namprd12.prod.outlook.com (2603:10b6:208:3de::8)
 by CH0PR12MB8531.namprd12.prod.outlook.com (2603:10b6:610:181::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.19; Wed, 21 May
 2025 14:38:38 +0000
Received: from IA0PR12MB8422.namprd12.prod.outlook.com
 ([fe80::50d8:c62d:5338:5650]) by IA0PR12MB8422.namprd12.prod.outlook.com
 ([fe80::50d8:c62d:5338:5650%4]) with mapi id 15.20.8746.030; Wed, 21 May 2025
 14:38:38 +0000
Date: Wed, 21 May 2025 09:38:36 -0500
From: Daniel Dadap <ddadap@nvidia.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.de
Subject: [PATCH] ALSA: hda/tegra: Switch to two-argument strscpy()
Message-ID: <aC3lbOTYxWvYR9dl@ddadap-lakeline.nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: SA1P222CA0181.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c4::28) To IA0PR12MB8422.namprd12.prod.outlook.com
 (2603:10b6:208:3de::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8422:EE_|CH0PR12MB8531:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bdc3f33-1848-4009-62b2-08dd98752cb9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?AXzx9ukPyQ2XSAE9h0ATMnKfr+MQAHVRz3BZFyzPnVTMuPrcf1DO6in1K4ic?=
 =?us-ascii?Q?Qszc3mNwhZr/RuyxM3WeDoX28t3yHkGHQ92JJ9N73R45ZS7sjWvVLpZ7B/Zo?=
 =?us-ascii?Q?eemgChx/X9t2JcL4JZwRq4q80LTn4MoFeLRHn1qru+HhQWYAtLEWVXXXOHM1?=
 =?us-ascii?Q?MQwIFOOD5g+Rsg2Hq5z0vwedOxgSvGRKj8o5mgJDp9rfmezJwVWkpoRf3BCQ?=
 =?us-ascii?Q?Qp9xVNIn02JJfB8GBEFziQQTKT8cuO4fusooveQX3Bj+gNwhbAB6VHMXBUE7?=
 =?us-ascii?Q?HcqVG2eHWtrNkCtoJcbMxX7KqI6snUx/Kn3cZBXNF+5j9OKaolasyunJE8dh?=
 =?us-ascii?Q?VCqaV1Cq6MtJw3hhvP41liuOHJPlNyHsMY/2ye5HSdNukyFlroshrK6IrNLQ?=
 =?us-ascii?Q?Qlos4+XDE4pCUvyP/FiFiSTeET7FIG/9ulTklnl+Z88q6x7Y66Cd986PZXT3?=
 =?us-ascii?Q?mzPu+PB65g9TjTVzKZxKlO5ZBDqswt/kvvZUWuuSWnF3rj7kywCpGlG1pdgq?=
 =?us-ascii?Q?azKt4ZsVEy7f5YPsYWuRuPnKR7MKG5H+fejS2PWhbADNvmIDy3khE2DcNyYj?=
 =?us-ascii?Q?p5jnw/WEB/kQlJoM2fPC0X3a672LQ/zZcFkB7s/KYeErNCKHtrKhB4lDOFIk?=
 =?us-ascii?Q?A5inC0cjYSGEkRTRirgjkdDioaSt1mh+MxAqiOSMhIPv0GHE6uQlUvr5MlRP?=
 =?us-ascii?Q?baZLIlobQuF7gJa8Cr4KTCbf7lpi8SU4LpMn0W8J+HizqqmNZ9DJsKd2EKpj?=
 =?us-ascii?Q?aS/Iagc0aqT5hFqbuPZddkMMZLAkvefkLoN9m/IagJNJ6LAWcIXbDxZ0ttkV?=
 =?us-ascii?Q?0XSy6Vxhq0B9sW1ofVmwEPCqVVsdicoIIZ/bHxBQQS9XsYg01Iizmehy4AF6?=
 =?us-ascii?Q?s/6GalXE9tXHcfiuSxh4cJYtWmbjUv6JFoOUAWe3MuIBpZtdEFMZX3Uc9BSx?=
 =?us-ascii?Q?z9GroWZD2YIrj/d1uXfo/iHwxb4FmyLT7rA2VOaEHHiFCjkWjRpjZRU1m6zj?=
 =?us-ascii?Q?VixOyrd6GC+XTIYZLzRUDswn89Bd3rs25Cp+OmIonqEjcUfxtq2klpDmdgo7?=
 =?us-ascii?Q?fZutedpC/XlriPeFLMTAq6/ml5ZvZ2fM2ltpTECGVlFr48CT02FXI0Od5WMe?=
 =?us-ascii?Q?ONNapA98UeGMIaSPyTTap5trekcSBAu0cVGIXHVVN2T3bmIz7+Brq+G80yOa?=
 =?us-ascii?Q?wJy04Drw37F/A/U30RLlMws5o86qrO0CYBTgUMjZtqSle1T5n6ezE9HC/PH/?=
 =?us-ascii?Q?cf4PBK9WNK+S6teyLYl3isGOQd//594BV5CpGZobI5OghYD6CyIH1eX5lxl7?=
 =?us-ascii?Q?05F5whZ4iQkRZ8k3LcmCwl01Uw8MJPSirbPBbWl87VDpSkVP7XpOsUbg6huc?=
 =?us-ascii?Q?ZIMP/qBACvwgLfXDoeRK6BkOCD4mfUfP146wQuldDPpo320Gvm7VBrQbJk4b?=
 =?us-ascii?Q?aW15YN9SLZI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8422.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?m6o+mGKLavsAcj2cQ7DqjG1k3BCsP/RHIK0VVcegrm+V//I621la3phSr3Sf?=
 =?us-ascii?Q?aOd2DhC5RX8Bz9tJdm3a0oY1nIZ9RJn6uRng1jeZZ9Q9s6oLTJqjjS02xbVa?=
 =?us-ascii?Q?yuvMX+bksrWLxxu9hmT2DsvRhOvQLOI1lI2juC5kpsvBkqe3kVARPpOy+byH?=
 =?us-ascii?Q?eUOdqAtMfS4yqTHhOWag5dbyD6LCSNmWMaKtCT8SIS3c2HgYHCGY0+zjHadu?=
 =?us-ascii?Q?0K7A4UHUS84p9ltavkRSknVDYKBETq2a91F/FAscJCEmcdRHlEFVEbPuDu9I?=
 =?us-ascii?Q?c76+nU6LJ4zxuGAYh2tP3sI5cDVq7VUKgXJpc5BmE/Qz2QcP1RGxlSlzxHcU?=
 =?us-ascii?Q?+zpNZ3UZ5/vLar/eXctiHxaLYmDrshsc9ILKlDn+VTH6JJ0w1QYMClsc3y4X?=
 =?us-ascii?Q?ZIK7nUjULo7WBoTM3YNAhXyBujxtTcqt10Gj1vTj7kIyk9Zfu9glbs4SeHry?=
 =?us-ascii?Q?mQhXdCUW59KdDCs6A41o+RdPKvbRItTDyBrPJwxJMrB7cqZ8Q9/nZx5oan5V?=
 =?us-ascii?Q?l5hn7t2WrniiUN4UQeZUggh4SERw/UsIH49oBPAaxh/UpFfmW8C3Joj0c+b4?=
 =?us-ascii?Q?0/XpSOF3/zj7yEElfEcDPKMNryAwR8FHz0HW63RBXQ14LZgMtXcHttnsfnSO?=
 =?us-ascii?Q?K09Fnbb56VQr7+iDmeso5LXFpmdjGxrF50DGSDuAD5TpiVpkopqPVvYHVxLL?=
 =?us-ascii?Q?hNd5PtASoDPNT+hOtxofsphd8aQ0hdsx8wKoASd44Yis61FqBXENrqAlOx7L?=
 =?us-ascii?Q?Q6QTbMGALwIVr+Pn4OGb42ZvQJSM7eEjpM8f36zTefuVtuTS5rxTmitTRFQq?=
 =?us-ascii?Q?55v3Es0EKSrvriwKTEUdO4k4POCkMlV4H/kg6/WKvwlp+dCJkcxJX2+U5gC6?=
 =?us-ascii?Q?dZ0duDh1w9cmEdyoRHG2ndXdpbKLzBYGcNSPoVLpRuHB0GmUyeJpCMRGSekx?=
 =?us-ascii?Q?FUPWRoWpPZhUeuuZKo5T3yJJZeiHiNwIO6Bntrcto25SmuSD1HaZmmkqGwIb?=
 =?us-ascii?Q?xwS521OTM6hlYn6w+f67twh2GOArDOXsf3uGaEfAzkvYwzo497UEseX+trpw?=
 =?us-ascii?Q?BYH+Abjem45wvj8ep8T8KUEqZanbuhuiAe+pDQsN8K6R1jlbzTafd1BgPo3F?=
 =?us-ascii?Q?f3ClNt2NOpmybqz9VEtBFE4jfcc6N1tgn2KujnCGhDCL3P1BXwB9CVaDhRXg?=
 =?us-ascii?Q?HZy/pSJQEg6iMy41OfTcPvTK1zui71xpiR0k2P8lb8CJgJ9SATjrcMy+cVHx?=
 =?us-ascii?Q?BIlySycK4iVC37DtgBhPAz8mlGAoZC7a3rEIzcA7cmFLhiop6jCBT/w2QnSj?=
 =?us-ascii?Q?awXAGvaJNb9/2XINCY9aNcKv9E0bZq6qLVT1V1cOPPpb0Y61Jp2p+OsXHi3g?=
 =?us-ascii?Q?Rmblnh+lFUZdY126gvsqpl/HqqBmAO2aGRmnobFYhtlGSYUPdvpbGUuxMzHo?=
 =?us-ascii?Q?OcBgEH4sV8BR44wi3TQ3bGEByEGA3gL0rGLb7fcoZ6/oSsCGV3p1LVD586Z4?=
 =?us-ascii?Q?qqGddeWNjmdK7p5a6sXKAvvX8R8QLIOejbiE3AUCC6nOzckn4jed13iNRL/3?=
 =?us-ascii?Q?U7EB4m5VtpLhQnF0Gwjo/1NnYrKwwg1Om8Q4p6X0?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bdc3f33-1848-4009-62b2-08dd98752cb9
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8422.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 14:38:38.6605
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GHDpAd5J2wZwgOMvt5wJgJ26vUoPG8ucRm3fXKZoX0lHzHLKe04ucv2U5XbcTnSHSwby2Hujjz+fOoP9VTNx2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8531

strscpy() is used in this driver with char[] struct member destinations,
so it is possible to use the simplified two-argument variant which was
added by commit e6584c3964f2 ("string: Allow 2-argument strscpy()").

Signed-off-by: Daniel Dadap <ddadap@nvidia.com>
---
 sound/pci/hda/hda_tegra.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/pci/hda/hda_tegra.c b/sound/pci/hda/hda_tegra.c
index a590d431c5ff..c23da6ebef50 100644
--- a/sound/pci/hda/hda_tegra.c
+++ b/sound/pci/hda/hda_tegra.c
@@ -377,14 +377,14 @@ static int hda_tegra_first_init(struct azx *chip, struct platform_device *pdev)
 	}
 
 	/* driver name */
-	strscpy(card->driver, drv_name, sizeof(card->driver));
+	strscpy(card->driver, drv_name);
 	/* shortname for card */
 	sname = of_get_property(np, "nvidia,model", NULL);
 	if (!sname)
 		sname = drv_name;
 	if (strlen(sname) > sizeof(card->shortname))
 		dev_info(card->dev, "truncating shortname for card\n");
-	strscpy(card->shortname, sname, sizeof(card->shortname));
+	strscpy(card->shortname, sname);
 
 	/* longname for card */
 	snprintf(card->longname, sizeof(card->longname),
-- 
2.39.5

