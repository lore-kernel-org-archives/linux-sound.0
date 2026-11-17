Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=89.253.219.113
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794938869;
	b=lCSX59Bp2RrY2M55c6Vx7PniqNJwVNWeoLopbaa7Qtihf4S/NBrM+dtNR/q83XBnI8l3
	 zgJkFk5vRtQqRrWgMAHXUUGfrINENmKgLKg0jmEpzqjsYnNZ/havCLICyx8v19OCBgZX+
	 3cxhhudHJqRFoOzp/a+8iI9KucU6kNaLGEoz0cbY5FYB1SJf/uX8Gn4EdcWSAJoh3+yQ7
	 Vz9zUIFVJPLpqdR5ZEsDpDO5IeLrj3MRF/WTFAo0OCiyc5Nt4RSG/azhcvTVWNn0TaLix
	 u5cYq7YvrJsFGAh6/BBPuJTjVPl0c/vqdfVALZjuhiBeiHwCWAfRJXj7ZWfGF0Z2X+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794938869;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=ntS5kUxEG1OsLuUHcjyS+rwv6Pass5CaGdbNoRFVibY=;
	b=vrRQp23cOLPkCFAm48A+983GeQ4BPxm3lvGbrZtKOzCQXve5Oo10oVo0tYazX7Jf+vw9
	 xCdYcS7sPn5w05lxa2sPVnp7VUF0M20K2HxhfNVy7eeO1AA3W9b9420PLZh1j9lInSiPH
	 o3FRvD+kNjUkgRPvJNJdBOYJJ/cdNqawBzkLfgntX6B1jxRR2ceOAEjhAA/vqdUW6Alq7
	 5gnSchjfvoKn5COliEy1TpkE2ceF3UsPmR/82pizntMPomMHT8lajQxhUHEScm0ozZQ63
	 nWVVno2d5QMhlL1d2L9A5btVxZPWE+WCXkeFTY3xy2hj09K21mcH0YitsJ8oXyiK2wQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pavel.bz;
	spf=pass smtp.mailfrom=pavel.bz;
	dkim=pass header.d=pavel.bz header.i=@pavel.bz header.a=rsa-sha256 header.s=primary header.b=lLRXCGBE;
	arc=none smtp.remote-ip=89.253.219.113
Received: from mail.pavel.bz (mail.pavel.bz [89.253.219.113])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16686606A32F;
	Tue, 17 Nov 2026 18:07:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16686606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pavel.bz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pavel.bz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pavel.bz header.i=@pavel.bz header.a=rsa-sha256 header.s=primary header.b=lLRXCGBE
Received: from p-745-g5.pavel.bz (unknown [182.52.139.49])
	by mail.pavel.bz (Postfix) with ESMTPSA id 0B778616B5;
	Tue, 17 Nov 2026 18:07:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.pavel.bz 0B778616B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pavel.bz; s=primary;
	t=1794938860; bh=ntS5kUxEG1OsLuUHcjyS+rwv6Pass5CaGdbNoRFVibY=;
	h=From:To:Cc:Subject:Date:From;
	b=lLRXCGBEf7kbU0v1W7K1JXK6zp9NrWDBOIGyFiIXR+1Yoku48vjjtDWicw/sUMK4O
	 wTrBbJvuSaASY4qOWuDV1UfRTD/Nr8GOtfqkeWWbNUhHT+pCBS0IVwkwFdCOJQSSul
	 dHyhqFxyft5P096L+YXfCHFl/CcGm0JmWvRckWg1qNudLcqF/AOr0UBpXY7ZYcLHTf
	 58RnJ0Sse4HM7vdnwrsyJFwFjQd+grXdHY2C84+fnhz4j3vLGS2z0HJpPSn85YAlD4
	 UqeahFQqETUx0X2Oixod+9hw3ovXpID9LucwdGDdtrJx6W5yTdT9PUWDkxxsz/SusU
	 Q6cdQuUTnlWrA==
