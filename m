Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2089.outbound.protection.outlook.com [40.107.241.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF2B1CEACD;
	Tue, 14 Jan 2025 10:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736850492; cv=fail; b=bphRj2CjJCpnMd5XyqxQVZXELmVtOpCRlOEXmaBnrqpCyQZuIhavlzndvbwzzf0biKQML0wKT1C0iUocII+OpzDOkHsJVbEwlvquPrpoLL23u5yE/GYLjPW9bi9bZU2GNsaRQHjRfLDN4kUmnEb/fSUdGhunX/kk0ivPONo3Lmo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736850492; c=relaxed/simple;
	bh=/SQsZeD+HqS592/n9YY7B5A3LYnFgKZbJAjpWp+Ih/4=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=FPAi9kxwcXl6oQsTe4hbs8ERIEUy9BRATOiVyqLplpUPyyotaDkq3EIDRAJWEcBHqvjdsMnRhsICSeKT6ywo98cl4qh+GAq5AwOytOwOi+G/aOK0uxOLZwmYZDdMfPJkW5vn1YN0upDK/zGp2NzHODIjviVlRC5sNNaE3NQdFDc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=cg1sQLLY; arc=fail smtp.client-ip=40.107.241.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="cg1sQLLY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PByh9HBSI18f2hThFuBO+iDmplatyqj5qzb5PPbJt6mQYctpl7ceYlcynNVZ+ncMWZBipgGzqPCCtM+DBI+IQw4QrezdqdW3WXojwexacNgFNFw/GWC+m6R0gZV0xMW6apiqbO+ngvHmawQP1SoechB5Lv4dDCt8GJtcRlenesUFhGMg8j8i/qAhjiCh/Hk1frar9pKXv+yxbmXsmXV75Vgrd9+xEyR7h+bFH16A7RnJBIoZ2j+OAdB1T+Zcxnp823rxRl8rF/4Qf3hgGSTv+K5iMAI93Fsk5xqKArKwwe9BbKIaa3ub+0t3dUlvn8llVjCJbUkX+7NNoRwT4WI7vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m7cL5AL8f7oK8vyasAK+iO0ScwK6p5FncwNN4uEMCGs=;
 b=yZEzU64SGv9FhQWeDwUytbtnZhpjPdw3Okxxm896I4+1GONWhDHE4jsVTCm80VwsBzE1xv4gADw3D+tyJGdyR1p91nHVRxFmMPiqHIqnbTUCfPMvF/fmtW2DYNs+Fh6ZCeHVq07SXP7Jx4iB/iXtxcE+gqSSXqhGV1jX9LrqL6OVAnLUOt1rZJlolcy1Ab8Zo5NNXbqfbuCAvXRzFo2Uo3+JNMnAEodChKMZvisYtjZzBsLaW7ZLL4cjC0dKRhVqR0rS1fLGicPpMlN/MqUcxZ48LaO3yzLqhnidi2SUxvkaJ1oBDPm+ZR3MpC59MZhO+s2V2Y6/FnkI6hNU0jtWOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m7cL5AL8f7oK8vyasAK+iO0ScwK6p5FncwNN4uEMCGs=;
 b=cg1sQLLY2Lr2E93qtVxAQW1G+JF19hP3ac3AEFpgJfk/r3QNww6NJKaWZLl7b4971bGxfx2/2IoYBE6n6JTzCbTzoD749n8OkKrhl4sc14M+Bl5UF4gsxL07+n+VZv/cnIl/9H60347sXNrGkzSDAoYiecoM3rWvXHe2pqoV1OvCqisQlITOMaJcAlmq3mnqoTSUupkEvupUEJh4TE/Owf6TysHGYY5COfFhoEYq1/9ijujBWmqYty9TDlUg0x3/bFvrKdUSpDzPrR7B61siaOLI4ozzlEkeLD16hndvxV4Ben+df6OZ3U5Qbf7FYmwz11p7E2GCOQ8b+owt4dRbVQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by AM9PR04MB8082.eurprd04.prod.outlook.com (2603:10a6:20b:3e8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Tue, 14 Jan
 2025 10:28:08 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%3]) with mapi id 15.20.8335.017; Tue, 14 Jan 2025
 10:28:07 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 0/2] ASoC: fsl: Support micfil on i.MX943
Date: Tue, 14 Jan 2025 18:27:18 +0800
Message-Id: <20250114102720.3664667-1-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0023.APCP153.PROD.OUTLOOK.COM (2603:1096:4:190::6)
 To AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|AM9PR04MB8082:EE_
