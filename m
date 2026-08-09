Received: from mail-08.mail-europe.com (mail-08.mail-europe.com [57.129.93.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD98199E89;
	Sun,  9 Aug 2026 10:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.129.93.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786271831; cv=none; b=L/1bE+yNc3vOlD5rwJqFW85tGkeS3WxmmbRYonBjgbtISmyeUB0Ds63mGMxjGQk+JB6eIJj/qY+iLnOnhOIyuCddpod025BRmohg1MPt9r76wXoWAv69HzD0zeCIPIdNMjwGoBSc+GqnxmJ4BJ9hXcAlejdW0x5NVaxcQbVJQkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786271831; c=relaxed/simple;
	bh=yDDC3Poxiil6fbQ/Mbg61/57BsnsgxUyGDbP49JOsMI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UvsQghZuvntj/gGoK/BQjIZtF7G0zdufIXNG9nm0VPakHibt3LKCfGlzCy0p6UaQuVaLe6pLpB+YOwwDnogaNTE8QC2pqq85hVlqJ9TFYXgiGUQd7os1rvGtEig6H61BwXw6s8TyS7G6yoxXkCgCv61ehUANRmlPqvaELG6t8Vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=saarinenkoti.fi; spf=pass smtp.mailfrom=saarinenkoti.fi; dkim=pass (2048-bit key) header.d=saarinenkoti.fi header.i=@saarinenkoti.fi header.b=fODyNCuE; arc=none smtp.client-ip=57.129.93.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=saarinenkoti.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=saarinenkoti.fi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=saarinenkoti.fi header.i=@saarinenkoti.fi header.b="fODyNCuE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=saarinenkoti.fi;
	s=protonmail3; t=1786271814; x=1786531014;
	bh=j20t2ER8MXQhHP0amEFXNkVVtgZXDAFLHg0OSpz4aSg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=fODyNCuE20Y18KsnipxtBOfUIe9IxaBcxbFwvaKFWRktB74jw77v3Zb92ngu6k0pw
	 tRk0q7BWI7WJgepADmC/3F8tZ4zy0ZEohE0CuMKcS7c5J7SU+PPhiU9PVOhJZ0xPf5
	 lmF1Imr0MsjF2k0kz7XGOcRCBJzwyIaxggGG0DwuubG5JWSjH90nrv3BUVhndUCWM4
	 3rxFiie+z7TE/cxaXSxwtymsA2W7P64uqwqVI1R4PM5+Rh+KxJI579iOZP55YONsP0
	 qClyNX0pnuhGirwMtCL3TzHD6fnjdqj/ZK2oriSeJdn7QqJQMb7ydwMC9sCLSkcysX
	 msw+GlyAZyLuQ==
Date: Sun, 09 Aug 2026 10:36:50 +0000
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, Niranjan H Y <niranjan.hy@ti.com>
From: Ville Saarinen <wiza@saarinenkoti.fi>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Robin Everaars <robineveraars@pm.me>, Antoine Monnet <antoine@montane.tech>, Andrey Golovko <andrey.golovko@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, Ville Saarinen <wiza@saarinenkoti.fi>
Subject: Re: [PATCH 0/3] ASoC: tas2783: fix stereo split and resume on a two-amp pair
Message-ID: <20260809103634.20438-1-wiza@saarinenkoti.fi>
In-Reply-To: <20260809101541.4969-1-wiza@saarinenkoti.fi>
References: <20260809101541.4969-1-wiza@saarinenkoti.fi>
Feedback-ID: 137674609:user:proton
X-Pm-Message-ID: 561a77cf06769bf1a489743b76c535cba7fb31d8
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

I posted this series a few hours ago without having found the existing
work on exactly these bugs. That was my mistake: the threads were easy to
find and I did not look before sending. Apologies to those of you who have
been through this already. Adding Pierre-Louis, Robin, Antoine and Andrey
to Cc, and setting out below how the series relates to what is already
done, since a good part of it is not new.

Prior work I should have cited
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

  Robin Everaars, [BUG] every amp on the link selects the same channel
  https://lore.kernel.org/all/20260805183517.8665-1-robineveraars@pm.me/

  Antoine Monnet, no stereo channel split for two mono amps -> mono output
  https://lore.kernel.org/all/29e8c08b-9475-4aba-bce0-6d4a45a26d3b@gmail.co=
m/

  Antoine Monnet, calibration firmware not re-downloaded after s2idle resum=
e
  https://lore.kernel.org/all/c66ae00a-e878-4af0-a05a-272e9574eaa5@montane.=
tech/

  Andrey Golovko, ASoC: tas2783-sdw: drop stale regcache on uninitialized
  re-attach -- applied as b627da430357

  Andrey Golovko, port prepare never completes after S0i3
  https://lore.kernel.org/all/b1bc21c8a403fe15e742b6a6ff30b27f@gmail.com/

Everything above is on an ASUS ProArt PX13 HN7306EAC. My machine is an HP
OmniBook X Flip 14-kc0xxx (AMD Strix Point, ACP 7.2, two TAS2783 plus an
rt712-sdca on one link), so at least the reports now span two different
platforms and three different machines.

Patch 2 (RX Single Channel Switch): mostly not new
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

The central finding in my changelog -- that sdw_compute_slave_ports()
advances the payload offset by hweight32(ch_mask) and never looks at which
bit is set, so a one-channel mask defeats mirror mode while L/R follows
slave iteration order rather than the mask value -- was published by Robin
before I sent, and Andrey restated it precisely in the 08-07 message. I
reached it independently, which is worth exactly nothing in terms of
credit; it is Robin's result and I should have cited it.

Antoine's patch derives the per-amp mask from name_prefix. Mine exposes a
boolean control, off by default, and leaves the decision to the machine's
UCM profile. The honest difference is narrow: Antoine's works with no
userspace change on boards where the prefix order matches the speakers,
mine needs a UCM cset but does not encode a side in the driver at all,
which was my reaction to the same "the bit does not pick the channel"
problem. I do not think mine is obviously better and I am happy to drop it
in favour of Antoine's, or to rebase whatever is useful in it on top.

One thing that may be worth keeping either way is the naming. Andrey's
note that the name_prefix -> BIT(n) mapping "reads as if the bit picks the
channel" is the same objection that made me rename my own control: an
earlier version of this patch was an rt1316-style "RX Channel Select" enum
with Left/Right values, and those values measured inert, exactly as the
allocator predicts. A control that names a side is an ABI promise the bus
cannot keep.

A data point for the UDMPU23 ClusterIndex question
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Pierre-Louis, in the 08-07 message you suggested experimenting with
non-zero cluster indices per amp, and asked TI to comment on whether the
index is the right place for this. I have measurements on that, and they
are discouraging on this part.

SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_UDMPU23, TAS2783_SDCA_CTL_UDMPU_CLUSTER, 0=
)
cannot be written at all here. The amplifier answers COMMAND_IGNORED
(-ENODATA) in every state I tried: streaming, idle, and with the SDCA
function confirmed powered on via PDE23 Actual Power State =3D=3D ON; as a
4-byte MBQ write, as a plain single-byte write, after clearing the latched
Entity-0 status bits, and on the Next rank of the dual-ranked control.

The tell is that a genuine device read of the same Control with
sdw_read_no_pm() also returns -ENODATA. It is not write-protected and it
is not a ranking problem: on this device the Control is not implemented,
even though tas2783_reg_default[] carries an entry for it as 0x0. That
does not settle what the SDCA spec intends, and another TAS2783 revision
may well implement it -- but on this silicon the ClusterIndex route is
closed, which is why I did the split at the port level despite your point
that this is not what SDCA designs are supposed to do.

I would still like to hear TI on the intended mechanism. If the answer is
that PostureNumber is the right control and the Posture Table is supposed
to come from platform firmware, then none of the host-side approaches in
these threads is the real fix and it would be good to know that before one
of them lands.

Patch 3 (regcache): narrower than I described, and possibly still needed
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

I based this series on torvalds master, which does not yet carry Andrey's
b627da430357, so my changelog describes a bug that is already partly
fixed. Correcting that:

b627da430357 replaces the regcache_sync() in tas_update_status() with
regcache_drop_region(regmap, 0, UINT_MAX) on the uninitialized re-attach
path. That covers the case where the device lost power, went UNATTACHED
and cleared hw_init -- which is the case I measured.

What it does not cover is tas2783_sdca_dev_resume(), which still calls
regcache_sync() unconditionally (tas2783-sdw.c:1099 in broonie/for-next).
On a resume where the peripheral stayed attached and hw_init was never
cleared, that sync still writes stale reg_defaults over every
firmware-owned register, because the firmware is downloaded with
sdw_nwrite_no_pm() and the cache never saw those values. My patch drops
the firmware-owned regions from the cache at download time, which closes
that path too.

I want to be clear about the limits of my evidence: my measurement was on
v7.1.6, which predates b627da430357, so what I actually observed may have
been the UNATTACHED path that is now fixed. The residual dev_resume() path
is a code reading, not something I have measured in isolation on a tree
that already has Andrey's fix. I will test that properly and report back
rather than asking anyone to take the patch on this basis.

Patch 1 (deferred MBQ transactions)
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

I did not find prior coverage of this one. tas_regmap does not make
Entity-0 Function Status readable and does not set the mbq poll interval
or deadline, so regmap-sdw-mbq's retry for a Function answering
COMMAND_IGNORED never polls and every deferred write fails with -ENODATA
by construction. It may be relevant to the "port prepare never completes
after S0i3" thread; I have not tried to reproduce that symptom.

What I will do next
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Unless anyone would rather I did otherwise:

 - respin against broonie/sound for-next rather than master;
 - carry Link:/Reported-by: tags for Robin's and Antoine's reports;
 - drop or rework patch 2 depending on what happens with Antoine's;
 - hold patch 3 until I have measured the dev_resume() path on a tree
   containing b627da430357;
 - keep patch 1 as the one piece I believe is unencumbered.

Robin, Antoine, Andrey -- if you would like Reported-by: or Suggested-by:
on any of this, say so and I will add it; I did not want to attach your
names to a series you have not seen.

One disclosure that applies to this mail as much as to the patches: I work
on this with Claude (Anthropic, claude-opus-5) as an assistant, and a
substantial part of the analysis above, including the register-level
ClusterIndex work, originated with it. The cover letter has the full
statement. The measurements are mine, run on my hardware, and I take
responsibility for the claims either way.

Thanks, and sorry again for the duplicated effort.

Ville

