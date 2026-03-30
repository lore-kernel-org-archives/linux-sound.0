Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013027.outbound.protection.outlook.com [52.101.72.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D73638642B;
	Mon, 30 Mar 2026 11:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774869880; cv=fail; b=kFafAkWq02yJGQTDBMd8le52OCI2EDkwp3UNJJaUovS5oklWpABlm2AR6PfhO+lyVqhpem7d0+ls2bQtvvzX6W8T+CqbjVGXxkAU74WkD30Pmw6kDeSMJ8qfx+cZZfBlGNOphGWJzXuBdmr6FhOYEQCUEzfh9Y4vGHbHC/hqMcg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774869880; c=relaxed/simple;
	bh=0WOC96N4xvo6manO/Shd2Ycy3favvBt32Q3LwDDJ7qo=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=c+M+05JQjhom1YdlvKz1tJzDJ0sM9CiuwxTODnehW+QLxkxdV+R2NlV5AWn635SeGPQn0BaGGR5gEEN5+V20O15IuPgFDMBknprR/0crJrg/LD2BhOxYASf3SsqfXUzKrEvR/doPp//F/SPisJIdjPL43lYTZovZd9/YgLd0l90=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=b49c5k0y; arc=fail smtp.client-ip=52.101.72.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="b49c5k0y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tl3CIzrJlrVw/2V7RTu90EeqyU4I6yDoxdaym1oLF854/GJXqe7j2tR7l6NbCh6cq3bENibLAQ0DzT31RHAwXVoBiZnFW9RLElVNPbg90ZyZLRnOjE9zjw0REXDVxUdYukwgUAemk9NanbSxS7+fIwNbNlL/Ftkn5AyyybbghzIdafOiN8yo9IJTKt8sBxbNW+JxZvdLabkoCpsYb8fQM+MX3i3t/JaVhHsJ2D5/CyEvAsBYldniuO+Xx1Fn1g8vLm0nsGZ1wYNYLGnoxWpKob6g5qMoNrB84+DuxHs0c6Gg59w2OVTAF/MzT2HmGcpyPhWhRRtKjzIHROU79Qbk5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VlIrpXKqus6x43WSMgpfF/1iWwelY/PhqPKK3iQxXAY=;
 b=k4hWFgM2CZYQ9nOaeod2TxgaR1hdrgqy8DIHL5GuhA9uUQPxRZ6nhhT2Si5U8/t895yn4O5ZBsGf7wGt39BlvwhLM7vNzAuZoSt51JVCQXBUeAUKauzo0FmhHlsWE9gzqB2a6IwI10y64RlaZqNRp+CNxrXiwXxyWLFoRs2OJwjxK0awhBtTDFWneaDQDiNUF17apoxHqNBMbYl0N70WacxGmqv66lQoNQ2XzQy5SbPOtL41tbrHb48UE0AEr1ElGblWHBX4B5fpDR69Cg/zMBX54FK4ibZXVfUnzZDwKXnqv0SZTohd+DTX/n+DpfCTdD8MoxUUxo/DJzou1eQo1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VlIrpXKqus6x43WSMgpfF/1iWwelY/PhqPKK3iQxXAY=;
 b=b49c5k0y+Htk5wMqeqtCoEqGgWM6FwO7T2YQ7Sqac1s3pJUABBkd7nxkCZkLs/xeI75D/g0L/CTQAa9eA/OJgzVKuJgGaAtKDI1z/AI/P99BLLJ8+H91roFETOzQEZGSyz0VGDd7N/+gGS7jT4Nhjr7cJbEWPau+7W9oLD4zAvhLld8yk2vY0iklqCNfqqyHoQka9EWJAqB638ioqQveQThSvu1UEhQ8yZBJMdVaEPx+stTnDYKEKah/PAFFnzdMLfINk+kCJNL8mKeIU7BLparcSIGMZx6fJgQuG4BpnPhUX44pUbK5zXcicEHXG/Dsiy57fddf9rq5Rob8jHvxeA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by PA1PR04MB11036.eurprd04.prod.outlook.com (2603:10a6:102:48b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Mon, 30 Mar
 2026 11:24:37 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b%4]) with mapi id 15.20.9745.027; Mon, 30 Mar 2026
 11:24:37 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 02/11] ASoC: fsl_micfil: Fix event generation in hwvad_put_enable()
