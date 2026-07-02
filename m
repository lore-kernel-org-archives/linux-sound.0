Received: from outbound.ci.icloud.com (ci-2003j-snip4-11.eps.apple.com [57.103.91.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9CC54E3778
	for <linux-sound@vger.kernel.org>; Thu,  2 Jul 2026 14:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.91.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783003456; cv=none; b=KTb9xRUYdAqmU2oXdYdvOkIPiySzcLfmtJS+bOdxbzFxNDuTrZ4f/bM4lHAS7DUqx50F4BnOOizNQzW2P6IiVze6UrG+4uMzKrj/yZB9WmXEpRY3Yvv6ayy84mb1PlhwcgQB87Bg15lgz5wRDLvdCqRpVKt+4HiBLkEuV1azQnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783003456; c=relaxed/simple;
	bh=y652DsvbOqEb9TALjQffW29UBM+s1LTwISVbmx0aUcA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kUEiQJCQkGx7K8MzjNCUUAu8aW9RC6S6gM5lp6frojKX4XFLHzASRg9V/bVY+/4ET4qDTMMJLsTOI5Zol98k1rtYDYX00HyhS2VveNkiHPZX6wkQLtcxB4thyd8yQarQGTE7jWRBLcgCmkpvmoFvIgOK4nOaVMlGh6mccA6paVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=RKWWcmTT; arc=none smtp.client-ip=57.103.91.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="RKWWcmTT"
Received: from outbound.ci.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-central-1k-100-percent-10 (Postfix) with ESMTPS id 7A49C180081B;
	Thu, 02 Jul 2026 14:44:13 +0000 (UTC)
X-ICL-RepId: 019f2349-9827-766e-afa8-094b18f18536
X-ICL-Out-Info: HUtFAUMEWwJACUgATUQeDx5WFlZNRAJCTQxWBlUZWgpHF0kFVBcOVk1PGVcEWkVeCUodXQZYRUcReRFQAVgeVl5aF15NUQ8PGVoUXBhTRVEfVFhBDgpcEhhcFFxQWB5GElYNXQkZCFteUBtfAkIPHBNWFRMdQxkPKwhKBEMHRQJeCyUTCVNWWxNVF0YJGQhdHRkVWgkKVwBAC04DWgdZA0QNSQdaGVoCQAxKAEAERkQRXRFeQ1sSQRVXE1xDQgpyGVoUXBhTRVEfVEYTGU4bV01QG18CQg8=
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1783003454; x=1785595454; bh=BKvzxFodbEZjkxSEB3J+8UXfchMeL2sE+ziUv22QFJo=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=RKWWcmTTZfHykBK6WVHx/97ukDeNzXnmVWQyUh5A0r+YcuRbR5SbfFzHCF3h9vPL59Ym4DIyZhc/AFDsMjALU+fijasCgb2/tRtBln9TZAjfhaS5iqh50TbwkQSYue8Wq2jm2N6hC1BEtooa5VMFru8EjBxSf/Px5eSDtw+qgMniMzzraoPpeMoi32N4Ls6gkqT8EGLoTbF5JNE+hBQcSyW/hhfPOKaS5CQNVgiLUnZfOUWMAoYwsH0nhTi7E7SO5tGJq1YgRwKSNPH9qGEf2L6PzXxd7ckrqOwADJxHSokyCmIzNpwq101DAr2dSgR/fjjYXUOC0Nk2d+bcgkD43g==
Received: from duduphudu-alienwarex16r2.lan (unknown [17.57.156.36])
	by p00-icloudmta-asmtp-us-central-1k-100-percent-10 (Postfix) with ESMTPSA id 03E90180011F;
	Thu, 02 Jul 2026 14:42:01 +0000 (UTC)
From: Vadim Lysenko <vadim.lysenko.ua@icloud.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ALSA: hda: cs35l41: Add support for Alienware x16 R2
Date: Thu,  2 Jul 2026 17:41:47 +0300
Message-ID: <20260702144147.100523-3-vadim.lysenko.ua@icloud.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260702144147.100523-1-vadim.lysenko.ua@icloud.com>
References: <20260702144147.100523-1-vadim.lysenko.ua@icloud.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE1NCBTYWx0ZWRfX89hADkYVbwyL
 j7wIkXuvKUf/eeGYmyIOaUPpDH4apizlUjhZYlsOV3OaYRInMqILqIYf2gcX7R1wK2uD4M2BMEz
 Bt9jogkx6Pb1fTlXnDSaiWFicdeNakXg+loMyxlJfvcHZXdvJxNic/bVNwaJ2+DTF4LOkPlbruY
 4iDDmLoZhNbJG1/W1+NsFIgzi7toteIcQ5brgdNSKvgerowFWg+H5hRRxT3W5WjMyTQGeLJX9O8
 ViEfghR5HigLD+8ebTBH+ccV+/nnLRNnJHGLltX6HVEZ4OoVPxp1CqGS1xDqkzXyu1juwqPucjY
 GnuqfEvqqYAxKySz6/8
X-Proofpoint-GUID: bmFEl72CA_L7bc55A0wJhLNT8sL_Qtrs
X-Proofpoint-ORIG-GUID: bmFEl72CA_L7bc55A0wJhLNT8sL_Qtrs

The Alienware x16 R2 (Dell subsystem 0x1028:0x0c90) has two CS35L41
amplifiers on SPI described by an ACPI CSC3551 device, but the
firmware provides no _DSD properties, so the amplifiers fail to probe:

  spi_master spi0: error -EINVAL: failed to add SPI device CSC3551:00
  serial-multi-instantiate CSC3551:00: probe failed with error -22

Add a cs35l41_config entry so the driver supplies the missing
properties. The values were derived from the machine's ACPI _CRS and
validated on hardware:

  - 2 amps, left/right, shared reset on GpioIo index 1
    (kernel reports "Reset line busy, assuming shared reset")
  - speaker-id on GpioIo index 5 (driver reads SPKID: 1)
  - chip-select on GpioIo index 0 for the second amp; this lets both
    amplifiers enumerate ("Instantiated 2 SPI devices")
  - internal boost, matching the sibling Dell 0x0b27/0x0b28 entries;
    both amplifiers then identify as CS35L41 rev B2 and play with no
    boost faults

After this change both amplifiers bind to the ALC289 codec (see the
realtek quirk) and the internal speakers work.

Signed-off-by: Vadim Lysenko <vadim.lysenko.ua@icloud.com>
---
 sound/hda/codecs/side-codecs/cs35l41_hda_property.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/hda/codecs/side-codecs/cs35l41_hda_property.c b/sound/hda/codecs/side-codecs/cs35l41_hda_property.c
index 416d7bf3e..de70d511c 100644
--- a/sound/hda/codecs/side-codecs/cs35l41_hda_property.c
+++ b/sound/hda/codecs/side-codecs/cs35l41_hda_property.c
@@ -38,6 +38,7 @@ static const struct cs35l41_config cs35l41_config_table[] = {
 	{ "10280B28", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 1, 2, 0, 1000, 4500, 24 },
 	{ "10280BEB", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 1, -1, 0, 0, 0, 0 },
 	{ "10280C4D", 4, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, CS35L41_LEFT, CS35L41_RIGHT }, 0, 1, -1, 1000, 4500, 24 },
+	{ "10280C90", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 1, 5, 0, 1000, 4500, 24 },
 /*
  * Device 103C89C6 does have _DSD, however it is setup to use the wrong boost type.
  * We can override the _DSD to correct the boost type here.
@@ -470,6 +471,7 @@ static const struct cs35l41_prop_model cs35l41_prop_model_table[] = {
 	{ "CSC3551", "10280B28", generic_dsd_config },
 	{ "CSC3551", "10280BEB", generic_dsd_config },
 	{ "CSC3551", "10280C4D", generic_dsd_config },
+	{ "CSC3551", "10280C90", generic_dsd_config },
 	{ "CSC3551", "103C89C6", generic_dsd_config },
 	{ "CSC3551", "103C8A28", generic_dsd_config },
 	{ "CSC3551", "103C8A29", generic_dsd_config },
-- 
2.54.0

