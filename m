Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010063.outbound.protection.outlook.com [52.101.229.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4813A30AD04
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760415900; cv=fail; b=byGwsLr7dY+HA8h9/2gfYBhvYs28oOF5wkbqCbVUL+VaeP7LkPJeJzXLZFOPjBYOL5DG2xMNMM5QYjZTybcgodhbfqWc+PzORqJKkxuR3p8bViRaZ+iB9u0h6WsxqvkShmD60I35Xmpxphi0QdzeXGWheubP+bm9lAtpxud66w4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760415900; c=relaxed/simple;
	bh=pYTwVLMfl9bHcXvY3aN0riDKP5RfAjvgyuO/8VX/ZiE=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=R9kanvjlPVLMr2Og6sZgogRq8NCG5qwxQvS0CE9YkHZNnE9hl41xUFrzaVPzQAGi4Or39zcxa5EHrGFIFb5dQbX9E64mtkKxC3d6ut4Lstzt/dHOvDmmZBqHVf/asZq5g753Nav8ifgBwGYIPtY+Fde1AJQGmcJukkEYnICzG2U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=h1NK9xFF; arc=fail smtp.client-ip=52.101.229.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="h1NK9xFF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=stJdRrJramzXHwKmAmkkgRyePvUIKO+yotxw6vrNgz+Qp5eP/7/t+yoYtJgvKGbOTLQGagAX/wCAWOj1e2fAlfRjZ9gHpwEfDGAOLU37cxjO7DmklXgDsIyRQ8eVpcK1s4eDNg+hzsmBpvo3RaPjlvKUAQONa+wbx63DsZCVxVKEUidfCUuyiJBOVj6sYmWb7JVgkUWlLCEK/XTALYz8vxtOkrGNaHfhIdifu5SlRFgg01qlBtIqBFOSuBwU5PawVDaHd5TBPvp99z6ThZSalNgFKFksV4rAlph/MYp2QGJmwTELEJumTT/8QqioQqRhinN/s+R3htKcfFhByqRn0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vktHJ6gkpTUrua5Eg7jOArEvSNk3l7S/6+wW5VT6wQY=;
 b=yzUeEBiQ21jiZdD2j4y6CwcSzBAYHHihtushtLwiXm6bdN/aWZAvQEopXyG8QkmzMZE4m0rmveEZiCjNnXRfUPZlldlz8EYHaNIyAmIsOe/W7sjJVizDEYOXYHqnVAtsJcS6RYrQJOidfS798w0vWEWV00uKKowBN9vX3kNmTfEm72rze19bx7Aop71eZBYgjsCQS/LyOh4CkJeCuwKZ+Cswlkhu14aUIa67GHNDLLqeFt5H0Vkleb55S0b/+2T1P/3Z+f3jO0Od95Pf4Xg7lZBjJqcDdBkH/0jJQG2FmTzLIQBu3PJPLIrlB7HNOsTt1wznW247a8IuOR11M9i59A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vktHJ6gkpTUrua5Eg7jOArEvSNk3l7S/6+wW5VT6wQY=;
 b=h1NK9xFFHJZPi6AgkbBYM4kBSDOHRc+yUgmmf7E7EJZ50IQ9NCM2eBpkSRuEEJQK2xFgo0yccm9RKE+IeOkIf14YK9igeZ1x+XatY2szdAhyrya5feXARspsZXoHEviRFx9vQxzQ/qjewcgTgAQvdE3QjqP2OwhQ3rJmgPr+Tac=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB9449.jpnprd01.prod.outlook.com
 (2603:1096:400:199::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:24:57 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:24:57 +0000
Message-ID: <87cy6qp0ti.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 088/139] ASoC: codecs: tlv320aic23: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:24:57 +0000
X-ClientProxiedBy: TYCP286CA0066.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::10) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB9449:EE_
X-MS-Office365-Filtering-Correlation-Id: 14ed9071-de18-4cc6-48ad-08de0ad9a1f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cv4x3jNf1vF2cnhMp4UIlhvpPyKDaMkloER3MpyAvqxPMAxVbuSw+DIIQxwo?=
 =?us-ascii?Q?wC911V5tlM4I4s94O8f5wFPlkFnJhGGyLsC2w0nkbs5+3vsCMHqNz1hDCE0L?=
 =?us-ascii?Q?Se5p8nLLxGNKDnIoO3vLg2f2auAsL9x8zRtj9KZUSgQSL0ZKGvAv/2n3cz/z?=
 =?us-ascii?Q?cSY/H+PK5bvxhOzDpuQNtpNF7DZtP9QF+LwaX7v/c5cKL+JOFxqCvSqd+8ks?=
 =?us-ascii?Q?lC+Xop0QuEtSFKGu7f0mNH8Sd02KZXF4oVWxuL3DQ7KvRwG2lGfBFXnlIgQ+?=
 =?us-ascii?Q?EuVDmNwvqdwO7agliL6myRGa5Ay5bwGm1uErGN6NgFPvEI/yaCS7Kcj36z0x?=
 =?us-ascii?Q?er/NFkVPIl7W58LPyh/n1NNFwEp3v1ZdmGsRV9WI438Kap0Za93ddb/ou6cc?=
 =?us-ascii?Q?K5axEcQSG1qAjvahsdKnVjhdpT2z8DNNFYHaES+G7TocBCc+4+K7wrDDtW4a?=
 =?us-ascii?Q?LTi0WfFUlV5g/DkkeT8FxwQHxhKL8ld28WQg4w39O8tmzYwtT28gbw/FiEJL?=
 =?us-ascii?Q?4IVx6g/c//3ILqAmDFlKoucFDHji+ODCYHtK0UFy9Mr/FjFHALPK8uq9XhUT?=
 =?us-ascii?Q?XPamNVXDzYPOzcW6vCBRA/iEPbehuDwN+6xwsjOGd2699LDK6rgfD5xI+6Fe?=
 =?us-ascii?Q?a3vgQ+gfVsuB5sXs8aydYWD7/MW0skN8mnImnYqtxP7xjeadge1v2SrQ/a41?=
 =?us-ascii?Q?Dblo/skfKRMHiDX6elveEhjWXVl2Fqam4yiCuvh6hUXJfnZl+p1HUqW4rmfc?=
 =?us-ascii?Q?DP4UeEQ3h9LFYIhn4gTs9sucZqkrrK/88WErUaBSiRJXLeLRzIrkO66xjPQ1?=
 =?us-ascii?Q?kFb2DCsW127Ss3RNtlSJ4l7W4sX0cA4riTsylyHNYf+TsSwJhUU/Co1AJq43?=
 =?us-ascii?Q?lXe3MYjn5D8tMBGcoLi7rDmTsqTj4SpzaInk28YciwBV/kTWsF7XUSVDqhwM?=
 =?us-ascii?Q?kp/NcO59h+Fy7FMoTfpdQsDy2Bm0oO+rt9qYITdgqHVmk2QxHV7P1a8b9wT6?=
 =?us-ascii?Q?RWLhbRnoJiH2+uhjkroE2hx+sr92VxYTv2QuctFjIP9pXgin6LxiPRBG+a9r?=
 =?us-ascii?Q?b8QIU8DbWOLJCNm9Q7gIUVPx+eHCI19mdpfwuBA5vtytsDOl+QpkRJHOzNgr?=
 =?us-ascii?Q?OKGrilqbBr9s6hsTXns2WfgphGOXicmupqEBRaA+KGAhgN5KHxoPK/01u2bd?=
 =?us-ascii?Q?ULEhwzr8CH3BIYjZucHpQBgFQz1hgzJQbaSfe2UAG4o8rPaS/Hrgr9iLHY+1?=
 =?us-ascii?Q?IwHFPeSs2CCtuFUVT9TPfTvy89yVJyU7z14REzkt25uWgsIjRi3L+Wb7ptkh?=
 =?us-ascii?Q?R7K85sf6gZYV/JivRlf69N03X3LejctXiWhnjwCaDwptP7FmaC+St3J63W/s?=
 =?us-ascii?Q?agVyXL0rCexvbuW+t/CUVzd4bNPshPEFUflCpkL3EDw21RCGXaXlCQ5UET+3?=
 =?us-ascii?Q?n452hZ0R2VqoCXCEZ3Tz5Am0Bwzp3ir0TWhdPUs4ougx7Tu8oQ1/RoED1Lo4?=
 =?us-ascii?Q?ppd7wjlXyJwLssVfXivRmNEtBGMEIWJ0P7hM?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YXe1aK4Q6JyFIm8eoF4WCDO4u6r+pSyI1TM8Pg/0tocXWkfJbosx1OC33wAP?=
 =?us-ascii?Q?LMt1khgQm0Cj6O//As6W0v9IDoe9H2tQnjSi/cRQuzmoLFQTPmwclbIs3sZw?=
 =?us-ascii?Q?IPQKQa1gsy5aem4BeuV3/IPJPRNBIqm6mDyyIBXS2wrhJ7mww53mlaezWSOC?=
 =?us-ascii?Q?680O3JlCQ5LGQ372CCsfGWcrI3rwARHdyjhhT15GQi0hmrIGmd2Z+DJbwakY?=
 =?us-ascii?Q?g9JyL2YkWyY0hHC3E5T4f7aC7znxZ258DJ9DTpH3ERynLdXxkI0Yz1cAHIz4?=
 =?us-ascii?Q?7Wo3vEfTLH2BByJycEJS1Z8rbj9REE1EWrNvofDtvzmp3hjQppowgP9mxClQ?=
 =?us-ascii?Q?g3162qgAdj5n9cGr2XZ3GulstJmiG46QZ0Cxh1MWxDx/HYcveEmBHHit0aDm?=
 =?us-ascii?Q?o7sZyRjzWc/OcwRQEsV8MJihJgfLcfWjl9h96sc8JQTyfeDy8hu9dznIL2Bb?=
 =?us-ascii?Q?INQYxuOBudbfItLaxAj99G6QAJ4jVWJa7+J+qxseu/4uxA9FDevznVk1ddZ2?=
 =?us-ascii?Q?+p4ns0SIZy0ca/TNoZTtvEk0e++Nhc4kizrrpYq2FRMvGYEaQZjMMdVZgdrU?=
 =?us-ascii?Q?5YqAE8Kl6S3tzubhFjUoNJaKTwjSfqxdsn1REdm79ROHIaUzkAgxmAkbUaMT?=
 =?us-ascii?Q?Q2WBc423vPD21okjbIe448fvDdQyxkAaYqfRZLxC6KUMuAbPwbSTa4x0EowJ?=
 =?us-ascii?Q?hwYV9Vy9kHwsUJByqXv/DiaaAS4truijMCVpQAII9Gh4xc/gHNZkCZHXfXSU?=
 =?us-ascii?Q?KpPB5A9knIgxr6hQsse9WqE8ZQUi+xg3iF1mJMnSK2CG1dbJGv9zSYJmv8Iq?=
 =?us-ascii?Q?zYcXFY5J9paeAse/iclVJ2oei4EKHog5iQQIATVkchrXU7askCuI9zERTQNl?=
 =?us-ascii?Q?GgCT9SCvQYZ5DyLmepiU6P8tY3tyvmjgrra7ALDKrUs+cCVVb27/cGB8Mv9I?=
 =?us-ascii?Q?OYndMj6QXDQ9zoqakd4QMoYGfd07xgkPOYlQaBKe/2A4k9ocNnYosYSv++ug?=
 =?us-ascii?Q?7VBbTIYWXmVmwbYFeqrKKtuWZhawpoBneqhMbvbY/ch+um4dsaDkCERTR2WG?=
 =?us-ascii?Q?QuOrdf5csNga3s2Zks1/C+Qgdn1f182a+Mz4NY4ntd0ahCc/iKWWxsMSzsCo?=
 =?us-ascii?Q?Q38szlZ75N2/+oMWbm/ETftLXGBleEr0eB89Ra0nIrm6fKl1VQmL6HYjaktT?=
 =?us-ascii?Q?zyLS32nfE6MLBLluM2RuYlHsDTePjAfwaQe+TNeqkz8NC1I1u1A9BNQ3LdQL?=
 =?us-ascii?Q?8Ek0AM3acxeGCQov7UYWQRcSMRoRz+oOvS849daUZyOVIL9Ws+24OhRAwKW9?=
 =?us-ascii?Q?fMfWernU7jj1q94kbbqUf+hsEc2oaurP5T5R2uOiOVevrkMhD3/FTv/Y6IBF?=
 =?us-ascii?Q?WkW+GT5VPWwkjZZi92grgP7iXsiKY6ebHCBRAF4vHLsvfKgLJZ0qSD9ANc5U?=
 =?us-ascii?Q?HyNXgAqq1GeSMzTU+uJxw+0uYIpSJ/bNEwyWUknSbdoU6l4+7TuS7SSAG/a0?=
 =?us-ascii?Q?GYfLXSVuZzgeT+kRqVySQKPSq/rAdqNYE+S4Ab+3fSD5qUzeIL0bm6xgOHKg?=
 =?us-ascii?Q?KMwRyCp50zfTYLhd3TlYDBlmUyyPJwo3jc6EPZPUlpe/dOEH8ix0Op5Vt6Ge?=
 =?us-ascii?Q?/tFSkvtkJ7F4Iv6KcPZHCa4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14ed9071-de18-4cc6-48ad-08de0ad9a1f3
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:24:57.5655
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2CjjQmlxr+A4HThvXvxh6DDoS4JyaFEec14giTCycv5QMPiCbn0AlapQrbu7Tu+yRhP9TSyA/IsRBd4kB+WCZaUi2qLvvF6YEHaQLMa1mTwCzr0QXRDGZr1HHIHEwDBF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9449