Date: Mon, 30 Mar 2026 19:25:46 +0800
Message-Id: <20260330112555.3637002-3-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260330112555.3637002-1-shengjiu.wang@nxp.com>
References: <20260330112555.3637002-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0009.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::10) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|PA1PR04MB11036:EE_
X-MS-Office365-Filtering-Correlation-Id: 97194c6d-1742-4ff5-b642-08de8e4eeceb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|7416014|52116014|376014|366016|56012099003|22082099003|18002099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	p8lgbOa14TNxeoF30VfrN9w4x/JScA/hZazFHAWIdozgH+AlQve0ZmAxnVu/s5HxhvKzNCHAP0PdMzYaysag4ND2gYMRf3tYy3OdMUMP+gQ9ksKHhL0QC8UQGug0qLl4KgsM0t/RvM5p/L9T1uu8UZpz34xsoEgP9u9NBZ6q2c8AGPTElPLma9GW1KlVIZ+AC/eX5o7QpGNjmbN+UHaG662TWQsdlxSgcmvFoGMle6uo+O40NrgRFJv67j7tYJNl/SVoLbEWsDjxTUki6/1cRskQrbwpTV1ZW8tOd6tcWqf6ci5sg/WseHQG5Vgt8kpJxn/PtpytMFaY4k9nrtxZydIuDawnd3XoV0vH8C6LI6PLPzrYzTe5eKSHpb/tApUfjoj71qQ2qzH5j8haPICynDbVQgysSBgpodIdnSu13a9eax/VdbuqGJP7bZ81ib52z3x1PotJGXSZr7pOJIOtzVUXN2YERiweGX2N/ASRL/dK7esgfkZVbmhDEpy5/gDakRRxJ9eoMWj+fu8iWYGH7okzl8snfatU0WF03JtkKWyXsddhuIAdfEhUI6VddQXws9zv07dDm8/yZn7eUSIQGhuM9dsRSH3ZGBeEvfk5jUS1RHLwspvB9kxbGtauEl0Daw2Bb0Le7Bcdfcz6lwOKgwy5epKw5EiEYXNxbnO3vTmlP75tFQHwM4O0XXRb+4Bqbnw0PQGutC1PvRjYCaxqSNFZyqgh9MTWe5KO+byhfm3eBMAvoLugfP584kAW1RX6/GYLDnWwNT1BGn1MKdVqPgNfyBC70rCw0xmyCRAV0j4rH/3IZ4eXXA9E5IHhOs9h
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(7416014)(52116014)(376014)(366016)(56012099003)(22082099003)(18002099003)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rnNBVWT2IW9s9zzsn69xe8C70ENdKnNYwZ89F+tzbqZ8B31eNmLBUG5KWtuJ?=
 =?us-ascii?Q?m6P9yMRXONhv/kchPt1A1ZZzQ0ws++Lt10hYYPX67rduhtIj147Gas2Jg3Uz?=
 =?us-ascii?Q?K7srCPRrtv/KULCqMoXk5q2qkEJ4XfQ/4mfeqVEpz9zbTBMRxYbE9e+37E32?=
 =?us-ascii?Q?OLf2sYP6Y6qGcWEqSnd58KoTXoRepce2V5mZaaYHwDykq1kDR1els+TCmIzt?=
 =?us-ascii?Q?35deN8suEF0wJgwvOI9R+3pesELCVhP3lp+kHGl4v4gBcvJKN1VhxOB6bvhj?=
 =?us-ascii?Q?4DmOt4B2XLsRJlXuIvo+rMbpFIgW5+JEoKU5ZimtPtvwkduhGRtQoVNqbNZ0?=
 =?us-ascii?Q?7Eth9t4HXDVfy9e3xPGbD/KdZj+GT94sQxi9UsoLTEcaOrHo/048+t57YdU4?=
 =?us-ascii?Q?DDJrBOAgozj94UasD1OaAzGUuC/iYGILWWVJhvT3tgqRUSRgbBaoAZAMCB8j?=
 =?us-ascii?Q?jDbwGlEz/e0r0gkvwhLSX39EUfjzo+cdeiAKrdG6zPI5mwIArLEPKulzN09X?=
 =?us-ascii?Q?z2jROgdeVSkk7P/CcpG7jUoh57A106JdRl3SZtoVJP0Lw2awNguJ0rZtgARu?=
 =?us-ascii?Q?JAPImxTa4H62e4Np6frByQHIK79+nFQcWJ0hG3Ci3LPcJgPXaMLJ7XKlaRJu?=
 =?us-ascii?Q?AfGrWoJ4Jz0gkjL+waU5jfRA7Tq7yQ8Bd2+5k8NBjU3+rttQs3k/2TDHUmEk?=
 =?us-ascii?Q?R9SkZqM31wGXDh5sx+WBXiivrgrxDKifeUyoan9X8Ep3Ub55cu/MdgXBqKdM?=
 =?us-ascii?Q?LCd5nlCsXJyQRTcIxTxJ8c8VhVcS3N4SoOghfWjWde06jp3WwmFhbt4/HdLe?=
 =?us-ascii?Q?J8gvHMgtAh0OO42DU5HZ5lLu8IARqdP0F+HNe1CHDaMowf/IRbwgl4tLx1Em?=
 =?us-ascii?Q?3DLENx2xcchwgtY21X3Mh2Tg1wLYj0VvtaoevZUEca0OP/aAjjf7ccCNtdeN?=
 =?us-ascii?Q?722W90fp2SIv3COxeQ9kUuKun5Zv06RtcAHtzIxWIv+OdNXGjB7fKpUib2AO?=
 =?us-ascii?Q?yZV4SZ10pFgY/W4E5I1atL+GROU+E4e5JzFqehcj9oGAoxJC6RaoPgjEJDqw?=
 =?us-ascii?Q?Nls64lMJsBpogMdx6eYAhAu3bN1YIQBJ4hlm1+7FEiuQ70NBhZm5FmFmTUwG?=
 =?us-ascii?Q?ZMBbWUmGkUvPyJQzpTKJOx3pbwUB8Z3CbbsOo8Zg/3kA6EZQQFQso54l4OY5?=
 =?us-ascii?Q?Jkg6hvsUXXrEazH5NHN7opnrbqf+6TZzi1UkjWDzIKtqTFhg/Z0pTDce8s5n?=
 =?us-ascii?Q?oQzJ9FQnc2wb0Mst9+jedLPEQZEFxw4NwB8rykPZmP5t/H9PAM96SFt5tMqx?=
 =?us-ascii?Q?5Od5Tll5TSycTP9OPsyYwijwKMKoCtcZANucDmc7N5a3QuYocdjgOHm8xewt?=
 =?us-ascii?Q?ucYB9j4V+RAFLdsMM2aQkYb2SDKqhEH6AiyGJufTFMgMY7qfVKJ9L0YogaNz?=
 =?us-ascii?Q?/tq+RPKU9vgxElmeQ4lYjW1vpYjlDcdcoobrd6aCXzpDLKPEdAqafALho0Fb?=
 =?us-ascii?Q?JM1zhfOu6adotA82SCWixrw7Rg532gRbAeNsGKut/pAjvjzQXaDmxCJgKnQ/?=
 =?us-ascii?Q?q/dMFmSFY1EUdBhRqg0Rk4uSrUuC6rlYYFBBgmluiJnF7exAor4tpdmjNGc0?=
 =?us-ascii?Q?KaGI13vXSy6fwwKdD84CTOukHc0NzxQjz81udN/AYTFkItEkhdmUU7XNWWJJ?=
 =?us-ascii?Q?C4H9T4JaUYJqKDZQqkq8vKHJh11xpWX0ImmznfMOyrOtUgLV+sj1WnYHTmyC?=
 =?us-ascii?Q?3/szasZr9A=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97194c6d-1742-4ff5-b642-08de8e4eeceb
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 11:24:37.0959
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Zya4cKNnRQ1A40QBYpTIgBjwC1ErTCBjtuN45ciGfbf077RcXkiEmFBWUg12eiV2k8AtjuGWxiiiR5B621zag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11036

ALSA controls should return 1 if the value in the control changed but the
control put operation hwvad_put_enable() only returns 0 or a negative
error code, causing ALSA to not generate any change events.

Add a suitable check in the function before updating the vad_enabled
variable.

Fixes: 29dbfeecab85 ("ASoC: fsl_micfil: Add Hardware Voice Activity Detector support")
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_micfil.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c
index 79850211742c..97f24c9bdd68 100644
--- a/sound/soc/fsl/fsl_micfil.c
+++ b/sound/soc/fsl/fsl_micfil.c
@@ -377,10 +377,15 @@ static int hwvad_put_enable(struct snd_kcontrol *kcontrol,
 	unsigned int *item = ucontrol->value.enumerated.item;
 	struct fsl_micfil *micfil = snd_soc_component_get_drvdata(comp);
 	int val = snd_soc_enum_item_to_val(e, item[0]);
+	bool change = false;
 
+	if (val < 0 || val > 1)
+		return -EINVAL;
+
+	change = (micfil->vad_enabled != val);
 	micfil->vad_enabled = val;
 
-	return 0;
+	return change;
 }
 
 static int hwvad_get_enable(struct snd_kcontrol *kcontrol,
-- 
2.34.1

