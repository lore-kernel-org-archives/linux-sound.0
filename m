Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011028.outbound.protection.outlook.com [52.101.125.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21B953546CA
	for <linux-sound@vger.kernel.org>; Fri, 18 Sep 2026 01:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789695800; cv=fail; b=rjLk7EDRlDsJ0HXQy0pdMWpQi07Qjz+I0gmnOQbB8uyQbiFKpJeXOAfTct8XPBAoZ++1e/4kwZ7ZH0Tviza/eY7phmvROD/BJ+JGmLBo1JN4ORTAdjw/umvGJxHGVWTQdK7/8pG9T9FRRzWJypsurTB/g+tWnE/D1AUB5zw7CKQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789695800; c=relaxed/simple;
	bh=/LmV9W+EZ3t4coX2sv2GlLtY2VLS/UMFfQHcZt3DmLg=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=pZre2WiTvNuTi1TUWaCBPnbpHC2KSYGTSENowF4TS0G58u2uQFuYArYGGzzfJqip4++8g4JpX5Xcuv5CUdhAGlPLJ0FkgP6QxC7jk/pJYW7hhuuqkjOhzhjaQx2eBm3WfjF/IR4nYw82jwkk26qiYlqPv80fttSUR4lS8TBTGBQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=KIef1AF9; arc=fail smtp.client-ip=52.101.125.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="KIef1AF9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BgF/BYSlEbyCxfo3MwY3ygfNjY08VND4WWvn9+Bx0YD60+OXVzEe3SuqTXS67ezJcyx6R+V6f9wEkKQbZlba1GJ8VmCtWN8C/YEUnRChrdF7QKkX5Y96cfF+oBrDelp6LnskV1FUFkHhtfBLnVXMuhaY2jsfODvKL1b7MQFXxIoVsPVtVytmmI7aXc+u73/yNuF8FKHD2H4PSq6SGxrq+1A+dQR34Rvqf/dFP4H4m1GUbFdF/oXfdJv0/ozQUEFcgb2W9zksBxVywsFibigE2BcEzZbU49+hkn9NOzyxSxuxYKy0hId38Db9ebc2RBWdjJ8nG5EhEwvx3Aku0HvUmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=memGhRfXhxWfmDao9RZU1tbOxdtq9J2ZPCfOZ+l4mZ4=;
 b=DwCm7uBRE9oP18tMGX+9+H4sADiivaklapqUsxWL5tJnVhSejb9IIxaMp3IgAhZAFZ9XnNztfqg2gim2QGHKN9xOUkVL0gtQNTP/2NdsGmF9uzWl6/FANuocmEf32fYRbrwXhJ1i/HBxiC5kbTWWC7yYAj9nr/xCHu/eKy+5XIXJCMWfd1Z7ZxdFSYKAn9f41Pu4DrB7f5JYNCTOBhQq0sfSKYvrd8f9albpujGLOgH/+0Bu3W5pyZMNV7D8QXTSECYSF9u8MWhMMmF9p29W+3bSKw4qMOiRWY2Dnx/gG4APJXNf2+d+iFanPi+ra40RfeB008UT+lDIO8a7fbTdDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=memGhRfXhxWfmDao9RZU1tbOxdtq9J2ZPCfOZ+l4mZ4=;
 b=KIef1AF9C3fA914ogO/ljM+1Sj87MxHSKQ/N+1deoBsNukPFXQv+sV8Y/m25AQBdp15F+XAfhXlNloLLt0CgCIXbCqW1rEn0iLLM0BZ+i7+ruiBoGTqF2DSY/mDUnd8X/ZxfCsjKM3Tsvotab+G9cyv5vLaznXYu1C5PwRQXOrA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12) by TYCPR01MB18388.jpnprd01.prod.outlook.com
 (2603:1096:405:3ee::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 01:43:17 +0000
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45]) by TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45%6]) with mapi id 15.21.0428.011; Fri, 18 Sep 2026
 01:43:17 +0000
