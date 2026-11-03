Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793714506;
	b=EziAk01wEB3xrvOiZOw7cin6voda/v2f4B/6o5HQJul466P5iD4fCvI/YnBx17G5P8z4
	 4UnkRSTRtszqntyVBI3kz4fYpFSTEaxozF+oCKmgdfoBPcuUItOcmPtHHLpfMuGLjMWno
	 eN+B+vdt0NYk0Wkr6GqAlsuxyFituBe9jH0lRnandD5iMNdnVQa3Ip3A2IFtL5JW0eZZ3
	 SSAVBgn8S0pQPGH2m3/W/ElUCpB0jcousT7VdmaBgC/3yApqhCYqvKzm9+yK07VDeSgDI
	 zvk8Xl4sN3AM0R++LM7XSGx7vdhKg0wxQwyYA58/RRmGXL/9TnUmVqLQLuoRVDl74mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793714506;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=8eDUcHth/1XeZUk37aapoI4Gqsp2r6v7k3Pclj7QQek=;
	b=Y1x3wxriCKXm67rdBYSoRa/wmbfmwYJHDhWTCYzMRyus8rcUyNoMeWg0Ml+cnk7Av8z0
	 Oja/UsLU51/5emQc+3v7NYSgghaROqS/4B3SEkHyP8DtZ25lKnRgn/2L6F8VU7n+CLNQU
	 37Ek5JmCexvPyX4pKL4lUYR3xVJTRhKCBX6BvGGU63Zp/7HJzhsS3mdgT7ft8CatWAbrd
	 Cc2dNRfqTOCasQhxptcok54LOXtTov0XWWpflqPL4ppSE3ukkiOhLr2uwtpDrizN0sVUN
	 qoU4cF3ulF52PAdls+HY2Ft1OQmnm6xQ8r2kHm3cTzM2lsEpyTgcvX2wR7bQbeHrHiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CM+Z4Ej9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99165606EE9D
	for <linux-sound@vger.kernel.org>; Tue,  3 Nov 2026 14:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CM+Z4Ej9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 203E01F00A02;
	Tue,  3 Nov 2026 14:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793714505;
	bh=8eDUcHth/1XeZUk37aapoI4Gqsp2r6v7k3Pclj7QQek=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CM+Z4Ej9lOmsGE3VaA0brOB1PxaaJ5NWsRLKuBb1WMO6PZYeRsqD+RdqgNqaiAG9M
	 hpWKqz4YO5T6Wq7IkcWVFZoXFBuz2aHFQdZp/O1+76nWuE46TWs7Sqa8TkiA1DXYqO
	 nuf+0H4y0RoFrmAJkIYQQtjH6OnOmI4P4keumObezt1vQjlTUMasKZ07WwRAzb5HpE
	 jGJvty/M7WgcFKy+5UcUZsbhV5o6UmTebrtxwED9CtrsDSCYChRe9LoWB/0B6MuDH9
	 ugRK3x6TqaZ7gNwZsGyZV265iOe2mdE2yoWITxxZaEeOH4Qt7jAQUIo0MrrGVbtwh8
	 zRPwTOvgfeNDA==
Message-ID: <sashiko-outbox-195412@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1] ASoC: tas2783-sdw: Add basic BPT support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Baojun Xu" <baojun.xu@ti.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261103133853.1612-1-baojun.xu@ti.com>
References: <20261103133853.1612-1-baojun.xu@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 14:01:44 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 10 potential issue=
(s) to consider:
- [High] ASoC: tas2783-sdw: uninitialized ret in tas_io_init() after regmap=
_read()
- [High] ASoC: tas2783-sdw: B0P0R7 status marker clobbered and fw_dl_succes=
s unset
- [High] ASoC: tas2783-sdw: sdw_dev_lock deadlock in tas2783_fw_download_bp=
t()
- [Medium] ASoC: tas2783-sdw: duplicate SoundWire BPT struct and flag defin=
itions
- [Medium] ASoC: tas2783-sdw: missing error propagation from tas2783_fw_rea=
dy()
- [Medium] ASoC: tas2783-sdw: legacy fallback on malformed firmware in tas2=
783_fw_ready()
- [Medium] ASoC: tas2783-sdw: dangling dp0_prop pointer after probe failure=
 or unbind
