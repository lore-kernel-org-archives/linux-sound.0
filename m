Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013035.outbound.protection.outlook.com [52.101.72.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B87811F5834;
	Mon, 29 Dec 2025 11:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767007385; cv=fail; b=diXoH3+YyElqr+e9vsZwk1peLES9nAtZdb3NGS9gYBJ71cipqsrJw6x7yLBUS8qNug08y/6HCKv1GtO/R0UlpX4sJRQ6FVc6qO/W1VXTW3fFOW5Rt8KFGTwqijwmbnBTQw880YndoEJyO78lu5CDrpUAdbxTy/tHbbfTV3e5uMA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767007385; c=relaxed/simple;
	bh=M0A6AM1eETvdh7xsX6KGrg+d1+9Xwlia68upELDwXqc=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=L9cf0GtP+tZrjVbjKMXk4SVz12jW1Iynj4NhfNfcqMBVVBVLo6NZGqiym8ulESWZEs3CUEef0nxyFRpBQi7PkFvMThBsDWySnEwd2a9w8S2Znen6uCHnYPz2wEMPuTsjtmfmsjy8WUUfUA2GfUuzycKHW8GEA4C4Tjc3OE3fPTY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=dsuX2h1O; arc=fail smtp.client-ip=52.101.72.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="dsuX2h1O"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QcpY7wDVmFF7b6BWipznFCGA+nwgMZU1QriSJplm5gjBGg0d04heX7L7md45Nr7cFMgOhPACx/CtDhRnEpEDHEJx0tqY9rlr5oWoo5xMMAsnRur4dQWQNqbRb0q5qyz2J2hkxYtS0Ikpll2LXk/3U+kLzOB6ooqyeR1fVCe1mexWolhGNPacvueCZYTmUlDCVmGWPoUqitIuEpQpkc6es+uYzFRyAzcrsWjt1mSl5hSLAadKsajk4T9mz+8PA4hXQaqDov6GSQB/1FRxlkxrJiD6ngCzb8ooWcrg7Kk5enjjsL73dmK1afk05HUgZIjFaiKxS2Xh3UWcCz8vJ6d7lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qUnqoaMoOuAh/wuQwfRre3wiCu2htNKUp7Ou/N4SvJY=;
 b=uEcNUkuwGNtR2uIzLhCcFGVtZcZp5FVLjWwmGXP9er0v88T+kID5TrRVLtmEAWBjA8EhyPGzFMlYmVbmBmKJLpwXcWqzfrEm9BeAUPoCCGLm5MWyG+2I6Jd1c4T936AkLsP/GnR3meggy6CRxFGTkhe0IDfDTd9fhDzSN8kzN5ox0taIo6W/YYc++7RfzJgmFrj3mNuae2R8jwYEoEM7p+dlpgOKo0lGAG6wfV/lqOtSZ9CboBJ9GdZkwv/GGRBKjUFJRgKNihidqZI6xUp0B2BzTUqfCpNxYzAM7Z6tVXPtoD47koaaJW/LwYmDzgx5jJzUF6eilrgc5sJPKwfg3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qUnqoaMoOuAh/wuQwfRre3wiCu2htNKUp7Ou/N4SvJY=;
 b=dsuX2h1OETA4oqC5IetjQXfSRL0gFsoHLRCOuqoEegYmLCk5UIVNf91iIOCE90MxcoWBg47wrlqq7JoAbpleHRd5EtgNiiGzkPAQfcBFEfQVrGRhchHL1UrR3GnCCnMDYPommVE56HYXR5AL4jlSLvf87b/C1LvIOIKTKQcrUkGOBYF5A2QiwtueNydPSvGEkU4m61n1quF7eQbIjQ6gIfGRm3YI5JHsTmJ+41dxoTz2/+ulkwzjRPpYBQV8Cu3+hFxyUVmWHavKdzdTYMVR3/mqixYIDM4Iuj6DRhL5K/KzTIGyUeIu3kgQ3kpCCVFwE/Z/sOXptg0PpVPEBWVmUg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by DU4PR04MB10959.eurprd04.prod.outlook.com (2603:10a6:10:586::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Mon, 29 Dec
 2025 11:23:00 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b%7]) with mapi id 15.20.9456.013; Mon, 29 Dec 2025
 11:23:00 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: broonie@kernel.org,
	kuninori.morimoto.gx@renesas.com,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 0/2] ASoC: simple-card: add 'hp-pin-name-headphone' property
