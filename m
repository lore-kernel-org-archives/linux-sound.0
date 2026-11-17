Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=89.253.219.113
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794944804;
	b=Ezfkkc/fHekAJ74x3FT+eYO2mojv5DMw3bzC2Nn1DS9A2y/fRuB/+9u+DSpRwG+E2hYs
	 arNYGkYrHmZTt57UYJUevf38Soq/IfNZYONf9t1JCz03b/DRohzTivm57c5jcx+vH4IMr
	 VBAOMSLsTNOau4B1ZWdsVzMi9vK5gqdBVg05mdkVDt4Q+lBKQOqOWWJKLEzngBZP61EI8
	 wxmgKUKDfNWAUCZmI5ouIziP3Jf8TWNRIUw05Vk6VtucP44U62qoKSl/kk9EW80lBX8O0
	 x4eEtBQOR+Fz5yL5iYQhvomFRH+0Xqf8doNoMHB7LvmQuAFXXupgjZ+C9+gD2L7cJbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794944804;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=NxgPi/4E3AcEKHdmo8E8PRy1/RpHfiuP1uL62W8a8EA=;
	b=409du9uug4tcuY2nhXw1RJUJdV6YUBAetOt0UE+ag0H6hshFdPKNX6he0W9N4q5YUAuR
	 OUMbqEBCPKtJmGmPZzGEFgzr34xUCFKLNsysd5Sgr6uz36b/X9tk61W+dK+FQ/K5n4BKO
	 EPO2evqfte0AcKE1z+ZWrrPhw+JeFvjIKIlhLsy86oR3EhmfbhTMO/r2n+gEWqDhaIiOn
	 sB4/ykKxQlTX3nQvkVz0gtZ1Li7zpMxkemiu7CkBv+tF7Cdn2oZ8IKWZBhSaP6lWyTZfe
	 VrVxl8QnqU9l13hluhJFhZe7KlaWQpU84aGDKR2YyPlkVPUFslyvtX5gCLlgprEUGwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pavel.bz;
	spf=pass smtp.mailfrom=pavel.bz;
	dkim=pass header.d=pavel.bz header.i=@pavel.bz header.a=rsa-sha256 header.s=primary header.b=oNGFPtvg;
	arc=none smtp.remote-ip=89.253.219.113
Received: from mail.pavel.bz (mail.pavel.bz [89.253.219.113])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB579606A32A;
	Tue, 17 Nov 2026 19:46:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB579606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pavel.bz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pavel.bz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pavel.bz header.i=@pavel.bz header.a=rsa-sha256 header.s=primary header.b=oNGFPtvg
Received: from p-745-g5.pavel.bz (unknown [182.52.139.49])
	by mail.pavel.bz (Postfix) with ESMTPSA id B1815609E0;
	Tue, 17 Nov 2026 19:46:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.pavel.bz B1815609E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pavel.bz; s=primary;
	t=1794944799; bh=NxgPi/4E3AcEKHdmo8E8PRy1/RpHfiuP1uL62W8a8EA=;
	h=From:To:Cc:Subject:Date:From;
	b=oNGFPtvg7/9DTAc7efWYAImSaR+1CBon/d4xUPlHW/eULvMo6nB+vUE6PJ6MDTKkx
	 3IcCaUO6+ZLIN85xG5+kHlSTlCnbXiKNK13fE0YCNg1G8ShRQaQRs6vvxnNlZwfWqG
	 jmc/9kAnVqIi+D5i0KW0zscXEItXsxd458N8oR4R8trvSr02Z6uWaN3d/GGgT3xYQY
	 YMMvHB5h5A6C2+7LIyWe95Cd6VAKyH5aLShLuHejb8Mlws3SmvoHNOBauluku3nnwg
	 v5hv0mlSARECc3diuCXj3Ox+uHRFadcfktAUKQWZJZKx/oN4cfluxDbg2sKOOlXhRy
	 ELKmwnKQ0hWAQ==
From: Pavel Artemev <a@pavel.bz>
To: Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v7 0/2] ALSA: usb-audio: working hardware volume for XiiSound headsets (040b:0897)
Date: Wed, 18 Nov 2026 02:46:28 +0700
Message-ID: <20261117194630.155912-1-a@pavel.bz>
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

Changes in v7
=============

Thanks to the sashiko AI review for the v6 pass; both findings are
addressed, and both sit in the ownership-transfer hunk it reviewed:

  - A volume-channel write request that re-claims master derivation
    now also checks the master it takes over against the channels.
    v6 handed ownership over but armed nothing: after an explicit
    master put had flushed, a no-op channel write left the hardware
    master at the explicit value - potentially gating both ears at
    the wrong level - until the next changed write, stream open or
    resume happened to re-derive it.  The transfer now requests a
    re-push when the master it takes over disagrees with the derived
    channel maximum, so the next flush delivers the derive on its
    own.

  - The transfer no longer drops the cache entry of a master the
    device did receive.  v6 cleared it unconditionally, which both
    forced a device readback (a GET_CUR, or -ENXIO where GET is
    broken) for master reads until the next flush re-cached, and
    defeated the raw-maximum re-assert skip for every flush that
    followed a channel write: re-sending an unchanged raw-max master
    makes these devices emit their in-headset limit notification, so
    balance steps or stream opens while the louder channel sat at
    the maximum beeped with no user arrival.  Only two kinds of
    entries are dropped now: never-written ones (an explicit value
    superseded before its flush - kept from v6, so the skip can
    never be poisoned by a value the hardware never saw) and
    diverged ones (the case above); a consistent master keeps its
    cache and stays quiet.

  - The local pre-send review run (5 finder shards + 6 fresh-context
    falsifiers, same public prompts) surfaced no new code defects in
    the v7 changes; its three Low items are folded here: both
    master-put record paths no longer set the derivation-ownership
    flag on mute masters (a dead store - every reader filters on the
    volume selector), the flag documentation states the explicit-
    master ownership rule, and the testing statement now carves out
    the one documented exception to "notifications only on user
    arrivals".  The prior-feedback shard re-verified both v6 findings
    as fixed in code and the v5-era regressions as not reopened; the
    concurrency lens fully fenced the one speculative teardown
    question (the resume-time re-arm runs under the USB device lock
    every route to mixer teardown takes first).

Wire-verified on the device against 7.3.4: the v6 verification set
still holds (baseline burst discipline, the superseded-explicit
derived burst at the raw maximum, raw-max skip, runtime-PM paths);
the v7 changes likewise: a no-op volume-channel write following a
flushed explicit master that disagrees with the channels triggers
the re-push itself - no stream open needed - with the derived master
write leading the burst; the cache entry survives consistent
transfers, so a balance step at the parked raw maximum writes only
the changed channel (no re-sent raw-max master, no endpoint
notification) and a stream-open re-push after a no-op write keeps
the master absent; and a master read after the transfer is served
from the cache with no device readback.

-- 
2.56.1