- [Medium] ASoC: tas2783-sdw: DP0 BPT prep in tas_port_prep() powers on PDE=
23 early
- [Medium] ASoC: tas2783-sdw: uninitialized val read at calibrate in tas278=
3_fw_ready()
- [Low] ASoC: tas2783-sdw: unchecked bus->ops dereference and missing bpt_w=
ait check
--

commit 34619ca19ed4f9d3a26eb6716aaef0ab7b07df84
Author: Baojun Xu <baojun.xu@ti.com>

ASoC: tas2783-sdw: Add basic BPT support

This commit adds SoundWire Bulk Peripherals Transport (BPT) firmware
download support to the tas2783 codec driver, with a fallback to the
existing sdw_nwrite_no_pm() download path.

> diff --git a/sound/soc/codecs/tas2783-sdw.c b/sound/soc/codecs/tas2783-sd=
w.c
> index a57230e01f755..c1c74707b633a 100644
> --- a/sound/soc/codecs/tas2783-sdw.c
> +++ b/sound/soc/codecs/tas2783-sdw.c
> @@ -47,6 +47,26 @@
>  #define TAS2783_CALI_GUID EFI_GUID(0x1f52d2a1, 0xbb3a, 0x457d, 0xbc, \
>  				   0x09, 0x43, 0xa3, 0xf4, 0x31, 0x0a, 0x92)
> =20
> +#define TAS2783_MAX_FW_SECTIONS	256
> +
> +enum {
> +	SDW_MSG_FLAG_READ =3D 0,
> +	SDW_MSG_FLAG_WRITE,
> +};
> +
> +struct sdw_bpt_section {
> +	u32 addr;
> +	u32 len;
> +	u8 *buf;
> +};
> +
> +struct sdw_bpt_msg {
> +	struct sdw_bpt_section *sec;
> +	int sections;
> +	u8 dev_num;
> +	u8 flags;
> +};

[Severity: Medium]
Should struct sdw_bpt_section, struct sdw_bpt_msg, and the
SDW_MSG_FLAG_READ / SDW_MSG_FLAG_WRITE enum be moved from
drivers/soundwire/bus.h to include/linux/soundwire/sdw.h instead of
being duplicated in sound/soc/codecs/tas2783-sdw.c?

Because include/linux/soundwire/sdw.h currently only forward-declares
struct sdw_bpt_msg for sdw_bpt_send_sync(), redefining these types locally
in the codec driver bypasses compiler type checking across the subsystem
boundary and risks layout mismatches or build breakage if the SoundWire
core headers are updated.