Message-ID: <87jyojjpvv.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 4/9] ASoC: soc-dai: add snd_soc_dai_to_driver()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>, Alvin Sipraga <alvin.sipraga@analog.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87pkybjq02.wl-kuninori.morimoto.gx@renesas.com>
References: <87pkybjq02.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 01:43:16 +0000
X-ClientProxiedBy: TYWPR01CA0007.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::12) To TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB14118:EE_|TYCPR01MB18388:EE_
X-MS-Office365-Filtering-Correlation-Id: af8138e0-577b-4885-1ea2-08df152635fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|52116014|10067099003|11063799006|56012099006|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	dIPjLDXHMN/bL2+sd3mZKb43wPPTKRk0xR6GLuZQBmNgvCPOPFb2rIi6vp+JJzRdodzwyqrj0WjLj/Ygf1zTsvSOJo3kVkN8GpTKFJA+OA/HatqrROX8v0NMcQiqZtnxJ+K1xuxlcmJ48ZwtpBGdDBXJMNK/QxDpvQBrAZKSuCoxkGTMmJXOqk2I22gidT1zKpFnLSq3Ya61WX8Eatf5njyc9gX8hx3PbSJBkavSqKUPlK35DJHol1x3PZmXkDwDOCyyHsnPuvomV4dsMzkina6msKXLqkbs5sVgnM59nOdEQm+N3aQWTcuMfRD/my0sONduNtZaZ6iYXZoaibsggFOAhIYN3z5JpPauhYYwHPlWO2BJWbcmyK/aF94fDQSIN+sP/uNgY+F/ZnnnRe90txzvcpw/xGhgJ2YcSAcMZN+WKB0f5sliU7chbNFKO1YDwzXw9RYqHCP/B6z99HotyiJlxAjtXlnY4WLnjfQQxtgymyta8DEiAGBQ6YX3gImSVzVz+EpXuD+4BVmjlAfXsaPufZ/cdR/0em/RmkSHntJite2t4eXbTMIsrpGOqtoJACztD67O9T543JQhiIUaBRAOm1kpvtsFN2gYpM/QYfSkTRgnSxiIXisdO6VG2zJ7K8VMEGpoxpScYt+akw4EEv/mTmOW6S/mM+zb1cZZypzNxU6YW+B+Pu/xkzDMCyi4DjFhgoVI9c/cFe4tZg6HZw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB14118.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(52116014)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-2?Q?LLHZTDRptFK3c/lZ82atJhRMtYJW82ttcs7JdDWKjXtST0JLt5ioT5cS4M?=
 =?iso-8859-2?Q?tCNKD+1mPik3y18WzgXPZaX8ev1bg8r1i2vmO1IPMRZF9phMadYMy3jT5k?=
 =?iso-8859-2?Q?1DZnJW7nWXiQkzCIE2NCFKJa8KabND7sKUDq4Ed436ndAd18k3a7ESir5g?=
 =?iso-8859-2?Q?q9n/FFPKXrWRKX1ex0MKqzM68+7H7GluBBav/Zu3S4qZKruupkToQRaUFZ?=
 =?iso-8859-2?Q?Vs/DiXwVv098IiyQkN1qXSo9hIeLuRUf9XHEqbYHBwh1HkAdhkOg7Jv2tY?=
 =?iso-8859-2?Q?R71odBBS5Msw49Xng+AZNH/I6e/hbZeblCCX1AXOlKxZ8zHFMVAVrotkTi?=
 =?iso-8859-2?Q?G5ZiziZszh6NHYsFqjC7ieLITBpSQ3GIkyl7igBHox4jtj0eKvBtMaJxyJ?=
 =?iso-8859-2?Q?nMOp6zUP/OpLTAv8ioa0GhqFnKuZj0anY7epksysvOvyk0C+Ti0TKOEsPw?=
 =?iso-8859-2?Q?Gcn0tqPccmCDm0h6gTmgnnYU3UZyPhyTzCA8yXa9Czog3uq4S9pRrher4B?=
 =?iso-8859-2?Q?7PfC//HfyN4U/R6h3IU9rOr7Q5SqaDZD2WWWFaSigXEwh28xlaryxvPj++?=
 =?iso-8859-2?Q?1q8xPyAeEo21qDu9gge+4iuedebKEGTtfRcqfy4AFakyduslysgyd5bjsH?=
 =?iso-8859-2?Q?QAjCLmRY+S3LCLq5h70uI77DLBJAsap1gP3sSs3l5sHihyPQ1syvDAwnSx?=
 =?iso-8859-2?Q?mh129DTlmeqgdWPRLHoYrV0FGsH/fDQR70mDPY04ngcauhlwzUEpGlo0Zd?=
 =?iso-8859-2?Q?CF0H96sxchaVlRcD7RdngAJ67qL/Q9MsUSTVvMPWxZ2iifty/SfBUlk4pj?=
 =?iso-8859-2?Q?WQmFOuFTQbE6JDjQNHF3AQnXFdGhmldJvDdZMDIhhl5Mnpxb1K0/pB3v7C?=
 =?iso-8859-2?Q?htcBKia6CmUOKGC4UYrfNfor+7dWvGiqdQbgH1UkayE7lax+64Pc2JViyg?=
 =?iso-8859-2?Q?D9R1tW0GnrKjH1eLT+I/BR0JLTa9yTgyrgjZnRQcWMDOOBd/ErocVypCy4?=
 =?iso-8859-2?Q?1hM7chBnyhb/1yKU/gVnz5+SKO5Cs1m9fwAVyydyFgqnK5WKJ0DtUncIjZ?=
 =?iso-8859-2?Q?Uu7ef4AvoKdlUkxzsDzHJ/lBnaHHSWaCLhCRz3cSdXJNVDbTP5s7L/qx0Z?=
 =?iso-8859-2?Q?n1VhipL8s1KOF0Drwj3v2SWXdzeAkZrIDOPhtqPb3poQsBPf7F8vvZszg2?=
 =?iso-8859-2?Q?C7TP1HfBM3xbb978p6bDxePj3T2gCzkNxGsE49gqxaq3ap50KxAJ681SDz?=
 =?iso-8859-2?Q?UcAMbrV1TfW6m7nVXvj+X+JApR3sYAffQr+bfYQrIE2wk8rNrNtHNNs/mz?=
 =?iso-8859-2?Q?7M7fTFkS6pBp1E4nwhjWljfkq7R61xQ3Bm/tJnDf11vXdc8n/bgG0kpuPZ?=
 =?iso-8859-2?Q?6QLHpA3UADJnmlbWPhg6DvMFnx94NSygc72HO3K900YSaZRJX6D33E3WIF?=
 =?iso-8859-2?Q?eBZJLsXdMqk8KFQB2igfv0oo5L918VtDlDkoIvlfdIDvqCZgT2ZZvzxv+9?=
 =?iso-8859-2?Q?mviRWV/4+evgJ+TEUQ1AEIIEr7pjVSOGRlqYROACwF1UvFA0C5Y5fnciea?=
 =?iso-8859-2?Q?C5KgPlWM2tYrrMJNKBxAnTnvNwKLWr+ErpZDCHqj2xR2RR26aBetg2fS0d?=
 =?iso-8859-2?Q?godxpejuiKJ9Pw0w4g1MwnhkIJkqVJnOowQX1J8vZOz6hQEx803diFIHf1?=
 =?iso-8859-2?Q?wW7VkTZBC1QPal/qGT6xXyCCSRo6yLUa1RGmplCzy8TQZ36cNb5RUO/gox?=
 =?iso-8859-2?Q?s0hO9QDJQvtGejShUYYq303STrk7YtA8bom7O9fsVvT4c5x2OCqxBsjCaG?=
 =?iso-8859-2?Q?b3RfWKzE9HXeNuc9sfsgVtwEqP4vEx58e8JqTJsTRej/NYV2Calx?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af8138e0-577b-4885-1ea2-08df152635fb
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB14118.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 01:43:16.9865
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yxm1xWoP7r3fKOo/Ck/fDzDRTFWsAV3Sh8+uPS0LuauLcuAvgHijbf9hjxLiUBOFfZKJMHuxbJccusQXGsAjrTnbOG87V5VQ1aRZZ+VSouhocifFl1zkj3kVBaqnfHpZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB18388

