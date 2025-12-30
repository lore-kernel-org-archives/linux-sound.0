Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF18019D8A8
	for <linux-sound@vger.kernel.org>; Tue, 30 Dec 2025 20:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767127458; cv=none; b=piPcxQxAingF3YL/Vr0uyJJ+vBaXG4F3MqMVIIg32GJ/dwLRjDcmlitDleiMJQXz3iwgsgqbhh79nloADzEJKhHrJjExzwDcN1aymaP1Xsm/E544ly4xXYEwShTL63C2qZS+/4+VvhEFQMdBJv91GtsDSIM1epPKlvsveHwl/UQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767127458; c=relaxed/simple;
	bh=SqJ4Mcr9nQDwL9is1jT3NJ4UGoTgcUD24UtxrD6e8Rk=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=naMuMlFsZGGNM5V+6rvUFoMmZev0C++FkPQNjnyrNpf9yg4aOc6cKRNkBkBsbD+IZfp0RuI8Hz3EYO6X4cgOraUW2usPEG7r9gsY9FKY23gwqqq1xaFncSIt1TZ7V1DHuj+oo62VVY3ty+YiYEpg3YCaZFpE1pwb0a0ZGRbpCFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=GS4PU4do; arc=none smtp.client-ip=91.218.175.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="GS4PU4do"
Content-Type: text/plain;
	charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1767127452;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ixu5O8TPxZ6g2vWTLDInlaMykNMMY/UnVaEJe7VKbQs=;
	b=GS4PU4doh8KMhxv23bQJVeqMU/FZVWTFY9p+gqjAc/va96/0LnU3vVOxyqVVeflKzjMPqp
	r0xFiEJ2ut2QYTRsep3TEa+a+00UWX0QMcpOKuaerP6A/Bper8a13yDUmuKzE7zN1z/NGz
	/ZLpDdS+PuLmb4bPSO1HDnscrNnQvpk=
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.400.1\))
Subject: Re: [BUG] hda/tas2781: ASUS ROG Xbox Ally X audio issues with default
 firmware
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Matthew Schwartz <matthew.schwartz@linux.dev>
In-Reply-To: <288f6482-9a6b-4362-ac97-18043659deb7@linux.dev>
Date: Tue, 30 Dec 2025 12:43:46 -0800
Cc: linux-sound@vger.kernel.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Antheas Kapenekakis <lkml@antheas.dev>,
 tiwai@suse.de
Content-Transfer-Encoding: quoted-printable
Message-Id: <09148B42-71C2-4428-8D21-903F85853091@linux.dev>
References: <0ba100d0-9b6f-4a3b-bffa-61abe1b46cd5@linux.dev>
 <2d8b782c-a97c-4521-9307-a2cf8934802a@linux.dev>
 <288f6482-9a6b-4362-ac97-18043659deb7@linux.dev>
To: Baojun Xu <baojun.xu@ti.com>,
 Shenghao Ding <shenghao-ding@ti.com>
X-Migadu-Flow: FLOW_OUT



> On Dec 8, 2025, at 8:00=E2=80=AFPM, Matthew Schwartz =
<matthew.schwartz@linux.dev> wrote:
>=20
> On 12/8/25 1:37 PM, Matthew Schwartz wrote:
>> On 12/3/25 5:47 PM, Matthew Schwartz wrote:
>>> Hello,
>>>=20
>>> I have an ASUS ROG Xbox Ally X which uses hda/tas2781 for the =
speaker amplifiers. I am splitting this out into a new thread based on =
the suggestion from [1] to fix the remaining issues with the device's =
audio separately.=20
>>>=20
>>> I built a kernel from tags/sound-6.19-rc1 in tiwai/sound and =
included [2], which seemed potentially relevant to the issue that I =
describe below.
>>>=20
>>> By default, my system loads =
/usr/lib/firmware/ti/audio/tas2781/TAS2XXX13840.bin.zst. With this =
firmware file, any sound above the 70% volume limit range starts to =
become distorted and frequently drop out from either one or both =
speakers. I've included an alsa-info.sh report with this default =
firmware at [3].
>>>=20
>>> If I run sudo mv =
/usr/lib/firmware/ti/audio/tas2781/TAS2XXX13841.bin.zst =
/usr/lib/firmware/ti/audio/tas2781/TAS2XXX13840.bin.zst and force the =
other firmware file for Xbox Ally models, my speakers work up to 100% =
without any of the drop outs I experience on the default firmware. I've =
included an alsa-info.sh report with this renamed firmware at [4].
>>=20
>> Hmm, I did just boot into Windows to confirm which firmware blob =
loads, and it looks like Windows also uses TAS2XXX13840 for my unit. So =
the driver doesn't appear to be loading the wrong firmware on Linux...
>=20
> Ok, I started looking into the issue a bit more closely after =
confirming the same firmware loads and works fine on Windows.=20
>=20
> I noticed in tas2781_hda_i2c that there is a block of code that refers =
to multiple confs in the DSP firmware, but it's set to 0 as of =
ec1de5c214e ("ALSA: hda/tas2781: select program 0, conf 0 by default")
>=20
> With a debug patch to try and shine some more light on the ROG Xbox =
Ally X's audio firmware:
>=20
> diff --git a/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c =
b/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
> index c8619995b1d7..f85dcc8b5f29 100644
> --- a/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
> +++ b/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
> @@ -461,6 +463,9 @@ static void tasdevice_dspfw_init(void *context)
>   "TAS2XXX%04X.bin",
>   lower_16_bits(codec->core.subsystem_id));
> }
> + dev_info(tas_priv->dev, "%s: loading DSP firmware %s (speaker_id=3D%d,=
 subsys_id=3D0x%04x)\n",
