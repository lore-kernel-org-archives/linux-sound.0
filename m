Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010027.outbound.protection.outlook.com [52.101.228.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A4F3002A0
	for <linux-sound@vger.kernel.org>; Thu, 23 Jul 2026 06:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784788465; cv=fail; b=S3QkO8UNc3QiqfGq7AhXPzns4B43vl2KbpCCOR5O6AqS6UxYX8V/eg/D/RFuXjw4i9seRQI68yVEIwuH2zQyYcHIRzy5Bx5QTmuo74Go6EryjQA36HTFa0I+lrCABP+trK6vOmVpPFrkN47xIWxNDDrvgsYSw9Kxi/oUf3HIHsY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784788465; c=relaxed/simple;
	bh=/eWZAuVaWSomQz/UDMgVMlZdNsNv53RkNUpS6qiK0pM=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=BmBRNXdiUBnV/zyJrycMXMfRBn0ih8D0T5FPOB+G6NkHYg/p/tLX7ixIPchiQ5C1JMFOF/iQhta8Joed7pr/bJJbvQaUXvGbtTYHa9X5DYWrek0halPtIsYw1dMu7lhy6LSmZePTCksX/RYszcFuMSI4ncgvNXb+pm7RVdEKyw0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=VAfMUk9Z; arc=fail smtp.client-ip=52.101.228.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="VAfMUk9Z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AJ5uIUpxM2oOoN+wJRXA0j+49LImPxiDXNAywqopBpNiUiH/CFUfegVXZ4nVYYC/rt/0tYMg2EkF3HWuiOcN57tYKGj7IQpZYLDWoT/TeA0w8eKManJRaUd9mCGZn3x/p9ZY2DXZbUEqPc57v9bVpBr78FatTvAHmDu12bgwAU7S002ZCV0vxWLyRIw92rSrlw2OhjULQ7aHghZkxbiwD60aUeYSCULAG0QJno5QLPjZe1unMu/F9EutJSX5B/YfOiyAK0E2f6l2ON6lQd3ID5MxVwz8IXZ+rp8x1QftBYHtmERJvWWz2+n8hH8Bh7u+sy4hKO9IounkA3YHVUTEwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NRdyI0Qw9lqHRhsp6twahL6YHRfRdcoFr3/BtbhT5JY=;
 b=u4Fr6zFHQwXfThYCoWFsWvOQEJgs3jg9YCevI8ciODZPh+qbQNoTrZPwyicnlkWgI5RQiP1zil0fzoxIkri5LusSUl4LFR01KZWWVqPCrJXM/U0cUAjgV6xEflydCLtNow4UzibH/vSKhBhsDueevjK3tF5QOn5uBgM2SUETdU9Ar1jdadRM1dcpe0boRun5EY6FcvdLAQ9yuiFM4ARWBOgK83VlkOx0HcWEOeqBk1SlAPYoMcbEFPWaaaRsu6UGy2lslw9ipByFEtFF6/49tTgoa8BZRq+fGC8Vhw+jJVXYn/PufAuNhyqbzcNAF3v0dRvOfu1qZvkxjnVqQqs6RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NRdyI0Qw9lqHRhsp6twahL6YHRfRdcoFr3/BtbhT5JY=;
 b=VAfMUk9ZMGacSXUB8q5bgcv3Pa4ZqcUGo0X4F6xR+Vru760iQDayNp4TMQYbGrOcNoAPV7UOCPXaWo/qDkqyrxPmoCbe1MlOb50+9AhWH91NYtZN8aWbsAQ/048MciFI/NT76FAAacZfzKOpgLJoLWCVnPWTzitIxS056dHxodc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYYPR01MB7103.jpnprd01.prod.outlook.com (2603:1096:400:df::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 06:34:20 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 06:34:20 +0000
Message-ID: <87wlumrz83.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v5 01/12] ASoC: soc-component: move soc_component_field_shift()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Bard Liao <yung-chuan.liao@linux.intel.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Fabio Estevam <festevam@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87y0f2rz8l.wl-kuninori.morimoto.gx@renesas.com>
References: <87y0f2rz8l.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 23 Jul 2026 06:34:20 +0000
X-ClientProxiedBy: TYCP286CA0270.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::16) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYYPR01MB7103:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a525b9a-9b83-43e8-fdfd-08dee8846d9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|52116014|7416014|38350700014|921020|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	VqVTA6Eg/bCqEIkvqZtsxZ0VaLwfCODKRUcmWAUrep2bWO31+XKJY7+JVceVUMMU0OIEj18RqyTJ7zxyKUUpq+Y9eKcAieOO6/EhNd44rrP7F66qWgusXvfM5sBn9o2CdtC5GapusUXUgKBJwefmw7+iONTFDCCxtxJJSKJj6Epi+U+rTolwSiRjayz6rBxw4zO4AWs0xbE3OQHP2IEV8pOxuCsH6cIh031guH/WiHBE9uET6lmTUOmbe9PtTR+k2mW280WC4ij0Iv5L5KLsKlyfCY3uAld6ligSVWeS4QtDwvbHJCOS9Nr5ziBGqSOlK52ZQ2pnX6dsDc4/Zas27T9GTg/Kr0VFbpn4znQvWep7qAGc6u+yRWaU7YXy0pmuYLgMqIMhggBNloDZjKNMqF+ARMU5GLNi66zg6OEpwKO1nlh2vfRvwG2EXVUvLYWQkEFm8nwKkt0X4gDeEyKakL1qDpAixZYWnXOJxd0f/FjpF2dARdXbN+s/Kz8158RLCrsFn1jrAcexxGZ1MqVEPkD+NhbazTXGqnpgp5FwwpeUarvm4ff3Ng4H167YZJVdyklaM7YibdCKDhOaXg51PkshjcZKRs0fBTyMxdOQEqB9fILcgDpBSg47pX9EC4QKRoIQhj05amzOkIwohtQDaRrYNTEAsy5Isa031+1EieJY0F9Sbd+ULuOtk82MPDQbFH6oEVB/ISHb7Pv1T+rVWGU1AMxcGqA4sH6npCYNWl58AYyGx8YZFG0SWHaszS9g
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(52116014)(7416014)(38350700014)(921020)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VKx5h/UEm7blD4lsGy+fJMLpt01CAxSsT/681Nyz5pvz3f9mRk5h17uDicy1?=
 =?us-ascii?Q?U5eXD+/lHWqO0MUL3MuS+gNgm0Flk+UD0p3Hz8hFTCZB7lrIBlvoQw3nMK4i?=
 =?us-ascii?Q?3vUd+mN1B5a6xGBSPzxAowLc6iEfOlRrfMyd7Npl+NvRiwQ9MJQFGBI9YiBF?=
 =?us-ascii?Q?q+VnnBhajTO4M05s4L8WD5pbEhKKsbcdJ5gCCXpgXdBo7cBr+nxeMjRRH7HC?=
 =?us-ascii?Q?eyB+rcp0R0kckTUn+udgvvRoYS5uNt7Fy6KtldHDjvAyWcQR77A+cy6S2fPY?=
 =?us-ascii?Q?S5z4ZtOg9kBZHanlaJD25RJ/XT6Tr7HYkAjEss9NrJj9fOlHoqOncgpN6oGe?=
 =?us-ascii?Q?Zg1WIZTMGJVgH0XJ1fzU9jUBGQMyeGDkn4MpF/ts1DaN6iAsTgQOtykeNyM2?=
 =?us-ascii?Q?CF/8CqHbMkW5+5cHVAZJS+YnqITF4NLUd9kf3pMfH3T93EytrtJ3oJgk+5/a?=
 =?us-ascii?Q?MyczDAlxMyYAGjNwKexS98+v9tLkHoRw8oWY9ME7waLGAx9QCbrZJvC+ZjyH?=
 =?us-ascii?Q?0YgOMXWXOOMx+75eUCYVFhV4UVQaCwyrYUdNKULIf8GFU7kdXtfZ3eaJlu5L?=
 =?us-ascii?Q?09D6yr/hijWe5evsner2Ybqh/bt/VPvp2iUNuY4SQh0w6jKVjkeacU2m3nun?=
 =?us-ascii?Q?PkRIau2AuHEwWYrEhW8qR7Quk2hPocKY4EXu0AUL25B7E9oUqN06sCElRKbm?=
 =?us-ascii?Q?nbLljyDiqEPQFEJZBk5cFTpzB9idhZfS9wE2JpRv0H1K/jYFvVGcCHj6tY9X?=
 =?us-ascii?Q?sfIuqAE64lv17yPaqLg8LLPy3WvnDQXXF771nG52pSEA8MGPM30aSYYcs15E?=
 =?us-ascii?Q?3C0sypT8GUgwaBU/HLEoCoLhcPakkTqa0II1/UfTcaxwbXT88hqHpf4frA0O?=
 =?us-ascii?Q?PBDwpOkeqRE+7oGyJFfKOHmeAuyM7RNojqH24gbfCkyPmL195+8+4TGwSOVE?=
 =?us-ascii?Q?oAz1c3NwhTyFzSshXnAWhoTyQ01hLQiogzKT0hiXulNBEgKM8ZZWzPj5Y9y3?=
 =?us-ascii?Q?KFD2F11uc1+SegL/XM9W2xe+xK6XOC+tzejRdU/l/oFGUsa1FlgI/8Q8WDoK?=
 =?us-ascii?Q?0VPF8+t9bATVNBhtQ9+LoCcD2RPsf/RnhlMy5SB9J8rZ8438sNqWtf1wBmhA?=
 =?us-ascii?Q?8PTEQG5JXQInXYECmG65kEoRK6drjYbDIm1lLKS4GJ5SLivF4QsMDJi6kR5i?=
 =?us-ascii?Q?sSaT9mtL71/ACm2WtrgUc5SD3aH6fKL8mGPTQNUi9FpR9ikd/jQIzhFXEPDe?=
 =?us-ascii?Q?ScI6+vcmcO2WtOM6RnLYcOu1OiNNJqYwDyyfsHszCLMzpgT1GiBW+pXpeyfS?=
 =?us-ascii?Q?akCXm+2vjeW7M/O027v2UrQ7RwoWOH8U41xJjN5dgBRNMFuK4lvHUaIUBNK5?=
 =?us-ascii?Q?auUhtdcfyHIZQmDLN62N1xzy4Luhz9q1pHpMhxyApSSjfpCWhgnUqHvI2VOC?=
 =?us-ascii?Q?UF79pALXptvBii8tkuqyWK2nBUvBE09kCdXeR808sYzNp3XS9KvBmy2Rnzka?=
 =?us-ascii?Q?PxdgGXIt73KvWuIgNs10mOJSja9M3onyIGpgL0bGqeUUpenbw6GQL2ZIerC+?=
 =?us-ascii?Q?zAqkbJ0vzItTY4Uur+icHlz+io0DVzmgchkv+KG5WBW+iHqGDK4DjjtKI5RS?=
 =?us-ascii?Q?3wxjJrt+N9z/K3U2MEQA9DyIJcM3MtwdWmXL0PkZFC2FJUP5Xk5gsrcl9REV?=
 =?us-ascii?Q?FFTYyLGXuTyR48vvEYi67kyysE2ZbikFGPur8t1f1BxzQxBkiCTU2HSQ9/sp?=
 =?us-ascii?Q?cMhnEHfK3xtdYgcUkllCBoz0+K5P9dXRK0Mk3usBJVj361ncp9eI?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a525b9a-9b83-43e8-fdfd-08dee8846d9b
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 06:34:20.6397
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TH1vnBOsCFgFUE0HG0Qbbxp3jaNedPoCptwhCE43THkHni3Krbzaa9cVWnYIdFA33G9V71qKaaXcjk0A0zBtMpiudCyKUOzpVwmAtxcCbr3WdtE2CWJARg7iwTxy4YBR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB7103

