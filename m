Received: from mail-244117.protonmail.ch (mail-244117.protonmail.ch [109.224.244.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 965CB3C4577;
	Sun,  9 Aug 2026 10:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.117
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786270525; cv=none; b=Zfmnd6sfCs/RF16QE48P9ttQ9d/A2V608xYc7s74oPbZPSo8kqOwnzsRrmTA0EnH2W9bOx0UWNWSWmW9edGvmHqTD2vgwMN2gYaD+G8E1c1Z8QJ9k9vPbPydhk5qOul+MFAiLpbgLA80GvviylBpEi9yLq4qQFCB3n98s+mkxH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786270525; c=relaxed/simple;
	bh=K4J5nAHCr8KJcWR+RNTGOeDFyRZKohdrU4g6x85FtzU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L6OXVFliQTNsBWNwIUUgPcnvgaWBjLl4C/ch+EnuZqXQAkaHBqL0NeKrCYceXndKDAc1uF0PA3JTAK6eS8nCHHjfN/E0Stx3RilkDvb6/D9pFbYn7hQdFsQ0jHh9otoaXXodCsbeUgd57OyyV0D4zkmueNfMhR1Znsu8LuOOS8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=saarinenkoti.fi; spf=pass smtp.mailfrom=saarinenkoti.fi; dkim=pass (2048-bit key) header.d=saarinenkoti.fi header.i=@saarinenkoti.fi header.b=GH5x+xLn; arc=none smtp.client-ip=109.224.244.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=saarinenkoti.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=saarinenkoti.fi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=saarinenkoti.fi header.i=@saarinenkoti.fi header.b="GH5x+xLn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=saarinenkoti.fi;
	s=protonmail3; t=1786270514; x=1786529714;
	bh=K4J5nAHCr8KJcWR+RNTGOeDFyRZKohdrU4g6x85FtzU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=GH5x+xLnowwMloUc87Gl3c87g1Y4QeJcoZrzJDrb1ebRL8r+NgAjopNdWP1Px48Qg
	 JnUDCXfHSlx1804mS6PnWVuZgsmKSBscQFnAVoKpg3pWPj3rwOK8qE+cqxKIv0EuYn
	 XX2U9g+IM9Ex6GlWky9MrtMVfs6f64vydUPlgImxGexfKPJEWq5YOwbLvt3wSXE779
	 H9OjTtGR7e0qETq9QtHLN/GLg8+mR8I6ubBtDxZDBf2J865peWdgH6v+PKkjyqHl9U
	 YJRebQj11N+wkp1SGT+O15DhoBHfY92UQaAmEpMR44jKJrxSba8FHrDOX5+nzbltzS
	 dlZDuo5O2URLg==
Date: Sun, 09 Aug 2026 10:15:09 +0000
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
From: Ville Saarinen <wiza@saarinenkoti.fi>
Cc: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ASoC: amd: acp70: add HP OmniBook X Flip 14 SoundWire machine
Message-ID: <20260809101439.4798-3-wiza@saarinenkoti.fi>
In-Reply-To: <20260809101439.4798-1-wiza@saarinenkoti.fi>
References: <20260809101439.4798-1-wiza@saarinenkoti.fi>
Feedback-ID: 137674609:user:proton
X-Pm-Message-ID: 816cfb66c2660c63b66cf1667aaec03968cce477
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Describe the SoundWire topology of the HP OmniBook X Flip 14-kc0xxx
(board 8EA1): two TAS2783 smart amplifiers aggregated on link 0 (unique
IDs 0xC and 0x9, group_position 0 and 1, name prefixes tas2783-1 and
tas2783-2) driving the left and right internal speakers, and an RT712-VB
on link 1 providing the headset jack on AIF1 and the internal DMIC array
on AIF3. The RT712 amplifier path (AIF2) is left unused because the
speakers are driven by the external TAS2783 pair, so the existing
jack_dmic_endpoints array describes it exactly.

The entry is gated on snd_soc_acpi_amd_sdca_is_device_rt712_vb() so it
does not capture a board carrying a different link 1 codec.

Developed with AI assistance. The assistant derived the link topology
from the enumerated peripherals and drafted the table entry. The order
of the two amplifier entries, which is what assigns the physical sides,
was corrected after a listening test by the submitter.

All hardware measurements quoted above were run by the submitter on the
affected machine. The submitter has reviewed the change, understands it
and takes responsibility for it.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Ville Saarinen <wiza@saarinenkoti.fi>
---
 sound/soc/amd/acp/amd-acp70-acpi-match.c | 56 ++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/sound/soc/amd/acp/amd-acp70-acpi-match.c b/sound/soc/amd/acp/a=
md-acp70-acpi-match.c
index ccd01152c..815e088b4 100644
--- a/sound/soc/amd/acp/amd-acp70-acpi-match.c
+++ b/sound/soc/amd/acp/amd-acp70-acpi-match.c
@@ -659,6 +659,56 @@ static const struct snd_soc_acpi_link_adr acp70_rt721_=
l1u0_tas2783x2_l1u8b[] =3D {
 =09{}
 };
=20
+static const struct snd_soc_acpi_adr_device rt712_vb_l1u0_adr[] =3D {
+=09{
+=09=09.adr =3D 0x000130025D071201ull,
+=09=09/*
+=09=09 * On this platform speakers are provided by two TAS2783 amps,
+=09=09 * so the AIF2 amp path is left unused: jack + DMIC only.
+=09=09 */
+=09=09.num_endpoints =3D ARRAY_SIZE(jack_dmic_endpoints),
+=09=09.endpoints =3D jack_dmic_endpoints,
+=09=09.name_prefix =3D "rt712"
+=09}
+};
+
+/*
+ * Unique ID 0xC drives the left speaker and 0x9 the right one. The order =
of the
+ * entries matters as much as the endpoints: asoc_sdw_parse_sdw_endpoints(=
)
+ * appends them to the dailink in array order and sdw_compute_slave_ports(=
)
+ * hands out payload block offsets in that same order, so the first entry =
is the
+ * one that receives channel 0.
+ */
+static const struct snd_soc_acpi_adr_device tas2783x2_l0u9c_adr[] =3D {
+=09{
+=09=09.adr =3D 0x00003C0102000001ull,
+=09=09.num_endpoints =3D 1,
+=09=09.endpoints =3D &spk_l_endpoint,
+=09=09.name_prefix =3D "tas2783-1",
+=09},
+=09{
+=09=09.adr =3D 0x0000390102000001ull,
+=09=09.num_endpoints =3D 1,
+=09=09.endpoints =3D &spk_r_endpoint,
+=09=09.name_prefix =3D "tas2783-2",
+=09},
+};
+
+/* HP OmniBook X Flip 14-kc0xxx (board 8EA1) */
+static const struct snd_soc_acpi_link_adr acp70_tas2783x2_l0u9c_rt712_vb_l=
1u0[] =3D {
+=09{
+=09=09.mask =3D BIT(0),
+=09=09.num_adr =3D ARRAY_SIZE(tas2783x2_l0u9c_adr),
+=09=09.adr_d =3D tas2783x2_l0u9c_adr,
+=09},
+=09{
+=09=09.mask =3D BIT(1),
+=09=09.num_adr =3D ARRAY_SIZE(rt712_vb_l1u0_adr),
+=09=09.adr_d =3D rt712_vb_l1u0_adr,
+=09},
+=09{}
+};
+
 static const struct snd_soc_acpi_endpoint rt721_endpoints[] =3D {
 =09{ /* Jack Playback/Capture Endpoint (AIF1) */
 =09=09.num =3D 0,
@@ -704,6 +754,12 @@ struct snd_soc_acpi_mach snd_soc_acpi_amd_acp70_sdw_ma=
chines[] =3D {
 =09=09.links =3D acp70_tas2783_2,
 =09=09.drv_name =3D "amd_sdw",
 =09},
+=09{
+=09=09.link_mask =3D BIT(0) | BIT(1),
+=09=09.links =3D acp70_tas2783x2_l0u9c_rt712_vb_l1u0,
+=09=09.machine_check =3D snd_soc_acpi_amd_sdca_is_device_rt712_vb,
+=09=09.drv_name =3D "amd_sdw",
+=09},
 =09{
 =09=09.link_mask =3D BIT(0) | BIT(1),
 =09=09.links =3D acp70_rt1320_l0_rt722_l1,
--=20
2.55.0


