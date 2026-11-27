Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.156.106
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795770440;
	b=J/PXZplwLRf03dDedgdPiV/GoXCT3wNX3hwwT3AnjllijIxp1FWqGhRbnwpEQkex98it
	 zbVR+oaLs+1E/wnFAGf2sbmwlUpFEUKjIq1wreeHuOer1LKYs7iVRSHO4Fedl9ccaD2xz
	 Xhcxtve+i69iHSTET2rsKczMw60OOMaRTv8/xSug5qE+mDrzuaffNowBAivv+zyb88fHD
	 tEpiRcU8ZOCbampKwhIy7K4UCZq4w9eBYAv4tHVVjbazwXjM3F/hF44HBfa3mSjkLiazg
	 aEjNNyUpuKdMC/dAEepiAEhQ21hm1hXvj2OlHTYLv8OO4R4kH6dh5CT/DhyG8+w7Xew==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795770440;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:
	 MIME-Version:X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=aBlL4LoMhRnw51DYc/uZH6dVIdx0aOuh7V2OL/MEbKE=;
	b=bOMdHPEV88YgWWx6GYS/OjHcTEzhWICGm9Hp9w51c7mZZHzFHx+0ICKyhvZkgVDUYxpc
	 /adzd5wQhhhJXs5FDASwhauPPqjEbmnCUgzGivyxBcwo+gQaendF6+o7dTQJzwG/DW21g
	 tLk7ZR6utOex2U15/kbPrgraZE/jlvbnKROQE+pt/IQq0F9ShdhuTGfpUcs3xHJoa3opE
	 xey3H68eLPIB+vcxyoRg0rx7k00t2+bkVJyDkOC/JuBXpx4EofXoAQv1H8uZxRktDGBZx
	 yp0FSnS/70AaBIvKENkcXyLY6qTQMDdT9lgVDEbAYSml3l/VpihuW4eEPxQoQY5sPTg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=irondevice.com;
	spf=pass smtp.mailfrom=irondevice.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.156.106
Received: from PUWP216CU001.outbound.protection.outlook.com (mail-koreasouthazon11020106.outbound.protection.outlook.com [52.101.156.106])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A390606A31C;
	Fri, 27 Nov 2026 09:07:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A390606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=irondevice.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=irondevice.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GzPpVcUact+9q0a7PZ3QYb2DUkxGiTvsueuFBpsINKuCbmIJotze3hsFMNH2Wj7SyalrmdlKVs8V5NOeKJPS08121yKq6u7Icf0Wo2bznv9xoiW3RBwOv8nF1x63RnA7QHmyn/uiH42szqQtrWHHbaFctDwbFq2wsIu2VU0pcVaD3rZZiWClpqkpw3uvyJP2yLQ/uOM+Xww/UgNEvZdnHEF4gAJc8/ngafgzcBtWTBJQO//RUMX2tpVU0w6xK2Cl3i+3w02i9Ui2e+HgulUMAXPU3SV3ZHKyhJoFvGXCddcoTYgxCKQBfDWoAMIIwZQ7sXtbW7/ta3oWKf1uozo/AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aBlL4LoMhRnw51DYc/uZH6dVIdx0aOuh7V2OL/MEbKE=;
 b=PVt0e32okKStT6oaIS+pd8pEEXs2n0dnZvFTBJf84NxfzwYFGxCloRARw3Hj1PR9kyo06wLce1HQgGfnrf5uJJCmgPM3/yCysKlipKgI1/IdMSxjOHLxKknl/DNPA59Dkdwvi9TddKmrQRD3OqZI300H0kooW4lpi9mJK0Efkr+EQeLXJfQXA9IXxlWtNb/IB8bgnsSh/gO14Rz5MV7OKXhCL1AdONkVZ8UdmhUk1TGY11RKQ+7HlCxf3hSqKzPoQ8dcxtWVxHuyIepOVmzqM4CrsIvND1QjhBDYRCKFWRqvNGXBkgOS7TVGec8ZOpwNvfp4K0DcAbjZUMIVVjAcMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=irondevice.com; dmarc=pass action=none
 header.from=irondevice.com; dkim=pass header.d=irondevice.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=irondevice.com;
