Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011018.outbound.protection.outlook.com [40.107.74.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 978A918D65E
	for <linux-sound@vger.kernel.org>; Wed, 12 Feb 2025 02:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739327082; cv=fail; b=LWGIuj8mBUszWAxMIING/0E7dGy1+eIu9QtZtEaf7PZg1axgAZEC0KZVZDlDiWMVjIy3D4had7A4C7hUL3vS+nOE6ssvplgsRSUIFkQZqtFrfZ66eiVeEODhofhGooyyrE5Pl3qpSto2diFOpQGEGtCYtUFPq4yHMLtuYTZ0uJw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739327082; c=relaxed/simple;
	bh=k+70X7yds8zDLOaPHVXQouDxAAFu4H6f2eyfUzB5JmM=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=VZaawJ8Bx8f9KLyQo3bXemalLf902Z5eR+/giUz+BD5pcHi7O0ZzYxoYgGTIYfZWQ0KTSNtJaxf6wlhSgpIt5RWQfsyWHg7b3dbQ2/OFdx9XQTnN6K6XDMAu/QLQ3F+lRMNCEKbrtQ+hbQHFEy8TNqspHFTnrbfhwB7kn8MWrFA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=V0YhNZGL; arc=fail smtp.client-ip=40.107.74.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="V0YhNZGL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qvRohd86mD3wFtmrW0COtiabtNrZcGBQrX9YvkR9fLsvipU+AxbceCz+61yX3h9ZRD3oKTewDZ5p7DZ2Je+hTSUXyzcHNRoF8yW2qtT5jSU6KB0iBRFIv8RAoNgO21+cNrREiFlonQsFpEgqSdH9U4393db9/rRy4RpNFe3Fcvlgf+k10HIkAT4nnhg7yV0tvPD8B1YvEQcdxEa+H9dnb9Q0YBs93+CbI06etvVLOJuXlFc4xrd7jnPuSzrX1IjhmGMuP9pxYLaoOWtpHL4bnfFkLYwK55D36I/wB3NgX5XHoxtU+VlHtGRrxEk+B3dCNQ03V+JDhnf+N95CTj6NNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XD0zNVuhUfC51U9njh3W48xP+2xH1/UnpDGfCRr7EuA=;
 b=IqjcFtCD4A4MMTXypHCLpOvkh9s4QbJw45bv9tadpyTDhOdSI3MIJEBCtTxvSOE+6jWlHDHw3tHfbWZD3bqIXqdnT6RAkeesMDV8Frk2QHqszpG2TqJzi3m+R2vjizcYuYhcOIcHkcwCC4qgmXrm9a7tSEacLPy13xPYwdZPbDG1jr0g9Lg6qmaaYxh1rxm2e0Ie2Sq3/V+oC4gnSeyzwjGGtYd28RVTXnaFieUMCmSJ1l645T8pu7044aLQmXgP9jtZoHTnYs9oZGwiYqkFDs16B/2DHpRUeSDzhSSJ6WXXYqGUEnW23W7U+PK0RI8znsKBUZhk+310lhDBFFrGIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XD0zNVuhUfC51U9njh3W48xP+2xH1/UnpDGfCRr7EuA=;
 b=V0YhNZGLgqybwqxxz7dpvWcevwpef0ILxPn1uyMdyBlPA4emdgX9JFF86HqebZyyWKIvkX731ffVJfYwOEROl1QwyotEScUZBHA0wkE3QCUp4AGVVEEaQ5LNKEl9+c5hQIs030F6wzfxJOwGE9RnUa5j3DI6lEZymiHIR53zXLY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY7PR01MB13706.jpnprd01.prod.outlook.com
 (2603:1096:405:1ed::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.11; Wed, 12 Feb
 2025 02:24:38 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8422.015; Wed, 12 Feb 2025
 02:24:38 +0000
Message-ID: <87o6z7yk61.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 07/12] ASoC: soc-dai: check return value at snd_soc_dai_set_tdm_slot()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87y0ybyk8p.wl-kuninori.morimoto.gx@renesas.com>
References: <87y0ybyk8p.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 12 Feb 2025 02:24:38 +0000
X-ClientProxiedBy: TY2PR0101CA0012.apcprd01.prod.exchangelabs.com
 (2603:1096:404:92::24) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY7PR01MB13706:EE_
X-MS-Office365-Filtering-Correlation-Id: 94c4f845-88a0-46d7-5ce5-08dd4b0c6671
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Xn0/zdkmqZ20j1qc2s3cfunnTHYuUXLX8rCrAfJ0ZVowcA1+yTkcCEZL1RDU?=
 =?us-ascii?Q?f3mOFsa/j1we9BnerQ64RQLUrcRR2ULU5hPa6Ow9qNLYfvv+F5whkoC5AG33?=
 =?us-ascii?Q?5t5pAwAJB2l937Ep6SJFKCRZwJnYkHt+VtLq69yNV2JLNl1e95wH9ynrf0FZ?=
 =?us-ascii?Q?+6Uawmvbp4rAd4GnUGvKfHWCuqWYmePFd7nGCBc67JbnX3Y9oDvCtIAnxec9?=
 =?us-ascii?Q?JsWDy8TCx7Yz0yTtUpoNjSte0oi5KXjPGnMFpTWKyVT5sStRIlZybPkBfA3i?=
 =?us-ascii?Q?Ya2Gvfs6byG5LM+Br/wUjJU0brWEWfWkwPvV20Dv2P2ePdWeS6RfZPuLbV8j?=
 =?us-ascii?Q?DK8Xwli+/d+CAcrf1Ek9rmrbKINC3HMtsqTGx7w4I6LIm3PaVARgghk2z1N+?=
 =?us-ascii?Q?6f6TZzZClDvz4TjhZWOjzRyC8hqIy8Sx1/pOldGbLRjjSicVs1HSJMzy6Uoq?=
 =?us-ascii?Q?ECT8KaPDwQkivij4kLXQw5Zj/3YVnWkgAcGPXVe2Av9Oie13aDxHERrMAURE?=
 =?us-ascii?Q?hzDiVbzmwEc8Z5/aFzYd+pUst9YwBbdN00AfgwTuCWOt97ApRaJ8Ne/Km4LX?=
 =?us-ascii?Q?gGvejGR8RMG+f3h2eUL2NQbg83ClvhQ38XQewmxAqazHg62PwIMjMqe2iA7e?=
 =?us-ascii?Q?SVs2QyemZS4FsRZgq4D4aaPVNCygTrlTpG3myyc8kSybBefg/JfhZiCD1a74?=
 =?us-ascii?Q?sgoskEAOzVxBPxQy61qoOGKr5UxIzaXgtPNwHW46N8Gg5YE0N27cF1sZPDxl?=
 =?us-ascii?Q?9j+KYF08LmPpoUBkzZ2nsnrqHEoObSlKzsHvCq6ecARDjoXQzMyVSpK6K7mY?=
 =?us-ascii?Q?1umhf6O6EbZJCccrHt+Ri6jhxHLoPjdQuxExDZDr5UcfNtLQxtMgDdk/yXnA?=
 =?us-ascii?Q?JpK/kuM1/FXDmxbiV0lIxrdUWeEbq6JRiR9F5hGmvSA68DF1HqHRYfFvgwnv?=
 =?us-ascii?Q?2rf+U1CJBhC/lcakH+U3l1riWBDZpOfdosCBW4r5opz1OBXYG7WSoBCCoE82?=
 =?us-ascii?Q?pwz40EioQ7gZGUo8dB1CjMbr32+R83FprWIG9zZkMj4OcIoeE9U9X4Q+4Au/?=
 =?us-ascii?Q?PGAGJ6JS0MAsScshVKeybbsGzmt8Xe/mZ+8INi+XzTiLj2xRoUJJ2NanRJo2?=
 =?us-ascii?Q?ZIWHt6NhFssj6v3PuQpZbG1Btbt1AqS8E92CmwgwJ3sQzIUmxBWkETZ12+nY?=
 =?us-ascii?Q?ub9ha1EQPbHg1hqLc1kyNax/ylNmu7y85lSPL2qXXMQ7DiYAx4GY2QEUQglk?=
 =?us-ascii?Q?CrAAfIlTPge5GG/eFUDN/OKURzejWWytiVJMuNwqwcPmLuDVVN6uAzYblo0i?=
 =?us-ascii?Q?u2z+Vkx0x1YcOvReiePl/M82ILRY0mcLwUAL3v0mctfFxXWKCE/NImzRIF5n?=
 =?us-ascii?Q?GhkE+bCGAgZZuJ65cNKpfk+t38jR+Js/om6f6yOiO6f+tidySA+2feFXsklq?=
 =?us-ascii?Q?6zhKAuJSVFVdl2jze6A9mSP82rSo0dHH?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RE5rhLXISM2uD5esYzkjWSSWTbPaLzEhC27nrnrQelH4ZRWMoL3/YC0qvCvR?=
 =?us-ascii?Q?jwwd8O5cxIUVft1U66eBXyn1N2Ytg0sDlM8IPJ8ZxL9mt1fwvFsMqrY9zs9x?=
 =?us-ascii?Q?qr94Lxsu3EeQOV/+pQJntbg6vrOq85eZ8EVT3osS+AF44SBF3wIHuIV1y42H?=
 =?us-ascii?Q?gDoFDX3GPDlK+Y4UNfyrIHhi/Ra38fRuNeDCeEgJSROorT/Ps8n39EPikKM9?=
 =?us-ascii?Q?rnMtBmhUH7BUHOjp0RGSbzxCxO7Wf31S8OBxJuyyKRK3HQetKTrLlJZfZPrF?=
 =?us-ascii?Q?nZrjwcL3BB+c1M1kZG8F+49pvQZkJzmfr7TWRaiXSM30tjFY8zXmt7vcabZY?=
 =?us-ascii?Q?FkKX5HOI6MQmEDXXQ1s1e1yJOMQidQWiKPh5Sofp4egFmV0obJ2qhZiEpSZ9?=
 =?us-ascii?Q?e272v5jelwUTB7TUSqnn/O1cX/TetluCBkVZcFhgspQgFXIfmJmMaPMyZQZk?=
 =?us-ascii?Q?PaJ9QERwOwi3R7YRqvBIeT7oXX+qMYJ01g35hySnY0i+QfHOQbIbY8V2mm1x?=
 =?us-ascii?Q?KFOFMp/w67p+2Op0kT3rdP9MuDk5cypTDCbJfvik1/r0P/TwYE7mgjh0QFzS?=
 =?us-ascii?Q?YNY4yttYk0XfFaVJCH48Y1SkPA+yHS1Ihry8kCuXJySiugc/mxsvnuwFui7A?=
 =?us-ascii?Q?TFQJpZigOSD/A1VablmeCGZVpLsIR0YB87L0RkN9O53bi104OkkM6JF77k4R?=
 =?us-ascii?Q?LRgeiSkysvex6iL5CgsNLzc+7wK0mESgCciAyl9ODRMEb/Zg75dK3zcrTfND?=
 =?us-ascii?Q?tIk3NScQNFUy3R4QOKqIHQrgHNKKzkh0VaimAOr6E+BHXTMgqo2Nhg817wC9?=
 =?us-ascii?Q?fBJ1Kos1NF0C24eXpM5Q7ckchfMDh/DOpgj92O9NijNEwFtKGen0mJS9wRi+?=
 =?us-ascii?Q?HL14OmsoWKA0tNPlS8YRaW2zLuxJi49R9J0DtAup4SAwOKQSHwjBKDVqva/x?=
 =?us-ascii?Q?e6h+w95vuGZibSVVYeNEiZinjK7O9GJHGV9O+irmjpmQaL17I+FdcERyLodJ?=
 =?us-ascii?Q?u/AVGBWY5YN5qenP2zL2W6+i6KP/I3LIS8jt+a0LieWBZWwjCd1rfCa8bU99?=
 =?us-ascii?Q?I2olZF156acqVi6fZsiYfoYYYnrjuum+eP4t7rfplA8uvHYlC0ikYe3OoPZJ?=
 =?us-ascii?Q?FUTafMNGFNFTnjJuhYZSHigSuHj26+tn0wBu+/haHZSmXWeDr+/EFxU5/5H8?=
 =?us-ascii?Q?5H0rdwpA0e0tolHAwLK0/WeFQH10+JBVq6D5MhvY8TkH6+peCqbQmovxy3Jn?=
 =?us-ascii?Q?6PHTz1wEh3l92biuw6zBRrvCQk/E2PZ4AtXvRlu4UNkTHb4I6OuC5QSXJt6c?=
 =?us-ascii?Q?hYvcGbHeWIG/YT9d9I+HmmaMXn3j7R1CNIoNYB9dX/8d16OvY6q3wt+8E/j+?=
 =?us-ascii?Q?uBjDGGCD/R928QQKnhDnIftLEaUPSwdbzBFP3cAHeJFO3LPp1yCndcBxpoYL?=
 =?us-ascii?Q?XHtjPhzBUTKLDPafHKf9ezir/EobvYstL5INuwl3HjTkAphj3AtaD8wlkTCs?=
 =?us-ascii?Q?2mQco2p9x75M7hwPC6RWC9pBpzD6c+SxDXiwFAiA6sDEIa/9sIKikDgFU83z?=
 =?us-ascii?Q?89bTv3Y511R/yGyMcYQyxCASN7fTSkdhkk34aVNYr9ChRd0/sAah5LSIJTvy?=
 =?us-ascii?Q?nIz9ZIpJQUVQBDqAc1LSad8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94c4f845-88a0-46d7-5ce5-08dd4b0c6671
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2025 02:24:38.7869
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hwzJmUPA8B4ESYkefJeZAUK2qvUi2PQyXj8DSoThgSIqhfd8CuEpAqt8PzI+h+r8CS2W6+4Ke/r1ISOHK/tbhpQ9ZwPJ0Etk4P7eki/9r9frQCM95ciIJjbamEu9f2gq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB13706

snd_soc_dai_set_tdm_slot() calls .xlate_tdm_slot_mask() or
snd_soc_xlate_tdm_slot_mask(), but didn't check its return value.
Let's check it.

This patch might break existing driver. In such case, let's makes
each func to void instead of int.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-dai.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index 7c4c9127e5f3f..8f2b5b840bb08 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -261,10 +261,11 @@ int snd_soc_dai_set_tdm_slot(struct snd_soc_dai *dai,
 
 	if (dai->driver->ops &&
 	    dai->driver->ops->xlate_tdm_slot_mask)
-		dai->driver->ops->xlate_tdm_slot_mask(slots,
-						      &tx_mask, &rx_mask);
+		ret = dai->driver->ops->xlate_tdm_slot_mask(slots, &tx_mask, &rx_mask);
 	else
-		snd_soc_xlate_tdm_slot_mask(slots, &tx_mask, &rx_mask);
+		ret = snd_soc_xlate_tdm_slot_mask(slots, &tx_mask, &rx_mask);
+	if (ret)
+		goto err;
 
 	for_each_pcm_streams(stream)
 		snd_soc_dai_tdm_mask_set(dai, stream, *tdm_mask[stream]);
@@ -273,6 +274,7 @@ int snd_soc_dai_set_tdm_slot(struct snd_soc_dai *dai,
 	    dai->driver->ops->set_tdm_slot)
 		ret = dai->driver->ops->set_tdm_slot(dai, tx_mask, rx_mask,
 						      slots, slot_width);
+err:
 	return soc_dai_ret(dai, ret);
 }
 EXPORT_SYMBOL_GPL(snd_soc_dai_set_tdm_slot);
-- 
2.43.0

