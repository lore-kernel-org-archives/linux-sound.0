Received: from mail-106118.protonmail.ch (mail-106118.protonmail.ch [79.135.106.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A01693C5DCD
	for <linux-sound@vger.kernel.org>; Wed,  5 Aug 2026 18:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785954934; cv=none; b=iCNBhvoI5Lcqzc+/MfjGS6sJl5V04MXIR7FaaMUzBE/8NmVv4MibgUN2Nb2hIB4n8thvQpsEdculHjrk2Yqo6dLf1RRoEQt64rgPQfXKjgLo+0tgkixE5OAvsniSHXhQSY57cpWx/xQtLgZ1TaDC5qV5vsBiqe7GH9tRLWUbxnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785954934; c=relaxed/simple;
	bh=NPI4E599ABpGFN7EnBHc3tJF2+ybagbegW2g4vW95xg=;
	h=Date:To:From:Subject:Message-ID:MIME-Version:Content-Type; b=GRDs58rRNwtAoxjJszUyTnplh2HtQJ5jJM1PenM9DLYUfwNF++bBQRhl3n1jxyR+0aakle0YDtwcpjugoBiwigbB/zC91QCeSJQ5RrFH53wmrAhdU3A2wE/ieu/lp23wNDwyhG7ZN1yK60mEg0gTG+4/SdKHVPil7vB1RT99PEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=lvGAmici; arc=none smtp.client-ip=79.135.106.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="lvGAmici"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1785954928; x=1786214128;
	bh=ZLZCd47mFE0ps1xpZsbWjymhII3bKCSckiWcZyVYtSQ=;
	h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=lvGAmiciSDOrsiD1GRkt6GyJwpvqcbCGpIJNSfIX9EF8eaSfoEOqVmRWAhdnUJwRP
	 LnL21ru77vHrxf7lQSfuQXOod8o45VI5KXm7QSKsGhSBAMi3DIPdmrqVaDGUnC5lTU
	 MLh//rFaK4cJS6GtA7Yg6Bq3drC2tgSAeiTKADAXcCIpobOZ66r99qk3gNILDhUUb4
	 iU7O5Wi/z5MkWT2X7ZySSSQ0awURtujr+2i4b/brZT3bvlWkvTa1WRDD3DXSQUprf4
	 DE0FmE+rlXJW/1GkkB1aP9v5nHPgfECEImttLyRhIEjrvMN2kIA2UstUkcCtthzG7B
	 EGxCx4m3ibXbA==
Date: Wed, 05 Aug 2026 18:35:22 +0000
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, Niranjan H Y <niranjan.hy@ti.com>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org
From: Robin Everaars <robineveraars@pm.me>
Subject: [BUG] ASoC: tas2783-sdw: every amp on the link selects the same channel, so a two-amp board plays mono
Message-ID: <20260805183517.8665-1-robineveraars@pm.me>
Feedback-ID: 201127006:user:proton
X-Pm-Message-ID: 8b7d541f4a94fcc345cb4dbabd40d4f621f274ed
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature"; micalg=pgp-sha256; boundary="------75c617636601ae1529982360daaf7ee04d00cf26d13805d36b07b1fb38d5dd62"; charset=utf-8

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------75c617636601ae1529982360daaf7ee04d00cf26d13805d36b07b1fb38d5dd62
Content-Type: multipart/mixed;
 boundary=2fc50b3a6f77723fd68721cfda96ac8d71bcbe09eb2bf4caae3498b8b18e
From: Robin Everaars <robineveraars@pm.me>
To: Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Niranjan H Y <niranjan.hy@ti.com>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org
Subject: [BUG] ASoC: tas2783-sdw: every amp on the link selects the same channel, so a two-amp board plays mono
Date: Wed,  5 Aug 2026 20:35:17 +0200
Message-ID: <20260805183517.8665-1-robineveraars@pm.me>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0

--2fc50b3a6f77723fd68721cfda96ac8d71bcbe09eb2bf4caae3498b8b18e
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On an ASUS ProArt PX13 HN7306EAC (AMD Strix Halo, amd_sdw_manager, two
TAS2783 plus an rt721-sdca on one SoundWire link) both TAS2783
amplifiers reproduce the stream's LEFT channel. The right channel is
delivered on the bus, received by both amps and never rendered by any
speaker. The machine plays mono, at full volume, with no error anywhere
in the log.

The cause is a single unconditional write. tas2783_init_seq[0] writes
0x01 to SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_PPU21, 0x10, 0) on every amp
that probes (sound/soc/codecs/tas2783-sdw.c:306 in v7.1.5, :308 in
today's mainline). That register appears to be the per-amp output
channel selector, and nothing in the driver ever gives it a different
value per device.

We are reporting the behaviour and the evidence rather than sending a
patch, because the last step needs information only TI has: the
authoritative meaning and value encoding of that control, and where a
per-amp value is supposed to come from. The specific
 questions are at
the end.

There is one thing we would ask you to read even if you skip the rest:
the obvious-looking fix, keying the FU21 mute channel per amp, is a
measured dead end that breaks audio after resume. That section is
below, with the kernel's own error code, so nobody repeats it.


Hardware and software
=====================

Machine:        ASUS ProArt PX13 HN7306EAC
DMI:            sys_vendor ASUS, product_name "ProArt PX13 HN7306EAC",
                board_name HN7306EAC, product_version 1.0,
                BIOS HN7306EAC.307 dated 01/27/2026
SoC:            AMD Strix Halo, ACP 7.0
Kernel:         7.1.5 x86_64, no out of tree audio patches
linux-firmware: 20260622
ALSA card:      card 1, id "amdsoundwire", driver "amd-soundwire",
                longname
                "ASUSTeKCOMPUTERINC.-ProArtPX13HN7306EAC-1.0-HN7306EAC"
PCI parent:     0000:c4:00.5, vendor 0x1022 device 0x15e2,
                subsystem 0x1043:0x1714

Peripherals, all th
ree on sdw-master-0-1 (amd_sdw_manager.1, SDW1):

  sdw:0:1:0102:0000:01:8   TAS2783, device_number 3, slave-tas2783
  sdw:0:1:0102:0000:01:b   TAS2783, device_number 2, slave-tas2783
  sdw:0:1:025d:0721:01     RT721 SDCA, rt721-sdca

Mixer controls the two amps expose on this kernel:

  numid=9,iface=MIXER,name='tas2783-1 Amp Volume'
  numid=10,iface=MIXER,name='tas2783-1 Speaker Volume'
  numid=11,iface=MIXER,name='tas2783-2 Amp Volume'
  numid=12,iface=MIXER,name='tas2783-2 Speaker Volume'

There is no channel or output selection control of any kind.


The observable defect
=====================

Play a stereo stream. Sound comes out of both speakers, and it is the
left channel of the stream in both. Content that exists only in the
right channel is inaudible. Nothing is logged.

This is easy to miss, and it was missed here for weeks, because every
casual test asks "is there sound" rather than "is there sound in both
channels". On a 13 inch chassis the two sp
eakers are close enough that
listening does not settle it.


How it was measured
===================

Ears were not trusted. The test plays a 2 kHz tone in one channel at a
time through the speakers and measures the acoustic result with the
machine's own DMIC array, scoring each recorded window with a Goertzel
filter at 2 kHz. Figures are Goertzel magnitudes, so they are
comparable within the table and the baseline row is the noise floor.

  window       mic L    mic R   verdict
  baseline       0.3      0.3   noise floor
  left only   4569.0   5358.0   +84 dB over baseline
  right only     0.3      0.2   +0.4 dB, indistinguishable from silence
  both        4554.0   5359.0   identical to left alone

"both" matching "left only" to within 0.3 percent is the whole finding.
The right channel contributes nothing acoustically.

Both amps are alive and both have firmware. Muting each in turn through
its "tas2783-N Speaker Volume" control (value 0 is -100 dB on that
co
ntrol, so it is a real mute) gives:

  configuration        mic L    mic R   conclusion
  only tas2783-1      3445.0   1034.0   hotter on mic L, so amp 1 = left
  only tas2783-2      1737.0   4616.0   hotter on mic R, so amp 2 = right
  both muted             0.4      0.5   floor

So the physical mapping is tas2783-1 to the left speaker and tas2783-2
to the right speaker, which is what asoc_sdw_ti_spk_rtd_init() in
sound/soc/sdw_utils/soc_sdw_ti_amp.c:57-64 already assumes when it maps
name_prefix tas2783-1 to "Left Spk" and tas2783-2 to "Right Spk". The
machine glue has the mapping. The codec driver never receives it.

This is not a dead amp and not a firmware download failure.


What the code does
==================

Line numbers are v7.1.5 unless stated. The same code is in mainline
today, checked against master on 2026-08-05.

1. Both amps receive both bus channels. snd_sdw_params_to_config() sets
   port_config->ch_mask = GENMASK(stream_config->ch_count - 1,
 0)
   (include/sound/sdw.h:46) identically for every peripheral, so each
   amp has both channels available and must select one internally.

2. On this platform there is no SDCA function description for the amps,
   so the driver takes its static fallback. tas_sdw_probe() only calls
   sdca_parse_function() when the peripheral reports an SDCA function
   (tas2783-sdw.c:1292-1319). On this machine the SDCA parser rejects
   both amps:

     acpi device:24: SDCA function UAJ (type 6) at 0x1
     acpi device:26: function type only supported as DisCo constant
     acpi device:28: function type only supported as DisCo constant

   device:24 is the RT721. device:26 and device:28 are the two amps.
   That message is sound/soc/sdca/sdca_functions.c:138, emitted when
   mipi-sdca-control-0x5-subproperties carries no
   mipi-sdca-control-dc-value, so the function type cannot be read. The
   result is num_functions == 0 for both amps, tas_dev->sa_func_data
   stays NULL, and n
o Channel Cluster table is parsed
   (mipi-sdca-cluster-id-list, sdca_functions.c:2012).

3. With sa_func_data NULL, tas_io_init() writes the static sequence
   instead of the DisCo init table (tas2783-sdw.c:1174-1179):

     if (tas_dev->sa_func_data)
             ret = sdca_regmap_write_init(dev, tas_dev->regmap,
                                          tas_dev->sa_func_data);
     else
             ret = regmap_multi_reg_write(tas_dev->regmap,
                                          tas2783_init_seq,
                                          ARRAY_SIZE(tas2783_init_seq));

4. The first entry of that sequence is the same value for every amp
   (tas2783-sdw.c:306):

     REG_SEQ0(SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_PPU21, 0x10, 0x00), 0x01)

   TAS2783_SDCA_ENT_PPU21 is 0x10 and the control selector is 0x10
   (tas2783.h:66 and tas2783.h:87). Every amp on the link therefore ends
   up with the same value in that control, and by the measurement above
   that value
 corresponds to the left channel.

Adjacent inconsistency in the same register, for whatever it is worth:
tas2783_reg_default[] lists that identical register with a default of
0x0 (tas2783-sdw.c:276), while the init sequence writes 0x01. The
register is readable, non-volatile and cached under REGCACHE_MAPLE, so
the cached default and the value the driver actually programs disagree.


What we ruled out, so you do not have to
========================================

Keying the FU21 mute channel per amp does not work
--------------------------------------------------

tas_fu21_event() writes the FU21 mute with the channel index as a
literal 1 (tas2783-sdw.c:830-831), and tas_fu23_event() carries the same
literal (tas2783-sdw.c:852-853). Since the 4th argument of
SDW_SDCA_CTL is the channel number
(include/linux/soundwire/sdw_registers.h:335-342), and since
TAS2783_DEVICE_CHANNEL_RIGHT is declared at tas2783.h:90 and referenced
nowhere in the driver while TAS2783_DEVI
CE_CHANNEL_LEFT is used at
tas2783-sdw.c:352, this looks like an unfinished per-amp channel
selection. It is not.

We built a kernel that picks the FU21 mute channel per amp from
name_prefix, the same idiom soc_sdw_rt_amp.c uses for the Realtek amps.
It compiled and it landed where intended. It changed nothing
acoustically. The kernel says why:

  amd_sdw amd_sdw: ASoC: POST_PMU: tas2783-2 FU21 event failed: -61

-61 is -ENODATA. FU21 on this device has exactly one channel, index 1.
Channel 2 does not exist, so TAS2783_DEVICE_CHANNEL_RIGHT cannot address
FU21 at all. Measurement agreed: with that kernel live, left-only
playback with only amp 2 unmuted was still audible at the same level as
before (1643/4555 against 1643/4616), so amp 2 was still reproducing the
left channel.

It is worse than a no-op. After an s2idle resume that kernel silenced
ALL audio, including the left channel that had been working:

  ASoC: POST_PMU: tas2783-2 FU21 event failed: -61
  ASoC: 
PRE_PMD: tas2783-2 FU21 event failed: -61

tas2783_reg_default[] has the FU21 mute for channel 1 set to muted
(tas2783-sdw.c:187), the amps come back from resume with that applied,
and the mis-targeted unmute to channel 2 fails, so nothing ever unmutes.
FU21's mute is a working mute. It is simply not a channel selector. We
reverted that kernel and are not proposing it.

UDMPU23 ClusterIndex is not it either
-------------------------------------

tas2783_reg_default[] writes the UDMPU23 ClusterIndex as cluster 0
identically for every amp (tas2783-sdw.c:302):

  {SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_UDMPU23,
                TAS2783_SDCA_CTL_UDMPU_CLUSTER, 0), 0x0}

