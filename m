Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazolkn19010001.outbound.protection.outlook.com [52.103.2.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D423E3BB124;
	Sat,  1 Aug 2026 18:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.2.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785609274; cv=fail; b=PxX0ud7+iUG7Z5CkSjBslCpjzaQGxhu3q4rQf84lcrWIDFRbazD3rx+g7iMycA8SI1/VzcPzPoPkNl8x/qaMVv/pOhmQ4geH6twBuYGzYFKG8SpKuyHWMQW3D+Eg8SAosO9pGV0PE5u1XZfWCZQViFTZXRSOjjqe2mBgA/U3A6M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785609274; c=relaxed/simple;
	bh=ksh28k1r6Kx1DCSFAdQfbUEpkBFAi1qsgRHOa1vP6A8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XjmpliHvoPGypm2IMAFrvydYyqXY2VdsNGff0tScOJzYgnujv+hW2W3AC6APzuMSkDhpqZY1X9bBGPf+gReYeV6EgipcYn4I9pqLSyYc5U8XaXvW+aOOXzg5obCF8qT8stIh2Z5ciXKowfKiubawPd3OhCJ/4Wt+qSLgNul32KM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.it; spf=pass smtp.mailfrom=outlook.it; dkim=pass (2048-bit key) header.d=OUTLOOK.IT header.i=@OUTLOOK.IT header.b=TUeeQnIc; arc=fail smtp.client-ip=52.103.2.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=OUTLOOK.IT header.i=@OUTLOOK.IT header.b="TUeeQnIc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gSNcOiB5P60dCui4CJ/uEbejfjcPZzQRC31DBs7h3pe+hvGL6v6W0WB0huK/XUrv/J8d/HKVh09Ng2c5n97WeOkGQQGg8phlWa+nPBvuz+FhXl4+sFieQv9IU/Tt7j6c9/RELJJm3bATkX5dz7MQDS1VfuAlgXy1sHd0LqjAkgtYwhgi9dmSLZF4bFSN0Ks0v3FjpDBhGaGOjs+MKh/ZkRQ95+Z1b8llqbNc9XW0Tinu3g+v9Nke4/IyVSGBVjmzZY2n896XQJBpGXgBCUb/FUNw7yYFshoQd4LYevtzrXZ1xZ+Km5UeABxNOJlKe2yP/dw7JDK65PjDc9/NZKp6dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/jscnSh14m8zG+HChtsLsUDzkQMdN2gWRIaw78xM7Bs=;
 b=gGNw3BUB1NFrvPxVoJN3/IA6YCeMO0VKIPKD/pKFvM78+b5QFpeAGU7lc3KXWMSpxfpr4nxDkJlLOU1kfCPX/xS6ZWsyp/YuI1Awv0siXM8JeEh9dK8nXCb3rQ6M9EAx4LZscXLcD0FJNtuBHlQFyPQj1ZkHskxvwU67tGgovFl4iDGyA9X8yGytsuWxkiAdUACbZ4cTX2yRbPX6kzb5AGhx9DkQqcV6UjkIM5xv0ZkU0WligTWUy1ZRztew0ze982dICbb7qV1eHsl7ssyN9/suFgO6GdRFCmW7/CZ33sEaqhrWYyYYtiLLxbRCAHUyQI72+ev8r/Sa3uGEptIfyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=OUTLOOK.IT;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/jscnSh14m8zG+HChtsLsUDzkQMdN2gWRIaw78xM7Bs=;
 b=TUeeQnIcJSq7ocxzAL0c++5GAcGLtbAkWc7TpT7RVo97kGsmN45PQ3Ig1rawilTzYt2tSpRuTocGu4YG4ijs/E+8hR8MMFY62onxisKIxmTKh1kMSZU8VeqeNM9vkxV4FUPnWmswZ5KMk2lqdcAnglSt97nGzJYrlhSRBDTRXYUrgThgNZ6GzdVHmQoLazJkTGmr2Qja2A2KX3nEZeH57g9pzT39ZdZgFb/aBOr+MBTCUN9KTmUfKYJn6PUeRZFFwfxqnGOpTAUunst7hTUyA5sDVKCHFjw8C0UvKsYzYSfclV/88jGoX2R5BsrmErmqQysuE/VgXLRO+TlfChZtwA==
Received: from DS7PR19MB7724.namprd19.prod.outlook.com (2603:10b6:8:d9::20) by
 BL4PR19MB8879.namprd19.prod.outlook.com (2603:10b6:208:5aa::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.16; Sat, 1 Aug
 2026 18:34:30 +0000
Received: from DS7PR19MB7724.namprd19.prod.outlook.com
 ([fe80::70de:3c05:ac62:7f86]) by DS7PR19MB7724.namprd19.prod.outlook.com
 ([fe80::70de:3c05:ac62:7f86%5]) with mapi id 15.21.0270.016; Sat, 1 Aug 2026
 18:34:30 +0000
From: Marco Giunta <marco_giunta@outlook.it>
To: mapengyu@gmail.com
Cc: damien.dagorn29@gmail.com,
	kailang@realtek.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	marco_giunta@outlook.it,
	perex@perex.cz,
	songxiebing@kylinos.cn,
	tiwai@suse.com,
	zhangheng@kylinos.cn
Subject: Re: [PATCH 1/3] ALSA: hda/realtek: Use AW88399 I2C fixup chain on Legion machines
Date: Sat,  1 Aug 2026 20:34:18 +0200
Message-ID:
 <IA1PR19MB7712F02961FF50333D5055B5FCD72@IA1PR19MB7712.namprd19.prod.outlook.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <CALSz7m1PvKUrYvdXfQdA01gfZPh=1eW+1n6HTkxzmk4azn6CHQ@mail.gmail.com>
References: <CALSz7m1PvKUrYvdXfQdA01gfZPh=1eW+1n6HTkxzmk4azn6CHQ@mail.gmail.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MI2P293CA0015.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:45::9) To IA1PR19MB7712.namprd19.prod.outlook.com
 (2603:10b6:208:3db::7)
X-Microsoft-Original-Message-ID:
 <20260801183418.23067-1-marco_giunta@outlook.it>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR19MB7724:EE_|BL4PR19MB8879:EE_
X-MS-Office365-Filtering-Correlation-Id: f40ece37-7bf2-403f-668b-08deeffb8501
X-MS-Exchange-SLBlob-MailProps:
	+bEufbke4JdvqmTQng7ItjpfaCLJSA3utaJpJo4ESnYCRomGYHzvs+RnlD0sW3OGsuabfbXxdaEDomzOWZqRNereOInJLUWuDpyjHIW1kM6gbTOD8jn19q5yHPkkqCb1sqnhyNur88y90tR0CgCpjV92aC5yW1BJw1yl6eMsiSJyCL2Btp3pknRohWZiK+5WNzwAfFJ98JMTMCPBp7s/nIfj6OycoRCX3d2WlwYZsY7hXkfFH+1dEIDSEVWf/QE3w+XPseFhT/lHkMFxZx4n+Pdol1GNNx65G8pQ3q116wq3P7C8rhxhipBFQ6afkubnUHkCDJE/MIiE0cjD4B7ZFCMzq2EQeVoTUlNCEdWGTAMvtBTPTvwEQ9HLT0CKeP3YeULFunbWy2HEG98Fw+kE9uXSiTLxuHwS6P/5Y3G4EZdrtJawBib/Tllmy/FMQZJlGsn28F4k0R0bj3BVEL8JJdzc/DrJdQcuZRTWyQm040DXr8Us8JqaFhJyMuXeF3w5Hj3BFCz4UEph7c/AglzcGtimNzqSq1vQC8FKIdSuKeaCQbMJYweYpI/nYNs2Eo7rWm6f1XDCdnxCLopMb1hemm+MoWFwtrDYHbOCjOLKm9udegdIikait9FbaOS3HPlBsJF9XJZDxX7R6ng2gj6a0flQ1nI3Gvobk7tfnqiHW6GaaY0ZMS+fRBdLrposxAj5QQH0FM/nwsXf8e6q82vZdahTKFbvJ4oWLrxwY6auZ+/d94pYllW2E9kP4epi9ux6uWk0OC5lkYnu9+fEU2WIOg==
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|25010399006|5072599009|51005399006|15080799012|24021099003|23021999003|55001999006|8060799015|19110799012|3412199025|440099028|40105399003|2607281247196008|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Mxd975+xnX7KXVGxmLncubNVAR7SY7m0LAU4dbA3eroYxBZKmwUsADdCDcKj?=
 =?us-ascii?Q?i1jKrI6a1upReoEuoihAInN0TyU7LyYG3EyjIdC+tvBYetlmm7uaJqtaF28v?=
 =?us-ascii?Q?h0BWQhNLQgGgb0svS18Kuh+6+DiH1qbYoYLx69Okzdc8tGMDiPnePMT/kUrb?=
 =?us-ascii?Q?7Z7uRVvU10YBt8sjfrwgid7Twmz0cCF8FvJgPV4Kbp0hFZi8f6gxmxbucnAm?=
 =?us-ascii?Q?9Jm+gh3vjdnXsUzubY1UKmo6b8xuwdFpj5YS+JGwc2ZEi2pJAfon6xZisvwa?=
 =?us-ascii?Q?uVDQoF7AzkyE2XOcAdfHzPAmDUtEJSB2Yn2cfkcs8UriMvfFvAGuxwbajkQS?=
 =?us-ascii?Q?YltQ6LLK2UxsSAJAaeCnefkwlE7Cqk+LXUIqsYPg1HrrDFQ9XJWtpUSB7GY7?=
 =?us-ascii?Q?GtRq2+8p9ZILrxy8hmd4YooFTzxuflRzfqdYZ+gqJ7zB7i22nM24buh9pDiv?=
 =?us-ascii?Q?BShZ3DGYf8oVje2AfEoWh6kpnb1BMRz8dC0qt/yzhvpkCmfx+r8yep9GrVc/?=
 =?us-ascii?Q?vxpnQ30ttjP1oGQ0gZDg/Vutogb3nsjnOKs7zwzmkpPT1Gmo3xXcm+z+KrJb?=
 =?us-ascii?Q?m5PUkr0OqReg9hvAXqqXI/aiVf5wcUjOB1ve+ODoag6w7DWPB8A5eKSxAYpQ?=
 =?us-ascii?Q?IXTQ9tLh37gpxVSzCDS5Kp944ts01knrHnPzNMIBMpUrjQccEqW6ddhKr+tW?=
 =?us-ascii?Q?5mKp65PgkncokTrNKVBZ+xHXzWkIlHcX11hal9YXjoiKqtvC1ClSodrK28ux?=
 =?us-ascii?Q?+YK4bYl4igLPg+Vg3B7TQ+LkrjJpUpdfKaxd/iwWnkHWA0Su6JL5Yztp+Qaj?=
 =?us-ascii?Q?Tx0FxzvJ7uD635MKdrPEOd3MbAf7ULJ/CjZvzBPLFFfRXJMq8owd4fh53GHk?=
 =?us-ascii?Q?bDlSic8VuUIhavoyVnA6MOyuGx3uU/STpmFxlM7O6Kb/cZIv8KD54FyD1fJA?=
 =?us-ascii?Q?zeB4sQShN+Flg9g4Hyz8my/npY/YRAmQCjqM4/lpttjygl1Gf8AmS9LKAvl8?=
 =?us-ascii?Q?+3wy?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OYLgci0whh7j9WoZ+4wCY19i1j9AQgOkHOBxv0NCi94SfEHJkbxdz/N/BTTB?=
 =?us-ascii?Q?q3+LmiRzxL/b19NOGDp1y9tLVZzw3sDF2b//2xewuS/7jiHM8VesXUonPN2/?=
 =?us-ascii?Q?XBL9Ydkth5NuNAqzU6QCJIhCelaN6JRHCAKyej41LiF+Rbu4AQmNQKR1/dk2?=
 =?us-ascii?Q?Z4kLWMf9GpgnlnVKCheLDsQE8mFZ9WGmHOoUrctYXHVQs+b1UgKYlKNZJSA5?=
 =?us-ascii?Q?CGKTQ05XpZM7x3jV+ratjBmyLZJMWJj4BE8vnWlcAuMwYJdUT1eU7H7pwiDs?=
 =?us-ascii?Q?eXCu+NmJodV7IM4igtPCuQzVqx6PN4CUR6trg62e9cebu2p1FDx/oOTP7EO9?=
 =?us-ascii?Q?p1cd9RMmnujyclLWJdNRrX/aH44/aLhm7xo/JHZ+Dk7MwoXBSkSW2nVOlqWc?=
 =?us-ascii?Q?CA9Fgdg/QLAgrBPjF9MDA+uZQ7J8BNESAsj7YXkulQaGAAX/guvnoVhC//Jo?=
 =?us-ascii?Q?BAtKJ/gIXUdSWbHoUATy7hNFRCcg4nzAUN5Pet2xVml1a378a3H2iFv+OBvZ?=
 =?us-ascii?Q?nETiGlFgdyZoD+La/bMOnImtaq3e3AqQtwLzODBZZ2S1IvD58WjgASNEDitu?=
 =?us-ascii?Q?KD4Xd64XwmqENRz1RWoNDXSxbiBQEMaBJE/CFfHRXkA2grarCUKAe8Fuxv4m?=
 =?us-ascii?Q?BhAdInqeRfcAC4dKLo3u2CLGxOMhTh5SUdr1t2S2lsxKeBP4f/vzZJ0PQQl6?=
 =?us-ascii?Q?ml11OANzRH7wtahzNqT9FsbqjS+g7Bp8TyfTA3JwjNyZhdonF7tkLr21c370?=
 =?us-ascii?Q?O7IriAkKorCMPHrjge9VE+Lo59AGc8zoY1Q1SFFrVUyA25kALFo6r9zqZbYq?=
 =?us-ascii?Q?z2ZgDjhB+P2CdDscLeQRxsevEzQpc3dNwMnGh2bm4WogvcPsZ6K7yTdmnS0G?=
 =?us-ascii?Q?/P7TsetrZvPrvMGYEYRtoiA7bTHLw2syfDDWJRgdI6uC8u91QkAXogsSNq1+?=
 =?us-ascii?Q?lpMkK+th6qlev8mIo8cdj686oi3g0v7NIZe//OqhpQPB2YnzsatG2fH1sw2Y?=
 =?us-ascii?Q?Yc88GZKcHw3GUU+SZAmTApgl1Y3jpnlghBjP9+WI75VcwbTAl7XeRLi+C+47?=
 =?us-ascii?Q?4lJF29nX+9sZKzW3ripLau+gIdmygDgZOlRnHgAwVyUlW2dQH7Un0y5S7nRk?=
 =?us-ascii?Q?01a1ZwMCcCSfROeIxBeVYIYTDwiLYKCC3z6ZgjK/cEsFTbfV0y0Ydd+rabgs?=
 =?us-ascii?Q?VJw3gXQpCBt+4IBdayqzA9jk9ybQcG9hzulUuP/9bH/hDOEJE0QcXJwSgxf0?=
 =?us-ascii?Q?7waykZqesf/i8Ferc0KBKQ/puHF9X/kjqyfhNKZEsbYWVGT/iI/P5EQBQm97?=
 =?us-ascii?Q?S8b96ni8qa7PPwzJFZNghQZhi6X2ux5KtC2oBBGk4bUrBTzyH9W00yZn3VhB?=
 =?us-ascii?Q?0yWPIjI8pHeASfR0ziVpvppXUASJBxGSrVp6WXv/Lrj+o8zQbnU+dSsvcOE+?=
 =?us-ascii?Q?d1slhfXx1xU=3D?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-990eb.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: f40ece37-7bf2-403f-668b-08deeffb8501
X-MS-Exchange-CrossTenant-AuthSource: IA1PR19MB7712.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2026 18:34:30.5085
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR19MB8879

Hi Aaron,

With the added context from your reply, I did some more testing of
your patches on my Pro 7 16AFR10H and I can confirm issues 2-4:

* With the current upstream code, plugging in a headset locks
  the mic to the headset input and marks the internal mic as
  unavailable/disconnected. Your mic fix resolves this; internal
  mic remains selectable and functional with a headset plugged in.

* Headset inline buttons (play/pause) work with your patches but not
  with the current code.

As for issue 5, it's true that the "SKU not ready" warning is caused
by the 0x1d pincfg override, which, though harmless in practice,
I'm happy to drop.

These are real issues that I missed because my testing focused on speaker
output and basic internal mic functionality, not headset behavior
specifically. Apologies for that, and thank you for catching them.

That said, I still believe the correct approach is to add these further
fixes to the existing Legion-specific chain rather than the generic
AW88399 function. Would you be open to preserving:

	[ALC287_FIXUP_LENOVO_LEGION_AW88399] = {
		.type = HDA_FIXUP_FUNC,
		.v.func = alc287_fixup_legion_16iax10h_aw88399,
		.chained = true,
		.chain_id = ALC287_FIXUP_AW88399_I2C_2,
	},

where alc287_fixup_legion_aw88399 now includes the DAC override,
mic boost limit, suppress_auto_mic, and headset mode setup in one
self-contained function? This preserves the generic/model-specific
separation while incorporating the new fixes.
More generally, I'd appreciate your thoughts on my comments on the
series' architecture, as this affects how any combined fix is structured.

Regarding the DAC routing: I understand 0x03 also has a volume amplifier,
but 0x02 matches the Windows driver configuration and is the established
pattern in alc269.c for this exact codec and pin. I still don't see a
practical benefit to routing 0x17 to 0x03 instead.

Regarding 4.0 channel maps: I remain unconvinced this is useful.
Even with speaker-test -c 4, all it achieves is the ability to play
tweeters and woofers independently, which no real-world content or
use case requires. The correct profile is stereo 2.0 with both driver
types playing together.

Regarding the jack rename: I understand the symptom: GNOME prompts the
user to choose between headphone and headset on every plug event.
I don't see this on KDE, which suggests it may be a
desktop-environment-specific behavior rather than a kernel issue.
Is there a reason this can't be handled at userspace level, rather than by
renaming the kernel control to something semantically incorrect for
hardware without a dock? Alternatively, can we find a different solution,
or more simply a different name?

I'm open to collaborating (e.g. with a Tested-by tag) on a v2 that
combines your headset/mic fixes with the existing DAC and
architectural approach. Would that work for you?

Best regards,
Marco
