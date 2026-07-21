Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011040.outbound.protection.outlook.com [40.107.74.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE5D2D7393;
	Tue, 21 Jul 2026 01:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784597970; cv=fail; b=NtwWrj0qmqeWkPhk8XXEQLTiKv+TZluZfn0Z5S2s8ztWshDG4Fy7q/bVZf8JGWshunyQ6SV6eGyllbO/ZKOpo4Ow8+vGDfDbBaUBvM2NKQTul7qBBcj1dWR9ydvrqHH9f1JhFDcQvVdHaJOAH2wAxqQ82/zo6nX3CO/DZrNU86A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784597970; c=relaxed/simple;
	bh=AWSzBPF9sqYX2w7l1JNmS8zEKswkkri5APqg26U6ygc=;
	h=Message-ID:To:Cc:From:Subject:Content-Type:Date:MIME-Version; b=ToGdkqvkhW2vZ1h9Mi+LMqjpG130pBvciWkjyY2uF2x5bkEdZF901yOdpOPS/iZm7wMRPoJKe3UQSTlEc2NsHK0YVLaqC08uB4KtprYPTTE0MpqVmyTka9fT1vDAHCEfB8KbpCuIBT1J/sTocNIhWRVidGTefRnhjKpnt6qpVfk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=JSmvnDRQ; arc=fail smtp.client-ip=40.107.74.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="JSmvnDRQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XF8oXsvWfG9M9JvlcYwTRaCIK/0Ibcu0m+XFw9fQi3Q2XSq8BfoRbS5r/iW9d2hq6bpcgQOP0cUF2ZRU+Z6Wn/lSvhaH+UxfFSdoq4b9bLcdIqZjWUoY0KsWhScRc1oK8YZ2KnUMlHXZvU2+TNmX53OmbWIyVC2vOxIc7ask9bXsgtD5UPFVa+S1+3I9UWfw/qvLZ2kOp7D9CwD53LfxT79lhe0WRFOoGxjESILyW29+kYfa6Xo77FXNMouA/Mobcs8TKNz2Vqwoqo3EqVNtX4A4Rlu+HNRYBeULoJKRi5gvxcJVy2EXTHoxwEUYpGcJx60R6cVJRQ5Vl2tmrqOdMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S2wvjuhRU8QDzVFhghDIbS6XVx/ZKnueSqk66umqd/M=;
 b=kxfCAxwt6X7BzhpHq46eNGcasAEuWpYslQv1R7nZ1j6oz2I5nVSuvX56c66jwPXdt5q7OxqDuKIIHFpPm25Rn1o+c8MYlD+g22ZnI81YZJ8FNazd8h7GzcMflt7dacQs4fxTHd1LTU5xK7HhHm+BMOO9uAEMRDReW1ReVkZ7jAhB9aaYCc48eeNUxsql+HUcFyjGG9I2gsEKgjyBo1ZrJgIy+hQ9JlkvFXlpt1L6RfGJaymf9bYSlLpQUZBwyTZ6UjcGsG2Ca5B6+XFQb/tVr7rqeX5cnCX4gxvt7uBobiMblk2oblIXK6hPzjimpvGhTIJsdcZSapR9nGmsxaRFPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S2wvjuhRU8QDzVFhghDIbS6XVx/ZKnueSqk66umqd/M=;
 b=JSmvnDRQ+TZKvTYAfj+5UnmRmzqTYscE1jdXaP8q+zgS3KgTUTWX7HppoH8PB3Igp6gkrOMPBgaEqKt26FjfGKEtwjkQRZ8qU/FwAgsS/6i2+7CG7zyaO4bGdDjXmZxCilEca3xhhbZ3GCmZn4tlmNTHw7ZXx2SAS1OsUXljLUA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OS9PR01MB17157.jpnprd01.prod.outlook.com (2603:1096:604:458::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 01:39:26 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 01:39:26 +0000
Message-ID: <87qzkxi0j5.wl-kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 0/3] ASoC: qcom: preparation for Card capsuling
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 21 Jul 2026 01:39:26 +0000
X-ClientProxiedBy: TY6P286CA0003.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:3b8::17) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OS9PR01MB17157:EE_
X-MS-Office365-Filtering-Correlation-Id: 24b20235-2337-4e24-7239-08dee6c8e670
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|52116014|1800799024|366016|38350700014|56012099006|11063799006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	u8raZFEmeXH/yhba4kXihtfRXYPVzhyjC0IpRu1DYEypoTRqW+klb6P5+hZIknJnAlWUnEmLXUk15ah/kdOhxTbO9vNyhIJnGPn3tE2mKpUOlI/gk7vkXDxLCscjqQvXuCmMLc7FW42d9jNgtK23nuJcTj9GaMn5sovRCFzAsId9/skYQt1kbQRfd5StkhICLuSmICu4l7pIwrzAbP8q2K8/eLZ6hkF5HLM0JlxhbCpFlFh9Dw+RR/H7+cKzKp39sT8vVwYX/qNgLlad7a55XzwpvJNjk2BbZKrB2YtZXiNhxDnnL4LlDkeTH868+DAM+JVaUPsrSIfzPkycTCCv4SMUlQfJlpT9KOjVymtD8L733SN36l+TPaqMV7UXHAiONEAEzkh60AACJVw0KQZT0u5X+2ll83E4LEAIWYTuAztZRqRN1ejS0YNWec6hLbH/0CBqfIKtw8VBFUAsBtxrTw+B6FYKtQpavdq4BuJUohcp7hjf6hoCLSxyp3CJAWRZyzcRcupZ6/9X7rZlWHWbY8xuAFhflrTPVLVwSPmjY5/j42h84NX/msVYuEozoXeCfJHk/O7pLQyy8M7CPfNHJSnmDvHxCjDagS6sXlx8S1E/+meiL0ghHlba/4ALOZe6tFnyRZdMu7ZyhRlhPFpQ/XDNOvpxR9yUQZicvuFmXqTmagVQAPh2d7B8Nqr9oTXpjpzyOBHYDazz1O91WGok3w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(52116014)(1800799024)(366016)(38350700014)(56012099006)(11063799006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/soIbRD4uJphP96rGzIqMoViwr5hXbO3++Boo6+QKAyuF8m05yPLIABrJdbR?=
 =?us-ascii?Q?bYqme3nyCRczyLY/i0SiExGiejlHcpxX3NnwlrInCIT7/CdO3YZCVsGDl6Xy?=
 =?us-ascii?Q?l4ejuy8KjSFUehyY1rDwDo+OdbBVOVrOWfpYOFiXYpUrcUufmAKw+JWdxA4A?=
 =?us-ascii?Q?BRZvAsTlEJp8+KmYwmKBOsWwFoZ7A/wTQcmJY9TefppKAo3EyiglYwWjaiL3?=
 =?us-ascii?Q?sm2kUkKHExEqqPsTccY3YUIOlgeGPGQxYMoBfqGCZuki7HVYhj8/tdz3C0WI?=
 =?us-ascii?Q?OhXaXjSFnDabUP6iDLD+/I0U5cHjTdDY0DST54JLkuoWKaluqct3NMiy4rb8?=
 =?us-ascii?Q?Sfn27HCqarMz6s3b4Xce4LWqa6w7wFCjW+9Cx8n8Isk7yPBTmEen6wIHzPQk?=
 =?us-ascii?Q?TJowSr17aUxBqhgEPWmDRsITXSYLXbSsnt+2cGLClRkFZP2xPhgcX0oqYpe5?=
 =?us-ascii?Q?/z6O5E8SoLpBbVnh19dSPNTARO09mRtkLtoLXGCnMRFzdjdRmj9108mi+x0F?=
 =?us-ascii?Q?G7B0vo2fDqJj9GTKJgtx+PHrsDDcet/Zj327TZHIu+NGnNVsHncOwcTubIDI?=
 =?us-ascii?Q?t092XymW5zinGHa4VXBPTqSQjBdONsmB+7fPvK+r1eVLmnuBf2D7RLHLIBu3?=
 =?us-ascii?Q?+6ljb8+EuM1/nWZFz9h5tgecdx4ax8MJ9HwoAJN78Ha8J1sVo0p3J/h+5A3w?=
 =?us-ascii?Q?eJHo1XHrbFqcVZh3Bxd5qDKS720jyImTPIJAvHrsNB9u7DnCHuvLq14X2it7?=
 =?us-ascii?Q?GvaOeg8TDC8EzGYeZt4CeN578ZCofmEdld3qOFoaw+fhmYj53x+tDHGlHT7y?=
 =?us-ascii?Q?WFoQQBzOvKECg5kghxe9nCmLPEmkvKbuyaukCjetxczJmhdCoVtM8pGZIJiA?=
 =?us-ascii?Q?j/DCeXaWyfaPYwvgrLrkb2ajlfdg141tQRFZv79s6KTCFhrfx82drEEpMtPN?=
 =?us-ascii?Q?nixrKRiJnDF0sDQVfn8h9b/YdZMofZB9+0/kEe2w2etkj3WwXZ9ndYPNRQHn?=
 =?us-ascii?Q?iBf57S/6XtbJzAqmMKins8C0jB12gtDe/b92Bhu4kybB2QH2sLwDiZvlksHF?=
 =?us-ascii?Q?aMmImVGmJd4vLdrztk/P6gqnLu4m6Wd8syQm2GHadeo/anHQguKb6SDezUB3?=
 =?us-ascii?Q?WSVNBq4uB7RGD9JmwOYt4i7ubEcPIDSBXtht5R4YfeVM3VdlwRPxzVywAHIE?=
 =?us-ascii?Q?4TcLQ6Ve54Eqd3Eh5VD+jWIAXyapTYqokGfHH0886zmmKOm4TJUsszXNABmp?=
 =?us-ascii?Q?XOQLNqH0HobeVzrtT1Dn18gQ6f2ig1WluIDiXBixokMm0mUyjV+uT6lu4b40?=
 =?us-ascii?Q?u3ASz1hMp7euI4g2VEXoIz5dmBzwdf+V6mLlfsZ4Fb5OCQzC3qhKzIDU4EhA?=
 =?us-ascii?Q?szOee2bAt5g4X2ps2m+nsMqwXhOAZfeCDwgUhnj6lH/1ZyhV9bOiCslkfjYn?=
 =?us-ascii?Q?/0Ez6pPoD9pWEGfDvayJaxIQT4HZYaJpVL2m5MAKHpXW6qJAeORL6Pfn2fPg?=
 =?us-ascii?Q?Zxl5gsnVmCgso68piF64Wltx4NH6yBnj3gRebRL2dkFuVoadZQfZvOXzmJYv?=
 =?us-ascii?Q?9PnRN7Eaz2xAX49TGrauRHj9BxWOzqNoZ7qgy0ngZu3oxUO3684YnYANJO8F?=
 =?us-ascii?Q?YcWJbbY4ttiecfeyf3l1ntQ0Yn8qavM3Rsk2KmlUsAp821rQZOJnEKuyqak2?=
 =?us-ascii?Q?Jx4vHmMvoS7a5UIho1M1H82Ard/8apve3ty46SlqSNvjTKhG/0SrbsuaAKO9?=
 =?us-ascii?Q?x9wh6FvGozyr/I7zH44fkif+5Xx4S/im6HmRE5M+b9p7FgNB2Y3C?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24b20235-2337-4e24-7239-08dee6c8e670
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 01:39:26.8573
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LjKPUqA97S2d/CgApwpBxQgT4tvPv9TYLEGDRWUrCFvGcKv2CMgQBPkX5dhIWBbQnmB4u4DTIi3BgE1A3mni3q7Q9WV5tZANAWVV8pkMUoazndvj2+g6ECuP0H6moRKa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB17157


Hi Qcom developers

I will post Card capsuling patch.
To makes its review easy, tidyup meson drivers to reduce
un-related diff as preparation.
No functional change, but is preparation for cleanup driver.


Kuninori Morimoto (3):
  ASoC: qcom: common: use dev
  ASoC: qcom: sdm845: remove unused card
  ASoC: qcom: storm: use dev instead of card on storm_parse_of()

 sound/soc/qcom/common.c |  8 ++++----
 sound/soc/qcom/sdm845.c |  2 --
 sound/soc/qcom/storm.c  | 12 ++++++------
 3 files changed, 10 insertions(+), 12 deletions(-)

-- 
2.53.0

