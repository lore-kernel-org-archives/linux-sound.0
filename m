Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9EBA3D4123
	for <linux-sound@vger.kernel.org>; Thu,  6 Aug 2026 20:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786048238; cv=none; b=QUdt6xGuycGDY7enh4TsXJEIklNNDuoiZUuqjJJZH7KG5zXImG7mi8lsXZcwJz/HS02Gg45sPPUMAyEfw6OXbNeqHT0Vvq7rJaSwztLxNZwb1+o4FEbUuQASDpnDI283X2n9MocJ+vMIIQqf/o2OLzDi9NjLLZ+mw2nXIjJAPjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786048238; c=relaxed/simple;
	bh=w/EzEifUvdN0AE/FvrFlNDS4l3dTlCKYoOuhZ5JK+WE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vj9syOL0yCF86lFnE3hH+yFkfxfVz98u0P3bKpEAVNuNwPv3aoe4+tELqtAQojEXhkxJPqTZeq9KnHr7txcy4BWHWAWV/ke2csaHTtN111/aQcqF0s7iTb2Hm2iJNtUnXIVNZA0WlX4vEJNn5Mt0nspzF89pXjUqGqHwRx7sWis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Kmt/IKSG; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Kmt/IKSG"
Message-ID: <39194f6b-2613-42a3-a857-702889add03d@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1786048224;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4M4tshjnY+NbzJNHIH4D0nMsKDMYo+ZXA30pBwlxGPo=;
	b=Kmt/IKSGK/J29s93N9GfRCGi6MNylnjW6minUPlR+dHFemI/YXgu25ZmqD9gHJTHqOjbGc
	OflcESYGhNq+mUiaKaMLdA/NcPg75bwFkoZ7prg0Qtxjqe40F1itgUISAzo8IBTr5RC9oP
	D+mfKtw0D8o05uF2gLMXMjsHWU7e+ME=
Date: Thu, 6 Aug 2026 22:30:03 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [BUG] ASoC: tas2783-sdw: every amp on the link selects the same
 channel, so a two-amp board plays mono
To: Robin Everaars <robineveraars@pm.me>, shenghao-ding@ti.com,
 kevin-lu@ti.com, baojun.xu@ti.com, niranjan.hy@ti.com, broonie@kernel.org,
 lgirdwood@gmail.com, linux-sound@vger.kernel.org
Cc: ckeepax@opensource.cirrus.com, mstrozek@opensource.cirrus.com,
 yung-chuan.liao@linux.intel.com, vkoul@kernel.org, Vijendar.Mukunda@amd.com,
 peter.ujfalusi@linux.intel.com, sen@ti.com, nealstarkie@gmail.com,
 bjuraszewski@gmail.com, andrey.golovko@gmail.com,
 linux-kernel@vger.kernel.org
References: <20260805183517.8665-1-robineveraars@pm.me>
 <02f2cd9c-519c-4154-be58-9065f34c6001@linux.dev>
 <20260806184353.112230-1-robineveraars@pm.me>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20260806184353.112230-1-robineveraars@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 8/6/26 20:43, Robin Everaars wrote:
>> you mentioned a two-amp board but the wording seems to describe 4 amps?
> 
> Two amps: an ASUS ProArt PX13 HN7306EAC with two TAS2783 plus an
> rt721-sdca on one link. Every number in the report came from those two.
> The four-amp wording leaked in from my patch, which keys off the
> name_prefix suffix and also handles -3 and -4. I have no such board, so
> that half was an untested guess and should not have been described as
> fact.
> 
>> Also not sure what mapping you are referring to, I looked up the code
>> and couldn't connect the dots between the last sentence and the code.
> 
> Because there are no dots to connect. I meant
> asoc_sdw_ti_spk_rtd_init() (soc_sdw_ti_amp.c:52-79), which picks a
> speaker name from the suffix, -1 "Left Spk", -2 "Right Spk", -3
> "Left Spk2", -4 "Right Spk2", and adds a DAPM route per amp. That names
> widgets and programs nothing in the amp, so "matching the mapping"
> claimed far more than the code does. My description was also wrong in
> detail: I wrote "Left Spk
> " for -3 where the code says "Left Spk2".

