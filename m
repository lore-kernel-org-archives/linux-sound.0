Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azolkn19010016.outbound.protection.outlook.com [52.103.23.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86450283CB5;
	Sat,  1 Aug 2026 12:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.23.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785588997; cv=fail; b=j639CFBFphKC6wlPy2DfLPJTh9T8MA8ZGxwBiA9M5s/9fhZc17zFCf3syuzblkJkkv1AWlNnM7bAVbR5gAR8nshaXln/tDTwoTGy6ZLWNaGryd5N8cSXNCMj39ESOBl8I9qKFsyhjPgHS1ebib5ajFrFqURJgxdd6e5Xhw/fmvQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785588997; c=relaxed/simple;
	bh=kxuchSoX0oHMaK9U+QwVqoO1XkF4BdIAdqDm0misBzc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=T8m2AZPeagXaCvJnXmxenKSPwlHR4hl+42Y2t2QQeni5jgaJrKHk/grwrF8ANrRVxT3HxbPwapsz1XxPIwWbOcthih/ovVZQsFzoeHPqhNkspZF8nOpStOf8dBP0imwfBw66oqC1nXRdXO4r36+iqL8At4feO0ViX2MxmmF55NY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.it; spf=pass smtp.mailfrom=outlook.it; dkim=pass (2048-bit key) header.d=OUTLOOK.IT header.i=@OUTLOOK.IT header.b=OKRRo/7m; arc=fail smtp.client-ip=52.103.23.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=OUTLOOK.IT header.i=@OUTLOOK.IT header.b="OKRRo/7m"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LkKcKPgSB4dMdruP+IctuHVbhHXq3+WD8+SaFIE2GVRKZvroH8B8sm0574Mzwy9SdSbM3/JSNIY8+F5iIaQsLyZnCG71pcb8luYhUp4NI7nbrQ99lGw9AsiLtE772vxb7FCjT7lPyC7K4AMyP1j6yc4D6QdqtaboSfAxNFquZ1BBehkhgL2bBV9II9KUFknxgxpUn2YX+AmUp4QCMV7SP93vVhVwi8/dG9bmD4Pj544lUYwmdSllkyIw/3ZEXEORqflcrfFH7jlpIs2kcD+rwr7HIjcz+MbeB1P6Zx60zkXgJ4e+SWpeoCphVZ8SIQ9FFX1Tx0qDPWBMzsTdl43DFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JuazSLdUc8gi3IWc1JHv5zLOaBf6MmQFEuOXpnOw/5M=;
 b=KPXHFvMmf5ueL2vUrSRGU5QyM/qsJh8jy5udCk51aaKqKL9MpLQFm+hiYRlVCAtzkkiFsblxPl9D4hbKuWp5cjpM13SDGyDOybX30QFFTDwI99dNO402aXpPApcJ2CnWF7X9CgWKbZYWjlB2U5DKe0A6Y0n9dMJ8J1fHaee6CFGuURQVWv7AkcbURybt8wU1KVp8Dptj9fN0n+F15GnPQHNFnhRRhO6UOFNIZV2WhtiQIu2iwKsLkPouxU6Fl4DugLrj3ex9H98cMZrQwmnhiM0hD8v0yw/gz35M5grrhENuPdK9abmTKSHj0i6MsXRpNhpJ55EnZrM9oFFMx1O2lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=OUTLOOK.IT;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JuazSLdUc8gi3IWc1JHv5zLOaBf6MmQFEuOXpnOw/5M=;
 b=OKRRo/7mPa80vfYA6nbo5yH6OyVyg72RyAshZJUkOnqNumTRTzqgvwtJlxyfM4K/XDzqJrGn5VmG6gIecuaAAWYiv/cBKXSCkvwT0B1bdQTJjQ51rPckbFJoFHUqdz2xJTtkpFO2RCtFVy7MhFbQjc8uwzKSXnKs++nIly9goaRnFqmmjv71QxfVQwoS6VeUsq8IywvNRT8lURnFGHCNF70aGkNhbCbOvW6SWqSo5In2IxOvjgicTgZ7ilI6u4B+t5iDgm2m9h57zXADRrEDgEnivliQlNGQV2C1ppCNC0jXPOShAxWefsWXkU8DYkvSjXSS87LzQIWt8ur2jntn7g==
Received: from IA1PR19MB7712.namprd19.prod.outlook.com (2603:10b6:208:3db::7)
 by CH9PR19MB9588.namprd19.prod.outlook.com (2603:10b6:610:2df::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Sat, 1 Aug
 2026 12:56:33 +0000
Received: from IA1PR19MB7712.namprd19.prod.outlook.com
 ([fe80::3e3c:51e1:5e00:be4b]) by IA1PR19MB7712.namprd19.prod.outlook.com
 ([fe80::3e3c:51e1:5e00:be4b%5]) with mapi id 15.21.0270.015; Sat, 1 Aug 2026
 12:56:33 +0000
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
Date: Sat,  1 Aug 2026 14:56:20 +0200
Message-ID:
 <DS7PR19MB77249992FF86019C7B2B52BEFCD72@DS7PR19MB7724.namprd19.prod.outlook.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260801060630.2768318-1-mapengyu@gmail.com>
References: <20260801060630.2768318-1-mapengyu@gmail.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MI2PEPF00000B81.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:298:1::418) To DS7PR19MB7724.namprd19.prod.outlook.com
 (2603:10b6:8:d9::20)
X-Microsoft-Original-Message-ID:
 <20260801125620.23425-1-marco_giunta@outlook.it>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR19MB7712:EE_|CH9PR19MB9588:EE_
X-MS-Office365-Filtering-Correlation-Id: 258dc5c1-7487-4106-0fcb-08deefcc4f0f
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|24021099003|55001999006|8060799015|19110799012|41001999006|5072599009|23021999003|15080799012|25010399006|4140399003|40105399003|52005399003|2607281247196008|3412199025|440099028|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1xz1YhvakULREwiNu/JT6Hy13wjmIYmJK7+3GTqBvDpTv0AC4vURCn8tKrIo?=
 =?us-ascii?Q?VkJnY2Vxj8tQpAi1f9HXtmLSuvjGBTT+90kb2Zri9ycktRSJMveSlcAazlv5?=
 =?us-ascii?Q?oWlJ6Odkff+Fhr4pUs8mRGb5sIvQmZLg8OAk2hRYCo0NxVbRjcB+CysdwOC8?=
 =?us-ascii?Q?ITCBLIKAgI/wl2IGRTara/PqHgSCI7yuzebndF5jFNdmhYzWW27vjd+ltqwk?=
 =?us-ascii?Q?ySG3tbvmScJay/chavLmP/7XRc2hUxl0zR2eXRaK0jX5MJPt6+DfHI9zwd+u?=
 =?us-ascii?Q?1z8yLy0WH8y4vTTwI6xD4m/4QbzzL61nO61Bxp/cRVqXP/D9gUhjWG2lqyjc?=
 =?us-ascii?Q?Fyl84msP/ZC7LiGF+REyw8cFm96kvJn39iA8Rif4cwICMDVEAeKwn9Y6D9yN?=
 =?us-ascii?Q?vZ8GhuaLWcMOax0lYe2G1tnPAkfxLa/rQTEvBGZvPsSUUxxky1REqnjnutcA?=
 =?us-ascii?Q?KGe+Q+5iK+IZE7q9mrjCGaqMinbgZDa9GdjFPJVT/0iV6HM23JXSp24W8tnX?=
 =?us-ascii?Q?xX9bnnPDgiOAIOZ0gV+p4fPys/rBl+XrLSL2eInSwUCe+vq+ETRLRZogeBnk?=
 =?us-ascii?Q?/TgG0IQI7GIJueAA9PTn1uhzMX6bbXRaFDprvZHEsXCV+BcZMy20w3isF3T5?=
 =?us-ascii?Q?mWk8axMnlPY4FXpJHzus3YB1rrR9BQpT1pd5sEMtmntA/oUenhp9aS4d63HF?=
 =?us-ascii?Q?sYFLrUSfyaEedDP6XbdYDwwVFU4xO/KWzlBrNyR1L+gzT7g7C+L3VwInA/4V?=
 =?us-ascii?Q?NkMdNCapazHnDvrWtQlFdaTY9Flm59GXcaQHMnMlAY9kOEmC4zLpzEna2KoH?=
 =?us-ascii?Q?Dv/om9VArU4uKSNoP5c1iBHViDi0TaqqKTNvVrZMR0l7M1njGUdJUtKwLqGC?=
 =?us-ascii?Q?GoNZ7qtZRHY432QYE33ptPgfGiGXOYTGYRwta5ZeSmk0s8dYzVJfYdvwhJ6x?=
 =?us-ascii?Q?oRj59zfKZRAsxU4rPt0f2q91QtF8TEZKLTSwnnhMWm8qE0BKMo3Rc+F2g9ZB?=
 =?us-ascii?Q?iEDMqT8w377gGHjlsm1uouXosg=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5DkI6SCzcQwTQH9ZbgSLScReH5pUwARliUdNPdvqOufo5vjPZsvDbYIgU08E?=
 =?us-ascii?Q?exu506JYR5bSF5z6d0Hafo8Aeg2STR6qFPZoOnZe5DwSVyXNHM5tbQ9aBsv+?=
 =?us-ascii?Q?xGO6ONi3CUMBUzAC5zsvBvm7DERS0nz7SarXNRkOlX29l6cZCe4NS+6RzTNa?=
 =?us-ascii?Q?ziz+AB6Rt+J2fTIcDlZbFwJTwTGMmdL+v/tEXTrymGOUjE6wQSy1nw/m7OYd?=
 =?us-ascii?Q?5rIOyO8CkGC37SO8p/2MZci0uP+ltCCnrjh71Ci+NjQFrFLTpGKhqttrtxms?=
 =?us-ascii?Q?IDTpJawB/E3r4QPy8AvtY9vB7z6WJ2u9TeNZ0rsG+AEAhYSAs/NK+3Q3PrR4?=
 =?us-ascii?Q?Xmci7Lr7R6/+15EX/iHWjjgcOSWS4WPbmHq5USOEwY4FT3WkvuQzR39qnqp/?=
 =?us-ascii?Q?QnwssVTs7bN9w9pN5QoMJg2Mu3V+gQjlJXzo4/f5oUG4tMGreCxpf7EDgnai?=
 =?us-ascii?Q?VeOfcbf1XNaIyYEBg8KFrEZFbPBtRgq+S3uvZln3MwxRCQ2znFDNqRdIwxIj?=
 =?us-ascii?Q?iXIBDaX9GMN1GPN9H07HEbxSc60lW/5JaSayW3v4xJt1BQMBzfXDucjLH4BO?=
 =?us-ascii?Q?iRSIOt+Qd5Dian3l7wkHPrholxv5hPlRL51RVGSomZgabyndGSrrTDZZf7XI?=
 =?us-ascii?Q?D/0oiKTVq2AC8nE8wwolTHmHj42uhigrxOgQ+CFEEBqW/uhESAxSXgl6ndMY?=
 =?us-ascii?Q?LbqRjXWiy/OnmjQkkZ2lwVXZ9aWQNRvpzDlgYowl8gqyDvTQVMfs6sZnwY2z?=
 =?us-ascii?Q?R4IuLmLSwEcvQYS1rBI/yBnu7ZLh7mL7UPkY59miRZEdiXKbQJROpU0L96Jn?=
 =?us-ascii?Q?GZ91ElOdkdhBPaq2AUKzJiny/3VdxK7Ho1SiErV/tPvYeQNhw+LF0qVslEDA?=
 =?us-ascii?Q?HpWL1Vf3P5KhXbJK08JfIQrtHUxpDCF5DYA6XvFJ2PhuyhwGDaq2OVGLeLRd?=
 =?us-ascii?Q?/hzo3QQ6vAJ4FauOqby0FjmJAdrwgCD2DsXLmKSoEWGMmJmoAIgAbcYHZJcM?=
 =?us-ascii?Q?+LzHQi9QsZsSLyTuGtpC7qaLgmgWyVBHFcH2I8hQkfXdsGEZxOzth0qDNd8K?=
 =?us-ascii?Q?PckFuBmE7FYTA1n7yrQEfiVrYUhohgTGZJ+R0/kvaK5u5ONI21qjiRsCng8t?=
 =?us-ascii?Q?4UF2IgFwoOpvnodR4Qg/wJkYY82kzJA5SkIMg4wN+2O5d7/B/1h60hgZp+Eq?=
 =?us-ascii?Q?1/hJkuXPsvBvReTlDTK7SQDm4B1acRPUUJh7fyFjyv5mMfKGMdENv4CtHtRk?=
 =?us-ascii?Q?IEnHTwNljE5PSa8T9hqfF4/WZ03FpKfNsnW+HqMskj2GzzZ4SkSDF31bRgsE?=
 =?us-ascii?Q?mSmnSevGfU4cgzKp0v4tnqR7Z8uBR2MfaHWmZyBpLv7bPdgF9Fmgl+9izIRM?=
 =?us-ascii?Q?RDsFrLpOSfXvjq0cVqvFLeMNlNQXCUaCjxC/5z3Zhjh25naUeQ3EVYtCunpH?=
 =?us-ascii?Q?gw62DNPJitA=3D?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-990eb.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 258dc5c1-7487-4106-0fcb-08deefcc4f0f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR19MB7724.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2026 12:56:33.3431
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH9PR19MB9588

Hi Aaron,

I have serious concerns about this series. I addressed some of the
points below in my previous reply to your review of my v2 patch 3,
but I will reiterate them here for the benefit of everyone else.

* Patch 1: Default DAC routing

> Retain the existing Lenovo routing

Previously, you stated that the default 0x17->0x03 routing didn't need
to be changed, but this is NOT the default on these Legions, and in fact
I think this is just a misunderstanding based on the R9000P.
That laptop shares the PCI SSID 17aa:38bb with the Yoga S780 entry,
which chains through to alc285_fixup_thinkpad_x1_gen7 and sets:

    static const hda_nid_t preferred_pairs[] = {
        0x14, 0x02, 0x17, 0x03, 0x21, 0x03, 0
    };

This is the Yoga/ThinkPad routing, not the Legion's. The actual
hardware default for pin 0x17 on all known Legion models is DAC 0x06.
This can be readily verified on a Legion model that boots without the PCI
SSID collision, and I can personally attest it's the default on my
Pro 7 16AFR10H (codec SSID 17aa:3938).
The HDA_CODEC_QUIRK entries in the current code exist precisely
to prevent this collision by matching on codec SSID instead of
PCI SSID. It's not impossible that some hardware revisions already have
the 0x17->0x02 rerouting, but even if such laptops exist,
on all tested hardware the default routing is the incorrect 0x17->0x06.

Also, your series calls alc285_fixup_thinkpad_x1_gen7 via
ALC287_FIXUP_LENOVO_XPAD_HEADSET_JACK, so the fact that volume controls
work at all under your patch is a consequence of the fact that you, too,
override the default routing (but with 0x17->0x03, which is the DAC
usually reserved for headphones on these realtek codecs).

In general, not having a DAC override for pin 0x17 WILL break volume
controls on all supported Legion models. DAC 0x06 has no volume amplifier;
without the override, users get binary 0/100% volume.
That the 0x17->0x02 fix works and is indeed needed has been verified by
every tester across all three supported models, confirmed by the Windows
driver codec dump which selects DAC 0x02 for both 0x14 and 0x17, and is
consistent with dozens of existing alc269.c entries which perform
the same override (with comments clearly stating that this is done to fix
broken volume controls). Also, many of these quirks share a single DAC
between tweeters and woofers (typically 0x02 for both 0x14 and 0x17)
without issue, meaning the currently accepted solution doesn't appear
to be particularly problematic.

Regarding the 0x1d pincfg override: I don't disagree that in practice
this makes no difference, and I'm happy to have it removed if a maintainer
asks. This line was simply added to ensure we match exactly the pincfg of
the official Windows driver.

* Patch 1, 2 and 3: architectural concerns

ALC287_FIXUP_AW88399_I2C_2 is the base fixup that registers the
AW88399 amplifiers, by binding to the i2c devices created by the SMI
driver. It should remain generic and applicable to any machine using this
chip. Stuffing Legion-specific behavior (suppress_auto_mic, headset mode,
jack renaming, channel maps) directly into this function means any future
non-Legion machine using AW88399 inherits all of it.

The current design intentionally separates the two new quirks:
ALC287_FIXUP_AW88399_I2C_2 handles generic amp registration,
while ALC287_FIXUP_LENOVO_LEGION_AW88399 chains to it and adds
model-specific fixups. This is the same pattern used e.g. by the CS35L41
driver quirks, which have a generic cs35l41_fixup_i2c_two and separate
per-vendor fixup entries that chain to it.

Additionally, replacing a single self-contained ~20-line function with
a chain of three separate fixup entries
(ALC287_FIXUP_AW88399_LIMIT_INT_MIC_BOOST ->
ALC287_FIXUP_AW88399_HEADSET_MIC ->
ALC287_FIXUP_LENOVO_XPAD_HEADSET_JACK), each with its own chains,
makes the code harder to follow, forcing a reader to chase through the
fixup array to understand what the chain does. There's no code reuse
benefit either, since these new chained entries aren't individually
shared with other devices.

Patch 1 also removes the "alc287-lenovo-legion-aw88399" entry from
alc269_fixup_models[]. This entry allows users to force the Legion fixup
via the model= module boot parameter, which makes testing the new driver
much easier on new Legion models that may need it. Without it, users of
unsupported models have no way to easily verify whether our driver
applies to their hardware, and are instead forced to recompile the kernel.

* Patch 2: quad channel maps

I tested both patches on my 16AFR10H with music playback.

* With a 2.0 profile: both patches work correctly; tweeters and woofers
 play together as expected.
* With a 4.0 profile and my patch: music is fully silent (both tweeters
  and woofers).
* With a 4.0 profile and your patch: music plays through the
  tweeters only, woofers silent.
This is technically an improvement over full silence, but it reproduces
the exact broken state that motivated this entire driver effort: weak,
tinny audio from tweeters with no bass.

Even if the mapping were inverted so that only woofers played under 4.0,
it would still be wrong; bass-only audio without tweeters is equally as
broken.

In general, the only meaningful configuration for this hardware is stereo
2.0, where tweeters and woofers play the same signal together.
There is no useful way to split them into separate channels, because
they are not separate channels -- they are frequency-divided reproductions
of the same stereo signal. The bogus 4.0 profiles are an artifact of the
HDA parser, to be suppressed at userspace level via alsa-ucm-conf
(or simply ignored in practice), not by adding channel maps at the
realtek quirk-level. As such, I'm not convinced this patch is needed
in practice.

Also, as far as I can tell, there is no upstream precedent for mapping
a laptop's tweeter/woofer pairs as 4.0 surround channels.

* Patch 3: headphone jack rename

These laptops don't have docks. Renaming "Headphone Jack" to
"Dock Headphone Jack" is semantically incorrect, and I'm not convinced
the Thinkpad precedent applies here.
Regarding the need for this change, if there is a GNOME prompt issue
on plug events, that should be addressed at the userspace level, not by
giving hardware a misleading name.
More generally, I'm not sure I understand what problem is being solved
by this patch, as no Legion user has ever reported any issue
related to headphones and mic switching. I can also personally attest no
such issues on my Fedora 44 KDE install on the 16AFR10H.

* Summary

This series modifies a well-tested and necessary DAC override,
adds surround channel maps for hardware that isn't surround,
renames a jack to work around a quirk specific to one desktop environment,
and mixes generic and model-specific fixups in ways that will affect
future devices, while making the code harder to read and to test on
new devices.
None of these changes have been tested by the testers who validated
the current code.

Based on data from our github repo, I can attest that the current
fixup chain has likely been used by at least ~250 people in the last
~4 months across multiple kernel versions (from 6.19.10 to present)
and distros (Fedora, Arch, Cachy, Debian, Ubuntu, Nobara),
with no reports of mic switching or headset detection issues, instead
reporting that the 0x17->0x02 override was able to remove the need for
the alsa-ucm-conf workaround that was previously used to fix broken
volume controls on this hardware. As such, I am a bit surprised by this
patch series, and I admit I'm probably misunderstanding something or
missing some important context.

If the suppress_auto_mic and headset mode changes address a real mic or
headset issue on these Legions which I'm currently misunderstanding
and didn't happen to hear about previously, I'm happy to have them
incorporated as a separate patch on top of the existing fixup chain,
while preserving the crucial DAC 0x02 override needed for working
volume controls. But I'd first like to better understand what problem
they solve, as no Legion user has reported mic switching or
headset detection issues.

May I ask, on what Legion model (with what codec SSID) did you test
these changes? Is there a bug report thread I may read to get
more context?

Best regards,
Marco
