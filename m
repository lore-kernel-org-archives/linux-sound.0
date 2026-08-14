Received: from mail-m49243.qiye.163.com (mail-m49243.qiye.163.com [45.254.49.243])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C1AF23BD1D
	for <linux-sound@vger.kernel.org>; Fri, 14 Aug 2026 03:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.243
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786677255; cv=none; b=pYUZAGx6qvgQxHyw+3xwmz8DA+HWW+Q2Dg5p0reu8i9Bl/zJPtg3uwBU+uGVa3RuzK+4vwvNs2RTWjYZjyE4BPgVTATzRKVtgxsBJCM71n0c2TS6iP6QQKUsfBnmEJUpNW8ahASE6tLT3RZEGOPhyyT34Y+H7dMGGUKZ4c+uTdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786677255; c=relaxed/simple;
	bh=Y5I7xz0ivvfXQCJ4Ceo0rvoN/Z7lPQgIwJZp7LQAlFw=;
	h=From:To:Cc:References:In-Reply-To:Subject:Date:Message-ID:
	 MIME-Version:Content-Type; b=ebF392TVhW4juAnBYe7vRud3kghl3iTaURuOvB9u/B1xFk72qRiPS8sBAmTKJ/CtVtxzXYsE8yzpICTZlZlXeg2aCO/ADelYafgMZPq9mAbhZ1CgMqjo2wuNfiOBAxznpeorBMzq/EpVVOrVF/iCtyOAhDGjTqZGTTmw2ZxYiug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=senarytech.com; spf=pass smtp.mailfrom=senarytech.com; dkim=pass (1024-bit key) header.d=senarytech.com header.i=@senarytech.com header.b=I8WcdIkA; arc=none smtp.client-ip=45.254.49.243
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=senarytech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=senarytech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=senarytech.com header.i=@senarytech.com header.b="I8WcdIkA"
Received: from Wangqianghua (unknown [182.148.129.16])
	by smtp.qiye.163.com (Hmail) with ESMTP id 49f0e9fa5;
	Fri, 14 Aug 2026 09:58:24 +0800 (GMT+08:00)
From: <qianghua.wang@senarytech.com>
To: "'Charles Keepax'" <ckeepax@opensource.cirrus.com>
Cc: <linux-sound@vger.kernel.org>,
	"'Mark Brown'" <broonie@kernel.org>,
	"'Pierre-Louis Bossart'" <pierre-louis.bossart@linux.dev>,
	"'Bard Liao'" <yung-chuan.liao@linux.intel.com>,
	"'Liam Girdwood'" <liam.r.girdwood@linux.intel.com>,
	"'Peter Ujfalusi'" <peter.ujfalusi@linux.intel.com>,
	"'Kai Vehmanen'" <kai.vehmanen@linux.intel.com>,
	"'Cezary Rojewski'" <cezary.rojewski@intel.com>,
	"'bo liu'" <bo.liu@senarytech.com>
References: <20260813024527.42294-1-qianghua.wang@senarytech.com> <20260813024527.42294-2-qianghua.wang@senarytech.com> <an2iDJ6snX9FZ9HQ@opensource.cirrus.com>
In-Reply-To: <an2iDJ6snX9FZ9HQ@opensource.cirrus.com>
Subject: =?utf-8?Q?=E5=9B=9E=E5=A4=8D:_=5BPATCH_v2_1/3=5D_ASoC:_codecs:?=
	=?utf-8?Q?_add_SN624x_SDCA_SoundWire_drive?=
	=?utf-8?Q?r?=
Date: Fri, 14 Aug 2026 09:58:22 +0800
Message-ID: <008f01dd2b90$63458b90$29d0a2b0$@senarytech.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQLvI0PUw/X8xj621XyYExeTwPSZwgF0rDVlAlgJjye0WnIqkA==
Content-Language: zh-cn
X-HM-Tid: 0a9ffdfdeca309d8kunmceeda9665355d7
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaQkpNVhkaTUtMH0oZHUlMHVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlKQ0lVSk9DVUpJQlVKTVlXWRYaDxIVHRRZQVlPS0hVQk
	JJTktVSktLVUpCS0JZBg++
DKIM-Signature: a=rsa-sha256;
	b=I8WcdIkAUOF4yTz5EjJnI/FS+RXPOF9bDmktMGCf28scodh7ySTqsNnnwu4HB3XV4+g83bTYDgjQQNHTtSz3bM9x39Jqir50ewP0NMJX6MCfZrhElEAoJfYlzgZGDlofOVa+cQtxt7XcpnDxSzJwdDWqbuk5Rd6tL2sbRvV9LSY=; c=relaxed/relaxed; s=default; d=senarytech.com; v=1;
	bh=1d4qMguVW0ajKnJjgKzDtTw0SiZpqk7B9NUwVOQUMc0=;
	h=date:mime-version:subject:message-id:from;

Hi Charles:
	Thanks for the review. I will address all of your comments in v3.