ok.

> The assignment rests on measurement instead. Muting each amp in turn and
> scoring the acoustic result puts amp 1 at the left speaker and amp 2 at
> the right on this board.
> 
>> This may work but that isn't the intended role of the PPU (Posture
>> Processing Unit).
>> In theory the same posture number should be given to both amps, and
>> they shall modify their input to output mapping accordingly.
> 
> Taken. Two things follow that I would like your view on, because the
> driver already writes that control.
> 
> tas2783_init_seq[0] sets PostureNumber unconditionally on every amp that
> probes (tas2783-sdw.c:306 in v7.1.5, :308 in mainline):
> 
>   REG_SEQ0(SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_PPU21, 0x10, 0x00), 0x01)
> 
> while tas2783.h:87 calls selector 0x10 TAS2783_SDCA_CTL_UDMPU_CLUSTER,
> i.e. UDMPU ClusterIndex (sdca_function.h:425), against a PPU21 entity
> where 0x10 is PostureNumber (sdca_function.h:528). reg_default lists the
> same register as 0x0
>  (tas2783-sdw.c:276). So my patch made an existing
> unconditional write per-amp, trusting the local define's name.
> 
> 1. Should init_seq[0] write PostureNumber at all, and if so is 0x01 right
>    for a device that does not yet know its posture?

The PostureNumber is just an index in a Posture Table, if the posture
isn't known there's probably a default. The value for postures is not
defined in the spec, it depends on every OEM and BIOS vendor but would
have to be generated by the codec vendor.

