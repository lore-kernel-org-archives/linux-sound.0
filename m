Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010005.outbound.protection.outlook.com [52.101.228.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BDB93D7D9B
	for <linux-sound@vger.kernel.org>; Fri, 26 Jun 2026 06:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782455271; cv=fail; b=P1ofUKs85RMyIPjPF1Xj8YFhfFfadj+rKgw30GNVNyv2uUwcnbfkmkwfHdQgCB7+5U6vh1yQMjvtqtKcUzvN6CyEQ/I8oV4QlLpdGtNRjiT7vPT2HX9By5Zh/5fLghc/nxPjCm6J2Zn+iZJju73tN5l3Ims+o6uL1EPC/i/5nbs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782455271; c=relaxed/simple;
	bh=gwlk5HkCyphBjq6fJm2pMoLPCDvoNO4bDKelekeEKiY=;
	h=Message-ID:From:Subject:To:Cc:Content-Type:Date:MIME-Version; b=E7Q8nVWtibqTjDDLk7P4ATJ39r6Rrn2GcMMb3YIEsLJo+K4mazb7JmubSIGcO6NTK6SZdmSbtoidGLNmzHB+33y563rWZ5A8orAQy9qDDcDBMxB8NAAP+lPXG0u/4YqY0BwQuX2QFgi+HmR3fBovnMl0yX4soeaAFsEHe6OWNEo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ZtzDl0/8; arc=fail smtp.client-ip=52.101.228.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ZtzDl0/8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WEMMveBWdESsnqHoWhBqr3S8TlOGsr+toRLZpc7/QYd27oJgF2HuWKyQglUp0+YiGsWIDdZXNKIFVW+/mluCiVCIS8Df3bP8EeCZWMTJx35ontWUrfENi2sK97cfO0ELMCgYS1fnYdqXskQrN0h5EmDyzC0BqqCr8DBmOLcaeH3KknuMZ6Urwoiryrb2rZk4A41hv1xffldEDj+OJg8OCOdBankudQbGfUCg0cP1o8+nSY5yUqLFWTtL+7SqSvxhHw7Z2RksqAtFJ+J3OrUrcJ+g8BGcMU6ZPyGQ1gymhjSZtW64y2c/Rw7s82g0HUlkTB88nqxsp9hH7ycYg9zH+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=56uMG6wt+h853iWRGW9Bgdc5pFVxtNza/CzGTC/FU6Q=;
 b=Oma8E/gmEUbynNTfp+9UlAt9HIYKZqY5MLvm7eb+rsJHM1ZIIkX8G/WN0OtEKG/UatyCb+dMajG1gU1eV8Uqr3JV5A9J6mJHZj77D+tPI4m+xkeOzHuM7LhJsU4f9TV4XT9VNwsx1svtZEM6OgH+/sqYZNjxWV8yYl1kQHlobxEdrFhRnUdTMsj0rw/uEg+f+6zIrBwjcAjrxJoW4sJelz4gSMhf1/xveOmS7Djdegmv1FMG/9SxZ9dc2gVyHYbkoxthHyzS7F/IUqTEuGGMERAukwBtznpXywX1cifw4K7MiLIDxTpKQzGW+8CE8RJ8Ab0GrUHvS+UWYWliszPZ0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=56uMG6wt+h853iWRGW9Bgdc5pFVxtNza/CzGTC/FU6Q=;
 b=ZtzDl0/8eX6FuM7PRxPxEDiahxfQ70omqRRy0xyc/ixG845Ie8WOXn0pOahmIqbmv8yLvJJS1bUlRmiY/3kN7jRjGPPMQX9gvBZ0Xye9cFZ8zk260i0jNyr41PY/0C0qyXItIf5OnaIWATNfa24etTzHn9fL1IW1yTiLxbcBWYU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OS9PR01MB15751.jpnprd01.prod.outlook.com (2603:1096:604:3bd::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Fri, 26 Jun
 2026 06:27:46 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0159.015; Fri, 26 Jun 2026
 06:27:46 +0000
Message-ID: <877bnlerz1.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 00/12] ASoC: cleanup simple-card/audio-graph-card1/2
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 26 Jun 2026 06:27:46 +0000
X-ClientProxiedBy: TY4P301CA0078.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36f::16) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OS9PR01MB15751:EE_
X-MS-Office365-Filtering-Correlation-Id: 62bc9d35-7043-46d5-d47e-08ded34c097a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|23010399003|38350700014|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	+BNZlrPxuUDr7hghJ1ArcgO2nEGYZmp7yVqrnba3qCJwtuIjzbWz/ZS7VJwrJ+bMOtAlcDNE/DkUyrtw//ekBKFFLVGdGjRGqEjF1yXpadjuMmx/mvGkwNvYZVtrY+sGcq8TPf0kcGQi89aXrWZ4ZTeqdHtI5NHOzglgBmuFCscI7jAj1znbc13jhdLM5Pea/FQXM3WW95vN/uB4CeXZEdbU6W8LfMAzW88UihWp81JGmhoJgkDaII1WJhUZ+xZjwKPB7hfbzpGqnIqCW8qlGapegX4spOUXteaBLdmfevicEWE/GBeB01aTQZvpSFFqaSlJRtq8BkyTELYIpxwV0/wFIQBEPfefk4wbYE6OUyalTUzmCTqtyFU5h41WmYZdmz0d8sHJTUQNKtSYyUe7Ose0bILMkl3vOMwponmk65b250TKJZcfyYxYcafA5xTMqx3uz4nB0Vr8WqU0CKzCqDo/tVv2RlGNG/DALJQvK0ZrjlOFOXFUwpuqryVSVwVwaeCiWFS+l4s+xOgBkLS5hIUP5UY1HvqhgX2aRNeIhrGN6sWMU2ezgP/qv4j+L7p+/eOnIjG6NyMPen52ltOunYqkVZl8oCdzz6H/VWWRLanwO8mukTprwviHv3nlPk0Y1lQjAuM+R9U5QIZfACk8P/9x+4ZLlals9UcsDNAr51Eh1qSY/hdciwoFmbJc2bxbJH49FcDx+mgJIYZcBSH6NRkuYKjTXjpaavHvmI7jM1k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(23010399003)(38350700014)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FzET08gUVhRfQkUpE9RSej5eL7DFXyDCES+JZIejOO3levuor1Ilk/tsIhVJ?=
 =?us-ascii?Q?vLMyW/6BYwZaci30Ugzp8P+xL/rYOmmAiUA48AuLsoLqW3ull04INX6R1Wys?=
 =?us-ascii?Q?YkYrBx6aDbmv/4DnZfE+OJCCaqHglN0UU8vQ5XkczH0rBfP07zcTFBdWpJ+W?=
 =?us-ascii?Q?tFUFdH6cpTdqdVWDgpmy45vnETlvFFgHpDneyOEINogigHKheHzy8Uj8vHcl?=
 =?us-ascii?Q?fjXF8IY16DpKjqdv1DkpNR99HSCRNZTMd7bOeylA8X/d87aZsdunGuEaUQUG?=
 =?us-ascii?Q?X/2bpMXtVJ/vkoC/A41kixR4BDrZMkx8D3fJ7rCUY5WTx71Pi1f1QlTzk4/n?=
 =?us-ascii?Q?XB3LqjMXtr630o9GA5txZfYSs1ZC6X/iQPPmlFHXR47BFPwHkB6tCEclOP6d?=
 =?us-ascii?Q?UrMa2C+ue33/NTK4ZaZli2Ndo6HNa/BNY3N7SAR08sB0Btdv+wri8nGw2aFh?=
 =?us-ascii?Q?oZiHNxLX7PemJwyju770bRYcyGWMv/eLpVxX5bh0WzGQZjeBEx16FFo03V73?=
 =?us-ascii?Q?KuZ1ZlgZoZ1CCkC1NWXnEQIdusjBE/z9AKzNwtFBd1mGZOIhtVUSIX3JoYzQ?=
 =?us-ascii?Q?QF8kUuGrwtqhmAXtvk8RCK30cEGwORnlM7Igw0aYUHHtSlIz1okAKzav/QzM?=
 =?us-ascii?Q?q2pNqQk4OvAqAL5HbD0HfHvynEN3aYVUyhDzqeGwwAyFXQXGxnzFW3+SL/Hc?=
 =?us-ascii?Q?rsyxNk2mjhjCCBOSneNy0MMBRK6vvXZB0WOUV2eyp0DFxNXHAE4yowJrBhGT?=
 =?us-ascii?Q?9jWD29zY8Mt4/1b0EoNuDvoHkZwAA1I+lsqGHhlPYAxZasnh1GjPAGuZD25C?=
 =?us-ascii?Q?KNcoyRn0eF6OEKxTbtKF/xL35HrdeVr04D12ITiluuolvhtOKlaslaXUiUZj?=
 =?us-ascii?Q?T6MXNcCtuGLvOdwfLVTgg/JA7FHjX2VBV8Z9NwUOCJvfgBeR+nbS3a3/qQFw?=
 =?us-ascii?Q?1IJc8UU28K6DG589EVit6H56UAfIUZkD7kklYYK1UvGoSjIdvLf3lHyMUtg8?=
 =?us-ascii?Q?uqYwFUtyBP8fqv5pUEzYjY+RhxxJEIIj7C3vIcDrcNZbrPWWBymC18WtrTmM?=
 =?us-ascii?Q?xmulIQOVD8vCaXIBm27t+fHdDPSEASAtzMqgW8/GNapn9BwUMtfo7BAWZ2op?=
 =?us-ascii?Q?1TsTrxHeNxQW5eUCuuUozeAYRHt9mzJzFVEwgEZuXL7Cb+viEuC0rMp6xmOW?=
 =?us-ascii?Q?+IYpBwP6L4nSwvGlJnifd0xltUaeLexowUVDQeV7VlhUN4ox1YnZGMBSJS0P?=
 =?us-ascii?Q?wE1ww6ufRp32gCwgQST8YaRJq8hn8Pw/kqoxNduiiMGPfHpyAei5gSL7KtVP?=
 =?us-ascii?Q?26DCcAs9cWEmfOM5reN6V6Fxf2jgu0l7O5ek5I3rHiCyGK2W85CVvwTWsepN?=
 =?us-ascii?Q?cgiDHp9cSZvDvSyCiD5etwfLHrwlqYfueiJ0A3My96YOj1ve2iBCqGbEONF5?=
 =?us-ascii?Q?LubxB3dz0Xd8olM9yI3pwacrasvHA54fs0daxEv4NNefb36ZrVKLrBwJfSuk?=
 =?us-ascii?Q?C6OIFoul3mu2+/XfcBp+StSnbJAbyK+J0NEsJyhEyvIc5I61tDoO3s/KvEnA?=
 =?us-ascii?Q?aGjR8+WB7+NTgq41D+SaJl4LFwfUwPb3c0IU8qz3J7ZnPW+rFcZpPuvvpQW8?=
 =?us-ascii?Q?pUm3VH2OnTOC1azR8hXanPtVvIq/H//gy+isLgkkt9way0MazJFUxDVwT3Di?=
 =?us-ascii?Q?+38OjyFF8f+lD73UTXdLapKMFtmMDikoth6cc82LIH/s4F9wBWL/izGAAQBn?=
 =?us-ascii?Q?qWgQUCYMCFZrhX9JUEGVEeAPga/DVB3iAwWAec7a0kZ+Pc+Qu9wX?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62bc9d35-7043-46d5-d47e-08ded34c097a
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 06:27:46.5091
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: THV6+yudbFnh4QLjTXWEXMvLlj/SbVjs146eQjOD6pbYbR6IfV7IHHmF3ZQousQTqL7gxJrQiphWH0UeBN3mZphoMgSRcrDFk97CX7VusgIIGwbIoN9mVjC0JPVl42O7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB15751