Regarding this point:

Not sure I follow this, what is happening here?

sdca_parse_function() loads the ACPI function-initialization-table =
before it parses entities. On our platforms the DisCo entity data is =
incomplete, so the later parse steps fail after the init table has =
already been filled. In that case we keep the partial function so =
io_init can still apply those ACPI init writes. If no init table was =
loaded, we discard the function and fall back to the OEM register =
sequence instead.

I did not change the logic here; I only clarified the comment in v3 to =
make this clearer.

Best regards
Qianghua Wang
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>=
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>=
>>>>>>>>>>>>>>>>>>>>>>>>>>>>
On Thu, Aug 13, 2026 at 10:45:25AM +0800, Qianghua Wang wrote:
> Add a SoundWire SDCA driver for Senary SN624x multi-function codecs=20
> (jack, speaker amp, and DMIC). Program SDCA SampleFreqIndex in=20
> hw_params, keep SDCA jack IRQs masked with poll-based detection, and=20
> extend the Senary MAINTAINERS entry for the new codec files only.
>=20
> Signed-off-by: Qianghua Wang <qianghua.wang@senarytech.com>
> ---
> +static int sn624x_sdca_mbq_size(struct device *dev, unsigned int reg) =

> +{
> +	if (!SDW_SDCA_VALID_CTL(reg))
> +		return 1;
> +
> +	/*
> +	 * FU_VOLUME and GE35 DETECTED_MODE share control selector 0x02.
> +	 * Only list known FU volume addresses as 16-bit MBQ =E2=80=94 =
matching
> +	 * DETECTED_MODE by csel alone makes GE35 use SDW_SDCA_MBQ_CTL and
> +	 * fails with -ENODATA (-61), which breaks jack plug/unplug.
> +	 */
> +	switch (reg) {
> +	case SN624X_REG_VOL:
> +	case SN624X_REG_CHR_VOL:
> +	case SN624X_REG_JACK_OUT_VOL:
> +	case SN624X_REG_JACK_OUT_CHR_VOL:
> +	case SN624X_REG_JACK_CAP_VOL:
> +	case SN624X_REG_JACK_CAP_CHR_VOL:
> +	case SN624X_REG_DMIC_CAP_VOL:
> +	case SN624X_REG_DMIC_CAP_CHR_VOL:
> +		return 2;
> +	default:
> +		return 1;
> +	}
> +}
> +
> +static bool sn624x_sdca_readable_register(struct device *dev,=20
> +unsigned int reg) {
> +	return sn624x_sdca_mbq_size(dev, reg) > 0; }

This is just the same as return true;, and as 00268f9452d2
("regmap: sdw-mbq: don't call an unset readable_reg callback") is now =
merged you can probably just drop the readable callback completely, =
assuming you are happy with everything being marked as readable.

> +static const struct reg_default sn624x_sdca_reg_defaults[] =3D {
> +	{}
> +};

Do you really want a completely empty defaults struct?  Wouldn't it make =
more sense to just not have one.

