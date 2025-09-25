Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011014.outbound.protection.outlook.com [52.101.125.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE684155326
	for <linux-sound@vger.kernel.org>; Thu, 25 Sep 2025 05:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758777413; cv=fail; b=ZsJq5Z24Z6QdSwUwVLPGefkOsqgeuF4Re2j/KRo5gkz6UcjGVZ+IpFz6JcnOXcdit0bJUVjV+qCFAJPpHiqewCm3MFmPYPCXPZQoKTIU7oPqAkyNKTcf95aM9hnZx3iTEUWVVje6CjalnFwBYZzq845YcoVCWolotV2VxHJbnms=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758777413; c=relaxed/simple;
	bh=T45V/k6+Znd7X2q2NIVwoqemhr6XTDQAuBCdwmgWsYU=;
	h=Message-ID:From:Subject:To:Cc:Content-Type:Date:MIME-Version; b=h/Bm4Mz/rtoNN/JGecAfA3H4J1rJW0P1nJy29clnKAjZdF+ijWe4hyWt9k1Q02VxluxMVZwZkwPUjphVgSFC/cG3m9qotku3Tk7EjOzuNvbPt28CgP5Z1pqm5Xqvx0F431pGtBlBJV2oIbxWMdKypRdmlvavKTQoL8p3sGHi1jU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=MJpz0e7q; arc=fail smtp.client-ip=52.101.125.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="MJpz0e7q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y5/T161/rE4dETjLAPpzs5ThCL1st4u8s5noTKBAFBqUsB0/KWJgj1X+DCnXPsNYoCIVLXAmzKE6mazUouqVPV6u6SnpKSDpfYqPj5tpRTjQ+PnRxGjxn/TnEPR+FtAI1kdoVEXL1IxLDYaTKCHVAamtTMWT5Uih8/L8oaG+B7jpCyC9TTn+GK5W4q/pCDSW9UNBn+VUINL4ILiO+2o0tdZfgo99xlm15143DEw9eNR1rleu2s74J2FJac+oX9Wb2sEEeY3h/pQ3BpmJCtbqTObPoIdVVTHw9npTjk3uX7+4wUAAoaXBGVtElUcZ2nA1FTdu5ou1tyqr8TJ0AeMR9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2j34iNVm3ZtZFsWiYSAxMPfPLnN5t5fqKLCvP2zMJAo=;
 b=EnxqDawhUwN5IZRcPNbiYZik3GuLtCiWOT/IvGKfNgprPDnd3KSHFIbzysigIEXOzzAiJrBxJSX6n+fM7UxkyqHdmza6LwM7cJLu+7uTK3cJjZsI9B2FvLuqNir9hagIPpe2f0/xrGGw7+7BXaPEenqH9R/ufSGg0Ub6vcu+vwFDVmVZPYxyvVh2zB7JBKWrsk7tmzQq3+ZnJLRNXoF1QZrxqW/j3kQ5l3P57Qf3wvaNCsEgEZSao1U8akWPvffZ+7AxvqOD1oaFnfDZaenUPtaodXCsa5kAexo9Of+18hnIjmG6j19JlIwuUE21eegbVaBxDYsqw7PXurBe8pIEQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2j34iNVm3ZtZFsWiYSAxMPfPLnN5t5fqKLCvP2zMJAo=;
 b=MJpz0e7q4VVpC9XBgnQGHM8oNrWoZw+8511HHSFitijCPZLHA1jCW2MiDoWYGSPAneeGijJhVJNOdLZzTq6+hNWpuwJPxlSuhYur0HQQa4kKys+Jgr4pQ2O77n52HDLh4odl03K0hrAsIhC4ihK1wm8d9SilDWVUL365Mheh2q0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB15474.jpnprd01.prod.outlook.com
 (2603:1096:405:274::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Thu, 25 Sep
 2025 05:16:48 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9160.008; Thu, 25 Sep 2025
 05:16:48 +0000
Message-ID: <87frcbyuv4.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 0/8] ASoC: renesas: msiof: tidyup to remove each errors
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 25 Sep 2025 05:16:48 +0000
X-ClientProxiedBy: TYCP286CA0345.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38e::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB15474:EE_
X-MS-Office365-Filtering-Correlation-Id: f60e2fcd-17ea-40ab-afcc-08ddfbf2ba46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?AdGa753dJFCIbTmaX4Ak30bHjN8bDKWbYj+fGaDYoaRf3ixE7zhku+9M2phJ?=
 =?us-ascii?Q?ywitfDxsqYgAemOOu6TD8gKGvBT7txiXQPqrIIdiis5PHoyWTmhd0sG07cn5?=
 =?us-ascii?Q?hGAhgc1WDLOk7LeUwaDmCbapo3hjoZJgaH+vLsQThzJUj3SNDa/+Isor7wEb?=
 =?us-ascii?Q?+4wTgjQxivCEszXpqXAUFVJkUkn/D/itFZcT10JjJKWfI+aJE8o8yHD5vXzS?=
 =?us-ascii?Q?tq3awgoKFBQXLBk8ygCyChaYKwFsI7C5a/lHL6DNJ9tMM2fCPTCzB4e+cSq3?=
 =?us-ascii?Q?XIdFrZmBYSSP078GexvoHcHVqbCtvxVeaFc0QRLmce8BvYJOPBr/fpFWUK51?=
 =?us-ascii?Q?AA/cY4gM60EbUeqoIfh8qOowpE/aeHDPouExQ5TLVuYfz01rueGp40YBUU9Y?=
 =?us-ascii?Q?qbruimuAQ3pKmkbB67+d0o68NtiQrM0iIwtoi1uo+AhJCO3pZObERGbeM3OK?=
 =?us-ascii?Q?87azVsaxeNmU8CF1GMOpQWtx0X7AvXs6uI0UvFGTElWY0nY0vB8wbUmM6P4s?=
 =?us-ascii?Q?17Ah7YG8g4RiECvu7A7EclF8Jlq2ab4tRSTGUo32+O809LhxhIs3xXx5d5Bz?=
 =?us-ascii?Q?3+tgMNIJw7/TguSVYSWu3zl811yStOUGOeHlyXCPceXQgfJnLN0ypWV7qcmz?=
 =?us-ascii?Q?hmV1SnLoeOyKv7mzbxkNhGdjE9pc1i2M+h34hRfgQTOiLuFqvtBklZx8Hx/S?=
 =?us-ascii?Q?OcTF25QT8LDRbsb1GMKeeyciGVLMBwda5eFS8cEfF+VBphITii5vFebfUzVl?=
 =?us-ascii?Q?n+xZXgtpcH95r8wDhW4UUf1IPEHwn3ATmqthyrowo/VwLIYgDxspiFHMCWn+?=
 =?us-ascii?Q?wDol1c7tOcGByjdavRr1g/ZLQOeHLL2eL6nk/ewT37rMImaRu7X7rubYo9xM?=
 =?us-ascii?Q?D1utATs3eESmFZF/Nb2cQuwALHpdEK+BofwXf2yWQZCYIxkhtLyMmdjjtdkP?=
 =?us-ascii?Q?D3uMF65IFCETMR/sEXp84bGZyy9Tl5qPjqbBrv3orRoyMFznKJ2aeVNR8m6U?=
 =?us-ascii?Q?CSpm1+/uFX9GMfwrhts7zwBhqaj7f0we61Rl9HOl5+03cICkbSO1rNDF/r9/?=
 =?us-ascii?Q?hNcnYlDvKCJQ2goY6TkvyW3HxfVa8vLsYNvaQ9ZxLSfDMoVOgDt2jPoKGT4p?=
 =?us-ascii?Q?k2R76ZfEZZTT4WQH8sORC/F3rv3ESENzOUZS4HTBTR6s8cUourFEZbLByqtz?=
 =?us-ascii?Q?pQrKyJBFzAT89jBQryJ2yfePTRH/Hk+KVD0PtetH4VQoJ2+qtXxOuHLywVco?=
 =?us-ascii?Q?+wraWuXWlhX6j1a59Qz+cYmp81c590ezc6oYA74M6e3cg+waaQlaBTkWLOlk?=
 =?us-ascii?Q?7W1hAEWNDLOEJGUie7WNGePT94mpxQxvxC6BF6jP+9KQdOFrCcuY0nSqJ/wM?=
 =?us-ascii?Q?vMgE+rFzzVMqITAu/uajTZTpOCgvXl0lD6Rhe7Mmu5KReEnS7tsFn2gmQ9kc?=
 =?us-ascii?Q?5pVqXpYObI6Fa7OCbV3Id12FDwf39pgzD84mQJZjf/aMejjXMWt7ig=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xyABL5hrTMBGewGMdLPz3ur2LFOEwp6d6HFBxNPNW5FwdN0AbY9wH3hnjba/?=
 =?us-ascii?Q?KHzDtN4vfZ6ZigFuxA/Zg4lK8ZD4nBE86bd6fQxMLLqKCooUp9BvdYkqNJOH?=
 =?us-ascii?Q?7829J/qvUfjZrLPsNcHogaaPDlu1u9UjrPZhkaFRqUWaf7O4nYja+qqkAdFB?=
 =?us-ascii?Q?XoGUlKwUF0m9j6ZFiQsdWA2hZRP4ATlBqd6iK44lC6zVQse6tKDmDP1d4OnV?=
 =?us-ascii?Q?lf80S7uB3B33s4bEc+I1pfIr6xG11o1/rrQX+M8L1CsU+Vwh0dKBKwdyxno3?=
 =?us-ascii?Q?2Odj3PBzFpsVDQkRQ0SqfqH50BV7EGLQxu5MLChAKzWqL1+983aiZdptho++?=
 =?us-ascii?Q?pUlAMjZ4iyY80mj9Dw/JpgyufAqE9Br7bm/vw3I1+oK8Da6AHwTfBTRwPVRd?=
 =?us-ascii?Q?fTIXOoD/GVc+y+MYYQs0YWYZb7mWPqvIZXEyQS58yz0iPWERjYuUQb2kJx6N?=
 =?us-ascii?Q?usj4MwM4s9h8db88pn2gQIet9gfqwo7nCn8ppoF7KrrU4r+HUqF2SPeHtJsG?=
 =?us-ascii?Q?K+yD1yntJUozN3DV/jy/4wf43BPIkzYOz8V+GTedrMBZNrRS58GaIJbCaMSU?=
 =?us-ascii?Q?1NOJc6sfx1FswcQ757q53AdFzsI+rNoneytzEFxnEcykOOe3bgV0xA2LIteC?=
 =?us-ascii?Q?ljOMnsWNKGs44RGnzy2nvz4EuFohsLvazNSSudkhAzixLMWd9HahOzkI0VW4?=
 =?us-ascii?Q?SZwb4wnXG97v59G/1YMqz3UY3jWVcwsO9z28D7ghyjgqy29FTvpkNoCTbXfp?=
 =?us-ascii?Q?wDeFcILMVq1OB+ARsP+jnNekEcMlRscTZdFVqhMcrDOcubILYam04ZoYI2NA?=
 =?us-ascii?Q?H/R/TRJcndOt7LqHlfeQrU+Lb0RzpgI4A1+vUZS9/2cjCiTb7hpYOFJwBgSn?=
 =?us-ascii?Q?lOWaWFXz8c3WWr3gsBDyNWJ/kxXd2KtqiwfAztcbwWF90fr84D9ClubXgWYi?=
 =?us-ascii?Q?e7r7/do9mWGNaH34HPCx9kEupn0LEVse+hurVvFaeGbDfxOK8iVC3odc4UCn?=
 =?us-ascii?Q?1cx9mITl76cv1Jf+4Zj7NyNWZdtbIhej0a21hggi0kYx4XESqaw3RYgbZX/k?=
 =?us-ascii?Q?qloexf270NMLJlF+iHQfXYZOOY/7w8AQzhUUJfeJZmTPxKTXZwbJEX2f1yg1?=
 =?us-ascii?Q?/5xkwV/BRwRGqT55WdeFLRfvUVxETaeoY5UZyF2ItAwsYQSfQtKiho8EwL5L?=
 =?us-ascii?Q?xtVUnV+q+DV6iGfN/IJwHggv4jeQglkN13FHLVW7ReByhFJMeVhCLaCVu6+D?=
 =?us-ascii?Q?X7zq46F96/2AKuuJrYOFoLuQA0a+MLNTwoOyqvQaHOnTLpRl1we8dozWsRoT?=
 =?us-ascii?Q?EAuHmcXYJXG7iYHHP+MPDFA3l+DZcRgJSVRhYzandLeJijgdUky7G518n8JE?=
 =?us-ascii?Q?60bztIaqmfjWjoYOmIbQtndk73E9hNuaT9oaQ0Gs887nBlrn/7oro36xBfKN?=
 =?us-ascii?Q?BkLD1RQHAdtEJt3OFSuGVMZuJht8kI683u2Y24WKy0idgXIFuP2Ok6vPH6Bo?=
 =?us-ascii?Q?M0IFZHl529BcuR3hxkRR99qOdmT3RdxVahxqBDwM8+GArD2Okb+Db1WLYKf1?=
 =?us-ascii?Q?17xGwMfKEmv+X/zb80ekxik470KXPlRU3AiH35necqX3l9/4BD4s3pPfqy9a?=
 =?us-ascii?Q?OBbBzc/C1tdjrqorvB6nqeQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f60e2fcd-17ea-40ab-afcc-08ddfbf2ba46
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2025 05:16:48.5129
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fiD/PdmmeZUIoAIt4EquIAvU9BHAdksUMXFJKpuoTrPNuFNfUGfbA9b2H7YBiELWhbfn3S0LWKHB4c7sDs4G3n4u5/1gBhX+v0mJKjRf1uSOGKxsdFIC2jF1JqXnvOth
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB15474


Hi Mark

Current Renesas MSIOF driver might get some errors. This patch-set try to
reduce/remove them.

Kuninori Morimoto (8):
  ASoC: renesas: msiof: add unique NOTE name
  ASoC: renesas: msiof: use reset controller
  ASoC: renesas: msiof: set SIFCTR register
  ASoC: renesas: msiof: add .symmetric_xxx on snd_soc_dai_driver
  ASoC: renesas: msiof: tidyup DMAC stop timing
  ASoC: renesas: msiof: setup both (Playback/Capture) in the same time
  ASoC: renesas: msiof: Add note for The possibility of R/L opposite Capture
  ASoC: renesas: msiof: ignore 1st FSERR

 sound/soc/renesas/rcar/msiof.c | 161 +++++++++++++++++++++++++++------
 1 file changed, 131 insertions(+), 30 deletions(-)

-- 
2.43.0

