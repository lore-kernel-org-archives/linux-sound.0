Received: from mail-24420.protonmail.ch (mail-24420.protonmail.ch [109.224.244.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02533395AD5;
	Thu, 13 Aug 2026 08:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786611405; cv=none; b=oMHiGPpswnvgnBE6fTwuTeZe9FvBkVXT+YDcsHsSc/SHOLGAOYnUbObOPKTTSGCAVhJt4IqfFXD1NdnOqK3L7p/sgBXVdsmePIqnDvcmVnzD9Gx/Hyh7WrrLzasBcq9aj5VswlAfisiepYzo2lNikcEBmd6RKSaEaL/XGsQHTv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786611405; c=relaxed/simple;
	bh=0eblkBlpU6VxXe6kKn7D7nDqZl3eH3KN40wnXFiyaX0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fmUqQ6eugKJlowRjKgqUj9npGluJdEmdlL1NPT7tNHzB9vYcKD3imCzvWtTPhrieW390ak1eeUMJB6SU9RYy+HDNlbGHhiuAXHFGaGNRF+GEvFZcgib34CSwagYrsbp93ZYNmeq/zErYFjA7CPPay1LB2cZmhZP5mkXAAFGgN0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=saarinenkoti.fi; spf=pass smtp.mailfrom=saarinenkoti.fi; dkim=pass (2048-bit key) header.d=saarinenkoti.fi header.i=@saarinenkoti.fi header.b=ADm3uJ72; arc=none smtp.client-ip=109.224.244.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=saarinenkoti.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=saarinenkoti.fi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=saarinenkoti.fi header.i=@saarinenkoti.fi header.b="ADm3uJ72"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=saarinenkoti.fi;
	s=protonmail3; t=1786611392; x=1786870592;
	bh=ooZRa69fJKFTvAATXm7fT+LihFb/4Dt5QwkyA87L2o0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=ADm3uJ723H0q833oRNTXMVOTXBDUuIH/zvUIRcj1vKlWzvs/lsUsZZt6Eoi5PCAEp
	 3EWePgHz9DZ8PfWELMHosoxKXtMPwbBuC4BDrBaekiuKYWbTaqOEIlC5RWPK8u7rJq
	 +puTZQfGKlXKRNFPkUwHyX7DV2IxB7Q6PI2ZzlsI1YtWsTTNug3LHOuI0M5ewP0uXS
	 BZPqDmbZUH0JM1NQR3HQjmYbcYkgRnrFCritgOIZ3ZnpuWxbKB1PPZWn6KlNNdYDT+
	 4sx/34ahk1tmYZVdmcFB1mJrcVgWXBX1sTkirYf2115xx2gtr2wxtUsM5PRBLSbjXn
	 5L/58m8kbsVUw==
Date: Thu, 13 Aug 2026 08:56:26 +0000
To: Andrey Golovko <andrey.golovko@gmail.com>
From: Ville Saarinen <wiza@saarinenkoti.fi>
Cc: Antoine Monnet <antoine@montane.tech>, Charles Keepax <ckeepax@opensource.cirrus.com>, Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>, Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Robin Everaars <robineveraars@pm.me>, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, Ville Saarinen <wiza@saarinenkoti.fi>
Subject: Re: ASoC: tas2783-sdw: no stereo channel split for two mono amps -> mono output (AMD ACP SoundWire, ASUS ProArt PX13)
Message-ID: <20260813085558.64828-1-wiza@saarinenkoti.fi>
In-Reply-To: <cc1960d677a7f5a5c86d48c3037c0aa6@gmail.com>
References: <29e8c08b-9475-4aba-bce0-6d4a45a26d3b@gmail.com> <778f017a-e1c2-4ab6-9968-6e4c6285180b@montane.tech> <cc1960d677a7f5a5c86d48c3037c0aa6@gmail.com>
Feedback-ID: 137674609:user:proton
X-Pm-Message-ID: 681c82209526b409df4e638071e1c1ce812d204e
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

> Ville measured that UDMPU23 ClusterIndex is simply not implemented on
> his TAS2783 revision, answering COMMAND_IGNORED to writes and to a
> plain read alike, so that route is closed at least on that silicon.

Since this is headed for a changelog: the conclusion is right, but the
stated reason was not something I had measured. COMMAND_IGNORED was my
word, in an earlier mail, and it was an overstatement -- the host never
sees it. find_response_code() (drivers/soundwire/bus.c) maps
SDW_CMD_IGNORED to -ENODATA, and a control the peripheral does not
implement arrives as -ENODATA too, so the return code cannot tell a
deferral from an absence.

Charles, this is why you are on Cc: the same assumption is the premise
of the .deferrable annotation on UDMPU23 Cluster Index in the patch you
picked up, and it does not survive the measurement below.

The discriminator is Entity 0 Function Status bit 7 (FUNCTION_BUSY),
which a deferred command sets until the Function finishes. I have now
read it, on this board's two amps, via the SoundWire debugfs raw command
interface -- sdw_nread_no_pm()/sdw_nwrite_no_pm(), so the driver's
regmap is not in the path and readable_reg/mbq_size cannot colour the
result:

  UDMPU23 Cluster Index, read:            -ENODATA
  UDMPU23 Cluster Index, write:           -ENODATA
  Function Status, 20 reads after each:   0x63, unchanged, ~200 us/read
                                          FUNCTION_BUSY never set

in three states -- idle at PDE23 PS3, during playback at PS0, and forced
to PS0 through PDE23 -- and identically on both amps.

Controls, so the result is falsifiable in both directions: PDE23 Actual
Power State reads correctly, and a PDE23 Requested Power State write is
accepted and moves Actual to PS0, so reads and writes both reach the
device. A deliberately absent entity (0x3D) returns -ENODATA in every
one of those states, indistinguishable from Cluster Index.

So the control is not deferring, powered or unpowered, on read or on
write. "Not implemented" remains an inference rather than a datasheet,
and a deferral shorter than one Function Status round trip (~200 us)
would have been missed, but the deferral reading is the one thing this
does rule out -- and that reading is what the .deferrable annotation
encodes.

The hweight32() sentence is worth having in the changelog for the reason
you give.

Measurement scripted and analysed with AI assistance (Claude Opus 5);
the register addresses come from the kernel's own SDW_SDCA_CTL() macro
and the numbers are from this laptop, so both are checkable.

Ville