Hi Mark

Simple Card has removed platform data support.
We can cleanup and sync more them.

These are cleanup for simple-card/audio-graph-card1/2.

Kuninori Morimoto (12):
  ASoC: simple-card: move simple_parse_of()
  ASoC: simple-card: merge extra method into simple_parse_of()
  ASoC: audio-graph-card2: Tidyup audio_graph2_parse_of() around error
  ASoC: audio-graph-card: Tidyup audio_graph_parse_of() around error
  ASoC: simple_card_utils: add simple_util_parse_property()
  ASoC: simple-card: tidyup simple_util_parse_card_name()
  ASoC: simple_card_utils: add simple_util_parse_aux_devs()
  ASoC: simple-card: tidyup simple_util_parse_xxx() in simple_parse_of()
  ASoC: audio-graph-card: tidyup simple_util_parse_xxx() in audio_graph_parse_of()
  ASoC: audio-graph-card2: tidyup simple_util_parse_xxx() in audio_graph2_parse_of()
  ASoC: simple-card-utils: tidyup simple_util_init_aux_jacks()
  ASoC: simple-card-utils: tidyup simple_util_clean_reference()

 include/sound/simple_card_utils.h     |  37 ++++++--
 sound/soc/generic/audio-graph-card.c  |  23 +++--
 sound/soc/generic/audio-graph-card2.c |  40 ++++----
 sound/soc/generic/simple-card-utils.c |  94 +++++++------------
 sound/soc/generic/simple-card.c       | 126 +++++++++++++-------------
 5 files changed, 153 insertions(+), 167 deletions(-)

-- 
2.53.0

