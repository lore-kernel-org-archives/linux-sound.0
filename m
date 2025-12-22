Received: from retry-chloe4.scw-tem.cloud (retry-chloe4.scw-tem.cloud [51.159.124.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D41F1DEFF5
	for <linux-sound@vger.kernel.org>; Mon, 22 Dec 2025 20:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.124.110
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766433754; cv=none; b=XsxOWa+SVqnP44K6b2MfJh5tyLZMnJrOeomWV6XiZUbCTrsjFGbTQjqAB/GGDydTDel57FMgsCQZhc/6Cg1AWKy11WpnsZ1Abpoja24JlsVxIjoyV13snA2W6DGLnlv1NHYMOHBALfxzOjeFUQZIssU+I7kH2nrLbf0v8lxbBpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766433754; c=relaxed/simple;
	bh=5q6Gc9RbVKHlxdGqP+DukSSwJK7nYBNLZwfn8tl5M4U=;
	h=Cc:Date:From:Message-Id:Mime-Version:Subject:To; b=Ow2u0idrsQb5VXRRmLqbZ15/8cTD9RRbKxQE0c7yEBsqtyLvUcPvGZan5q4A+WyLuV1bCVW5rHWGeSf51KAlyi8mzGAw71gzGPfdP/Gnivtr+55GE3clbbHZEl7VfTSfUa6s7/UXUY6jdLvJyc7RtmojK/fAnMSNUXvAsBee/zQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=augustwikerfors.se; spf=pass smtp.mailfrom=augustwikerfors.se; dkim=pass (2048-bit key) header.d=augustwikerfors.se header.i=@augustwikerfors.se header.b=L8Cqs6W5; arc=none smtp.client-ip=51.159.124.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=augustwikerfors.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=augustwikerfors.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=augustwikerfors.se header.i=@augustwikerfors.se header.b="L8Cqs6W5"
DKIM-Signature: a=rsa-sha256; bh=L3TLn/EcvZeWtU0VY8XFMU5miek6MUe85vKchA2Nn1A=;
 c=relaxed/relaxed; d=augustwikerfors.se;
 h=subject:to:date:cc:from:message-id;
 s=812a4465-b64d-440c-bdd2-3148e8f56cf0; t=1766433750; v=1;
 b=L8Cqs6W5OxiaYRehME8UmdPX9HMF3viGiAxg2LSGSuXulOnwSHtYYGG8BoYj7xrZz0zp9ejQ
 KbONDgfhkpL54uRGQPm3qGYxOG6NS73hhidqcd+3hco7917Ld2COd7VIe59r3UvUVyL0gCNpXvB
 oyt9DvoUrTNuwCDEi2t32u6/VhPML6ra4jm0jh3+rzxBqRbsi7MuuEChIueuRZ757ujtXRvfBOI
 apGA7QHsRxgwGLs8vxhPCm2o6Sz6uYllsVYNlfXtYtQ/RWki0/rlp5LgtKgvQYvNMi7CBTVIqMa
 EbECQ8fVFHNp5GePl+Bl1WV7epu9qKyzW8fI8KR7LFdzQ==
Cc: Antheas Kapenekakis <lkml@antheas.dev>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, August Wikerfors <git@augustwikerfors.se>
Content-Transfer-Encoding: 8bit
Date: Mon, 22 Dec 2025 20:47:04 +0100
From: August Wikerfors <git@augustwikerfors.se>
Message-Id: <20251222194704.87232-1-git@augustwikerfors.se>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Subject: [PATCH] ALSA: hda/tas2781: properly initialize speaker_id for
 TAS2563
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>, Takashi
 Iwai <tiwai@suse.com>
X-Scw-Domain: augustwikerfors.se
X-Scw-Tem-Message-Id: <3f6ec5d4-3e09-4320-bb75-59b270f5dc49@retry-chloe4.scw-tem.cloud>

After speaker id retrieval was refactored to happen in tas2781_read_acpi,
devices that do not use a speaker id need a negative speaker_id value
instead of NULL, but no initialization was added to the TAS2563 code path.
This causes the driver to attempt to load a non-existent firmware file name
with a speaker id of 0 ("TAS2XXX38700.bin") instead of the correct file
name without a speaker id ("TAS2XXX3870.bin"), resulting in low volume and
these dmesg errors:

    tas2781-hda i2c-INT8866:00: Direct firmware load for TAS2XXX38700.bin failed with error -2
    tas2781-hda i2c-INT8866:00: tasdevice_dsp_parser: load TAS2XXX38700.bin error
    tas2781-hda i2c-INT8866:00: dspfw load TAS2XXX38700.bin error
    [...]
    tas2781-hda i2c-INT8866:00: tasdevice_prmg_load: Firmware is NULL

Fix this by setting speaker_id to -1 as is done for other models.

Fixes: 945865a0ddf3 ("ALSA: hda/tas2781: fix speaker id retrieval for multiple probes")
Cc: stable@vger.kernel.org
Signed-off-by: August Wikerfors <git@augustwikerfors.se>
---
 sound/hda/codecs/side-codecs/tas2781_hda_i2c.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c b/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
index c8619995b1d7..f7a7f216d586 100644
--- a/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
+++ b/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
@@ -111,8 +111,10 @@ static int tas2781_read_acpi(struct tasdevice_priv *p, const char *hid)
 	sub = acpi_get_subsystem_id(ACPI_HANDLE(physdev));
 	if (IS_ERR(sub)) {
 		/* No subsys id in older tas2563 projects. */
-		if (!strncmp(hid, "INT8866", sizeof("INT8866")))
+		if (!strncmp(hid, "INT8866", sizeof("INT8866"))) {
+			p->speaker_id = -1;
 			goto end_2563;
+		}
 		dev_err(p->dev, "Failed to get SUBSYS ID.\n");
 		ret = PTR_ERR(sub);
 		goto err;
-- 
2.52.0

