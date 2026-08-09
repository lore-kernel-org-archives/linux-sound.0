Received: from mail-06.mail-europe.com (mail-06.mail-europe.com [85.9.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CEBD37F32C;
	Sun,  9 Aug 2026 10:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.9.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786270583; cv=none; b=BOYW1bnQMVm2eFSXxt8KnSlNzQwK3wFP92a/1NCEJlP+yBkkSxp9CDyaW0ELZY81LXG8lW8wwU4jr5/fA5BhMIlO8D/Bvn5aWjIDIO0lu2XyzeP2aZ3D0Pumy4+SgEc0cWzN/oVOIKk45keBpSgGs3tDIub2uPRi0ltduhflKMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786270583; c=relaxed/simple;
	bh=jenqEVO80LcQFgofcgPccusuDcxGNNfIiAFXF9vwG+Y=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Scr7IMVvXokhJjoWrpKjY0tHDRMa38DTe2HKw8Zk5/lu3rvWXV8WrfOJFb6YPGeKghxOpI7zzrxLsL9y/XsRNa1NYU2QyM6avWGQybV8kdRYml0Mw4L7dAtiPKo6LmjtMMEda1261/c+QvNGuYAUbyPw/ctbfiYJH5H7gnzlD5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=saarinenkoti.fi; spf=pass smtp.mailfrom=saarinenkoti.fi; dkim=pass (2048-bit key) header.d=saarinenkoti.fi header.i=@saarinenkoti.fi header.b=eUPS32fD; arc=none smtp.client-ip=85.9.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=saarinenkoti.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=saarinenkoti.fi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=saarinenkoti.fi header.i=@saarinenkoti.fi header.b="eUPS32fD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=saarinenkoti.fi;
	s=protonmail3; t=1786270569; x=1786529769;
	bh=h1cNAfatHwIozSaZ53W8Ip+iNnZf6TfIMCKV+UtORxM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=eUPS32fDpY1SNXFaYTBp8VUbG2lHb+1xGcQu4bOnDZnzQOw4adn5qBL6VSYRl3XtI
	 3Eq3g65KnMuQMIAu2Wd7OL0JYjEE7Lovkbr564An5wf7QTkD49y9Lgg03BXIfzqZ+Q
	 5v7Dtj2GT7VnNUIMTg7+YtOpwcNrAh+kDBr9iiVCxTpCJerM89DWmSi7/yCJUIMi6Z
	 G9FjNKCp1Xas+KaFM5700vuiWG2cyfmwv5spJKJ46VwQTXwoagmNUhHEAQ9mZMRY5m
	 sBd00U7Rth+qcKB80WalnJeu/DV0OwvZ89Gb1fHyu6Ps1kIivPkhIdXnGIZf5ARQby
	 aTthO/NWJopDQ==
Date: Sun, 09 Aug 2026 10:16:06 +0000
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>
From: Ville Saarinen <wiza@saarinenkoti.fi>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] ASoC: tas2783: add RX Single Channel Switch to split a two-amp stereo pair
Message-ID: <20260809101541.4969-3-wiza@saarinenkoti.fi>
In-Reply-To: <20260809101541.4969-1-wiza@saarinenkoti.fi>
References: <20260809101541.4969-1-wiza@saarinenkoti.fi>
Feedback-ID: 137674609:user:proton
X-Pm-Message-ID: cbb048fb8e9c9855f22b924e3a071c1fa5c7e05a
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

A pair of TAS2783 amplifiers aggregated on one link renders the same
channel from both amplifiers, so a stereo stream is heard as the left
channel from both speakers and right-channel content is inaudible. On the
HP OmniBook X Flip 14-kc0xxx (board 8EA1) that is every stereo stream.

The SDCA control that would select the rendered channel, the UDMPU23
Cluster Index, is written only from tas2783_reg_default[] as 0x0 and
never per device -- but on this part it cannot be written at all. The
amplifier answers COMMAND_IGNORED (-ENODATA) in every state tried:
streaming, idle, and with the SDCA function confirmed actually powered on
(PDE23 Actual Power State =3D=3D ON); as a 4-byte MBQ write, as a plain
single-byte write, after clearing the latched Entity-0 status bits, and
on the Next rank of a dual-ranked control. A genuine device read of the
same Control (sdw_read_no_pm) also returns -ENODATA, which is the tell:
it is not write-protected, it is not implemented.

Do the split on the host side instead, where it costs no device access.
sdw_compute_slave_ports() advances the payload block offset by one
channel per slave port, except that a slave whose ch_mask covers every
channel of the stream is treated as mirror mode and the offset is reset
for the next slave. snd_sdw_params_to_config() hands both amplifiers
ch_mask 0x3 on a 2-channel stream, so both were given the same block
offset -- confirmed on the wire, DP1_CHANNELEN 0x03 and DP1_OFFSETCTRL1
0x41 read identically on the two amplifiers during playback.

Claiming a single channel drops the pair out of mirror mode and the core
assigns consecutive offsets in sdw_stream_add_slave() order, i.e.
dai_link codec order. Expose that as a boolean "RX Single Channel
Switch", left off by default so an unconfigured card behaves exactly as
before and the split is opt-in from the machine's UCM profile.

Note what the control deliberately does not do. It selects *whether* an
amplifier takes one channel or mirrors the whole stream; it cannot select
*which* channel. sdw_compute_slave_ports() advances the offset by
"port_bo +=3D bps * hweight32(p_rt->ch_mask)" -- the popcount of the mask
only, never which bit is set -- so BIT(0) and BIT(1) are indistinguishable
to the allocator and the side an amplifier renders is fixed by its
position in the slave iteration order, i.e. by the machine driver's codec
order. An earlier version of this patch exposed an "RX Channel Select"
enum with Left/Right values on the rt1316/rt1318 model; that was measured
to be inert in exactly that respect and would have promised an ABI the
bus cannot honour.

Measured on the affected machine with a 1 kHz tone that is left-only for
its first half and right-only for its second, isolating each amplifier by
muting the other and capturing on the internal DMIC array, with each
condition normalised to both amplifiers muted. Every run was verified from
the kernel log to have re-run hw_params with the new setting.

  With the switch on for both amplifiers:
    left content   +14.1 dB from amp 1,  +0.1 dB from amp 2
    right content   -0.4 dB from amp 1, +17.5 dB from amp 2

  With the switch off for both, i.e. the previous behaviour:
    left content   +14.0 dB from amp 1, +17.0 dB from amp 2
    right content    0.0 dB from amp 1,  -0.2 dB from amp 2

So with the switch on, each amplifier carries one side and the other side
sits within 0.4 dB of the muted floor; with it off, both amplifiers render
the same left channel and right-channel content is inaudible on both. The
level each amplifier produces is unchanged between the two settings
(+14.1 vs +14.0 for amp 1, +17.5 vs +17.0 for amp 2), which is the
expected signature of a change in which channel reaches an amplifier
rather than in its gain.

Developed with AI assistance. The assistant did the register-level
analysis, identified the mirror-mode reset in sdw_compute_slave_ports()
as the cause and drafted the patch. Several earlier hypotheses it
produced were wrong and were discarded only because they were measured:
most of the SDCA Cluster Index work summarised above, and the Left/Right
enum of the earlier version, whose changelog claimed a per-side
assignment that the bus allocator cannot implement.

All hardware measurements quoted above were run by the submitter on the
affected machine. The submitter has reviewed the change, understands it
and takes responsibility for it.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Ville Saarinen <wiza@saarinenkoti.fi>
---
 sound/soc/codecs/tas2783-sdw.c | 100 +++++++++++++++++++++++++++++++++
 1 file changed, 100 insertions(+)

diff --git a/sound/soc/codecs/tas2783-sdw.c b/sound/soc/codecs/tas2783-sdw.=
c
index 5a7ac6224..d1addd8ae 100644
--- a/sound/soc/codecs/tas2783-sdw.c
+++ b/sound/soc/codecs/tas2783-sdw.c
@@ -96,6 +96,8 @@ struct tas2783_prv {
 =09u8 rca_binaryname[64];
 =09u8 dev_name[32];
 =09bool hw_init;
+=09/* take one channel instead of mirroring; applied at hw_params */
+=09bool rx_single_ch;
 =09/* wq for firmware download */
 =09wait_queue_head_t fw_wait;
 =09bool fw_dl_task_done;
@@ -590,6 +592,84 @@ static s32 tas2783_amp_putvol(struct snd_kcontrol *kco=
ntrol,
 =09return snd_soc_put_volsw(kcontrol, ucontrol);
 }
=20
+/*
+ * UDMPU23 Cluster Index selects which channel of the incoming stream this=
 amp
+ * renders. The driver only ever sets it from tas2783_reg_default[] as 0x0=
, and
+ * never per device, so in a two-amp aggregated setup both amps come up on=
 the
+ * same cluster and render the same channel -- on the HP OmniBook X Flip 1=
4
+ * (board 8EA1) that means both speakers play the left channel and right-c=
hannel
+ * content is inaudible. The firmware blobs do encode a per-amp channel in=
 page-0
+ * config registers (0x80000a differs 2a/1a between the two blobs), but th=
e SDCA
+ * cluster index overrides it, so the split has to be set here.
+ *
+ * Unlike rt1316/rt1318, the selection CANNOT be pushed to the device. The=
 amp
+ * answers COMMAND_IGNORED (-ENODATA) to a UDMPU23 Cluster Index write in =
every
+ * state tried -- streaming, idle, and with the SDCA function verified act=
ually
+ * powered on (PDE23 Actual Power State =3D=3D ON), as a 4-byte MBQ write,=
 as a
+ * plain single-byte write, after clearing the latched Entity-0 status bit=
s, and
+ * on the Next rank of a dual-ranked control. A genuine device read of the=
 same
+ * control (sdw_read_no_pm) also returns -ENODATA, which is the tell: the =
control
+ * is not merely write-protected, it is not implemented on this part. Main=
line
+ * master carries no channel assignment for tas2783 either, so there is no=
thing
+ * upstream to backport.
+ *
+ * So the split is done on the host side instead, where it costs no device
+ * access at all. sdw_compute_slave_ports() walks the slaves of a stream a=
nd
+ * advances the payload block offset by one channel per slave port -- but =
only
+ * if the slave asked for fewer channels than the stream carries. A slave =
whose
+ * ch_mask covers every channel of the stream is treated as "mirror mode" =
and
+ * the offset is reset for the next slave, which is precisely what this dr=
iver
+ * used to request: snd_sdw_params_to_config() hands both amps ch_mask 0x3=
 on a
+ * 2-channel stream, so both were given the same block offset and both ren=
dered
+ * the same (left) samples. Confirmed on the wire: DP1_CHANNELEN 0x03 and
+ * DP1_OFFSETCTRL1 0x41 read identically on the two amps during playback.
+ *
+ * Asking for a single channel per amp drops the pair out of mirror mode, =
and
+ * the core then assigns consecutive block offsets in the order the amps c=
all
+ * sdw_stream_add_slave() -- i.e. dai_link codec order, which on this boar=
d is
+ * amp 0x9 (spk_l_endpoint, group_position 0) then amp 0xC (spk_r, positio=
n 1).
+ *
+ * Note carefully what this control can and cannot do. It selects *whether=
* this
+ * amp takes a single channel or mirrors the whole stream; it does NOT and=
 cannot
+ * select *which* channel. sdw_compute_slave_ports() advances the payload =
offset
+ * by "port_bo +=3D bps * hweight32(p_rt->ch_mask)" -- the popcount of the=
 mask
+ * only, never which bit is set -- so BIT(0) and BIT(1) are indistinguisha=
ble to
+ * the allocator, and the side an amp ends up rendering is fixed by its po=
sition
+ * in the slave iteration order. Setting this switch on both amps of a pai=
r, with
+ * the same ch_mask on both, still produces a correct stereo split; the ma=
chine
+ * driver's codec order is what assigns the sides.
+ *
+ * Off preserves the old mirror behaviour, so an unconfigured card behaves
+ * exactly as before and the split is opt-in from UCM.
+ */
+static int tas2783_rx_single_ch_get(struct snd_kcontrol *kcontrol,
+=09=09=09=09    struct snd_ctl_elem_value *ucontrol)
+{
+=09struct snd_soc_component *component =3D snd_kcontrol_chip(kcontrol);
+=09struct tas2783_prv *tas_dev =3D
+=09=09snd_soc_component_get_drvdata(component);
+
+=09ucontrol->value.integer.value[0] =3D tas_dev->rx_single_ch;
+
+=09return 0;
+}
+
+static int tas2783_rx_single_ch_put(struct snd_kcontrol *kcontrol,
+=09=09=09=09    struct snd_ctl_elem_value *ucontrol)
+{
+=09struct snd_soc_component *component =3D snd_kcontrol_chip(kcontrol);
+=09struct tas2783_prv *tas_dev =3D
+=09=09snd_soc_component_get_drvdata(component);
+=09bool val =3D !!ucontrol->value.integer.value[0];
+
+=09if (tas_dev->rx_single_ch =3D=3D val)
+=09=09return 0;
+
+=09tas_dev->rx_single_ch =3D val;
+
+=09return 1;
+}
+
 static const struct snd_kcontrol_new tas2783_snd_controls[] =3D {
 =09SOC_SINGLE_RANGE_EXT_TLV("Amp Volume", TAS2783_AMP_LEVEL,
 =09=09=09=09 1, 0, 20, 0, tas2783_amp_getvol,
@@ -597,6 +677,9 @@ static const struct snd_kcontrol_new tas2783_snd_contro=
ls[] =3D {
 =09SOC_SINGLE_RANGE_EXT_TLV("Speaker Volume", TAS2783_DVC_LVL,
 =09=09=09=09 0, 0, 200, 1, tas2783_digital_getvol,
 =09=09=09=09 tas2783_digital_putvol, tas2781_dvc_tlv),
+=09SOC_SINGLE_BOOL_EXT("RX Single Channel Switch", 0,
+=09=09=09    tas2783_rx_single_ch_get,
+=09=09=09    tas2783_rx_single_ch_put),
 };
=20
 static s32 tas2783_validate_calibdata(struct tas2783_prv *tas_dev,
@@ -992,6 +1075,23 @@ static s32 tas_sdw_hw_params(struct snd_pcm_substream=
 *substream,
 =09else
 =09=09port_config.num =3D 2;
=20
+=09/*
+=09 * Claim a single channel of the stream so the bus drops this amp out o=
f
+=09 * "mirror mode" and gives it its own payload block offset instead of t=
he
+=09 * same one as its pair. Which channel that turns out to be is decided =
by
+=09 * slave iteration order, not by the mask -- see the comment above
+=09 * tas2783_rx_single_ch_get().
+=09 */
+=09if (substream->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK &&
+=09    stream_config.ch_count > 1 && tas_dev->rx_single_ch) {
+=09=09stream_config.ch_count =3D 1;
+=09=09port_config.ch_mask =3D BIT(0);
+=09}
+
+=09dev_dbg(tas_dev->dev, "port %u: single_ch=3D%u ch_count=3D%d ch_mask=3D=
%#x\n",
+=09=09port_config.num, tas_dev->rx_single_ch,
+=09=09stream_config.ch_count, port_config.ch_mask);
+
 =09ret =3D sdw_stream_add_slave(sdw_peripheral,
 =09=09=09=09   &stream_config, &port_config, 1, sdw_stream);
 =09if (ret)
--=20
2.55.0