That was our first suspect after FU21, on the reasoning that per-amp
channel choice ought to come from a cluster. It is per-link constant in
the same way, so it is worth a look, but it is not the register that
third parties have made work. PPU21 is.


This is already reported downstream, with the same root c
ause
============================================================

We searched before writing, and the defect is not new. It is diagnosed
in a distribution issue tracker but has never been reported on this
list, and no patch addressing it has ever been posted. The most useful
prior work:

  https://github.com/CachyOS/linux-cachyos/issues/737
  "[BUG] ASUS ProArt PX13 HN7306EA - No sound (AMD ACP70 no playback
   device)", opened 2026-02-27, 111 comments, still open

Inside that thread:

- 2026-07-06, ftoleedo, comment 4895230923, reaches the same conclusion
  independently: "The ASUS ACPI tables carry no usable SDCA/DisCo
  function data (function type only supported as DisCo constant in
  dmesg), so the driver falls back to a static init that writes DSP
  cluster index 0x01 to both amps. Result: mono out of a single
  speaker". Same message, same register, same value, different
  reporter, different distribution. That comment also states the defect
  is still pres
ent in v7.2-rc1.

- Neal Starkie's out of tree patch 0010-control-to-set-channel.patch
  exposes exactly that register as an ALSA enum, and it is reported
  working by several PX13 owners:

    static const unsigned int tas2783_ch_values[] = {
            0, /* Off */
            1, /* Left */
            4, /* Right */
    };
    static SOC_VALUE_ENUM_SINGLE_DECL(tas2783_ch_enum,
            SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_PPU21,
                         SDCA_CTL_UDMPU_CLUSTERINDEX, 0),
            0, 0x7, tas2783_ch_select, tas2783_ch_values);

  Users then set 'tas2783-1 Channel Playback' to Left and
  'tas2783-2 Channel Playback' to Right and get stereo. Reported
  working by ftoleedo, bjuraszewski and bcs-23 in that thread, and
  carried as a DKMS module at
  https://github.com/ftoleedo/px13-audio-fix (module/tas2783-sdw.c).

  To be explicit about provenance: we have not built or measured that
  control on this machine. We are quoting it because it names t
