Received: from mail-244121.protonmail.ch (mail-244121.protonmail.ch [109.224.244.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B20E141E6A8;
	Tue,  4 Aug 2026 22:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.121
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785884389; cv=none; b=YgoeAGG72dyw++gjil4cebV2GAVSD9tNndWALD8YLDmaeqV9x2bkOjuMeg3wytzSCIuq3juGYKiS9C4HGzRu28OpbRetGEtSMYzXUBY/YANvaT/xlYv8PFvlICWw94jZeDJIxKfwogSS7ZacmVettSkVuMnma4KryOHeFLAIzOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785884389; c=relaxed/simple;
	bh=t8d4uKou6G+tMLFCmjLjpyA4UZfkG1yzPZEN5enrpjQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qk/YZpmwXbswGOEUNJ9XlhbC4YRocaHqEP7qK3KpE1N7UqT8zYrdIApqftnq34V9Tw4tdMeTTfPuiLBkfBCNOdWYWWA12DPQt0eNcCla8DEHWUL+LUKdS2olUiOAsNQfPCxZU5uTJb+UDteb4n/YvaS8KAkn+f20t2L11os6r3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=hL4WtNaG; arc=none smtp.client-ip=109.224.244.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="hL4WtNaG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1785884378; x=1786143578;
	bh=h0ldZ3M4T+Y2V2+nIOJQnksyEUH6FXCznnKgGiPZ0Kc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=hL4WtNaGuL/SpMeCJaWul1pEepO3q4MPmRHHno8lt5j4gSgjh5pdpy/GWqOAenx2u
	 LHXyMB0uae2jrEr3EWkTQiA7Chn+P/3IuqgmQHq2niV9nD3yMLB4AIyV70fe3zgQuh
	 eHDUWGoRsDDF9rriNZ+tjEy/2EEVHMPorR2HRUSVIdP2TxVVdFDVNPeMJBARgLKGpC
	 LPowvmc42Fw5sSN98vdF3EYulx7MMNnDIYHEwcvt5T+tOXU/fe3JJIoecq/Kyli9IU
	 XfoC2PR2WU2/4oN9UB5DcHj4gjG4LQzw6nbLv93sUYOfr3+Rr/gICMcygbkf4VOtMP
	 be4/l35xA1WtQ==
Date: Tue, 04 Aug 2026 22:59:34 +0000
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Oder Chiou <oder_chiou@realtek.com>, Bard Liao <yung-chuan.liao@linux.intel.com>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Kai Vehmanen <kai.vehmanen@linux.intel.com>, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Daniel Baluta <daniel.baluta@nxp.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: linux-sound@vger.kernel.org, sound-open-firmware@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] ASoC: sdw_utils: skip endpoints of a peripheral that is not on the bus
Message-ID: <20260804225853.31585-3-lsa.uz@pm.me>
In-Reply-To: <20260804225853.31585-1-lsa.uz@pm.me>
References: <20260804225853.31585-1-lsa.uz@pm.me>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: eb3d61e3ec59c6436c2c263369dd81862a8c3319
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

asoc_sdw_parse_sdw_endpoints() builds DAI links for every endpoint of
every _ADR entry the firmware declares. If a declared peripheral never
enumerates, its links are still created and later fail to prepare, which
takes the whole link down rather than degrading it:

  sof_sdw sof_sdw: ASoC: error at snd_soc_link_startup on
    SDW0-Playback-SmartAmp: -61

The Microsoft Surface Pro 11 (Intel) declares one physical RT1320 twice,
as two _ADR entries on link 0 differing only in SDCA class id:

  SWRA  _ADR 0x000030025D132000   class 0
  SWRB  _ADR 0x000030025D132001   class 1

Same link, same manufacturer, part and version, same unique id 0. The
part reports class 1, so only SWRB enumerates. SWRA is a phantom and
stays UNATTACHED across every boot and every firmware version tested,
including the November 2025 bundle.

The existing is_sdca_endpoint_present() check cannot filter it out.
Setting aside that it is gated on a non-zero class id and the phantom is
the class-0 entry, the deeper problem is that the BIOS describes both
entries identically: each declares the same two SDCA functions, so the
check matches for either. Bus presence is what distinguishes them, so
test that.

The check is by nature a runtime one, and its correctness depends on the
peripheral having enumerated by the time the card probes. That holds
here: the real device is Attached and the phantom has no device number
at all whenever this runs. It is a weaker property than the surrounding
BIOS-driven checks, and a suggestion for something stronger would be
welcome, but the firmware offers nothing else to key on.

Signed-off-by: Sergey Lebedev <lsa.uz@pm.me>
---
 sound/soc/sdw_utils/soc_sdw_utils.c | 46 +++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/sound/soc/sdw_utils/soc_sdw_utils.c b/sound/soc/sdw_utils/soc_=
sdw_utils.c
index d8db8fc53..12ca4bdd4 100644
--- a/sound/soc/sdw_utils/soc_sdw_utils.c
+++ b/sound/soc/sdw_utils/soc_sdw_utils.c
@@ -1909,6 +1909,46 @@ int asoc_sdw_get_dai_type(u32 type)
 }
 EXPORT_SYMBOL_NS(asoc_sdw_get_dai_type, "SND_SOC_SDW_UTILS");
