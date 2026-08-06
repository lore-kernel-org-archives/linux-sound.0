Received: from mail-24416.protonmail.ch (mail-24416.protonmail.ch [109.224.244.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A413A7584
	for <linux-sound@vger.kernel.org>; Thu,  6 Aug 2026 18:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786041856; cv=none; b=pYa1nVIseierpBWMriLNTT/p7wp8/N/XQwB9C/WQ8SKfKZQ3L58XmCkU9TAPf3Qmj4nSlbvnfwS0qDRjxSk7zQp45vTjovUWqoOonX/dx/fwxD1O0+/QWe2s13KSEnNKJPMpKIKMxkOkPEqBr1tkYWDpqYC9n/a1CCSX6ot0PwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786041856; c=relaxed/simple;
	bh=06sQnqd3tmjY+4o3Dne1sgdzFQ9zCYGuDtAfLAeHW7E=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TIp9VgTRblGld557x13eD38TpknlvsV0wyp8N/k4D1airXNZUDJixt+EZ5omYxnzNhPhLIAvFWWoENC/MTScCs5scgkU1kSqcdfI+Mo4X/4dPdHTDbA5Wv0KpDrMLuo/T5l6OuV0JQ9l4i3OaKF/Te8khbw6rUAVcyNbjztJ/NQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=QKxunHMW; arc=none smtp.client-ip=109.224.244.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="QKxunHMW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1786041845; x=1786301045;
	bh=n8U9uH1upctZK8ovvXv1N4j1S/cn2X2ZeP1T3MaELtQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=QKxunHMWxu94FwPbf1Da33/hH6Q9X1EED4aEFnDr3W4x3J8B9Iyu8JWNSTligG/WF
	 PNz+TDSV4MtyTlmH00sfyaXbzdVh+i37FZYYdMwHU3EX7fi9Gm5M5IcOd/VfgZyqry
	 Z/6qzDSzzW2JAArNfovsmyaMxsElQaCQLWa+NBFONaqs5bRXSIirqsB8AN1hyvBM08
	 BDj1f3Piargf0lH3HKVCA8U3pVzTS0nbrWZ070wjQBXcQaJpxvrv/V8t3Cvn2/ut2l
	 1LnsyEGHA70QVZUIqdmUwUSsPKgIYbYylptgKDZwwRKENYKfpjdmUmtVJWshZvIVll
	 pA5D7h8OQmYcg==
Date: Thu, 06 Aug 2026 18:43:57 +0000
To: pierre-louis.bossart@linux.dev, shenghao-ding@ti.com, kevin-lu@ti.com, baojun.xu@ti.com, niranjan.hy@ti.com, broonie@kernel.org, lgirdwood@gmail.com, linux-sound@vger.kernel.org
From: Robin Everaars <robineveraars@pm.me>
Cc: ckeepax@opensource.cirrus.com, mstrozek@opensource.cirrus.com, yung-chuan.liao@linux.intel.com, vkoul@kernel.org, Vijendar.Mukunda@amd.com, peter.ujfalusi@linux.intel.com, sen@ti.com, nealstarkie@gmail.com, bjuraszewski@gmail.com, andrey.golovko@gmail.com, linux-kernel@vger.kernel.org
Subject: Re: [BUG] ASoC: tas2783-sdw: every amp on the link selects the same channel, so a two-amp board plays mono
Message-ID: <20260806184353.112230-1-robineveraars@pm.me>
In-Reply-To: <02f2cd9c-519c-4154-be58-9065f34c6001@linux.dev>
References: <20260805183517.8665-1-robineveraars@pm.me> <02f2cd9c-519c-4154-be58-9065f34c6001@linux.dev>
Feedback-ID: 201127006:user:proton
X-Pm-Message-ID: d13dc9d76510a6ddaf856127f4bcd7d09880d0d5
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature"; micalg=pgp-sha256; boundary="------9fd334f49cfcc35ab5c4177acda9b2dab6d41665c988b97b17ea6bc1ae5f4920"; charset=utf-8

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------9fd334f49cfcc35ab5c4177acda9b2dab6d41665c988b97b17ea6bc1ae5f4920
Content-Type: multipart/mixed;
 boundary=929886f5b899007a84e89b58745efeb84ca6d623acbe7cf75c86d88f7c3b
From: Robin Everaars <robineveraars@pm.me>
To: pierre-louis.bossart@linux.dev,
	shenghao-ding@ti.com,
	kevin-lu@ti.com,
	baojun.xu@ti.com,
	niranjan.hy@ti.com,
	broonie@kernel.org,
	lgirdwood@gmail.com,
	linux-sound@vger.kernel.org
Cc: ckeepax@opensource.cirrus.com,
	mstrozek@opensource.cirrus.com,
	yung-chuan.liao@linux.intel.com,
	vkoul@kernel.org,
	Vijendar.Mukunda@amd.com,
	peter.ujfalusi@linux.intel.com,
	sen@ti.com,
	nealstarkie@gmail.com,
	bjuraszewski@gmail.com,
	andrey.golovko@gmail.com,
	linux-kernel@vger.kernel.org
Subject: Re: [BUG] ASoC: tas2783-sdw: every amp on the link selects the same channel, so a two-amp board plays mono
Date: Thu,  6 Aug 2026 20:43:53 +0200
Message-ID: <20260806184353.112230-1-robineveraars@pm.me>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <02f2cd9c-519c-4154-be58-9065f34c6001@linux.dev>
References: <20260805183517.8665-1-robineveraars@pm.me> <02f2cd9c-519c-4154-be58-9065f34c6001@linux.dev>
MIME-Version: 1.0

--929886f5b899007a84e89b58745efeb84ca6d623acbe7cf75c86d88f7c3b
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

> you mentioned a two-amp board but the wording seems to describe 4 amps?

Two amps: an ASUS ProArt PX13 HN7306EAC with two TAS2783 plus an
rt721-sdca on one link. Every number in the report came from those two.
The four-amp wording leaked in from my patch, which keys off the
name_prefix suffix and also handles -3 and -4. I have no such board, so
that half was an untested guess and should not have been described as
fact.

> Also not sure what mapping you are referring to, I looked up the code
> and couldn't connect the dots between the last sentence and the code.

Because there are no dots to connect. I meant
asoc_sdw_ti_spk_rtd_init() (soc_sdw_ti_amp.c:52-79), which picks a
speaker name from the suffix, -1 "Left Spk", -2 "Right Spk", -3
"Left Spk2", -4 "Right Spk2", and adds a DAPM route per amp. That names
widgets and programs nothing in the amp, so "matching the mapping"
claimed far more than the code does. My description was also wrong in
detail: I wrote "Left Spk
" for -3 where the code says "Left Spk2".

The assignment rests on measurement instead. Muting each amp in turn and
scoring the acoustic result puts amp 1 at the left speaker and amp 2 at
the right on this board.

> This may work but that isn't the intended role of the PPU (Posture
> Processing Unit).
> In theory the same posture number should be given to both amps, and
> they shall modify their input to output mapping accordingly.

Taken. Two things follow that I would like your view on, because the
driver already writes that control.

tas2783_init_seq[0] sets PostureNumber unconditionally on every amp that
probes (tas2783-sdw.c:306 in v7.1.5, :308 in mainline):

  REG_SEQ0(SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_PPU21, 0x10, 0x00), 0x01)

