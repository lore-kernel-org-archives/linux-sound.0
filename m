Received: from mail-08.mail-europe.com (mail-08.mail-europe.com [57.129.93.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4091F3C3428
	for <linux-sound@vger.kernel.org>; Sun,  9 Aug 2026 10:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.129.93.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786270586; cv=none; b=RGVGpDXIYWkXaPDtj4zwENflBYBFsfotXkQUxf00bBDuJh7AycJEcRotBxBugWhXdHS26cUCujIMo2e2R92S+twpbESr3WcXFEbZ+BwREFdkiT34xAsiXvH52/NjV3UBAA8WAf1d3236jlUgUkfDFGzsqYnBlanOV559ZavmJhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786270586; c=relaxed/simple;
	bh=TPFUcX3A7JoyNEA3ac/a7vTtA/ydvSA0ivyyMlAHRYI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Qy1FRX7eC5DWimG1gPU94lKbhiFdVU9cUPzgIuTZSxo35DmagkAfa7fKwGdUl/bySRDWQhxEgaKrfZK4ocL60M0YqOfQH7+cc/yLWiK4geokNGxO4jYmFecO0ZHTfl/T9VsjlYzqbUt6nNrQEObI6FtEmInBjd2jm7Yj+F2Tyls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=saarinenkoti.fi; spf=pass smtp.mailfrom=saarinenkoti.fi; dkim=pass (2048-bit key) header.d=saarinenkoti.fi header.i=@saarinenkoti.fi header.b=CHnEQxpf; arc=none smtp.client-ip=57.129.93.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=saarinenkoti.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=saarinenkoti.fi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=saarinenkoti.fi header.i=@saarinenkoti.fi header.b="CHnEQxpf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=saarinenkoti.fi;
	s=protonmail3; t=1786270574; x=1786529774;
	bh=6NdnXekWMWGk/nB2bensin1fqZep1VzxSs+L/LrylAo=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=CHnEQxpflqwiXfM7UGZmo2eLngNrzEvF4BnWHXy3imdS367HF2rEI1+9KBoX6H87h
	 s8TELUTZmqZu+Z9wW7UwZGWgnXMAf7qAWgZO12Am5OmHC/DIGAcToa9uIfLTen6vWj
	 cssxR4TYLqLDLG8A3xkGgm1qlixCaQflnWqv/sBuYjxks3gpq06+yllAp+tWwlFWlD
	 3WbZEznb8zrM6I/9PKDdIAFPuX/eRSNcksXsWKdh+Yl+/108j9hSLkg8mO14PXefsO
	 Sst55d4rJoYGgPyXIXtMHrbixIA+0fCVP+GXr4M0ZsjaDuaDc/L4mcx8C3fwYef0T5
	 lKD5W35gjAgeA==
Date: Sun, 09 Aug 2026 10:16:10 +0000
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>
From: Ville Saarinen <wiza@saarinenkoti.fi>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] ASoC: tas2783: drop firmware-owned registers from the regmap cache
Message-ID: <20260809101541.4969-4-wiza@saarinenkoti.fi>
In-Reply-To: <20260809101541.4969-1-wiza@saarinenkoti.fi>
References: <20260809101541.4969-1-wiza@saarinenkoti.fi>
Feedback-ID: 137674609:user:proton
X-Pm-Message-ID: ed479765ff40cd4976a2a049a6a8281db4b4337a
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The firmware image is downloaded with sdw_nwrite_no_pm(), which writes
straight to the peripheral and bypasses the regmap cache. The cache keeps
holding the tas2783_reg_default[] entries for every register the firmware
image owns, so cache and device disagree from the moment the download
completes.

tas2783_sdca_dev_resume() then does regcache_cache_only(false) followed by
regcache_sync(), and regcache_sync() writes out every cached register. On
a system resume the peripheral stays attached and keeps its device state,
so hw_init is still set and the firmware is never re-downloaded - but the
sync stamps the stale defaults back onto the device on top of the firmware
tuning that is still live there.

On an HP OmniBook X Flip 14, which carries two aggregated TAS2783 amps,
this was measured with a cache-bypassing debugfs read taken after an
s2idle cycle: all 12 registers where the firmware image differs from the
defaults table had reverted to their default value on both amps, and the
two amps had become byte-identical over 0x800001-0x800040. Among the lost
values are the four page-0 bytes that give each amp of a stereo pair its
own configuration. The speakers are silent after resume and stay silent
until the machine is rebooted.

Drop each downloaded file's destination range from the cache once it has
been written, so the cache no longer claims to know registers the firmware
owns and regcache_sync() has nothing stale to write over them. This is
safe: a suspend deep enough for the peripheral to actually lose its state
also takes it UNATTACHED, which clears hw_init and triggers a full
firmware re-download on re-attach.

Developed with AI assistance. The assistant diagnosed the interaction
between the cache-bypassing firmware download and the resume-time
regcache_sync(), and drafted the patch.

All hardware measurements quoted above were run by the submitter on the
affected machine. The submitter has reviewed the change, understands it
and takes responsibility for it.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Ville Saarinen <wiza@saarinenkoti.fi>
---
 sound/soc/codecs/tas2783-sdw.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/sound/soc/codecs/tas2783-sdw.c b/sound/soc/codecs/tas2783-sdw.=
c
index d1addd8ae..f79e730b0 100644
--- a/sound/soc/codecs/tas2783-sdw.c
+++ b/sound/soc/codecs/tas2783-sdw.c
@@ -912,6 +912,26 @@ static void tas2783_fw_ready(const struct firmware *fm=
w, void *context)
 =09=09=09=09"FW download failed: %d", ret);
 =09=09=09break;
 =09=09}
+
+=09=09/*
+=09=09 * The firmware image is written with sdw_nwrite_no_pm(), which
+=09=09 * bypasses the regmap cache. The cache therefore keeps holding
+=09=09 * the stale reg_defaults entries for every register the
+=09=09 * firmware owns, and the regcache_sync() done on resume writes
+=09=09 * those defaults back out over the firmware tuning. That wipes
+=09=09 * the per-amp configuration, including the channel assignment,
+=09=09 * and leaves the speakers silent until the next full re-init.
+=09=09 *
+=09=09 * Drop the firmware-owned registers from the cache so nothing
+=09=09 * stale can ever be synced over them. This is safe because a
+=09=09 * suspend deep enough to lose device state also takes the
+=09=09 * peripheral UNATTACHED, which clears hw_init and triggers a
+=09=09 * full firmware re-download on re-attach.
+=09=09 */
+=09=09if (file->length)
+=09=09=09regcache_drop_region(tas_dev->regmap, file->dest_addr,
+=09=09=09=09=09     file->dest_addr + file->length - 1);
+
 =09=09cur_file++;
 =09}
 =09mutex_unlock(&tas_dev->pde_lock);
--=20
2.55.0