=20
+/*
+ * Some firmware describes one physical peripheral with two _ADR entries t=
hat
+ * differ only in SDCA class id, on the same link and with the same unique=
 id.
+ * Only the entry whose class id matches the part ever enumerates; the oth=
er is
+ * a phantom. Building DAI links for it fails the whole link rather than
+ * degrading it, so the endpoints have to be skipped.
+ *
+ * This cannot be decided from the BIOS description: on the machine that
+ * prompted this, both entries declare an identical set of SDCA functions,=
 so
+ * is_sdca_endpoint_present() below matches for either. Bus presence is th=
e only
+ * thing that distinguishes them.
+ */
+static bool is_peripheral_attached(struct device *dev,
+=09=09=09=09   const struct snd_soc_acpi_link_adr *adr_link,
+=09=09=09=09   int adr_index)
+{
+=09const char *sdw_codec_name;
+=09struct device *sdw_dev;
+=09struct sdw_slave *slave;
+=09bool attached;
+
+=09sdw_codec_name =3D _asoc_sdw_get_codec_name(dev, adr_link, adr_index);
+=09if (!sdw_codec_name)
+=09=09return true;
+
+=09sdw_dev =3D bus_find_device_by_name(&sdw_bus_type, NULL, sdw_codec_name=
);
+=09if (!sdw_dev)
+=09=09return true;
+
+=09slave =3D dev_to_sdw_dev(sdw_dev);
+=09attached =3D slave->status !=3D SDW_SLAVE_UNATTACHED;
+=09if (!attached)
+=09=09dev_dbg(dev, "%s not present on the bus, skipping its endpoints\n",
+=09=09=09sdw_codec_name);
+
+=09put_device(sdw_dev);
+
+=09return attached;
+}
+
 /**
  * is_sdca_endpoint_present - Check if an SDCA endpoint is present on the =
SDW peripheral
  * @dev: Device pointer
@@ -2065,6 +2105,12 @@ int asoc_sdw_parse_sdw_endpoints(struct snd_soc_card=
 *card,
 =09=09=09=09dai_info =3D &codec_info->dais[adr_end->num];
 =09=09=09=09soc_dai =3D asoc_sdw_find_dailink(soc_dais, adr_end);
=20
+=09=09=09=09/* skip a peripheral that is not on the bus at all */
+=09=09=09=09if (!is_peripheral_attached(dev, adr_link, i)) {
+=09=09=09=09=09(*num_devs)--;
+=09=09=09=09=09continue;
+=09=09=09=09}
+
 =09=09=09=09/*
 =09=09=09=09 * quirk should have higher priority than the sdca properties
 =09=09=09=09 * in the BIOS. We can't always check the DAI quirk because we
--=20
2.50.1 (Apple Git-155)


