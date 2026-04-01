Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010027.outbound.protection.outlook.com [52.101.69.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484283D7D8B;
	Wed,  1 Apr 2026 09:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775036475; cv=fail; b=NOY4CkXpgecWs86O0AcD5JuAByNqSbkEOHk5rlOBjMR/OFdx/wlwJOgt8xSIXBp/uWAQbPHWxBzAJofUT3DxnpXGvPw7KyDW97cEFJZDC3YlzoXw0JXLX3pryrzCAusra1xeNzV31GSh115vVUOj18YJcGEve0NPeStp9u4HR88=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775036475; c=relaxed/simple;
	bh=0WOC96N4xvo6manO/Shd2Ycy3favvBt32Q3LwDDJ7qo=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=toL3AJYoIbrniat9a+mZauhRT1VZHkv2sQ7t0ZPKbm6+C+1KNl/kpdMWYHi8tO3xbqrJeKrmoV0E7gplLPAuM48tObM7m4cljQbc606TdhB9i6gPamjpg1p5T7fYOfPwZYJWPoTwyhkReER4O5kZQxbgRMUMRLzc8JGTnqOd7Fk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=eV6t/IdF; arc=fail smtp.client-ip=52.101.69.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="eV6t/IdF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WIawdC2n8T04AHtrc0FkWh51ZL8Of8fgLHPf0m/BJcT9qMUgV2jAjrkp4cig7+9ebKwVhEMRpCZCnnwyHsw15YZ+rW+we0QNw33mFfkKi9qryzXPh7YGsL3K+eG+ZrqAS1TrFUh0CYSblkbLfHErH40hh6YKeTpoYgFr78ggu4pmJJ6BO53yzkEVXziDWJU8kS/cArx6HatMOWRTBZsI5Tdmc9A+MYZaW97FNocjtcmUQQ/fEsXiR42HYTXvLHrHOu/TojOfhlL/XsTQEuj74P6ZufTRlUKe4qFifR+54h+OuPJtqgtNXZOpQio8ssDK5ab86V5HxQRZ65oRCePFyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VlIrpXKqus6x43WSMgpfF/1iWwelY/PhqPKK3iQxXAY=;
 b=M6J1sMy8sPzwxXcstGfIpyExiGTFUgRhlAI0bBtDkDXC7MLmhizfgYKI521aOPSIgXLpMJCjH4LcUcFdFvYqlVLfu7cDELVYMeKcWifHCuBzVa6toTMed5N4oXRKUCm7zBI/gXfdQE7HZ69izbJl8oV6JhV5bBlsKkGHT5lP3NavipzaOALiWIXMv6/jWFe42KOTGkCM3U8aOGeVGhvzx79K4ahfmeVTG0SH6UOK2bDk5pQf6ANkBKaQ2WrGDz1deyYqIKMizEJSqJSeH2lc3v4HrJAnMZF0B1M+TwKy7+vMGCVTtQGd0JFmNyeMQvbszH7k6hoTQ4AzYX49IZSJ0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VlIrpXKqus6x43WSMgpfF/1iWwelY/PhqPKK3iQxXAY=;
 b=eV6t/IdFT7t1bmDGgsD4qA/vHZzAPExVlW11ZGPAt9WkUXRYVLZ9wtAvWjSeX5rD6s69nrB3Za1pdJBqbrzxpu/CWGE/nqUhdeLMJkLHRl7+uCKul3oF/Qq3WgBkaFPBEjrfLvo7y0wFW1WvqVJ/8Trpvs1krR/ZU/CFEPdsn66baHzPCUg2Q5+fZyjgqFji29SO6GDONOmFSUokQ16gMP2/3cTOpLa5vkfOPrEbj5slfA7FxP0QTsJ3ikzqfMddZ3d9dnLDS+QXP2x7AdEdZEXQq/h8kYVY192yzfHGYo0K2YJ3Ly0bny4WO6i+37m0l1xYx92GpgjQE/NOkDp74A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by AM9PR04MB8241.eurprd04.prod.outlook.com (2603:10a6:20b:3e4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Wed, 1 Apr
 2026 09:41:08 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b%4]) with mapi id 15.20.9769.016; Wed, 1 Apr 2026
 09:41:08 +0000
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
Subject: [PATCH v2 02/11] ASoC: fsl_micfil: Fix event generation in hwvad_put_enable()
Date: Wed,  1 Apr 2026 17:42:17 +0800
Message-Id: <20260401094226.2900532-3-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260401094226.2900532-1-shengjiu.wang@nxp.com>
References: <20260401094226.2900532-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0029.apcprd02.prod.outlook.com
 (2603:1096:4:195::6) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|AM9PR04MB8241:EE_
