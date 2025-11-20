Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE2A33A011;
	Thu, 20 Nov 2025 13:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763644012; cv=fail; b=QHkopJnlUwFaldf8oiUIyPeRH5NbwunTST3/WG8Ys/pgO/QGaGkiU/MCa+SBmOa6RLSi6aXRcUY70jKcNf9LtNRScOTgpsH6tu8dwCqZ7WSWSAkW+Rzc8O7nhLZch9/09anCwH6coQgQVao7kd59pAJlIN8k/GLQ4NeaRVgqwPs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763644012; c=relaxed/simple;
	bh=uHLg816ICmRlx4d6gMHU2BVrCI440ZrtWsSsOe/2+OI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=std+Ue/giv7uUZBaRENGzwLzxs7052Hpk3j0IXu6Agxrw3Eytn89R9Dgdb1pKFXl5x4MhyY54QJpHEGhSiYlXyCfr8CUXvlzhbQyVHgw5wcW97CfcJ2oZswy0uRzB4BOpliioLZ1VrHieceTZrLZ9wENyGKxqUn/0XiLMb9Vkjs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=aE1WV+54; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=pGR/Uvya; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="aE1WV+54";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="pGR/Uvya"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AK5sZHG451043;
	Thu, 20 Nov 2025 07:06:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=IQ4nTKlR5dCqOVlheXusyuIHB5iSFlbmu1miGImSxZA=; b=
	aE1WV+54sv1ft3EOQ8GyQ67OX0wSmIZMo9cDJMs35MPmWOYDA+W5VIXNbSJ4QbMJ
	NtpWdbXmwFKrAd41dX0AaCMs4XtX8tQ/lpWfBLftG5Ag8++WdsoakfSU6FyBQdrY
	KwISjC/2xziXdtkFFdI59dUa+I/hY3yJf7JW2ukU8L7j/zERwO4sxADoghU2LsZI
	5en8twlQbwg5HXBv511iLsy9YxTx/GqOB1OxThqoBE/V4zgY2GOkexdTDf9aJs4C
	T7XAiyTh8x4bBxriGV94gromQ99ijAyFAgfWn0TmlhAkn76yqK84rC8f1St8ZfvZ
	BfKYKsDAzQN63sd67WQjcA==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11023129.outbound.protection.outlook.com [40.107.201.129])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4aeqt1eejm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 20 Nov 2025 07:06:48 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Urr9ongvubQ3KeOuS32b8w39x/II2bQWsIe0IzCOTk1v87tyIqRQ/LGiZc+0lrpjiY0RuFN4YoDb+ZSUg4JIpD4dFxJuI2y4g4VCZ/swa3JCPmIWbLRAimRUa/DA0Zn7lybJ3OvzY1sbHXMDNL8DtWcfk4QlprRGdFdh146WwrtIjqbXT3ta8B09TWs1YExwmsuOKr8dNlErfOk5665bB8TS2UzLj8YwmA39RUwiLCrIrdYOl1hSi7NfDDun0m3Vsa39C1OY98Bty6I5/gISmQktSJHGdwPNHGCvQQoJZ0w7YWUX/Beh5bsErEtOfYFDWlPDdMgMJodMt5zCBbN6Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IQ4nTKlR5dCqOVlheXusyuIHB5iSFlbmu1miGImSxZA=;
 b=PSFypcFOIZU47MGBP6u6YcpEBqZCByOL7l/OY+wwfslJ/BTq9+0UjS7+juKIF0AjL+LKJoKATzP0Ou+KoXFdX6cWZt97BfxVFsPtPIzKPxEXuAT/DqQRDuLBuUVs8xT64Ltt7BDBCU4kfP7Ndyzi9esf0TuwP5RcGD0mB/9uqNwa+qIEw1BXwxXnUw8naKsGMpdEc7WFulyAX2K3ZmQ5+y5xtDcZqAk7AulMN99UYLvRQyZP91fjgbKLhiQnqTTQB7bRrUutZxPbv28RouKuV47MJ/WNpc1MLw4Tup9q5LD1ueuTkQAImOVh3EfLIrdhNq+HUN2omOCjK/N8FGBZPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IQ4nTKlR5dCqOVlheXusyuIHB5iSFlbmu1miGImSxZA=;
 b=pGR/Uvyavs49j0lvFQBTLK23qUAEJFRq70Vo5MKrO+N+mwnsU23ZvMfu7fsnxomupz/Gw3PE6sexnKsiMFmxzm6gKiU/T/ON/c7yRBJD6Y/vYcLjqoW2cUUuq5BsOgnRTf7Xdlf2nzt+bt5sT/WQKDA5uVChdeoxJd3UBeNJn7c=