soc_component_field_shift() is used from
snd_soc_component_{read/write}_field(). It is better to located around
them.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/soc-component.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index 21492d15833f7..718246e53e896 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -29,18 +29,6 @@ static inline int _soc_component_ret_reg_rw(struct snd_soc_component *component,
 			   func, component->name, reg);
 }
 
-static inline int soc_component_field_shift(struct snd_soc_component *component,
-					    unsigned int mask)
-{
-	if (!mask) {
-		dev_err(component->dev,	"ASoC: error field mask is zero for %s\n",
-			component->name);
-		return 0;
-	}
-
-	return (ffs(mask) - 1);
-}
-
 /*
  * We might want to check substream by using list.
  * In such case, we can update these macros.
@@ -810,6 +798,18 @@ int snd_soc_component_update_bits_async(struct snd_soc_component *component,
 }
 EXPORT_SYMBOL_GPL(snd_soc_component_update_bits_async);
 
+static inline int soc_component_field_shift(struct snd_soc_component *component,
+					    unsigned int mask)
+{
+	if (!mask) {
+		dev_err(component->dev,	"ASoC: error field mask is zero for %s\n",
+			component->name);
+		return 0;
+	}
+
+	return (ffs(mask) - 1);
+}
+
 /**
  * snd_soc_component_read_field() - Read register field value
  * @component: Component to read from
-- 
2.53.0