X-MS-Office365-Filtering-Correlation-Id: d01e82c6-3f55-48cf-3bc0-08dd3486230d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|1800799024|376014|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OR48MKQiyAh/aK9isFIl1fotCgrR/Z0xsX/IhcjEb3TrU3FuTkfidd2PZr5i?=
 =?us-ascii?Q?94/ka6NFJhA5J4z7z3OTVNReRyOyM+TY0TI8vpFuvt1hcgUYF2DAVVSvYSVc?=
 =?us-ascii?Q?rmBQmGdeZ2roWhYbzG3HbKC8TkRpHOVNuQqVvlkuzRh8/pbjRD8mb/On1rig?=
 =?us-ascii?Q?3ShqoVtEPlo/76VmmQj2b9JMbt3B5+ljOwXk0lF+/WlEjM0VG6NaaRM8TV9g?=
 =?us-ascii?Q?+ER9n/gYuLvV366/8CZJYNZVc/bPZ8HDdBxjT+2z87IldzfFTAOiGEOR2aX6?=
 =?us-ascii?Q?6ieYDGTZC435wkRE7hjqG9SURev+Wpfk7/awhexQGUaSbi4dq2ea8Mj+ss1m?=
 =?us-ascii?Q?1Jm14+INS7e+dO9aewK1ObC4sArlK7HTkXek90ZR57qErsskOCTakqFe4Msw?=
 =?us-ascii?Q?s+P2h4AE3SnDncmgv94nX1GT8BPAWHrmKCUtNjgN24vKVAtzMbKV+0DKvfhs?=
 =?us-ascii?Q?SG1La5hEhKnwSNrmXa7ubn1re8yfbKUa2hLr/Ooczoh03rIGxXTHdbZVOzhN?=
 =?us-ascii?Q?2rsN2NgsWUpykZZ0llvlGP/W0zZ9R/0l5LnZl5PW0gX73krbP3dT5ZXW2iJE?=
 =?us-ascii?Q?nnW+/YNJJ1Hc3Rze0aleZ8bGk5qmF22VV5mLI8CPRXvsTA7xuSXPupUrtNmH?=
 =?us-ascii?Q?YRgqjJlJZMyXd4paXYP3+7oP7LyHdyY6R3frSd9GvG+Agr1cg6CZ3PQZyQJH?=
 =?us-ascii?Q?EokC3AZAdiS+elxqS4Cdt5j2arQ057LVUDfTBUhTfASJ4GbHWgWd1apPF4k+?=
 =?us-ascii?Q?GxgQTBEQmMQL94zBvzWxzeae4QDUWhknbw3ZXPj1VC/ln8rENNI3DnA+UTql?=
 =?us-ascii?Q?RappqLSjmpd4MCMGziFW5aXK7ueNY1HlSQHW5vH1+mPKhGMvMybweXDjAbEx?=
 =?us-ascii?Q?jDOGgIZQdwj2TClDD5Ie5Uxd+WN0lf3y6sJw+bSwbZDruGrGwiZVpUPfWUuT?=
 =?us-ascii?Q?//UDzyLDJsf0FjecFkx9JGqEiRc8mO8AqQMCX4bvO9/rPNMAOr2wXSKQDBve?=
 =?us-ascii?Q?8a1/2CdVnF62T692kvnFw16pZaml8cONZBRE0gY9nhI9aLjl6SdB9pCv3NvO?=
 =?us-ascii?Q?7Ffi7accJ0oTMA4NQjWoCWh+DsJPj7zHFc/oYbn4RHAWogAFx44xXysFkPij?=
 =?us-ascii?Q?K8mq6ndP1nQzCOxPErd6i8YO5NFhY61iBs1lt3O0N2HgHqyAiNDeQPAJD4KY?=
 =?us-ascii?Q?xh0n2dHwIOE3mQBoUMimSmhOu0VlEXJJ/qGefl++rAIOV/K7uwJywbPOj7ZW?=
 =?us-ascii?Q?vzMtWEYUTvbovPDl6ZIb/dR5rj9bBgW0Xzn8LiuUIQcYAj0drJz5Y4dAePfI?=
 =?us-ascii?Q?8BTP4r1cp0+1MAwg/giZwfvpOMpny5VNUlO4rhLXSpiluI1x7j0TDHEPTukE?=
 =?us-ascii?Q?K3v7GPw77XXdYL3g80E+C8PhMgKPUPFNfCOPBwzC74LDwXRyAPVaW4/HFr4I?=
 =?us-ascii?Q?rx2Nx4FXjR9rcaRLMNM6Qnf37sznisKlwZKXSwgoLT1IwZ2oCsWAyw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014)(52116014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XSZZxvBai5eB7I3EP//Ip6M/vz9RG1kq0lMX280wtU0ByWyOO+QjoqlEA3O1?=
 =?us-ascii?Q?b4NcR6eoEVd2oCrbP2IoGyw51JxfdktoOnvLNdGOZaXRGjwiQTU5mwoalfAU?=
 =?us-ascii?Q?e3yj1tnm/eI+XHl6c9UdgQiUXJaSL9zYNPvjToxDs1ZEY59bpMOmLyoxlSEb?=
 =?us-ascii?Q?xLxYcW8q6S5nV7sYJ/1DYP/0m8KT8aChlDnRUN0weUe59EGQoccdYY/TuPHc?=
 =?us-ascii?Q?DpK4/mT9VxApzH73u9sDPeMSXloCu34zxfHbfbwka19DSF5XaV+fu8kGPMVZ?=
 =?us-ascii?Q?kcgFDwjLvYXyVxhF3+n3Eu8NMjBl5L/Wq4CYrwN5QB1wZx1NpOQn9OfPPlCF?=
 =?us-ascii?Q?CGWINVa6Vb9q782Iqs47Hdj2NCjUbyKpyyty+KHn+crX5sdL1o5dduU1/o6S?=
 =?us-ascii?Q?KSrs90zm1t2NtVr1bRxSK3cFjzbtfyLG268fY61balqSROBpJnwPXbzzj57s?=
 =?us-ascii?Q?BYHK4qhEqc6/BZX4K4XkhNQgekyMbzTpHWxNzk9gWGjsyjlxjzerJKyCBoa1?=
 =?us-ascii?Q?JAwTUxHB7Nmri7S3NWiFHoNSMORXaHsn1+2ZLWAlrjDssxgNzRRQi1FHDCpE?=
 =?us-ascii?Q?Lg8d2EdQR8oIe/DpiH3ctHP3q67zw8jDx7XC+mKBGTuOAUVPc423Z15y53BL?=
 =?us-ascii?Q?77uIL725Bx4+++E4iLlTdLUMg95c2czudqW1X2majDyuS6LEYKy5wJYnayrx?=
 =?us-ascii?Q?XqnCJP1x7Ycv6YMzViqpI1Ka8SllbVQelQPFZocupm5PX7dlDXSuNI0zP856?=
 =?us-ascii?Q?bnC4dE3976+ae6Q+wLoRrnEFoAde4DkV65bUXD2FKVFZtjqEGi+IcbbKadSb?=
 =?us-ascii?Q?EsEM7ZuJwHkvBK4AXNJADqVNOlGJsyHPU6EDGMXD8LjGKsPQ4gid9aUL2xgP?=
 =?us-ascii?Q?buIkZVwY9wF2HAeAO7SMvwI3qflPjktj4Odvencr182Xx17sW6L3Us9fWHKS?=
 =?us-ascii?Q?IM6jO4C1QnYxLE+5TIsX4izDF6HhrTHTFXrb0qZxUXYuTOEdJTBfEPJNBKTx?=
 =?us-ascii?Q?cel58H00vRcFYXhzm2+lznDkYLe2G1L5Lm1O5CiCsPWWK14Ry/RfTKF/H61W?=
 =?us-ascii?Q?9ncKS9eDk3PpsgPPRXNPHjMqr88sReEMUpDxDYYUTUkKGVd6OfnaulHslsnh?=
 =?us-ascii?Q?wfHZHSpEodjJ8K6IvMoODq56550Bvt4tsf2AMUFDXTNzh+QAwzjEOw17tycg?=
 =?us-ascii?Q?lTAtKU4oN86gKl3J9MTnnkCDnNrCgmiIEz6b/MOY/i4EVfZpjpdtT/iwSWNg?=
 =?us-ascii?Q?Tjun/cmc5FQsj2AZKxg2bhDZgzQs3aElkpPeDwZOloe6kwYKXKGJ8SmTsfOj?=
 =?us-ascii?Q?/KECudSHUyVhoXsN3n7cjPIYH0nlWSHbPcoNXkLMJ62yR/jdP7/jvHC8HMWS?=
 =?us-ascii?Q?hq2sNuoAOnKMjZd7vYOe+JlSP6XSfqwHuXRcrndM6Z+d23Ni2EgggyIrFMcW?=
 =?us-ascii?Q?u+bRYuUt7nnGXEucLzAHmUzI9Fq81/Zy/4ptCp4DsrCN7OnOIL+dYh3A7yE0?=
 =?us-ascii?Q?v0WjUdfHtpvRDq6+JfPeKFP6Q1dQyoIj5xr+7kRvrvTewmy/c8QxBMPNiJzD?=
 =?us-ascii?Q?owTRYIyg4jcHmRQ9DBnuRg5zxfnZ89Y9NbmvHFTo?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d01e82c6-3f55-48cf-3bc0-08dd3486230d
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2025 10:28:07.8303
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 753V5s8mudrRjOKVQ9W5kwA/eU7P7LE8qk5AtaT3b0Vhtrj378wf33tbHh7UVL5KG9idxfEpuLjgcYmYoxwK+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8082

On i.MX943, the FIFO data address is changed and the bit width
of CICOSR is changed.
Add a new compatible string and update driver for these changes.

Shengjiu Wang (2):
  ASoC: fsl_micfil: Add i.MX943 platform support
  ASoC: dt-bindings: fsl,micfil: Add compatible string for i.MX943
    platform

 .../devicetree/bindings/sound/fsl,micfil.yaml |  1 +
 sound/soc/fsl/fsl_micfil.c                    | 98 +++++++++++++++----
 sound/soc/fsl/fsl_micfil.h                    |  2 +-
 3 files changed, 79 insertions(+), 22 deletions(-)

-- 
2.34.1

