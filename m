Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazolkn19012063.outbound.protection.outlook.com [52.103.2.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E94E23624A9;
	Tue,  4 Aug 2026 13:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.2.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785849634; cv=fail; b=SCMIqRv5+xWF1dooKaW2qfJNz3G04Fa/K87eLPszPhmvhBci/XYr+jx9xAtoPPZxND8+iLMQ5o27vXwGW5JdqTMPxGSVp1eKLpaqzWKSyJ5TLpdb8M4xN/+5hpvzO5nq3pYgkYYroWBsnyW/MsnYWnNHjBkAUMVVymCcFA2DR1k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785849634; c=relaxed/simple;
	bh=LoyutZZTqKJojhtDEDoy/7c3BEwRhklOIJxj3+R3woI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IJVY/bC4u/RGSnyYAbGDjrbGeshjr0rkbiVdyc9sW9+N8S0GFRM1ncFsGcxEkiwlix2WYY9doGYoGVtlWlTL2SBYZfIu0AiuiKyn0aZ1+3PVRYpE3NKRBCxQ6KpFpFtfCthKkfTbdfC715x7IZXhuZVzecYIwIpvCVS8yqlWuPo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.it; spf=pass smtp.mailfrom=outlook.it; dkim=pass (2048-bit key) header.d=OUTLOOK.IT header.i=@OUTLOOK.IT header.b=fNPro+qm; arc=fail smtp.client-ip=52.103.2.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=OUTLOOK.IT header.i=@OUTLOOK.IT header.b="fNPro+qm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D/hf9iykmNWdTGmDfgtkJnH2Cr2VyUQVoeiWiRo1kQ3OpyfVaaivBVxxmZKH+ROqLqXCusrRGGCGeG7humlk66JUFnb7zYIpAX70sFP3yUcPbW5IVpC5z499FE0uE1w3B4TOLPKBPNFUzVgrZD8C5VB5gS5wdJLk+IEpdYKZibNYkl1TANVBUE84ughtrOdL4v1W0vOQ0suEVw/cZspE1nY1NhklSMEIcQOBfEpAPlvl1N90OqDuvci50sQDfC/R+HJOkYp59u5RQ5J00g3iTVs8Ex74f7QNjWeHmNrTCQnjcZI62gaUpDaNyUUQcCctLgwXKvgNicgDmEGtr3KJ4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OAMweOsKbGnaFxCyU6xmEPvj6XMLBjjqULwRxJqiml4=;
 b=p7+iB55FvsXm/nRkZSypDnJYOSX4cAcIi/UuvjMCzBZHwoQaFijMrDOfvgio5bLu0gxdSDq/+21i0dnpQM4kvhKcFG0MRfmeqdAGCpLCa20cUdn3FUagd6uO89hx+9PSuFAX01prbqBlQIXbWwT0ImCVcL/LTTWjniE3cqo406h/EBtt/j9HPyD2br4foWgClRgE3huxIqp20oC+B+ZB9vGw+EWS3f2qd/a3o1cHSu6EFYmwVyi0p5Xq0+HqbU3pdXlLzURnO4hdfm0obEg7usCqU3lzRMdqoujTvU6nhokoA0fY/XTACOv5WsbF8BWeHCnZ1XkSDtg6UdngiB+Q7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=OUTLOOK.IT;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OAMweOsKbGnaFxCyU6xmEPvj6XMLBjjqULwRxJqiml4=;
 b=fNPro+qmg8krARwwcYZ8S4tspTtVqzXZzPvQ0ZpLR2VvHFDkeLUTa6RGqHWjDVXKDotHXqB2fTm5LCddiiaQu3jQJ9SgXStmOuTa8v7Y008apV6HXBccD29Oqmz0sPkoJ+4mgBm2tr9CMgM/9ICerg+yDkOTtAKEJE66F8LZLYZSZ5lZVKfwRiCA2idh5JvilsIJ0iSOz3Wg7PKYXmF7eO/4lnbqrYfUmgoqZiUpa0hrbAlwpNCexiEPArf+aeoKvTCtzqhQTV47jqQDlLcsT6eAbMzbVqAnpmgha6aIh2rew+DuvVjusXDHtJKI8fZ4inapUeAIdtZu3rnjN+OrzQ==
Received: from DS7PR19MB7724.namprd19.prod.outlook.com (2603:10b6:8:d9::20) by
 DS0PR19MB7515.namprd19.prod.outlook.com (2603:10b6:8:14e::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.18; Tue, 4 Aug 2026 13:20:30 +0000
Received: from DS7PR19MB7724.namprd19.prod.outlook.com
 ([fe80::70de:3c05:ac62:7f86]) by DS7PR19MB7724.namprd19.prod.outlook.com
 ([fe80::70de:3c05:ac62:7f86%5]) with mapi id 15.21.0270.017; Tue, 4 Aug 2026
 13:20:29 +0000
From: Marco Giunta <marco_giunta@outlook.it>
To: tiwai@suse.de
Cc: damien.dagorn29@gmail.com,
	kailang@realtek.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	mapengyu@gmail.com,
	marco_giunta@outlook.it,
	perex@perex.cz,
	songxiebing@kylinos.cn,
	tiwai@suse.com,
	zhangheng@kylinos.cn
Subject: Re: [PATCH 1/3] ALSA: hda/realtek: Use AW88399 I2C fixup chain on Legion machines
Date: Tue,  4 Aug 2026 15:20:17 +0200
Message-ID:
 <DS7PR19MB7724CE7E55EC17D2B2E61A9DFCD42@DS7PR19MB7724.namprd19.prod.outlook.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <87se4ui0xq.wl-tiwai@suse.de>
References: <87se4ui0xq.wl-tiwai@suse.de>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MI3PEPF00004E96.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:298:1::446) To DS7PR19MB7724.namprd19.prod.outlook.com
 (2603:10b6:8:d9::20)
X-Microsoft-Original-Message-ID:
 <20260804132017.7753-1-marco_giunta@outlook.it>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR19MB7724:EE_|DS0PR19MB7515:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ab0b96b-dd2d-4095-31c8-08def22b26ee
X-MS-Exchange-SLBlob-MailProps:
	laRBL560oLSPhlJ95/U7v6W/AahuugGaWENZsURK1cfCbFH5R7LXpN6if03FwSaTpJDhBIn3RuaWBBgZfZArRtf8v6+bspPwmXJAxUDH9ZcPg++IOXVbuJ+z/b9ci9Cf6/339fURcX82LtOVuxwDlrBT3/YkUSZRTcCUcIsL12gleI9rzKwMKNrZCFNaDlCzPYyjkUEO9pHNwOJzwAZNlz7oHBdbyusuUYvc7dBrUrqqb/NABPvgC08QWcJvbOzspcFOwDXH6yxm5b27CxleeegUa+G9Q6wasq2wh9JeVZlo2goDoiR/YUEK3yZLNSKCjr1eEkmFRwtoFO6DhrBIJs5sJvunEgLH0BbyXZBub9zqldx+XxqMUxCKn7gW5csBYf4Zf3EQRrEqegW+giUPaFaikiJkkAHoow1iQN8KUTToIScZNIIGNou2Qc2YNyDO3PtvyF39n8+Qy+UzUjuSqbelZaJXA+S1W3EO9yyMZk0NR3Dy6NftBPR1DM69fm45E2uaPsnv2FJMso1nDk6pU+gsiUEBYRKS3XcVs3T0kyc+hhWBz7Du6XJE6Kw+Kiioj0Ia6EFm9VozXeYn3TiNq+5i8zNsTcN1u69YqVcy+P/HDqeaqFxq6i1Sbqg93gaURtN2QU6vMD9DOa0oN0gGjBOazlx412h8tBW3mUWfMJ5ONVigIZqPpR8ITdTSNMks57t8+rH0ZpW9u3IT73FztNRbblXmMUhlAsvWqpD5TxZ26wkV6/0kEp88NIfpL62sDg3uZZ6/L1ugJ/zWYCJJndYZ+7XvJ9el
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|24021099003|55001999006|51005399006|25010399006|5072599009|15080799012|23021999003|8060799015|19110799012|56899033|440099028|3412199025|40105399003|2607281247196008|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?S0FJlfgkCQ/xKj4z6TRC2iLEHE0sh6mZw9oDOTmoszp6KSTkanQxFv6tLK6x?=
 =?us-ascii?Q?sq5vCEY3MrKgPNzMG5toZ7+IlIXndMsQ5OOEXx0tBXjHblhtlqXLjblHOvmt?=
 =?us-ascii?Q?ngGf29MWvgCP0Vqvk+2Y/dCdXvE9gMD+heEDZDLaJiRxnPXigXSqxnqSqCwH?=
 =?us-ascii?Q?azVvBLADJV/biPwUWXC4ljLfENQbd96rp51eXKGnqJ7TVTIJc4CNiqCW2J1H?=
 =?us-ascii?Q?sW1pjRagIKYl/jpTnxYFKwZJWt9igQ0cX/KGthJHvA0A3Yp9kyDgUMNuV0TK?=
 =?us-ascii?Q?j3N/MtS+x0jkGBA2SQknLfZyNyLtePmCaMazBOVgisFt4kk58aZKXddw1B/V?=
 =?us-ascii?Q?pii9yi9foZMncL7SLzESIRczauUI1BOl7hGbJZLKPXJAx/IQf+kIzE0qZSxM?=
 =?us-ascii?Q?m4sKUmfF7tjegJhQEdtXiibImr7Cxmx9WUzDxQEPep2/WA4wnivBC7vVaPiV?=
 =?us-ascii?Q?5FN+beLSe10yuyWi6dEBSp/Dvz7McUJTKKAEKwAD6B17WGta3JnH39Zu0LAF?=
 =?us-ascii?Q?y66LxCL5S9NJfGYAGH6DAThcjNsXhixQ8GOGk3R81d/AwZ1wdC/SI4YEnJRY?=
 =?us-ascii?Q?Aj6AtP0dF268wz+7vorz3CRl0K5481OlUlXBIcg7PJZ+IhDBC4fa3MmYzPwN?=
 =?us-ascii?Q?ITrDjESHEwNJT/3fKztwspP1DwQk482VYKHA1FSX2smTXLPAeoi1kDjEZFlT?=
 =?us-ascii?Q?bsgvcd5vZ5zgJIusTp0oIvIGnWl3jr/6rDXHhk8zehOZl9pr/LRPoWbw2YhX?=
 =?us-ascii?Q?I789e9C4zkT/kh4PswPHwG9rHfxa3FxPQooKY4tC38Z4kImHcIWuUbwNy22R?=
 =?us-ascii?Q?peg6Ick/CenNSbFaWvOmEfXhpJ2Q7zDh86aKlODp5qj/N8suq9Pli2N11tZa?=
 =?us-ascii?Q?OkQyZOXq3N52dZmmvz5WRFI6NvCPliVuvlDDvKNJryf0iNsVeSG4TqXoXBtk?=
 =?us-ascii?Q?QVEKtfsSmDzE50w4+66L760ZA69yLVbZQ6q4oRI3pjcgkSzmmNTewdbvJWOh?=
 =?us-ascii?Q?pMqI?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?o6lRhkxBg0rJFRXwp25ihDRbH5VYRO9E3QL/aeVJcPUC/yGra0PVpq2olBSY?=
 =?us-ascii?Q?u+toe3ZBle4Cqk+zI7JAmWEb0JuDDklv5g76FCCKjvgjIW1yWLHfPh1G/kFf?=
 =?us-ascii?Q?FFxbzo/PY2Z3Wh9fHGTKe6SYK2X8lh3DRU/SjaNi9Eu841/aJEFctFVOhycZ?=
 =?us-ascii?Q?0MTNlcE0ngbWbYeCchIMnqbT7ZZkHxo59K1pXFCGSohyXhJ5F7fQTVNMl0Mv?=
 =?us-ascii?Q?8Ez3FYqFk0caGBbXK0EkKZkJ5d+C2gF0j7UiqfQb06YLfue0qtmthuSDDYwr?=
 =?us-ascii?Q?+ufqcgXWi4ujMShAh9tvc01ZB68VysCbhspjn1aO3mQ8r+NHiFng7LCbuUR5?=
 =?us-ascii?Q?80zXGTs9ekVqkVQF9J7+OfklY2u2DWx5IqY6FSJWNIXBUVaXRjeOFvz00PJV?=
 =?us-ascii?Q?O6GGi6HRmuMdNYds0eOZP53Q0IAb3zCPXXRkcp7cmhMcW8nCQklIOq7Wd7B3?=
 =?us-ascii?Q?oaRW708DkCgP7jzeQ9KG8baf+ER29yj9lBtwmF8RQIftrjj4+O/U3BrANJyl?=
 =?us-ascii?Q?turk3HPkTXw3erQULrs2J8EnuZo8pN0snnTDamEXu4iVdCDynhdHj72TXpLh?=
 =?us-ascii?Q?XPd8tnhRYUkqZnOHyvqFrAXw+sCV0nFuYIVTwNUxe9BBKwIDcRzbc0rJBefo?=
 =?us-ascii?Q?0d1RKogwk6rbbE4VJTJRK9gfdeUd74d7kd4HWN3nX4WkSxylu5d0TVddwmcD?=
 =?us-ascii?Q?plWbaoo18BprKS1TXsW2FnXOilLyjcrLrgXqQROjyuSZQ/oHAUGbRgaTp1le?=
 =?us-ascii?Q?MWlJoEHSPcxjPKYib6UROcwgA2ssRj/lggqqvYK3puhxwpP2MIiRuxpLZAZ4?=
 =?us-ascii?Q?Jhh7poTrvl/+yfgEOcA52dtBeP7Xz3et0xTeWzLNlWjMXjBC04TJpXLgMaVQ?=
 =?us-ascii?Q?/0kyWukMGlL2e3h5zRoICc61ZecNLJmAT4jnhmuVZlpCEvGALakZtZWpd1Cl?=
 =?us-ascii?Q?isoEoThntPjBdvk+hBiG6LpbK0f2YNjkqtQ7NwP/ctsyVfeV9TLtVlOcpzip?=
 =?us-ascii?Q?TaWJu7aPlCEFwzQcp35jH3vbu1hHyPoYOeLYnlkU5zD2LggXnuZ4CuYOd7ig?=
 =?us-ascii?Q?V+3sLyHAJ1U9qBqVFimw8dJ8YK73n3kwa3kQvcE2lIEETV+bRMVtA7KlJJnV?=
 =?us-ascii?Q?mwKNjKjyHNOhOWYnUU6EdGMiGRfl3CxaqTWXKCLbR5D0tkAiexr/hDK3XBsm?=
 =?us-ascii?Q?G/3qKsdiqjWZBE9EGktW6Orvi1F9qFAsedXv5ERa437PoCHoheMv0tyotTho?=
 =?us-ascii?Q?SPqWNuhI/kyoEkFXl1KKzuzqI7FWrMeFqSRad13HrGcZIMqtes9oGpNPwhA2?=
 =?us-ascii?Q?Hagp6x1bNvla+ly9BsZUDUMmrwO5R1tabHAKwZC6DpVgH722bBoabAnWSsWL?=
 =?us-ascii?Q?3fJxxT1P8VMmANjqGCuYi8CaYEC8OfUR27nBi6Hw2pkZmikZjCQOCtd/wA9y?=
 =?us-ascii?Q?CtBUmUDE/S8=3D?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-990eb.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ab0b96b-dd2d-4095-31c8-08def22b26ee
X-MS-Exchange-CrossTenant-AuthSource: DS7PR19MB7724.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 13:20:29.1557
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR19MB7515

> Not much from my side, but I just prefer receiving a solution that
> satisfies both of you :)
>
> So, if any, let's try a v2 patch set.  We still have a bit of time for
> 7.3 release.

