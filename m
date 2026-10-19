Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792432417;
	b=BveYjJ9e53yxoDXO4Xd6uH8Cd6RyQplEOElyXDcooPryAiJJ52FVaZtl6VoKMf4balEB
	 oEi2+uABIffSlWxfdw8lFKTY1d70cbhIa0TcVx7pmjERJZy/svpMH0ItHFtEmLCY6o7SQ
	 nOlfkkaFiyzVKdzX6kISWAtm41dfLKlNg8iWvImK66WJm2EmBa2wohXlJCykIJtZFyH0R
	 qcrzvfdq5svos3n9LJ0iSYkYHjMc+ImPiRz1ZFEKnjnsZ+wh3NJ44MvOqjP90I0siY2zA
	 A/fW02o9nEEgT7/r2+8tjdzi3C4fp6xAykwBYZ9vqucx1ede4MDaRb/diTHV/WexUSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792432417;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=vGcQptXdlM4hwvNCPfFEa1fOO8xQP2wP1II9AEpPcBo=;
	b=3VgmaqIzDR37lVayNlzJ/eou4G5llzlBWwboWPRIfQUA0q83WBvb8ppSrXXu8R7LL8g5
	 B+Vx+U7PuphZdtrVi/Wa3caeudN8MrQMQqfxRRiN548RAon7isq1pyLUjoO1E1oyZwooX
	 GVQqX2RTab/tYRq2LH6oU22XCI6MO/LwyTIpqXAQVlypLmMnh+af48Hoyc844N32N8amt
	 HdJ7zh3h8OcckibAuaC7vqvGGG2cn7WUUT0L7z2AKbh8SSZ29J/tPn2tIBvHleUY+Hr9l
	 48oIeXIZFg2+Qjbrxp91+S7KtD3KfaJk2Bfbbqd1Np3zsoKH7j698bCsOU3xsNcSk9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=QRqXxi5D;
	arc=none smtp.remote-ip=91.218.175.178
Received: from mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F0A606A319
	for <linux-sound@vger.kernel.org>; Mon, 19 Oct 2026 17:53:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8F0A606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=QRqXxi5D
X-Envelope-To: linux-sound@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Hwg6biItus18+ExsHyZoGl+eRbDPQibV1nO/VDxM+ic=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792432413; v=1; x=1793037213;
 b=QRqXxi5DBjCb09ZktvGWq8K0n9kv62DVC+YZjm/rlR+FUqfViakrbgPsoSjAPOCkP01Ay0bN
 Hh1Oru6r2VUDuwIhaGJie13LkfyniyB9WQDFPuUrUfnh7ug/Y7bwVId0yq/jhT+ooo9lXP8tOyc
 yJ68Omykc5aJGemQTaxEIzww=
X-Envelope-To: linux-sound@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 9c83749833c3a8eb;
	Mon, 19 Oct 2026 17:53:33 +0000
X-Mizu-Trace-ID: 9c83749833c3a8eb
X-Migadu-Flow: FLOW_OUT
Message-ID: <4c1a8b04-d873-4395-badb-2762e6c40f59@linux.dev>
Date: Mon, 19 Oct 2026 10:53:29 -0700
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] ASoC: tas2783-sdw: keep the volume settings across
 resets
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, broonie@kernel.org
Cc: Lee Mann <leepaulmann@gmail.com>, Shenghao Ding <shenghao-ding@ti.com>,
 Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>,
 Sen Wang <sen@ti.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Andrey Golovko <andrey.golovko@gmail.com>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261018200009.1493438-1-matthew.schwartz@linux.dev>
 <20261018200009.1493438-2-matthew.schwartz@linux.dev>
 <bdc967fd-c056-492d-b970-db5630f21b95@linux.dev>