We have very similar name functions (A)(B). Both gets component from
snd_kcontrol, but (A) is used in callback functions which is registered
through snd_soc_add_component_controls(), (B) is used through
snd_soc_dapm_new_widgets().

	(A) snd_soc_kcontrol_component()
	(B) snd_soc_dapm_kcontrol_component()

(B) is using very picky way to get component but using it is necessary in
ASoC. But (A) is just wrapper function to snd_kcontrol_chip(), and directly
using it without wrapper is very common way on ALSA.
To reduce confusions of similar function, let's use common way on (A).

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/tlv320aic23.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/tlv320aic23.c b/sound/soc/codecs/tlv320aic23.c
index c47aa4d4162dd..04ec8fb5c6e5b 100644
--- a/sound/soc/codecs/tlv320aic23.c
+++ b/sound/soc/codecs/tlv320aic23.c
@@ -77,7 +77,7 @@ static const DECLARE_TLV_DB_SCALE(sidetone_vol_tlv, -1800, 300, 0);
 static int snd_soc_tlv320aic23_put_volsw(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	u16 val, reg;
 
 	val = (ucontrol->value.integer.value[0] & 0x07);
@@ -100,7 +100,7 @@ static int snd_soc_tlv320aic23_put_volsw(struct snd_kcontrol *kcontrol,
 static int snd_soc_tlv320aic23_get_volsw(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	u16 val;
 
 	val = snd_soc_component_read(component, TLV320AIC23_ANLG) & (0x1C0);
-- 
2.43.0

