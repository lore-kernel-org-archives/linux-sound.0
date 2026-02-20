Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EEE841754
	for <linux-sound@vger.kernel.org>; Fri, 20 Feb 2026 16:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.16.231.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771603395; cv=none; b=Epgg8XbD6bzKDEY8rROVKnvA9LVZjy2BJ9iPLhngiR58ChjZf/+5V1l5D4IFmZaY5RMBoHnP24V1qe7lO2Qvx/W1B4hasdB1VQaus03GpIa5DzQnVUBVU1MWMq1FvEJRQaompNye4a78UCpLxlpdentzB+UOAOKQO/U4H1TK7u0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771603395; c=relaxed/simple;
	bh=cSXkTyp3Di9QwXqTQxoL0zSgmUyCpoRTqq5uTqZqvNc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LiNiTWyFNgsfq6y3PkCF2Z6PFtH3x+Wook8WmdWHZac4Pndt+jogqfzDZuGsixc5c7FWzXhzu4RLHDR1rfSi+b1fAwqgwsy7chW/Dcn2I4xity95POJ9cazzCR6kMF7qokESygvPVZBlPbIG/ihVFwJqKJME/sqVSn17Tb+/MLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu; spf=pass smtp.mailfrom=b4.vu; dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b=AONMxbpO; arc=none smtp.client-ip=203.16.231.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="AONMxbpO"
Received: by m.b4.vu (Postfix, from userid 1000)
	id 257FF6756E24; Sat, 21 Feb 2026 02:33:11 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 257FF6756E24
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1771603391; bh=UewMgYMXHuwQw7ZCvqrB297zFcsYDcjQ6AOtW8dWaDM=;
	h=Date:From:To:Cc:Subject:From;
	b=AONMxbpO8B9ZUuzl5qNfZXliF9gVwLu7QAw5mGMBvmEZy6LfH9STZDL1CzlczpP//
	 vQOC4n61MiIQFpSAAiiuQURHv06ST/tPnY5zknHL8W6oOojxsNm13jPXVMggsp2vTC
	 bNVd3dlG2waaXyZHy17ILNYKKQk3Y1syu5TSW53yBrXfzhvubmgfrJm9COTHfgk7Xg
	 mQ7t/M1JwcBYj0z005B8kypxkibPElzZVkSqDmJr4kXeOKKxrTi+GrN2HuG21fK9VP
	 +eIMxxkTmDYWkGZRrOi+vpxRD3kKNetjKcAZsGwp9+KvO9Moc7n8rEpSoUzPmbfCC8
	 5mt5BtShqQcCQ==
Date: Sat, 21 Feb 2026 02:33:11 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
	Alexander Tsoy <alexander@tsoy.me>, Tina Wuest <tina@wuest.me>
Subject: [PATCH 0/4] ALSA: usb-audio: Fix Focusrite probe-time side effects
Message-ID: <cover.1771594828.git.g@b4.vu>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi all,

This series fixes two problems caused by probe-time testing of
altsettings and sample rates on Focusrite devices. When a sample rate
of 192kHz is selected during the probe's trial and error, the internal
mixer and Air and Safe modes are disabled. I.e. no audio passes
through the mixer, and Air and Safe modes cannot be selected until an
application opens the PCM and sets a lower rate. This results in user
annoyance and bug reports of unexpected silence and mode changes.

I tested 20 Focusrite devices (Scarlett 2nd, 3rd, 4th Gen, Clarett+,
and Vocaster) and found that the valid sample rates can be determined
from USB descriptors alone, without the QUIRK_FLAG_VALIDATE_RATES
trial-and-error testing of each rate and altsetting. I also added a
quirk to skip the redundant interface setup and enabled the quirk to
skip the clock selector write-back (reading the current value then
writing it back unchanged triggers a ~300ms delay per altsetting).

The result of all this: the probe time drops from ~4 seconds to ~4ms,
there is no interruption to audio, and the mode settings do not
inadvertently get reset. The contents of /proc/asound/card*/stream0 is
identical before and after on all tested devices.

Background
----------

Focusrite interfaces with digital I/O use multiple altsettings for
different channel counts at different sample rates (more channels at
48kHz, fewer at 192kHz). The clock source reports all rates for every
altsetting, so rates need filtering.

Two mechanisms currently do this:

1. focusrite_valid_sample_rate() reads a non-standard Format Type
   descriptor (bLength=10, vs standard UAC2 bLength=6) with a max_rate
   in bytes 6-9.

2. validate_sample_rate_table_v2v3() (QUIRK_FLAG_VALIDATE_RATES) sets
   each rate on the device and queries UAC2_AS_VAL_ALT_SETTINGS to
   check validity. Prunes rates that fail.

Mechanism #1 currently uses fallthrough logic (commit cc8e91054c0a):
an altsetting with max_rate=192000 accepts all rates down to 44100.
This is correct for Clarett+ but wrong for Scarlett 3rd/4th Gen, where
only the matching rate pair should be accepted. Mechanism #2 gets the
right answer but has the USB side effects above.

Commit 05f254a6369a had strict 1:1 mapping, correct for Scarlett but
wrong for Clarett+. Neither approach alone works for all devices.

The UAC2_AS_VAL_ALT_SETTINGS readable bit in the AS header bmControls
predicts which behaviour the device needs:

- val_alt readable: strict — each altsetting only accepts its own rate
  pair
