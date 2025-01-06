Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011045.outbound.protection.outlook.com [40.107.74.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0571F159596;
	Mon,  6 Jan 2025 06:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736143290; cv=fail; b=CrnHKi/GEIspLOCk2RBfStvbGBmSLrg/N7IBejY2znez5WTpMe6eGyc6YuW5/h9wKNZKOCAm9q0gp5AjnlP+ydLwbMbWgixMGJlVysez4mcaDreeGTdAbr8exwALEnRoJFOi7LksGmXBe0Jp2cEgozUzMTeKe5xiPOWDnom5cBI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736143290; c=relaxed/simple;
	bh=pt/TyTYFy81Ql1awzt6YA7vNGz/Uwou1YpDTtnI6A9M=;
	h=Message-ID:From:To:Cc:Subject:Content-Type:Date:MIME-Version; b=sheNLtt9o6VPsUSGMNkaC8pn2lkF//IMUt72wyY/ks5Sq0Fkr7wAAfu7qRWXoENoXPn69SmSYuSAmRkIScWndpCO81ww3TLuJbAIeC7G31aQElyjmmHC6GpyzJy6WmFX2ZP+FX8xmX093mDSkP25AOUolWcoTRHqu+4Gf9+oSro=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=l/1xZhEs; arc=fail smtp.client-ip=40.107.74.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="l/1xZhEs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q08d44xc6f/0lRREEkAtya7dhv3TPui0nM1ZoVf9GUn5pnkJ5G4O0ngl7nK0LtisCnazaI7qBt6DKq7peSD4MsNh1KfjF99tH2buUY5slXCW8kxhcOkb9mUKNxIhY2Jizp+JOM1AL3B5yMO3NBHiXOWQf4rm0KINZ5A+C9hLVtIQinyQ7VTQN5IY2ReR/vP21WfewHtB69IiBFwFb2bbB8oSJMLuyvbqkBxx0BjaTz8WtCRFJm8fMRNhERUcbkF5G82GvpYE3CDQEIP9DGr8qMLQsUxKO1aG1qbM1DXnxAPrnxY6ruZDlN3pkA4NFcL6LA/s6BEGEHK+9qFAG1WZfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oBF0GeZ3MXedNROBBCiYNJYrqwjogdvfs/uE3o+8K34=;
 b=dY/A54Xd1ljru6BeKfiTUB8HXQT8E9oMJR+vxNhaGlBiT4nHHeOPuHFSheQ3G/C2Gc6CEEUIoibitCyFrswrckg5U3/YYAbfEYlynk0gNMvUCqF80oX1+GhxCS6e7/9IWTaVvpLrVwHnB1RiKFljzP3QLT2Ez/+tyTUrYZZRsE0QLwFTd1ReSkiA/Vkkz4FQqZ4CMYYT+mMhU3jMD7W79ejnJQgUFeClIuZWofBnDVAM3UJBsK73Wf96YbbJSZlced/r1IoZu986cwv57bvyvaK74LO0pHoj2xdGAg8IqmtQjFi+DgRY0ZlCTqlGugVVQCdn/lTYyPGmOm9FGmgEpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oBF0GeZ3MXedNROBBCiYNJYrqwjogdvfs/uE3o+8K34=;
 b=l/1xZhEsogx4VW+BqZye5zslxb+dHS47L5XPU+7940/WdUM6bB4ictTdJStBNB6mt+4gwai+PEREoZkHws7AFd2HHFNhrur/KpeN1BUv4sQ79jjiZ8TZw3ZZXV3f/1rw4GyoF2/1IMCKxUEBdbPzp8QbHyZhSiXNaLEAiZF7VRw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB12254.jpnprd01.prod.outlook.com
 (2603:1096:405:101::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Mon, 6 Jan
 2025 06:01:25 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8314.015; Mon, 6 Jan 2025
 06:01:25 +0000
Message-ID: <87msg4o4zu.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: Linux-Kernel <linux-kernel@vger.kernel.org>, linux-sound@vger.kernel.org
Subject: [PATCH] MAINTAINERS: add missing maintainers for Sound drivers
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 6 Jan 2025 06:01:25 +0000
X-ClientProxiedBy: TY2PR04CA0010.apcprd04.prod.outlook.com
 (2603:1096:404:f6::22) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB12254:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e9cbbe1-ea4b-44e6-4672-08dd2e178ddf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wjDGXZWG44g56WVfdTNPZDA87XRIy0dGRp5yK8zu4/AT3gWq7Yk9we1osQOC?=
 =?us-ascii?Q?SYYIVCLCKn1NuWlZF8dW9y9X6ndM+pxv/PKazhaYZNvExyLxcfK7U7/wtCTA?=
 =?us-ascii?Q?ttJsEOEmpNmCR9LIBjAKBQxdAyyFj3KZKNhaYWHAZnNf/53gF3L+/3KCukLc?=
 =?us-ascii?Q?EUns8qyLd/7AAezVDPdRZhF9RL3dxY2uVGoZ2tlkWGE1Gl7YtVjRQ9ySBzUY?=
 =?us-ascii?Q?ss8wMSH2DzQDzlU7HnP/OGfRgB7591QmpfdYBaulDvajYDHGsV5yc0uw6xOR?=
 =?us-ascii?Q?3314s9YOO7oN+4UCNWFvpbl7GzmtgRiRYjnJrt076zqKKGjugaNeNEftF2Ud?=
 =?us-ascii?Q?3YX4lSaY8e8/PXxFEZW2vRVd3Nz/HGqbBoe7wJpq9cMHUWRBllOZdVQ08kp0?=
 =?us-ascii?Q?VsRapq/yESiaUJjgi3AoLzYznZ/+qzeqCvaG9DI0S/jRGUVtOB2NXkmrSofT?=
 =?us-ascii?Q?EgOBnh0pEIvgWl6QO1ABxsf99xXs9BTw1MImNQOde+2Lh6ecXcukJh8fAlLe?=
 =?us-ascii?Q?O8lYLLx7hBxTFTt97G68mrdrfhlaICxUeXPH77iIQ++l/0H8KCWXhWV4DYwX?=
 =?us-ascii?Q?tJlcWfn31/IQVCxVRBtJcdj+d8keBVCpg4orPe7A4nUWpUN5TnAm7GrrQYD5?=
 =?us-ascii?Q?3KSctjRZfZNhSCvjioU5+BWAWvHm92LZ2rnQkYhYPynP4ibTjDpivRdrbs1e?=
 =?us-ascii?Q?sj7mVehh66RqO8bswMhZhif/N/VZ8d2rH2HFVo79FHdBv9mJx0ORF24bP6Ip?=
 =?us-ascii?Q?EkBTaVtQbmy2feyXkIyKrhrBdjRFotTXT76GldJqu+9tp0gU32XNyamAKPaw?=
 =?us-ascii?Q?zbdUsKcwCzqh4hSxOSZGzUYPBrGP3dQnw/PjKJDboFJuy9iA6cf/BKSNR6Mg?=
 =?us-ascii?Q?V141gboRZFleK1UqMJnBMJ+432Tzi0EvGeOLZUQFPSsBD5Nt6BwNCgGVBEOE?=
 =?us-ascii?Q?U+j3/lgB/hfXD7Z5Vpp6bZpgnSP1zO2LPR8qZchS8BaflKoS+EYA6TirfcaO?=
 =?us-ascii?Q?FUW7/7v4j6kqcIuFFdgfncZVwsvMHvcDJwTPBA9cvEaxCwejYyDOsppFrR+H?=
 =?us-ascii?Q?friZNgNfX9Kp7M6lV7thuPREuVJ9usxKp++s0VRlE3G0TZ791Fr/LKy/nLKE?=
 =?us-ascii?Q?kUS6DYFXsv0IrqigXFmWKEI1LU4h7Pq/fgezenOMUMCZtftfyu9B2zU2dUBO?=
 =?us-ascii?Q?iDMtDlFXL2tpJD6UWmPQltyimCScV96cvNM4ccyj034lAEl/xqYlM3Xp/cMo?=
 =?us-ascii?Q?fcJOhxBT7ZXGzSQ6seULUnYHtZtTZ0P1rprSlJrrnahAJuDI3Yf8Bqmd6ayY?=
 =?us-ascii?Q?XpSrYPsn6xgWjyDSUdtiPmP7gP/l6MOaMUp/qiOR8WtzDhjVNs23S8GlPwJT?=
 =?us-ascii?Q?Hd0DJxwtOqtF2J/SoZ7QTZjD45/u512LW1FUmOI917HbPC5pVw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NA9uBwAFjIcfHZA1WeLQqtsTwl6xcyK+mXiz6mCu/YiuBcCIXyUFZ8YbtggE?=
 =?us-ascii?Q?zxUbNUqfNoSwIybhfOxmB+ZJxVmZfVlkuZR1V71q7XykhtwYQglZw+2zv2Vy?=
 =?us-ascii?Q?F0XL8586M3wxRNCAvdXzLZJQc0E1q2WKskmVSIKwsicZc8AHFebVZuGS3VKw?=
 =?us-ascii?Q?jlvWJaRDalVe0nLDQEGR0KkDZAMPBUBEDL44h42w+8Ev3gCmvRxEUq0lwaxa?=
 =?us-ascii?Q?LaB77yM46nfRGWNq4pibGi58GTF5G+hqCIhuCuiOjqydiN/yxACMY5fEg0Gl?=
 =?us-ascii?Q?eO3TSKNE/9R26DqEhObBv8NJFYHpZoc8cCuyU9lg3PpmkqAxC/HWBrlXfnvr?=
 =?us-ascii?Q?Y6DAImYnm6O90UqZ5tEA0oNRI81fNhA2vaZrC96TPcLIBkUXLnJFYomO3dQq?=
 =?us-ascii?Q?CWAKLabYea8LJKK0W3gJFQMLicUkjsM17p5D7c5v1aqooqPr5MwNr49Ah/1w?=
 =?us-ascii?Q?ZXohL8LOaCf4dHaEIUBZ5YMY0CvTVI0h3jKRWWaLKaVuUmGlfPcR8ZCQbBUf?=
 =?us-ascii?Q?yzQriQN71E4IQ1uxpTwzFG260GDqL3i1BPl0gly47QLl9TOvxkfqRKc16SOz?=
 =?us-ascii?Q?+VN0sQB4LjbAIsEAwxGvL+19PHlFB7bKpgpsRiNQi4e0uJ21JNcHf+WZ8+rf?=
 =?us-ascii?Q?us/iBVrJI4adcM0FfxNPj5suhkoTzdmFVCFu4UptxwbCLcL2n/MYFXG0/cgz?=
 =?us-ascii?Q?BT6YMUto4tzMcuuV+nrUXm7FLOAnIdmNJt8XIDF6CAcdkQeBbTTcKLFVbBk9?=
 =?us-ascii?Q?bEH9ZBwMQP1rtgKQ3Ubdg6hWE8S18dufx7tnCHJa2lUwqPBAFNVYdiy8UE6a?=
 =?us-ascii?Q?LHZ6/ZW4xaPoVyD07jWxsT3Br89/ILBbrds5riZtCjV0vBGRv7i92GmXe9SJ?=
 =?us-ascii?Q?pIka9iKPsxtT4mMUZ/RiDUMPZZYxafI722SZFow/D/mEptHSP51TfzMPXPuW?=
 =?us-ascii?Q?lWFrbg25JEZ77/bJ8kxwDRo9W2qdKFeWFr8z+9TpKuapjcdEhDzTimWgsEXn?=
 =?us-ascii?Q?wUVgeJFb4IanszyA/YLe0Sqfw6IVJXGOGBXFwcUnUvPNTXHxuWVfWZmVzU/a?=
 =?us-ascii?Q?xNO/QoP6yJORxQatzmpg7Y0IRBV2QvC8xs1rtcCCOO4x/NjJO74n+JJUAbCJ?=
 =?us-ascii?Q?EJObO9h4PNvbHxI/WLcPA/zOQncwZ0LtLCmeBOLZj+RvFxWFoGNK2woeCXGq?=
 =?us-ascii?Q?T3mRoXYNj6Sv1HcvXG8KXDsPuIi0WFP/WDyAx+FlHsT1XVlMWFbX3SPoZXp6?=
 =?us-ascii?Q?f9PoQ9r1vXCqu7wI5foF+QgtB6wv+EeT01UojlKxX7diqSFTzTzUPxyMWaFB?=
 =?us-ascii?Q?SP5qHvpN8URZbxJkGlVFKSTUjpokmbc0IkV/lmA22ve9ezgSz7bCWxGmHNpZ?=
 =?us-ascii?Q?CDbJM/j/umARIrWrtqNTt9eZn4OitkNkzPoukpkV/hBraUA6M9o4pIObx+vv?=
 =?us-ascii?Q?HQqzzYYuVstmSbSKxWR9FibFStuCTgdOmGkrMXJyylUe6ov35C/kJHk+QgM8?=
 =?us-ascii?Q?EB7b/FhS36/yAm29FfBsTGAgT85fyFlEAC1+ldAFWrJVXSSIzc218+ko/YnM?=
 =?us-ascii?Q?gwPagr88rQmqPPp0AwHqWpjkoqgSuB4g2T5ZeaxSMwynQ42UONp8MU9Bkivh?=
 =?us-ascii?Q?YaVCJdc8hiOIvHKyZ+BMnlQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e9cbbe1-ea4b-44e6-4672-08dd2e178ddf
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2025 06:01:25.6671
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nTYCjq+JP+W+52skEF9RKaGggT0jR73FsYZXn7uifGor0UqC9FUlWnOkX9xfLXOLB+1mpxt8MOirqC3QQ65EnPBTKTWwYszpfrl5C+FwgCw1qgPn46VpvxzmCIDhdpjz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12254

Mark Brown will take the patch. Add his name.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 27d9d68675b2e..e453c6ad9314c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19868,6 +19868,7 @@ F:	Documentation/devicetree/bindings/sound/renesas,idt821034.yaml
 F:	sound/soc/codecs/idt821034.c
 
 RENESAS R-CAR & FSI AUDIO (ASoC) DRIVERS
+M:	Mark Brown <broonie@kernel.org>
 M:	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
 L:	linux-sound@vger.kernel.org
 L:	linux-renesas-soc@vger.kernel.org
@@ -21991,6 +21992,7 @@ W:	https://github.com/thesofproject/linux/
 F:	sound/soc/sof/
 
 SOUND - GENERIC SOUND CARD (Simple-Audio-Card, Audio-Graph-Card)
+M:	Mark Brown <broonie@kernel.org>
 M:	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
 S:	Supported
 L:	linux-sound@vger.kernel.org
-- 
2.43.0