> 2. For one shared posture number to give stereo, each amp must know which
>    speaker it is. Where from, on a board like this? The ACPI carries no
>    parseable SDCA function description for either amp ("function type
>    only supported as DisCo constant"), so sa_func_data stays NULL, no
>    Channel Cluster table is parsed and tas_io_init() takes the
>    regmap_multi_reg_write() branch (tas2783-sdw.c:1174-1179). Nothing
>    distinguishes the two amps, so one posture number gives both the same
>    mapping, which is the mono I measured. Broken platform firmware with
>    nothing for the driver to do but say so, or a driver fallback keyed on
>    something else?

No. Posture is a generalized concept of orientation (landscape v.
portrait modes), this was introduced to deal with flexible shapes where
a laptop may be used as a tablet or in 'tent' mode.

The knowledge of where speakers are is a prerequisite for the Posture
selection. Note that the mapping from channels to speakers is not
necessarily a selection, there could be processing/mixing.

>> For aggregated amps (which is the case here), the spec also says the
>> PostureNu
> mber register needs to be dual-ranked for synchronous changes
>> but that part isn't managed by the SoundWire/SDCA core just yet.
> 
> That sent me to the bus, where the dual-ranked handling already exists:
> the core writes p_rt->ch_mask to SDW_DPN_CHANNELEN_B0 or _B1 by
> bus->params.next_bank (stream.c:329-339), and tas_port_prep() already
> forwards the same mask to DPN_PrepareCtrl (tas2783-sdw.c:1239).

No, dual-ranked registers are not the same thing as banked registers
used for transport dynamic changes.

> Today nothing uses it per amp. snd_sdw_params_to_config() hands every
> peripheral GENMASK(ch_count - 1, 0) (include/sound/sdw.h:46) and
> tas_sdw_hw_params() never overrides it (tas2783-sdw.c:940), so both amps
> enable both channels. rt1308-sdw.c:559 and max98373-sdw.c:541 override it
> from a per-device rx_mask via .set_tdm_slot, and
> asoc_sdw_cs_spk_feedback_rtd_init() (soc_sdw_cs_amp.c:94-106) already
> assigns per-amp masks inside sdw_utils. tas2783 has neither: no
> .set_tdm_slot in tas_dai_ops (:978), and soc_sdw_ti_amp.c never calls it.

The assumption is indeed that all channels are provided to the amp. The
amp has to either select or process what it sends to the output, each
amp is supposed to do something different.

> I built that and measured it, with the PPU
> 21 patch removed so the result
> was attributable. One boot, control first, dB over the noise floor:
> 
>   configuration              left      right     imbalance
>   shipped, PPU21 per amp     +70.5     +69.7     +0.9 dB
>   ch_mask per amp            +71.3     +71.1     +0.2 dB
> 
> For reference the unpatched driver scores +0.4 dB on the right channel,
> i.e. silence. PostureNumber stayed 0x01 on BOTH amps throughout, since a
> fresh probe re-runs init_seq against a regmap whose cached default is
> 0x0. So the amp renders whatever arrives on its enabled DP1 channel,
> PPU21 does not need a two-channel cluster at IT21, and nothing has to
> write PostureNumber per amp.
> 
> One catch, and it is why I have not posted a patch. The mask VALUE is not
> what selects the channel. sdw_compute_slave_ports() advances the payload
> block offset by bps * hweight32(ch_mask) as a running sum over
> slave_rt_list, resetting it only for a slave that took every channel,
> which it calls mirror mode (generic_bandwidt
> h_allocation.c:44-84). I
> tested that with a module parameter that inverts the assignment:
> 
>   amp 1   amp 2   LEFT only, mic L / mic R
>   0x1     0x2     4282 / 289
>   0x2     0x1     4615 / 799
> 
> The kernel log confirms the masks inverted; the audio did not change. So
> what fixes mono is a ONE-channel mask per amp, which stops the mirror-mode
> reset and puts the amps at consecutive offsets. Which channel each lands
> on follows its position in slave_rt_list, i.e. codec order in the DAI
> link.
> 
> That leaves a machine driver no way to say "this peripheral renders the
> right channel". It can only give each amp one channel and rely on codec
> order matching the speakers. Here it does, tas2783-1 is the left speaker
> and is first, which is exactly why the mask looked like it was working.
> Reverse the enumeration and the speakers swap with nothing in the mask
> able to correct it.

My understanding is that firmware is supposed to know which amp is
which, and provide different settings.

> Is that positional behaviour intended, and is the missing
> channel-to-peripheral binding a core gap? It look
> s like the same class of
> thing as the dual-ranked PostureNumber. If it is intended, then
> .set_tdm_slot in tas2783 plus the assignment in soc_sdw_ti_amp.c is a
> complete fix for boards whose codec order matches their speakers and I
> will post it. If not, the fix belongs deeper than this codec and I would
> rather not paper over it.
> 
> Either way the reported behaviour stands: on a two-amp board with no
> DisCo data every amp renders the same channel, and no control in the
> driver can change it. The PPU21 patch stays a local workaround on my own
> machine and I am not proposing it upstream.

I am not sure how each amp can know how to behave is there's no DisCo
data at all...

Maybe the mapping is implicit and defined by the Unique Number

I am not sure though how that Unique Number maps to the -1 and -2 suffix

sdw:0:1:0102:0000:01:8   TAS2783, device_number 3, slave-tas2783
sdw:0:1:0102:0000:01:b   TAS2783, device_number 2, slave-tas2783

which one is left and which one is right?

> Last question, since the PPU came up: this laptop is a convertible with
> real postures. Should PostureNumber be driven by the fold state the
> tablet-mode switch already reports, rather than written once at init?

See explanation above, the PostureNumber is supposed to be dynamic based
on orientation, etc. This is NOT static channel selection, the output
can be a selection or processing of the input channel.

That said, we are missing a link between the sensors subsystems and ALSA
to determine that postureNumber, so take my explanations with a grain of
salt, there's currently no way to automagically update the posture number.