he same
  register our own source reading and measurements point at, and
  because its "1 means left" half is exactly what our acoustic results
  show for both amps.

- Neal Starkie has posted to this list once, and it was not this patch:
  https://patchwork.kernel.org/project/alsa-devel/patch/20260410170149.238916-1-nealstarkie@gmail.com/
  ("ALSA: tas2783-sdw: add Playback to volume controls name",
  2026-04-10, still in state new). The channel control was never sent
  upstream.

What we could not find anywhere, having searched the alsa-devel
patchwork project for tas2783, UDMPU, cluster, mono and stereo, and
marc.info for linux-sound:

- no mailing list report of this defect;
- no patch, merged or posted, that gives the channel selector a
  different value per amp;
- no SDCA cluster documentation that pins down the TAS2783 encoding.

The only tas2783 patches currently in flight are two register table
fixes posted on 2026-08-05, neither of which changes this beha
viour:

  https://patchwork.kernel.org/project/alsa-devel/patch/20260805091327.23944-1-peter.ujfalusi@linux.intel.com/
  "ASoC: tas2783-sdw: drop duplicate reg_default entry"

  https://patchwork.kernel.org/project/alsa-devel/patch/20260805091327.23944-2-peter.ujfalusi@linux.intel.com/
  "ASoC: tas2783-sdw: sort the register default table"

