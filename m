Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010019.outbound.protection.outlook.com [52.101.228.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD3F5CDF1
	for <linux-sound@vger.kernel.org>; Fri, 26 Jun 2026 01:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782436078; cv=fail; b=Km3wd9OnsVzuvDQTvs+3z0t5Lh13i0Fr75EKDlUe8w2y+z5ere6hRyqb288nYPR3qgRqhPeUcyxVETacGptm/kF9rDcheurT0E04jj94SXX4YOZw5fTpZ17C75VtoK6GuPL2K9/qkj5Y1kfsAtTwVFqS0BJHIF071N0Y1uZouaQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782436078; c=relaxed/simple;
	bh=1PTL6/EJgZCs7Y87n057pP4UdhYsiaQ/NxxfvORbQqQ=;
	h=Message-ID:To:From:Subject:Content-Type:Date:MIME-Version; b=SU0wtP3Ouhfg00vOTLBhOln3EfATvMUphwHyKW3GuIBd1ybjguKcOW41dL7VkL+QLkL+Hl1y51Ex5miS7WeLlauxJsrYUhyK5PBil4PZbK9jJOkQKLM0Q0bZDtGseRsE1tF8YYz3aUNlDJoytDUq6aAnMCDc9mPBSkomPwgIBT4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=W/InyRfd; arc=fail smtp.client-ip=52.101.228.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="W/InyRfd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BRxS9whCf1x821rg//9tvmKtDekZIBS6IhNuE/XlwSLyyeLztcGZmbUSzUyWBV3bFqIMedDacc+gXg9qvrSEAqVOUEU44uI77/D8z7CVAZwe4Bzaut9kUkDGq54KAm+0sVmY6RrnUCccsUCRBtAzaQrP5sjL13rxndliZ4pAPa5n8tFEKypJpHfTxByIG7bqRqvQNk7l69vdBko1DUvEkrPUYC/Ox8dppi5G5P6RheDr9bKyX4rPu+Wq6+cWrcZETI4uDyyW9ZI0Id/CSrALbnpaGedXojtKhtqmyFBeFNGgQ16V3BxRSHwR6DoIbdkDglLhfCH85qmAjsre0VBrvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3JizO0WJ23d+j/e3DW6mMCYys9lc2qAMRUtelBsqVGU=;
 b=odKs5adQF1UAflOCXbAoOrGH8jd5jDi+mwmM0sUVyhlIzEpoNqvCu5s19caHhTrjCCe+wyPSymDo+jiwc/j2KttY3yd3iKaVTG9i5ni2nEtt7BYBImbcuEf3zAo1cEitc9xdK4zGFefHCsfpRLpe7OD6whJuVTFbfdXqT5W8nFSdrts/ixiXXaJuhSkMd3/6cw4fwFqRSZU1wwfRFayO47Ystz3znk+0Dgv7DwdiOGLr8Yge9zS4kEFE9TpGCXwzAb3aBhQ5Farr3Ism52d7jfVhy1znoQ1gizJk9oReqtTizw1oam8u+ULqGAzHA1X/pPoOW6GItaZheQy0LuuTBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3JizO0WJ23d+j/e3DW6mMCYys9lc2qAMRUtelBsqVGU=;
 b=W/InyRfd/BQuneHfG2kvE+6Xsi6xJhbZsiyb1q8qHIdp9nZLa16s0lFRBWbRMYKIgyxeY9J4//cBQn4vH0nnzZfbgr62YSzvL0h2jEaKulnsCs5xOo87aYk8g8h+l9mqB8VHw7F2Kk4P3ezHYQmgmlURV+7U1tzqqvvOgBOii18=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TY3PR01MB9696.jpnprd01.prod.outlook.com (2603:1096:400:222::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.17; Fri, 26 Jun
 2026 01:07:54 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0159.015; Fri, 26 Jun 2026
 01:07:54 +0000
Message-ID: <87zf0ids7p.wl-kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: codecs: max98090: add missing describe "data" for max98090_set_jack()
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 26 Jun 2026 01:07:54 +0000
X-ClientProxiedBy: TYCP301CA0039.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:380::16) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TY3PR01MB9696:EE_
X-MS-Office365-Filtering-Correlation-Id: ec0d22e2-c9e4-44ec-2b23-08ded31f5a37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|52116014|1800799024|366016|38350700014|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	ilnbC+dIbbvf1lo8mUFQYeb+rj5xyifKJdikAwxewaUE7dAibFe5re88D6PuirrZFLOMAbZHCxgDfVLDQvCbl1wfvPJirA7g/I+sQLdmd85a+34xnG9z85UTPY9ZRbvmcQpro9ztAKGjqor7V0amHtLJjzmlsZmVDNJSq1Lfw5EtHRNSi0wxqqCH5Zt50AFH4H8d8nKu/SZ4diX2V0erpFJrIDGJrPr1uEIBEKkOogmiR6WvlBE2XIxCAtPULbXc+CReAj5oZ5+obxIL5Yc3lFWR8AfCcHI1e0ajGlDyk4stdRvgRKh3Z7l1bqgBNfimvv9u2a0hAlQDhT2XYmSToj22m7nkpx3drg/ALWYt1LyCodhRhC1HdRZrPOV6ljuqMAuyGWHP1OvMy0L8nIlHUKuPH2OhUEZ/6naSmqVGlUMHm1Coscl42Z/Z6Ddo2f4PrhlTWnbi5P/buVcJfCILQjDem2i8iCP9ys3Ig3P4VPxXpH7mu++Bq7TNBeWbfqBZGCzOkVEp9dy4fe2Hx3iLdQdSZPbUJjEGM/VbDrr2RTBdDpksy/acjcBDEgaOfAXw5FBhori5U6dqTH+oGIyayiVq27Lvrr5XpvjRr/vaffUJ4Rf1yWW71ywQaLK1sQA4jnliRDeyoQy0d+89klCcvRkExEG972moExxTm4cL6dB2VRj0iyXciFLIZ3WtfwxHy8L0MkaTG7lPLQlF4anpm/yo4w1z5FXaWZpFmBSmkTM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(52116014)(1800799024)(366016)(38350700014)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+0tBrxHedqOxe7P2h/SQGnaKM5PbTpgKXPiosEpk6AMYjlBfeXZRbrj5IgZt?=
 =?us-ascii?Q?RUpH1KkKMrzbeFPHUmaYhy/fLEEP3bh7ExXKnhUmrg+El56VIzoUuSc1/Fv4?=
 =?us-ascii?Q?BWcD1BDpMHigUuxo0KQGbbC1GhrD9MPkvAZptoAnGr6FOvwtst2/ay+qhEDp?=
 =?us-ascii?Q?RpmiO0KhgpcpOCp5iXwqb/zY8DB6RFMfBKlRdTUJFvyrbk9yJ1mJlDEDLkKS?=
 =?us-ascii?Q?FqVkBnhV3t45kuFbjI1kU4WerhplE08/GCKcUv7yp4lESdD35YLT9tbRpMY+?=
 =?us-ascii?Q?u+alHXf2nrRlEkqXcYbxQykU+vcReGS4szgiDLkmUhVc8kSaSb96anuVLHQi?=
 =?us-ascii?Q?ZfOw9wgbCXnqB2KiZGVzaJKUPoHwLtK4XWUsOtp8keW4WbDgkcBia53ZQ3mm?=
 =?us-ascii?Q?JHnJwtvB8RjyllG/c5hCKmhE4JS924Ma9sLEcZjUU4rDTR+qOlqA5TNJ2N0a?=
 =?us-ascii?Q?PxfgfDtq7F7bYrav+6JFVAtqSG5Lq6EEADhQ9GgWwHTbxxXGPYkDlB/vC3lL?=
 =?us-ascii?Q?GfnPnX01xeFAUI8wiG+3aP8jN2/CCUteuOdnG98ocFdahmVqyB0YIurv+apI?=
 =?us-ascii?Q?onHshP5RoZiaFREloFTPo6PudWxWFAwsLTg05joYes7Wl7M6r5ps+4FPyX3w?=
 =?us-ascii?Q?V3ZFmQS48341R2EpcJK8lb/OtV/WVEsHBV1roMrPhX3WCiVkfR/xSrGpptN3?=
 =?us-ascii?Q?6kqQ51hbBVHKCCT3nja//pxj2NfUYA5NPt+fQXsDX3wT4UPAGgsjrV9geeLd?=
 =?us-ascii?Q?wCE3DD0MJVPJth48WQSsbn7FOY6vjCDEItRklD4FP+rjM18psGGNE1FoUHqc?=
 =?us-ascii?Q?cRTuDWB7PM0i0zVAGILfvWQU5QHDmgehkZU+EmDoX48qKH8xr4+5oO+17UKg?=
 =?us-ascii?Q?UaOVqbnDKBHYxgcXMv2kG2zljSSc581mt0O8bGCZkDzxdhLot5AEzbszGnGE?=
 =?us-ascii?Q?tnEy7Blc109sd5Ylj4cur2V9ePh8N+ivUX9us44CZH9JRYqyJ/+bXQWKX9Gz?=
 =?us-ascii?Q?RqnmErwxmOFLx8eX8ERfQ2wKWjTrd4AIqthJ9c0Ynm+iSSwGxRYOBwCOCzJ1?=
 =?us-ascii?Q?w7NAihQh5yiHc8lC8Ar34i/oCnSaHKvp8g+aMv+AATX79NM9kLD1qcBbxvgJ?=
 =?us-ascii?Q?w7Kyo3tajz8HX+kUq91y0GKOqktn4F8btEFNZ4pj9bmJFp2rGMk+rYomavhN?=
 =?us-ascii?Q?+wRcjIuLoxVLIFHRVKWiDZAGTfYxWg0aQgIB93NbXEXh9SOpyjI/bhRWNVI6?=
 =?us-ascii?Q?K1YtjY16OyNbG+eGz2EMQeVnBSnUJxcmkiq2ixE5XlhlvUZghF6es4LLDygC?=
 =?us-ascii?Q?S37o+tzoRtLbU7QC/38KkIxnSxHJc+EpA7iPsshYjbq5cjVK7l8fP3AISB2o?=
 =?us-ascii?Q?ulfeZwqDvJ+r9ENp/aXzIsOBiC5m7qFnhPpVY2cyQegkOX7/JR5DzuvCf3v4?=
 =?us-ascii?Q?UZKXuOFmcuk1hZt5FkVrijik6py+r93QSmZb97KVLr8RwC76h4h0Khsjf4hR?=
 =?us-ascii?Q?m/4jglskajAkrxtmwkIw/30L5kHr61mskSw9A0W++0cRdY8FcaxUB0as/uFR?=
 =?us-ascii?Q?9ViqFWH+3cXvD39uDMgKLSJSiVENbW9LL4oho6XIW+vlHxNimMk2IVVHYz+G?=
 =?us-ascii?Q?6UqnAkSJ1oDB8gQCOptFkGxWZyURA9nryt0ok/aTLGjb5L2I3DNxcHCSmTFX?=
 =?us-ascii?Q?Vlrka+MAHWXBXrfwtmIucqYsd2UsQ8MGBzNxPT3YXT1iM0CyccZhtsRRJFpQ?=
 =?us-ascii?Q?rKjrKaU7jBWzpka49qBYFV8LqrkEnjKBnp8o1r59rjNOpI2xo13k?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec0d22e2-c9e4-44ec-2b23-08ded31f5a37
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 01:07:54.6338
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SJGtVGzoc1jG9XnOkyGkiCTwnXv9kNMdVpALYmJQd83PRknmJOxGayifUn3Fa1n23B33wdDQsAJmrwR9QdL3QdLZTm25/mZbt5NGI2QXyhYbvMlAZOEEBzHJXSOLLPNp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9696

"data" is missing. Add it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/max98090.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/max98090.c b/sound/soc/codecs/max98090.c
index da416329b0384..bccce322ccc3d 100644
--- a/sound/soc/codecs/max98090.c
+++ b/sound/soc/codecs/max98090.c
@@ -2341,6 +2341,7 @@ static irqreturn_t max98090_interrupt(int irq, void *data)
  *
  * @component:  MAX98090 component
  * @jack:   jack to report detection events on
+ * @data: can be used if codec driver need extra data for configuring jack
  *
  * Enable microphone detection via IRQ on the MAX98090.  If GPIOs are
  * being used to bring out signals to the processor then only platform
-- 
2.53.0

