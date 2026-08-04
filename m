Received: from mail-43102.protonmail.ch (mail-43102.protonmail.ch [185.70.43.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ADD642EEB8;
	Tue,  4 Aug 2026 22:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785884390; cv=none; b=odCRhx3cTWj9HfRW8Drdg6GL7hVOMHLHf2nHlUKknjKcTREnq01DxrldzycolkXf9iwj6zU10wX5kB8IFt5d5rV2VdtWx143/R3P3DhXKeGeeuagBkuDt89GS8CgFU0RepENRTScz+YLQTzMzqV0xioG6LiYplonlIfesAqzm2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785884390; c=relaxed/simple;
	bh=FcbSU32HWtanz0g3Aaz6ifgzIzsGFmbIrtF4/I8f284=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=E2Bv23c9jcoFrM7t9fv8B2fOZ/wwz2P82rGJxL9O+3o2jeR7YkTg4URgJL2Eext4uF8bY2oD9dKvPa6Sm7Py1sSxHvRmOsMGMP1pWevBbWDH+nSohkMcxcK/LT7fK8iVO0LneuBJk3YrSP2AvMXhluhZrzUz4aOHG0cdQy8EQWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=r+tIFsbl; arc=none smtp.client-ip=185.70.43.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="r+tIFsbl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1785884386; x=1786143586;
	bh=yfolc3ZlNCq8gEtauC/hqP00hwhlIABG8aeAys6n9gs=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=r+tIFsbl7FvRsX/vgPgPKQA5bgjdjMmkBrOT1nK4oq1C1ESSGip5eQ5FYHeLQ3602
	 k3MANwzUxl5etx2yzFKXmckgAeWI6DvtrPONJJw6vF2pynitvLdxSl5i053cbuhUYs
	 nQUcu1MLchk6uZwwGfRpKxfTRNN9WoyhndY3Pd0DEUnH3PBPbny5u/U+fMMht4u5er
	 vG+FtyqNWUNNTGJI+chdgpEKbLi2kJtu0blCQFkYn6r8pB9t3iXzJRTN6SnIapj2wt
	 ey3JhnuOcETd9vRhzQnCjz61cu5KRiaP1UU7Vnv3Qku7hSiMgYfweLmc1RZO3TXt7f
	 LgKC4veP31m7Q==
Date: Tue, 04 Aug 2026 22:59:42 +0000
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Oder Chiou <oder_chiou@realtek.com>, Bard Liao <yung-chuan.liao@linux.intel.com>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Kai Vehmanen <kai.vehmanen@linux.intel.com>, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Daniel Baluta <daniel.baluta@nxp.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: linux-sound@vger.kernel.org, sound-open-firmware@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] ASoC: SOF: Intel: hda: duplicate _ADR entries share one amp index
Message-ID: <20260804225853.31585-4-lsa.uz@pm.me>
In-Reply-To: <20260804225853.31585-1-lsa.uz@pm.me>
References: <20260804225853.31585-1-lsa.uz@pm.me>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: ae50e10455b4ff3fa86e218e5b40f6248c74a87d
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

find_acpi_adr_device() assigns each amplifier a name prefix carrying an
index ("rt1320-1", "rt1320-2", or Left/Right) and advances that index
once per _ADR entry. Firmware that describes one physical part with two
_ADR entries therefore consumes two indices for one device.

The Microsoft Surface Pro 11 (Intel) does exactly that. Link 0 carries:

  SWRA  _ADR 0x000030025D132000   SDCA class 0
  SWRB  _ADR 0x000030025D132001   SDCA class 1

identical but for the class id: same link, same manufacturer, part and
version, same unique id 0. The part reports class 1, so SWRB is the one
that enumerates and SWRA never attaches on any boot or firmware version
tested.

Both still reach this function, so SWRA takes index 1 and the real
amplifier is named "rt1320-2". Its controls appear as "rt1320-2 OT23 L/R
Switch". The stock sof-soundwire UCM profile expects the first
amplifier, so it enables switches on a device that is not present, and
the speakers stay silent while everything else reports success.

Compare entries that differ only in class id and give the later one the
earlier one's name prefix, jumping past the amplifier-index increment so
a repeated description consumes one index rather than several.

Testing the peripheral's attach status instead does not work here, and
was tried: at machine-select time neither entry has attached yet, so a
status test finds both unattached, no amplifier is matched at all, and
the card falls back to the HDMI-only HDA machine driver. Comparing
addresses needs no runtime state.

Signed-off-by: Sergey Lebedev <lsa.uz@pm.me>
---
 sound/soc/sof/intel/hda.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 4dbba9186..1d60a8caa 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -1245,6 +1245,22 @@ static struct snd_soc_acpi_adr_device *find_acpi_adr=
_device(struct device *dev,
 =09=09=09((u64)(sdw_device->id.sdw_version & 0xF) << 44) |
 =09=09=09((u64)(sdw_device->bus->link_id & 0xF) << 48);
=20
+=09/*
+=09 * Firmware may describe a single physical part with more than one _ADR
+=09 * entry, differing only in SDCA class id. Those entries are the same
+=09 * device: they must share a name prefix, and only the first of them ma=
y
+=09 * consume an amp index. Otherwise the part that actually enumerates is
+=09 * named as though it were the second amplifier, and UCM profiles
+=09 * written for the first one address a device that is not there.
+=09 */
+=09for (j =3D 0; j < index; j++) {
+=09=09if ((adr_dev[j].adr & ~SDW_CLASS_ID_MASK) =3D=3D
+=09=09    (adr_dev[index].adr & ~SDW_CLASS_ID_MASK)) {
+=09=09=09adr_dev[index].name_prefix =3D adr_dev[j].name_prefix;
+=09=09=09goto done_name_prefix;
+=09=09}
+=09}
+
 =09if (!codec_info_list[i].is_amp) {
 =09=09/* For non-amp codecs, get name_prefix from codec_info_list[] */
 =09=09adr_dev[index].name_prefix =3D devm_kasprintf(dev, GFP_KERNEL, "%s",=
 name_prefix);
--=20
2.50.1 (Apple Git-155)


