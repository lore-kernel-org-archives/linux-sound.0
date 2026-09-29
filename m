Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011042.outbound.protection.outlook.com [40.107.74.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C1E37A821
	for <linux-sound@vger.kernel.org>; Tue, 29 Sep 2026 04:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790656272; cv=fail; b=JkYlw1lot1Zb6K98CAImu4Z29XtOI2Rx5OKpPrxq9O5EuC1WDriwt70AlTALygPYZ8vLRqfHWBSAWWXgAcRuEQlf4co0848PgrEmz2enWBu09BQQRa2cJJdN3EwfdO9L2U2a3WTtfAv/ypDzL5Ad8+OVCkmDKnuO64He/qZvmC4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790656272; c=relaxed/simple;
	bh=+FZ2IT9CNUjLBdS7Vmw2wSOpDjqU8n3HrxKfGUkvsUU=;
	h=Message-ID:To:Cc:From:Subject:Content-Type:Date:MIME-Version; b=X9+axRo3IXSZkpNwWj7Y3IAidkNK1rxIp0aN7KGLWLX73wtMXxAB8K5lJIERxQMoR2N/JNEhHrdB850giTxtgD+ideODyJBv8BCaOMewZsXo8tx0mvk9MkKIMrct6x0zd4V6RLzoQakYECA2Dp5qkyTF963aKCIuRk68VIu2uEk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=eO2DpJ8K; arc=fail smtp.client-ip=40.107.74.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="eO2DpJ8K"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t2Gw1XZj43/nMc0CNQT3aAGxKtlDIdT6KnZ+qT6QoOXOePmRP/IAJIE5lc85eZeMuWJnnQLAySpQXyTHXplHCY0qqL2rBLmOKU3o+04KQY+nZN99PCX3tfzHEdIZ6X36Owht5/yaHr38yaDmGHYwo3m79wxCj3XTHwlS2Lo1YfKo71/xU/PeViBw8Rx7PG8JNBEZlwHYDntA6YUWqiW2F1WWn/9INCxc5EEJFn61Lsn33ePj9/t+8xZV0bj92EVkKKBC2w4xvRpyBo5hqMTVjm5EB8MZvFRFy4amsMHMgxUhQZo+N7eNIR7kXxhQG0WpG+DmJ/sVkvkhEDzVa+asQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ij+OFzXY1cb5FnzYIcu72tEojAvzrGGoV4IkgRBorvk=;
 b=Ts1CEmaE4Cs3tvd969/s0oIdZSngsYU8/x28a7X8kEuWgtPjJMETQcawjd0Crd9Q8PAFBn2kDnq07z3p95vI+8Od4Dfc95/G0K+tXK3DPhF1lv5hzK7bWTR2RqtKlG/fi+0RiK/+Ajmb6ggeFKmt1HfDlL8EC97IkNCsbDuoPChtLwocubXs0fhrzxCOFnvvazxkTIVqHX6MO+W9SUoV6kHBPYytXmPOVRmY6VfCZG76iJEQlVVxgzOrWuomph5N/JNZqXJDDWW6IMJhEs/wAvDfYuuqdikvlfmaE2LewXsSL4GXgA6HqkcAp+4XAGC6KtGGcltA9Vre60w80f7tTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ij+OFzXY1cb5FnzYIcu72tEojAvzrGGoV4IkgRBorvk=;
 b=eO2DpJ8KGiXugDsjjngvAOH9auRqE+XQAdbUz40XbLmp4zSHeu5RLcXT6Gyr4xC5gz3rl73TeICGk8q7TgoJJg0+fk03dYOJtWQPpHmhABDaZNxEtkPD/gBvkJdZAGSAvzsx0AFJrnJ39BFxGfXjN/gtYlyk0tDyElKi/AswBE0=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12) by OS9PR01MB14206.jpnprd01.prod.outlook.com
 (2603:1096:604:364::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 04:31:07 +0000
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45]) by TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45%6]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 04:31:07 +0000
Message-ID: <87qzicel11.wl-kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: codecs: cpcap: tidyup cpcap_soc_probe()
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 29 Sep 2026 04:31:06 +0000
X-ClientProxiedBy: TYCP286CA0154.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:383::19) To TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB14118:EE_|OS9PR01MB14206:EE_
X-MS-Office365-Filtering-Correlation-Id: ec4e3709-edf0-49d8-9871-08df1de27abf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|23010399003|18002099003|11063799006|56012099006|10067099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	F1/K9M1y3MYsktbQnqvLzbPkyVo/WCuhfIVqqEEZcwdgEVChrWUbX+oGbS/iD4NH2L8q3xVIyptxSLYllFWVpc/Q8ZfGykCdYienMAbP+7YL/EiLN6auNZ2c7y03HSZM/wejTMwWryUI/nhed337R6Z4jZ053a4gy7ebSyYlVrSMVnZHvV9XLpu4A3wCZbkgzYDZpiuXZ5W3r9UViSVj3siY1YBKSgMr8hiBYc9aYgq9m/tkYyle2xIusPp5BWn5evshveftLKp1D7tuKfhHXOFM/vxSIqHf6sLNM0/NOgDkMLzheOoubXUzU8JLsduYE6fv7WraLXqM8AWRZKryGTB37/lcRGlRK/JFWbqlzkg+shtsKwYN0I3TPnHPqWL72KL1JyZdHB8kV/ny0FJyHt+D4fykqQY+Tj0Nko/tvvBi/5Ig4gqz3fKPVbBRMlP8jjtUTRbsCdNzqwOxEh0TCMtZa6qqt+0uoFRqmuKWhCcFU8vqM8vO3oDdYRIXERVnv6D16zuLl/RVCZ6e7gahxotQCTzvMfIQBc91zJDiM3qMNlnCw0E8CNLcuMNH5vvvLkgeu7T6lwjfXO/jzLDNDXxS9urkAs4LwfGcFs2uiKBsA0xMk0cwAUcEpEnEFKsxo2LEZEmEN92kstdjc/Ei8hJNlOFZd1QIQYpXCslj5U/dcit8U86KCJzBlpVtyCHSNxtShc6RXe5dpgC7SycZGg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB14118.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(23010399003)(18002099003)(11063799006)(56012099006)(10067099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3CjrutkWprNn01FYwTgNaXGa+QUpUCVYTJE7P6uL3nRRICLzA84EwoDi8F5F?=
 =?us-ascii?Q?S7jVDAosDlqMDOF1fNTNVt1x4jG/I0dsZAj4oq0CIp2iLko0nCT6fIloBmf+?=
 =?us-ascii?Q?P/kYMW8ADDzkHbt15HAk9C3C9x9sjpQ7QU7CPqCtdFPmfcKHd6bYkoyhM7GK?=
 =?us-ascii?Q?Aukrl7tSNcFBeUmVJ+pyqKU4+f6a6zLU786KpjMCMC3rgL/fvMu9bBq14Qzg?=
 =?us-ascii?Q?yBQFepMslNicBDNd54f4kjOr6Hnl6puJvPrjEwn+ymeIB5l62YRuAhB6HIex?=
 =?us-ascii?Q?FqQsIhpl8NA7ZhID7INNcNs7kSlymcZGgbCWeUyWo6bVURQ5ZcMqkP+FQwU7?=
 =?us-ascii?Q?1V8ir9XfH5jR5+t3ORp+3tDCi0C5NWZGN11owmU2pVBNEzqpbu6z66kAoV+8?=
 =?us-ascii?Q?5pyfz+xU9TGGevTvpTcz+sQmjgfnlIXnNAvQSfD4ZbvJK867a+ZoTIAvOEe9?=
 =?us-ascii?Q?06k8MRRNbvdfTW7xvLaAJMACpWks/Ky/p4ALyDUv8ek4bI8ZkUkA/R41o9VJ?=
 =?us-ascii?Q?j21kPJ8yANTyE5lVpVEx2Q7oEBj4lShEWiXT5XPjqyyfJmYk0TKJTkZd/bS7?=
 =?us-ascii?Q?nIpeB+wV7aKRaFde+fsX9GLRwO007eJRBvYVQZLofvMUxV5fZiLEUiU7Qp4k?=
 =?us-ascii?Q?/pF9ZWO6J9iKga/FkJh95ftM0JATQ9qpmaHI471ee8/sCJ5GzA8aQjp6Y8AD?=
 =?us-ascii?Q?DiLwTVwI4WqAa4+k5fbutr9++BvJ2U4qH72I9TwWCVYh13FOSWw8JxsFrXTd?=
 =?us-ascii?Q?07GA7t8+eY4CmtkOUmKN0TrbiTr+OuG4UB+c2gSFtw9V+LDl1KjY2Sq7sfnL?=
 =?us-ascii?Q?8sr1j0FQuKP97oyvVENZAzCCkmO7oDQ+2IW2e4JftHNo0WeTiD8eX2BoKU2y?=
 =?us-ascii?Q?j2EYPNi4KVkWVtWumKgluRmlcKfHxe/z0KHCgpN4QsLZNZzfbm+P6yweelr/?=
 =?us-ascii?Q?9E/wjpBWS/5+2Q3YjudcEvQ/7klAq+AWJocnMoOnSXx5saqZ58/sYGK4Wh5G?=
 =?us-ascii?Q?buyfxFcetbS7e7lAsmiD1ykTqq/LiIsT9FqhqCW2RzIEqV/93oah4Ts3ZGra?=
 =?us-ascii?Q?nAgyM1BA+mkRCfcmpvVspHXPcNCMN7iXciR1CcGrwCYcHc4oCqi8mQUtdjsD?=
 =?us-ascii?Q?Lzb50zWS/9oOdbfHIyYv5yNTinBP58PU+IRSU8FU6USBbbCLhChx1mO+qVPJ?=
 =?us-ascii?Q?CzD5gNDjD7Whp99a73DWasH+/gKNmWWW16ha8JU94BzVIO+kjeXGTpdGZWB4?=
 =?us-ascii?Q?EM8wiDazIuafUScd8qttaH6A9U8xzLkdnch1RjtbF6UgbnkkZPgIl/TlRvhF?=
 =?us-ascii?Q?xll3UPEZErC46lAnNG66ZuSB0y7q67OiEMoq78poXlqB2EpsAYGsM7Nc3eye?=
 =?us-ascii?Q?jv/1NwwcDnopF5+uI4zxPQEG6pdEdEmkuCHzPrhn6D4zArFw7jh/t0sh1EOc?=
 =?us-ascii?Q?7aHuPgM7P0x2W70Gz0znCV/lEoAZV6zDjrfu5tMjj35XgKONu6qqc5Fmf25M?=
 =?us-ascii?Q?+KklzOEi+xr3NWbzJ234IJghRxFaxOwTd2vtGNyA2ow5J8D7ckanLW3w1OXe?=
 =?us-ascii?Q?0Lrdx+TZuIg1uDTRuWXB4PLiI92tA3cOMtm7L1btwOSAbqa/Do6nQ4B/pZ/W?=
 =?us-ascii?Q?zEbGzPFKV9ve7q+U06AFMVij9w7yya4qPC3RHcecrKhRY/16I/JapufH43tC?=
 =?us-ascii?Q?TGTpbzmn5RnFDKuiuun3i0fl4jNnta4DKOoGP/9Nf9fqoY9/sM8f8zUzTiKh?=
 =?us-ascii?Q?d3L58lXLQLiH/zH3ul8JmaqUGhiEOzY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec4e3709-edf0-49d8-9871-08df1de27abf
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB14118.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 04:31:07.0403
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0ToKMLngEDv/v7P4OgcawdCRpmMImW779KhjHkeDZDa3tkbBAtmOfw6SeyatmcuU4HwsJGhuToInDqc1y5iLi/5JJexbSN2K6JGEe7g3V8f8+rXmtHzy1IQRtCtiKFOc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB14206

cpcap_soc_probe() (Z) gets drvdata from Component dev (A), and set it
to Component dev (B) again. (= snd_soc_component_set_drvdata() calls
dev_set_drvdata() inside). It is point less. Let's remove (B).

(Z)	static int cpcap_soc_probe(...)
	{
		...
(A)		struct cpcap_audio *cpcap = dev_get_drvdata(component->dev);
		...
(B)		snd_soc_component_set_drvdata(component, cpcap);
		...
	}

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/cpcap.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/cpcap.c b/sound/soc/codecs/cpcap.c
index dda68165b8173..eaaf141dea57e 100644
--- a/sound/soc/codecs/cpcap.c
+++ b/sound/soc/codecs/cpcap.c
@@ -1625,7 +1625,6 @@ static int cpcap_soc_probe(struct snd_soc_component *component)
 	struct cpcap_audio *cpcap = dev_get_drvdata(component->dev);
 	int err;
 
-	snd_soc_component_set_drvdata(component, cpcap);
 	cpcap->component = component;
 
 	err = snd_soc_card_jack_new(card, "Headphones",
-- 
2.53.0