Date: Mon, 29 Dec 2025 19:18:37 +0800
Message-Id: <20251229111839.4009517-1-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0039.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::16) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|DU4PR04MB10959:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e6d44bf-3818-4ad5-175d-08de46cc9fdf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|366016|376014|19092799006|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?AcMUr/MXDSHGuoUqRWlbOLEu52zYinQ/x/gZzfRRxe48Q6vxHXm9H/zBfLM9?=
 =?us-ascii?Q?o55AR704ofk70ZiZ+LqjmcPZ6/3E7kTywxao2K3GzF1d0fhA4VBKzJP1ysat?=
 =?us-ascii?Q?4Y3z3KKTdp0zI9QTOiIJWEXFhC2/orW/Js3mOSd/cF22x7pnDwqUHr3I72if?=
 =?us-ascii?Q?P6MAJEaVGG+Es1qC96yG4wDnBZC16C0/zN11QYgV9DkZzPcOuf10su6/IpA5?=
 =?us-ascii?Q?y7ENg6VYtK39z+nLBgAiJZgUsze4z9L09H4BDhAnLEKBYuXHZLlx3mU+Pif9?=
 =?us-ascii?Q?Gr3qZga06BujYB4I8HvMoF+fFaw/4FAsgrv6+rqVGwNbYXcsZIqeRjEcUKXM?=
 =?us-ascii?Q?SaaOn/DGPK/wSvOeAAX2Uf6BiZXXT2qoEGjTOncL1d1ISr0rUUW6JWUG27Nj?=
 =?us-ascii?Q?EsWT6E6OFR2dPTsVoBtD9fbXDqBeZKwtqRaghfpyp3jUJ5YCk/Fbcvf9Ftci?=
 =?us-ascii?Q?TAVyF1MGEoJStLO7GteZsm6HkINpo9JAQ1iiMkS/NgyIvcezlU2sd2Rgjk1R?=
 =?us-ascii?Q?Hw9C5UO01B2W0AddL6oxx4jXU2I+Y5tfA1/r+LlRIenATddaBUfm9EhfOKlk?=
 =?us-ascii?Q?COH8vwTMXEuBNXi5bW3xPiZ+id6+7POQMayOCSO7UK2ryjEzEUHCqPp7rNMh?=
 =?us-ascii?Q?LNnD9H+Ym/05TTf2EQ7NpvZawBFHopjVz+O9HeVcmq+9REzm0iOi19eA7HC1?=
 =?us-ascii?Q?R/F8GAsAfY58qDQeKPR+n4z/uGZ00hI54lh/VCIj0tMUJUgGdVf5dr5wjFWf?=
 =?us-ascii?Q?QPOquTOM5AwJJlXElZSihtN2p0dIlRSfcjnK6o5Puhiw4DOsv4ZWrW8sWk36?=
 =?us-ascii?Q?N7EnFBEqZ8WFUd1TNOHaEx1OvkMLa7nJgde49u8gvDuXXDL8OR8Xb1xRTv73?=
 =?us-ascii?Q?pgZo5bc3c4yzK/hXsWtvamFrEQTcFyLrVffhp9XuO8lobhzXgmC5cOf+Sjxf?=
 =?us-ascii?Q?UCWxFfSVqTBElGKn2a8sqVDMQGy7LxNIj4z9Y3atkDOfnbRDeNfkY3qwKf7k?=
 =?us-ascii?Q?dbafdq+cU17KKxWccbcvgp0dB4azp1jrb6EIGoZOPIulndQwifwLVr+3EfEU?=
 =?us-ascii?Q?xaD9HuC8bBDvd5Xp6sWMzWla5cguf8UhPsiy56vdiekhlJPt4J/avP43L3d9?=
 =?us-ascii?Q?LdeNVbJDEpLabrqMyUKvZ5Sk85ZHmP37QpQrnr01wfgSngAXrOloLfHnOTZy?=
 =?us-ascii?Q?f/36UKrxdSRZNDWEMe/jLaAC0icfgCfpzefi1WFQNZtdS5AqR49hjI+oUq2v?=
 =?us-ascii?Q?yFzPpqicojQHkNpKoCpV7gx7WbP0Xyem6lnHd2BageXVXSyGI2eWzAVuldaA?=
 =?us-ascii?Q?Ni1o/MOMITuKe5f8rEBOO3DRz1bi2bKyK/GuBz9P+3WKZxrC8dNfETBt9kbb?=
 =?us-ascii?Q?oPGTL/x9Kcib3lmDi8HDjTecAvbHsboyR8StK/XlwtHhxFVlaEBXUava03jy?=
 =?us-ascii?Q?JHQsZcWQ9iK4UAutjXy4JxL04PRsb+pngiUWXcf6Yxa1GkNpONU7GLTqhTgg?=
 =?us-ascii?Q?uS+tRzUtzK2TRByrqWIOE6lORxPZdg+WwDmNFKEbiZ3F/MzQB3PS+AeKXw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(366016)(376014)(19092799006)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?y59ULVPq1L2Ol79muSMETYVVbBOCQgbssHMSynRMu8QxGqCIoeABgM9StB0R?=
 =?us-ascii?Q?A2kMYCmDaJtHZLgKjDEVNLp78agY2mL334jfab92QaENoJX2fiiQZJeUbw8D?=
 =?us-ascii?Q?V+ea6Sn8oHgE0DH3WSflnG6MpcRMxGOgEBa1341H1sjardBbrI23IcTK9FHQ?=
 =?us-ascii?Q?aZxU8G8M92NrkQPTL0jV427zmbgmavL1uPra/156bMs99zHIhn+vNOCVeTcv?=
 =?us-ascii?Q?nEt2ZmtSBW3QbxbpJcWk96x9qIqz4MwkdES9I82ribtbeO3c8To2czeOB/4t?=
 =?us-ascii?Q?BVfvx2utSqmN1TCo4H2qUm3p1lkOEh7q+CaDZ8lkDf+dRboRIKS5RYYH4HsQ?=
 =?us-ascii?Q?mp3szaPY3H4549ULLmBnxJnK6i+Vs0m7Adzm4M6epx+LBr1em+TtPEqb9j15?=
 =?us-ascii?Q?2yVILiPcV39+kG6TjMyfQSMn9s43DI2NpV7ymCsnigd7MZrSaCGVgq2A5Bpa?=
 =?us-ascii?Q?XhvMypghN6O2nXjOCwmGwJ/pRtIsBvWgNhL0V/ldkHPKcuZelX7Nly/srOs1?=
 =?us-ascii?Q?FKntWFdmbXbfsC4XGTJkSqtunngL5qhJItQGC5uEmPGYHOcV/vcx3F/O1Ff5?=
 =?us-ascii?Q?ApbsUSDAUOK7BvyABGy5C21YBQTLrQZj1vM2tYaLNOW8I0ZVBpR6KDArE1YE?=
 =?us-ascii?Q?PlcL44epkjgc6H7ajmTYdWu5Te2tubrlMjXbT9s0C6GKZy4GPNsTX6pxMtdJ?=
 =?us-ascii?Q?bwhMIdJ9+xLN3+949wRHjkqvEPcHmWLUPNpMrYgwAaatCez+R3PqHlRHG/qw?=
 =?us-ascii?Q?ju3J/I1yFZ+F7DYUj8w5EYuP+Rb2TriZTCxKmsfew+96M5jjP/Pyvp+A3IS/?=
 =?us-ascii?Q?v/2Yw4DfOGNlynsmTnPQD4s023Yefq9O2WUrymgYeW3MffIK8D1b/cSUYVx0?=
 =?us-ascii?Q?4iRzaiNBqpXEqtSmuza4r0DRhR2Yfw/r7em9nxWLEb7IEcpOOas3qNfhf7kP?=
 =?us-ascii?Q?hUwyme26BsjUHiu7JS1mMrWH5Nfs6+uU6unmqRWNGicq9UMCcFEd3VYtzKHs?=
 =?us-ascii?Q?8r1MGBi3kVC+HawjOy7hnO3lj55RBGzGvMS6Cehb+wuwU0qd2fREgBt7JKZ5?=
 =?us-ascii?Q?lFe288/DPFs9D9G7NAVkrXY6kkvpVZmZ58g6XV70ulz9XcfdS7GLJ6XNqBeV?=
 =?us-ascii?Q?MRjVD+jV5JWAxcL12GVjZi9H84eMy4oQ5R0bZTQZHO4lyCbCtHmo+vqUMO2r?=
 =?us-ascii?Q?aZoVr5EWRoIzyYFOLw3uoY5gkIX5+5Ov9DMa5OlKvjSLR2sIil68HbbpSjbZ?=
 =?us-ascii?Q?ZXzqAPJ5jFUWTaCFVoEVlCU1P92sqZl53bblKOgH0G2IOSybcRWSra0sK3z8?=
 =?us-ascii?Q?wUnmveAi/4G2t/OjrWWXmW08UvPKMefZ6aqIVKBAfUlVZ2TMOH4xH1wMVf37?=
 =?us-ascii?Q?DSiGSyt4K0dg+CZt8AFqaspWBRz7GoSDj6xq6/VIBQB1RrrKRNG+G9214vtz?=
 =?us-ascii?Q?1U2SQvWUF9Hiinsnad1hwsK/2o9BWBlBC+94k1y1VDzFSbQ8nWvfwkVvpyu+?=
 =?us-ascii?Q?Yi+6oLB5XqRVaUQ/NfhENpuFXKnV91GGGBTXlFjXWKL3J4TNhqj+1KzQwerk?=
 =?us-ascii?Q?b4jv8o7nxwPM4tbyyq81vQV/CMvjH/kAdshmt7mx15vIpsllr9PyzxVFMO77?=
 =?us-ascii?Q?cc8BlbxtLb+9DBudX/ukc/k402oSxjcfsaLoe5NjKRBUAF+EyRH/XYTU6AsS?=
 =?us-ascii?Q?qZwKFynZA3YxvXEj8loUU17IngdWMOcFfplzAKZi8OjNFwWfRoEpyijb0rWF?=
 =?us-ascii?Q?03TBo+C0lw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e6d44bf-3818-4ad5-175d-08de46cc9fdf
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2025 11:23:00.5526
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /AWRakHbhFRzfi2V8YOriIY44dwZMBXEJIFD8VAQ5fKrytysKbJSZmbvnUKPztDDe+5Qj8ElzZtLHHC89nOXtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10959

The 'Headphones Jack' name used in current simple-card and audio-graph
card driver can't be recognized by user space service daemon like
pulseaudio and pipewire, which only recognize the 'Headphone Jack',
so add 'hp-pin-name-headphone' property for this case and it won't block
original use cases for 'Headphones Jack'

Shengjiu Wang (2):
  ASoC: dt-bindings: simple-card: add 'hp-pin-name-headphone' property
  ASoC: simple-card-utils: Add support of "hp-pin-name-headphone"
    property

 .../bindings/sound/audio-graph-card2.yaml     |  3 +++
 .../bindings/sound/audio-graph.yaml           |  3 +++
 .../bindings/sound/simple-card.yaml           |  3 +++
 sound/soc/generic/simple-card-utils.c         | 22 +++++++++++++++++--
 4 files changed, 29 insertions(+), 2 deletions(-)

-- 
2.34.1

