Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010030.outbound.protection.outlook.com [52.101.69.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDEDB2D6407;
	Wed, 11 Feb 2026 10:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770804539; cv=fail; b=jRqlKTi+n3QDGZyJ3oVnaMziP1yUkC7C7GW4GsmGyRaHWwyMpaYLTqWvzTD8hj4CEDXxZ6xbiQ0zkK9Br0phIvlELx0PzPLAxcTkShBTU4MaiE/UBsGpN9iCsqUeHOnBDyuQxE2K+m7p4T8U07c3J9aU7DXDpmV0WNEY4who3uA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770804539; c=relaxed/simple;
	bh=cuk2tlgQ1o01pl27S98DuN/78avM2UFfHBBXfoPhnKE=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=VCNEM5n9wYeOrgxN31svIDmsj14IOTmgTFYggkAPAclvBR9KRCjcQGYWrTYZAlMFJ+A66cbcfjF1bjAJIRhQiquarlavvG4NIeOHiSaYW/vS7xzYsxgNhzIroITXpAd//qOkF4Q30+LJkqZrvsyhXlUBV4tYKP5cxy+ZSBW4M6A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=PKQP6KL+; arc=fail smtp.client-ip=52.101.69.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="PKQP6KL+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mOfXuQSiJ7xpETc5P4mIYz9Mi9VjGffYeSIbJQjqZpIlgX0jolo3lwcfe95dFQE67Utuya0TSBUdwTeZXHYj2wdIIjjBG+aoOeh5saRLlAx42Nq/TvbXMzYU/1Q1i5+3Yj7Xbyi9b/wEU4w6nN4RWrNc3PQGQcOeWI8Q1GpaoW46E3VLEvUbg2gc7ftDwG4Jkm9FIEQqXBOLCcV0bNXZSl9hKLT2vJ4PjhUyTRa5ln9LXeCZRG8unzlZuWrGNfJwbh84ItAr83ONcBciUmoJI9QzrCADvw0ZBNE4tZ6ldMO9bl1I1FaLImlJLITYRKrI5pQw3C55Dm0AOlN9sK6Utw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kr402wQePMictHd1Na7xhXOG3noSmhYWF/O5z3nNRzs=;
 b=McQWUPuENaqgZzC0awtVQEbRBdIdr6l0bTo2iypn4sS/CniCj/rXfA07okImxcqUIeboxPbdFpZrvtL7WFAddq6dZq6FofB+62/Zzn/Do8x43SrDaDqoBiVe9PTs5zoh3jMUsaww1pz6E+a3g9BfvP1YzwOfDARGOYndPaAewB41YyhwQNs1leh2iOnJ1BxbzvaZszkwhEzOIQXO1zykJhCQc1VtJWs3DOxJUEY+Yyt6Ul/gD+ukZMhlsAHsHUpgqqovbfwa0VJ3O9vSlqA87Dgak3s3zEkISpeLtyPslVafbYdcrG8a3+FtYg4N2+Fwf+P/F6CI4hNkv6g8gRSktg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kr402wQePMictHd1Na7xhXOG3noSmhYWF/O5z3nNRzs=;
 b=PKQP6KL+CcoS08a9lpm6cFe+5geza5H6spv3Jz0H0fLishwf8gvT9Zsjv7slQi21flXP1AOc4FcM8UF3Ns/RtM39Q/lT2/CY/BLCFHq9DvAynW2jflE87sQq77u1kK7aZTqkDZrWIUYMGspmx0dQammGpLZZWZKCtrid/Sa8fzp+4+dryQrXlefKmFAIT6l8NFOwq+CbwjzdqLlwvlXlpYbkK/DFXJm30XiFscanHyeht5+dGKhQ14ipb2kqZczO2F4ZXJwY1YaGLGBj6HU1oM+LJb9EgnDboUi6iRlFsmxid9X6jBVi4oBajFYYwINtHxvv4EvSBxfKa5iPPfjAKA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by VI0PR04MB11992.eurprd04.prod.outlook.com (2603:10a6:800:2f8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Wed, 11 Feb
 2026 10:08:55 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b%3]) with mapi id 15.20.9587.013; Wed, 11 Feb 2026
 10:08:55 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: dt-bindings: asahi-kasei,ak5558: Reference common DAI properties