DAI parameter will be capsuled soon, will be not enable to access from
each drivers. Add snd_soc_dai_to_driver() to get driver from DAI.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Alvin =A9ipraga <alvin.sipraga@analog.com>
---
 include/sound/soc-dai.h | 1 +
 sound/soc/soc-dai.c     | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index 7f8a64db0dc7f..375a8674d1452 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -213,6 +213,7 @@ int snd_soc_dai_get_channel_map(const struct snd_soc_da=
i *dai,
 		unsigned int *rx_num, unsigned int *rx_slot);
=20
 struct snd_soc_component *snd_soc_dai_to_component(const struct snd_soc_da=
i *dai);
+struct snd_soc_dai_driver *snd_soc_dai_to_driver(const struct snd_soc_dai =
*dai);
 int snd_soc_dai_is_dummy(const struct snd_soc_dai *dai);
 int snd_soc_dai_add_controls(struct snd_soc_dai *dai,
 			     const struct snd_kcontrol_new *controls, int num_controls);
diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index a859acc4b28f3..3e553e8c0535e 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -26,6 +26,12 @@ struct snd_soc_component *snd_soc_dai_to_component(const=
 struct snd_soc_dai *dai
 }
 EXPORT_SYMBOL_GPL(snd_soc_dai_to_component);
=20
+struct snd_soc_dai_driver *snd_soc_dai_to_driver(const struct snd_soc_dai =
*dai)
+{
+	return dai->driver;
+}
+EXPORT_SYMBOL_GPL(snd_soc_dai_to_driver);
+
 /*
  * We might want to check substream by using list.
  * In such case, we can update these macros.
--=20
2.53.0

