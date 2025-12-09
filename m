Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com [91.218.175.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 614CA11713
	for <linux-sound@vger.kernel.org>; Tue,  9 Dec 2025 04:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765252848; cv=none; b=D2rlmeUZmHaHpcZURCRcXMeIIBdV1xyGPsR7eWOcSXSk4Fy9u7g9rCRvQOzAk4s5jGPSmnkdgOtDLpAMBJ0+kud9FKBei7etyGlKcb0C6h3CrBzBqTjwO87EerLO2yQxbOB/sBA9m9lZPCW735BK91i+nQMpuZ5FnEju7piQEko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765252848; c=relaxed/simple;
	bh=oPK5g/MYkuYhY95AoZB/lR4nESfuhIgoOENw6bKGIrM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=scFU9EsvfkUaV8Ja6zcWnNmOfXzSjLdyucU9iugpcC51DYb8G8BUJmtq6z+9vlvrYpwjzJBayIZIeT3PzGvQTwOtxPhFzEv34Q4wZKYP4WmrXkpe4HHt7BKNB2qgXY9dBegXnR9Vxh+xNIh5nPEHKfy6R37BOolpoUSJaIBIwFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=TihbNWCr; arc=none smtp.client-ip=91.218.175.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="TihbNWCr"
Message-ID: <288f6482-9a6b-4362-ac97-18043659deb7@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1765252832;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RlllyUcO6dXIygCsgCELID/EHcO9RCh1ArL5Di4Xs6Y=;
	b=TihbNWCrtFIpo9cukBxyZIk8HLsKVNJVGIyty7rO+pRZQln9i3iaE++4D3hMLmhnrOgbQC
	9MDbK2aCZjqBiV78eX44YZQU5QOcgu9/Wy4zmYnK5N+7ut/duAyRsB0q3sMSU1+WWJD4Ql
	Sh8R8yvZ+3+aKfGO4c5ahW2mpAfFW10=
Date: Mon, 8 Dec 2025 20:00:28 -0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [BUG] hda/tas2781: ASUS ROG Xbox Ally X audio issues with default
 firmware
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Matthew Schwartz <matthew.schwartz@linux.dev>
To: Baojun Xu <baojun.xu@ti.com>, Shenghao Ding <shenghao-ding@ti.com>
Cc: linux-sound@vger.kernel.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Antheas Kapenekakis <lkml@antheas.dev>, tiwai@suse.de
References: <0ba100d0-9b6f-4a3b-bffa-61abe1b46cd5@linux.dev>
 <2d8b782c-a97c-4521-9307-a2cf8934802a@linux.dev>
Content-Language: en-US
In-Reply-To: <2d8b782c-a97c-4521-9307-a2cf8934802a@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 12/8/25 1:37 PM, Matthew Schwartz wrote:
> On 12/3/25 5:47 PM, Matthew Schwartz wrote:
>> Hello,
>>
>> I have an ASUS ROG Xbox Ally X which uses hda/tas2781 for the speaker amplifiers. I am splitting this out into a new thread based on the suggestion from [1] to fix the remaining issues with the device's audio separately. 
>>
>> I built a kernel from tags/sound-6.19-rc1 in tiwai/sound and included [2], which seemed potentially relevant to the issue that I describe below.
>>
>> By default, my system loads /usr/lib/firmware/ti/audio/tas2781/TAS2XXX13840.bin.zst. With this firmware file, any sound above the 70% volume limit range starts to become distorted and frequently drop out from either one or both speakers. I've included an alsa-info.sh report with this default firmware at [3].
>>
>> If I run sudo mv /usr/lib/firmware/ti/audio/tas2781/TAS2XXX13841.bin.zst /usr/lib/firmware/ti/audio/tas2781/TAS2XXX13840.bin.zst and force the other firmware file for Xbox Ally models, my speakers work up to 100% without any of the drop outs I experience on the default firmware. I've included an alsa-info.sh report with this renamed firmware at [4].
> 
> Hmm, I did just boot into Windows to confirm which firmware blob loads, and it looks like Windows also uses TAS2XXX13840 for my unit. So the driver doesn't appear to be loading the wrong firmware on Linux...

Ok, I started looking into the issue a bit more closely after confirming the same firmware loads and works fine on Windows. 

I noticed in tas2781_hda_i2c that there is a block of code that refers to multiple confs in the DSP firmware, but it's set to 0 as of ec1de5c214e ("ALSA: hda/tas2781: select program 0, conf 0 by default")

With a debug patch to try and shine some more light on the ROG Xbox Ally X's audio firmware:

diff --git a/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c b/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
index c8619995b1d7..f85dcc8b5f29 100644
--- a/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
+++ b/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
@@ -461,6 +463,9 @@ static void tasdevice_dspfw_init(void *context)
 			  "TAS2XXX%04X.bin",
 			  lower_16_bits(codec->core.subsystem_id));
 	}