Here is my proposal for a compromise:

    [ALC287_FIXUP_AW88399_I2C_2] = {
        .type = HDA_FIXUP_FUNC,
        .v.func = aw88399_fixup_i2c_two,
    },
    [ALC287_FIXUP_LENOVO_LEGION_AW88399] = {
        .type = HDA_FIXUP_FUNC,
        .v.func = alc287_fixup_legion_16iax10h_aw88399,
        .chained = true,
        .chain_id = ALC287_FIXUP_AW88399_I2C_2,
    },

    static void aw88399_fixup_i2c_two(struct hda_codec *cdc, const struct hda_fixup *fix, int action)
    {
        comp_generic_fixup(cdc, action, "i2c", "AWDZ8399", "-%s:00-aw88399-hda.%d", 2);
    }

    static void alc287_fixup_legion_16iax10h_aw88399(struct hda_codec *codec,
                            const struct hda_fixup *fix, int action)
    {
        struct alc_spec *spec = codec->spec;
        static const hda_nid_t conn[] = { 0x02 };

        alc269_fixup_limit_int_mic_boost(codec, fix, action);
        alc_fixup_headset_mode_no_hp_mic(codec, fix, action);
        alc_fixup_headset_jack(codec, fix, action);

        switch (action) {
        case HDA_FIXUP_ACT_PRE_PROBE:
            spec->gen.suppress_auto_mic = 1;
            snd_hda_override_conn_list(codec, 0x17, ARRAY_SIZE(conn), conn);
            break;
        }
    }