Content-Language: en-US
From: Matthew Schwartz <matthew.schwartz@linux.dev>
In-Reply-To: <bdc967fd-c056-492d-b970-db5630f21b95@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/19/26 8:56 AM, Pierre-Louis Bossart wrote:
> On 10/18/26 22:00, Matthew Schwartz wrote:
>> The register cache is dropped when the amp attaches uninitialized and
>> again after the firmware download, so the Amp Volume and Speaker Volume
>> registers are not cached while the amp is runtime suspended, and every
>> read or write of those controls fails with -EBUSY. On a platform that
>> powers the SoundWire link off when idle, such as the ASUS ROG Xbox Ally
>> X20, the amp is also reset and initialized again on every wake, so a
>> volume set while it was awake is lost the next time the link idles.
>>
>> Keep both settings in the driver, as the cache has to be dropped
>> whenever the reset and the firmware download change registers behind
>> it. Reads return the kept value, a write reaches the device only while
>> it is runtime active and initialized, and the settings are programmed
>> again after every init and resume. Until userspace sets a control, the
>> value the firmware leaves after each init is adopted instead, so its
>> tuning stays in effect. Waking the amp for a control access would
>> instead cost a full init of both X20 amps, about 0.2 s each.
>>
>> Fixes: b627da430357 ("ASoC: tas2783-sdw: drop stale regcache on uninitialized re-attach")
> 
> Erm, not sure what to think about this fix of a fix.
> 
> This commit b627da430357 introduced the regcache_drop_region() for all
> kinds of reasons, and now this new patch introduces a manual management
> of the volume registers - but why limit this management to volume
> settings only? Shouldn't other features such as e.g. bass boost or EQ
> also be restored?
> 
> It really feels like the problem is that the regmap is not properly
> restored...at the end of the day, this driver is missing a
> regcache_sync(), no?

The driver only has the two volume controls, there's no bass boost or
EQ control. The rest of the tuning comes from the firmware, which
tas_io_init() writes again on every init, apart from a retained PRAM.

A regcache_sync() can't restore these two because the firmware
download writes registers with sdw_nwrite_no_pm(), behind the cache,
and that includes AMP_LEVEL. Of the 72 TAS2783 files in linux-firmware,
44 set it to something other than the 0x28 in tas2783_reg_default[],
mostly levels 9 to 16, and two set DVC to 0x04 instead of 0x00.
Syncing the default values would replace that per-platform tuning with
full gain. So the driver has to know whether userspace set a value,
which needs restoring, or left it alone, in which case the firmware's
value should stay, and regmap doesn't track that per register.

The volume was also lost before b627da430357, since the sync ran
before the reset wiped it. The Fixes tag is for the -EBUSY that commit
added when reading an uncached volume register while the amp is
runtime suspended.

Certainly open to suggestions for improvement here if there's a simpler
way to fix this.