> +
>  static const u32 tas2783_cali_reg[] =3D {
>  	TAS2783_CAL_R0,
>  	TAS2783_CAL_INVR0,
> @@ -738,7 +758,103 @@ static s32 tas_fw_get_next_file(const u8 *data, str=
uct tas_fw_file *file)
>  	file->dest_addr =3D get_unaligned_le32(&data[16]);
>  	file->fw_data =3D (u8 *)&data[20];
> =20
> -	return file->length + sizeof(u32) * 5;
> +	return file->length + FW_FL_HDR;
> +}
> +
> +static int tas2783_fw_download_bpt(struct tas2783_prv *tas_dev,
> +				   const struct firmware *fmw)
> +{

[ ... ]

> +	msg.sec =3D sections;
> +	msg.sections =3D num_sections;
> +	msg.dev_num =3D slave->dev_num;
> +	msg.flags =3D SDW_MSG_FLAG_WRITE;
> +
> +	dev_dbg(tas_dev->dev, "BPT starting: %d sections, dev_num=3D%d",
> +		num_sections, slave->dev_num);
> +
> +	ret =3D sdw_bpt_send_sync(bus, slave, &msg);

[Severity: High]
Can calling sdw_bpt_send_sync() here deadlock on slave->sdw_dev_lock
until wait_event_timeout() expires in tas_fw_load()?

When the SoundWire core invokes drv->ops->update_status() from
sdw_update_slave_status() or sdw_drv_probe(), it holds
slave->sdw_dev_lock across the entire callback:

  sdw_update_slave_status()
    mutex_lock(&slave->sdw_dev_lock)
    tas_update_status()
      tas_io_init()
        tas_fw_load()
          request_firmware_nowait(..., tas2783_fw_ready)
          wait_event_timeout(tas_dev->fw_wait, tas_dev->fw_dl_task_done, ..=
.)

Meanwhile, in the firmware workqueue thread, sdw_bpt_send_sync() prepares
DP0 for the BPT stream and tries to acquire the same slave->sdw_dev_lock:

  tas2783_fw_ready()
    tas2783_fw_download_bpt()
      sdw_bpt_send_sync()
        sdw_bpt_send_async()
          intel_ace2x_bpt_send_async()
            intel_ace2x_bpt_open_stream()
              sdw_prepare_stream()
                _sdw_prepare_stream()
                  sdw_prep_deprep_ports()
                    sdw_prep_deprep_slave_ports()
                      sdw_do_port_prep()
                        mutex_lock(&slave->sdw_dev_lock)

Because tas_fw_load() is blocked waiting for tas2783_fw_ready() while
holding slave->sdw_dev_lock, sdw_do_port_prep() blocks until
wait_event_timeout() times out and tas_update_status() returns, causing
tas_io_init() to fail with -EAGAIN while tas2783_fw_ready() continues
running in the background.

> +
> +	if (ret < 0)
> +		dev_err(tas_dev->dev, "BPT firmware download failed: %d", ret);
> +	else
> +		dev_dbg(tas_dev->dev,
> +			 "BPT firmware download complete: %d sections",
> +			 num_sections);
> +
> +	kfree(sections);
> +	return ret;
> +}
> +
> +static bool tas2783_bpt_supported(struct tas2783_prv *tas_dev)
> +{
> +	struct sdw_slave *slave =3D tas_dev->sdw_peripheral;
> +	struct sdw_bus *bus =3D slave->bus;
> +
> +	return bus && bus->ops && bus->ops->bpt_send_async;
> +}

[ ... ]

> @@ -774,6 +890,30 @@ static void tas2783_fw_ready(const struct firmware *=
fmw, void *context)
>  		goto out;
>  	}
> =20
> +	/* Try BPT first if supported, fallback to legacy method */
> +	dev_dbg(tas_dev->dev, "BPT check: async=3D%p wait=3D%p",
> +		 tas_dev->sdw_peripheral->bus->ops->bpt_send_async,
> +		 tas_dev->sdw_peripheral->bus->ops->bpt_wait);
> +	if (tas2783_bpt_supported(tas_dev)) {

[Severity: Low]
Does the dev_dbg() call above dereference tas_dev->sdw_peripheral->bus
and bus->ops before tas2783_bpt_supported() checks whether they are
non-NULL?

Also, since sdw_bpt_send_async() in drivers/soundwire/bus.c requires both
bus->ops->bpt_send_async and bus->ops->bpt_wait to be implemented, should
tas2783_bpt_supported() check bus->ops->bpt_wait as well?

> +		ret =3D tas2783_fw_download_bpt(tas_dev, fmw);
> +
> +		if (ret =3D=3D 0) {
> +			dev_dbg(tas_dev->dev, "Firmware downloaded via BPT");
> +			cur_file =3D 1;
> +			goto calibrate;
> +		}
> +		/*
> +		 * -ESHUTDOWN means the manager is clock-stopping the bus for
> +		 * system suspend and refused the transfer. The legacy fallback
> +		 * would only thrash the dying bus with command timeouts, so
> +		 * bail and let the next attach cycle (on resume) reissue it.
> +		 */
> +		if (ret =3D=3D -ESHUTDOWN)
> +			goto out;

[Severity: Medium]
When ret =3D=3D -ESHUTDOWN jumps to out:, tas_dev->fw_dl_success remains
false and tas_dev->fw_dl_task_done is set to true, waking tas_fw_load().
However, in tas_fw_load():

	ret =3D wait_event_timeout(tas_dev->fw_wait, tas_dev->fw_dl_task_done,
				 msecs_to_jiffies(TIMEOUT_FW_DL_MS));
	if (!ret) {
		dev_err(tas_dev->dev, "fw request, wait_event timeout\n");
		return -EAGAIN;
	}

	return 0;

tas_fw_load() returns 0 without checking tas_dev->fw_dl_success. Doesn't
that cause tas_io_init() to continue issuing sdca_regmap_write_init() or
regmap_multi_reg_write() over the shutting-down bus and set
tas_dev->hw_init =3D true even though firmware download was aborted?

> +		dev_warn(tas_dev->dev,
> +			 "BPT failed (%d), falling back to legacy method",
> +			 ret);
> +	}