while tas2783.h:87 calls selector 0x10 TAS2783_SDCA_CTL_UDMPU_CLUSTER,
i.e. UDMPU ClusterIndex (sdca_function.h:425), against a PPU21 entity
where 0x10 is PostureNumber (sdca_function.h:528). reg_default lists the
same register as 0x0
 (tas2783-sdw.c:276). So my patch made an existing
unconditional write per-amp, trusting the local define's name.

1. Should init_seq[0] write PostureNumber at all, and if so is 0x01 right
   for a device that does not yet know its posture?

2. For one shared posture number to give stereo, each amp must know which
   speaker it is. Where from, on a board like this? The ACPI carries no
   parseable SDCA function description for either amp ("function type
   only supported as DisCo constant"), so sa_func_data stays NULL, no
   Channel Cluster table is parsed and tas_io_init() takes the
   regmap_multi_reg_write() branch (tas2783-sdw.c:1174-1179). Nothing
   distinguishes the two amps, so one posture number gives both the same
   mapping, which is the mono I measured. Broken platform firmware with
   nothing for the driver to do but say so, or a driver fallback keyed on
   something else?

> For aggregated amps (which is the case here), the spec also says the
> PostureNu
mber register needs to be dual-ranked for synchronous changes
> but that part isn't managed by the SoundWire/SDCA core just yet.

That sent me to the bus, where the dual-ranked handling already exists:
the core writes p_rt->ch_mask to SDW_DPN_CHANNELEN_B0 or _B1 by
bus->params.next_bank (stream.c:329-339), and tas_port_prep() already
forwards the same mask to DPN_PrepareCtrl (tas2783-sdw.c:1239).

Today nothing uses it per amp. snd_sdw_params_to_config() hands every
peripheral GENMASK(ch_count - 1, 0) (include/sound/sdw.h:46) and
tas_sdw_hw_params() never overrides it (tas2783-sdw.c:940), so both amps
enable both channels. rt1308-sdw.c:559 and max98373-sdw.c:541 override it
from a per-device rx_mask via .set_tdm_slot, and
asoc_sdw_cs_spk_feedback_rtd_init() (soc_sdw_cs_amp.c:94-106) already
assigns per-amp masks inside sdw_utils. tas2783 has neither: no
.set_tdm_slot in tas_dai_ops (:978), and soc_sdw_ti_amp.c never calls it.

I built that and measured it, with the PPU
21 patch removed so the result
was attributable. One boot, control first, dB over the noise floor:

  configuration              left      right     imbalance
  shipped, PPU21 per amp     +70.5     +69.7     +0.9 dB
  ch_mask per amp            +71.3     +71.1     +0.2 dB

For reference the unpatched driver scores +0.4 dB on the right channel,
i.e. silence. PostureNumber stayed 0x01 on BOTH amps throughout, since a
fresh probe re-runs init_seq against a regmap whose cached default is
0x0. So the amp renders whatever arrives on its enabled DP1 channel,
PPU21 does not need a two-channel cluster at IT21, and nothing has to
write PostureNumber per amp.

One catch, and it is why I have not posted a patch. The mask VALUE is not
what selects the channel. sdw_compute_slave_ports() advances the payload
block offset by bps * hweight32(ch_mask) as a running sum over
slave_rt_list, resetting it only for a slave that took every channel,
which it calls mirror mode (generic_bandwidt
h_allocation.c:44-84). I
tested that with a module parameter that inverts the assignment:

  amp 1   amp 2   LEFT only, mic L / mic R
  0x1     0x2     4282 / 289
  0x2     0x1     4615 / 799

The kernel log confirms the masks inverted; the audio did not change. So
what fixes mono is a ONE-channel mask per amp, which stops the mirror-mode
reset and puts the amps at consecutive offsets. Which channel each lands
on follows its position in slave_rt_list, i.e. codec order in the DAI
link.

That leaves a machine driver no way to say "this peripheral renders the
right channel". It can only give each amp one channel and rely on codec
order matching the speakers. Here it does, tas2783-1 is the left speaker
and is first, which is exactly why the mask looked like it was working.
Reverse the enumeration and the speakers swap with nothing in the mask
able to correct it.

Is that positional behaviour intended, and is the missing
channel-to-peripheral binding a core gap? It look
s like the same class of
thing as the dual-ranked PostureNumber. If it is intended, then
.set_tdm_slot in tas2783 plus the assignment in soc_sdw_ti_amp.c is a
complete fix for boards whose codec order matches their speakers and I
will post it. If not, the fix belongs deeper than this codec and I would
rather not paper over it.

Either way the reported behaviour stands: on a two-amp board with no
DisCo data every amp renders the same channel, and no control in the
driver can change it. The PPU21 patch stays a local workaround on my own
machine and I am not proposing it upstream.

Last question, since the PPU came up: this laptop is a convertible with
real postures. Should PostureNumber be driven by the fold state the
tablet-mode switch already reports, rather than written once at init?

--929886f5b899007a84e89b58745efeb84ca6d623acbe7cf75c86d88f7c3b
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
--929886f5b899007a84e89b58745efeb84ca6d623acbe7cf75c86d88f7c3b--

--------9fd334f49cfcc35ab5c4177acda9b2dab6d41665c988b97b17ea6bc1ae5f4920
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail

wqsEARYIAF0Fgmp01e0JEB3Ff2vLBhqKNRQAAAAAABwAEHNhbHRAbm90YXRp
b25zLm9wZW5wZ3Bqcy5vcmf8n1AmMaWpDB/+qfOiv68tFiEEi2uhMrb2XujF
nFjLHcV/a8sGGooAAKVTAQD2mO5xtJqCSSYWMHTPTCrqEcmJME5bga/l9VfR
3jRbiQD+KR9GwQT0cnK+XgQAAmHqAgugI3R3DIsrLhFjYc8xhgY=
=3LfP
-----END PGP SIGNATURE-----


--------9fd334f49cfcc35ab5c4177acda9b2dab6d41665c988b97b17ea6bc1ae5f4920--