The second one is worth a note here even though it is unrelated to the
mono defect. It reports that tas2783_reg_default[] is sorted by SDCA
entity rather than by register address, so regcache_lookup_reg()'s
bsearch misses 120 of its 196 entries and those get rewritten on every
regcache_sync(). Both patches keep the PPU21 and UDMPU23 defaults
discussed above unchanged.

The last commit to touch sound/soc/codecs/tas2783-sdw.c in mainline is
e26bb459d0f3 ("ASoC: tas2783: Update loaded firmware names to
linux-firmware 20260519", 2026-06-23), which is the firmware naming fix
and does not touch channel handling.


What we are asking

==================

We are not asking you to take a patch from us. We are asking for the
three facts that decide what the correct patch is, because they are not
derivable from the driver source or from userspace.

1. Is SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_PPU21, 0x10, 0) the intended
   per-amp output channel selector on the TAS2783, and what is the
   value encoding? The out of tree control above uses 0 for off, 1 for
   left and 4 for right over a 3 bit field. That looks like a bitmask
   rather than an index. If it is a mask, what does 5 do? Is there a
   defined value for "sum both channels" that a mono board should be
   using?

2. What does that control actually mean, because the two headers in the
   tree disagree? tas2783.h:87 names selector 0x10
   TAS2783_SDCA_CTL_UDMPU_CLUSTER, which matches
   SDCA_CTL_UDMPU_CLUSTERINDEX (include/sound/sdca_function.h:425). But
   the entity written here is PPU21, and for a Post Processing Unit the
   SDCA spec assigns selec