> + __func__, tas_priv->coef_binaryname, tas_priv->speaker_id,
> + lower_16_bits(codec->core.subsystem_id));
> ret =3D tasdevice_dsp_parser(tas_priv);
> if (ret) {
> dev_err(tas_priv->dev, "dspfw load %s error\n",
> @@ -480,6 +485,10 @@ static void tasdevice_dspfw_init(void *context)
> if (tas_priv->fmw->nr_configurations > 0)
> tas_priv->cur_conf =3D 0;
>=20
> + dev_info(tas_priv->dev, "%s: DSP loaded - nr_programs=3D%d =
nr_configurations=3D%d cur_prog=3D%d cur_conf=3D%d\n",
> + __func__, tas_priv->fmw->nr_programs, =
tas_priv->fmw->nr_configurations,
> + tas_priv->cur_prog, tas_priv->cur_conf);
> +
> /* Init common setting for different audio profiles */
> if (tas_priv->rcabin.init_profile_id >=3D 0)
> tasdevice_select_cfg_blk(tas_priv,
> diff --git a/sound/soc/codecs/tas2781-fmwlib.c =
b/sound/soc/codecs/tas2781-fmwlib.c
> index 78fd0a5dc6f2..cc3cd1418ab1 100644
> --- a/sound/soc/codecs/tas2781-fmwlib.c
> +++ b/sound/soc/codecs/tas2781-fmwlib.c
> @@ -614,6 +614,8 @@ static int fw_parse_configuration_data_kernel(
> goto out;
> }
> memcpy(config->name, &data[offset], 64);
> + dev_info(tas_priv->dev, "%s: Config[%u] name=3D'%.64s'\n",
> +  __func__, i, config->name);
> /*skip extra 16 bytes*/
> offset +=3D 80;
>=20
> --=20
> 2.52.0
>=20
> I could see there are two configurations in TAS2XXX13840:
>=20
> [    4.347832] tas2781-hda i2c-TXNW2781:00-tas2781-hda.0: =
tasdevice_dspfw_init: loading DSP firmware TAS2XXX13840.bin =
(speaker_id=3D0, subsys_id=3D0x1384)
> [    4.348238] tas2781-hda i2c-TXNW2781:00-tas2781-hda.0: =
fw_parse_configuration_data_kernel: Config[0] =
name=3D'configuration_RC73_Veco_ISLR100_Tuning Mode_48 KHz_s2_0'
> [    4.348240] tas2781-hda i2c-TXNW2781:00-tas2781-hda.0: =
fw_parse_configuration_data_kernel: Config[1] name=3D'calibration_Tuning =
Mode_48 KHz_s2_0'
> [    5.747560] tas2781-hda i2c-TXNW2781:00-tas2781-hda.0: =
tasdevice_dspfw_init: DSP loaded - nr_programs=3D1 nr_configurations=3D2 =
cur_prog=3D0 cur_conf=3D0
>=20
> With "configuration_RC73_Veco_ISLR100_Tuning Mode_48 KHz_s2_0", the =
default, I can hear the audio glitching I described in my original =
report.
>=20
> If I change the code to load "calibration_Tuning Mode_48 KHz_s2_0" =
instead:
>=20
> diff --git a/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c =
b/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
> index 8825efefb4a6..a54ac359273a 100644
> --- a/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
> +++ b/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
> @@ -481,7 +481,7 @@ static void tasdevice_dspfw_init(void *context)
> if (tas_priv->fmw->nr_programs > 0)
> tas_priv->cur_prog =3D 0;
> if (tas_priv->fmw->nr_configurations > 0)
> - tas_priv->cur_conf =3D 0;
> + tas_priv->cur_conf =3D 1;
>=20
> dev_info(tas_priv->dev, "%s: DSP loaded - nr_programs=3D%d =
nr_configurations=3D%d cur_prog=3D%d cur_conf=3D%d\n",
> __func__, tas_priv->fmw->nr_programs, =
tas_priv->fmw->nr_configurations,
> --=20
> 2.52.0

After reading the TI E2E forums, it seems these calibration tuning =
configurations are only meant to be used during a calibration process.

Instead, something else I found that works is not overriding the =
firmware file calibration data with the UEFI calibration data:

diff --git a/sound/soc/codecs/tas2781-fmwlib.c =
b/sound/soc/codecs/tas2781-fmwlib.c
index 78fd0a5dc6f2..1e768e6187da 100644
--- a/sound/soc/codecs/tas2781-fmwlib.c
+++ b/sound/soc/codecs/tas2781-fmwlib.c
@@ -2377,6 +2377,7 @@ static void tasdev_load_calibrated_data(struct =
tasdevice_priv *priv, int i)
 	unsigned char *data =3D cali_data->data;
 	struct tasdevice_calibration *cal;
 	int k =3D i * (cali_data->cali_dat_sz_per_dev + 1);
+	unsigned char r0_buf[4];
 	int rc;
=20
 	/* Load the calibrated data from cal bin file */
@@ -2389,6 +2390,20 @@ static void tasdev_load_calibrated_data(struct =
tasdevice_priv *priv, int i)
 	}
 	if (!priv->is_user_space_calidata)
 		return;
+
+	/*
+	 * Check if the DSP config already set the calibration =
registers.
+	 * Some tuning configs contain their own calibration data which =
should
+	 * not be overwritten by user space calibration data.
+	 */
+	rc =3D tasdevice_dev_bulk_read(priv, i, p->r0_reg, r0_buf, 4);
+	if (rc >=3D 0 && (r0_buf[0] | r0_buf[1] | r0_buf[2] | =
r0_buf[3])) {
+		dev_dbg(priv->dev,
+			"%s: dev %d r0_reg already set by config, =
skipping calibration\n",
+			__func__, i);
+		return;
+	}
+
 	/* load calibrated data from user space */
 	if (data[k] !=3D i) {
 		dev_err(priv->dev, "%s: no cal-data for dev %d from =
usr-spc\n",

Is this more suitable to be upstreamed?

Thanks,
Matt

>=20
> then audio works perfectly up to 100% volume without any of the same =
issues as the other configuration, and without renaming the firmware =
blobs.
>=20
>>=20
>>>=20
>>> I took an acpidump at [5] and extracted the dsdt table at [6]. =
Please let me know if there's any additional information I can provide =
from the device to further debug the sound issues with the default =
selected firmware.
>>>=20
>>> Thanks,
>>> Matt
>>>=20
>>> [1]: =
https://lore.kernel.org/linux-sound/87zf8jesp0.wl-tiwai@suse.de/
>>> [2]: =
https://lore.kernel.org/all/20251126141434.11110-1-baojun.xu@ti.com/
>>> [3]: =
https://alsa-project.org/db/?f=3D840337cab11f6aa70cf48b15d55ac45e4027ff41
>>> [4]: =
https://alsa-project.org/db/?f=3D6e482f72765d89520ea171f15641228bcadefcf0
>>> [5]: =
https://gist.githubusercontent.com/matte-schwartz/d7ff3c857b45cca197f3d3ad=
c16df0bc/raw/2e3267b8d1a9d619ecd8157e4da426be756b6497/acpidump.txt
>>> [6]: =
https://gist.githubusercontent.com/matte-schwartz/4042dcd3779c3738af60536a=
9d4050d6/raw/5227717c6d40a2dc4012b95f7fefc6cd50ba784d/dsdt.dsl