+	dev_info(tas_priv->dev, "%s: loading DSP firmware %s (speaker_id=%d, subsys_id=0x%04x)\n",
+		__func__, tas_priv->coef_binaryname, tas_priv->speaker_id,
+		lower_16_bits(codec->core.subsystem_id));
 	ret = tasdevice_dsp_parser(tas_priv);
 	if (ret) {
 		dev_err(tas_priv->dev, "dspfw load %s error\n",
@@ -480,6 +485,10 @@ static void tasdevice_dspfw_init(void *context)
 	if (tas_priv->fmw->nr_configurations > 0)
 		tas_priv->cur_conf = 0;
 
+	dev_info(tas_priv->dev, "%s: DSP loaded - nr_programs=%d nr_configurations=%d cur_prog=%d cur_conf=%d\n",
+		__func__, tas_priv->fmw->nr_programs, tas_priv->fmw->nr_configurations,
+		tas_priv->cur_prog, tas_priv->cur_conf);
+
 	/* Init common setting for different audio profiles */
 	if (tas_priv->rcabin.init_profile_id >= 0)
 		tasdevice_select_cfg_blk(tas_priv,
diff --git a/sound/soc/codecs/tas2781-fmwlib.c b/sound/soc/codecs/tas2781-fmwlib.c
index 78fd0a5dc6f2..cc3cd1418ab1 100644
--- a/sound/soc/codecs/tas2781-fmwlib.c
+++ b/sound/soc/codecs/tas2781-fmwlib.c
@@ -614,6 +614,8 @@ static int fw_parse_configuration_data_kernel(
 			goto out;
 		}
 		memcpy(config->name, &data[offset], 64);
+		dev_info(tas_priv->dev, "%s: Config[%u] name='%.64s'\n",
+			 __func__, i, config->name);
 		/*skip extra 16 bytes*/
 		offset += 80;

-- 
2.52.0

I could see there are two configurations in TAS2XXX13840:

[    4.347832] tas2781-hda i2c-TXNW2781:00-tas2781-hda.0: tasdevice_dspfw_init: loading DSP firmware TAS2XXX13840.bin (speaker_id=0, subsys_id=0x1384)
[    4.348238] tas2781-hda i2c-TXNW2781:00-tas2781-hda.0: fw_parse_configuration_data_kernel: Config[0] name='configuration_RC73_Veco_ISLR100_Tuning Mode_48 KHz_s2_0'
[    4.348240] tas2781-hda i2c-TXNW2781:00-tas2781-hda.0: fw_parse_configuration_data_kernel: Config[1] name='calibration_Tuning Mode_48 KHz_s2_0'
[    5.747560] tas2781-hda i2c-TXNW2781:00-tas2781-hda.0: tasdevice_dspfw_init: DSP loaded - nr_programs=1 nr_configurations=2 cur_prog=0 cur_conf=0

With "configuration_RC73_Veco_ISLR100_Tuning Mode_48 KHz_s2_0", the default, I can hear the audio glitching I described in my original report.

If I change the code to load "calibration_Tuning Mode_48 KHz_s2_0" instead:

diff --git a/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c b/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
index 8825efefb4a6..a54ac359273a 100644
--- a/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
+++ b/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
@@ -481,7 +481,7 @@ static void tasdevice_dspfw_init(void *context)
 	if (tas_priv->fmw->nr_programs > 0)
 		tas_priv->cur_prog = 0;
 	if (tas_priv->fmw->nr_configurations > 0)
-		tas_priv->cur_conf = 0;
+		tas_priv->cur_conf = 1;
 
 	dev_info(tas_priv->dev, "%s: DSP loaded - nr_programs=%d nr_configurations=%d cur_prog=%d cur_conf=%d\n",
 		__func__, tas_priv->fmw->nr_programs, tas_priv->fmw->nr_configurations,
-- 
2.52.0

then audio works perfectly up to 100% volume without any of the same issues as the other configuration, and without renaming the firmware blobs.

> 
>>
>> I took an acpidump at [5] and extracted the dsdt table at [6]. Please let me know if there's any additional information I can provide from the device to further debug the sound issues with the default selected firmware.
>>
>> Thanks,
>> Matt
>>
>> [1]: https://lore.kernel.org/linux-sound/87zf8jesp0.wl-tiwai@suse.de/
>> [2]: https://lore.kernel.org/all/20251126141434.11110-1-baojun.xu@ti.com/
>> [3]: https://alsa-project.org/db/?f=840337cab11f6aa70cf48b15d55ac45e4027ff41
>> [4]: https://alsa-project.org/db/?f=6e482f72765d89520ea171f15641228bcadefcf0
>> [5]: https://gist.githubusercontent.com/matte-schwartz/d7ff3c857b45cca197f3d3adc16df0bc/raw/2e3267b8d1a9d619ecd8157e4da426be756b6497/acpidump.txt
>> [6]: https://gist.githubusercontent.com/matte-schwartz/4042dcd3779c3738af60536a9d4050d6/raw/5227717c6d40a2dc4012b95f7fefc6cd50ba784d/dsdt.dsl
> 