tor 0x10 to PostureNumber
   (include/sound/sdca_function.h:528). Which of the two meanings does
   TAS2783 PPU21 implement at 0x10? A driver that gets
   this wrong will keep working by accident and will be impossible to
   review.

3. Where is the per-amp value supposed to come from? We can see four
   candidates and cannot choose between them from outside:

   a. the SDCA Channel Cluster table in the amp's DisCo description.
      This is what sdca_asoc.c:1560 set_cluster() already does for
      generic SDCA devices: walk the ClusterIndex Range rows, look up
      each cluster with sdca_id_find_cluster(), and pick the one whose
      channel count and channel relationship match. sdca_channel
      already carries GENERIC_LEFT, GENERIC_RIGHT, FRONT_LEFT and
      FRONT_RIGHT relationships for exactly this purpose. The driver
      already parses and holds a struct sdca_function_data when one is
      available, and uses it only for sdca_regmap_write_init(). Should

      the cluster lookup be the primary path?

   b. the per-amp firmware blob. On this machine the two blobs are
      distinct files (ti/audio/tas2783/1714-1-0x8.bin and 1714-1-0xB.bin
      in linux-firmware 20260622, 7273 and 7272 bytes), so they could
      in principle carry the channel. Do they, and if so does the DSP
      apply it, or is the register write still required afterwards?

   c. a DisCo or _DSD property naming the channel per peripheral, keyed
      on unique_id or on the SoundWire address.

   d. the machine driver, since sdw_utils already knows which amp is
      which speaker (soc_sdw_ti_amp.c:57-64) and Realtek's equivalent
      keys off the name_prefix suffix.

   If the answer is (a), then a second question follows for this
   platform specifically: the ASUS ACPI tables on this laptop supply no
   mipi-sdca-control-dc-value for the function type, so the parse fails
   for both amps and there is no cluster table to consult. Is that a
   plat
