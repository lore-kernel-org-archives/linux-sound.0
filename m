Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2048.outbound.protection.outlook.com [40.107.114.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC19A20ED;
	Mon,  1 Jul 2024 00:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719794345; cv=fail; b=AKnC1ZLyWM/yr5a0saVEeVy3iIoTbDzId9KnPAGA9RVmOAxuJ2M67TM6rRtMwmHWKdeJRLnoaVRa/hSpoyP5o0yloWV0VuxSAeifFmhJA4aHgXhaJzqYzYhNwi3EAJPlrZaDXawb5sFuPc9qRZ8WMklyQ2w3+H/OYsi6W0rhGgI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719794345; c=relaxed/simple;
	bh=clE0PwHFfoUcMRI1Hgl6b2hwemaC25mDPCx88la+05g=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=k9K/QmW0I6f7wrvzo8jM6H6TuWc0fWHHcxkJw7arbFP2I8WWyFegoCP+bjuUE77GRqPoHNcrHPcLDbPfQEX04R0F6yzCI9SgDK5xnL2ObgcX3Hdf4+JT+CX6Ui4SfzOQlCe7b1Z4S8T5MuW26BFXZd47llk3vOTmqmZjVtWvBRk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=BgLGOawl; arc=fail smtp.client-ip=40.107.114.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="BgLGOawl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FcIBGiGI2gNgwb57NSg+hJkEKcuM6v20fRGu/5dmNwVnCnR4Ov7KIzv9E0RsZ8R4IgfT529lVL22DG066mo7VXR9wPsUeRDIkXBtPBZMBHpT1EJ87ovhm/LV/eQalGJQguJZHBuc/umoP1RwAxn5EShkQMazIrZfUkrN6lte2GjxUwVtLU53nrTGhKykESHg7NsCFr5lXh5n0qCULUF3X3he11XeB/6cMY6RXNNE3jzeTJ1+eFqkiiiP0ehWTyJKFj0sswuTjwFMjcREClHGs5rnAS6yLufGVKBgYEJzSq4XMpe/Vzrmnr2Dgh35ac5KQL5CJpSlVnS3a2NGCBY3pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AlJaWxl5sojReKBVPV/Q5RUYixCBJ/4QSDNTj7yNAkQ=;
 b=RzHSEHaGHvVmG6SuFvEy5sov3wdyPtth753LOPqGMAJNgDBovIDAjkEjPOdl6vyqADSFyXhiG6ScnPO2OogW8zjwxtAEbCG2aR7XzUbJgTt7sdWRTlCRShD8PwMmrhlQRwjSSnLtch/sQdJZkgdGMYnvU2HqptjrXmAysyZnL+tbkO2eb3dq500+mHpLqKf+e1E8OfDnWnrOVdMxtGk6zeDwRu/F/DtXWmZq0FQFX2pz4Sclo3XFOGXYnBF7DbGVS/XydDG2lUf3jTPQZ762UI1YqbmKPubkSX0ZUqhBC0KzH12IOE38X7oTZGZ46u/R5ARLQEFCPtJ/F10391qdjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AlJaWxl5sojReKBVPV/Q5RUYixCBJ/4QSDNTj7yNAkQ=;
 b=BgLGOawlcm8KDWuHfKB36ak3UPkF7Weg4heKm7c0WlIJlwpnUYgwbaiLS6J8R96v/knQC3ErfZrc8LSKdM/ttnXnq/dQiZn6G650i4ywT5QgSfiuiyvbvncRxujOXeMZVGO5QqVofuaQFymPmyW+ccG9nfxdE5yRg1Po8GJqYmE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB10788.jpnprd01.prod.outlook.com
 (2603:1096:400:2a4::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.32; Mon, 1 Jul
 2024 00:39:00 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7719.029; Mon, 1 Jul 2024
 00:38:59 +0000
Message-ID: <87le2m7xp8.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v5 2/2] ASoC: dt-bindings: simple-audio-mux: add state-labels property
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Alexandre Belloni <aleandre.belloni@bootlin.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org
In-Reply-To: <87o77i7xq6.wl-kuninori.morimoto.gx@renesas.com>
References: <87o77i7xq6.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 1 Jul 2024 00:38:59 +0000
X-ClientProxiedBy: TY2PR0101CA0020.apcprd01.prod.exchangelabs.com
 (2603:1096:404:92::32) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB10788:EE_
X-MS-Office365-Filtering-Correlation-Id: fe7ba5b7-eb8c-49a5-41de-08dc996632c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+JEz/onquIB7V8YmFqtmuMGVT8Vm3zcQiHdfzgAbE7ghakuJR3TmydTMFevl?=
 =?us-ascii?Q?EU1sh0kLzdmvwm97/tPCK7yzstzGZErgFnlqJ8MBzW9K+iJO+/bv2LiJtFAA?=
 =?us-ascii?Q?h4viUT1o42J7ATDFd7ieHXdIBxqZnFQ6k1kYXguRAyDiDCPIptrLvVu0UbxT?=
 =?us-ascii?Q?M8x2BEL4MyIKxtas1D3auVw6QdTcUsE2pbEnL91HoXA3fo8rk9+hk5i9JOiC?=
 =?us-ascii?Q?vY7/BbGrE/DkfJYWPKB/WVYDf/75I19FkM69ah84Bu3aSacrDgtS+gQUxUrL?=
 =?us-ascii?Q?ztlIilUceZVXTTkJwRGxHOPYiHiwib8XvMQdwpLPegImB68kaE7/pzykqL0b?=
 =?us-ascii?Q?kku4aJjA5vnYUZ+q10fgKNzcQ8WX5+0CxY59bGJlBlfZKd+ws/hdyD3zOzIq?=
 =?us-ascii?Q?V3sutaj+xV0SqyZnGsS01nrd5uRHjDbmeseWwMVfQPWCgFkLqMpfhBIVIa/F?=
 =?us-ascii?Q?eABCacyI0tkMq95ZMUV95pdEX9mrAplNbnVnfZChv3g6wy97RJwhn7ccADrh?=
 =?us-ascii?Q?KoF4Esx7EntqvNPPgfsA8tDoipJX8Zn7j+YaeR71VQKzxuHw9XTAl3csQg2L?=
 =?us-ascii?Q?K2cuS5coUyvHe1u5ViIOZgBbNPfPMBGnZUgs9/+EQV2ffDixhFm2OgJ8KbSt?=
 =?us-ascii?Q?bVDwqUyWnZAfN4qkgANBkTrSb6OKsh7PP+CrNbYlP6zcdzGkzUW4KcjWdEJN?=
 =?us-ascii?Q?8erTF+b2acOE9XR3H51CGeRqgj83BPhUewkSWkx5jjMO9gMMAqixX/Cy4oTH?=
 =?us-ascii?Q?kUceqzhF3IRnwGW5vBak8GuhE4nfsCrvmFrhv3xnbqeXJLwlR+v9+m+TQ5Ju?=
 =?us-ascii?Q?mEiabHx+P24HYL3MJGiKCgpRNj9Joj+hvNzV96j2jzPSqAc70cyl100D0byw?=
 =?us-ascii?Q?DqKeVsXUBH3NKhWAv5TdIBMsw1WVb+3B86WUX3tc92XLlqs9CrNXk8RXWuVT?=
 =?us-ascii?Q?Z969rNozayCcmRNrbTTvt50UvToxYdeg4dJtZGVx1wesiyDaJG28K+ZaDAjB?=
 =?us-ascii?Q?pz6exYL9MrsctYsT83cNwirtbZMDyqXONW8UIWOak7qCTq92CH4EJfaUqkYY?=
 =?us-ascii?Q?a0G209j58WcBHLL/8HAR6IZfiG2anWTN3Lgd7gj1axDVkCiJlEVQYHcoEtFe?=
 =?us-ascii?Q?+TE9iqyFYHWnlilW6jH287fcTAKt2RlAQ/C/LduCmy4orQAuidHMKiaA/MB2?=
 =?us-ascii?Q?X1LLRhuVkv9IRavY/bsBHOmbTeKVm0hr19pPQWsufqpfwlrZJq8hNG8Z74LX?=
 =?us-ascii?Q?6/Ih9XxhaIJJI3w1+6hGZeCCnyBzWTUZ8BbYMfEtHnW/f3cX4iNMWlwL9IK5?=
 =?us-ascii?Q?KlRIFBNfkmF4YSRRT0zzoE2dCp1VaS/U3UWQzrxlhQ3+8348+/hEU6tBEYwL?=
 =?us-ascii?Q?KwMKzYKlGOyqGjERr/dVzAHSZUnSTMRqPDTChokLuJDYGKx7VPxZaOZqS2wE?=
 =?us-ascii?Q?olrD22fptLc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?94cn3TLEFLJ6whkwPWKTRB8fyWWkcJxePtOsk/9SNarslqA4BPFDV/EM9n8K?=
 =?us-ascii?Q?svocgo+kPafTaorKOMFFu/ElG4EPaaDv9kluPtdu2Sxrc2QUcD8k0EdAHkcr?=
 =?us-ascii?Q?ihW6nkE5KdpaUU7Af8G3WZOcUkv0YqxEheOnqma4l8+eM2w18ZVbtTiYd/gt?=
 =?us-ascii?Q?C7hhM2gYuPtRfyK0vPHx5pwj6naQNk0VCY7DmYPcyOzOQyS5bQAu6DMyWNby?=
 =?us-ascii?Q?BarOlh+DcL1N8wGW3I7Vwmvv09ZaB8XIp7Hebw5b4SGQgYz/WsGviph8fdLd?=
 =?us-ascii?Q?ruNecQvkio0IqD8vbksBtYjYJYCYa5XdZjXYfq1cweUi0UVcmusPN6G8OSOF?=
 =?us-ascii?Q?MoE4A0mYOvSdFoMPoujf+tj1A9Vz+R9ye/iL1IyBqOFMPJYxFKmh4RpAmNs0?=
 =?us-ascii?Q?xWyLHg4LsuRgaYR0d8ijLvUVkXGDETNWut8WmAPUFBksCMDZdn2G7x4KPP+F?=
 =?us-ascii?Q?iBBaguz4fLtyMoXf0rsM+mesa1IoasyBnsOD4jvoCqR7BK3QJZWhJU7EUCk+?=
 =?us-ascii?Q?gGNqdcaWPuzvlrpubXlDX2iBPZ602158IsF2Nhs6rwGkl+vHUL/VUKA3tCVa?=
 =?us-ascii?Q?71G1FEe+6fBAdOuwFpFfk3IVlianwMdB9o2khBxdJqmkQIMNc8MI2wpN+tbe?=
 =?us-ascii?Q?MKbEKvFrz0A5Jm8hNAx4p9Iuxlet38dVIJxqoBFX72K40h0ik8sXqUbBr07B?=
 =?us-ascii?Q?/o/rRDB5Dcwa5lpy1XonfI9ciVNjqgCJG6Uo+bX/MIzU79bI1y1QBtVBtfmn?=
 =?us-ascii?Q?/QwzGLutBOCLTih1oiGPMsGFE4e6223neiJKqsaW8cu7Sz/73f8H2iUz675o?=
 =?us-ascii?Q?Mcu4lWPMPa3HvCeOG3cCmTlQsnO5NSDYQ5tbQ7GbtPsdXicsh8vPbVHU28WL?=
 =?us-ascii?Q?NkWVI3etmqPDK0y7VtqJ6OrW3zServfvA/jqyYAj9ramBWvcruOWzHRwE+WD?=
 =?us-ascii?Q?Cwz0Ct0ZTljLPBruC2QCiZgRZtF1rpsXarRZ6IFGUUj4wftf0XDAReAv006k?=
 =?us-ascii?Q?+4QrD1PO5nMEn11/xSgnqYym4PC1M6c2McRjq/fjwLvY70hkcMOUv4QwEp9n?=
 =?us-ascii?Q?NST1QctZ9SKwvIYaaewLTBlTuaVYdXDdUnadJ0/3TIzkI/bBLQhJjBrtN2sx?=
 =?us-ascii?Q?FIfVgtLMdSp3xfrrUl0CEUSuEzKW2t2EvXabSw3PnHUBybnLjrPBP9gGuV0y?=
 =?us-ascii?Q?Mac5F/3DQzTj5YBxN73sZqVlXDJeQ3DXyGrTwxQxf5gb00RgcZm33mSiN3XH?=
 =?us-ascii?Q?OhM1lvqBk7p0WtX62EPLxpTc03ECd+jQT0PXvE19j/7qgPG1MqNnZkVOYeG4?=
 =?us-ascii?Q?wTDUonr5uLGBe/UWjQSpTSAwdPm3f/XwZngIxT6CyNP7vy3Cw2nArJevDRVu?=
 =?us-ascii?Q?9kZS80cSs0tS19TYir3kVbja+LKWmUNkxv1ii6+3jX8vkIopJ23ZBGBdOLno?=
 =?us-ascii?Q?OAIciftfX1sFKfIHim9HimcqSVeS+sRlWayZ8hcc/Ie1e9qcl1tD75DzMcLm?=
 =?us-ascii?Q?xjKshQgb7IxTLz7plJmcgUPjEit5SJixp8CtVzci3OuU49RMAYgZm8nzv5T3?=
 =?us-ascii?Q?wTxQ5OsaOWR1JcpqkL8iOQ+RlL4T9t2r73rkixKCgliKWoGCSdKczQFV6CNZ?=
 =?us-ascii?Q?uUOw/T5FUR3LEXf+NssFxQY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe7ba5b7-eb8c-49a5-41de-08dc996632c9
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2024 00:38:59.8918
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7pD6CdB7tpHjEU6uoVytMCgCAruszDcJcOH28bEN0VI/BlNqrjCJRq8Y94zKQmzF5FBTyC33Y1k5D9FQ4hlTKW01ueDOBtsn82gajLLD2fov5TvINgqWrzMOQ81SoV8+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10788

simple-audio-mux is designed to be used generally, thus "Input 1" or
"Input 2" are used to selecting MUX input. This numbered inputs would
work, but might be not user friendly in some case, for example in case
of system hardware design has some clear labels.
Adds new "state-labels" property and enable to select MUX by own state
names.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 .../devicetree/bindings/sound/simple-audio-mux.yaml         | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/simple-audio-mux.yaml b/Documentation/devicetree/bindings/sound/simple-audio-mux.yaml
index 9f319caf3db7..194ac1d4f4f5 100644
--- a/Documentation/devicetree/bindings/sound/simple-audio-mux.yaml
+++ b/Documentation/devicetree/bindings/sound/simple-audio-mux.yaml
@@ -24,6 +24,11 @@ properties:
     description: |
       GPIOs used to select the input line.
 
+  state-labels:
+    description: State of input line. default is "Input 1", "Input 2"
+    $ref: /schemas/types.yaml#/definitions/string-array
+    maxItems: 2
+
   sound-name-prefix: true
 
 required:
@@ -37,4 +42,5 @@ examples:
     mux {
         compatible = "simple-audio-mux";
         mux-gpios = <&gpio 3 0>;
+        state-labels = "Label_A", "Label_B";
     };
-- 
2.43.0

