Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010021.outbound.protection.outlook.com [52.101.228.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAFCE15E97
	for <linux-sound@vger.kernel.org>; Tue, 20 Jan 2026 00:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768868071; cv=fail; b=FFIL9VzA9iptUODzDkH/rC5PeRU58Mq+ElEwXTIQPdTMwg66qcK5a4hPTpoTlgHFgVQ5mQmrn766VJJHGLo308zYy0/DPHIGEdRsJD4U4niWjSs1k5qwwWeul/LRVdEYA4GB0p9cb0W4q9LbGRubn0aILQa0OXaev7DXC7hfR4o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768868071; c=relaxed/simple;
	bh=GIFJWjZlH+OSrqetKSz/Ft66b/nRx9AxTMJF2rOHsuE=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=qIvyhujo4JZiPuy8FGBF8u62bmGKsUR49iYcz9S8HwflOIEbuFWHOsCZWt/gKONC/f0f8Y2lpzM3Ki1lssqCUbkdIp9AGLqu026jQO9PHusdX+V1bYmehVYehazIyNmpeN41wujxcnZVSST1MCMvOcfdP8LarxtZBk6XWRelCxM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=F0r5zNeJ; arc=fail smtp.client-ip=52.101.228.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="F0r5zNeJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bOmZrX4yJpJe4722W9mKr+JRmm+W3oCPPQ7jamNKezRrFF4SGmWlSY0sRwGQYw2XAfTe2WMBIXdFq+Oix7Tn9nKAZcsaX6xHd47U4F5NeLOAbv7LUY0FvMuXJT/A53PJEzuT8iNE8xj8/FZfL9H7CSmVwvvKHA3xcvToBKGReGLLmwMaVmo803Weydl0gxdzdS+coITvZacaKZbdHxPevLUaEhwkRhwX76MVDoCGVLyEi1oULeEMUsQ5U5OoP3/nAW1JrOIhixCHvpc7oTAO6G3VdYHx8OZEjgBebQrf6MFAnr3OsZJtSSuzF3eI04EbjwHF84oti70hY7ZMLMOoCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hAcbqJVTSTjK5hGZTSdAOFwSnPyqIA4PmSb0W5r+JEw=;
 b=KtblzU2EVcextyBiVNGTS0jny9cRSHgZJec+pJlFu2I0GuFmhg6hRp477LocN+l8rrSUgN/HMRx1EBRuLHpFELRvYzp3YpfxA0IU3sLeM2xyqkx+PGb1DcEQ1nXp3DvNhoqbmrVGceA+iTsQcsJ6vEB1KAAXfcPySw9dHADLmhmWqHADHwgSdPKAoxxTIZBw+aGKSd4phyCNjUq0wC8MH4wm5cKauZ1/HCMzafo+GhtYlI/3RPRPZrGefpjhHhGi1FWfGO/Yzq1wF9QciVOSnzBsUMzx0hrHg52dkhOGZGu1eyASa6ldX1EzHXOP46BM2F+suN/0XL5eONORltLh7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hAcbqJVTSTjK5hGZTSdAOFwSnPyqIA4PmSb0W5r+JEw=;
 b=F0r5zNeJMR8MenHYnxgYDCBwoJfRsAVF0wbmJjdPfVt+DXKm2Rdmvac7oG9YB3z95nxfDrZrhdy+RpHsBrBM9NqzhIQ9eEiGB3IUnr5V/7Send7bHl9uCEytED5jAAlWImQt+JfEB5lxkejOlV5PNOE8OHTC5ouO7beEFsNmDs0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB13067.jpnprd01.prod.outlook.com (2603:1096:405:1bf::6)
 by OS9PR01MB16099.jpnprd01.prod.outlook.com (2603:1096:604:3dc::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 00:14:27 +0000
Received: from TYYPR01MB13067.jpnprd01.prod.outlook.com
 ([fe80::dac1:6ae:15b:67ee]) by TYYPR01MB13067.jpnprd01.prod.outlook.com
 ([fe80::dac1:6ae:15b:67ee%4]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 00:14:27 +0000
Message-ID: <87ldhtqgws.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 3/8] ASoC: soc-component: remove compatibility definition for component
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87pl75qgxt.wl-kuninori.morimoto.gx@renesas.com>
References: <87pl75qgxt.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 20 Jan 2026 00:14:27 +0000
X-ClientProxiedBy: TY4P286CA0061.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:371::15) To TYYPR01MB13067.jpnprd01.prod.outlook.com
 (2603:1096:405:1bf::6)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB13067:EE_|OS9PR01MB16099:EE_
X-MS-Office365-Filtering-Correlation-Id: b229d420-6e17-4567-6bc1-08de57b8dfc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/8zdDCTeb1Q6eGXGKP+2jklJb/86yhMkzLvFvS+0fBKhlvmuYqywEdcvmQL5?=
 =?us-ascii?Q?XNhuEZbgtcyHlTJPf+CVdJhTe82NalhRc/mkS2nmX4Y11RdoPSWeWfndz5+S?=
 =?us-ascii?Q?aVwpp8n4NGHgQbYTxqfTeq9AWqmHb9zooF7fFMvksv6g7IciUWGo+glublrT?=
 =?us-ascii?Q?+r5pgE+Eq5jSba1kp3Jwn1/ijdLVNQScuvadaXfyIohK3dWP68B7Vxwyf5EE?=
 =?us-ascii?Q?H5nm824ROf3cmnii1mzpZ7qbA+mVfD206b0BdSqAvzlFRx9jRoGrM0Vcqd0C?=
 =?us-ascii?Q?t0MWCIYT/jvR+eX1xL8aVhV2ILoht3YlY/GH2JIpuVtsnho6+7KlsKx2Ol7C?=
 =?us-ascii?Q?cLl6DN+ymxnpso0sOAy8RdinlNORJTtnhisejHYz7M1LhZIXDkZIZ4g6s1KJ?=
 =?us-ascii?Q?rbySTdbKM5zCzeP6aESGdl4r/yKAGRgeUJPcGhjXqX4nYZndPBBOvQ1jx5js?=
 =?us-ascii?Q?csGAHIOTPt0XIYKSwIOIrhwpP1LREaACKc4KMJ7LjJ1cBFe64g/t5e3OJqh5?=
 =?us-ascii?Q?iArAQtBXTfwGNyPV/pRgxbfUSqo4yUbY2gPMOkCOWiyn/hcFzkwcPbzE4HQM?=
 =?us-ascii?Q?DeuNrgoKwPTKRHyA0pB/uJvcgA8zijFrtd4Fm9j5yYRCMB7r+b2l353JxoiZ?=
 =?us-ascii?Q?nR29HAiTTaM05MC/lkfde1p2xitCJfFWxe++2+pw2c0GVu2rnhz7wPdUVW7N?=
 =?us-ascii?Q?MMVcma9CSOkgpHXQl+GAKkKalMkgxD4YJYJtIuWnb4zZfRvnRBiy0Bseuoqu?=
 =?us-ascii?Q?MAeK/kfxl8A3b/KsO1TBCBeqVtJylneFBA52mucrPiJ5dxKnE4YN05kuueFF?=
 =?us-ascii?Q?ZWJFOWVKaLL6svdEF/cSh0gsyMY8SrNutTDZZykcQIVscy47skbhdc5Ai36s?=
 =?us-ascii?Q?4lkk1LOEho9BnnrJdSRdKDCkg5q2GsFMDbewyHnfARhBUotbxNicHLNjrut+?=
 =?us-ascii?Q?KD3T20RZLJMvKVB8jC2JhtcfuIHLFqHcb0mx2qo3H3rd4Bq5qdKqUsCrSI7g?=
 =?us-ascii?Q?2kXau/yRDJIr0HMv4Yncdc48wpuAHjrlBBeADyTH47zAW32OyJIzyBFwkk8I?=
 =?us-ascii?Q?dkeXDkNYUL8W8dO5yEVhBhZxd78lv4buQa9rY9atf48tYr+CjG0oIP2E2rSf?=
 =?us-ascii?Q?tp4zApHJq/JMQg01vqm2TrFUb8P2/eATg2MQFeqvEd2NQ2QJn4zZYglBGT9U?=
 =?us-ascii?Q?ho0fXnvOCQfbUTHaf86LdwyWVh3bIoQnf4lCU9BE8pph4dF9ZduKsfGgrZwG?=
 =?us-ascii?Q?mzk2yZZ5jW6fMZiUEjcjWuJSvzd6CITOvPxzezW5hRf5wI86ISsdosUvSyl5?=
 =?us-ascii?Q?Aitls5hphQVD4tnhC1LilToxwxL4GHG39EP4UJ5PTaHyn7tHUE+YwZoFbQnJ?=
 =?us-ascii?Q?LeJVsRnvQdm3NAIp39je+Aye6BazxH4Dv1my7Rz7Q0Swkgc98wJriVxsf42d?=
 =?us-ascii?Q?cNUHqDSAuxXyGVegWCMlyKMU4D+WjGSqxURECOux8gi6qCWvy3V0DpppvWO2?=
 =?us-ascii?Q?LsepqReFmpwedcKScMjJBfAffycSTelHohPfS+yMcffkD22ejk3zEPNzA5XD?=
 =?us-ascii?Q?G3UUGXUzWFlr+HK2hoIS0OpJUn4cvbg9/hcVHUxOaIbjbRYdT5XnYBhtF0JF?=
 =?us-ascii?Q?3kZDKCTrgXQjezGSRBRA1oI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB13067.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5RDdorLsHiOv9+KWfnwGEXsc0OwL8pU3ajP9Pa+F76i4O8SrxnhdbjQlbMDH?=
 =?us-ascii?Q?XOeLM/T+ziNtE+D06BXqIauQhOcJz/W5vXhIeF/BUaUiLPnH+JzfGJz4VsFK?=
 =?us-ascii?Q?leXIwhTUm4aP3xnpvz5d2uPLWxHgpNwfCpPFt7NxlPniYirLLrS16mHe5OT2?=
 =?us-ascii?Q?IZQhNzrqHVcccrI32nkr5gpaMncw7DZkvdHnGYtMSW47vpGLA/dO6gA7GtxY?=
 =?us-ascii?Q?RwK2nlHkzTDRWTnUUdm65Ks5C0dvc7q/7p6ko+tJnv4o/hso/zbbbBGPW3aP?=
 =?us-ascii?Q?aRH89Qt98wJBd5BlAALuUn+4n+zkGsOLmH7lLyTQ0B6oHQzIhCNnJfIW+p1h?=
 =?us-ascii?Q?5kD2ceFP4dADDrcFpFdz9VVOklIGEYHj2Pxjoqp8VBMo7CiHbWIO10RC/QCQ?=
 =?us-ascii?Q?A13N9oY18Kiz7dAPsx6r0REvHi772re+SlynvlutQH5O9bJH3ICv75R1GLOL?=
 =?us-ascii?Q?gnKTPMXv6stk3mQ3CdlZkh+32Qvb5MDH8T3MLYmSpgzM3EAps/g1JkrU1x9I?=
 =?us-ascii?Q?dwpddiH1XUqUYXpN/Rx51vVJdrb3xqc41UfoBr0GTFe8bUq5qXx2nLha5JU+?=
 =?us-ascii?Q?YbPV+xISJ0jitqZrrmkXawdw/Y/Evh492mBdITcV14QTDsQ6GfbbhFcFRhlX?=
 =?us-ascii?Q?uOA09JHOj/DOI8d7D0ncu3NGqtMTn17pU7n7rMK0YrQRk7xC+vVrIANPyubn?=
 =?us-ascii?Q?hJx2PGCwkDZQN8ngZQkjmF6i2nmUJY1tnxb08tXZBHz2mCX6bhIUH065iWHf?=
 =?us-ascii?Q?wtugHlhSgi9qHQAIUjx9YSvSkl3iC/gC+81Ntke+UKd5XHsRsYxss5nIx3TP?=
 =?us-ascii?Q?e1sbGLML8wFAADbtjjRcPXiMzQRuAsQKKRCsAELGxNneuAa48LdC0NvNfRnV?=
 =?us-ascii?Q?GQX+Frz/W7ywuIcbLScDXSeW1JPOP3Mdd75MHKzcNTHlmcoA4c/N7TFXUY2E?=
 =?us-ascii?Q?wwyFiP5eUfyeo/VQP1UD0KIpZ2difDY+SfdTpJuDAnGrSci82hu5vVIhz9TI?=
 =?us-ascii?Q?DMarmxlDvhdB3XAA/iI0ZxcPyejE0DNKUQAN47h2KrGEJuQDgJ4D8JCbNY90?=
 =?us-ascii?Q?1phOAzK5rUz1GUL67fpNA2TZSa3v+8Squy0xxmKdwdhxB8Nz4cZtQDWpP6dA?=
 =?us-ascii?Q?XPbOwEdIjEePyRWYRVu1D4HuFiEFCS+Jl6yfwbZRCBwtlspiiu4+oVkHm2TZ?=
 =?us-ascii?Q?5lUIUjpA2iDfnaoXOaeo4jMqNLR5nrEkADHapfh6JXCylc5SkqrRzNTguJhm?=
 =?us-ascii?Q?e0kFrGEyZtuM36S/qunJrx3oJ3zoIQY9ky1fwTO0KHLYgp1L7qeQAb3UJ9Xp?=
 =?us-ascii?Q?Q6pnRXeMeKKDwDgvwKffskA0hTh4zM2ki7WCBbRAa6yOjELon+sxTvc0mDBn?=
 =?us-ascii?Q?CV4KCk8RaAPfA+IIvfQdlgUTeFU2b8VkjsjIZFfeMkZRXj5dad0+GcJpBp5W?=
 =?us-ascii?Q?KwJgqSb0tdj+qGyyrLJsEJl1No8cwKvWaKnVvvpONSAtsN+Pu4heRPO/fX2h?=
 =?us-ascii?Q?2fTAcZ4yIDEeLXGF4vZoUmHhPJPKDi3gielwIfuJHmmwHTc+hxWxH2iIfHD4?=
 =?us-ascii?Q?oCDP3rlJH17wtQsJT9RuvKFBbUHfvTJKD268AzLEtLsDMnKy7dwHi+iabf2/?=
 =?us-ascii?Q?R7rDgV9yy2hUf4XKD/q/JwQsroGfToXeTwuE14gLaIs4TkvN3Ubv9M4lFUR0?=
 =?us-ascii?Q?suzdAJWM6SUfkSWLPpTuFaOwuTveixdgE80yCCIwDv97LIcrSRBpiK6lPiQz?=
 =?us-ascii?Q?yRwH6LCYN2xf4HAI8P7tVBubYqRDmT+Yfw2HWIWHbxA99j2hM73G?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b229d420-6e17-4567-6bc1-08de57b8dfc6
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB13067.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 00:14:27.5558
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: au1KIEp4C37geGjVkGRY10n8Tv6ki1grAs70Y5Gl493fUOLIxe/vQH7jRexLl5ZeD1q4R+oeGh15hC0tJqW55uJP6odjQg0iIuBYTv9wJoVmfy0MwACtk0NsJNioxkP9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB16099

All drivers uses new functions. Remove comaptibility definition.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-component.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index 8b34958395ca6..e538784746db7 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -271,9 +271,6 @@ static inline struct snd_soc_dapm_context *snd_soc_component_to_dapm(
 	return &component->dapm;
 }
 
-// FIXME
-#define snd_soc_component_get_dapm	snd_soc_component_to_dapm
-
 /**
  * snd_soc_component_cache_sync() - Sync the register cache with the hardware
  * @component: COMPONENT to sync
-- 
2.43.0

