Received: from mail-10625.protonmail.ch (mail-10625.protonmail.ch [79.135.106.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1523642EEA1
	for <linux-sound@vger.kernel.org>; Wed, 12 Aug 2026 11:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786533828; cv=none; b=N2rJDmyIqc9FMW2s4A2cmw6Im1mBBYYMBDiFzojQvwFjNSRzpwOa6hxHTyj4urU6Ppu9ycYtPNFc9vrMIul3F7rRclzMmzVLtXxUKEmNTxIjdNpcBvQVZD+9ekRjZnPwTaqMkIeWAoj4DbSl8VfL9HDA4GUmrZ1kvrvQYREWUn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786533828; c=relaxed/simple;
	bh=gqGG2hg8KTCPfVwr6k2uf+qauOPywe8S74wKFpg/KdE=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Skio2dqew3QdAR2ZNr3Ht7+KJ0d/06MbOHMSQvlAzh6tTsH96U0qEmtHu3VxyESNYsZFUgOt5R9iY1UdS53GB8fiI+2WeqV0NmTV5L9BUyZ4ySMwfu2PXMmfobq8U+d8LqfoVMZJrTve+mozXFWwsC1ziGg6txtA09JcWqvDiiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=saarinenkoti.fi; spf=pass smtp.mailfrom=saarinenkoti.fi; dkim=pass (2048-bit key) header.d=saarinenkoti.fi header.i=@saarinenkoti.fi header.b=Qtnkv1L6; arc=none smtp.client-ip=79.135.106.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=saarinenkoti.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=saarinenkoti.fi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=saarinenkoti.fi header.i=@saarinenkoti.fi header.b="Qtnkv1L6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=saarinenkoti.fi;
	s=protonmail3; t=1786533813; x=1786793013;
	bh=RU+Ld95pfrzkJrLcZyLWAzw6v1bLHorL9WbF89AZvk4=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=Qtnkv1L6u4MhzJYNhbEifcpb/di40ACEQQQGqPXMjSJyIUo6d1W70Ab2p4+Hxuulx
	 z52KgRz17yrLf8eT1dizWfudg6rZz5ccw9sd18vO6x4D0Dg2tcp6m1fTNvwTLmnlnu
	 I0/avb07vnSg9p3YXJVcjLT3qmQpcXbX+G5G0eSlS7b+SiVYZYNIfl+MAZD81fIIsT
	 mzBn52aEtP8HuksMqHyuJInCgUSRe7XhlrlPpB1RiCHW2jCG4bG4osx80R42T1l922
	 eSkVMQjrAH4vTIkZdMOli0S98OkPS51+cJKswPy0ZZzzKcM2Qd+9usvtw7fYUIE2gH
	 pNYC4EWZwP4Jg==
Date: Wed, 12 Aug 2026 11:23:29 +0000
To: Kel Modderman <kelvmod@gmail.com>
From: Ville Saarinen <wiza@saarinenkoti.fi>
Cc: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, Robin Everaars <robineveraars@pm.me>, Antoine Monnet <antoine@montane.tech>, Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org, Ville Saarinen <wiza@saarinenkoti.fi>
Subject: Re: ACP7.0 SoundWire: two TAS2783 amps, only one channel reproduced?
Message-ID: <20260812112312.13340-1-wiza@saarinenkoti.fi>
Feedback-ID: 137674609:user:proton
X-Pm-Message-ID: 5b1f4a41f234ca538a1ca02c57e1e3ee65f87ac9
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Same machine here, same link/uid map, so some of this is already done.

The two changes you are carrying are upstream as of yesterday, in
broonie/sound.git for-7.3:

  8393e0bf593b ASoC: amd: acp-config: force SoundWire probe on HP
               OmniBook X Flip 14
  b48466e4be18 ASoC: amd: acp70: add HP OmniBook X Flip 14 SoundWire
               machine

You can drop your local pair.

The channel problem is not an adr layout problem, which is why none of
your three arrangements moved it. snd_sdw_params_to_config() hands both
amps ch_mask 0x3 on a 2-channel stream, and sdw_compute_slave_ports()
treats a slave whose mask covers the whole stream as mirror mode: it
resets the payload block offset for the next slave. Both amps end up on
the same offset and render the same samples. On the wire that shows as
DP1_CHANNELEN 0x03 and DP1_OFFSETCTRL1 0x41 reading identically on the
two amps during playback. group_position never reaches that allocation,
so no layout can change it.

The lever is ch_mask. An amp that claims one channel drops the pair out
of mirror mode and the core assigns consecutive offsets. Worth knowing
what that does and does not give you: sdw_compute_slave_ports() advances
by hweight32(ch_mask), the popcount only, never which bit is set, so you
can choose whether an amp takes one channel or mirrors, but not which
channel it takes. Which side each amp lands on is fixed by slave
iteration order, i.e. codec order in the dai_link -- so your adr array
does decide L/R, just not whether the split happens at all.

The SDCA control that ought to do this on the device, the UDMPU23
Cluster Index, I could not get to take: reads and writes both come back
-ENODATA in every state I tried. That return does not distinguish
"ignored" from "not implemented", so treat it as unresolved rather than
as a finding.

Don't take this from my patch -- I withdrew that series. The live work
is Robin Everaars' report,

  https://lore.kernel.org/all/20260805183517.8665-1-robineveraars@pm.me/

and Antoine Monnet's patch doing the same split keyed off name_prefix,
<29e8c08b-9475-4aba-bce0-6d4a45a26d3b@gmail.com>, which has a Tested-by
from Andrey Golovko on a second machine. Both predate mine.

For the ticket question: the residue here is codec-side, not ACP.

Ville

