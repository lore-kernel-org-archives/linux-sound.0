Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010068.outbound.protection.outlook.com [52.101.229.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B32DB355F53
	for <linux-sound@vger.kernel.org>; Fri, 18 Sep 2026 01:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789695650; cv=fail; b=q/FGNN4Eexs0kk3EKhGzyV+mJW0Z82oUV3xDklArPGKXRyhZbKXwLjS4EoLs/VMxpsBQSV/tEh/RaQ5PuZ9/AxMyFMLUX/GaUB3jU46nOyZNeNnEZvI0BdAGgBLQHyU/vSi6Pz6xuGau+UvSGx0Calvg/YY+mdJnGUoatfL4WJU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789695650; c=relaxed/simple;
	bh=A7SJRW4aE6zW69Z2frkhPS9tswKAjxIDaIyVi0IOZQQ=;
	h=Message-ID:From:To:Cc:Subject:Content-Type:Date:MIME-Version; b=j5ql4pC67G3/HzJl0shlLy6yTeN5SC5h7pzEV/7QYccjr/TLRZIZvbpXB664Kdmyz24YMRXKvU5ATR7jCu27jrtoepKvy4WmjOgGyHTZMxj2Q3dZqjSbs6U+cwKilLW/dktrxwDck2HrBAOkjzPkNOlbjsyjRq3iKBslefDgj10=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=e4DHy5T+; arc=fail smtp.client-ip=52.101.229.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="e4DHy5T+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pZgcr+kR+oecoPFIyTJaRC3xUH5HU49U9Z3hvdHnVc+PVEoW+zAPev54FIqnRmoiye4GkiaqSQex6DpSWFT+Hep5h4XNlSalSLySScvgwQ8mQRMsp6wVGT+i62dKBAFtHEaPhuLE8Ob/lCGnc0WgShYm3wZSjfVOhmWsjaM3KzXtljArvLk4ChRt1MfqK952gdb03zJoAJrPJYyoB0d7tq2q4U17xInhup29QMNvmG2V89BtBP5JIICRjq4ijyu6qwiWCAFnFDajqsFkwkpMvoGsWkEDjoIWR7WUnupzG6fTrsJ4xmzvH/8ZfUfMCTRYSlWWgqBkGxwbMe4J2w4feA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/X8apYG+b+1c9a6o2PmOjhtYTo7Jv4qCXFlW1qeXUzk=;
 b=g5aDvw1Rk/bitwYXvVxC5Najw/OCrT0JEq4x5zWeGrm8MoEnv9FhwA5KWdu7oLs9luluF6SEkXQgxLfU5AY4FDN5/TOxD+IwxuURjxbQSs1JcvmJCQlpZ0zNbJ6UCDtMhALFqjZsy0fHsiK/47IvRleFAaSYv5JX6oANhIugGtZup0MJDWYJbp+DWN+R8btR23Ai/0VxRUJ8zhxv4zbP3DJ0HJvy0fsOU7R3zPvv13n1kFOyvrEc3y4VpdUPn9x31IAAmgVfrytoId6y3ilmQH8xGcoob/fW1e7ZH0gagbjsvhBG5H5xKE4rzDVDwYTbQYK4m94euozNgxtS+GPO9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/X8apYG+b+1c9a6o2PmOjhtYTo7Jv4qCXFlW1qeXUzk=;
 b=e4DHy5T+HI7jkDjODAjdwtlgrLp/J5Iq1hYK2g1GK+sFdCqGOw3JRYFKuaBlG8cIuiXO60VOYzO8NJVWkimDtCpqT8Q9vNUZDYNdvxMoUqxmm8xozdWyrwah5VPmj1/AcFL4uUyKCFRS6sJNlbqVzoMDbokTG29A5o5iolAYm5g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12) by TYCPR01MB18388.jpnprd01.prod.outlook.com
 (2603:1096:405:3ee::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 01:40:45 +0000
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45]) by TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45%6]) with mapi id 15.21.0428.011; Fri, 18 Sep 2026
 01:40:45 +0000