> 
>> Reported-by: Lee Mann <leepaulmann@gmail.com>
>> Link: https://lore.kernel.org/r/20261016102846.22908-1-leepaulmann@gmail.com
>> Signed-off-by: Matthew Schwartz <matthew.schwartz@linux.dev>
>> ---
>>  sound/soc/codecs/tas2783-sdw.c | 159 +++++++++++++++++++++++++++++++--
>>  1 file changed, 151 insertions(+), 8 deletions(-)
>>
>> diff --git a/sound/soc/codecs/tas2783-sdw.c b/sound/soc/codecs/tas2783-sdw.c
>> index a57230e01f75..ebb52efc1edf 100644
>> --- a/sound/soc/codecs/tas2783-sdw.c
>> +++ b/sound/soc/codecs/tas2783-sdw.c
>> @@ -12,6 +12,7 @@
>>  // Author: Baojun Xu <baojun.xu@ti.com>
>>  // Author: Kevin Lu <kevin-lu@ti.com>
>>  
>> +#include <linux/bitfield.h>
>>  #include <linux/cleanup.h>
>>  #include <linux/unaligned.h>
>>  #include <linux/crc32.h>
>> @@ -89,6 +90,15 @@ struct tas2783_prv {
>>  	struct mutex calib_lock;
>>  	/* pde and firmware download */
>>  	struct mutex pde_lock;
>> +	/* volume settings, kept across resets */
>> +	struct mutex vol_lock;
>> +	unsigned int amp_level;
>> +	unsigned int dvc_level;
>> +	/* set by userspace, so program it instead of adopting it */
>> +	bool amp_set;
>> +	bool dvc_set;
>> +	/* runtime active, so volume writes reach the device */
>> +	bool vol_live;
>>  	struct regmap *regmap;
>>  	struct device *dev;
>>  	struct class *class;
>> @@ -530,36 +540,151 @@ static const struct regmap_sdw_mbq_cfg tas2783_mbq_cfg = {
>>  	.mbq_size = tas2783_sdca_mbq_size,
>>  };
>>  
>> +#define TAS2783_AMP_LEVEL_MAX	20
>> +#define TAS2783_DVC_LVL_MAX	200
>> +
>> +/* forced, as a failed write leaves the new value in the cache */
>> +static s32 tas2783_write_amp_level(struct tas2783_prv *tas_dev,
>> +				   unsigned int level)
>> +{
>> +	return regmap_write_bits(tas_dev->regmap, TAS2783_AMP_LEVEL,
>> +				 TAS2783_AMP_LEVEL_MASK,
>> +				 FIELD_PREP(TAS2783_AMP_LEVEL_MASK, level));
>> +}
>> +
>> +static s32 tas2783_write_dvc_level(struct tas2783_prv *tas_dev,
>> +				   unsigned int level)
>> +{
>> +	return regmap_write(tas_dev->regmap, TAS2783_DVC_LVL,
>> +			    TAS2783_DVC_LVL_MAX - level);
>> +}
>> +
>> +/* program the volume settings userspace set, adopt the firmware ones */
>> +static s32 tas2783_sync_volume(struct tas2783_prv *tas_dev)
>> +{
>> +	unsigned int val;
>> +	s32 ret;
>> +
>> +	lockdep_assert_held(&tas_dev->vol_lock);
>> +
>> +	if (tas_dev->amp_set) {
>> +		ret = tas2783_write_amp_level(tas_dev, tas_dev->amp_level);
>> +	} else {
>> +		ret = regmap_read(tas_dev->regmap, TAS2783_AMP_LEVEL, &val);
>> +		if (!ret) {
>> +			val = FIELD_GET(TAS2783_AMP_LEVEL_MASK, val);
>> +			tas_dev->amp_level = umin(val, TAS2783_AMP_LEVEL_MAX);
>> +		}
>> +	}
>> +	if (ret)
>> +		return ret;
>> +
>> +	if (tas_dev->dvc_set)
>> +		return tas2783_write_dvc_level(tas_dev, tas_dev->dvc_level);
>> +
>> +	ret = regmap_read(tas_dev->regmap, TAS2783_DVC_LVL, &val);
>> +	if (!ret)
>> +		tas_dev->dvc_level = TAS2783_DVC_LVL_MAX -
>> +				     umin(val, TAS2783_DVC_LVL_MAX);
>> +
>> +	return ret;
>> +}
>> +
>> +static bool tas2783_vol_valid(struct snd_kcontrol *kcontrol, long val)
>> +{
>> +	struct soc_mixer_control *mc =
>> +		(struct soc_mixer_control *)kcontrol->private_value;
>> +
>> +	if (mc->platform_max && val > mc->platform_max)
>> +		return false;
>> +
>> +	return val >= 0 && val <= mc->max;
>> +}
>> +
>>  static s32 tas2783_digital_getvol(struct snd_kcontrol *kcontrol,
>>  				  struct snd_ctl_elem_value *ucontrol)
>>  {
>> -	return snd_soc_get_volsw(kcontrol, ucontrol);
>> +	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
>> +	struct tas2783_prv *tas_dev = snd_soc_component_get_drvdata(component);
>> +
>> +	guard(mutex)(&tas_dev->vol_lock);
>> +	ucontrol->value.integer.value[0] = tas_dev->dvc_level;
>> +
>> +	return 0;
>>  }
>>  
>>  static s32 tas2783_digital_putvol(struct snd_kcontrol *kcontrol,
>>  				  struct snd_ctl_elem_value *ucontrol)
>>  {
>> -	return snd_soc_put_volsw(kcontrol, ucontrol);
>> +	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
>> +	struct tas2783_prv *tas_dev = snd_soc_component_get_drvdata(component);
>> +	long val = ucontrol->value.integer.value[0];
>> +	s32 ret;
>> +
>> +	if (!tas2783_vol_valid(kcontrol, val))
>> +		return -EINVAL;
>> +
>> +	guard(mutex)(&tas_dev->vol_lock);
>> +	if (tas_dev->vol_live && tas_dev->hw_init) {
>> +		ret = tas2783_write_dvc_level(tas_dev, val);
>> +		if (ret)
>> +			return ret;
>> +	}
>> +
>> +	tas_dev->dvc_set = true;
>> +	if (val == tas_dev->dvc_level)
>> +		return 0;
>> +
>> +	tas_dev->dvc_level = val;
>> +
>> +	return 1;
>>  }
>>  
>>  static s32 tas2783_amp_getvol(struct snd_kcontrol *kcontrol,
>>  			      struct snd_ctl_elem_value *ucontrol)
>>  {
>> -	return snd_soc_get_volsw(kcontrol, ucontrol);
>> +	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
>> +	struct tas2783_prv *tas_dev = snd_soc_component_get_drvdata(component);
>> +
>> +	guard(mutex)(&tas_dev->vol_lock);
>> +	ucontrol->value.integer.value[0] = tas_dev->amp_level;
>> +
>> +	return 0;
>>  }
>>  
>>  static s32 tas2783_amp_putvol(struct snd_kcontrol *kcontrol,
>>  			      struct snd_ctl_elem_value *ucontrol)
>>  {
>> -	return snd_soc_put_volsw(kcontrol, ucontrol);
>> +	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
>> +	struct tas2783_prv *tas_dev = snd_soc_component_get_drvdata(component);
>> +	long val = ucontrol->value.integer.value[0];
>> +	s32 ret;
>> +
>> +	if (!tas2783_vol_valid(kcontrol, val))
>> +		return -EINVAL;
>> +
>> +	guard(mutex)(&tas_dev->vol_lock);
>> +	if (tas_dev->vol_live && tas_dev->hw_init) {
>> +		ret = tas2783_write_amp_level(tas_dev, val);
>> +		if (ret)
>> +			return ret;
>> +	}
>> +
>> +	tas_dev->amp_set = true;
>> +	if (val == tas_dev->amp_level)
>> +		return 0;
>> +
>> +	tas_dev->amp_level = val;
>> +
>> +	return 1;
>>  }
>>  
>>  static const struct snd_kcontrol_new tas2783_snd_controls[] = {
>>  	SOC_SINGLE_RANGE_EXT_TLV("Amp Volume", TAS2783_AMP_LEVEL,
>> -				 1, 0, 20, 0, tas2783_amp_getvol,
>> +				 1, 0, TAS2783_AMP_LEVEL_MAX, 0, tas2783_amp_getvol,
>>  				 tas2783_amp_putvol, tas2781_amp_tlv),
>>  	SOC_SINGLE_RANGE_EXT_TLV("Speaker Volume", TAS2783_DVC_LVL,
>> -				 0, 0, 200, 1, tas2783_digital_getvol,
>> +				 0, 0, TAS2783_DVC_LVL_MAX, 1, tas2783_digital_getvol,
>>  				 tas2783_digital_putvol, tas2781_dvc_tlv),
>>  };
>>  
>> @@ -1116,6 +1241,9 @@ static s32 tas2783_sdca_dev_suspend(struct device *dev)
>>  {
>>  	struct tas2783_prv *tas_dev = dev_get_drvdata(dev);
>>  
>> +	scoped_guard(mutex, &tas_dev->vol_lock)
>> +		tas_dev->vol_live = false;
>> +
>>  	if (!tas_dev->hw_init)
>>  		return 0;
>>  
>> @@ -1148,6 +1276,14 @@ static s32 tas2783_sdca_dev_resume(struct device *dev)
>>  		return ret;
>>  	}
>>  
>> +	guard(mutex)(&tas_dev->vol_lock);
>> +	if (tas_dev->hw_init) {
>> +		ret = tas2783_sync_volume(tas_dev);
>> +		if (ret)
>> +			return ret;
>> +	}
>> +	tas_dev->vol_live = true;
>> +
>>  	return 0;
>>  }
>>  
>> @@ -1245,11 +1381,14 @@ static s32 tas_io_init(struct device *dev, struct sdw_slave *slave)
>>  
>>  		/* Re-active AMP after resume. */
>>  		regmap_write(tas_dev->regmap, TASDEV_REG_SDW(0, 0, 2), 0);
>> +		if (!ret) {
>> +			guard(mutex)(&tas_dev->vol_lock);
>> +			ret = tas2783_sync_volume(tas_dev);
>> +			tas_dev->hw_init = !ret;
>> +		}
>>  		if (ret)
>>  			dev_err(tas_dev->dev,
>>  				"init writes failed, err=%d", ret);
>> -		else
>> -			tas_dev->hw_init = true;
>>  	}
>>  
>>  	return ret;
>> @@ -1427,6 +1566,9 @@ static s32 tas_sdw_probe(struct sdw_slave *peripheral,
>>  	tas_dev->fw_version = 0;
>>  	mutex_init(&tas_dev->calib_lock);
>>  	mutex_init(&tas_dev->pde_lock);
>> +	mutex_init(&tas_dev->vol_lock);
>> +	tas_dev->amp_level = TAS2783_AMP_LEVEL_MAX;
>> +	tas_dev->dvc_level = TAS2783_DVC_LVL_MAX;
>>  
>>  	init_waitqueue_head(&tas_dev->fw_wait);
>>  	dev_set_drvdata(dev, tas_dev);
>> @@ -1452,6 +1594,7 @@ static void tas_sdw_remove(struct sdw_slave *peripheral)
>>  	tas_remove(tas_dev);
>>  	mutex_destroy(&tas_dev->calib_lock);
>>  	mutex_destroy(&tas_dev->pde_lock);
>> +	mutex_destroy(&tas_dev->vol_lock);
>>  	dev_set_drvdata(&peripheral->dev, NULL);
>>  }
>>  
> 