X-MS-Office365-Filtering-Correlation-Id: 73a65833-bd03-43c5-5e46-08de8fd2cd04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|19092799006|366016|1800799024|18002099003|56012099003|22082099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	Mg7EPh+TzEYtzL5dFgfn2zAM0hX7wLffmzZ6MkPbP1OaH1znYRcfmLJmCRpSr7CrpX98E8oNCdsqqagXY3xtRDVcA0J8bTiwIeEZZNp0TrBaHE8LkOS0oF8urRju64YAvDT4GhIl913ImgAsZLlVhxqwGKYkcyHz1Cg6P+hXkKcLH8qjPrWyxwID7vIydvOVLUPoiKLWgRC2qB7KAL+f9bo5HllWX1mhovyfR32/4QMuUbxwPaINEZq5ig2FgHuNfZ0BgMvxcBjN3EBXKA6GI5I6/LDKWSLzaj/s9PKzmZgMrwLV/DQaDohduNhfoE/08nlzSo2FHNmXAHwl9rJJvWuPs4jkqwB/V5m9v9ZUlK58fMxkkG4atIZ0OLsKsV10nRcd3TNwvfGfv0enjkPL7mjRgVdmJgTsY/pTPtcOIrTDL+pPRFMQ6qn7GCEFP6/p8ElCUN0T7h+mA6GkI41A+G0xy8+7ppzxqs5BUi/x3S5s0hoL3MQ7MirfbIuszioEhSpxNZn5VUSvW8cIau8AYr5jH0D+czTofdMGSnlmYVODIm5GO9wviym2j/6eEqNi+Q8A5vlp0jPGZt2qDfce1QwUE5C6Tx223vjIBDU5ZakAMzvIQRzBMvx1rzrPTjK4TCLyKvXjNyE9bVYrFBvbaIcZaKRzlhiyIj0WVoJAFYRzHdRdiVwXbYuMgQyKxtzCzZHpXKkb8Lv8LECnC2ezSMre0foYkTnuyKkigCBg7Wn+0mUgm+57FayopSkZRJna6sSzZWbSZ+2I3Ys6RNjAaRBXJvxXeOWAWSDorCYrvhJ2P3jQkJL73iyVEvoiV4LW
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(19092799006)(366016)(1800799024)(18002099003)(56012099003)(22082099003)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rqgCw80I8e+t72UIU+vjRG+c8qpCBVE/fx/YD0LsfItlJZAotG3PVdvtHDJ8?=
 =?us-ascii?Q?0QA8qOD9YurZ4FkZbqmdCfFMw5pRXoQx9yeT0UZu3v48ualWoTlsLvo6KkiS?=
 =?us-ascii?Q?8MISycKTtjWcYUmijN3u6rDHNaB7xu0YgP0DPqz100DTkkfYUZfaLdmb5ehh?=
 =?us-ascii?Q?Xvnhwq1jMj1/ui0R0N5LOA2tYuhcmGUPIXiZQtRy0HIbUuJrMJ3pYkf83M4i?=
 =?us-ascii?Q?3IOb8pBZBFGa8h6hDDXjnYKuiKf8LWDjLWdzKjyY6AK+pzPflhO0ubvjNM9m?=
 =?us-ascii?Q?4uFbl10u2GQth6kLHKJtVFz75aHERvzlGgJpQFZqN3JjWHD91E2Fd/awcrwC?=
 =?us-ascii?Q?LiZoH89eRjFDg/uA4HcDgT2lvuNpMymRTTOw22nmVjhh26RJy2a8zy/xF2LD?=
 =?us-ascii?Q?CebsgRfmOiFwEeFj8pMUSJ9fvZoz9CVKyNDJk8ydlrcVjCVgqtcTht0PLPRo?=
 =?us-ascii?Q?USPGjrsyWaSmHnePZhKHPIiM3+7qafToBM8dzUDAmjK5asumSP1woEl7qqKB?=
 =?us-ascii?Q?h6ZsLwC2qU0913YWtybe4ayzkqdrvY95YOo60GXoSLjAjR4GZ6tdmvYMbKrd?=
 =?us-ascii?Q?6nFqNu701TUq9p+thcqh8RhlI9xHvnvdVGTA801RnPivYB9RqbuDu6HwPADY?=
 =?us-ascii?Q?BRMejLzPHR7c0g/mY2ab1V6kNHr6Fw7fGKE+X8/V4RaTuGYeTO1R0LrkDWBE?=
 =?us-ascii?Q?VORFk9lS7e40lcSeTLuKf15kzZohJzr6H1OQ1Vaxm0Y4qPgVJxc32rWHsbYK?=
 =?us-ascii?Q?OLiDxRXcgdLUPXRgoFpYNKrjMjPjJ6PS+wmmPYiyQ3EqVUC7ZhjjM9LW8cBU?=
 =?us-ascii?Q?j1NxkSdROsxNC6fDgoLkV3Pvs8XD1PxtGG1PzLnm/+qsLqIliYrvaCmkIU3x?=
 =?us-ascii?Q?6xBxQobxRDnXADfhwxid18GswtamKrVPILLq84xzuk5QIXVfeDMs49+L0ySC?=
 =?us-ascii?Q?PVlazvbOrnePyv6zPzMpqJxlAORFU9IFG1k2nY/yVBHgkjuIEmGWFb0Hg4JL?=
 =?us-ascii?Q?7bw/LjhwpLvdthg0zZ+KM3Dx3GIgNvTLauV89flYLT+GRu3nkY3FS7RaYf+W?=
 =?us-ascii?Q?1JyROgyytXjqK1kycrZehPUFXHO7zkqS6tC+v+QzfoREdYgLUs2ZtKHSoQ0B?=
 =?us-ascii?Q?i+3Bz9e16vDc+gkzyGhoEEvXTyCyU7z1RohXmedIuke8qFplud3+8SkaYwDy?=
 =?us-ascii?Q?ElnVXbMG67c+ur0P4Hs61Mi6E2GRIGL0oAPHTHlB8np1kqLRu3ZI7/AWjfgz?=
 =?us-ascii?Q?4fB8PnUt4oqObtKHZsZ/U6s8GJn4dQ77lvJwIzHenir2bJZpIJU+NvvtRGHo?=
 =?us-ascii?Q?IrjNpjDEfAxD+5rrv1yNozp8qw7j2tjE7jKk68TRYWYF1M1LkLokffYy7LgX?=
 =?us-ascii?Q?Okp+2TH3j1wbWnMMyVJuuPU+GWs3C2EafcN4vKIkc4x8hChmH/z0V9hQ1lXn?=
 =?us-ascii?Q?k7wnuzg/hZomCvNfJ3pH8lP2MqzZVpsL3I+ak9+iQ2EenBRr58XRA7+3Bv6T?=
 =?us-ascii?Q?eJwe2YyYDSgqZRuAhfpnpJPjgBdZiF9QISem4J46VOzuUpdJfYAsfOT8nTmY?=
 =?us-ascii?Q?1qZJXIvFeEgwzUEPiseh39KrxjFq3xJmgmHJq6y3N1W70fRr9Fw5i4pfUvZ+?=
 =?us-ascii?Q?yl+FTPcTIuyRl/2H0X4aqiSMA9MhRE+iPkh6tpvLmNTgttkyW9UBClECVwi3?=
 =?us-ascii?Q?hgcE1zMaSFmkSM1sCZNNXdsflqVgAzXqW+WStnVL9aamuQzx/sJ4KawG0cHD?=
 =?us-ascii?Q?OUfZjDPbzQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73a65833-bd03-43c5-5e46-08de8fd2cd04
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 09:41:08.2152
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rB+RFVVVpAVsT/LK215ShEz0wtTym6sMp72zWMC0vblj3ZGa76f82HIxKWe/v5hj3nMyqdzI6ux7woWOdk3NSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8241

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

