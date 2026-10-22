Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792663751;
	b=1BLqNoi1I5awUuWuYRpFAXVbXjLqy+HJ+C+eu8Z9MqnwrnzhZ2N7vtEmRTzMoITuMYON
	 +oPweGLqtbmBRTuE5xgmLpVerxgnsfg9X1SVLJwLmOufmyDJHwDCZbracPqjXHiQkwIG0
	 BGuqq1qneOShFfy8YiS8Z6tbhezo/vFSk8pZU5poH2X4feUKlFRwlC18q7UBOVgJlrcGc
	 jWr/v8ACeK8x0BVqjtiUivRa7Tk7bIvDEGjcQ1+fiLtC2qt22lO4/huP/SW7uGKkK56yd
	 apExyiAYyEsCdCfDyIL3TBrdtPonYHyCGNVzjW1uNJXUr+8Tej+JT2l1ERByVPQrhNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792663751;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=nirqn2OzW8Vx4a57+rRof6o3dSAxLjWaBsv5CIhajIs=;
	b=WKX+PXXWHqtdelbqIz7TKt71CCdconfmq37ciNxc8bvHgP9m06FAuzRs8p0Ab5j9Bz6D
	 xe97oF9QVU8kMhhWEJ26kzuuYGsWwU7v05e+NMHUDZ914lg8GFPXX2on6B6CbHUZl9rPk
	 PPcajRYqKcJXNa4AKZy3K6rVzRn/mX2XKQwdSvMbhY6/se3zUR148rZBteSDweDArOFFz
	 azJhpJSvyd03mpCtoLSCxFo1AczijCQJk22nlpX8/SMSnxIIDPQ98oemHfPl6hCUjhrxx
	 FZCIUMSgzx5oy9NCPl0O4S6wjynvP9a295YJY1LM6rLD9Z8Le112/jzTq7YPLuiac/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nKCCcnAH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBDD9606A31E;
	Thu, 22 Oct 2026 10:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nKCCcnAH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ACF01F000C2;
	Thu, 22 Oct 2026 10:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792663750;
	bh=nirqn2OzW8Vx4a57+rRof6o3dSAxLjWaBsv5CIhajIs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nKCCcnAHHpz+5OHb0ggougGxi7wGWB1WqvJ6vEPr8xbxza8mfaQfXVYzB9ytlNpJy
	 3lvB+RbhkLa59i6fjwonr5R0qWCbEk7cDNPP4EbxQNI3orzYQvPu92GwLgX7kjrPt8
	 yV5M8tyO9H8jKyUKWLxozJPyA+7zOZV5VhcLnGe9ytPmHgw2lmuNPRmb1JbTJR62qq
	 VPd0grxQICjoM1HFAqtcLw/840o2B0lyHe+4WjUWQBaaYb75yfNMSuCbNCE5M2JYGo
	 jTHUp/KXtNIGDrBEM8/VpF0l/uxqZiF4q6BHIkckamytk1AJEQXHy2YAVVrOgg/M4L
	 ubwYH80AEpUZg==
Message-ID: <sashiko-outbox-181315@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 2/2] ASoC: codecs: nau8310: Add support for NAU83G10
 amplifier
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neo Chang" <YLCHANG2@nuvoton.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261022084037.259983-3-YLCHANG2@nuvoton.com>
References: <20261022084037.259983-1-YLCHANG2@nuvoton.com>
 <20261022084037.259983-3-YLCHANG2@nuvoton.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Oct 2026 10:09:10 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 15 potential issue=
(s) to consider:
- [High] ASoC: nau8310: type confusion and crash in component kcontrol call=
backs
- [High] ASoC: nau8310: nau8310_dsp_init() desynchronizes DAPM switch state
- [High] ASoC: nau8310: missing cancel_work_sync() on probe error and compo=
nent remove
- [High] ASoC: nau8310: lock inversion and bias_level TOCTOU in nau8310_dsp=
_snd_soc_dapm_put()
- [Medium] ASoC: nau8310: nau8310_dsp_set_kcs_setup() ignores nau8310->dsp_=
firmware
- [Medium] ASoC: nau8310: broken clock config for 64kHz/96kHz and 1x/2x mul=
tipliers
- [Medium] ASoC: nau8310: uninitialized *n1_sel read in nau8310_clksrc_choo=
se()
- [Medium] ASoC: nau8310: nau8310_shutdown() clobbers active stream and mcl=
k state
- [Medium] ASoC: nau8310: nau8310_dac_oversampl_enum exposes reserved regis=
ter value
- [Medium] ASoC: nau8310: volatile registers in nau8310_reg_defaults synced=
 on resume
