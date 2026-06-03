Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011065.outbound.protection.outlook.com [40.107.74.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A2963932E8
	for <linux-sound@vger.kernel.org>; Wed,  3 Jun 2026 06:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780469403; cv=fail; b=BWCUHQeoYoqiUtBOHah//SmatihpTF58FtTBuJf0dEvAOrWQRV19r/XPm3pwY6KDif86SVt2eF+fCyUFrrQB+fSk1fsyORT5EL96L6vHVQErq5o3KQ0qPU7SUjh/Cm++4MgY6xg7d5X+yWM5KYyNSMHgAqdgXka8m46i9iwuG1A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780469403; c=relaxed/simple;
	bh=1muldo9z0TNMGNlDgl0BcP0ivMp+7Gfi+iWophH2RjI=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=goU5OxMYPnOzX/gwELiwl7tPfJxtRTo4PvjJx6fbeV5QVMxYZUSFQ4Qo+ZHQjXVXasM1BXPqWMG7GZetNyQAG6TjmgXktbuImPuQJmonyPq+FYuV2MNVSaPc719fgj6TTVndzKstOcSOe7uyo6uq0TQpTKRxCVPlrCYmA33XWSw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=O6Or255m; arc=fail smtp.client-ip=40.107.74.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="O6Or255m"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W703wRG4EcepjcFXYPyZ7zLf+VSJX9Gom4B8EMIX3HV3r8EsyYO1vxWekN0h0arh4dLywCkGF1eFn9vwYjhSxiVb6bB8F9pRxLYXkWV4io+yaZoOKtuQxw/VL+8qCMvcCI7JHyOV7oL6ebZSPRDMbdVo/GHtim0Ev54wbVjl1GXttXCzRLnlXnMazQuOB95BDs9sLmHlVO1A3dvi7goOM9VWfx2nh+ZDjTPTroNFAkWLx00QoU1D/U/KnUahznV8/3pxA0VGydO48cX6rjZ2CtPK4Y3lVr6M8C7v7fNfI/tzuTPBx2T7BJcX/n5XKacMz4vradzHzo9yGA3qkYgYJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9dKMPPwOWwEqgq739tjTYotGzCADJfvVOT8A4K4owBg=;
 b=I84hNpUZltwyBh8v49haumPlarMcFZeGPixXW0zEAzCsabBcvIcGTKXZsKPVnr446QqqgvgjX5OyuoKMqGaUW2JgVc/ZSGH2Ofg6k0XCwqv0o84S06lMvrCkOXU7U7TNGFv1zfjgzxoh8/KsP4tbToJIInQOgtM1+1KvH2nkp1jK/ZXZY19Xl+o/aIQV+aOTISb+eqKbybMVTnD9QKxRpZ/OT349T8Ue8tya/NAWBruq64himW7IAVn1vtnFSrP5odle4QSMr/+JulLnUClVY4dnani4zR3FegzHkUuNf5DOnff/pQGb2O0Y8wVDcFpTvUpDElkz6HM5R78pdprl+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9dKMPPwOWwEqgq739tjTYotGzCADJfvVOT8A4K4owBg=;
 b=O6Or255mNcdXgCN3pkT+K9i46cq+VHUBlBsnrRzLyafRqD4JM8IRLt1vTTaPpLRfQVSaz9GuqNPDtrTJe1/DrtdVKDh+MvAeqMc3eJE19BJRdAuGvBbkLMXJ1HArZUm48jJHTdyGb7072h7Hj9ZhLMHYSE/PRjGfm/q8tiZjAcA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYYPR01MB13496.jpnprd01.prod.outlook.com (2603:1096:405:1bd::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 06:50:00 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 06:50:00 +0000
Message-ID: <875x40ce3s.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 1/3] ASoC: amd: acp3x-rn: remove unused machine
To: Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	linux-sound@vger.kernel.org
In-Reply-To: <877bogce4k.wl-kuninori.morimoto.gx@renesas.com>
References: <877bogce4k.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 3 Jun 2026 06:50:00 +0000
X-ClientProxiedBy: TY4PR01CA0118.jpnprd01.prod.outlook.com
 (2603:1096:405:379::15) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYYPR01MB13496:EE_
X-MS-Office365-Filtering-Correlation-Id: d3fe38c8-c4b8-47c6-1ebb-08dec13c54f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|18002099003|22082099003|56012099006|11063799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	ah786D27NzQ0pb68AszDk4ylrMlIqGg83KgiiBvKxMW9NC8cs5rzViMaptBsVh15Q5BzsALaML6NhHF7dmMmOaSNpATdWSjfFoYIR3crtV63d6pbGSQ5d6NWr0LmDKpUgLHU+oXHYOeAYvtM8PaW6Gwf9jv46Rw+jcqK2/q1j9kaAtxCk8c6fSBzePsY6fqOOmSk6tVxpNA9qgbQyMur/NBt0FSZevUt46mpvbUqgzZsZ95l4ggPr2NhxcQrR26mkqWhqSVKfLbgkvrqInbE6oqmGs9vKrHX1Ydr09wCoIsw5vY0sJJWNy1kti6CEOVAOZcoN58vQoDuzP8U3nJCYEdePmQfKjN4tjhUkUCO2j03piCV8GiuropgSOnrlxh+nVhkiInDqICEwLxwwbrPXSxQCWPtrGdbINcTa1IipGyihwkQPzwFDSO+MvochH85xNq3H5kci+E8vXuEJcYuSPqERRF+jOZqg9TkRM0yBM6NwwVfS987/rTcUPl2K0MECf+u9xcavgXf22DQ59r0XYAubeOfsyD0wVgP065A2P6t2hRiGwvwAVo0HMQvHUmc+gPwCvbSWwS4ppdWIPASwv40CCbDvigos+KMpjTs1hj5A4qyJ7Duzcenzdtqv8mRwGrqU+nFAtC2Hx6ihWQ+R0M5+1qDQI3B0jkl08Ybu9Ln5R8tir91xf3gCaQRlEqhy7ThW+6rduGONufzNI2G3lYMDUCl2xLqQDUQFUTwkxc0hj2Qfe/3lmPzjCjQ/f7F
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(18002099003)(22082099003)(56012099006)(11063799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zti6ZsMPZuDo7hYVSqrLNunSY9joKlj93mdqBiksocd69iVn+8sfsEN2+B7y?=
 =?us-ascii?Q?XITExWof7qhX2QkjXCf/ExxmvZCuCJBMzwjSPxoNopSy+Jn2+D0iRDuZORC/?=
 =?us-ascii?Q?2ur3mvyt+Ah2jxCldEXgYtV3Sr7VgOcsSzHEajimhSfVi3sFzvRA6y7guRwH?=
 =?us-ascii?Q?O5kqheJ6K4llGMq7fNGDTRXz88caPOjaLN2eTqwB1ziykuRA/KSOnQySCcFJ?=
 =?us-ascii?Q?/hc9oeME2dxUJfMxCWCU1VBtiGgB0OEsM2j8gHlfz2BY+/VzjbG1WDe068hH?=
 =?us-ascii?Q?c8EZgIw83CuBsjicPBfhM4TgqiXpBYyHRV2ic8iOi0XA58oHEu09kCwilxbl?=
 =?us-ascii?Q?ue5QHnci6SL2BOJKl395owd97MpT8NJdMwDrZ9MFdbsgr07VM9e6zKiDsilC?=
 =?us-ascii?Q?UhryMCJhT6V2OCNtMthdBdO1y6K30iDc+4xZSxIMgbZRPL+nFcch1K12yzu5?=
 =?us-ascii?Q?i4DxG9zQAxdruISz5w7SyFfn+KIUh13laFMgrwlDUpAW8/i6QrRi7WIpYHLE?=
 =?us-ascii?Q?TJZWy1iIhamqaEs1sNhTppxbiSxIWGoP4CodRPlGGJVYLtd3ohLyokSkI3cK?=
 =?us-ascii?Q?w5XSMXQQBO4BY9ZbyX5NSMxEtNgSjEftz9CcY5Cjaz5c5wL0YOoZvmbuqi5l?=
 =?us-ascii?Q?0/xM0V9jDEhe7CSpBRiMjk3uq1PrYs4mR7dTfjvHAdjsJ70QYj1WfQ7DUHx/?=
 =?us-ascii?Q?CQixBBqstI464GHCunuOLei5TNqSZkqmprKP0Bqa8vtrrQURahLVUmugeysG?=
 =?us-ascii?Q?BdhydTip9fUNjSO3ABdoUv+0dgGUwCe87kouc/vJ/EfE75My3Voz9R/0oyxD?=
 =?us-ascii?Q?1xNpwe468HwTGFckiYHobpFDGMBCv4wCKoTFiR1H5stOERO8MNro+bMsSc9I?=
 =?us-ascii?Q?fPIHxboxEEuRrrNMMNJTPSOZhjO8YdNgQlfTjLF7IsuDIm7+DgOfGL6QdRAA?=
 =?us-ascii?Q?1ej8P91LBp8TzIyOT32kRPQ5VwLXgjQbRR+j+twSQnYczbqc5TYsr9adNm0L?=
 =?us-ascii?Q?xxv8PGGFbO28oz5v8RHOcYEkVSOwtRX+K/aEC92e8RRy84GOZ0kHFoPOgzqe?=
 =?us-ascii?Q?u+E382/jt5HW2bnntANyvoQZp8T0o5ZzvTc+V+vk6+RBfjXdbMhc7/jhYCrX?=
 =?us-ascii?Q?x1qIMo2b4cYfba2LccFo8MnPcG20IyzlNXxz+A2Id7ZIbKX5G8KvZ7FIro8o?=
 =?us-ascii?Q?vIzg+IGe57ydEEJhh86xoUEmC4flAufzOxf8VebJ1VkJw0VAjAW7djJYyfn6?=
 =?us-ascii?Q?5TbBrSxbxyulEr6AEzbDCHwjnm/EadOFU7F2564fPGCgOEqz99vgRGvTvJzk?=
 =?us-ascii?Q?48UZ2ux6Y4qQmIIbfi0cbLESjqfCrOaeLHp0BSOUqc78CajwKdN/0rnq/MhG?=
 =?us-ascii?Q?U4EysbTB7sXcOM5BPUx4gjkrzqttOFn3mtlDQAg37mOUwFXwBG6aZr41BHMM?=
 =?us-ascii?Q?ytW627UBSHXTsaKO4mQEin46Bxbu35p4gq2zXtjv/yxILJj8utZatn4xNF7d?=
 =?us-ascii?Q?mwcUQnEZ6933aDivq8Ab63goZBzbSWfIdGS6SHjmpnn/bPsGjjGpbwmicjBk?=
 =?us-ascii?Q?5GE5soJQViwamGDOEgsfiLknkmpY86Lv73+zeCOnxVDuGfsNpgo7njAgpSUz?=
 =?us-ascii?Q?x9qDdqYz4lRxXxUVWbK4ybOF5149wk4KpATHjxTJvGMdTRjQ/0izrypRSjv0?=
 =?us-ascii?Q?W5gZsrBD6lW/GCSMYLuacyp72pH+01x9hlF+L3IREnUEXEE7IcunIJ5mDCmB?=
 =?us-ascii?Q?H8bO6DLNKdk2EVXYU/spFH9XwP7qu1cXXOv1U1DGmRxb4vei0rUT?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3fe38c8-c4b8-47c6-1ebb-08dec13c54f5
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 06:50:00.2239
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +Gxj3r8KUkqFQCmTjEk0DDXBVKWI5QoOlnwW69ry5uU/kB2cp6evYzEGZv2BfEy2kZOECl10rPAwBaWGQiXoPePkREwNOOQPXYisk05m6Pj4SvDIOyXK2EEVM1Jp47+R
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB13496

Not used, remove it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/amd/renoir/acp3x-rn.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/amd/renoir/acp3x-rn.c b/sound/soc/amd/renoir/acp3x-rn.c
index 3249f74a0197a..516c3d4f4ede9 100644
--- a/sound/soc/amd/renoir/acp3x-rn.c
+++ b/sound/soc/amd/renoir/acp3x-rn.c
@@ -44,14 +44,12 @@ static struct snd_soc_card acp_card = {
 static int acp_probe(struct platform_device *pdev)
 {
 	int ret;
-	struct acp_pdm *machine = NULL;
 	struct snd_soc_card *card;
 
 	card = &acp_card;
 	acp_card.dev = &pdev->dev;
 
 	platform_set_drvdata(pdev, card);
-	snd_soc_card_set_drvdata(card, machine);
 	ret = devm_snd_soc_register_card(&pdev->dev, card);
 	if (ret) {
 		return dev_err_probe(&pdev->dev, ret,
-- 
2.43.0

