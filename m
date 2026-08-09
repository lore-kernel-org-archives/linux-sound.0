Received: from mail-10625.protonmail.ch (mail-10625.protonmail.ch [79.135.106.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3543CAA2F
	for <linux-sound@vger.kernel.org>; Sun,  9 Aug 2026 10:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786270518; cv=none; b=LuHrJbXp/kGKmVxADWgj8Xxv7ct+QcWEpyYpwVz4kLoUS3JC1lXLXMsxWUbrEcaAA7T2hZq5bgtcUHpsYG5sGpI9/Px3ArKG/JWt5YtOwSr3waqiWe3DP8kLvFgiR/WMVIPplhpPC1z/1QTIs9YehD67w5IzLnT2nj1ZhcNXMiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786270518; c=relaxed/simple;
	bh=DDc9XHRypwreG4qg6ZNzO0yanpgr6IwbcwWGvsu1xJQ=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Euka0iCTwonN30qTM+jxO65rOzx4N/3LZ2shP74I702XDZUophFY7DbMwOcE9ONIWQIDiRG4+Ucs+zs9Puvk7xcGooXuIdJcwR+893L6O7UPjkF18AvcLf9KDcoknCq2OLL+mpF8kc1FBsgDsH5HFLKQMkIAn8cHpHZ4eS3JbhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=saarinenkoti.fi; spf=pass smtp.mailfrom=saarinenkoti.fi; dkim=pass (2048-bit key) header.d=saarinenkoti.fi header.i=@saarinenkoti.fi header.b=G/v8s6U8; arc=none smtp.client-ip=79.135.106.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=saarinenkoti.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=saarinenkoti.fi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=saarinenkoti.fi header.i=@saarinenkoti.fi header.b="G/v8s6U8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=saarinenkoti.fi;
	s=protonmail3; t=1786270502; x=1786529702;
	bh=BtvLQ5EM2aX/weWInUbOj/Hhj8UXla50qjkgpyrAqeg=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=G/v8s6U8d8aIVV5vTCwxSlw+cQGIthLiobe8+5VRZ7fPTol3o51nQYcbHxOZiRpzk
	 GQfINJUja2UE3l39p2N1ImLS8xqszMBq0b3GSickofOEN59Q5zzdFzoZI6G/l+oCTm
	 UX537I56P0A1NXnXEj7L1E1CurjLvnlvzR2IQccsfvIEmxCl2kCH4Wwf5FHbXB152b
	 PDpb6UAsvRZVaT4+/tDYSmvzgcI0sip57JJBwEMuR/S8OaE8Mv/IvtELPOsn2riRVT
	 uxJOKstQeOHEmruK6bbiDQjk1mCH/HhjmymR/ZEt5+2B1NxsGfjygrWR97NHrkmms0
	 f9bH9CO61ts8A==
Date: Sun, 09 Aug 2026 10:14:58 +0000
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
From: Ville Saarinen <wiza@saarinenkoti.fi>
Cc: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] ASoC: amd: enable audio on HP OmniBook X Flip 14
Message-ID: <20260809101439.4798-1-wiza@saarinenkoti.fi>
Feedback-ID: 137674609:user:proton
X-Pm-Message-ID: 338589f55a8373020cb4eff2bcf632aecd9dac16
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The HP OmniBook X Flip 14-kc0xxx (board 8EA1, Strix Point, ACP 7.2) has no
usable audio on mainline at all. Its BIOS reports an ACP configuration flag
of FLAG_AMD_LEGACY_ONLY_DMIC, which binds the legacy ACP driver and
registers a PDM-only card, so the SoundWire links are never scanned. The
two TAS2783 speaker amplifiers on link 0 and the RT712-VB jack codec on
link 1 never enumerate, and the machine has no playback path whatsoever.

Patch 1 adds a DMI quirk overriding the flag so snd_pci_ps probes. Patch 2
adds the machine entry describing the link topology.

With both applied the card comes up and every path on the machine works:
internal speakers, headphone jack with detection, headset microphone and
the internal DMIC array. Two further patches are needed for the speakers
to render stereo rather than mono, and to survive a system resume; those
are in the TAS2783 codec driver and are being sent separately to the TI
maintainers, since they have no build dependency on this pair.

Related reports for the same root cause on other machines:

  - kernel bugzilla #221226 (ASUS Zenbook S16)
  - CachyOS linux-cachyos#820 (HP OmniBook X Flip 16, board 8EA2 -- the
    sibling board, which would need its own entry; I have no access to
    one and have not added it)

Tested on the affected machine only. I do not have any other ACP 7.2
board, so the gating on patch 2 is written to be conservative rather than
broad.

Testing
=3D=3D=3D=3D=3D=3D=3D

The hardware testing was done on v7.1.6, where an equivalent version of
this pair is what makes audio work on the machine. Against the master
commit named below, both patches have been compile-tested only (gcc, W=3D1,
no new warnings, no new external symbol references).

Patch 2 has been reworked slightly relative to the tested build: the
RT712-VB entry now reuses the existing jack_dmic_endpoints array, which
already describes exactly the AIF1 jack + AIF3 DMIC pairing this board
needs, instead of adding a second identical copy of it. That was a
mechanical substitution, but it has not been through hardware.

Tool disclosure, per Documentation/process/generated-content.rst
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

This work was done in extended interactive sessions with Claude (Anthropic,
model claude-opus-5) acting as a coding and debugging assistant, and a
substantial amount of the analysis and of the patch text originated with
it. Both patches carry an Assisted-by tag as described in
Documentation/process/coding-assistants.rst.

The division of work:

  - The assistant read the DMI data and ACP configuration flag off the
    running machine, identified the flag override as the fix, derived the
    SoundWire topology from the enumerated peripherals, and drafted both
    patches and both changelogs.
  - I ran everything that needed root or physical access, rebooted into
    each build, and did the listening tests. The left/right ordering in
    patch 2 is set by the order of the two amplifier entries; the first
    version had the sides reversed and that was caught by ear, not by the
    assistant.
  - No single prompt generated these patches. The session was iterative
    over roughly a day: inspect state, form a hypothesis, build, reboot,
    measure, discard the hypothesis if the measurement disagreed. Several
    confident intermediate conclusions were wrong and were only caught by
    measurement.

I have reviewed both patches, I understand what they do, and I take
responsibility for them.

Ville Saarinen (2):
  ASoC: amd: acp-config: force SoundWire probe on HP OmniBook X Flip 14
  ASoC: amd: acp70: add HP OmniBook X Flip 14 SoundWire machine

 sound/soc/amd/acp-config.c               |  7 +++
 sound/soc/amd/acp/amd-acp70-acpi-match.c | 56 ++++++++++++++++++++++++
 2 files changed, 63 insertions(+)


base-commit: 06cf61899d6498b33e4b7c87d99d5bd471ccc375
--=20
2.55.0