- [Medium] ASoC: nau8310: nau8310_set_tdm_slot() bitwise-ORs encoded TX slo=
t values
- [Medium] ASoC: nau8310: nau8310_reply_from_dsp() leaves reply buffer unin=
itialized
- [Medium] ASoC: nau8310: race between load_fw_work and DAPM clock events
- [Low] ASoC: nau8310: broken snd_soc_dapm_del_routes() error cleanup
- [Low] ASoC: nau8310: uninitialized kcs_setup_comp fields in nau8310_dsp_s=
et_kcs_setup()
--

commit 781c4e28ad8239f56461795282d48ebf131f9a1b
Author: Neo Chang <YLCHANG2@nuvoton.com>

ASoC: codecs: nau8310: Add support for NAU83G10 amplifier

This patch adds an ASoC codec driver for the Nuvoton NAU83G10 mono boost
Class-D audio amplifier with integrated dsp and I/V-sense support.

> diff --git a/sound/soc/codecs/nau8310-dsp.c b/sound/soc/codecs/nau8310-ds=
p.c
> new file mode 100644
> index 0000000000000..7e8606beb2084
> --- /dev/null
> +++ b/sound/soc/codecs/nau8310-dsp.c

[ ... ]

> +static int nau8310_reply_from_dsp(struct snd_soc_component *cp,
> +	const struct nau8310_cmd_info *cmd_info, int data_size,
> +	void *data)
> +{
> +	struct nau8310 *nau8310 =3D snd_soc_component_get_drvdata(cp);
> +	struct device *dev =3D cp->dev;
> +	int ret, frag_len, pad_len_exp, data_count =3D 0;
> +
> +	ret =3D nau8310_dsp_replied(nau8310, &frag_len);
> +	if (ret)
> +		return ret;
> +	if (!frag_len || !cmd_info->reply_data)
> +		return 0;
> +	if (!data || frag_len =3D=3D 1)
> +		return -EINVAL;

[Severity: Medium]
In sound/soc/codecs/nau8310-dsp.c, if nau8310_dsp_replied() returns a
reply preamble with frag_len =3D=3D 0 for a command where cmd_info->reply_d=
ata
is true, nau8310_reply_from_dsp() returns 0 without writing anything to
the data buffer.

In nau8310_dsp_kcs_setup(), kcs_rst is declared uninitialized on the stack
and passed to nau8310_dsp_exec_command() for NAU8310_DSP_CMD_GET_KCS_RSLTS:

	unsigned int kcs_rst;
	...
		ret =3D nau8310_dsp_exec_command(cp, NAU8310_DSP_CMD_GET_KCS_RSLTS,
			0, NAU8310_DSP_DATA_BYTE, NULL, NAU8310_DSP_DATA_BYTE, &kcs_rst);
		if (ret)
			return ret;
		if (kcs_rst !=3D NAU8310_DSP_KCS_RSLTS_SUCCESS)
			return -EINVAL;

Could a zero-length reply cause nau8310_dsp_kcs_setup() to evaluate an
uninitialized kcs_rst value? Should nau8310_reply_from_dsp() return an
error when cmd_info->reply_data is set but frag_len =3D=3D 0?

[ ... ]

> +static int nau8310_dsp_snd_soc_dapm_put(struct snd_kcontrol *kcontrol,
> +	struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_dapm_context *dapm =3D snd_soc_dapm_kcontrol_to_dapm(kco=
ntrol);
> +	struct snd_soc_component *component =3D snd_soc_dapm_to_component(dapm);
> +	struct nau8310 *nau8310 =3D snd_soc_component_get_drvdata(component);
> +	struct soc_mixer_control *mc =3D
> +		(struct soc_mixer_control *)kcontrol->private_value;
> +	unsigned int mask =3D (1 << fls(mc->max)) - 1;
> +	unsigned int val;
> +	int ret;
> +
> +	if (snd_soc_dapm_get_bias_level(dapm) > SND_SOC_BIAS_STANDBY) {
> +		dev_warn_ratelimited(nau8310->dev, "changing path is not allowed durin=
g playback");
> +		return -EBUSY;
> +	}
> +
> +	val =3D (ucontrol->value.integer.value[0] & mask);
> +
> +	mutex_lock(&nau8310->lock);
> +	if (val =3D=3D NAU8310_DAC_SRC_DSP && !nau8310->load_fw_done) {
> +		dev_warn_ratelimited(nau8310->dev, "Cannot enable DSP: Firmware not re=
ady or disabled");
> +		mutex_unlock(&nau8310->lock);
> +		return -EBUSY;
> +	}
> +
> +	ret =3D snd_soc_dapm_put_volsw(kcontrol, ucontrol);
> +
> +	if (val =3D=3D NAU8310_DAC_SRC_BYPASS) {
> +		/* Switch the clock source of DSP to MCLK. */
> +		regmap_update_bits(nau8310->regmap, NAU8310_R04_ENA_CTRL,
> +			NAU8310_DSP_SEL_OSC, 0);
> +	}
> +	mutex_unlock(&nau8310->lock);
> +
> +	return ret;
> +}

[Severity: High]
Can nau8310_dsp_snd_soc_dapm_put() in sound/soc/codecs/nau8310-dsp.c cause
a lock inversion with nau8310_startup() and nau8310_load_fw_work()?

Here, nau8310_dsp_snd_soc_dapm_put() acquires nau8310->lock and then calls
snd_soc_dapm_put_volsw(), which acquires card->dapm_mutex and
card->pcm_mutex (via snd_soc_dpcm_runtime_update()).

However, when opening a pcm stream, soc_pcm_open() holds card->pcm_mutex
and calls nau8310_startup(), which calls flush_work(&nau8310->load_fw_work)
while nau8310_load_fw_work() acquires nau8310->lock:

Thread 1 (control write):
  nau8310_dsp_snd_soc_dapm_put()
    mutex_lock(&nau8310->lock)
    snd_soc_dapm_put_volsw()
      snd_soc_dpcm_runtime_update()
        snd_soc_dpcm_mutex_lock(card) -> locks card->pcm_mutex

Thread 2 (pcm open):
  soc_pcm_open() -> locks card->pcm_mutex
    __soc_pcm_open()
      snd_soc_dai_startup()
        nau8310_startup()
          flush_work(&nau8310->load_fw_work)
            waits for nau8310_load_fw_work() -> mutex_lock(&nau8310->lock)

Also, snd_soc_dapm_get_bias_level(dapm) is checked before acquiring
nau8310->lock or card->dapm_mutex, so a stream can start while waiting for
nau8310->lock and bypass the playback check. And when val =3D=3D
NAU8310_DAC_SRC_BYPASS, clearing NAU8310_DSP_SEL_OSC does not check if
load_fw_work is still pending, which can switch the clock away from the
internal oscillator before nau8310_load_fw_work() runs.

> +
> +#define NAU8310_DSP_SOC_DAPM_SINGLE(xname, reg, shift, mask, invert) \
> +	SOC_SINGLE_EXT(xname, reg, shift, mask, invert, \
> +		snd_soc_dapm_get_volsw, nau8310_dsp_snd_soc_dapm_put)
> +
> +static const struct snd_kcontrol_new nau8310_dacdat_select_dsp =3D
> +	NAU8310_DSP_SOC_DAPM_SINGLE("Switch", NAU8310_R1A_DSP_CORE_CTRL2,
> +		NAU8310_DAC_SEL_DSP_SFT, 1, 0);
> +
> +static int nau8310_dsp_clock_event(struct snd_soc_dapm_widget *w,
> +	struct snd_kcontrol *kcontrol, int event)
> +{
> +	struct snd_soc_component *cp =3D snd_soc_dapm_to_component(w->dapm);
> +	struct nau8310 *nau8310 =3D snd_soc_component_get_drvdata(cp);
> +	int ret =3D 0;
> +
> +	if (SND_SOC_DAPM_EVENT_ON(event)) {
> +		ret =3D nau8310_dsp_exec_command(cp, NAU8310_DSP_CMD_CLK_RESTART,
> +			0, 0, NULL, 0, NULL);
> +		if (ret)
> +			dev_err(cp->dev, "Send DSP command %s fail (%d)",
> +				dsp_cmd_table[NAU8310_DSP_CMD_CLK_RESTART], ret);
> +
> +		/* Switch the clock source of DSP to MCLK. */
> +		regmap_update_bits(nau8310->regmap, NAU8310_R04_ENA_CTRL,
> +			NAU8310_DSP_SEL_OSC, 0);
> +	} else if (SND_SOC_DAPM_EVENT_OFF(event)) {
> +		ret =3D nau8310_dsp_exec_command(cp, NAU8310_DSP_CMD_CLK_STOP,
> +			0, 0, NULL, 0, NULL);
> +		if (ret)
> +			dev_err(cp->dev, "Send DSP command %s fail (%d)",
> +				dsp_cmd_table[NAU8310_DSP_CMD_CLK_STOP], ret);
> +	}
> +
> +	return ret;
> +}

[Severity: Medium]
Can nau8310_dsp_clock_event() in sound/soc/codecs/nau8310-dsp.c race with
nau8310_load_fw_work() during system resume?

In nau8310_resume(), nau8310_dsp_fw_load() switches the clock source to
the internal oscillator (NAU8310_DSP_SEL_OSC) and schedules
nau8310->load_fw_work asynchronously. Immediately afterwards,
soc_resume_deferred() powers up dapm widgets and invokes
nau8310_dsp_clock_event() while nau8310_load_fw_work() is still in
nau8310_dsp_init() (which sleeps in msleep(120) and then transfers
firmware over NAU8310_RF000_DSP_COMM under nau8310->lock).

Because nau8310_dsp_clock_event() and nau8310_clock_event() do not
synchronize with load_fw_work or acquire nau8310->lock, won't they
interleave commands on NAU8310_RF000_DSP_COMM and clear
NAU8310_DSP_SEL_OSC while firmware download is still in progress?

[ ... ]

> +static int nau8310_dsp_set_kcs_setup(struct snd_soc_component *cp)
> +{
> +	struct nau8310 *nau8310 =3D snd_soc_component_get_drvdata(cp);
> +	struct regmap *regmap =3D nau8310->regmap;
> +	struct nau8310_kcs_setup kcs_setup_comp, *kcs_setup =3D &kcs_setup_comp;
> +	struct device *dev =3D cp->dev;
> +	const struct firmware *fw;
> +	int ret, status =3D 0, buf_off, buf_len;
> +
> +	dev_dbg(dev, "Send DSP command %s",
> +		dsp_cmd_table[NAU8310_DSP_CMD_GET_FRAME_STATUS]);
> +
> +	kcs_setup->get_len =3D kcs_setup->set_len =3D sizeof(status);
> +	kcs_setup->get_data =3D (void *)&status;
> +
> +	ret =3D nau8310_send_dsp_command(cp, NAU8310_DSP_CMD_GET_FRAME_STATUS, =
kcs_setup);

[Severity: Low]
In nau8310_dsp_set_kcs_setup() in sound/soc/codecs/nau8310-dsp.c,
kcs_setup_comp is declared on the stack without zero-initializing
set_kcs_offset and set_kcs_data, which are then read in
nau8310_send_dsp_command() and passed to nau8310_message_to_dsp(). Should
kcs_setup_comp be zero-initialized (or should this call
nau8310_dsp_exec_command())?

> +	if (ret) {
> +		dev_err(dev, "Send DSP command %s fail (%d)",
> +			dsp_cmd_table[NAU8310_DSP_CMD_GET_FRAME_STATUS], ret);
> +		goto err;
> +	}
> +
> +	if (!(status & NAU8310_DSP_ALGO_OK)) {
> +		dev_err(dev, "Algorithm of DSP is not ready, status %x", status);
> +		ret =3D -EIO;
> +		goto err;
> +	}
> +
> +	dev_info(dev, "Algorithm of DSP is ready, status %x", status);
> +
> +	dev_dbg(dev, "Request firmware and wait until finish.");
> +	ret =3D request_firmware(&fw, NAU8310_DSP_FIRMWARE, dev);

[Severity: Medium]
In nau8310_read_device_properties() in sound/soc/codecs/nau8310.c, the
driver reads the "firmware-name" device property and allocates
nau8310->dsp_firmware. However, nau8310_dsp_set_kcs_setup() passes the
hardcoded NAU8310_DSP_FIRMWARE macro to request_firmware() here. Should
this pass nau8310->dsp_firmware instead?

> +	if (ret) {
> +		dev_err(dev, "Failed to load firmware (%d)", ret);
> +		goto err;
> +	}

[ ... ]

> +int nau8310_dsp_init(struct snd_soc_component *cp)
> +{
> +	struct regmap *regmap =3D cp->regmap;
> +
> +	nau8310_sw_reset_chip(regmap);
> +
> +	/* wait for the power ready */
> +	msleep(120);
> +
> +	regmap_update_bits(regmap, NAU8310_R1A_DSP_CORE_CTRL2,
> +		NAU8310_DSP_RUNSTALL | NAU8310_DAC_SEL_DSP_OUT, NAU8310_DAC_SEL_DSP_OU=
T);
> +
> +	return nau8310_dsp_set_kcs_setup(cp);
> +}

[Severity: High]
Does setting NAU8310_DAC_SEL_DSP_OUT directly via regmap_update_bits() in
nau8310_dsp_init() desynchronize the "DAC data from DSP" dapm switch
state?

In nau8310_codec_probe(), nau8310_dsp_fw_load() schedules load_fw_work and
nau8310_dsp_setup_controls() immediately registers the "DAC data from DSP"
switch widget (which is backed by NAU8310_R1A_DSP_CORE_CTRL2 bit
NAU8310_DAC_SEL_DSP_SFT) while load_fw_work is sleeping in msleep(120).

When snd_soc_dapm_add_routes() runs, NAU8310_DAC_SEL_DSP_OUT is still 0,
so dapm initializes the switch path as disconnected. When
nau8310_dsp_init() subsequently sets NAU8310_DAC_SEL_DSP_OUT in the
register without going through dapm, nau8310_dsp_active() becomes true and
the hardware mux selects the dsp output, but dapm still treats "DAC data
from DSP" as disconnected and leaves the "DSP", "DSP Clock", and "Capture
Sense" widgets unpowered during playback.

> +
> +int nau8310_dsp_setup_controls(struct snd_soc_component *cp)
> +{
> +	struct nau8310 *nau8310 =3D snd_soc_component_get_drvdata(cp);
> +	struct snd_soc_dapm_context *dapm =3D nau8310->dapm;
> +	int ret;
> +
> +	ret =3D snd_soc_dapm_new_controls(dapm, nau8310_dsp_dapm_widgets,
> +		ARRAY_SIZE(nau8310_dsp_dapm_widgets));
> +	if (ret) {
> +		dev_err(cp->dev, "Add DSP widget fail (%d)", ret);
> +		goto err;
> +	}
> +
> +	ret =3D snd_soc_dapm_add_routes(dapm, nau8310_dsp_dapm_routes,
> +		ARRAY_SIZE(nau8310_dsp_dapm_routes));
> +	if (ret) {
> +		dev_err(cp->dev, "Add DSP route fail (%d)", ret);
> +		goto err;
> +	}
> +
> +	return 0;
> +err:
> +	snd_soc_dapm_del_routes(dapm, nau8310_dsp_dapm_routes,
> +		ARRAY_SIZE(nau8310_dsp_dapm_routes));
> +	return ret;
> +}

[Severity: Low]
In nau8310_dsp_setup_controls() in sound/soc/codecs/nau8310-dsp.c, if
snd_soc_dapm_new_controls() fails, jumping to err calls
snd_soc_dapm_del_routes() on routes that were never added. In addition,
nau8310_dsp_dapm_routes contains a route with a control ("Switch"), which
snd_soc_dapm_del_route() does not support removing. Since component probe
failure already frees dapm widgets and routes via snd_soc_dapm_free(), can
the snd_soc_dapm_del_routes() call in the error path be dropped?

> diff --git a/sound/soc/codecs/nau8310.c b/sound/soc/codecs/nau8310.c
> new file mode 100644
> index 0000000000000..b4de2de337683
> --- /dev/null
> +++ b/sound/soc/codecs/nau8310.c

[ ... ]

> +static const struct reg_default nau8310_reg_defaults[] =3D {
> +	{ NAU8310_R02_I2C_ADDR, 0x0000 },
> +	{ NAU8310_R03_CLK_CTRL, 0x0000 },
> +	{ NAU8310_R04_ENA_CTRL, 0x0000 },
> +	{ NAU8310_R05_INTERRUPT_CTRL, 0x007f },
> +	{ NAU8310_R06_INT_CLR_STATUS, 0x0000 },

[ ... ]

> +	{ NAU8310_R9C_BIQ2_COE_9, 0x0000 },
> +	{ NAU8310_R9D_BIQ2_COE_10, 0x0000 },
> +	{ NAU8310_RF000_DSP_COMM, 0x0000 },
> +};

[Severity: Medium]
NAU8310_R06_INT_CLR_STATUS and NAU8310_RF000_DSP_COMM are marked as both
volatile and writeable, and are also included in nau8310_reg_defaults[] in
sound/soc/codecs/nau8310.c.

Because regcache_maple_populate() seeds the maple cache from
reg_defaults[], when nau8310_suspend() calls regcache_mark_dirty() and
nau8310_resume() calls regcache_sync(), regcache will write 0x0000 to
NAU8310_R06_INT_CLR_STATUS and 0x00000000 to the 32-bit mailbox register
NAU8310_RF000_DSP_COMM. Should volatile registers be omitted from
nau8310_reg_defaults[]?

[ ... ]

> +static int nau8310_clkdet_put(struct snd_kcontrol *kcontrol,
> +	struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct soc_mixer_control *mc =3D
> +		(struct soc_mixer_control *)kcontrol->private_value;
> +	struct snd_soc_dapm_context *dapm =3D snd_soc_dapm_kcontrol_to_dapm(kco=
ntrol);
> +	struct snd_soc_component *component =3D snd_soc_dapm_to_component(dapm);
> +	struct nau8310 *nau8310 =3D snd_soc_component_get_drvdata(component);

[ ... ]

> +static int nau8310_clkdet_get(struct snd_kcontrol *kcontrol,
> +	struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_dapm_context *dapm =3D snd_soc_dapm_kcontrol_to_dapm(kco=
ntrol);
> +	struct snd_soc_component *component =3D snd_soc_dapm_to_component(dapm);
> +	struct nau8310 *nau8310 =3D snd_soc_component_get_drvdata(component);
> +
> +	ucontrol->value.integer.value[0] =3D nau8310->clock_detection;
> +
> +	return 0;
> +}
> +
> +static int nau8310_biq_coeff_get(struct snd_kcontrol *kcontrol,
> +	struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_dapm_context *dapm =3D snd_soc_dapm_kcontrol_to_dapm(kco=
ntrol);
> +	struct snd_soc_component *component =3D snd_soc_dapm_to_component(dapm);
> +	struct nau8310 *nau8310 =3D snd_soc_component_get_drvdata(component);
> +	struct soc_bytes_ext *params =3D (void *)kcontrol->private_value;
> +	int i, reg, reg_val;
> +	u16 *val;
> +
> +	val =3D (u16 *)ucontrol->value.bytes.data;
> +	reg =3D NAU8310_R80_BIQ0_COE_1;
> +	for (i =3D 0; i < params->max / sizeof(u16); i++) {
> +		regmap_read(nau8310->regmap, reg + i, &reg_val);
> +		/* conversion of 16-bit integers between native CPU format
> +		 * and big endian format
> +		 */
> +		reg_val =3D cpu_to_be16(reg_val);
> +		*(val + i) =3D reg_val;
> +	}
> +
> +	return 0;
> +}
> +
> +static int nau8310_biq_coeff_put(struct snd_kcontrol *kcontrol,
> +	struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_dapm_context *dapm =3D snd_soc_dapm_kcontrol_to_dapm(kco=
ntrol);
> +	struct snd_soc_component *component =3D snd_soc_dapm_to_component(dapm);
> +	struct nau8310 *nau8310 =3D snd_soc_component_get_drvdata(component);

[Severity: High]
Won't calling snd_soc_dapm_kcontrol_to_dapm(kcontrol) in
nau8310_clkdet_put(), nau8310_clkdet_get(), nau8310_biq_coeff_get(), and
nau8310_biq_coeff_put() crash when userspace accesses the "Clock Detection
Switch" or "BIQ Coefficients" controls?

Both controls are registered in nau8310_snd_controls[] via
soc_comp_dev_nau8310.controls, so kcontrol->private_data points to struct
snd_soc_component, not struct dapm_kcontrol_data. Calling
snd_soc_dapm_kcontrol_to_dapm() reinterprets the component pointer as
struct dapm_kcontrol_data and dereferences data->wlist->widgets[0]->dapm.
Should these four functions use snd_soc_kcontrol_component(kcontrol)
instead?

Also, in nau8310_biq_coeff_get(), if regmap_read() fails, reg_val is
uninitialized on the stack and gets copied into
ucontrol->value.bytes.data. Should the return value of regmap_read() be
checked?

[ ... ]

> +static const char * const nau8310_dac_oversampl[] =3D {
> +	"64", "256", "128", "", "32" };
> +
> +static const struct soc_enum nau8310_dac_oversampl_enum =3D
> +	SOC_ENUM_SINGLE(NAU8310_R29_DAC_CTRL1, NAU8310_DAC_OVERSAMPLE_SFT,
> +		ARRAY_SIZE(nau8310_dac_oversampl), nau8310_dac_oversampl);

[Severity: Medium]
In sound/soc/codecs/nau8310.c, nau8310_dac_oversampl[] includes an empty
string "" at index 3 with SOC_ENUM_SINGLE, exposing reserved register
value 3 to userspace. If userspace selects index 3, osr_dac_sel[3] has osr
=3D=3D 0 and nau8310_osr_apply() fails with -EINVAL during hw_params. Should
this use SOC_VALUE_ENUM_SINGLE to skip the reserved value?

[ ... ]

> +static int nau8310_srate_clk_apply(struct nau8310 *nau8310,
> +	const struct nau8310_srate_attr *srate_table,
> +	int n1_sel, int mclk_mult_sel, int n2_sel, int dsp_mult_sel)
> +{
> +	struct regmap *regmap =3D nau8310->regmap;
> +	int dsp_clk, mult_sel;
> +	unsigned int ctrl_val =3D 0;
> +
> +	static const unsigned int mclkx_val[] =3D {
> +		/* multiplier 4x, i.e. 2^2 */
> +		[2] =3D NAU8310_MCLK4XEN,
> +		/* multiplier 8x, i.e. 2^3 */
> +		[3] =3D NAU8310_MCLK8XEN | NAU8310_MCLK4XEN,
> +		/* multiplier 16x, i.e. 2^4 */
> +		[4] =3D NAU8310_MCLK16XEN | NAU8310_MCLK8XEN | NAU8310_MCLK4XEN,
> +	};
> +
> +	if (!srate_table || srate_table->adc_div < 0 ||
> +		dsp_mult_sel < 0 || dsp_mult_sel >=3D ARRAY_SIZE(dsp_src_mult) ||
> +		n2_sel < 0 || n2_sel >=3D ARRAY_SIZE(mclk_n2_div) ||
> +		n1_sel < 0 || n1_sel >=3D ARRAY_SIZE(mclk_n1_div)) {
> +		dev_err(nau8310->dev, "The fs %d isn't support in DSP.",
> +			nau8310->fs);
> +		return -EINVAL;
> +	}

[ ... ]

> +	regmap_update_bits(regmap, NAU8310_R04_ENA_CTRL,
> +		NAU8310_CLK_DSP_SRC_MASK | NAU8310_CLK_MUL_SRC_MASK |
> +		NAU8310_MCLK_SEL_MASK, ctrl_val);
> +
> +	if (mult_sel < 2 || mult_sel > 4)
> +		return -EINVAL;
> +
> +	regmap_update_bits(regmap, NAU8310_R68_ANALOG_CONTROL_7,
> +		NAU8310_MCLKX_MASK, mclkx_val[mult_sel]);
> +
> +	return 0;
> +}
> +
> +static int nau8310_calc_dsp_clk(int mclk, int fs, int mult_param, int n1=
_param)
> +{
> +	int dsp_clk =3D (mclk << mult_param) / n1_param;
> +
> +	if (dsp_clk >=3D (fs * DSP_CLK_MIN_MULTI_VALUE) && dsp_clk <=3D DSP_CLK=
_MAX)
> +		return dsp_clk;
> +
> +	return 0;
> +}

[Severity: Medium]
Can 64 kHz or 96 kHz ever succeed in nau8310_clock_config() when the dsp
is bypassed, or can 1x/2x clock multipliers ever be applied?

In nau8310_calc_dsp_clk(), dsp_clk must be between fs * 2000 and
102400000. For fs =3D 64000 (64000 * 2000 =3D 128000000) and fs =3D 96000
(96000 * 2000 =3D 192000000), fs * DSP_CLK_MIN_MULTI_VALUE exceeds
DSP_CLK_MAX, so nau8310_clkdsp_choose() always fails even when the dsp is
bypassed. In addition, target_srate_table[] sets adc_div =3D -1 for 96000,
which nau8310_srate_clk_apply() rejects unconditionally, and
NAU8310_RATES advertises SNDRV_PCM_RATE_8000_192000 including rates
(11025, 22050, 88200, 176400, 192000) not present in
target_srate_table[].

Furthermore, in nau8310_srate_clk_apply(), mult_sel is an index into
mclk_src_mult[] / dsp_src_mult[] where 0 and 1 represent 1x and 2x
multipliers, but the check:

	if (mult_sel < 2 || mult_sel > 4)
		return -EINVAL;

rejects mult_sel =3D=3D 0 and mult_sel =3D=3D 1 with -EINVAL after already
updating NAU8310_R03_CLK_CTRL, NAU8310_R40_CLK_DET_CTRL, and
NAU8310_R04_ENA_CTRL. Should mclkx_val[] allow 0 for 1x and 2x multipliers
instead of returning -EINVAL?

[ ... ]

> +static int nau8310_clksrc_choose(struct nau8310 *nau8310,
> +	const struct nau8310_srate_attr **srate_table,
> +	int *n1_sel, int *mult_sel, int *n2_sel, int *dsp_mult_sel)
> +{
> +	int i, j, mclk, mclk_max, ratio, ratio_sel, n2_max, ret;

[ ... ]

> +	/* Get MCLK_SRC through 1/N, Multiplier, and then 1/N2. */
> +	mclk_max =3D 0;
> +	for (i =3D 0; i < ARRAY_SIZE(mclk_n1_div); i++) {
> +		for (j =3D 0; j < ARRAY_SIZE(mclk_src_mult); j++) {
> +			mclk =3D nau8310->mclk << mclk_src_mult[j].param;
> +			mclk =3D mclk / mclk_n1_div[i].param;
> +			ratio =3D nau8310_clksrc_n2(nau8310, *srate_table, mclk, n2_sel);
> +			if (ratio !=3D NAU8310_MCLK_FS_RATIO_NUM &&
> +				(mclk_max < mclk || i > *n1_sel)) {

[Severity: Medium]
In nau8310_clock_config() in sound/soc/codecs/nau8310.c, n1_sel is
declared uninitialized on the stack and passed to nau8310_clksrc_choose().
When the initial direct mclk check does not match, *n1_sel is never
initialized before entering this loop, so evaluating i > *n1_sel when
mclk_max >=3D mclk reads an uninitialized stack value. Should *n1_sel be
initialized (e.g. to -1) before the loop?

[ ... ]

> +static int nau8310_set_tdm_slot(struct snd_soc_dai *dai, unsigned int tx=
_mask,
> +	unsigned int rx_mask, int slots, int slot_width)
> +{

[ ... ]

> +	for (i =3D 0; i < NAU8310_TDM_MAX_SLOTS; i++)
> +		if (tx_mask & BIT(i)) {
> +			ctrl_val |=3D nau8310_tx_slot_map[i];
> +			dev_dbg(dev, "NAU8310_ADC_%c_SEL_SLOT%d",
> +				(i % 2 =3D=3D 0) ? 'V' : 'I', i);
> +		}

[Severity: Medium]
In nau8310_set_tdm_slot() in sound/soc/codecs/nau8310.c,
nau8310_tx_slot_map[] contains binary-encoded slot values (0x4, 0x5, 0x6,
0x7 for even V slots and 0x4<<3, 0x5<<3, 0x6<<3, 0x7<<3 for odd I slots),
not one-hot bitmasks. If tx_mask has more than one even bit or more than
one odd bit set (for example, BIT(2) | BIT(4)), bitwise-ORing them
(0x5 | 0x6 =3D 0x7) corrupts the slot selection to slot 6. Should this
validate or select at most one even slot and one odd slot?

[ ... ]

> +static int nau8310_switch_internal_osc(struct snd_soc_component *cp)
> +{
> +	struct nau8310 *nau8310 =3D snd_soc_component_get_drvdata(cp);
> +	int ret;
> +
> +	/* For internal Ring OSC, the default fs apply to 48kHz */
> +	nau8310->fs =3D NAU8310_DEFAULT_SAMPLE_RATE;
> +	ret =3D nau8310_set_sysclk(cp, 0, 0,
> +		nau8310->fs * NAU8310_SYSCLK_MULT, SND_SOC_CLOCK_IN);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D nau8310_clock_config(nau8310);
> +	if (ret)
> +		return ret;
> +
> +	/* Switch clock source to OSC before MCLK off if DSP is enabled. */
> +	regmap_update_bits(nau8310->regmap, NAU8310_R04_ENA_CTRL,
> +		NAU8310_DSP_OSC_EN | NAU8310_DSP_SEL_OSC,
> +		NAU8310_DSP_OSC_EN | NAU8310_DSP_SEL_OSC);
> +
> +	return 0;
> +}

[ ... ]

> +static void nau8310_shutdown(struct snd_pcm_substream *substream,
> +	struct snd_soc_dai *dai)
> +{
> +	struct snd_soc_component *cp =3D dai->component;
> +	struct snd_soc_dapm_context *dapm =3D snd_soc_component_to_dapm(cp);
> +	int ret;
> +
> +	if (!nau8310_dsp_active(cp))
> +		return;
> +
> +	snd_soc_dapm_disable_pin(dapm, "Sense");
> +
> +	ret =3D nau8310_switch_internal_osc(cp);
> +	if (ret)
> +		return;
> +}

[Severity: Medium]
In sound/soc/codecs/nau8310.c, what happens in nau8310_shutdown() when
both playback and capture substreams are active and one of them closes?

Because nau8310_shutdown() does not check snd_soc_component_active(cp) (or
dai->active), closing one substream while the other is still running will
disable the "Sense" pin and call nau8310_switch_internal_osc(cp),
switching the clocking to the internal oscillator mid-stream.

Also, nau8310_switch_internal_osc() calls nau8310_set_sysclk() with
48000 * 256 (12.288 MHz), overwriting nau8310->mclk during probe, resume,
and shutdown. If a machine driver sets the sysclk frequency once at
initialization rather than on every hw_params, won't nau8310->mclk be
clobbered?

[ ... ]

> +static int nau8310_codec_probe(struct snd_soc_component *component)
> +{
> +	struct nau8310 *nau8310 =3D snd_soc_component_get_drvdata(component);
> +	struct snd_soc_dapm_context *dapm =3D snd_soc_component_to_dapm(compone=
nt);
> +	int ret =3D 0;
> +
> +	nau8310->dapm =3D dapm;
> +
> +	/* Loading DSP firmware */
> +	ret =3D nau8310_dsp_fw_load(nau8310);
> +	if (ret) {
> +		dev_err(nau8310->dev, "Loading DSP firmware failed(%d)", ret);
> +		goto err;
> +	}
> +
> +	ret =3D nau8310_dsp_setup_controls(component);
> +	if (ret) {
> +		dev_err(nau8310->dev, "DSP setup controls failed(%d)", ret);
> +		goto err;
> +	}
> +
> +err:
> +	return ret;
> +}

[ ... ]

> +static const struct snd_soc_component_driver soc_comp_dev_nau8310 =3D {
> +	.probe			=3D nau8310_codec_probe,
> +	.set_sysclk		=3D nau8310_set_sysclk,
> +	.suspend		=3D nau8310_suspend,
> +	.resume			=3D nau8310_resume,

[Severity: High]
In nau8310_codec_probe() in sound/soc/codecs/nau8310.c,
nau8310_dsp_fw_load() schedules nau8310->load_fw_work. If
nau8310_dsp_setup_controls() fails (or if card binding later fails or the
component is unbound from the card), load_fw_work is not cancelled because
the error path in nau8310_codec_probe() does not call
cancel_work_sync(&nau8310->load_fw_work) and soc_comp_dev_nau8310 has no
.remove callback.

Could nau8310_load_fw_work() continue running after component teardown or
race with a subsequent component re-probe?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261022084037.2599=
83-1-YLCHANG2@nuvoton.com?part=3D2