Message-ID: <87pkybjq02.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>, Alvin Sipraga <alvin.sipraga@analog.com>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH v2 0/9] ASoC: add new DAI functions
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 18 Sep 2026 01:40:45 +0000
X-ClientProxiedBy: TYCP286CA0365.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:79::12) To TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB14118:EE_|TYCPR01MB18388:EE_
X-MS-Office365-Filtering-Correlation-Id: 5120562f-175e-4a22-2bb3-08df1525dbad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|52116014|10067099003|11063799006|6133799003|56012099006|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	jfu72JSKJ71mZ9VL+dGr+YnT1Yil18XooW95mtWfNTKV2VJ/8mPaFdGdiUTb/4Lyhk6vFDGWLi/A+59jEPSjHgJzfGf3gi6Q55ie42x1UAg1TZbg+D2ZYLvoDXxi1ATZZxdrWEmHi1ukpjdeawdinboTYR0I7V6c9H6qsS4DFq4xRZqVb9rcLWscFyRSQrMkhCCmRZP/2A9HOAR0+8wWXU2kev9smPfUFk3k8YFFIzMtrQZe2j/dKWxUUgmagCNOJPkO3uNZjg8XnHFH3jplq5qhC8ugosIlaam2qKiWamlxcCHs0OZ0iFtCHYtcwMBw6lTZfL8hq52NsRgZxyRYxLqnAiPXV3xvcs0+RETP8xO/WilCkBo9Do/nD/pbz20JTQs16eVuitMLo2N4lu0yWhCotwSb1ZyMsoGYn1c5RiK+4sg7hrrs+/G0kVkDhZN5M3j7aZn2/82r6EyyXtpG9XhceOlnaJpZPkUabjtYjU20F/wr9QkDGxzxnnuZacmIJ84OokPHVV1ZIIBCNPsLUGYyOhCv8F6sm1e4GWR7bGoT056URBSyAz2mJvvC12lOwBGcbjHy70nlmC3v8CskTT+zzNGKDf5+/1VoIPZiyraB2Sm1dXEr4E87SLpzFRPlktwvC2SZd0d4RczEtXcZseqEVWGOPDReB/yZ8HaroL41fYK5wKyxUkCMetP6Oamco2+5J5d2/CvffmZcdCjjiI95eCcxyFnM8bYgG91eNuk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB14118.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(52116014)(10067099003)(11063799006)(6133799003)(56012099006)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ObvZdc0LEdAXj6IMjbKaBEqFeIzCk7yw/fAQHY0feLhY5zlPNsKrTCkLEwCf?=
 =?us-ascii?Q?4OvjYX55rzrI9oJ4ZpTKLULJDfpfdVHEZ6oE87j9gclNyAawQTeA899sJ+uz?=
 =?us-ascii?Q?x8JwpYFicbtPopvSETqmooWFWF7rw8WrIPOFGFnNbfm4kVCY9z48MEUjOSr7?=
 =?us-ascii?Q?HB4SJ5jzS6+Y8uCEDGiDHo6c991vTZmnQsZPHwx0Ap+0+BYW+Qrphjm6MZaH?=
 =?us-ascii?Q?vOVZ4xHbmchWu1rSwYM4eAcv5s7e0CIKECK7oH6IwTOKf1wSAHlGhtdIQf6R?=
 =?us-ascii?Q?x94x+1/B/RcNmKFrEr6h+q/DN+DJB6Po8Hcb/1F9wUS1XAVUc4Fc2wMvWgqW?=
 =?us-ascii?Q?3NMNiIkjk0Yx/F581uuAoojx+TZuXgZE0rb40SccvvuzndA239hjFbQOj3IK?=
 =?us-ascii?Q?1zUgvgrsc/MeHL3cQE4QPjRn5Ng8AkKou7iSDHzJuQR7XYw9uVQ9S/VOg7kM?=
 =?us-ascii?Q?9LHGFLK0f08q9fzdYj4ChEvmYfpMjYnk9OeSuj7I6rgLMbLH6GvzZV3m1dvj?=
 =?us-ascii?Q?5HmmGjCzrNgJ+Ubs7Zyme1fOVstNKBhyAQuqrRJbbkanu/Ch8siP287nyJBw?=
 =?us-ascii?Q?nTWE9+yPxhnlCljk9FYAFMAuDpms7ZcNLvBenVvYJB24kJl0RXvww7mdpNhb?=
 =?us-ascii?Q?xoyPgW0LDMEyq7RbYUqAnL6gYn4YCVvNPidoX2viPhITbt/CT8LpMoLVjHva?=
 =?us-ascii?Q?0qFdmdL+iJvjEq2M7QHpdRJit0bhHoG6TssdpBs1R1GoNuMvGD8afpdReS0Q?=
 =?us-ascii?Q?SFQ1tN7BoOJTixzJuHHRlb/NwrN6DEUg9lmYbch5i9EArCDLb+kZhX244+1q?=
 =?us-ascii?Q?rHQGmw3h7eA0lX0vtWgYgfoZ/Ucys54YLGdOiAn6ve4YKZ7i/Pl8KSIarzp2?=
 =?us-ascii?Q?xBhHvg4I0bJBWpCZD6Dedgw+IFwkrzjfd2V5aB4NyTWN9XFN93FtMU+UGMZr?=
 =?us-ascii?Q?GbH/SI2ezoROKXpMEUl3/HrQ4SUiM4HbVQqMdlxSHIQhdY4XzAxHL5vHv1Mk?=
 =?us-ascii?Q?gmm0vRx1Wf9Ae57WBnrk4yqYtMT3ZWVBXlz4Zs3bVaATNMx31lUm6Gwoa3/B?=
 =?us-ascii?Q?WBqhmdes86Ol9I9lIjmk3e9zFvHR1PkBggZImImHGqsUSf8arzPUcevSYyGs?=
 =?us-ascii?Q?CM0OzyP3vczwkAF+r8EFR5vyyegFAb4AqwwfBscAT/l7q4wc6goiDyntYk27?=
 =?us-ascii?Q?L2H1rMZ9g2FrnQtdwzMhrMgRZ5nOSOQTxCor/+4Oywc9paoG2X0sW2ppicB7?=
 =?us-ascii?Q?XKlFZGc4SPX1ynBFKvQMbr4ZlRFFIQx4oNbY57CDGyIe0QCR7/aO0QBYwvJT?=
 =?us-ascii?Q?T+FEdMF0O9+VCUa2vN+ApquCAvqKl4ZvunqjlFNNzwuF0YopVmanWydBz0UF?=
 =?us-ascii?Q?nun7TdLlMe/WBKFcQzNDBGlG5REpsuinFS2SajlR39jdbbDKKnZaHbvkp7CC?=
 =?us-ascii?Q?DhBzOkfnB/JSC7g8D8I6avUMFHSo1Awd/xNAUvJK6RjKbx6NzvCtDKQG6Ofc?=
 =?us-ascii?Q?s4K1HMxj9yz/HaKwZXvfNy8hnIwOJ+CTvEdZO3dIcuT4vb7rHNjlUN0465lg?=
 =?us-ascii?Q?sHgyvy34PZLRfsY3LTz7fi144D0Do+vqyuFbTmC91G4HBYxYRte4Hw0X17mU?=
 =?us-ascii?Q?0blD5NDeGf4n6BRdCWs3BNMhT3ot/GeGOIJAJZFtdV5tuWLC08GBT+o2X6Tt?=
 =?us-ascii?Q?AAFFQkR5Yo+zJmpfuAZ3z1KvoiXCKAArjdR2jle33DkeVPFSf+8K/zH9cKcw?=
 =?us-ascii?Q?H837N1SWaZA5w2MQYrQOEQ/r2xtXyu05evFOq6kb97wxnU7aX1bx?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5120562f-175e-4a22-2bb3-08df1525dbad
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB14118.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 01:40:45.5118
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PElvogw075aQqGu9PkExODBkF10ioiL8bLhjQvDMdEnDwNWoalpCJEtTD+xr8haOTQCdOPuQKu0t7cUBNkvwn1GdGy2fX/2v+w/DJVKkUK3YkOArorzQ5F7G7ER2h6X7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB18388