form firmware bug that TI can pursue with ASUS, and until such
   machines are fixed, what should the static fallback in
   tas2783_init_seq do instead of programming every amp identically?

We can test patches on this machine and can produce per-channel
acoustic numbers rather than impressions for each one, so a fix that
only changes the init path is verifiable here in one boot.


Reproducer
==========

Anyone with a two-amp TAS2783 board can confirm the defect in about 20
seconds with the tone check below. It needs pipewire tools and an
internal mic array, and it needs no second person and no ears.

Quick version, if you have a mic and can listen:

  speaker-test -c 2 -t wav -D <speaker device>

The spoken "Front Left" and "Front Right" prompts will both come out of
both speakers, and both will be the left channel of the stream.

Objective version, which is what we used:

1. Generate a stereo wav with four windows: 2 s silence, 3 s of a 2 kHz
   tone in the 
left channel only, 3 s of the same tone in the right
   channel only, then 3 s in both. Put 2 s of silence between windows
   and apply a 20 ms fade in and out on each tone so the mic does not
   see a click.

2. Start recording from the internal DMIC array, then play the file
   through the speaker sink:

     pw-record --target @DEFAULT_AUDIO_SOURCE@ --rate 48000 \
               --channels 2 --format s16 rec.wav &
     pw-play --target @DEFAULT_AUDIO_SINK@ probe.wav

3. Score each window in rec.wav with a Goertzel filter at 2 kHz on both
   mic channels, and compare each tone window against the silent
   baseline window.

FAIL is the right-only window sitting at the baseline while the
left-only window is far above it, and the both-channels window matching
the left-only window. On this machine that is left-only at +84 dB,
right-only at +0.4 dB.

Our script that does all of the above and prints PASS or FAIL is
available on request. It deliberately reports "audio 
works at all" and
"stereo" as two separate verdicts, so that a machine that is known-mono
does not mask a real playback regression.

Thanks,

Confirmed fix, measured on this hardware
========================================

Writing PPU21 selector 0x10 per amp does fix it. I derive the value from
component->name_prefix, so tas2783-1 and -3 get 0x01 (Left) and -2 and -4
get 0x04 (Right), matching the mapping asoc_sdw_ti_spk_rtd_init() already
applies in sound/soc/sdw_utils/soc_sdw_ti_amp.c.

Acoustic result on the same measurement rig as above, right channel only:

  before   +0.4 dB over the noise floor, i.e. silence
  after   +70.7 dB, and the left/right imbalance is 0.3 dB

It also survives an s2idle cycle, which matters here: a driver re-bind re-
runs tas2783_init_seq and would put 0x01 back, so the value has to be re-
asserted rather than written once. I do it from the POST_PMU path for that
reason.

One implementation note that cost me a working machine on 
the first attempt.
A failed channel write should warn and continue. Returning the error from
the DAPM event is the trap: that aborts the widget power-up and costs ALL
audio, while losing the channel select only costs stereo. My first attempt
at this defect went after the FU21 mute channel, returned -ENODATA from the
event, and silenced the machine after every resume.

I am happy to post this as a patch if that shape is wanted. I have
deliberately not sent one yet, because the correct source of the per-amp
assignment is the question below and name_prefix may not be the answer you
want upstream.

--2fc50b3a6f77723fd68721cfda96ac8d71bcbe09eb2bf4caae3498b8b18e
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="publickey - robineveraars@pm.me -
 0x8B6BA132.asc"; name="publickey - robineveraars@pm.me - 0x8B6BA132.asc"
