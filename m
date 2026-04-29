Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013052.outbound.protection.outlook.com [40.107.159.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D17C833B97A;
	Wed, 29 Apr 2026 09:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777456711; cv=fail; b=KvgteSisf9IWm78vmR8I0NZM4Ft4suB/dhM94Id3vvRozTRvHsYk6xUMQb/nfX4GV3jBtQYJHEC96FXyjOGqTeS5Y6e5AaAvkE/cDjYCFQz2tCiObd0DQPduoFy5d2XOIGASrKujY+Gsq0/NMNscmfVBoE+YFkqE/42tDyNZHwo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777456711; c=relaxed/simple;
	bh=wgx4uAjt9/vAB543dx2VOCBK0taFLew9Mll8QcLOOMI=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=vCJUrXc5VpcDQRMHOKZDS5sqwnNtuP4km7Wc2YYBUftTOzdXmqAApbzITnTKJnemNOhBixHnB5/2UBh/4oySU+kTMPxWOuqMKfQzxEll+Iwe/HB1BDlsOYgRX1/OmCgFkv+Y3jvVmDFEISEMvLgQBTNDUWxaO32d+QwBBQL6iAk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=GpLTWPoL; arc=fail smtp.client-ip=40.107.159.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="GpLTWPoL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CcmnyBm8sc35pBjlqsv7CFnCunQTv6k/xJH8pryyqFPlRxL7EqNGuqT2n7JjBymefu2nGG5PtmDhEu4M2CeaAKdkoPoRFS1EaJ34k0Y1WD6CIl5nN5C1Air3aB8Fq4iR2aZC33xoo/3gYYeqY2zN67NYFIUx+MGn0dqDl1Bt7kye98ADypR9daccjWAvb2HBpD8SZUGJJtNRKbfNbSxM59w56a+DfZ/GqBKYzg1wtz6oeOKy89Xq4N2cFHLmUD6BTRgOYTKoWiv0t9mxzWg0fnBz1m3/k10au++n8B4sA4sPeO1OtDKtHvJv/kSoLAbIbVxUvXtgaspNZOuwuUt5eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tRX3/UDPpCV37UoQdRe0cQoKbAmw62tB4pR7VSu4JNE=;
 b=x2nYTHphRQeAq7n6tBC9TWLqcj2avvqIgxIJoGFa+JpOZysaxg1coulHF82JUkcDrMU4uwyTXu0s/+igkqVhbd23IC7U6hoRRMXtglskFWSS+Z0csQMTz0bwh2hGHSPVpnwevu9I6NT26tHEkA1KFf/GTRwPqQ5w2Wf14gWfbhZFDxkoAA/1VUvQFuhYvqfRn7RmZTPjFKtZfZcLSBrEO6E3Mo2lhqfV8FeF0sKaHU270YHCg5uPfIb0t77OfTJWC+uYiznLjZBeMiCQEQ1Pt6/6Ddjn3iH+XbUmO7TlDTN4vzCpQClx3dQk4vKuEXucwLVIG0CuXYjBjgHlPJfu1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tRX3/UDPpCV37UoQdRe0cQoKbAmw62tB4pR7VSu4JNE=;
 b=GpLTWPoLYelY05j6dDiFtKDSCdPPvE/c4RBINobFHmZyETxa823smDRbUP55hW3c2UgJNWMMtIFdrD0GnnQwEyVM529BNVngr5sqrWlh6J3eD7to+6KIleE1SBJMU14XTNhJmuzM/NW+VRupfaQ4S0J5kc5WkWZZ2vjkJwjjjdK566O1EV3/Le7r7cpTkOyYHV5SmcNvM0lJCza1Kv8h+zZLwm6b+hnW5NxLWRNlHwAaXdGddzZVnEQpXBkiNFwlmymu/5KcjloC4hFbLMa48mHK5wD4WtX16RNfBCVE6RLbSQ6iFT6/41XMnSe+KAPuPtuUDVLlPULefASXt9vZsQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by PAXPR04MB8269.eurprd04.prod.outlook.com (2603:10a6:102:1c4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.19; Wed, 29 Apr
 2026 09:58:26 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b%4]) with mapi id 15.20.9846.025; Wed, 29 Apr 2026
 09:58:26 +0000
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
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/5] ASoC: fsl-asoc-card: Add some improvements
Date: Wed, 29 Apr 2026 18:00:22 +0800
Message-Id: <20260429100028.2739711-1-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2P153CA0005.APCP153.PROD.OUTLOOK.COM (2603:1096::15) To
 AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|PAXPR04MB8269:EE_