Received: from SE2P216MB2423.KORP216.PROD.OUTLOOK.COM (2603:1096:101:1c6::14)
 by SE5P216MB3160.KORP216.PROD.OUTLOOK.COM (2603:1096:101:2fc::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.9; Fri, 27 Nov
 2026 09:07:16 +0000
Received: from SE2P216MB2423.KORP216.PROD.OUTLOOK.COM
 ([fe80::98a8:f50c:a9f8:3073]) by SE2P216MB2423.KORP216.PROD.OUTLOOK.COM
 ([fe80::98a8:f50c:a9f8:3073%5]) with mapi id 15.21.0662.007; Fri, 27 Nov 2026
 09:07:15 +0000
From: Hyunuk Son <hyunuk.son@irondevice.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	kiseok.jo@irondevice.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	krzysztof.kozlowski@oss.qualcomm.com,
	conor+dt@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hyunuk Son <hyunuk.son@irondevice.com>
Subject: [PATCH v3 0/2] ASoC: Add support for Iron Device MA5311
Date: Fri, 27 Nov 2026 18:07:05 +0900
Message-ID: <20261127090707.389362-1-hyunuk.son@irondevice.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0092.KORP216.PROD.OUTLOOK.COM (2603:1096:101:3::7)
 To SE2P216MB2423.KORP216.PROD.OUTLOOK.COM (2603:1096:101:1c6::14)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SE2P216MB2423:EE_|SE5P216MB3160:EE_
X-MS-Office365-Filtering-Correlation-Id: 20d8cbb0-ae06-4ab3-1bb4-08df4c65d4bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|7416014|376014|23010399003|366016|6133799003|261009223027099003|18002099003|10067099003|56012099006|261028144727099003|261102123227099003|261022075727099003|261026140227099003|261022105027099003|261021121427099003|261026121527099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	9xqOjnNjGshGCgzSb8kNP9HS3COj/lyUyl1TQAW+NTljCkIkrEfFAoCnYGg8qNqp4xveYtRkrLtUfKCZODZysHd/O3k4ky2CM+KsBeYR+O+jMBzqXHDj3qwdngUb+XtbTMIqbMk3pqBWgv0ZdNwdGItUNyUWMoQJgSK97A/mPaZqtbGfKHE6kJJyv3872bV23wOyFzTv6nmLgri8W1ZYeRnWpmlv/92KSXommU7P4Wx8WIwz9Qj2iKAYcgNh477XMiAO+UppkLLjMhCUd7nlW6dBZu5Jc1UpZdBLgxd+Zaiv53EBYq6NFqvJK1+tPjEw0atQRnqowDZ9F+12lhsoYrpm5OLD/SdxicUzd/viAM2MTSdpFCoH9/y3YBt3b868XhyjnQyYq4WnDfXBUyFbmeq9br8yja2GaMmBzIw0GouVEp8PTRu4d9cAblEyeLjRicqM/clmpqCT59nQEusc3i+ASpv8R3ItWZi71bnmTP2WbhjjLzI2yVbqcemmRAuAOV/yDSzLKac65bdjcgWUwOegKM+yDWn9sRFI7cncYjBrKQYBpopepoGPhGwRpOSE28YasbpTyV7b8TVN0yJRqBZIOOJisvuLYddH+/T4E4A9o3QzgSFHbu410FKTejyD2A20kpr966HepV4cqTNvJPWZHfa5Ht00VjqhVf64pPOY02e/X2I4IXrDTHxgON1UBv5aGtsl6DbAR5eYY/fW3nh8yLtXg1CGswE8Ye3GR5w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE2P216MB2423.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(23010399003)(366016)(6133799003)(261009223027099003)(18002099003)(10067099003)(56012099006)(261028144727099003)(261102123227099003)(261022075727099003)(261026140227099003)(261022105027099003)(261021121427099003)(261026121527099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yca9/N3sb6QxzUn9eMQ8WF4ApWwHp91tNW1GdyeWTKl+YRJ3GKR+QBW1cm/r?=
 =?us-ascii?Q?lWoeyAyGw9MdxeH9NConp0xzRgpk19Zi89t7fRwlUeACUqsNtD9T5tKymrLA?=
 =?us-ascii?Q?0u/kzRsP1B4Ld5IUG/5zWK/h7JdsKlUQ8sfAJYB3x0S6TulziCilNfwHccBg?=
 =?us-ascii?Q?dx3jg+Dyv4K27kZG5W9mWt4TVTDs3vAOjt3QukvYTmycntNihY4Z1FJ0nOgD?=
 =?us-ascii?Q?7ijFcD6SAl9WF61oPe3kXLIGsE2ldN3wnyxYJa73z9QgAC3HG99zd7SyPDqm?=
 =?us-ascii?Q?1Gk8KKL2RUcqWUw9Q5eglTAApGT51WUA4qNDMqSfgtAmMHbWRuppBqAfdRoc?=
 =?us-ascii?Q?pWzM9jwtatRqg8/LiTjRTadktux7RSNidmTB8xkVPjX9n1Td9DAZun7GQt0I?=
 =?us-ascii?Q?rUDl0FSCXpVVGbAuuEhlWDdbV67v6wKEw/fPvvTJTRe0rAGbARTX2OuioQKE?=
 =?us-ascii?Q?10YrONImAwNTmkhl/zLO09j2mjUs7dl2pPh4G0ldV9j01uBglYoOx558fi6P?=
 =?us-ascii?Q?FaroYRO6SmO9CneD5fcUC/md9JgM15gdUi3IuLaYEooIpdlbp5AC9mTQy6Iz?=
 =?us-ascii?Q?FaQWtUrQlga//coD9mllFOZENEs7rgTn9QCQoZcRRDWoKGG4+02OjG+OMJkj?=
 =?us-ascii?Q?XE0jpDUBKwdAFOMWcv4/uUEEHY2lF0KXCOUp7AquLvfjkaklxLXyUNe6U1rL?=
 =?us-ascii?Q?lHAIRhTJX4NIG8tPIGO9bvzADiEglsLSGucFURZbNIBhUHA8wST+UN2ZA5C2?=
 =?us-ascii?Q?x0vZzn6RF+x5vsA95OU7t/EB5Zx28h8reM8CESHu9Pc2TpQule/jFi00wLN3?=
 =?us-ascii?Q?dTqhcYuQf3OSQSL8iPYpiXuwj02Nsl4aNrK5yD3jva630q3Qxk5/rh98EcRM?=
 =?us-ascii?Q?iTXt+Y0+2nYLDOc+J6+qKDUyTBpL9/qLnJGrfUVZO/u2u83gEFMj4uJVXbxZ?=
 =?us-ascii?Q?gH9xtQbKjeLre4CoTavV4+0d/faeKp3YunDQbZVRoJmreXLujM2UCUPq7aHV?=
 =?us-ascii?Q?ZqiBRH/DIfXiCcySC08LD0cWDmKsptFpOb6wy/f0o+nKc/gdLrqkOZNEAcig?=
 =?us-ascii?Q?WNb81Kvb4+OIYrDlLLcIYTtN4TD3R0K5pvt8tMsasjd+VIafnyPISLOoG35Z?=
 =?us-ascii?Q?dHXtKPuPh4DPNgTx1m+mXMz7r+n7Yk3NeAZPEKooqcRPSiNZFfjhy2AQToTt?=
 =?us-ascii?Q?NTgOTbH9COXAdhw/UVs3BOgF7XA9gHWpH5OGBsNgL7pCRORrSX/yK5gdai1n?=
 =?us-ascii?Q?00e3iXwT/yCuaK/+QfI6eKO7dg+4YnYkb1aVM+yw2QPw/EiiPVlHrDVAmu3a?=
 =?us-ascii?Q?g/0zGqaxH+ZXxhmTEM1WDMQJAYsaJlsxl6QcfQJta2R9K2JO15mqtjd5ByjP?=
 =?us-ascii?Q?1J3VIsbc3bgEeAxYVG1q4LkAfkynh4oS6xk9BIvDvBGwmtXRt7lFGrh59dAH?=
 =?us-ascii?Q?U2iEBkk9e5cZ9rr4m2KDVrUbSctD+WnhUuDjwPXuE/wFZ9YtgMF67oz2NUj5?=
 =?us-ascii?Q?0cbOtlz3Kndrc7Hdr1CgwbleH3Ilp+XzuqdPNclnXpYs0RI2dVYda3hMHv3J?=
 =?us-ascii?Q?AREq/hyxUGvBB6ABzwXNm9dE9w21r1A/SZw+LA+6AjcYy2xj1CEwHpT2bNWP?=
 =?us-ascii?Q?3szX2yd2fPXoNX+cGeFYjD2Sidf59jJyRqJGNYQY2HpOJX3cUGmqSJzeznY2?=
 =?us-ascii?Q?mfGCW+tHM0cbQs+rTvmV+TsCYrtKzgfh9kqZCFRpYB5sZHG/l6z2gy9SjwfZ?=
 =?us-ascii?Q?dv1oI6rZFeAhyW7063PXo0bT1QnfrJs=3D?=
X-OriginatorOrg: irondevice.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20d8cbb0-ae06-4ab3-1bb4-08df4c65d4bf
X-MS-Exchange-CrossTenant-AuthSource: SE2P216MB2423.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 09:07:15.6806
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b4849faa-3337-494e-a76a-cb25a3b3d7d1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HD8dXslBYNyA7ViskdSMu14eXGv3uq83OsXtNSnC93DUF7WCifiJSswUZfeZvT4c79FksrN4i7PFJy6fWYV9+ptd7NPSvL/TnONxzhLzetM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE5P216MB3160

This patch series adds ASoC support for the Iron Device MA5311
audio codec.

The MA5311 integrates digital speaker amplification,
analog-to-digital conversion, and audio DSP functionality.

The series includes a Device Tree binding and an ASoC codec driver
supporting I2S and TDM playback and capture.

Changes in v3:

Add the Reviewed-by tag to the Device Tree binding patch.

Restore DAI configuration after hardware reset.

Register the reset control only when the reset GPIO is available.

Correct BCLK calculation for I2S and TDM operation.

Remove redundant software register caches and rely on regmap caches.

Rework DAPM widgets and routes.

Hyunuk Son (2):
  ASoC: dt-bindings: Add Iron Device MA5311
  ASoC: codecs: Add driver for Iron Device MA5311

 .../bindings/sound/irondevice,ma5311.yaml     |   84 +
 MAINTAINERS                                   |    2 +
 sound/soc/codecs/Kconfig                      |   12 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/codecs/ma5311.c                     | 2300 +++++++++++++++++
 sound/soc/codecs/ma5311.h                     |  558 ++++
 6 files changed, 2958 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/irondevice,ma5311.yaml
 create mode 100644 sound/soc/codecs/ma5311.c
 create mode 100644 sound/soc/codecs/ma5311.h


base-commit: a6c7e545d8abac8ad0b48da4c8b4ca5ef8ea8eda
-- 
2.43.0