From: Pavel Artemev <a@pavel.bz>
To: Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v6 0/2] ALSA: usb-audio: working hardware volume for XiiSound headsets (040b:0897)
Date: Wed, 18 Nov 2026 01:07:26 +0700
Message-ID: <20261117180728.117915-1-a@pavel.bz>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

During a two-week campaign to make a Temple (XiiSound/Weltrend
040b:0897) wireless dongle audible I captured the complete control
traffic of the device on both Linux (usbmon) and the vendor's own
Windows 10 stack (USBPcap).  This cover letter summarizes what the
wire says about this chipset, because it differs from the device model
encoded in the recently merged workaround, commit ba9bccdf711a
("ALSA: usb-audio: Skip broken playback feature unit on XiiSound
chips"), which is queued for 7.5.

To be clear up front: that commit fixes the user-visible bug (the
dongle coming up silent or one-eared), nothing here is a regression
report against it, and this RFC is not asking for its immediate
removal.  It proposes the alternative I ended up running locally -
keep the playback feature unit exposed and make its hardware volume
work - and offers the captures as evidence, both for this design
discussion and for whoever debugs these devices next.

What the wire shows
===================

1. The playback feature unit is a working hardware volume.  Per-
   channel SET_CUR writes apply deterministically and independently
   (a fast pair CN1<-50 + CN2<-100 applies exactly; a lone channel
   write does not disturb its sibling), the master gates both ears
   symmetrically, and intermediate values are audible and graded.
   The vendor's Windows driver drives this exact unit on every slider
   and hardware-button step, mapped linearly from its slider percent
   (10% -> raw 9, 50% -> raw 49), and every intermediate value is
   audible there too.

2. The "any volume below the maximum mutes one or both channels"
   behaviour that motivated the skip is host-side, in three stacked
   layers:

   - the unit advertises a bogus 0.00..0.39 dB range, under which
      every user-space volume at or below 0 dB - the whole normal
      PipeWire range, 100% included - resolves to the raw minimum,
      which does silence the channel;
   - the stereo control's GET_CUR returns a constant value, so the
      sticky-GET sanity check classifies it broken and the probe
      writes the minimum to both channels at every mixer build;
   - user space applies one logical volume change as fragmented
      writes (one per channel, the first carrying the stale sibling
      value), and the device silently drops control writes in the
      first seconds after enumeration (measured: the window closes
      6.5-9 s after enumeration, with a ragged tail), so a stale
      channel can survive until some later write happens to refresh
      it.  The per-ear asymmetry users report is exactly this stale
      state, not a channel-mapping property: under wire-verified
      canonical writes the attenuation is symmetric (12/12 steps).

3. The Windows driver never reads back (GET_CUR is broken, so it
   cannot), and does not need to: it keeps the whole channel picture
   at a single source of truth, writes every channel of a control in
   one short burst - master first - and re-pushes the complete state
   at every device open.  That every-open re-push is what repairs
   whatever the enumeration window swallowed.

One consequence worth recording: the create-time pin writes of the
merged quirk sit inside the loss window and are dropped along with
every other early write.  The dongle still comes up audible because
it powers up with every volume channel at the maximum - which is what
the pin intended to enforce anyway - and the resume re-pin added in
its v3 is the part that does real work.  So the merged fix is sound
in effect; only its description of the hardware is not.

The RFC
=======

Patch 1 replaces the skip-and-pin with three quirk flags for
040b:0897: the new QUIRK_FLAG_MIXER_INIT_VOLUME_MAX (initialize the
channels of volume controls to the maximum instead of the minimum,
exactly where the broken-GET minimum writes happen) plus the existing
PLAYBACK/CAPTURE LINEAR_VOL flags (linear scale instead of the bogus
dB range).  Hardware volume then behaves like on Windows.

Patch 2 adds QUIRK_FLAG_MIXER_STATE_REPUSH, which replicates the
vendor's write discipline for write-lossy devices: volume and mute
puts only record values, one deferred flush writes each touched
feature unit in a single canonical burst (master first, derived from
the loudest channel), and every PCM stream open and resume re-push
the full cached state - the every-open repair the Windows stack
relies on.  This is new mechanism territory (I found no prior
proposal for write batching or re-push in the archives), hence RFC.

Both ran as locally built DKMS modules - first against a 7.2 tree over
the wire-verified campaign, then successive revisions against 7.3.4 -
and in daily use; details in the commit messages.

Known limitations, stated for the record:

  - Through the linear scale PipeWire applies its cubic, so the
    mid-slider feel is quieter than on Windows (50% -> raw ~12).
    Users who want the vendor loudness feel can set
    api.alsa.soft-mixer = true - which is effectively what the merged
    skip approach gives everyone.  The value of this RFC is that the
    choice stays with the user and the hardware volume keeps working
    for stacks that do drive it.
  - After a replug the device sits at its power-up state (maximum)
    until the first write lands past the loss window; with patch 2 a
    stream open re-pushes and heals, provided streams actually open
    and close (a wedged PipeWire session that holds the device open
    indefinitely defers the heal to the first user volume gesture).
  - Hardware buttons keep stepping an internal device state that the
    host cannot observe (no readback); neither approach - skip or
    drive - syncs with the buttons.

I am happy to rework or drop either patch; the capture evidence is
offered independently of the design preference.

Changes in v6
=============

Thanks to the sashiko AI review for the v5 pass; both findings are
addressed:

  - Master ownership now transfers on any volume-channel write
    request, unchanged values included.  v5 only re-claimed
    derivation when a channel value actually changed, so a master
    restored by alsactl - which restores channels before the master,
    leaving the master put as the last write - stayed the owner
    through the audio server's subsequent no-op channel writes, and
    the re-pushes kept asserting the alsactl master instead of the
    derived one until the first changed gesture.
  - A channel put superseding an unflushed explicit master put now
    drops the master's cache entry along with its pending bit.  v5
    kept the never-written value cached: when it equaled the control's
    raw maximum, the limit-aware re-assert skip mistook it for device
    state and swallowed every later derive - the hardware master
    stayed stuck below its channels with no healer.

  - A local pre-send review run of the same public prompts also
    flagged smaller items, addressed here: patch 1's init-max quirk
    now excludes mixer unit controls (their control selector field
    stores a 1-based input pin number, which aliases UAC_FU_VOLUME -
    a broken-GET mixer unit input would have been initialized to the
    maximum instead of the minimum; latent, this device has no mixer
    units); processing-unit selectors sharing the 0x02 value are
    disclosed in the commit message as not excluded (none exist on
    this device); the quirk flag documentation no longer describes
    the stream-open re-push as a full-state re-push (it re-sends
    cached volumes; only a resume additionally re-asserts cached
    mutes) - in both the header comment and the docs; and a master
    put arriving right after an ownership transfer dropped its cache
    entry is now recorded unconditionally instead of read back (on
    broken-GET master controls that read would fail until the next
    derive re-caches).  The same review confirmed the two v5
    findings as fixed in code and probed the ownership-transfer
    machinery for residue; the one accepted residual is that an
    ownership transfer empties the master cache, so the next re-push
    re-derives the master even at the raw maximum - never a lone
    write, it shares the burst with the channel re-pushes.

Wire-verified on the device against 7.3.4: the v5 verification set
still holds (superseded explicit value never reaching the wire,
stream-open re-push re-asserting the master below the raw maximum,
raw-max skip, runtime-PM paths); the v6 ownership changes likewise:
a no-op volume-channel write following an explicit master put
re-claims derivation, so the stream-open re-push derives the master
instead of re-asserting the explicit value, and an explicit master
put to the raw maximum superseded by a channel put in the same flush
window produces the full derived burst including the master.

-- 
2.56.1