X-MS-Office365-Filtering-Correlation-Id: 0de8a985-ef2b-4fd0-890d-08dea5d5db91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|376014|52116014|7416014|1800799024|56012099003|18002099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	BLpAPS3O4Eb8+5Ta6PX7/m/TGCQ3nGG+gejot4cnrrr7InYIJQWVe1/aNCp94XvTn8H4lKpijz6DquEkOqd153acL4Vmq2DQ1zEA7MtK8wIw6uZbAb3wzxtPxl4T58g+b4wXq5HBpNZ8gUeOMYVFOOg4KYhC0GZY/5GreVFCNz+kpkdxcubW13g3jQkm9v7Uy/d+5fMIj+0sL73iylZm6yO7kwFwulvKr58pKZCE5cgMsRh5KHu2diOZllNEbwMtC9xm4BMWNcPBu03/skeLxLK3bHFkt+ZHvKLf2EQ1stpWyHoHaN7Uikfl0a3uhNhS2nGnL9QZ7O3VygKDyyfd5T2r1c1PPUpQWL98N3uI2GrwJ72GjqgNq6MMvLtqChlLANzXwTdBd8buqRcS2E5sM7usioEyVtW8XFfx8UI3RjV4qSo+0Dzeg6E5fTvSocn4bmUhyHlPwgISDLMNEKvTILf5sHVt2X1e+LbqPsUPJqeV4DsKB/i3TmSMd1nfL555sTCUE1/RPZwX5TTeM7SbuXzD80kAyh3igNQ76H5OMsGuHTR9+dHjZmjmxj7sbqGrw6VHYn9dpanGlZ41DT0e9qmZgLve4pR8275FOVhntNRDN3kpPFm4BC/F0bXs9jIvGJYhyz/DxBujvT9Niu2f1mi+4LW02n7QqlaU27K6BGaEKq+on4erZ15ZEWxRjM808yRpK8pVpShX9DWxtBGjCKZGw+qLD52k3gB/NruQAlunauUP8ECtM8+bPDvmTbs1nHwVQGZjCrGgSL7vLmuhvS2/so7PyZe/oEg4i3IQt+ty6J85kgeCg5OqbfE7WdDH
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(52116014)(7416014)(1800799024)(56012099003)(18002099003)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NzFEVS9mWU1GMHlVZVpKbFFvc1VyOTA3UVpORkRNcUZmeUFLYUxHYVFLdktZ?=
 =?utf-8?B?a3hJS01RZWRJMXI4MXFJTENCSG9JWlQ2YURWWE5mMTJCTk5OKzZ0eFZyclZZ?=
 =?utf-8?B?dlNVYXMrb01qbVZQNVVzanpNMWdjMzN3dWxmcEhZcnpyY2Q3VEROUWlUZkRS?=
 =?utf-8?B?Nk96UEtPOHIwODZXeHNpUTRTaVN6bk5wM0ZuQzhDVUJGMUxEalFma3FhUU8y?=
 =?utf-8?B?enBIbENnOERrYkd3b2QwQUhSNXRjK2tEM0o3RnZESTZ5Ym5wSzFHZkJVbUhZ?=
 =?utf-8?B?Y29LYzBvLzJjUkN0Y0lLSGlVRXcwajg0NGpOVFhqQk14em9ZNGRCTnFENHln?=
 =?utf-8?B?cU9MMEJoaVJlZmk2dWxuUzZCQ1RiamthRnNWMTRaU1YyTWNBMkNFazZMYTFU?=
 =?utf-8?B?VmNkOVVFa1dVRjQxQlRJZWZUNGJ1Q3IxQVBNanp2ZlNkZ1VCSUlHVUc1MFRm?=
 =?utf-8?B?ejUvak55djY4MTR2cElHUmtld1hva0VFV3lBa2JFdmhOMG0raHBQMjQ3N0Ev?=
 =?utf-8?B?TWEyZzZCQkk0WFNwVTNodHMyc1QvVm40YUdJRFJVWTBQRGtzUGx4N2xJNjRQ?=
 =?utf-8?B?OTZ1RjIxMUpQSDYxdFJPclUxd3RHSHQvRGYvYUszWlZsM2NDUXllUjZWMVgx?=
 =?utf-8?B?QWtSU29aN01oSzRpZlAvQkF2LzlSMkoveWFOOFpxajZpKzNSTzUxTkcvUjZY?=
 =?utf-8?B?UjU0SkM4RW1DY1A0cml2NFdxdE1hQzVPWW1FemxFd0RFRnBTUzFaUmpKanNo?=
 =?utf-8?B?eDNBRTVXcnlZZWJmaXpSdW1mOWErRy8rMEwrWGxsdVFaeWdGVGRMUjJBRUpu?=
 =?utf-8?B?cjNBNlZ2SWNMRWRnY09PbVpPeGRiREF4TzVWMmR3SzNQVS84ZWpESWRwWnZC?=
 =?utf-8?B?QktRbU1GMFlTRmQwUmFuNWpLTzEydFNCaDdZakdUSmdVSWYwUTNLVzFaSVdU?=
 =?utf-8?B?akNSQ1dnNGJKWlpNRWJYN2V5dWN4ZVYvaWVveVlCaGl1Y01mWWVTSExlQlJF?=
 =?utf-8?B?VkxXbEdnUkhmRzNjeHZaZFMvMkloRE1RRFJ3NWR3YUszNHZzVzNMa04wL3R4?=
 =?utf-8?B?MXJxaERzYmd5a3dxV0VIT0dzVm1rdEpIK1RtOXl4WW5ydk82Z1FMRDZTeERI?=
 =?utf-8?B?RTBWbDFxcnZvdlhvZUpqOHU3bXdIVFQzUi9XSUFSeVFYd0wyUmZNTlhkTm53?=
 =?utf-8?B?K0c5RDMrKzFyZHZUY2RNMmVXbjJ5bDdaVDlUZThRZ2QxNHhxYU9DTGZUOE1O?=
 =?utf-8?B?bENLSG9UM0VzOEtYZXlKS05zNmVIUDMyVWdoNkNUZCtlajVXZEJGTWZYbGVT?=
 =?utf-8?B?UE1WQ0VodDBWallQUHhHN1ZlaFN6MjlvN0ZlTDZLUFhsZ0R1aXpmU2R2bDQ4?=
 =?utf-8?B?TFpNYUdMOFFQTjlBTmNkNkREVWExRld5ZThmN0dTV2FLMEtOVE1KMFdnak1X?=
 =?utf-8?B?cUxhcGp2UFVkUlRxNEFEUENTZS9RaUxHcTY3S3oxN1FQUjRWSVh0V3ZWYVBl?=
 =?utf-8?B?c242NW13ZWRSZ3Bpd1NIeE5LR1dMQ0dsMWU0UzNaK0JIcVZMc3hoeFZRK2ZB?=
 =?utf-8?B?QmxGTGNudkx1TEtCYTU1M3EzY25QYmNhaG9FZTcrOGJvVnNFcVVUSkw0cEIz?=
 =?utf-8?B?N2YyODZqUUFOL1dXaEJORkpFQnVSano2N1UxdGlCRk5EZm9JNkhteGpOQ291?=
 =?utf-8?B?T1phcUFNT0QrZEc4bUFsTHZ2c0tPbjB2bksrZ2lacVRtbFlDbUNEUmJqRlp3?=
 =?utf-8?B?MDFhblliRWo2QnpNekFsTTV4VTd5Y3UrSVh6SktOZFhjTHNXVVozVFhTclMx?=
 =?utf-8?B?b2xjejM1Y3N1N1RZQzVIRGp3bUd0SkdvV3NNUlR6YkFsS05Wa1lBdW5HWkVT?=
 =?utf-8?B?RjJzaHpLbDlTVnpFUDBzNDMxbWwzc3VWSFp3bjl1TVFGV0FNYlFZWFM0VGVM?=
 =?utf-8?B?aVZ0YlZpYWFFVmRheVR3a213dWlSdTJDSXZSVkVTM29tVDlIbHRtWVVJR3hW?=
 =?utf-8?B?YUJLUC9jNk9VMWJFc2Y5bXFnWjBYY0thOWgwdHBucXdPK0ZETS9LeDk2ckZQ?=
 =?utf-8?B?TGJVWW50Z3R6akdlZU9hMGtFYUU3ZzdRbnhzNk1kQWhnYjRlUWEyZFRSbjJn?=
 =?utf-8?B?aSt4L2J4MElVU0UxSEVZNzJKVzN0R2NEYldhMjAzOWxhOXpRM1ZoRkU5UXV6?=
 =?utf-8?B?M1pIVlhYU3dvZzN0VURuMTd0bGF4NmxDTkFIWG5xbXQ4djRhRWNmMW1vM1Ux?=
 =?utf-8?B?d0FkMExxajZYWFNjTzUyRUZ3VVQ0VFQ2VU5QdFhtcWYzTHBEQk5GQ1J2ZWNu?=
 =?utf-8?B?U00xNkQ2QlZzb2dyQ21LVHhqSDY2cGZ5bmhzb1FRaGw0YmJBdUR0Zz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0de8a985-ef2b-4fd0-890d-08dea5d5db91
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 09:58:26.5304
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dWyczq+OEuHgWEMBf6SpsIoJOseu0JZ2udVZgNUnGhL7GhCNipiVtojlOgTIXFugL8R5D2BAEftYkiAuj2TUcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8269