I believe this offers several advantages. In particular, it preserves
Aaron's fixes regarding working headset buttons and keeping the internal
mic available with headphones plugged in, while keeping a clean separation
between the generic aw88399 i2c fixup quirk and the Legion-specific stuff.
It also avoids picking up baggage from thinkpad/ideapad-specific quirks,
removes the SKU warning from the logs, and keeps the DAC rerouting explicit
rather than having it as the side-effect from deep within a long quirk chain.
Finally, it minimizes the number of quirks to be added overall, with no
redundancy, and avoids removing the "alc287-lenovo-legion-aw88399" entry
from alc269_fixup_models.

I'm happy to prepare and send the patch myself based on the above;
alternatively, I'm also fine with just offering whatever tag may be
relevant (Tested-by, Suggested-by, etc.).

Regarding the jack rename: given that I cannot reproduce that GNOME issue
on KDE Plasma, I remain unconvinced this isn't something to be dealt with
in userspace. That said, I'm not necessarily against implementing a kernel
level fix, but I'd like it to be a different fix. Whether that means
simply choosing a different, not misleading, name, or something else
altogether, I can't say right now.
Maybe Aaron can submit a follow-up patch on top of the above.

Regarding the quad channel map and DAC 0x03 rerouting: I still believe
that it's not useful to try to fix 4.0 support on an exclusively 2.0
laptop. The fact that there are 4 physical units on the laptop doesn't
mean they are supposed to be used independently: even when forcing 4.0
content, all this achieves is letting users use the tweeters independently,
which is the same broken state the aw88399 series was meant to fix in the
first place. Likewise for using the woofers without the tweeters.
I believe instead the proper fix is suppressing bogus 4.0 profiles at
userspace level (or more simply just ignoring them), as they don't
represent a meaningful configuration for this hardware.

Best regards,
Marco