- val_alt not readable: fallthrough — all rates up to max_rate

Device test matrix:

  Device                   Playback          Capture           val_alt
  -------------------------------------------------------------------
  Scarlett 6i6 2nd Gen     1 alt, bLen=6     1 alt, bLen=6     no
  Scarlett 18i8 2nd Gen    1 alt, bLen=6     3 alts, bLen=10   no
  Scarlett 18i20 2nd Gen   3 alts, bLen=10   3 alts, bLen=10   no
  Scarlett Solo 3rd Gen    1 alt, bLen=6     1 alt, bLen=6     yes
  Scarlett 2i2 3rd Gen     1 alt, bLen=6     1 alt, bLen=6     yes
  Scarlett 4i4 3rd Gen     1 alt, bLen=6     1 alt, bLen=6     yes
  Scarlett 8i6 3rd Gen     1 alt, bLen=6     1 alt, bLen=6     yes
  Scarlett 18i8 3rd Gen    3 alts, bLen=6    3 alts, bLen=10   yes
  Scarlett 18i20 3rd Gen   3 alts, bLen=10   3 alts, bLen=10   yes
  Scarlett Solo 4th Gen    1 alt, bLen=6     1 alt, bLen=6     yes
  Scarlett 2i2 4th Gen     1 alt, bLen=6     1 alt, bLen=6     yes
  Scarlett 4i4 4th Gen     1 alt, bLen=6     1 alt, bLen=6     yes
  Scarlett 16i16 4th Gen   3 alts, bLen=10   3 alts, bLen=10   yes
  Scarlett 18i16 4th Gen   3 alts, bLen=10   3 alts, bLen=10   yes
  Scarlett 18i20 4th Gen   3 alts, bLen=10   3 alts, bLen=10   yes
  Clarett+ 2Pre            1 alt, bLen=6     3 alts, bLen=10   mixed*
  Clarett+ 4Pre            3 alts, bLen=6    3 alts, bLen=10   no
  Clarett+ 8Pre            3 alts, bLen=10   3 alts, bLen=10   no
  Vocaster One             1 alt, bLen=6     1 alt, bLen=6     yes
  Vocaster Two             1 alt, bLen=6     1 alt, bLen=6     yes

  * Clarett+ 2Pre: playback val_alt=no (single alt),
    capture val_alt=yes

  bLen=10: non-standard Focusrite Format Type descriptor with max_rate
  in bytes 6-9 (LE u32). Standard UAC2 is bLen=6. Single-altsetting
  devices need no rate filtering. Vocaster only supports 48kHz.

For val_alt=yes multi-alt devices, the old VALIDATE_RATES probing
agreed with the new strict filtering. For val_alt=no (2nd Gen,
Clarett+), the device accepts all rates up to max_rate on any
altsetting. I confirmed this on the Scarlett 18i20 2nd Gen and
Clarett+ 8Pre with speaker-test running 10 channels at 48kHz on the
up-to-192kHz altsetting.

Patches
-------

1/4: Improve focusrite_valid_sample_rate() to check bmControls for
UAC2_AS_VAL_ALT_SETTINGS:
  - val_alt readable + bLength=10: strict mapping
  - val_alt not readable + bLength=10: fallthrough (unchanged)
  - val_alt readable + bLength!=10 + multi-alt: use the Focusrite
    altsetting convention (alt 1=48k, 2=96k, 3=192k)
  - otherwise: no filtering

The third case handles the Scarlett 18i8 3rd Gen, which has bLength=6
on playback (no max_rate) but 3 altsettings with val_alt=yes,
requiring strict mapping.

2/4: Remove QUIRK_FLAG_VALIDATE_RATES for Focusrite. With patch 1,
descriptor-based filtering gets the right rates without USB probing.

3/4: Add QUIRK_FLAG_SKIP_IFACE_SETUP. Skips the probe-time interface
setup (usb_set_interface, init_pitch, init_sample_rate) in
__snd_usb_parse_audio_interface() which is redundant with
snd_usb_endpoint_prepare() at stream-open time. Enabled this quirk for
Focusrite devices. This is similar to commit ac5e2fb4 ("ALSA:
usb-audio: Drop superfluous interface setup at parsing") but gated as
a quirk. It's a worthwhile optimisation and is the second half of
fixing the problem with the sample rate being changed.

4/4: Enable QUIRK_FLAG_SKIP_CLOCK_SELECTOR for Focusrite devices.
snd_usb_clock_find_source() reads the clock selector value then writes
it back unchanged. On Focusrite devices this triggers an unnecessary
~300ms delay per altsetting.

Tested on all devices listed above: /proc/asound/card*/stream0
identical before and after.

Regards,
Geoffrey

Geoffrey D. Bennett (4):
  ALSA: usb-audio: Improve Focusrite sample rate filtering
  ALSA: usb-audio: Remove VALIDATE_RATES quirk for Focusrite devices
  ALSA: usb-audio: Add QUIRK_FLAG_SKIP_IFACE_SETUP
  ALSA: usb-audio: Skip clock selector for Focusrite devices

 sound/usb/format.c   | 70 ++++++++++++++++++++++++++++++++++++++++----
 sound/usb/quirks.c   |  4 ++-
 sound/usb/stream.c   |  3 ++
 sound/usb/usbaudio.h |  6 ++++
 4 files changed, 77 insertions(+), 6 deletions(-)

-- 
2.53.0

