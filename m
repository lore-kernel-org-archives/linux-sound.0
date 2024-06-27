Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2088.outbound.protection.outlook.com [40.107.114.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFEDC1C2AD;
	Thu, 27 Jun 2024 03:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719460335; cv=fail; b=d8QAxYykq6ntsSA4pj/HYlMmE5tXp0b+i/qjUZqgSIo7xjI98HhWY05tCNU+ohLBETXha4dAm0wzG5O/dHrgg7htRiXcWcYxmpmtKwXWVxYO98BH4V7ze/BgOa7l8eIouyQv46oZgvrZScGpq9gXo2JzIeYsbOyR3CNzchpdmkg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719460335; c=relaxed/simple;
	bh=CfimTb1EHnsb4+4k4dgpom5ojoyLgAXCG4OoAJTqsy4=;
	h=Message-ID:To:In-Reply-To:References:From:Subject:Content-Type:
	 Date:MIME-Version; b=AUJqn7kIyEbTZdPNqdkCy1QAOOHhm0eYg8Hu301JE4KIlraHnYU88tKNwPIFr4XMCRl2gkNGkvftFgbmbrb9kXsZFfDClYOFUOqhhMHB3a1ZUmzyyrS/aGDWQ1wsjUA3IsbAjmG2Cy+TChITNl9AWWfeaSFUrQB3846qy6Vh56A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=gfqjZ95m; arc=fail smtp.client-ip=40.107.114.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="gfqjZ95m"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sc9VZj+C2JzeRO6LADaj+rjoLkLJEPIG551b92WG2aUmNCDnLIhaLF/UalaCgNIsAtH9nzLnZ9Hm/PN4zHtSoZlYV7YXZ6ndFM07Z2BuZtv565/p6gDlthrTgH9MX5p9KzxI7OtwO5WzGBSZdrHqyMurgK3+j1h1g7xahNO9HJj8YA0hgztvQfzrkELUBPcAIzxrnKVq2g+elNBk4q2Zzucd5+ztoVXsUkVxZCVhPD0wZtRbRtTG1Rz+tAtrpTogIo41Rj1dHXRZw38Cq2uNJHXSQywl82n7WArpNAhVALgCEf+iF2wwcOPH+Qu1bp0dB0Z//3jyhNTFVLebTQPYQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rM2DfJuMHrl1e7FP+nknzfcN6G4dSbxhgsU9WOrnPic=;
 b=e5F7N37nKi8EpiHbhFsT8YIm3ScAla3y7j7XYtT2BmSetAFh9cXqX/BFQK41/WExR4OWpI+YnRoFMTiZ+K0Sivn6VTW9UCVoAIaEKK6ho1fTvy9aOjvKEz7wx5sLo6pC/od/MGWbyKhyiSDeJn+qObfsUe416eV9l2ylAReVRIEv5xVW3QfZkWOrkx10gHuB3fQEhYFh2pf/Om9Xz9QRhF65sxCH3rZFxJF2HWaRhMLRpamU0G3Ocfjz9xsdHfq6BMt089jzbAeNUNXbeFhrCtrLl71rARxc8gLAb32k0lVvGIlwn50cJp7B7bm6eCMsih8syKB5BhXbamkpaHZEmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rM2DfJuMHrl1e7FP+nknzfcN6G4dSbxhgsU9WOrnPic=;
 b=gfqjZ95mH4zNzlzaOLxFa3gi6hBxC1t/lCX6SPvXQuG6IOQlJqX2mhQE4wgIlLDUTLhupCe3MIiEJBA7uSDx5ufrRsfSkrp+DOjS0WqEVT8QhAol0oJy2JF8iwzfrngitYbRBdLnTVhf5xVhduWG+4DU+Yo0K7SDlde7OrlHGQI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB5782.jpnprd01.prod.outlook.com
 (2603:1096:604:c7::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.35; Thu, 27 Jun
 2024 03:52:10 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7698.025; Thu, 27 Jun 2024
 03:52:10 +0000
Message-ID: <878qyrqbyt.wl-kuninori.morimoto.gx@renesas.com>
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
In-Reply-To: <87bk3nqc0e.wl-kuninori.morimoto.gx@renesas.com>
References: <87bk3nqc0e.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 2/2] ASoC: dt-bindings: simple-audio-mux: add mux-names property
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 27 Jun 2024 03:52:10 +0000
X-ClientProxiedBy: TYWPR01CA0041.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB5782:EE_
X-MS-Office365-Filtering-Correlation-Id: 3572b850-2650-4948-9d81-08dc965c85c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|7416014|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?raSBGYcmnhuSNjD4u+NfMLxGD5JW1HbqmpE+jkxNDAMOlZBvMcLhoeczP17+?=
 =?us-ascii?Q?eT5T9M5NmTwccnA5AFY7xHlAiDP7HKeCN1OK9/iKXBBeeB4xUfpZFW7HySwj?=
 =?us-ascii?Q?B1SNggtK1IquNW+k6pcMSQr1TAG/VYTqmBjl07ukqlqVBNUro0swB6LyYzRW?=
 =?us-ascii?Q?VxU6y40ecVfPkqfcse423+jLbpqAx0sLbLMc5RJLOZmoAr1hcafhOa1xtxLo?=
 =?us-ascii?Q?ex6vPO6eVXd6oy/9/NOBqXwuhH6/aNwH8ZNk2bDYP8JTN/ZSvRJDt5ZPj5Lg?=
 =?us-ascii?Q?8nzjOo+NpaZgEPkCM9Y1p01zb1VrJPfYfv4zlDXGihzpEHrPsDyfj20TnHT7?=
 =?us-ascii?Q?sR3mWHm+hrIWVHdrcHfNZJoorD8DQ0AoACxmBkZ5r3JU6Wh1v4DwyW0IHxCv?=
 =?us-ascii?Q?VJyDZ6MDJI6+C8MtnDgIruy4vfM4PJoPmKRDmrGEL0v+C3cQJKWF3xKMB8GX?=
 =?us-ascii?Q?MVpi1N8WxE8FyPm4/96BHMj6wx2ihUJYSestc+ZXGyoTJ1SjoUJVWcazIfuu?=
 =?us-ascii?Q?CH8UUlis3yElUja8lvtGuxnIEp8QQ+jDrlsBE3MtrZofoO95Rcq6EccLDGCO?=
 =?us-ascii?Q?3a93lD+nh4ib5YsUrCl8VBr80d4oR9nsOtvBVNarg8HXUkGds6SMtF5raj8u?=
 =?us-ascii?Q?ACElGvchHnevnJGTLuFrXnP3Ds7AnIwlUrg+qudwCJRJLSlrDaDZIh0DNDeb?=
 =?us-ascii?Q?9CKU4iZOSi+4wCcoL60qDwGCzYembF+JnnZfjNg6TqzUoC4MRxLaKB3F1O05?=
 =?us-ascii?Q?7nhS9wATBp4FstHDCBjx9feJZBH0PV53RVACJe/DS3r10RrBc+Xn23QBYZS+?=
 =?us-ascii?Q?VQwBDYCKRpd4+3JX87AfyUi5h6JcF8eJXX2n0eSM8P81xCcPTV7piz7Y5bXZ?=
 =?us-ascii?Q?IqZlaUClx/lxR7m1XLYW/by3aJPuX4XZwLpyMhMFkGD6Vjda7wjJf/G6cAhe?=
 =?us-ascii?Q?/xnKv+wF2TTulA78ukn/AGbbOjS9Kqx7jMQdfToQnmRocMfspDgl6X076J6S?=
 =?us-ascii?Q?M3FmC0yO32dWEIIBmb9grHDzevSmVke4MHA1hPLuCR2EgUBa3/jLU9CtA9fM?=
 =?us-ascii?Q?BMY2rTM9eZQ/do4JVLlgl5Ao2EgYio0+CzgMBDrSuVtU02XOtoWwRxRrs39V?=
 =?us-ascii?Q?rOhWcgOVzGq7jAKkcOZ7crPnpWrB1LN6YpDIa8IQY7OwSESmGeUMedzC9h7Z?=
 =?us-ascii?Q?O0bvkouTm37Ks+At46gVP4vBsvKbujePpSHvS1bdDQMx9oOxzKaeSbP1z4X4?=
 =?us-ascii?Q?oIQxLkuO/DbDGm9+mqSIxOqScWLGbt0iehTIY35XGF5U4mKrDWFl09DLZLUC?=
 =?us-ascii?Q?676DZPoa2PF0qASAx/BkjKDlUKoouqthrPec83pm1xA6fkbicdB4hdtP2xOm?=
 =?us-ascii?Q?6dzt8K92lR89y78o5hLTe+NkbDlzZZCQlmpH8KSBj64Fv7HaKxRJ/vFm9gJp?=
 =?us-ascii?Q?wgabhxB/2AA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(7416014)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hXTDB0dgmVJfb/PTrbk1CrXZ4NvI0KaKsRgC8gePllHUKFHRiiF5hox6xu58?=
 =?us-ascii?Q?b/Sxzi+lp83oRnStrSUsIo9omJrRa8u8omrOdSqlPBhO/Kn0cklWasAHoAH5?=
 =?us-ascii?Q?Iz1EHvKHjoyFGeBt8S+Zov+D1oqz+bLfUp4ocLm4pobfSrWD17C9sWtZmU8d?=
 =?us-ascii?Q?iTI9Zral2e+LAZc1r2rB2tFW2OSr88snnrgGFQMf/7XuWkrmAaH7/GsJOeHk?=
 =?us-ascii?Q?xZmfxQtZKCogrvlhCRu4kSMX0kRd9jCoE28tEsD3PEFCXBo+PnXYLP9YAjSo?=
 =?us-ascii?Q?gOV23CfZTeafPsngLTp66hi52sf7Ueqf+qiycvCN/Z+Ky+q8moGZEYnQLEVR?=
 =?us-ascii?Q?m5nzgMU8LXO8FU35yeoudcI3T94qj7e+0lKjkfU0UhHHuQHKowNJUjw6S7go?=
 =?us-ascii?Q?YbcIJPqzAKb+sdQU/UglUl7z3UCi/oNY5RS5lrAvNXKAODboFfjE4u2lUBcM?=
 =?us-ascii?Q?KivR2ul2Y6xnKrBuY+2PTMQf920JDrGZ8ITGEbSoysGtn/vOwrbvxvJTQZDp?=
 =?us-ascii?Q?cqoiV44CvM8oyHEYKEPYX2GQp5/j5xqAcVi6CEti7zHVGQ7g3Orw+UjIItE5?=
 =?us-ascii?Q?/n4N//ZLGl5X8hb9er7I54w1UBZtT72rquhD2GBhhTkXVmYSAFJ/pDmxwAgf?=
 =?us-ascii?Q?/qT5F2O4kCMSxMm+kjx2UqE6kLdipqfw6+IgaUantUPYdOlsUUxpBqoB52OT?=
 =?us-ascii?Q?tf45AA4ZtdX2Bxww0i1q9It1+vCST2praATRUmkf4M7cgwE95SLPEaKMaL1O?=
 =?us-ascii?Q?78txbdt7skZ9UvRZ1oaKPIxRzS8FkFiEaUQSRnRIo6Gynx5we8CYLI705q0u?=
 =?us-ascii?Q?V4A+yx7CfM81+z9GZ+A25CLq3s2YdwbzmDVwWZiWYymeQ+yq0bKr4vAf5Nc7?=
 =?us-ascii?Q?M+mmm+8xfOCM7qtA+IUFmR34a3kEXDhylrquuKDdgJ4MEM9Xz9Y0mwDhveHS?=
 =?us-ascii?Q?8c38hmiEPXnl2rAcvwbQ0dneqRDIftjHzD6y86rbpV3/03UrzPwAmsdfHKNV?=
 =?us-ascii?Q?pNi2zS0+kl27N9HY/zZFsSoulFYRGdPj78sEuju4h+q/hit+2RiMUR/ytyF9?=
 =?us-ascii?Q?hrLoWg3IaIPcIOmWjrb8o+QJY6OwG9qEGc/Bum45Cp+X+kV3por4SS2v0rKE?=
 =?us-ascii?Q?/ZSagBfVNemrHZfHiAFt0vb4nJhNq1h4p2CatPNWL12Lg0BUodmf7R+Zb7Je?=
 =?us-ascii?Q?YW3i5FV7T1IwhHqKdor8UJVjsuHM25FRexIWQvElyak6jjop6NIqLHxAtJNY?=
 =?us-ascii?Q?gDesyAsjiJdJokFjdrlWN+e5GiWIWtkGwVfa534KHy/10j6KnXATaAPgcVD4?=
 =?us-ascii?Q?gx2wq1+WxY+UpUrCceqbGk6XDqDERHx+oXTQxjVuMVI3c2eA3PY6d4MzOqsI?=
 =?us-ascii?Q?+9L+7XUw4GL0DU6qBhSN/8CUjA/tCCw1XFPiyryFsCM+yqFl9ATh5P5KnZHu?=
 =?us-ascii?Q?Ic5NxJPTFnWDwBnispt0EOre4v1Tv8p2gJkS1LS3HVMWEJNHJVvZgIx1sOSf?=
 =?us-ascii?Q?mt+dDxLgMRj6fXjjkqTduUyMfoCaYQ0TE7GoXFcZRB6GSOKDXf6fSkAqtGm2?=
 =?us-ascii?Q?+rjVKYyvleiD+vDMG72xfKVy0zTjDRKeTNUc9FxN8mIhO47XCmN8CQBdhxTJ?=
 =?us-ascii?Q?2/JFofupP9/fr07BKyJ1c+c=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3572b850-2650-4948-9d81-08dc965c85c4
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 03:52:10.6130
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KxjhsNMBe3GUfGHy4B+kZlGr9yx0spIFN1wV8IWOOkRC7oQo3YoWWgzm4EYXh5T/6f9Noz7i6SUYERWN67MqDI2+woaGsBNsmB42ClKMPAWcwmVS0OMh6K8St0CYQzeq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB5782

Current simple-audio-mux selects MUX by "Input 1" or "Input 2",
it is not user friendly. Adds new "mux-names" property and enable to
select MUX by own names.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 Documentation/devicetree/bindings/sound/simple-audio-mux.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/simple-audio-mux.yaml b/Documentation/devicetree/bindings/sound/simple-audio-mux.yaml
index 9f319caf3db7..6e4018936887 100644
--- a/Documentation/devicetree/bindings/sound/simple-audio-mux.yaml
+++ b/Documentation/devicetree/bindings/sound/simple-audio-mux.yaml
@@ -24,6 +24,10 @@ properties:
     description: |
       GPIOs used to select the input line.
 
+  mux-names:
+    description: |
+      Name of multiplexers. default is "Input 1", "Input 2"
+
   sound-name-prefix: true
 
 required:
-- 
2.43.0