[Severity: Medium]
If tas2783_fw_download_bpt() returns -EINVAL because the firmware image
failed validation (for example, img_sz < FW_DL_OFFSET or a section's
file.length exceeds img_sz - offset - FW_FL_HDR), should
tas2783_fw_ready() abort instead of falling back to the legacy loader?

In the legacy path right below, tas_fw_read_hdr(buf, hdr) reads 84 bytes
before checking if (img_sz < FW_DL_OFFSET), and the while loop passes
file->fw_data and file->length to sdw_nwrite_no_pm() without checking
whether file->length runs past the end of fmw->data.

>  	img_sz =3D fmw->size;
>  	buf =3D fmw->data;
>  	offset +=3D tas_fw_read_hdr(buf, hdr);
> @@ -834,6 +974,7 @@ static void tas2783_fw_ready(const struct firmware *f=
mw, void *context)
>  		cur_file++;
>  	}
>  	mutex_unlock(&tas_dev->pde_lock);
> +calibrate:
>  	regcache_drop_region(tas_dev->regmap, 0, UINT_MAX);
> =20
>  	if (cur_file =3D=3D 0) {
> @@ -841,6 +982,7 @@ static void tas2783_fw_ready(const struct firmware *f=
mw, void *context)
>  		ret =3D -EINVAL;
>  	} else {
>  		tas2783_update_calibdata(tas_dev);
> +		regmap_write(tas_dev->regmap, TASDEV_REG_SDW(0, 0, 7), 0x22);
>  		ret =3D regmap_bulk_read(tas_dev->regmap, TAS2783_FW_VERSION,
>  					&val, 4);
>  		tas_dev->fw_version =3D (val[0] << 24) | (val[1] << 16) |

[Severity: Medium]
When jumping to calibrate: from the BPT path, the earlier
regmap_bulk_read() before the legacy loop is skipped, so val[0..3] has
not been initialized yet. If regmap_bulk_read() here fails, will
tas_dev->fw_version be populated from uninitialized stack memory in val?

Also, if the legacy download loop fails and breaks out with ret < 0 after
downloading at least one section (cur_file >=3D 1), won't this else branch
still write 0x22 to TASDEV_REG_SDW(0, 0, 7) and overwrite the error in
ret with the return value of regmap_bulk_read()?

> @@ -1216,25 +1358,32 @@ static s32 tas_fw_load(struct tas2783_prv *tas_de=
v, struct sdw_slave *slave)
>  static s32 tas_io_init(struct device *dev, struct sdw_slave *slave)
>  {
>  	struct tas2783_prv *tas_dev =3D dev_get_drvdata(dev);
> +	uint val;
>  	s32 ret;
> =20
>  	if (tas_dev->hw_init)
>  		return 0;
> =20
> -	tas_dev->fw_dl_success =3D false;
> -
> -	ret =3D regmap_write(tas_dev->regmap, TAS2783_SW_RESET, 0x1);
> +	regmap_read(tas_dev->regmap, TASDEV_REG_SDW(0, 0, 7), &val);
> +	dev_dbg(dev, "Got B0P0R7 =3D %02X with %d.", val, ret);
>  	if (ret) {
> -		dev_err(dev, "sw reset failed, err=3D%d", ret);
> +		dev_err(dev, "Get FW download status failed, err=3D%d", ret);
>  		return ret;
>  	}

[Severity: High]
Isn't ret used uninitialized here because the return value of
regmap_read() is not assigned to ret?

> +	if (val !=3D 0x22) {
> +		tas_dev->fw_dl_success =3D false;
> +		ret =3D regmap_write(tas_dev->regmap, TAS2783_SW_RESET, 0x1);
> +		if (ret) {
> +			dev_err(dev, "sw reset failed, err=3D%d", ret);
> +			return ret;
> +		}
> +		usleep_range(2000, 2200);
> +		regcache_cache_only(tas_dev->regmap, false);
> +		tas_dev->fw_use_fallback =3D false;
>  		ret =3D tas_fw_load(tas_dev, slave);
> +		if (!ret && tas_dev->fw_use_fallback)
> +			ret =3D tas_fw_load(tas_dev, slave);
> +	}

[Severity: High]
There appear to be two issues with the TASDEV_REG_SDW(0, 0, 7) (address
0x00800007) firmware status check in tas_io_init():

1. When val =3D=3D 0x22 and tas_dev->fw_dl_success is false (for example,
   when the driver is unbound and rebound while the amplifier retained
   state), skipping the if (val !=3D 0x22) block leaves
   tas_dev->fw_dl_success as false. Subsequent calls to
   tas_sdw_hw_params() check:

	if (!tas_dev->fw_dl_success) {
		dev_err(tas_dev->dev, "error playback without fw download");
		return -EINVAL;
	}

   which will reject all audio playback and capture streams with -EINVAL.

2. When val !=3D 0x22, tas2783_fw_ready() writes 0x22 to
   TASDEV_REG_SDW(0, 0, 7), but immediately afterwards in tas_io_init(),
   if tas_dev->sa_func_data is NULL, regmap_multi_reg_write() writes
   tas2783_init_seq, which contains:

	REG_SEQ0(0x00800007, 0x20),

   Won't that overwrite register 0x00800007 back to 0x20 in both the
   hardware and regcache right after firmware download completes?

>  	if (!ret) {
>  		if (tas_dev->sa_func_data)
>  			ret =3D sdca_regmap_write_init(dev, tas_dev->regmap,
> @@ -1382,6 +1531,21 @@ static s32 tas_sdw_probe(struct sdw_slave *periphe=
ral,
>  	if (ret)
>  		return dev_err_probe(dev, ret,
>  				     "slave property read failed");
> +	/*
> +	 * BPT firmware download uses DP0 and relies on the SoundWire stream
> +	 * framework to prepare/deprepare DP0. Ensure DP0 properties exist for
> +	 * the framework prepare/deprepare sequence.
> +	 */
> +	if (!peripheral->prop.dp0_prop) {
> +		peripheral->prop.dp0_prop =3D devm_kzalloc(dev,
> +			sizeof(*peripheral->prop.dp0_prop), GFP_KERNEL);
> +		if (!peripheral->prop.dp0_prop)
> +			return dev_err_probe(dev, -ENOMEM,
> +					     "dp0_prop alloc failed");
> +
> +		peripheral->prop.dp0_prop->simple_ch_prep_sm =3D true;
> +		peripheral->prop.dp0_prop->ch_prep_timeout =3D 25;
> +	}

[Severity: Medium]
Can allocating peripheral->prop.dp0_prop with devm_kzalloc() leave a
dangling pointer on struct sdw_slave if tas_sdw_probe() fails later or if
the driver is unbound?

In drivers/soundwire/mipi_disco.c, sdw_slave_read_prop() does not clear
prop->dp0_prop when the mipi-sdw-dp-0-subproperties firmware node is
absent. If devres frees this allocation on probe failure or unbind,
peripheral->prop.dp0_prop remains non-NULL and will not be reallocated on
re-probe, causing sdw_initialize_slave() and DP0 port preparation to
dereference freed memory.

[Severity: Medium]
Also, what happens during DP0 preparation for BPT when
peripheral->prop.dp0_prop->simple_ch_prep_sm is set to true?

In sdw_prep_deprep_slave_ports() (drivers/soundwire/stream.c), setting
simple_ch_prep_sm =3D true causes the SoundWire core to skip writing
SDW_DPN_PREPARECTRL(0) and instead rely on sdw_do_port_prep() calling
tas_port_prep() with prep_ch->num =3D=3D 0. However, tas_port_prep() checks
slave->prop.sink_dpn_prop instead of dp0_prop, and on
SDW_OPS_PORT_PRE_PREP it powers on TAS2783_SDCA_ENT_PDE23 before firmware
has been downloaded (and never powers PDE23 off on
SDW_OPS_PORT_PRE_DEPREP). Should dp0_prop->simple_ch_prep_sm be false for
DP0, or should tas_port_prep() handle port 0 separately?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103133853.1612=
-1-baojun.xu@ti.com?part=3D1