Content-Type: application/pgp-keys; filename="publickey -
 robineveraars@pm.me - 0x8B6BA132.asc"; name="publickey -
 robineveraars@pm.me - 0x8B6BA132.asc"

LS0tLS1CRUdJTiBQR1AgUFVCTElDIEtFWSBCTE9DSy0tLS0tCkNvbW1lbnQ6IGh0dHBzOi8vZ29w
ZW5wZ3Aub3JnClZlcnNpb246IEdvcGVuUEdQIDIuMTAuMAoKeGpNRWFoOGxaUllKS3dZQkJBSGFS
dzhCQVFkQWFSa3p2ZTQ5ckJFSk1LSkg3NDZSWEhZKzJmVDc3b3hST2k1ZAo4SnBMKzY3TktYSnZZ
bWx1WlhabGNtRmhjbk5BY0cwdWJXVWdQSEp2WW1sdVpYWmxjbUZoY25OQWNHMHViV1UrCndzQVJC
Qk1XQ2dDREJZSnFIeVZsQXdzSkJ3a1FIY1YvYThzR0dvcEZGQUFBQUFBQUhBQWdjMkZzZEVCdWIz
UmgKZEdsdmJuTXViM0JsYm5CbmNHcHpMbTl5Wng2VjVxUzg5dzdDRFlTSXNjNU54dVBKSTFyZ29F
eVkvdjhkYlAzSApxa29OQXhVS0NBUVdBQUlCQWhrQkFwc0RBaDRCRmlFRWkydWhNcmIyWHVqRm5G
akxIY1YvYThzR0dvb0FBQVpzCkFQOXpJS1d3dWJDbEZFczBKNmpwUUhUS1hGVHErOTlNUmtmREtx
SVRidW1RelFEL1IyT2F6VHA0b0NKTzJiT0QKTkZsaVZBbTh5WFA2QSs1ODZ6UjJZS3QwUkFiT09B
UnFIeVZsRWdvckJnRUVBWmRWQVFVQkFRZEEzcDVGN2I1TwpGc1dLclNXRW1FSGlhL29lN25vLyta
MVcwT1BmZllyRFB5OERBUWdId3I0RUdCWUtBSEFGZ21vZkpXVUpFQjNGCmYydkxCaHFLUlJRQUFB
QUFBQndBSUhOaGJIUkFibTkwWVhScGIyNXpMbTl3Wlc1d1ozQnFjeTV2Y21ldlVkUisKViszVWd2
SVZqcURMRk9XeXlHcDVoNEpYQVBmWVpzRC8vUkhndlFLYkRCWWhCSXRyb1RLMjlsN294WnhZeXgz
RgpmMnZMQmhxS0FBQm9GZ0VBOGU0ZVNMU2FMbXY4L2UyVzFMOS9WS0FiajJaN0pFUzZLQXBpOUJa
Nm5RZ0JBTmhaCkZoTUZ6c3l6dTJZWXRhQjhTWXRWdGhKSjYvZUlRVFQ2VWRRRUlZc0YKPVlLaE0K
LS0tLS1FTkQgUEdQIFBVQkxJQyBLRVkgQkxPQ0stLS0tLQ==
--2fc50b3a6f77723fd68721cfda96ac8d71bcbe09eb2bf4caae3498b8b18e--

--------75c617636601ae1529982360daaf7ee04d00cf26d13805d36b07b1fb38d5dd62
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail

wqsEARYIAF0FgmpzgmgJEB3Ff2vLBhqKNRQAAAAAABwAEHNhbHRAbm90YXRp
b25zLm9wZW5wZ3Bqcy5vcmd+2QLT/teiOa+3wQOKuA4cFiEEi2uhMrb2XujF
nFjLHcV/a8sGGooAAKyjAP40tdkFoyYudT7O3hJn4zaZfQSuzMuEGlajqKPI
qB070QEAgl1CX93oTfZCLRwr0qT8Z0w20cpU4xnUEegn7cYTLw0=
=mCJo
-----END PGP SIGNATURE-----


--------75c617636601ae1529982360daaf7ee04d00cf26d13805d36b07b1fb38d5dd62--