> +static int sn624x_parse_sdca_functions(struct sn624x_sdca_priv=20
> +*sn624x) {
> +	struct sdw_slave *slave =3D sn624x->slave;
> +	struct device *dev =3D &slave->dev;
> +	int i, ret;
> +
> +	if (!slave->sdca_data.num_functions) {
> +		dev_dbg(dev, "sn624x: no SDCA function descriptors from DisCo\n");
> +		return 0;
> +	}
> +
> +	for (i =3D 0; i < slave->sdca_data.num_functions; i++) {
> +		struct sdca_function_desc *desc =3D &slave->sdca_data.function[i];
> +		struct sdca_function_data *fn;
> +		bool is_jack =3D false, is_mic =3D false, is_amp =3D false;
> +
> +		switch (desc->type) {
> +		case SDCA_FUNCTION_TYPE_UAJ:
> +		case SDCA_FUNCTION_TYPE_SIMPLE_JACK:
> +		case SDCA_FUNCTION_TYPE_RJ:
> +			is_jack =3D true;
> +			break;
> +		case SDCA_FUNCTION_TYPE_SMART_MIC:
> +		case SDCA_FUNCTION_TYPE_SIMPLE_MIC:
> +			is_mic =3D true;
> +			break;
> +		case SDCA_FUNCTION_TYPE_SMART_AMP:
> +		case SDCA_FUNCTION_TYPE_SIMPLE_AMP:
> +		case SDCA_FUNCTION_TYPE_SPEAKER_MIC:
> +			is_amp =3D true;
> +			break;
> +		default:
> +			break;
> +		}
> +
> +		if (desc->adr =3D=3D SN624X_FUNC_NUM_JACK_CODEC)
> +			is_jack =3D true;
> +		else if (desc->adr =3D=3D SN624X_FUNC_NUM_MIC_ARRAY)
> +			is_mic =3D true;
> +		else if (desc->adr =3D=3D SN624X_FUNC_NUM_SPEAKER_AMP)
> +			is_amp =3D true;
> +
> +		if (!is_jack && !is_mic && !is_amp)
> +			continue;
> +
> +		fn =3D devm_kzalloc(dev, sizeof(*fn), GFP_KERNEL);
> +		if (!fn)
> +			return -ENOMEM;
> +
> +		fn->desc =3D desc;
> +		ret =3D sdca_parse_function(dev, slave, fn);
> +		if (ret) {
> +			/*
> +			 * Init table is parsed before entities. Keep a partial
> +			 * function if the ACPI init table was already loaded.
> +			 */
> +			dev_warn(dev,
> +				 "sn624x: sdca_parse_function(%s adr=3D%u) failed (%d)%s\n",
> +				 desc->name ? desc->name : "?", desc->adr, ret,
> +				 fn->num_init_table ?
> +				 ", keeping ACPI init table" : "");
> +			if (!fn->num_init_table)
> +				continue;

Not sure I follow this, what is happening here?

> +static int sn624x_sdca_pcm_hw_params(struct snd_pcm_substream =
*substream,
> +				     struct snd_pcm_hw_params *params,
> +				     struct snd_soc_dai *dai)
> +{
> +	struct snd_soc_component *component =3D dai->component;
> +	struct sn624x_sdca_priv *sn624x =3D =
snd_soc_component_get_drvdata(component);
> +	struct sdw_stream_config stream_config;
> +	struct sdw_port_config port_config;
> +	enum sdw_data_direction direction;
> +	struct sdw_stream_runtime *sdw_stream;
> +	unsigned int ch =3D params_channels(params);
> +	unsigned int sampling_rate;
> +	int port;
> +	int ret;
> +
> +	dev_dbg(dai->dev,
> +		 "sn624x: hw_params: entered dai=3D%s id=3D%d stream=3D%s\n",
> +		 dai->name, dai->id, snd_pcm_stream_str(substream));
> +
> +	sdw_stream =3D snd_soc_dai_get_dma_data(dai, substream);
> +	if (!sdw_stream) {
> +		dev_warn(dai->dev,
> +			 "sn624x: hw_params: no SDW stream (set_stream not run yet?)\n");
> +		return -EINVAL;
> +	}
> +	if (!sn624x->slave) {
> +		dev_warn(dai->dev, "sn624x: hw_params: slave NULL\n");
> +		return -EINVAL;
> +	}
> +
> +	ret =3D pm_runtime_resume(component->dev);
> +	if (ret < 0 && ret !=3D -EACCES) {
> +		dev_err(dai->dev,
> +			"sn624x: hw_params: pm_runtime_resume failed (%d)\n", ret);
> +		return ret;
> +	}
> +
> +	if (substream->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK) {
> +		direction =3D SDW_DATA_DIR_RX;
> +		if (dai->id =3D=3D SN624X_DAI_JACK)
> +			port =3D SN624X_PORT_JACK_PLAYBACK;
> +		else if (dai->id =3D=3D SN624X_DAI_SPEAKER)
> +			port =3D SN624X_PORT_SPEAKER_PLAYBACK;
> +		else
> +			return -EINVAL;
> +	} else {
> +		direction =3D SDW_DATA_DIR_TX;
> +		if (dai->id =3D=3D SN624X_DAI_JACK) {
> +			port =3D SN624X_PORT_JACK_CAPTURE;
> +		} else if (dai->id =3D=3D SN624X_DAI_DMIC) {
> +			port =3D SN624X_PORT_DMIC_CAPTURE;
> +		} else {
> +			return -EINVAL;
> +		}
> +	}
> +	stream_config.frame_rate =3D params_rate(params);
> +	stream_config.ch_count =3D ch;
> +	stream_config.bps =3D snd_pcm_format_width(params_format(params));
> +	stream_config.direction =3D direction;
> +	port_config.ch_mask =3D GENMASK(ch - 1, 0);

snd_sdw_params_to_config()

> +static int sn624x_sdca_regmap_resume(struct device *dev) {
> +	struct sdw_slave *slave =3D dev_to_sdw_dev(dev);
> +	struct sn624x_sdca_priv *sn624x =3D dev_get_drvdata(dev);
> +	unsigned long time;
> +
> +	if (!sn624x->first_hw_init)
> +		return 0;
> +
> +	SN624X_DBG(dev, "resume: unattach_request=3D%u\n", =
slave->unattach_request);
> +	if (!slave->unattach_request)
> +		goto regmap_sync;
> +
> +	time =3D =
wait_for_completion_timeout(&slave->initialization_complete,
> +					   msecs_to_jiffies(SN624X_PROBE_TIMEOUT_MS));
> +	if (!time) {
> +		dev_err(dev, "%s: initialization timed out\n", __func__);
> +		sdw_show_ping_status(slave->bus, true);
> +		return -ETIMEDOUT;
> +	}

sdw_slave_wait_for_init()


Thanks,
Charles