Date: Wed, 11 Feb 2026 18:10:09 +0800
Message-Id: <20260211101009.2895296-1-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0091.apcprd03.prod.outlook.com
 (2603:1096:4:7c::19) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|VI0PR04MB11992:EE_
X-MS-Office365-Filtering-Correlation-Id: 86d9711c-f4c0-4003-2536-08de695590e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Y2tTf7RVXZ1sQAjbd4c7KSObUifyLsYt0lWWbKYk/kBjom1/9c/hx5zRGKyC?=
 =?us-ascii?Q?RjghtW4MUVvW6VObK820QTxOcbX92zfkGzjk8Rjtmi5/qX+g8+G7N96tz5aT?=
 =?us-ascii?Q?fsPvv5XIJEj5k4JC/Uk1e5LhA+jsj32Tm0OxIPtVG+y8Ovaze+hivb4jxnRc?=
 =?us-ascii?Q?k4PT2WxF5v2+QNoE422pLP+Eo5kwPCcSeVNTcUyD7fcsfvxL8IFrbllpXJ+v?=
 =?us-ascii?Q?dfK+rbvdJuEzp85Semw6B0XwnCMMtVzA1jZ+/oPh/qPnNiV3suN4VLAeytuP?=
 =?us-ascii?Q?8RVvyLIjYp3UdrJQxjtXHVoXtvWVv2fnOQ0aN4ZpxHPPMdaI4s9r4bNazUEX?=
 =?us-ascii?Q?hy2FblgvV2zbb5gZ8jz207UNTxFGy8NOKP7xp/4oq/oCwkkgAImB/4psnU9v?=
 =?us-ascii?Q?ENlL5SFxmiYkEuVYW+azBZiXxlmKFkcgo/uTNw26nf09V6Jx4YoZ46ovmZCf?=
 =?us-ascii?Q?Pd3jbhJNDwgdAR2p2kYnHgCdMFSFG6sWfXa5DGai1zRwvj69BQuYmP60hTHg?=
 =?us-ascii?Q?sWZgVlv4UyK6+X9Y7uSHR2QfoeytChwErtFZGLyjUnZchpcpjTvozJFwfQaU?=
 =?us-ascii?Q?RFh3xHIsso+B39LVgdSiJwKanXeuqdSDS9s7nqesSOSEFpd5zrlzUzijsAac?=
 =?us-ascii?Q?0OejKZkQprcWkDEf38SElsuJx30pkL4kPFlXDpj5qpQG/19/OtiiqlZBNtv6?=
 =?us-ascii?Q?GANujKTbsdvHCjuecFSa0mYGN8oQWcj8mTmz6Zv5xF58AFMlds/Ej6Z0cShz?=
 =?us-ascii?Q?Qsom1ak4p2Isx/XmBOqxaG4wl431EMncTXioqC5Y7jsokOCDJcUB0bqhsCNo?=
 =?us-ascii?Q?D8apv/vA1eddb1tIzY3aKgh71Ppize6Doi+izgkm7wUkXqXUtNGJ67wH3l0o?=
 =?us-ascii?Q?9NT3HOaT4p+VJPAPGkn282DwcIqoL0lPLQhOhDWqZfOAgFyo7PNzNamDUf5R?=
 =?us-ascii?Q?itjSrY1XSH76zd5TWk1RPAKW1io+AQIO/oOTHg+Sv8xrRdS0eqCJH6/LSsF8?=
 =?us-ascii?Q?98SF5XvtBOci5WfYenhsKQygUAcsLadYWNCvmFbCRJwEKgaFfD4w7www3KB2?=
 =?us-ascii?Q?0GNV91riZ2P0y0UTe4p2Jj+1BcNc3a3MmIISGc4nlYPvGpdRI5aYkd2yzhBp?=
 =?us-ascii?Q?AhUsvk/6acVT7HaenMLGEdQZeUpd8mBsO0mXMTAfZeb/KMX0iVO/1CP3yZkr?=
 =?us-ascii?Q?Q+EyT8KkLfD8Pg7n26m7kfmW8h/ltbQBmVFYtloBPWz1myFEA7n46zpIOoJb?=
 =?us-ascii?Q?xrGINUZscT84o9eF+UBm8rl59DvENPZsjwpo6H/Jfph0C/GTUva4fd7MY/xM?=
 =?us-ascii?Q?UrXiXW0avXVkirt5nGqchwFSdTRyUY7Frzm6fbvswKZx2lCPvutGnEx9pICM?=
 =?us-ascii?Q?sv3a18dRvPUfvLzww1j1SsfDr72ETDArR0HxcU/15LVhHFCNTytgtsSdg8sn?=
 =?us-ascii?Q?Kp4OwqRVCKpQeaFSlJqB4PnOAXjQ37kbWJJYJ0JP02LY5QWuUKd0UYqdl0sX?=
 =?us-ascii?Q?K8SuHnW1EoUhs16kyAaK+ef26ptU/NsHrkPGfVNoDciDt8KSAkvVRyrCz8wr?=
 =?us-ascii?Q?z5vKMXjdgvgRokLE09CZqjoofAiqqi00O8ugfgfcmcdb5q9RKwsh72+c7wLV?=
 =?us-ascii?Q?l5wgiqXPFoPx4OeRBW9MSmM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eOhIRB8onwW7Mce89ZL2BsL+t4w1HJXLwvUV07RaMEQhVB6lPCanhNghjGlz?=
 =?us-ascii?Q?wkxlryvb9dZH/5NY/4zvBLbqYxFd6y9NN8NMH6voCuTCqthjyhUaYzj84OMs?=
 =?us-ascii?Q?2na9Nx4OVjvZ/uWYfqT6DcejLU0lE920WFVvFKQ6QMIvO5Oa5equJd70dGCq?=
 =?us-ascii?Q?FovM572uIZbrLxisUegL2Ee/WwGC4/ExzItvqKSJd6hCAxjKIDKu0ZemHPdc?=
 =?us-ascii?Q?2/OkJlw1AwAdiS+79TW1CCI0wpPHZD+1v09QbNeD+Fzklmj+ZF7s5m+RMQAX?=
 =?us-ascii?Q?jNZKiMbyaAYaz4touhd+kHhw0pANBwYepjKGzhegmZWRQbTssQivPe2at3w0?=
 =?us-ascii?Q?WOsYrXYHTeeiCpP+fPyrH/cSaESd+wjVyL/K0qviZOm4Z1SPgIDTEgnbbPva?=
 =?us-ascii?Q?nDd4V6j13Ih71CVM1MHRUvcE4C5IRFrEEGasUVc5F9i5nboDf2CV11D0o1KN?=
 =?us-ascii?Q?n8h2FrJMSJhLV+F9Q3n64Qtvng4WcHZlpw0jRrA7M00FqXP4SMtpGVXdfvCx?=
 =?us-ascii?Q?S3R/fJriwbFs0eif03uUf2985SBGyiIA2FI0/f99YeJVPv7+qxfmxDmUpvnh?=
 =?us-ascii?Q?k/1XkPKXF6+nqi83WJ4OeUAk3iRNinCMsIKoUQ3YsvlaPN3YNHdsBZp87bD4?=
 =?us-ascii?Q?ymbeWILKreZ9xSucWLZRGUj4ldSJA5JNjKTbB0MBJaQODTnrfafIgnTKgTsW?=
 =?us-ascii?Q?DR9nFOugThL0z+QFn/Q3IFyFok2znbpQpIns0gRWgnO2tK5VZFEm4s6IZJ9J?=
 =?us-ascii?Q?4nBNjFreAM6BNMTaOMVr282L3gmN/toKlgbiUKvU8/F6AZRoWLRcx7M3WHlX?=
 =?us-ascii?Q?51VZ/j9oIsPhZp0grQydAxpnthtKKF97IfPzd74zeulvCCLcPqa0F/czD1s8?=
 =?us-ascii?Q?c2N3vbFGCazFt2Xiac2mBt9vZ0+GqoDQfHvc6EF1SyBIytW+Fh0LLkUzu5cR?=
 =?us-ascii?Q?MMVSfXyLVQdLcScqqZDWaeghD+7u97tz/MY9evFcNEALxlDH+Ajh3F5CiUKT?=
 =?us-ascii?Q?d0Gxqbv8sQuA6KX8UiHxnLDxQKJeQsT27bX/Gjr0oW0PpuVTcMENnRicwN1c?=
 =?us-ascii?Q?THRDxXgHkXuxZ5DD3bzxGXihBjUTNIhes0U+va2mrAWGg+YeI9bXy+g3rJd4?=
 =?us-ascii?Q?lNsy8uuSMs0KxYVwSPCBhuO0TMewS7A/jBeBbtM0CVrlUNzlRZv3hkq81Boj?=
 =?us-ascii?Q?ldHRObR4CoEhsjIk3MjzDdTYRCAa0zD5ymSpDv91grYeQLHBxrV0LXfPFByG?=
 =?us-ascii?Q?Sdr9JP+rZhZOCzizSDjhp3+S2G74SbCie1vgaIndekg8LdKEDIMeFtO9O4YM?=
 =?us-ascii?Q?TmQTMMzm4u40OhypDIDjpE0zbosgFl+Aqmqb1oZOfrt/OqNAc1L2bJoMXBHZ?=
 =?us-ascii?Q?5ilZm1eipwJO+0m+zeb5s+js+RISFpdRgdSg5utummjgsMS6wJqfiff2tQdD?=
 =?us-ascii?Q?H2CMpElc/O9SnW1RmcZUYaM4IYCCbDdK3LFINNiT+pWnb8KmvXNubRq3qPW+?=
 =?us-ascii?Q?PiLqFew5yms4Ex304pOD+tNJbZWM+qDiJJZwE6nHpUfxmjAWN23sPZ87Yiyu?=
 =?us-ascii?Q?wCosnEurYGWnCcL3SIvqblQLcXIzI52gIoMPFUISwR4NiFMILks9S3100SIA?=
 =?us-ascii?Q?chzk03ooeNDTkEPXAygIarf1mPdBEOOTaxINwyHIorr8+ROuVcoIhKTv2Fsp?=
 =?us-ascii?Q?pmkQxPyX2BZORHl8UTb8JGUHldwKZhI2eSnRsLdtCtBnFDXjrFvjxRAt3x4k?=
 =?us-ascii?Q?RccHqvEuhA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86d9711c-f4c0-4003-2536-08de695590e0
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 10:08:55.8305
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /si1gtDa5+CnlNY7fWR5/q1A6GV4OtTCbgqcTh28ddKT8Az1/E98z5GcipOq9XhMZEg5+H8LFXuT8PJfBXB55w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11992

Reference the dai-common.yaml schema to allow '#sound-dai-cells' and
"sound-name-prefix' to be used because asahi-kasei,ak5558 is codec DAI.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 .../devicetree/bindings/sound/asahi-kasei,ak5558.yaml        | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/asahi-kasei,ak5558.yaml b/Documentation/devicetree/bindings/sound/asahi-kasei,ak5558.yaml
index d3d494ae8abf..5c2f131c86c3 100644
--- a/Documentation/devicetree/bindings/sound/asahi-kasei,ak5558.yaml
+++ b/Documentation/devicetree/bindings/sound/asahi-kasei,ak5558.yaml
@@ -32,7 +32,10 @@ required:
   - compatible
   - reg
 
-additionalProperties: false
+allOf:
+  - $ref: dai-common.yaml#
+
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.34.1

