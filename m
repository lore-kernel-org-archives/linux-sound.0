Received: from mail-08.mail-europe.com (mail-08.mail-europe.com [57.129.93.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8B813DA7CA
	for <linux-sound@vger.kernel.org>; Tue,  4 Aug 2026 22:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.129.93.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785884379; cv=none; b=grnvwkIGqgN8drqtacTajv10Daj1sOG4jszD0eWafD/uz+f/lAimNSr3fTo6OHf9p4kYNQde2e6PwsmMfE6f4YtBdR0vAXKTCh63z+8eBTFjQ6Pt1yrvw2QNgtz1S8KzGM8cr1aTqw06bbtbFYiGO4G+uGqPiHZ9uqBHZbUo8ZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785884379; c=relaxed/simple;
	bh=BGvoBF36nKFPyA6xSMhijB3daKbcZ6l0fANe1OpTxFE=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=e91xkUvrLzqjL+bF/RJUbPYiLgp5YxXEVPW0kPkGH3c4ceaxeRrJVr7WF1PeAs092Ja5YNOygcYLRGWVwUj1vNA9txKT3PtyuUfN4nrdgpicWpXlDkviK6cVxf+qEVd6IdK3lU3n2Y9JKqNjpzfL6q8Hl8hdHhCSKFK7Pc5LCGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=MB9gDZT2; arc=none smtp.client-ip=57.129.93.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="MB9gDZT2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1785884361; x=1786143561;
	bh=jdZBJky/01z73abMs7QLK4gdEgRS7FBxkgusIlqZcVQ=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=MB9gDZT24pifD8lUyxmawJvuIFVLlaaRULgcQTmVXe2poD+p+FMfP+LOzjgZsxa6+
	 eVsPbyUkjV1h7kGqGoE3L0GvzypqLyXCjpm6WN2PiIcuVtkRfWiQ2+skmpakO6lQPj
	 Nc58Jk6sEPdl8SV/bQwshRguK4ToiMR5/G9pp+l0YjmBKNjk98x3ajZlzw9J1GMmLn
	 Cxn6Ulk18FTtJE4dBNyqoALjlLqMtYr2qggbcBQ+aok+WzaLhVMZ71tBxLg9x7eYqY
	 aZRVDWVuCyp/YNoghtc4B43mj11QSkoGkiLxLvvjQCEupRFdw5kkiNMSOOiHO9wzmH
	 VXRYhJ/TnzPJw==
Date: Tue, 04 Aug 2026 22:59:16 +0000
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Oder Chiou <oder_chiou@realtek.com>, Bard Liao <yung-chuan.liao@linux.intel.com>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Kai Vehmanen <kai.vehmanen@linux.intel.com>, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Daniel Baluta <daniel.baluta@nxp.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: linux-sound@vger.kernel.org, sound-open-firmware@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] ASoC: fix audio on the Microsoft Surface Pro 11 (Intel)
Message-ID: <20260804225853.31585-1-lsa.uz@pm.me>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: 786b5cb3704f0088b63825141cb9c0db12826102
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The Microsoft Surface Pro 11 for Business (Intel, Lunar Lake) has no workin=
g
audio under Linux: the speakers are silent, while everything reports succes=
s.
These three patches fix it, and the machine then works with the stock
sof-soundwire UCM profile and the shipped topologies - no board quirk, no n=
ew
match entry, no local configuration of any kind.

All three failures come from one firmware defect. The board carries a singl=
e
physical RT1320 amplifier on SoundWire link 0, and describes it twice:

  SWRA  _ADR 0x000030025D132000   SDCA class 0
  SWRB  _ADR 0x000030025D132001   SDCA class 1

Identical apart from the class id: same link, same manufacturer, part and
version, same unique id 0. The part reports class 1, so only SWRB ever
enumerates. SWRA stays UNATTACHED on every boot, on every firmware version =
we
have tested, including the November 2025 bundle. Both entries nonetheless r=
each
the machine-select and card-probe paths, and the phantom breaks each in a
different way.

  1/3 rt1320: the amplifier's preset never runs, because the driver waits f=
or
      FUNCTION_NEEDS_INITIALIZATION and this part never sets it. rt712-sdca=
 and
      rt722-sdca already handle this by also running the preset on the firs=
t
      hardware init; rt1320 is the odd one out. One line.

  2/3 sdw_utils: DAI links get built for the phantom, and later fail to pre=
pare
      with -61, taking the whole link down rather than degrading it.

  3/3 SOF/Intel hda: the phantom consumes an amplifier index, so the real p=
art
      is named "rt1320-2". The stock UCM profile addresses the first amplif=
ier
      and therefore enables switches on a device that is not there.

Only 1/3 is codec-specific. The other two are general: any firmware that
describes a peripheral twice, or describes one that never enumerates, hits =
them.

One thing worth raising, since a reviewer will reasonably ask. Before 2/3
existed we also hit a DAI link name collision: create_sdw_dailink() builds =
names
from link id and function type alone, so the phantom's SmartMic endpoint
produced a second "SDW0-Capture-SmartMic" and the card failed to register a=
t all
with -EEXIST. With 2/3 applied the phantom's endpoints never reach the nami=
ng
code, so that collision is no longer reachable on this machine and we canno=
t
demonstrate it. The naming scheme is still not unique in general - a board =
with
two genuinely distinct codecs of the same function type on one link would h=
it
it - but we have no such board, so it is deliberately not part of this seri=
es.
Happy to send it separately if you would like it.

Testing. Developed and tested on a Surface Pro 11 for Business (Intel Core =
Ultra
7 268V), booting 7.1.0-rc7 built from thesofproject/linux topic/sof-dev at
7e9e0409c with these three patches and nothing else. Verified on that kerne=
l:

  - card registers as sof-soundwire, 4 playback + 1 capture devices
  - no -EEXIST, no -61 link startup errors
  - amplifier named rt1320-1, controls "rt1320-1 OT23 L/R Switch"
  - rt1320_vc_preset runs, reporting RT1320_KR0_INT_READY=3D0x1f
  - amp function status reads 0x41 (NEWLY_ATTACHED | FUNCTION_HAS_BEEN_RESE=
T)
    on every boot, confirming bit 5 is never set on this part
  - speakers audible, internal microphone captures signal
  - stock alsa-ucm-conf 1.2.15.3 and firmware-sof-signed 2025.12.2, with no
    local UCM, PipeWire or WirePlumber configuration

checkpatch --strict is clean on all three.

Sergey Lebedev (3):
  ASoC: rt1320: run the initialisation preset on the first hardware init
  ASoC: sdw_utils: skip endpoints of a peripheral that is not on the bus
  ASoC: SOF: Intel: hda: duplicate _ADR entries share one amp index

 sound/soc/codecs/rt1320-sdw.c       |  2 +-
 sound/soc/sdw_utils/soc_sdw_utils.c | 46 +++++++++++++++++++++++++++++
 sound/soc/sof/intel/hda.c           | 16 ++++++++++
 3 files changed, 63 insertions(+), 1 deletion(-)


base-commit: 7e9e0409cd57924c4099090879154300c07b8643
--=20
2.50.1 (Apple Git-155)


