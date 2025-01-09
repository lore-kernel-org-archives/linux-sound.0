Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011025.outbound.protection.outlook.com [40.107.74.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 918234C6E
	for <linux-sound@vger.kernel.org>; Thu,  9 Jan 2025 00:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736381678; cv=fail; b=ULL8h5EmuybgpIohrib6fmjZpjJXteR1ICXi9wgY1/rfJ80nDo6MA52Ei9fkFnJ3HIK36iedO0p7KR7F33MeEJqobEHGku7+5aor5/caYV8akta/UwjRSbhEZLcHI4EOmoBmyskDZoJlmFkL8H4CG5pJamruABt2fXu1Z/4KdGw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736381678; c=relaxed/simple;
	bh=83bDozME6jFSVOhNirVI+cxl+OuHXYxlndbqIjqWFSw=;
	h=Message-ID:To:In-Reply-To:References:From:Subject:Content-Type:
	 Date:MIME-Version; b=J7aEntyJvesQU4VqqbaqhBad2Wj6UEcDMbfCpRy99cWs0TysrL6Tl/FBTWF/nTF+CkAlCl8rCjU5kcYrwxRdow6MRgZEserNqMsxqe29gbbhGivonaWbA2DgqcnAGmCQKCxkLVi3VvF1NV0rQ4l6fGImZCmNOg/xASHPuQyqoVM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=EIoz7HZp; arc=fail smtp.client-ip=40.107.74.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="EIoz7HZp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hrSDPD6PPRxwEIHdapicEBSWcpo8vxr7auCRCPDOhGqcoHbeXyHX9Z8N8i0o36H+2igWVS5EsmktKxROS9nJPPVhnPupQuEeSMni1Nl1Lsr6q/Oj7fR5gnsvbLchCPmjAZ/oZCwAfgdBt/IHKNE/WK6YKt/2zgAyHpEtg5ldbHcWrH9eV5+poVwCMYfYuNAd2+QaRfQ5XSRCYvmrlxUAHmuF0go0qw16OaZA719nSPz0fPSKuWWv5q6gBuvvwRn/Q3Uq1G9oVEphifG5MGhbDnyAoDnJHiOx94abqDnDp/B667c/1u3CQUGxLcRNAvVgm3YcQQvfudiRRv2Ke9I5OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bPZZmF++2leNsOVDB2ux5QOEzYdkubaec/gvC1+mjOc=;
 b=KCafYZryskINgca2J4MBStHZeYdad9Om+egjUuWOArfSi8MZWCpIa1sc2AKnciYpMKjGgvyG0tg9WjqiiXBSAAjRT5Ke9dfGC3IXwoTwQydTb3A2/eSjiNHppYO0oOvOE0NW9x2r9ZSziAZBhs+ar0de+Q/KKmxaD/Sj5QuIWOsqrBlT8NmdU4QbHg13LjkHbK9AEtlw6glrbSmlnK6IdsAd5JylLHh1zUY6YTTQuZ/CTn5r7pxoFnxsHjDDo12iR9zfYE4qjibrYCCs3MxlpdMNIypL5Jdj0lhpNrGO4cFDZJJUZGYzsnBCoWwsJs9hwDhfsWDtliQwC4SNH0ZqGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bPZZmF++2leNsOVDB2ux5QOEzYdkubaec/gvC1+mjOc=;
 b=EIoz7HZpwIjcXzGdFkLTHiO8nk12eK1tBAJRkndm5DTW0E8lLZb3nl7rLeH774IE5x1dIcpqATcgfEB5zBGkzjw9B2BFP/7pTdGz8kwlfbiRiN4Pe7d9E6MAhtLNap0Sw/hlrqtEX1slx66gnHcEsPWwtym1yI1KYMLChp6KWyQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB10906.jpnprd01.prod.outlook.com
 (2603:1096:400:3af::14) by OS3PR01MB7143.jpnprd01.prod.outlook.com
 (2603:1096:604:125::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.12; Thu, 9 Jan
 2025 00:14:34 +0000
Received: from TY3PR01MB10906.jpnprd01.prod.outlook.com
 ([fe80::592:9b7b:ef57:2dd8]) by TY3PR01MB10906.jpnprd01.prod.outlook.com
 ([fe80::592:9b7b:ef57:2dd8%5]) with mapi id 15.20.8335.011; Thu, 9 Jan 2025
 00:14:34 +0000
Message-ID: <87v7uo268m.wl-kuninori.morimoto.gx@renesas.com>
To: Bard Liao <yung-chuan.liao@linux.intel.com>,	Brent Lu
 <brent.lu@intel.com>,	Cezary Rojewski <cezary.rojewski@intel.com>,	Jaroslav
 Kysela <perex@perex.cz>,	Kai Vehmanen <kai.vehmanen@linux.intel.com>,	Liam
 Girdwood <lgirdwood@gmail.com>,	Mark Brown <broonie@kernel.org>,	Peter
 Ujfalusi <peter.ujfalusi@linux.intel.com>,	Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>,	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,	Amadeusz =?ISO-8859-2?Q?S=B3awi=F1ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <87wmf4269n.wl-kuninori.morimoto.gx@renesas.com>
References: <87wmf4269n.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 1/2] ASoC: intel: remove disable_route_checks
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Thu, 9 Jan 2025 00:14:34 +0000
X-ClientProxiedBy: TY2PR06CA0039.apcprd06.prod.outlook.com
 (2603:1096:404:2e::27) To TY3PR01MB10906.jpnprd01.prod.outlook.com
 (2603:1096:400:3af::14)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB10906:EE_|OS3PR01MB7143:EE_
X-MS-Office365-Filtering-Correlation-Id: 21737b18-7c3e-4b8e-907c-08dd3042989d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|7416014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-2?Q?i4zrTJLHgVKLvSW6U6wVzBq8fxnckssT/p08JxVIv1HGEkW69ICK8xSBQK?=
 =?iso-8859-2?Q?WaQ69cBYx9oBDiWzjkOWffyC+7kEML/mZhUVtUFRs5np2DtC6W18lITGPi?=
 =?iso-8859-2?Q?ZW+dYgNbVoW9BrebGf/SZGmq6/F9D2y7GkrMFhog0n1aC3+THUxJkhzyCz?=
 =?iso-8859-2?Q?x4HrnRTnCyz///kjFRWTg89mYZbsSQFslJLpOjFhiwsUovwzLeZZ3u3xld?=
 =?iso-8859-2?Q?uqgT1DWx2gDj5JGmTqt7dG28G4348zicUD2DFPURPnlDJOoL1/a+cS3XR4?=
 =?iso-8859-2?Q?qsGxEOi2qsDZZVgSbmKNp10tt2SWLq//geO/JdHntNLg3ilqZatfnv/H+r?=
 =?iso-8859-2?Q?hrxxJh2qK+dzgCaNdrRGVc8I4gul4q3YNpHXBuJsAyPQAqIbqJbCB/MSqy?=
 =?iso-8859-2?Q?vjIuHecmKqOOAFl+fpwq2AkrJMwV38kUj+iK/Sxt9vfszotl3KU4croajz?=
 =?iso-8859-2?Q?0FK6PFTA+8nwqUHiOR8woCEQNwn7s+yd9C7m9uxDKV5XgSbqcnBJ6ZucrW?=
 =?iso-8859-2?Q?2Xh//CFfq/WpWhhlb0zkPf05p9ngEP5qwgR2cLWysyoeoNma7tCGZZSnaW?=
 =?iso-8859-2?Q?bPWclP/Iq01Xkg41kbkSOlsjpap4NlpOQHLj4wMdlHQSLLW6mt9UyuTtqA?=
 =?iso-8859-2?Q?8A/hQ0/HHFqwcsogCDLumSvnZmlPJ7ZpkVFtxcoG8EN1qRQGxTimWi+kW/?=
 =?iso-8859-2?Q?eUMLd2WkfVdf2Cqsk09y6Vwc3Ow+A8VfdBQmElqRwxfU1UhG1BTcYHrQBQ?=
 =?iso-8859-2?Q?jfDwtVIkTNYrvFS6vRYXPMyJsyVlIgQ2LOtJTO+9X7NPSWX5S5rXAYWmHa?=
 =?iso-8859-2?Q?0+A4/07V8D2tXEmHDiISWH9v7X7oF1FNaM4qmn56s6FZ2I2rJiJSxebauY?=
 =?iso-8859-2?Q?En/CRW6IJftgq8bCEcHCEN5zBNadnRnOOjL0cuEMYFa3GHPUORk/DMUKKz?=
 =?iso-8859-2?Q?X1Nt5jGvtEzU7kaF3KZUMFalmz8H27ZmWQaNV++EYdgos4tBQ+FLlian/W?=
 =?iso-8859-2?Q?rl06v/59Jt3JUXKatc7hAlsMrdmMdTixsCleG6yCCp/BTem+EOxk9nQhGI?=
 =?iso-8859-2?Q?ZcrxLrN9sRlJBET/2/U7gniUjLTuZCtD2hcL+9Z0TdmzMgSElV1tTzHJAW?=
 =?iso-8859-2?Q?trIaHMn3ZAEd1747yTDP7DCvVYii6pOOBYU0wT/U0jsAzhFywGIHnoK2+E?=
 =?iso-8859-2?Q?iFwYgsBkYwSWryeLBAeOcSt7HXTlae+D/0NAScF8G75yEEuwUU+lp/4Jh8?=
 =?iso-8859-2?Q?pRJHV3CEeo/SWoW+JE0OCLxnX69mIrcliDfPfaZVEilXlYLhuYkYbgPNhm?=
 =?iso-8859-2?Q?0FCVAQzdSytP7obWdxmKkJzL/zdg3qB7a2WJQOiOYHhNgIDZhZw0Nj2L8e?=
 =?iso-8859-2?Q?9BveGZ6JlJgpUeFnNMuSyvfCi9IfKmBb9qykl7yFSdgIRA41sHc4IFKrLz?=
 =?iso-8859-2?Q?vypNrpV95OL5JRTlMw1L/S4THS4s1O/JsyX2u1yS6rhZolVeY+uTV7zOQL?=
 =?iso-8859-2?Q?v4si54Jgn031ZFnpCi/NDHxVQKjsWEOdFlLL18laVdIA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB10906.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(7416014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-2?Q?tTRSCOYJ8XskLhpJBTkhYfwtzf7hsz5KZWO8q9UiDFe5/DcBh3TSKCitGW?=
 =?iso-8859-2?Q?HnDIPjDi8hrA2ta8Tru8u+6YupQwNcTEylUKV+23zR+s/gKlxL8H5WrAl3?=
 =?iso-8859-2?Q?S0HJ68zZ++JsGBYINwv5VrXiVQE299mdxDsvXMpEUpgZA02yjcTo/38WQt?=
 =?iso-8859-2?Q?HyAuqXHuV6W7lPqriVENaUzsuvBiKfw3q2gt47qdiwxJolD0qgYpOLtzaR?=
 =?iso-8859-2?Q?Un1uuouLX8Qgv81lamwtRG83ewY1EyvM1jIyQATwv1oZvLszelO+uj3nl+?=
 =?iso-8859-2?Q?RjYcRJzDWomLyJ9BJKYAHUCdhCa0E6LeQ6sHzWjfnZdLTQ6j2ZRu7Ht4TY?=
 =?iso-8859-2?Q?1rIj9H20/hX3uL6RbNmElu+5s3KH0PO0pfXtYXMQT0BTBUHsqAnp0pHq6v?=
 =?iso-8859-2?Q?pzF4R8f8MVCFuNIlg/lkUTeByTNrji9HsB9B/NS82+Vo3e7plY1/IJY65f?=
 =?iso-8859-2?Q?Ghzjxo0ft7LXEbsTWF52UKVhnTRlysvoIaDnbWXaF5Ck871mluBybInpu7?=
 =?iso-8859-2?Q?5r+JwHpwdvpiVkoneHulBNB9G2FdBtnqkuL6vmqqZYv0B+3OdHTRbUq9jF?=
 =?iso-8859-2?Q?O0L5BXcP6/4fcxCcP7ar2qN3sPzgWlYebTODolq3lBx4BSAIG9MNfLiGnh?=
 =?iso-8859-2?Q?aWBu5YXEL9Ya0It6W8aI4fp1nzxpkrW7cpCg/qwBz0syMvrOI4/zWPQK0k?=
 =?iso-8859-2?Q?w76C+OjKkBdPqWe7JnbargmTSSuwNlrIKTyIZkU8fVaR1mtz2srv5W8PgL?=
 =?iso-8859-2?Q?TYf/4UIH8vzuRb9+IpqNZKcUA3J4nCHVcaxv/xPNkE+BQztSG3z8hqvQ02?=
 =?iso-8859-2?Q?WoMs+B1GJ4Ljxe57OoXQ5utHwgMvlRVu18gzq2OsVmaGTNYByBiEURLsp3?=
 =?iso-8859-2?Q?yajTQ9w+yBPFg/hayk9QwIiX0NFghbpFEpZTAjzLCzLbU7PK9SuyOEPznY?=
 =?iso-8859-2?Q?BWCoLCQy8S/U5cet6sUP0FECSGa0NvZxAeOh3sZVeOcQvyAr2sM+Hyma8G?=
 =?iso-8859-2?Q?5z8jM89jtMVKEkm9JnxiJFZCTWoyZSCYWClFMytceGkwb5qCFnO3UMfQ8c?=
 =?iso-8859-2?Q?kRI+0JMpQdF87Lsp9gTkd73nY3C5s/LAbMDnM+H1fQr/vi5mnLlpJQ5Hsk?=
 =?iso-8859-2?Q?YnQqNtLPVR7JAspTUbjiSkTBIUd4R9zsbNP1QkTR5MrKDcJvJffzY5nOvI?=
 =?iso-8859-2?Q?QOXPCesDtCnBWhU+NxSWlTk1q6VJXtqP46AzYhsM66EOAj+hEH/Pl7VaYp?=
 =?iso-8859-2?Q?xsBrexmqk2Pf77Oym9IK+0dGTyerk9uM8EcHuqMktUTN/zIlbtal+Yu94m?=
 =?iso-8859-2?Q?OTEc37cr7cblafGKZisMF4Ex8JrXZvxbSxykZ5+FqQORc5pEO09BCNvOMW?=
 =?iso-8859-2?Q?J9v+svZ7VZt5sfOENSFg2lAHjpZaHuXOVRaS9qFDQiYQe56Ddn55mVQqfE?=
 =?iso-8859-2?Q?aubLKOfcuY2YEWI2DWSgVqtvVVyDHxeG3gx0WElYdQuJEklOB1fG2zIjkx?=
 =?iso-8859-2?Q?Q55q7y2IqcMZPsSuvBnOo4/yvSAMCkryyzMnxlXX3Hwcv0KXsz0GGu5nm4?=
 =?iso-8859-2?Q?oUPtMtGrvZWT//1PdEGswlE4ub3syTjP/zVE75IWSRXzLCB11uZEWrqZo0?=
 =?iso-8859-2?Q?1BGE99XAWbDJcTpIDTpSvpZP/+TceswjjEGEkELfSP8zNjvO841nSxeqH3?=
 =?iso-8859-2?Q?8Bnv2X3osQf2yqm4QuQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21737b18-7c3e-4b8e-907c-08dd3042989d
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB10906.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2025 00:14:34.4056
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u0dSF8GHMCYdHt0KP6hcWwUYg5bJMKQ1KxjjppAUb9fxSzUfNNAU/nOfuy4E/vWen41+Z9MEzy8KjHKlgWNFtY5gZv5Wc3JUMlOxhvAGf9mdcUQJLjngeI8fGDGp07Fr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB7143

It sets disable_route_checks flag after checking that parent driver
isn't SOF, but skylake driver was removed, so it is dead code.
We can remove last user of disable_route_checks.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Suggested-by: Amadeusz S=B3awi=F1ski <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/boards/skl_hda_dsp_generic.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/intel/boards/skl_hda_dsp_generic.c b/sound/soc/intel=
/boards/skl_hda_dsp_generic.c
index 22668bac74a1f..0554c7e2cb34e 100644
--- a/sound/soc/intel/boards/skl_hda_dsp_generic.c
+++ b/sound/soc/intel/boards/skl_hda_dsp_generic.c
@@ -124,8 +124,6 @@ static int skl_hda_audio_probe(struct platform_device *=
pdev)
 		return ret;
=20
 	card->dev =3D &pdev->dev;
-	if (!snd_soc_acpi_sof_parent(&pdev->dev))
-		card->disable_route_checks =3D true;
=20
 	if (mach->mach_params.dmic_num > 0) {
 		card->components =3D devm_kasprintf(card->dev, GFP_KERNEL,
--=20
2.43.0