Hi Mark

This is v2 patch-set.
I'm now posting ASoC Capsuling patches.
Current status, and this patch-set postion is below.

x: done
o: This patch-set

[x] move DAI functions
[o] add new DAI functions
[ ] move Component functions
[ ] move Card functions
[ ] add new Component functions
[ ] rename DAI/Component list
[ ] move Card functions
[ ] add new Card functions
[ ] adjust Test
[ ] use new Card register
[ ] use new functions on all drivers  -- (A)
[ ] Capsule DAI/Component/Card

This patch-set adds new DAI functions to get dai->xxx, because each
driver will not be access to them directly when capsuling has done.
This patch-set just adds new functions. Basically it is just adding new
function, but it will update driver in the same time if it user was very few.
All user will use them at (A) timing.

v1 -> v2

	- Add Reviewed-by on each patches
	- snd_soc_dai_symmetric_get_params() is decomposed to
	  snd_soc_dai_get_symmetric_rate()
	  snd_soc_dai_get_symmetric_channels()
	  snd_soc_dai_get_symmetric_sample_bits()
	- snd_soc_dai_xxx_active_xxx() patches are merged
	- snd_soc_dai_active_xxx() functions are renamed
	  - I have discussed with Alvin to rename .active to .count,
	    but it will be kept as-is for now
	- fixup/tidyup git-log
	- don't update mediatek for now

Link: https://lore.kernel.org/r/87qziwliaj.wl-kuninori.morimoto.gx@renesas.com

Kuninori Morimoto (9):
  ASoC: soc-dai: use snd_soc_dai_stream_active()
  ASoC: soc-dai: add snd_soc_dai_id()
  ASoC: soc-dai: add snd_soc_dai_to_component()
  ASoC: soc-dai: add snd_soc_dai_to_driver()
  ASoC: soc-dai: add snd_soc_dai_{to/from}_list()
  ASoC: soc-dai: add snd_soc_dai_get_symmetric_xxx()
  ASoC: soc-dai: add snd_soc_dai_{set/to}_priv()
  ASoC: soc-dai: add snd_soc_dai_get_bclk[_ratio]()
  ASoC: soc-dai: rename snd_soc_dai_action() to snd_soc_dai_active_update()

 include/sound/soc-component.h | 14 +++++--
 include/sound/soc-dai.h       | 23 +++++------
 sound/soc/sdca/sdca_asoc.c    |  4 +-
 sound/soc/soc-dai.c           | 78 ++++++++++++++++++++++++++++++++---
 sound/soc/soc-dapm.c          |  9 ++--
 sound/soc/soc-internal.h      |  3 ++
 sound/soc/soc-pcm.c           | 21 ++++++----
 7 files changed, 118 insertions(+), 34 deletions(-)

-- 
2.53.0