This patch series addresses several issues in the Freescale Generic ASoC
Sound Card driver related to hardware limitations, DPCM path switching,
and codec-specific constraints.

The fsl-asoc-card driver provides a generic machine driver for i.MX SoCs,
supporting various codecs and optional ASRC (Asynchronous Sample Rate
Converter) for sample rate conversion. During testing several issues were
identified:

1. Missing channel constraint propagation in DPCM mode
2. DPCM path switching causing audio dropouts
3. Hardware channel alignment requirements
4. Clock generation limitations preventing certain audio formats
5. Codec-specific PLL frequency violations

changes in v2:
- Patch 3/5: remove the static constraint_rates and constraint_channels
  variable in fsl_asoc_card_startup(), move them to
  struct fsl_asoc_card_priv, to avoid conflict with other instance
- Patch 4/5: make exclude S20_3LE format specific to WM8960/WM8962 + SAI
  case, to avoid impact to other users.

Shengjiu Wang (5):
  ASoC: fsl-asoc-card: enable dpcm_merged_chan flag for ASRC frontend
  ASoC: fsl-asoc-card: enable ignore_pmdown_time for ASRC case
  ASoC: fsl-asoc-card: add channel and rate constraints for CS42888
  ASoC: fsl-asoc-card: exclude S20_3LE format for WM8960/WM8962 + SAI
  ASoC: fsl-asoc-card: reduce WM8904 PLL ratio to meet frequency limit

 sound/soc/fsl/fsl-asoc-card.c | 111 +++++++++++++++++++++++++++++++++-
 1 file changed, 110 insertions(+), 1 deletion(-)

-- 
2.34.1

