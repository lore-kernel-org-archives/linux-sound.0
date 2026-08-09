Received: from mail-06.mail-europe.com (mail-06.mail-europe.com [85.9.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D758734BA5B;
	Sun,  9 Aug 2026 10:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.9.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786270578; cv=none; b=Vukh1i8DZK0h0Eb5K80IP79WsD85TK752XjEsmdMYMq+oK7bCWyeYoQRNf4jCkdsAoHK88IBRDbZokugscX20FC2or6dPOmotyLC6AmbvvR/wQpFw3/kRye7lR2dIMfQJWF+HLRCkbklwMwOQU6Q+viQO9nfsRPMOtfYPfbgHXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786270578; c=relaxed/simple;
	bh=baBdNzkV/nJMtQY/SrSkog/teKUaBaY4i7KlOkNBy8Y=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=d5qQHtM6Zljdg9ETq1ydPlkS/Fi7AL5pWbBWL3pAimiEcLDF+K96qWgmUKFn0OKjV3P3t7lBxtIJWQt6q4VwPJbvERcCtpDHq0TiqC9OfWu1YDoug4cSE2yRFCEmY0G1IVrH1Orw0977NZ6/akhVP8OGEpsrCHIV/vb63y+Y3XA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=saarinenkoti.fi; spf=pass smtp.mailfrom=saarinenkoti.fi; dkim=pass (2048-bit key) header.d=saarinenkoti.fi header.i=@saarinenkoti.fi header.b=NHwbafTT; arc=none smtp.client-ip=85.9.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=saarinenkoti.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=saarinenkoti.fi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=saarinenkoti.fi header.i=@saarinenkoti.fi header.b="NHwbafTT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=saarinenkoti.fi;
	s=protonmail3; t=1786270562; x=1786529762;
	bh=pcPRwJbEbRGX+MoVM5ecrMx+25kBq3s+bZK0lM9gov4=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=NHwbafTTLLAPAfOn66/uqFRxhNQGhL0g95X+YJ3kIrb+0kKdIoHID9mAutbV0moue
	 Zce5VO4U/nK6eJUQy4HZBcPlZgiPBAm09AmHRpZVXCm7m3B5eVGxrMNDedfb81H9Pw
	 byb+eGWjFemn82RnnXh8W+HTmC2O+rwry+bFgcQzzSwlQXQvmvCflwicdQxMezl1/a
	 kdYsDiYzb6ov14xWNZHRUtDXKXJC/LqGMz8u8Psew5lgrJJ9U+6+zwdmkRR9fJ6Z14
	 xeGngCPfZUZdKBJk2Zq2v35E1UGRq0ZzMr0IiiBK1PP1pObXiIlRDNDdu2eMrou/q+
	 7ekdDBVZ3tI6A==
Date: Sun, 09 Aug 2026 10:15:57 +0000
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>
From: Ville Saarinen <wiza@saarinenkoti.fi>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] ASoC: tas2783: fix stereo split and resume on a two-amp pair
Message-ID: <20260809101541.4969-1-wiza@saarinenkoti.fi>
Feedback-ID: 137674609:user:proton
X-Pm-Message-ID: 2c436fecc95f6d378ca0e3538b290447f28b7721
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Three fixes for the SoundWire TAS2783 driver, found while bringing up an
HP OmniBook X Flip 14-kc0xxx, which carries two TAS2783 amplifiers
aggregated on one link. Two of the three are not board-specific: as far as
I can tell any machine with an aggregated TAS2783 pair is affected today.

Patch 1 makes deferred SDCA writes work. A Function answering
COMMAND_IGNORED has deferred the transaction, and regmap-sdw-mbq is
supposed to poll Entity-0 Function Status and retry -- but this driver
neither makes that status register readable nor sets the poll interval and
deadline, so the poll is skipped and the retry is instantaneous. Every
deferred write fails by construction with -ENODATA.

Patch 2 makes an aggregated pair render stereo. Both amplifiers currently
play the same channel, so right-channel content is inaudible. The SDCA
control that would select the channel, the UDMPU23 Cluster Index, turns
out not to be implemented on this part -- a genuine device read of it
returns -ENODATA -- so the split is done host-side, by claiming a single
channel per amplifier and dropping the pair out of the SoundWire core's
mirror mode. That is exposed as a boolean "RX Single Channel Switch",
off by default, so the change is opt-in from the machine's UCM profile.

The switch deliberately does not name a side. sdw_compute_slave_ports()
advances the payload offset by the popcount of ch_mask and never looks at
which bit is set, so a driver cannot choose which channel an amplifier
renders; that follows from the amplifier's position in the slave iteration
order, i.e. from the machine driver's codec order. An earlier version of
this series exposed an rt1316/rt1318-style "RX Channel Select" enum with
Left/Right values, and I am glad it did not go out: those values were
measured to be inert, and the control would have promised an ABI the bus
allocator cannot honour.

Patch 3 stops the amplifiers losing their firmware tuning on resume.
Firmware is downloaded with sdw_nwrite_no_pm(), which bypasses the regmap
cache, so the cache keeps stale reg_defaults for every firmware-owned
register; the regcache_sync() on resume then writes those defaults back
over live firmware values. On the affected machine the speakers are dead
after every system resume and stay dead until reboot.

Patch 3 is the one I would most like reviewed on its own merits. It is the
smallest of the three, it is not specific to a stereo pair, and its
symptom is severe.

The three are independent and can be taken separately, though patch 2
builds on the mbq configuration touched by patch 1.

Testing
=3D=3D=3D=3D=3D=3D=3D

All three are running on the affected machine and the whole stack works
from a cold boot with no manual steps, including across suspend/resume.

Patch 2 was measured rather than judged by ear: a 1 kHz tone that is
left-only for its first half and right-only for its second, played as one
continuous stream, isolating each amplifier by muting the other and
capturing on the machine's internal DMIC array, with every condition
normalised against both amplifiers muted. Each run was verified from the
kernel log to have re-run hw_params with the setting under test, since the
switch is read at hw_params and a sink that never suspends will not pick
up a change. Numbers are in that patch's changelog; briefly, with the
switch on each amplifier carries one side and the other side sits within
0.4 dB of the muted floor, and with it off both amplifiers render the same
left channel. Ear tests on this hardware are unreliable -- the two
speakers are close enough together that localisation gave a confidently
wrong answer more than once.

Patch 3's mechanism was confirmed by cache-bypassing debugfs register
reads taken while the amplifiers were dead, showing all 12 firmware-owned
registers reverted to their defaults. The fix has been through one
suspend/resume cycle with the speakers still working; that confirmation is
behavioural and I have not re-read the registers after a resume on the
fixed build.

Caveats
=3D=3D=3D=3D=3D=3D=3D

The hardware testing above was done on v7.1.6 with clang. The three
patches apply to the master commit named below and have been compile-
tested there with gcc and W=3D1, with no new warnings; the series adds
exactly two new external references, regcache_drop_region (EXPORT_SYMBOL_
GPL) and snd_ctl_boolean_mono_info (EXPORT_SYMBOL), established by diffing
nm -u output against the unpatched objects. They have not been run on a
master kernel. I have exactly one TAS2783 machine, so the stereo split in
patch 2 is verified on one board with two amplifiers and nothing else.

Tool disclosure, per Documentation/process/generated-content.rst
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

This work was done in extended interactive sessions with Claude (Anthropic,
model claude-opus-5) acting as a coding and debugging assistant, and a
substantial amount of the analysis and of the patch text originated with
it. All three patches carry an Assisted-by tag as described in
Documentation/process/coding-assistants.rst.

The division of work:

  - The assistant did the register-level analysis, read the relevant core
    code, formed the hypotheses, wrote the driver changes and the
    measurement harness, and drafted the changelogs.
  - I ran everything needing root or physical access, rebooted into each
    build, and ran the acoustic measurements.
  - No single prompt produced these patches. It was iterative over roughly
    a day, and a fair number of the assistant's intermediate conclusions
    were wrong: that one amplifier was dead, that the firmware page-0
    configuration set the channel, that the Cluster Index could be made to
    work from the driver, and -- latest and most relevant to what you are
    reading -- that an enum could assign a specific side to each
    amplifier. That last one survived into a fully drafted patch whose
    changelog claimed a per-side assignment, and was caught only by
    re-reading the bus allocator and then measuring both amplifiers set to
    the same value. Each wrong turn was discarded only because it was
    measured. The dead ends around the Cluster Index are summarised in
    patch 2's changelog, because they are the reason the split is done
    host-side.

I have reviewed all three patches, I understand what they do, and I take
responsibility for them.

Ville Saarinen (3):
  ASoC: tas2783: let regmap-sdw-mbq poll for deferred transactions
  ASoC: tas2783: add RX Single Channel Switch to split a two-amp stereo
    pair
  ASoC: tas2783: drop firmware-owned registers from the regmap cache

 sound/soc/codecs/tas2783-sdw.c | 157 +++++++++++++++++++++++++++++++++
 1 file changed, 157 insertions(+)


base-commit: 06cf61899d6498b33e4b7c87d99d5bd471ccc375
--=20
2.55.0


