Received: from SY5PR01CU010.outbound.protection.outlook.com (mail-australiaeastazon11022135.outbound.protection.outlook.com [40.107.40.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E35747884B;
	Wed,  5 Aug 2026 15:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.40.135
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785943283; cv=fail; b=LeOcpz26rzbnLqeSju7PINP073cgFxkC4hZiVC79Y4AYrkvTjGvf7CBmxawKxBk/h3vzpN4B9943jlyCcOvdfv7gS7n5VIhVVnJcDkhTiv5v0+W/gf92zcOmqsqK73rtYGt0rERDZYTqTj0HwWLNFfUGmBVE8Ix4dyeFH/6A9k4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785943283; c=relaxed/simple;
	bh=yHwqUcaaA3c3v6yUCk/xltDLOc+PmZXpO6VR3e+3o5U=;
	h=Date:From:To:Cc:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=mthvANWDjKw8dqydDLcHuoOXBaKWItF1uEi5Yxalp46SsDjOVsWjLf7vITUlXMqVO69aQMm6BIy3130EH7Dbtir59ShG6U9bCk4kANpnGQNQhnvP4k14T8VOvp3f7i9G91bdVg2mXfCIP+QYNuvdW6Q+Sp4CL4EyNtX/gAR+OnY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=heitbaum.com; spf=pass smtp.mailfrom=heitbaum.com; arc=fail smtp.client-ip=40.107.40.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=heitbaum.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=heitbaum.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k7zT/cKdQviEct5VxoLY8g5PI6gClo3vnnAEHP+Z6vY/qNdrsfqOZDrrFlyJNfr6BTV5DxQDAyQO4JCmB5INWNIOPKhqAL0N2h1hQ8SdE+8XhzTHIWXYBqRWZvk27Pdb75aVWgei6xlpy+CvXxt9xz6PVhKeNGAi/cnXYkNo0HRc7MP9ePnYArTrNH+FXewM6Hhj6P7xt70gRs+UkqEjbd/WaQkeQIKqWvA+gZx83b9bETCWlGzXIIaGJT/7u+d7dfEikltZhWQmgEKr1qZiZdXdy51/5vtcF5uDcQZ9UAtNfXV4btVdsdpLneRkZ89zJ9QQoFO8TTolfhMY0+y2hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8NpEVwIFFvUOzQcOnReakhpiIXDhK8EmL6zIP1gkh/Q=;
 b=P+2R+3i+Wp64g9rKHb8SYgbE18wbXlCgBEAl+VdEWtjpkldLbbEloY1NOqY3E5dBqXoJ/gu0QCuFEzR5baXQJVMSTakvK3yERh2/ztiInWiPsxvwX0OHdsJhz9C1gXiAFCZGWQfN62iRlBpc3fbAUU6m1IR3wrC74WaeTEsFBB6FfEs5ae3euQNy6R6aw6/KNhsnGOJu5SgoUZ2GqsgZcHO3h/TJ/OGE5YX5FULE+Q2HiNSbxBN/YOtN7JniLOsfsOECzskJtZC/qd5D/fb7ieZ6WZ/0pCaIHpXzjtHSAkxPdSkiQRKILNlamcdGL+kbsfio5pzdfaWiPRF0S4gMCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=heitbaum.com; dmarc=pass action=none header.from=heitbaum.com;
 dkim=pass header.d=heitbaum.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=heitbaum.com;
Received: from SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM (2603:10c6:10:279::22)
 by SY8P282MB4595.AUSP282.PROD.OUTLOOK.COM (2603:10c6:10:259::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Wed, 5 Aug
 2026 15:21:17 +0000
Received: from SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM
 ([fe80::21b6:91f8:614d:1fdd]) by SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM
 ([fe80::21b6:91f8:614d:1fdd%4]) with mapi id 15.21.0292.018; Wed, 5 Aug 2026
 15:21:16 +0000
Date: Wed, 5 Aug 2026 15:21:02 +0000
From: Rudi Heitbaum <rudi@heitbaum.com>
To: lgirdwood@gmail.com, broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	rudi@heitbaum.com
Subject: [PATCH] ASoC: rt5645: Perform the initial jack detect at probe
Message-ID: <anNU3tOUR7rOReSB@5e001e58230e>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: ME0PR01CA0021.ausprd01.prod.outlook.com
 (2603:10c6:220:212::16) To SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:279::22)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SY7P282MB4909:EE_|SY8P282MB4595:EE_
X-MS-Office365-Filtering-Correlation-Id: 48642a1d-ed1b-4280-9a89-08def305318a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|18002099003|56012099006|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info:
	jCYPOMx6qIWV5aBHbbQ5sFAsFl8/BeTedNJz2jX9ujLEE1YDLV2/1pi+s81fOIJPyD7hecW9DTp5/zF2CQ6YecUJfRP9NsdKHi4RGNvXIyAwaIV698zr4qpG0Yxdx3WnIq/faGTzjxh3JfFG19i2MPMRVdD8LeeQC5mggoOcnatfdNsXh3RaTQ1T3xI24S/DQYUUPGKZPRGHWD+Vgx+CrayOHRqYaiCHLmAE7btkvcIYNbK9G5xVB6yAI04vjrV/cL7EG00c+rTg8yzqs9+eqTtZuvQTaeyj/JbcfTqH2XoXnSyYIgEp/UAMBte5/Ok/QgYBybwYzrVD2ylHoj07HvFYg++lDPKlMV46qWNLaf/elKMz8udRWXZfCx72xPtHC22E+KMVWw+jXKb/s9APwl/8nrOAajUhfGcJ//8QME8m6+mpmCq6AS7d9zr5w1rGdpxnN/4YDTWA6By4brdZ0VcdPapwvZ3OgYfVufivEDCKiM2boc9LiASWK+E59IrDhUlL+L+DRkHepU5JB2axQYToawQ6+GTqDn3BWUKCUFXta8QoTgHUpTu+32QE+t8VrJeLK15JmzR6F7Lgh8oE+vIHQprIxUsEK5R8iIH9L3iaqklZ9KyrfnbJOcstWxWrSVrD1kFqsnb+7oS8E5mG9vGAc6KD4AgwBuVeHAiAAG0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(18002099003)(56012099006)(6133799003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JNakymGFHktDPn6UYjODwvLTbo1r5Ex/2Y6BVoTmvcZYZmN3TAjl34bLNrST?=
 =?us-ascii?Q?aWM0f54QtQfJIXp9C7jnM8vb1R7WEFp5JQg/gMfIOBkUf0AxlnckupdogX8x?=
 =?us-ascii?Q?UEXOtuVXAh5l3RWwe1ovjVvdFCrjSW3ZHj5vfDvA6p+bZM22gQWxjxXRlyJa?=
 =?us-ascii?Q?GNYZra41lJqw5K6qWB0uLrPZuH+HUnvLYWjmHn69SIcPuan1mgy898ZjAmft?=
 =?us-ascii?Q?QUf1/yrttk7JOhpbhGL+WtELUcJmAFBZWF58naOGNa9NkBTZLz1+ccRVfbyM?=
 =?us-ascii?Q?CVbAjxU68DElub6KAqhBNV6YseI8qay472VE9A1dsDLpchO+v1l+RtgPcmBE?=
 =?us-ascii?Q?qUmZI1YvNdY8MgZA4HYUwohO/2oUX6mfmSf5nOYHL9CnqrkiUjkAf4spzI/G?=
 =?us-ascii?Q?m5y8HYx9wYNTRiiX3aGHxr9oNjC3P8TeTFhW3gT2WmY7WUfMG3HKFdmylgci?=
 =?us-ascii?Q?EYj5u5J5U8xdNbm+lpVs+YXeRMNhfDzRlnvDfJ/TZKQyb+hWUipXeEPr/tHE?=
 =?us-ascii?Q?jOcKYZGFnqFKhZ3KyiMkE+UBSSAU7YTGUC4lAJfw1ZNOUc6PFSlpoa/luE2W?=
 =?us-ascii?Q?nV8+JNTI1CsQ9XHSkkXhxvD3YkbRpX1XsjXbDaedBCs4JlnKDnoOeeGYoFCK?=
 =?us-ascii?Q?Mxc2CSiGT2hJ0PeTz53rCJ0NTlIEPXIPjOv1Cxd7fMJm4GCPOUTK9+7V7wgm?=
 =?us-ascii?Q?qIWn/Yywo+aeIe3e4fa/OTykEj8315rCSvKBmekrarpwHvLEkxhRXIt5Y27+?=
 =?us-ascii?Q?tqUSQBFmebxjc0rYkLZmcoA5ZO7jNrhQG9PqoktGxymqIVLbaTDFyjiBrn0J?=
 =?us-ascii?Q?HioeJIg2b3IlSxUQOvEe+egkgZF2To4L1as/61QPff4CTMskFnRlB4QAmCYd?=
 =?us-ascii?Q?jXANMtdFmqjzw/rJyScB0fZYm6PzzIWEbC/oAZ5F13qQuSkiDi7I5AhxQN3P?=
 =?us-ascii?Q?wUDrFagQD2NWuDzB+SShntlqkZJSKvam79ilHh+Zosu+OROzj4UExeUCGeh7?=
 =?us-ascii?Q?+d/51002WxCG/OHB+5rU+Y+U8aMBezvwAG0kIVyNswT6qvtMmwKe45rcG51R?=
 =?us-ascii?Q?9/b7AuQizS/xYEv1taGozt1RtEKfwRvCcz852/1UnzSOBUGWdjGB9OaBZrSp?=
 =?us-ascii?Q?vh4FvC23sGFNcGWVW6TePLnNazFOYiPjIM8+99A24dHQLo6fZDjemp85B18c?=
 =?us-ascii?Q?4F8g4eP0rNsnaOTW0GZx+rAt0Aq9hUGmmsYv3zRx7Wpc8X6aCkvRo7fnpnbb?=
 =?us-ascii?Q?K0mkFZP9sLg38Oo/FgE3tlu0h85QM10oUdZeHuJbH8wR1C1b0EfSSZjmB+YG?=
 =?us-ascii?Q?PCnQJDywLKVXNMM7gAYWIIzaUQKDWJOyNY/AuJ1dbDWJJg4uo5iAqEDbEfhB?=
 =?us-ascii?Q?AbV1z2KtbtW6ukAZUy+QEzBfiWsU9oouUMuU2lFTnqp8HSLjZU93ikKN5X+i?=
 =?us-ascii?Q?Q46cvMtVeA/N4Llsg4hpbSBZs+c0Q5TFKGTMao/lMyVkTKyh0s1lAl/EcYzB?=
 =?us-ascii?Q?MeaKek5nZ0kbCEIUmZaK7SZ8C43zgjCwkvIOu+4AKSRFsE8jXi+5QhBYigJB?=
 =?us-ascii?Q?PlJ7MnaeycbO0lMhBhfSnPa7MJjyYlqMIrM0oL7iZXrvY5nFkyJ7qrw2J2UW?=
 =?us-ascii?Q?2Ocau/JHGXKahJtFOKZn/nR6PLrjmCc/qZP2RmMg7s6cUJca0qmIFxcmtLKm?=
 =?us-ascii?Q?zd0c5Hv8O9vBW5XC8Qww5u4c83LCmEGdDvo/0b1CGr2Qp4Kt?=
X-OriginatorOrg: heitbaum.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48642a1d-ed1b-4280-9a89-08def305318a
X-MS-Exchange-CrossTenant-AuthSource: SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 15:21:16.5897
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 35ffebb5-7282-4da6-8519-efab29b0108e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oLhMtxKMqBEZW9qBUDkUA4q8/Rxe/fu91UFx/9ATSSAVXJPlQGx96PJxUJ7ArbuOGmgAYvWhyvPiFuymr1a59Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY8P282MB4595

The only initial jack detect is the rt5645_irq(0, rt5645) at the end of
rt5645_set_jack_detect(). A card described with simple-audio-card has no
machine driver to call that, so jack state is only ever sampled from an
edge on hp-detect-gpios.

A headphone already in the socket at boot is therefore never noticed, and
the card is silent with every mixer control set correctly.
rt5645_jack_detect() is what force enables the "LDO2" and "Mic Det Power"
supplies that the "HP amp" widget depends on, and what programs
RT5645_CHARGE_PUMP away from its reset value, so without it "HP amp"
cannot power up. Unplugging and replugging the jack is the only way to
recover.

Do the detect at the end of the component probe when the driver owns a
hp-detect GPIO and the codec's own jack detect is unused, which is the
case that has no other trigger. A machine driver calling
rt5645_set_jack_detect() later just repeats it.

Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
---
 sound/soc/codecs/rt5645.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/codecs/rt5645.c b/sound/soc/codecs/rt5645.c
index e9819653b30d..e7e39671a576 100644
--- a/sound/soc/codecs/rt5645.c
+++ b/sound/soc/codecs/rt5645.c
@@ -3496,6 +3496,10 @@ static int rt5645_probe(struct snd_soc_component *component)
 	if (!rt5645->eq_param)
 		return -ENOMEM;
 
+	/* no machine driver to call rt5645_set_jack_detect(), so detect here */
+	if (!rt5645->pdata.jd_mode && rt5645->gpiod_hp_det)
+		rt5645_irq(0, rt5645);
+
 	return 0;
 }
 
-- 
2.53.0

