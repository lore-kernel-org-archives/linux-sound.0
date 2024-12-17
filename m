Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010066.outbound.protection.outlook.com [52.101.228.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B54F98467;
	Tue, 17 Dec 2024 00:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734395787; cv=fail; b=sh7W2ABri0TiW9/mpPFDbzz/d3U3pxJaWZWah5PcqcAylXwWOMusLjXHqFD+VGQOfKiB8jZMqPKb7JJdbIfkfl8QY61aP8aMkXxodSRtz/Tb8bO8RXkjIyhqpXqhLbfreCAO2OSsWv6rbghtBo1acBUwzVxv58hD4B+LMhD2ZYw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734395787; c=relaxed/simple;
	bh=dz7tyHcj5QlLfeWSK4YB+1s60bNlPK8lZv8NLx1gl/U=;
	h=Message-ID:From:To:Cc:Subject:Content-Type:Date:MIME-Version; b=aCmrJskwmefDUA5a9ST5swRuzOap/dbEu32KW76cKx7IIqk6XmF0eSxvr3NRsk9tKj54oNoLV2TzJ7BCdipT6kCWv+d/zZ1hLamD4hnGbZTAfR8LqohALNBED+K2x19p6uRA2Pf9l38SWgK8KD1pnoknWh8A0TeBE6zEvDAYe1E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=LBlNtHxh; arc=fail smtp.client-ip=52.101.228.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="LBlNtHxh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e7/NFhzHMVwlSZh2CapKI6uvxvgeLLXgx2lm4fkO3O6BmB7bZ6IeUM0GjlOmYmSq7cL+Fa5h7kGSYnPCWnZJXC3iViQrBaaB3+PCLLabKFei+avO7uIVRB4XUL/6lXuwU+TBbI2/0V95R7TjvHxtrdU21iEYEpFZ8Uyjy5yozWxECqadVSqK9w11Lo1BfpAnR3prswHCKuz3o04WrfdlJJOq+LjlKPMm8AWl03UkLHk5TtV53QrOiT8rdTx+XmA7iNARJGYhzLpGf49+5PhHAMuL5yKKiGnfw4OWMqkaSSq91exDfIsuEBnRyVCtUC2jCSfELOP4nZ8dpEdqXURbLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q0taM9h9+Q7YV2GxobDv4bMAkwXGKT8qJngCu6qw6X0=;
 b=w8/vrIJSvkQpYjKe4QXHaUdc+WMptyQVOaU8J/2p2WSmf1t+vvKhQc9ptPFn/FUPkEQQAOVIN1oClmxUYHGquCxMTy1IlVEJthDxpBvTJWqj1UV1kGPW7dJIdMoWYIxD+cbSKlzPhycwE30cvvQKq9Vea7eE4hm0rs2FaX7Spc5L7USigxoNwS3mLHpMrAQsQMZHl9JH5s/Bc+2/QXPFWTtgjk2kjvACoA+eyl0kSCprpVSc/ReBYPtaRQc2K9iKPsMPXvU7Ys70GYgGccfZitT1cyPRY4nAXTlfVJd2zWOJ4H67+27s38FrtLo3EfL7qo1Q7MvTqm5civEF5tFZ/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q0taM9h9+Q7YV2GxobDv4bMAkwXGKT8qJngCu6qw6X0=;
 b=LBlNtHxhZpCp4meMMVhpuSWxy/lErpfw1pZjau5RfLzf0h08VjeRiFX16/jCpwNZ+aQ1zAYbF4/4f6WbGfR/aShz8y2pxQVUmWJdkRw6C1Jjjs99Yne/2xLqObXQapB2eJ6NCY2rldXRNTCQH39YJ0P7FFwL8MBEPVoGLzRuHWI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY7PR01MB13683.jpnprd01.prod.outlook.com
 (2603:1096:405:1ec::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.22; Tue, 17 Dec
 2024 00:36:21 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8251.015; Tue, 17 Dec 2024
 00:36:21 +0000
Message-ID: <877c7zno1n.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2] ASoC: dt-bindings: renesas,rsnd: remove post-init-providers property
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 17 Dec 2024 00:36:21 +0000
X-ClientProxiedBy: TYCP286CA0018.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:263::9) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY7PR01MB13683:EE_
X-MS-Office365-Filtering-Correlation-Id: b74f42be-fa41-4050-e334-08dd1e32d407
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fX7unpfVLnHd/qGfE5MGgYMBj2Sj5PBSj09VK6pprBYh1+fHmM+rpbQ9hVMa?=
 =?us-ascii?Q?BaGHxQFhy7DQciStvith6UXt2n7lIooZspA9yjBUgS7T3jPvAxxj49BwKPoL?=
 =?us-ascii?Q?aLJz6AJ4v90boW0a+jM5fybE2wkVBQbNQbGVum9+slLqtsJSG90cjpMPv60+?=
 =?us-ascii?Q?EVifdf5GTe5tUEBsEVRIr/5nq83Fix4yUMDNq/bG8ppsT13RIYw99cfZI8wf?=
 =?us-ascii?Q?qSMO1MVV15Jc1NLZvEKZ1N+sN45R4yS+FvwZ3fR3Z/zebH+Y7mmYndpOG78w?=
 =?us-ascii?Q?z5OKq4xK04iGrR7ia2Cins2SfxG6Nu4P/WmGmxgawmGFQEFVFjgau+08P8Hm?=
 =?us-ascii?Q?wdghrZ72tHQu8HzfhqdWTBoGv7wiEjWjLIC+k3+slTt0wBXjtfWNgaXtL22Q?=
 =?us-ascii?Q?aK6bmedtqO0QwhyceHgsSJwHFK8T2v9e7AVpBKRao0njKOFjfkleH7KlJXiK?=
 =?us-ascii?Q?sabVNG4/XQLvkW+/i5cd/Qu2yPZBMviwuVuZHVkiZt1KLmqx/bvthxz8s30X?=
 =?us-ascii?Q?yQh8Inz68RM2uiYLxd5LqauLRaXTbC3k5r9x3OsMnYYTmk+V7AVOhYqiSpRk?=
 =?us-ascii?Q?YdZrlxc92PHaE5VwQgBqhbxjQ1EqmXTui5avu8lgLFBRhKO0APIwsLPp2lKO?=
 =?us-ascii?Q?6XYCVKg7lHTxpfZrwTHZhDJw1ifhwB0MPW65BqNnUGfzXT0QD6WGgb4VZQ8y?=
 =?us-ascii?Q?4Jr/03VpHv3wn7qocNMLOQ4yW4Qxae4oUp4LVoz2+d5Rv03WUXOVfMQGw/1i?=
 =?us-ascii?Q?hopiOvPG3ua7ht4YdmzIuJX+KbBuX9Db3APW3RRTQgE1P49Nh2yf0yztZvd4?=
 =?us-ascii?Q?CLOM4ZsZcBrj055ZQAsS+cGKTkpuJ1MD29GkkMRmINBp8mNBNTSQ15EjaEvd?=
 =?us-ascii?Q?y4Vyn7DAHHvHIW8/m1z8igfLh/I1lo0M3oUmGXHkSRboV7L4K310jJ1Ob+4t?=
 =?us-ascii?Q?sQMcEsk71Sv/gte/eEtHjJdQkAFwg/zXgOUYXgYVMM6kxkxzY23GMXwt6RPn?=
 =?us-ascii?Q?LQAnFR0+t2R3t7vvFdGCMXF9UMEKoRJkkr2HhA8qWLd8wKcoWfSVSoWDoEfz?=
 =?us-ascii?Q?b5glhAsBOdFG4iIB6mdCNz1m8Aktscm7xG3S0c15bToC4SDfHA0hlaU0AKDo?=
 =?us-ascii?Q?aSbt+7JikIWcxUlePj4eowBVfbq/Ev0bfD4AyK5JWps7T4SZ4anMi1oOAZs0?=
 =?us-ascii?Q?V0tb/VprTQgzg3rqj1ANW5pXzgVgrQOAhzRnZmsHahs4C2A0xNzEv+0b1cHQ?=
 =?us-ascii?Q?XUn4KbIxcqP6UvGuim0IT5KlXo5WjWYJk1BNp7O5yC9A/Bp8qiwED/CyXYvU?=
 =?us-ascii?Q?6xHXPZRciiU+xqhmG6EXlJRO9ZU7RS8w3rz69JFngwRGalyqf8mcFgYY9OXp?=
 =?us-ascii?Q?wxd/5SOcqOlWkOkw1rL0lpaEeF0NF7SAc0PPJnXqsHG36fqP3EmPe0+U3xNY?=
 =?us-ascii?Q?GgjnCC3S4M3xFFlm9XCA9hXbDlQ+6+l5?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kbLhq6movk1O5aN/olwYj8irRxC1fuwlt1cTOx0oAmClY/y9cST5DWc+SO1U?=
 =?us-ascii?Q?4uFiz7kNNotlyA1n2DzOMmy/tyYtlxGNtO5NPk0NPVtFfNtJB1BM0e3xpwoi?=
 =?us-ascii?Q?oT5FgA3tKCqEzI5Lrj2fFspA1LHedW8R1k1v9FXBCl+/vLZuowQebmQnUu24?=
 =?us-ascii?Q?FuM1Y59spKW5zjFv+X6KPumNAWA7jdVQ30XKsofZmMfWSLjl5VrVYrn5rOzm?=
 =?us-ascii?Q?drwRjv4pl55fsbQodHwGauWc0CYH1JKH6X28+qkpEXqsQBcHfaYk/KLfW2Or?=
 =?us-ascii?Q?VCNNxzjQyM9vS61Go1GdwChNo3j4jaNxKph6RMjnjtaq4NJDe8szV9fjKCuH?=
 =?us-ascii?Q?tHBsIJmrTGtZrhyKN39r+vV9ASf/obm42iawT4RP8zy8l2a5tMUGKEOWcsee?=
 =?us-ascii?Q?g92jgH1KD++98he+bEAJlQQM+lw6VoQXfkErmGcZSOx8/6H7s9jL10jhjr1m?=
 =?us-ascii?Q?f7ZUKEZITRYE1GJB90oRTtdzpCDhWMS6Z+JIdPcb68Mpy/eqEXgUsDBV0kyv?=
 =?us-ascii?Q?aKk6gXgnC9wzfhHssbWneaf/bEmDDTZNNqHHS1G+vi0SiWaTZjP7XJqajXbX?=
 =?us-ascii?Q?wQwgvCJ6n6vOvAsIGdn5rm6Jp/99Gen6tWCDgYwmQ3TaLF4TN33lZn/vZmyi?=
 =?us-ascii?Q?rHfHLV+Cq/75F2eLf6XjZ6ZIFQFbtfmsYeJEISPKl2Es4k4CemiJszmOBOPb?=
 =?us-ascii?Q?+33sck/6gaN5uYRW81OKKvvf3iNN9WQ2td5J7SBAdNivtqoRRG4qePlTt5NN?=
 =?us-ascii?Q?11+I4WvXeobaOrxIMlx/C2KL/mG4X8Ho84F4xwdg0QyrR/TO3ES1++LORYsT?=
 =?us-ascii?Q?nCwP4TrJKj6logz11OFcbAgpthME4FGRtTHi5sUvse1j8BufHKDRt1VXCASU?=
 =?us-ascii?Q?6Y8S1WZwfOP71cMn88AMtuIFWMcW4TvtH/vXWKNPOC7PFuqpisKjRg/mvQkP?=
 =?us-ascii?Q?VNKiWFR8x4H8ZaZyozeiW2hFmdDuRNxV5IgrMixo3h3nvtkvdK9dwbNhzgEa?=
 =?us-ascii?Q?4YvYk+syHUzvyOhw9CJsb8OUGBqHfO0NcmZHgs4MLejoZlqCI9LjOSQjPu2b?=
 =?us-ascii?Q?xDUCqxzpwHTjfQl0ltQI2z5Lu2/kHzt0jVSmJxrJQTbpdmXJY7VUap37wZkb?=
 =?us-ascii?Q?ZEIfsLUQdklZ7ivu+AFRHYJEvWvpWTiLly/pqN/vp2NvGoIs4FuYh0V2Z7Fs?=
 =?us-ascii?Q?i/MES3hq6BSRUmcrNrsNlk2sJ9OQdK6Y/vuNcxyx/WgOJDYakKGcrVL4Uzw8?=
 =?us-ascii?Q?z586uKTKAWWG2YCN4btLPCMy3IY5jxd+NHmi4fCcWrhrVpCvORkw1pCCYzEf?=
 =?us-ascii?Q?gv7rjWHSUXOv+DO5mMxyFX9N9RfOK3ZFcIxivChy2YHBrpX5j0+eP45wiw3g?=
 =?us-ascii?Q?1uP6SUmebePXbuQCah5FghuszsOhpmKs5kD70VgSz48qol16eyM42ApDeWzM?=
 =?us-ascii?Q?uTVy7JTU+WcE6vS7GQVanxZJR//6500iZC/PaGEIXLvLf41sR+hPhPD99imM?=
 =?us-ascii?Q?3fX7Z/f98ff7PLFP1TZ+l0XrhLyKi4F9TpsYK5s2zncrpW4OPPhFa5P/KzC4?=
 =?us-ascii?Q?XJ7bjaJ4he5yIoMEIuxuTAeNqxMYX9lzQE+jv0e0DkkubblsT6E+shUGoBp0?=
 =?us-ascii?Q?cPhdPWj9pDN9DD1aDo3Wgxg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b74f42be-fa41-4050-e334-08dd1e32d407
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2024 00:36:21.2253
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U6W/37R95ambpynV/IqHD8z7NU8Nu6Y+fzt6m1vS4bcbGn8zuvxgZ07z8lan5CswBK2L/HqHFTxWSVQtbtIsQcC9yrSzQCozkfNMez2769cW+zt1YtLJjDsxH4YW37Zv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB13683

commit f8da001ae7a ("ASoC: audio-graph-card2: Purge absent supplies for
device tree nodes") marks multi/dpcm/c2c nodes as no suppliers. We no
longer need to use post-init-providers property to break fw_devlink cycle
(And no one is using it yet). Let's remove it.

Fixes: a2187d0dadf ("ASoC: dt-bindings: renesas,rsnd: add post-init-providers property")
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
v1 -> v2
	- add missing DT maintainers
	- Tidyup the git-log

 Documentation/devicetree/bindings/sound/renesas,rsnd.yaml | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
index 6d0d1514cd421..e8a2acb926460 100644
--- a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
+++ b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
@@ -112,12 +112,6 @@ properties:
     description: List of necessary clock names.
     # details are defined below
 
-  post-init-providers:
-    description: At least if rsnd is using DPCM connection on Audio-Graph-Card2,
-      fw_devlink might doesn't have enough information to break the cycle. rsnd
-      driver will not be probed in such case. Same problem might occur with
-      Multi-CPU/Codec or Codec2Codec.
-
   # ports is below
   port:
     $ref: audio-graph-port.yaml#/definitions/port-base
-- 
2.43.0