Received: from BYAPR08CA0054.namprd08.prod.outlook.com (2603:10b6:a03:117::31)
 by MN2PR19MB4014.namprd19.prod.outlook.com (2603:10b6:208:1e2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Thu, 20 Nov
 2025 13:06:43 +0000
Received: from SJ1PEPF00002313.namprd03.prod.outlook.com
 (2603:10b6:a03:117:cafe::e9) by BYAPR08CA0054.outlook.office365.com
 (2603:10b6:a03:117::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.11 via Frontend Transport; Thu,
 20 Nov 2025 13:06:43 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF00002313.mail.protection.outlook.com (10.167.242.167) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.9
 via Frontend Transport; Thu, 20 Nov 2025 13:06:43 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 67586406552;
	Thu, 20 Nov 2025 13:06:41 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 54D9782026B;
	Thu, 20 Nov 2025 13:06:41 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 2/2] firmware: cs_dsp: Append \n to debugfs string during read
Date: Thu, 20 Nov 2025 13:06:40 +0000
Message-ID: <20251120130640.1169780-3-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251120130640.1169780-1-rf@opensource.cirrus.com>
References: <20251120130640.1169780-1-rf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002313:EE_|MN2PR19MB4014:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 89b20092-eed9-4df2-72e7-08de2835a719
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|61400799027|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Ghsc4qcTKJdhjW4UKvEPoTUVWtN93SDxpVbd8Oc8mkKcxtKFeA1TCk2tjAn2?=
 =?us-ascii?Q?ncOq5+jUfmRuV+GrS4DDVi0br8Pqwei2l97L4Y9rcu1DiiQrRBFurYICLCdS?=
 =?us-ascii?Q?EZvLzekwkCOsNJmA1cbpIAuFsVPG0ehL99imnX5YffUcQswDRBqoRHEf+OO0?=
 =?us-ascii?Q?nhn9IHHhKeTlCETPtw7D6WqbiI2i/pv+wTw/8gQFaBcjn4CxJ7vhKzO0kzaB?=
 =?us-ascii?Q?8mx9lPu+EB5hY+6LsOuRrEjc17ZrX9amwqthl/Evw9OqNZiPHMRhcyg02N+B?=
 =?us-ascii?Q?0TZKcl9hGgruZRr1HZdGpCX/aU0bwPlNZ3gtIiR637xVPmJyvKVRP4XeTu9k?=
 =?us-ascii?Q?5gj6/3owHZScRS9JXX30vLYZgqp+XZfspsGBvBjyHELjfB72/S4YYUEGMXBK?=
 =?us-ascii?Q?wp+4Aawa49l1zQiyAJxCRjwD9MZwWxI0Azh7IonwwKOjNFQCuj5rBv5unqOo?=
 =?us-ascii?Q?VdnIdAOSR/ECoNWjBYRegs03H3py5RJjUSZjmyA3Nq27kyKfr+1c+CL4XEnL?=
 =?us-ascii?Q?JD9I482Ioj/Ljv+04468juCh5Xh6PR5ZAGMJqaU3TE2GWrQ5SeIQqUDGaB3N?=
 =?us-ascii?Q?b6rrlmRf8tajPAGsHdOu3wRkej6bAW2dUxeTxXxmKX8BR/bVJsMIV8a4hbmj?=
 =?us-ascii?Q?BhOArMTnI1EzlEHiaB+Fs8WASkMyIx1unObMffwRZhZxbsur/NvReygeDuXI?=
 =?us-ascii?Q?7qhLCZyMhlpYBAKdwf25rtW8+Wbj5f6rDwqWZumfpJS6+S6O3JvRenpy1dyn?=
 =?us-ascii?Q?rrGwi3SWahmBDKI0HJ1o9LEwr1P0TapvFMMbRVQVLYaaSFaBa1Y33cd4M/6J?=
 =?us-ascii?Q?RweoGbVDHTWKRshV2yips6tWbL8tWmXJTwTVdzkNx0oc3Vo5hj7PzbuJmXy+?=
 =?us-ascii?Q?fUlf6UViuBPEALBEjjwIOY/kVEV9SPLX2WF5F/n1wQzvDnn1jTOKQBXh2K+l?=
 =?us-ascii?Q?ZAvsbkSgmK4TMR6gwETCGvNPe4q3ejl8HO/EZV/lU1hFeYXXtiH+a96rvHwH?=
 =?us-ascii?Q?zZYl7W4WXUrW5YTj3NTekYNxwGi1LrntLpR3m3xOOlmHdtrTaY2As+jQ29tK?=
 =?us-ascii?Q?2CyGn3DlQP/q6kk6uH32MdjqCda7jQJasXupVScVnj65m65awa70+2WEoyLT?=
 =?us-ascii?Q?9u2B3SUuUP6Axa/eJUMvH42LOnlycficSJovjH9gA9qfzUF72ynQBH5fFgLO?=
 =?us-ascii?Q?5gt0vymy3Cc6BuZSMTmwUlOS+1tpgvT7+qsCrSQ4/4OCI7DuCQcoev7ZaA11?=
 =?us-ascii?Q?zNYCJCL2v4/su1pfcsRCmnPpSlCONiuPi25ZAmXb/k+84zUp6o6wmZPvk4QQ?=
 =?us-ascii?Q?4H0iHGq892JSGJEzx3fmMB8N/vhmO0ZjBXaexVrnjG5gPQYp3XETMKXspi8F?=
 =?us-ascii?Q?boOHSjMrCryw10uIJD7WxgC8O7O2ofDqFyVCl24UgNmSb7g/Oj+q2VWo/Iw2?=
 =?us-ascii?Q?wgbAEfyz3bbVtDCsVZyyCXf4ohGsZnIrBjdy6UxS2Dpglwv9i8NcYXg0drH5?=
 =?us-ascii?Q?i3NHLX5y8zakXWSq/mcG36b2WGYpfSbLYFK4oaO6P7r/rCRouPhwqq0GlsDu?=
 =?us-ascii?Q?6ummkos/R9Bo7fmYb9I=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(61400799027)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 13:06:43.1621
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 89b20092-eed9-4df2-72e7-08de2835a719
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF00002313.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR19MB4014
X-Authority-Analysis: v=2.4 cv=OOEqHCaB c=1 sm=1 tr=0 ts=691f1268 cx=c_pps
 a=roYWoV4TocsuA6t8t8h9Ow==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=n3nmSC734XP5YBAcbrcA:9
X-Proofpoint-GUID: M0p2tHLhdaQkypUlT2VsK8yISo-s4Pw8
X-Proofpoint-ORIG-GUID: M0p2tHLhdaQkypUlT2VsK8yISo-s4Pw8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIwMDA4NCBTYWx0ZWRfX9hLGS1YyrPgH
 g573JWv7w0eFsBnmOB+pAA3cL/PzXeVT80eId9KmnCuVJcXpPjjH0DcuALqciM9/OTh0irmpPma
 +ExfvafAT/gh9hQdvkxOicXFERYMeZoRqmsqRmiO7D1rnkIJbK0hzsD3SEXNeY2RloyOwh4gNSZ
 TQqEew8qZCSmrfJRCok/k355bKtmd7O7wbjeDDoz/rrEr60biwgWjiq/fmNRkoheL4bQg+rbj9W
 qjzokFce2Co0qWzO/p+pLOI1ikfMiHC7sDJf7S/8X9Aqq2OEZdL4Qsuh8VymS4UJhe3suHjnbNn
 10toqcad6a6WZ5DHnuBoaV/p75B45YR7d3EWFDBh0RNwuNl/cqe2mF0BUl47SZrPaa3rM4Wg6gX
 2dp7C6yth8dY2ohAluM5zJkHw13bdg==
X-Proofpoint-Spam-Reason: safe

Append the terminating \n to the string during the debugfs file
read instead of creating a string that already has a trailing \n.

This avoids the ugly behaviour of having to include a trailing \n
in the filenames stored to wmfw_file_name and bin_file_name in
struct cs_dsp.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 drivers/firmware/cirrus/cs_dsp.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/firmware/cirrus/cs_dsp.c b/drivers/firmware/cirrus/cs_dsp.c
index 58e41751dbc1..9acdcd75928a 100644
--- a/drivers/firmware/cirrus/cs_dsp.c
+++ b/drivers/firmware/cirrus/cs_dsp.c
@@ -389,18 +389,14 @@ EXPORT_SYMBOL_NS_GPL(cs_dsp_mem_region_name, "FW_CS_DSP");
 #ifdef CONFIG_DEBUG_FS
 static void cs_dsp_debugfs_save_wmfwname(struct cs_dsp *dsp, const char *s)
 {
-	char *tmp = kasprintf(GFP_KERNEL, "%s\n", s);
-
 	kfree(dsp->wmfw_file_name);
-	dsp->wmfw_file_name = tmp;
+	dsp->wmfw_file_name = kstrdup(s, GFP_KERNEL);
 }
 
 static void cs_dsp_debugfs_save_binname(struct cs_dsp *dsp, const char *s)
 {
-	char *tmp = kasprintf(GFP_KERNEL, "%s\n", s);
-
 	kfree(dsp->bin_file_name);
-	dsp->bin_file_name = tmp;
+	dsp->bin_file_name = kstrdup(s, GFP_KERNEL);
 }
 
 static void cs_dsp_debugfs_clear(struct cs_dsp *dsp)
@@ -416,13 +412,16 @@ static ssize_t cs_dsp_debugfs_string_read(struct cs_dsp *dsp,
 					  size_t count, loff_t *ppos,
 					  const char **pstr)
 {
-	const char *str;
+	const char *str __free(kfree) = NULL;
 
 	scoped_guard(mutex, &dsp->pwr_lock) {
-		str = *pstr;
-		if (!str)
+		if (!*pstr)
 			return 0;
 
+		str = kasprintf(GFP_KERNEL, "%s\n", *pstr);
+		if (!str)
+			return -ENOMEM;
+
 		return simple_read_from_buffer(user_buf, count, ppos, str, strlen(str));
 	}
 }
-- 
2.47.3

