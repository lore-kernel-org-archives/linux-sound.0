Received: from outbound.ci.icloud.com (ci-2003k-snip4-11.eps.apple.com [57.103.91.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CC134E377F
	for <linux-sound@vger.kernel.org>; Thu,  2 Jul 2026 14:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.91.241
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783003456; cv=none; b=Atkbpw5iM3NXR5dRTo0G1uPdlrYduIH0d9zK9nBh/wkJYPIdSHnfoFtdINETLqaVi0R23mAAPxdVhRQhfSkP8P+kOWj3iQ3CghstOWheWz6ttdFAZQDMZUg921Ok7Q57IDjlwBqDNdHwWamApf2tqBGCIzj+Msz05u0GMR0ZeTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783003456; c=relaxed/simple;
	bh=LH3K+jnUboBICthGSPbt0fXkY1RQFMjH57BpA5HelX0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XNSh79HsYuFa0iq9DfXdRHW6CoJEzpBCi3VWldFffLSmSDlO/n6PQUT4I4Z8+TuCSSABHu4pK7LLZ2Wb/sbTdA1JZc5NxRedakAo4Q2fqj/l0GYpZjQIRYoHTqvIMqjw8KFFG48QxyCzeNpKbiPXHbkAKoJhc5UQQTaZT73eMxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=pEY6wkWj; arc=none smtp.client-ip=57.103.91.241
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="pEY6wkWj"
Received: from outbound.ci.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-central-1k-100-percent-10 (Postfix) with ESMTPS id 1A2F9180150A;
	Thu, 02 Jul 2026 14:44:11 +0000 (UTC)
X-ICL-RepId: 019f2349-927f-7c51-b139-b9dca93b39b8
X-ICL-Out-Info: HUtFAUMEWwJACUgBTUQeDx5WFlZNRAJCTQxWBlUZWgpHF0kFVBcOVk1PGVcEWkVeCUodXQZYRUcReRFQAVgeVl5aF15NUQ8PGVoUXBhTRVEfVFhBDgpcEhhcFFxQWB5GElYNXQkZCFteUBtfAkIPHBNWFRMdQxkPKwhKBEMHRQJeCyUTCVNWWxNVF0YJGQhdHRkVWgkKVwBAC04DWgdZA0QNSQdaGVoCQAxKAEAGRkQRXRFeQ1sSQRVXE1xDQgpyGVoUXBhTRVEfVEYTGU4bV01QG18CQg8=
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1783003454; x=1785595454; bh=GK6pX3V+956sTv+yu0otEbZF+JCXHsfTz843zVHcFOY=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=pEY6wkWj2czBh0eDUk6fdWk5SjiM4GWfTZYq4HGCsdD56rFvyLoWCDJhJf8Y0MLXq0jlk9bJjzoLL3jREA0vXxgB3i3+rtsmwAPzjVsyMF9E56ZHOMO2CorJArdRrmEhxMdtUkBijoQVXPDxrLiphAa8Nk0jGoR/bqUmy8dGWl8gbqNVuJOhAOpEQlmZV1YnfAn5tMqX7kMR47CdoH4VeYJezMW/6ScHgSVapkRNGNKpCdMLLngn5LbqWzZF4yOWnafRQn3t9mHNNIiRnApGOEAYP53KW5EjI6JEgEsqYQIP2snlrybBR2j3AHfpDzOnV1cszEjTvrr7PhBW3aCppw==
Received: from duduphudu-alienwarex16r2.lan (unknown [17.57.156.36])
	by p00-icloudmta-asmtp-us-central-1k-100-percent-10 (Postfix) with ESMTPSA id 29EB01802267;
	Thu, 02 Jul 2026 14:41:59 +0000 (UTC)
From: Vadim Lysenko <vadim.lysenko.ua@icloud.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] ALSA: Enable internal speakers on Alienware x16 R2
Date: Thu,  2 Jul 2026 17:41:45 +0300
Message-ID: <20260702144147.100523-1-vadim.lysenko.ua@icloud.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE1NCBTYWx0ZWRfX+cGSP7SlX3NR
 3u4ONj4RUhokoSl6mQHpVmS/iHQR3ZwluopLBcSUWO3KMQe3WtYTVeqPZDGpqENjSlV8V/b+mSn
 DtMyMwFt18DoaYnfGkZNr38+uxtZV9JZzL7l4/Ri0fpij68q4Lh1jPoeA452b25j69ow1LUjf/u
 ynzrrobZeqGAjxr7/rZNOSLrQMfqcdxiAJyHQ3zvfury4wuwsFpeo0tzbWAPQG04EnCkb+sU2HN
 8Fp894ccRuVBDfejmxUTHx2oWDUtCJUvi+HqqSh1fTSkn07BBCJTQH8HJe4Fldv6ATjGI1HX9f8
 idW8ZxYrJJxxI3vBiPH
X-Proofpoint-GUID: OW2jsBdSgyEJy_5fTeGWCe6PVrzZRXaf
X-Proofpoint-ORIG-GUID: OW2jsBdSgyEJy_5fTeGWCe6PVrzZRXaf

This series enables the internal speakers on the Alienware x16 R2, which
uses a Realtek ALC289 codec with two Cirrus Logic CS35L41 amplifiers on
SPI (ACPI CSC3551, Dell subsystem 0x1028:0x0c90). Out of the box the
amplifiers do not initialise and the speakers are barely audible.

Two things are missing:

 1. patch_realtek has no quirk for 0x0c90, so the ALC289 speaker pins are
    not routed to the amplifiers (speaker_outs=0).
 2. The firmware's CSC3551 device has no _DSD properties, so cs35l41_hda
    cannot probe the amplifiers - they fail with -EINVAL because the SPI
    controller exposes one native chip-select for two amps.

Patch 1 adds the realtek quirk (identical hardware to the Dell XPS 15
9530, 0x0beb). Patch 2 adds a cs35l41_config entry supplying the missing
properties.

The configuration values were derived from the machine's ACPI _CRS and
validated on hardware: both amplifiers enumerate, identify as CS35L41
rev B2, bind to the codec (cs35l41_hda_comp_ops), and the speakers play
with full range and no boost faults.

Note: the CS35L41 SPI clock comes up too slow for firmware download, so
the amplifiers currently run without the DSP (speaker protection and
tuning). Basic amplification works; the SPI-speed issue is separate and
not addressed here.

Vadim Lysenko (2):
  ALSA: hda/realtek: Add quirk for Alienware x16 R2 speakers
  ALSA: hda: cs35l41: Add support for Alienware x16 R2

 sound/hda/codecs/realtek/alc269.c                   | 1 +
 sound/hda/codecs/side-codecs/cs35l41_hda_property.c | 2 ++
 2 files changed, 3 insertions(+)


base-commit: 4a50a141f05a8d1737661b19ee22ff8455b94409
-- 
2.54.0

